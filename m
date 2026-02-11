Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IF1MweSjGlQrAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 15:28:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF75125386
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 15:28:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227726.1534158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBCI-0000l9-9H; Wed, 11 Feb 2026 14:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227726.1534158; Wed, 11 Feb 2026 14:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqBCI-0000i9-6E; Wed, 11 Feb 2026 14:28:06 +0000
Received: by outflank-mailman (input) for mailman id 1227726;
 Wed, 11 Feb 2026 14:28:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vqBCG-0000i1-GN
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 14:28:04 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de73f19b-0755-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 15:28:01 +0100 (CET)
Received: from DB8P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::33)
 by GV1PR08MB11049.eurprd08.prod.outlook.com (2603:10a6:150:1f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 14:27:54 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::90) by DB8P191CA0023.outlook.office365.com
 (2603:10a6:10:130::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Wed,
 11 Feb 2026 14:27:50 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Wed, 11 Feb 2026 14:27:53 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PA1PR08MB11670.eurprd08.prod.outlook.com (2603:10a6:102:558::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Wed, 11 Feb
 2026 14:26:50 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 14:26:50 +0000
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
X-Inumbo-ID: de73f19b-0755-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gI52Auwl4rc0xbNcGCV5FIRWYu8zceqJLcXVvGLgBsg1A7eG18DFYh67vFzdTIHGs1+v0O7AYMLG+l/hgR/FCOdYtrFlRMdB01lqGLz34pJDIH7ZZmg2PnLwQ/ds1dIb6QMA97lVisFZmGa9J6QPwjQfvY4vKE9dk9yJYVRvEbL3inDJUdE0/giUddgCtmGeV4NoT0WJSiEj8w0uwoZREpARSHga0pFtCG77noLXBRaAiwiIDw5ikorgM9DCk38IRzb9wXnptQinudhWbZXuktjN4VpFON7lUP2ZXcGXDBLDP4ohivYvG3kNLiq/rnyeEjMnH1GAyzbXobFqkveNOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SU6Kecneh1kjo06iRHaR13oXWtvn5PqIMxgv4dUaEC4=;
 b=uXJUo9CM5pVndEW8Fb0qlkrnrwqlboD5T+n4kbkiJ1gEuGj2XLX2QQXwzr2h3L+C79U1ahS16b1OT/8m+Hv9UgoH/XeqFYepkPF9fIs3KPtG/igcNPcdbQt3kooIZAdthQAaiLrZl8Ud0YrimTFP6pu+Np4blCncEUYg+Ja43cGl3C1XKLIExF94eR0CrKd/DGgy3KYSux5Qh/BKdv355ISOvWeykl4wtfbkLLSKi/XdeHc9UNBAeWj46DIuwHRYrJoSmOoEDScRA4nQkCfEJmmjF/WrDLdTB6YnMeynKVIptpWe0nia8BmRcv8GEkImgECN02SpmGci08ZKfMtgZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SU6Kecneh1kjo06iRHaR13oXWtvn5PqIMxgv4dUaEC4=;
 b=D+buQaoRYiQ33l36uvAwuv/UAsB3UgHnuad+MPy6CTAVcBE01AJFlsY8PM7XXyAy1khJmS7huuCBGUbwEeUWGz+nUS7pcyq4C9LkmgyrRwgOzSb9/JOF7+iMEc1hB8b1aiNnBW0JxfWiZH55aWSEIcBejT7USnKcLkTBnMGZFEw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4bAgvI9QKBgJQioCzygnnUVL7TLP/mWEOjHYzrF754hzjmZyfwHLPJYgJzFdvSf6ojBOO6P41vQ64c22RkM94+E+iZhXZ5Mr75FEPptTFKWkPyHaQqF1MFGR5mR7j0OsCzmbTtCco/BLvcrkFYWCdBcchgwHVRKgz9VCaJeWxSc18MnS3JlouPWlCNO8y9Cts24T1XJNTWxQndgae6wzs1jxdc4JK7d1DWjPoD700RQqDfR34VpiYe28Ysu2LTSgsqGQ3+Wl/IisL0b1zRVRG/ebSmPZ9JXCXzp4AaWx0Rl9jvkmC0EcoxNbo00LVj760V1KD9NRVgHvSMjwPQfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SU6Kecneh1kjo06iRHaR13oXWtvn5PqIMxgv4dUaEC4=;
 b=HfEf6I3TNBR8vjVly+gPi56dgqmD0bgf0YbNWMxUxUxzOuftjsqC9esBlaBkOpHchlN4/lP7vbfoz0RzcsfAEfChfbLOVNtoF2zk/9pnvhkI5fbzFWRQNqPeJIKGFUzfI1Wk7CD4tMjSgVoUzZgNaKR5VjM44fK152YMXFKcG9d9us1Y1PsbXTVJKmDlLCZKPoxwMOLMkF7/Lo6axcMS+Wx+ucNExlYLJbLUmxr7qgtnvVOpQzUTNPzj3J0y+v6wzCKLUpCLxK42rnqSMuHl9WPWzZG9sdQWQfgdSLQZuC306kMnAC4HSVLnzthcfgqsDpdn1GhOh1vk7I2WVPVeGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SU6Kecneh1kjo06iRHaR13oXWtvn5PqIMxgv4dUaEC4=;
 b=D+buQaoRYiQ33l36uvAwuv/UAsB3UgHnuad+MPy6CTAVcBE01AJFlsY8PM7XXyAy1khJmS7huuCBGUbwEeUWGz+nUS7pcyq4C9LkmgyrRwgOzSb9/JOF7+iMEc1hB8b1aiNnBW0JxfWiZH55aWSEIcBejT7USnKcLkTBnMGZFEw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 12/12] xen/arm: ffa: Add message parameter diagnostics
Thread-Topic: [PATCH 12/12] xen/arm: ffa: Add message parameter diagnostics
Thread-Index: AQHclTU3ZJPDIpNYRUSOTYp5hfKcabV9VJGAgAAZM4CAAB65AIAADfgA
Date: Wed, 11 Feb 2026 14:26:50 +0000
Message-ID: <ACF91F47-6878-4ED8-B3A9-4181731D917C@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
 <209e5474e236737dd13e0f7ff8120b05cdb7eabe.1770115302.git.bertrand.marquis@arm.com>
 <CAHUa44Ebe03R2nTzUW9tDx5hPC6trZCWOdr94ApawFs20chdWw@mail.gmail.com>
 <7B367F9A-37E3-4157-A7B2-3EA21EE9FE52@arm.com>
 <CAHUa44HAtC=vwepiYg=gSvdr_xkwjSaBzS8FL_hnF_dF9RHi0w@mail.gmail.com>
In-Reply-To:
 <CAHUa44HAtC=vwepiYg=gSvdr_xkwjSaBzS8FL_hnF_dF9RHi0w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PA1PR08MB11670:EE_|DU2PEPF00028D0E:EE_|GV1PR08MB11049:EE_
X-MS-Office365-Filtering-Correlation-Id: 99200dce-6e4e-4c1c-24b4-08de6979be69
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YUdSd3JnR1pWMlBpWnltWGU2OW55SXZIWU9XdFBFSUZWTklIZzcwY1BaVnpC?=
 =?utf-8?B?cmx1WitPRTVNWkk1Z20wRU94V0V0UjdzTkZjS05jSjlOWkh1ckdoa3FOYW55?=
 =?utf-8?B?QTF4Nkx3b1JrTDgyZFdSakpYTGo5U1lRYlJsUXlxNjNZOVVDWk1jclJjdnBh?=
 =?utf-8?B?RTZ0bWplTFdHR2N5SzRaZUp1K3VZeXpoQTM5WXRIK1o4dVBLRjl5QVZLUjIz?=
 =?utf-8?B?dEF2YUZCY054K2RnUGYzMnRkSWdHNFdVUHAxVlI4WEt2aENabVM3bnJEd056?=
 =?utf-8?B?U0h4bHlSSksrWFVYTE8wdi9MRU4vR2c5SERKVHNuLzBFYWpjM2V4Z2lldkFo?=
 =?utf-8?B?Z1dZNWY2K2JiMU9lU1BEOGdmSmhJaEhnQmc4S1A2VDZCNkFXYUNrZnZsN29Z?=
 =?utf-8?B?c0ZTbHk0eHIrdVlyeGt6b0txdEJobGV3d1R2cGpXd0Z4S2pBbVZNK2Rjb0dB?=
 =?utf-8?B?eERiOVd2OW9GOUpzM1hOTW5GM1B6VkhrV1JNV3FOWkEzUkYzSFJMRXJBZE8v?=
 =?utf-8?B?V3hEZ2tjQ29wVE1WZHptTWg0cGNTUWxmYzVYVEhCZGx0YS83S291S2xYY2g0?=
 =?utf-8?B?ZWpCT1BoazBZUHBzVnhQMkhVamt2NllzWkgxNGlxYlMySWw1OVZYQmV0M1lo?=
 =?utf-8?B?YlB3Ykc1M09PYmx6R0JYTTgySXpJY1pieUhnM1B0VytDeXVRN3hKV242OVVj?=
 =?utf-8?B?UThLdTB2a0hlZTlCbEwyL3pVa2YwZ1c0cGhTVlN4dGR0VDJOT3Z4alFEdkgz?=
 =?utf-8?B?WGt2TnRKdEpJWHFKbzBYaUVNbW12NTJPdnF5ZWJ3V3d5aWY0OHNhcnVOeE1B?=
 =?utf-8?B?TVo3NjZxaUt2UlVkKzVrREp5Y2JIcFVmMjJmelVvcEd1aGdQQis4MDh6RXMr?=
 =?utf-8?B?RmtWM0dKNjdpMDc3TmF0eGNndmhZREdiOHBiK1Y4TnRxMnVMTjYwanE4QWZ2?=
 =?utf-8?B?NXZwS2l6QzJRaVAvaWowUlRIdWpMRnJWTHB0dkVnVE9SRW1RZy9KR3pJZWNH?=
 =?utf-8?B?M1RJVnA0eG0zcG5GUW1lUytnSWJUSi8vQWo4SzZMREZiVXFzZ0ZENjVLWDRu?=
 =?utf-8?B?WlA1TEVJM0JGUmlOalp1K2pDWFVDYXQ2b2ZnZ3o1YmxZL20zVFNlSXRRV29M?=
 =?utf-8?B?dmlzdy8zd0ZxM3hTbERoWGVIdTkxcHNib1U3SVVlUmtseEw4MzNLS1dlWDVE?=
 =?utf-8?B?UUxTalc3bElJd2N5bTNoSUhSaGxOZkRzZ0tvTy9INU5OV2dtTE9NYU5hRUw2?=
 =?utf-8?B?RHZkNG1XMWNjQWZSRFI3RlYwTlFXbE10d282SmFpbzhBZ3lDQUR6dGREZVVV?=
 =?utf-8?B?Wk4wZlFHVU9rek42MU9jbktxT2g3eGJBaWdLdm8vVG5hZFlLQnlVV3VSaEFm?=
 =?utf-8?B?SkYrUWZ5T2gvS2R6VEhTcVR6NXF3RzV5czZyTzNVeFB3TFd1Nmp3dVd3Skts?=
 =?utf-8?B?bkdUVEJiVm5kc0FDTi9hMnp2Q2c0YnRxNkhxcEtFOHh1VyszVGZzZGE5YkZS?=
 =?utf-8?B?Q1BySnlmSG0zNkY5QVl6N2J2NTRiV1pNeTl0THhZMGVOOUlIcUI4aUY3R0NE?=
 =?utf-8?B?Y0ZOWHVXbm15RzVIM0xJa0dhV0Vpbklmb3ZVSmlmTmhCVG1lSlplUUlyT01o?=
 =?utf-8?B?M2J3VnZ1YVNFQ2hZWGRuQS90UG5ndnI3MjJ5N21JNEoyaDlRUzRLU2pmbEw5?=
 =?utf-8?B?b0NGWDFiMjVLUEU5OS85bk5KQTZVVnBOZVBtSWNUVzhMVHIrZkJ3UldOSXFt?=
 =?utf-8?B?eDJJQ0Z0MHBDRFBUZ05FMjhoTFpFd2Q2Z3RrWHdYeC9UQjZHd3VwaXkzTmpZ?=
 =?utf-8?B?UCtjLzVpREV4eHRCa1AzekhCNlUreGRPYS9nR3R6Q2kzYlFTcmozNGVYaEhX?=
 =?utf-8?B?bnBrVUlzOGl0VWFWR2RYazBLNjVLZjVGb1hLVTNFSW5oeE5ueWRPN1Y3N1d5?=
 =?utf-8?B?RTlvd3ZpblFzczZEZDJPellUd0ZhbjYrUUwrVU4zaUxaRU1QaVVQeXhWcUpR?=
 =?utf-8?B?UG11aHFmWm8rcmh6b2gzYkcza09BVEpOaDU4NXBFWDVpR2tsK2FSbWZiTWV2?=
 =?utf-8?B?ZStBNVRTdGdNOVFKL243RUNxR1AzSDVHdzhpSmtDSi8yZW4xaGRhL2NFaHla?=
 =?utf-8?B?ZDg0ZTBBYnloNEQ3NFR5VDlGRXUxT3VrTjlUR3dPcmE2Q0RYb2NmVVlHMXVn?=
 =?utf-8?Q?rQtDt77QAOxrCmfjgoO92dU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3CB17A801ACD104BBE6E353E30637D74@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR08MB11670
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	efe02ce3-382d-44d4-3cd4-08de697998a0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|1800799024|82310400026|35042699022|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1ZRMHlGSGw5WGRxOFo0RXNiTVdIT2hhZmVkTno5UytDR1dTOFhLM09jdy9z?=
 =?utf-8?B?NDRmZ2s0TVZrazcxRUNTSnhzVHJKNUlNcmJDQ0NiWlRDdHZFbi9Ibi81SFdz?=
 =?utf-8?B?Q1Y5dUFIQjZWNWxKU2lJSDRQSk9ZZjhPTDVvU2JZNmlGTGR0QlpHS1I2c25p?=
 =?utf-8?B?YU9tUGFEdWFqVzMrbkFGdG9idFh5czY5bXNBVTRra045Ti9DOFNLOXZqaWFZ?=
 =?utf-8?B?RHh2ckdHT2RveGpVamxiSUpCRDJScDBjb0lVbVJZc29TOUlSVFUzY1JwRVJO?=
 =?utf-8?B?bEdjRXprYnU5dEk5L2dhRDVkaEVtZE5rRmFoaC95aUJXdmcyQTZtcEg2b0VE?=
 =?utf-8?B?L042bE1ZS21Sc0RCQ0xFU0R3WktKaU5kQTVlVzh0ZW16R3dGRjhuRjIrZXV4?=
 =?utf-8?B?Y3RQUW0yb1hxZWlIWi9IN0tJQVJkbTdZcVQ5NS9acEFDR3VUTWJmR1ZqcFl5?=
 =?utf-8?B?Mk8wdnJRWmVMbnJBbVo1TVZDa3RQajc2RHRoNnVDMnA3Y1N4YTcxVSt4OXNz?=
 =?utf-8?B?dVBLSHAzSHFoUVEyU0pnV05UOEJiVDU1K0pCL1M1dUZBajZ5c0dvTU1FOFVL?=
 =?utf-8?B?a25BOG8wYTVyZ25MN1Bwdm1uK1BuN1I0WE9OcDRUQS81TmN4c1RTRWhTY1NQ?=
 =?utf-8?B?SjNwZ20veGxkRURreDdVcmVrUnBlZGlLMUkrWDk4RWJyRDFUTTNZOThSd0VD?=
 =?utf-8?B?RzJDRnFvTVRmUGhQd2dpZnBEY2M3NmxzaVcwZG05VzBZQ3pwQnMveFM4ajNp?=
 =?utf-8?B?M0grNGhRNkhpSk1WQVY2bE1pc2hwYTIzTGgvMWZONUpwbVh3VTQ2WEhPb0kw?=
 =?utf-8?B?ekxlemR6cm0vZDQ4bW1yclU2QWFYR0RoODNCNGV4cFNRL2s2TzlRM0FPTXFO?=
 =?utf-8?B?SWZsUVVtdnpsNFkzRTNtK0pESXlCU0xXT0N4MkJUVWoweTVMSjF6a3JHZHRR?=
 =?utf-8?B?alU2L1QxajZ1NHVVT3dyenNtdnBwN3hMNndYZ2NsbWpOSDM5REtkdVRnV0pH?=
 =?utf-8?B?V3ZtT3NydVBVVm56ZHFvRXI0b3BDdkxiaHdkNjJTbHJrMDdidS9nWUFoUEhD?=
 =?utf-8?B?YnBSUE5TSXlpRy9HanMzR2dOdjVKMGF3RlVVSDhnK3RRVUtBWGppOUMzK2V1?=
 =?utf-8?B?SktBeXZYeEw1YTdJdmpxbXlPOUwyOWoxMWE2OEc4YmltWjlJRzlDZnFvajV5?=
 =?utf-8?B?ajFRb2pxVE5pZ3NiVGN1THlmWFYxcWJ3QXV5Ty83RVNQY3l1QW5NVGZQVStm?=
 =?utf-8?B?a1MyaW1LNXE2aXlrK0pvZ3lTZXNYeEI0eldPYUVycWhJNmsxb2dzYk9GT0hs?=
 =?utf-8?B?dHdseFo3d2ZHd2I0MGwrVk1xcG1SSktBaEdPUGZIcTBWYVVOSmhzYnFqRytF?=
 =?utf-8?B?MlhxOWJ3Vk5DVG16Mnk2VW1YSEhXT25RNlRBaSsrN1RpMkI5YmZMeGcxS1N4?=
 =?utf-8?B?bVFxcXZJc3JZZHlqR28wY0JMc0FDNUpMWmRmVG1FWldYWnl6SEc3eTJzb1ZL?=
 =?utf-8?B?ZWhBcjZDK2crbnhUWmxVdWRYN2thc2FrNkpBeG5lQ1VieWtLUUNGMTgxR1hi?=
 =?utf-8?B?VytwSE1aWkVZOWxKbFlmeXo3TENrOHI1M0NjVlVhUy8vaDhDVG9WcXZWektp?=
 =?utf-8?B?bmhMUlRHZGt4U1R3ZzRsRllkalFhNTVFdXZlR3pyMFVBZXREdmNRSjhGM0Ny?=
 =?utf-8?B?VEJQQWJCN3k5WDVya2kzMUlVZ3FESnhwUWg5eUtMWjZRYjQvVTBmcUdaaGRM?=
 =?utf-8?B?NUVXbkhDbmVYQVprVXhzMEJGem45RjNZODQvRWp5OXdMM3Y4dVdpMysvaE5k?=
 =?utf-8?B?b1ptNEJuV2VZY04vZW5mRE9iRGtYQzZaM1V4bGg2YmN0eWgxQ05OWW9WV0pz?=
 =?utf-8?B?VjVOcEtGZkhtckFEN3RBLy83SnMzMWdYUzRCaXpFb0wrdEpkc1lwSHJJMXVB?=
 =?utf-8?B?NlpHZXNoRTk5RkovZG4zOHRrNHFYbFFEcjBqc0pNKzFkb055Nm5zWDhrOFlP?=
 =?utf-8?B?VXp1QnpSd0RiSFdzKzg3bWVUcXcxYkFtUnFUTlJQdTRFcG5Wc0xYQXVNSmNH?=
 =?utf-8?B?MG9tYThDQ2RqYktkNUF6cnpPVzdSSUxnQUpOSi9vaFhYUG8xeUozdEFGQUVk?=
 =?utf-8?B?VmJFWDNOMk12NXMzTFVWaFRSdmtBWU03SUJtdDJXdTRWaXNqOEZRbnA2U0Jn?=
 =?utf-8?B?SUJuYS9SYi9vdXBpY29SYkhpdll0R3JrbVhNMS9abXlIVVord2tZbjA4VUdZ?=
 =?utf-8?B?bzhmVDNmOE0xM25NbFd5clhkUll3PT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(1800799024)(82310400026)(35042699022)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GxCa1NffBhT7+mW7QDAelxt7boVfyZPfGYmVAbEqDIT37ZJnaYbbPD4+0PpnxOQKr+mb49EcmGw99oinEzADBXUFKUM8j0RuLjA0QuJvdH/t/FaAxu6QnxdfNbu593DUpoky9QPXPCBWmO484Zn/RCgl4hsF885pSG4UkypfqI1suj7r9pPYTAIDe1nqcMFvEY03JKRLPqshaIamb0A0+cC85DmfNGD94SuuQZ9TwhA2znUv7k5qkMUWh4H8xQ3/4Y1mZ7KqtCgCMIEpsvf/NntpRjMMrEgoDqCOhNA4FxnAT9ICwCocbSklAP2eZ9PjxomYBUzBiTpSANJ2GX/o0iFo2Y1M4OUSE9AqSpGQ593EvdaKVMI0ns+uRRhHTXLbgPhKPCTVmwfQVTRoCGho1HXU5Dd0vwvLfzu4oe7FTkgyUX7mpk2qRBpf7Cl9O7IA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 14:27:53.8633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99200dce-6e4e-4c1c-24b4-08de6979be69
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11049
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:dkim,arm.com:email,linaro.org:email];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 0BF75125386
X-Rspamd-Action: no action

