Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D84D87498C1
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 11:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559820.875168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHLdl-00024y-1m; Thu, 06 Jul 2023 09:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559820.875168; Thu, 06 Jul 2023 09:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHLdk-00022b-Um; Thu, 06 Jul 2023 09:51:08 +0000
Received: by outflank-mailman (input) for mailman id 559820;
 Thu, 06 Jul 2023 09:51:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHLdj-00022T-Ce
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 09:51:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7d00::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eb6cef5-1be2-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 11:51:03 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7548.eurprd04.prod.outlook.com (2603:10a6:10:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 09:51:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
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
X-Inumbo-ID: 9eb6cef5-1be2-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWl01o09j+mH5zmoiSRsAMLaipay7z6zSX5+/rVPUTLWRwsZVr3KFB9dyNnyLs6GWwvmFBWyLcr1j21dO3eapGMwNwc7G+SWZGg96o8Q1d2/GORxoxCr/ocJOpscwJ8kC1qgXrS+l7H9BTW0cBfsk4Gw7f/K7iNcxYl45Ajz9p8HZa6LMRQxpA0ID/QbIixVXeHESdt18BuMoguWwod1m6iCiwTpIxLoSkzt2nXmYHHpq7AxYRyK5Ih/x/SPS+MQTyqaT2m9C53OOui8KapXNhwboEPSuBd35EYzwGp5wM26/cpKj9kBke+UCvo3vp8HwpDmuZwMpGVk0e0uUG4aMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qU2zuEB2aWoDPFyG6rz9hcymQi25LlvFvg+n83waVrc=;
 b=a1+YVTZDnD+wJL/Lk1DbvtWHBPut15blUEG5eR2xCINEkj0LCPAE+ntC3dqcSd8Ew89FzhYfeJB4rOa7ChZPijt1V3IrVDZ5UV0RPVcLrgcJo+iQVEPSKTtQtb6dVkMbrHIYYZnEUNCXhFLMOfQV0oI8nv+d9FpDIKoj5vVgORl6IWw7M/T4Y3uBUv0DSTGq0BiW8/m7WFe4zq9yqgWNthgF31nqlgrq/lbtnUSc3XAduFLyyeqEYxIQ/36oPeis71A1n6LTvZFPrgktv3AqWYbth3Bw3OQ6t5AHA9f8t2QB3ZPepPWquzmVg2NfeUFZruoqRz0rJtCm+uSItGk5SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qU2zuEB2aWoDPFyG6rz9hcymQi25LlvFvg+n83waVrc=;
 b=zjQ9YeCmENSDdAZSZ/9IBQc2ZqZQEmxZuFsDISYcneDeYNHvMeJ0a2V5BNW77/3gAI2FsskXI6h9M8sy/ZMX1zg4oW/oH3YS85lfCjN1UDW9KxuUmKx+UPhVuqqCSWTLeNTt0+65DsniJV25O5rOElXzXmLzbARFJ6HNlA6leIb3bjRxMeB4ZztzbklA4zmewOXuZZMtLIrGD1nwT3+/wjdxrFHEbnDeruD9ByeCyfNqCMTp3yxelwvE1NIe2piTSkMFdcOCNW1zBfWaHMg0TCnyIwBEz/iVYBdlfKvUGzYgvCkzmFQhEyREurbBJn/3fM5cQ1jZJV9tkWXfRLpGqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e7d3daa3-7d5b-1c36-51f1-453bf11b55d2@suse.com>
Date: Thu, 6 Jul 2023 11:50:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] mm/pdx: Add comments throughout the codebase for pdx
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230622140237.8996-1-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230622140237.8996-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 83aa8f4b-8bc7-40a9-52d5-08db7e068175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UxuphrxQgZCYbkV+ugoJCYilUMbFP1kh5C451Z+qsxV1D+npaDmc29R3y9fV3pJym4mv01FIwy0FRDiNeZ7XHStFEeJ3FnnBJGG82SOKqi1hyBq3WC1DrOEstI3oNEuMuGZbCJroLHTsC5gUFBIaiM/Buz7vzYUEd4NihKZSb0DGnmKgXhd8Xn5KOu+AgMvxLbk/ryraQ3BVCaUybiDFu8zTBDB0WHybioJpuF40uA4WQYIgNf0+B83oezyvqXQjAneMnfyCAUkLAaeZBr+fjWn+BhTf3lnSq7JvXxXw0NXaCq4KFXhSO5MIZSfwtDugY9ihP51KzOvIIGGkEQ2LAT3mT9ve4FzAnE9cAc6amYS34hsiSWQMx/5xWNNidrlGPJzrCRHKmkEdU0pVF/Gb+B7yhZW9Zwr56q7ye7GhBa3/+QAfEj5qWCKyK6Ivmg21megl/UYRnkU8oTpvvXOEcDkvxeg3BzKk6EJexXAVL5J+Q4+3Tib3IFFS12O2SONhbIUgT7p6SbSJqwAP9JWRMjI41/5tHUlDX5hS4A30XIRp7Zs9CdRzi1v0z/VaqFdj7Yehov+uF63HkjzvZcw/Yv7p6P+ryjahf0Tv+Ue/B6t26vFxkOE7Kd4IHCUg0o/anECD2z3XFYYSQQpmL+UJwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(6506007)(53546011)(6512007)(6916009)(38100700002)(316002)(66946007)(66476007)(66556008)(4326008)(2616005)(83380400001)(66899021)(186003)(26005)(478600001)(54906003)(2906002)(31686004)(8936002)(8676002)(36756003)(5660300002)(31696002)(86362001)(6486002)(41300700001)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDNMNDNBdVRmUDhWY2t3Sks3cU5BK2ZkYTEyVTN0STVkYmVaYTZ2dVJIUjNv?=
 =?utf-8?B?QTlDazdhK3N4M0tTdVlOM0dJZVpqdHhZRTlmZTRGNm5HSnhTZHN0bWo5SDNX?=
 =?utf-8?B?QWdvYUw0WTZoZnh5N2ltWUsyc0VsM2E0d3E1N2I3TE5ySkk2SXVTWS85RGtJ?=
 =?utf-8?B?OUZZN3hCQVpTZzI4STNqTEJnclFJK05xcHNOQUdMVDlOckNUL2RQaE9vVEFw?=
 =?utf-8?B?anE1TUEzTGlCd0dMbHMxdSt6Qlh0aTlSMG9XdTZJbGNldnNBTndxNGQwbS9h?=
 =?utf-8?B?dkJOVjRUU2JVc3E5b3R6YnNMdmZqRlNmWXRYeU5wVWxjZVY2VzFIazlBMEla?=
 =?utf-8?B?QzdRSDNvY0hqVjEwUlV5dGdBRGJacmROYmdvTEdlM0VNZ3dObHcrSDJWZmkz?=
 =?utf-8?B?SDVFclMvVWhPVUJZdVNVU0R2MWhHTFJsNVpYcGxjRDFYSjlUWjNDYSsrYjNF?=
 =?utf-8?B?cFptWFRQVFQ5WFVVbnZQVVl3SjZ5dVJBZ3QwZDUzRE9mb0hpNCtmdCtGVTJu?=
 =?utf-8?B?c0poU3ZLSHFHOE9JWVRRdThpYzNXSmlFNVVsUTVucmM3TU9TOEVrQi9pcTBz?=
 =?utf-8?B?cjk0V2lxRkFDdWhvRnBPS0ZOZUUzREViTDkzc1o3c3lQZ2RoVU9HdU9IYUJW?=
 =?utf-8?B?cUVpWUZyWStpb1Z3YnI4cytSc2tvZnZhOW1HV1lRTytrYVdwQ0JxNzFrdXp0?=
 =?utf-8?B?dzhDMExhUXBicUtLeVNNTkFqUyt4VHYxSi81WDFPQTNRRjJQYUx6dXVONG5S?=
 =?utf-8?B?VjBsMkdHNWFkcVhYT0M3UGc3MGdSZWUvL3pDMlArMGdFYUUwcEhOb2FPYjJp?=
 =?utf-8?B?UWp5eWlxOEVFWXN3bnBuSlVEbytqZ0RLZEpldm9mSTczWThNV1hDRDNCYkpS?=
 =?utf-8?B?RUF3MjcxZXdVSjdqb1R1M0xQUXBkeldOc0ZJdFM3b2VvOVFINmVPbTJiRWts?=
 =?utf-8?B?SDFNZFFSWTNkcnMrYjZRT0ZJSWRiYVluYVdab25PbGJYWG95SkVkRkVnWkNY?=
 =?utf-8?B?R01wUHJnbnV4NmRkN1hORlgwUjdaVEtTd1pjLzdvb3FDcE80RWc0Z202em5x?=
 =?utf-8?B?ZTVOeW0rV0MzcEVaQ3FnNEw1QWhoNlh2clpjUWRrUmlybVhhM0ZTWGJEOG9W?=
 =?utf-8?B?UXNUbVE4SmZBVldEaFFoakRUcHZxb1d2aWw0aWFqM2ZQMHJ4bXJza3FhaGVE?=
 =?utf-8?B?SEJ5YkxxQ0J4YXdnRW9Ja2hZbVI1T0t6cWRjZEFoUUd3ZU9HNCtJZGI4OG1p?=
 =?utf-8?B?T0FEK2RuV2ZiY1pxYkxFRXRkSEZzYVBkdFExVXlQOU9mVGJzaTAxY2grbGww?=
 =?utf-8?B?emU4S0hoQXFvMyt0cUpHQ2ErYnh2TlgxeW1EV1NXc0VrRDVpZ0ZTeFMzR3hS?=
 =?utf-8?B?dVFPVEI4SkpsVnF5ODhNU2l2WTRIa1hDcXE4dkVPTjVBYzZXVFhQQTFHYXJr?=
 =?utf-8?B?cCs1d3o5c0V2ZEdMZVUrdDRpSy95SUtOOFpRZVFwU1dpWTB5YjZPVm9vdzhj?=
 =?utf-8?B?TDJXN3paNlo3Ym5odHgzWUx1c0dyR1V0MzBlWDJjT1pvSWp0UThEY1I0UE5O?=
 =?utf-8?B?cmdMaXdBMm1Xek9YN1JZTTBIY01GMEF2MjNMVmF0VjBWRk9IVjk0aHNldTkz?=
 =?utf-8?B?UVNrcmhHSmVnR0RVTGNySVk0UXVlTzBSTkRMWjdZaG9lVWxqS1huUjMwYXJp?=
 =?utf-8?B?eWJ6NVlpb1Q5aDhBSGpBR1lWY0lVLzlwbTlrTlVscVNSVHBnNkRhYjhoNE5U?=
 =?utf-8?B?S1NwQy92ODRIS0xaeDh0VUp2dlFQaEh4ZTZFS29HSGxtNXN2K2g3QUM3YkxH?=
 =?utf-8?B?S1ZldFhyUytEbkc1RmFic2FPOGh4NU5ES0ExRUxQZ2d3U3cxRUlWZWRiVTgy?=
 =?utf-8?B?RmdENWxaYTRiUFpPMFFqYlNRRVBZbmxJSTZQZHgyc0pidng5Z3M1NWhPY1pQ?=
 =?utf-8?B?UmdRNk8vUFo3SUNQNWNXTkFCOVB5VWZuU2VRMmZJRTN2ZUFRT3I1YkFrY0Uv?=
 =?utf-8?B?cUNmZmYrYWdsaVFNWGt5anFpNWsyNmtrWEQweW1iRFVRR1FyVSticlZBUE95?=
 =?utf-8?B?SlpjdmJUd2FtSzUveURBK3FJS1V0ODJTOGVNOXRJZGpoZ25NRzJTMXpnc1pr?=
 =?utf-8?Q?XMYmnJIc+BBcm9pmlVoKunBuq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83aa8f4b-8bc7-40a9-52d5-08db7e068175
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 09:51:01.0949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYgtNOUCKiC+ira8LKcjevyffuoDzt7mOA/7df1bnDJv/3EZ5CR9nVvn7II1F0/RHilMx9G6VFp1gskyPWu3rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7548

