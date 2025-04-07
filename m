Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A5DA7DF53
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 15:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940164.1340027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1mab-0008H3-W3; Mon, 07 Apr 2025 13:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940164.1340027; Mon, 07 Apr 2025 13:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1mab-0008FJ-TH; Mon, 07 Apr 2025 13:32:37 +0000
Received: by outflank-mailman (input) for mailman id 940164;
 Mon, 07 Apr 2025 13:32:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U9Ey=WZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1u1maZ-0008FD-GM
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 13:32:35 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2cca268-13b4-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 15:32:33 +0200 (CEST)
Received: from AM0PR02CA0133.eurprd02.prod.outlook.com (2603:10a6:20b:28c::30)
 by AS8PR08MB8684.eurprd08.prod.outlook.com (2603:10a6:20b:562::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Mon, 7 Apr
 2025 13:32:30 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:20b:28c:cafe::5e) by AM0PR02CA0133.outlook.office365.com
 (2603:10a6:20b:28c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.32 via Frontend Transport; Mon,
 7 Apr 2025 13:32:30 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Mon, 7 Apr 2025 13:32:30 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS8PR08MB6136.eurprd08.prod.outlook.com (2603:10a6:20b:292::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.31; Mon, 7 Apr 2025 13:31:58 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 13:31:58 +0000
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
X-Inumbo-ID: c2cca268-13b4-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BhDoiCvdCjIrzhc+0uimaHsZImrolXpmmwlgSjGuBzYrUHP4IkzX5bppKSx8WpD9A9Pj3YrBNiNriCiFpX9/2LA+YS9HWH0qG1M3oSQZ0OKTOMhXt7YxIb2oSM6oC2lV3xgFGEmlxzYC3GhpgrZw4/W3brzEXgNW8pNxVxg8nJpFYIfdfvrijYbAY02N6J4DXPZ98GapQPvE0l3vchYnKXTmkVyF3O+dKot92QX6NCv1bbpjtj7h53MsXJ7kr367/u7MAOXl2/AWuxwA4nVi+mMri6rGKNsHxpy3R6+KwZ5QJih2eRk5oqBcNVJuLm0gulFa5gKXvM0S81/fmhQXBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyTmMYEFDSLSd0DE9QKYq5iwXqYxilAvM0FTMxOxZBA=;
 b=CXji1f6JuG46sQL9R3pW18gbHL5xvIrNql4EzX1d+Yf+Y+DC0czNIFCeh+SYTHRyhUxivFqBQOQhGa92glnOfjfg3y5C8p60ye4vZRyYseRCYIuMvx96E5Vt4T8Fr7mB9rAvqCgO6yxSUseGx06jhAEZqZlNyIOTe0lODM1RQgd+skJP04vtD2uh57fMMKoPGG+eULG0/fS/f3eETAOBE9SMReqcYkJSJp2Xq2TU5wnzyZp4BO3mlXgMzWp6ei2B+unXyt1vFqCSbPwCl71XjrKFvhs7iKbop1KQ7gMMP16InMMRlcX+YJjQ8dRthSTJaqvBZWkrJW69Aw3ozbBa2A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyTmMYEFDSLSd0DE9QKYq5iwXqYxilAvM0FTMxOxZBA=;
 b=FGyUSuYEF21jewTTAER+TsNLbjT6gfgwNBJqFH0c5yyvOvRdiDaTJB3ZvplZiOwIwH4X769+pks/hMaRGug5Nx/jo27l5e4ffvQwU3VeWdB6sRczwVoCa9tNRpi+fBPKsTCwdNAAxWi83fWfUQan31cyp+yGbKj2y9G7McCIMQg=
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYdOe4fHGg9x/6JBeH9ebik5pVQZf4OUS2bbJivLr8ZsUWASj1rrmku1t8CJUcGVaRCJvhshMUKqNdZkiSvYPaAjxDYIAFgojPlEHhewIE6ajgILSp913mKnXGDyhrq/bmagLNq6WH2DGkgGzqZyQGnEu/w+7u0PTCM44HB5KiruY6s6ewEnDN5IQJsP+wJ7XOeWnQLjRMKxlI9WRS9LRrwenk4bxFitqYCmpj1lMIp6XLAjyLUIBxE8H2Sw7YKH60TX+tgoKbzyo76qcxz1pD8cjAziGeBzB+EFKfl+Rt0FYhHSObqOiMseDtFA+Xr+DEkKPj2mU1ee8gOeWIu0Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyTmMYEFDSLSd0DE9QKYq5iwXqYxilAvM0FTMxOxZBA=;
 b=v1QZIVykr6X2hW9PyypPUs0DE/x7jAMW/0iAf0b2Fjp0KL3SbheW97gHFJlegxOabRXRTz2ohBKB7CU1Dp9TMwb383ta0/rxnCyiUd3E+Cp9wvhRgIQVkD5PF8tsB6dMAH9CLpRVFfLpKvSdYZoGYhSTcms0NJDKP4hYrzJWzVlGxL6LoaisFGd5Vhypki+p/gt/e4MLN4oi32RpeCwfKbgZpKz8r63/5b8mXZ7Gzgc2/dZlNmMy4QPaAyXxBufvIqx38TSGY32Q+6qRDqoSwR+MYSMx3GgQrjZkGXwmEDOjxAVQGl0o6om66dvcBDFvqlQuo/sAUl/iv2q0W7raRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyTmMYEFDSLSd0DE9QKYq5iwXqYxilAvM0FTMxOxZBA=;
 b=FGyUSuYEF21jewTTAER+TsNLbjT6gfgwNBJqFH0c5yyvOvRdiDaTJB3ZvplZiOwIwH4X769+pks/hMaRGug5Nx/jo27l5e4ffvQwU3VeWdB6sRczwVoCa9tNRpi+fBPKsTCwdNAAxWi83fWfUQan31cyp+yGbKj2y9G7McCIMQg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: "Orzel, Michal" <michal.orzel@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 1/3] xen/arm: Move some of the functions to common file
Thread-Topic: [PATCH v4 1/3] xen/arm: Move some of the functions to common
 file
Thread-Index: AQHbpLu5pa88e8EeQkugLRqmrl+P07OX7qMAgABHGwCAAAOFAA==
Date: Mon, 7 Apr 2025 13:31:58 +0000
Message-ID: <8C708752-ADB1-4904-ACCF-FDDAD965FAE3@arm.com>
References: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
 <20250403171241.975377-2-ayan.kumar.halder@amd.com>
 <45d47205-409c-492a-9841-3b162c05ec09@amd.com>
 <0ed34b41-0cf8-4bab-9304-d6c3f2ec276d@amd.com>
In-Reply-To: <0ed34b41-0cf8-4bab-9304-d6c3f2ec276d@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS8PR08MB6136:EE_|AM2PEPF0001C710:EE_|AS8PR08MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: adb037b4-88ab-40c1-d77e-08dd75d8a566
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?aOxL7jTFXMGvSsqyCRHFhE1cYauw6Q4BL3lBPRgPzNN5CV4JIzVJAIdNL35f?=
 =?us-ascii?Q?EPcYVZIht3T914uWiTGVGMvQq4ali7gf4keKZfOY+tgX+VSAb/C51EBpNaO+?=
 =?us-ascii?Q?HunBeAeJ5UIfHaKojsq1STRorIsdiCxd6U3qd/seYwtn5/Feq8z0gg/iHwll?=
 =?us-ascii?Q?0g1vH1t+AnsXv6wc69FT1BaipsPV39PoGyAZ+jLpe2KXMEarTWdpYmP1hb3Q?=
 =?us-ascii?Q?Q7H0nkwXpHPJc2/1XSIM2I4EPd0iasRelda+qzNlrq5LzqLiKbfgKUONLppS?=
 =?us-ascii?Q?y46GuazFwPD/C3hPobREU7rAlXitkGy5obQXkG6aDDvdL30DughlvM/6UmVO?=
 =?us-ascii?Q?D4bbIkC3wCuC8NmI4dfiyLhPrBPn60gOmF//fkbUCpZjxfCtcDDjXuznVz73?=
 =?us-ascii?Q?iK35NLO4c2L+UtOlsTQOViUOT04JULrfcd4Ddl6i0NaUU3N8yMmXMZtPMo5i?=
 =?us-ascii?Q?+QHRwbMWYgMITp0lJqTgiCTRAuvkxxE96pMpPp8NbBZl9LiVd5oYlXuKRYDd?=
 =?us-ascii?Q?fClA6MpcASMgDkaWrOet4zBYZ2R9dtM7wF5Sai7FWR7OvohEd8HJebn1M54T?=
 =?us-ascii?Q?mQZAgHkMPdaIc3ISXG4GHvcCzSclYmqfHosTdPzSrIX6zkcctz0MFIuHGqbC?=
 =?us-ascii?Q?V9gdwAHsQ/LiXoFhjIGu/U9ysGlwUO51PNyr2/b5sSY6vOnYiVAN2YdveKwW?=
 =?us-ascii?Q?P4Tp0QkEa7DohzSsgg3vZDHghnorsNnEs5QdP2zkKvw8OS237ggVHK7dFlKL?=
 =?us-ascii?Q?OuE0xpH1cZPn1xBiOgWtER6CTXriq77ixXwdZozBdzToXn0AuT2cmb4jcFSP?=
 =?us-ascii?Q?sQcoRtI8XC93Nb0X64IZaiAFSGABkgABfx4k7nZOJiTuATIl8n4ynOXIgqj9?=
 =?us-ascii?Q?lXJ/ixfkFD5E/YGId2YdTx1nIw9tigQBuIENah7gdeVs386TDGX3/0/n8zuA?=
 =?us-ascii?Q?QZ5E2G/82fYkuLMRoL6SGlOIR+uVQtlRLsp98TeWZiG7Mz1Y9J+uH34n3eJH?=
 =?us-ascii?Q?/im8V/zjVATul5D0l0D0CZTWp9yCjW/WtXULmJJIGvnUjJDW35fXyKh8O+EB?=
 =?us-ascii?Q?2U2twQLvoK7lTThqX/w1TgqommRtet2T7crBEVKocWh4NNlKlewx7X2OiG9l?=
 =?us-ascii?Q?A5yE63YIvr7sWwEGRUOxTKrk6gc72tYHIJRjkOELGWOnIGkMIaTbTeH57OCK?=
 =?us-ascii?Q?ZfFfwsDkJSTWS/6NSW5hjFFDnXAIRhBRbiSFvs7sOSGcSNr1qN+6rrjBcEjA?=
 =?us-ascii?Q?LWia2TiCpS906sS1Rvv8nohp1LCVwS3tVDt14lCqo3sTv66NAVjTGKhfVr13?=
 =?us-ascii?Q?r1neVd/FG0MvpW/g0erS2fPTPOPjXVIiAaYEN8gB+toEr7P09+tbCeyNpkml?=
 =?us-ascii?Q?toFrBjj7fUatQSH3x7SUCOL+wAMO0TqTxY8OlaJx61F1PBIDAVodTOm9CCWf?=
 =?us-ascii?Q?JLaf0OsKqUmb1p7WLzt3Cs4QQvPcRy+3jPvekPt83Y/LkDP0ddWSiw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AA49F0A2C63F8C4D82429C4E6D792940@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6136
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0aca40ef-fa38-4cdc-1d2d-08dd75d8924f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|82310400026|35042699022|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vjc8vQyob29DA16+yO6rgXUiyYQTVD26ms7Qeu9O41XltQ6vF4j5CDa1U+RU?=
 =?us-ascii?Q?WkBCU3+Z+/U6x/LwV1uv6yOUt0MnwTu/gXusk4HldUXCEufh8IeOgqgtbDWY?=
 =?us-ascii?Q?8XCh+dWJjUtJPFesnEP0SNU4Wy/wreMKz20cOpcJU+6zujUOdn6SJexYgBr0?=
 =?us-ascii?Q?hSWGKEWTq+4p2v3vQzFyhIFsOuFi0q0jFrKBk/vGr01B/6u4f85eln4oiRIJ?=
 =?us-ascii?Q?2F4mbZFVSBWg2NzjvDDmyxxCXTzrOET0Y9pYoGNwsPmeH/ujFvgkZY4T4N8t?=
 =?us-ascii?Q?opGPhBr/U2bJAh0aj0D5pu7GIAwQ4/HTIWGEoYZwhONiArkcOhGbdbIDb3b7?=
 =?us-ascii?Q?RploEZQt48+XuPc0MRnjNJVDvs5RoskE/ijT2SX/259k41A7wg7WBxmGrUDG?=
 =?us-ascii?Q?iwAPPIAoFk3t8yh4Af+LI/eyaUaSxL+Ls5c/5k/jKDia6xmjNuWYvzfx+lmO?=
 =?us-ascii?Q?VFN7MOJLJUOtNRjaWL+jeI27iYPMQygiDkv7PJiz4F3g9lkpidgEtLR0POHz?=
 =?us-ascii?Q?vsh+TKoHmZREFB6+9imsTGK8G/DWaIUa5Bk3d6j8pecXItW8h/Sp8lAsWhmu?=
 =?us-ascii?Q?FIRKurTAh8sKqWWVxkMfDj2XTiB5Hk6YCrMkzlmTCwRRui2xMxopP1sAiMoO?=
 =?us-ascii?Q?ilvb1oQjGb9agBJHyr/rWC3a2X966r77FpTzVdmL6LJM4DjieWYewesCRG4Q?=
 =?us-ascii?Q?Fuev8cpuydM80DJDue5k0vf/oo8J+2xc9CAikw6tVQjN6HpKOKz7bYWORbWr?=
 =?us-ascii?Q?eUUM4v3vd16VBzUb5IVEttApHJo5/00KZdRogOhG7yOfXMCPYKMoVRVLbkeR?=
 =?us-ascii?Q?DVLPDYPtgBSnJ24mUh7FGYc8OvFFsV48b8PmrFlERvXX7AdfC0KE2xaKsoE0?=
 =?us-ascii?Q?hS90W1YVp+ZeFjhwVhKjMUUfWiDYLgM/mUbIbEFgqN9Lk4rKQ5RufUIev26h?=
 =?us-ascii?Q?T8EIQGFvcJ2S3eih30fSjVOl4h9aCZtwUvaSR+e/ojJbIpmTns1SBqzAK2i4?=
 =?us-ascii?Q?M+i5WofJ47p9q3MMehKm3yNrpR1ZRcCqLpKAG71sCn28bnsdsL0HxHP2Du5V?=
 =?us-ascii?Q?QxjABbwIVkbKRx7BfKDC0qhb0jpHWDNs06YbhGn/Xy34LUxzLvwLDdUeszUq?=
 =?us-ascii?Q?AdffXR07ASYDyH4JJmg92YUA8Ovdf5u7j0lkoreFlg190w/kqqrgQSgomUdR?=
 =?us-ascii?Q?+je6WxhT55X++miLDtqWx8q9R3FnMsAf4R6g5KVNPdnYbvpmXOaifOYX/p+9?=
 =?us-ascii?Q?lgAd2CQ2voI324uq3VR454ezEfa1SdVHSZ8CLsZCwSglXtK1IwLT/decfRdb?=
 =?us-ascii?Q?2tBJkKttLuRCZHln/JzxIuF6wjZ8uhvDzQ/bwB+n80ZVLYYkp4OBsOt9+8iK?=
 =?us-ascii?Q?1Yrr7K3g+A2mmWUe2+63H6p5tjVuxHStGwsRC0hahhF3XWgXU9gmVczWwcfb?=
 =?us-ascii?Q?ZOB2s0idPLxKiGYjMU1r2mVJASkxRRPaFw+o2Wt7jI6OFQdcUnntfXXSBp7P?=
 =?us-ascii?Q?xci2oT6AhPZ+IAg=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(82310400026)(35042699022)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 13:32:30.4063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adb037b4-88ab-40c1-d77e-08dd75d8a566
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8684

Hi Ayan,

> On 7 Apr 2025, at 14:18, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
> Hi Michal,
>=20
> On 07/04/2025 10:04, Orzel, Michal wrote:
>>=20
>> On 03/04/2025 19:12, Ayan Kumar Halder wrote:
>>> Added a new file prepare_xen_region.inc to hold the common earlyboot MP=
U regions
>>> configurations across arm64 and arm32.
>>>=20
>>> prepare_xen_region, fail_insufficient_regions() will be used by both ar=
m32 and
>>> arm64. Thus, they have been moved to prepare_xen_region.inc.
>>>=20
>>> enable_secondary_cpu_mm() is a stub which is moved to prepare_xen_regio=
n.inc as
>>> SMP is currently not supported for MPU.
>> This does not sound right. If you want a place to keep some common MPU s=
tuff
>> between Arm64 and Arm32, you need to come up with better name for a file=
. SMP
>> has nothing to do here with preparing regions so it feels odd to have
>> enable_secondary_cpu_mm stub there.
>=20
> Can I rename prepare-xen-region.inc to mpu.inc ?
>=20
> Julien/Luca - any thoughts ?

I would say we leave the SMP stuff out from the common file, at some point =
we could start working on the
SMP support and maybe there would be difference between arm64 and arm32.

what about common-cpu.inc?

>=20
>>=20
>> Also, new files should use dashes '-' and not underscores '_'.
>=20
> Ack
>=20
> - Ayan
>=20
>>=20
>> ~Michal
>>=20
>=20

Cheers,
Luca


