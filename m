Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7804C699EA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 14:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164700.1491604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLsu-0004WO-ML; Tue, 18 Nov 2025 13:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164700.1491604; Tue, 18 Nov 2025 13:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLsu-0004S8-GZ; Tue, 18 Nov 2025 13:36:40 +0000
Received: by outflank-mailman (input) for mailman id 1164700;
 Tue, 18 Nov 2025 13:36:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ey2=52=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vLLst-0004PV-CQ
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 13:36:39 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b5feae2-c483-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 14:36:37 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB7650.eurprd03.prod.outlook.com
 (2603:10a6:102:1de::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Tue, 18 Nov
 2025 13:36:33 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 13:36:33 +0000
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
X-Inumbo-ID: 9b5feae2-c483-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FymBHOQ5qqRyn4hne7vE/T9D6noxTf2bSZwhHrEj345SS5IFvu3/PTnN9MlNONOoWPBj8I+50wJzzC7K5xJmrGPDgI8solUGnIEpWPkiMaTjhC2qSisv2nqh+7tCoALu2hVtk9GoyE0QdtoyrgdbOaKIwjcP7brjulf801K0K5zfS3o4isUcg49U2y/g1DN+al9pYXBD+pIhNDPdvaccI1v4NcYxLnLwx0jXH/RHwj2gwxljsYMVUu5nsiE9Qa/fynQ0uz3MOZNm3m6eBzLfypvW54nzOEB/wFtn3pdWSE4FwkK28devawJxNRwIFcgRI9hxrIuR+V8OzY7scL9dVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTGuoCs2WHO4MzRcHi6p/mnMsry/Pk1E1urssND/pzw=;
 b=xIYXcSFU4Q9s5zJ0j1z7VkfOKFfAF5hPGrFe+/vojLFDVcpjGfFrPTsew0P+8iZmpNTRPWX+OiGwrWLvpJbZOkgPZTpm3DKwEk1klKT2C4vsjxgrAyy+a67QNPoEkGhfbvzHJWoP1dEmlFF8huOr96hpkxfdZDCIrnYyB0hIdWWUrw0qi5VcwDqTV9Q43sucxtOSzyxVX1EycfpbQZqQGGCRtUrfheWi5TiS6EweOVtzcmIKPIbIN3hK7Hmg1T7jk2IGrIh1iIIGrvvhdy7FvqmmKrXs7LJEXxriL+468W83lXSE+2BDwElBUYoSzyjKCNOksubwTu9HlH5LHd1w1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTGuoCs2WHO4MzRcHi6p/mnMsry/Pk1E1urssND/pzw=;
 b=Vq9Z6QthU0mIWIOFHnuoff3lbPQYuEAeXhGNsMOLiJpcziK+KbiBSeLX8rPRb0wNzTydJb+2CgYj/puO3QzW/kZWLCm1VnLmTgjF4GyOA5CTH0Gm/qtWxN8mBMblZyQfsG0lyekeIvtgo2x2YNFxoJIU34NUQfjPNLddT1+uPBSsdNkSRAFRuUQQ0NLdZOFQKfpkA0tvJ/4p0nhTI1IUHTdA7X8NhQlwd+kN1nER+tZHFW/mNtopIgf97szbyrvNQrtIcswJYOrKIZoyCOSCexzvqbxLscqciI3neGSZu/gAdfN71dquQIK5zHGsrPqzT4nNZQvrUKJ/mWlzs+82xA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v3 3/8] xen/vpci: introduce has_vpci_bridge
Thread-Topic: [PATCH v3 3/8] xen/vpci: introduce has_vpci_bridge
Thread-Index: AQHcWJBaPhgfVTH0K0SSYJwd1HNNWw==
Date: Tue, 18 Nov 2025 13:36:33 +0000
Message-ID:
 <207b6aef763d12426385efb925beeebbbb56f6b3.1763462211.git.mykyta_poturai@epam.com>
