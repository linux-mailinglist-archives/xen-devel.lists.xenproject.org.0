Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 559F3B1DD1F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073344.1436365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P1-0001xG-J3; Thu, 07 Aug 2025 18:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073344.1436365; Thu, 07 Aug 2025 18:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P1-0001lM-7W; Thu, 07 Aug 2025 18:31:47 +0000
Received: by outflank-mailman (input) for mailman id 1073344;
 Thu, 07 Aug 2025 16:59:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xi-000773-1F
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:30 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e141abe5-73af-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 18:59:28 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:59:24 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:24 +0000
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
X-Inumbo-ID: e141abe5-73af-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WW5ilPlvQ0TCkfxG7JqdDRYdFOmxMECSCFug2TqFPBTvH1EWBmHivLr4r+6KbRvNkzs9wHXMSaOGePQI4FMyQtpeeVBRJbmmWcbq041qD/+R9tAbJKItw1qES5GLz9PEsBW0QMzq3d7CBkV9Oy0qNwKcHT5aVGXRTadYaghVt9RBsauZ9diS1dvv6svLKqg8vtG8wgphY7EWMnUm505MbY27kzd0l/ht8GefFQZmScOwO4ZpPEqJlRuQSOvA0GRlVSLSp1tEgfFHKEvz0jN971AeNY+/g313zfzwsejneJLoap6V8jN7MvRy2Cnolw2eil6pffpWIlyT8hQqCCyE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziYBUTrB3P+AGN2Q/b5l0hgVM7EuLNty773Ail/6/I8=;
 b=zH8biVCwXKAt06mQ27r+YhJuO3Oke9OI9ycsR8E+ZTjEMsIR5RGcPaqBotNVLRuMPyiNNPIS5gPW73r1rDMkOgRp/GNNB33vh2dv0Blw+MyDGwcX1bAL5iCbBJ9CiNZ0CzsPpVNd0F9WFwp7xOAtBRl+ypPto/qDCYaSw9V9UAldy5fxH8x6hK89Gocix+AAtwi6M85Va9zI1ibB5okhXH4Iy/BV9NmLrm/KsSWbAHQF9P1o3OE2yqDUH+gXuHF8znfAFV+CskxGpNz+h4GdHfp5A5dWwuB8nnxrYfeu/to09ydsZmMONWXEFNv+V6/JwBo5bxnPRFLSIM2FlKqWKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziYBUTrB3P+AGN2Q/b5l0hgVM7EuLNty773Ail/6/I8=;
 b=pX6/Ccxp2doCdJRVGV/MBpHLBGUHSSn9WrPXrAfafWgf3HDUS30U1bMbOIKq/cxtHANxFUiGtBi8/KeSw02zbrA94WhaoNytd617fTBD4zdcHq1ARnQ5t6Yfl3N8Gk7weZotT98gdyffDyK+CSnyV6NzGXjW+v9EMSTalOL706khoBXpiECLxVVR66Kd/EP+nSu1ePLqtQguoA14q138ZOAp7mePeZlNStC9Q/evcs5UFwer5/aQf4AaSC+fwCmok3KasFRGep6OuPHoKfmFnuuGh8yl1pCB/2HOgeogqvI5BRY4ERpgRVbrzozHIGf94z2EMfkh28a//5XTg3vjWw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH 09/20] xen/arm: vsmmuv3: Add support for cmdqueue handling
Thread-Topic: [PATCH 09/20] xen/arm: vsmmuv3: Add support for cmdqueue
 handling
Thread-Index: AQHcB7ygaIRJk82f2U2cK2snO9G44g==
Date: Thu, 7 Aug 2025 16:59:24 +0000
Message-ID:
 <61dbd27ea536b80b6d0de1bf3ad0b4bab38e83a7.1754580688.git.milan_djokic@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
