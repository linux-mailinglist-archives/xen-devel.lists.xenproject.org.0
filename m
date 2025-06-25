Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7F4AE89B0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 18:25:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025325.1400954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUSv9-0006wn-Uu; Wed, 25 Jun 2025 16:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025325.1400954; Wed, 25 Jun 2025 16:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUSv9-0006v3-RJ; Wed, 25 Jun 2025 16:24:23 +0000
Received: by outflank-mailman (input) for mailman id 1025325;
 Wed, 25 Jun 2025 16:24:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+7fe=ZI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uUSv8-0006uC-VS
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 16:24:23 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d90d514e-51e0-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 18:24:20 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so3602003f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 09:24:20 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a6e8050e1fsm4960664f8f.8.2025.06.25.09.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 09:24:19 -0700 (PDT)
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
X-Inumbo-ID: d90d514e-51e0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750868660; x=1751473460; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MKdRFtq/FsRfJyxZawMg/6AI/mJV7ZYU4ww0R/FiueA=;
        b=HyZyjdXzsm3rcPPtOR4kvQX9RFT1ubZ+fmBp4HHOLcR4fDaNBSJSaTwxqsLN2GkED6
         5CvTm/bGIEmqLWW/xGKGUMtcToTOrDD9nZpom/xP1BuIp1hA8aQanoEE4zQXz41J8pIw
         RZyfhHXBw5cJIq7e03wI1bZqT9TS8oXEaOXCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750868660; x=1751473460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MKdRFtq/FsRfJyxZawMg/6AI/mJV7ZYU4ww0R/FiueA=;
        b=MePYYH9L8MP4ciVLs5XvCvYS9QhfDU50w83ObSgUP97JS6zVx5WXaGncTaoKknF6op
         EwQzDY0lbue15JPnNYRpYbni902nGVozJvu6/c93JUfuknLLGGnMcB8qlWfqT31UOEDU
         Y/nzyHKcz0kapUBKLK81UTiKFVSxwdbCWlsBEBASuTnoEeUHqvthhy8q0br0AGScBPe5
         G5IgB7HaP0sNZooNCQZ+gcTaL7vfiGL+fwbZV1sqgwBKB0VDn0W28cOog+og4+r7VaR7
         c9vaaaR665fVckIu0zOuoYHXE15+d7KGqPiLUdTPKNYjx77995PJ9zqFb1/64ifHSOQ1
         J6MA==
X-Forwarded-Encrypted: i=1; AJvYcCWj4bK9zF+13NE9+Bgklu33LT//AHrR78pHZnvmrIQyDUGYuYWwCPB7kcp7GiUDA7+FlqiD0+JpJp0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzplTm+du9zVnQHJ0TIg2oAIhIVH1bs4kbzWGNOvyIL23tvWQw8
	Qy7AOHMWU/Yh649lcvRgmJui6CAuPAZZNnbMlApPrU54nMUlNJR9JAuWoAxEo9fSK+s=
X-Gm-Gg: ASbGncsU6NnHw5Ano7MEpJa1kyYrg20R0GMqdnKZ15r9+11rC/IEPE9F26H6WrczQCD
	ZChHOXSeKOVbr6iuKMmU4j78Ue5Gkgl9Cdo7QMrEYTKh8DWSj5LJ7x7uNyRftji5DAOIvsdg5To
	N4ECwMACEBpBi9LAqJuMrNEC1/XbVUPvzKvRR+WNM/WcRMJFC7Qs8kICFM6uoXuEK280cduZjJl
	KbTwjO9B+wTddwDMWME4JoPwLVKjjCv3qYgN91WkgKp1y8V+SF70mZ+oZ5RAfjSacZfRmVSwRaq
	c+nSp9QFSd+mFGNQMRO2E2pQnNCxgiPV7y7afesgoGDy2UfCkrYCSh5mQFEvxk9SNIUQ79OddU0
	11DPS9JWuLQPBEZLzL1uX+tCmwnvgCA==
