Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO7XDYNivGmLxwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 21:54:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED4C2D2695
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 21:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257590.1551947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3KNO-0001sX-K0; Thu, 19 Mar 2026 20:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257590.1551947; Thu, 19 Mar 2026 20:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3KNO-0001q9-GE; Thu, 19 Mar 2026 20:53:54 +0000
Received: by outflank-mailman (input) for mailman id 1257590;
 Thu, 19 Mar 2026 20:53:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mAdu=BT=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w3KNN-0001q3-OQ
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 20:53:53 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b94d03bf-23d5-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 21:53:48 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ2PR03MB7109.namprd03.prod.outlook.com (2603:10b6:a03:4f6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 20:53:44 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 20:53:43 +0000
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
X-Inumbo-ID: b94d03bf-23d5-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOlXiErP16zsM1nFQPjeh61MnRG3YTwIdfNwmihD8MGgP2Et9TbkQ6CYLTXCzTT7GV5oQ8fyIxnStLUQ4KkmPrEHdOs6nGby7LN+sgK2F0cRZuavLa3UrH592AQrd1xIJ5aXkqL79bavwjp16vI4ee+7khOL7TQHYyILY5POsATuzC4jnL/jRnfPBAwDyg0x7kQGU+/ea7wweqFHQhukhT6N7tTiHo3HZogkX3xiECVnv96p5O/QwdXrrR272vvjnla/wFY8qrIEhvtOB2eLw/ia9+cipOtXdlSxFyx5P8yoMWFh8Cm5IvEBg0hHhGtCzf+IH9m3tP7jI2oud6s0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLbNAvip8YJzclx6/g/U2ztaBg6OlcU/mISGpANgMCw=;
 b=rgeQTDvnq28Ho8nvqtzjwRmLDtnvMDich85BjCPJyg45uLyprmWN7BM1T3lw15+ngftXv1yc6BGrmdeohh35I2DgUHFdzjVdCE20CvoeXTZOzs0uKS8RKETSdUSVkLzhAcFCBmg1S/8B91KWdUP9Xp0GErkXUxd4dQMExMazFIGHylaD2LYc83yAM2NAUxfLKUd9/AQKNDnFQNb55XbMPC5mEkMw5JWxsAPHWkUWxn6yGJCFlH4QHklPJ34o2G/jdn3q8LrqKxJGzMHLB4tnUONCkMwme+f+ujVNUlJ1OQAxSbxN1sHzDXj1G67o/ouHNtxiWB9qavz5TlXLyiTN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLbNAvip8YJzclx6/g/U2ztaBg6OlcU/mISGpANgMCw=;
 b=ok2d+N2nKX2Fr2iNGskcL7G5Tj+clOGHkKnD6DO+aUmR/lSCpaCBMqR1I9tEvXSxjRA+qxoRU8ofucOc9AMnQ54qPu3G7RYQTX/HOtzVWJFulioZjUIhHo5grm1stsqAimimPups9thXcoFtHWJ0hkerwHPF2jDeftThGzt0SOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6c4c0a97-cb3d-4924-86ed-98f3bd65d597@citrix.com>
Date: Thu, 19 Mar 2026 20:53:40 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v1 8/8] x86: Cleanup cr0.TS flag handling
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-9-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260319132924.1469809-9-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0464.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ2PR03MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc38d4e-7b4e-42b2-8d39-08de85f99b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	erUCIBnkP1Kki6p9F1fX0hnzhthMy2IZPTXpjFRDqWfvMcOF/a5wIrvR+tDIB2m0hlgefs7x+OkDIuLOgEPEE8tQx44OOYEsgEUqQjTNQ5gN8xkW0iXLUXCeGPpDBwCPqQtk5Pf0UdXMgdk3JQVhL8WMyyAOnsB6Ryq+h93RTFlNTmMn39t727aEP8Fp97qBdMD3s1NadF/5Ek88//+Ji5/T7sf7pciFwix/lGhDF0w6eqCJnmq86mx4NFJmQGJd6Cs2C6BCDhH9yKZ2eENAG76Ikv/nC58PFkrV5RTKJ/YESh7qG8SSuHXG7LvPOwn6wOShtLteXtUoEisRz0SxnJcHMx04vMgfB1BmI7rPI4onoEN3NVxZ2FqCheugN5hqWr3+t+yr9IBc1PPliixcJN8dwxs5ZbMcH1pOcwafm4yROuukL/DM7t62cknr+z0q4Nk7ksVNXXHhkI9GeBUFNx5ABySYBU5A92QuZ8eVn8XFsfoEq3d0lPNLCmE/+LvNX4a8/Ro75cYOTjIMfxb+wOOYavH6qTgLsSLCEr2uQs05xjDhyCqo3pJ7ttGk7PAS3kSn3de+lac81bY9sAaVFXxgLvlan+uE/+UmyQS6C3VoYznjX3jwDmbyekDluFDRFtvrkRrgs9SloFwApP0R98v6qyKZN752yKOJnrrwP2KF8W53+Slk52a92xI/KbkP2b8FGjDeNXOUvaMOImqA02g7wDRNMpPKbchuHuqzxkI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE1GOVFOTy9yalpBRlM2TFRtVDVoN1VmWjFvOEltM1FJR3dJQWtYMFhWWjlQ?=
 =?utf-8?B?NTRRQ0pxY1pQWTRoK1crcitlQjlJakgvakMxeDIyQVJtcE8xWkhJa3NCZ0Mr?=
 =?utf-8?B?M1FWRzZHbThBY2VlbHhpaCtqUWdWSlg5VnBTNzdXRmFoVkU4QzFKV0h0QXpo?=
 =?utf-8?B?Q2t5TVNJazlKSkZCMGhRTkgzZGMybFcxbzZCck41cDRuTnFKM1hicWp0WTFL?=
 =?utf-8?B?VEdrU3RBaHlsNW1TZnBlZDgzM0N0VXBsdGVZK0g3YUUwdGdUa0hZUEtzT005?=
 =?utf-8?B?aUMvaUNPOWJGZFdxN2ZMUitDZTFxSTlNWVVUNTRNUTN2WVlybjEzZGYzS05H?=
 =?utf-8?B?b1FxUE00ektvQUJWVnI2SXpNdkZuWkVSVXBTT01ib1JSUlpIVG5XNWRKTkxv?=
 =?utf-8?B?b0htRmV2Vmp3YjN6bnkrdVIvcDVsQ1p0M2g1SnRjWGlUek5KZk5zSzlTY1RH?=
 =?utf-8?B?eTV5Yzg1ZzAwVjVhQ1VzS1VzeW9aMHJxNk4zZHE5N3BwMnVvbGdId1BMTnB3?=
 =?utf-8?B?UkhkditVKzJHbUEwUXZaa3FMMmdtOFVvdy9jUW9ocVBkaFJSdVVJUGdBRUtq?=
 =?utf-8?B?ZERxUEoydDVuVldVdzAyUGZQcW41QmJkZWJtUXIrK2htS05kQjR1a2lxT0ZL?=
 =?utf-8?B?OWxldHZUVkdJM0wyVURPTURnM0FWRHlKOHA5ZENTTnhudVBwL1pyYXdpb05G?=
 =?utf-8?B?Y2dwQ1JxdHVuWHdRTDVVKzlyMmczWGlXM3hlMk1WWE9zazc5UGtoMFBIYUky?=
 =?utf-8?B?RnRhdUNCUDRiTHpBd2pTdVhidElReWhYYXVuanZENHV2bmp3MDhLWU9vWS9D?=
 =?utf-8?B?K2M3MEp6Nkh1Zmx3WDIyZWM3MWkvQ2pwSXVMMVBGdjRqSGVtNDAySlc3dExp?=
 =?utf-8?B?d00zb1A1N0hrbkpkWjVTRVlMUFEyM2tBOHpkNXU3ek5wWmVJY3gydlhQMnlL?=
 =?utf-8?B?aTM0QW9UajY5UkZIOU8waVdzTmRUMmRpN0NXQnNyZUlrcmVYOVRSTHlkQXVS?=
 =?utf-8?B?MU1hemtvcHNyamZ0c1AyZzRtVzdtSGxEZ2h2RE1hNDFOU3h4THRjeE90U0Jx?=
 =?utf-8?B?eWRONEpkN1hXU2g5bUgvYXZjaTU3bEVnWXJlTVYwdy92anVCU3M0ZCthTTNU?=
 =?utf-8?B?V1RwM21qY3E4SnBiWTU1N1ZuSmVNZUoxbDlmbjh1b3d1SmNSbmMrVVIzWG5r?=
 =?utf-8?B?NVp3ekp1MjdwVFRZcUYzcFNQMEJmRVpNVTZMZmxXVEhSY1dNVXJ1NjZVWkFn?=
 =?utf-8?B?TzEydEJVWURueDB5TkhpZ203L1RKbzd2cElFdGw5WkZPdWtkYXJYOU9IWTFI?=
 =?utf-8?B?WHhBVWJKdnRKMHNHYVR3Rm9URTdKUWtkV2JsYS8rS28yeWNGMVdSMkp0L1du?=
 =?utf-8?B?Rzd1MTdlQ3h2L2NiYnVIMkhxNnpldWpjeVVZK2lKRkhMQTZuZjJBQ3U2TGZ1?=
 =?utf-8?B?SlBhY0dsOVUzZE9BajF2clpHZmg1aGx6UG9Kay9mck9ZSG93RzdGMGVDT0Ji?=
 =?utf-8?B?YnR5Slg5eW9tS2lablhIWG1LSjFqNys0eXMwNkdyekIyVDRacjJabXdMUWNx?=
 =?utf-8?B?TWdybUNER1pyQlRXY2h0TkFQWms5UUV5Qng4RFY5TmpEL2I2N05PcUN5RE9C?=
 =?utf-8?B?RlFOdE9vT1JQVXFHL1YrTzJCN0M2ckVNanczSDVncklvOExiYVhPc3piRm1v?=
 =?utf-8?B?U0ZqYkEyVGFxaDJvYmUwd0VWaE12T1dqOHlkSVE0a1FCWnlzcnNvS2tYZUtv?=
 =?utf-8?B?Mnp0MCtPS25LY0lkc2Y0ZnVMVG0rKzBTNDNLSlRDdVJGN2NVSGNCdFMvNEpZ?=
 =?utf-8?B?NEdGN012Ti9wd2VuSjR0dVd3c2dNem91bHRwckc2VDU2OG5FckdwL3J3WFcv?=
 =?utf-8?B?TGRKcHdqcWVSUnNpa1dvK0trRHZCeWZGWktMbm9yZDZkZWdlb2p0ODFBSnBu?=
 =?utf-8?B?NzQySVR2N3VxTFZ3amV0UzU4OXlXdEs4TnNleU9PZVJmbHFjWG5LNzNsN0Rj?=
 =?utf-8?B?Qmcwc1kxalJvVkpWNWJDNm96QXA2MVdDUExLYVpqeEZ4M0JZVXFxTjg5a2lo?=
 =?utf-8?B?Yng2ZDl4anJ0V2FwcWNaSjZGM1NJMHhHcWtJRmhOdzUvdE9ZMFZzd05WTXdh?=
 =?utf-8?B?T2wvYU5HVFd5Zm9rTWVnMGJ5OFNQU1hOSGNKUkw3Zk0rczFteFdZUllaemxx?=
 =?utf-8?B?aW1lSmVSazRvVTVma1JBcDZwTjl5R0M3ekFWWkJzbGJtT3k4U2s2YlNWZ2d3?=
 =?utf-8?B?bU5BMGFyVnBPMXNzUXBGMi9qTll5cEdIS3FOODdrTTVPTkVNVDN5NzdPckk0?=
 =?utf-8?B?dURJM0Z6djZRSzVGRUhHQWFQL0Q1eE43S3ovbHUvVUN0Y0IvajdCUVpNVHdw?=
 =?utf-8?Q?oBXBxuBa9OF7lNIw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc38d4e-7b4e-42b2-8d39-08de85f99b45
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 20:53:43.3195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqAcExg0Ukd5sUVtDTp9w66OdE3UlYjqNMjAqmW8PWrCMoeOcZDsixcvSrTVLvkdr28wi4v1Jx9HMF0hqubgONEz6d1UahKVtdjLWr+W/yM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7109
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
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9ED4C2D2695
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 1:29 pm, Ross Lagerwall wrote:
> diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
> index 9acaaf4673df..336bc83b6e13 100644
> --- a/xen/arch/x86/i387.c
> +++ b/xen/arch/x86/i387.c
> @@ -193,31 +190,18 @@ void vcpu_restore_fpu(struct vcpu *v)
>   * On each context switch, save the necessary FPU info of VCPU being switch 
>   * out. It dispatches saving operation based on CPU's capability.
>   */
> -static bool _vcpu_save_fpu(struct vcpu *v)
> +void vcpu_save_fpu(struct vcpu *v)
>  {
>      ASSERT(!is_idle_vcpu(v));
>  
>      /* This can happen, if a paravirtualised guest OS has set its CR0.TS. */
> -    clts();
> +    if ( is_pv_vcpu(v) )
> +        clts();
>  

It's quite likely that this would be quicker to just leave as unconditional.

is_pv_vcpu() has evaluate_nospec() in it, so forces LFENCEs, and CLTS
has a fast nop path even in very early implementations.

~Andrew

