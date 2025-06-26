Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A25AAE96E6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 09:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025951.1401231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUh8q-0002SW-AR; Thu, 26 Jun 2025 07:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025951.1401231; Thu, 26 Jun 2025 07:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUh8q-0002PP-7n; Thu, 26 Jun 2025 07:35:28 +0000
Received: by outflank-mailman (input) for mailman id 1025951;
 Thu, 26 Jun 2025 07:35:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUh8o-0002PJ-Of
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 07:35:26 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a1f95ad-5260-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 09:35:15 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so457184f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 00:35:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34c4445c3fsm1011796a12.47.2025.06.26.00.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 00:35:14 -0700 (PDT)
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
X-Inumbo-ID: 1a1f95ad-5260-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750923315; x=1751528115; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6zYxkOur4MvGv2/d/SZXTfsE80BS0nzVwbTD6CeT38M=;
        b=f9oZCKqple9uGsJ25E1hcVnlfkfvwa+jHNkRR6GryJANi18+lUMiEGBS8jRP74h/Z9
         lvudEHNPaauaLdo7s/sDW4dmvkUNXinOocQkW3YBDF77S77nyGItJooIui7TWy7lI6sT
         jikmzomowXvX8CJ7K8+5VCOm8nyQ0vnSTYBZKxXdKXoDZQk22mkKJfUstYSI2J21avpR
         YSVmn4EK0891ekrvzU8QHk5DSTKpvSDPFSY7BJ7W6nHMpcjXIuLnwhilLPfqlVi/kkPV
         hDV324r2KdZWAoxyu3m3Zub/y8NCHUh/9wvMwJuou5WUdppJ7zLhmNULm4UlAhE0xSna
         5MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750923315; x=1751528115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zYxkOur4MvGv2/d/SZXTfsE80BS0nzVwbTD6CeT38M=;
        b=UJPLXDhIO2zDcsVdM6bXOv82llKkAA6NmkaNi7vtQpctIw+bl5k/P0ygwNKkOpIUPN
         94p2sn9UxWqUC+sbHnsUJYPaNKyROnDwDdJFmV3d+XaPcMTHvGYt4NjjYo3l6Ne5YmR1
         IDhVT7owKgO6DiLjMKiv4A0vnGRFYGTqeFjJzenyaLlfWTN0pYtSXeD773JfsrA14DZf
         8Csi9WSH6ucMdP1gRCjHq++52yWjb1dsbpmiW37GCIMKCL8u0RHLR57TEYkdu6FagQkK
         b1a69TBlBCttB8Ibi0Q4iyq/5oxwNIdCVB10waYhtVKhnH1eYMhBLwrr+xuO5r0GTTvW
         LjqA==
X-Forwarded-Encrypted: i=1; AJvYcCXmUTgJ3EJ56OI+Oae6KyGkf6X2WBXtCxlvxPjEWnmADmjb/jsddJeYfyFmYDPP4ZSgMvUwPobk4n4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJzcG4ro6E1jO4ew8y6p+WDgob+PZ+q04yAO3UoOpUDxLbN90r
	MEj0pAAVcSZU4YC0+IF6J6ktHvdbDElPSdphn1McHr462NganEXQh2BBTh7vMv/TGw==
X-Gm-Gg: ASbGncvG31/4W9PiwXM/GJcrmNXDHwOUebsGg4+HDb4ebysPQ9w16bP706MaWtIySr+
	oGWV40B5o7VuONB6Wf1R4KR4yaxFScb9+1suhgR83b/iIJZvI/QX68WBtnbkpHe5+ijA35IsxcH
	m9m39FuJXNYAgwj8TEjt96yR6hCCgsZFhGV15R3+ijcomrlo0rw/mqjgf3ucBJ2lQg/KY522eFh
	okz+I8tIeGkrM5xZARsrLLOf2bHfuhltzCYCl9iL6ghxTRctSRX2BIgSG/FnyUG7volhTnmTPOx
	CJ3x28BVdXafH5OjD6OwbnMD6LFJ7OSDlW3/kG+CcNkhXYWeVP9XMSOt0M6ks3TkA5Mw/4G1m9s
	TZVDZVyTSzf0I5f+anNVeHLTyaI+vsseAeHHWKQc4lswQB1avNimyN0Sajg==
