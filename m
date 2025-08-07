Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 082D9B1DD13
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073333.1436322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5Oy-00014D-Rg; Thu, 07 Aug 2025 18:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073333.1436322; Thu, 07 Aug 2025 18:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5Oy-0000vi-J6; Thu, 07 Aug 2025 18:31:44 +0000
Received: by outflank-mailman (input) for mailman id 1073333;
 Thu, 07 Aug 2025 16:59:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xZ-000773-ST
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:21 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc552c36-73af-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 18:59:20 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:59:18 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:18 +0000
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
X-Inumbo-ID: dc552c36-73af-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGzNNGSK0Z93OfHeCZs7ARgUXPVODCr/fDZcYVZ9G+wBGaiR7KZoKsfttoJL7i+Xa6NzTmgv1lnW22pNFAK13lSA6IJZ9bX2bvDpQcxzORuB8wpJomtoCppsmGlTP4IgG0fErjBkUa1XWwfn/4wHgrmc9gOT19O85E+fmhylWx4YQ0ySA8R+X4JcSfSPKqKEqFerlY1kgpYQVScNBs38IgRxD2pz7hZhJDEedXD+JzgHNRXh9/Q9ix5Bmv52bm1QFXr9H16NUBh+JqTCMd6v0YZESvV99MEJ7T5GdYjVKMY96/lP8NL166I2uCeLa0hX/iENFQQ2zUlsyuZD9tp89A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+Zv6qBGmmQgEGZkjtADidTX/0058eu9yl2uEEkSt24=;
 b=AUA8cLrKf4bLqeU+rSQH48B9NdnnMnSmhgm+RProIMUd9by8gqgLAcY0XQctcw87YCbkJ17WI6sWBT08O6XQOBdwv7Gl/v3Y7zz/PlYBzheAO8hhogUNIuZU7crY1W5Agnb0JhwBc3xLrvvvKZi5FPyVEVzjID8ox0SUP0v6rQoY9q+vgW5MRB9tB7l0l8eSy1KI2LMsZCFp3ajTdabTlJ+3IiCdCajZbqMvT03yribvQE9MwiOcmwMRwtUSja5f/gnEAT0PX0xD0eiEK942sF/NPWxIS/w/E2aDBtdVzMOstZo59/0ohBHW1OegjiBkfe8BpcyjvxByhJBp5FyiYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+Zv6qBGmmQgEGZkjtADidTX/0058eu9yl2uEEkSt24=;
 b=kiEHaEFK8HqcWasIvJDUq6sIcWZ9aNqN7sdM9dujnQWvCYP8kQJTKOE8PGtZnLVbU3yFg/kNobQI47QsS2VQbMe6m/Vp44NYnDQgF5zUcB5xzwqD42ETxSsLrpBk57irxLv5GthuwMD+3nvWS3klZvMvVsQx8Ql3gp6C3ic/dXsnaaH/uKCSdB/jEUr7BLAIlCkSamkchBFZhE9SPO4L2VjyNVzCDylM9w/hSGnvBdLgCVzXXwONp+KTwYU3hNvvRE+H9RSWYUDjyNy/pDdinEO/oCbCL3dHZEZEiBx3CThkUEcag1dt1EzGDsNThBalKoAdvnB8/BQOPqMg3/x+sQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Milan Djokic
	<milan_djokic@epam.com>
