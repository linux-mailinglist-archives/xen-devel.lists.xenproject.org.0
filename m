Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F51A4189C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 10:19:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894982.1303642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbi-0005Iw-Ts; Mon, 24 Feb 2025 09:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894982.1303642; Mon, 24 Feb 2025 09:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmUbi-0005En-M7; Mon, 24 Feb 2025 09:18:34 +0000
Received: by outflank-mailman (input) for mailman id 894982;
 Mon, 24 Feb 2025 09:18:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vb1z=VP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tmUbh-0003pb-0i
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 09:18:33 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [2a01:111:f403:260d::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5059ae58-f290-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 10:18:32 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8859.eurprd03.prod.outlook.com
 (2603:10a6:20b:56f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 24 Feb
 2025 09:18:26 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 09:18:26 +0000
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
X-Inumbo-ID: 5059ae58-f290-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLE7WwhonQoGgTC8F2vONGYnZ2qYX2hRoEoFIIVyHyT+/D1r7qycWr1blVUKlIOoXN44AlZoPZTYQ4F+3pM4rBhxvIXLq+l1hRLSaE1mbRfKYytiErKJHFnfwoPpBJnmM5QUcQtIqg/NyCZRZg7oWrE1B5WzcVJZomglJO1Ix3CxqgvSI+znMRnySy4vt8KZ113P+/TFwQ3UKigWqyiVGomJMUj3lr8n+DgCMqhOsuDvHbPecn6rGesTD4+0GXeICNNME3HT+dQn8+5/U5Y1G0AWS1GyKOANyDxLNSzQ3sN4RmYTq0rqDZCdOE4COdRjN+14kxpNR8yAKEiuNQvGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArXy3H4w82OCwUvmpq0NyU7K5YqtXJp08wLVcf0//QI=;
 b=Bglo5RvP+NJLDbAijYFS1kN26UZKeHfsUZtUyKnE1y3iSEnV3UaVPPWo3GOs2th04JSHwXAdaS5MJtG4uS3JsloNL1gCkZ2NWhuY5rMjTwgyvBh0jX1ZoWLjpzBb2y86iaPzUb/LV10moljpmj3/vcE6bq3ISJOvsvhItbZeLWVXqOLNzzJn+0s8uevUMsZzES9cl6QQMWCSWdcWzyW8xxTQbRjCCIfwh9OjD7g0Q3w9fCyK2SyYLHSm7ZJF5CHPuHv7oNurkbNY4WZCt94YNKE+FZFToHzN+ssmq6U+LBPmR3ZUx4lSHyTO/8VtGDjTzavg/MiArxF1l6h129XIFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArXy3H4w82OCwUvmpq0NyU7K5YqtXJp08wLVcf0//QI=;
 b=BseJo9CYO9fLje9obak6umL98CRbuBNiyA+R5fTjh6WxNFrlffwKgN3WmzbwK6Mq82+0SYCKNUZV8JmiyLH/zleJyUC5CqtUUSDYARYoPfZdL5n0q8AVrv9tieq6AVrHgcbAmArevVxHvVJjBlWQhmaphbgyPjY1eja69fRnvpUDcjv5b4K9XX2psv1rpy1TCCSZ8b6sOdpYrhIudbWv2JdrBpbtV4rfS+JJ4ETHcIogHapen1Sa3RLZogO+Qx4CkHbl6hSLEXWZgHG/9qmFpl2lxhJETz4UTnI5I8oAiwbOXmYvz/AAEI8IfP+dd1nfz8t9d1F62sJGzCAvfRaNAA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH 6/7] xen/arm: rcar4: add simple optimization to avoid ATU
 reprogramming
Thread-Topic: [PATCH 6/7] xen/arm: rcar4: add simple optimization to avoid ATU
 reprogramming
Thread-Index: AQHbhp0P6SKfNkaWykyl+zsyAHE9bw==
Date: Mon, 24 Feb 2025 09:18:26 +0000
Message-ID:
 <499ef211f469949e5fefd47b17e135b26325e0e5.1740382735.git.mykyta_poturai@epam.com>
References: <cover.1740382735.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1740382735.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8859:EE_
x-ms-office365-filtering-correlation-id: c336d425-a5e3-4e6f-084e-08dd54b431c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?GdcYRgYiWWgTcGd4xJPgS83ZHPT4oAEtgLlKEvVhDRIXMUDLCwYOSusAyr?=
 =?iso-8859-1?Q?cW0zAj/vRA+QFEnx6LKIpePhhqXdQuNfPTD7Z0EHaBLywFIKIBmG7r3H2/?=
 =?iso-8859-1?Q?QCsI99ehX984rgkkC7bWxLdAzEnf74J3S0fnbNQp9EfF1TLOmO6TGorwzc?=
 =?iso-8859-1?Q?9+qMeVZ2PLjfdnxCG7/9FwG6Gne9loYjgsFuTMxwd2/fMbTcXsMZI1850e?=
 =?iso-8859-1?Q?4xcvM0q9VNWrpY05daLD/vT/5PVFpA1FCMWMmY7HKukJTwS9o82R0dNQME?=
 =?iso-8859-1?Q?2nqIzJqfIVSrX+9NbVsRIRu5YwC9lnHVTbLzYgiZeVKGqHgnL1PGFOywBN?=
 =?iso-8859-1?Q?8BWUGjhiUTcaL2+KFdGsSmUxmTN00kiHDC0rRzUaK2pr7nS+efIvU1mzZK?=
 =?iso-8859-1?Q?5DoCImgvenJpL1plTHqUEKHCf4hci3An9tPB/95Gzwv4cM7DFKTRygUrNA?=
 =?iso-8859-1?Q?hadmSRTjAWvLL9oiHPH94qrAxEQ8mWjt4nGtkzBINXcYK7Xx4Pc/DyDK5b?=
 =?iso-8859-1?Q?GCXab48aK8KATvskijAtjWJ3Yl8Vsoxdp/OFx6wujnyc0ydNsYQvP7/ylA?=
 =?iso-8859-1?Q?vD0Sly4BeBZOfCyveacLjZn09dqnhSgTLHuQaS5Rm3GhjyIGc9pvvaFPbY?=
 =?iso-8859-1?Q?wb/0D9GzzgZTm54BacWi75eVGH+XtH0TvmQBEX6ip36nhR1EzaOw76Ey3b?=
 =?iso-8859-1?Q?st/brDKhcZ+fTpStBzXHquYUn1Fzlt12La8P4YXNRSO2eIhFC3Fb1WWkEB?=
 =?iso-8859-1?Q?qFesRjbUIQGycClxDeTssK066v/qwplpFl/Y3J0EO7qoUXhgYRyWlWcDpj?=
 =?iso-8859-1?Q?DirmjioLJSBMv4DDK4DwmwcwU0cu5brCgEPNNy47jpm/yDsXbFm6JmTQvO?=
 =?iso-8859-1?Q?rUiSP0wyfeNh0nLYAnFSRj6MY1zZhyPhkijZjJfk/Gaxx2Y1kB56LtLIus?=
 =?iso-8859-1?Q?YCTln3aXx7G3Cx0RCOT4iM1YZL32Ms8PDR8Z5ohP8eFWJS6cXQmODltqMY?=
 =?iso-8859-1?Q?FT4nV+v7SZCm2wDdg0FQZO0GhETzAtPIosASwDlsCCmh8wQEh/YnkntZkl?=
 =?iso-8859-1?Q?Nx6fhvCozWVDUYD3wkFTdq2/J1sOXw20XpTIRp6qnCvb4EyR1zdEqaysgW?=
 =?iso-8859-1?Q?wMlrdrb5vmkkKu0+LsdIMUDxgg8tSMzsAJ4MibisHd1h3JTlvbeWz1LIRq?=
 =?iso-8859-1?Q?sY5yqey2Ld8L1qnVvqGuL5ONTWsrVeOp0cCTSbkxBFUZWhSJCL0OJB+bf1?=
 =?iso-8859-1?Q?p8oaEm8IAym7duS95LBYCwp1hzSACsUbeQ6s+KT7DrzYXLAEh2RUqaL7jW?=
 =?iso-8859-1?Q?rhXmQ0d4bycoy3fI0041WgQ0by68JNxH+Bz4FCH/TR5I5OS1mJu+3B9zAe?=
 =?iso-8859-1?Q?vntBph4aZJPNbWrMCBck9FhEOv7xuN9+ilwaknPv+rxX8LMKc+sOYhbtsk?=
 =?iso-8859-1?Q?qrJV49etSuBhuhYF2/XDva/kkZcFenNg8y1GnOcxLbe1vO+TZqDl5Cx8Ep?=
 =?iso-8859-1?Q?1CRxiM0LXNG/pzK3r/YK+s?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sxVR42xMPy2vkDxWy/OpaNFZgXaywl1rwNzsJq2IQvBHosqCTx5yiE4GJe?=
 =?iso-8859-1?Q?Mbr2Pqx9Q7TOfDWbY/qqE5VDtIe+C1A+OP6ydMVS5A6B7Ry2LVnw5TstES?=
 =?iso-8859-1?Q?0aJKHTWCz2+iBd94jxRstR0dsj3cZATskDnTUyAH0E+T/o2+5ppJ15oKTL?=
 =?iso-8859-1?Q?e8wN1tLOsU1aFLmUXvrUT4kRtmcm8P16lqY+mYjLSdoFyU+SLsHjyZ78Np?=
 =?iso-8859-1?Q?IzgzlGMjEFMnGbQwjl/qNurSqf5NvcHYT7TBjY87zRI4xJO+Co0OZD/uUC?=
 =?iso-8859-1?Q?BNvkpG3JNOUKxHuG13B5e8xcICcxu28jjq5Gs/vHIAhOy6w3J0HA7jLsKO?=
 =?iso-8859-1?Q?lMa3+q84dfhwDeOKAbF0giSRe0zZsZwUIT5ji8SEcGl33ZVKif6N5NWhuN?=
 =?iso-8859-1?Q?lE0K4ypXoHDSWUzGykXsZ7wlOG6DSMOLFHDupXEbB++GnX+RrpFy5Msyu3?=
 =?iso-8859-1?Q?c++jc6mr1z1RpTuIrv+bOrLQPHF1nkCZ+udXoSRklON+XdAfrxaUWTB7S0?=
 =?iso-8859-1?Q?XpVgshZ83ardywURnETsU66WVVM5DXNEOPqHD93pSLrGJKXK9RT8vtrCnN?=
 =?iso-8859-1?Q?xOxv5py+dIKBOLbibrEaST8vs6S9/kvrCL+PVNrHl2eeaGsVsgH5T7rspP?=
 =?iso-8859-1?Q?8XE0ZuwsA+tJvwxM15iPWxH1OpnQNUc5/Kt/YFGBs1Co6Oofye4LW1y+x+?=
 =?iso-8859-1?Q?VlJ5xN6bIr7xnrT2eHOxERdohcBRM81EIUpPUHLx77NfYAT4fvspEIFyM4?=
 =?iso-8859-1?Q?qaOkths3OFJwqZnKZP31ucthrSDDYfjVqki6y0MzlGh5BnTrkXbbUm2D/N?=
 =?iso-8859-1?Q?dHa2JAQkr51U85fIa3Lg0jj3s8ELxvWzZ6jmeYwCE4qkKTbVL2Ix3z4Oic?=
 =?iso-8859-1?Q?RYE2IXksdxrplIZsP4+VU49iq69lt0WSo7q7hOpxU8QYtNs0ZZLXo8uNsr?=
 =?iso-8859-1?Q?onB4bvtT9hCzmCaTDXbQo55QDd6gdPrNQ0XGKNoOIUK+1Ek+KUtVZSGFUq?=
 =?iso-8859-1?Q?TcalKGl37HIUNNOVmBH5LKLYCER4H2O7zhHbe5F4WD+aPinTxjn9Hn74W9?=
 =?iso-8859-1?Q?FYZ+MMHz0MV9Srvo148mAPCGQItdZVqw/NPvwfQqXCfqhkez/t7eveHpAE?=
 =?iso-8859-1?Q?53hLD6tDFhUzdOrm37yYUedHYQ4AeTFPcvO4vjd+tg3YiZiybIAupbBiRM?=
 =?iso-8859-1?Q?RUojs/hM4F8/+NgPvS7nfW87vfpaZPQsFJXZ+NbxsWjLwvhlKie7le0K9t?=
 =?iso-8859-1?Q?gA5rGaXvesCuF9x5G0eBPDi621aByBTHyrxo5H3OX+7Hg5Fz4bLs4ZdkXL?=
 =?iso-8859-1?Q?NxAcijr4phTpieZQJB9ykFQcFYcwmTeRCPWwytbM+0ZcjiaNbN13SLgTX8?=
 =?iso-8859-1?Q?WQYKOjN/CWlZNwk51yHxdDqIBMc1rv3p8nvpNK7xwkiMrDiRn4DQByOqLO?=
 =?iso-8859-1?Q?Bsu1XLNxZPedTNoxVRsjwrhotWtWDJclnNeU3txGFzywdmYhvRvz/Tr1MQ?=
 =?iso-8859-1?Q?dkIFOb0mQv9Y/ZKl8XxZ1Bda74VDQEBvqv5Zk63u6BE9P8OGyZK1kujXPI?=
 =?iso-8859-1?Q?40dx1WDljs2b3fwnVCj/g9RPbYg5kDr8/XDXcTIaNJP8xq5y11hZdGdbj2?=
 =?iso-8859-1?Q?PZl6vg7KehlnsClJSjZAaU4Y5mJmBnu3XsIXicvXf2ch+vZeVZ73Jmgg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c336d425-a5e3-4e6f-084e-08dd54b431c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 09:18:26.1947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lEB9BFdBtHm6W5ktqzIae5+ZL3guFSoflT6bGNaDgm94IyWp1ZdF6SdRGXGaOMRO8O3/U5rRnnI0OAaQFx9S3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8859

From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

There are high chances that there will be a number of a consecutive
accesses to configuration space of one device. To speed things up,
we can program ATU only during first access.

This is mostly beneficial taking into account the previous patch that
adds 1ms delay after ATU reprogramming.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/pci/pci-host-rcar4.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-=
rcar4.c
index 3b97bf138a..3e3e073b09 100644
--- a/xen/arch/arm/pci/pci-host-rcar4.c
+++ b/xen/arch/arm/pci/pci-host-rcar4.c
@@ -367,6 +367,14 @@ static void dw_pcie_prog_outbound_atu(struct pci_host_=
bridge *pci, int index,
                                       int type, uint64_t cpu_addr,
                                       uint64_t pci_addr, uint64_t size)
 {
+    static uint64_t prev_addr =3D ~0;
+
+    /* Simple optimization to not-program ATU for every transaction */
+    if (prev_addr =3D=3D pci_addr)
+        return;
+
+    prev_addr =3D pci_addr;
+
     __dw_pcie_prog_outbound_atu(pci, 0, index, type,
                                 cpu_addr, pci_addr, size);
 }
--=20
2.34.1