In-Reply-To: <cover.1754580687.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|AS8PR03MB7336:EE_
x-ms-office365-filtering-correlation-id: 6407eea4-105b-43eb-4ba1-08ddd5d3c2f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?t2aMweyVHcP2Y5Gp+VjPNRpooJ+i6aL8qgXX4nMAFKgLVD1wl/Nlv/oZTU?=
 =?iso-8859-1?Q?S6NKpjgn+mW8lmNMzAXd3fcraAAVmM8J79LA1E1Kvr50N8CSRIc77svF9K?=
 =?iso-8859-1?Q?cN3L3n+pz93uCQx9eN5l6SEG9xtL77TwHsLHyUGnQkXkzge+g//Akb7JCF?=
 =?iso-8859-1?Q?6CiVnXIvl3HJ527EcgmfihqM/4Q17E4L9s9K3vYenzSDArDt0ccyc0hTwF?=
 =?iso-8859-1?Q?/5iNl3fn2+M7k4T2hFpfhB5d0P281ixKB94AFA3Rp4mNnKJZkcSeKymb7P?=
 =?iso-8859-1?Q?DF8O1CEfSgdP5ah2wfRa8aJ9m+vmJIXPKQLL4dEcsjeyMO8neUDkbSuNB0?=
 =?iso-8859-1?Q?rKDlM/N2efsu3POeeA1dGZ5VrIW6uOyMbKtU/YtW5cm2iNuVBKm/AUsDy2?=
 =?iso-8859-1?Q?IIRZOovS8DbGD9NFZTSAAUW1tWcLgmC/XBRmQ5y4h/yKaQepAymphFsEYO?=
 =?iso-8859-1?Q?ULmBJmC+VygG2xo8zwYbYYp8476gzigOiK4EY/0YfvdOV94QLO8KHhY+BC?=
 =?iso-8859-1?Q?sr/VgVjCTqxwXykeKvT9FVSSgy7hRIoVnLDatb4IvdxBBL1gKTUiXjgtQ9?=
 =?iso-8859-1?Q?ht4nNK+jGFj6t8IHun5Bw09R39TTUP/wOH+FT5G87JO3LJZyzplZ67/5yD?=
 =?iso-8859-1?Q?0PcH2yDhg8YPjm5w7V2+kRQCr97Ij1CcQPLqnF7VReNflaf33OFeyzASTo?=
 =?iso-8859-1?Q?Vb3nz6mHL892SjX1Ag8Svs4fto8qzcMQ+nWuKbZHpGDK7Ml0Bc4bbPgd5J?=
 =?iso-8859-1?Q?s9gIfcrvkNOnmRVtDm2KQGB5E7jNq9gAK86Y3zlW+2yLd6UpxveSxAkoXV?=
 =?iso-8859-1?Q?n4xpeUUDGTh/CsaBl1LRSiRWZjJ5s+4/3PAW6vnI9ejkdJbtypP5V1ZHQJ?=
 =?iso-8859-1?Q?PJ5jYypgsyrqa/HQCH5xPCxsUaeGA+brODv0DI343VgiV8qmArk1USgSOz?=
 =?iso-8859-1?Q?Pm6KhA6rK3GcN3TLG0icYJMoRFce5djlkUlSJ0aPsnv5nleyr4VPGsGoxi?=
 =?iso-8859-1?Q?oMItK7ByFuwUUfp8ZKLmkzYfGg8p42tHDEaiUr0Y2Mrndfrw8OYSId3gtW?=
 =?iso-8859-1?Q?jzi4E0t/QXLTj9oyJ+0mR10/wrcBf6ZUaXF4wt1LXkA7tfdxppJZ3Ch4G/?=
 =?iso-8859-1?Q?yxGZxNYO9nMOM20SIpW8waCH7ctJkaeIOPqvUU2Dd4B74Oa4wcH8sybuPd?=
 =?iso-8859-1?Q?3Tq/DCkxMem0NYrKtmjd+veP+sNREVX0MS2x/fB3XMS8xA8ssZ9x+dFIiK?=
 =?iso-8859-1?Q?EGD9/GMZva/f1rgnhEUW4bTKdIlTWP2jkvF7N1cfSBPfmy35K9bDbZ6K/k?=
 =?iso-8859-1?Q?dpnEwFfMryxMe8kif9gtlUjfwILsIucBwmkQfu9RciCnnDTNBeoZex93Hy?=
 =?iso-8859-1?Q?NJd54friVP9WF2llabiT7rR8Z1nUmVtuzAENS3zJIOLJTlQfzogGSKy8jn?=
 =?iso-8859-1?Q?w3Kblz823bGwqD72Z87+blFbrWIQmpLSzETxO29RJilDOceMChkgoiaWxN?=
 =?iso-8859-1?Q?BU+2OcAW7OlxMAhtSWZwSSHRuAD9+vsazZDL98aNCX6A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HH7R2WVH4vMHeeEYAVltoir81JNQlpjlIleErX+dPrtwYHJCmKgVb2dBdt?=
 =?iso-8859-1?Q?pXh1184x53Em/2nkiQ5I8uO118ucHZ6RO8hzhSnyeg02OwQyD+eXLJllka?=
 =?iso-8859-1?Q?FgMBiHpj5NplRf/o1HPzHCPmmElk60c+/kiFLBtYVVdFH2HuIN1Rm/zMe0?=
 =?iso-8859-1?Q?8743Y/6gEyU0Y7o9cXNKCbXWq86rTFX9gFLT/HMxGlIvjGXXBjZonO8LgK?=
 =?iso-8859-1?Q?mmj14QUzza6NKyg5PmaAr1emvdombhhfHGl9fmDsx/kYwN2M6r9yvlEE3E?=
 =?iso-8859-1?Q?C69aUazuCs/LgqJwLcCuDE/gv6BK5EK4Ay0iAJUouzyQa1FsEDx4VEFels?=
 =?iso-8859-1?Q?N6Dh+j0Rj0brdYT4wNy9EfZqcmDDIwgzO7NsF++beHshzIFozRDre3uoet?=
 =?iso-8859-1?Q?P/Ibce+UIxXrZHwCshuTfILB/uFVv4a5YgJXyiv2PF0Ax7j/a4g1hvNkMg?=
 =?iso-8859-1?Q?Cr6kV3b+bAFf5FvNUgTNJJeUZ9uIau1gbCapoN1c+237No0iC4RJCbdBRA?=
 =?iso-8859-1?Q?ZpMM78inQPdf6KoDWxcXb/Sz0dwe8jOgPclt/h1wzsPSSwvioNRWFoRGOD?=
 =?iso-8859-1?Q?iFGlDTfzHaKp1w1iEy3KoXIBi9T56A5PF8f5wfsHG+ayasRtj+tz5X1D/K?=
 =?iso-8859-1?Q?TtWnVVoKAIXRy0VjbWnGCIKIbtbxN6j+dWnFhMl4heqAgsErRRwJbXCa38?=
 =?iso-8859-1?Q?oFcLhFHGrRHnbHye9+Trcm6Brs0IAqjH79Gv/XRmQDlWrZxYYu/cIUKhmI?=
 =?iso-8859-1?Q?9q35V1g2C8ge2h+DmJqb0FSTKk7GI0BDiyPwn+fuArwY4ic5dCL8qA/4G3?=
 =?iso-8859-1?Q?CuPk/IZRDn3f0Kk8AyR0x8z0fQ0SNfulS6ThBqE8DTk+7chILy53KSR5Oh?=
 =?iso-8859-1?Q?IfFSw6AZf6VntpRf1pxVIXG/Ov+RdjhRs5JVsTfNWz41AUve5toDbwd/cB?=
 =?iso-8859-1?Q?GmTNxjG4wEvxN0opR9ja/DHapKHwAwTouqyvVgshgxviBQ+7Zh3974De8j?=
 =?iso-8859-1?Q?muEX7jhGiMsqVE9SKMqwKqGKy5Ea8wfOD1YkUPauWB0nTKrLYuzl5uoBnI?=
 =?iso-8859-1?Q?VBvuJRlqjhBT7NrhUTFeFh7xVR4GKuRCRxGFC9lI74TS+aWqzFmmi2FN56?=
 =?iso-8859-1?Q?tTACgad8SQCR8pCzq+MSNcV/I3tGQ/RmAgKWhGFunBQNAcZX6Cbdq0CQup?=
 =?iso-8859-1?Q?isQ1B8BksxI1xG9ds3YWXWyGSYa0REvswzdgBx6iH9EYyQpBqk/8pAHlTb?=
 =?iso-8859-1?Q?7Ee18dDlI6y3q13aHtgmjCIUdeKM2hrAOP0klIFrEYUK/xu4rGZplVhnaR?=
 =?iso-8859-1?Q?KnJjNg5VXwf1nX6EqQMy/NkMNUNLZMjSoyr6m90puyQZmWty1O/grGcsyp?=
 =?iso-8859-1?Q?HXSe32FcGCedfo11mWVs02y2pUHxU/agm3PWOvsg620PvZaoKK1gEvLlp+?=
 =?iso-8859-1?Q?Awvn0M81Q4mUkgAYjI8YrfitzDf1rLLAsPStbaKpDqAcTBPkLnG5+gaU4D?=
 =?iso-8859-1?Q?71TjpnTjO/04tBcIzzis3hn/l+viCU9bVxoKtr5pPloJXShecwh6Rd1I01?=
 =?iso-8859-1?Q?Bj3FHHznS/MA6rcN8O7EjLV7yVw2rARx7BbLIztOBpAPxA0lJxu7ePa+wk?=
 =?iso-8859-1?Q?FeknSONeoRG/u9ELvPhs99aWVxJbZddHkG/WwJXjtmpIaCNgWaSEErVg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6407eea4-105b-43eb-4ba1-08ddd5d3c2f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:24.2071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 58A1hKHVygWtUdUtzKNXQywJYC/pRiiVGrc1QsDB5UU+kZEtKTXGIv8c7sNBHEPTDPbCMVxsoSPW+8jkeJ1ShQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336

