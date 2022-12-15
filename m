Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2962264DF4B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 18:05:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463619.721841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5rep-0005lL-Ke; Thu, 15 Dec 2022 17:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463619.721841; Thu, 15 Dec 2022 17:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5rep-0005id-Hp; Thu, 15 Dec 2022 17:04:31 +0000
Received: by outflank-mailman (input) for mailman id 463619;
 Thu, 15 Dec 2022 17:04:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g8Eh=4N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5ren-0005iS-VH
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 17:04:30 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2073.outbound.protection.outlook.com [40.107.14.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88407eef-7c9a-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 18:04:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8328.eurprd04.prod.outlook.com (2603:10a6:20b:3fc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 17:04:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 17:04:25 +0000
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
X-Inumbo-ID: 88407eef-7c9a-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkNtTsFQvqDgiPah29Zi4i7Y/g+RHgT20xd6L6V/l+FebuZdeTRM20z2lFDt4fcMHqHvKTBPotRjRIB4Ql4BbJnFhAyJ02ToDT2AyZ5tIuZRiNDLRPlJ0keZvGfrbrhaqjyMbAAwLF85YmllOoh/QbX6bNz8IN5pjaXVgAS0aNxwMWbfiOdGMxgsPqgvaTkjacH5u3NDaZ6WQG+POR1OJAPrVBe/EHteNGoLr7mdbEhx7cxA/iQP7uXENfIslH4L4o7unS1Qi+fSNAOJS2VDyqtHK7EsSk3s6XzMfswS4XRd/GyVjt/UxacQ2fxExzNvB6h8PmFTq0eKuR7rHg9oPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joACZuB7eayAGdWkq5p/H+gFVogyIlOu+gwzFJI+zIY=;
 b=RKK08PVj0jbYyZcqZ366UARIgQnuGVNyWIJ5OVY+XUyA3R+w86VPW2+88oGlp4iidKkhZZbpnEx4m6bySMbCJUJtJ/tFbOmJ9w8wbv9G1Urvl5Dki3k0Qi5fP6aqpCi7qThwMuUaNBBWyCaqo2EbjxMLIEmhONWxlsn0E9rfFFVeZpHd8JuSymL3tzzS7o5nsXOW3B9UXHGnoGwhix2HVcSStV8iF4pWs6471RUqyL3w/qZRlBXJmqWwnj3kxIUG+7//M/eBxzOibniZUeYyScCtYlesPM4r5yV4U01Oyh9zYcF/vYHVBAj2jOsjBq106+g4STL2mWMDIoAUf6npjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joACZuB7eayAGdWkq5p/H+gFVogyIlOu+gwzFJI+zIY=;
 b=cIXlgg/LhLRjIDcnrnkWJtNlqzHpOK9H5zO6J11Ud9/fqwGPc1PFyq7p3Ij719YAj7ogWQJOaiTSFwphOb0BOSGNm14kxwgBcbEGeaYGUo33G7YnuZfjBaEHB/mU7bhX1g9+LOgB27ZrNPsmAKC79Bfm3XIUpsgndIKKz90O2sHj+9BucX9XO6Bgn927Jd4pV0Nkf8XlAVSXnpBQEKuH0zoHMMV1/DsDXoQHTGRka2iH8Ej+gfDiYfEUWOJU+VVjEAVyqxdGIKk5WNSLHi8EDC/Gbasj2+5mfoXVAVthI9g2HQvSbS/qzO0la/KQkbJeRWrr98Ne4dZab7MtlAIzIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7329ea63-edaa-22e5-acb0-ff1abfcd589f@suse.com>
Date: Thu, 15 Dec 2022 18:04:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 09/12] x86: Derive XEN_MSR_PAT from its individual
 entries
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671057808.git.demi@invisiblethingslab.com>
 <06d61ac0d94ac66476cb7207b00ab1f4eda36464.1671057808.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <06d61ac0d94ac66476cb7207b00ab1f4eda36464.1671057808.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 64837b10-0c64-422f-7354-08dadebe6b7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KAvxRW3OYcbD1nhgCXAqgcaO3a9TT5w/LEYuKsKaQHANOiX46molKJS9Ey2ts6up/1CyCiyeIXSaBiyvbJSlyajWKl4zVrk5VTgp+6ftdDuM7O6JyxsImll8wIYnyWxM9v1f/Zzi3Ecm/QO4doqoQXYrSb9AxYZmIUxzNm4Wzdcd/S9RyKiApo4zYo+vZuTcXz9wuTotTH0JiHy12qyxQdThXVoizFbTyAtkcmJjjlzO3TvFTmu7GESQvQBZPqGWXmu5CzncdZ01ybk2a9JnJ1+wAiCh+lUqDEZVFI3YT6a7tNTeyNkjxzC6+g/+U8J+NIPmBqwAZO5FmkmJZqaH9l9f3GgM+1KdX1VLkxnsbiYynYUwEUDcYBOvjRKKDYj+Vp81nJP8ah74nlrQ1B7T5jeJitXgwaL3Vuk0NTvjdrmoNJ3khwC7nUg1sAlHyQms0fgHhssqxhSf2kilVG04djS/YokypvtCwtZVvaiCikaOWKjugzmUZGW+bQUuYbkpIXWbYLE9IvzcTE4ctN/IZNKclRdBvTFdSdVruKVaWHAzqAq8IxeETKV+uTGG2X2mKc9WYl1JCnjCHQ/spzqpw0KUDgA0N8U5qHx82UETNL8MGx3ucQLcwOf5fBI9OVk219DXKxjzs19nBTociJwzFJKE9IcQ+x1GXU8C2QI3eiDbcxTx72Qbh5CDsjeUbKX2mNzqIeRp6sl89VBYRFZcD25EvbbT/UnzS+rJgVwU20U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199015)(36756003)(31686004)(38100700002)(8676002)(2906002)(66476007)(4326008)(66556008)(66946007)(7416002)(5660300002)(31696002)(86362001)(8936002)(478600001)(6486002)(54906003)(6916009)(316002)(41300700001)(2616005)(53546011)(6506007)(6512007)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3BPMldORHlidVBFWU5SeWU3YnhHeWI5OUV2SHVENW1ZWmtMMnYxYWdDaXEw?=
 =?utf-8?B?Q3g2QUFmaXQvN3Z4U3VJTlpYMXIyZi9mQjFqTlFEbG5MMDBqdU02TXBZMUM1?=
 =?utf-8?B?RVhQUUp2TW5pNHhTenJMc2RPdGxJeHllWkdOTVdqQ2pnMXpjdUJIRmNkTS93?=
 =?utf-8?B?ZmZpYjJCVDd2TXNLc1FwYkdvUmV1YTlSWW8vWi84eDRJeloyd0ZrbWdWS3Fq?=
 =?utf-8?B?dk15ZlNqTGF3WkVlaDZUR1NjVlB1anlSeFp5L2RGQkkxNHJzaWgxMkd2VFpZ?=
 =?utf-8?B?SDZ0c0Fpdk9YZDZJZ0ZWTjZRZW50T0cvR2dDWkVlc1JIMDhMbERvSW95MUNx?=
 =?utf-8?B?a1R6SnErbGdENzdwcG1lUFRvaXRjWmd4TVJUL0M5Vmw0Qkt0RGhNdUNjYy96?=
 =?utf-8?B?U0t5Z1lWb0dIMEYybU9wUHR1V3VUYXFhc2hqL3pDcFdVQ1hSekJXakhGQ2Jl?=
 =?utf-8?B?cVRRRDk0MEpWRzlnOTFBTXh0VW5MU0FnTDlqaGZ0aHh2cmRnU2cwa3JKbHhF?=
 =?utf-8?B?VlVjSlN3RWNoK3BqTk00ViswN0l0SEdKRTY3Z0x5NVcvck9ldDNkblpFaE5Z?=
 =?utf-8?B?ZGNueTA5bUtYWjhkSkdlbldSSjR6UzlSWkFiV044em53eWpsTXNGT1ZWYkRY?=
 =?utf-8?B?V1JHaWlvaEkveXFVSVdiUlE2bW5HZTUwK2dXSmlPWFQ4ejNoUG4zeFg0T0I4?=
 =?utf-8?B?blhRazZiUHF2YWMydS9iSXBhK0o1UXA1Y0RSeHRjbVQrQXpRS1J0bjg0UHFD?=
 =?utf-8?B?bWI0SUdtQkNYeFRXTkxtVTVpVytYNFhlVktMRXpSS3FLa3ZPcHBVd1E5Skpr?=
 =?utf-8?B?LytHZ1FPVUNZZld1RHJrRmpOUnhWUXZsTElTTkVYZStqU3ovemptYU1Mb3BB?=
 =?utf-8?B?aEp3Y29MaXdQazNGQUZzV1dxa01zL1ArWkJjS3NlWEdYL3R5YVNvR2phRGRy?=
 =?utf-8?B?dUFyZXRoNENYL3lMbHljcWcrLzJ5Mmt1NmdDSFFMUUYvMy8rQlR1ejVGcmFP?=
 =?utf-8?B?YWNxUUszVzdYc1YvN1VOWFNDTmk0RVJBZUwvRlkrS3lTUE8wT2JSczdzeGxI?=
 =?utf-8?B?bExQWjRLamoraVFIQzMyOHFGMjJQYVJkQjZDeWZZQXNORENBdDZTejdzMm1J?=
 =?utf-8?B?eDIxN0Nhc3N5L0FoZnE0dmRnYUIzV3VZYTlDRExaQmw0WERLakpveEQ5UEtP?=
 =?utf-8?B?RWFhbWhSYWxSWCtuSGxGcmpRL0liZ2xsVktCUncyNkgzbkFnYllBQTgybXpM?=
 =?utf-8?B?RjVUZzRTSDh0VkI0SXNiL3pRbUJuckg5eitVaTN6MnpoM05CNG9FTFl3L01U?=
 =?utf-8?B?QS9xRThybllIUkNEellic2dEUndramxpMFdndEVQbXl1c3lCRkxSMTlQa3pK?=
 =?utf-8?B?eVFtNFdlOUJDUGtpUkVjTHM2NVh2V2F4SzkyN05IZVJWbGZmYkdkaE1zTHkv?=
 =?utf-8?B?dU1iV05Yb04rU3ROYzZUNTlXTlhvQ0xZbkpCZHN6SklPZ3ZPWU1KOEUwRHNF?=
 =?utf-8?B?TVliM0ROcXBRcXhONGpZbU9wVDM5SytRS1pQVHRIYWlIWlZQeVVsd1VNRWlP?=
 =?utf-8?B?NEtENDErbkpocE1BeC9Yc09abG9MckM5MmMwVTZ4ZVZ1enNRS0prQlo4c1VP?=
 =?utf-8?B?dktLZ1c1V09STy9RYzlNL2FTK2djQnorTE9YV1kvVk9yS21aekZjTGJhRGF6?=
 =?utf-8?B?ekNWWkFpRTk5OHRPMTI4RVdLMVBIVVhaeERHTGI3c1llcVZEWlo2YmV2Q3ZE?=
 =?utf-8?B?N0ZJeVBtTCs5dlRqU1ppU2F2eS9CMUp4RW9uVDJXMmlmNUhjc3g2VEZCRDhj?=
 =?utf-8?B?aGE4K3ArczRjenFDTkRaTldFWGtUaDhRNitWd3IvcDF0eFBPQXRkU0FVelBJ?=
 =?utf-8?B?bnNNeVFCSEZ4OTRBYTcwSWpvZHk3cUFLbjd5QUg0MGY2L0ZQL0llT3hEYmxz?=
 =?utf-8?B?TlZMK0tpOUEwenJVbmx6SzRnYkhGL3hVNkZDZmF4azFVa3AyQXNCcm9MZXU2?=
 =?utf-8?B?MWw3SC92UzYvdEJodEFKeWQ1Zlo0OEZmRGg1NGpVYkJ5VlpYK0xLS1dWRS9h?=
 =?utf-8?B?dndyZGNNSXQ1UDJCZ0VrKzJSTVlhdnlQWnJ1U0hEZndvREdrVnNrWEN1WW5B?=
 =?utf-8?Q?+L9T6UaQa2J0Jqj5T6MoyruU1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64837b10-0c64-422f-7354-08dadebe6b7d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 17:04:25.6288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fshpo533ldN9JGMVroeM2LDcFkbCc7SejPLlucctg4jTTB5TX8Wa1CtjeHlCDm96TJu89a+fIAmYzDwvD8kfLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8328

