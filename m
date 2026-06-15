Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T9y9BNXfL2o/IQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 13:19:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B54685AD5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 13:19:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=SBuIN9Lc;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338150.1599163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ5Lt-0007OQ-1g; Mon, 15 Jun 2026 11:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338150.1599163; Mon, 15 Jun 2026 11:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ5Ls-0007Mn-Ds; Mon, 15 Jun 2026 11:19:36 +0000
Received: by outflank-mailman (input) for mailman id 1338150;
 Mon, 15 Jun 2026 11:19:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wZ5Lr-0007MJ-1d
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 11:19:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ5Lq-000Hep-7a
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 13:19:34 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2fdfbd-5cb7-0a2a0a5109dd-0a2a45098148-26
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 13:19:34 +0200
Received: from [52.101.56.9]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a2fdfc4-2497-0a2a45090019-346538092820-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 13:19:33 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA3PR03MB8232.namprd03.prod.outlook.com (2603:10b6:806:45e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 11:19:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 11:19:31 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocVor2mXGD1nEQjbSYZ10b6WuO3kO3HF79zfz6bI+hrz1AYYjY35uoYd9/MxK4XLg6E1UyhMEvW5wDK458fEwaEoeD1R+Z1Nd+pDsuQyzCvSIxTG5snZGMWbO0u4yHrrw168EKaNsEgS5xBTHyD44LNQfdmHnmcdFwAy3T5OkWRqH6xrDnET25JaMOL61+FXHcGPqPjcpQohRg+XgG1Cd9AGGN3naMfNMroUFIRYeMh+SgXVl9YIeNCzY4Cr5n2Ylq3ghn4ntctHMm1JdjnN4L9PEAdRlr4ALP34drgp7FmpWvLfYhMeXi9eSYk7UL3Bkal1wcxszs6Sidg0cjdhhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s81ac96pbIiBmp1ghCIWxSw7yhhO3XHyOmfwD1mLliw=;
 b=uV9F9oFKFnbYMmzOT/09GbVtJLasXOCr4EiFdjo7euYzO/H5Hu9fspKl6CcKGKx5oenhXk+t3EeqHrySSgbZvRC6V7jKEqY+CP4h71Ho/VBFDMsh4XHO7hTChNAi3Mz9HNG+jo8+I6UBgEa4DOertUZMiZ6KLXLKtyC5cEqAnmO9xYahDN/kQmeLHGItIFpQ52X26zUhJP5D/Cwdqnlm99ChvHvEO7ErTNBlgvmmOTIueN3lcbyW71BJKgcApaoMgkBJk79Thyzq5sPKCu3myYdfrvlgJXHg9LFozOR4ZZndcN2OASC6qJv03QS/nBjYf74C/JRsmEpLlfN60lNI1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s81ac96pbIiBmp1ghCIWxSw7yhhO3XHyOmfwD1mLliw=;
 b=SBuIN9LcTf+xDFXFcpyepEw5JtPT2uzQBbZRrrq0RrKP6PV4Ayb2Ji3Prc4a8tyWTfc92OpzNBjw/QwMTPObo1szsZKCe440U1DjySM9KOpoVeg5c8cbmKEpjA84enCzRjalgwh8wZOjsPCmaw1vSPvYxTvHmD1xDO/nI3Lq/4k=
Message-ID: <726828ec-85af-444a-8768-5b07663a48e9@citrix.com>
Date: Mon, 15 Jun 2026 12:19:27 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com
Subject: Re: [PATCH 7/7] x86/kexec: Zero general purpose registers
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260609154518.779757-1-kevin.lampis@citrix.com>
 <20260609154518.779757-8-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260609154518.779757-8-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0229.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:372::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA3PR03MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 05e872e9-38b6-43d8-f010-08decacff8ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NKnKEfXXPM+/VuLNs0cxwnjzX6qybfFkBneS7+Q37Tvpz6lmnUNcjWp0HoP9ILXNxz/r1FgziA5jQ7oEXsW5Io663Asdrj2NAsDiMmUqdCsJu0LzV/4XyJsAUFLX/eWcFfgK/tYyksGHC4PYUpRUBfDd4vnGvHgS45TEmGBKivVD9Rnq3vpuVSEG1YYqB1U9cWbhHoYh7rydDKmGsANhYvkBRMIAO9CGz/hkTyTIRqqITK4Ohh7pJejc7fE8ju8ULIJOwk9HLyWY3Oahkbps/flLBj0E0+GqDQELDGfi8MZ6TZsn3d8QqQWbKCwSwczR6NwKZLehOzx9ZzL7WjQq6T8ywT/KGWbDj8N7I2jSfrySBreEzanqo7mAWrYMEwOOC4RQSaJFOZjieygrvrVI4csFFys8zGAhOmMlf/jXnq3yXYNlWVwivFePCBJLZPvZoNAqagBEx8U/rt8sr6uB4U1saWjk6P0J2hs2O9QzdIucm11e37xofx8M+baYblveL21pGNBqCrNUhj54x15fRZhQMJcGWuRhI/o0xCObN2slwLOgzECNHmPUFlYnMO2sJHGsclf8kswLXwmAXyotGcQLucc6Yw6mDng3utSpx6fFMrwlJd1r2pCy9KDGd1AjNAVnc1QmUuYUPGHhBUzptV27MsUnnGJOlD6KYjY9iSOXXUaI9a8XfG7lIO5ONt41
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmNCc1JqSFdyUDl2WHhod3R1QTB6UEJid3VRb3FLWXVKMzAwNmhFMlB3d1JW?=
 =?utf-8?B?S2FZM2hXMWpzK25MK3IwRDhEZWkxR1hZL0RHNXZPOWlqZk1PQ0lra3Eyb0hq?=
 =?utf-8?B?cm1EUUFVSTlzT0VXMktXeitDNVJ5S2JGaVYvN3FlNG5ieWRHRVIwOHA2M09w?=
 =?utf-8?B?aUU3RW9XS2lUM1lKS1lNMk4zdVBvc2RONUdWcmhBcWtVYWd6NXE3RGdyS0Iz?=
 =?utf-8?B?TldzcDMrWHI4WXFzNHdvRzNHUTNJaGJKWndnUDBTVzl0MktuYlRFMVIwby9X?=
 =?utf-8?B?U0RIbzBleGNLT2tFVklJVjJvT0hMUWhjeVBzRnQ5WmN2cFRxR3k3Y2JpdEt1?=
 =?utf-8?B?RERVUXJGL1A1RkhDNmhaTy8rUFBLZisxcHkrTy9ycFNOM25hQWwyOWp5QzBZ?=
 =?utf-8?B?NXBiVHFQMHBVakFHcVRVaHVwYzNlTm1HUytNVWRUQjhlSGdpRjRtOGIrV2g4?=
 =?utf-8?B?ZHhXeFNkZkxTV3c0Z0pkRzNEaFJ6QnNUZ3FvcitTK3hnQmlyMTJicnYvcVdV?=
 =?utf-8?B?N2pvQ1ptd0JycEVkVHU4djl5eTFzNHhYWEtrYnAyVUdCb29Pd2lISmlEYlNP?=
 =?utf-8?B?NWdGYW5uWFVNbEE0Vk5qaXBhZFFsTVdYOXIxK0tDQytKZHE5NlgvZVE1RWlJ?=
 =?utf-8?B?SXE2dDRuNndEcDZUVEpjTGdQdUYyVGRmUUNudUE4TlRnTTRmT2xTU3U1MkVL?=
 =?utf-8?B?V3ZtOTVPaVA2MnpxempNNlpnSzc5bzQ0V0tuQTM0dTJ5QnRHTE8wQndRUnNV?=
 =?utf-8?B?NFVsQWJxbEJsbU5kM0xuYVB1Q3FmVVFyY3JZVzhybjRhVXd2QWVLcWUvRkdp?=
 =?utf-8?B?WUpqeEVqY0EwN1JGTnpBQTRNaWZsM0M1ZGxoQlR5Tlg4ZVlTajVzQWFrcnZs?=
 =?utf-8?B?ZDJseVl1L1FlQ2JhSElLQ3J2eTE2U2FVcnJkN0ZwNC9BSHdqWW4yUWRMUUhj?=
 =?utf-8?B?NTJoamZtUUllSTZOZWtRcEVlT2ZlZElVTDJQRFd4eU13c2JzSTZMWjNuTUlP?=
 =?utf-8?B?TW5PTXYvNDcwT29KN1krOElOczZKbmtvVytPYmFETVRDQ0ZBREdDOENKSWJV?=
 =?utf-8?B?Q2xZeTduZkVlMUR3NXl3VkFobkhvVTF2MjZteVNPRml5UU9TSUlXcnI1SUhz?=
 =?utf-8?B?YWFjTElHTFM4M1FYWFZxMTVWL3N6RG84MlJMQWxHV2lVbVZnNUQ3LzFjS1lI?=
 =?utf-8?B?eU0rSFhjbXhOblpjNVJqR1ZIOUU4a0phbzlLcnZCekwxMjZ5eHVnNTYxaDd0?=
 =?utf-8?B?WVp6WmRRbTJISnZwUmRwRy9HSVpvbFJucXdTZ002SkZZNEJCS1E1cHpydGZB?=
 =?utf-8?B?NVY4aThaSmpTcnFTRVVHeUppMTM3Y0kwSm5FWUZZeTZaSFhWcGRyUDBTRy9w?=
 =?utf-8?B?Lzk5ZGlzUTFReUdXc2FHNnRFZGo5ak5UTVJjb2x4VWJTR0pUMWt0eFp2YkJR?=
 =?utf-8?B?RTZPUXplQkMydUNOMHU2dGNqQ1Y2RE9PblAwYVRiVStrMjI2emIxNXY4bCt2?=
 =?utf-8?B?bGpndUY4SmRaMTZBYzltVEdCanU2SXJjVVlyY0x4QXI3UFhCYU5wdjRIT3JL?=
 =?utf-8?B?ZEN2L0lISzlhbkF6ZlBVZlFZd0xBRE03RHZPb1BIQ00vdWxuTk9ZZ2EvT3Br?=
 =?utf-8?B?ajA3SjNZemRCR1ptUWh5RzVmS3YyWE1QVDBqT1B1M2hYc1kwbUk3M0pXcHVE?=
 =?utf-8?B?T3d4b2xqdGRHU2Y4ZEh1eWoxSDg5dmUydWxJcjlzcU5xaCtCUDdmOFozdlV1?=
 =?utf-8?B?VFV5UGhIazN4b04yMEpab0VLR28zMkVFMGFmb0dlUzFxUCtyZWZmOUtwUzEv?=
 =?utf-8?B?dC9vTmlzNDQ4ZEJVazU0VWxpK3NJWEN2UFhlTnBOcWVoVmhvbjRUdTY4V1Vi?=
 =?utf-8?B?Qks4WWY4Tjk2MDF1bnlkbWZYVkFUOVdxWmk0NDhuNnZPUVdNTXIxa3YyeXRQ?=
 =?utf-8?B?RkFEaDdLUklDKzdGU044VUV2TmZxazB5R1V0ZDFHZDN3MnNwRjlEQ3liT0Q1?=
 =?utf-8?B?QVRVeWZCblBTUjltUmZxTDhHVUtwajNZOEhKVlpwRXllbGNVVlozUjFCZjB0?=
 =?utf-8?B?dnlVb1FWNzM2UE9aWWNkR0tydmZpQ0JsMVI3RUMxWFFCa2ttZ28wZGF0aDA4?=
 =?utf-8?B?c2hzdVF4WHNqZlZuR2lyejhIMzg4d0h5Zmc3ZEV0cnhtdUMzSHVsUnBwMGNu?=
 =?utf-8?B?OTgyRWN1cVJLNGJlTUpnczJXbUp3eG55WTNwY3NGOTVSTDhtYUhYMHVvTFlR?=
 =?utf-8?B?Y3U2UnZGL0plZ2xFaExsajZVaFZFTkxaY0RTY0V3YWxYU2xNRWJDZXgxbVli?=
 =?utf-8?B?dzVzcVhnL0lRQlhjUUdQcS83d1lCVzE4emFpUnZzOTlKWEtDWlZJYjdNOXpB?=
 =?utf-8?Q?dWr71Z2WXQ7QY7qA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05e872e9-38b6-43d8-f010-08decacff8ad
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 11:19:31.3022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZX2Acx5yTUosPQer+OtnceaFaDl55qbZ/y9IUb3HGzEWff9unQy2OCdjFy8jttLl+7uTvZDk8pbj33HjdfAMhc8g/IRT84PtCWeew/l8BM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB8232
X-purgate-ID: tlsNG-bad1c0/1781522373-4236CA53-BCF249B1/0/0
X-purgate-type: clean
X-purgate-size: 1184
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[10.42.69.9:received,2603:10b6:610:2b9::7:received];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72B54685AD5

On 09/06/2026 4:45 pm, Kevin Lampis wrote:
> Purgatory zeros these general purpose registers before jumping to the
> new kernel. When doing kexec on an EFI kernel there is no purgatory so
> we need to zero the registers here instead. This change shouldn't affect
> the functionality of legacy kexec.
>
> Signed-off-by: Kevin Lampis <klampis@citrix.com>

The subject wants to be "x86/kexec: Zero GPRs before entering new
kernel" or similar.

> diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
> index 6a2c839b83..be9e487f7a 100644
> --- a/xen/arch/x86/x86_64/kexec_reloc.S
> +++ b/xen/arch/x86/x86_64/kexec_reloc.S
> @@ -94,6 +108,13 @@ FUNC(kexec_reloc, PAGE_SIZE)
>          lea     compatibility_mode(%rip), %rax
>          push    $0x10
>          push    %rax
> +
> +        xor %edi, %edi
> +        xor %eax, %eax
> +        xor %ebx, %ebx
> +        xor %ecx, %ecx
> +        xor %edx, %edx
> +
>          lretq
>  END(kexec_reloc)
>  

This hunk is in the wrong place.  It wants to be lower down at the end
of compatibility_mode, where there's another /* Jump to the image entry
point */ comment.

~Andrew

