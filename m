Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D48EDB1DD0E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073361.1436456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5PC-0004c9-HS; Thu, 07 Aug 2025 18:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073361.1436456; Thu, 07 Aug 2025 18:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5PB-0004Eg-VU; Thu, 07 Aug 2025 18:31:57 +0000
Received: by outflank-mailman (input) for mailman id 1073361;
 Thu, 07 Aug 2025 16:59:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xs-00076W-4E
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:40 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e62dc112-73af-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 18:59:36 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by VI0PR03MB10757.eurprd03.prod.outlook.com (2603:10a6:800:267::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Thu, 7 Aug
 2025 16:59:31 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:31 +0000
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
X-Inumbo-ID: e62dc112-73af-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wg2eFhkhwYLhxWUBmc4QsNui7q9c/OA/fDw8StCRD9diilh7POY6NTIJQOhZbNaB30BoYCQeYspJDzKxtAxZ6jn8THb9AoJSM+BuU66XePT1bPqUNPJR9Gv+e7dAN6vRv7X/2WBA3lfN7aFxMfxVRXf0K6TFPjdKXVPhWkuF8YDDiU/RDljJvtmg76P8KQq7sATM0T11B3Cpaq1u4n4dV50NYDwGtsreaVHtjzqXNqnJLndWcfq6a0lApFGhLvrmcQb8kU6Ra1Zp4r/3puLSFbaa2ucvEwJn/YjmZ309ic+DL/wCenRpmsLT80VplGwfy3EiIPrX0lAuHkMEd3RSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kD+Qf49VbgsplfZFP2D9e4GX39Tp6TJSZUfS2DxkCFc=;
 b=SPXQMz92stH3QPtQGqTvWC/vKsJ1HT6QOlhIrOKfY/4SpoqDrzQEyqWTBKPhNFaIfkOqK2CvXJAlzrzxl+MMF1HdSkTEHTy0SnEQGqidoWDhkMD/hO88wfRUyG3OqzPopmBuAP/0tGuxo+BX1SJGqm3cb1YMFJmSV2+MS4DZcCuNPDbhH46ViICVI+ANOGvMDcc4C7UxLCEoZA3chBphyXkg7EXMoHS8g2g62WA0ZCwWDJeoGAWmfK0e4J6z9/tEc3AaCarkR9/UfH9FbF2vLEVQhUb6txpHvuQYVo3Wqm2/iBEXC5Y1dMY8hhdZlAqEVwtnwWXVVYTpJg+49P7Y7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kD+Qf49VbgsplfZFP2D9e4GX39Tp6TJSZUfS2DxkCFc=;
 b=pGA7RvPGZ6emma4SJd8AqFtXNm4KmN2GqETa13grdway6uWEjJB2hTBtHOCvnkChdKROrLYJjIwymE6LAtMaSv84f4csYUC7rkY/DEF5+i094LB+xPAIU08hazwD1nxMrPMLrttfrbiA1IsTPa3cKJpR6h44l4/ARYXtKK8WVT/7bD4kZEfHGEPEKWWAoI+V/SxyfVBBzeCmt0dVsmRTI+FbNvQQ+exoF6bmtWFbfBKnNzjiNdYvxhrueHcVbQ1ykVNv+REaicJZ1QYkDOX45UW3BBqCe/SoB4Dil0UtQ9HiO07Nyl1HLPnvrsVToMRL8UdXZ7GHWu1d2H0RPlvVLw==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH 16/20] arm/libxl: vsmmuv3: Emulated SMMUv3 device tree node in
 libxl
Thread-Topic: [PATCH 16/20] arm/libxl: vsmmuv3: Emulated SMMUv3 device tree
 node in libxl
Thread-Index: AQHcB7yktmBVQsC5I0iGGX/Mv/uKhg==
Date: Thu, 7 Aug 2025 16:59:31 +0000
Message-ID:
 <b07e6c46650a41dc9459c5919ac2ecc4307fae0a.1754580688.git.milan_djokic@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
