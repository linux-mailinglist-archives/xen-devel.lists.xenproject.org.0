Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1E57386F3
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 16:27:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552793.863060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBymi-0006X1-Lp; Wed, 21 Jun 2023 14:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552793.863060; Wed, 21 Jun 2023 14:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBymi-0006VM-Is; Wed, 21 Jun 2023 14:26:12 +0000
Received: by outflank-mailman (input) for mailman id 552793;
 Wed, 21 Jun 2023 14:26:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HqSO=CJ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qBymh-0006VG-2y
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 14:26:11 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cea1a46-103f-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 16:26:03 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31121494630so6889624f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 07:26:03 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h4-20020a1ccc04000000b003f8d0308616sm5140975wmb.32.2023.06.21.07.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 07:26:01 -0700 (PDT)
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
X-Inumbo-ID: 8cea1a46-103f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1687357562; x=1689949562;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w6Edw0GL+U2LPG5hpy7jxAqIEhtl61bvPSZjd1II0WU=;
        b=QVTMEOIPTu0cVTLXlBnS0vxLJ6if+yWh4SW9rprAoec7HWp5GAWUjQ1tXBKJAS1g9M
         l8ucMOMYAkXoDb+OBkG7ZzIbwhprVcY7H15ozRckQPtTz2+64SaEyEOey+cdjD9NVxMA
         qlXfA/7khQWjcyGRcyajTn4zV437aBIa+tQWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687357562; x=1689949562;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6Edw0GL+U2LPG5hpy7jxAqIEhtl61bvPSZjd1II0WU=;
        b=RIUexAFVix6Y5Rv32dxxJ3KySEFp1xIoSoIyRs2R/eF69e8qcfeVoMyPCKlzZycyY4
         1sHWev1/gHaeJ67SrruPX/HVwcHHDWh+V5Ver4olWO0lNShvhIy29GIBrOCd8QdRqWjs
         4lO62aApFFq3+jsQan9+DDSosGN79TkG62e3XpUx/ErRAv81BQJ3x4HRgUbxFy8h3qNs
         LYhW2AezYqk/99MZxtzhlFlugHeRoE5aMdB3htz+yK4kO4vMXud31M+ukT20j8R00Fdn
         hN40Zw+uHuqPV0Zp7acDPnrKDpoGmCHQX4gqkXrCZNcICZ+Y+QDX+leAKQ5Vrj9ngk41
         pseg==
X-Gm-Message-State: AC+VfDz/Z4TFlNWOPQMcfv6JQCty99d0tUOC/c8gGXfVi2iylW60/3zB
	kWAPdo02U2KeMJ2jWuc/55LnLA==
X-Google-Smtp-Source: ACHHUZ7SVzK41w7Io+gb7VFwTQGb8NbBdpMGSXQyVHfbHAT74LJ66HY9HSe7y5J3dlcWVWzhMSmJIQ==
X-Received: by 2002:a05:6000:11d2:b0:30f:c473:dfd0 with SMTP id i18-20020a05600011d200b0030fc473dfd0mr12014271wrx.12.1687357562291;
        Wed, 21 Jun 2023 07:26:02 -0700 (PDT)
Message-ID: <64930879.1c0a0220.28719.ce38@mx.google.com>
X-Google-Original-Message-ID: <ZJMId84msEQEdq9o@EMEAENGAAD19049.>
Date: Wed, 21 Jun 2023 15:25:59 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] mm/pdx: Add comments throughout the codebase for pdx
References: <20230615162741.2008-1-alejandro.vallejo@cloud.com>
 <984e13ef-a73e-126c-0bf8-58bee9beb7b2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <984e13ef-a73e-126c-0bf8-58bee9beb7b2@suse.com>

On Mon, Jun 19, 2023 at 05:30:20PM +0200, Jan Beulich wrote:
> > + * ma_{top,bottom}_mask is simply a shifted pfn_{top,pdx_bottom}_mask where the
> > + * bottom one shifts in 1s rather than 0s.
> > + */
> 
> Nit: That 2nd bottom variable is ma_va_bottom_mask.
Sure

