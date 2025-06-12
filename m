Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B32AD68FC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 09:26:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012424.1390858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcKV-0001sc-Bz; Thu, 12 Jun 2025 07:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012424.1390858; Thu, 12 Jun 2025 07:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPcKV-0001qv-9H; Thu, 12 Jun 2025 07:26:31 +0000
Received: by outflank-mailman (input) for mailman id 1012424;
 Thu, 12 Jun 2025 07:26:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDy9=Y3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPcKU-0001qp-B8
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 07:26:30 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dbe0ae8-475e-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 09:26:28 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so6804825e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 00:26:28 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4532e25fd3asm11175935e9.36.2025.06.12.00.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 00:26:26 -0700 (PDT)
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
X-Inumbo-ID: 8dbe0ae8-475e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749713187; x=1750317987; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vBtTCutt4E4HmflxkY6wA3WXJFyxhZ3IS3pg2CYsXnY=;
        b=W8LDgLDy4EIXQpjCHEnIajWKq4yPW6AhdYVuOGOyAKWwsryl6N4nlC2Ro3unnC1ejS
         tdvkmIw5M4oa2XAbqVXy5wtPX1DB+vkQHvE4XCmWhj7WcvDcNx3LXSP8d4ah5w/xJ+sU
         BDfnxd1PSeArrHvPPyov/RsURg5/5GJzpTwOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749713187; x=1750317987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vBtTCutt4E4HmflxkY6wA3WXJFyxhZ3IS3pg2CYsXnY=;
        b=cEEvz5HzP7ZoIV60WiuhtfHm2f6opuv2UZnmMFIJqXDqHi/iPEY8ggoi5CSsoPncCu
         51DHrLDn5j7CmTLk4xNt1bnepvnuLsuZYYGKoaGlwa4NekwDpd8zQPivrZvNa7QmdWd7
         sL3wjGHKOKToqs9yE2E6h1DuwsJWwwICk5RUUs9IjiC8lLFGPqBn3XxBS1RgEmqky8Kb
         Htb3P53/LZe42368Yq2gNO63MJly55b6LWmxU10aP5ZEVzPHhh7J5D0q56aCyYr5Bc8A
         jSt0GnHjMi1TR1JojhTqq35Uls2ElaUic5yobOZnknEa8jsW/aRYCepACr/wOpd2RdkU
         yc/Q==
X-Gm-Message-State: AOJu0YznN3f6Tdj2NKuh4Hllub3KDrjTOhoXFghm8TIRYV+I4MC99tx3
	6Uxp7M6Qfo8R251s2ucBookYLNCcr8JZsflvbl8a0qTdZfYY7GNB0rCORswKFAzI2FA=
X-Gm-Gg: ASbGncutO76FT1wsf27YfwPza1upzpHUlX4mCAoi4fyzf/tDGOHS48xl4tcvWzZeMLm
	cAZQwJSIyEeKtHM/Zv/TSqPgbsQOlHag2X1m/3RmjGdZf0SHLazYlPA3pq3B8/qB6vFr9Nb9iI1
	ixRPMibbKvUwVCbJWyuRgZ/5uCe3Ix1Y1F0aRjbyZHWET+97MWN5Y0/tyCcUToWous0JIlkGEWp
	OFa25SXdasjUnMjDdx8ncJB3NrLqMSn2aws4t5SAlFPG5rAkQnH/arxIADk5RhvoALgL9mQkCfI
	ti/R1OtqOdhH90kHWGwDaimHiBrVX9x5pvBE8ACZGDwP7CVpJ4vvgA2QH2wqT788WSg+AgMwHTM
	O266ty6qa1cNxrke4vyXtFpqcwTWcQg==
X-Google-Smtp-Source: AGHT+IHYl8ZOvFgzF2jO+mlLuhxGAgDDORvc6Oxw6qhJjKXdSzu9rGi7CKAwicbANSRXI5vkHXDf5g==
X-Received: by 2002:a05:600c:3b1a:b0:450:d012:df7a with SMTP id 5b1f17b1804b1-453248cfda0mr51048425e9.28.1749713187233;
        Thu, 12 Jun 2025 00:26:27 -0700 (PDT)
