Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AB0Gq3NAWrajwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 14:38:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC7B50DFF3
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 14:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306124.1578192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMPtD-0006TI-7X; Mon, 11 May 2026 12:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306124.1578192; Mon, 11 May 2026 12:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMPtD-0006RQ-4n; Mon, 11 May 2026 12:37:39 +0000
Received: by outflank-mailman (input) for mailman id 1306124;
 Mon, 11 May 2026 12:37:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wMPtB-0006RK-DO
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 12:37:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMPtA-00EyM6-QU
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 14:37:36 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a01cd8a-2eae-0a2a0a5409dd-0a2a450b917a-14
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 14:37:36 +0200
Received: from [40.107.209.58]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a01cd8f-212f-0a2a450b0019-286bd13a560a-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 14:37:36 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5213.namprd03.prod.outlook.com (2603:10b6:208:1e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 12:37:32 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 12:37:32 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PomrkHFPsD3axxiiaTD4qv48AeMpfOoxd+y177N6UfewIh5nh19ZMVMOS4LYkTf/ukdb0xh7MLQGMPIABfFWSulzaBEEQ9PIBIrMSJ6Awk6cbFKh4hJA/dN06G8M/20HDWo+EB6VQD+ts8ONVzVSYLjrRl/+J9YmSi142HSKId4Ya8iGT62Aqw+xV0gkVuGL1goqGqNf7Q+6tM8bB1WvNfGvjcmH6d3xABaHdWVrYIkb0iYWCXRBrPp43ES3nkkPyg6cxUxvJvlRBCXpWqXpbnzSYjzw4xNkW+i29rbUpKnu7RXINwgvufTUX8CMNkR5OSD1/i7hG7Q9CXNxgDbQ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hms/RpbCto/QnfYn4Se9uj+xD2gVfhyzXgF5kAG17Xc=;
 b=iXIN6OpHmIwYXen7OjzoE/HeOkWxsL7so4Bnq86FcCpWVkB+uJyzxhMzKqt0awxOC/+WhKE2p8sPnXKXMELrieWNLD8R8mZpdgLtKQZffY+7Z044tYHR6qSvpVkqm8rDUssKZKEEwWtfcxnUlw+Ht9twgtqwID3jhT9C/N0XEt6kFQncgXuoDONtkxK6ehwBIcCzNjzl88w+4AJeJ/C/x+tLqXKz/ASwNbm3IAshGaRPfHIJUbzdnhfbjN5DeUHiQWz88reMKtLuvOsoMWBDwOqFad5ug6J1dUgyk9wgdgmJvzYO1I8HcMLYLP5yjaJ0c+qtLqYli8yv8Ev7T7LzYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hms/RpbCto/QnfYn4Se9uj+xD2gVfhyzXgF5kAG17Xc=;
 b=LhimOa7MBEXii+8CcW4TkopYuEwEWfbQ+Qnc76y0U5yZlVs3oQeregl5eq1HVkCxrtiBsn0D3ZKD9HtwfAObdmSKIRpsu9ilAEWIxurdog7zP6msalsItI5Ge6/mBD3OZa1v3M68Kn21ZvmMvbPSH/eHqqK5P4iUNaIR0CqVxAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cf0e9b57-c015-4ba2-b7de-a506c981dfba@citrix.com>
Date: Mon, 11 May 2026 13:37:29 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/MCE: adjust S3 resume handling
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1e0a8808-4594-4574-819b-1a75d104294d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1e0a8808-4594-4574-819b-1a75d104294d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5213:EE_
X-MS-Office365-Filtering-Correlation-Id: 6433a9f2-361f-4d5f-0a10-08deaf5a122d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5G/rKuMF+CQIMto9RwBYauyubmC+InJ24bHDYZv6dWUTyIMALt774hiiuTG47U9b5MbObvO/4SWkpoE5+joY/fVqbUobkE2DOhVVvsBfKFnZ9Cqkv2rn/HynIVgBScia642sj4kcdXZGm7dqxzEjZOYvzO6S6g3Rn5PAaMYoanTakKMHzqGaescy6MPaxPSO3EJ8eIHHE9gp5tGlH6cPkkUzGNkc2Ctw6KqiscPGv2gLavCLZHOpfP7xqU7k5rcFN0vDW3TvyRf3p4EG0ZcTFkzglTQCgwuPlCSNPr827WxPlYg2ICLfltcKHh6ATT1TeDNy6732XLzdinw3yyulYMFerpb0uxU8De+9J7Lk2zfsSEtYJqSqgcaO4WcWEENv36Ih1ZwfX1DuWOk+5ywmM27k1y6Gqi0ZmYeIFrj5DFdv+KQevcxXSWf9Xcp5S/ut/7XfB9jppHg4AnDsIujiepk9rLUtS4JcVRPEfTjurtCDCnLSSh2PkEkDJojMGmuThIgl1jGCHbQ758ZMgmxQQDIg7A0HQg37etv1YA1Gr+QodenoUzJR6Ya6CHK79nWsRWTcd1P9iGlVujq3/LCYQ3y2UExxLXR//78V4rSBNEIwodIVRkBqORbBDSZiWjD9L6eKC9wm/Emir9nb2NNFwQizyYwJTzYTxNyBRu+Ayf299zf7CKkwIY4rHclLZUNn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmZyZWJOSEtNbUhHWDl2ZkF4amVqaGV5YTJMUFVudG0vTCs4eTlTYngxSHpJ?=
 =?utf-8?B?Tk94NEVSQTJGSHJmNDFobWgrSU5PWjIxWElQREQ3eTdMdUxmT1J1YmUrTGFS?=
 =?utf-8?B?MW5IckxDcnMwZk43eHB4Mlp2ZjNYbkVUQXk0bkhVVzBoOGpyb1NPWTllakh5?=
 =?utf-8?B?b29USi9ZajVlTTF2SUVmczBMblZTZ0Iyd2J6UURJMU9XS1l5c3c2Z09udUNU?=
 =?utf-8?B?MFl0ZnhaamxKamRJbjI3eGlQdE04eUg0dHM0MXR3YTRtZURpZk9oZVRqS3NP?=
 =?utf-8?B?RFQ4bEpWWFhjblZDTXZib2gwQ2NUeXU1OTZ6T0lzTlVJanRpQnBDN3lzVjM1?=
 =?utf-8?B?NjFScEFWRXlIdmtOQk9CaERQWFBaQTRyanVVM2ZQYm9GamtEUzBtV0djVUh3?=
 =?utf-8?B?akhmK28vQWVWV3ZhTWNHVGkxa1pKb2laTFF2VTd6N053V2RzR0laVXhXT3ZF?=
 =?utf-8?B?NlVZQVVjZjBpeHFWOFVIYk1Nd3htVlFoZ01RR3pYYnR6d25GeVZhYTBDMUZr?=
 =?utf-8?B?NjVXRnJNSHI5a2hmSWFqK1BnQjBFeFBUSFE0VUEzVmxLRENrWmtqMmdJNjlQ?=
 =?utf-8?B?VXNjeGJOV3MvZ1diL29FVHRhbExRWmpPTTlONlM1YkpMWEVjNWplbnNyTGcz?=
 =?utf-8?B?dzBFbWRJTEd3MFU2aGZCdEZnZzhla1VTa0xMeldyUzNyVngvTmI2L0pLK0hC?=
 =?utf-8?B?MUxLV044T2lYNGc0dUVwOXp1aXRVV2V5Z3dTSExwVmthS09tR2xLN25kMEFB?=
 =?utf-8?B?UkxoUjExdHBjZjZiTFlrNXhCQmNoWXV5NE5WN1Zad2tEVWtJcEM3dWFxTVZU?=
 =?utf-8?B?VU84ZkE0NG5RaE9FUHZKQks4Sy9wV21JSDN1NW0vem9xa2Urcy9GRFhydElT?=
 =?utf-8?B?REp3aE1SS1NWLzVZVklTdUVLWWR2WktHcUl2c3RTM2hZRUk5KzJCZ0tTcWNZ?=
 =?utf-8?B?YkpWajAzdEtRUmtaL25rYjNzOG5za3FyVzZCbFlkOWRicFBQa1l1SjFEdE5N?=
 =?utf-8?B?Q0JMenVObGI4eG5MSEFHWGdqYytlQW5WOFZxa3Rjbld6dzdkZWNPcW5PN3BS?=
 =?utf-8?B?Y3V6TkpFcTBTOTBsT1Q2MW1mWENwNTNwaDhWbC9sek91akJteEhZVlVOL3Z4?=
 =?utf-8?B?NzVRWnFwMXlaVlhlZlNhek1Sc284REVCYVF6c0lIaTJlbFd0K2J2ZU1aV3FB?=
 =?utf-8?B?Tll0ZllnNHJQZDU0MXM5Tk4yQjJJUnJ6akd4cHlHbEtMcWYxS2tlanlqZHNu?=
 =?utf-8?B?REN5bFJOOXZVK0dMazBLRzZXeXZQb0IvVEx2UStsZmRhZ29LczlFWXhybGZw?=
 =?utf-8?B?eVh2UzdOQmxLSjF2L1hBNnJFT2p5c3A5dk1jYmpvWWkyWjBnNWRjeFluOWw3?=
 =?utf-8?B?TmJkc09KelpoUFovMGs0R0U0TElKd0U1TUtyMjRJRlB3M2pNdE5oU1JJeWsx?=
 =?utf-8?B?a2tMUTRGS01kOFhPZDlmZFBvNlRGUkw0V2o1ZnlHOThSR3VVZFdRYmtIMXgw?=
 =?utf-8?B?Q3lTY0QwU2Vzc2lmUXZEQnRtczFDUTUzS0pZaE1KNE42SzAway9oTU82aTJ5?=
 =?utf-8?B?bEU4ZzZiQmUvbllWdTFOZjBiN1dCSWt6WFhscGx0b3YvcDRVdnVscXg2U250?=
 =?utf-8?B?N0N2eGFsbFRXd0V6MTJJU0E0VDZ5NVY0aVF0SDlzL3lpUmVGUzd6MUpZd0w2?=
 =?utf-8?B?Um9CZzBGUW5Sa1FnUDMrRFpyR0JIREMrbWRPZlE4ZVFGSVhJdkk5SkhNQXF0?=
 =?utf-8?B?aTI0clgwazZ6MXBMdGluZ0FncElLVENycEZCaHd3YTlkVkJnR2xncVZ4M1dx?=
 =?utf-8?B?ei92QURzbWtocVo2K0JTeE9oK3dNVjUraktyK0lKU2pBUVRvWjdVUEtBUDh4?=
 =?utf-8?B?eUVTNTB6RER3Z0Ftd00rOGFDZmIzQlFuQUsvOTVlZWNFL0g1S1pmdjlrQlI1?=
 =?utf-8?B?cjZXbHNmTWVsRjRMbUZGakZuYTZUVlJWZVNMWVN3REJtMTh0clpybkhCZTNm?=
 =?utf-8?B?Nmh2T3hHVjBJcmlpQ1UzNjlDWnVNT1NlRkVyM3p6ZjNoUDlJZC9XV3lwYkR5?=
 =?utf-8?B?RzYzVEN6K2plT0VCLzV2OFJDbEM5RS9ocnJCa1N2UlA1OXJqQlo1eWRFL29N?=
 =?utf-8?B?VzlQeVJWbWdiQjVoMnFVK2FYTm1rYVlINGpVdG1FVEUrNWM2VG92NHRwb0pC?=
 =?utf-8?B?WmFKVzV0RFFSWWNWb21HdTMxOS9hM2VEQXRQeFROVXV6bW40aFdzNkJzQ09p?=
 =?utf-8?B?c1JFN3MvaDNqdjI3WUhtVWFnS3A2dFEwUm9UNFZ4ZkZIV1kwcDJic1BudEJD?=
 =?utf-8?B?SXErM2g0M2I5aVNIbGRBUHIyZ3oyOU9RK0dQZFErc3lkYzlWZGF3VWtSTnl5?=
 =?utf-8?Q?Oh/ofQvII7LWga3s=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6433a9f2-361f-4d5f-0a10-08deaf5a122d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 12:37:32.1016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mq9LX5sbNCEWjGXQsSHhaP4KzqvMxsjk9h6orQzWD1xvx94eofCpTpzLxQYIobD6XH/blJURpmooSHBlInp8BgPBjSIEYIYzaVC5ngbmUyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5213
X-purgate-ID: tlsNG-42698a/1778503056-1A971F3B-5C268A2F/0/0
X-purgate-type: clean
X-purgate-size: 550
X-Rspamd-Queue-Id: CAC7B50DFF3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,citrix.com:mid,citrix.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 23/07/2025 1:20 pm, Jan Beulich wrote:
> The BSP resume path calls mcheck_init() with the address of
> boot_cpu_data, thus rendering comparisons against that pointer
> ineffective. The additional "bsp" boolean needs to be used (and
> propagated as necessary) instead.
>
> While touching intel_init_thermal(), constify its 1st parameter, which
> in turn requires touching intel_thermal_supported() as well.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This is all horrible.

