Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3F8B1A3A3
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 15:41:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069400.1433251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivQz-00019B-VW; Mon, 04 Aug 2025 13:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069400.1433251; Mon, 04 Aug 2025 13:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivQz-00016a-SK; Mon, 04 Aug 2025 13:41:01 +0000
Received: by outflank-mailman (input) for mailman id 1069400;
 Mon, 04 Aug 2025 13:41:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uivQy-00016T-ED
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 13:41:00 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6c1bf05-7138-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 15:40:58 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-af96fba3b37so139245766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 06:40:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a24364fsm718006766b.140.2025.08.04.06.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 06:40:56 -0700 (PDT)
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
X-Inumbo-ID: a6c1bf05-7138-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754314857; x=1754919657; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xoFaB6hOuROgJRMYJzJYnA17731w5us9zWBdDSdGBXU=;
        b=AGeX4BOjTN0dvv3/eWO1r4O8iwSl5nuRFO64J4H9Ix4pMq+bUXOqPHDyQtMOXzOi1/
         Y1imEr5Xg0Q/oOZfi5jvEvZKnsYU1rHltfD/Xu3+PGOFLdp4UUWmkgRGsEh7E4gPiABT
         VDAjv/XQ36rN7AoIyQERCT5pEmm5BJ/6C9AfhrwfINM6GtIfshluuYoujzQ/gN5GpGa8
         ci/yDgXgtZXqockjchYss1VhX3F5Mp65LgmFJCzPBOdmxzxdmB83oHtTcr3sWQHUk3dw
         6PRFGgPM5S4Q8KkS4+kR1NZy81AGiR4+FZYXKhk2BdbCpYexjoJ8XTY5LlX0rci+TmX9
         SXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754314857; x=1754919657;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoFaB6hOuROgJRMYJzJYnA17731w5us9zWBdDSdGBXU=;
        b=gpGXgtMEZLC5U9RWZia9Df8SkTP2JsOxz3nmPRwisHUBwdKMpmxVHYK8KN3vNfRhdG
         n0wDN9xGHaH7Vbij3tO3jl/PTugmPQQ0rILpvHIYl7CghiYoPif8jjX5oahfnXz+SjWl
         aI1HxYrSGdmhJBUfMJ/Y2iPzlKtOA9Rcx6YkAGtDvBn0RyczyKFTfVQw2RALWFg80p7b
         F2azY72K0oFTLoJVSobsN3bFwwCeLAV/Wui8hfKl1/HMwXP9TOIY5mq4l4dR3Bxl4Tsm
         m6J+RpIz7kag6xWeTj2WBVYIZrAM63i457n+N2aN/V0dBdEVjcbk7KfBFarhhkr9znPG
         jwyg==
X-Forwarded-Encrypted: i=1; AJvYcCU2mPaYjmxVQ6boteylWqOAOacaPgfcleEtwr0KPk7FtoKXCkXkp//fLwrQOUBUmhXE0LVnXPysH+E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPSlmI0ZK8gB4qacpaECPGoGhpYBF0mJh0AV8NEhClbfTau3p8
	wSa9kx8oMUjRK/ToKC2SqBaodNGivwzExSgBX3uN5qeWMIPMYk8quJr2m4XIK6eK2w==
X-Gm-Gg: ASbGncsgms2M2x+PnlHQ82ijKQLXiyBAzts4H47Va4Ip3enMSWkF/eIIOpfC0OxnbNb
	7C8PwFKcbixUxzgoUGgDvejorOupK6rFRbWbic0cd9M8xBGjBGEQLjavgul8aqxtDYISNMC5I0D
	hKQLezugMoW+NYcfMvqWrERBYmNmiYali1LDmxN2fMGM5jwq2Sq49qscqzKjWFC5iirbOVQyDaY
	lQXBS784j820pZHTJWpUzDbU5o5OR6gOQCPfkxKx9deWBYNQa2atQTguN1q0MJLEUTsJgbfNYl7
	VtH9OB4K2vDfUziS6UX5+nxjepap8heioyuLD1wcv6pZwaew8xAabShbClNE6TL/lCRA0XWVCCk
	ml2+W+LH8oyosYA/RnUmnPfk1MfTK6QMQ3ua2PcMrex2tBfyBRrhUOW17HAyZf9LEsjjmCgazHk
	LwxI3I7ag=
X-Google-Smtp-Source: AGHT+IEPeWvAUILsdcqEOY+6AbHLE7TwVnkW5TKULyFG5VEPsaQ8onzppVWSq6FeGfYgOl/C4MPKUQ==
X-Received: by 2002:a17:906:478c:b0:ae6:f663:7232 with SMTP id a640c23a62f3a-af940258c08mr782419766b.61.1754314857116;
        Mon, 04 Aug 2025 06:40:57 -0700 (PDT)
