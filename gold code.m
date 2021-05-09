%%
numR = 10;
numC = 1023; 
sr1 = ones(1,numR);
sr1 = sr1'
sr2 = ones(1,numR);
sr2 = sr2'
g1 = 1;
g2 = 1;
ca_38 = []; 
ca_26 = [];
x = sr1(10);
y = sr1(10,1);

for i = 1:numC
temp = xor(sr1(3,1),sr1(10,1));
g1 = sr1(10,1);
sr1 = circshift(sr1,1);
sr1(1,1) = temp;


temp1 = xor(sr2(9,1),sr2(10,1));
temp2 = xor(temp1,sr2(8,1));
temp3 = xor(temp2,sr2(6,1));
temp4 = xor(temp3,sr2(3,1));
temp = xor(temp4,sr2(2,1)); 
g2 = xor(sr2(3,1),sr2(8,1));
sr2 = circshift(sr2, 1);
sr2(1,1) = temp;
ca_38 = [ca_38 xor(g1,g2)];
end

%%
ca_38 = ca_38';
ca_38Bi = 2*ca_38 - 1;
for shift=0:1022
    autocorrelation_1(shift+1) = ca_38Bi'*circshift(ca_38Bi,[shift,0]);     
end
shift_1=0:1:1022;
figure
stem(shift_1,autocorrelation_1)
grid on
title('(3,8) Autocorrelation');
xlabel('Lags','linewidth',2)
ylabel('Autocorrelation','linewidth',2)

%%
figure;
Rxx=autom(ca_38Bi);
stem(Rxx);
title('(3,8) Autocorrelation');
xlabel('Lags','linewidth',2)
ylabel('Autocorrelation','linewidth',2)

%%
[c1,lags1] = xcorr(ca_38Bi);
stem(lags1,c1);
title('(3,8) Autocorrelation');
xlabel('Lags','linewidth',2)
ylabel('Autocorrelation','linewidth',2)

%%
figure;
autocorr(ca_38Bi, 1000)


%%
sr1 = ones(1,numR);
sr1 = sr1'
sr2 = ones(1,numR);
sr2 = sr2'
for i = 1:numC
temp = xor(sr1(3,1),sr1(10,1));
g1 = sr1(10,1);
sr1 = circshift(sr1,1);
sr1(1,1) = temp;


temp1 = xor(sr2(9,1),sr2(10,1));
temp2 = xor(temp1,sr2(8,1));
temp3 = xor(temp2,sr2(6,1));
temp4 = xor(temp3,sr2(3,1));
temp = xor(temp4,sr2(2,1)); 
g2 = xor(sr2(2,1),sr2(6,1));
sr2 = circshift(sr2,1);
sr2(1,1) = temp;
ca_26 = [ca_26 xor(g1,g2)];
end

%%
ca_26 = ca_26';
ca_26Bi = 2*ca_26 - 1;
for shift=0:1022
    autocorrelation_2(shift+1) = ca_26Bi'*circshift(ca_26Bi,[shift,0]);     
end
shift_2=0:1:1022;
figure
stem(shift_2,autocorrelation_2)
grid on
title('(2,6) Autocorrelation');
xlabel('Lags','linewidth',2)
ylabel('Autocorrelation','linewidth',2)

%%
figure;
Rxx=autom(ca_26Bi);
stem(Rxx);
title('(3,8) Autocorrelation');
xlabel('Lags','linewidth',2)
ylabel('Autocorrelation','linewidth',2)

%%
[c1,lags1] = xcorr(ca_26Bi);
stem(lags1,c1);
title('(3,8) Autocorrelation');
xlabel('Lags','linewidth',2)
ylabel('Autocorrelation','linewidth',2)

%%
figure;
autocorr(ca_26Bi, 1000)


%%
for shift=0:1022
    crosscorrelation(shift+1) = ca_26Bi'*circshift(ca_38Bi,[shift,0]);     
end

shift_3=0:1:1022;
figure
stem(shift_3,crosscorrelation)
grid on
title('(3,8) Vs (2,6) Cross-correlation')
xlabel('Lags','linewidth',2)
ylabel('Cross-correlation','linewidth',2)
%%
figure;
[c3,lags3] = xcorr(ca_38Bi,ca_26Bi);
stem(lags3,c3);
title('(3,8) Vs (2,6) Cross-correlation')
xlabel('Lags','linewidth',2)
ylabel('Cross-correlation','linewidth',2)