X-Google-Smtp-Source: AGHT+IFPrzhsvdjGKFbS4wqxgTxOLSEN4/jlrygpl08i1P5uC5WNi22OwgqCF3oWeEgy0LzFFrnsZw==
X-Received: by 2002:a05:6000:2586:b0:3a4:f7df:7564 with SMTP id ffacd0b85a97d-3a6ed575241mr3179740f8f.0.1750868659672;
        Wed, 25 Jun 2025 09:24:19 -0700 (PDT)
Date: Wed, 25 Jun 2025 18:24:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 8/8] pdx: introduce a new compression algorithm based
 on region offsets
Message-ID: <aFwish8zET1W6-CC@macbook.local>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-9-roger.pau@citrix.com>
 <e0339b2b-86cd-45ad-9b6f-a5e8ddbc623c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0339b2b-86cd-45ad-9b6f-a5e8ddbc623c@suse.com>

On Tue, Jun 24, 2025 at 06:16:15PM +0200, Jan Beulich wrote:
> On 20.06.2025 13:11, Roger Pau Monne wrote:
> > With the appearance of Intel Sierra Forest and Granite Rapids it's now
> > possible to get a production x86 host with the following memory map:
> > 
> > SRAT: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
> > SRAT: Node 0 PXM 0 [0000000100000000, 000000807fffffff]
> > SRAT: Node 1 PXM 1 [0000063e80000000, 000006be7fffffff]
> > SRAT: Node 2 PXM 2 [00000c7e80000000, 00000cfe7fffffff]
> > SRAT: Node 3 PXM 3 [000012be80000000, 0000133e7fffffff]
> > 
> > This is from a four socket Granite Rapids system, with each node having
> > 512GB of memory.  The total amount of RAM on the system is 2TB, but without
> > enabling CONFIG_BIGMEM the last range is not accessible, as it's above the
> > 16TB boundary covered by the frame table. Sierra Forest and Granite Rapids
> > are socket compatible, however Sierra Forest only supports 2 socket
> > configurations, while Granite Rapids can go up to 8 sockets.
> > 
> > Note that while the memory map is very sparse, it couldn't be compressed
> > using the current PDX_MASK compression algorithm, which relies on all
> > ranges having a shared zeroed region of bits that can be removed.
> > 
> > The memory map presented above has the property of all regions being
> > similarly spaced between each other, and all having also a similar size.
> > Use a lookup table to store the offsets to translate from/to PFN and PDX
> > spaces.  Such table is indexed based on the input PFN or PDX to translated.
> > The example PFN layout about would get compressed using the following:
> > 
> > PFN compression using PFN lookup table shift 29 and PDX region size 0x10000000
> >  range 0 [0000000000000, 0x0000807ffff] PFN IDX  0 : 0000000000000
> >  range 1 [0x00063e80000, 0x0006be7ffff] PFN IDX  3 : 0x00053e80000
> >  range 2 [0x000c7e80000, 0x000cfe7ffff] PFN IDX  6 : 0x000a7e80000
> >  range 3 [0x0012be80000, 0x00133e7ffff] PFN IDX  9 : 0x000fbe80000
> > 
> > Note how the tow ranges belonging to node 0 get merged into a single PDX
> > region by the compression algorithm.
> > 
> > The default size of lookup tables currently set in Kconfig is 64 entries,
> > and the example memory map consumes 10 entries.  Such memory map is from a
> > 4 socket Granite Rapids host, which in theory supports up to 8 sockets
> > according to Intel documentation.  Assuming the layout of a 8 socket system
> > is similar to the 4 socket one, it would require 21 lookup table entries to
> > support it, way below the current default of 64 entries.
> > 
> > The valid range of lookup table size is currently restricted from 1 to 512
> > elements in Kconfig.
> > 
> > Unused lookup table entries are set to all ones (~0UL), so that we can
> > detect whether a pfn or pdx is valid just by checking whether its
> > translation is bi-directional.  The saturated offsets will prevent the
> > translation from being bidirectional if the lookup table entry is not
> > valid.
> 
> Right, yet with the sad effect of still leaving almost half the space unused.
> I guess that's pretty much unavoidable though in this scheme, as long as we
> want the backwards translation to also be "simple" (and in particular not
> involving a loop of any kind).
> 
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -20,6 +20,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >       grant table or foreign memory.
> >  
> >  ### Added
> > + - Introduce new PDX compression algorithm to cope with Intel Sapphire and
> > +   Granite Rapids having sparse memory maps.
> 
> In the description you updated to mention Sierra Forest instead, but here you
> didn't.