Message-ID: <e1d00521-2a95-43bf-a5ea-61696d0c2023@suse.com>
Date: Mon, 4 Aug 2025 15:40:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] pdx: introduce a new compression algorithm based
 on region offsets
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250724110416.2081-1-roger.pau@citrix.com>
 <20250724110416.2081-8-roger.pau@citrix.com>
 <87c1a72d-62cf-475a-8320-70e1954cd0f5@suse.com>
 <aJCw0vS2rw2CXJqq@macbook.local>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <aJCw0vS2rw2CXJqq@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.08.2025 15:08, Roger Pau Monné wrote:
> On Tue, Jul 29, 2025 at 04:16:15PM +0200, Jan Beulich wrote:
>> On 24.07.2025 13:04, Roger Pau Monne wrote:
>>> --- a/xen/common/pdx.c
>>> +++ b/xen/common/pdx.c
>>> @@ -24,6 +24,7 @@
>>>  #include <xen/param.h>
>>>  #include <xen/pfn.h>
>>>  #include <xen/sections.h>
>>> +#include <xen/sort.h>
>>>  
>>>  /**
>>>   * Maximum (non-inclusive) usable pdx. Must be
>>> @@ -40,6 +41,12 @@ bool __mfn_valid(unsigned long mfn)
>>>  
>>>  #ifdef CONFIG_PDX_MASK_COMPRESSION
>>>      invalid |= mfn & pfn_hole_mask;
>>> +#elif defined(CONFIG_PDX_OFFSET_COMPRESSION)
>>> +{
>>> +    unsigned long base = pfn_bases[PFN_TBL_IDX(mfn)];
>>> +
>>> +    invalid |= mfn < base || mfn >= base + pdx_region_size;
>>
>> Leveraging wrapping, this could be simplified to
>>
>>     invalid |= mfn - base >= pdx_region_size;
>>
>> I think. Considering it's a frequently used path, doing so may be worthwhile.
> 
> I don't think that would work for all cases, take the following
> example:
> 
> PFN compression using lookup table shift 18 and region size 0x40000
>  range   0 [0000000280000, 00000002bffff] PFN IDX  10 : 0000000280000
> 
> If you pass mfn 0 to mfn_valid() with your proposed adjustment, the
> result of the subtraction would be:
> 
> 0 - ~0UL == 1
> 
> Which wouldn't satisfy the >= condition, and hence pfn 0 would be
> reported as a valid mfn.  I think we need to keep both sides of the
> check.

Hmm, right - I keep forgetting that the start of a pfn_bases[x] isn't necessarily
a valid page itself.

>>> +static void __init cf_check swp_node(void *a, void *b, size_t size)
>>> +{
>>> +    SWAP(a, b);
>>
>> This doesn't look right - you swap a and b, not what they point to.
>>
>>> +static bool __init pfn_offset_sanitize_ranges(void)
>>> +{
>>> +    unsigned int i = 0;
>>> +
>>> +    if ( nr_ranges == 1 )
>>> +    {
>>> +        ASSERT(PFN_TBL_IDX(ranges[0].base) ==
>>> +               PFN_TBL_IDX(ranges[0].base + ranges[0].size - 1));
>>
>> I think this points out a naming issue in patch 2: "base" and "size" look
>> as if these were address / byte count, when they're PFN / page count.
>> Which caught my eye because of the values being passed to something that
>> actually wants a PFN (and hence looked wrong at the first glance).
> 
> The struct name is pfn_range, I could rename the fields to base_pfn
> and pages or similar, but my impression was that the struct name was
> enough of a pointer that those are PFN ranges.

Problem being that the struct name isn't anywhere in sight here.

>  Do you have any
> alternative proposal about how to name those?

Your suggested new naming looks good to me.

>>> +        return true;
>>> +    }
>>> +
>>> +    while ( i + 1 < nr_ranges )
>>> +    {
>>> +        /*
>>> +         * Ensure ranges [start, end] use the same offset table index.  Should
>>> +         * be guaranteed by the logic that calculates the pfn shift.
>>> +         */
>>> +        if ( PFN_TBL_IDX(ranges[i].base) !=
>>> +             PFN_TBL_IDX(ranges[i].base + ranges[i].size - 1) ||
>>> +             PFN_TBL_IDX(ranges[i + 1].base) !=
>>> +             PFN_TBL_IDX(ranges[i + 1].base + ranges[i + 1].size - 1) )
>>
>> It feels a little odd to re-do the 2nd half of the checking here on the next
>> iteration, when the table wouldn't have changed when ...
>>
>>> +        {
>>> +            ASSERT_UNREACHABLE();
>>> +            return false;
>>> +        }
>>> +
>>> +        if ( PFN_TBL_IDX(ranges[i].base) != PFN_TBL_IDX(ranges[i + 1].base) )
>>> +        {
>>> +            i++;
>>> +            continue;
>>
>> ... taking this path. Could I talk you into moving the latter half ...
>>
>>> +        }
>>
>> ... here? If that's needed at all, as ...
>>
>>> +        /* Merge ranges with the same table index. */
>>> +        ranges[i].size = ranges[i + 1].base + ranges[i + 1].size -
>>> +                         ranges[i].base;
>>
>> ... the new range should also fulfill the requirement. Just that the last
>> such range then wouldn't be checked, unless ...
>>
>>> +        memmove(&ranges[i + 1], &ranges[i + 2],
>>> +                (nr_ranges - (i + 2)) * sizeof(ranges[0]));
>>> +        nr_ranges--;
>>> +    }
>>
>> ... that checking was put past the loop. Which then would allow to remove
>> the special casing of nr_ranges == 1 at the top of the function: You'd
>> uniformly check the ranges[nr_ranges - 1] here.	
> 
> What about doing it like:
> 
> static bool __init pfn_offset_sanitize_ranges(void)
> {
>     unsigned int i = 0;
> 
>     if ( PFN_TBL_IDX(ranges[0].base) !=
>          PFN_TBL_IDX(ranges[0].base + ranges[0].size - 1) )
>     {
>         ASSERT_UNREACHABLE();
>         return false;
>     }
> 
>     while ( i + 1 < nr_ranges )
>     {
>         /*
>          * Ensure ranges [start, end] use the same offset table index.  Should
>          * be guaranteed by the logic that calculates the pfn shift.
>          */
>         if ( PFN_TBL_IDX(ranges[i + 1].base) !=
>              PFN_TBL_IDX(ranges[i + 1].base + ranges[i + 1].size - 1) )
>         {
>             ASSERT_UNREACHABLE();
>             return false;
>         }
> 
>         if ( PFN_TBL_IDX(ranges[i].base) != PFN_TBL_IDX(ranges[i + 1].base) )
>         {
>             i++;
>             continue;
>         }
> 
>         /* Merge ranges with the same table index. */
>         ranges[i].size = ranges[i + 1].base + ranges[i + 1].size -
>                          ranges[i].base;
>         memmove(&ranges[i + 1], &ranges[i + 2],
>                 (nr_ranges - (i + 2)) * sizeof(ranges[0]));
>         nr_ranges--;
>     }
> 
>     return true;
> }
> 
> I've pulled the index 0 check ahead of the loop, which then covers for
> the case where nr_ranges == 1.  There's also no duplicate checking of
> the ranges, since the range at i + 1 will always be a non-checked one;
> either because the array has been shifted as a result of a range
> merging, or the index has been advanced.

