Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFA1B0F633
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054320.1423086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueatE-0001sv-Ma; Wed, 23 Jul 2025 14:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054320.1423086; Wed, 23 Jul 2025 14:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueatE-0001q4-JJ; Wed, 23 Jul 2025 14:56:16 +0000
Received: by outflank-mailman (input) for mailman id 1054320;
 Wed, 23 Jul 2025 14:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoQP=2E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ueatD-0001px-3C
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:56:15 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cd68a32-67d5-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 16:56:12 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS4PR03MB8256.eurprd03.prod.outlook.com (2603:10a6:20b:4ff::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Wed, 23 Jul
 2025 14:56:10 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 14:56:10 +0000
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
X-Inumbo-ID: 2cd68a32-67d5-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBVNiwLBh/66FlaKX7P5BWt7Yq+VjAqbQNwMLb6zyQ9orDrJrAAH0CiA2qsMtopdRLZs1rdxp97ZIdgjtwpeKwjnYBm/8y0f4c5ORF+EgH0D4ImKjASUSL3Ir9QTnfJM+KdzwtSWX4NNdegdDJiqHpSwkMKGdmZBWTWG7wkDkfJ1Ru2y+NU85hzun52Zrg71e/vCxAtm6td2WMSqy5ft7Ra33aJsocpM3WebWl1QhUXCm5cG51UWotkDtep/PAPB4VNF5DDXukAQZn57TPqPadIlAfyQ1CkH3YSTXc9UTJHO55zeciMq5Ce+n/qZcskeEapL2RVmdkPSXjnALaBN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcpL3q8SFF8bes0QZsZbYMcybFEMt9dF+a40HRtEXeE=;
 b=ANwWRVqhkE1CqE9PmV6dFQdsr+4fGVEgB5vDFywDcFX5tWjihxOWt/7FaBRd8LUFo5zAfZ3OVP2gxUgsCzGfhJeKtn/to9O5k2iZPLmRhtTujRsI/yKzzELsrEm/MPXvCW3z7d/sqR1uoFCEFPPgAQAFUnemQXCoh23E2toeiJhs+hxamQQcpgu+i1k6Mvh6mYUKQtc6OKDbWFa4FQLvlnte3JzWz+upk1Hi/q/Dxo6J/N+pQ6zUEtrFzkQbjMkag9A8zLIG2wn9rUiG5QkoyK38eCOQx/Rg22WRH414dGsvJLfwvNAc77HItIEkdLl/TMOx+9yzhw5inQXzcUNh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcpL3q8SFF8bes0QZsZbYMcybFEMt9dF+a40HRtEXeE=;
 b=gynJD2IBw2pRnC9Y0SC0DGDLTQb2FirJPgB+M7uu0NoFj5i6C/al3G/9rxtQJwETQ9FFKbs8K+B0i7TJQFKdiJZ0fqF3kHPKZrT6hvkVyoZonNNOPlhRhCcPSquGdjLu4BPJUBSLXRL3CBsaPSVlK7lLPHV3oWMqJAROgalCnVIGGkTxYT1shhsApBerbK3D2Y3aTHk+DkbCZmtft8SPMijCxV++FJt0tlqp2PJgFbsTR2EZayO+j9yTOSF/7PTamtIJeveKKEIPkQXWMdincDqxunbq96zoK0t945y+fNMJ+TTSUBKUr2VpNXvQGEYI7a7qhK5V6uU8B+1/kilsdg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation/eclair: tag guidelines D4.7, R21.18, R21.20 as
 clean
Thread-Topic: [PATCH] automation/eclair: tag guidelines D4.7, R21.18, R21.20
 as clean
Thread-Index: AQHb++HtBXKg7ZSI+06/W6//RSbTLA==
Date: Wed, 23 Jul 2025 14:56:10 +0000
Message-ID:
 <9045a2e3cae57995bb279f66de19e9a6beed3a5b.1753277988.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS4PR03MB8256:EE_
x-ms-office365-filtering-correlation-id: 818d1b9f-b256-469a-aa8b-08ddc9f90fca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?BpqbXJwS/lD1aQennqkB2Tjg+2XB6MdxTyi3uQEQEHmaM9n6pdPwmzSH3/?=
 =?iso-8859-1?Q?JHW0jFUeFIGqecamFAXaMt/E/qsUhf+qxJ1TXt/V3zS3/OePZNKDOhvxCS?=
 =?iso-8859-1?Q?0WTqYZKH0it2Z1gXn7g7+Zc6q1OAqAa47rIl+fgQ+Msn1S5R4s4a/Wxez9?=
 =?iso-8859-1?Q?syD6dan2Z6XcI+rXdJMCcsr3M6Xb8D9iSIR/xQ5o37cy2ce7bWiYyfJP37?=
 =?iso-8859-1?Q?gA3t23kI4YqTcBHh25Ugp6vxUgUhkRgQcMUDf4pvkmKafSnuWQIl6zKWfy?=
 =?iso-8859-1?Q?qnM1wXT8CPuPBiQKE56s0uVYSpRXqjUH41jYcJRgt/Skc9JNFfQn+V8spU?=
 =?iso-8859-1?Q?0K0oYJ6odyNM21VR8BVkZ0nSMjaeWe9tyc84rzjgIA6ARE0yb5VqkmVWxS?=
 =?iso-8859-1?Q?GJpBmSRcovnrjwNTLk+u2b4BgDN6Og+hgffX9JqUtOnwwXr0C55dxPKq4j?=
 =?iso-8859-1?Q?Brww+yoi5U9wOwqbImNMdOr43dUSWCaBaBWiLsWHsVFA6jeWtbmpLG8TUF?=
 =?iso-8859-1?Q?H/JHXhvVxL0wmcv1vC8Ig6axkejw6eP0PQ27baRscTsf6fwYfTFUemuo4s?=
 =?iso-8859-1?Q?6KpgtNHlXP9Cb1yz2mm+WHnCyVZJmFxbdjAIS0JWN5jWbvlUKQ3mfrqwdd?=
 =?iso-8859-1?Q?N/AkCchHcfVcPXzK/hqoGvq3m2GoPjv1wNYE6kPWzdIQUTwmPa7Lp0HaPF?=
 =?iso-8859-1?Q?NyUvuClJT/e010VJBAP1+xd2ZllDrZiFR+MiK2m9T9QqrkaSAz1w5YUT23?=
 =?iso-8859-1?Q?Q3iTx7VHjj9+SX8DAJIpPFDljjMdI4uUBbsuZCe/mcy71q1sd/F1haQUyi?=
 =?iso-8859-1?Q?0ZOCKV5nUXMpwfaL+eR9hEULugfgVG1zXdkjmjqTkRjWlcHTIKElx8WmHQ?=
 =?iso-8859-1?Q?4M9F9pEuYCd/prDl8417IhEbZWJekkzVDum0a7pfDT98LIPEy4iBoJgP5V?=
 =?iso-8859-1?Q?DG5vU2ieT70T5TwzAoXdShcVcEbLFV7Ol/JIDtT0vqrhnXL8wYcPJgK+LT?=
 =?iso-8859-1?Q?64ULy3q+qn499W9RSzobSRsbZzAGpC7/Yem6dhtaPvys70e7gZFdFg5w1x?=
 =?iso-8859-1?Q?EpJm5g0a98NpKM1KEQOY6PKFXE35SeNr2Z0vr5CiaPWze483/6/EfKUDLg?=
 =?iso-8859-1?Q?YRl6/bvmDnnjRwBy+JJy2unnB6fQcHERYw7H19/kaWtPqNpug4R4om8KBs?=
 =?iso-8859-1?Q?V+uW4gAemKTD/Co4De7+xwLDCd9sF9mJ1FoI3nWt+bqYRlGg7NNxfLP4lG?=
 =?iso-8859-1?Q?EfRl0f3yCqtQGwrMM0+lfuQP9HSOa+rO3dgLLDFgLDKwMS+ysSqnqhpn3/?=
 =?iso-8859-1?Q?IBwQzhecCM3dg7xgHVX7JwjK+jFs2PhRAOUZjlKhBUFoaEwNH3MFiC3wGL?=
 =?iso-8859-1?Q?rkR9rFbzfxbNZh41F7owYMzaADRvgR07mDE+PnTODIUlRNgF9b0HY7+eyE?=
 =?iso-8859-1?Q?7C3pRfUASM9e1Naw2LpRvUqsbg+YIoZRnR7Tw9SecZvUfcqGyJ5q0EZLlG?=
 =?iso-8859-1?Q?DzfFvH/qbQzmQdjSX6RIIZcmk+kF3uUeptSewjLUAHRg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?V8rb4BhtG78qumtEr915bbS0w2w1vyy0dz7TaJZUJNtY431peyRVTkMuCY?=
 =?iso-8859-1?Q?4sVMqgNlJoJP+cVW1uWW7j5ptLLdliwLHQ06l22euyymbQSvaNUUZ1scne?=
 =?iso-8859-1?Q?Z/ptLt2GPtSow07k4QyPThgyEt2BToX56iew32em5y51qZUlWUALjnBxb7?=
 =?iso-8859-1?Q?0PdI2ZUdsqf2kZ5uFJCthM+9+XetY0ITxhq5/wNyyu35H5pwR6qL8JPZsL?=
 =?iso-8859-1?Q?yu9S6/hEWIu+4AuGK34KEx6YozMqCjS/AkoF8upZUt4h2nlOWIrHMQNtYU?=
 =?iso-8859-1?Q?kBS9p5H48ag7sD5J8+jswwluygJumzwhTFrmJF89aaBW9Wydrn7SIV/5FZ?=
 =?iso-8859-1?Q?SRTNWKIR3nlKtm8uxWmfREJDJD0GxcNLZrwfCntChUVdZegi+R5w5d7huy?=
 =?iso-8859-1?Q?ofwxsmX4BcHr6fALDtquSw17ew/+cQXEQgE5YrZg6Bq+Ydtpi+nEZL1/UQ?=
 =?iso-8859-1?Q?xUKrZO+DSc40bSf4oqh9tf+4NeazLERIRHeNEEJLVklxHoRVvUi4ATBPLa?=
 =?iso-8859-1?Q?JBJP2NK5tRPwg9qj0ff4Aag+i54IYQZjWxU+k5cueclyQq9pI25fuSDruO?=
 =?iso-8859-1?Q?vcQA2xcQbcc8aH5Qa7R08ikfhcDGD0NkTkvXkfbKXJ5hRFlok0oHYXK0eS?=
 =?iso-8859-1?Q?alxTSSTQpdYEnNGqpKVo5F9rpCiGuTcxVJv41Vekton2MbOx+YPFgLWDbr?=
 =?iso-8859-1?Q?LImExAE5drYjVdpUwIb9gLKzAO0ndWNLcvW4XkGCoO0ZiA5FpfUA1zfbvV?=
 =?iso-8859-1?Q?REyQzj+/qVtYI2H7NYV1pcvQR9rgZD8apCPcQOagHdZRvz2hB429UoiqcG?=
 =?iso-8859-1?Q?N/NTQp9MeRBiLxr0F42cFfbssJiNfEjn4oO0WqUFDRTe4fN54jyL+b73HM?=
 =?iso-8859-1?Q?6cboZGsAsmh+Eq3lyRjuiKEI6yevXsPrE2akMjby90vMx6JvbbVaUj7IM/?=
 =?iso-8859-1?Q?qLgWHZiPZsWuMOyTU3S3VWZdR652yNygd7L87RcNvTuf1NS2z7bohpURYa?=
 =?iso-8859-1?Q?PNKeOIm4YrRh/Bbcm/4Wjx7sCiqvxSvtfrZGWFdVmGyIHqV+sCQzr0yrvC?=
 =?iso-8859-1?Q?xg3xLX04QkOfN5h4oBh2VPMl4qG4LZEVRjQKpdqW6X1atP3h71s5Do0QE/?=
 =?iso-8859-1?Q?BS95o8r0N0IxlwGUlOGn1JKopDFHRN8dPrKJWFBeghoC4Dx4EsmsV0lSPp?=
 =?iso-8859-1?Q?TV/efTMLPUDtqgtFWv3F9Msuxw4FDbxUvnVYmtv0USBgMwpJFUq6BkOzph?=
 =?iso-8859-1?Q?wxhedF9rAK5XEoQ2vZhdCNjjmMcGKFooaykASpdN0e62rO0XW/JU5BQKlH?=
 =?iso-8859-1?Q?X9+aItXtlUODF7hobTfC+0CXR0cXZwBSvip5PjR5i6Duao97tDVuJ8KRhG?=
 =?iso-8859-1?Q?CBcFBA9B3PAaAIsSyIXEXElxRdlUrHPayjEt0ad1pzANL1pYa1ajHK3lbr?=
 =?iso-8859-1?Q?LV5lqcfbBUBrH4ZHRydvEqHr8eEqk/3jYb4UoVdD/0/UEa0yIHqwI+gbsM?=
 =?iso-8859-1?Q?HO7RRhsM0PBQ9zHHnaDOFeW8y1ssq/tGP65C736TAsyHvdA4stU0v6N2SV?=
 =?iso-8859-1?Q?qPbbKKN3+B9MyAbrKQqTjZupz14eA71xaDgcJwdbf8LqRDI6jfY+eBpVFJ?=
 =?iso-8859-1?Q?0OHddaluuufNRP/GlVGwU9BaRKj3ILzF9Ycr+NctOWMQzY/KSY0fToMQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818d1b9f-b256-469a-aa8b-08ddc9f90fca
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 14:56:10.5007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4AzF4C2I0yI19qVOS5drUIBiCe9Rbt3BB3kooY+nOrdfSnbVtNT/yHRUzUMylP7rr3OXierxdxPQj32mxSJ86ARRBq9cM2sL42NKMDvfsKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8256

Update ECLAIR configuration to consider guidelines as clean
so as to avoid regressions.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/ecl=
air_analysis/ECLAIR/tagging.ecl
index 879485b680..c79358bdae 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -23,6 +23,7 @@
 "MC3A2.D1.1||
 MC3A2.D2.1||
 MC3A2.D4.1||
+MC3A2.D4.7||
 MC3A2.D4.10||
 MC3A2.D4.11||
 MC3A2.D4.14||
@@ -103,7 +104,9 @@ MC3A2.R21.10||
 MC3A2.R21.11||
 MC3A2.R21.12||
 MC3A2.R21.13||
+MC3A2.R21.18||
 MC3A2.R21.19||
+MC3A2.R21.20||
 MC3A2.R21.21||
 MC3A2.R22.1||
 MC3A2.R22.2||
--=20
2.43.0

