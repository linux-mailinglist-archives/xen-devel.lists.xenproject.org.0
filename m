Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C960C5EB70
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 19:02:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162818.1490327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJy79-0002OL-7D; Fri, 14 Nov 2025 18:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162818.1490327; Fri, 14 Nov 2025 18:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJy79-0002MW-4P; Fri, 14 Nov 2025 18:01:39 +0000
Received: by outflank-mailman (input) for mailman id 1162818;
 Fri, 14 Nov 2025 18:01:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lTzj=5W=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vJy78-0002MP-66
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 18:01:38 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f532241f-c183-11f0-980a-7dc792cee155;
 Fri, 14 Nov 2025 19:01:35 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB7694.eurprd03.prod.outlook.com (2603:10a6:20b:41e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 18:01:32 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 18:01:32 +0000
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
X-Inumbo-ID: f532241f-c183-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPxR75x713JzE5IC0YAi+azhGpF6bzT9Hq0DcYEg7pg/QJhP1P6UPzA6w83AKUVJuHihFzRsGoGG7Z/3o6zB+VbJLH/tXHyDVrLBa7V4/K52g63Mv9OMAbc0+daiADb4MUlnLd2WkZmB+9DEXoiGksZRGKxA6x45GwldAktVzqF9iu8uULmIwXXzHiJlCIqGhQgUjQAcA+wCqpTAuy4s2IhKYNvUs8ICQriSVkz94/NjxXa/AVGpGiyjZGoeQs8DhUlp/qqEJCGvahpdf7zwU6gTeViZzBtiG4SpcPm+pAc/hcrxNBH1CA+LVokw/wSqZ4DIjSp1c8St0zvDJRc+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiNGl3ZXa6y3CFfQsH463W3pcuo8YvXy7QmlmKcHFuI=;
 b=Yof2g1kwB+thVdlZnXzCh9dc1vyTsNH1dyX1FjVCg7XFqqWYKDQS1uy301Yl9AJa3r2s8U+cY0xIms7XUAVZHci+qsIjBnlcFxVY9vQH/Z4dxxqvcf66a5+UjvBEGtCn52Gcw7511wggKTjOmumlFm2QGQx8p+m6Cibl+LTBFJHVP/0/zftXNJrmofra+ihm5X1azKAduUfROpxl7hzzMm/bnLYHzOI/rZJFdhinKwjGPwiU3ecHApJKw0YeXSz1+wwro2dVuuiNE1+h+aM3HFfj+1C0PfxtSjM7hmYc25x4oPiKN3mzwPn3IEMUt4yWEwiT4HFXS82jrUyGcZXhVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiNGl3ZXa6y3CFfQsH463W3pcuo8YvXy7QmlmKcHFuI=;
 b=AF9ytWIeZ7SOlxzBsCcSUcTXmAQg/15j2CN9Awveo1s3phKGamvx95tpFai4ia+XrnU8cyZ4X5zfJVmkzivs2b94a45OmQOcOadz17eV5jFS8SO+egsdXMuf3vGXEwy+PjmoBgPi5T7k7KjIJzIxuL6tcY8hU3LgS69ldmbzmcy/TStIaqINe8yqYD/bBu4WQ4/HRGetgKXo0ZqvLSdujpGAqOSqbJAtYgZBV/izWKRgp3qLRcdJkMBCFnOUKtmig7zQ0nJ49HDLjHktTLMq+LXT/lkrpsNbQcZbI8quR1oYo7i0gypci2pK4ypTWGr/O2ro02hpUaVCad95TmInjQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [XEN][PATCH] common/libfdt: optimize usage
Thread-Topic: [XEN][PATCH] common/libfdt: optimize usage
Thread-Index: AQHcVZC1OaGU/KuFYUqRuKRHxQFN9g==
Date: Fri, 14 Nov 2025 18:01:32 +0000
Message-ID: <20251114180130.346755-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AM9PR03MB7694:EE_
x-ms-office365-filtering-correlation-id: 993171f7-f83c-44cd-aa14-08de23a7d821
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?mgORjBjI/m6FfLi7juyqXNS6vKrt1a42LMxw50rK3ZPrOHKPMKt0YbLbi+?=
 =?iso-8859-1?Q?/UwA+Y1Y1XRvBCAzGYT2HYYyBuVnhLdDRHdnnqFdG6ZFmJ1r8h6wcz1PCf?=
 =?iso-8859-1?Q?rUlzOKpv1uQP35TdUkZiNyWXGU4QNTyIkOAgGrZk9AM0wnKg5cQ9frVNaO?=
 =?iso-8859-1?Q?s4oozrXMghNQ9utA4d5LDQZJ+7mVQG7f9QM83YsUBCjk9zl5uOXYUqre/w?=
 =?iso-8859-1?Q?zuAB4QKvH3sKAR6EwL1wAtgKaliVs0/+pgP97aqgmaEthyGV/ALtRCkPCb?=
 =?iso-8859-1?Q?n5m4YhAMNRe6FYoIAtaU3kiwO5GHMy1B3oXmrxyoBxQROvJYuiSxlLrJay?=
 =?iso-8859-1?Q?dTYJt3l/q30agy0JvTuC4tsK89ELF+9yzTCP+aJrBdc0tCUm6+Q9Q92aS1?=
 =?iso-8859-1?Q?Uw/QWsaeEFbZMSZ12D0qtl8UjGblhjQC/N4Uk5fA72F2cr8I+f+27qDYGg?=
 =?iso-8859-1?Q?LKt9Cycm142B5VtctjtjmT1XAHV7EEVRgwWcbYz//rDYkrpsGFJiDjPsw0?=
 =?iso-8859-1?Q?qO2x30a4mTsW4eJDGbodjW+JBQuqGW84Z478gM36jh4kEVPgCeYwwFoxY3?=
 =?iso-8859-1?Q?EXyu5piNuMcom2s3YqcwCnlNJ4x6aaW0YSgx3NWW71lkI7pwQ61IT+nR8d?=
 =?iso-8859-1?Q?TitSVLgJdZe/faek88RdNoAjpPCVc7wqklXI8d95FWIBDvxHI7nPdUhHj7?=
 =?iso-8859-1?Q?MxwQNYM+x9nk0tUC9RKGGnk/o2q1SodAZQBNrjc7TuXB+LHlK6J+2RmR3V?=
 =?iso-8859-1?Q?kNhXpfSebE6zR0nfRvj9aS+kqrO7YgjfWLR8sS/cRJ3RC+JH3Enxvqh72K?=
 =?iso-8859-1?Q?UIiY5ICXIQqccsjZPCcL6yEb9rSsx6B43cSf0Qy4wSbxQ9oKY/E2DFoMdw?=
 =?iso-8859-1?Q?lZYrM136brdIYDvVg8sJjViL5KTLbH96BH90EqutOgSQbWfchcDQjlAvvC?=
 =?iso-8859-1?Q?GTwSXt6xvDr0TIMynH4r7/zsPPoP/z2S93fZ8BUDO0ogy04u0Q447Cx3tI?=
 =?iso-8859-1?Q?zt1JyXwvhZn4m/FpIJnlcBKSiscNg6oV8G7JrQAOIGRRes1lmACb5QJvHo?=
 =?iso-8859-1?Q?MrzIIhvPWfmZNQGrIK721cqoifkPtCPlb/F1yiu3DhvDbTZtOruUUILFBG?=
 =?iso-8859-1?Q?YQ2hxOe6HZadwkpMj+NE8GlCYqtijQJbMcZtnJSiWFdjdwkZrQiJHMzR2a?=
 =?iso-8859-1?Q?wu+j4QGsmZRzb55x1mgn1+f5aJScm359w3Q/EMswjsLYT0HoL2vNEb6ntH?=
 =?iso-8859-1?Q?QF6QJ8YxQf5TP7ocYyILP/ZtT5SWbsawv/rndncnphv10kO0tOLHyTb2UC?=
 =?iso-8859-1?Q?H2/zG7OiBhcRAOKwFDLJ6/+1+ZHzCV1zIGlpEdpj2JOtPe4doV8WSHC3Mr?=
 =?iso-8859-1?Q?EB6URb+98/Pg4ajWN7O064laMz+orwDe7CG/8MNwEIYKux8RvNizPFnbe1?=
 =?iso-8859-1?Q?p/4Lx5G7GgSoJpjWpDWCipTFdmHdoZRWZVVFwCT+MeF4oMiUWWALc06Yoa?=
 =?iso-8859-1?Q?aI1cR4wrCckAcW918R1gqv+j5Kyq2CrLz5Xg4XYiitEbvEESTYP+Iv/vde?=
 =?iso-8859-1?Q?nuKiOB1MagxgtszWjmHNtY+YJAlB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?b1BIEbNHfLmDEzPYgRC8ERu03UreKjHp5kmpuFgolgeKjjhfHIubmG+aKi?=
 =?iso-8859-1?Q?uDMrWqa3xCvh18lOh/cjst51ehDyIXOiiIIMTi5bA5GUOIl8vwy2k5SovF?=
 =?iso-8859-1?Q?aCRnOYt54Vc79ztaG1isNBVaKE0bR80SAts9q5NWFpq0hnb+4EhhpsfKUQ?=
 =?iso-8859-1?Q?ozfiwNzVgEr24qvJOJsUnUw1zrVs3vUhJw5vjY8JrvfM+MPvZur3LHsNUt?=
 =?iso-8859-1?Q?RCN4jVubP1GTbt8jIMHo1w7e4cx8q1qNvxjvR7Y2AoVyDD2ZOTZa3OInjP?=
 =?iso-8859-1?Q?rRKeJVx1yI+w83ZVpPObvHfSD+NGRsViNUM3V7rK+1eN1CK0D3JUVQwFsW?=
 =?iso-8859-1?Q?s5CIMGUHxIqzvFdtxb5s/C/seYGarjR6PMKu2DNMFZXaQqQiUtUjOPJd7d?=
 =?iso-8859-1?Q?5R8phjezP51Lv/PPMymVeLv+VkPvMJmiSHEkQj+mPE1ABeAkrkl1dESFCo?=
 =?iso-8859-1?Q?X0Sf0h3pQ46LePweB/vrhGi+JzZmry2AChOtzWH7kXnlYn29dX0aS+LHz9?=
 =?iso-8859-1?Q?EHTID2c7qHyyoL/IK6pGJe5phbzyNpl0bEDgFVvEjVRFnop5OKphvkP1GZ?=
 =?iso-8859-1?Q?SPfB5DsablNexySkd4k50ipKizvsJRM0z4JTsiU+ac20m/FsfsN3CPtSA0?=
 =?iso-8859-1?Q?CLCgUk5pxqrzfom3QaySIthxwoIXwkk/ZGAnOBgkfMcZHYUNt0d2XSe12h?=
 =?iso-8859-1?Q?RKdo9y2ZUHAqOhmG5mqi4UuPCRVl03AIWQ8ZTvovY4LXJiveqXH8THC0TM?=
 =?iso-8859-1?Q?s0XxTouVYT6yZaKRBcV3gc/wEAya6w9w9zkFgPdhJu6hQRC93OeDOcmFAT?=
 =?iso-8859-1?Q?jqlFxapaslDIO/jIpVkiwVXVEVf/+sWL4eERj5qsWt7TU6WmsjvVVKT/tn?=
 =?iso-8859-1?Q?Ootzp/Qj4Q4w1cIW5E7FLhNT8O9SnJA3tp+gd37pjjldJ/sm9wT2V4ok4f?=
 =?iso-8859-1?Q?avchy8HXHpvIlfkNKkgFtn214AfzPQXJaOKoU3H5ViVodydWEWkwCuoW5r?=
 =?iso-8859-1?Q?B56oV1liILbRtpxVTbragDIqmstsklMXmG7FdNnpZs/MG85jY9lCKoLPNG?=
 =?iso-8859-1?Q?Sj6qoB6M+ai8z7HmIYg8q8kDe4Uk1JwRikvAnEv+OBs2i7lnrNjOoFWWDv?=
 =?iso-8859-1?Q?6/p7uac6ZgwlLdl+cw4hiA1QRBfx0RtgdGD6XhWfnwRJvzx0NV/lCIK5PA?=
 =?iso-8859-1?Q?Na6jvsEuYUVqxkcnnAdWYjEnsBnA57Svu/yV5Tx/PAaIxWDk+VcdAXDkKx?=
 =?iso-8859-1?Q?nMpt2mPrC4rwnvXNelV35AEUPqF5DAcmAZa1lZSD9bVZXLYkQQf+1mgxLj?=
 =?iso-8859-1?Q?0NvgItztoQTTj2jbSa8c5Ip4+w5PXawb/Hpr9xl72A2Zb/FIcDqX9Qx8U8?=
 =?iso-8859-1?Q?v2pZTIvwfbkwyifWva1ddONIWInjurWMrMFW3GS1px7LrbSk9jo41fyvAl?=
 =?iso-8859-1?Q?PHBmM564l3Rmvrxz6DJ1348lwuldCxklYZGUOyXFeSME8Iq69s3Sdstp6y?=
 =?iso-8859-1?Q?4BFYPUQCQ9pW3mL5c+oWK7r/Ww3nPD4jXkje8+IR2+2DJXK+J8p3F0YucQ?=
 =?iso-8859-1?Q?wXhnPBpb7Ow9yQ8oAObFZDwbAikuUy5jCzXXhY/VA/8euaAG36spv6tQnR?=
 =?iso-8859-1?Q?xbD1IvSj/WYqqYxJLHh00m3q1jVM4XnwWZ+2FaKurUCjgdvI1cpKhP/Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 993171f7-f83c-44cd-aa14-08de23a7d821
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 18:01:32.5738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pk1rWvhrMFSh/xGHp0/DkS7RTdK+tx7N2uxgTUl+K1WIX4ox51b2QWW/Dba8JVqA/OnkxvKOHkKPXAYA0hckaWecsrvkB0P8/SfpDSpivu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7694

From: Grygorii Strashko <grygorii_strashko@epam.com>

Now all libfdt features are built-it unconditionally, but...

X86: The libfdt is used on x86 only to parse Hyperlaunch/dom0less Xen
nodes, so full libfdt is not needed in this case and minimal, RO
configuration can be used.

ARM - situation is more complicated:
1) ARM reads Host DT (fdt.c RO)
2) ARM reads passthrough DT (RO)
3) ARM generates dom0/hwdom DT from Host DT (there is a mix of WIP and SW A=
PIs)
4) ARM generates domU DT (there is a mix of WIP and SW APIs)
4) With EFI enabled - ARM needs RW API and fdt_empty_tree
5) With CONFIG_OVERLAY_DTB - ARM needs RW and fdt_overlay API

