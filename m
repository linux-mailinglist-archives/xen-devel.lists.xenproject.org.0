Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F43B14F23
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 16:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062768.1428498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugl89-0006k6-75; Tue, 29 Jul 2025 14:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062768.1428498; Tue, 29 Jul 2025 14:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugl89-0006hn-3z; Tue, 29 Jul 2025 14:16:37 +0000
Received: by outflank-mailman (input) for mailman id 1062768;
 Tue, 29 Jul 2025 14:16:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugl87-0006hh-KJ
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 14:16:35 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c9259a4-6c86-11f0-a31f-13f23c93f187;
 Tue, 29 Jul 2025 16:16:25 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b788feab29so1703302f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 07:16:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f6c8940sm7086905a12.59.2025.07.29.07.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 07:16:24 -0700 (PDT)
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
X-Inumbo-ID: 9c9259a4-6c86-11f0-a31f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753798585; x=1754403385; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg+ArqbA0/8Mg521AIaVwU05GgIfKPGj13QiGSTYp/U=;
        b=fQJJPVUiL37eQMaOk0ac7cNaU/SgEaYRh65R1hIj4HUoMlxLroQyANJ3RnvxHD1Kti
         i7sdeswZMk+vPSviUjrGjt4GUs88Qu0lUaNOyvWEZy/dIz8QEaYXAlCV92RrAq8SOC9a
         JD09vta5P7MBenQ2huHzCd0YTnCuuLokU25GnJ2swj12obfHgzV5WxCFRrk76dGLYx0F
         zTCrZARfuxD+4USfKFzJjT+eO8/vYHW71eGTD4KcVbJ87kH/eivRH5L+pUDgNI+J9SpJ
         iorllhbYXhzHrP5JfVsvhZgIMc2DUt2dNfbpoczfpBBAA4xKtWiKH8EQITc9CdOawRUs
         ipLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753798585; x=1754403385;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rg+ArqbA0/8Mg521AIaVwU05GgIfKPGj13QiGSTYp/U=;
        b=EzlffWxf/05wv+klf0LnEUFe3WT1kUyXwNUKwoorCgZw6JOQgmOUVQmX2BsNLO6C8b
         MHfvgO0lDmXxQPvBW6fmGTylU4m8345gRSpo9HZ70u6C8xuetc2u3GfXRemB26Q0jFLh
         k4+gGXq8cYmOnWkqJVLYuO3f7CNBsQH1Kz5tDvUL9HNgXRk7OoDIP/iMvYFtG8iF0hX4
         k/n1QXgFvOsKlNGu77ufg/jhuM3mFyff0zDCTFLRipGTs5QdX5Xrjdc4y0Hg/AqPlMfo
         qs/vIyPpXe9SEaWDLd5+aw5RSLs2I0L2lMFL4rN7eNRi2sEnNNfRAGHjWW7V2Ldf3Jp4
         jV7w==
X-Forwarded-Encrypted: i=1; AJvYcCXhnoat0MnInIdiBC/Qe5Dp7dc1N5lfIOgyt90AriKXfMasItbXDBMSZHHTq+8m3bLy3Oc4kV4lSCk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzokMKqS1TpjjXQC5lu/YLj7RPml+p97+VjmAu0sPT/Uwv7p/u6
	WWr2Gnz7TaA4kKxjZffaPx3xEZD7Hc+YwCwPwghIOwNO2iVdpDM7Z549R/jPEQcANQ==
X-Gm-Gg: ASbGncs0GaOCwu4fc+U+HpogACEBwCHgcHcZ+3uN5JBiM/Ae0o62TLBRJBNek6ha4UZ
	oBMBgwIVokN/oujSleqs13GDCFWR3/j3yuGxAEodRz+oOyFzPW9uG7cISPi4kCNbo0K1/1Ep3Bu
	nk5vWZH1vxwx81KuMLwpaFwGcJSNJEl0rFD7KtC+txN/mU/D1+NeJVQ+FqsiFvPR2cEk+Tmg1dz
	3pIh5EYRr7XHl3f1A/ou+FrOTBZXCk4OhQa4uF3mLoBdj7uhH0EASLK7KKCpGon6wsmmdWz68tN
	N919qC8zefUo/K+iO22gfhONg0JOyKIPL4MnP1TbVHFThYf50DOoLftzU/DJ0uYQ3eoCkPyiyAb
	6Q2miZt6ep32rtKJTDbnvIKRYy5oPt8Zwg021QmKD140E44KPtBuTQFFz2dPgszMTzuAZ/fzWbN
	XOE6ekavU=
