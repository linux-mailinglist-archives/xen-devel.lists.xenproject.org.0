Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0573E386E82
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 02:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128563.241349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1linxM-0000XL-P9; Tue, 18 May 2021 00:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128563.241349; Tue, 18 May 2021 00:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1linxM-0000VR-Lr; Tue, 18 May 2021 00:51:32 +0000
Received: by outflank-mailman (input) for mailman id 128563;
 Tue, 18 May 2021 00:51:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvJe=KN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1linxK-0000VJ-Cm
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 00:51:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2fd4c7e-04f7-4356-9feb-f178b7afc5f2;
 Tue, 18 May 2021 00:51:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA92D613AE;
 Tue, 18 May 2021 00:51:28 +0000 (UTC)
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
X-Inumbo-ID: d2fd4c7e-04f7-4356-9feb-f178b7afc5f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621299089;
	bh=J2cSjDnsf7weHduuUYT1lTR3uyi8DNz7FUP2VJDiO2M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LeOI7WMxp0j5Insgdz16veHhsbQVrpoWNUgpgFtOBiA5U/jTn2BAX4aphwqc9+2x6
	 47Rjl/hx2DONHcAjEcyKx+FZM9VZTzMf9cAs1YNrvRPZ4XxYq3lTrobeCRjE9jHh3e
	 u5yTUIoFBz/EUzhXyc7pqoZA73Z/Md7tHEQ5SsoC0AnjErpN2cN76njeN8i3Tzdzjb
	 +MA67RVABDxnWSTeWCIWgki08EuNmYely3joTpj0vQj5ZYvy4OE9/DC/MlbiFWu+q4
	 e+PyzxsxUOaZ80goKiOhWS/MrreYCtZ6iAb36SVpv9xhjaJGL8Z4aasOL+OsTeO31H
	 KsGcEI3O53cRg==
Date: Mon, 17 May 2021 17:51:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH RFCv2 15/15] xen/arm: mm: Re-implement setup_frame_table_mappings()
 with map_pages_to_xen()