Hence, add possibility for optimizing libfdt usage by introducing separate
Kconfig options for each libfdt feature and select them where needed.

Following libfdt modules are not used after this change:
 Makefile.libfdt
 fdt_addresses.c
 fdt_strerror.c
 fdt_check.c

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
Not sure about using DOMAIN_BUILD_HELPERS for selecting=20
LIBFDT features, as DOMAIN_BUILD_HELPERS doesn't exactly
says that domain's DT will be generated when selected.

 xen/arch/arm/Kconfig       |  4 ++++
 xen/common/Kconfig         |  4 ++++
 xen/common/libfdt/Kconfig  | 14 ++++++++++++++
 xen/common/libfdt/Makefile | 12 +++++++++---
 4 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 xen/common/libfdt/Kconfig

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index cf6af68299f6..f10cd3d7effc 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -111,6 +111,8 @@ config ARM_EFI
 	bool "UEFI boot service support"
 	depends on ARM_64 && !MPU
 	default y
+	select LIBFDT_RW
+	select LIBFDT_EMPTY_TREE
 	help
 	  This option provides support for boot services through
 	  UEFI firmware. A UEFI stub is provided to allow Xen to
@@ -149,6 +151,8 @@ config HAS_ITS
 config OVERLAY_DTB
 	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
 	depends on SYSCTL