X-Google-Smtp-Source: AGHT+IFpKDoEo83lRurGNHgW5F7aQNiBmSsv7I8czf9WumFxLOx8CozrjgUeld1GSDtX4ivQ0Bkh4Q==
X-Received: by 2002:a05:6000:144d:b0:3b7:58be:b0d with SMTP id ffacd0b85a97d-3b776664993mr13057879f8f.39.1753798585034;
        Tue, 29 Jul 2025 07:16:25 -0700 (PDT)
Message-ID: <87c1a72d-62cf-475a-8320-70e1954cd0f5@suse.com>
Date: Tue, 29 Jul 2025 16:16:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] pdx: introduce a new compression algorithm based
 on region offsets
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250724110416.2081-1-roger.pau@citrix.com>
 <20250724110416.2081-8-roger.pau@citrix.com>
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
In-Reply-To: <20250724110416.2081-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2025 13:04, Roger Pau Monne wrote:
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

Leveraging wrapping, this could be simplified to

    invalid |= mfn - base >= pdx_region_size;

I think. Considering it's a frequently used path, doing so may be worthwhile.

> @@ -75,6 +82,13 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
>  # error "Missing architecture maximum number of RAM ranges"
>  #endif
>  
> +/* Some functions should be init when not using PDX mask compression. */
> +#ifndef CONFIG_PDX_MASK_COMPRESSION
> +# define __init_or_pdx_mask __init
> +#else
> +# define __init_or_pdx_mask
> +#endif

Considering this is local to the CU, "pdx" in the name isn't very meaningful.
Instead it being a compression type may be, so how about __init_or_mask_compr
or some such? (If we gain further compression types, this may be getting
unwieldy anyway.)