Subject: [PATCH 04/20] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Topic: [PATCH 04/20] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Index: AQHcB7yc6FJdcKq17UOgpZ88dk+WBw==
Date: Thu, 7 Aug 2025 16:59:18 +0000
Message-ID:
 <87b001cfc0555192435967b32190f75783ffa746.1754580688.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: bed35d96-4695-4a46-f5a5-08ddd5d3bf7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?bLbXga3aY5RUvJ8chjct6TcjN6jEskyeBEh49016rtHXe5VSn9/k51U5ph?=
 =?iso-8859-1?Q?xcrFac1Ba90izuZR6X0Ctb0NRTkI1ATB96usF0wu3Zdw6ymnnQBFX39i3T?=
 =?iso-8859-1?Q?cS1OvIyQZG/dCWrDXl+sT+haeLJVEHg0fBVze6RMmy1keOLnbAG61Qc0hM?=
 =?iso-8859-1?Q?z9gn+XsHkqeABjryCoe/MZAMYi7Y4HCl/Os8Fbt8j1PKqaodAN9bC9LbDB?=
 =?iso-8859-1?Q?U+CbDwj2IsxSAylypih+BVCGgQdGhPFS/KK+94FneCqzp217f8MZqq7WCm?=
 =?iso-8859-1?Q?NTzIoGAyHvMIt62ENzFkoGnVZVq5KZ7TJL7rw5vS6QHAzCsZxrAdr7fwU+?=
 =?iso-8859-1?Q?HlxfpYUULUSV8Q3oHzIMo0P4JCwGJNxivJ2MAMxRWqntK8T81XtkPBhwDD?=
 =?iso-8859-1?Q?2ESrlR1HT2u9yC2ePQ1zsGU6eW1kH+I+3IDrByPpLglBrG08gxQFsTwAMp?=
 =?iso-8859-1?Q?ABMOtBdCbtdd7fn0CiRO5uHP4ifdbmIXq6h/m5zb18WiQ8K2SF8g0N6GLA?=
 =?iso-8859-1?Q?jsHTDgtTf4RANkDYD1tqJC5s/NlPsZLkzmNhtB0FUMJRFPNIQK6XD3iZwb?=
 =?iso-8859-1?Q?bOuuo+zBSp5mopX90VJiPmFlZbS3IPcPJOB/ohag46LL3N0lrGySytaYcB?=
 =?iso-8859-1?Q?wDhWRysrKXY62uTAlSKLl9fBe1ENdZPEAZTRI8s9SjvZnwFucXqwiB5SKX?=
 =?iso-8859-1?Q?d98gJ7XyGCThESyyTS1TIy23WEuvO2SsYOUOwWY/Gs/BsNf1iM+1Wi7+KT?=
 =?iso-8859-1?Q?OCq4YR3PbhECU32WjgY92dJionsgQL5ktAteIrF+/E2UMbw9ZGs0iQ9SYx?=
 =?iso-8859-1?Q?bLe9JUkC56AYjVki8uUqgaBoaeRUmW6ome0+qtGQAObS96cKiZWgv/NGXd?=
 =?iso-8859-1?Q?n8cyGHahf0okg/aFJn7plHi7nwgHN076mbMJppPqnZY3lGrTTBKItoAiF/?=
 =?iso-8859-1?Q?MliMsF9pLkZ8Ib9JQCb73wYw5spEBUaAoCernnxzlMrfhONCyy8sUWYyxu?=
 =?iso-8859-1?Q?K6wsyDXSPGY6xUl0fSfPCo5pbpuM0kLEv/fugjnx7IFCZQRyDmkXFIxD1Y?=
 =?iso-8859-1?Q?CYd+rZCV5jJRftEh8Qk3k9hT+9kQxz041XCRULHeBkfmA9PnuImhkRNptG?=
 =?iso-8859-1?Q?m2ZAFn2ytmZ2GOgfScBZckhjA0GU2KdYd8hZOc9AUuHYBP4TIuh0SXJFiS?=
 =?iso-8859-1?Q?5Cdvmzzolsd7neCXRsU9+RXqrci4cNOk89685fd32MbpfOaMTofqMUVdKQ?=
 =?iso-8859-1?Q?y4x1vJueG7raLR0cLcRqQjCW9tQcf47G64QJiS7KTL4SWcLz7XUguejvY3?=
 =?iso-8859-1?Q?ip4Wg9Eu6CX9wXXFUtTK/z0DZovHv9Fjl3zIWkBLBTiJBIwwQ0/QAaLTB5?=
 =?iso-8859-1?Q?3ksgGzGSKItJWqS9udnnewCVo1OW9HeIUHKiLwwGV2NuRkw1iI64CTuqLM?=
 =?iso-8859-1?Q?c3I31/EpZM75Mu3BjV5ZUrw1w8dLR+RTNMoT2zWY9cy22lfPwHj23K86SN?=
 =?iso-8859-1?Q?nCLzHNQprwmJ70Dpt5S2uS5uSsopr1+9xPIjyL+JUmTA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9nbaHoCpD/WOvC1lDL9euTDWTx/7vrZaYLBISdwW/ujXse86hTrhO79Enm?=
 =?iso-8859-1?Q?3gkf03XSQuHl3w7umUK/DdPqXiEy6JMYEd0wTTUyO8mASlSyqEv1V7kTt7?=
 =?iso-8859-1?Q?Dga6Gy2825JGxRKgoG6W2+F9EiAXaptDOLLUfXIKPJw2q3p1jKqBDz5lKg?=
 =?iso-8859-1?Q?4VXoVGJ7WLE/VCEqLYwkv19K1ioQ4N+EEPMNMt6y2zr0NPFo6b07tCiUmA?=
 =?iso-8859-1?Q?LKRTVBdUq38rr2KDWnBoeG+wMEfb9mkRjRpHpYB53IJWcIt80lZIwDzFs9?=
 =?iso-8859-1?Q?nZr0MGrj8jP5NNiIO5o+g7rb/J7HbEoCgDngKLBP7QqabckYvpzlYolk94?=
 =?iso-8859-1?Q?a5MPoeaqaoAon+JZgEyep76Id3CIvxP1SwO0pvm9m5h1O+TEScSFLhSdrL?=
 =?iso-8859-1?Q?oZVTmy9lZq7bNNtj9ZfLo10btHLDT+Co4YX2s/8hKhBQ6emJizZYt/QRwm?=
 =?iso-8859-1?Q?GrRQnZKgAPBH0+NepbTVUfJEWnhXhbK8JlNYZt5VSTliUSI3VnvDNg2hmv?=
 =?iso-8859-1?Q?oU9zTEJSAEc5BPYjkTdiUTbjEz4Yx7xMpCrRWnSrZxnJP4P7gMVhASij7l?=
 =?iso-8859-1?Q?1E14vPt1AVRMa2c1EyQJO0wgpg6TufvHBYpvcjIapqRgVwUHz2ZBwo8nup?=
 =?iso-8859-1?Q?/uBlpyiQCu54wC+lewauK3D3oRQyPckqZQLjd3gmK69bZaiBkx/TdLUkjt?=
 =?iso-8859-1?Q?psnpnKttOvYhd1+2F/rHQLL5xkdm5OL4J0pVa68IM0zJ5m8topexAYAAgC?=
 =?iso-8859-1?Q?Wl6mUHGzLamycOQWSCNXxfRdMw01PM8lijkr2oJl4TIU1t/voXXg369txd?=
 =?iso-8859-1?Q?4WG6z9E1YW9mz0dzWbJDuNUx6mZWUKasOnBUP8OLHG7BKDddCG1v4b/s7N?=
 =?iso-8859-1?Q?act9x1XGtPvXnC6djL/8TfXtbCLhatG516Ry1FziwOhVuBOEtb9bLl+61L?=
 =?iso-8859-1?Q?L3IvtF5+UQDBOp70e5gqK4WvK28oYX4MozSF7HErBx5T4AzhxmJScmZSCC?=
 =?iso-8859-1?Q?buprVz32rOiqA4/Vw/50nlD0rwlYX7WFJerf9D6RgvhBC+X8Do/JdNtzcx?=
 =?iso-8859-1?Q?73r7tTkzpT+IqQD8Up4m0WE0Qw1u1szIzmQuQFqzAtbRG+d+0Af/fs8Mo4?=
 =?iso-8859-1?Q?V/pmRHyexhAx/9PJ6IugRiN1MIswaVpyOUip+ai92xIMZGA22MVK+idyZm?=
 =?iso-8859-1?Q?C66nCChJgmxDpb4bZJHu/IwI3sPkGrvNcZEHL683HGoh31fbQLycG8ZLoy?=
 =?iso-8859-1?Q?R4Sw6SCebYpsVD4q8iMqs/4JAoAZpuThiCbFUysp5hebfHI/dfAAI50erp?=
 =?iso-8859-1?Q?u/hnrPKs3JrIT6LPtYiI/Fy7ckDFsevG7/1P/oSc3/27Ert6TlMXLMb62Q?=
 =?iso-8859-1?Q?1/BTfZu0ATm2GORrxQoW6iyYDRp4ILWgxXzIfIA3yVHjbo3y2aldIMGpCr?=
 =?iso-8859-1?Q?Frlpv5W5aPyn9YUEhIes3lRqfSl0DK3hSaBxMTVZ2pII1oiQDwcabQK0Px?=
 =?iso-8859-1?Q?wWVzEvBWfGNt0ss2wdv8eE8haxkg/ce2PfssHBYQ7jXQi18vgV2cAtnUY4?=
 =?iso-8859-1?Q?IMFdt/k82SH6qWcOwqdraPhhcPdnrS7ENAaiZBSy/PxyXzv2/9BYR9Jvvz?=
 =?iso-8859-1?Q?ljIcx7w5/z57nqzOzVAyCTcFLvJI1rPSOl?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed35d96-4695-4a46-f5a5-08ddd5d3bf7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:18.3569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NOZfGoyormVqoLrjK09Fl4ztpXhl878Lb+NZruR/EqG2nxG9nNxYTNLHYelBL7QaN6tM2hBie7Be0HqfDQGFjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336