+	select LIBFDT_RW
+	select LIBFDT_OVERLAY
 	help
 	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
=20
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 401d5046f6f5..256aff269c3b 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -28,6 +28,8 @@ config DOM0LESS_BOOT
=20
 config DOMAIN_BUILD_HELPERS
 	bool
+	select LIBFDT_WIP
+	select LIBFDT_SW
=20
 config GRANT_TABLE
 	bool "Grant table support" if EXPERT
@@ -680,4 +682,6 @@ config PM_STATS
 	  Enable collection of performance management statistics to aid in
 	  analyzing and tuning power/performance characteristics of the system
=20
+source "common/libfdt/Kconfig"
+
 endmenu
diff --git a/xen/common/libfdt/Kconfig b/xen/common/libfdt/Kconfig
new file mode 100644
index 000000000000..3abd904b2969
--- /dev/null
+++ b/xen/common/libfdt/Kconfig
@@ -0,0 +1,14 @@
+config LIBFDT_WIP
+	bool
+
+config LIBFDT_SW
+    bool
+
+config LIBFDT_RW
+    bool
+
+config LIBFDT_EMPTY_TREE
+    bool
+
+config LIBFDT_OVERLAY
+    bool
diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index 6ce679f98f47..c832d1849a5c 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -1,7 +1,13 @@
-include $(src)/Makefile.libfdt
=20
 SECTIONS :=3D text data $(SPECIAL_DATA_SECTIONS)