In-Reply-To: <2308478e-527b-a54a-206a-785f80515835@xen.org>
Message-ID: <alpine.DEB.2.21.2105171751110.14426@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-16-julien@xen.org> <alpine.DEB.2.21.2105141658510.14426@sstabellini-ThinkPad-T480s> <2308478e-527b-a54a-206a-785f80515835@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 15 May 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 15/05/2021 01:02, Stefano Stabellini wrote:
> > On Sun, 25 Apr 2021, Julien Grall wrote:
> > > From: Julien Grall <julien.grall@arm.com>
> > > 
> > > Now that map_pages_to_xen() has been extended to support 2MB mappings,
> > > we can replace the create_mappings() call by map_pages_to_xen() call.
> > > 
> > > This has the advantage to remove the different between 32-bit and 64-bit
> > > code.
> > > 
> > > Lastly remove create_mappings() as there is no more callers.
> > > 
> > > Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > 
> > > ---
> > >      Changes in v2:
> > >          - New patch
> > > 
> > >      TODO:
> > >          - Add support for setting the contiguous bit
> > > ---
> > >   xen/arch/arm/mm.c | 64 +++++------------------------------------------
> > >   1 file changed, 6 insertions(+), 58 deletions(-)
> > > 
> > > diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> > > index c49403b687f5..5f8ae029dd6d 100644
> > > --- a/xen/arch/arm/mm.c
> > > +++ b/xen/arch/arm/mm.c
> > > @@ -359,40 +359,6 @@ void clear_fixmap(unsigned map)
> > >       BUG_ON(res != 0);
> > >   }
> > >   -/* Create Xen's mappings of memory.
> > > - * Mapping_size must be either 2MB or 32MB.
> > > - * Base and virt must be mapping_size aligned.
> > > - * Size must be a multiple of mapping_size.
> > > - * second must be a contiguous set of second level page tables
> > > - * covering the region starting at virt_offset. */
> > > -static void __init create_mappings(lpae_t *second,
> > > -                                   unsigned long virt_offset,
> > > -                                   unsigned long base_mfn,
> > > -                                   unsigned long nr_mfns,
> > > -                                   unsigned int mapping_size)
> > > -{
> > > -    unsigned long i, count;
> > > -    const unsigned long granularity = mapping_size >> PAGE_SHIFT;
> > > -    lpae_t pte, *p;
> > > -
> > > -    ASSERT((mapping_size == MB(2)) || (mapping_size == MB(32)));
> > > -    ASSERT(!((virt_offset >> PAGE_SHIFT) % granularity));
> > > -    ASSERT(!(base_mfn % granularity));
> > > -    ASSERT(!(nr_mfns % granularity));
> > > -
> > > -    count = nr_mfns / LPAE_ENTRIES;
> > > -    p = second + second_linear_offset(virt_offset);
> > > -    pte = mfn_to_xen_entry(_mfn(base_mfn), MT_NORMAL);
> > > -    if ( granularity == 16 * LPAE_ENTRIES )
> > > -        pte.pt.contig = 1;  /* These maps are in 16-entry contiguous
> > > chunks. */
> > > -    for ( i = 0; i < count; i++ )
> > > -    {
> > > -        write_pte(p + i, pte);
> > > -        pte.pt.base += 1 << LPAE_SHIFT;
> > > -    }
> > > -    flush_xen_tlb_local();
> > > -}
> > > -
> > >   #ifdef CONFIG_DOMAIN_PAGE
> > >   void *map_domain_page_global(mfn_t mfn)
> > >   {
> > > @@ -850,36 +816,18 @@ void __init setup_frametable_mappings(paddr_t ps,
> > > paddr_t pe)
> > >       unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
> > >       mfn_t base_mfn;
> > >       const unsigned long mapping_size = frametable_size < MB(32) ? MB(2)
> > > : MB(32);
> > > -#ifdef CONFIG_ARM_64
> > > -    lpae_t *second, pte;
> > > -    unsigned long nr_second;
> > > -    mfn_t second_base;
> > > -    int i;
> > > -#endif
> > > +    int rc;
> > >         frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
> > >       /* Round up to 2M or 32M boundary, as appropriate. */
> > >       frametable_size = ROUNDUP(frametable_size, mapping_size);
> > >       base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT,
> > > 32<<(20-12));
> > >   -#ifdef CONFIG_ARM_64
> > > -    /* Compute the number of second level pages. */
> > > -    nr_second = ROUNDUP(frametable_size, FIRST_SIZE) >> FIRST_SHIFT;
> > > -    second_base = alloc_boot_pages(nr_second, 1);
> > > -    second = mfn_to_virt(second_base);
> > > -    for ( i = 0; i < nr_second; i++ )
> > > -    {
> > > -        clear_page(mfn_to_virt(mfn_add(second_base, i)));
> > > -        pte = mfn_to_xen_entry(mfn_add(second_base, i), MT_NORMAL);
> > > -        pte.pt.table = 1;
> > > -
> > > write_pte(&xen_first[first_table_offset(FRAMETABLE_VIRT_START)+i], pte);
> > > -    }
> > > -    create_mappings(second, 0, mfn_x(base_mfn), frametable_size >>
> > > PAGE_SHIFT,
> > > -                    mapping_size);
> > > -#else
> > > -    create_mappings(xen_second, FRAMETABLE_VIRT_START, mfn_x(base_mfn),
> > > -                    frametable_size >> PAGE_SHIFT, mapping_size);
> > > -#endif
> > > +    /* XXX: Handle contiguous bit */
> > > +    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
> > > +                          frametable_size >> PAGE_SHIFT,
> > > PAGE_HYPERVISOR_RW);
> > > +    if ( rc )
> > > +        panic("Unable to setup the frametable mappings.\n");
> > 
> > This is a lot better.
> > 
> > I take that "XXX: Handle contiguous bit" refers to the lack of
> > _PAGE_BLOCK. Why can't we just | _PAGE_BLOCK like in other places?
> 
> I forgot to add _PAGE_BLOCK, however this is unrelated to my comment.
> 
> Currently, the frametable is mapped using 2MB mapping and setting the
> contiguous bit for each entry if the mapping is 32MB aligned.
> 
> _PAGE_BLOCK will only create 2MB mapping but will not set the contiguous bit.
> This will increase the pressure on the TLBs (we would get 16 entry rather than
> 1) if on system where the TLBs can take advantange of it.
> 
> So map_pages_to_xen() needs to gain support for contiguous bit. I haven't yet
> looked at it (hence the RFC state).

I see, thanks for the explanation