X-Google-Smtp-Source: AGHT+IH8/54ih4C497dd3H3sXoY0rCkhXerZadzbLUSNTjtA3LGQ+uIY+SJgEUbTBGySHsawrcYBwg==
X-Received: by 2002:a05:6000:1acd:b0:3a0:aed9:e34 with SMTP id ffacd0b85a97d-3a6ed66e377mr5580843f8f.48.1750923315084;
        Thu, 26 Jun 2025 00:35:15 -0700 (PDT)
Message-ID: <475fb02b-0b00-4aab-b73c-9604fe050074@suse.com>
Date: Thu, 26 Jun 2025 09:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] pdx: introduce a new compression algorithm based
 on region offsets
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-9-roger.pau@citrix.com>
 <e0339b2b-86cd-45ad-9b6f-a5e8ddbc623c@suse.com>
 <aFwish8zET1W6-CC@macbook.local>
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
In-Reply-To: <aFwish8zET1W6-CC@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.06.2025 18:24, Roger Pau Monné wrote:
> On Tue, Jun 24, 2025 at 06:16:15PM +0200, Jan Beulich wrote:
>> On 20.06.2025 13:11, Roger Pau Monne wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -54,7 +54,8 @@ config EVTCHN_FIFO
>>>  
>>>  choice
>>>  	prompt "PDX (Page inDeX) compression"
>>> -	default PDX_MASK_COMPRESSION if !X86 && !RISCV
>>> +	default PDX_OFFSET_COMPRESSION if X86
>>> +	default PDX_MASK_COMPRESSION if !RISCV
>>>  	default PDX_NONE
>>>  	help
>>>  	  PDX compression is a technique designed to reduce the memory
>>> @@ -73,12 +74,30 @@ config PDX_MASK_COMPRESSION
>>>  	help
>>>  	  Compression relying on all RAM addresses sharing a zeroed bit region.
>>>  
>>> +config PDX_OFFSET_COMPRESSION
>>> +	bool "Offset compression"
>>> +	help
>>> +	  Compression relying on size and distance between RAM regions being
>>> +	  compressible using an offset lookup table.
>>> +
>>>  config PDX_NONE
>>>  	bool "None"
>>>  	help
>>>  	  No compression
>>>  endchoice
>>>  
>>> +config PDX_OFFSET_TLB_ORDER
>>
>> Please can we avoid the term "TLB" in the name? What we commonly call a TLB
> 
> It should have been TBL_ORDER, not TLB.  My finger memory is too use
> to type TLB I think.
> 
>> is somewhat different. In fact is there anything wrong with just
>> PDX_OFFSET_ORDER?
> 
> I've assumed that would be seen as too short and not descriptive
> enough.  If that's fine I will switch it.

Oh, TBL is fine with me. And perhaps indeed better, for being more precise.

>>> +	int "PDX offset compression lookup table order" if EXPERT
>>> +	depends on PDX_OFFSET_COMPRESSION
>>> +	default 6
>>> +	range 0 9
>>
>> Is 0 really a sensible lower bound? There's not going to be any compression
>> then, I suppose?
> 
> No, you can still compress a single range if start if offset from 0.
> See the following example in the test file:
> 
> /* Single range not starting at 0. */
> {
>     .ranges = {
>         { .start = (1 << MAX_ORDER) * 10,
>           .end   = (1 << MAX_ORDER) * 11 },
>     },
>     .compress = true,
> },
> 
> Which results in:
> 
> PFN compression using PFN lookup table shift 63 and PDX region size 0x40000
>  range 0 [0x00000280000, 0x000002bffff] PFN IDX   0 : 0x00000280000

Oh, indeed. But: Does this actually work? I'm not only slightly concerned
of PDX 0 (that may indeed be fine), but more as to mfn_valid(). An MFN below
the start of that region will still use index 0, aiui. (With the resulting
underflow, a huge PDX will result.) With PDX_TBL_MASK being zero, and with
there being only a single entry in both tables, the reverse translation will
use that single entry, simply undoing the underflowed subtraction. Hence
mfn_valid() would wrongly return true, afaict. (Thinking about it, the same
issue would appear to occur for MFNs above the sum of that range's start and
the region size.)

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
>>> @@ -40,6 +41,8 @@ bool __mfn_valid(unsigned long mfn)
>>>  
>>>  #ifdef CONFIG_PDX_MASK_COMPRESSION
>>>      invalid |= mfn & pfn_hole_mask;
>>> +#elif defined(CONFIG_PDX_OFFSET_COMPRESSION)
>>> +    invalid |= mfn ^ pdx_to_pfn(pfn_to_pdx(mfn));
>>
>> Hmm, that's pretty expensive already. Involving two (presumably back-to-back)
>> JMPs when compression isn't enabled.
> 
> There's a conditional with evaluate_nospec() below, so I think the
> JMPs are unlikely to make much difference?