Date: Thu, 12 Jun 2025 09:26:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 6/8] pdx: introduce a new compression algorithm based on
 offsets between regions
Message-ID: <aEqBIdImfwmSOIRS@macbook.local>
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-7-roger.pau@citrix.com>
 <8e34ac22-d05b-4ef3-9e31-6e5663cc1dc5@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e34ac22-d05b-4ef3-9e31-6e5663cc1dc5@citrix.com>

On Wed, Jun 11, 2025 at 08:33:55PM +0100, Andrew Cooper wrote:
> On 11/06/2025 6:16 pm, Roger Pau Monne wrote:
> > With the appearance of Intel Sierra Forest and Granite Rapids it's not
> 
> s/not/now ?
> 
> The problem here is that it's very possible to get such a system.
> 
> It might be worth nothing that SRF and GNR are socket compatible, in
> Birch Stream platforms, which is relevant to why they're similar in this
> regard.
> 
> > possible to get a production x86 host wit the following memory map:
> >
> > SRAT: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
> > SRAT: Node 0 PXM 0 [0000000100000000, 000000407fffffff]
> > SRAT: Node 1 PXM 1 [0000061e80000000, 0000065e7fffffff]
> > SRAT: Node 2 PXM 2 [00000c3e80000000, 00000c7e7fffffff]
> > SRAT: Node 3 PXM 3 [0000125e80000000, 0000129e7fffffff]
> >
> > This is from a four socket system, with each node having 256GB of memory.
> > The total amount of RAM on the system is 1TB, but without enabling
> > CONFIG_BIGMEM the last range is not accessible, as it's above the 16TB
> > boundary covered by the frame table.
> >
> > Note that while the memory map is very sparse, it won't be compressible
> > using the current algorithm that relies on all ranges having a shared
> > zeroed region of bits that can be removed.
> 
> ", it couldn't be compressed using the current PDX_MASK compression
> algorithm, which relies ..."
> 
> 
> >
> > The memory map presented above has the property of all regions being
> > similarly spaced between each other, and all having also a similar size.
> > This allows to compress them using the following formula:
> >
> >  pdx = (pfn % offset) + ((pfn / offset) * size)
> >
> > Where offset and size are two static coefficients calculated at
> > initialization.
> >
> > Obtaining the optimum offset and size coefficients is the complicated part.
> > In this patch I introduce two different algorithms, a fast one that works
> > correctly when the offset and size between ranges is mostly equal.  If such
> > fast algorithm doesn't work, or the resulting compression is not enough to
> > avoid truncation of the maximum usable page, it's possible to attempt a
> > brute force approach for calculating the coefficients.  This is also
> > implemented in this patch as the slow variant.  I've attempted to restrict
> > the number of iterations in the slow approach so it can exit early if no
> > better coefficients can be found due to the input constrains (minimum
> > region size).
> >
> > The patch here focuses on introducing the logic to calculate the
> > compression coefficients, plus adding a unit test to exercise the logic
> > easily from user-space in order to test different layouts and possibly
> > improve the generation of the coefficients.  The added unit tests only
> > covers the newly added compression, but could also be extended to cover the
> > existing PDX mask compression.
> 
> Is it possible to split out the userspace harness into an earlier patch,
> and e.g. do some token testing of PDX_MASK ?

It would need a different testing harness IMO, as the current testing
harness is tied to the offset implementation internals (as it wants to
compare the results of both the fast and slow coefficient
calculations).  I could add a test harness for the mask compression,
but it would be a different file, with slightly different logic, and
hence I don't think it would reduce much the size of this patch.

> That halves the size of this patch.
> 
> >
> > Note the translation functions (pfn to pdx, maddr to direct map offset),
> > are not implemented as part of this patch, an identity set of macros are
> > added to satisfy the build requirements.  The patch is already long enough
> > without those.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > We can discuss whether we want both the fast and the slow variants.  The
> > slow (brute force) was added as a result of me playing with weird region
> > layouts where the fast one didn't manage to compress, or the resulting
> > coefficients had a poor compression ratio.  However at this point the
> > slow variant has only proven helpful in synthetic cases, I haven't (yet?)
> > seen a real host memory layout that would benefit from it.
> 
> I'm going to hold off on opinions until I've read the rest of the series.
> 
> One question through.  Can we round offset up to the next power of two,
> so we can replace the divide with a shift?

