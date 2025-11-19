Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 817BEC70CF2
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 20:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166354.1492908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnse-0002cU-H2; Wed, 19 Nov 2025 19:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166354.1492908; Wed, 19 Nov 2025 19:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnse-0002ZM-ED; Wed, 19 Nov 2025 19:30:16 +0000
Received: by outflank-mailman (input) for mailman id 1166354;
 Wed, 19 Nov 2025 19:30:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GacY=53=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vLnsd-0002Z9-1M
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 19:30:15 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ab64210-c57e-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 20:30:12 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by DB9PR03MB7690.eurprd03.prod.outlook.com (2603:10a6:10:2c6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 19:30:10 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 19:30:10 +0000
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
X-Inumbo-ID: 2ab64210-c57e-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzFVI1qeLmoUep9G1d3a0+k9reJE0YODhqc/eMCJOaIYeP/MIkjyFGdYqpF9nKApG2pUxbbfXvyA7Sl3uD7b6OOqtmJI0n2wUaj5p0gcF9C7ffb6YdLnha8C+0Pp8t1zgsFE+/XEL7rh9q9XrmLE4S735ZhCOm9QMtGSkmuaVM9oj4s8N4yfrHB0F0WEBC4dPRL8XuLwmBNZ073vsAunaO3VAZ8MSZHiRx8o14oVXrXK5gx11JVebUp7onza1kveJQl8wpzyzBZXIKZ8ODz3Rf3uMseJceybgBwBz6eard7fh4p/yTHeek9AVJlngKCJ9zH52Ws28bxS64ucw+/MEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAU2PDhbuiddf2I/GmozcltWmnhZWuzrgOPvAj3MfzU=;
 b=lP1oYpxKReMPTWUaFLwm7G466UxB/qDQYK6VoBgbN6ABF+vrmTwpBF0jPGQCy3JwKRE3M7V0UOE5J1V3cZB/g3EMLTyH889JvqLnUoUSoIfzIYIjSHLnNoymWTyiVXWLr3m2hROa6SDJbojelUxCJ2/aFeXlcGGJwoX34cwR5h1695o6gIvvHcUOOZz4gdTq4i0kHxBG3zGUPA4vIzze52ITu6lvC1Pj7VVBUW0AR1yaT7ALIMamU2Kq1o5HtJ1UW9HOR3oJ17J6PtVJwz9nKElrQ4Ax6/V7euKWFsIoBJSFxz0OBSgT+SuDbOtdubhYColWw9STwi1W13QrfA3H2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAU2PDhbuiddf2I/GmozcltWmnhZWuzrgOPvAj3MfzU=;
 b=sXINcK/jZtfCr50/9GTz98OQjblXX+sz2vmd4yHxQBPcFZTJJuSgOcev35O9HEiDXanwi5DwOHR5/Lt2hj8thx0Syy9iPZUXiBjFqoqxJelombrMYqO18qSP871b3DPRyCr5Q2kp9NnUaHZVbJOOpfY8uXqbfSqw7azPIzwTGLeGCgSYv1Z3JxxXW1IrcoKqd96LKLUwLCB9iHVmEOMh0bpXXcGHt0S6UU2q3C6yh6A5ICzqg5nxBtt3IJt+9+7wMwciwsmSCzA7ceRyxz4foTfOx802hsUH0HMCcfn3saRdQ8Fuh74dMrEpOzZTaYlYuVoVpvIfwbFJ4EnxcjPFWg==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [XEN][PATCH v2 1/4] x86: hvm: dm: factor out compat code under ifdefs
Thread-Topic: [XEN][PATCH v2 1/4] x86: hvm: dm: factor out compat code under
 ifdefs
Thread-Index: AQHcWYrqEylB9yFxC0Ctjtrr94qNKw==
Date: Wed, 19 Nov 2025 19:30:08 +0000
Message-ID: <20251119192916.1009549-2-grygorii_strashko@epam.com>
References: <20251119192916.1009549-1-grygorii_strashko@epam.com>
In-Reply-To: <20251119192916.1009549-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB4594:EE_|DB9PR03MB7690:EE_
x-ms-office365-filtering-correlation-id: 2a4e4612-cc18-4637-4a30-08de27a20db2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?cZVXkW1svFTsFBRXmH9NjcLQlqoygso4fByRIl/0WeVRqMReNUKm+Ih2J1?=
 =?iso-8859-1?Q?6ZZhQqnYivPJMNkLXpb0wkaC78ptSJqx2mJvBUxD/ZIzhQ2RMvD7hwLvIZ?=
 =?iso-8859-1?Q?pI1PeLDKIjp9L3MLXeLkL4zv0+tP4bD3cms+DwwCCAIbqQcDX18q84fjdR?=
 =?iso-8859-1?Q?YBkAW41yt2W62f/EmyGX48AKSB6Vuiv/dmukWeCiUsnJbpNk/t7yXrj6nX?=
 =?iso-8859-1?Q?O1WVwICPytH5E+PHYAgELSypvoQhu+2gAHVrnTdmLjZITIQlkMyfyTUvaL?=
 =?iso-8859-1?Q?byl4HkCuN4LKaeC/VMjyyIb9Yq5CD9EhC/KLCWqdjkOImCOIly5CBzNbwd?=
 =?iso-8859-1?Q?qI3xlp51au4Rl3mzuu+pM0MkBEAvqB0pkIVLp0UonTGKMsbvD7d+1Xt819?=
 =?iso-8859-1?Q?ti+ToVfGyX2R/AkLutqe4Cu4KWQWVpl0/BryzNSNDqKnvqBhLiGDSOqZAA?=
 =?iso-8859-1?Q?NqvAIqT+j50AmBlNdImRrlQXTtxAQOLTpzK5BZ6KXWYvD/EyRBdMF4vS0m?=
 =?iso-8859-1?Q?IuV6/SW7xPPGZ+kcdlRykfb98GpHFAJHEPodcSdKfis1e8oSLTpfyooXo+?=
 =?iso-8859-1?Q?YjKwY3GglU2C4QJUmNR4TV8H0W3ePTIUB08yqv235vY6xuSpuOrW2UYRxi?=
 =?iso-8859-1?Q?vbD7+qz8se+Z365v+RWk/ybrj3APlKpugC4i2v3QWU2K926qC6EEk456bc?=
 =?iso-8859-1?Q?rj1bGEUe+epCt7mEdy5lfItQBofL+I3vvK0WdqE4+jregBivgDfvSiM4kS?=
 =?iso-8859-1?Q?d0oJgtwYVtfWplA4+iMXBvRtM7bjYoieQqJX9y/6OpD6Ni4+lNbSNJ5om6?=
 =?iso-8859-1?Q?LgN2vfeVwNly/OcpV0ue9FDjxeF3ZQJMI8fvEn/7Ctvqtw6tbJS5XNk1T/?=
 =?iso-8859-1?Q?oTkqLo0gb8qvF9o3t1/7Vv34KR1COs7N27GeuAu6lu7ErV1bm0x3fFwBrV?=
 =?iso-8859-1?Q?srRt3DKsbINw7RJpX8fO8IN2NBqaa4/QutMPDkjza21WKDekPRI07PfPHS?=
 =?iso-8859-1?Q?9uGYF+IKAqnmujlJbxWX1dLIO+c+fmH6lePXU23T+mkUhzFA6pRDaCHV7I?=
 =?iso-8859-1?Q?2Yz9KtQHSU6B7bpnMaJ1ULYkSSevmj/rl6KX6e95HCaM7rwbYMuze1Y+yO?=
 =?iso-8859-1?Q?DyehbG2Fgh5ZIEY2SQ7C5whQy5ZXGqkNt43vugxyc1gcW/nnkXnTAOLBTT?=
 =?iso-8859-1?Q?BCXlXvQVPdHq3kWwRfA5b7j1Sha85WBYGXJt91E5ZShfiqsf0GIW6TpaG/?=
 =?iso-8859-1?Q?mi0WaAd7UfVjxtC5Kx0kZWCX77cR9AeODAcH1KzL8pf1iAd1Aq2kTdAnFD?=
 =?iso-8859-1?Q?/JklylDOqegBCFNfnaBmv/ZuExB/BHQ+xyyyf/bgGDsqJnmAxt4FxxVX+V?=
 =?iso-8859-1?Q?RacjjWjiNPxkPyPGRdYUM7IXO1XruNUhVaW2LUgpjvv4pCl5N8C3S9eW3U?=
 =?iso-8859-1?Q?abYKOEIAD4nwOD1nQdp/AxCA+m+KazHXrW3/ciq1JzsD2K/bUbvDuKu1fM?=
 =?iso-8859-1?Q?+gTDkqtNSaQ0KbuOylGniP/UobDSM/UkiCLfrGaqY1wfPvk7yCnlIowDjH?=
 =?iso-8859-1?Q?FSjkBxNFMgmwTlOk+rPP3lzfzY9m?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LFlY5jU1GQpFoE7f+6oS67pI9UotOEQn0GsVeyZ1RMuOnYwk9oLVwynYHz?=
 =?iso-8859-1?Q?E4j178YtEgXryvaBBvn4QyI6lmMcfq64ORcspMDydSrVIt+xAyiCW+4rO9?=
 =?iso-8859-1?Q?HKSFCl2t3fV/44Q8Pa27LABErrMmmhsz6a6wv5nfSq857cR10xSl+SR23S?=
 =?iso-8859-1?Q?n0Y1F0kwq3aCPW+Yma2v4G2MwP1tzYt1AwySaC//sZIoUMloA30QEuGjx/?=
 =?iso-8859-1?Q?xaEmbHLZdKxtHM5UMMMHO0ZL66RNq9x96xjatDIkdNpfrNT+6gFMBABGVw?=
 =?iso-8859-1?Q?s76kXU9zqADqFY8Xy5wZT7XCZGf2EqJxNLNvY3f/uXkqcQ/ZZZip6cerLQ?=
 =?iso-8859-1?Q?kGP9wYCUcpdhKrBSbrusP1xFHGe7oAEAdSKlEVjNMgm5ThR8wWmGze/zoz?=
 =?iso-8859-1?Q?81LGyyc+2c4Pt9ZyRgWpEMsyWTE0Lxu2X2CK/NGkzQqI3P5/NVzB23UgtD?=
 =?iso-8859-1?Q?C1LJ7PUyGQAg6G2W3b1bPx76kyvDWJKCS0oxx0XjPl8wND9WN3jenTRwfj?=
 =?iso-8859-1?Q?4GijYRibMaqR0fCsxgbZAEchHVGr1LmNBxIh8yeuHSL5sGlNTVU/HnOUjI?=
 =?iso-8859-1?Q?vLNnvRfkG+Z/Jl7e788DfR6vG9BkRGhRBWZFqQg3WxRueBwhrYxqpzwgVI?=
 =?iso-8859-1?Q?kcBGcejicc+QEz/dhDAB+J9MpLOvBb19WvgfOkkD3Di4hCoQ19qlk5skC1?=
 =?iso-8859-1?Q?f3EZgi0Xlpyk8wsInTq8GlRPUeOucS3z10UDymMlDBPPIFOgQ9sPR5cWTO?=
 =?iso-8859-1?Q?AvOwec5UXY8qzPuXZMtJuKxSuTwrPkJ2jM70ST44OxXmKQQA+M2TYOeh+j?=
 =?iso-8859-1?Q?zMjQHDJs+BUIchCpUUQyL5BHWdDbKvYT5+jc4gpzATSldb7GIq6YA8KKKB?=
 =?iso-8859-1?Q?u2l/VkXIDARJMCUexWoSuKV5BZMyvJEseHPOBr6F4MTvxjhQjBxib2oNus?=
 =?iso-8859-1?Q?9HOgTTTiZyzLZJKyma3sZnZdrJkIfTd/5PGV+vhaEZsOwkV8JNF6Hhm3GD?=
 =?iso-8859-1?Q?PFjLF26dsswJq2DcHzxCtKqlt6W+y9/oKuPWtx7W9ctATAlYPRCwBZ/8SY?=
 =?iso-8859-1?Q?mu/+LxVU6+VNK0IxQAJ458rWc5cm501TjQzWoCW0+Ckrnojk+txcmbqBA1?=
 =?iso-8859-1?Q?oJBJ0aQn1mNJEg0YU6nKH5dYsZsrXyb/DwOwaGN8ko4FMeyudtCSsfDBgP?=
 =?iso-8859-1?Q?FVNY+tnieJAeIrtphhCMJlX3Cssy9WNQMf09Tq3nFjdPzFA/Cg1ly0zMGk?=
 =?iso-8859-1?Q?QfHuiptMBjA3lzmga9vLSvSu2F1hlg05hqC/P/R90lazOJATpW3o0Tb/XR?=
 =?iso-8859-1?Q?s+6mVaGOkqqX/rgLl/ZSOXTFLzb45ISa7poHZTko6I+lpR9IBiDtXusjCx?=
 =?iso-8859-1?Q?7gRBzErl8MnMidv9g1YI0QKBronnQs6R8gb8+EZLMJaZGWa2UflUgokchK?=
 =?iso-8859-1?Q?JXaCFyZ1GE1XhFNvrQwYHcJhoPqTIDBR5eV7fFKuMCKo6HGJFsxrI1qOWO?=
 =?iso-8859-1?Q?mJv4w24vEGSiUdTm4+7194NsFoWJcBh/5C34reC1p0t3+doBQgyvhozkPO?=
 =?iso-8859-1?Q?XC099lyTu6FTNI39eBGLlb7cRZ+3N04cJ3fr3q+J/W1qdfEcbojPD0Gau+?=
 =?iso-8859-1?Q?ZI+RBK4ufO3JLcaS9ZjNURc7IvOzpREgUuE95fQcUhmrnCUEvBdCeujg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a4e4612-cc18-4637-4a30-08de27a20db2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 19:30:09.0086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UYroOkb4L3OIIOq6tlPUwarGDgJ6m8J66kzL9jLwUtZzfR07SNctbKR9YPld6cTT5YqIrfSDQrC4tykCjRjm9rlrhR9LUwgeg+PGLliEcdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7690

From: Grygorii Strashko <grygorii_strashko@epam.com>

Factor out COMPAT HVM DM code under ifdefs in preparation for making HVM
COMPAT code optional.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
changes in v2:
 - no changes

 xen/arch/x86/hvm/dm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index 3b53471af0d9..f6dd1634428a 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -623,6 +623,7 @@ int dm_op(const struct dmop_args *op_args)
     return rc;
 }
=20
+#ifdef CONFIG_COMPAT
 #include <compat/hvm/dm_op.h>
=20
 CHECK_dm_op_create_ioreq_server;
@@ -680,6 +681,7 @@ int compat_dm_op(
=20
     return rc;
 }
+#endif /* CONFIG_COMPAT */
=20
 /*
  * Local variables:
--=20
2.34.1