From: Rahul Singh <rahul.singh@arm.com>

This patch adds basic framework for vIOMMU.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/dom0less-build.c        |  2 +
 xen/arch/arm/domain.c                | 25 ++++++++++
 xen/arch/arm/domain_build.c          |  2 +
 xen/arch/arm/include/asm/viommu.h    | 70 ++++++++++++++++++++++++++++
 xen/drivers/passthrough/Kconfig      |  6 +++
 xen/drivers/passthrough/arm/Makefile |  1 +
 xen/drivers/passthrough/arm/viommu.c | 48 +++++++++++++++++++
 xen/include/public/arch-arm.h        |  4 ++
 8 files changed, 158 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/viommu.h
 create mode 100644 xen/drivers/passthrough/arm/viommu.c

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index c8d07213e2..1fa6df214b 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -22,6 +22,7 @@
=20
 #include <asm/arm64/sve.h>
 #include <asm/domain_build.h>
+#include <asm/viommu.h>
 #include <asm/grant_table.h>
 #include <asm/setup.h>
=20
@@ -280,6 +281,7 @@ int __init arch_parse_dom0less_node(struct dt_device_no=
de *node,
     uint32_t val;
=20
     d_cfg->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
+    d_cfg->arch.viommu_type =3D viommu_get_type();
     d_cfg->flags |=3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
=20
     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 310c578909..a66f71da17 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -27,6 +27,7 @@
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
+#include <asm/viommu.h>
 #include <asm/vtimer.h>
=20
 #include "vpci.h"
@@ -699,6 +700,21 @@ int arch_sanitise_domain_config(struct xen_domctl_crea=
tedomain *config)
         return -EINVAL;
     }