Hard to tell. They still take up decode bandwidth and at least some execution
resources, aiui. But perhaps you're right and that's indeed negligible, or at
least acceptable enough. Especially since, ...

>  Otherwise I would need to
> check the index in the lookup table, and possibly introduce a new
> variable to store the PDX region size to ensure it also fits in there.
> 
> Overall I think it's more complex for possibly little benefit given
> the current code in mfn_valid() anyway.

... as you say, complexity would grow.

>>> +bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
>>> +{
>>> +    unsigned long pfn = PFN_DOWN(base);
>>> +
>>> +    return pdx_to_pfn(pfn_to_pdx(pfn) + npages - 1) == (pfn + npages - 1);
>>
>> Aiui for this to be correct, there need to be gaps between the ranges
>> covered by individual lookup table slots. In the setup logic you have a
>> check commented "Avoid compression if there's no gain", but that doesn't
>> look to guarantee gaps everywhere (nor would pfn_offset_sanitize_ranges()
>> appear to)?
> 
> But if there are no gaps, the full region is covered correctly, and
> hence it's compressible?

If there's a guarantee that such ranges would be folded into a single one,
all would be fine.

> Maybe I'm missing something, could you maybe provide an example that
> would exhibit this issue?

My understanding is that when there's no gap between regions, and when
[base, base + npages) crosses as region boundary, then the expression
above will yield true when, because of crossing a region boundary, it
ought to be false. Or did I simply misunderstand the purpose of the
pdx_is_region_compressible() invocations?

>>> +    if ( nr_ranges > ARRAY_SIZE(ranges) )
>>> +    {
>>> +        printk(XENLOG_WARNING
>>> +               "Too many PFN ranges (%u > %zu), not attempting PFN compression\n",
>>> +               nr_ranges, ARRAY_SIZE(ranges));
>>> +        return false;
>>> +    }
>>> +
>>> +    for ( i = 0; i < nr_ranges; i++ )
>>> +        mask |= pdx_region_mask(ranges[i].base, ranges[i].size);
>>> +
>>> +    pfn_index_shift = flsl(mask);
>>
>> With this ...
>>
>>> +    /*
>>> +     * Increase the shift as much as possible, removing bits that are equal in
>>> +     * all regions, as this allows the usage of smaller indexes, and in turn
>>> +     * smaller lookup tables.
>>> +     */
>>> +    for ( pfn_index_shift = flsl(mask); pfn_index_shift < sizeof(mask) * 8 - 1;
>>
>> ... you don't need to do this here another time.
> 
> Oh, good catch.  This was ordered differently, and I didn't realize
> the duplication after the code movement.
> 
>> Also - why the subtraction of 1 in what the shift is compared against? Logic
>> below should in principle guarantee we never exit the loop because of the
>> conditional above, but if we made it that far it looks like we could as well
>> also look at the top bit.
> 
> Because for a single range this would otherwise end up with
> pfn_index_shift == 64, and thus lead to undefined behavior.

Hmm, right. Yet then isn't this another reason you need at least two array slots?
At least in the (theoretical) case of paddr_bits == 64? Which raises the question
whether the loop wouldn't better be bounded by paddr_bits anyway.

>>> +          pfn_index_shift++ )
>>> +    {
>>> +        const unsigned long bit = ranges[0].base & (1UL << pfn_index_shift);
>>> +
>>> +        for ( i = 1; i < nr_ranges; i++ )
>>> +            if ( bit != (ranges[i].base & (1UL << pfn_index_shift)) )
>>> +                break;
>>> +        if ( i != nr_ranges )
>>> +            break;
>>> +    }
>>> +
>>> +    /* Sort and sanitize ranges. */
>>> +    if ( !pfn_offset_sanitize_ranges() )
>>> +        return false;
>>> +
>>> +    /* Calculate PDX region size. */
>>> +    for ( i = 0; i < nr_ranges; i++ )
>>> +        size = max(size, ranges[i].size);
>>> +
>>> +    mask = PFN_DOWN(pdx_init_mask(size << PAGE_SHIFT));
>>> +    pdx_index_shift = flsl(mask);
>>> +
>>> +    /* Avoid compression if there's no gain. */
>>> +    if ( (mask + 1) * (nr_ranges - 1) >= ranges[nr_ranges - 1].base )
>>> +        return false;
>>> +
>>> +    /* Poison all lookup table entries ahead of setting them. */
>>> +    memset(pfn_pdx_lookup, ~0, sizeof(pfn_pdx_lookup));
>>> +    memset(pdx_pfn_lookup, ~0, sizeof(pfn_pdx_lookup));
>>
>> Have the arrays have initializers instead?
> 
> No, because otherwise early use (before the initialization done here)
> of the translation functions would give bogus results.

Isn't that true anyway? Before making it here, PDX and PFN have a fixed
(and hence wrong) relationship for the entire number space. And mfn_valid()
would yield true for any input no matter what the initializer, afaict. IOW
early uses look to be invalid anyway.

(Later) Oh, wait - your comment on pfn_pdx_compression_reset() made me
understand: We rely on identity mapping PDX <-> PFN if compression is
disabled, at least until alternatives patching arranges to bypass the
calculations.

>>> +           pfn_index_shift, mask + 1);
>>> +
>>> +    for ( i = 0; i < nr_ranges; i++ )
>>> +        printk(XENLOG_DEBUG
>>> +               " range %u [%#013lx, %#013lx] PFN IDX %3lu : %#013lx\n",
>>> +               i, ranges[i].base, ranges[i].base + ranges[i].size - 1,
>>> +               PFN_TBL_IDX(ranges[i].base),
>>> +               pfn_pdx_lookup[PFN_TBL_IDX(ranges[i].base)]);
>>
>> Do you really mean this to stay active also in release builds?
> 
> I had it guarded with #ifdef CONFIG_DEBUG initially, but later decided
> it was worth giving the possibility to print it in release builds if
> debug log level is selected.
> 
>> Also the outcome of the earlier loop isn't used by the intermediate printk().
>> Perhaps join both loops, thus allowing idx to be re-used here?
> 
> Hm, yes.  I wanted to first print the message about enabling PFN
> compression, and later the compression specific information.  I can
> move the message about enabling PFN compression ahead of the loop.

