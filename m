Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 603E9736857
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 11:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551499.861072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBY0z-0005Jc-8B; Tue, 20 Jun 2023 09:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551499.861072; Tue, 20 Jun 2023 09:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBY0z-0005Gg-5G; Tue, 20 Jun 2023 09:51:09 +0000
Received: by outflank-mailman (input) for mailman id 551499;
 Tue, 20 Jun 2023 09:51:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBY0x-0005GS-Q1
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 09:51:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f93094f2-0f4f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 11:51:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6774.eurprd04.prod.outlook.com (2603:10a6:20b:104::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 09:50:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 09:51:01 +0000
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
X-Inumbo-ID: f93094f2-0f4f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A27BZXoeefTfWNc8SUj/gYUvmomL3EycqfDHK94/6WhStlspQtvfaRhTHRVx5IyTreoz6e+ehAGOtDGMbNj+ATWdW9KZHWiO5A9r5NPsTF/FqVKiZCp/l4/HuESAP5o4leM3pOGP2r4m0fhVwMwo7EApQQZf5l1mPfNWao1LVcSDqO+qoOL5jMCP1GbZu+xBKKJOiYVkTmxMfRTAP2f64wtlZc1+7SMiT+NwMxuFy7V7FoUPJpMpBlNkDUblrfggYu5qDCV0uX7VtSyVluufxWrFNYO/x7ZL8F8DudVOXt5TJUhCIYLavKGwT6XlJtw8/tWrZvKik2oucI6RbI+VBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIpf7vE+s7i9E/SCnbKo15QFKuPqmkfc3RMIr7eEF54=;
 b=jOZG4OJbwNqG58kE9BC2iS2+/1BDY7mEAZhqiQe5ViQwZ9W2QB6V2SnctKATjS+gDb/IwTK+xqJIJeLLIErPzxaJsVLdSPM7uSWVcnMSxLGinmpVz3+5HL1hXqgI85T9ZJMDocyBRf/ei3vYLBVoRvaD9uGo/2XW6q9ZlR5XtXoFBJ8e6O6K85Xln1oAssXTKDUtPedLThdUrgm7AAhp6k46OxO6RlmGlOhyNaLLP+j3A6pOdUdTBoFj2r6l8dVg0ilMcUJxytlio6xXJY1fEKnM/meMY+2f593hBwYK/nbtpzOVKFujFqAHw7SihqjbdULPy3oGahbTI2Ttu7IdGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIpf7vE+s7i9E/SCnbKo15QFKuPqmkfc3RMIr7eEF54=;
 b=afnxJGSUR6pYfmfLrFf3pMQvR7oIzGUMPgttXhLpS6qkJ5s5RnENNio/T7JoKrNlldsSwb0mkWZTnQ72uMKH/1qHgGpf/svQPSPh/e4/StD7j1kpdVWcjFH87FzTQiD/j/eC1yrauxxqJscprx+qDpKlFsM6KWrXLigmcvVS45htRrgU31flmIHUo10VnYdmdaHVdKIM3b6QVNOVwkyECCo6WYnVGrM7B2EKfDEZfTSd7MyhHA3ddLRI/AsBsOxJIUcSOmmNKo7b1PSxyhelqwdYSkfBcCjXrIO7EZxao0ZGYpkBVnvvhwon+dHXokEi7PQHGuGy2vqqSQJqbqQxTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <37caa77c-f3ee-3bee-951e-cc0ea417f539@suse.com>
Date: Tue, 20 Jun 2023 11:51:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 5/5] x86/microcode: Disable microcode update handler if
 DIS_MCU_UPDATE is set
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
 <20230615154834.959-6-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230615154834.959-6-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc13a48-4adb-4243-c234-08db7173db43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CDT6nWS0xUk5va9S1VWl9JjCz3lHRg3PD8ecU0Seh20afaEVS08Th73jjzTqC5rBID2bCgPxrB65u0vJ494aZ8+GwiWepXrPfEQvQa7ZCY8MyIc+4tuLni1SZ8GBqHW7GaEOqr4EolXjD5aO7wFerdJHOboKid5N0UMw5P/fJb3sAto6c9BjieP2+Sy4JhfH/lPTQdEcHScjbiCBBKkchjZzAUQx3qSdQ1R4PjFZJhDPm22qFOw75iuAVMGH7DOn/pAFRF4rC1aJC+JJrREVdft2SoQVCOKdJ7v7FcUM0D0TK+r6hANPH+X4W8sgslr2cZHPjkWCmaVvWou0pJo+FhhdkT1f4+J15pslHDLHxOL4/Ihyr9UVi9OWSDZLJ79XpzZCdTe4VBAynyajkzbvcUbnmglQi8WlNUUH/7eHeHSLoSUrhBdWuN/aFybzl5CAl7UlfpsApIA67nOAqDttkMnWyE+H/SlZcD6x3JQ43IKC5fW5Jj4uSsWxr7NwENzS00bqGQOfUUxD5RQ/7Td2ElUyk/vPKC//iEnft0AqF4nRDPYdQUFKojkH5zallujH9zxPFIRIDE6Sz7veWSj+9SrCL4mbeuUS1qao7JYs8mqHXcivWKyYUQxpnNTjCdEgBsbWBriTjl04//GP7Zm6Sg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199021)(6486002)(478600001)(54906003)(83380400001)(53546011)(2616005)(6506007)(6512007)(26005)(186003)(2906002)(15650500001)(5660300002)(36756003)(38100700002)(66946007)(31696002)(4326008)(316002)(8936002)(8676002)(41300700001)(86362001)(66476007)(6916009)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M25tZTdqdTl2WW0rTDRxV3JwVTF3N1hKb0xEQlMzN3NWNTZpWkFUNEVMM1RY?=
 =?utf-8?B?MlpMR2lnR1JOemFJejl6SHZFTzJuREY5Y3lHZk9UbmJlZTRvdUhjaHltTXJR?=
 =?utf-8?B?ZHVDM1U4YW9YbUdyVnhabmJta2crcGdTbDJHZUdtZGkvbDNtNFN2Y1E1YytP?=
 =?utf-8?B?K1MwK2tvaE1VeXJjaG90bWJQQzNNUmthMU8wWVdsT3NDa2M2TDRXTFNzS1dj?=
 =?utf-8?B?RXl6aGplcVlOR05QdXNpRjN5ZDUzYlBsU0ZUYW5LY0ZTZDdETnU4QkNaalhx?=
 =?utf-8?B?QXFJOEp3SmFOUEtadWtUUGRtNk0zV29yS09iMUpTVEIzbllhcVoyWlNuRERB?=
 =?utf-8?B?Rk1DTkR0WWZIUVN6T3dIdCt0WlZWVDZYeUorMWdDNjcvOVMzMnpLK3B4Z3Bh?=
 =?utf-8?B?TFFBMFJieVNFdUpDOEh6MS9IN3VRWHp3TVR5S0wvNGpKbFZVdGxHVmd4emZN?=
 =?utf-8?B?RW9ycGdpb2grNUVwSjNwbFVHaG5BMlphVC8rOFdkTVdSQ0pCSmc1ZUliTlVn?=
 =?utf-8?B?alRXem4vOXprQ0RwNGdnUkpRUE41NlNDaDA0cERNdE9ubENEYm9qQjBqbnJF?=
 =?utf-8?B?WU9MZG1rK0xwSmhIdkxaSlhEUUdjeHZlaFRKTUdXUmpOSzZCSHlIMHhHemR3?=
 =?utf-8?B?dDNtZzdmZjZwODE0d3lYZlEreFc5UjVjWjFXMWZZZXF1N0NUM3VkVThYemI5?=
 =?utf-8?B?TDl2eG9CNjBpdlVpMnBzYmVWb2VuN0FBVEQwN1VJV1dRZmh0cTJqQkI5bzdV?=
 =?utf-8?B?K0dPa2hmUU90aSsrajF2M0Z3ajFCV3AxVnMvRFdYS2dXblpoVHhNTlJ0QzNC?=
 =?utf-8?B?NVRnRE5rYkZxeDFDdGU2TUtoK0pVNytOOHgvRjhvRU5jaFN4MmpJUUt1ZmNy?=
 =?utf-8?B?U3JvTWdSdzB4UTRxRjJJeFFYbFIxT0FwOU5oTG5lK1FTd2NJVTBWQUZnMS80?=
 =?utf-8?B?ZzlXeWQxN1F4MVlVdDZqTnlMUXRCZVhNZ2lHdDByeFZtUHY3UlVGa053OEZO?=
 =?utf-8?B?VEtCWVJzS0VZSDd3LzFzL2J6aFRRbTRkUFNKNThCSFREa1Fxamc5Y1EydmZM?=
 =?utf-8?B?NE96SXdkV0d1T1dhOGUwWFVMM1NYbWYrOUFFcUhpbFhtUGNDQm5meFk1QlZx?=
 =?utf-8?B?WFZ2Z0pZT2VlR2h5K0JaZlZtQzJDd0VoaXNFdUJvazJVSGRudzh6ai8vQmRp?=
 =?utf-8?B?cTdzY3VLZ0tRTEtjMnp0ZmZWNmRPOEFaN0h6RkVUcUVJbmFUUmRCelFHeXl4?=
 =?utf-8?B?eTJmd3ZhckhYVEYzYjZIQzhRNlpEY0N2bStMK2Z0Uk0xZGFwWkxqN2xLZWNv?=
 =?utf-8?B?SXBmSVhGSmMxa1g3QVNTc1NzZU9ISkFlSnk4WmF5Y3VPUjBvTnZzblJ4YnMy?=
 =?utf-8?B?VHY0ajdTUzYyQlpkYW5iVUFqakRkTWIvQkVrNUpJbGRycXFnbUxjcitUY0ZR?=
 =?utf-8?B?K3loNDI1WmNkMmc5MmxNYThHd1QrQmhMMDVaZHJoMVJZU01YbkQ4eS9Ka2ht?=
 =?utf-8?B?MmtRMEY2ME9QcFl4ZlQvazdNeXJIK1p6UVBaUUwydHdDTkN4TVJQb0ZjcnBv?=
 =?utf-8?B?U3pSWEJsVVl4NkZwM2ZmMm1MeFFscXpZWFpLUHIzRkh1bEpwYmNGU0htQ3lw?=
 =?utf-8?B?OVZPV2tTZ3hEREdmaWJMNTJxMkdJVENiMFBKSlZNMVZlQjVHRllTdFRPcVln?=
 =?utf-8?B?bi9VMThwcUJvLzZQeXVhUUxZRFlTMXhzbWtUYVNUTE1ocjlLWDFzU24rY2N2?=
 =?utf-8?B?emxvR1VFUHVuYi9TZm5XaG5HV3UvSjNGVFMrMko3QVlONU4yYzJkdCtQeWoz?=
 =?utf-8?B?V3YzMFpvQUordnJwVzhteWRDTTc3Ris3Y1YyYzlmZzFzUzRQMW1rN1ZpZUZ4?=
 =?utf-8?B?MW9ldVBMOVFuUk5jOTIzZnZ1N0RSQ01hd0N0S2ptUW54bGV2VjJuZHZsY2FP?=
 =?utf-8?B?SHU0Z245Y1dyOE1SNTBhTHJ4bW0zZ3BkVU5vRm1wQlZQOC9GZWtwWlZ6L1ph?=
 =?utf-8?B?ZnY5SmhjUEtUbmhJU0lJZFMraTk5UHBoVW5PR0cvczl5MGJJYUxma3ZSVitC?=
 =?utf-8?B?UUxIRXBRMmhyaTdESzlVZXh0R1FmUm84L1BRa1lWR1RwV2l6emVQYzhicGtR?=
 =?utf-8?Q?yWs/7fy4lPnqM5q/4F+RibEmd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc13a48-4adb-4243-c234-08db7173db43
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 09:51:01.9255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b69f0a9GSKA2dG6IDFa2RR4DzVrwXImrtyZ8lEmg2PNBw1C0mc3cjwEbWpHyEMgTIU/ZKERW/JT7qa8fIptGDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6774