In-Reply-To: <cover.1754580687.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|VI0PR03MB10757:EE_
x-ms-office365-filtering-correlation-id: eef87d52-da43-4036-4403-08ddd5d3c73a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8bUOP3IciHzj68GMJmyjTTwCQMKBXssZZXs0JB8gW3u6H8sQ6I+9jLZGKz?=
 =?iso-8859-1?Q?BPKtPINwhrx/8teIIPV7PKZrokNk/R+YIN8blWKhsGYHH9jEGLFWtpuTSk?=
 =?iso-8859-1?Q?zebqFEuBdJL//DLj3/pdwFWpIvIVvnV1BIMZSkyymUIMgD487eAUJcm5pP?=
 =?iso-8859-1?Q?J/qVKLaV0jxk3zyXFpHz7hjFrhj3iLabXuOnItQNkuFTCHdevAeTtb8zVu?=
 =?iso-8859-1?Q?2e1mEhNmwKy6HcadoFc6t/6B4auA1lPKvp2kfLLA4RTBM59O77WxKxIvbA?=
 =?iso-8859-1?Q?j5q9GvNRF0DnRI2sgW5r+9s42fo2fdq6pE31jjd+B4RutFivLoXnasiZSr?=
 =?iso-8859-1?Q?noPw38+MUfeLCV37EwGR0LMntAyblYpjBrYFKLAvpQU3agwbdZEPGtF6Wq?=
 =?iso-8859-1?Q?hfwQz1eoucfcY+xraRCYtjhp63rsoRnGOFZKEkyXpviRRJjG/cM0DKaUde?=
 =?iso-8859-1?Q?IntREAMNMUxDg38PPFzaMnhkHvamBa+RDd4yI7Zj5iU3LHxXPba1yIhZ1A?=
 =?iso-8859-1?Q?MkFe5vC2h5EaaCe63gIjc2sF6KTSnAoEHDTPFRXBKM2wTwOYLshZrR3Qix?=
 =?iso-8859-1?Q?iTf10ro1PofCL7L1HxQD9a/aiAey5E2Jdd5U1qO5y/pF2wDRdXwesZhS6y?=
 =?iso-8859-1?Q?C1h3z72JXdfn2DzcTWNX0sVskCwSEu9MOhsyHjjBoUhMTtaN6QcZu+wVhf?=
 =?iso-8859-1?Q?ASpiCGzjpkk1oanWTh5fCVLIWN60CeLKFnhjyksH0FqVKCnX/qghrOMkyh?=
 =?iso-8859-1?Q?qTTioxruWC6ls9ECjoJLqtKj0MTS61bgF1J81m6TI4xTpFPHcuEC80Z+WL?=
 =?iso-8859-1?Q?WdE3ZKOw2/gJcGrOCAxq1j9BxZZWmpEf0kLGdADSLGlvRii9bz6VXtqK2d?=
 =?iso-8859-1?Q?OubyQpe5gX3OScblvyVAok2/WqLSbUswfrzLSX3bin9RO7GzJAAvbYtFY4?=
 =?iso-8859-1?Q?CjxX9DyqovQ6UYPpZbueR+xykJuQMkEaeyM79LjKzTqP+lrmizCMCQHptk?=
 =?iso-8859-1?Q?kc6W/4YmE7erYmxbTD2kRc2dsyovRSQc/WnhhyGfK2An8jsmj5v3VkO2M5?=
 =?iso-8859-1?Q?vxCVDQRlfDvj6TVNI7FoO8wW+ZogUJYl1l35PQqMavwPLL4hvgDE+a1aSh?=
 =?iso-8859-1?Q?2QluiknxsmNm4RO9BTbaSiV4jhRShRvrTYs7OYsclRVIGOa2eDZqtsB8U7?=
 =?iso-8859-1?Q?KSExcuDOdQIeol0rl+h7RhmzMu4l2xm9SAvdOCtx+8dDnh7PXnr/dkl+nl?=
 =?iso-8859-1?Q?oo7mcwkmIq/Q7KMGq0abRJsCGSh7oakr3HJeAPeRjf81Dv0n5T+pIxUvmH?=
 =?iso-8859-1?Q?CGeK/TZ94HWIlaeBMAwjyiZtmORtYvBIQUQCyB6+amUgZ5eZU2ZPijNYfC?=
 =?iso-8859-1?Q?6TzuAsj22nW55a+i/Yn1YGsUXnJH0ZCEdBuTnr9YgiIr3IJarebxWoH4nx?=
 =?iso-8859-1?Q?PpS2StnjYAW5QsZfPu9DSak8DSKqsgWgqvEqjA7RZ8P0vpnvOaOc2MqMXF?=
 =?iso-8859-1?Q?mNFW/gDsmtCAkv53k8ZvCH9sRSCgdOvCAwebp0C4/fqw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CuJtiYpM0BTIsCiBHDEeGzTXTemkdzxBDjQPI5ARTHvMhAetF1/nahT4qq?=
 =?iso-8859-1?Q?hpi0sC1PoXAJJQDhAGaRWDYv7nh+bJdEmBhrV6BqrC8ZiIV35OBrSjiPDp?=
 =?iso-8859-1?Q?R+0MEdyK2ooSz6syAuOoug0VJtU+I2mtpXD3jUoYdNlqLe/zLr3nPcj5ke?=
 =?iso-8859-1?Q?FY/+nUQdP2tPNAM42wATIxAAVxo+NGlj/OJTGfL8zcrxDMA5dec463HAX5?=
 =?iso-8859-1?Q?DmZj49fviUgzd+bZD9xJJhqArgEj1dh5xSuhrGTe1rbUsVTlT1xSa9TrJ8?=
 =?iso-8859-1?Q?+UTG76XEke6S3vWoazNZQN151xuyuUS/LAILFEfvPK1SrWxqwuYgr0CVRo?=
 =?iso-8859-1?Q?n9JeglvKQkoukFviYo3VatiAY1JccCs3S7ZMII+WxeiK4NBeDF56T52uAv?=
 =?iso-8859-1?Q?PBIUD7l4SKieizOyvGX68Ol/7TZjJ865JxJ/1yAiVsK9/GkbTa6hzMcnbD?=
 =?iso-8859-1?Q?puD4qDY5PYoO9NW8zKQLLSVJCNuGbDw0LoxPDBaSr9XPkE8s1lBmPPFT9T?=
 =?iso-8859-1?Q?TzlZQlTLvjDgVEnUCe3XEe1M6qeVIorWKHJY2LFgMFjdwvoEVwV61FOFKP?=
 =?iso-8859-1?Q?aX24XFpZ25izC4iLhIoirvoqmBKJ/oukyriHZaBu2moKbH9wCQl7JgOlxc?=
 =?iso-8859-1?Q?ssoLuNiVRtGcAv/H2Auq9N9i0KnHzE7I/u40V0cxXZdtlU66eJU2EQx9CQ?=
 =?iso-8859-1?Q?wWWe8tXLXieW3eV9S+xu/t+z5y7Y2w069FJzGbh8UFSAU+EWX/3WWRUejS?=
 =?iso-8859-1?Q?d2RqxYsxkagDOdWMEz1HV9oaP5PnhX7m6MxJdp2zyhLage8d4yeVLX26LQ?=
 =?iso-8859-1?Q?r5mpaJW2SOj4Y+f+tSqb20JhDYtoHQ9uNbBpN8loXZrGzstFTQPMHTMGua?=
 =?iso-8859-1?Q?adydg+D1+vaJqFNS3pGQf1+7uQz70tb8Lr32pMB8cXmqZZYoSDEptJKaRh?=
 =?iso-8859-1?Q?OFPgISpX/uJ1PjYTav/SSWzihfHapX4WnmNFdoh2TdFwe3F375rpapUYLr?=
 =?iso-8859-1?Q?e16/R+8uLJ0qfUM4g3/xsVNhmM72muKd1r/euAWMAtjSOKsubI74D+5UTU?=
 =?iso-8859-1?Q?BhjgmuoUaC2BqxtMsclrXrWBMo6VFSOnxdhTdcbuirBXx35QD0zFCVWBF8?=
 =?iso-8859-1?Q?9/c0xLSY7PgAJIMAO3td77DczZAm13r61zsRqCX9wz4diBXaNS0FASOWer?=
 =?iso-8859-1?Q?ozqvHMLLKr07EAikqr/r7zRX86aebHTje4viO9trtfCd5sIA2V6bfn0duG?=
 =?iso-8859-1?Q?w9vUdD8uaQBwdq9G9yDedZKDhZyt5YrrwmdlQFbZ6LUfLvQxz4ecVOIdfl?=
 =?iso-8859-1?Q?oxHSOvzfs1SiyERODd1dKignLePEZ+a6+RB/gCSeJhgPHzDKVQ2mVIn0na?=
 =?iso-8859-1?Q?AOanw+++ERZKf+LJEjIPdliUUP+XpovAmaiBHBE+NBiDnAA08WJ0pMmLiv?=
 =?iso-8859-1?Q?28AlcBaVCnptMVbJrDIlV6beuT5q9FfjXNGIAIbwhDb8cAvjT2Ppyo3L+8?=
 =?iso-8859-1?Q?m4L0QpRNJ/cMD9cCMQtRygt7X1WdyRvS9yh+WvnwrtNNZrpClip2GkxQig?=
 =?iso-8859-1?Q?BcSBeLQw2uc8FPTi5bKg0rbpAKk9JQ4buj2mY91heuBGuylJGJwgUJp8Pn?=
 =?iso-8859-1?Q?8UY2CtX3VpEO3qheL4m/uFqrzsj/2ld0I5bHhnC67VDkQiNGD9iT+9mw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef87d52-da43-4036-4403-08ddd5d3c73a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:31.3519
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1N2r8UALrIN+PA3mEjzNheIuUEwv0ohNfLjZGiWn2jOA5s9ozogPYHiR31jEf7E1W6BjMQCn0E2prER11gk3fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10757

