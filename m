Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A03C958E853
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 10:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383432.618600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLge8-0002qy-TQ; Wed, 10 Aug 2022 08:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383432.618600; Wed, 10 Aug 2022 08:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLge8-0002oZ-QR; Wed, 10 Aug 2022 08:00:56 +0000
Received: by outflank-mailman (input) for mailman id 383432;
 Wed, 10 Aug 2022 08:00:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vQbV=YO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oLge7-0002oT-Ju
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 08:00:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e9e51ec-1882-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 10:00:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5757.eurprd04.prod.outlook.com (2603:10a6:803:e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21; Wed, 10 Aug
 2022 08:00:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Wed, 10 Aug 2022
 08:00:50 +0000
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
X-Inumbo-ID: 8e9e51ec-1882-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4rRMNhDz+AEMf87mfQHlNR3Pt+lnI8FmYtqbpHMSF/9b+HNw1GzC6ROcx9FnMxR+Z9+Ez+MNgt7MYPIG5XRakDuua4t7vTzI4ydq49tMwkI9dfgDwJkQ9+6u9r17x9F0PVYuxM4zYMyxTYfQDr4h/t0+CcMGknL3y06nF52R+jYgwk6RPan30oOI6skuiDZZ4rrUNSLMnw0LRCCCnYmqXkB50gI+qDwON0mRhoQaKZWog+aCY2R9oNo1fAc+YrTa/sowRerx2fjpbS99s5togQmE5SJDIEE0MHczxnfmwNlUXw2OUW5kigqlOdAn/F8w7IVhODezaEKx/S1rEgRlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pY+3BS1Mb7BKXhmIry/ksX6jz3RwGWGwVyg6zzLgMws=;
 b=ofo/KTwZqhANIe8fZq+aaCxu3dXL9izwDtoL/bUfWsiXID9s7De56vZXvJavUc8wVbZtFUlCjwnz8x1W3KFwNv8J4QMBtDQN2iigjRv8j8Y7EY4NLSaUcxT9XHkHDTHzbLnh9lZEGt6UzpErhR1aA7VrCqAgaR16VJGDoUjsubOdbWDDSZBAjWu6CsVVJ3bEz+FDUNO1K15SyxJpp0hDi+lqgcpCxcwB9HQYtI9SbZZyWiEyPQt34yRcYIpnU83XDGyM7kyK+oFXAstGmJEkK9zoBpx0qZxacSQDykFbXHYTxB7mTXuppi61eqQ4HQXy2TAACm/pZ4Qf6dUix+24PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pY+3BS1Mb7BKXhmIry/ksX6jz3RwGWGwVyg6zzLgMws=;
 b=GI9zAop7pGEhnOWfzkRTFyTuu2ypN7lq8spXQ3yWFZqxsvGG+XMmXjNcnU/S3Rnj7A/QXDvMcUZkCI/YmuTwELlyYjZZymmLr2BqzmcvjZ9cTN4bqHMjbgbbWOQhRVNGOW2aaTotM//cbhGGfi/04lhgOkJPvGk35v5iVQDrzaO2E47Of/+3TidLy8tJeh6rjrtL238yKpXSkhi+cPPaF+x5Yvy8944capeWcM9+DjrlhHoIFSjr8NluwKM7Oq8KZ/FsxzrWWt0yl/xaLvnoZTRPDm+RCMDJGD2VoTwcc829DHv2oeVRYtlH5ZVnTkIJvNKIoXkU3k01KLs5ygAeBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b45778e0-9ad3-d32d-e226-7171cfb59394@suse.com>
Date: Wed, 10 Aug 2022 10:00:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] x86/spec-ctrl: Reduce HVM RSB overhead where possible
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220809170016.25148-1-andrew.cooper3@citrix.com>
 <20220809170016.25148-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220809170016.25148-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 639d668b-b6ce-46fe-2b52-08da7aa670df