> 
> > @@ -57,9 +99,25 @@ uint64_t __init pdx_init_mask(uint64_t base_addr)
> >                           (uint64_t)1 << (MAX_ORDER + PAGE_SHIFT)) - 1);
> >  }
> >  
> > -u64 __init pdx_region_mask(u64 base, u64 len)
> > +uint64_t __init pdx_region_mask(uint64_t base, uint64_t len)
> >  {
> > -    return fill_mask(base ^ (base + len - 1));
> > +    uint64_t last = base + len - 1;
> > +    /*
> > +     * The only bit that matters in base^last is the MSB. There are 2 cases.
> > +     *
> > +     * case msb(base) < msb(last):
> > +     *     then fill_mask(base^last) == fill_mask(last). This is non
> > +     *     compressible.
> > +     * case msb(base) == msb(last):
> > +     *     This means that there _may_ be a sequence of compressible zeroes
> > +     *     for all addresses between `base` and `last` iff `base` has enough
> > +     *     trailing zeroes. That is, it's compressible when
> > +     *     fill_mask(base^last) < fill_mask(last)
> > +     *
> > +     * The resulting mask is effectively the moving bits between `base` and
> > +     * `last`
> > +     */
> > +    return fill_mask(base ^ last);
> >  }
> 
> I don't see a need for you to actually change the code here. You can
> as well introduce "last" as shorthand just for the comment.
I thought as you did initially and wrote it as such. In the end it felt
wrong to have an explanation in terms of a token not present in the code.
Furthermore, explaining what the shorthand is in the comment takes more
space than introducing `last` in the code itself.

```
   uint64_t last = base + len - 1;
  /*
   * The only bit that matters in base^last is the MSB. There are 2 cases.
```
                              vs
```
  /*
   * Let `last = base + len -1` out of convenience.
   * The only bit that matters in base^last is the MSB. There are 2 cases.
```

TL;DR: I didn't factor out `last` due to aesthetics (I'd rather not touch
the code in this patch, in fact), but it seems warranted in order to reduce
the impedance mismatch between this big-ish comment and the call it
describes. I'll post v2 without that adjustment in case I managed to
convince you. Otherwise feel free to adjust it on commit.

> What I dislike in your way of putting it is the use of fill_mask(last) when
> such a call never occurs in code. Starting from the first sentence,
> can't you explain things just in terms of said MSB
I see. I can refer to the MSBs instead. Works equally well.

e.g:
  fill_mask(base^last) == fill_mask(last)
                 |
                 V
  msb(fill_mask(base^last)) == msb(last)

> (where the two cases are "set" and "clear")?
I'm not sure I understand what you mean here.

> 
> > --- a/xen/include/xen/mm.h
> > +++ b/xen/include/xen/mm.h
> > @@ -31,6 +31,22 @@
> >   *   (i.e. all devices assigned to) a guest share a single DMA address space
> >   *   and, by default, Xen will ensure dfn == pfn.
> >   *
> > + * pdx: Page InDeX
> > + *   Indices into the frame table holding the per-page's book-keeping
> > + *   metadata. A compression scheme is used and there's a non-identity
> > + *   mapping between valid(mfn) <-> valid(pdx) See the comments in pdx.c
> > + *   for an in-depth explanation of that mapping.
> 
> The mapping may very well be (and on x86 typically is) an identity
> one. IOW you want to describe not only the compression case, but also
> the "no compression possible" one.
Point taken. I'll rephrase it slightly as "possibly non-identity" and
explicitly state the "no compression is possible" case.

> 
> PDXes also aren't just indexes to the frame table, but also to the
> direct mapping.
I had something to that effect earlier on, but I removed it because it
doesn't seem to be the case on ARM. There's a directmap_base_pdx global
that states the first pdx to be mapped on the directmap.

> 
> > + * maddr: Machine Address
> > + *   The physical address that corresponds to an mfn
> > + *
> > + * vaddr: Xen Virtual Address
> > + *   A virtual address of memory accesible to Xen. It is typically either
> > + *   an address into the direct map or to Xen's own code/data. The direct
> > + *   map implements several compression tricks to save memory, so an offset
> > + *   into it does _not_ necessarily correspond to an maddr due to pdx
> > + *   compression.
> 
> We need to be careful here: If I'm not mistaken at least Arm uses vaddr
> also for guest addresses. In fact I'm not sure vaddr (and perhaps even
> maddr) need explaining here
I'd like to have at least maddr. It's sufficiently project-specific to be
otherwise confusing to find unexplained elsewhere. i.e: In other bare-metal
projects that would be a paddr instead.

vaddr might be trying too hard to boil the ocean as far as definitions go.
I can get rid of it.

> the more that nothing in this header uses either term.
True. But it should be somewhere and this is the main memory-management
header, where the frame number definitions are. In general, things that
change together ought to stay together.

> > + * ## PDX compression
> > + *
> > + * This is a technique to avoid wasting memory on machines known to have
> > + * split their machine address space in two big discontinuous and highly
> > + * disjoint chunks.
> 
> Why two? There can be any number, and in fact on the system I originally
> had data from for reference (when first writing this code) iirc there
> were 8 nodes, each with a chunk of memory far away from the other chunks.
> The compression scheme used merely requires that some "inner" bits are
> unused (always zero) in all of those ranges.
Well, our implementation only supports two and I didn't see any obvious
hints about intending to increasing that number. I see where you're coming
from, though. I can make it more general so it's not outdated if the
pfn_to_pdx()/pdx_to_pfn() pair ever increases in scope to do several holes.

