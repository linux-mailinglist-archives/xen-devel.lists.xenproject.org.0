Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8908B1B366
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 14:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070440.1434061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujGmJ-00070G-Ie; Tue, 05 Aug 2025 12:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070440.1434061; Tue, 05 Aug 2025 12:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujGmJ-0006yH-G1; Tue, 05 Aug 2025 12:28:27 +0000
Received: by outflank-mailman (input) for mailman id 1070440;
 Tue, 05 Aug 2025 12:28:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujGmI-0006yB-3W
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 12:28:26 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae76525e-71f7-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 14:28:24 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-af8fd1b80e5so935171266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 05:28:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a396fsm906642366b.42.2025.08.05.05.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 05:28:23 -0700 (PDT)
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
X-Inumbo-ID: ae76525e-71f7-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754396904; x=1755001704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2dILoKVZw5TTo0oIiaOohymGY2Ci/GHh64XXIotbLlw=;
        b=BpASL/JiSbxzAfvX0wtUKqTCj/9ThPFk6mOR7TzG6xaZ/M+/z+MxlDehDBqcs44HEG
         Ri9HccW3Us1hmDAHA8zY2HM6g43MTD3sD0+V/XuThGzEyKIn8TKmxAzmXWN7MCJbRQqh
         7cjvLqZP0S7nhSrhv2qUeub80QUhSczLilh3x9TnsLse+zgEQwDclEsCy5U8VJFcGpt9
         zjEl2gAqeZ75Sn8mfJL6bnxor8sHnWLdMTWK7S05bflfacR5NQ+ZNAtURDYzKDZw7DQc
         onMZZ3Q0DaRUgo35t8nfcfi1lAPecDMZGF0pp9H6JlKqN26mKr27C7OEC1v1iL12n5qR
         PL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754396904; x=1755001704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dILoKVZw5TTo0oIiaOohymGY2Ci/GHh64XXIotbLlw=;
        b=tRxB5dMtX7kePI1WFu7XupITRPpebsH9vsy70PeDHYf/2HVkPVuBueM7YpkYpCjAcQ
         aRtDPX3kPziiR3kYdow5Xv5B/Jz2V0FF0gZ5qVbQrXPX9a5ZXnBdPRx+slZDh0ht2GiU
         bBFhfMkZMVyYfAx06f6jFiZ6OWSJmPkz5taUcrin86Iol8E3A/DNaUFkBJWFElaBx7Di
         MKtnFiRtwdajvO9uBlTGgEajDeU/BL6rFu9oqfFpP1Dql93Ccv0jLhcRMZ3KG2gb317m
         r2a2I/FNTLuNY5BctPdyiCsDdop+XKpGF8QkwrIBwrK7fJd5HIXeMOcGuUG7ucb6Wmyf
         B+mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH3/pXAl6CbkHKT+oAMcU2UpdypnmjBtEYshW4ASnZZju7hNvH5m0WiuUC+tKIAyc2A5VY1dwUgt4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygRL4tAVAGygxmHlsxdWwRG+SwJ6dyfOiERhxYeP4kB7hTAHSe
	5Mv+HYH56YX4utWNSTrRD2cjl6aD1/y12WpHTYGMNIhpJkd+NyupVSp08quwVq/TAA==
X-Gm-Gg: ASbGnctYfzYQQlEdWTctZepAiXv0MtYLFCOaV/KQrAg9oUBobde6vaPjysOe9GWbDO1
	TR8GmkJbWnliZI4hk6+3vyNEaG5A0ItnMDfoynHgDGg8RSqPklnN+KL9xCoeAwTVIvt01IAqKiL
	IexRhN3aPhlm7xcHPbJlp9limMeq+3vo7TeESzzRiPwU2r8HDTBl9DpEUVxrQjusQuNNHiZcCZR
	jCKJIdHp04mYB3Wk/ayBb7etADiTVFqxTmxkPybM6RmXODjVwlgDlmVdy9kqK8MngYJ8CMme0Lf
	tbq4VjNtdP1rWFQymgXInmpbKrtl4SNj4c2N8SlKFFMLnZESZMTIpCf/JcFxe9qoyxIvqbvU5RL
	02kJiULyRodlZKlbn2/z6iYk5ALEWpIHxXxNJAkGZXC2RRPSz7WFS9gasS8OT3nk1TuKBAy92w2
	y4ikxNch0hYnV+d8tABg==
X-Google-Smtp-Source: AGHT+IH9cltE5RJWEcrG6RwjH0DwqcVqFIfmq7UWLLQpXeHD2Z4QuIPIIKa3Yajevuhrq6buqSfn8Q==
X-Received: by 2002:a17:907:2dac:b0:ae3:6705:8918 with SMTP id a640c23a62f3a-af940211a3emr1390422766b.49.1754396904065;
        Tue, 05 Aug 2025 05:28:24 -0700 (PDT)