Bah, my bad.  It's Sierra Forest and Granite Rapids, not Sapphire.
I've got confused with the names.

> > --- a/tools/tests/pdx/harness.h
> > +++ b/tools/tests/pdx/harness.h
> > @@ -44,8 +44,10 @@
> >  
> >  #define MAX_RANGES 8
> >  #define MAX_PFN_RANGES MAX_RANGES
> > +#define CONFIG_PDX_OFFSET_TLB_ORDER 6
> >  
> >  #define ASSERT assert
> > +#define ASSERT_UNREACHABLE() assert(0);
> 
> Nit: Stray semicolon.
> 
> > @@ -66,6 +68,8 @@ static inline unsigned int find_next(
> >  #define find_next_zero_bit(a, s, o) find_next(a, s, o, false)
> >  #define find_next_bit(a, s, o)      find_next(a, s, o, true)
> >  
> > +#define flsl(x) ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
> 
> While this is perhaps indeed good enough for a testing utility, ...
> 
> > @@ -75,6 +79,12 @@ static inline unsigned int find_next(
> >  
> >  typedef uint64_t paddr_t;
> >  
> > +#define sort(elem, nr, size, cmp, swp) {                                \
> > +    /* Consume swp() so compiler doesn't complain it's unused. */       \
> > +    (void)swp;                                                          \
> > +    qsort(elem, nr, size, cmp);                                         \
> > +}
> 
> ... this I think wants to use either do/while of ({ }).

OK.  Given it's limited test only usage I've assume it was fine like
this, but I certainly don't mind adjusting.

> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -54,7 +54,8 @@ config EVTCHN_FIFO
> >  
> >  choice
> >  	prompt "PDX (Page inDeX) compression"
> > -	default PDX_MASK_COMPRESSION if !X86 && !RISCV
> > +	default PDX_OFFSET_COMPRESSION if X86
> > +	default PDX_MASK_COMPRESSION if !RISCV
> >  	default PDX_NONE
> >  	help
> >  	  PDX compression is a technique designed to reduce the memory
> > @@ -73,12 +74,30 @@ config PDX_MASK_COMPRESSION
> >  	help
> >  	  Compression relying on all RAM addresses sharing a zeroed bit region.
> >  
> > +config PDX_OFFSET_COMPRESSION
> > +	bool "Offset compression"
> > +	help
> > +	  Compression relying on size and distance between RAM regions being
> > +	  compressible using an offset lookup table.
> > +
> >  config PDX_NONE
> >  	bool "None"
> >  	help
> >  	  No compression
> >  endchoice
> >  
> > +config PDX_OFFSET_TLB_ORDER
> 
> Please can we avoid the term "TLB" in the name? What we commonly call a TLB

It should have been TBL_ORDER, not TLB.  My finger memory is too use
to type TLB I think.

> is somewhat different. In fact is there anything wrong with just
> PDX_OFFSET_ORDER?

I've assumed that would be seen as too short and not descriptive
enough.  If that's fine I will switch it.

> > +	int "PDX offset compression lookup table order" if EXPERT
> > +	depends on PDX_OFFSET_COMPRESSION
> > +	default 6
> > +	range 0 9
> 
> Is 0 really a sensible lower bound? There's not going to be any compression
> then, I suppose?

No, you can still compress a single range if start if offset from 0.
See the following example in the test file:

/* Single range not starting at 0. */
{
    .ranges = {
        { .start = (1 << MAX_ORDER) * 10,
          .end   = (1 << MAX_ORDER) * 11 },
    },
    .compress = true,
},

Which results in:

PFN compression using PFN lookup table shift 63 and PDX region size 0x40000
 range 0 [0x00000280000, 0x000002bffff] PFN IDX   0 : 0x00000280000

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
> > @@ -40,6 +41,8 @@ bool __mfn_valid(unsigned long mfn)
> >  
> >  #ifdef CONFIG_PDX_MASK_COMPRESSION
> >      invalid |= mfn & pfn_hole_mask;
> > +#elif defined(CONFIG_PDX_OFFSET_COMPRESSION)
> > +    invalid |= mfn ^ pdx_to_pfn(pfn_to_pdx(mfn));
> 
> Hmm, that's pretty expensive already. Involving two (presumably back-to-back)
> JMPs when compression isn't enabled.

There's a conditional with evaluate_nospec() below, so I think the
JMPs are unlikely to make much difference?  Otherwise I would need to
check the index in the lookup table, and possibly introduce a new
variable to store the PDX region size to ensure it also fits in there.

Overall I think it's more complex for possibly little benefit given
the current code in mfn_valid() anyway.

> > @@ -290,7 +300,200 @@ void __init pfn_pdx_compression_reset(void)
> >      nr_ranges = 0;
> >  }
> >  
> > -#endif /* CONFIG_PDX_COMPRESSION */
> > +#elif defined(CONFIG_PDX_OFFSET_COMPRESSION) /* CONFIG_PDX_MASK_COMPRESSION */
> > +
> > +unsigned long __ro_after_init pfn_pdx_lookup[CONFIG_PDX_NR_LOOKUP];
> > +unsigned int __ro_after_init pfn_index_shift;
> > +
> > +unsigned long __ro_after_init pdx_pfn_lookup[CONFIG_PDX_NR_LOOKUP];
> > +unsigned int __ro_after_init pdx_index_shift;
> 
> For slightly better cache locality when only a few array indexes are in
> use, may I suggest to put the indexes ahead of the arrays? Perhaps even
> together, as they both take up a single unsigned long slot.