From: Rahul Singh <rahul.singh@arm.com>

libxl will create an Emulated SMMUv3 device tree node in the device
tree to enable the guest OS to discover the virtual SMMUv3 during guest
boot.

Emulated SMMUv3 device tree node will only be created when
"viommu=3Dsmmuv3" is set in xl domain configuration.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 tools/libs/light/libxl_arm.c | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 44b7bcd672..c8255d8d4f 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -887,6 +887,36 @@ static int make_vpl011_uart_node(libxl__gc *gc, void *=
fdt,
     return 0;
 }
=20
+static int make_vsmmuv3_node(libxl__gc *gc, void *fdt,
+                             const struct arch_info *ainfo,
+                             struct xc_dom_image *dom)
+{
+    int res;
+    const char *name =3D GCSPRINTF("iommu@%llx", GUEST_VSMMUV3_BASE);
+
+    res =3D fdt_begin_node(fdt, name);
+    if (res) return res;
+
+    res =3D fdt_property_compat(gc, fdt, 1, "arm,smmu-v3");
+    if (res) return res;
+
+    res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+                            GUEST_ROOT_SIZE_CELLS, 1, GUEST_VSMMUV3_BASE,
+                            GUEST_VSMMUV3_SIZE);
+    if (res) return res;
+
+    res =3D fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_VSMMUV3);
+    if (res) return res;
+
+    res =3D fdt_property_cell(fdt, "#iommu-cells", 1);
+    if (res) return res;
+
+    res =3D fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
 static int make_vpci_node(libxl__gc *gc, void *fdt,
                           const struct arch_info *ainfo,
                           struct xc_dom_image *dom)
@@ -928,6 +958,10 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
         GUEST_VPCI_PREFETCH_MEM_SIZE);
     if (res) return res;
=20
+    res =3D fdt_property_values(gc, fdt, "iommu-map", 4, 0,
+                              GUEST_PHANDLE_VSMMUV3, 0, 0x10000);
+    if (res) return res;
+
     res =3D fdt_end_node(fdt);
     if (res) return res;
=20
@@ -1394,6 +1428,9 @@ next_resize:
         if (d_config->num_pcidevs)
             FDT( make_vpci_node(gc, fdt, ainfo, dom) );
=20
+        if (info->arch_arm.viommu_type =3D=3D LIBXL_VIOMMU_TYPE_SMMUV3)
+            FDT( make_vsmmuv3_node(gc, fdt, ainfo, dom) );
+
         for (i =3D 0; i < d_config->num_disks; i++) {
             libxl_device_disk *disk =3D &d_config->disks[i];
=20
--=20
2.43.0