On 15.06.2023 17:48, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -352,6 +352,11 @@ void __init early_cpu_init(void)
>  			    &c->x86_capability[FEATURESET_7c0],
>  			    &c->x86_capability[FEATURESET_7d0]);
>  
> +		if (test_bit(X86_FEATURE_ARCH_CAPS, c->x86_capability))
> +			rdmsr(MSR_ARCH_CAPABILITIES,
> +			      c->x86_capability[FEATURESET_m10Al],
> +			      c->x86_capability[FEATURESET_m10Ah]);

Is this still going to be needed if early_microcode_init() uniformly
does this, for things to be correct for tsx_init() (as pointed out
in the other patch)?

> --- a/xen/arch/x86/cpu/microcode/intel.c
> +++ b/xen/arch/x86/cpu/microcode/intel.c
> @@ -387,8 +387,22 @@ static struct microcode_patch *cf_check cpu_request_microcode(
>  
>  void __init intel_get_ucode_ops(struct microcode_ops *ops)
>  {
> +    uint64_t mcu_ctrl;
> +
>      ops->cpu_request_microcode = cpu_request_microcode;
>      ops->collect_cpu_info      = collect_cpu_info;
>      ops->apply_microcode       = apply_microcode;
>      ops->compare_patch         = compare_patch;
> +
> +    if ( cpu_has_mcu_ctrl )
> +    {
> +        rdmsrl(MSR_MCU_CONTROL, mcu_ctrl);
> +        /*
> +         * If DIS_MCU_LOAD is set applying microcode updates won't work. We
> +         * can still query the current version and things like that, so
> +         * we'll leave the other handlers in place.
> +         */
> +        if ( mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD )
> +            ops->apply_microcode = NULL;
> +    }

While this won't address Andrew's request (afaict), but only the
cf_clobber requirement, I think you want to drop removing of the struct
instances from patch 2, return pointers from the new per-vendor
functions, and simply introduce another static instance of struct
microcode_ops here, with the one hook simply left unset. This lives in
init data, so the size increase is of no major concern.

Jan

