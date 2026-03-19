Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLfeM3MqvGn4twIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:55:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407892CF31F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257438.1551839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Gdv-0007RK-DX; Thu, 19 Mar 2026 16:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257438.1551839; Thu, 19 Mar 2026 16:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Gdv-0007OG-Am; Thu, 19 Mar 2026 16:54:43 +0000
Received: by outflank-mailman (input) for mailman id 1257438;
 Thu, 19 Mar 2026 16:54:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAdu=BT=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w3Gdu-0007O5-97
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 16:54:42 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 525d9609-23b4-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 17:54:41 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL1PR03MB6166.namprd03.prod.outlook.com (2603:10b6:208:31e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 16:54:38 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 16:54:37 +0000
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
X-Inumbo-ID: 525d9609-23b4-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOvg710XFhca8baBaodCdaZg8JaWSG2fW5EwYzOHpAnIbWCxtoxg5CsXYqKUbAM4ycFkTCeHLwubIesjPLSm7x96u6h6Dyyz9bR84DE4J2oNRrtT/MSzeWERYOJqLoTzSDntzwT3HqFYQQd3FOVnVYXZ038b8ZTXff9Cfr9YtDGoLVxEP/pUSTjhOvAhWDoAqghgOYe24pX5HiKNpdUhfCxGA8zxTKzjrWVswFLjqRQB/yak+eoXY8CuiHhSrm3idVeW+xJoTnMtLVpQabOTNQRwgqN0+spHx5z3B0IlpZZIlbIleLXh1fmpiVgZGNrlJDnW1UajnagwZd8iU5FLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cg3nR+JfglP2T3BDwMVhrzl+wVrOb2M7z4MovozjnmI=;
 b=lUjezPcayjJ+OK+Ou6oapJQ8fZds8hiA5uUyiDL8MwmAtpdFkStglnFtlF8UZZHwgDS6jaFGjQPCYM/GDa3qALzdztQuH/Sjqp5oWKYH51/3uQnE3YUmvxuDW0YgTTOnQfjTiKJM+7qJ+1/SLCURjajaDiFeP5iLSIKgxpwgp5uux6EigzJsQSKcJ7WOfGkLs7gCxxFUefRecHXA5TUwBszmD5BwbiJpVEGM7xMRnNx2TyeSboHR5CweWwUfO6mp6XxM2fGjn+X05f08ZS3O/yzMRNRiLQSgh6oOeAL7bb+DbU/Dk9jCPa9WCCpV0w3mtC4W3a/+j+BBZxNLdKEf+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cg3nR+JfglP2T3BDwMVhrzl+wVrOb2M7z4MovozjnmI=;
 b=jJ+CUdZ1ojYRyT65FFCsvXFyJYLbP7WTVCSSfdLXGTk0vVvHMoE0oBmBFN/0GQj6dj1JEPsKA72VaCsn4lhVSToowzi4q2sGK0euE5v6AS6mU3DX1joHF/20KOSWC3o+hkC2LP7SSCZWT2PfCTDh8Q/USs7fXjmBEaigigOmPCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4a03299f-cf0e-44ba-ac35-f13392eb83fc@citrix.com>
Date: Thu, 19 Mar 2026 16:54:34 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/8] x86/vmx: Remove lazy FPU support
To: Jan Beulich <jbeulich@suse.com>
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-3-ross.lagerwall@citrix.com>
 <a67bbe7c-9c41-43e4-9d28-f5f221c96b95@citrix.com>
 <c646fd85-f526-435d-897f-c1ad72e6d234@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <c646fd85-f526-435d-897f-c1ad72e6d234@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0218.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL1PR03MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: c17eb58a-d37b-4c27-c11a-08de85d8348e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1+VQy7gnbV/XJyVNp4pQttba1KRiXeWfAwGkG0gYV6Bj0emh30BQyO+Q92ofvWpPkC5sJfjlLMwR0nbcdNakFDK2CzPeRx6R9de2a+gfa1avzHb70pxpbkfEIJyaTZ+ayWN17cGz97WYGVW5ymotQAM7aY4JcHsvciVA6CribRigLxgZ/1Air+gS5rB5ZAYFvKyEEDZgJfRaUgUZYNNJSK7XW8TczPfqwk430wdVhADPR1beFzTMgJ6+A8s/s8WaTdlML1hqDKXH95+mwlmDzTisPdqykIwpKimWzG7wxiVGLJ1SsXKVlHi1Cn7zoefC+4g4GCgsPKyT8UHddcHbO7ln6NhJTqYd30cxvSibRuys/qqPDJBQ2vBa6Z2tVPh5c2eqtA2yoZTYWU96ecFrFXyARSw2wylJhyj2DHD/LrfcI6Hcp0rAKs+vXfB5fnv7VeyoDTSUgxIyXO8x+4u6H2Ukr3m6GasgFkSqYf1JIRllCmlfnFX1tGKxd07vAHuMBfOLSIdom1gYkcddEiMLO0Qpf60l7q1Oj/bLA8lCaXSvcv/H7CVUoeTiKpgS3+sbjwk5rKPGNGMbrkPTphRY/DKNg9XmnxBZQ1Q5NgFn+BstUJYGCad3uvwz1kwiXT9tiDJmmqwJDWvLAWzNyBCA0oBTUXCY6XPiFoTrZY+D3UYVUN8wSj3bY9SpOvDO/x+30GlcMWmppVkcmUCdoanzjLB/cF10iAdt02am54G2r/k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1RrYmVucGN6WjVCZ1BxaFVmV1I4ZWl0Yi8wM25POXljUzFWb0RlTVF5R0dT?=
 =?utf-8?B?S1lUbXlmYmhqci8zcVo2VHBhcE1aK3Jya3BjV09ON0dmOEtUK09ZbGRBTStK?=
 =?utf-8?B?R0QvTHdJbUxuY0d4OEltaTc1L0czODFvM1V2UW9SNjNMZHB0clArY1ZMbmpM?=
 =?utf-8?B?R3Vkb2lKOWxmYnZHOFIrNDFRWEgyYjk5MUs5UzVvYlhrV2pFb3VGaFFyMnRG?=
 =?utf-8?B?SFFJTks3WTErVHpqL3RCZlhJS05jekZiSlducXNqREpKZkFOWUxCcGp3eHM0?=
 =?utf-8?B?NDdCWWZJWG5iMnVQMnlUQys2czlGLy9od09FN05ZVU1XKy9ETHlwenhBeWJI?=
 =?utf-8?B?UUQ1QjUrT1JQeWs0czJETmprSHBiNGJVM0VhVDJ6bFBrY1RyNy9zMzgwaHg1?=
 =?utf-8?B?aDNtZmd6OGZvTWM5VG42WVNTckJxRUVRMWJCalBaK0xzb3Erc09qNWo2NzZh?=
 =?utf-8?B?NStFKzRKd1pZZWpPK2tXdXZ3TUhWK2d2YTc0MEFFam5OMFBKcnhoc3RXbTh0?=
 =?utf-8?B?UG1COHl1UkQ3Z3hTTndsWDdrMDhBYW5BcTJtc3B5bGRUbG15WVdjbVM2SEwv?=
 =?utf-8?B?LzF4SEpEUTVjYXVIUVJWR3d0TDNPS2tscWhuMkJjK0t0Sm1UVGNRRDhOazJ3?=
 =?utf-8?B?bis2Z3liRE5WVkg2S1dFeWJGcmNnc21Ja1VaeVZkRldWVnVISkxvY1hBY3Yr?=
 =?utf-8?B?US9FQ2s1Um1QUEhtdDZKa0ZRaFlHWERCNTdjcmFJZnBpL0JBdTdYaW9acTR1?=
 =?utf-8?B?ZmdGcVNrR244R3h2ckVMV0d6MitHd0NFOERqaldkYjdFNDU1disyOEpGSi9U?=
 =?utf-8?B?KzVhQ0ZYUzdvM0xTSW5TZXI0dlhNd3NTNGRic3ByUm9aNVFsZXlnQlZ2MVpU?=
 =?utf-8?B?UmE1VGNjWHJ6ejhxL2oyNHdmL3dRU2NwRXpDdm81VjVSV0xwZlBoRjNnRjg3?=
 =?utf-8?B?TnZaT3NyWkVtWEt0a1didE5jdHdGSVBPV1pWV3hBQU9lNytoQzdqWTJoRmky?=
 =?utf-8?B?ZS9maHNMcks1cjFjd2dWTUlvR3Y1MFlpQ0ZSamdDNEVCazRSNjBIdnpqdGhG?=
 =?utf-8?B?QVJsbWFSd25ISzhTQ1lUVnZkQ1ppYlZpTjViMjVsT2R4ZXBJWVkyeUNUUy9Z?=
 =?utf-8?B?SWpjYkZzREpTKzdsQW52b091MUtIRENDY2xTcmNKUEUwWWc4aDd0ZjlZQ2pv?=
 =?utf-8?B?aFJyY1h1K2doaGN3ZXBtU3QxWnlON2tUdjArSE5RNHhlWDBCSmtTWTNKNFN6?=
 =?utf-8?B?WG02c1FCYVhVbkhPc1NYOEExM3RNM0dtelNTeHFyaEtkZHdIZ1dKaERNUjk3?=
 =?utf-8?B?YU41eURuWHFEaVV4TmFheFU3dkpjcy8yVFp4dkg0a0NJT3V6WmlzYVVJWHg4?=
 =?utf-8?B?NFVuNEJFUGI3UGUxclc0elBCK0pwL1pDY2JFc1dpQy85c3VUM2JybkV4bGZq?=
 =?utf-8?B?a05RKzBRampJcjBIcm9waStwUUVPS1YyaExLSUNLVStjUEhjZzZxaVIyZ1NT?=
 =?utf-8?B?YXljbjVSRkpZTEZSOERoNFhOc3pveXJKaDVYMksxQzJGclZCcENXWjY3QmZZ?=
 =?utf-8?B?RWt0WE1tVkZQVWNacno4dFdlQjFIL0VtejlvTCtFdlBDc3REbFBCZVpvdXht?=
 =?utf-8?B?aXg1N3hMR2dFWVc1UGk1SEViY1RjZUd3MmFYOEdqOFh3MS91em9yMXVFZkZu?=
 =?utf-8?B?UzQ2T09PUXF4M25EclVnanB0VjcwS1lSdk14UDNoeUkzWGFpWWRuM0MvaHVP?=
 =?utf-8?B?YTZ0SFRkbXk1YnNUbjhJY2gzTlRpeU5OQ2RzVWFISDJRbUNkQkUyMDJwbHRN?=
 =?utf-8?B?QmNBWm5ZNGJNWVVuV1REMytXb0hUeVFMUnU3WTlOd0RIWTNaYkFQWGRKWEFM?=
 =?utf-8?B?SDdqRStLQVZQTkVHZGY3YnZkVE5uT21RdXg1VS9LOVFQQjg0UENSRTJXeGs0?=
 =?utf-8?B?STdrMDZxY3ExMm1SaXVJdEJHb2xrWmFPWmZWZ1lIRVp4MjJ5QWJlZ3JJS2NX?=
 =?utf-8?B?TnNDQll2UEYrUHkvQTQ1bWUrZFh6VmFiUzlBRDhMV2laVXZIQ0tGNVdJb2p1?=
 =?utf-8?B?aGJXN2swSnhzWW5YR1k4NnFVRnorY013dm82Q3JUVDl1Wit5M3oyUmNscm1p?=
 =?utf-8?B?N1J3ZjYzblNKaUF0Rk4vWGFPZkozd3dCUTZlWkhVN2l3RlhmT2tkckNwaHVE?=
 =?utf-8?B?aEZkdFlja2M0d1RGKzdFWlJCSUFXZE9VM3Zqd1ZRUmJabVlQc081cmdUTXNj?=
 =?utf-8?B?VGo4Q3hrM3pLdDJ6WDZwd0xWOStCbFg1RWh5b3huNVYrOUdQWVR5RUM1SG0r?=
 =?utf-8?B?SHMzVnpqNHBjYjE5OVNXd3p0d2xtRS9sdkNWd2Y3c0pETGpzZk0rdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17eb58a-d37b-4c27-c11a-08de85d8348e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 16:54:37.5165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSC6na49TP+suQLUY6+y1Wxn3ACufhYWeQ7eVXiicHwRNcFIFWC2fsUBwPdWNuQKAg9W2KmlyevfuRX5CIZinYO2aW0bDf1/u9Xnm4X8UJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6166
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,cr0.pe:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 407892CF31F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 4:43 pm, Jan Beulich wrote:
> On 19.03.2026 17:38, Andrew Cooper wrote:
>> On 19/03/2026 1:29 pm, Ross Lagerwall wrote:
>>> Remove lazy FPU support from the VMX code since fully_eager_fpu is now
>>> always true.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>>> ---
>>>  xen/arch/x86/hvm/vmx/vmcs.c             |  8 +--
>>>  xen/arch/x86/hvm/vmx/vmx.c              | 70 +------------------------
>>>  xen/arch/x86/hvm/vmx/vvmx.c             | 15 +-----
>>>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 -
>>>  4 files changed, 5 insertions(+), 90 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
>>> index c2e7f9aed39f..8e52ef4d497a 100644
>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>> @@ -1247,10 +1247,7 @@ static int construct_vmcs(struct vcpu *v)
>>>      __vmwrite(HOST_TR_SELECTOR, TSS_SELECTOR);
>>>  
>>>      /* Host control registers. */
>>> -    v->arch.hvm.vmx.host_cr0 = read_cr0() & ~X86_CR0_TS;
>>> -    if ( !v->arch.fully_eager_fpu )
>>> -        v->arch.hvm.vmx.host_cr0 |= X86_CR0_TS;
>>> -    __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
>>> +    __vmwrite(HOST_CR0, read_cr0());
>> (Not for this patch) but I'm pretty sure there's room to optimise this
>> further.
>>
>> CR0 should be constant, both here and in SVM.  Reading the active cr0 is
>> an example of the anti-pattern we need to purge to make nested-virt work
>> better.
> In which case, is it a good idea to purge the host_cr0 field?

Oh hmm, I take back my R-by slightly.  We still need to initialise
v->arch.hvm.vmx.host_cr0 for this patch to be no functional change. 
Easy enough to fix, or fix on commit.

That said, I think we probably do want to purge host_cr0 eventually.

There are a few cases where host_cr0 != guest_cr0.  CPUs prior to
unrestricted_guest are the obvious case, where we can't run with CR0.PE
!= 1, but this should always be derivable from guest_cr0 and the
hardware capabilities.

~Andrew

