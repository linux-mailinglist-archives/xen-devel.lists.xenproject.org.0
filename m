Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6316A74B4BC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 17:56:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560568.876583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHno5-000216-7L; Fri, 07 Jul 2023 15:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560568.876583; Fri, 07 Jul 2023 15:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHno5-0001yB-4i; Fri, 07 Jul 2023 15:55:41 +0000
Received: by outflank-mailman (input) for mailman id 560568;
 Fri, 07 Jul 2023 15:55:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X2dY=CZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qHno3-0001y2-DQ
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 15:55:39 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b512a91a-1cde-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 17:55:36 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so254768366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jul 2023 08:55:34 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g3-20020a1709063b0300b009786ae9ed50sm2332013ejf.194.2023.07.07.08.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 08:55:33 -0700 (PDT)
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
X-Inumbo-ID: b512a91a-1cde-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688745334; x=1691337334;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l65fIxU7PQPm2QeYAxinf04OLcyj1bHcNGD7tCg11BA=;
        b=c+kn5V3GJk0pRblbAZYRuQj1wG2f8SrpZ+MIN7fe2uqL76sQNebzCwf4091s12PXVH
         KZLTXTZD8zf157qZSxInyPeNi7JEXg1Ex04bOjuo9TSYvR6K2CBnv9aaDPx8+QnfRilU
         Ss73dsypdT4w3F7OaYqQLxNxUe55rjrZ8ybOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688745334; x=1691337334;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l65fIxU7PQPm2QeYAxinf04OLcyj1bHcNGD7tCg11BA=;
        b=NVTa1/7uiw0oajYx0BMhjfLHP2WyG/hxa/W/08zKbaQYg54ztKyrOp1ELoQdgvr/Gl
         B3oTpkwYAaf3JFPeEw/1iSc6KlwO4IjmQJAMPg5HlmPNnqGx8Xrp289beUOMmgrrNSLG
         cl1U5IIhlGumpCGzauMY17w2hc+6r9Wi/mBGYalpVvXdAy1NJ9GmocDcvZTMoJWuVUH1
         42sd4BIAzDr034sG5KmjmMxNA/Gu4Mclcy8kq1KvMP+0Ngx4r0D5hTFjXx8donOZGkOg
         kX8hIupuX7pwIv4kg0xAwst27pSouuBELZ/8cjCnyeVyw172qQNO5Tri4Vs4KCRdfALR
         57Bg==
X-Gm-Message-State: ABy/qLY4DEg/8wfpF3e3y2lBgVvBHoDsSBx4m0WqW1TTVUiZJPo5CQAn
	1/cimYvGE3691d9DAqEvtnqf7Q==
X-Google-Smtp-Source: APBJJlGOv/EBi7cIX94zSa9hHsbeSufxIl5kxtUUoFzxA7RSh7e3uvGIPmrN8t3uB9BE8lapIrSQlA==
X-Received: by 2002:a17:906:259:b0:993:d5bd:a757 with SMTP id 25-20020a170906025900b00993d5bda757mr1632745ejl.19.1688745333629;
        Fri, 07 Jul 2023 08:55:33 -0700 (PDT)
Message-ID: <64a83575.170a0220.2c96.8158@mx.google.com>
X-Google-Original-Message-ID: <ZKg1cgevZIfvwfQ6@EMEAENGAAD19049.>
Date: Fri, 7 Jul 2023 16:55:30 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] mm/pdx: Add comments throughout the codebase for pdx
References: <20230622140237.8996-1-alejandro.vallejo@cloud.com>
 <e7d3daa3-7d5b-1c36-51f1-453bf11b55d2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7d3daa3-7d5b-1c36-51f1-453bf11b55d2@suse.com>

On Thu, Jul 06, 2023 at 11:50:58AM +0200, Jan Beulich wrote:
> On 22.06.2023 16:02, Alejandro Vallejo wrote:
> > @@ -57,9 +100,25 @@ uint64_t __init pdx_init_mask(uint64_t base_addr)
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
> > +     *     then msb(fill_mask(base^last)) == msb(last). This is non
> > +     *     compressible.
> > +     * case msb(base) == msb(last):
> > +     *     This means that there _may_ be a sequence of compressible zeroes
> > +     *     for all addresses between `base` and `last` iff `base` has enough
> > +     *     trailing zeroes. That is, it's compressible when
> 
> Why trailing zeros? [100000f000,10ffffffff] has compressible bits
> 32-35, but the low bits of base don't matter at all.
Ugh, I was thinking about the zeroes in the hole, but those are hardly
trailing indeed. Look below for the revamped comment though, as this simply
goes away.