But that's not what I meant. You can move the body of the earlier loop
into the later one, since - as said - the printk() between the two loops
doesn't use what the first loop does.

>>> --- a/xen/include/xen/pdx.h
>>> +++ b/xen/include/xen/pdx.h
>>> @@ -65,6 +65,43 @@
>>>   * This scheme also holds for multiple regions, where HHHHHHH acts as
>>>   * the region identifier and LLLLLL fully contains the span of every
>>>   * region involved.
>>> + *
>>> + * ## PDX offset compression
>>> + *
>>> + * Alternative compression mechanism that relies on RAM ranges having a similar
>>> + * size and offset between them:
>>> + *
>>> + * PFN address space:
>>> + * ┌────────┬──────────┬────────┬──────────┐   ┌────────┬──────────┐
>>> + * │ RAM 0  │          │ RAM 1  │          │...│ RAM N  │          │
>>> + * ├────────┼──────────┼────────┴──────────┘   └────────┴──────────┘
>>> + * │<------>│          │
>>> + * │  size             │
>>> + * │<----------------->│
>>> + *         offset
>>> + *
>>> + * The compression reduces the holes between RAM regions:
>>> + *
>>> + * PDX address space:
>>> + * ┌────────┬───┬────────┬───┐   ┌─┬────────┐
>>> + * │ RAM 0  │   │ RAM 1  │   │...│ │ RAM N  │
>>> + * ├────────┴───┼────────┴───┘   └─┴────────┘
>>> + * │<---------->│
>>> + *   pdx region size
>>> + *
>>> + * The offsets to convert from PFN to PDX and from PDX to PFN are stored in a
>>> + * pair of lookup tables, and the index into those tables to find the offset
>>> + * for each PFN or PDX is obtained by shifting the to be translated address by
>>> + * a specific value calculated at boot:
>>> + *
>>> + * pdx = pfn - pfn_lookup_table[pfn >> pfn_shift]
>>> + * pfn = pdx + pdx_lookup_table[pdx >> pdx_shift]
>>
>> I assume it's intentional (for simplicity) that you omit the index masking
>> here?
> 
> Indeed.  I can add it, but I think the point here is to explain the
> algorithm used in a clear way, without implementation details.  I would
> consider the masking one of such implementation details.

I see. It's the balancing between simplicity and making the reader (wrongly)
suspect a possible array overrun here (as it happened in my case). Maybe
keep the expressions as they are, but add a few words towards masking in the
text?

Jan

