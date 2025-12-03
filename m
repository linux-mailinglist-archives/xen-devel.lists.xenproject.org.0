Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD01DCA1332
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 19:58:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177080.1501501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQs3a-0007KD-Es; Wed, 03 Dec 2025 18:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177080.1501501; Wed, 03 Dec 2025 18:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQs3a-0007IB-B9; Wed, 03 Dec 2025 18:58:30 +0000
Received: by outflank-mailman (input) for mailman id 1177080;
 Wed, 03 Dec 2025 18:58:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WC6h=6J=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1vQs3Z-0007Hi-Ek
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 18:58:29 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09f0caf9-d07a-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 19:58:22 +0100 (CET)
Received: from DB7PR03MB3577.eurprd03.prod.outlook.com (2603:10a6:5:3::28) by
 GV2PR03MB9353.eurprd03.prod.outlook.com (2603:10a6:150:d3::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Wed, 3 Dec 2025 18:58:19 +0000
Received: from DB7PR03MB3577.eurprd03.prod.outlook.com
 ([fe80::49f8:7615:b631:1a66]) by DB7PR03MB3577.eurprd03.prod.outlook.com
 ([fe80::49f8:7615:b631:1a66%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 18:58:19 +0000
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
X-Inumbo-ID: 09f0caf9-d07a-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOf1K2tpUg7qRQ/AqcePv24loHKDknrIZjAn5E/ulgbQhAul9WikdA3UPUMKo5BMGDCnWNMgS08ZxFFRRBUGSY2yDeu/3fpC05DzyPUnZmFTysU2R+lrMzeTFzv8Zkf8M4jUH3grhmA5vqIcX0/HLVts4QJl6Q2N0nDEjou6WpJ/78WaXo4hAl2JsVapGUgNpR+PJ9PPWgWbZQnoVdbVp8T10KC7Ny2NWMx+cDSgFNH4zRCAgpvMe3MGf9DDb0WclvhD+QDA2ZWlrwh0DH66YruLSsTUcAFAytLM0SWHfFVpSNpufbjra5S+Cg7jfreWpjEq6FHpFMOvn61qT1JqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+AKNCSVBWI3D7Q1DukJIYv1PltJZB/5iZ39snSEJi0=;
 b=yCCtdfC3KTvid+3J6v0U3v+ZAAEP18Jh9x8u0605u7T39NAoL62ZmspJvWEym0oGcaeXqlYPvuMpMjeU6XELQAIWQZny83RVNpuVLtnBsa4DvFBBPDicz6LsKfQ3/9N4DZ19DOZE6suXgaklU+hICO/B6ME7KN3pwOh0sWazOtqNBIy35f6a5n4ZrliPkhGKT/82r7KYZ9rTD8jc68eTBIaI7snCO3MljizghmeCvT2CC+zBr4Tf/8c4j4qDTo040+TET4XlggQrrpdwKhfEj/2ThVaUMfUUlXHFYBpdQEk1bQgFfi420Yyk3RUOR73NnrMdLNDga5iS8a83qw+RMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+AKNCSVBWI3D7Q1DukJIYv1PltJZB/5iZ39snSEJi0=;
 b=JuO77R1ocVC1lyNz4F75dk5wYzdDIHgydplqWvdztQEoaLiTYLsYkOv82Ixd0VpbrN51O6ifvLZpR6DOymeWeOiZQZ/qt7yvsNUzGObTvacQSKfkPCPsAqhB28+b52h5sFWepr8l2r7nBu5Z78HiUUISKi7XARMmnGSGFHF4xXpJk7jCaV/TZ9ZmpyxIpsmgCTnf9A4EkmNS8lz+DTGXLNDYHeSDdJpKoUbqyV2OLDM6wJNwR/JyCmIvRaRrGmxtZYgzTSKtcy/KlJdbObjtvg0PcMDDGL8rJeOnjKg4KWhu4PN60e+LPy51IMHwSMsbTbcPPCbTG5AwhMUstyUsEQ==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>
Subject: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Topic: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Thread-Index: AQHcZIbKZWHMCLfhnk2g+3dibmJCCQ==
Date: Wed, 3 Dec 2025 18:58:19 +0000
Message-ID: <20251203185817.3722903-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB3577:EE_|GV2PR03MB9353:EE_
x-ms-office365-filtering-correlation-id: 03e731b1-eb34-48b1-3850-08de329dec9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?AEiUNSmw5NOrfH5uT3D2xLEXpj3odIfJ7tSHDxR8Y1Jn2QDYLxZ5DIZEkZ?=
 =?iso-8859-1?Q?WT/d3DkCFqwGo93P+wcumhbS780HNTzDk7EjvW9ZX6Hsurh6dOIiTc44Fq?=
 =?iso-8859-1?Q?CewMvTeLZ9kQkpbzA3O78daID6EG5zujOOzVd/B2xP7Ndj65TMuRA2Gtbg?=
 =?iso-8859-1?Q?onkxMzhJ2t7wi/Ompw1Gmi+MfxkgAZC+fzwwsC38Px4y5TieK8Qr9NKfus?=
 =?iso-8859-1?Q?Iztxprwy83jnykM/O2cFUh3+Dwkkfr3EblJUzEx0UEOXhAu6XUmnNiC5c4?=
 =?iso-8859-1?Q?malQa95BQgiP2pIHiJMZaC7XjJGDCwwU3CYA+Zi6czLqubaIgX895dsZd5?=
 =?iso-8859-1?Q?zTEUYyayeQOqCQSBRhtHNxcVFlAO7tQ5r9e6qO0JRNFPIsbRxf+eGlQXDE?=
 =?iso-8859-1?Q?7dDBdvrDqnOZlaMjuNq5nR3gKM46o4BM9b3oYnHpIcB/GMyHHLGSLrWapi?=
 =?iso-8859-1?Q?sFsOJJdarFxjun6uPzAcR/by/e0XmJHwgSBkG/rGvCh9uSvPTl5X/VzHR7?=
 =?iso-8859-1?Q?PQwsRiZQkvRNO6Jyy5ZtFCmijr29NVvUzs9kgirsKkubBkfG3LsJVjBM2D?=
 =?iso-8859-1?Q?mGfa6p3YgtE4zv59Og0RQvFhM8QEQhSJV7B8Wk2gs8avhsnkhuftiKxa8w?=
 =?iso-8859-1?Q?tk71Q4J1GMCCubN6+ey2Ciq9cGqI7an7xdIs/EgShwboUtL2oFmeOtutIi?=
 =?iso-8859-1?Q?Pm7q8t2ZQBB+PkFK9aW+1hyzEFztSiPUm82hEnRRCrpXjhlhaAnaJ9EztI?=
 =?iso-8859-1?Q?rnfFC4FQKa8Su9yFU7S0xrzw/GyCnzE623UZNrdWh3hKo1oQ3tKUj0gTa7?=
 =?iso-8859-1?Q?/dwOOqXaQ1KzK0ZyepUnssxL3LmUL4SBYVynouym91C9LC9+vDpRvjy9Xo?=
 =?iso-8859-1?Q?v5w+9D8qbKrCJ5nIbVTh5JCA2syl4jGrqf6xVo1n7rcowbqM4BliulObuF?=
 =?iso-8859-1?Q?yomwRTEU19buuMgS6FuOPVZjl6+9/TnO5L+UgdsQhr0l0xdHY8gOTmEN8O?=
 =?iso-8859-1?Q?uBfy+KplAhh/wnHyAcb6ivbpcXgER+bmOj+hsLLzyXXfD0uybxIKuIJlZV?=
 =?iso-8859-1?Q?MHFMvQWntMHk8LmslZ/3plHqdJYT7ujL/ZOCTnW/H0SSeC13MuGC5U7B0F?=
 =?iso-8859-1?Q?VNNDgfts4d7ueHse/ltSM819tlpDsSe5UsBmLP6xcobGKitg5pesC5mBhX?=
 =?iso-8859-1?Q?6S1cvRsoMc9IEXzLrhnFfHUcqNKH1BBf74eqOMFC3c7gJlg7YNA9pnBtZA?=
 =?iso-8859-1?Q?WLgt7EpoZbhE+MRYb/v9nbZbAmCT6dm5B4jpdGnyYhMnYgyYnLJj3jl8D3?=
 =?iso-8859-1?Q?VjhHziVpSYGremIue5zJXKX9+P9RpqO5Vmx27QkoouSYQ1mluB49z4cbTK?=
 =?iso-8859-1?Q?UcgPFHJA29puF1MSc/2r4xFOJJePrM5hb3i2jhXRqhrnWegJkw++Zkon/u?=
 =?iso-8859-1?Q?V27rSI2x4rNQQQ/5qMi814eQRMIF2xpAeRm0MD+VBxhKuhFzGzf6lHdvcM?=
 =?iso-8859-1?Q?SVSB21692G9c/XtseSHYcB/s4c89i3Vti0BU8siY9odw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB3577.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?RKy3mmS/chYFQ6TkcbIaO4OQlyaw31PKMUQrF6/DvB0jxO2LXcWCGL2piY?=
 =?iso-8859-1?Q?L9GVThjxfv9I9vhbSqOtCen9YRV/gtzLDFboXcGFGo87RectQCUxRJGeIY?=
 =?iso-8859-1?Q?isT6xFoqkkyYfIIS0KS9xPJpC6Tw714IdODHipOFWxad+R63NsV+8zAUuz?=
 =?iso-8859-1?Q?oUWdhYx6uSITGp5PSlkB36U4U8z0TrQdIOkIFeTZpLu5sBEyjxXTMD9m56?=
 =?iso-8859-1?Q?KQjdITkUsOjp/MZPonRgdlenkN4WimrjTeOxebyTyLE4rGqRas57jw8O2v?=
 =?iso-8859-1?Q?qZwH0c1IA/q3ehapFcKtOM97pFG0wn/6vlmNpWD5nxAAplI6J0OLHktQtq?=
 =?iso-8859-1?Q?B1FOKI7SP48CYoACFKDMijcaBxgMAmYwC/09Gl4m4KGoOE6kAkS1EPXoO2?=
 =?iso-8859-1?Q?wa25Jr8ND9iEhVmw5Ovch7tcKR2+Bpt/0L4V404W0s90fXv02SD+0hbDQT?=
 =?iso-8859-1?Q?nXf/IaCBK2r05zTBsgnJ0Qzio2WI8IZtYT9jpJuXNzilKSIL64yKj3m8tF?=
 =?iso-8859-1?Q?vCLBIfD/kU3BtEg5jp0MRlGYeVSUATtT20Njp0zKJ77Xyz29STxoXA8YGR?=
 =?iso-8859-1?Q?efm5MuaztkCs3JhztgqY0f0OOmjIR8PlwnRbRvPWxiZC+C1Y23K2TzHchl?=
 =?iso-8859-1?Q?8IImzrFikAycex/vBabq+hrEl5ihBuamhI74VsGdK0V/gRQl7XmE4syIrN?=
 =?iso-8859-1?Q?rV0u9fLAvKd1qUBNc6iskyuLK4vOfsIeixypA6supAy79ZyG+08C5L/bi1?=
 =?iso-8859-1?Q?MEEJ9pIBZDLl7FTMRb5VLi36QUwPmqT26o0360+zSzSyVWuZRQSCUSAQTv?=
 =?iso-8859-1?Q?B8zOb2zDARsZzLlZ2FJJUrf+E7F5fAATL/ewhZeK5Un6uiJMod4KAjZYLG?=
 =?iso-8859-1?Q?4Rtmo+wuXrxK1m7ZaJN7EtHjXOFpMUf9+fgExz723iFaxEMvvpUT8wRNP4?=
 =?iso-8859-1?Q?SImG5P5SQ6t8t6Dv12NFoEXa4Q8lpOEk1QaXdke1bzT4eBncuSD/odW/IH?=
 =?iso-8859-1?Q?nHLTZ4XhCPOcT1rWz9+HRl6fh4cmqjrDzZ6zVUmYF9g8DvZ9TnG0f2nMio?=
 =?iso-8859-1?Q?/ME11muwaB6gUS5Y8yo/4+tm6s3I+RQn5NXo5uw6dhP4Feu0b8dcGtehFP?=
 =?iso-8859-1?Q?gWkN/10Tq6aD3cWAi2DTougKir7N9+CXfBPVu9Vwq51KFhxbYGahnSWXdF?=
 =?iso-8859-1?Q?q2Uig+gflCNv2NLgmG0FUaWnjzo40Q6pEuVMUk84o7kxKhwrjy1ur+MFIH?=
 =?iso-8859-1?Q?B5yWtKwTRk8KEpCshSMQPlujq1QTBzSXkUoBAk6EQmlsoQ+3N/xl/zJOEf?=
 =?iso-8859-1?Q?fKdUdv8bm4AZCD9q7aoWSQRPxes0VuiybUeFlKASiw40opqOPEwtYwXXoV?=
 =?iso-8859-1?Q?/Ir6Wmb6RsD8GJvueHiTVw7s41RNFkPquvspvMLtKTixF8Wg99zsDz1t4d?=
 =?iso-8859-1?Q?eQdCiXjLRC5ovDATQ9EZldJhoc79mVvXqxZMaV5YHZWDQO17gJYWu0uyy0?=
 =?iso-8859-1?Q?EG3SpT8cwh4sY6KA0Ph/uwkRVhXwb1sSBnz8FSPJTFE0S5eS0jbZSHTG7g?=
 =?iso-8859-1?Q?zLXorBpAvKs9/knOsrFU1UHH5qgjY3+BFtO1yJjxzcMp2+EWEUsxW2OdAw?=
 =?iso-8859-1?Q?dJwd4VAevyRgYS7DMvDLll5kpLAIMqieiH0QTQ1pzg9ZPSplA1trrLRbxt?=
 =?iso-8859-1?Q?6yjIiOT4pZki1bPbpFU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB3577.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e731b1-eb34-48b1-3850-08de329dec9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 18:58:19.4228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Awu9Yx+G2dkipPlp6EzNz1wQkaJMyKB46/zYEqiUZemNmUc+ScECLOVkRt9iOX0bX6DJgzYz7Mb6aQ87hw6ItXA34lD1MRPE2fwUece+c88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9353

Creating a dom0less guest with a high vCPU count (e.g., >32) fails
because the fixed 4KiB device tree buffer (DOMU_DTB_SIZE) overflows
during creation.

The FDT nodes for each vCPU are the primary consumer of space,
and the previous fixed-size buffer was insufficient.

This patch replaces the fixed size with a formula that calculates
the required buffer size based on a fixed baseline plus a scalable
portion for each potential vCPU up to the MAX_VIRT_CPUS limit.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
V1: https://patchew.org/Xen/20251202193246.3357821-1-oleksandr._5Ftyshchenk=
o@epam.com/

  V2:
   - update commit subj/desc
   - use a formula that accounts MAX_VIRT_CPUS
   - add BUILD_BUG_ON
---
---
 xen/common/device-tree/dom0less-build.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 3f5b987ed8..38a5830813 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -461,15 +461,25 @@ static int __init domain_handle_dtb_boot_module(struc=
t domain *d,
=20
 /*
  * The max size for DT is 2MB. However, the generated DT is small (not inc=
luding
- * domU passthrough DT nodes whose size we account separately), 4KB are en=
ough
- * for now, but we might have to increase it in the future.
+ * domU passthrough DT nodes whose size we account separately). The size i=
s
+ * calculated from a fixed baseline plus a scalable portion for each poten=
tial
+ * vCPU node up to the system limit (MAX_VIRT_CPUS), as the vCPU nodes are
+ * the primary consumer of space.
+ *
+ * The baseline of 2KiB is a safe buffer for all non-vCPU FDT content.
+ * Empirical testing with the maximum number of other device tree nodes sh=
ows
+ * a final compacted base size of ~1.5KiB. The 128 bytes per vCPU is deriv=
ed
+ * from a worst-case analysis of the FDT construction-time size for a sing=
le
+ * vCPU node.
  */
-#define DOMU_DTB_SIZE 4096
+#define DOMU_DTB_SIZE (2048 + (MAX_VIRT_CPUS * 128))
 static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *k=
info)
 {
     int addrcells, sizecells;
     int ret, fdt_size =3D DOMU_DTB_SIZE;
=20
+    BUILD_BUG_ON(DOMU_DTB_SIZE > SZ_2M);
+
     kinfo->phandle_intc =3D GUEST_PHANDLE_GIC;
=20
 #ifdef CONFIG_GRANT_TABLE
--=20
2.34.1