> 
> > +     *     msb(fill_mask(base^last)) < msb(last)
> 
> No caller uses the result this way, so I'm unconvinced it is helpful
> to explain it here this way. This is also why I'm still not convinced
> of the introduction of "last" (as a real variable and in the comment).
> It's only the invariant bits in the range that we're after, as you
> say ...
> > +     * The resulting mask is effectively the moving bits between `base` and
> > +     * `last`.
> 
> ... here (where things could be expressed without "last").
> 
I've given it a go rephrashing it in terms of the logical operations being
applied rather than the relationship between the inputs. If you're still
unsatisfied I'm happy to hear other suggestions. It's just a complicated
thing to put into words.

With this definition I'm happy to remove the `last` auxiliary variable from
the patch because it's unnecessary.

```
     * We say a bit "moves" in a range if there exist 2 addresses in that
     * range that have that bit both set and cleared respectively. We want
     * to create a mask of _all_ moving bits in this range. We do this by
     * comparing the first and last addresses in the range, discarding the
     * bits that remain the same (this is logically an XOR operation). The
     * MSB of the resulting expression is the most significant moving bit
     * in the range. Then it's a matter of setting every bit in lower
     * positions in order to get the mask of moving bits.
```

> > --- a/xen/include/xen/mm.h
> > +++ b/xen/include/xen/mm.h
> > @@ -31,6 +31,16 @@
> >   *   (i.e. all devices assigned to) a guest share a single DMA address space
> >   *   and, by default, Xen will ensure dfn == pfn.
> >   *
> > + * pdx: Page InDeX
> > + *   Indices into the frame table holding the per-page's book-keeping
> > + *   metadata. A compression scheme is used and there's a possibly non
> 
> s/is/may be/ ?
Ack. The scheme is used even if it can yield no gains, but I do plan on
making it optional, so this comment can preemptively already reflect that.

> 
> Also as said earlier at least on x86 pdx-es are also used as direct map
> indices. I think this wants mentioning irrespective of what Arm does.
This is a common header. If the warping of the directmap due to pdx
compression is mentioned one has to talk about the common aspects of it,
and at least give a heads up that each port is free to apply further warps.
I'll mention the notion of it, but it must be vague in the spirit of
describing common behaviour and not x86 in particular.

> 
> > --- a/xen/include/xen/pdx.h
> > +++ b/xen/include/xen/pdx.h
> > @@ -1,6 +1,67 @@
> >  #ifndef __XEN_PDX_H__
> >  #define __XEN_PDX_H__
> >  
> > +/*
> > + * PDX (Page inDeX)
> > + *
> > + * This file deals with optimisations pertaining frame table indexing,
> 
> Nit: Missing "to"?
Indeed
> 
> > + * A pdx is an index into the frame table. However, having an identity
> > + * relationship between mfn and pdx could waste copious amounts of memory
> > + * in empty frame table entries. There are some techniques to bring memory
> > + * wastage down.
> 
> Like above the direct map wants mentioning here as well, I think.
I can add another paragraph mentioning that warp. Like I mentioned before,
we should be careful not to leave the ARM port (or others) outside the
scope of these definitions as they aren't x86-specific.

> > + * ## PDX compression
> > + *
> > + * This is a technique to avoid wasting memory on machines known to have
> > + * split their machine address space in several big discontinuous and highly
> > + * disjoint chunks.
> > + *
> > + * In its uncompressed form the frame table must have book-keeping metadata
> > + * structures for every page between [0, max_mfn) (whether they are backed
> > + * by RAM or not), and a similar condition exists for the direct map. We
> > + * know some systems, however, that have some sparsity in their address
> > + * space, leading to a lot of wastage in the form of unused frame table
> > + * entries.
> > + *
> > + * This is where compression becomes useful. The idea is to note that if
> > + * you have several big chunks of memory sufficiently far apart you can
> > + * ignore the middle part of the address because it will always contain
> > + * zeroes as long as the base address is sufficiently well aligned and the
> > + * length of the region is much smaller than the base address.
> 
> As per above alignment of the base address doesn't really matter.
Where above? As far as I understand you need enough alignment to cover the
hole or you won't have zeroes to compress. Point in case:

  * region1: [0x0000000000000000 -
              0x00000000FFFFFFFF]

  * region2: [0x0001FFFFFFFFF000 -
              0x00020000FFFFFFFF]

I can agree this configuration is beyond dumb and statistically unlikely to
exist in the wild, but it should (IMO) still be covered by that comment.

> 
> > + * i.e:
> > + *   Consider 2 regions of memory. One starts at 0 while the other starts
> > + *   at offset 2^off_h. Furthermore, let's assume both regions are smaller
> > + *   than 2^off_l. This means that all addresses between [2^off_l, 2^off_h)
> > + *   are invalid and we can assume them to be zero on all valid addresses.
> > + *
> > + *                 off_h     off_l
> > + *                 |         |
> > + *                 V         V
> > + *         --------------------------
> > + *         |HHHHHHH|000000000|LLLLLL| <--- mfn
> > + *         --------------------------
> > + *           ^ |
> > + *           | | (de)compression by adding/removing "useless" zeroes
> > + *           | V
> > + *         ---------------
> > + *         |HHHHHHHLLLLLL| <--- pdx
> > + *         ---------------
> > + *
> > + * This scheme also holds for multiple regions, where HHHHHHH acts as
> > + * the region identifier and LLLLLL fully contains the span of every
> > + * region involved. Consider the following 3 regions.
> > + */
> > +
> >  #ifdef CONFIG_HAS_PDX
> 
> Stray last sentence in the comment?
Oops, yes. I had more, but it was inconsequential and I ended up removing
it. I'll remove that last sentence too.