References: <cover.1763462211.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1763462211.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAXPR03MB7650:EE_
x-ms-office365-filtering-correlation-id: 854ced44-1825-49f9-8720-08de26a77d60
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?r66zxSukQZ67c8+d9nWDC9YLF8bwV3aaThXUCimBJMXIB9qqA/HKCpv+Ri?=
 =?iso-8859-1?Q?jt0/D/l4nC42KaftAcsDq5j6Jp+jVPTfr5KvJ43YfAuEyYUizq8XcuqCCM?=
 =?iso-8859-1?Q?l73Hpjmsp9i1Mw/AuMMpQs+DAGBeXdJO7RWsFmhcYZMeQhcJ3PkoHJWkbE?=
 =?iso-8859-1?Q?ZtUmDnim/u7qMy93vMdzm5dCZVjxwUCbEm+erNIVWbT+Grhg5wDGriZlwE?=
 =?iso-8859-1?Q?Xxv4AMwaih6CG27SHF9bUnJonTt8tuSzlYj8vC4urQ0i96KEQZXcwXojB7?=
 =?iso-8859-1?Q?f/RQ0DHz73l/FR6vyvda1v8xhk4HPl4a770OwH+4NerFyek64m5pzgq1uz?=
 =?iso-8859-1?Q?R/YXtju16LhiU3VIk28jCQZSW2szZA8s8W8lRITiJyI+R4I79rCtnhz9l0?=
 =?iso-8859-1?Q?h/Ugv1fSjgt7DRKtzzgu7N4W5sE0m0JKmBBQCMfsOqnZ7f+KsCZN0K94+X?=
 =?iso-8859-1?Q?pP9zkZ2HxefenCu+OC9pLorEa/c/B4Z1gCbFTgZ+WfkfDxKmHWmKl0knOl?=
 =?iso-8859-1?Q?U1a06whBikH9oQUNIm9A9t6wAXosjKlMVsDQz3L1cTIZyAQ4lGX0tUBPSJ?=
 =?iso-8859-1?Q?yRcHiPCBJAR4Sf75pitq3CtHYzF0/qtmOJUXSQhn5sra4TUZUV1Y4rbHvV?=
 =?iso-8859-1?Q?UVTUPbCVW92VQbhxzQeyQ2xfs7m5l/EMzi025DKH+Ba+G2kHjfJeM4Us8V?=
 =?iso-8859-1?Q?e5jLoWPB17gExBsSlVvXc8Q3m8nhnPGOVpuoEJZXtEYAduzrPQOCAc8HHs?=
 =?iso-8859-1?Q?8mr0odyhbdAwKKXRgKshMW/vBphenzCpoHWhlzhDLCkB01+wOWu4cWB+2z?=
 =?iso-8859-1?Q?hZGvzS9ytN18AfqW8HUU2rpsoQQSU7xy1kl/zEQr1cfGs1qNDnXFDbyWGG?=
 =?iso-8859-1?Q?S/ufST2tbyxpJGAHhhlFhE9kBf/ejELOlvcMyEz3TL2aEcErlHqxzWbUgT?=
 =?iso-8859-1?Q?3kJPDixRTCmsbjmkLYhgJdxxegqG+MF7AGBUZ5bU9rAN12de/s2rK5QMb+?=
 =?iso-8859-1?Q?Mvhe+O+2MXf1YLRMWNnxaFpvtUQCTYV7gtxRKwvB4jnPbjFcZbdek0LkVq?=
 =?iso-8859-1?Q?Qi0U31DcwSo8Wa6IveFxLymlbHr1lKBaeEZbI3idCGTdZgV56cRdVRtBLa?=
 =?iso-8859-1?Q?+6S2rN+9RWDIIXwtefUjOaTn3gYi5fcbnnjZ2qSokYafibZG1uxWH07Mtw?=
 =?iso-8859-1?Q?o1/k7Wy1mwSGAQ8UH7EmSSV1FA8wkLW/tMNl3KRNmUcZ5kpH71m9IciaZy?=
 =?iso-8859-1?Q?8E+A+u+g+8mfFuNbAW6z9kcnu3pobdv2t9uCVf7ZxpU7N04k8OFdyqOCQS?=
 =?iso-8859-1?Q?xVdX1zUUWYwUdzksd+jONdUFYsLfI8lWlcwax9Ai/d/G/wY6DAgQ50uyP5?=
 =?iso-8859-1?Q?rwnNYkmQFzoiue2vK4QZQKwWDV32YyTQFdlPMMnKpbzTaKiJKAII8LDM6L?=
 =?iso-8859-1?Q?gSg40ANG36tJQhRWqbe7BDKoM06N1XJM8N/7r52Vdh0Vj2zWFIDq2H7H0F?=
 =?iso-8859-1?Q?/fwW6x9aSbO1tLW0fURWYgUYy8WJuA4vlcWbIhViROMkOXFoH2rdzcX76c?=
 =?iso-8859-1?Q?Qg3OqbQYtQyfhb1O2FVAimykC4rC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?i65KbYz14aKuLLV2Tp9bhg7Gwx9tJEA7aEeUUeXppFKFAdeyP3iQkf/LRT?=
 =?iso-8859-1?Q?hZKxD1BXlxBizdDU3MTSq7Z68xJuBawdQjKIhiYM/frw1h3iPV6lTMTCpg?=
 =?iso-8859-1?Q?JBsVbgAA3zJ4T5dlMqCJzN84DRkWzYOMCHjCVEmOeYTTX6Bk0Qmo71o7n/?=
 =?iso-8859-1?Q?RjyC0gzl0KqL4yJrVRL59wFmG1XGnKhgYQsdYOxVG5emMYaBduJJSLb7eV?=
 =?iso-8859-1?Q?6FBHnrEUp5/yZXhwfGGze4pNELkVHwawNpg+ubuXD/wZXoQ3ZKEa45EcaN?=
 =?iso-8859-1?Q?OaQDsA2EjUROwBIawmyKmLtB9la8gawwp2koj/2jpsK9e62tq9Qf3TXTE9?=
 =?iso-8859-1?Q?GY/lXIfms1Muc5KDML1mljKBG2AND4i7vuJ9M79k/r8rbWNFliEaPiXKhD?=
 =?iso-8859-1?Q?sKwxohX3qHgd8vZ7lNVn9h0qrdh23f5GMsis84QTn1ZyjnPKeeDvgHKffZ?=
 =?iso-8859-1?Q?uaZseBTIX35A6Rz5E2UKpg4gqsXEdN0X+Vmazis3tXgpFr3mfn0dZMGe04?=
 =?iso-8859-1?Q?3LUSZ2u1nHiNNyu8mUGMHaNfY2Av7W3+k5bDWkC+AowvvBHq7GVjC4ZbS0?=
 =?iso-8859-1?Q?WRe5OfjHLZPMCQOVC4HAOvl7VogsfmFS9crvDA3Mp0s16cA4acZaeHrYFA?=
 =?iso-8859-1?Q?tj2JdInk8nU/hL8lJ5p4bBpS1UaQQBw0FfOnohKi0hXgs+ezjtytkzsuVm?=
 =?iso-8859-1?Q?mUdxg+2mkWGYU/m38qatDvdP7ab5TkNPeqgrmj1XODreeMt/MgjVKeVc5G?=
 =?iso-8859-1?Q?k9uQwdpBCNKlfpkaQndSiob/blsndZ2nhR1rxpxgLhwKbjPxw9bRy7oUlH?=
 =?iso-8859-1?Q?1lbUvSG7Kvvi+WQp8Z6t2Tq/CTUMEyOcfHDNQkfvXnQRcw/bjbDv0ovRZB?=
 =?iso-8859-1?Q?NU3F5Zhr/jSPo07Xz84PhiIiLnWBe1E/h8o6mFt814TSj3hW18pn/YWsS9?=
 =?iso-8859-1?Q?imw4dzuwcK/O7kjlK1YIuxbbSLu1FGbBTILaWotQPORdzUVpXRHkezS0gq?=
 =?iso-8859-1?Q?tJpL7UfVDGD32VCcP9oi5bEQy5oNx377SS8G/CjYCKVvUVubB0Markqqrf?=
 =?iso-8859-1?Q?7yF0Yb10xri0eAOdxeekMG72dCSX/WZP/gUWL16Alp3viFSyzJAgntXfEG?=
 =?iso-8859-1?Q?Z0xE4uLLE4luvyrb/pqcWBIL9/A9uqfo/LMGFTMwv8YIHix9WeMmvWF7Jx?=
 =?iso-8859-1?Q?pzbkuG33aiPyef4hveMdbHOGH9LYajWjxI7hUUBcC7fv3rhL+UjM0PbHLj?=
 =?iso-8859-1?Q?eyQxCWVYZPOOwdc7j7YQISHauevot9pkiGdbj94tY6ZpydaBOLend3wQKY?=
 =?iso-8859-1?Q?cQctGA5jeIXndRgFZeDB5XL/voDCJySGEBuV7CE1ugHJEJGR264d4lwDai?=
 =?iso-8859-1?Q?ypGv1prO8w91K2yK+SYJku/6fhAHOk9L91oz3DADiySatTrEJxxR+Hal9V?=
 =?iso-8859-1?Q?p498WCZ0a27l2HJAi7n9afrXrOUbEETUJta7n7RkABbx5EOtgbm3EQsS+V?=
 =?iso-8859-1?Q?KlfQ8k8ppOaGzExOHeqnRNTjaroBMJgUxWQxjxktNlb9PbRSeAhUrwmZLB?=
 =?iso-8859-1?Q?HVfBB59nVS3M0l7cdezTLzDsjZM/0vKu6WAGOiJgT9g6co9lLVfZPP40K1?=
 =?iso-8859-1?Q?6Laobx1sC2IdBDQIFdYmswaHO9jl/meA+gHCK8JcGNvhu71YldZ17rjQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854ced44-1825-49f9-8720-08de26a77d60
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 13:36:33.7994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TUszDvzFAlQQbsu/YTbekjpVBrHu+Q86XXZQ5K3sq3CNtWt0lRQzrCDF49NzaRXkE/euuAmPy1NNrmBaMzml/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7650