From: Rahul Singh <rahul.singh@arm.com>

Add support for virtual cmdqueue handling for guests

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/vsmmu-v3.c | 101 +++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrou=
gh/arm/vsmmu-v3.c
index 3ae1e62a50..84bd1f7327 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
=20
+#include <xen/guest_access.h>
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <asm/mmio.h>
@@ -25,6 +26,26 @@
 /* Struct to hold the vIOMMU ops and vIOMMU type */
 extern const struct viommu_desc __read_mostly *cur_viommu;
=20
+/* SMMUv3 command definitions */
+#define CMDQ_OP_PREFETCH_CFG    0x1
+#define CMDQ_OP_CFGI_STE        0x3
+#define CMDQ_OP_CFGI_ALL        0x4
+#define CMDQ_OP_CFGI_CD         0x5
+#define CMDQ_OP_CFGI_CD_ALL     0x6
+#define CMDQ_OP_TLBI_NH_ASID    0x11
+#define CMDQ_OP_TLBI_NH_VA      0x12
+#define CMDQ_OP_TLBI_NSNH_ALL   0x30
+#define CMDQ_OP_CMD_SYNC        0x46
+
+/* Queue Handling */
+#define Q_BASE(q)       ((q)->q_base & Q_BASE_ADDR_MASK)
+#define Q_CONS_ENT(q)   (Q_BASE(q) + Q_IDX(q, (q)->cons) * (q)->ent_size)
+#define Q_PROD_ENT(q)   (Q_BASE(q) + Q_IDX(q, (q)->prod) * (q)->ent_size)
+
+/* Helper Macros */
+#define smmu_get_cmdq_enabled(x)    FIELD_GET(CR0_CMDQEN, x)
+#define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
+
 /* virtual smmu queue */
 struct arm_vsmmu_queue {
     uint64_t    q_base; /* base register */
@@ -49,8 +70,80 @@ struct virt_smmu {
     uint64_t    gerror_irq_cfg0;
     uint64_t    evtq_irq_cfg0;
     struct      arm_vsmmu_queue evtq, cmdq;
+    spinlock_t  cmd_queue_lock;
 };
=20
+/* Queue manipulation functions */
+static bool queue_empty(struct arm_vsmmu_queue *q)
+{
+    return Q_IDX(q, q->prod) =3D=3D Q_IDX(q, q->cons) &&
+           Q_WRP(q, q->prod) =3D=3D Q_WRP(q, q->cons);
+}
+
+static void queue_inc_cons(struct arm_vsmmu_queue *q)
+{
+    uint32_t cons =3D (Q_WRP(q, q->cons) | Q_IDX(q, q->cons)) + 1;
+    q->cons =3D Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
+}
+
+static void dump_smmu_command(uint64_t *command)
+{
+    gdprintk(XENLOG_ERR, "cmd 0x%02llx: %016lx %016lx\n",
+             smmu_cmd_get_command(command[0]), command[0], command[1]);
+}
+static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
+{
+    struct arm_vsmmu_queue *q =3D &smmu->cmdq;
+    struct domain *d =3D smmu->d;
+    uint64_t command[CMDQ_ENT_DWORDS];
+    paddr_t addr;
+
+    if ( !smmu_get_cmdq_enabled(smmu->cr[0]) )
+        return 0;
+
+    while ( !queue_empty(q) )
+    {
+        int ret;
+
+        addr =3D Q_CONS_ENT(q);
+        ret =3D access_guest_memory_by_ipa(d, addr, command,
+                                         sizeof(command), false);
+        if ( ret )
+            return ret;
+
+        switch ( smmu_cmd_get_command(command[0]) )
+        {
+        case CMDQ_OP_CFGI_STE:
+            break;
+        case CMDQ_OP_PREFETCH_CFG:
+        case CMDQ_OP_CFGI_CD:
+        case CMDQ_OP_CFGI_CD_ALL:
+        case CMDQ_OP_CFGI_ALL:
+        case CMDQ_OP_CMD_SYNC:
+            break;
+        case CMDQ_OP_TLBI_NH_ASID:
+        case CMDQ_OP_TLBI_NSNH_ALL:
+        case CMDQ_OP_TLBI_NH_VA:
+            if ( !iommu_iotlb_flush_all(smmu->d, 1) )
+                break;
+        default:
+            gdprintk(XENLOG_ERR, "vSMMUv3: unhandled command\n");
+            dump_smmu_command(command);
+            break;
+        }
+
+        if ( ret )
+        {
+            gdprintk(XENLOG_ERR,
+                     "vSMMUv3: command error %d while handling command\n",
+                     ret);
+            dump_smmu_command(command);
+        }
+        queue_inc_cons(q);
+    }
+    return 0;
+}
+
 static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
                               register_t r, void *priv)
 {
@@ -104,9 +197,15 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_inf=
o_t *info,
         break;
=20
     case VREG32(ARM_SMMU_CMDQ_PROD):
+        spin_lock(&smmu->cmd_queue_lock);
         reg32 =3D smmu->cmdq.prod;
         vreg_reg32_update(&reg32, r, info);
         smmu->cmdq.prod =3D reg32;
+
+        if ( arm_vsmmu_handle_cmds(smmu) )
+            gdprintk(XENLOG_ERR, "error handling vSMMUv3 commands\n");
+
+        spin_unlock(&smmu->cmd_queue_lock);
         break;
=20
     case VREG32(ARM_SMMU_CMDQ_CONS):
@@ -326,6 +425,8 @@ static int vsmmuv3_init_single(struct domain *d, paddr_=
t addr, paddr_t size)
     smmu->evtq.q_base =3D FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
     smmu->evtq.ent_size =3D EVTQ_ENT_DWORDS * DWORDS_BYTES;
=20
+    spin_lock_init(&smmu->cmd_queue_lock);
+
     register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
=20
     /* Register the vIOMMU to be able to clean it up later. */
--=20
2.43.0

