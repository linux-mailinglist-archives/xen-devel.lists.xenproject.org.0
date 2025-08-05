Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D75B1B6AB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 16:38:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070532.1434142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujIno-00011Y-Sq; Tue, 05 Aug 2025 14:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070532.1434142; Tue, 05 Aug 2025 14:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujIno-000104-Px; Tue, 05 Aug 2025 14:38:08 +0000
Received: by outflank-mailman (input) for mailman id 1070532;
 Tue, 05 Aug 2025 14:38:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xkmx=2R=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujInn-0000zy-4p
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 14:38:07 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9c171c0-7209-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 16:38:01 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-458c063baeaso21313545e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 07:38:01 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45895377708sm248310625e9.8.2025.08.05.07.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 07:38:00 -0700 (PDT)
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
X-Inumbo-ID: c9c171c0-7209-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754404681; x=1755009481; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3kWFb4yBoOLoTJjBIvHK8CDF3oXpQ59LnqtyPRirIQ=;
        b=ZUMjTZjnPelPP8tX6/yPEnL/tZ6YrXcecxjqwDrU5c4fuowP2nWvIBh+5pZPfZb2QO
         g4CoR2qRGp9usqT/L5PkieYQxbU90szSwVV/1aXU/59nbdyIIY8X+Ni2tcvdIZAZdVO4
         u7BmiLLWAQ0Qpeb+t4Bm04vSoO7lLM/TQ6Lx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754404681; x=1755009481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3kWFb4yBoOLoTJjBIvHK8CDF3oXpQ59LnqtyPRirIQ=;
        b=eJWwfQhUHFzG6PSSo0MUN2Xilf8JtaDNxgmt4QhVWPb4WAInbnooHLXIkhmOf49mCQ
         706o7oHT3YfE3R14wm5WcYwYgHB+3Cd1pPVmCbmdiH910itrSFcBhmzEtlIULHCoLutH
         dGmq2HoTeIsiGQnCs+fzgAPfa/TxjW7+eU3MABrSapmb4mHuQKVQvjHhr/96EzeLrKPa
         sWtAuvCqntp3RckkZ3zu5Iut8USWBE0vNJRNZUtg7f9AKfMjT6yragA8bh1raCQokVAk
         u9oBLjzqM3SnF+F/bxju5qH3UAmTcY+raiv2qoQc78ApI8KH6d+wKtXOuLov02GfoLBm
         KWYw==
X-Forwarded-Encrypted: i=1; AJvYcCVvUiCDLNac1VU3UhR44FG6h4c4QZa4JgSllC4SQeytDhI/goLfHlT1PMIZE6L9VEu3jDI6K2G76iI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNhjbxQTWNDt4vtogNAn5EVWHohF9SR8hTGRZoNMFJ4GKk8ntI
	0XofbvwPUWqJ2QWQ3ts8ejrI7kH6BRQ18ToZjfLrAX9IAzbMdfpXuHbjhl+LraGboJk=
X-Gm-Gg: ASbGncvh4U1ExyBE7NWB+cYBpRv0//tRc3csvvj9787Tr32c2lHas36t2r0z71ZUv7D
	SqvKe86godGSRQdwOYv1ZYLajTKgLvklbNG1YHXSh34qkAV8QfTV5zS7aQNlD+rvOBQHqY7g2us
	jK/1rmpwevkUHADcPn9JgU9WOLvW/tC3TPtYoZBlQIAr9yL0194PynuoTwyfr4v0O+miupBhmrR
	PVEO9oPtOWWSk2GuEMhsSJnfv2OMZJqT93UJPBJMqtIH5ZAzN5lDXDrWj4tbwnTrQfNElOoODPr
	cdgsJwcO8UxybMR46nb/jfAsMpenLji6eGC6xOiXNHsf2tkR613WcBaXFvc6jcN+1Lb3avZQFAl
	iCIMPYMIaJiSw6/9G2zqWbXvB5ZbT++V90CRlyeO7eOApZLBybOx23B1eQ1fNst9iAg==
X-Google-Smtp-Source: AGHT+IFVY/WLfB2VEnFOFi8WeIxyYhSIW7uKHiPncgAqkna8IUHk0UoFucHlEfkWBdD0wp/8HAtooA==
X-Received: by 2002:a05:600c:c178:b0:455:fc16:9eb3 with SMTP id 5b1f17b1804b1-458b6b579e9mr102336525e9.33.1754404680807;
        Tue, 05 Aug 2025 07:38:00 -0700 (PDT)
Date: Tue, 5 Aug 2025 16:37:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 7/8] pdx: introduce a new compression algorithm based
 on region offsets
Message-ID: <aJIXR7WRiEzZXCgk@macbook.local>
References: <20250805095257.74975-1-roger.pau@citrix.com>
 <20250805095257.74975-8-roger.pau@citrix.com>
 <50aa7098-3777-43b2-8217-0b836a3c8879@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <50aa7098-3777-43b2-8217-0b836a3c8879@suse.com>

On Tue, Aug 05, 2025 at 02:28:22PM +0200, Jan Beulich wrote:
> On 05.08.2025 11:52, Roger Pau Monne wrote:
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
> > +}
> >  #endif
> 
> Hmm, didn't notice this earlier on: Brace placement looks odd here. I think
> they want to be indented by one level, as they aren't starting a function
> body.