X-MS-TrafficTypeDiagnostic: VI1PR04MB5757:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uVraFzDdj9A6vapoPcehVQY8L8ZzSEY5CWNf6zSBpqFT+ww35Bo6kGulc2kMkykZcJaWELJe+M2zXfgd4iO53oIsm7Dt0UsuT5rRmNq9YdQwYJ6NiNQdReyEhufaJAWtpfgfoXvWE87QefbEi6xH5ls3JoYpbNgMOesXq2/yDunSl3gB1B3TNl6VwU79XwbMoXFIP6KiLi3TPK4KHsbR520CvcXMr3rLNkHTl3hXfxUMgE9kwOkllldl2oLOaYCUchYJIOQsrlU5F/AXqOzJs4ci36hfhZ3iRF4EtVnPmnd1rnjEU5+5nmYew9MoPUKCcasBf0Pkmzqaiu9FtQ0LTJiPdsrgkSUYdcpJ6FZffXxaKqj6MXEC9Svzar7c/2KM2cYl1WgNK4o+J5AS8G8lJdsCbre4EhMDziskJt2vvFDNynOSwIl0VNBXCIgSaywGFmIZabL79GS1FBXzqY0khAJOvLT6Hy4qU45QkLz4Q56EQPJNsekeRtpTwx9PFKq3iSTPWhHQnPrIC5ZcYMG4u9aiQlhC3Am35ZLnw4ZEjeBv7wnBpgluWAre9v/pWjH0zlOLRUntX4Pws47vj3il96G/WnxhGBr+EAZLlQ9aeKwBU0mFFEpdBQJ0wptO12u9WGyrV60ltnY8lNeZ+GL68TKnCvJ836Lib1LSfgHmHKjaBEjQsDRnMNUWNBuaE6aufHhsSyJ/L9Ow2Am5MJGfMj54ftPTTP7FlHxnEckYV5AmGn8BlTcYd/cje9E3u1ppT11LQ9pHQ3odzwfI2zWbySccwDplxm+VTP6m+NmDdNqQhBLSs2+rmCi9BzMQPjS92xxAcxROft6TB8UwGHdLrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(396003)(346002)(376002)(136003)(26005)(38100700002)(6512007)(53546011)(31686004)(2906002)(5660300002)(41300700001)(8936002)(36756003)(6506007)(2616005)(66476007)(86362001)(31696002)(66946007)(54906003)(4326008)(6916009)(8676002)(66556008)(6486002)(478600001)(83380400001)(316002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amVGd2VwMXNFN254WnBsMDhOYVNmREQ5T001RXFERUpMWWZiTlhRb0wxR0JV?=
 =?utf-8?B?S3dmZ0JoYlR2b0RORUpzUTdzMHNRZnpndDRxc3N2QzM0SVJHSHBFazlJbzZl?=
 =?utf-8?B?SE5remNEOWtySjdTWHA0R1JzUVQ3cmZ5L1NJS1g5aU9mZlFkQ21HZERmR0dn?=
 =?utf-8?B?QU80cnF2U3R0M3JWU3RFa0RPQ3VZVFlDMk1rQUo0elFUajcrWHlpNm80Z0gx?=
 =?utf-8?B?c3JaS2V0WXFJRzk1bk94UVFKUWQyQjNEWXpsSGRPaGJNdm96eE1lU21aTW5h?=
 =?utf-8?B?a2IvNlljRDJNR1VCdXFhQlFXZjhBbEJFbThFZlo0R0tLNk8vLzhudGRpMlhr?=
 =?utf-8?B?c1NLWmpEUVhWcHBEd2Fscm9ydW5xOSsyc3BlVlB1MjNNTmJLOUZQSUp2ZTQx?=
 =?utf-8?B?RjZ0VWc0cWxQQTBzQ3pjUEtscWVwNE1Qdm0vcWNBSjVqMzFGVk5qejlsWFRO?=
 =?utf-8?B?bEMvalUyalYwTTFyRUlsdk5aQ2N6RThRQitvWFVDTHdWcGhQRUNtczFORlcz?=
 =?utf-8?B?NUs3elhKWldUUXl2RVdVcWFCcEFLOHFuTE5tOU1GdlVSTXl3eDJoTHZXVm1D?=
 =?utf-8?B?bFRVVy9lNFNzS21NTnRjOUh4WVdRU282aWI4RDJ6QzlrZHBZaUY3Sm9QOFhq?=
 =?utf-8?B?cVRQNi90MDJzUDlTUWdVdXEvK0dGT21QTnFKcVRaRFpaRThDK25ES1JUR3hU?=
 =?utf-8?B?eWpUVHFvdDVucHZ0ZVB5YUlqVVJBcDR0SEdRU1BNdmdNSElHY3F0MnA3bmxI?=
 =?utf-8?B?Rnk1UXRJY3NIYVpJM201b3d5VzQ3Q0hhZlo4UkMrVVg1TmphSWJhaWlhRDVM?=
 =?utf-8?B?M3NDUzlrQTVKTEhlRFRzekg1Y0k2UHF0WXlySDFKVmNsQmVHZTUwd1NZOTZV?=
 =?utf-8?B?UUgyMjhSaVRyeklPSEd3eDJ6TUxlRmU0VFJXb1dDTVJLS3pXaDl4OGpuNHB3?=
 =?utf-8?B?MTdHUU5vVU1LSGYwU2w5ZkNtcTFscFVhVTFUTGYvK2RxNnNYNk1FaHlmbFE2?=
 =?utf-8?B?dnhzOUJpQzQ4cWw1R0drYVpwSHg3NDU0bzRjUlBjV3lCMXRkengweVdoUE5X?=
 =?utf-8?B?YWxSamhUSjBJckprTllub2JXU1ZralRnQ092TDd0VStuRHRBL3FQZmkzMHN6?=
 =?utf-8?B?dllOeWJUWFVHQkFRSkkxeHZMWU16UC94N1E4amRUdW1xVWY2V2d0MDBReFB1?=
 =?utf-8?B?NzNqc2NUNHBZeTNsRmhhQmhuRGRTeEtrZUVueCsrU2xXTmFoMUk2MHlDR0ZU?=
 =?utf-8?B?TG9RbzVBMUYzWTBZb3ljS0YrV0VJUDRJTnN6c0w3TE5VaVN3SnlhdEUvVVB1?=
 =?utf-8?B?bUlXa3M0UXNuL3ViS29pZUEvdU1pVlJ6OTdvQ3J1N292ME9kRXhEM00xcnBJ?=
 =?utf-8?B?RlVxQmtidUV6RWJhU3NzT2FERVR2U2pPbi9jVFNNTG83RVdRSDlLZEY2N04w?=
 =?utf-8?B?WEc3T1lUOUVhbk1jNCtIRjF1eUF2QlBoeG1zcEoyUlV2RE0wSjZvWkIvN0d2?=
 =?utf-8?B?L0FvYnhSc0s3QmJndkJ0bzdwcTZFVWxhZXdaRVN3YmR4VHFQcW9raGUzRnBG?=
 =?utf-8?B?M2UwR1gzTlBMM3R0RkoxcWh1N2N6NnpENk4wNFlXbmRwaVVabFJJeWU4c1NF?=
 =?utf-8?B?ZjFkL3NOZVJneGVOcTVRWk0wUnZaSWFGSUNnM1FCbTZuUDZhR1c5dFZBNGFn?=
 =?utf-8?B?STJhQS9YVFZRVUMxeXlnUFcyRHVEbzR5ZW0yY284MUxrdmhTSkRZUzdKVDdh?=
 =?utf-8?B?YkdqZXRCblRwcFRTTlJCbDVzVDhuT21CV251YTN4Y0xqMTJyNm5iOCtYeHFm?=
 =?utf-8?B?OHRtRnZxWE9yTDd5UFNQOEUzWDh5cFI2MDhWRjFEQ2JWdE9pdXYvSFhBUWJ6?=
 =?utf-8?B?ZFN2TWp6V2c0OFhnR1ZrR0xwaXBRT0FEY3JZRmFKaGcyMTVaMFA3MkZTRFNO?=
 =?utf-8?B?UndaRjZVSnJlSXp0ZnZKUzdTTEpKbGt6ekFnSVc3cFZ3QWRDZTVBcyt3ZEN0?=
 =?utf-8?B?UG8yRDJXSzNTdDloVFZuQU51TU5hQ3U0R0V4UEt3cEJkNUlGQTB6OVdQLzZE?=
 =?utf-8?B?ZGZtZXNtbm5FTkZmVkJYZThDaFVMdjRrZG0zcjN1OTZiVUJkNHRwQnF2V2p3?=
 =?utf-8?Q?nLxrESm4mHcoy+Zu2xyeex4vA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 639d668b-b6ce-46fe-2b52-08da7aa670df
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 08:00:50.5211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xd1ODA6/3jtIezLHy2bGXI1T1mbbuMt9u5SCWLwiTBpK24DCCHl5AhECE2lTJdZ7q3MsVNMAXSwvleK3J9Wj/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5757

On 09.08.2022 19:00, Andrew Cooper wrote:
> --- a/xen/arch/x86/hvm/vmx/entry.S
> +++ b/xen/arch/x86/hvm/vmx/entry.S
> @@ -44,6 +44,7 @@ ENTRY(vmx_asm_vmexit_handler)
>          .endm
>          ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM
>          /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
> +        /* On PBRSB-vulenrable hardware, `ret` not safe before the start of vmx_vmexit_handler() */

Besides the spelling issue mentioned by Jason I think this line also
wants wrapping. Maybe the two comments also want combining to just
one, such that "WARNING!" clearly applies to both parts.

> @@ -515,7 +515,8 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
>              boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM) ||
>              opt_eager_fpu || opt_md_clear_hvm)       ? ""               : " None",
>             boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
> -           boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
> +           boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           :
> +           boot_cpu_has(X86_BUG_PBRSB)               ? " PBRSB"         : "",
>             opt_eager_fpu                             ? " EAGER_FPU"     : "",
>             opt_md_clear_hvm                          ? " MD_CLEAR"      : "",
>             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM)  ? " IBPB-entry"    : "");

