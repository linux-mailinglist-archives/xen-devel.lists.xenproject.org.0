Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 032DD704EC5
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 15:07:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535192.832837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyuOe-0006hw-Qk; Tue, 16 May 2023 13:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535192.832837; Tue, 16 May 2023 13:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyuOe-0006fC-Nj; Tue, 16 May 2023 13:07:20 +0000
Received: by outflank-mailman (input) for mailman id 535192;
 Tue, 16 May 2023 13:07:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pyuOd-0006f6-S9
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 13:07:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95caa63a-f3ea-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 15:07:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6780.eurprd04.prod.outlook.com (2603:10a6:10:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 13:06:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 13:06:49 +0000
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
X-Inumbo-ID: 95caa63a-f3ea-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMHF1LrVUr4wlC6XcxpQeH9S8wl8QL1Vvs1toMUFeIAIHirkopZDEA+/IVPCNOXKFP+JXJQmDJb0g+/rMlPu1KrtXp/GEEgnTmHSp2iGxY5M06kGIiWmcO/qbAu6T3i1Yh2NvnVpCZPztb3fZFVaw0cQtuZVT3ajbB58XzZZNcafAPWl+b2TkrFi3y7ua1ZvYmoRT8uV4Y4EH3TfNEgxWeMVGflxAYCAgl5jjOXXE9m+jx781GFk51RsRMr0pthwg+MDrJrdQu6oOW3ezC482SQxjNh+wMk0BcrD3C6ZUkAcA+JeifFEnTbe5o4obir40nCAtcPkFPgpKQL5l8rfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moJmLOgtDRlXESsAoDIoMyj790eDY0yQoiZ2exwgRXU=;
 b=GCUdGsCtrVaRTTNhZF0JzYocNSkKA74jyAMH2yxXlbZ1PwXaw/MrL2TJ3ba6pLUwOJBG2Nf6s4jMcG0PJbTV+1ka546w6k3zXgRjL7NoEakxSlsWzdBApbsLZD3ZbIVU38Ww1pRlAPxuF9q3WlREQe+0JUF8WLyGZz4v+4iPW2xkW/WqH8ze/FyKgZQgW654tBrO0OjxOLLr/Ldh3iVdRCWYwIUYgEkYXQHfwaLa43qY5W6DdrZ5hkleIjrvPcBOF/OZQ2i+R8t+2w39DQdrX72q3tWY8O+lYWFcJ0nTooXcxzh/ab1ItqbODtdmrYfIjhIYsewUYRLw24/moMUzhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moJmLOgtDRlXESsAoDIoMyj790eDY0yQoiZ2exwgRXU=;
 b=jPFtQjeuqqTZhYHc7q4ZJ3THDjOyTtYaoroIikbrR2lFXKgt7dtd4qcQdv39j0aKVrpPWBRgY7ePH83mtb2cpHc2MvcXx1EyYJTFYcO5LDzPkHEr+VdMv+W6WOwX0JhOh6lVwE+6DUiEPr3ynytkEtpj4mlkxlAnZHyMvUDGob+WkrxJYWQnVlE7PXpH0UCZAkTSBysRE8EmqByEvDB7xxzvtqx5XGmKBrC59vdctizbHsOvGT/NLQNvhG1VmKS1J0sw8eiihyYjfb7LTqhnwH1ldDjAeZbGQkCZzSbGIErNvlnb6lynvvxyROk+OvIp9PjeWJ1EMeYFvgR/vQuilQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a545a6c9-db48-9d91-c23b-59ea97def769@suse.com>
Date: Tue, 16 May 2023 15:06:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 6/6] x86/boot: Expose MSR_ARCH_CAPS data in guest max
 policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230515144259.1009245-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 12468101-0162-41f9-699f-08db560e68d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JJywxr/LxqLSaphpZYuX04PAljxN4BKsRdRku0Ti640HvUolygIgr1pqMsbLH+3EZf0Jf0LWeDdz2Smg4mA3NVN3A7M2roKtUtIH0VUDyWeKglGRJCHc/u/yrwymihlb7Qy56CZQM8t+5X68gOHCDq/9titPqxuGjtV+jG5865hn2vHdhGRpvOA3C5x6dhFmPiehrmBw1isjYIrLMmEGybCzLbuqig85qFl5JOUGUiAh47b+ErksVfKDLK0DJd0zXJac82n4bxqkQ41dHE6OG1+f6DTnvW1oI/+0eKa9sf0uoZn/RIxX1KADzy17J8iEgIE9iicIKzlZm054w9Mm0cal+Cqi7mff0qznlBXv/pdRApUSPxFDJePPdQn0AH3dFd4PswtdWeiKtxy4jLlqs1GefH2hEfiQyR23PFhOD7LSLGKhovhN3pQUqI22cy0K+0J3PoEIVBraM6eQW7BG9dpD1j2vMtJUFPGMxXrcQNDn31tQEUfv5JGRB+uV/odQ8Wtl3VymkCGJII9j4UclUqnq6rZHNq63SDAhi2bFyRSIvMgQdLvFCrcRyDbr0b6RaDK/tuhc9RSQIP3qxIYoObdttSKTgQcN0GKF5m+l5spj+8EYI52O4FwNMp6FRYqvvPBTyr8uo6gAtlhYftIsXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199021)(38100700002)(6512007)(26005)(186003)(2616005)(6506007)(83380400001)(53546011)(2906002)(8936002)(5660300002)(41300700001)(8676002)(36756003)(66946007)(478600001)(66556008)(31696002)(6486002)(66476007)(6916009)(316002)(54906003)(4326008)(86362001)(31686004)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUpjKzl4MXBhNVp1b0VLV1Vpa1FIcFE0eUdoKzBYTUhtVGZRbVRDc2FxSWR6?=
 =?utf-8?B?cXNReGJwdXpWV2FhNjRicnUrUy8yNWlKbUl6WXZ2NHF2WWlkTzAxR3FZWU9P?=
 =?utf-8?B?emR2clJOWWhLejNRZkNTNFprMGI4ODdWYWpMcUk4SVBWcktodVpEVDdSTWc3?=
 =?utf-8?B?YVNnRXpuN2tKSFBJSmhEcjZvbXhBSURhWVVhWXk5RzBTdWovd21lLzlnY3pT?=
 =?utf-8?B?NURFSWtObktYc1ZuSUlCbFZRZFZhclByMWpBeVFBcDY4aUZnVTRvY0xEMHhy?=
 =?utf-8?B?NXJyNDRDYytrUWJrUHA4QjE5MitrL1NjaFM1SGJWb1JiV3AvV2p3S3p5bEtS?=
 =?utf-8?B?blRWdmN3MjZ5akp3RUFYemp3Ui9ZZEJ4V1I1MnpqSExSdFdDWGNIR3hkK3ZG?=
 =?utf-8?B?YjN5M1FFK0NsQ3RuUllKZUNuYjdkUlg0UllaOXZsSGd4akUvNC9rbjExN04w?=
 =?utf-8?B?WTk3RkhiM05yL2luK2JQZzh4TG8zSTRpRmZUbjZjUXl4eW1sSjhPLy9YNzhq?=
 =?utf-8?B?SW4rODhRSEdma2xScXZhTi93TXBQazFiWEdvWmlDdjhWUFVOcXdaWS8ySVdw?=
 =?utf-8?B?K3crdnhRbTAzUDJybEwyK3NQZXpEV2Z6eDd0T0JYeFQ4Qlk4b1p0RWszQzN0?=
 =?utf-8?B?RDh0MkRoY2RkbmFsTGRPSzZ0cXE3aUVsdlVySDFQSTZ1RWtxVTFWbFR0cTZk?=
 =?utf-8?B?azN5U1htK3l1alZpNVlYbWtIWXdSWVFxS1RoNGppc0ZQS2Q0VnNJVmtYL1Nk?=
 =?utf-8?B?SkY2djVsbldkRFRnUGsxRHJiRUdzQXpDbklhZHF2R1hqVG5rZnNaMXlEV09Y?=
 =?utf-8?B?aVI0OVU3aDA2R2ZYcnR6U2Y3c253MUo4ME9RT25PWGhEM1pXWjh6S3NXaHdY?=
 =?utf-8?B?N0lvQ3BVYWlpZ1N2cWJ5MFYyaEsyY2c3c0FhcE9MY042NzJlaVp0MGgydHlH?=
 =?utf-8?B?U3lCMlhWOHZUYWlpMm1taVFFN213Z0NLZDlyMnNkQTZRV1N1THZtZXorZG5P?=
 =?utf-8?B?WldPUEdaUmptbmloRExRMkwrcWdRNEY0YnVpQjNib1FTWm00Njd4d05kemNX?=
 =?utf-8?B?SWJOdjZoL2p0Y3BZem9vT1NXbFVnazQwTHkvQk1FQUM3VkhCSm5KdTVRV2dF?=
 =?utf-8?B?bUsyVy9DNnNlM2FNeVhUSG1ZdU9XcTZmMDNpQUlsWGZOdEVJZnFPR0dEc0Za?=
 =?utf-8?B?ZGprUHRMQnFPY3ltSk9LMUJoaldSN2NZc2w1cGFxMWFTWmg0VkkybWtEWTJP?=
 =?utf-8?B?SjQ5LzlQQ0wzWXFaU0RZNGRnOTJmL0pYaFB4UHRGUDVIM21CQzdvc0g2TzBU?=
 =?utf-8?B?bDhjczFhWUd3SjZVZ0FUVE1BUnVtS0xMMXJwSXZFUU8rUkN3b1pDNnFwamZT?=
 =?utf-8?B?UG4xTTlUazBsR1R0dDFKSTNueXBkRHhnMzNIZVp4YjhvT0NEcExmWXFDZ3V1?=
 =?utf-8?B?T2kvWEUreTM3aWFmYXZtZ3BBZGFhZlpoRmY4TVk1RkkrYjJWaTlWMkw5eHNh?=
 =?utf-8?B?UVl0TjZ3cjR1MEJxNG5DZE1VdnN1aVQ3N01HY25raXYwSjdxM2FiTllEWVdC?=
 =?utf-8?B?cWJOMm1rSjJaSzFLbExPSHczd0FiYWhYRDY3dE1wcVRNaDJTSjBnei8yZGJu?=
 =?utf-8?B?VjlQb1RxellpTjRURnlteHBHL1c1N1JLaXdob2lFdHh4YkVFM2VSTkk5WVhE?=
 =?utf-8?B?T3hOcC81WEVnTkVJaTVuSXJIcGdJZUE1YXI5TmNwbGJ0NG15VlN6Z1kzUzFu?=
 =?utf-8?B?SGRFNGRqcHRkT0U2NktjZHpmVW1SQmFtZ3BUbGRRVm5BdTl2K2U5dGdsMC9N?=
 =?utf-8?B?dU1IakxWREtGMzM0TFJlUG8xb25lMlJSTGFRdmxXby9iVnVBR1lwKzZITjJl?=
 =?utf-8?B?Vmc5a293RGNHbUhyRks2eFBmRDJLeWg3dDZhZUxqcjg0cEtTNzhBOTVKQ1ZW?=
 =?utf-8?B?bnZUZ01Sb2JrRG1pS1N3ZHdGT3kwN1FIZVpvbFFCUUttU3ppU3FZbktJRGZ5?=
 =?utf-8?B?TmxvREUwbjFLSEw4N1R6U1hMMTZDRCt1bnREMVhGbVUzL1dMLzJsU2ZtQ1g2?=
 =?utf-8?B?aCtXeGdlOUF0Y0dhSFhtMEVkekxZQ01MRnhSR1REZEtUZ292WXFQWFFyQU1I?=
 =?utf-8?Q?LfiaplNy8AbRbrdswcNDHPOZJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12468101-0162-41f9-699f-08db560e68d8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 13:06:49.3360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5Uwm4pauqCwukdf/xkA1FgNgNMNKq7KYptqFnKN/6dBj7l4t/e3OFpGwZ+u5poJtSEwS1EHyF/BF4Zjx67r2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6780

