Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E5DB1A2D1
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 15:09:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069368.1433228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiuvu-0006Lz-I0; Mon, 04 Aug 2025 13:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069368.1433228; Mon, 04 Aug 2025 13:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiuvu-0006JG-F6; Mon, 04 Aug 2025 13:08:54 +0000
Received: by outflank-mailman (input) for mailman id 1069368;
 Mon, 04 Aug 2025 13:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEzl=2Q=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uiuvt-0006J9-KU
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 13:08:53 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23ecdedd-7134-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 15:08:40 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4563a57f947so17252435e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 06:08:40 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3b95f4sm15435084f8f.23.2025.08.04.06.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 06:08:38 -0700 (PDT)
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
X-Inumbo-ID: 23ecdedd-7134-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754312920; x=1754917720; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MSIZhFSRoFRHF6QoEa7m5+whRac4naGoL1s/P59JX60=;
        b=uOBSyMoy5d/6LMm+wF4D07MaHRxeA2Z1Id3ZtVua70bkNDp1yxd9jj3vczqSWZtDbB
         sfg/pRPC1QgmdD5IqAKPAl6mm/OeOL5uwTPUFii1+QtiIx32vd6kyrHQgo9X9i8CGVGZ
         y7xIl5GhBpYGPPS6ijBDQjKMvkmzxYnYzH0DM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754312920; x=1754917720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSIZhFSRoFRHF6QoEa7m5+whRac4naGoL1s/P59JX60=;
        b=cZR/K7JJ2tyV/0o4+qw3at/mUWhQZYvsWb5j5GRQsuV+3rXrcMRrp+bI5yyGZR7u8F
         5j99cZAPcfrtyCWEpz/yRpIWYkF8ogD22rbh22uzIKXZdEzX4ZNnD0EgMgVHchBxHr1A
         2BROkWG1Sp3s8fkURrRgMLj1eLo//xfdxpqvgVjTdehr0iUBk6PvZM255LSFdoiEQ+r6
         5Lh/PHWM8p/y6CELoH6OAnaOgPFFI6TfTIdk1FfBVWxI8ql/UuwD/xC0aFb1zZRXWbcy
         RUYm/Ux5sMJaTVZEgON6BVklTWrAgwm5i6bahT1ucKF5a0PpJSIHGFjJxtDHqrZXSYQX
         zQsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMzxNtYEyov9HFFUpx2rlHD16X42P9sDHuFxTUpmlCzdIbyrvCd9uGcvATp7NtN9A8lVmeYF42o48=@lists.xenproject.org
X-Gm-Message-State: AOJu0YylXxwJlG0GyIb1cv/qNpDuRJ3ldt3mc6GYGAoQB1PkXElciGje
	mn0FBRMH+Aj9YnnVqyyj7pvc24i7d9fFof4hJi01nU92rw6VEtuopsB2ur90bkYaVpE=
X-Gm-Gg: ASbGncuMq/cD7IlKPEjVD54TsNFAkIuSlh58NfRD2Nup50kQT4slMneZMGiRZefvK6t
	/whD/O3AVftAOZomU7g9lxkbGfQOYvQgHlwM3nVRj2BvoxfdzV6CP/AJ/9sN11iZq7QBwPR24Xj
	TwdW+tcR/7ts6vIt1XUfFM/wuTkbIg7GleKZtUFRKuP90NqWunZ9M3bqCKIaTAzN1dAUJdkxAts
	uCNqLqbw6lhnPzkoufB+/AZ1mHpTVFSqG59sYQb5jE8nVpwryC5llgPVE4vbgHqbDby+xtT8NaH
	SnChUytFtGjNI3AgvYG0w9Pw6x3BsmufI5Yg3jFgmckrcYEF0sa3IWvzg1tzb+XA1Xb7CXasGuG
	CofagEI0Q5kWg/aGtiTTPcKDgce5NuEeU19Xbkf6IkiFV2/y3D6LPWfu1gX8urN2R0h0HfJL7Aa
	RD