From: Stefano Stabellini <stefano.stabellini@amd.com>

With Dom0 now being able to use a virtual bridge we need a way to
distinguish Dom0 using HW bridghe from Dom0 using virtual bridge.
Introduce a new macro has_vpci_bridge that would determine if a domain
should be treated as using HW bridge (only Dom0 with pci-scan disabled)
or as using a virtual one (all DomUs and Dom0 with pci-scan enabled)

Use the macro in drivers/vpci.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v2->v3:
* s/is_hwdom/is_hw_bridge/

v1->v2:
* simplify definition
---
 xen/arch/arm/include/asm/pci.h |  1 +
 xen/arch/arm/pci/pci.c         |  2 +-
 xen/drivers/vpci/header.c      | 74 +++++++++++++++++-----------------
 xen/drivers/vpci/vpci.c        |  4 +-
 xen/include/xen/vpci.h         |  8 ++++
 5 files changed, 50 insertions(+), 39 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 0680b2f50c..7289f7688b 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -23,6 +23,7 @@
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
=20
 extern bool pci_passthrough_enabled;
+extern bool pci_scan_enabled;
=20
 struct rangeset;
=20
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 49ee003c5e..951639eb3f 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -92,7 +92,7 @@ bool __read_mostly pci_passthrough_enabled;
 boolean_param("pci-passthrough", pci_passthrough_enabled);
