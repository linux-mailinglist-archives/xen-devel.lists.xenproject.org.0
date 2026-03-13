Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGIrERpUs2l8VAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 01:02:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB7E27B63E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 01:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253142.1549480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0py3-0001Qc-E0; Fri, 13 Mar 2026 00:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253142.1549480; Fri, 13 Mar 2026 00:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0py3-0001P0-8E; Fri, 13 Mar 2026 00:01:27 +0000
Received: by outflank-mailman (input) for mailman id 1253142;
 Fri, 13 Mar 2026 00:01:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N2jY=BN=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w0py0-0001Os-Ti
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 00:01:25 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2bd3660-1e6f-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 01:01:19 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5689.namprd03.prod.outlook.com (2603:10b6:806:119::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 00:01:11 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9700.013; Fri, 13 Mar 2026
 00:01:14 +0000
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
X-Inumbo-ID: c2bd3660-1e6f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAundYrdPnch3CbjKMhGVBb6DoymJKFWvqYtNobuYsvtXsgcwBU+WscgprqvmeciYzFYZanr96oH9YgnV3cpAjNltP6t77Nq2jERQTcS/p7rfhzFIlUDPapclnixb84gxUw0kXrp66un0VPXfRfp+g3RfhHBI6eQBxV6xWYZSVbKXz1qDcs+F2Kt717gNre/SRsKLCJd+u3PQJdbRD31Ahkq4ulKahZ32jsUUf7vluq/aRU5vDGSoMX5cVIhfAnqyESFrqpE77/PdFS4MhyyFQrv1X0YiNRWaSQ7XXueI7QUq9igK2AD3EcIDjicsbeY5Tdl4n1+hatk1ZShKhQAgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWYMl+9F6/FUqWqvRpyhGOMiN+6iTBhV64lLKmpc+zk=;
 b=SeMittNCBlhvYUSjFuhYCNpjL4A8KwkmAe1O31nFOzGLzdETGJkiSf/gKgU71Eobr2fRHsdsqNLHTcvGnw5g//lWstzOrpHvr9ZZ2w5Wq2T+L85p3G20UiQBiDWA6I7yknO37bgjkRJz082mbUnnNcc1drSZA1EEEpDymzFbj8YUovYYYndTggXjXnPQCWUXMSnnS3ZNPKNMnMx3W1/zaIvq9OB/GGCRji8I9NkafHPSBK4otOnORE1665uRzfwrYiw57XYhspXrR/PBgoXPWDX2vTcVR0XU6ZPUR5QsfpT0bfdCmpKI/D9BzMGSMc0O8vOyaKIY1LHHcK1M8RBCZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWYMl+9F6/FUqWqvRpyhGOMiN+6iTBhV64lLKmpc+zk=;
 b=GwvYFycnC4ztIpTDlcWVdgxmP7bdhEYK3moDp7HpDEFLnjk5trjZvub4guyLsgdmkow25w/qfLhDX1p5S0vm8ANex3Bt2z07y4Wx+7ZeHPuILZ/AsdUiCqnEQ9q161wdTB0o7jR1UcKDuWAzpRWa48ccPciuh81Bsra8zfYZKaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <abbcce95-836f-4a06-a250-4480061ac3cf@citrix.com>
Date: Fri, 13 Mar 2026 00:01:11 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger.pau@citrix.com
Subject: Re: [PATCH v v2 1/7] x86: Remove x86 prefixed names from mcheck code
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
 <20260312204339.740403-2-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260312204339.740403-2-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0173.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36f::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5689:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f0c5898-8097-46de-37ef-08de8093a456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	c2r0ieh9aVtrnYKRP2fp+uxa7V4mL41k53gYxuD3UxSZ4r8WKzJUAWHqTvz9OJTtdF9ZZXSiuXSViahiiKGf4aci7nUQ+/1vziWRTJNjbRrH96hzipNjPY/uwKl5DiW2gW12BFIhC/KrEni8L/UR/vHtkAtDK5e8++sgRcV3V/rrkUXZbNBmcaV31h+YlpTcSYYyw80i36T9Jx/HfSLiJ/TZAESMqu9A/SkZ2+Hu5gHB/qTSTfYc5Q9sY8XPpUPgkQVMWOOuBwzjBhAi7caiNQWBLgYP6OCOjCa1RcfLHZ3E0IvxqETXSNIdQPA5zpmDVSHXgYwXDMpF7feY/Ee4S7JWrweXtCPQbJdmXq7m2JhUajQEF/VcclZJiCOW6E3fdHLL3D+O/aJjNpE67nuoU0woQ6i7yNXvdSW98GrQYcCJDioMuYRE1ss0IlQ45utCVLZnnVhDZD7GKxTK0SeVSGgUhM6QQLiQwiMqIVm2IwrhItNS8rpyToe6wbrxV0cD2WjN8P9ZKYyuGDnRLCVmFPeo4FS/HEIkgTXK5Ac/lMgvSLEJfsGvP34QbQdRMyErKon61/OQ2sJOpIdwG+AUy/QaWeIY1+4ghPGrBSN4q4x9NWcl4uO8Skch2pLyJa7So3ObcAI3KLnjGOK7eS4j2U66JAQKLgbocpCWlwjHbZS3ZOyA3eM8jedPRDG7zMUNsfrqgpEl59Lg01DoG/259hay6kFFzQhJrytkwNvFeeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDhYQlFaVkdzNDNRck8ySG1UYTJ3N0dKV0hieGNwYlFXV3BlenpGaEp3TENV?=
 =?utf-8?B?TjY0aFB0WjdDdnJ3QmFtdklzUFg2N3VlcEF0ZldZYTZSTElHcFc3MUNKK2lW?=
 =?utf-8?B?bTM3a243SUllTnRiV3EweXQyQzc3Y0dCUE1IbmhMR2RXTVJXd1N4c3BNOHpj?=
 =?utf-8?B?bDJKVGlxS2dvbTRlTmxWT3o3L1NUQmhScjNONlFrWC9FVHI2RE8xbllGOVdO?=
 =?utf-8?B?d1dFYmgxZHdWUjBuOVVFUmM2R1pQckp1Y29zZ3R0S1NmdnM5UmJoZXdEcWFx?=
 =?utf-8?B?V1E0MExFT05BcGF0RUx2NVR2ZitNVHhTenhrU0o3djlkK1lidnpjcll5M1A0?=
 =?utf-8?B?S0EzTXBwMGVJSE1PSG1sV0VlNkR0Qi9zeUxoS0dlNDNIZlVzSHZ2R3BaSTVO?=
 =?utf-8?B?dzBCTFVDbVRSTDJCZG9XNUoyVHA2Zi9nQ1BXa3JRcXFENSs5UktQY29PQ1BP?=
 =?utf-8?B?aXZjaVhpcUxYbXpNYVVLbDFpRFRpT0ltMVpMelFlNml6T0ZmQ2FjTVl3RXMw?=
 =?utf-8?B?Y3VCRC9FaHRpN2Y0VDlMN3Zzdm1OR05Fc0FHemFUMWJidTRIcHU5WndxSXVh?=
 =?utf-8?B?V0VtU2lTcjNYcUN0SXo3eWxZajlaU1dUTUg3akpaaFphTXlNZ1Fqbk8zOTBt?=
 =?utf-8?B?NkFFdlYwQzFiVXZ5TG94RkVLSUl2YUttTUY2VVVVdE1ybGF6L3czUWZwdk5w?=
 =?utf-8?B?VFFnbk5keStXek1jVDNTU2Y0OStaZGpsTitmaDhCZzZ1QktZalVtR29GeXA3?=
 =?utf-8?B?dFUxWWlCVTlxMzdoUjJoTisxOVpxazFjd01nUjNuQko1ZzB2TW5hRjRzWVZN?=
 =?utf-8?B?dFVQZUZsSGl4czBlRXpVVE1zcm9RWUJIc0dENUhOcFJ3bGdsaW16S2hhcDB4?=
 =?utf-8?B?b0dlb2FZMklHNFl6cC9sMnFLOHZRcE9SLzNmNXhHUVhOdTFjYU9ya3hpS3FS?=
 =?utf-8?B?ZWk1ZTBjaWxkL2JKZmx4UFBjNGVZNXA3K25JZVJDQ3hvdDVaUzVJQnB4bko0?=
 =?utf-8?B?cTB2Y3BDUXRSTVlMOVl1R1ZlWXozZDJscnpwZHFhYTh3dHlVTWE1SHNieVpi?=
 =?utf-8?B?MmlBa1REMnM2S01pTkRTSU9zMC9jeFc1RnBtQ3N6WUtDSnFGeXZUTjg5TTJx?=
 =?utf-8?B?UzIrMktjZmRGa1VGMk5UKzAxVlBqb1JEZEJEVFZseHI3SndiVmNsSk40OWRF?=
 =?utf-8?B?eXBzcnNWZXNwYmRVTCtoSExSWENIekVvVnpmbVJDV2lrcytkM25RbHJpR0Jy?=
 =?utf-8?B?TEplblBMY1JhTFFOYjdiaHlCdHViU2hUL0dTa2NXc00zZHZsazhna080anRZ?=
 =?utf-8?B?aHRzek1HUXA5Q1h1WlNMblVxeWlvdjZobWJIK2NNYTJzNE1LQUJ5TTJqTzFu?=
 =?utf-8?B?Vk5xemJoSWhrWWh4cWNsK1JWSE1QYkUrUkoxS3VScTdvOWhpVERQdCtndkZi?=
 =?utf-8?B?R3dzejI1OEl1RGE2LzhpbTBjKy9FZUNPSkxtR2xERDgxRnoyOE9VUlpVNU02?=
 =?utf-8?B?TjhGL29OK255QnlWUCt2SUxVbXREcis1a0VyU01GREZuNkllT0FqZnJqYVJY?=
 =?utf-8?B?SzY3RnQ0SGV1RVFlNDNUcEJsVTRabmU1Zk5ZNmFYUExkc3VqbXFHWFlXS2Ur?=
 =?utf-8?B?RUVzWFNFbmhubVVzYlJxamY0TGdhSlhFbUlMWE8zQlYrRUY4ZHdNTGJsY3hW?=
 =?utf-8?B?aWdtQnJhNW1sTGt3ZTYyVGVzQ1pHT0hva3BDQTlrMEp4ZVpjY2pJSVZEdFBT?=
 =?utf-8?B?WHA4WnN1dGNBSlNKSlhSTEhVMFZYS0hWS1FiK2dDdUtYOHNGOEY3L3IvTEYy?=
 =?utf-8?B?MnpCY01VSGl5aWIwdWtodHNCTUV0cjh5VjRCaVNQeG0ya0dTYW5YbU9DaVpt?=
 =?utf-8?B?WWdkbEhaVXF5YW5mWEZkZk52b1RvcmNOcjFGcFBIWk9BaVpaaUFhWFlCMDE2?=
 =?utf-8?B?UkVwaDNLTUtQby9kMFU2R0xjSU50TkFReCtXNFJ0a3I5SVI4ejEwM2wvQ2ox?=
 =?utf-8?B?MlY2amp5aTZHVTlJdzhZMXVSZE11enZqSVUvSGswb3loWUZkOWFzQ1FqNkZs?=
 =?utf-8?B?NUZzVkFEV3JmMzc3ckcwTlB4ZCtmYU9xZW1WMVd3dUVpOWhNeGluM3dubHVB?=
 =?utf-8?B?V2JtY09Ua3czZGxXTTVhQTJTZ1JMWU1tVVFaY2N1M2xWbUVPNVJtQTBtNTZK?=
 =?utf-8?B?N2RmK1RUeHBGdm9GclA4a2ZjUVNpS1QyYis0bGN0dTRITXErQ2hpZEtvdXRI?=
 =?utf-8?B?Z2xNREl6N21tazQyNnFHK1hhVjZWcFFEUXJUeStTVGtnRWtydTZ1SUdkVWZj?=
 =?utf-8?B?MkdXNTI0LzB5enRqVkxzWjVtbVJMU1N2TXhNZ2JzOVFOMWYxV1JsYjVUMks1?=
 =?utf-8?Q?OXQrEqv/ilMk9mAI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0c5898-8097-46de-37ef-08de8093a456
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 00:01:13.9808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtLzZXiIT4uTj4Uy84kdJgkksea4rxHHKZolZzUOzM57/lJYMp/BAShgeWHj+WFVO5czKGPbrqqBqpRuAcgBvDAbuGoGns92nJg/3U0ueKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5689
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9EB7E27B63E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 8:43 pm, Kevin Lampis wrote:
> diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
> index 839a0e5ba9..4d6b7d588e 100644
> --- a/xen/arch/x86/cpu/mcheck/mce_intel.c
> +++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
> @@ -711,10 +711,7 @@ static bool mce_is_broadcast(struct cpuinfo_x86 *c)
>       * DisplayFamily_DisplayModel encoding of 06H_EH and above,
>       * a MCA signal is broadcast to all logical processors in the system
>       */
> -    if ( c->x86_vendor == X86_VENDOR_INTEL && c->x86 == 6 &&
> -         c->x86_model >= 0xe )
> -        return true;
> -    return false;
> +    return c->vendor == X86_VENDOR_INTEL && c->vfm >= INTEL_CORE_YONAH;
>  }

This breaks P4.

It is not safe to write expressions like this, and I've already
explained why.

~Andrew