X-Google-Smtp-Source: AGHT+IGEs83Uj2/oRUpsAQ5N8R7Z63h/wcWyNwoTmH7LL4cVINCAZioNaJR54yJf3n7th86hOSO7wg==
X-Received: by 2002:a05:600c:46d3:b0:456:21f4:a0a3 with SMTP id 5b1f17b1804b1-458b59e3f41mr84967645e9.5.1754312919702;
        Mon, 04 Aug 2025 06:08:39 -0700 (PDT)
Date: Mon, 4 Aug 2025 15:08:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 7/8] pdx: introduce a new compression algorithm based
 on region offsets
Message-ID: <aJCw0vS2rw2CXJqq@macbook.local>
References: <20250724110416.2081-1-roger.pau@citrix.com>
 <20250724110416.2081-8-roger.pau@citrix.com>
 <87c1a72d-62cf-475a-8320-70e1954cd0f5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87c1a72d-62cf-475a-8320-70e1954cd0f5@suse.com>

On Tue, Jul 29, 2025 at 04:16:15PM +0200, Jan Beulich wrote:
> On 24.07.2025 13:04, Roger Pau Monne wrote:
> > --- a/xen/common/pdx.c
> > +++ b/xen/common/pdx.c
> > @@ -24,6 +24,7 @@
> >  #include <xen/param.h>
> >  #include <xen/pfn.h>
> >  #include <xen/sections.h>
> > +#include <xen/sort.h>
> >  
> >  /**
> >   * Maximum (non-inclusive) usable pdx. Must be
> > @@ -40,6 +41,12 @@ bool __mfn_valid(unsigned long mfn)
> >  
> >  #ifdef CONFIG_PDX_MASK_COMPRESSION
> >      invalid |= mfn & pfn_hole_mask;
> > +#elif defined(CONFIG_PDX_OFFSET_COMPRESSION)
> > +{
> > +    unsigned long base = pfn_bases[PFN_TBL_IDX(mfn)];
> > +
> > +    invalid |= mfn < base || mfn >= base + pdx_region_size;
> 
> Leveraging wrapping, this could be simplified to
> 
>     invalid |= mfn - base >= pdx_region_size;
> 
> I think. Considering it's a frequently used path, doing so may be worthwhile.

I don't think that would work for all cases, take the following
example:

PFN compression using lookup table shift 18 and region size 0x40000
 range   0 [0000000280000, 00000002bffff] PFN IDX  10 : 0000000280000

If you pass mfn 0 to mfn_valid() with your proposed adjustment, the
result of the subtraction would be:

0 - ~0UL == 1

Which wouldn't satisfy the >= condition, and hence pfn 0 would be
reported as a valid mfn.  I think we need to keep both sides of the
check.

> > @@ -75,6 +82,13 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
> >  # error "Missing architecture maximum number of RAM ranges"
> >  #endif
> >  
> > +/* Some functions should be init when not using PDX mask compression. */
> > +#ifndef CONFIG_PDX_MASK_COMPRESSION
> > +# define __init_or_pdx_mask __init
> > +#else
> > +# define __init_or_pdx_mask
> > +#endif
> 
> Considering this is local to the CU, "pdx" in the name isn't very meaningful.
> Instead it being a compression type may be, so how about __init_or_mask_compr
> or some such? (If we gain further compression types, this may be getting
> unwieldy anyway.)

I'm fine with your proposal.  The current naming was derived from the
CONFIG_ define.