On 15.05.2023 16:42, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -408,6 +408,25 @@ static void __init calculate_host_policy(void)
>      p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
>  }
>  
> +static void __init guest_common_max_feature_adjustments(uint32_t *fs)
> +{
> +    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
> +    {
> +        /*
> +         * MSR_ARCH_CAPS is just feature data, and we can offer it to guests
> +         * unconditionally, although limit it to Intel systems as it is highly
> +         * uarch-specific.
> +         *
> +         * In particular, the RSBA and RRSBA bits mean "you might migrate to a
> +         * system where RSB underflow uses alternative predictors (a.k.a
> +         * Retpoline not safe)", so these need to be visible to a guest in all
> +         * cases, even when it's only some other server in the pool which
> +         * suffers the identified behaviour.
> +         */
> +        __set_bit(X86_FEATURE_ARCH_CAPS, fs);
> +    }
> +}

The comment reads as if it wasn't applying to "max" only, but rather to
"default". Reading this I'm therefore now (and perhaps even more so in
the future, when coming across it) wondering whether it's misplaced, or
and hence whether the commented code is also misplaced and/or wrong.

Further is even just non-default exposure of all the various bits okay
to other than Dom0? IOW is there indeed no further adjustment necessary
to guest_rdmsr()?

> @@ -828,7 +845,10 @@ void __init init_dom0_cpuid_policy(struct domain *d)
>       * domain policy logic gains a better understanding of MSRs.
>       */
>      if ( is_hardware_domain(d) && cpu_has_arch_caps )
> +    {
>          p->feat.arch_caps = true;
> +        p->arch_caps.raw = host_cpu_policy.arch_caps.raw;
> +    }

Doesn't this expose all the bits, irrespective of their exposure
annotations in the public header? I.e. even more than just the two
bits that become 'A' in patch 4, but weren't ...

> @@ -858,20 +878,6 @@ void __init init_dom0_cpuid_policy(struct domain *d)
>          p->platform_info.cpuid_faulting = false;
>  
>      recalculate_cpuid_policy(d);
> -
> -    if ( is_hardware_domain(d) && cpu_has_arch_caps )
> -    {
> -        uint64_t val;
> -
> -        rdmsrl(MSR_ARCH_CAPABILITIES, val);
> -
> -        p->arch_caps.raw = val &
> -            (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
> -             ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO | ARCH_CAPS_IF_PSCHANGE_MC_NO |
> -             ARCH_CAPS_TAA_NO | ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO |
> -             ARCH_CAPS_PSDP_NO | ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA |
> -             ARCH_CAPS_BHI_NO | ARCH_CAPS_PBRSB_NO);
> -    }

... included here?

Jan