Message-ID: <50aa7098-3777-43b2-8217-0b836a3c8879@suse.com>
Date: Tue, 5 Aug 2025 14:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] pdx: introduce a new compression algorithm based
 on region offsets
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250805095257.74975-1-roger.pau@citrix.com>
 <20250805095257.74975-8-roger.pau@citrix.com>
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
In-Reply-To: <20250805095257.74975-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.08.2025 11:52, Roger Pau Monne wrote:
> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -24,6 +24,7 @@
>  #include <xen/param.h>
>  #include <xen/pfn.h>
>  #include <xen/sections.h>
> +#include <xen/sort.h>
>  
>  /**
>   * Maximum (non-inclusive) usable pdx. Must be
> @@ -40,6 +41,12 @@ bool __mfn_valid(unsigned long mfn)
>  
>  #ifdef CONFIG_PDX_MASK_COMPRESSION
>      invalid |= mfn & pfn_hole_mask;
> +#elif defined(CONFIG_PDX_OFFSET_COMPRESSION)
> +{
> +    unsigned long base = pfn_bases[PFN_TBL_IDX(mfn)];
> +
> +    invalid |= mfn < base || mfn >= base + pdx_region_size;
> +}
>  #endif

Hmm, didn't notice this earlier on: Brace placement looks odd here. I think
they want to be indented by one level, as they aren't starting a function
body.

> @@ -294,7 +308,245 @@ void __init pfn_pdx_compression_reset(void)
>      nr_ranges = 0;
>  }
>  
> -#endif /* CONFIG_PDX_COMPRESSION */
> +#elif defined(CONFIG_PDX_OFFSET_COMPRESSION) /* CONFIG_PDX_MASK_COMPRESSION */
> +
> +unsigned int __ro_after_init pfn_index_shift;
> +unsigned int __ro_after_init pdx_index_shift;
> +
> +unsigned long __ro_after_init pfn_pdx_lookup[CONFIG_PDX_NR_LOOKUP];
> +unsigned long __ro_after_init pdx_pfn_lookup[CONFIG_PDX_NR_LOOKUP];
> +unsigned long __ro_after_init pfn_bases[CONFIG_PDX_NR_LOOKUP];
> +unsigned long __ro_after_init pdx_region_size = ~0UL;

For cache locality, might this last one better also move ahead of the arrays?

> +bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
> +{
> +    unsigned long pfn = PFN_DOWN(base);
> +    unsigned long pfn_base = pfn_bases[PFN_TBL_IDX(pfn)];
> +
> +    return pfn >= pfn_base &&
> +           pfn + npages <= pfn_base + pdx_region_size;
> +}
> +
> +static int __init cf_check cmp_node(const void *a, const void *b)
> +{
> +    const struct pfn_range *l = a;
> +    const struct pfn_range *r = b;
> +
> +    if ( l->base_pfn > r->base_pfn )
> +        return 1;
> +    if ( l->base_pfn < r->base_pfn )
> +        return -1;
> +
> +    return 0;
> +}
> +
> +static void __init cf_check swp_node(void *a, void *b)
> +{
> +    SWAP(a, b);
> +}

This hasn't changed from v3, and still looks wrong to me.

> +bool __init pfn_pdx_compression_setup(paddr_t base)
> +{
> +    unsigned long mask = PFN_DOWN(pdx_init_mask(base)), idx_mask = 0;
> +    unsigned long pages = 0;
> +    unsigned int i;
> +
> +    if ( !nr_ranges )
> +    {
> +        printk(XENLOG_DEBUG "PFN compression disabled%s\n",
> +               pdx_compress ? ": no ranges provided" : "");
> +        return false;
> +    }
> +
> +    if ( nr_ranges > ARRAY_SIZE(ranges) )
> +    {
> +        printk(XENLOG_WARNING
> +               "Too many PFN ranges (%u > %zu), not attempting PFN compression\n",
> +               nr_ranges, ARRAY_SIZE(ranges));
> +        return false;
> +    }
> +
> +    /* Sort ranges by start address. */
> +    sort(ranges, nr_ranges, sizeof(*ranges), cmp_node, swp_node);
> +
> +    for ( i = 0; i < nr_ranges; i++ )
> +    {
> +        unsigned long start = ranges[i].base_pfn;
> +
> +        /*
> +         * Align range base to MAX_ORDER.  This is required so the PDX offset
> +         * for the bits below MAX_ORDER matches the MFN offset, and pages
> +         * greater than the minimal order can be used to populate the
> +         * directmap.
> +         */
> +        ranges[i].base_pfn = start & ~((1UL << MAX_ORDER) - 1);
> +        ranges[i].pages = start + ranges[i].pages - ranges[i].base_pfn;
> +
> +        /*
> +         * Only merge overlapped regions now, leave adjacent regions separated.
> +         * They would be merged later if both use the same index into the
> +         * lookup table.
> +         */
> +        if ( !i ||
> +             ranges[i].base_pfn >=
> +             (ranges[i - 1].base_pfn + ranges[i - 1].pages) )
> +        {
> +            mask |= pdx_region_mask(ranges[i].base_pfn, ranges[i].pages);
> +            continue;
> +        }
> +
> +        ranges[i - 1].pages = ranges[i].base_pfn + ranges[i].pages -
> +                              ranges[i - 1].base_pfn;
> +
> +        if ( i + 1 < nr_ranges )
> +            memmove(&ranges[i], &ranges[i + 1],
> +                    (nr_ranges - (i + 1)) * sizeof(ranges[0]));
> +        else /* last range */
> +            mask |= pdx_region_mask(ranges[i].base_pfn, ranges[i].pages);
> +        nr_ranges--;
> +        i--;
> +    }
> +
> +    /*
> +     * Populate a mask with the non-equal bits of the different ranges, do this
> +     * to calculate the maximum PFN shift to use as the lookup table index.
> +     */
> +    for ( i = 0; i < nr_ranges; i++ )
> +        for ( unsigned int j = 0; j < nr_ranges; j++ )
> +            idx_mask |= (ranges[i].base_pfn & ~mask) ^
> +                        (ranges[j].base_pfn & ~mask);

"mask" is loop invariant - can't the AND-ing be pulled out, after the loop?
Further, isn't it sufficient for the inner loop to start from i + 1?

Jan