=20
 /* By default pci scan is disabled. */
-static __ro_after_init bool pci_scan_enabled;
+__ro_after_init bool pci_scan_enabled;
 boolean_param("pci-scan", pci_scan_enabled);
=20
 static int __init pci_init(void)
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 469f497744..528e8b660b 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -230,7 +230,7 @@ bool vpci_process_pending(struct vcpu *v)
=20
             read_unlock(&v->domain->pci_lock);
=20
-            if ( !is_hardware_domain(v->domain) )
+            if ( has_vpci_bridge(v->domain) )
                 domain_crash(v->domain);
=20
             return false;
@@ -492,7 +492,7 @@ static int modify_bars(const struct pci_dev *pdev, uint=
16_t cmd, bool rom_only)
             }
         }
=20
-        if ( !is_hardware_domain(d) )
+        if ( has_vpci_bridge(d) )
             break;
=20
         d =3D dom_xen;
@@ -522,7 +522,7 @@ static void cf_check cmd_write(
 {
     struct vpci_header *header =3D data;
=20
-    if ( !is_hardware_domain(pdev->domain) )
+    if ( has_vpci_bridge(pdev->domain) )
     {
         const struct vpci *vpci =3D pdev->vpci;
=20
@@ -564,7 +564,7 @@ static void cf_check bar_write(
     struct vpci_bar *bar =3D data;
     bool hi =3D false;
=20
-    ASSERT(is_hardware_domain(pdev->domain));
+    ASSERT(!has_vpci_bridge(pdev->domain));
=20
     if ( bar->type =3D=3D VPCI_BAR_MEM64_HI )
     {
@@ -747,7 +747,7 @@ static int vpci_init_capability_list(struct pci_dev *pd=
ev)
 {
     int rc;
     bool mask_cap_list =3D false;
-    bool is_hwdom =3D is_hardware_domain(pdev->domain);
+    bool is_hw_bridge =3D !has_vpci_bridge(pdev->domain);
=20
     if ( pci_conf_read16(pdev->sbdf, PCI_STATUS) & PCI_STATUS_CAP_LIST )
     {
@@ -758,17 +758,17 @@ static int vpci_init_capability_list(struct pci_dev *=
pdev)
             PCI_CAP_ID_MSIX,
         };
         /*
-         * For dom0, we should expose all capabilities instead of a fixed
+         * For hw bridge, we should expose all capabilities instead of a f=
ixed
          * capabilities array, so setting n to 0 here is to get the next
          * capability position directly in pci_find_next_cap_ttl.
          */
-        const unsigned int n =3D is_hwdom ? 0 : ARRAY_SIZE(supported_caps)=
;
+        const unsigned int n =3D is_hw_bridge ? 0 : ARRAY_SIZE(supported_c=
aps);
=20
         next =3D pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
                                      supported_caps, n, &ttl);
=20
         rc =3D vpci_add_register(pdev->vpci, vpci_read_val,
-                               is_hwdom ? vpci_hw_write8 : NULL,
+                               is_hw_bridge ? vpci_hw_write8 : NULL,
                                PCI_CAPABILITY_LIST, 1,
                                (void *)(uintptr_t)next);
         if ( rc )
@@ -776,7 +776,7 @@ static int vpci_init_capability_list(struct pci_dev *pd=
ev)
=20
         next &=3D ~3;
=20
-        if ( !next && !is_hwdom )
+        if ( !next && !is_hw_bridge )
             /*
              * If we don't have any supported capabilities to expose to th=
e
              * guest, mask the PCI_STATUS_CAP_LIST bit in the status
@@ -792,7 +792,7 @@ static int vpci_init_capability_list(struct pci_dev *pd=
ev)
                                          pos + PCI_CAP_LIST_NEXT,
                                          supported_caps, n, &ttl);
=20
-            if ( !is_hwdom )
+            if ( !is_hw_bridge )
             {
                 rc =3D vpci_add_register(pdev->vpci, vpci_hw_read8, NULL,
                                        pos + PCI_CAP_LIST_ID, 1, NULL);
@@ -801,7 +801,7 @@ static int vpci_init_capability_list(struct pci_dev *pd=
ev)
             }
=20
             rc =3D vpci_add_register(pdev->vpci, vpci_read_val,
-                                   is_hwdom ? vpci_hw_write8 : NULL,
+                                   is_hw_bridge ? vpci_hw_write8 : NULL,
                                    pos + PCI_CAP_LIST_NEXT, 1,
                                    (void *)(uintptr_t)next);
             if ( rc )
@@ -811,8 +811,8 @@ static int vpci_init_capability_list(struct pci_dev *pd=
ev)
         }
     }
=20
-    /* Return early for the hw domain, no masking of PCI_STATUS. */
-    if ( is_hwdom )
+    /* Return early for the hw bridge, no masking of PCI_STATUS. */
+    if ( is_hw_bridge )
         return 0;
=20
     /* Utilize rsvdp_mask to hide PCI_STATUS_CAP_LIST from the guest. */
@@ -829,7 +829,7 @@ static int vpci_init_ext_capability_list(const struct p=
ci_dev *pdev)
 {
     unsigned int pos =3D PCI_CFG_SPACE_SIZE;
=20
-    if ( !is_hardware_domain(pdev->domain) )
+    if ( has_vpci_bridge(pdev->domain) )
         /* Extended capabilities read as zero, write ignore for DomU */
         return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
                                  pos, 4, (void *)0);
@@ -866,7 +866,7 @@ int vpci_init_header(struct pci_dev *pdev)
     struct vpci_header *header =3D &pdev->vpci->header;
     struct vpci_bar *bars =3D header->bars;
     int rc;
-    bool is_hwdom =3D is_hardware_domain(pdev->domain);
+    bool is_hw_bridge =3D !has_vpci_bridge(pdev->domain);
=20
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
=20
@@ -893,15 +893,15 @@ int vpci_init_header(struct pci_dev *pdev)
      * PCI_COMMAND_PARITY, PCI_COMMAND_SERR, and PCI_COMMAND_FAST_BACK.
      */
     rc =3D vpci_add_register_mask(pdev->vpci,
-                                is_hwdom ? vpci_hw_read16 : guest_cmd_read=
,
+                                is_hw_bridge ? vpci_hw_read16 : guest_cmd_=
read,
                                 cmd_write, PCI_COMMAND, 2, header, 0, 0,
-                                is_hwdom ? 0
-                                         : PCI_COMMAND_RSVDP_MASK |
-                                           PCI_COMMAND_IO |
-                                           PCI_COMMAND_PARITY |
-                                           PCI_COMMAND_WAIT |
-                                           PCI_COMMAND_SERR |
-                                           PCI_COMMAND_FAST_BACK,
+                                is_hw_bridge ? 0
+                                             : PCI_COMMAND_RSVDP_MASK |
+                                               PCI_COMMAND_IO |
+                                               PCI_COMMAND_PARITY |
+                                               PCI_COMMAND_WAIT |
+                                               PCI_COMMAND_SERR |
+                                               PCI_COMMAND_FAST_BACK,
                                 0);
     if ( rc )
         return rc;
@@ -925,7 +925,7 @@ int vpci_init_header(struct pci_dev *pdev)
      * start with memory decoding disabled, and modify_bars() will not be =
called
      * at the end of this function.
      */
-    if ( !is_hwdom )
+    if ( !is_hw_bridge )
         cmd &=3D ~(PCI_COMMAND_VGA_PALETTE | PCI_COMMAND_INVALIDATE |
                  PCI_COMMAND_SPECIAL | PCI_COMMAND_MASTER | PCI_COMMAND_ME=
MORY |
                  PCI_COMMAND_IO);
@@ -933,7 +933,7 @@ int vpci_init_header(struct pci_dev *pdev)
     header->guest_cmd =3D cmd;
=20
     /* Disable memory decoding before sizing. */
-    if ( !is_hwdom || (cmd & PCI_COMMAND_MEMORY) )
+    if ( !is_hw_bridge || (cmd & PCI_COMMAND_MEMORY) )
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMOR=
Y);
=20
     for ( i =3D 0; i < num_bars; i++ )
@@ -945,9 +945,10 @@ int vpci_init_header(struct pci_dev *pdev)
         {
             bars[i].type =3D VPCI_BAR_MEM64_HI;
             rc =3D vpci_add_register(pdev->vpci,
-                                   is_hwdom ? vpci_hw_read32
-                                            : guest_mem_bar_read,
-                                   is_hwdom ? bar_write : guest_mem_bar_wr=
ite,
+                                   is_hw_bridge ? vpci_hw_read32
+                                                : guest_mem_bar_read,
+                                   is_hw_bridge ? bar_write
+                                                : guest_mem_bar_write,
                                    reg, 4, &bars[i]);
             if ( rc )
                 goto fail;
@@ -959,7 +960,7 @@ int vpci_init_header(struct pci_dev *pdev)
         if ( (val & PCI_BASE_ADDRESS_SPACE) =3D=3D PCI_BASE_ADDRESS_SPACE_=
IO )
         {
             bars[i].type =3D VPCI_BAR_IO;
-            if ( !IS_ENABLED(CONFIG_X86) && !is_hwdom )
+            if ( !IS_ENABLED(CONFIG_X86) && !is_hw_bridge )
             {
                 rc =3D vpci_add_register(pdev->vpci, vpci_read_val, NULL,
                                        reg, 4, (void *)0);
@@ -988,7 +989,7 @@ int vpci_init_header(struct pci_dev *pdev)
         {
             bars[i].type =3D VPCI_BAR_EMPTY;
=20
-            if ( !is_hwdom )
+            if ( !is_hw_bridge )
             {
                 rc =3D vpci_add_register(pdev->vpci, vpci_read_val, NULL,
                                        reg, 4, (void *)0);
@@ -1005,17 +1006,18 @@ int vpci_init_header(struct pci_dev *pdev)
         bars[i].prefetchable =3D val & PCI_BASE_ADDRESS_MEM_PREFETCH;
=20
         rc =3D vpci_add_register(pdev->vpci,
-                               is_hwdom ? vpci_hw_read32 : guest_mem_bar_r=
ead,
-                               is_hwdom ? bar_write : guest_mem_bar_write,
+                               is_hw_bridge ? vpci_hw_read32
+                                            : guest_mem_bar_read,
+                               is_hw_bridge ? bar_write : guest_mem_bar_wr=
ite,
                                reg, 4, &bars[i]);
         if ( rc )
             goto fail;
     }
=20
     /* Check expansion ROM. */
-    rc =3D is_hwdom ? pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size,
-                                     PCI_BAR_ROM)
-                  : 0;
+    rc =3D is_hw_bridge ? pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &si=
ze,
+                                         PCI_BAR_ROM)
+                      : 0;
     if ( rc > 0 && size )
     {
         struct vpci_bar *rom =3D &header->bars[num_bars];
@@ -1038,7 +1040,7 @@ int vpci_init_header(struct pci_dev *pdev)
                 goto fail;
         }
     }
-    else if ( !is_hwdom )
+    else if ( !is_hw_bridge )
     {
         /* TODO: Check expansion ROM, we do not handle ROM for guests for =
now */
         header->bars[num_bars].type =3D VPCI_BAR_EMPTY;
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 07c7071d0a..8ea89b9805 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -48,7 +48,7 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
=20
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
=20
-    if ( is_hardware_domain(d) )
+    if ( !has_vpci_bridge(d) )
         return 0;
=20
     /*
@@ -429,7 +429,7 @@ static const struct pci_dev *translate_virtual_device(c=
onst struct domain *d,
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
     const struct pci_dev *pdev;
=20
-    ASSERT(!is_hardware_domain(d));
+    ASSERT(has_vpci_bridge(d));
     ASSERT(rw_is_locked(&d->pci_lock));
=20
     for_each_pdev ( d, pdev )
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 9ae75d946a..d4695cb353 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -339,6 +339,14 @@ static inline int __must_check vpci_reset_device(struc=
t pci_dev *pdev)
     return vpci_assign_device(pdev);
 }
=20
+#ifdef CONFIG_ARM
+#include <asm/pci.h>
+
+#define has_vpci_bridge(d) (!is_hardware_domain(d) || pci_scan_enabled)
+#else
+#define has_vpci_bridge(d) (!is_hardware_domain(d))
+#endif
+
 #endif
=20
 /*
--=20
2.51.2