=20
+    if ( !(config->flags & XEN_DOMCTL_CDF_iommu) &&
+         config->arch.viommu_type !=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+    {
+        dprintk(XENLOG_INFO,
+                "vIOMMU requested while iommu not enabled for domain\n");
+        return -EINVAL;
+    }
+
+    if ( config->arch.viommu_type !=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+    {
+        dprintk(XENLOG_INFO,
+                "vIOMMU type requested not supported by the platform or Xe=
n\n");
+        return -EINVAL;
+    }
+
     return 0;
 }
=20
@@ -791,6 +807,9 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl =3D config->arch.sve_vl;
 #endif
=20
+    if ( (rc =3D domain_viommu_init(d, config->arch.viommu_type)) !=3D 0 )
+        goto fail;
+
     return 0;
=20
 fail:
@@ -1038,6 +1057,7 @@ static int relinquish_memory(struct domain *d, struct=
 page_list_head *list)
 enum {
     PROG_pci =3D 1,
     PROG_tee,
+    PROG_viommu,
     PROG_xen,
     PROG_page,
     PROG_mapping,
@@ -1089,6 +1109,11 @@ int domain_relinquish_resources(struct domain *d)
         if (ret )
             return ret;
=20
+    PROGRESS(viommu):
+        ret =3D viommu_relinquish_resources(d);
+        if (ret )
+            return ret;
+
     PROGRESS(xen):
         ret =3D relinquish_memory(d, &d->xenpage_list);
         if ( ret )
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 463ae4474d..50e4f5fee4 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -34,6 +34,7 @@
 #include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
+#include <asm/viommu.h>
 #include <xen/event.h>
=20
 #include <xen/irq.h>
@@ -2057,6 +2058,7 @@ void __init create_dom0(void)
     dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
     dom0_cfg.arch.tee_type =3D tee_get_type();
     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
+    dom0_cfg.arch.viommu_type =3D viommu_get_type();
=20
     if ( iommu_enabled )
         dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/v=
iommu.h
new file mode 100644
index 0000000000..7cd3818a12
--- /dev/null
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+#ifndef __ARCH_ARM_VIOMMU_H__
+#define __ARCH_ARM_VIOMMU_H__
+
+#ifdef CONFIG_VIRTUAL_IOMMU
+
+#include <xen/lib.h>
+#include <xen/types.h>
+#include <public/xen.h>
+
+struct viommu_ops {
+    /*
+     * Called during domain construction if toolstack requests to enable
+     * vIOMMU support.
+     */
+    int (*domain_init)(struct domain *d);
+
+    /*
+     * Called during domain destruction to free resources used by vIOMMU.
+     */
+    int (*relinquish_resources)(struct domain *d);
+};
+
+struct viommu_desc {
+    /* vIOMMU domains init/free operations described above. */
+    const struct viommu_ops *ops;
+
+    /*
+     * ID of vIOMMU. Corresponds to xen_arch_domainconfig.viommu_type.
+     * Should be one of XEN_DOMCTL_CONFIG_VIOMMU_xxx
+     */
+    uint16_t viommu_type;
+};
+
+int domain_viommu_init(struct domain *d, uint16_t viommu_type);
+int viommu_relinquish_resources(struct domain *d);
+uint16_t viommu_get_type(void);
+
+#else
+
+static inline uint8_t viommu_get_type(void)
+{
+    return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
+}
+
+static inline int domain_viommu_init(struct domain *d, uint16_t viommu_typ=
e)
+{
+    if ( likely(viommu_type =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE) )
+        return 0;
+
+    return -ENODEV;
+}
+
+static inline int viommu_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+
+#endif /* CONFIG_VIRTUAL_IOMMU */
+
+#endif /* __ARCH_ARM_VIOMMU_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kcon=
fig
index b413c33a4c..fbd56eb990 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -35,6 +35,12 @@ config IPMMU_VMSA
 	  (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage=
 2
 	  translation table format and is able to use CPU's P2M table as is.
=20
+config VIRTUAL_IOMMU
+	bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
+	default n
+	help
+	 Support virtual IOMMU infrastructure to implement vIOMMU.
+
 endif
=20
 config AMD_IOMMU
diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough=
/arm/Makefile
index c5fb3b58a5..4cc54f3f4d 100644
--- a/xen/drivers/passthrough/arm/Makefile
+++ b/xen/drivers/passthrough/arm/Makefile
@@ -2,3 +2,4 @@ obj-y +=3D iommu.o iommu_helpers.o iommu_fwspec.o
 obj-$(CONFIG_ARM_SMMU) +=3D smmu.o
 obj-$(CONFIG_IPMMU_VMSA) +=3D ipmmu-vmsa.o
 obj-$(CONFIG_ARM_SMMU_V3) +=3D smmu-v3.o
+obj-$(CONFIG_VIRTUAL_IOMMU) +=3D viommu.o
diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough=
/arm/viommu.c
new file mode 100644
index 0000000000..7ab6061e34
--- /dev/null
+++ b/xen/drivers/passthrough/arm/viommu.c
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/types.h>
+
+#include <asm/viommu.h>
+
+const struct viommu_desc __read_mostly *cur_viommu;
+
+int domain_viommu_init(struct domain *d, uint16_t viommu_type)
+{
+    if ( viommu_type =3D=3D XEN_DOMCTL_CONFIG_VIOMMU_NONE )
+        return 0;
+
+    if ( !cur_viommu )
+        return -ENODEV;
+
+    if ( cur_viommu->viommu_type !=3D viommu_type )
+        return -EINVAL;
+
+    return cur_viommu->ops->domain_init(d);
+}
+
+int viommu_relinquish_resources(struct domain *d)
+{
+    if ( !cur_viommu )
+        return 0;
+
+    return cur_viommu->ops->relinquish_resources(d);
+}
+
+uint16_t viommu_get_type(void)
+{
+    if ( !cur_viommu )
+        return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
+
+    return cur_viommu->viommu_type;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e2412a1747..0a155fe615 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -327,12 +327,16 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
 #define XEN_DOMCTL_CONFIG_TEE_FFA       2
=20
+#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
     /* IN - Contains SVE vector length divided by 128 */
     uint8_t sve_vl;
     /* IN */
+    uint8_t viommu_type;
+    /* IN */
     uint16_t tee_type;
     /* IN */
     uint32_t nr_spis;
--=20
2.43.0

