Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64142BCA333
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 18:34:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140809.1475580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6tae-0005K9-N0; Thu, 09 Oct 2025 16:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140809.1475580; Thu, 09 Oct 2025 16:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6tae-0005H5-JV; Thu, 09 Oct 2025 16:34:04 +0000
Received: by outflank-mailman (input) for mailman id 1140809;
 Thu, 09 Oct 2025 16:34:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZ0Z=4S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v6tad-0005Gz-C0
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 16:34:03 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1a16493-a52d-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 18:33:59 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAXPR03MB8251.eurprd03.prod.outlook.com (2603:10a6:102:23d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 16:33:56 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 16:33:56 +0000
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
X-Inumbo-ID: c1a16493-a52d-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1XkAsj1ubDCdtfGjsjzWk02VMHrbOibNKJ0IYK0ivbKdenWiLxqszoWdGXlPT8RMotrbd7WP/3NvkYHuatwPYtlsFgZ5USagThnYoGE5pmEnbZvL4GExocPxfw/ByWJRTSB1tPVc8VFJChbEFa46F+W+8Pfck3d0nHwZ4tp4dJgUO3T7HghkemAYlYFqFKitYBqomvtCU/GUMcwA75ouYQoWr4BhwY8Div1pdtqS+FMoUs+hQez2zQNPmuoBjBD3YLdge+P3iq66LGW8r5FyJVLToQdsEOnWpG8kaWpOhT1CNCej39X2LwSHx69Hcij9PzTR27qVPsoMbIAjLyHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8hUAPdMt8LeEXvyjXzf+ru/B10BfoHbRgXUTt7HCbM=;
 b=exK6r8GNgYGXlUnXER4DmRcNrnjs7iyVYs94FtrnLPZGDlgSFj1Rd720BvPjzmP6xEBQ5AIEUlovyfhRriwpfAQLAMxRvCkKuoKf6jLfUZgpZeUf34O+qag84vHzUz9KeaywdmMWSEB7PPaxZZW8iTEdO6q3nAkpf4lZX7I2OeFWzCzvhXzSWe4n5ngpyAA78gFgB1Dt2MMdaTeC3Tv2cP+T1FXDnfoC+17ZukFtoTwx6EILoyIyPu/BwJwgnK0Y+VaLzCB+USAJJL/39ak/iv1jk5/+wwTcGTE7thQjGKUmtZj40iXpOOnBl4sGtzq4SnDI7ps5BufbAgH8MQ5OlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8hUAPdMt8LeEXvyjXzf+ru/B10BfoHbRgXUTt7HCbM=;
 b=kgkNst5SBQjQsSYP0uCCg3NTOzmsrxq1S6uXOtKkfdXiALpYieb6IHSkiwabYI2xkmNDKj1MUEtGxi5L2P5J+M7S91e+FK+wnca6dFu96iQFDJSdGYMG6BhexI3F5XttvzB4CVdoPJ0ESAzNBJwRz6rDfUDw/Lfh2EKiS1FQIPTUtv7EE/WXaRGUsZtSldAaNZdDIrCvMn+aaGNQ4rQIWtiOE7gDV24Dks93TYRlaeeHPes4T/ldyAp8p5/D+VbIH9Usw2wf7DMOlCM57oyzjH3TssjlFNZdjmXgRedO2jRR8PaRxi6yop1692PTG6t/ClPuc5H3nHvDO7/vmSXArw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <cb76b42b-e686-4b70-a831-65ec69985a8a@epam.com>
Date: Thu, 9 Oct 2025 19:33:55 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86: make Viridian support optional
To: Jan Beulich <jbeulich@suse.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <3e4e4bc5-aa47-4357-9327-df2a9b9c9a1b@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <3e4e4bc5-aa47-4357-9327-df2a9b9c9a1b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PAXPR03MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 449b8e68-88d6-482c-be89-08de0751a474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFhOMEJPU0lRLzlmc1dvOHJQZU5XSkpTQXVNbDYzaWQrbWdiU0tOMjYzTjV4?=
 =?utf-8?B?SFpLczc4eVdrN0lnZHdrcWZHNEN0SjIycG9IMjdWb29oaWIrYUlLWWZqdVIx?=
 =?utf-8?B?ZDdDRGV2bkJkTGN0Wko3dkljUmtPei9WOUcxUlA1cG1idldXMlVyUzRwMWZZ?=
 =?utf-8?B?ZXZRWEJEeURrdUJPVU1nWEhBWkRUdlozRWJtdWkxUDFWMTUvUDR1VEgwYlZK?=
 =?utf-8?B?Y3MxTjRkelBPTHprWUQ5WFlMVlM2S1pJcXpNSXE2aDI4cEFjdEtSQXJrZmRS?=
 =?utf-8?B?bkFRc2R1MGpOZEdxUEVFWFNoQ0FhV3c1cUNDTlM5WjJuMDh6VkJ6WEFjVnNI?=
 =?utf-8?B?UUZkVzJQSy81bEtMTUtKUThrZm0ydjJGMkd1RHJCKzZMbHpBM0xmY040cFFT?=
 =?utf-8?B?djJseUhDdVJIZko4Skl6U0h4NVZhVHlqb21vUk5uN0pmbmNBOHJ1MHFpQ08z?=
 =?utf-8?B?YmhPV0ptVjc0enl0RVdwMVFmRFFXclcwRWUxc1RkY2dRQ2VhTktFTzNVWm56?=
 =?utf-8?B?UGtEbG01ZS9EYTE3bTB6K1UwRnlER2NUeUpKYTdWTUJpdnc3bXZXWUkwSENG?=
 =?utf-8?B?cWxqOTJTM2owNCt4eGE5eW5SbGtxWDcyMFd1M0tpOEQwMnZ2OVFUdHM0NWoz?=
 =?utf-8?B?Q1dmMTduT1AwQ3Byb1hrenBscDdyeE5wVG9DeUwvbGhWdVhXeE1tVWQwT3Y0?=
 =?utf-8?B?bmNxZEowc2JLWURuK3F0SkEwNmNRbDdSVmJUYlF0N1RCYm5RdzEwVFJXcHBZ?=
 =?utf-8?B?VkxJdlBFOG14d2RYUUVLUmcrOTlnUTZJb0FMTkRSQURRa0ZkcmNNdkc1VTlV?=
 =?utf-8?B?ejV4OGQzRmZOWDRmQU1vZWo2b0xoVHVHS3psQU1rdFE3YjcrZjZLNk5HeFVO?=
 =?utf-8?B?dzRVOG1IWmhTN092YWFnUTJGVVdpWjk2bVhIaUV6ckRUSHRZeHEzM0FHeXNi?=
 =?utf-8?B?ODYyTzJRSFFGM1JNU1pXZHRhbHhQcTNjSitBL09Sd08razA4Z1c2NjBVVnc5?=
 =?utf-8?B?ckl1bXJxcThZU2IvM0FGck1oL0NDcy9VdzhnY0U5eVBzUDQydWx5cm1USWVy?=
 =?utf-8?B?Z1hEdForeUJhYlNHQzgvNnpRa3lzL0ZSRnBSS1UrTVlxTDJ1TnZoLzI5ZENF?=
 =?utf-8?B?bW1hcWRGSzJBaU5mZ1BoMlk2MWtxVUtHUGtHMG5OaVI4dnRYWDJaK3ZhR0Fy?=
 =?utf-8?B?NjNkdHhNYWlvSi9EbFMwY2J2NjB5Zzh6elVRNEVMMEczclZmUXZoS3pxNlNw?=
 =?utf-8?B?RXA2Mk9TY2YyaFZxTVFGRnpsc1lXM3JvZzJ5MzVKQXYvNWk2R3JHY1pSbklt?=
 =?utf-8?B?ZGt5cHdTcHNpb0d0L25ldGJTcUNkNjFpeEJodTZ4NXJPeXRZeU1BZHlGeEcw?=
 =?utf-8?B?dUdSNUFUNjRxdVJTK1VUQzRDQSszSXRWekt5MW1icEVNaEErWnMrbUlOWDdk?=
 =?utf-8?B?aWpvMnVHWU10d0Z3Rzdua256OWxHVS9MZFJwbitGZjAzd3NZeWF0TklPWFFx?=
 =?utf-8?B?RjVhUFR0U2xIS0J5ZnlDWDhOTitzcFZWdWE2VHBCdWhzWmJFNGN4V3RCeFJK?=
 =?utf-8?B?d0FZcUJFQjJtcVlOZlBnR0xvL2R3dWExcGw2L0lZcnRMc1h3TFlhOU0zWDlx?=
 =?utf-8?B?NENKVXF2ZGM0RkZ1N3NySjVYcy90TnlZVi96ckErUmN2b3VJZGZSREpDQmZt?=
 =?utf-8?B?bDdEeVUrdTh5dS84MmJJV2hPejd6akcvQ2RZNFl2YkVLS2IrZlk2UFVVUytO?=
 =?utf-8?B?WklSaE9pZUl4cE5aYmVPZEpNZlE1cFJlVjF6QTQ4Zi92bEhvWDRxakVROGNW?=
 =?utf-8?B?N1djVWdsZlgzZG9iVWR1MU5temNFZjl1NkV0Wm9zSzVRYmZOeXVOaTh5dnAw?=
 =?utf-8?B?NTEyaVZweDBOSHlkM2xpRk0rQkVET1VkSVJ0OW9qS2crTlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1FyZWltT2NzRE5weVRuRzNIYWhsM2VNK0JqK2dubW1HbHlaM0ZuK1NUVFpp?=
 =?utf-8?B?UkNHZW8xVWREZVYyQnhxMTVSQlVjTFQxRUtzZjVoajhGdU54aGRCU2ZVS2kw?=
 =?utf-8?B?d1ZOWlhmV2tWZGdZU0dGRHBic2N2RmUzZTBWZHcrYkxucUxTYkhtWVFUUUtp?=
 =?utf-8?B?Uk9wRWlVcVpJR0VTRGJqdldGK2YwcEFtMWNESzFQdUpML09FUG5ZZTVXTkxy?=
 =?utf-8?B?TzRXdFM3eDlocjBoSE9SKzNjSnJzZlNOL3c1ay9QSk01V3VHaTB5bEFwV3M5?=
 =?utf-8?B?eGJ5NnZGWmc0ZlZXMlR0ZVRrVEpwb1YxdUVyaDl6VXVJU3o1aG5KQmFGZm5C?=
 =?utf-8?B?TmlYUTZTeFZiS0xvZTd3aVRnd21kTTNoWGdZeks4dmk3U1UxNmRWS0Z2RCtl?=
 =?utf-8?B?Z1VLVUN3Z3R4UlRGMERvZ2owajFHRkFRUXdKbTdMck40ZW1Ya3Z6a1d3RzBV?=
 =?utf-8?B?aHptOW51Q0dMWHV1a2NkZ0o0OFFUUjgrNmE5akxNWUYzaFJ0VVp0aFlYRVpY?=
 =?utf-8?B?V3pCc2haMjRYUkR1am5LTXhwOTI3bnZlWmdyNldlZGswZWJJaTlIcmhSU2JB?=
 =?utf-8?B?bUhtTi9uRllLSklweFJIUnk2S2ptdThSL01DTXhjT3ltVUhGSlVmWGtkSmtY?=
 =?utf-8?B?L1NxQTliUHRLR2RYcXN6REhnbXE0UVl1ZHA2UmRLTE5jTG05YjRzWkxoQUJU?=
 =?utf-8?B?M3VnNXpZVkFBQnFmL2laM2hlQll2TE43Nno4Tzh2UDhkOWRlSzdtNnFJWGtV?=
 =?utf-8?B?N0U1Ty85WFpCc1daL3IySWF0dU55UjFtbGdDenhwUms1TkZnclArdndKVnRx?=
 =?utf-8?B?NEJoSi9yR1psejF2a2tLNFd5dmhVWXhHOVNaMlQxeis2U1AzV1BuQjk0R00w?=
 =?utf-8?B?OWRtUXRwb1Z1c2NEeFl1aG91aGwzbHRFdlJlZVpkRVdKRHIza0ZJcVRuN2JG?=
 =?utf-8?B?RnVPMjB1R0VCR1pTVFM5blVic3ROcFYwcllNVkZUN2x2T3ZuaFByM0pmUFdy?=
 =?utf-8?B?V0QrT1YrMDY4WFJsR1U1QVJsUzVuVVdtSkNDUjl0M3FVRHlIZ3g3bkJUVlBz?=
 =?utf-8?B?SjEveVFFYWZLN09sZHZRUFNrNlE3NlYwUlFJa3I3U2k2dEtvRUxVcm9wbjVM?=
 =?utf-8?B?QVpkamFTbldIYXBQa0VWbVVWL0lqMmFUY0pyeDh1Y09oMkhTN1Y5TzNCQUxC?=
 =?utf-8?B?aUJQMXpPZloyMkRTZ2Z3RVh3cWMydGYxcGgxbzZjZTIyci9VZm9YRmx2aXA0?=
 =?utf-8?B?K1pEU0pRTHJQYmkrSEh3cG1KT3AyMzNIYys4V2dON2UxSG9uUzBpbW5lb2R3?=
 =?utf-8?B?L2F5eVUxYVBpM2xkb014MUc4Q0xmSGh2MzMvTmREWmdHNW02RWZQZy9mRFdY?=
 =?utf-8?B?M0xCRHhtUDdjKy9CTFQyNWVJQlA4blRoS3h6SU1nNXNVSlczam9tOWl5UklK?=
 =?utf-8?B?am1tTHlKSW96dE1DN0dCUm85MUJWcE45Rk04NGhHMXM3VUJJMXlMVzZSaC9P?=
 =?utf-8?B?UzlJV0R3R1A0NE5RSjJPVFMxVTQzb3QvU3N4ckVyVzg0MkRFYlNoTnlvcXBp?=
 =?utf-8?B?Q3Q1TG9qWGhjczEwNDRha0k4cGZoS01TWWNYTjhyVVNnUkM3Q0NCR1ZYTTVZ?=
 =?utf-8?B?VXozZEhjK29oU0hxb2FGTWtDaHBKdStHOUNCVTJMb1pGSFQyNUdIY0lEZDBt?=
 =?utf-8?B?UW5ZbEJTT0FvUkZLTmhQb1J6aUxKOEFhRzZrVUtOZjUyaURFV0dtakxmZUR0?=
 =?utf-8?B?VHpTSTB1RXhJTHdvS2JaRTJMTXQ3VlMwQ0JISFc3VmRaMExqVWRmU0hkZ1Y3?=
 =?utf-8?B?eHVZdlIrbjdsWVlrWHBKTlRpYk1kLzl6TjNPVUpUd1p4djVDSWx3VVNsRjdD?=
 =?utf-8?B?MFg1MEI5MEFaRDhkL2FBZklJUG5MZHdEcjFPanc2WTArSFJETmpHK1ZwbDM3?=
 =?utf-8?B?alRQVVA2YVA1TUJNTEUydWlmVzZTb0ZlRGJwZHR0STFRVlMzU3FocTFUK01G?=
 =?utf-8?B?Wk1zS2hPUHZXNm5QdUJEYStUOENCalpGM09ENHlIeHk5UEc1VmJ3YTBiZmNp?=
 =?utf-8?B?UENGMHFHWUhmZzdwYmh0Y1lTbXF5cFJwNzZCMlViQjEzb1AxcENVUEVPc2xq?=
 =?utf-8?B?SDZWd1lNS1VaalpZZDVwWnpYSGsxZUV2enh1ZkxlVjA5aWhJRkdESnZ4N2Jq?=
 =?utf-8?B?QVE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449b8e68-88d6-482c-be89-08de0751a474
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 16:33:56.7420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vw8ntQv5Crj+YghNh/Rq6onDtc1K85TId/RoSetZh5z1OP4ZtKdJ2KtWaCidYDEC2zh2UO2u1OINte0M3Kseh20zs2gXX64VdmX7slvvLsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8251



On 08.10.25 19:04, Jan Beulich wrote:
> On 30.09.2025 14:52, Grygorii Strashko wrote:
>> --- a/xen/arch/x86/hvm/Kconfig
>> +++ b/xen/arch/x86/hvm/Kconfig
>> @@ -62,6 +62,16 @@ config ALTP2M
>>   
>>   	  If unsure, stay with defaults.
>>   
>> +config VIRIDIAN
>> +	bool "Hyper-V enlightenments for guests" if EXPERT
>> +	default y
>> +	help
>> +	  Support optimizations for Hyper-V guests such as faster hypercalls,
>> +	  efficient timer and interrupt handling, and enhanced paravirtualized
>> +	  I/O. This is to improve performance and compatibility of Windows VMs.
> 
> What is "paravirtualized I/O" about in this context?

It was phrased this way and agreed upon from the very beginning [1]

[1] https://patchwork.kernel.org/project/xen-devel/patch/20250317071919.3766976-1-Sergiy_Kibrik@epam.com/#26305207

> 
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain *d,
>>       if ( hvm_tsc_scaling_supported )
>>           d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
>>   
>> -    rc = viridian_domain_init(d);
>> -    if ( rc )
>> -        goto fail2;
>> +    if ( is_viridian_domain(d) )
>> +    {
>> +        rc = viridian_domain_init(d);
>> +        if ( rc )
>> +            goto fail2;
>> +    }
> 
> While this looks okay to me, ...
> 
>> @@ -739,7 +742,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
>>       if ( hvm_funcs.nhvm_domain_relinquish_resources )
>>           alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
>>   
>> -    viridian_domain_deinit(d);
>> +    if ( is_viridian_domain(d) )
>> +        viridian_domain_deinit(d);
> 
> ... I wonder if viridian_{domain,vcpu}_deinit() better wouldn't be tolerant
> to be called anyway, thus avoiding the need for conditionals here and below
> (and perhaps being a little more robust overall). Thoughts?

I think There are no limits for perfection. But at some point - need to stop.

Hence Viridian code will be removed from build when !VIRIDIAN - changing above code will
require to add stubs for viridian_{domain,vcpu}_deinit().

FYI: Xen pipeline for this patch
https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2090362213

-- 
Best regards,
-grygorii


