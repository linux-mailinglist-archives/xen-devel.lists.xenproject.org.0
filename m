Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9740748264
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 12:44:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559061.873758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzzQ-0000Mr-GN; Wed, 05 Jul 2023 10:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559061.873758; Wed, 05 Jul 2023 10:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzzQ-0000KV-DA; Wed, 05 Jul 2023 10:44:04 +0000
Received: by outflank-mailman (input) for mailman id 559061;
 Wed, 05 Jul 2023 10:44:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGzzO-0000F8-Qo
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 10:44:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2041.outbound.protection.outlook.com [40.107.7.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id daf375b7-1b20-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 12:44:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9669.eurprd04.prod.outlook.com (2603:10a6:10:316::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 10:43:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 10:43:29 +0000
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
X-Inumbo-ID: daf375b7-1b20-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7/R22Fz7oHm3IQFEiMO8gBzdrKBCSbd/+eiLnrCu1E9Pk2fvko+FX+Xn7WIi7z9WNf7/kr/0wly8DVZYJyUhRVHESia43D7bnqa9PK9/iDsGZMyx8NK35gPFmiofGd4UcHR8+ONFHxRqQBMVRH/IhdWtpcGKb3UNrNP2BlX+jkRqiut6trwy1OLuCzHh86Sq2G6aqdSpVQNH4rAfJdVzaVeW3U5JvqNlXzhbO6r01BkKRLbUb6oXRAsgRwoLqf7F/68PJ47j8jWeB0SVZ/oPhLifEf9ydr9hmo7//vYFyAUrBmX9Bhmj7rjjIbsFFaLLFHHBRUzzm/NyB0s37k4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kj6GmKg/KqA1sstnJgxozqSyYWM91LU7Gjl25Xzka4U=;
 b=WawDF8fAtwpe9QteSEPpV0FQJm60DIFfnF2HLiIfd86fxIEdWxxG3q6GeikXRbrv/ITHmXf20VqMY0Eu/1y9tao4GcefpftJJY3uqMeClqJCg7B1ecM4hZXT5206S7PCrk+Xx19/WkAHJiXGjGzJ5awV2t4p74X5yDlGGgKMcqwveLgfOhlDCiV2g/PUsvtMbLCRYGm4pTrnaDBsmIGqDQGFWJPkVjir1atD9yEoCzOVu+aRd0ZtVp27zJ2R+MR65IPaLZUPxG3J4ixSta54nCa8UXA/oZmxFEjxRcmWopIR7wo9hDvqp0pNjkjWKvjE5E9PTRa3NHDzM+PdLQsvCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kj6GmKg/KqA1sstnJgxozqSyYWM91LU7Gjl25Xzka4U=;
 b=YRVOvfvSG+U6Q1A5zBeP8GeDrkvwYHMIKZTmwlK8zZ0MJTkqXw3Iq64DFuFqZGIsftkX6eaMaej5/p9YpG9DWcdVVpcZYQbggcqJj9dwIN7b3tTT5VDQNQ9rFHL8fNjpT5eC8c6AbWGw6+zG3wlZWAC1yJgviRbsXwyiAJMnEGBYm7lpt5fa5ppa+4Edzd+mhdrv8xgtXPULpDSuCiZ4VlOMa9KpZ+rjIjtSe964oIx9vfxQJqXAISUk35WsBLlNXk3MMx5+StZEGqEVfZ/dQrWpZW5/OAkoB5apTtF1yHglOxAulQuS31t6ITuqTxUfoQZEjv8TjCW8YldLBZKHaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0dafce38-e572-3675-7f5f-a44a097abf09@suse.com>
Date: Wed, 5 Jul 2023 12:43:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 3/4] x86: Read MSR_ARCH_CAPS immediately after
 early_microcode_init()
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
 <20230629152656.12655-4-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230629152656.12655-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9669:EE_
X-MS-Office365-Filtering-Correlation-Id: e439d9c9-28c9-492f-ce0e-08db7d44ab6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Og/12uxU3Ktm7JOjiXPoIT0zwcG6d2VdHjTWMq46L4NqCYedTXN/wu7XBPD/OEB2OkqUqr71mJO8FlV5RwBck2LOH1ph3m1DwFaNBaqAbBUsP0NsXe+85j+KjnejctvDJtPkX+8DDpfxo4HSdprN++EWa8Fn8ls2CLBPZor9WjXyuhAxO6ZnTXMZAgBY2Iu+MjcNrl5HJOlDgWMijjbaMb1s9DCRXU0NLiEmiYzacKIygvbKD6q+FD/OpPLEcsNKO6gn+M8ykvGbA2yTuU7i3n4+2xvNVNdZHZqxVxtVr/SNj2Z7SamycssmULCbT7xWW9iJFh/cNNEWpL3be4Hurr9Rw/VYKi2M5UbWTMS8csFcFoMEFybgzywk3vmPsQGl9+SaRKDjAWuV+L+goFMVxPGkDHrvEM2zngFWvL8yJc/iC0g76tjzm74hsPpA0UHbVrpZz3lcQ+SSBR4UgfVMmd7KL2DEzyEXN7WdCoNyK+6tolY4zIVMswH8CG1HIHuNQWgEFiag4n+o6fHtsd5kPGU7GD2nfbchPRhjWnMqCGN7s4aVczyegjgYapynboUh48U4NnCzWKAuAP1JTONcH00l3oVAV9vsqAkIUXu0/c6/rvJGOWFuMFOQuWgeGy6Lg6zy38W84Ldkq55vkVOP9PSzx7JCed4Vr8B1TBJpjQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199021)(2906002)(41300700001)(5660300002)(8936002)(36756003)(8676002)(86362001)(31696002)(186003)(2616005)(478600001)(26005)(6512007)(6506007)(31686004)(53546011)(6486002)(316002)(4326008)(6916009)(66556008)(66476007)(66946007)(38100700002)(54906003)(83380400001)(14773001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlZoU3JjaXFEOHY3ZjlzMjJiS0UwWmtJY0hXMlBqNk1LTmRwOERObm56Q0JG?=
 =?utf-8?B?QmQyTUZVWk5HVlMzTEpFR3FOU3pxY1pDTERWbGdRajhYTm9LVzlBSWJJRERh?=
 =?utf-8?B?ZnhYck5CVEVuOGJsVVNsck9TMWhIcUVHdTFYT3ArdTlxMU5JSExOMTdqSFo3?=
 =?utf-8?B?ditJL0h4SlZKMHpmdVRqK3F6dDNGekFEQUgvMlZsbnFZMG13SVNyYUliaEIz?=
 =?utf-8?B?SmRPYm85aTJJZk9NZXhCakE0R1FhZjdINTlaRFhjQzhnNFdPVU9QNi9VN2Vs?=
 =?utf-8?B?c3BjZ2lodzdqeThVVEJkWDNNeXNRcURzWTY0S1RGWkM3VkNONnFndFVPelhT?=
 =?utf-8?B?clBuVUx1T3V6YlczMHFvNXJHSndqWlUrM0ZNelAxMEppUGh1V0gza1dPUG5t?=
 =?utf-8?B?S3ZaL0kwRk5BdW95YmlYS1h4VEhIdEdxT09nSk1LVDZ4VFloenkzZjVFV2pT?=
 =?utf-8?B?a29UcU5GSjh5MndDdXVLRFdFU1pKcWtkUlRaRU1VbWlNMW9GSGkrSFpQTFdD?=
 =?utf-8?B?TEwwQjFpTlJtY240VUtPT09kRktJSW5ZWng5SGVXWDBQUFJpeHFROVZSclpW?=
 =?utf-8?B?QmFnUUFJa2Uvc0NLWWp6QllVVjJheWRkM085b1RCVFQySHZNL0lPRFVaZFhT?=
 =?utf-8?B?d0JhWmFLT1NkeVYwa1NxclFBdWcvWk9XZGNQWi9FMHZmMUZLSTFXNXVWbld6?=
 =?utf-8?B?R2VZQXFBVkpBNlhXaklDSHhkQlZyRzlFazNSd29HL3AzL3dqVllKSEtER0o3?=
 =?utf-8?B?NHRBMGFwK0hDM1Z3b0FhSmhRR0I1OHpTZHBJK0l2SnBEYTA4eE12Q3RaaHlX?=
 =?utf-8?B?a3FKVXBEY1k1bENKTVVwWGpqYy8xZDYwQ1oxZHNyaW9HN25WVTgvcmcveVlt?=
 =?utf-8?B?U3NBOEVrMVJDWG41U3dvTlF2VGZKMjBoeGNQQWZvQ1o2RHhyRlVWZmJmUkdP?=
 =?utf-8?B?M1dJdUk0enVzdWFPTWZwam04ZnZJa1BHK2dRY3lJbE4yeGdFVC8xTGhDUlIy?=
 =?utf-8?B?MG9MamZKclFTUldvamRMRTgyaStVRFQrb053eGNmYTNOVDNLQ2tNV0ZoZ0xT?=
 =?utf-8?B?ZU1LdGZ5Z1lnbFV1NmRHTFQ3MmMrcGhGRjRFR3NJNS9lckt1ckEwZGUzUUt2?=
 =?utf-8?B?VkVjUFZSV1JQUit4MHVjNFBjY2lhOHNyZ0VrZTUxREVwZXh0N2xjdGJ1M2cy?=
 =?utf-8?B?WUcySHk2ZzBCeXYrLzlVQzlWaFp1cmVtU2FIaVdaNTVOeHc1MUoyNzEvS05z?=
 =?utf-8?B?dnloVzgzNWRGQUZ4VDlwQkJNOUFGdmlSeGJmNDcwU05MZCtSTzVCaC9rajda?=
 =?utf-8?B?S3R1d2Zra2R4ckY5TklxK1ovK0pQczVXNzFUQ1p1WFlzalRuaXBoTWZhNmdJ?=
 =?utf-8?B?T2FWQ3kyMWdxOFFNZ0tHUWxjZzAwNDBIN3dZTGYxcVBweDFlaWtpOGRPMFRU?=
 =?utf-8?B?Z1E3Q21VNy8wL0I4eGNjQW1ETi8vQUJ2bU1uclM2aG42Vk4xc3ZndzN3SUc5?=
 =?utf-8?B?SXFyRXUyanAwaFB3cWd0Wm1OcE1UbnB3ejFJc3NYa0FlUktjWk13L0JDNEtv?=
 =?utf-8?B?akdXamxTSEtXcjVMQlZ1Nk5PWXNrZVZMOWE1cDFBZkZSVTVVWWVldVVhMVlp?=
 =?utf-8?B?SW1oaTcyV3o3Z3N3bEhydVduR2NTZkQxUzd0MW1TUXFJWDVHVUY4NHZZa3da?=
 =?utf-8?B?VWtuaHRxLzhweUt4SmdZSktJMzlQZ2dqOXNxVm9HWmJqN09GaFlKcWMveGZG?=
 =?utf-8?B?RFhzblZ6a0JBMS9tY1Zob2J1SExIcXphYnNkVkpoVXh2RTk3S1l6MGVzNFRx?=
 =?utf-8?B?Vi9SMzlIZWVsczFqcjBLZW01b1VNbWFHSEszSU5VY3ZpNHZqQ0xyRDZsaDly?=
 =?utf-8?B?Y3lkQnY3c1lrRWkrOXBacDBZUEsxVVJ1c0grdTVBckdTa0xEZGlsZ1dldDMy?=
 =?utf-8?B?bGRPRGEvZnpIM0hXN2FnczBUUVFGR2lBRjRYc29xd0pLMGJ3QU1pWnZRZytu?=
 =?utf-8?B?ODl6TVFBdHpndFAxeVRDa1ArUlhjdm9OMENpYVVyZ3dnVjcrOFJ6SW5CMWJh?=
 =?utf-8?B?V0V5dzd1TytUckhucG9USllyV00wR2pmMGU1VUgzdkV4dnFVNFhWN2pNcGdZ?=
 =?utf-8?Q?bWurKvinDPdSkuAGl9xGaoY0t?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e439d9c9-28c9-492f-ce0e-08db7d44ab6c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 10:43:29.1275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFlW+LMu63/k+nZihU5TOP7n4VYpJFP1eYhyTm5SOi7Iwp81E8vWXNSeWwlJHXAOWWT17d0go21Ay4CZEi9p5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9669

On 29.06.2023 17:26, Alejandro Vallejo wrote:
> @@ -324,9 +324,10 @@ void __init early_cpu_init(void)
>  	case X86_VENDOR_SHANGHAI: this_cpu = &shanghai_cpu_dev; break;
>  	case X86_VENDOR_HYGON:    this_cpu = &hygon_cpu_dev;    break;
>  	default:
> -		printk(XENLOG_ERR
> -		       "Unrecognised or unsupported CPU vendor '%.12s'\n",
> -		       c->x86_vendor_id);
> +		if (verbose)
> +			printk(XENLOG_ERR
> +			       "Unrecognised or unsupported CPU vendor '%.12s'\n",
> +			       c->x86_vendor_id);

Just as a remark:

	if (!verbose)
		break;

would have been less of a delta and keeping all lines within the 80
chars limit.

> @@ -340,10 +341,11 @@ void __init early_cpu_init(void)
>  	c->x86_capability[FEATURESET_1d] = edx;
>  	c->x86_capability[FEATURESET_1c] = ecx;
>  
> -	printk(XENLOG_INFO
> -	       "CPU Vendor: %s, Family %u (%#x), Model %u (%#x), Stepping %u (raw %08x)\n",
> -	       x86_cpuid_vendor_to_str(c->x86_vendor), c->x86, c->x86,
> -	       c->x86_model, c->x86_model, c->x86_mask, eax);
> +	if (verbose)
> +		printk(XENLOG_INFO
> +		       "CPU Vendor: %s, Family %u (%#x), Model %u (%#x), Stepping %u (raw %08x)\n",
> +		       x86_cpuid_vendor_to_str(boot_cpu_data->x86_vendor), c->x86, c->x86,
> +		       c->x86_model, c->x86_model, c->x86_mask, eax);

Since rearrangement to limit line length isn't really possible here,
the last two lines need re-flowing to stay within limits.

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -886,5 +886,11 @@ int __init early_microcode_init(unsigned long *module_map,
>      if ( ucode_mod.mod_end || ucode_blob.size )
>          rc = early_microcode_update_cpu();
>  
> +    /*
> +     * MSR_ARCH_CAPS may have appeared after the microcode update. Reload
> +     * boot_cpu_data if so because they are needed in tsx_init().
> +     */
> +    early_cpu_init(false);

I think the comment would better talk of ARCH_CAPS as an example of what
may newly appear with a ucode update.

With at least the middle item taken care of (which I'd be happy to
do while committing)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