Along the lines of half of what fdbf8bdfebc2 ("x86/spec-ctrl:
correct per-guest-type reporting of MD_CLEAR") did, I think you also want
to extend the other (earlier) conditional in this function invocation.

I also wonder whether it wouldn't be helpful to parenthesize the new
construct, such that it'll be more obvious that this is a double
conditional operator determining a single function argument.

> @@ -718,6 +719,77 @@ static bool __init rsb_is_full_width(void)
>      return true;
>  }
>  
> +/*
> + * HVM guests can create arbitrary RSB entries, including ones which point at
> + * Xen supervisor mappings.
> + *
> + * Traditionally, the RSB is not isolated on vmexit, so Xen needs to take
> + * safety precautions to prevent RSB speculation from consuming guest values.
> + *
> + * Intel eIBRS specifies that the RSB is flushed:
> + *   1) on VMExit when IBRS=1, or
> + *   2) shortly thereafter when Xen restores the host IBRS=1 setting.
> + * However, a subset of eIBRS-capable parts also suffer PBRSB and need
> + * software assistance to maintain RSB safety.
> + */
> +static __init enum hvm_rsb {
> +    hvm_rsb_none,
> +    hvm_rsb_pbrsb,
> +    hvm_rsb_stuff32,
> +} hvm_rsb_calculations(uint64_t caps)
> +{
> +    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
> +         boot_cpu_data.x86 != 6 )
> +        return hvm_rsb_stuff32;
> +
> +    if ( !(caps & ARCH_CAPS_IBRS_ALL) )
> +        return hvm_rsb_stuff32;
> +
> +    if ( caps & ARCH_CAPS_PBRSB_NO )
> +        return hvm_rsb_none;
> +
> +    /*
> +     * We're choosing between the eIBRS-capable models which don't enumerate
> +     * PBRSB_NO.  Earlier steppings of some models don't enumerate eIBRS and
> +     * are excluded above.
> +     */
> +    switch ( boot_cpu_data.x86_model )
> +    {
> +        /*
> +         * Core (inc Hybrid) CPUs to date (August 2022) are vulenrable.
> +         */
> +    case 0x55: /* Skylake X */
> +    case 0x6a: /* Ice Lake SP */
> +    case 0x6c: /* Ice Lake D */
> +    case 0x7e: /* Ice Lake client */
> +    case 0x8a: /* Lakefield (SNC/TMT) */
> +    case 0x8c: /* Tiger Lake U */
> +    case 0x8d: /* Tiger Lake H */
> +    case 0x8e: /* Skylake-L */

Hmm, is SDM Vol 4's initial table wrong then in stating Kaby Lake /
Coffee Lake for this and ...

> +    case 0x97: /* Alder Lake S */
> +    case 0x9a: /* Alder Lake H/P/U */
> +    case 0x9e: /* Skylake */

... this? Otoh I notice that intel-family.h also says Skylake in
respective comments, despite the constants themselves being named
differently. Yet again ...

> +    case 0xa5: /* Comet Lake */
> +    case 0xa6: /* Comet Lake U62 */

... you call these Comet Lake when intel-family.h says Skylake also for
these (and names the latter's variable COMETLAKE_L).

What is in the comments here is of course not of primary concern for
getting this patch in, but the named anomalies will stand out when all
of this is switched over to use intel-family.h's constants.

> @@ -1327,9 +1400,33 @@ void __init init_speculation_mitigations(void)
>       * HVM guests can always poison the RSB to point at Xen supervisor
>       * mappings.
>       */
> +    hvm_rsb = hvm_rsb_calculations(caps);
> +    if ( opt_rsb_hvm == -1 )
> +        opt_rsb_hvm = hvm_rsb != hvm_rsb_none;
> +
>      if ( opt_rsb_hvm )
>      {
> -        setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);
> +        switch ( hvm_rsb )
> +        {
> +        case hvm_rsb_pbrsb:
> +            setup_force_cpu_cap(X86_BUG_PBRSB);
> +            break;
> +
> +        case hvm_rsb_none:
> +            /*
> +             * Somewhat arbitrary.  If something is wrong and the user has
> +             * forced HVM RSB protections on a system where we think nothing
> +             * is necessary, they they possibly know something we dont.
> +             *
> +             * Use stuff32 in this case, which is the most protection we can
> +             * muster.
> +             */
> +            fallthrough;
> +
> +        case hvm_rsb_stuff32:
> +            setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);
> +            break;
> +        }
>  
>          /*
>           * For SVM, Xen's RSB safety actions are performed before STGI, so

For people using e.g. "spec-ctrl=no-ibrs" but leaving RSB stuffing enabled
(or force-enabling it) we'd need to have an LFENCE somewhere as well. Since
putting one in the RSB stuffing macro would require a runtime conditional
(for its use for alternatives patching), can't we leverage the one
controlled by this logic? That'll be a slight abuse of the name of
X86_BUG_PBRSB, but probably acceptable with a suitable comment. In the end
it'll simply be another fall-through, I guess:

        switch ( hvm_rsb )
        {
        case hvm_rsb_none:
            /* ... */
            fallthrough;

        case hvm_rsb_stuff32:
            setup_force_cpu_cap(X86_FEATURE_SC_RSB_HVM);

            /* ... */
            if ( boot_cpu_has(X86_FEATURE_SC_MSR_HVM) )
                break;
            fallthrough;
        case hvm_rsb_pbrsb:
            setup_force_cpu_cap(X86_BUG_PBRSB);
            break;
        }

That way, aiui, it also wouldn't get in the way of print_details(), which
checks X86_FEATURE_SC_RSB_HVM first.

Otoh I can see reasons why for the stuffing the LFENCE would really need
to live inside the macro, and in particular ahead of the RET there. Since
we don't want to have a runtime conditional there, I guess we should then,
as a fallback, extend the text in the command line doc to warn about the
inter-dependency. After all people "knowing what they are doing" doesn't
imply them knowing implementation details of Xen. But then I'd still be
a little concerned of the "they possibly know something we don't" case.

Jan