> > +static void __init cf_check swp_node(void *a, void *b, size_t size)
> > +{
> > +    SWAP(a, b);
> 
> This doesn't look right - you swap a and b, not what they point to.
> 
> > +static bool __init pfn_offset_sanitize_ranges(void)
> > +{
> > +    unsigned int i = 0;
> > +
> > +    if ( nr_ranges == 1 )
> > +    {
> > +        ASSERT(PFN_TBL_IDX(ranges[0].base) ==
> > +               PFN_TBL_IDX(ranges[0].base + ranges[0].size - 1));
> 
> I think this points out a naming issue in patch 2: "base" and "size" look
> as if these were address / byte count, when they're PFN / page count.
> Which caught my eye because of the values being passed to something that
> actually wants a PFN (and hence looked wrong at the first glance).

The struct name is pfn_range, I could rename the fields to base_pfn
and pages or similar, but my impression was that the struct name was
enough of a pointer that those are PFN ranges.  Do you have any
alternative proposal about how to name those?

> > +        return true;
> > +    }
> > +
> > +    while ( i + 1 < nr_ranges )
> > +    {
> > +        /*
> > +         * Ensure ranges [start, end] use the same offset table index.  Should
> > +         * be guaranteed by the logic that calculates the pfn shift.
> > +         */
> > +        if ( PFN_TBL_IDX(ranges[i].base) !=
> > +             PFN_TBL_IDX(ranges[i].base + ranges[i].size - 1) ||
> > +             PFN_TBL_IDX(ranges[i + 1].base) !=
> > +             PFN_TBL_IDX(ranges[i + 1].base + ranges[i + 1].size - 1) )
> 
> It feels a little odd to re-do the 2nd half of the checking here on the next
> iteration, when the table wouldn't have changed when ...
> 
> > +        {
> > +            ASSERT_UNREACHABLE();
> > +            return false;
> > +        }
> > +
> > +        if ( PFN_TBL_IDX(ranges[i].base) != PFN_TBL_IDX(ranges[i + 1].base) )
> > +        {
> > +            i++;
> > +            continue;
> 
> ... taking this path. Could I talk you into moving the latter half ...
> 
> > +        }
> 
> ... here? If that's needed at all, as ...
> 
> > +        /* Merge ranges with the same table index. */
> > +        ranges[i].size = ranges[i + 1].base + ranges[i + 1].size -
> > +                         ranges[i].base;
> 
> ... the new range should also fulfill the requirement. Just that the last
> such range then wouldn't be checked, unless ...
> 
> > +        memmove(&ranges[i + 1], &ranges[i + 2],
> > +                (nr_ranges - (i + 2)) * sizeof(ranges[0]));
> > +        nr_ranges--;
> > +    }
> 
> ... that checking was put past the loop. Which then would allow to remove
> the special casing of nr_ranges == 1 at the top of the function: You'd
> uniformly check the ranges[nr_ranges - 1] here.	

What about doing it like:

static bool __init pfn_offset_sanitize_ranges(void)
{
    unsigned int i = 0;

    if ( PFN_TBL_IDX(ranges[0].base) !=
         PFN_TBL_IDX(ranges[0].base + ranges[0].size - 1) )
    {
        ASSERT_UNREACHABLE();
        return false;
    }

    while ( i + 1 < nr_ranges )
    {
        /*
         * Ensure ranges [start, end] use the same offset table index.  Should
         * be guaranteed by the logic that calculates the pfn shift.
         */
        if ( PFN_TBL_IDX(ranges[i + 1].base) !=
             PFN_TBL_IDX(ranges[i + 1].base + ranges[i + 1].size - 1) )
        {
            ASSERT_UNREACHABLE();
            return false;
        }

        if ( PFN_TBL_IDX(ranges[i].base) != PFN_TBL_IDX(ranges[i + 1].base) )
        {
            i++;
            continue;
        }

        /* Merge ranges with the same table index. */
        ranges[i].size = ranges[i + 1].base + ranges[i + 1].size -
                         ranges[i].base;
        memmove(&ranges[i + 1], &ranges[i + 2],
                (nr_ranges - (i + 2)) * sizeof(ranges[0]));
        nr_ranges--;
    }

    return true;
}

I've pulled the index 0 check ahead of the loop, which then covers for
the case where nr_ranges == 1.  There's also no duplicate checking of
the ranges, since the range at i + 1 will always be a non-checked one;
either because the array has been shifted as a result of a range
merging, or the index has been advanced.

> > +        ranges[i].size = start + ranges[i].size - ranges[i].base;
> > +
> > +        /*
> > +         * Only merge overlapped regions now, leave adjacent regions separated.
> > +         * They would be merged later if both use the same index into the
> > +         * lookup table.
> > +         */
> > +        if ( !i || ranges[i].base >= (ranges[i - 1].base + ranges[i - 1].size) )
> > +        {
> > +            /*
> > +             * We might parse the region at position 0 more than once, as for
> > +             * index 0 we don't attempt to merge to keep this simple.
> > +             */
> > +            mask |= pdx_region_mask(ranges[i].base, ranges[i].size);
> > +            continue;
> 
> In how far is it relevant here that slot 0 may be looked at more than once?

Not really, just that someone might wonder about the possibly
inefficiency of this.  I will remove the comment then.

> > +        }
> > +
> > +        ranges[i - 1].size = ranges[i].base + ranges[i].size -
> > +                             ranges[i - 1].base;
> > +
> > +        if ( i + 1 < nr_ranges )
> > +            memmove(&ranges[i], &ranges[i + 1],
> > +                    (nr_ranges - (i + 1)) * sizeof(ranges[0]));
> > +        else /* last range */
> > +            mask |= pdx_region_mask(ranges[i].base, ranges[i].size);
> > +        nr_ranges--;
> > +        i--;
> > +    }
> > +
> > +    /*
> > +     * Populate a mask with the non-equal bits of the different ranges, do this
> > +     * to calculate the maximum PFN shift to use as the lookup table index.
> > +     */
> > +    for ( i = 0; i < nr_ranges; i++ )
> > +        for ( unsigned int j = 0; j < nr_ranges; j++ )
> > +            idx_mask |= (ranges[i].base & ~mask) ^ (ranges[j].base & ~mask);
> > +
> > +    if ( !idx_mask )
> > +        /* Single region case. */
> > +        pfn_index_shift = flsl(mask);
> > +    else if ( flsl(idx_mask) - ffsl(idx_mask) < CONFIG_PDX_OFFSET_TBL_ORDER )
> > +        /* The changed mask fits in the table index width. */
> > +        pfn_index_shift = ffsl(idx_mask) - 1;
> > +    else
> > +        /* Changed mask is wider than array size, use most significant bits. */
> > +        pfn_index_shift = flsl(idx_mask) - CONFIG_PDX_OFFSET_TBL_ORDER;
> 
> Perhaps emit a log message here to indicate that bigger PDX_OFFSET_TBL_ORDER
> may yield better results?

What about:

printk(XENLOG_DEBUG
       "PFN compression table index truncated, requires order %u\n",
       flsl(idx_mask) - ffsl(idx_mask) + 1);

> > +    /*
> > +     * Ensure correctness of the calculated values, plus merge ranges if they
> > +     * use the same lookup table index.
> > +     */
> > +    if ( !pfn_offset_sanitize_ranges() )
> > +    {
> > +        printk(XENLOG_DEBUG "PFN compression is invalid, disabling\n");
> > +        pfn_pdx_compression_reset();
> > +        return false;
> > +    }
> > +
> > +    /*
> > +     * Find the maximum PFN range size after having merged ranges with same
> > +     * index.  The rounded up region size will be the base for the PDX region
> > +     * size and shift.
> > +     */
> > +    for ( i = 0; i < nr_ranges; i++ )
> > +        size = max(size, ranges[i].size);
> > +
> > +    /* pdx_init_mask() already takes MAX_ORDER into account. */
> > +    mask = PFN_DOWN(pdx_init_mask(size << PAGE_SHIFT));
> 
> We're in arch-neutral code here, so I think you need to cast size to paddr_t
> before shifting.

Indeed, size is unsigned long here.

Thanks, Roger.