> +static void __init cf_check swp_node(void *a, void *b, size_t size)
> +{
> +    SWAP(a, b);

This doesn't look right - you swap a and b, not what they point to.

> +static bool __init pfn_offset_sanitize_ranges(void)
> +{
> +    unsigned int i = 0;
> +
> +    if ( nr_ranges == 1 )
> +    {
> +        ASSERT(PFN_TBL_IDX(ranges[0].base) ==
> +               PFN_TBL_IDX(ranges[0].base + ranges[0].size - 1));

I think this points out a naming issue in patch 2: "base" and "size" look
as if these were address / byte count, when they're PFN / page count.
Which caught my eye because of the values being passed to something that
actually wants a PFN (and hence looked wrong at the first glance).

> +        return true;
> +    }
> +
> +    while ( i + 1 < nr_ranges )
> +    {
> +        /*
> +         * Ensure ranges [start, end] use the same offset table index.  Should
> +         * be guaranteed by the logic that calculates the pfn shift.
> +         */
> +        if ( PFN_TBL_IDX(ranges[i].base) !=
> +             PFN_TBL_IDX(ranges[i].base + ranges[i].size - 1) ||
> +             PFN_TBL_IDX(ranges[i + 1].base) !=
> +             PFN_TBL_IDX(ranges[i + 1].base + ranges[i + 1].size - 1) )

It feels a little odd to re-do the 2nd half of the checking here on the next
iteration, when the table wouldn't have changed when ...

> +        {
> +            ASSERT_UNREACHABLE();
> +            return false;
> +        }
> +
> +        if ( PFN_TBL_IDX(ranges[i].base) != PFN_TBL_IDX(ranges[i + 1].base) )
> +        {
> +            i++;
> +            continue;

... taking this path. Could I talk you into moving the latter half ...

> +        }

... here? If that's needed at all, as ...

> +        /* Merge ranges with the same table index. */
> +        ranges[i].size = ranges[i + 1].base + ranges[i + 1].size -
> +                         ranges[i].base;

... the new range should also fulfill the requirement. Just that the last
such range then wouldn't be checked, unless ...

> +        memmove(&ranges[i + 1], &ranges[i + 2],
> +                (nr_ranges - (i + 2)) * sizeof(ranges[0]));
> +        nr_ranges--;
> +    }

... that checking was put past the loop. Which then would allow to remove
the special casing of nr_ranges == 1 at the top of the function: You'd
uniformly check the ranges[nr_ranges - 1] here.	

> +    return true;
> +}
> +
> +bool __init pfn_pdx_compression_setup(paddr_t base)
> +{
> +    unsigned long mask = PFN_DOWN(pdx_init_mask(base)), idx_mask = 0;
> +    unsigned long size = 0;
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
> +        unsigned long start = ranges[i].base;
> +
> +        /*
> +         * Align range base to MAX_ORDER.  This is required so the PDX offset
> +         * for the bits below MAX_ORDER matches the MFN offset, and pages
> +         * greater than the minimal order can be used to populate the
> +         * directmap.
> +         */
> +        ranges[i].base = ranges[i].base & ~((1UL << MAX_ORDER) - 1);

Nit: Use "start" here?

> +        ranges[i].size = start + ranges[i].size - ranges[i].base;
> +
> +        /*
> +         * Only merge overlapped regions now, leave adjacent regions separated.
> +         * They would be merged later if both use the same index into the
> +         * lookup table.
> +         */
> +        if ( !i || ranges[i].base >= (ranges[i - 1].base + ranges[i - 1].size) )
> +        {
> +            /*
> +             * We might parse the region at position 0 more than once, as for
> +             * index 0 we don't attempt to merge to keep this simple.
> +             */
> +            mask |= pdx_region_mask(ranges[i].base, ranges[i].size);
> +            continue;

In how far is it relevant here that slot 0 may be looked at more than once?

> +        }
> +
> +        ranges[i - 1].size = ranges[i].base + ranges[i].size -
> +                             ranges[i - 1].base;
> +
> +        if ( i + 1 < nr_ranges )
> +            memmove(&ranges[i], &ranges[i + 1],
> +                    (nr_ranges - (i + 1)) * sizeof(ranges[0]));
> +        else /* last range */
> +            mask |= pdx_region_mask(ranges[i].base, ranges[i].size);
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
> +            idx_mask |= (ranges[i].base & ~mask) ^ (ranges[j].base & ~mask);
> +
> +    if ( !idx_mask )
> +        /* Single region case. */
> +        pfn_index_shift = flsl(mask);
> +    else if ( flsl(idx_mask) - ffsl(idx_mask) < CONFIG_PDX_OFFSET_TBL_ORDER )
> +        /* The changed mask fits in the table index width. */
> +        pfn_index_shift = ffsl(idx_mask) - 1;
> +    else
> +        /* Changed mask is wider than array size, use most significant bits. */
> +        pfn_index_shift = flsl(idx_mask) - CONFIG_PDX_OFFSET_TBL_ORDER;

Perhaps emit a log message here to indicate that bigger PDX_OFFSET_TBL_ORDER
may yield better results?

> +    /*
> +     * Ensure correctness of the calculated values, plus merge ranges if they
> +     * use the same lookup table index.
> +     */
> +    if ( !pfn_offset_sanitize_ranges() )
> +    {
> +        printk(XENLOG_DEBUG "PFN compression is invalid, disabling\n");
> +        pfn_pdx_compression_reset();
> +        return false;
> +    }
> +
> +    /*
> +     * Find the maximum PFN range size after having merged ranges with same
> +     * index.  The rounded up region size will be the base for the PDX region
> +     * size and shift.
> +     */
> +    for ( i = 0; i < nr_ranges; i++ )
> +        size = max(size, ranges[i].size);
> +
> +    /* pdx_init_mask() already takes MAX_ORDER into account. */
> +    mask = PFN_DOWN(pdx_init_mask(size << PAGE_SHIFT));

We're in arch-neutral code here, so I think you need to cast size to paddr_t
before shifting.

Jan

