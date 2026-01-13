Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1316CD198BE
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 15:41:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201835.1517399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vffZq-0006Nw-A4; Tue, 13 Jan 2026 14:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201835.1517399; Tue, 13 Jan 2026 14:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vffZq-0006Lw-7D; Tue, 13 Jan 2026 14:40:58 +0000
Received: by outflank-mailman (input) for mailman id 1201835;
 Tue, 13 Jan 2026 14:40:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMW5=7S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vffZp-0006Lq-4G
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 14:40:57 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dce5716d-f08d-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 15:40:54 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5422.namprd03.prod.outlook.com (2603:10b6:a03:27b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:40:50 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:40:50 +0000
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
X-Inumbo-ID: dce5716d-f08d-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0J0+hEZJI8/X/BpPEsMYerACWK3zSJmVXcvZFUdLhMgy4Yx41kGxf34JXbr6Bh/doS1nBkrqSttbiMvEvLdRyg+Dk00hZsP76GTr2+NH8ust5zmyYx7jLpHE3Kj3rzE/qNKfjPiOWz/kYYICV45UP5hzaJIn+unvWQKtHuoMGEeSHffI9BjE5arBX8zmpdF/PiPjwuxaEN+un8HZP1LgKPphCAN2rWREtWKR4z0cCgzCuOmO/L6oDgpPDh5NkoriIfWmljufJY+jCqqsRwpgQ72dMf6fu1+V8vkDS6EVvyb3Ah1t8NHI3MnJJbxlUpR+AqFRArpR8ptRhpYRUfLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4uE4TuaosuHx1ZcfmsmJ7OxEFtfON5KHQSsae2zFmE=;
 b=qnp5L1q9fc3e7cgH760P6wpwbcX8sDWJe8jWauSUEmkybvwkV6Hsnsm97DQRZZyMmPce8A1qskAsPELy8yu1Kvxi89CiiYQviXhllDMBVCSBL64tqdmi4R5RsHy8RK+XDX6/Ex3cealuv8clXjEoWM99e7yIFeLoJA1081mJGobh7qR7uUS2s/y8F0YRY8JQNfWGCfIibb5f1/XMGuXsQYD/wqFdqReO5PulbrOu1OZrUORLplrMBH7na3RvLG8pku0egSa0YuqEWRiJpAo4A5b3zStG6t0A3lAXeun0kbty+vc8PYA1ER+dYidZyBK2S04yQJeIfZj96qURzCAEYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4uE4TuaosuHx1ZcfmsmJ7OxEFtfON5KHQSsae2zFmE=;
 b=cZfvVj1b5y81AqdDVnX20qwh1MBpDQATjPnnIsSIe6t5UBvQMgWtBqBHtEO1hXdXllXw8pil2ilLJMG8hMq2hBmqX+/36zz9Qg5vzQLhiQp9gGpbwp2lqmCf6BW7zeolwDLGZLeGkPbofTAghPMH1GCdQrhuIXzmiVTNfjrR7xo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2b3b7a14-6d44-480c-a3e3-d320c7a2c931@citrix.com>
Date: Tue, 13 Jan 2026 14:40:47 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/platform: adjust CONFIG_VIDEO usage
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <54667383-d1ff-467f-9dfc-95d23aa600cc@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <54667383-d1ff-467f-9dfc-95d23aa600cc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0118.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5422:EE_
X-MS-Office365-Filtering-Correlation-Id: b418a5bf-b2b9-4857-9e73-08de52b1bf05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1E0TjI1RmxTenlHZTZqdEorb29Qb21mWHArdXhBci9lNjRlSExhZTg5aE1D?=
 =?utf-8?B?dlFJVi8wTHlMSFdlS1hyY2VsZEJmQTNSUlhId0xDQnp0ZlVaRENwb0kwQnZB?=
 =?utf-8?B?ZDVwNWs3ZWlCektlTGZyUk5QRVlnR2EvbHNuZVV0Tm9yZmJiMDFSTjBZczlI?=
 =?utf-8?B?Wk5NS3dXTHlwZTUvekRIR29uUyt1bWJoOHRsT0FqZDdyblBtTWFCOWhqKzM2?=
 =?utf-8?B?RE00M0VtMVhEaVE3YUsvaG5aQmxQSCtubHRxNmFNNThJMDY3amtWWWpMYms0?=
 =?utf-8?B?RTV2VHo0QjA5QTVxRGJ6bTA3OU1CYUpjcmozRzFHMnN2YzQ0eVcwbmFhc294?=
 =?utf-8?B?S2FkQXlLakRWbVhTOTFHQnJ0ZUZIZzgwSDBybFZydXdTdW5Ba0RSbGUxZkdt?=
 =?utf-8?B?MnRhY3FOYVFyZnNpb2VEY1dYbmFCVVZSbDZGVDlGWlVRdEt5TXg5YTZXMFJi?=
 =?utf-8?B?eHIwa3pPTExVYlBBejFCUGhlUHdyY3lmY21HTTlNR1drSmN1WkFnL1ZWRUhp?=
 =?utf-8?B?ZkdHYlRwTkRPRHNMbWdya2JJVEpuZTFnUVVsNk9PWE5wL2Z0dWtNUWVZT2xp?=
 =?utf-8?B?Y2t3TmhycjNjTHU5bVBxcVI1OW1ORWJhWXBueWhVbkpKU3JhRzFHMUlIRXhx?=
 =?utf-8?B?eGNWSFVXd0NJVnZ1R0xEWDB6RysyYTlEelNIR2xhbjNpcklhRzc2Tmg4L0dP?=
 =?utf-8?B?MkZ1d0lxNDcvQUhGSm4vbEFTRk9zYnBJdXBtaExNUm54SGdLdXdGTlQxRThh?=
 =?utf-8?B?TkF6WEoydHAzSy84U0FZd1pLTktIbTNtd09razNBL1hZRndQZ1Z4VlFpWDh5?=
 =?utf-8?B?MW9Nd2xwQlRnejE1Tms3TW5FR2xZcDVIWVFZYXVjWkZGYVZrbVphVTErUHJC?=
 =?utf-8?B?cVU2L2N6VmpDUlZjWDhJS0pNbm1jb0NuVVdjbTlrVTdNUzQ5aE5nOTNXLyty?=
 =?utf-8?B?TGtQMkRlTFVkRTQzK2ZWaGJWWEJNZGU3NnpHRjAyb21hMFcyVmlWL0I0cVdX?=
 =?utf-8?B?Um55Y05qS3EwRTZUY1ludFM3c2Q1K3ZDYUVhQ1lmazBPYnJjNkp1bG5VN1M1?=
 =?utf-8?B?b2orVzA3cGoxSXR5QjlPNEgwdi8zd2VFbnVNNEhHZklHYmYzN2dCaWF6WjYr?=
 =?utf-8?B?bEVtZXhEOVplcFNIdjFNTGk4R2EvVmRmc2FaL1JSV0Nqakg5M1J1RlNMbnIr?=
 =?utf-8?B?KzFIVFVEOVNKNit6bkk0eFl0bVBxZkw5WDltZkttODc1TzQ3OUpuSTZsNlRD?=
 =?utf-8?B?S2tQUnVxSkpmSmYxaldDbDNzL0RVU2RsdXE3Z2xnZUZhRi9DTllBTHdTQ1ZN?=
 =?utf-8?B?WDBYWmxiYjYyVmNqMldSczdvV2NVOW00aTgrN2d3N0dFM2JJY0xackZDV0VK?=
 =?utf-8?B?SHVvc3VZekxaOHY1Z09RVlZKMXJiOTB6SUVVcE9MdnVWZFc5R3hVUWp5d0ph?=
 =?utf-8?B?L3oyWmVWcjlwK2szR1RxZG5xcFkxWDRyUFRBZ1VmRGJnem1kR3MzM1FlR0Rp?=
 =?utf-8?B?WWFXMkczZmlMeVJHSW9mY3FzdU9XUXBtRjZWRXUyQnNUWFNZbDI0aVNpZTNv?=
 =?utf-8?B?MVM2UUxFaW1QQzBOdklZU3g1MXNsK3pVcFY4VmNDN052Tkkva3JpcWRQNy9Y?=
 =?utf-8?B?TXJjNGJvRFFQU2lGZ1dhM0FpVkgxZ0FZSHJ4M3BMbm1NYlFCTmlaQkQrRmxE?=
 =?utf-8?B?RVNoVVpESjc1c2U0clQ1UTJkUzFLelV6c05hT2UwZEQ1ay83bzVrYVJiSE94?=
 =?utf-8?B?Wnd4WHlDZVdLemgvMWR2UGt4YTAvUXowcXp1TjB4anQ1NTJKSjdYT1BaL0Vi?=
 =?utf-8?B?Y09aTUp4YTVPbGs0UE5jNEJ5d2pXY1ZjVUtLY2dKdWYwdmJMMnR1dXBIa0Nn?=
 =?utf-8?B?elpwODJUdmJPSGE0VFp4NmhSZk5nRnV3Q2p2Nys0SEpmZ0FUTzZXU0pkWkFZ?=
 =?utf-8?Q?wAbBjUN+VCNYn0bM+psSgYZfl8auVk1c?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnpKYUxvcklBWDM0RHhpS0Urb0x0T2trTXpUZ2s4c1RjQjRpbUZyVVFqeFlG?=
 =?utf-8?B?VFBRY2VFNmxrVkR6STVLVi9BaUdNdkpGWTlDSlNnYUliSDk2dlJaZjRGcmVN?=
 =?utf-8?B?bU11cEw2YTArRWxieTlPZWpPTXdsd0hjcHBzc2UwVTduSW1YdlhYei9wbkdp?=
 =?utf-8?B?bnJ5TlVNOHFybFFyVkFTb2lhUGlIaUhZNVRkNGhiVGxXcGppb3BZNElsZHJ4?=
 =?utf-8?B?OVZGU0lLQUk4S0Yzci96ZlRudEJ1d2xRbmNNeXc4cGNuNUczNFhqbHB5RUpB?=
 =?utf-8?B?aDNwOGRsMG55NEgwMWxxZWZsSENCVTh1UGFENzJwamlic3E1WFZTQlMyR0NQ?=
 =?utf-8?B?S2pvelpRdEVPdHlMZ0Fja1NTUkcvRVpEaHUyQjBMcDV1enV6R1ZBVzh4alpG?=
 =?utf-8?B?bWhtQ1Nhb05kWXVHYlBXSDBZdVRGQVcyZXhWeURNam9Yc081Si9XTkZ1aUIz?=
 =?utf-8?B?L0FaL2oxVW5XSUtyV05TUk1yaWt6S0ZBbDQ0S040TG5Ta2p4dXNXL3VnT3o3?=
 =?utf-8?B?blZ6cEI4T0Y2elhqTnJvZFp2dnB2Q3NaQ1FxSEQ4NWIrNnpYY1RFUmtIZDFm?=
 =?utf-8?B?ck55WEhVKy9pZm1McXJUTVA5bHFTSDNWdU11bEU5dVlkQlgyaC84VVYvKzhO?=
 =?utf-8?B?VncxSHpCeGdGeFNNb0h1SStmQlB6VkRaZ0xhKzBRTmdYQTViZEg1VUNDaW50?=
 =?utf-8?B?ZEFOeldwMGlQY3grVktnVzVFMnpNSDJiRkdqYmFLMjR2YzZBWll6Z2kvN0k2?=
 =?utf-8?B?Vzk2ZmRSQVh4S21STEhtWStoUWp4MmxPcXJGd05FandoU29WNWtXK0dER0FS?=
 =?utf-8?B?VHJ4RUVzOEVNRFE3blQ5eWFBdGh4Y3ZPaUF0UjA3bEwzTyswN3NEME5HY2to?=
 =?utf-8?B?ZXVVODdpRTF6UlBMbU5BejRPV2J6NEl5ai9nMi9GKy9EK3Y5NzlXTXVDWTBM?=
 =?utf-8?B?bU5sSjlvZUpPcTJnaHIrVmlmdEFSK3FvMmRRdjJiRWRYeitmY2RTeVRxU0dK?=
 =?utf-8?B?VmFxOHlPK0l3UWhXY2oweTFGRnFFWVR5dUJqQWZKWEsxbEJPVXlkMS9WU0xx?=
 =?utf-8?B?elNJS3d0Q09QdWdrMUtHL3o1WUIrRy9SVTZ4dmxINmJML0lWQzliMm9wanlE?=
 =?utf-8?B?c1JJY2pzOHArSU5XRG5iM3NPeTd3L00vUk9ETGhoMkVISXBka25Na1FwNUhh?=
 =?utf-8?B?bHFFWlJmOWxGN1NiUjdJcFZDOWRZWDVLdUJObG5BM2w3R0lBWC8zWHhFNkRH?=
 =?utf-8?B?ZXBzNFJqTEI1dk9NWGk4emp3bXZWWFNrcEVYOUdna3YxYkJSakZ5NFJTSUtu?=
 =?utf-8?B?L2d1UU1yVWd4b1lxODdFaUFxdStFblhhcjBweEY1VWNaaVRYZnJlOU92dGdH?=
 =?utf-8?B?S3FCWklNZmd4eEtYb1I4cEVadXkvUm1JSXRNWFRCTFhqN0hoQVhqVUs0VnB4?=
 =?utf-8?B?eVk1MFZmWTY0SVVzbFFFdG12Q0l2cE5ieFBHb0ZQRGkvamNveG0rMGZwTnAz?=
 =?utf-8?B?VU1qNGh3MjJpcDlOWFZ2ckNGYlNaRWUvV3hZUjVCTDBQRmZtc2FvSG5DdHZZ?=
 =?utf-8?B?T3NKMFpFTDBaVEVtYnlQMy9VbjBjR2Z3VTZzbW4rUm1nUTVIQkJaS3c2Rmhv?=
 =?utf-8?B?dWhVTEpqbGtDbjlpanVMblNrSVlVV01ibkw1WGk5bFhoVWJnTmJkYzlJdlNP?=
 =?utf-8?B?aVhKS1FERm9VN0NCYTRSRHZRSXRFUnFDZ205Snl1KzJoVkViZjEzQWtiNW1N?=
 =?utf-8?B?cTFRQk5SOUNpZk1jWi9jditNdndVOGZBWVI4SEpqTlpaOVNFclFNU2hUTk9q?=
 =?utf-8?B?Z2dtam8xcEh5OEE5dytuMmRSTVdlUllxMmVmaTJLQnV6YUhoaG5xSlhCTDRU?=
 =?utf-8?B?VFJHdUVoUjI1UjB6MFUxdWJ6OE9ubU02WFlFQjZ4YWYzdUorWjdPNlUyTjV6?=
 =?utf-8?B?YUY5QmpCVlZna1c3UmorRE5WTndEdzA5cWZHcExTb2RrNXV2bzkxcDNQd1ZK?=
 =?utf-8?B?dlR1aFplUWJhOXAyc0s4M3BhZ1pBYnk3bStZN3lablYzb09BNXNLZnNuQVF2?=
 =?utf-8?B?ZzZscXdMN0t3VXlUeVEvWXRld1I5VE9scEYvUmQrN0pQLzhmYStzcjB0R3Q0?=
 =?utf-8?B?SHBaTW5TNTB3UC9EUFZKeFc5YW0vYlpIWXREaUlsV0E5c0xOR1VxcGVOR3RQ?=
 =?utf-8?B?WGo0cm8rR3U5R2hFYStCbDVMdkFSWjVoMFppUUh2V1NtMTBKdGgvZmR6N0Vh?=
 =?utf-8?B?Q1lJaEcxQU1hcTBpOXRtOXZHY3F5NDFKdTkvTXZvS054bVNXbStWUmJzZE53?=
 =?utf-8?B?QjBiMzNNVVNQMWhWemZROHJlUTFBa2ZGT1luZkJRTENzbWphYU9UZWkvdCt4?=
 =?utf-8?Q?sYWuDi+RAJSc9LTs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b418a5bf-b2b9-4857-9e73-08de52b1bf05
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:40:50.2439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qifMQUICx/DT3Fs+aOlhedjtrz89b+/qYkb1bSt8/sXtbaAVinqGyLIVmArD/q0tosAwdwZEzuUt3d5KtP55d04pozyx8SpCpenAUYECWFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5422

On 13/01/2026 9:23 am, Jan Beulich wrote:
> Switch to using IS_ENABLED() in both places, thus in particular making
> sure XENPF_get_dom0_console handling doesn't take the "default" path: The
> behavior better wouldn't differ between VIDEO=y and there not being VGA vs
> VIDEO=n. For this to work, fill_console_start_info() needs to be
> unconditionally declared; extend that to vga_console_info as well.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> I'm not quite certain whether to have Fixes: 11b4ff64841e ("x86/platform:
> protect XENPF_get_dom0_console if CONFIG_VIDEO not set") here. Opinions?

That's up to you.  I doubt you're going to backport it, so it really
doesn't matter does it?

~Andrew