Right, I can adjust.  Since they are inside of the ifdef block it did
look kind of OK to me, and avoided having to indent the content one
extra level.

> > @@ -294,7 +308,245 @@ void __init pfn_pdx_compression_reset(void)
> >      nr_ranges = 0;
> >  }
> >  
> > -#endif /* CONFIG_PDX_COMPRESSION */
> > +#elif defined(CONFIG_PDX_OFFSET_COMPRESSION) /* CONFIG_PDX_MASK_COMPRESSION */
> > +
> > +unsigned int __ro_after_init pfn_index_shift;
> > +unsigned int __ro_after_init pdx_index_shift;
> > +
> > +unsigned long __ro_after_init pfn_pdx_lookup[CONFIG_PDX_NR_LOOKUP];
> > +unsigned long __ro_after_init pdx_pfn_lookup[CONFIG_PDX_NR_LOOKUP];
> > +unsigned long __ro_after_init pfn_bases[CONFIG_PDX_NR_LOOKUP];
> > +unsigned long __ro_after_init pdx_region_size = ~0UL;
> 
> For cache locality, might this last one better also move ahead of the arrays?

Oh, yes, this was a late addition and I clearly didn't place enough
attention when adding it.

> > +bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
> > +{
> > +    unsigned long pfn = PFN_DOWN(base);
> > +    unsigned long pfn_base = pfn_bases[PFN_TBL_IDX(pfn)];
> > +
> > +    return pfn >= pfn_base &&
> > +           pfn + npages <= pfn_base + pdx_region_size;
> > +}
> > +
> > +static int __init cf_check cmp_node(const void *a, const void *b)
> > +{
> > +    const struct pfn_range *l = a;
> > +    const struct pfn_range *r = b;
> > +
> > +    if ( l->base_pfn > r->base_pfn )
> > +        return 1;
> > +    if ( l->base_pfn < r->base_pfn )
> > +        return -1;
> > +
> > +    return 0;
> > +}
> > +
> > +static void __init cf_check swp_node(void *a, void *b)
> > +{
> > +    SWAP(a, b);
> > +}
> 
> This hasn't changed from v3, and still looks wrong to me.

Oh, I did recall a comment to that regard, but somehow forgot to apply
it, I'm sorry, I've now fixed it.

> > +bool __init pfn_pdx_compression_setup(paddr_t base)
> > +{
> > +    unsigned long mask = PFN_DOWN(pdx_init_mask(base)), idx_mask = 0;
> > +    unsigned long pages = 0;
> > +    unsigned int i;
> > +
> > +    if ( !nr_ranges )
> > +    {
> > +        printk(XENLOG_DEBUG "PFN compression disabled%s\n",
> > +               pdx_compress ? ": no ranges provided" : "");
> > +        return false;
> > +    }
> > +
> > +    if ( nr_ranges > ARRAY_SIZE(ranges) )
> > +    {
> > +        printk(XENLOG_WARNING
> > +               "Too many PFN ranges (%u > %zu), not attempting PFN compression\n",
> > +               nr_ranges, ARRAY_SIZE(ranges));
> > +        return false;
> > +    }
> > +
> > +    /* Sort ranges by start address. */
> > +    sort(ranges, nr_ranges, sizeof(*ranges), cmp_node, swp_node);
> > +
> > +    for ( i = 0; i < nr_ranges; i++ )
> > +    {
> > +        unsigned long start = ranges[i].base_pfn;
> > +
> > +        /*
> > +         * Align range base to MAX_ORDER.  This is required so the PDX offset
> > +         * for the bits below MAX_ORDER matches the MFN offset, and pages
> > +         * greater than the minimal order can be used to populate the
> > +         * directmap.
> > +         */
> > +        ranges[i].base_pfn = start & ~((1UL << MAX_ORDER) - 1);
> > +        ranges[i].pages = start + ranges[i].pages - ranges[i].base_pfn;
> > +
> > +        /*
> > +         * Only merge overlapped regions now, leave adjacent regions separated.
> > +         * They would be merged later if both use the same index into the
> > +         * lookup table.
> > +         */
> > +        if ( !i ||
> > +             ranges[i].base_pfn >=
> > +             (ranges[i - 1].base_pfn + ranges[i - 1].pages) )
> > +        {
> > +            mask |= pdx_region_mask(ranges[i].base_pfn, ranges[i].pages);
> > +            continue;
> > +        }
> > +
> > +        ranges[i - 1].pages = ranges[i].base_pfn + ranges[i].pages -
> > +                              ranges[i - 1].base_pfn;
> > +
> > +        if ( i + 1 < nr_ranges )
> > +            memmove(&ranges[i], &ranges[i + 1],
> > +                    (nr_ranges - (i + 1)) * sizeof(ranges[0]));
> > +        else /* last range */
> > +            mask |= pdx_region_mask(ranges[i].base_pfn, ranges[i].pages);
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
> > +            idx_mask |= (ranges[i].base_pfn & ~mask) ^
> > +                        (ranges[j].base_pfn & ~mask);
> 
> "mask" is loop invariant - can't the AND-ing be pulled out, after the loop?

I've applied both of the above, thanks for the help.

Regards, Roger.