Can do, yes.

> > +bool pdx_is_region_compressible(paddr_t base, unsigned long npages)
> > +{
> > +    unsigned long pfn = PFN_DOWN(base);
> > +
> > +    return pdx_to_pfn(pfn_to_pdx(pfn) + npages - 1) == (pfn + npages - 1);
> 
> Aiui for this to be correct, there need to be gaps between the ranges
> covered by individual lookup table slots. In the setup logic you have a
> check commented "Avoid compression if there's no gain", but that doesn't
> look to guarantee gaps everywhere (nor would pfn_offset_sanitize_ranges()
> appear to)?

But if there are no gaps, the full region is covered correctly, and
hence it's compressible?

Maybe I'm missing something, could you maybe provide an example that
would exhibit this issue?

> > +static void __init cf_check swp_node(void *a, void *b, size_t size)
> > +{
> > +    struct pfn_range *l = a;
> > +    struct pfn_range *r = b;
> > +    struct pfn_range tmp = *l;
> > +
> > +    *l = *r;
> > +    *r = tmp;
> > +}
> 
> Any reason you effectively open-code SWAP() here?

Lack of knowledge :).

> > +static bool __init pfn_offset_sanitize_ranges(void)
> > +{
> > +    unsigned int i = 0;
> > +
> > +    if ( nr_ranges == 1 )
> > +    {
> > +        ASSERT(PFN_TBL_IDX_VALID(ranges[0].base));
> > +        ASSERT(PFN_TBL_IDX(ranges[0].base) ==
> > +               PFN_TBL_IDX(ranges[0].base + ranges[0].size - 1));
> > +        return true;
> > +    }
> > +
> > +    /* Sort nodes by start address. */
> > +    sort(ranges, nr_ranges, sizeof(struct pfn_range), cmp_node, swp_node);
> 
> Better sizeof(*ranges) or sizeof(ranges[0])?
> 
> > +bool __init pfn_pdx_compression_setup(paddr_t base)
> > +{
> > +    unsigned long size = 0, mask = PFN_DOWN(pdx_init_mask(base));
> > +    unsigned int i;
> > +
> > +    if ( !nr_ranges )
> > +        return false;
> 
> Also bail if there's just a single range?

No, you can still compress (and thus reduce the PDX space) if there's
a single range.

> > +    if ( nr_ranges > ARRAY_SIZE(ranges) )
> > +    {
> > +        printk(XENLOG_WARNING
> > +               "Too many PFN ranges (%u > %zu), not attempting PFN compression\n",
> > +               nr_ranges, ARRAY_SIZE(ranges));
> > +        return false;
> > +    }
> > +
> > +    for ( i = 0; i < nr_ranges; i++ )
> > +        mask |= pdx_region_mask(ranges[i].base, ranges[i].size);
> > +
> > +    pfn_index_shift = flsl(mask);
> 
> With this ...
> 
> > +    /*
> > +     * Increase the shift as much as possible, removing bits that are equal in
> > +     * all regions, as this allows the usage of smaller indexes, and in turn
> > +     * smaller lookup tables.
> > +     */
> > +    for ( pfn_index_shift = flsl(mask); pfn_index_shift < sizeof(mask) * 8 - 1;
> 
> ... you don't need to do this here another time.

Oh, good catch.  This was ordered differently, and I didn't realize
the duplication after the code movement.

> Also - why the subtraction of 1 in what the shift is compared against? Logic
> below should in principle guarantee we never exit the loop because of the
> conditional above, but if we made it that far it looks like we could as well
> also look at the top bit.

Because for a single range this would otherwise end up with
pfn_index_shift == 64, and thus lead to undefined behavior.

> > +          pfn_index_shift++ )
> > +    {
> > +        const unsigned long bit = ranges[0].base & (1UL << pfn_index_shift);
> > +
> > +        for ( i = 1; i < nr_ranges; i++ )
> > +            if ( bit != (ranges[i].base & (1UL << pfn_index_shift)) )
> > +                break;
> > +        if ( i != nr_ranges )
> > +            break;
> > +    }
> > +
> > +    /* Sort and sanitize ranges. */
> > +    if ( !pfn_offset_sanitize_ranges() )
> > +        return false;
> > +
> > +    /* Calculate PDX region size. */
> > +    for ( i = 0; i < nr_ranges; i++ )
> > +        size = max(size, ranges[i].size);
> > +
> > +    mask = PFN_DOWN(pdx_init_mask(size << PAGE_SHIFT));
> > +    pdx_index_shift = flsl(mask);
> > +
> > +    /* Avoid compression if there's no gain. */
> > +    if ( (mask + 1) * (nr_ranges - 1) >= ranges[nr_ranges - 1].base )
> > +        return false;
> > +
> > +    /* Poison all lookup table entries ahead of setting them. */
> > +    memset(pfn_pdx_lookup, ~0, sizeof(pfn_pdx_lookup));
> > +    memset(pdx_pfn_lookup, ~0, sizeof(pfn_pdx_lookup));
> 
> Have the arrays have initializers instead?

No, because otherwise early use (before the initialization done here)
of the translation functions would give bogus results.

> > +    for ( i = 0; i < nr_ranges; i++ )
> > +    {
> > +        unsigned int idx = PFN_TBL_IDX(ranges[i].base);
> > +
> > +        pfn_pdx_lookup[idx] = ranges[i].base - (mask + 1) * i;
> > +        pdx_pfn_lookup[i] = pfn_pdx_lookup[idx];
> > +    }
> > +
> > +    printk(XENLOG_INFO
> > +           "PFN compression using PFN lookup table shift %u and PDX region size %#lx\n",
> 
> I'd drop PFN and the latter PDX from this format string.

Ack.

> > +           pfn_index_shift, mask + 1);
> > +
> > +    for ( i = 0; i < nr_ranges; i++ )
> > +        printk(XENLOG_DEBUG
> > +               " range %u [%#013lx, %#013lx] PFN IDX %3lu : %#013lx\n",
> > +               i, ranges[i].base, ranges[i].base + ranges[i].size - 1,
> > +               PFN_TBL_IDX(ranges[i].base),
> > +               pfn_pdx_lookup[PFN_TBL_IDX(ranges[i].base)]);
> 
> Do you really mean this to stay active also in release builds?

I had it guarded with #ifdef CONFIG_DEBUG initially, but later decided
it was worth giving the possibility to print it in release builds if
debug log level is selected.

> Also the outcome of the earlier loop isn't used by the intermediate printk().
> Perhaps join both loops, thus allowing idx to be re-used here?

Hm, yes.  I wanted to first print the message about enabling PFN
compression, and later the compression specific information.  I can
move the message about enabling PFN compression ahead of the loop.

> > +    return true;
> > +}
> > +
> > +void __init pfn_pdx_compression_reset(void)
> > +{
> > +    memset(pfn_pdx_lookup, 0, sizeof(pfn_pdx_lookup));
> > +    memset(pdx_pfn_lookup, 0, sizeof(pfn_pdx_lookup));
> 
> Why not ~0?

Because translation needs to work, if I poison all entries with ~0
translation won't work.

> > --- a/xen/include/xen/pdx.h
> > +++ b/xen/include/xen/pdx.h
> > @@ -65,6 +65,43 @@
> >   * This scheme also holds for multiple regions, where HHHHHHH acts as
> >   * the region identifier and LLLLLL fully contains the span of every
> >   * region involved.
> > + *
> > + * ## PDX offset compression
> > + *
> > + * Alternative compression mechanism that relies on RAM ranges having a similar
> > + * size and offset between them:
> > + *
> > + * PFN address space:
> > + * ┌────────┬──────────┬────────┬──────────┐   ┌────────┬──────────┐
> > + * │ RAM 0  │          │ RAM 1  │          │...│ RAM N  │          │
> > + * ├────────┼──────────┼────────┴──────────┘   └────────┴──────────┘
> > + * │<------>│          │
> > + * │  size             │
> > + * │<----------------->│
> > + *         offset
> > + *
> > + * The compression reduces the holes between RAM regions:
> > + *
> > + * PDX address space:
> > + * ┌────────┬───┬────────┬───┐   ┌─┬────────┐
> > + * │ RAM 0  │   │ RAM 1  │   │...│ │ RAM N  │
> > + * ├────────┴───┼────────┴───┘   └─┴────────┘
> > + * │<---------->│
> > + *   pdx region size
> > + *
> > + * The offsets to convert from PFN to PDX and from PDX to PFN are stored in a
> > + * pair of lookup tables, and the index into those tables to find the offset
> > + * for each PFN or PDX is obtained by shifting the to be translated address by
> > + * a specific value calculated at boot:
> > + *
> > + * pdx = pfn - pfn_lookup_table[pfn >> pfn_shift]
> > + * pfn = pdx + pdx_lookup_table[pdx >> pdx_shift]
> 
> I assume it's intentional (for simplicity) that you omit the index masking
> here?

Indeed.  I can add it, but I think the point here is to explain the
algorithm used in a clear way, without implementation details.  I would
consider the masking one of such implementation details.

Thanks, Roger.

