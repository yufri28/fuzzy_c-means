data = load('penggunaBBM.dat');% load data
x = size(data, 1);% ambil ukuran data
n = 3;% jumlah cluster
options = [2 100 0.01 0]; % pangkat (w) = 2, maxIter = 100, min Error = 0.01 dan menampilkan info ketika iterasi
[centers, U, objFunc] = fcm(data, n, options);%[pusat cluster, matriks partisi U, objectif function]
maxU = max(U);%mengambil nilai maximum dari matrik partisi U

% ambil nilai max dari matriks partisi U untuk dimasukan ke dalam
% clusternya
clus_ke1 = find(U(1, :) == maxU);% cluster ke 1
clus_ke2 = find(U(2, :) == maxU);% cluster ke 2
clus_ke3 = find(U(3, :) == maxU);% cluster ke 3

%simpan hasil ke dalam array
hasil = [clus_ke1, clus_ke2, clus_ke3];

%untuk menampilkan grafik
plot(data(clus_ke1 ,1),data(clus_ke1 ,2), 'ob')
hold on
plot(data(clus_ke2,1), data(clus_ke2,2), 'or')
plot(centers(1,1), centers(1,2), 'xb', 'MarkerSize', 15, 'LineWidth', 3)
plot(centers(2,1), centers(2,2), 'xr', 'MarkerSize', 15, 'LineWidth', 3)
hold off