On 22.06.2023 16:02, Alejandro Vallejo wrote:
> @@ -57,9 +100,25 @@ uint64_t __init pdx_init_mask(uint64_t base_addr)
>                           (uint64_t)1 << (MAX_ORDER + PAGE_SHIFT)) - 1);
>  }
>  
> -u64 __init pdx_region_mask(u64 base, u64 len)
> +uint64_t __init pdx_region_mask(uint64_t base, uint64_t len)
>  {
> -    return fill_mask(base ^ (base + len - 1));
> +    uint64_t last = base + len - 1;
> +    /*
> +     * The only bit that matters in base^last is the MSB. There are 2 cases.
> +     *
> +     * case msb(base) < msb(last):
> +     *     then msb(fill_mask(base^last)) == msb(last). This is non
> +     *     compressible.
> +     * case msb(base) == msb(last):
> +     *     This means that there _may_ be a sequence of compressible zeroes
> +     *     for all addresses between `base` and `last` iff `base` has enough
> +     *     trailing zeroes. That is, it's compressible when

Why trailing zeros? [100000f000,10ffffffff] has compressible bits
32-35, but the low bits of base don't matter at all.

> +     *     msb(fill_mask(base^last)) < msb(last)

No caller uses the result this way, so I'm unconvinced it is helpful
to explain it here this way. This is also why I'm still not convinced
of the introduction of "last" (as a real variable and in the comment).
It's only the invariant bits in the range that we're after, as you
say ...

> +     * The resulting mask is effectively the moving bits between `base` and
> +     * `last`.

... here (where things could be expressed without "last").

In any event, nit: If you introduce a local variable, then it wants
following by a blank line.

> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -31,6 +31,16 @@
>   *   (i.e. all devices assigned to) a guest share a single DMA address space
>   *   and, by default, Xen will ensure dfn == pfn.
>   *
> + * pdx: Page InDeX
> + *   Indices into the frame table holding the per-page's book-keeping
> + *   metadata. A compression scheme is used and there's a possibly non

s/is/may be/ ?

Also as said earlier at least on x86 pdx-es are also used as direct map
indices. I think this wants mentioning irrespective of what Arm does.

> --- a/xen/include/xen/pdx.h
> +++ b/xen/include/xen/pdx.h
> @@ -1,6 +1,67 @@
>  #ifndef __XEN_PDX_H__
>  #define __XEN_PDX_H__
>  
> +/*
> + * PDX (Page inDeX)
> + *
> + * This file deals with optimisations pertaining frame table indexing,

Nit: Missing "to"?

> + * A pdx is an index into the frame table. However, having an identity
> + * relationship between mfn and pdx could waste copious amounts of memory
> + * in empty frame table entries. There are some techniques to bring memory
> + * wastage down.

Like above the direct map wants mentioning here as well, I think.

> + * ## PDX grouping
> + *
> + * The frame table may have some sparsity even on systems where the memory
> + * banks are tightly packed. This is due to system quirks (like the PCI
> + * hole) which might introduce several GiB of unused page frame numbers
> + * that uselessly waste memory in the frame table. PDX grouping addresses
> + * this by keeping a bitmap of the ranges in the frame table containing
> + * invalid entries and not allocating backing memory for them.
> + *
> + * ## PDX compression
> + *
> + * This is a technique to avoid wasting memory on machines known to have
> + * split their machine address space in several big discontinuous and highly
> + * disjoint chunks.
> + *
> + * In its uncompressed form the frame table must have book-keeping metadata
> + * structures for every page between [0, max_mfn) (whether they are backed
> + * by RAM or not), and a similar condition exists for the direct map. We
> + * know some systems, however, that have some sparsity in their address
> + * space, leading to a lot of wastage in the form of unused frame table
> + * entries.
> + *
> + * This is where compression becomes useful. The idea is to note that if
> + * you have several big chunks of memory sufficiently far apart you can
> + * ignore the middle part of the address because it will always contain
> + * zeroes as long as the base address is sufficiently well aligned and the
> + * length of the region is much smaller than the base address.

As per above alignment of the base address doesn't really matter.

> + * i.e:
> + *   Consider 2 regions of memory. One starts at 0 while the other starts
> + *   at offset 2^off_h. Furthermore, let's assume both regions are smaller
> + *   than 2^off_l. This means that all addresses between [2^off_l, 2^off_h)
> + *   are invalid and we can assume them to be zero on all valid addresses.
> + *
> + *                 off_h     off_l
> + *                 |         |
> + *                 V         V
> + *         --------------------------
> + *         |HHHHHHH|000000000|LLLLLL| <--- mfn
> + *         --------------------------
> + *           ^ |
> + *           | | (de)compression by adding/removing "useless" zeroes
> + *           | V
> + *         ---------------
> + *         |HHHHHHHLLLLLL| <--- pdx
> + *         ---------------
> + *
> + * This scheme also holds for multiple regions, where HHHHHHH acts as
> + * the region identifier and LLLLLL fully contains the span of every
> + * region involved. Consider the following 3 regions.
> + */
> +
>  #ifdef CONFIG_HAS_PDX

Stray last sentence in the comment?

> @@ -13,22 +74,81 @@ extern unsigned long pfn_top_mask, ma_top_mask;
>                           (sizeof(*frame_table) & -sizeof(*frame_table)))
>  extern unsigned long pdx_group_valid[];
>  
> -extern uint64_t pdx_init_mask(u64 base_addr);
> -extern u64 pdx_region_mask(u64 base, u64 len);
> +/**
> + * Calculates a mask covering "moving" bits of all addresses of a region
> + *
> + * The i-th bit of the mask must be set if there's 2 different addresses
> + * in the region that have different j-th bits. where j >= i.
> + *
> + * e.g:
> + *       base=0x1B00000000
> + *   len+base=0x1B00082000
> + *
> + *   ought to return 0x00000FFFFF, which implies that every bit position
> + *   with a zero in the mask remains unchanged in every address of the
> + *   region.

Maybe the example would look "more generic" if the resulting mask didn't
consist of just 0s and Fs, e.g.

 *       base=0x1B00000000
 *   len+base=0x1B00042000
 *
 *   ought to return 0x000007FFFF, ...

> + * @param base Base address of the region
> + * @param len  Size in octets of the region
> + * @return Mask of moving bits at the bottom of all the region addresses
> + */
> +uint64_t pdx_region_mask(uint64_t base, uint64_t len);
>  
> -extern void set_pdx_range(unsigned long smfn, unsigned long emfn);
> +/**
> + * Creates a basic pdx mask

What is "basic" trying to describe here? "The mask to start from" would
look more to the point to me, plus saying that this is the (up front)
companion to pdx_region_mask().

> + * This mask is used to determine non-compressible bits. No address in the
> + * system shall have compressible bits covered by this initial mask.
> + *
> + * It's the larger of:
> + *   - A mask of MAX_ORDER + PAGESHIFT 1s
> + *   - base_addr rounded up to the nearest `2^n - 1`

I'm having trouble with this mathematically: Rounding always means
going to some proper multiple of some base number (granularity). This
doesn't fit with the value being 2^n-1. Maybe "padded"?

> + * @param base_addr Address of the first maddr in the system
> + * @return An integer of the form 2^n - 1
> + */
> +uint64_t pdx_init_mask(uint64_t base_addr);
> +
> +/**
> + * Mark [smfn, emfn) as allocatable in the frame table

What does "allocatable" mean here?

Jan