SGkgSmVucywNCg0KPiBPbiAxMSBGZWIgMjAyNiwgYXQgMTQ6MzYsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gV2VkLCBGZWIgMTEsIDIwMjYgYXQgMTI6NDjigK9QTSBCZXJ0cmFuZCBNYXJxdWlzDQo+
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBIaSBKZW5zLA0KPj4g
DQo+Pj4gT24gMTEgRmViIDIwMjYsIGF0IDExOjE2LCBKZW5zIFdpa2xhbmRlciA8amVucy53aWts
YW5kZXJAbGluYXJvLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGkgQmVydHJhbmQsDQo+Pj4gDQo+
Pj4gT24gVHVlLCBGZWIgMywgMjAyNiBhdCA2OjM44oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPj4+
IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4+PiANCj4+Pj4gTVNHX1NFTkQy
IGFuZCBkaXJlY3QgcmVxdWVzdCB2YWxpZGF0aW9uIGZhaWx1cmVzIGFyZSBzaWxlbnQsIG1ha2lu
ZyBpdA0KPj4+PiBoYXJkIHRvIGRpYWdub3NlIGludmFsaWQgSURzLCBvdmVyc2l6ZWQgbWVzc2Fn
ZXMsIG9yIHVuc3VwcG9ydGVkDQo+Pj4+IGRlc3RpbmF0aW9uIHR5cGVzLg0KPj4+PiANCj4+Pj4g
QWRkIGRlYnVnIGxvZ3MgZm9yIHBhcmFtZXRlciB2YWxpZGF0aW9uIGZhaWx1cmVzOg0KPj4+PiAt
IGludmFsaWQgZW5kcG9pbnQgSURzDQo+Pj4+IC0gb3ZlcnNpemVkIG1lc3NhZ2VzDQo+Pj4+IC0g
dW5zdXBwb3J0ZWQgZGVzdGluYXRpb24gdHlwZXMNCj4+Pj4gLSBpbnZhbGlkIHNlbmRlci9yZWNl
aXZlciBjb21iaW5hdGlvbnMNCj4+Pj4gLSByYXRlbGltaXQgTVNHX1NFTkQyIGJ1c3kgZmFpbHVy
ZXMgdG8gYXZvaWQgbG9nIGZsb29kaW5nDQo+Pj4+IA0KPj4+PiBObyBmdW5jdGlvbmFsIGNoYW5n
ZXMuDQo+Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFu
ZC5tYXJxdWlzQGFybS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9t
c2cuYyB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+IDEg
ZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspDQo+Pj4+IA0KPj4+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3RlZS9mZmFfbXNnLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9tc2cuYw0K
Pj4+PiBpbmRleCA5MjhmMjY5ZjZjM2EuLmNjMjczYzlhOGU4MCAxMDA2NDQNCj4+Pj4gLS0tIGEv
eGVuL2FyY2gvYXJtL3RlZS9mZmFfbXNnLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3RlZS9m
ZmFfbXNnLmMNCj4+Pj4gQEAgLTQsNiArNCw3IEBADQo+Pj4+ICovDQo+Pj4+IA0KPj4+PiAjaW5j
bHVkZSA8eGVuL2NvbnN0Lmg+DQo+Pj4+ICsjaW5jbHVkZSA8eGVuL2xpYi5oPg0KPj4+PiAjaW5j
bHVkZSA8eGVuL3NpemVzLmg+DQo+Pj4+ICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4NCj4+Pj4gDQo+
Pj4+IEBAIC0xMDAsNiArMTAxLDcgQEAgdm9pZCBmZmFfaGFuZGxlX21zZ19zZW5kX2RpcmVjdF9y
ZXEoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVpbnQzMl90IGZpZCkNCj4+Pj4gICAgaWYg
KCAhZmZhX2Z3X3N1cHBvcnRzX2ZpZChmaWQpICkNCj4+Pj4gICAgew0KPj4+PiAgICAgICAgcmV0
ID0gRkZBX1JFVF9OT1RfU1VQUE9SVEVEOw0KPj4+PiArICAgICAgICBnZHByaW50ayhYRU5MT0df
REVCVUcsICJmZmE6IGRpcmVjdCByZXEgZmlkICUjeCBub3Qgc3VwcG9ydGVkXG4iLCBmaWQpOw0K
Pj4+PiAgICAgICAgZ290byBvdXQ7DQo+Pj4+ICAgIH0NCj4+Pj4gDQo+Pj4+IEBAIC0xMDgsNiAr
MTEwLDkgQEAgdm9pZCBmZmFfaGFuZGxlX21zZ19zZW5kX2RpcmVjdF9yZXEoc3RydWN0IGNwdV91
c2VyX3JlZ3MgKnJlZ3MsIHVpbnQzMl90IGZpZCkNCj4+Pj4gICAgICAgICAoc3JjX2RzdCAmIEdF
Tk1BU0soMTUsMCkpID09IGZmYV9nZXRfdm1faWQoZCkgKQ0KPj4+PiAgICB7DQo+Pj4+ICAgICAg
ICByZXQgPSBGRkFfUkVUX0lOVkFMSURfUEFSQU1FVEVSUzsNCj4+Pj4gKyAgICAgICAgZ2Rwcmlu
dGsoWEVOTE9HX0RFQlVHLA0KPj4+PiArICAgICAgICAgICAgICAgICAiZmZhOiBkaXJlY3QgcmVx
IGludmFsaWQgc3JjL2RzdCAlI3hcbiIsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICh1aW50MzJf
dClzcmNfZHN0KTsNCj4+Pj4gICAgICAgIGdvdG8gb3V0Ow0KPj4+PiAgICB9DQo+Pj4+IA0KPj4+
PiBAQCAtMTE1LDYgKzEyMCw5IEBAIHZvaWQgZmZhX2hhbmRsZV9tc2dfc2VuZF9kaXJlY3RfcmVx
KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1aW50MzJfdCBmaWQpDQo+Pj4+ICAgIGlmICgg
IUZGQV9JRF9JU19TRUNVUkUoc3JjX2RzdCAmIEdFTk1BU0soMTUsMCkpICkNCj4+Pj4gICAgew0K
Pj4+PiAgICAgICAgcmV0ID0gRkZBX1JFVF9OT1RfU1VQUE9SVEVEOw0KPj4+PiArICAgICAgICBn
ZHByaW50ayhYRU5MT0dfREVCVUcsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICJmZmE6IGRpcmVj
dCByZXEgdG8gbm9uLXNlY3VyZSBkc3QgJSN4XG4iLA0KPj4+PiArICAgICAgICAgICAgICAgICAo
dWludDMyX3QpKHNyY19kc3QgJiBHRU5NQVNLKDE1LCAwKSkpOw0KPj4+PiAgICAgICAgZ290byBv
dXQ7DQo+Pj4+ICAgIH0NCj4+Pj4gDQo+Pj4+IEBAIC0xNjYsNyArMTc0LDEyIEBAIHN0YXRpYyBp
bnQzMl90IGZmYV9tc2dfc2VuZDJfdm0odWludDE2X3QgZHN0X2lkLCBjb25zdCB2b2lkICpzcmNf
YnVmLA0KPj4+PiAgICAvKiBUaGlzIGlzIGFsc28gY2hlY2tpbmcgdGhhdCBkZXN0IGlzIG5vdCBz
cmMgKi8NCj4+Pj4gICAgcmV0ID0gZmZhX2VuZHBvaW50X2RvbWFpbl9sb29rdXAoZHN0X2lkLCAm
ZHN0X2QsICZkc3RfY3R4KTsNCj4+Pj4gICAgaWYgKCByZXQgKQ0KPj4+PiArICAgIHsNCj4+Pj4g
KyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0RFQlVHLA0KPj4+PiArICAgICAgICAgICAgICAgICAi
ZmZhOiBtc2dfc2VuZDIgbG9va3VwIGZhaWxlZDogZHN0ICUjeCByZXQgJWRcbiIsDQo+Pj4+ICsg
ICAgICAgICAgICAgICAgIGRzdF9pZCwgcmV0KTsNCj4+Pj4gICAgICAgIHJldHVybiByZXQ7DQo+
Pj4+ICsgICAgfQ0KPj4+PiANCj4+Pj4gICAgLyogVGhpcyBhbHNvIGNoZWNrcyB0aGF0IGRlc3Rp
bmF0aW9uIGhhcyBzZXQgYSBSeCBidWZmZXIgKi8NCj4+Pj4gICAgcmV0ID0gZmZhX3J4X2FjcXVp
cmUoZHN0X2N0eCAsICZyeF9idWYsICZyeF9zaXplKTsNCj4+Pj4gQEAgLTE5OSw2ICsyMTIsMTIg
QEAgc3RhdGljIGludDMyX3QgZmZhX21zZ19zZW5kMl92bSh1aW50MTZfdCBkc3RfaWQsIGNvbnN0
IHZvaWQgKnNyY19idWYsDQo+Pj4+ICAgIC8qIHJlY2VpdmVyIHJ4IGJ1ZmZlciB3aWxsIGJlIHJl
bGVhc2VkIGJ5IHRoZSByZWNlaXZlciovDQo+Pj4+IA0KPj4+PiBvdXRfdW5sb2NrOg0KPj4+PiAr
ICAgIGlmICggcmV0ICkNCj4+Pj4gKyAgICB7DQo+Pj4+ICsgICAgICAgIGlmICggcmV0ICE9IEZG
QV9SRVRfQlVTWSB8fCBwcmludGtfcmF0ZWxpbWl0KCkgKQ0KPj4+IA0KPj4+IFNob3VsZG4ndCB0
aGlzIGJlICYmID8NCj4+IA0KPj4gVGhlIGludGVudCBoZXJlIGlzIHRvIGxvZyBhbGwgbm9uIEJV
U1kgZXJyb3JzIGJ1dCBvbmx5IGxvZyBCVVNZIHdoZW4gcmF0ZWxpbWl0IGFsbG93cw0KPj4gdG8g
cmVkdWNlIHRoZSBhbW91bnQgb2YgbG9ncyBpbiBjYXNlIG9mIHNvbWVvbmUgcG9sbGluZyB3aGVu
IHRoZSByZWNlaXZlciBSWCBidWZmZXINCj4+IGlzIGJ1c3kuDQo+PiANCj4+IE1heWJlIEkgc2hv
dWxkIGFkZCBhIGNvbW1lbnQgdG8gbWFrZSB0aGF0IGNsZWFyZXIgPw0KDQpJIHdpbGwgYWRkIGEg
Y29tbWVudCBpbiB2Mi4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBZZXMsIHBsZWFzZS4N
Cj4gDQo+IENoZWVycywNCj4gSmVucw0KPiANCj4+IA0KPj4gQ2hlZXJzDQo+PiBCZXJ0cmFuZA0K
Pj4gDQo+Pj4gDQo+Pj4gQ2hlZXJzLA0KPj4+IEplbnMNCj4+PiANCj4+Pj4gKyAgICAgICAgICAg
IGdkcHJpbnRrKFhFTkxPR19ERUJVRywgImZmYTogbXNnX3NlbmQyIHRvICUjeCBmYWlsZWQ6ICVk
XG4iLA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgZHN0X2lkLCByZXQpOw0KPj4+PiArICAg
IH0NCj4+Pj4gICAgcmN1X3VubG9ja19kb21haW4oZHN0X2QpOw0KPj4+PiAgICBpZiAoICFyZXQg
KQ0KPj4+PiAgICAgICAgZmZhX3JhaXNlX3J4X2J1ZmZlcl9mdWxsKGRzdF9kKTsNCj4+Pj4gQEAg
LTIyNiw3ICsyNDUsMTEgQEAgaW50MzJfdCBmZmFfaGFuZGxlX21zZ19zZW5kMihzdHJ1Y3QgY3B1
X3VzZXJfcmVncyAqcmVncykNCj4+Pj4gDQo+Pj4+ICAgIHJldCA9IGZmYV90eF9hY3F1aXJlKHNy
Y19jdHgsICZ0eF9idWYsICZ0eF9zaXplKTsNCj4+Pj4gICAgaWYgKCByZXQgIT0gRkZBX1JFVF9P
SyApDQo+Pj4+ICsgICAgew0KPj4+PiArICAgICAgICBnZHByaW50ayhYRU5MT0dfREVCVUcsDQo+
Pj4+ICsgICAgICAgICAgICAgICAgICJmZmE6IG1zZ19zZW5kMiBUWCBhY3F1aXJlIGZhaWxlZDog
JWRcbiIsIHJldCk7DQo+Pj4+ICAgICAgICByZXR1cm4gcmV0Ow0KPj4+PiArICAgIH0NCj4+Pj4g
DQo+Pj4+ICAgIC8qIGNyZWF0ZSBhIGNvcHkgb2YgdGhlIG1lc3NhZ2UgaGVhZGVyICovDQo+Pj4+
ICAgIG1lbWNweSgmc3JjX21zZywgdHhfYnVmLCBzaXplb2Yoc3JjX21zZykpOw0KPj4+PiBAQCAt
MjM4LDYgKzI2MSw5IEBAIGludDMyX3QgZmZhX2hhbmRsZV9tc2dfc2VuZDIoc3RydWN0IGNwdV91
c2VyX3JlZ3MgKnJlZ3MpDQo+Pj4+ICAgICAgICAgZHN0X2lkID09IGZmYV9nZXRfdm1faWQoc3Jj
X2QpICkNCj4+Pj4gICAgew0KPj4+PiAgICAgICAgcmV0ID0gRkZBX1JFVF9JTlZBTElEX1BBUkFN
RVRFUlM7DQo+Pj4+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19ERUJVRywNCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgImZmYTogbXNnX3NlbmQyIGludmFsaWQgc3JjL2RzdCBzcmMgJSN4IGRzdCAl
I3hcbiIsDQo+Pj4+ICsgICAgICAgICAgICAgICAgIHNyY19pZCwgZHN0X2lkKTsNCj4+Pj4gICAg
ICAgIGdvdG8gb3V0Ow0KPj4+PiAgICB9DQo+Pj4+IA0KPj4+PiBAQCAtMjQ2LDYgKzI3Miw5IEBA
IGludDMyX3QgZmZhX2hhbmRsZV9tc2dfc2VuZDIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3Mp
DQo+Pj4+ICAgICAgICBpZiAoc3JjX21zZy5tc2dfb2Zmc2V0IDwgc2l6ZW9mKHN0cnVjdCBmZmFf
cGFydF9tc2dfcnh0eF8xXzEpKQ0KPj4+PiAgICAgICAgew0KPj4+PiAgICAgICAgICAgIHJldCA9
IEZGQV9SRVRfSU5WQUxJRF9QQVJBTUVURVJTOw0KPj4+PiArICAgICAgICAgICAgZ2RwcmludGso
WEVOTE9HX0RFQlVHLA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgImZmYTogbXNnX3NlbmQy
IGludmFsaWQgbXNnX29mZnNldCAldSAodjEuMSlcbiIsDQo+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICBzcmNfbXNnLm1zZ19vZmZzZXQpOw0KPj4+PiAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4+
PiAgICAgICAgfQ0KPj4+PiAgICAgICAgLyogU2V0IHV1aWQgdG8gTmlsIFVVSUQgZm9yIHYxLjEg
Z3Vlc3RzICovDQo+Pj4+IEBAIC0yNTUsNiArMjg0LDkgQEAgaW50MzJfdCBmZmFfaGFuZGxlX21z
Z19zZW5kMihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+Pj4gICAgZWxzZSBpZiAoIHNy
Y19tc2cubXNnX29mZnNldCA8IHNpemVvZihzdHJ1Y3QgZmZhX3BhcnRfbXNnX3J4dHhfMV8yKSAp
DQo+Pj4+ICAgIHsNCj4+Pj4gICAgICAgIHJldCA9IEZGQV9SRVRfSU5WQUxJRF9QQVJBTUVURVJT
Ow0KPj4+PiArICAgICAgICBnZHByaW50ayhYRU5MT0dfREVCVUcsDQo+Pj4+ICsgICAgICAgICAg
ICAgICAgICJmZmE6IG1zZ19zZW5kMiBpbnZhbGlkIG1zZ19vZmZzZXQgJXUgKHYxLjIpXG4iLA0K
Pj4+PiArICAgICAgICAgICAgICAgICBzcmNfbXNnLm1zZ19vZmZzZXQpOw0KPj4+PiAgICAgICAg
Z290byBvdXQ7DQo+Pj4+ICAgIH0NCj4+Pj4gDQo+Pj4+IEBAIC0yNjMsNiArMjk1LDkgQEAgaW50
MzJfdCBmZmFfaGFuZGxlX21zZ19zZW5kMihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+
Pj4gICAgICAgICAgICBzcmNfbXNnLm1zZ19zaXplID4gKHR4X3NpemUgLSBzcmNfbXNnLm1zZ19v
ZmZzZXQpICkNCj4+Pj4gICAgew0KPj4+PiAgICAgICAgcmV0ID0gRkZBX1JFVF9JTlZBTElEX1BB
UkFNRVRFUlM7DQo+Pj4+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19ERUJVRywNCj4+Pj4gKyAg
ICAgICAgICAgICAgICAgImZmYTogbXNnX3NlbmQyIGludmFsaWQgbXNnX3NpemUgJXUgb2Zmc2V0
ICV1IHR4ICV6dVxuIiwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgc3JjX21zZy5tc2dfc2l6ZSwg
c3JjX21zZy5tc2dfb2Zmc2V0LCB0eF9zaXplKTsNCj4+Pj4gICAgICAgIGdvdG8gb3V0Ow0KPj4+
PiAgICB9DQo+Pj4+IA0KPj4+PiBAQCAtMjcyLDYgKzMwNyw4IEBAIGludDMyX3QgZmZhX2hhbmRs
ZV9tc2dfc2VuZDIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+Pj4+ICAgICAgICBpZiAo
ICFmZmFfZndfc3VwcG9ydHNfZmlkKEZGQV9NU0dfU0VORDIpICkNCj4+Pj4gICAgICAgIHsNCj4+
Pj4gICAgICAgICAgICByZXQgPSBGRkFfUkVUX05PVF9TVVBQT1JURUQ7DQo+Pj4+ICsgICAgICAg
ICAgICBnZHByaW50ayhYRU5MT0dfREVCVUcsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAi
ZmZhOiBtc2dfc2VuZDIgdG8gU1Agbm90IHN1cHBvcnRlZFxuIik7DQo+Pj4+ICAgICAgICAgICAg
Z290byBvdXQ7DQo+Pj4+ICAgICAgICB9DQo+Pj4+ICAgICAgICAvKg0KPj4+PiBAQCAtMjg4LDYg
KzMyNSw4IEBAIGludDMyX3QgZmZhX2hhbmRsZV9tc2dfc2VuZDIoc3RydWN0IGNwdV91c2VyX3Jl
Z3MgKnJlZ3MpDQo+Pj4+IA0KPj4+PiAgICAgICAgcmV0ID0gZmZhX3NpbXBsZV9jYWxsKEZGQV9N
U0dfU0VORDIsDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKCh1aW50MzJfdClm
ZmFfZ2V0X3ZtX2lkKHNyY19kKSkgPDwgMTYsIDAsIDAsIDApOw0KPj4+PiArICAgICAgICBpZiAo
IHJldCApDQo+Pj4+ICsgICAgICAgICAgICBnZHByaW50ayhYRU5MT0dfREVCVUcsICJmZmE6IG1z
Z19zZW5kMiB0byBTUCBmYWlsZWQ6ICVkXG4iLCByZXQpOw0KPj4+PiAgICB9DQo+Pj4+ICAgIGVs
c2UgaWYgKCBJU19FTkFCTEVEKENPTkZJR19GRkFfVk1fVE9fVk0pICkNCj4+Pj4gICAgew0KPj4+
PiBAQCAtMjk1LDcgKzMzNCwxMSBAQCBpbnQzMl90IGZmYV9oYW5kbGVfbXNnX3NlbmQyKHN0cnVj
dCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4+PiAgICAgICAgcmV0ID0gZmZhX21zZ19zZW5kMl92
bShkc3RfaWQsIHR4X2J1ZiwgJnNyY19tc2cpOw0KPj4+PiAgICB9DQo+Pj4+ICAgIGVsc2UNCj4+
Pj4gKyAgICB7DQo+Pj4+ICAgICAgICByZXQgPSBGRkFfUkVUX0lOVkFMSURfUEFSQU1FVEVSUzsN
Cj4+Pj4gKyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0RFQlVHLA0KPj4+PiArICAgICAgICAgICAg
ICAgICAiZmZhOiBtc2dfc2VuZDIgdG8gVk0gZGlzYWJsZWQgKGRzdCAlI3gpXG4iLCBkc3RfaWQp
Ow0KPj4+PiArICAgIH0NCj4+Pj4gDQo+Pj4+IG91dDoNCj4+Pj4gICAgZmZhX3R4X3JlbGVhc2Uo
c3JjX2N0eCk7DQo+Pj4+IEBAIC0zMTEsNiArMzU0LDcgQEAgdm9pZCBmZmFfaGFuZGxlX3J1bihz
dHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdWludDMyX3QgZmlkKQ0KPj4+PiAgICBpZiAoICFm
ZmFfZndfc3VwcG9ydHNfZmlkKGZpZCkgKQ0KPj4+PiAgICB7DQo+Pj4+ICAgICAgICByZXQgPSBG
RkFfUkVUX05PVF9TVVBQT1JURUQ7DQo+Pj4+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19ERUJV
RywgImZmYTogcnVuIGZpZCAlI3ggbm90IHN1cHBvcnRlZFxuIiwgZmlkKTsNCj4+Pj4gICAgICAg
IGdvdG8gb3V0Ow0KPj4+PiAgICB9DQo+Pj4+IA0KPj4+PiBAQCAtMzIyLDYgKzM2Niw3IEBAIHZv
aWQgZmZhX2hhbmRsZV9ydW4oc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVpbnQzMl90IGZp
ZCkNCj4+Pj4gICAgaWYgKCAhRkZBX0lEX0lTX1NFQ1VSRShkc3QgPj4gMTYpICkNCj4+Pj4gICAg
ew0KPj4+PiAgICAgICAgcmV0ID0gRkZBX1JFVF9OT1RfU1VQUE9SVEVEOw0KPj4+PiArICAgICAg
ICBnZHByaW50ayhYRU5MT0dfREVCVUcsICJmZmE6IHJ1biB0byBub24tc2VjdXJlIGRzdCAlI3hc
biIsIGRzdCk7DQo+Pj4+ICAgICAgICBnb3RvIG91dDsNCj4+Pj4gICAgfQ0KPj4+PiANCj4+Pj4g
LS0NCj4+Pj4gMi41MC4xIChBcHBsZSBHaXQtMTU1KQ0KDQoNCg==

