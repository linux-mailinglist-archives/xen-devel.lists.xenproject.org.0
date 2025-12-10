Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42378CB3BC8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 19:16:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183147.1505930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTOiS-00029D-0V; Wed, 10 Dec 2025 18:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183147.1505930; Wed, 10 Dec 2025 18:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTOiR-00027H-U5; Wed, 10 Dec 2025 18:15:07 +0000
Received: by outflank-mailman (input) for mailman id 1183147;
 Wed, 10 Dec 2025 18:15:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iyob=6Q=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vTOiR-00027A-5S
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 18:15:07 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 256d8f89-d5f4-11f0-9cce-f158ae23cfc8;
 Wed, 10 Dec 2025 19:15:03 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH1PR03MB8141.namprd03.prod.outlook.com (2603:10b6:610:2b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Wed, 10 Dec
 2025 18:14:55 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Wed, 10 Dec 2025
 18:14:55 +0000
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
X-Inumbo-ID: 256d8f89-d5f4-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLgdbTe8T/Yv/k6i27QFWFbGBLTaIprVXDK2s5AJHk8sgPgUh7moH2QQvvvICdsOyTTA29mbxaolWPRd/GRUp1eijECelqlPMMYQQQIa3US2uVe3OqoounKkepZTRVEUHCA+343Ei3wNc2/Ns2vg9RQ0KSMhnY2JVD7BXdbp31CkBB+7xnXKcpLEz/2QKu2+MPHXYn3i4rB43eCJhb1eN2EJskMEYvVDIhJx0KucRh6lu09hqehhNGYmHD9jkxSOc7kgiGZywGZ//6Lu03SHk13lKr84l0c0oCHKwiLUiLC44MeXMYIUvmuxmcCcRrvWmH6QS+xCjY+vj+9mXpJcgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmHYiP/muL+WgF/N4oyKcLRcdukKzJtj+6Ynv9ZhJ+s=;
 b=dfMfPdaZhKD0/RMOQ0wNzozPzgg3WkbHBoCuEvQUnJfq580h87sWxihtCN+GIme97HjzGAYCS4+1UIJpBgl+ceAndh0dV6x9UNmBadXxTQ8U8pVK1et8KiWi7vdt9957Z9Y260x19C+tJT6iKQSOMkKl2biZ6YYXfPV9nn3otQW2WObwyjKceii6QGmSpuL662kknFFeO4JOM/rGd2QySSYnUiqWqT2lQUgPacKPfnX/v+OWykB22QbQ98jPM3Zug1LvmRJpVUZsjuvPsqeTtOGTPdo3V8zrNijsWKzk6g2BbHZVB0ke50YaD3w/4hDxxOlD/KjifbgY57Q2XDNR2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmHYiP/muL+WgF/N4oyKcLRcdukKzJtj+6Ynv9ZhJ+s=;
 b=PmBlh/QaXjlTRh7w+vvblhkNzw+5HG76fbmNlEQHdoSXRUSuFErZud5KlBKJtWMPzCgSPUmGXG6ZZMPjwrdl/YcZzPerjiE6H55JSh2E0E2KBui+6RPMPxSL9wyu68OcS5KivlxI56gvV2U+pFLAKQM5FaXORr7c3oDIFPgPhiY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7744f9e7-17da-4f48-837d-8fc087899af5@citrix.com>
Date: Wed, 10 Dec 2025 18:14:51 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Current Eclair analysis
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0260.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH1PR03MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: e90b15b6-a59b-4ef1-5e48-08de38180540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnBIOG9yNDdKQ1RRYVVKVVhFTVBrSWJjNHlTK2wwTEdSUlA3aDRXc3JKaG5B?=
 =?utf-8?B?WWR6TUlYUmdYSTZyUlZXbjAyN2ZveC9tYi9WQnRSK2xNRWxPM010akEreUdV?=
 =?utf-8?B?YXhJbThmbXYyUGFBUnU4aUQvQlc5Si9lTmJlc0RoYzRQczdDK1pUUml2a2JO?=
 =?utf-8?B?cGdZZkQvSG9ub3dqVUZ1TXpHQ3IwTHZzQ0N5TWVaUUtyZ0lrYkhrREVkcFZN?=
 =?utf-8?B?ODlGSEFmbyt1Tjh2MHRkamc5L3FobVZ0YUczYXptZklzQjBtNk9UNVBQTzZ4?=
 =?utf-8?B?dG5qamVSd2FyK2gvTUZXWnVrOGNxV0tuYUVmQTU0bG12cnd0Y1NWYWVOckta?=
 =?utf-8?B?elphR1ZTQVBLWHZXcjVoWWFIWEp2OUxHV1FNUEp1SE9qZ25XVXJ1cThtT3Qw?=
 =?utf-8?B?WE1RVjgvN0s4Qm9rVGhJN2U1SWpqNHVYUHFKZVl3NHJGZ0NMdCtBQXUrRkV5?=
 =?utf-8?B?NjB1MWtLV0o1WWtjU281VnpZSGNyWHBianA5Nm9YTDF6M0FYUVlRZU1Kamp0?=
 =?utf-8?B?bWdNOHZRT3BaeG1FM3pSa2NYZ2kvWkt5TjM5K1FYVUhFektZQUZWZmtEbFg3?=
 =?utf-8?B?K2hDbFpuUEFtZ3hodm5GaGFPd29BNGdKTmF4UkRBTXk4amZZNHM3bUl6UDd2?=
 =?utf-8?B?K0l1UVFpVWlxK1VvY1ZzR0NUQlhpaUNxZk8vdjRCajBDMy93TFcrRU83Qjdp?=
 =?utf-8?B?Mm0xNUJ4M1k4Z1ZHb3NiTzlOQ3Z4Z0M0MmNnVDlmUkdGRVlQWlZTc3lhQTJ2?=
 =?utf-8?B?aG1MRTRRSEVsbmQxUzJPR0tIWm5NNzhuY1cyTldtcy9LM0lZY3VsR280UERN?=
 =?utf-8?B?WFdTSG5ZWGhydk4xMm5vRXNhSXgwQThuRnordmZ2QTdOR3R5OFV1UHAxQ2M2?=
 =?utf-8?B?dC9VSHRnbC9RTlZLdnN4a2VZcUJrWTRkY1gzeFBqc2dQWWZYNEl4ci9QWm1h?=
 =?utf-8?B?TkZkSmlleHhWSGNSbU82TEJudFlHSm9KYklobmJKZVlrUUpSMStSZGVGT0g4?=
 =?utf-8?B?MXZ5RGh5NW5OUFFFZzEvUHIrUUNMV1Jocmg0aUt4bWdSYUllRjRkYy8wbkdx?=
 =?utf-8?B?S0R0RWUxckVWU1dsbXdzUnlVcmppOFdRdkY1VnlVNDBJYzZiQXptZGxQZ0xm?=
 =?utf-8?B?ZDZtRjhKZzNaOVd6TTNicy9mZXFMRVZQUnovTGpkOHpIdHlQbmlBcDZNUGV1?=
 =?utf-8?B?cnBaejdHTWtSYXZkcytMQW43aWRqWFZHSUdmOE9FVUdhbEloUEg2dEU3bjF4?=
 =?utf-8?B?Kzl1dk9RN0o2UGZ1ODdCQWlMRjUwcmdpNm5TRUI0TDF4SFAxSktPNXMzcERT?=
 =?utf-8?B?MVRScnZCbWhxNFJVQ21Pd0JHTnhvYVN4UEdhbHIrbEo0ZUJlQTlSRjJjQit2?=
 =?utf-8?B?NlJOSjFEbENVdkxTdFNBSklqcGp0QWRRTTZyQ2tlNytrdlQ0aEt1UzNoSzlC?=
 =?utf-8?B?THBCb2hDM3lxSDZxTXZMSHRXQ1FUYUhFQmtIRmFuaHhRQW1hSHFqNmp3MHds?=
 =?utf-8?B?a1k2clBJNW9wc2R3TFQrdTRpaVhXYzJXd25mWm1TUkxnNG11YVM1WDNvVzQ0?=
 =?utf-8?B?bG1OT2N6L092Q0MyOWx5ZklHcG5YSi9ualg2YWs1eVo2TGtTKzNXays5RkRQ?=
 =?utf-8?B?bEJXK25YdEZkSHZ2cGVqRU9wcUtRLytjcFNWNHNZbmdNb05HS0ZmUC94QlNy?=
 =?utf-8?B?dUFvaTRKRjQzczlPQ1AwSndDVlVNb3U1VmpPRjd4YVAvaWIrWWJkdTJiZFVO?=
 =?utf-8?B?WVdFVHlMdEVEMW9Xam9HSTVRVmt6bFN0cThyNXUyTHpia2hvR1hRSUZIYU5N?=
 =?utf-8?B?T2NvT3R3SitRbDhEVksxd3Y5V2RHdTZFa0FONGJtdU50OExlUXlTa1gzYlda?=
 =?utf-8?B?TVd6ZFkxYWU4RzMzblNqbEdQS1VTejViUUhXa1ZKRzAzVU9nMVo0UEpXLzN4?=
 =?utf-8?Q?G4ILdy9VTjimwKkCoQ7sSqpJMIdIUOUb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M25qMWlBcWwrOW9rTDhlTWYzN055bHNjU3UyQ1B3T3k5THJObVgrVy94diti?=
 =?utf-8?B?bm15b09wdmozSURkNklOOUZqNW9CRm00SHhOR29JeFNOQVJ4WFBFL0JOQXo0?=
 =?utf-8?B?S3JqYVZ6ZVJDNnBpT3lWSUFNV2c2UC9Rc0Jkbk5JTDVPR2Z0RUJwRmVMU2Zn?=
 =?utf-8?B?NDdqZjZUNmordHhOVkw4bDRrNU9qY2JabzVzd0RxMDRPdVR5N0ZnazVHM1Fu?=
 =?utf-8?B?QmtoZUJCcVpNSmtvOUg2T0tUN2c4WlpQRmMwZkNtRmNCL0ZFZGVwTXFtK21a?=
 =?utf-8?B?a1h4TW5IT2d6V1plbityMTlqaVVCUHFZQm1odmlxcHBJWXRIUmFic25KOWsy?=
 =?utf-8?B?bExkU0hqNTRyeTNjV3hLSi9OSVpwNUNvRHZNWmdsQWdnbHE4c1pieDRtb0Jp?=
 =?utf-8?B?NC93YjRpcGNkWS9NL3RUN0x5WG4yek5TN1pkY3lmbVNBWTM1VmN1NEk5Wlpq?=
 =?utf-8?B?cjdXSVI4V1BwZ0c5YWhMdXl0aEdPandsWTQ3NnZsa2VCNGsrbzhQcE91U2dX?=
 =?utf-8?B?MkVXZ1NMWkpVZmQySDU3WmFCZmdjbVF6TUtwU3RHbjhTNTloMG1wU1dFd25i?=
 =?utf-8?B?MFJBMlhqY2FJTjAyblNKWWZMZ2dkRXlJRjZpZUIxNTAycU93eUU4YTBzZUcz?=
 =?utf-8?B?SUVrdERUZ1NidElmUnM3OWhFZUhCd2xiT052ckFhb3MwVWFScmFoSU9oK1ZO?=
 =?utf-8?B?aEFEalFSWjdqczNwNmxkaXRwYnhHQnNSb0M0SkQ5dnQ4NDFXSXNIRndDVmRj?=
 =?utf-8?B?S2dsS0tMcGxlK3FNSWFlSUtwYkJxRHNScjU2T3g3eXVCVk5WZ2xjYStzc3Mv?=
 =?utf-8?B?VDBLbkpCa21uMmljLzA5c1NBVDhHNlFMNFZrTExIYnpSbFR6OE9EZ0E0RTA2?=
 =?utf-8?B?WllvUFo3OTZoa2tkdU1KOWY5Znh1R2FwdG5zMi96WHdYejM4d0NMdGMxdXNy?=
 =?utf-8?B?dzdKdjZvWkZSYXBOekVCNDJkditacVZFMnR5LzdIVVJtM2VwV25yNExGVC90?=
 =?utf-8?B?V3R4TDhPUWhZV3FKTU5hQm1oSGlJbVh3UC80NlRVblZja2t2b2d4a24vY2d2?=
 =?utf-8?B?clJnZCswV1lGd21CMEhOeElyNkxIcjNtV2lvZW5yNlRyR1pnVUFUTVFySElB?=
 =?utf-8?B?dGUxOGJwbHowMnJ2WG95QUd3RUFsQnA1bW5jUWRWbEtMRGRXWDJQT3pNajNT?=
 =?utf-8?B?bkdRRHMxYm1MMU13elZQVTdNdzdXMTJpSlgrUVFMdlJLVzErV2laUG1CUlpF?=
 =?utf-8?B?MUU4Mld6OFRVR3lRNzVrcXM1SzQ0TE5ERE1weGZzaFVHbUF6NXhiVTBPYmRO?=
 =?utf-8?B?Tmt2SG9NdGZoUlVaekFpYzNvUVlnaERZVjBWMVRtQnYrWk42TjYrajk3WFh3?=
 =?utf-8?B?eEw4N212NktsMXFUVVhwaE13eTIvVXNsUHFQM3VJK3FlSEZPdjQvdmtFYU9H?=
 =?utf-8?B?enlNSXZHNWNoNkozNHpWajkvbkFTSnJSbUZEQ1pTc0NzZWFPYmYyZDlldCtJ?=
 =?utf-8?B?Z1NWcWgzRUx3NUQxYXU5S0krMnZiQmZTVXF2Z2NuT285UURkSzVGTnJ5bWRq?=
 =?utf-8?B?bnhvQVRVWVRKWHBGYXRrRE40eVVZVy9BYXdHZ1RDeVl0eENCbmY2dEhZQjlt?=
 =?utf-8?B?S0FYci94clpZYWhucXVXZmVMUzdoQzNhZkFIS3FrbDhqL0V5ZDV5em01c1Ez?=
 =?utf-8?B?TkJPSXhjTk52ZUpPQ3JEQytMZ0hGT1hCbmZqdFBkTW1LRlkrZkJ6QmliMnh0?=
 =?utf-8?B?TlVMMFZxblROWHVOaHJoVkpUT0YwckpGVG96ZG00Z25iaytQK2JOMXBEQzlN?=
 =?utf-8?B?UUxrM1FTSGZKS1lUai84LzhTVnE4czdUY3UvMXdnOUdiWG1uYzI5d0l6MmpQ?=
 =?utf-8?B?VXBqNmxIM1dXTURSQVFMVkJuaW5CdnFBWWJJdGVBT2JNMmQ5eEc4TlhMdlZF?=
 =?utf-8?B?Q0phV1F3NVR4SmhtK0lnclZCVk94K2QrQWJrbHJiUUJwREo4ZitsNW03SUpN?=
 =?utf-8?B?ZVJjSTRRVWhSMnZ6S1poZkt2SlZnUk5tZWZYZ1ZTaXczSStNL1NEdW5EYUIr?=
 =?utf-8?B?cmRTamw3L0dWV2NINE5RSjVLZm1lemZtSWE5QlB3QWNzdGgxZFgrQ1JyVlBy?=
 =?utf-8?B?cEFOeXlwSm1peFlwQ1U5dGpEQkxwTUc2anVpbkxzMzFEWFFPVUJKZFpzck9I?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e90b15b6-a59b-4ef1-5e48-08de38180540
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 18:14:55.3280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LaYutiHYZaZQzJJD9xTDZa5TeR+8ATOc2PoCeKZ3aWCjy2Xyb3dfDRpBUfOW9Hcv9HtH4bt2UkEaGbWeJNB+SVhLdPdY6gAX9r9VUiFiaMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR03MB8141

Hello,

The Eclair step is now the dominating aspect of wallclock time.  While
the recent changes were a step in the right direction, we need some
adjustments.

First, we have *-testing running in all cases, but my understanding was
that that was supposed to be for deploying a new version of Eclair.  Can
we make this be generally off?

Next, jobs are scheduled in the order they appear in the yaml file,
which means the general ARM one goes ahead of the safety target.  Just
something to bear in mind as changes are being made.

While the x86 runs are non-fatal, having them fail is still gets in the
way of trivially telling that the pipeline is green.

The names, -safety and no suffix are a little problematic, seeing as
everything here is for safety use.


Overall, what I think we want is something more like this:

Jobs named as *-all and *-amd.  After all, it's AMD's safety target
specifically, not necessarily someone elses.

The *-all targets want everything possible enabling. Ideally we want
something like Linux's COMPILE_TEST, but in the short term we can just
adjust the input Kconfig.

Like we had with the common configuration and the per-arch
configuration, I think we want to express the clean rules as common,
with a wider (a.k.a stricter) set used for the *-amd target.

The longterm goal is to get the *-all targets as strict as the *-amd
targets, but right now because there are no blocking clean rules, it's
easier for regressions to slip in.

This brings us back to the debate about the excluded files from external
sources.  They still need fixing one way or another.  Do we see about
including them for analysis in the *-all targets, or leave them excluded
knowing that whomever need to unpack that can of worms needs to do a lot
of fixing anyway?

Does this sound sensible?

Thanks,

~Andrew