Looks good, thanks.

>>> +        ranges[i].size = start + ranges[i].size - ranges[i].base;
>>> +        ranges[i - 1].size = ranges[i].base + ranges[i].size -
>>> +                             ranges[i - 1].base;
>>> +
>>> +        if ( i + 1 < nr_ranges )
>>> +            memmove(&ranges[i], &ranges[i + 1],
>>> +                    (nr_ranges - (i + 1)) * sizeof(ranges[0]));
>>> +        else /* last range */
>>> +            mask |= pdx_region_mask(ranges[i].base, ranges[i].size);
>>> +        nr_ranges--;
>>> +        i--;
>>> +    }
>>> +
>>> +    /*
>>> +     * Populate a mask with the non-equal bits of the different ranges, do this
>>> +     * to calculate the maximum PFN shift to use as the lookup table index.
>>> +     */
>>> +    for ( i = 0; i < nr_ranges; i++ )
>>> +        for ( unsigned int j = 0; j < nr_ranges; j++ )
>>> +            idx_mask |= (ranges[i].base & ~mask) ^ (ranges[j].base & ~mask);
>>> +
>>> +    if ( !idx_mask )
>>> +        /* Single region case. */
>>> +        pfn_index_shift = flsl(mask);
>>> +    else if ( flsl(idx_mask) - ffsl(idx_mask) < CONFIG_PDX_OFFSET_TBL_ORDER )
>>> +        /* The changed mask fits in the table index width. */
>>> +        pfn_index_shift = ffsl(idx_mask) - 1;
>>> +    else
>>> +        /* Changed mask is wider than array size, use most significant bits. */
>>> +        pfn_index_shift = flsl(idx_mask) - CONFIG_PDX_OFFSET_TBL_ORDER;
>>
>> Perhaps emit a log message here to indicate that bigger PDX_OFFSET_TBL_ORDER
>> may yield better results?
> 
> What about:
> 
> printk(XENLOG_DEBUG
>        "PFN compression table index truncated, requires order %u\n",
>        flsl(idx_mask) - ffsl(idx_mask) + 1);

Again, fine with me.

Jan