I've tried to round up both offset and size, but that resulted in no
compression in some cases.  I can try to maybe round just one of
those?

Note that the divide is done once with offset and once with size,
depending on the direction of the translation.  I can explore this a
bit.

> size is not a nice power of two, but I guarantee you that hardware is
> not doing this routing with a divide.
> 
> It would result in some holes in PDX space, but it is almost certainly
> faster.

On my TGL NUC the cost of the conversion in pfn_to_pdx() measured in
TSC cycles is:

    N           Min           Max        Median           Avg        Stddev
x 2811            26           271            29     39.224831     33.516395

It's from the user-space harness, so might not be fully accurate.  I
the average time for the operation is ~14ns on my specific system
(2800Mhz nominal frequency).

> > diff --git a/tools/tests/pdx/harness.h b/tools/tests/pdx/harness.h
> > new file mode 100644
> > index 000000000000..3d31cf488daf
> > --- /dev/null
> > +++ b/tools/tests/pdx/harness.h
> > @@ -0,0 +1,73 @@
> > ...
> > +#define sort(elem, nr, size, cmp, swp) {                                \
> > +    /* Consume swp() so compiler doesn't complain it's unused. */       \
> > +    swp(&elem[0], &elem[0], size);                                      \
> 
> (void)swp;   ?

Hm, yes, that might be enough to make the compiler happy about swp()
being unused, I will try it.

> 
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > index 93ebfc29635e..e71908b99c14 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -258,7 +258,7 @@ void __init init_pdx(void)
> >      unsigned int bank;
> >  
> >      for ( bank = 0 ; bank < mem->nr_banks; bank++ )
> > -        pfn_pdx_add_region(mem->bank[bank].start, mem->bank[bank].size);
> > +        pfn_pdx_add_region(mem->bank[bank].start, mem->bank[bank].size, bank);
> >  
> 
> I'd suggest plumbing bank down in a previous patch.
> 
> > diff --git a/xen/common/pdx.c b/xen/common/pdx.c
> > index 7d14100224fe..f2cf60bbc3f8 100644
> > --- a/xen/common/pdx.c
> > +++ b/xen/common/pdx.c
> > @@ -21,6 +21,15 @@
> >  #include <xen/nospec.h>
> >  #include <xen/pfn.h>
> >  #include <xen/sections.h>
> > +#include <xen/sort.h>
> > +
> > +#ifdef __XEN__ /* For building the file in user-space. */
> > +
> > +/*
> > + * Use a define for the static keyword, we want to export some otherwise static
> > + * functions for the unit tests.
> > + */
> > +#define STATIC static
> 
> Most unit testing gets around this problem with the test harness itself
> doing
> 
> #include "path/to/pdx.c"

I see.  I've been kind of doing that with __XEN__, but it might be
clearer to instead use _TEST_HARNESS_, I could avoid the sed with
that.  I need to see how it looks.

My original idea was that the pdx object could be used by the PDX mask
testing also, but given the algorithm is selected at build time we
would need to generate two different object files from pdx.c anyway.

> If you do this right, the only thing needed is some #ifndef
> _TEST_HARNESS around the includes at a the top.
> 
> > +static int __init cf_check cmp_node(const void *a, const void *b)
> > +{
> > +    const struct pfn_range *l = a;
> > +    const struct pfn_range *r = b;
> > +
> > +    if ( l->base > r->base )
> > +        return 1;
> > +    if ( l->base < r->base )
> > +        return -1;
> > +
> > +    ASSERT_UNREACHABLE();
> 
> I'm not sure if this is appropriate.  It's perfectly reachable if both
> ->base's are the same, and it may interfere with the inlining heuristics
> for sort().
> 
> What you mean is "there shouldn't be two nodes that look like this", and
> I'm not sure that the middle of sort() is the place to check this properly.
> 
> AFAICT, The real property you want is "len[i] && base[i] + len[i] <=
> base[i+1]".

I could possibly do the filtering from the sanitize function.

Thanks, Roger.