On 15.12.2022 00:11, Demi Marie Obenour wrote:
> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -96,7 +96,15 @@
>   * Host IA32_CR_PAT value to cover all memory types.  This is not the default
>   * MSR_PAT value, and is an ABI with PV guests.
>   */
> -#define XEN_MSR_PAT _AC(0x050100070406, ULL)
> +#define XEN_MSR_PAT (X86_MT_WB  << 0x00 | \
> +                     X86_MT_WT  << 0x08 | \
> +                     X86_MT_UCM << 0x10 | \
> +                     X86_MT_UC  << 0x18 | \
> +                     X86_MT_WC  << 0x20 | \
> +                     X86_MT_WP  << 0x28 | \
> +                     X86_MT_UC  << 0x30 | \
> +                     X86_MT_UC  << 0x38 | \

This wants properly parenthesizing (the shifts against the ors), and
at least the last four constants also look to need casting to uint64_t;
in fact I'm surprised that ...

> +                     0)

(interposed: I don't think this really does any good.)

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -6355,6 +6355,12 @@ unsigned long get_upper_mfn_bound(void)
>      return min(max_mfn, 1UL << (paddr_bits - PAGE_SHIFT)) - 1;
>  }
>  
> +static void __init __maybe_unused build_assertions(void)
> +{
> +    BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL &&
> +                 "wrong XEN_MSR_PAT breaks PV guests");

... this didn't trigger for you. (We also don't normally add such
constructs with a string literal to BUILD_BUG_ON() expressions, not
the least because compilers may take issue with such. I'd like to
suggest to convert this to a comment instead.)

Jan

