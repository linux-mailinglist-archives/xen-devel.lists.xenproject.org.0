Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFf2LZ6uBGp6NAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 19:02:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 404055379D9
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 19:02:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308319.1579837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNCxM-0004ew-MD; Wed, 13 May 2026 17:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308319.1579837; Wed, 13 May 2026 17:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNCxM-0004cf-JS; Wed, 13 May 2026 17:01:12 +0000
Received: by outflank-mailman (input) for mailman id 1308319;
 Wed, 13 May 2026 17:01:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wNCxK-0004cZ-V6
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 17:01:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNCxK-00B0Jj-As
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 19:01:10 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a04ae45-2eae-0a2a0a5409dd-0a2a45018b6a-46
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 19:01:10 +0200
Received: from [40.93.201.22]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a04ae54-c1f2-0a2a45010019-285dc91695e0-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 19:01:09 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB4930.namprd03.prod.outlook.com (2603:10b6:408:de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 17:00:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 17:00:57 +0000
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
 b=dXi7A0r5MUzMK43E95ZWVyd/QtwN/GySOB6SeqRDlTU9PCAAWvb/524B3L8tSQf4H2BTVAoe8oN5ixkPFWis5uoaIT80UF8USrhPL3Xcezcdn71XYa4i8ZrbazbvJAPhVn9w5Cu1ep1aTCzlbUqlw9w/UFLlWkNlEpsd+pEo8ycySQOEsIgjdvuqLd1b0Bweyj+DoGdu7h0pCO1UZpr9WIrk0OiVRSsNiUofiDffpvekw7J8OaXJs0bMHijJL5zUN2w/7c8XaQ4DFJCG2XQ5tiX7lxmKriPcK6nY+6HcHePPeWig8wBqhEHImTs3eOgbpYktjbBM1viWvaKePox94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVl+JSfnPJTZxlVz3PTJaI37SsYB2is65o/9TKu6yWA=;
 b=SH7EFYtovZ8IWjaVr0ncHgDo2xn8L+r8lQeP2VL1066tNXGSSdZBpDF7UYlLYMre832TyD2W39PdVjaFTt/dOO44n4tmHBohcUlvz6BKc1gASwlOAwfOIVpU1K1cOY0mr6yJhxYU8VeLsxlB4PiMnZZIRL8xUpQ1Xl/wQFMLD/r8elU/coNglsi5x0hyv7LWb7Rdz0SBD6XTcLGro3tFQ6GjZFxQPKUCt+j8rXY6OZvqovxvXdICRME++2/SmbXcc8C9pKIshjfXrPcDpmjAt6lc+a768GoQm+LNK/X6aOQl5Avrdx1tMBB6igV9PmH97TOIkoRNaMmljU/2/LMB7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVl+JSfnPJTZxlVz3PTJaI37SsYB2is65o/9TKu6yWA=;
 b=qkiVGvp8++/gHQqQfpd5e7qvZ4095gSrtF/VR5I7xo5fda+lhcZWAkIO7riuiR6RMM4msiU/wvOO6HX2DcsPzKWsKHjMH9X8k0/Bokptbe9ocCIq/Mq3Y91kQmoZAy+KlF+FiYIw3+PKcajPR/VPaw1Oxt8MCoWRsJKb/bef/gM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8ef5af19-7660-4ee9-9cf6-094c744abd0c@citrix.com>
Date: Wed, 13 May 2026 18:00:54 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] x86/MCE: adjust ID2COOKIE() for Misra C:2012 rule 11.2
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bc9ed10d-5ae6-4d9d-af90-648931731a52@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <bc9ed10d-5ae6-4d9d-af90-648931731a52@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0067.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::31) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB4930:EE_
X-MS-Office365-Filtering-Correlation-Id: d8dfca04-cc9b-4a6d-4ba5-08deb11133d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	XEhUD6J/y6mkUpD4A34EDfKWJYbjqA1EzGu9SbEPnPFnre4WtSSicwOLZ1DMAR6iAWOO1uZrd6QUMsRGgY4gAXtox3eKvVFcT1ixJHHHOOEP6v8lJpJpVM+rrbHPaZqd6fbTH5pXt9whBDg8WIMvCPYCBM8N0Kc7e75xxBmKPnenbR1YRMpfUmOH7LIE8AlyCc1Rubi5OPH7nxRXuTQWo8QhzHxquDOqD/omIaJ20wEjeiYlIHFnAhcUuwhUYm7tXVDlZXp4H3ZFoFGYn9/J2t1SHloiuqvweSEgJK9TTY5JTPwAbF3yKRBtLFvF/3jU2kvFy/Kzid2E9zC39djEOz0/ofQK+FYb/t/3G/pBfz+X03hxSE869sNozsysSC/zEH1I66jlj4/zU2jLutRxIWDfK6BnWl+b3LNfALn9Nd/+CNLcpBD6sCM7ksxuRwdrDMy1zbdV00stBBo+tDC0zaSuIWdxSGBts8JfvbVQUiHpGMAFoiay40AxQW7ZUuDkABxxHcUCXbgKkYzZuVr86LyuvpWkHaRIx5d8YpRrN8ayV3bkm+KpEPbCQQsPltktaOKoWbW59/Hz/+c8WANkXJvsvtEHmPsAZh7GQ6Cqj3kQ5KjiEQ4zpU3TWbJlhag2m2FlzBF7BsfFUHaLpgt8XSWEERW772kZjQV/cH5Q4fI+lf8NJ5SbCq82bWnA8M6U5FWD96MTfoOrBbfBXZAQ5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVczWDd1ZkFHd1NVQXdJZ0g4dVhQZzdlS0hIVkhDUW9DTzVXeThVcFA4dFgz?=
 =?utf-8?B?Wk5NT1Mzc2xFTUNkbEx6Tmp1eHN1UEFGODRaYWg4bXVEdzVHVHRnOUFWTHFj?=
 =?utf-8?B?UnVYVTd3Q0k0NGZVd3AwR3RLYlpBamgyMlpkTFk1L3Y1STRUZkJuWmVidmZE?=
 =?utf-8?B?MDFZQ0hPZjJpR09Ob2dQaFdIZUljWEl3YTNMZ1A2dUg1S0RCWnFlOW4zVkgr?=
 =?utf-8?B?S3FQUkNTTlplcTdHQ0hieWJRRjFPR01VaVBlcUtzUlpZRGUvZkFwalNzSnM0?=
 =?utf-8?B?dWRNYkJoOGtYSzhZekMyOWVjQXh0b08raVl1Qnl3bnRCYXJobGRVQmxDeER0?=
 =?utf-8?B?c21Ldng2dXFYaEhhdDZtc25nUjBoL0pydHA0SDVkUkVONlZQSlBjK0wxdTVm?=
 =?utf-8?B?TFlCaUw4U1hPSjFPMWhmVU9abXBDVEJPenJiN3hpUDRpMmxTdFVwaVN2alVs?=
 =?utf-8?B?N1VWTzBFR3hnSUh5TjFlWlIzdUdqSlYzWk9iYzNodGc1MjNUNmVKL0RhVS80?=
 =?utf-8?B?NVJLTC9kSjFjU0RuVTYraXBaTUFmMmltaVlhZU5QZkRSQnpnaFVzYWJDNEFy?=
 =?utf-8?B?a2MrSHN4UmNOTWJvUVRLcW9UYWFnQXVCQ1lTdDdsQU5LOTBzS3BPdDJEZlNz?=
 =?utf-8?B?QzgycHdRemsrZWltckJvRU1mWENlZFkxMVZ0SXNkZFhoU1NzOWpnQmlINzJu?=
 =?utf-8?B?N3pSeHF6cVI5Q0JtcU9JQUpUbXkrVUc3N0lteTNLV043cXh0aVcxT091Ymc1?=
 =?utf-8?B?L1F2bVZ0TGJpRFRldlhEb2xPOUZWQlpJRFByR043N2tNYVlFU25KeWxWajBD?=
 =?utf-8?B?dFAzd1ZNSVo5cEdFSUxwZDVoZXVoeTNYeS9wTUZLMlNlUGY4TS9EMStRWUJH?=
 =?utf-8?B?VE1UbUwwUTdsWXJJQ2ViT1pHaHBpZlBJMHgzblNVdnBzRktxNzl2S1p5Uk9o?=
 =?utf-8?B?QVhPenpUeENzSGpZdzN6NHpncTVYSnVud09nRnJCbXBiT3hsMEo5ZXlmMXlW?=
 =?utf-8?B?UEtuekdiT2lTdDNvbTkxNndXbFYraURnQ1pIcnZ4c2xLZnpKZlZaVkZmaDdm?=
 =?utf-8?B?Tk1MRXYxTUhoZHBTdDAyR1hFRWZxNDFlcmZiMVlvK2JvWE4xQmJpVDR4cUg2?=
 =?utf-8?B?YTFBZk1aaVNnaXl3cG4zS0ZmWDVqYm10VUtoRjZJNzc3Q3FNSDBhVDVtNVhl?=
 =?utf-8?B?dW15cis5NFNUUy91cXcxeTRMMEdzUXo5Y2dnaTNWVjQwUWkrS2VDTksyZml4?=
 =?utf-8?B?VWEwZklnMS9EZ3hjUDVrNms4WkNDQWJsbjJab3R3eHRyMVdoMTdNQk5HNnha?=
 =?utf-8?B?WGF2WVFOQlFNTWU2M0dSNXZTeUMwWGo0akc1WTlGZDVyNThZaHF5UlcyVHlw?=
 =?utf-8?B?aHg2RFVDQU5KbTBmQzBQMngzR2hSTTBuSUpCRDhNdC9iRUlWNFhBN0w4YXQ1?=
 =?utf-8?B?TG5VNUJzcm1xZC9iYWpaR1Rrdjh4SThVQmhJUzV1UlBVemZrUGNuNDJ5R0ZB?=
 =?utf-8?B?TzlNbnBSWmd5MXNwYkhnOXA0cm9LNUxiY1dUU0xSRXYvY1B0YUU4TDdrSVlY?=
 =?utf-8?B?UWlDTFRHd3hMNks4L1AyWDJJQWduWEpiQ2VaNEVvTVVKZVQ5b1VTRFo0Wm1h?=
 =?utf-8?B?TWx1dVljZkFSaCtIWnZpRFVzNURkTm5DejVIT0pRODJVaXVXOWNxTkVxQ3Yr?=
 =?utf-8?B?d3RsUzZqVk1xN0pyeGg1djEyR1lVSFZOVGg0L1EzbUFSMk1IUFNpYUt6MVpo?=
 =?utf-8?B?Qk5odlp6eS9uWGREVU5DQjRlRmFMcTZrZEFqNXhnVjcrYTUwRG5CM3ZrMnIz?=
 =?utf-8?B?SHBTNHhHNHJpVENoK25FMzdrb1h3WndoYVYrV3NSRXF0akJ1c0FFTDQ4YnQw?=
 =?utf-8?B?bXYvcFVubHYxV3NHanltRWtKSWhkaEtEaDJaT0NISXFBOCtnVW4va3dYNktu?=
 =?utf-8?B?NDh3b0dWZkZsNW1sN1pTbWo2cEVtVFVFSmN6NFJSSlFYS091SDhIdkhRZmNq?=
 =?utf-8?B?bEpDVDlPVDR3TmRIUDkwdWdHcW1Fc1g0akFjTnJaUElNWkhaa1VLcHdvMXhJ?=
 =?utf-8?B?aWdqeGlzTjFFdGc0aXVEQXUrZk9CZWFURVNndTBxejMvdjRrUURnOFpveXUx?=
 =?utf-8?B?bnJYNjU4Nnc3bGZYLzhQcUFJaFgvTUphK0NUWklMK3lRdldTdm1pcGw4Qkdy?=
 =?utf-8?B?MjFIem1FczNmWU5vOTF0em52ZGh0d0NtZldTT2oyejlMTldBb2lMRkkxdXkz?=
 =?utf-8?B?aE1NQmdmYk5BSm9vMFZRZ1NyV00wa1JDUHNhby91SVdDU3F2WjY3aFdCeVNB?=
 =?utf-8?B?VjB1RmpMZkwrU084c2RxMGdBWWVWUDN5dmdjUlNjSndJbFYrSU1rMnBQc0tM?=
 =?utf-8?Q?V0IBi8ZjzdG/oz7s=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dfca04-cc9b-4a6d-4ba5-08deb11133d6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 17:00:57.6443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gm9Nt/I3rGAaffFUmj00+5Bd4sctjREv7dKkoMbTuTRguvpBhOKgPeDD9fz++HzRtp+Q+W7Ds4JhNNdCiOE7Y7HgSiCx8h5FbxTrK1tg/JU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4930
X-purgate-ID: tlsNG-d62444/1778691670-B7957FF4-06DA466E/0/0
X-purgate-type: clean
X-purgate-size: 905
X-Rspamd-Queue-Id: 404055379D9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:mid,citrix.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 13/05/2026 3:03 pm, Jan Beulich wrote:
> ... ("Conversions shall not be performed between a pointer to an
> incomplete type and any other type"): Add an intermediate cat to void *.

cast

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14351897188
> (covering more than just this)
>
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -1264,7 +1264,7 @@ static void cf_check __maybe_unused x86_
>  
>  #if BITS_PER_LONG == 64
>  
> -#define ID2COOKIE(id) ((mctelem_cookie_t)(id))
> +#define ID2COOKIE(id) ((mctelem_cookie_t)(void *)(id))

The interface here is horrible, because we're passing a pointer to a
uint64_t to userspace and back.

But, can't we just cast through unsigned long instead?  The compiler is
happy, and that feels safer than using a pointer type.

~Andrew