Out of curiosity (and for posterity's sake), what was/is that system?

> 
> > + * In its uncompressed form the frame table must have book-keeping metadata
> > + * structures for every page between [0, max_mfn) (whether they exist or
> 
> s/they exist/there is RAM/ ?
They exist is ambiguous, true. Rewrote it as "they are backed by RAM"

> 
> > + * not), and a similar condition exists for the direct map. We know some
> > + * architectures, however, that have some sparsity in their address space,
> > + * leading to a lot of wastage in the form of unused frame table entries.
> 
> Hmm, "architectures" suggests e.g. Arm might have such, but x86 won't.
> Perhaps "systems", "designs", or "system designs"?
I like `systems` better. Sure.

> 
> > @@ -13,22 +69,77 @@ extern unsigned long pfn_top_mask, ma_top_mask;
> >                           (sizeof(*frame_table) & -sizeof(*frame_table)))
> >  extern unsigned long pdx_group_valid[];
> >  
> > -extern uint64_t pdx_init_mask(u64 base_addr);
> > -extern u64 pdx_region_mask(u64 base, u64 len);
> > +/**
> > + * Calculates a mask covering "moving" bits of all addresses of a region
> > + *
> > + * e.g:
> > + *       base=0x1B00000000
> > + *   len+base=0x1B0008200;
> > + *
> > + *   ought to return 0x00000FFFFF;
> > + *
> > + * @param base Base address of the region
> > + * @param len  Size in octets of the region
> > + * @return Mask of moving bits at the bottom of all the region addresses
> > + */
> 
> This looks to be a copy-and-paste of pdx_region_mask()'s comment, when
> the function has neither a "base" parameter, nor a and one at all.
Oops. A victim of incompatible rebases. I extracted these comments from an
ongoing patch series I'm working on. I'll (try to) write an actual comment
for it.

> 
> > +uint64_t pdx_init_mask(u64 base_addr);
> 
> No u64 -> uint64_t here?
> 
> > -extern void set_pdx_range(unsigned long smfn, unsigned long emfn);
> > +/**
> > + * Calculates a mask covering "moving" bits of all addresses of a region
> > + *
> > + * e.g:
> > + *       base=0x1B00000000
> > + *   len+base=0x1B0008200;
> > + *
> > + *   ought to return 0x00000FFFFF;
> 
> I think it would help if you actually said how the return value actually
> derives. The term "moving" may be understood differently be different
> people, and hence such an explanation actually would also clarify what
> "moving" means.
Hmmm, I'd rather not explicitly state the XOR here though. I'm adding a
couple more lines explaining things in terms of the i-th bit of the mask
and all the region addresses. Ideally this comment ought to explain the
intuition, while the comment in pdx.c explains the implementation.

> 
> I also thing there's a 0 missing in the len+base value, without which
> the result would be quite a bit different.
Indeed.

> > +/**
> > + * Mark range between smfn and emfn is allocatable in the frame table
> > + *
> > + * @param smfn Start mfn
> > + * @param emfn End mfn
> > + */
> > +void set_pdx_range(unsigned long smfn, unsigned long emfn);
> 
> This could do with mathematically expressing the range in the comment,
> such that (in|ex)clusiveness of, in particular, emfn is clarified.
Good point. Sure.


> > +/**
> > + * Invoked to determine if an mfn maps to a legal pdx
> 
> I wouldn't use "pdx" here, but refer to frame_table[] instead.
I can rewrite it as something along those lines, sure.

> 
> > + * In order for it to be legal it must pass bounds, grouping and
> > + * compression sanity checks.
> > + *
> > + * @param smfn Start mfn
> > + * @param emfn End mfn
> > + * @return True iff all checks pass
> > + */
> >  bool __mfn_valid(unsigned long mfn);
> 
> Comment again mentions inapplicable parameters.
Ack.

> 
> > @@ -38,7 +149,16 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
> >  #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
> >  #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
> >  
> > -extern void pfn_pdx_hole_setup(unsigned long);
> > +/**
> > + * Initializes global variables with information about the compressible
> > + * range of the current memory regions.
> > + *
> > + * @param mask This mask is the biggest pdx_mask of every region in the
> > + *             system ORed with all base addresses of every region in the
> > + *             system. The result is a mask where every sequence of zeroes
> > + *             surrounded by ones is compressible.
> > + */
> > +void pfn_pdx_hole_setup(unsigned long mask);
> 
> With the function returning void, I find "The result" problematic. How about
> "This results in ..."?
Sounds better. Sure.

> 
> Btw, "surrounded by ones" isn't really necessary. We could compress shorter
> sequences of zeros, so this may want re-wording a little to be as precise
> as possible.
> 
> Jan
Fair. I'll tweak the definition.

Alejandro