=20
+obj-libfdt-y :=3D fdt.o fdt_ro.o
+obj-libfdt-$(CONFIG_LIBFDT_WIP) +=3D fdt_wip.o
+obj-libfdt-$(CONFIG_LIBFDT_SW) +=3D fdt_sw.o
+obj-libfdt-$(CONFIG_LIBFDT_RW) +=3D fdt_rw.o
+obj-libfdt-$(CONFIG_LIBFDT_EMPTY_TREE) +=3D fdt_empty_tree.o
+obj-libfdt-$(CONFIG_LIBFDT_OVERLAY) +=3D fdt_overlay.o
+
 # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during run=
time.
 ifneq ($(CONFIG_OVERLAY_DTB),y)
 OBJCOPYFLAGS :=3D $(foreach s,$(SECTIONS),--rename-section .$(s)=3D.init.$=
(s))
@@ -15,7 +21,7 @@ CFLAGS-y +=3D -I$(srctree)/include/xen/libfdt/
 $(obj)/libfdt.o: $(obj)/libfdt-temp.o FORCE
 	$(call if_changed,objcopy)
=20
-$(obj)/libfdt-temp.o: $(addprefix $(obj)/,$(LIBFDT_OBJS)) FORCE
+$(obj)/libfdt-temp.o: $(addprefix $(obj)/,$(obj-libfdt-y)) FORCE
 	$(call if_changed,ld)
=20
-targets +=3D libfdt-temp.o $(LIBFDT_OBJS)
+targets +=3D libfdt-temp.o $(obj-libfdt-y)
--=20
2.34.1