> 
> > @@ -13,22 +74,81 @@ extern unsigned long pfn_top_mask, ma_top_mask;
> >                           (sizeof(*frame_table) & -sizeof(*frame_table)))
> >  extern unsigned long pdx_group_valid[];
> >  
> > -extern uint64_t pdx_init_mask(u64 base_addr);
> > -extern u64 pdx_region_mask(u64 base, u64 len);
> > +/**
> > + * Calculates a mask covering "moving" bits of all addresses of a region
> > + *
> > + * The i-th bit of the mask must be set if there's 2 different addresses
> > + * in the region that have different j-th bits. where j >= i.
> > + *
> > + * e.g:
> > + *       base=0x1B00000000
> > + *   len+base=0x1B00082000
> > + *
> > + *   ought to return 0x00000FFFFF, which implies that every bit position
> > + *   with a zero in the mask remains unchanged in every address of the
> > + *   region.
> 
> Maybe the example would look "more generic" if the resulting mask didn't
> consist of just 0s and Fs, e.g.
> 
>  *       base=0x1B00000000
>  *   len+base=0x1B00042000
>  *
>  *   ought to return 0x000007FFFF, ...
Good idea, sure.

> 
> > + * @param base Base address of the region
> > + * @param len  Size in octets of the region
> > + * @return Mask of moving bits at the bottom of all the region addresses
> > + */
> > +uint64_t pdx_region_mask(uint64_t base, uint64_t len);
> >  
> > -extern void set_pdx_range(unsigned long smfn, unsigned long emfn);
> > +/**
> > + * Creates a basic pdx mask
> 
> What is "basic" trying to describe here? "The mask to start from" would
> look more to the point to me, plus saying that this is the (up front)
> companion to pdx_region_mask().
I'm honestly on the fence on whether this function should exist at all. One
could always integrate this mask in pdx_region_mask() and have the
callers start with a zero mask. I won't do this on this patch, but I'll try
to get rid of it on the follow-up series to these docs.

> 
> > + * This mask is used to determine non-compressible bits. No address in the
> > + * system shall have compressible bits covered by this initial mask.
> > + *
> > + * It's the larger of:
> > + *   - A mask of MAX_ORDER + PAGESHIFT 1s
> > + *   - base_addr rounded up to the nearest `2^n - 1`
> 
> I'm having trouble with this mathematically: Rounding always means
> going to some proper multiple of some base number (granularity).
I'm not sure about that definition, but regardless I can just remove that
"larger of" and ignore the problem. It's basically telling what the code
does and not adding content.

> This doesn't fit with the value being 2^n-1. Maybe "padded"?
Padding the number would be adding zeroes or ones, but we're mutating it.
IMO, that would add more confusion than it would solve.

> 
> > + * @param base_addr Address of the first maddr in the system
> > + * @return An integer of the form 2^n - 1
> > + */
> > +uint64_t pdx_init_mask(uint64_t base_addr);
> > +
> > +/**
> > + * Mark [smfn, emfn) as allocatable in the frame table
> 
> What does "allocatable" mean here?
> 
> Jan
Accesible, which is probably what it should say instead.

Thanks,

Alejandro

