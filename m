Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79813B0D86F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 13:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052288.1420970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNc-0004YI-G9; Tue, 22 Jul 2025 11:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052288.1420970; Tue, 22 Jul 2025 11:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNc-0004VA-AP; Tue, 22 Jul 2025 11:41:56 +0000
Received: by outflank-mailman (input) for mailman id 1052288;
 Tue, 22 Jul 2025 11:41:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibko=2D=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ueBNa-0004HB-IM
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 11:41:54 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da903ebf-66f0-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 13:41:49 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI2PR03MB10809.eurprd03.prod.outlook.com (2603:10a6:800:272::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 11:41:42 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8943.025; Tue, 22 Jul 2025
 11:41:42 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: da903ebf-66f0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glhLD7UDE/lJ6KcOIyBRLaMJPVxqM5dHn0TZSoOAYNwiAnlBCpDI08C6hkxbWjChFTUtTP7PqH37tVc1NJBuj9JkX5OiDUg3myPRP5Nxb3LPeXRSMiSrxHgnvfTJXRa1WSAhAnmqwc4kePZpdF+zKEPSCMXus8lcSiQVNeT2SuKY7mkYZIQ/O38EGZOmwChEWYaD+FNHLBHVPCnF7vQOIqjiZI8dXuvr/zHNLBnheFm7208GKE54iLDkhED6R1hCGchVlJfn28sGnHsve9G0HSsZ5QPNgTFGdJDs2ba0BrKwXu2E01TU/a7QP+tgsim5vyjeWAmQPvcuuK0A8gelyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHNLmh6kSbLX3vTRCQeitKw2HKkvmYsNdH8fBqw47cU=;
 b=FhTZrxC3l08qK0eKTg0dcPHzyROwhI3TezIkruXacbF2UKJ1XhmXxf4VeXJWLzT0JiGdq25najidjDxHdIalybeeYAJnHViYfKzZKpB99/dzS9gmqwYAEwYjtPBDAhCuBh1omPU93NBrTrMRFvTv8sBiXuxy/tWtGze46oH2CR2XzKkVwFToA1jFh34gZo9UuGQGFI1EOg8xHp3qZuSup+C83x2cmgEGcjrbBen5MhgPuPEJqvZHdWbfRCe9TTK6xOuEz5bkk5+uhvTtSRVyB/o8AeqqAjfAkXPx5nSHBlADS65ff6EUOYGRrKAwBQ3IScX0kSrZJM/1Fosz8pjfIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHNLmh6kSbLX3vTRCQeitKw2HKkvmYsNdH8fBqw47cU=;
 b=BxbYw0DPlc0CR7MtKK2y7FtPVKGHPne1gFX2T00b2j1s6HNh+2usp+0y7jAWwiiJRn/Ryu/wa+TvLZr/9PB7m2spwQ9VkDDx/w20v8nx1kqx7ZxCN9ctL6+3Ita5L57jgbpCpz9a5JZD/M3gUszAOasMMCE8NpnQiKkcq4Z+ZOhKNurBQ9B5YOBBGX2DwqUEAyKhhmQWGaWeJMXTmuGUnRoBA+KccCYa3YVwatPIDr5g67INDiTIGwmQ6HtOdyGaDB6vYVl3KP6I/Y6QLTakH8syvTo/Snk/kAYeIwbktQIUjoyNbLbNIve0xxSpwIn9vksbmeoKoRrzi+7sMm+7Pw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [RFC PATCH v5 05/10] drivers: iommu: change error code when iommu is
 disabled
Thread-Topic: [RFC PATCH v5 05/10] drivers: iommu: change error code when
 iommu is disabled
Thread-Index: AQHb+v2WASGXgn5qjE+iEIhr6yQoow==
Date: Tue, 22 Jul 2025 11:41:40 +0000
Message-ID:
 <bc9cb7eab522e6050996cba7341f36d07aff22c6.1753184487.git.oleksii_moisieiev@epam.com>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1753184487.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI2PR03MB10809:EE_
x-ms-office365-filtering-correlation-id: 7ede76ef-f979-4df0-342c-08ddc914ba61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4XR+3+hVsKojf56G8k8JL+HO4QYIRzmyeSSSh6j6zNwgrrJ0DlQs98lOkW?=
 =?iso-8859-1?Q?Hm8Ub6xW8GCvOMVjxDVSHvPTIENI3N8a8jHch4oUe2RotpmXtwDEAwfku/?=
 =?iso-8859-1?Q?C5hc+qfTqPRn3dgtlQyUWi8M3WUM+qmJDdfYmHOvgovgcecJKxpxMl+OIm?=
 =?iso-8859-1?Q?hH5D5lmy/33Uq++0c2YKN4VXkT3XK0GHptRLtV8SsrryQO3dElaMrIzr3P?=
 =?iso-8859-1?Q?vBxKKaaRisZY1lwRda6yCenr9w+9hOpaInRpG3VTXhT7yE/79Iusyo7KHu?=
 =?iso-8859-1?Q?8oMAIsY3ry2Te07aDbPGyS3Atp5kNVArWA0/wwt1lHaKn0l9tTcTzbKSEe?=
 =?iso-8859-1?Q?FGo/q3w2JLp+QqU9uz82JNUUgJRaHEaYfPKWBz1LrDPsH5FFle/5CaifNS?=
 =?iso-8859-1?Q?AYq2rF4EKZ96jmpzbU8BmsonU1TaYKBL4p8mgRUvvuFeZgMBAJ8W+teta+?=
 =?iso-8859-1?Q?h9o2CWwnHY9A918eKTRgayG2LAhr52pGo9fbHUcrpxRBuILKDOdZx2gIUb?=
 =?iso-8859-1?Q?KguPAm6NFtHOEQQYU8U6e1FIyobFu6KJXq5uhK2ewIeOYXVX4D0DQqzzsG?=
 =?iso-8859-1?Q?VyMd4hTUrWS+XiimFT0yNWUWaIdnt46pCfcpUsX0i6aCA6TcMZUk7zlOzQ?=
 =?iso-8859-1?Q?/qRwct63rEu7UDYKilW5bP9AhJrNk4iGa2NnZCU7MALQZ0TLHIMIAjq1pY?=
 =?iso-8859-1?Q?WUBpuRYmO8dywA/th1YmUMIcjr0pi1G3KgGeUrJgUo4Methb4i/cpM9KF8?=
 =?iso-8859-1?Q?0f9DwxwFBdKf72b+KCS8qtyC/elmcDRPL6EaJ/z+q02oX8BrDr+eDaIgXs?=
 =?iso-8859-1?Q?ASgV7DqPP1r+CtSToTAHFC5XO1b/tb030bWPFrJiJCeSfUEYaJnovOeflX?=
 =?iso-8859-1?Q?5fv+eFaPRUFFXfVq2FOF7blXMQsBBuoFxubENZkM4VkoKt48KdmKgwcKjk?=
 =?iso-8859-1?Q?CKh6lzUrONF2By0TCX15JLYV8aYzIvPQnmysuSQkGprxzklmZrELRkLBIb?=
 =?iso-8859-1?Q?I1LCTu0eF4X4FdS+K5BhUFkGkP4fP1ehu1rXy2goaom3aWRqyf6vyy6qKy?=
 =?iso-8859-1?Q?KJ2wVMHwMmX1D81y7DwUZLXOA3NvUorxsZ4XoNdninHWmhobcNjYdKUKmA?=
 =?iso-8859-1?Q?H06fIicHo02DraX3O10AS+cc9l58csNcmCzY3w34SD3o1S3QCepi03Eej5?=
 =?iso-8859-1?Q?bpqkR9dBU39Q/7EGOcOnk2gJ7is/zkFcRsKcC+SXzCGcVSrrZR4wFLa6N+?=
 =?iso-8859-1?Q?qvH+pE8LzUvfzj1FyWBuysekUiuUDOQDKG9Gzdj4g6DeOrvYJDjjbbuZBY?=
 =?iso-8859-1?Q?pHZCHi5gtSg+dfjn+oWEZdioFjXICQ/1JaY6BY7zr1BeZ7AS1R8sZGiCwL?=
 =?iso-8859-1?Q?6t+xczSAmWcQ7p/SLCiAfgq84FRy44r4U/No6+J3PLc8jmcoGANVF/qQK0?=
 =?iso-8859-1?Q?bZNGbgehiK+AbHDdR90zeEiqndGwjUTeeAAtQvCFo/8HBQsMsVtJ0YtK9t?=
 =?iso-8859-1?Q?OCDKF61Ux9tSIow8ehQjOzBrKpDsz4Apeu87YFEdkX/XDoncq+2qrKPJ5N?=
 =?iso-8859-1?Q?r5bTMMY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Te706rPPCizjuizri2hRzcXTxUKcpWpZJ1EGFM4fn/sXTYMj2zz0zW7vnf?=
 =?iso-8859-1?Q?RumAza9Lu2CbJxeiwTRPjmrEAK4kNDCSskTPPHQgRsbgW8Wb85+xXCJDbM?=
 =?iso-8859-1?Q?oPxn0SmYDQos7VnrAh4ocgjjKZwWVpDvTFH6LliVXqTvZuT/s6e1kd5tZH?=
 =?iso-8859-1?Q?b/yNXTDpN2EED8I3SWAyabGC4bxAi+qUcWQNyEOoS2MH28Tpkwd3WsSBI9?=
 =?iso-8859-1?Q?8xj+azYDrwhWdtrC3WUbbnQ97G7cHKbxodT2PRIkwJjI2LoNqGxWu7uckX?=
 =?iso-8859-1?Q?ddwthX+CWLfoegft5tccq+nScOPiUouuTsRq6ziw25kmyd1bQZU6ToXSMG?=
 =?iso-8859-1?Q?9sCc7ZkbsA5p/Sy/TGQOlS6f6S9LhYwPz1l+jFVcFlV6jOPXNmQjIlCDr4?=
 =?iso-8859-1?Q?8a+ccRbVY2U5lmGmTIQA6EMv5c3yiBGE9MGgV2CSwLFa1LkW9/pDk+jCb0?=
 =?iso-8859-1?Q?pgxFW/J4OPUzE8E2ELHp/Qf6XbnlXAhVv+266Cy1/6t7aaQwaa3FQWiTcd?=
 =?iso-8859-1?Q?ruVumBDkayAQunj+v+Tn10mkHFBbyIgnWBxFkRNvwVQEAldTVD2YkL070A?=
 =?iso-8859-1?Q?JBBnqbaHWmxAoPbxYk99gm2eeqCY54qRmkkvNjwRVR6VNn8OyH5DM8rY2B?=
 =?iso-8859-1?Q?oMe4aHeLk8K5up2snUAiwNXh0QXzGVxtP6fqSFvVS1+aUsyUrx4+T4nFjQ?=
 =?iso-8859-1?Q?peYbH25h0RUaV9FDuORyNOcLVmDy2fkW1qLYDG69bPRnsRuWNB66O1qmnE?=
 =?iso-8859-1?Q?pgUNVDCf/g7znxCURclucTwdz4Y76L+e+H9rr3y+eu5Olzugo7hJlyghmM?=
 =?iso-8859-1?Q?3LBaK6Jt7uYfI85Lr+YoM1ynJyOGuVIk37HgwjJevye6vzSzdgnCsmxjUt?=
 =?iso-8859-1?Q?Z2aKf90vPVudTKKvRKwnPM4LyAwmbt4PQq2phHkjgHY3If6QRtnBR1b1B2?=
 =?iso-8859-1?Q?+7fy7HFqKg2Lfvnwhw73YOIGxqDh8YOeLJ1orlu6hjtQJENPZrrtuASYu8?=
 =?iso-8859-1?Q?N/XfOWC+gtb5jiDYhg6/MyjAdjs0COx4l2CEbP4Leg0NF64ArwdaPUNYLj?=
 =?iso-8859-1?Q?k/hRiWMuQ3UF+nR5e1tWEsFDKqZ5WcELmp/aq4MuGL77zj2BJs/clAhEm8?=
 =?iso-8859-1?Q?5pZNUlFFATmuMl9oEZgn77frIl8r94zZA2yEmX2jB1pDFmX1rxTOX8yChd?=
 =?iso-8859-1?Q?4lXvWTFH5VxhwB/cXSvvLyCEGkG7UUeFuteQcQmQ7U/3vijF3yIP8zpkPi?=
 =?iso-8859-1?Q?PX1EflHE3TAHGIWZl6OSOwNlibHBF+TX/pEFWLQulvWga4lOMhB0UOnZAE?=
 =?iso-8859-1?Q?29td3xGgjCdLmhlVEYSVO2Lk3oLFYt9HPPm3pkYYoU2K+fGhYGBCCvHO5m?=
 =?iso-8859-1?Q?ATxv9kXMrvdh98ZGk+1x62D37b8VqreznWTjdLjJ9jVZ+2dC5LsCPKkZ6P?=
 =?iso-8859-1?Q?IoFd8dW2fEkBZLE4A04Wky5tUKJJFdhfv+RxUkHbrW6GPEOLzShIxLDmy9?=
 =?iso-8859-1?Q?KRLFJe2yZMNqCkNjKAe7CUUsNRehMdxp5LkHS7yhcWwex2tp/lE3Qe23dC?=
 =?iso-8859-1?Q?udnLHhhKaE9sEmc8FTuiTuGwuTdXY2gJfzwoJ9VnwjQ6iXsUXN+0kn0aky?=
 =?iso-8859-1?Q?b8go7otgwx0TmK3G5G3ywcQOrP7k5wCC65i3MbWEtS29ycITbMTveT+w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ede76ef-f979-4df0-342c-08ddc914ba61
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 11:41:40.1155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n5bIDn5hW6YQ33L9tca47MJ9OBoITy+t3ytrpq0m/Z2UoUixdTxxuyNRcGSRBOOZdkDSBV+/xZl/YUuDB4qJvaiAM0fTTBtH8uiGpHu05Ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10809

Change -ENOPNOTSUPP error code to -ENXIO when iommu is disabled during
iommu_do_domctl call. As was discussed in [1]

[0]: https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2506171701190.17=
80597@ubuntu-linux-20-04-desktop/

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v5:
- set error code to -ENXIO when iommu is disabled

 xen/drivers/passthrough/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iomm=
u.c
index 16aad86973..075bbd1718 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -632,7 +632,7 @@ int iommu_do_domctl(
     int ret =3D -ENODEV;
=20
     if ( !(d ? is_iommu_enabled(d) : iommu_enabled) )
-        return -EOPNOTSUPP;
+        return -ENXIO;
=20
 #ifdef CONFIG_HAS_PCI
     ret =3D iommu_do_pci_domctl(domctl, d, u_domctl);
--=20
2.34.1

