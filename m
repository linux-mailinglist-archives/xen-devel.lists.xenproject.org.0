Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AAAC98056
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 16:21:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175790.1500413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ5hd-00038f-Jv; Mon, 01 Dec 2025 15:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175790.1500413; Mon, 01 Dec 2025 15:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ5hd-00037E-GR; Mon, 01 Dec 2025 15:20:37 +0000
Received: by outflank-mailman (input) for mailman id 1175790;
 Mon, 01 Dec 2025 15:20:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1Uc=6H=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vQ5hc-000378-No
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 15:20:37 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4559aa5b-cec9-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 16:20:29 +0100 (CET)
Received: from DUZPR01CA0317.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::27) by AM0PR08MB5444.eurprd08.prod.outlook.com
 (2603:10a6:208:185::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 15:20:24 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::d0) by DUZPR01CA0317.outlook.office365.com
 (2603:10a6:10:4ba::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 15:20:14 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Mon, 1 Dec 2025 15:20:23 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PA6PR08MB10783.eurprd08.prod.outlook.com (2603:10a6:102:3d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 15:19:16 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 15:19:16 +0000
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
X-Inumbo-ID: 4559aa5b-cec9-11f0-9d19-b5c5bf9af7f9
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=W/EnZEKqbRsBu7pGMmY/CsAX1fh69IJcEIEp2ajT5U54L6S9V+wexsd0wGcFovhTl/XiXkLb/iVzMT0jUxKbtRL6fAG+Hmcdvb1tEusodjlAt5ZVhe1/bgCfs0j2eXQ4Pjv2uIWviGiAV+Wg1SkBrAZ3uAWLHXK4R3utxSdtzJVE7CX/ICA+A9/uNR0PMZUPHt7ngJm5B+hn0A/tG1BwNMHNdcDZht4TxKQGoQaESlIGFvkZU+GCiUKgL0Ef2wtcYsORuRApdXxABhAq8dqWlKlQfwVCD9mVYMpZ0VkFqhc6RA+6XBnYX14TCcIwwaSHISyFRjAskXB76lUvSoNdSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18k3Utn2gRpA8r7qlAAlTLCfkCVEiGmzbe6H6xoPBXM=;
 b=MfT/Ve5a8YFnQIg8dNxcbBVDchSq0yZjlg+7ovQHlUSnEBmadMsWNNTTAMW8IhETNO3N2uLiWTL0SAeU5C7RnPJjQgqxUr+hnJQCTpOWZyfomYfnMe6JJ+t2ESLakgArgrEsiDDPI+lMgrRUVRr/uxc89RuhxMV1pSZMXL34/M/6qaqMnoHYlrbTmR4IzvUnb3gIuiNvy70RXMjp9ZTLaF4cTkbWZ60wmNp5oPkYhZsdToROdRC7Bep5r7YydoXf75dKVRiDubvz2Q7QupEvqjyn8uYLJKEhlsPOjIDjsukBVcVMGhZmB6wcLg8TvUmD5ng/MnVf5m+tkajn8u1LdA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18k3Utn2gRpA8r7qlAAlTLCfkCVEiGmzbe6H6xoPBXM=;
 b=BPDteHHWpEsAZIHfY8UHrabngBWXhMH4fXoNov6S31buVQcSZ6O+T6se/BoVlA9FKTKeeon3MlFsdLNNxJRVfilwKUJbAATFC2jAV/zjo4/RcG0I91lIh3JDPpQzBFsCRDs/2FVRKJZZUgkb7Yfl7DUw14bxPpFEW6xRIzqWFt4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfbIu2pHtg7J8J/KjEvItPVQXURbRGA+xo5tk4tyFI8L9eMhdONPIIfCoARcmlzMKJz018jxRFTtWFoXbpHc3wwHFauuOK1B6mEmU7Nc1b6H/M810vdde3Ai/V9+pwcBmGdRJxuKqz/4o1BkRQd7C7qfCGc0qqt3pui4NexQqXCj6t8IZpz2RSehqxQM7JPvCo1wHIgbxaQC46jDaLUcMbYdda10rrZCoNbGIvTjX+s0bCBJvlMCT4PBqa714eNJlmbVYDUpUJ6grv+8Fm1ZTpKvQLb9FSCzreahn/AeOhF6ykZ2nOJxiEpq0MYLrkmRsDAoBjnNuEYFeVsCcXHKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18k3Utn2gRpA8r7qlAAlTLCfkCVEiGmzbe6H6xoPBXM=;
 b=SjGGpmAtgzkncVzWvXOa7s0QHLlOVv2U5sbHNzzyJEb25dYjg9SAK1h/2dagXVQq9f/DcTuydELofnh5+39VbrOgPSpqueaRoR9Q0BUPQAXhQNE3iYcpEhj7hsvJ6z1pHgYc4mkc1FWdnK+8K13Vle2Ng+R48rnSoZJ04vZusoUJ98SAfyY32sMdG+ebMkJmvxesj904mQwdOJRKnT2qxe+CjvBWL4/49dUdbGAVxL0n1V9w8XtcJgRK7Fsf+w5EE0TIXLnTDeLsf3SD3UxkrSACAYynXfZRhOy7BgBS/ytkoDx9m4Ofw/CXoy/futF22N88bCKfzxWZziglS68uMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18k3Utn2gRpA8r7qlAAlTLCfkCVEiGmzbe6H6xoPBXM=;
 b=BPDteHHWpEsAZIHfY8UHrabngBWXhMH4fXoNov6S31buVQcSZ6O+T6se/BoVlA9FKTKeeon3MlFsdLNNxJRVfilwKUJbAATFC2jAV/zjo4/RcG0I91lIh3JDPpQzBFsCRDs/2FVRKJZZUgkb7Yfl7DUw14bxPpFEW6xRIzqWFt4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 01/10] xen/arm: ffa: add FF-A v1.2 function IDs
Thread-Topic: [PATCH 01/10] xen/arm: ffa: add FF-A v1.2 function IDs
Thread-Index: AQHcX7Xto0AEat0+902uj2o4W4BR4LUM4lEAgAAJ7IA=
Date: Mon, 1 Dec 2025 15:19:16 +0000
Message-ID: <89AC0E6C-8ED0-48CB-8A86-5169592F61EF@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
 <2264daf90cbb25b9a60ebe8edbebb8988d95966b.1764254975.git.bertrand.marquis@arm.com>
 <CAHUa44E=JChox1T8K_kRBQ2nt1QutsDAaMGf3bzD=VO12LFiPg@mail.gmail.com>
In-Reply-To:
 <CAHUa44E=JChox1T8K_kRBQ2nt1QutsDAaMGf3bzD=VO12LFiPg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.200.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PA6PR08MB10783:EE_|DB1PEPF000509EF:EE_|AM0PR08MB5444:EE_
X-MS-Office365-Filtering-Correlation-Id: 7554c5f3-6ef0-414b-1d37-08de30ed25d1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VmoydFVGS3NQMFlEUVFxTHFLYzgyMHNPeXRDQmxxMzJqTE1MY2RiaEU3eXlQ?=
 =?utf-8?B?bmdVNkI2ZlM0WXc1aUp5ZnJZRGRmN3lxMWpIWkNCWmpMNHZ5bUwrMnhBdGFo?=
 =?utf-8?B?bXluZ3RPaFFxeEhyZWkrU1V1YkVySGpEOUh1WE8rbEwwYXVtMlN0NlVxZ3RJ?=
 =?utf-8?B?bUEyRUtxSW9YYXVBY2lrVkFmeWJTckp2U3pjVnlDbzBrcFFlNWdKS3JHTmcz?=
 =?utf-8?B?b1ptSzhBZnZaNmxMTGVUaFhPOXA2U2p3TWJNRkl2N0dKVHhhYThQQkdOaFhl?=
 =?utf-8?B?NWtBaStwTmNoRXFDbEd1SEM1Sk50Z2tIajVuZ3hqa3dtS2hZaUphZmpnMW94?=
 =?utf-8?B?RFdsQndMSW1ITjNHVmFuZU5qOTZyRklUSGU0bmdyamd6cG54TGxXNEpyZk94?=
 =?utf-8?B?U0YwZU1hbDBjKzVqODhhcVBxMGNjcDJWYVJYY3JxZkJNd0dpakJySVEzV1E3?=
 =?utf-8?B?d3lFM3lRQXp3UW5wQXFxSHNNc09jM2FIa2czcHJhWExacFlocWNrSzNWQWVQ?=
 =?utf-8?B?blp3NVpZT2V3UE9MdldTZDZWbWlBS25VNzE5U0dLOFVZOGNPa1l3c3RXN01N?=
 =?utf-8?B?VEVaY3lMbDV6YUZOdTgyajM0K0FMZldialpuNktuUXhMeHAwWm42MWtOTktN?=
 =?utf-8?B?RHZCU0JBeWNtZkJvRjN1M3ZmVU5BZWpScHJEWTl1bWpCbkpEV2c2aWtPUEV4?=
 =?utf-8?B?ZFNoY3MrVzBaSXA2VVV2QmRlRVUwZHp4NnRCWWcrL2VHRzlxYzYwRWZqWEpN?=
 =?utf-8?B?aUVXeEZXcGV1TlJteWpsUmVsZG9qaWozRGI4ZlZJUUJzZFV5ck9vUDBhS0pL?=
 =?utf-8?B?VXE1Nm9VMVVkMjNrMEw2emRyL0lXNFdRK0lENFpZdFhWNHczZ0J2THRwMnlv?=
 =?utf-8?B?YXdjcEgvamdWTHZqSnRGaC8zbGcxcmg2UkVvWmsyV2xCRkhBRW03UkYyNW9B?=
 =?utf-8?B?NVlBVzFnVnlONUpEeHdFdVJvd29GaG1uWk4yUFovNlBLS21HYVpJemVwYzhF?=
 =?utf-8?B?MlNhTHIvbWtWaTRJdDBPNCt2TkxlalZ4djQ1VmJabVVIMWV5M2w0SWp0Z1hq?=
 =?utf-8?B?M1k2ajlDdis1aXB5SjdnM2h6K3NleE1ORjE2QVBITW9RdFoxb3FJNlRuSm9m?=
 =?utf-8?B?bEl3ejJxSDUwZ0gwM2RlOVVrNlVCVVFiSU5oQllnK1h5cTFjU0hVTjlHemVD?=
 =?utf-8?B?aGx1NWhJeENkU05FdzRhZGRRLzBpSGs2WVpHM29CU0RrZzBZeHZTekpaU1VY?=
 =?utf-8?B?NThmVmJVUXY2Z091d2J6OEhtM01UUy91K0R4Q3g3VUxqTjBGUnkrdlpqVmtu?=
 =?utf-8?B?cVpKaGUraEpCZlZNRmYrWklOVEFZc29jaDFUZDRTZEZhLzJvUFI0Vlc4T2w5?=
 =?utf-8?B?T2haVSswMDM2R1R0Rk1iWUV1d20zcVg1MndnU0xheU5WU1dzNWdhQnZYV2U3?=
 =?utf-8?B?YWZJa3FZNXhVQWpzeGJsR0FScGRvanlhMi8yV3A3cUEvbnFvZUcrbllzRTRw?=
 =?utf-8?B?V1lWQngyNTZXcit3ZUhQOGhUaUFSbDZqQmtaR3ZPdzhnWTNQWVJPVm9PdkdD?=
 =?utf-8?B?V1NpdmhkdzN2Z2RpdXBEZjRMdS9PZmt5SzAveVd0MVhrc1F6VmJ3LzFzTHgz?=
 =?utf-8?B?T2hXQ09ERjZ0ZzF4MGxTOWZEQ0M5blVrYzljZjNpOUVDZzhWMGllbGpjRi9q?=
 =?utf-8?B?NnhNQW1mLzlURVJOOE1QcGZlQmp2ZlBEeEV0QVdzamNtdlo2SC9nOEkyWnYv?=
 =?utf-8?B?Y1Y3a21ENEpYT1I5akwzQVF1N0EzTzNnYUxuZlN5WXJ5UERCRmxkMTBnSXk4?=
 =?utf-8?B?d21OUzhMc2krQUI4RHp5MHRoQlpjRXZndDhMcW82S0JWTG5BVkVzb0hxbFAy?=
 =?utf-8?B?WXpmc2c2UTZWMm4vbVFBSllNQTdWK2hEV2JWdHhvbGpFbGVKam9xcDdxUUYw?=
 =?utf-8?B?Yzg0ZXNWdUxFZzVac1Myd2E0czhoMFZIamdueW9vdjQ2MnlJZHV3ZkU1Q2NG?=
 =?utf-8?B?aXZ6azhhRzV4UmFpV3A5QmdzaUxDcmdZZUo4ZU92TnYxdFdsWlRqcmV3REFr?=
 =?utf-8?B?clNscjE2cnJQWHFtb3hWbDdrS3paUjNLbFQ4Zz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <77D77DC6EA329845886B6C0E48CF5442@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10783
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6903c98f-75ef-4fe8-a002-08de30ecfe0f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|376014|1800799024|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzBQeVpXU3N1Z0k3UVRvUVV2ZDRrMFZnY3cxWkx2RUtzZUpobXMyY1Uzbm44?=
 =?utf-8?B?djhDSlkzc3p3TGZYK1ZPSkhLOCtQeStUS1dRL3NibVhiVnAxOGlMdFJyaTJ0?=
 =?utf-8?B?VnE2ZlZwS3g3WTNWTE1tMXNieW9tcmFmNkFtTHZHZ2dnUmpybytLMVRKZDB6?=
 =?utf-8?B?c2FCYlU4UXdNTFp0RjNpb05GaVBRUHNCS3BIeXdYSXlNenBwRk9LTmFBNjky?=
 =?utf-8?B?d0xDUWFHZ1V5T2NLTGdzSXZKNVhVZzU0cGJhODB5ODRtS3pFM0Q2UEJ5RmdV?=
 =?utf-8?B?ZU8wYmMrUklTZ3BzMWVHZzk1R2VLVWpUT3k2UTU0dEpOaFhEMkdwR2hjTThX?=
 =?utf-8?B?YktNWmlJMTJPOU5mWFlzNm5XbjVFL3FCMngralZWOFB4MzAyOWpMUW9IQjZ4?=
 =?utf-8?B?NzVVVWNvTXVTQ29QSUpUUFlweDhoVzZVOExUS1piVWFGRGFScGlBdGFvcFF4?=
 =?utf-8?B?NCswK1FWbXpUNlcraTQzRExzaUswbFozSm13Qm1oSkp5VVlSNGJnZnJVMk9D?=
 =?utf-8?B?RldRdHhwaExmKzU3aVQ1UEIxcnRFUHRBZjZnMHN2RDNablNqcFozVG14dGl5?=
 =?utf-8?B?ZUg1UnlTQnVzVDVxUHp6ZEpyN2JJU2tPcDF2aUw0L1Q3NmVWT2FKOG1ic29x?=
 =?utf-8?B?cG5ZSTFmSjNQcmYyVEpwRjB2a0d6UUFQVW56QmQxWUVFR0dJRmRpOERaaXVF?=
 =?utf-8?B?WE1yd2VKUENHT3p6R0xzUzcvd3Q5N3pNc1BTWk5uTlo1aVpXNTRpRDR2WGtL?=
 =?utf-8?B?Q3RPOEtJVHB2V3pBeVFacnRsNWtQeHh0NU9ZVGZ5bW9NWVdIYkQxa1g3RWZi?=
 =?utf-8?B?a1lneWkwNVcrcWR1blYwN2FTYnh0dEtkaGNQVmlqbkZ0aXRBUzNaNjFWN1JN?=
 =?utf-8?B?QTJZckFRWW1hWWJOaXVKQXkxWFJqdU96dDhSZGhpa2hOTWd3Q3JIS2FSWnMr?=
 =?utf-8?B?MHhBMFBwVXFidFQ0QXVKS2xKODNDOW84d09lK3BKVTNqcURpNWhPb3VuMWRT?=
 =?utf-8?B?cWdZZEdPVmJqbkxQSlI2VkowemVIVlpGOVkxam1iOVVSZ3ZoTTR2WENoVm9S?=
 =?utf-8?B?NVRUdndCQnBZTHcxdEQ1d3BCcWRuWG9yYlZEYjh5Y2h6UFlJL0NyWkZpcXpC?=
 =?utf-8?B?NDdjMlpNVXNQYjc3VDV0c242MXllaytaVXV4WWV5c3Buakx0U2FXQ0lyNkZt?=
 =?utf-8?B?SlU1L2lqTndyckN0ZVpIaFhEK3VLN1ZHbXdZUE4zMGdoQVlMNVpHM0gxbDBL?=
 =?utf-8?B?akM1cktxa1NMcHVMaTZrWGVnbU03azRoWlFsRlhQVlFPVzNPek1NYWVxSnRS?=
 =?utf-8?B?a1EvZVdPZkdaV21HelF0bEJPZVVHSkVaMGhTTDIvZ3ZaZ1NkTS8yTGJSMUll?=
 =?utf-8?B?eHU4MFRkQjlrQlBxalJOc0RMOUo2b0tmR2ErODRQMlpoenZkYTRBTU5GVEdO?=
 =?utf-8?B?dWVEWDdxVWdPQk4yNTRId3c5bzBGVEdQUGRhSnpSRzJ5UTM3V05YT0tlVTBo?=
 =?utf-8?B?dGVUemw2WnZKeEZyM3RiQ2RLWDJVdHpiaWp1S2FpVWo3ZTJ1RDh5dVp0OGJM?=
 =?utf-8?B?TVFqVEZxYXdlSXNWNy9lcmtWSlJSWEZwQzB3d01SMnJ5OVFjSzRVS0Qya3lz?=
 =?utf-8?B?YjFtdDFrenovRmwrOXRmSDJ6ZHNORFdDVnVPQWorck9ybnUzK0prYUl4NFBW?=
 =?utf-8?B?MVUrdjJVSi8xbEpGMFlQUm44QWJ6Mk5nZzFUQzN4V3Y3d1lqalM2NmVSaDNk?=
 =?utf-8?B?SHBpZTFCT1I3Z1Uwdjl3SzBBOHVTYTloMEl3U0FXUllENGRqcFphbzJDUnJ0?=
 =?utf-8?B?bFVNWDE1a3pTdWs1MjVaK1NlVk9KVXFnWXRkaWRlOUlWdmQ4Z2NRM2d6VC9D?=
 =?utf-8?B?NDFVcUdGUGVzQ1RWU2xMRUlXa01leFJTZmxoWnN3OWlLNWlwME1ZbXBJYzV3?=
 =?utf-8?B?dVpISkVscHg4Z1JpalhwL3pUTU9xTzZ1TVZCL0IyYW1OSlhDV0JWNGRmeHFt?=
 =?utf-8?B?UnBSOURHeHFPb1pWb2ZRcE45Y3BHRmhMTlQxYzBuY29UckFFRFFyZ1ZPV3c1?=
 =?utf-8?B?N0FoRVVpYVZ3WDJnbFpFYTVyNytXdUdrZlcreWVVeG9kTjY1UWIzb3pwNll3?=
 =?utf-8?Q?8ywmtmroNZoOADxN7HYLTuedH?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(376014)(1800799024)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 15:20:23.1953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7554c5f3-6ef0-414b-1d37-08de30ed25d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5444

SGkgSmVucywNCg0KVGhhbmtzIGEgbG90IGZvciB0aGUgcmV2aWV3Lg0KUGxlYXNlIGZpbmQgbXkg
YW5zd2VycyBoZXJlIGFmdGVyLg0KDQo+IE9uIDEgRGVjIDIwMjUsIGF0IDE1OjQzLCBKZW5zIFdp
a2xhbmRlciA8amVucy53aWtsYW5kZXJAbGluYXJvLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBCZXJ0
cmFuZCwNCj4gDQo+IE9uIFRodSwgTm92IDI3LCAyMDI1IGF0IDQ6NTLigK9QTSBCZXJ0cmFuZCBN
YXJxdWlzDQo+IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBCcmlu
ZyB0aGUgRkYtQSBoZWFkZXJzIHVwIHRvIHRoZSB2MS4yIGJhc2VsaW5lIGFuZCBmaXggdGhlIGZ1
bmN0aW9uLW51bWJlcg0KPj4gcmFuZ2UgdXNlZCBmb3IgQUJJIGRpc2NvdmVyeToNCj4+IA0KPj4g
LSB1cGRhdGUgRkZBX0ZOVU1fTUFYX1ZBTFVFIHNvIHRoZSBGRi1BIGZ1bmN0aW9uLW51bWJlciB3
aW5kb3cgY292ZXJzIHRoZQ0KPj4gIGZ1bGwgdjEuMiByYW5nZSwgYW5kIGRlcml2ZSB0aGUgQUJJ
IGJpdG1hcCBib3VuZHMgZnJvbQ0KPj4gIEZGQV9GTlVNX01JTl9WQUxVRS9GRkFfRk5VTV9NQVhf
VkFMVUUgaW5zdGVhZCBvZiBoYXJkLWNvZGluZw0KPj4gIEZGQV9FUlJPUi9GRkFfTVNHX1NFTkQy
DQo+PiAtIGRlZmluZSB0aGUgbmV3IHYxLjIgZnVuY3Rpb24gSURzOyBDT05TT0xFX0xPRyBhbmQN
Cj4+ICBQQVJUSVRJT05fSU5GT19HRVRfUkVHUyBhcmUgYWRkZWQgZm9yIEFCSSBkaXNjb3Zlcnkg
ZXZlbiB0aG91Z2ggdGhleSBhcmUNCj4+ICBub3QgaW1wbGVtZW50ZWQgeWV0DQo+PiAtIGV4dGVu
ZCB0aGUgZmlybXdhcmUgQUJJIHRhYmxlIHRvIHByb2JlIFJVTiBhbmQNCj4+ICBNU0dfU0VORF9E
SVJFQ1RfUkVRMi9SRVNQMg0KPj4gLSB3aGlsZSB0aGVyZSwgZml4IGFuIG9mZi1ieS1vbmUgaW4g
ZmZhX2Z3X3N1cHBvcnRzX2ZpZCgpOiB0aGUgY29tcHV0ZWQgYml0DQo+PiAgaW5kZXggbXVzdCBi
ZSBzdHJpY3RseSBzbWFsbGVyIHRoYW4gRkZBX0FCSV9CSVRNQVBfU0laRSwgc28gdXNlID49IGlu
IHRoZQ0KPj4gIGJvdW5kcyBjaGVjaw0KPj4gDQo+PiBLZWVwIEZGQV9NWV9WRVJTSU9OIGF0IDEu
MSBmb3Igbm93OyB3ZSBvbmx5IGFkdmVydGlzZSB2MS4yIG9uY2UgdGhlDQo+PiBpbXBsZW1lbnRh
dGlvbiBpcyBmdWxseSBjb21wbGlhbnQuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5k
IE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+IC0tLQ0KPj4geGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL3RlZS9mZmEuaCB8ICAyICstDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2Zm
YS5jICAgICAgICAgICAgIHwgIDQgKysrKw0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0
ZS5oICAgICB8IDE4ICsrKysrKysrKysrLS0tLS0tLQ0KPj4gMyBmaWxlcyBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL3RlZS9mZmEuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS90
ZWUvZmZhLmgNCj4+IGluZGV4IDI0Y2Q0ZDk5YzhmOS4uYzU4N2Y3NmU2M2NhIDEwMDY0NA0KPj4g
LS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3RlZS9mZmEuaA0KPj4gKysrIGIveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL3RlZS9mZmEuaA0KPj4gQEAgLTE2LDcgKzE2LDcgQEANCj4+ICNp
bmNsdWRlIDxhc20vdHlwZXMuaD4NCj4+IA0KPj4gI2RlZmluZSBGRkFfRk5VTV9NSU5fVkFMVUUg
ICAgICAgICAgICAgIF9BQygweDYwLFUpDQo+PiAtI2RlZmluZSBGRkFfRk5VTV9NQVhfVkFMVUUg
ICAgICAgICAgICAgIF9BQygweDg2LFUpDQo+PiArI2RlZmluZSBGRkFfRk5VTV9NQVhfVkFMVUUg
ICAgICAgICAgICAgIF9BQygweDhGLFUpDQo+IA0KPiBUaGlzIGlzIE1BWCsxLCBpZiBJJ20gbm90
IG1pc3Rha2VuLg0KDQpJdCBkZXBlbmRzIG9uIGhvdyB3ZSBzZWUgaXQ6DQotIEZGQSB2MS4yIGRv
ZXMgbm90IGRlZmluZSBjYWxscyBvdmVyIDhFIHNvIGluIHRoaXMgc2Vuc2UgeWVzDQotIFNNQ0ND
IGlzIHJlc2VydmluZyAweDYwIHRvIDB4RUYgZm9yIEZGLUEgc28gaW4gdGhpcyBzZW5zZSB3ZSBh
cmUgbm90IGNvbXBsZXRlbHkNCiBjb3ZlcmluZyB0aGUgU01DQ0Mgc3BhY2UNCg0KSSBtdXN0IGFk
bWl0IGkganVzdCB1c2VkIDB4OTAtMSB0byBjb3ZlciBhbGwgMHg2MCB0byAweDkwIGV4Y2x1ZGVk
IGJlY2F1c2UgaSBkaWQgbm90DQp3YW50ZWQgdG8gaGF2ZSBzb21ldGhpbmcgdG8gYmlnIHdoZXJl
IHdlIHdvdWxkIG5vdCB1c2UgYWxsIGJpdHMuDQoNClNvIEkgd2lsbCBrZWVwIDB4OEYgYWRkaW5n
IGEgY29tbWVudCBzYXlpbmcgdGhhdCBTTUNDQyBpcyByZXNlcnZpbmcNCnRoZSBzcGFjZSB1bnRp
bCAweEVGIGJ1dCBvbmx5IG51bWJlciB1cCB0byAweDhFIGFyZSBkZWZpbmVkIGluIGZmYSB2MS4y
DQpzbyB0aGF0IEZOVU1fTUFYX1ZBTFVFIGlzIHRoZSBmaXJzdCB1bnVzZWQgdmFsdWUgc28gdGhh
dCBJIHdpbGwgYWxzbw0KcmVtb3ZlIHRoZSB0aGUgKzEgYWZ0ZXIuDQoNCj4gDQo+PiANCj4+IHN0
YXRpYyBpbmxpbmUgYm9vbCBpc19mZmFfZmlkKHVpbnQzMl90IGZpZCkNCj4+IHsNCj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jIGIveGVuL2FyY2gvYXJtL3RlZS9mZmEuYw0K
Pj4gaW5kZXggMWQwMjM5Y2Y2OTUwLi4yYjRlMjQ3NTBkNTIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4v
YXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiBA
QCAtMTEsNiArMTEsOCBAQA0KPj4gICogICAgICAgICAgICAgICBodHRwczovL2RldmVsb3Blci5h
cm0uY29tL2RvY3VtZW50YXRpb24vZGVuMDA3Ny9hDQo+PiAgKiBGRi1BLTEuMS1SRUwwOiBGRi1B
IHNwZWNpZmljYXRpb24gdmVyc2lvbiAxLjEgYXZhaWxhYmxlIGF0DQo+PiAgKiAgICAgICAgICAg
ICAgICBodHRwczovL2RldmVsb3Blci5hcm0uY29tL2RvY3VtZW50YXRpb24vZGVuMDA3Ny9lDQo+
PiArICogRkYtQS0xLjItUkVMMDogRkYtQSBzcGVjaWZpY2F0aW9uIHZlcnNpb24gMS4yIGF2YWls
YWJsZSBhdA0KPj4gKyAqICAgICAgICAgICAgICAgIGh0dHBzOi8vZGV2ZWxvcGVyLmFybS5jb20v
ZG9jdW1lbnRhdGlvbi9kZW4wMDc3L2oNCj4+ICAqIFRFRUMtMS4wQzogVEVFIENsaWVudCBBUEkg
U3BlY2lmaWNhdGlvbiB2ZXJzaW9uIDEuMGMgYXZhaWxhYmxlIGF0DQo+PiAgKiAgICAgICAgICAg
IGh0dHBzOi8vZ2xvYmFscGxhdGZvcm0ub3JnL3NwZWNzLWxpYnJhcnkvdGVlLWNsaWVudC1hcGkt
c3BlY2lmaWNhdGlvbi8NCj4+ICAqDQo+PiBAQCAtMTAyLDYgKzEwNCw4IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZmZhX2Z3X2FiaSBmZmFfZndfYWJpX25lZWRlZFtdID0gew0KPj4gICAgIEZXX0FC
SShGRkFfTVNHX1NFTkRfRElSRUNUX1JFUV8zMiksDQo+PiAgICAgRldfQUJJKEZGQV9NU0dfU0VO
RF9ESVJFQ1RfUkVRXzY0KSwNCj4+ICAgICBGV19BQkkoRkZBX01TR19TRU5EMiksDQo+PiArICAg
IEZXX0FCSShGRkFfTVNHX1NFTkRfRElSRUNUX1JFUTIpLA0KPj4gKyAgICBGV19BQkkoRkZBX1JV
TiksDQo+PiB9Ow0KPj4gDQo+PiAvKg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUv
ZmZhX3ByaXZhdGUuaCBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4gaW5kZXgg
NmRiZGIyMDBkODQwLi5kN2U2YjZmNWVmNDUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
dGVlL2ZmYV9wcml2YXRlLmgNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUu
aA0KPj4gQEAgLTE1LDYgKzE1LDcgQEANCj4+ICNpbmNsdWRlIDx4ZW4vc3BpbmxvY2suaD4NCj4+
ICNpbmNsdWRlIDx4ZW4vdGltZS5oPg0KPj4gI2luY2x1ZGUgPHhlbi90eXBlcy5oPg0KPj4gKyNp
bmNsdWRlIDxhc20vdGVlL2ZmYS5oPg0KPj4gDQo+PiAvKiBFcnJvciBjb2RlcyAqLw0KPj4gI2Rl
ZmluZSBGRkFfUkVUX09LICAgICAgICAgICAgICAgICAgICAgIDANCj4+IEBAIC00Miw2ICs0Myw3
IEBADQo+PiANCj4+ICNkZWZpbmUgRkZBX1ZFUlNJT05fMV8wICAgICAgICAgTUFLRV9GRkFfVkVS
U0lPTigxLCAwKQ0KPj4gI2RlZmluZSBGRkFfVkVSU0lPTl8xXzEgICAgICAgICBNQUtFX0ZGQV9W
RVJTSU9OKDEsIDEpDQo+PiArI2RlZmluZSBGRkFfVkVSU0lPTl8xXzIgICAgICAgICBNQUtFX0ZG
QV9WRVJTSU9OKDEsIDIpDQo+PiAvKiBUaGUgbWluaW1hbCBGRi1BIHZlcnNpb24gb2YgdGhlIFNQ
TUMgdGhhdCBjYW4gYmUgc3VwcG9ydGVkICovDQo+PiAjZGVmaW5lIEZGQV9NSU5fU1BNQ19WRVJT
SU9OICAgIEZGQV9WRVJTSU9OXzFfMQ0KPj4gDQo+PiBAQCAtMjcwLDYgKzI3MiwxMCBAQA0KPj4g
I2RlZmluZSBGRkFfUlhfQUNRVUlSRSAgICAgICAgICAgICAgICAgIDB4ODQwMDAwODRVDQo+PiAj
ZGVmaW5lIEZGQV9TUE1fSURfR0VUICAgICAgICAgICAgICAgICAgMHg4NDAwMDA4NVUNCj4+ICNk
ZWZpbmUgRkZBX01TR19TRU5EMiAgICAgICAgICAgICAgICAgICAweDg0MDAwMDg2VQ0KPj4gKyNk
ZWZpbmUgRkZBX0NPTlNPTEVfTE9HICAgICAgICAgICAgICAgICAweDg0MDAwMDhBVQ0KPiANCj4g
VGhpcyBpcyB0aGUgMzItYml0IHZlcnNpb24gb2YgdGhlIGludGVyZmFjZS4gVGhlcmUncyBhbHNv
IGEgNjQtYml0IHZlcnNpb24uDQoNCkFjayBpIHdpbGwgYWRkIHRoZSBtaXNzaW5nIGRlZmluaXRp
b24gZm9yIDY0Yml0IGFuZCByZW5hbWUgdGhhdCBvbmUgd2l0aA0KYSAzMiBzdWZmaXguDQoNCj4g
DQo+PiArI2RlZmluZSBGRkFfUEFSVElUSU9OX0lORk9fR0VUX1JFR1MgICAgIDB4ODQwMDAwOEJV
DQo+PiArI2RlZmluZSBGRkFfTVNHX1NFTkRfRElSRUNUX1JFUTIgICAgICAgIDB4QzQwMDAwOERV
DQo+PiArI2RlZmluZSBGRkFfTVNHX1NFTkRfRElSRUNUX1JFU1AyICAgICAgIDB4QzQwMDAwOEVV
DQo+PiANCj4+IC8qKg0KPj4gICogRW5jb2Rpbmcgb2YgZmVhdHVyZXMgc3VwcG9ydGVkIG9yIG5v
dCBieSB0aGUgZncgaW4gYSBiaXRtYXA6DQo+PiBAQCAtMjgwLDExICsyODYsOSBAQA0KPj4gI2Rl
ZmluZSBGRkFfQUJJX0lEKGlkKSAgICAgICAgKChpZCkgJiBBUk1fU01DQ0NfRlVOQ19NQVNLKQ0K
Pj4gI2RlZmluZSBGRkFfQUJJX0NPTlYoaWQpICAgICAgKCgoaWQpID4+IEFSTV9TTUNDQ19DT05W
X1NISUZUKSAmIEJJVCgwLFUpKQ0KPj4gDQo+PiAtI2RlZmluZSBGRkFfQUJJX01JTiAgICAgICAg
ICAgRkZBX0FCSV9JRChGRkFfRVJST1IpDQo+PiAtI2RlZmluZSBGRkFfQUJJX01BWCAgICAgICAg
ICAgRkZBX0FCSV9JRChGRkFfTVNHX1NFTkQyKQ0KPj4gLQ0KPj4gLSNkZWZpbmUgRkZBX0FCSV9C
SVRNQVBfU0laRSAgICgyICogKEZGQV9BQklfTUFYIC0gRkZBX0FCSV9NSU4gKyAxKSkNCj4+IC0j
ZGVmaW5lIEZGQV9BQklfQklUTlVNKGlkKSAgICAoKEZGQV9BQklfSUQoaWQpIC0gRkZBX0FCSV9N
SU4pIDw8IDEgfCBcDQo+PiArI2RlZmluZSBGRkFfQUJJX0JJVE1BUF9TSVpFICAgKDIgKiAoRkZB
X0ZOVU1fTUFYX1ZBTFVFIC0gRkZBX0ZOVU1fTUlOX1ZBTFVFIFwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKyAxKSkNCj4gDQo+IERlcGVuZGluZyBvbiB3aGV0aGVyIEZGQV9G
TlVNX01BWF9WQUxVRSBpcyBNQVgrMSBvciBqdXN0IE1BWCwgd2UgY291bGQNCj4gZHJvcCB0aGUg
KzEuDQoNCkFncmVlIGkgd2lsbCByZW1vdmUgdGhlICsxIHdpdGggdGhlIGNoYW5nZSBhYm92ZS4N
Cg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IEplbnMNCj4gDQo+PiArI2Rl
ZmluZSBGRkFfQUJJX0JJVE5VTShpZCkgICAgKChGRkFfQUJJX0lEKGlkKSAtIEZGQV9GTlVNX01J
Tl9WQUxVRSkgPDwgMSB8IFwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBGRkFf
QUJJX0NPTlYoaWQpKQ0KPj4gDQo+PiAvKiBDb25zdGl0dWVudCBtZW1vcnkgcmVnaW9uIGRlc2Ny
aXB0b3IgKi8NCj4+IEBAIC01NDksOSArNTUzLDkgQEAgc3RhdGljIGlubGluZSBpbnQzMl90IGZm
YV9oeXBfcnhfcmVsZWFzZSh2b2lkKQ0KPj4gDQo+PiBzdGF0aWMgaW5saW5lIGJvb2wgZmZhX2Z3
X3N1cHBvcnRzX2ZpZCh1aW50MzJfdCBmaWQpDQo+PiB7DQo+PiAtICAgIEJVSUxEX0JVR19PTihG
RkFfQUJJX01JTiA+IEZGQV9BQklfTUFYKTsNCj4+ICsgICAgQlVJTERfQlVHX09OKEZGQV9GTlVN
X01JTl9WQUxVRSA+IEZGQV9GTlVNX01BWF9WQUxVRSk7DQo+PiANCj4+IC0gICAgaWYgKCBGRkFf
QUJJX0JJVE5VTShmaWQpID4gRkZBX0FCSV9CSVRNQVBfU0laRSkNCj4+ICsgICAgaWYgKCBGRkFf
QUJJX0JJVE5VTShmaWQpID49IEZGQV9BQklfQklUTUFQX1NJWkUpDQo+PiAgICAgICAgIHJldHVy
biBmYWxzZTsNCj4+ICAgICByZXR1cm4gdGVzdF9iaXQoRkZBX0FCSV9CSVROVU0oZmlkKSwgZmZh
X2Z3X2FiaV9zdXBwb3J0ZWQpOw0KPj4gfQ0KPj4gLS0NCj4+IDIuNTEuMg0KDQoNCg==

