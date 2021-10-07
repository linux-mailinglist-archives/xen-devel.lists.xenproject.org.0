Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82898425D4E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 22:29:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203987.359181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYa1G-0000MT-3Z; Thu, 07 Oct 2021 20:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203987.359181; Thu, 07 Oct 2021 20:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYa1F-0000KW-UU; Thu, 07 Oct 2021 20:29:33 +0000
Received: by outflank-mailman (input) for mailman id 203987;
 Thu, 07 Oct 2021 20:29:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8Z=O3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYa1E-0000KG-4O
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 20:29:32 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4642fe60-27ad-11ec-bffe-12813bfff9fa;
 Thu, 07 Oct 2021 20:29:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9451D60E9B;
 Thu,  7 Oct 2021 20:29:29 +0000 (UTC)
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
X-Inumbo-ID: 4642fe60-27ad-11ec-bffe-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633638570;
	bh=SP/aVU7N1bYm0SQFPaqlpEYaMMfb/rN8YYdpgwRRJH8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pw1N26NxqdyBuyr4Lh6rqQagN2DnE6Amuz0YBtSDazjB8EjYURBmcuN59IpO+cbGd
	 SsXE1pbvzqf18QRdrFGzaEhYqabcjwbWIe9XqESDb+VUyRtso1o/+8KRcN5VJTZRbx
	 OHCDhdR/ClkEWDEVogauu0gu6zGlL79c6ajmVPXDiVBb0SoGPSw/ar9jbxEGUY1c9c
	 dtukUYz/RUD9ZWfMNg36MI/je/m6rGh2HZ3BDEStvRSnFqS3d8VCGudNFq2UnGfMzI
	 1xIR/LrdsMw2IuxDEG7HsH/Ke/oLllJjfR5jrSV9u1UtgdFpbH26MfHr+evITnEPJn
	 7HIkT+qTd9Ycw==
Date: Thu, 7 Oct 2021 13:29:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V5 2/3] libxl/arm: Add handling of extended regions for
 DomU
In-Reply-To: <9a4fb8be-e893-bd7f-fe77-7274457e2b04@gmail.com>
Message-ID: <alpine.DEB.2.21.2110071327520.414@sstabellini-ThinkPad-T480s>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com> <1633519346-3686-3-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2110061808570.3209@sstabellini-ThinkPad-T480s> <9a4fb8be-e893-bd7f-fe77-7274457e2b04@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-942583794-1633638569=:414"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-942583794-1633638569=:414
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 7 Oct 2021, Oleksandr wrote:
> On 07.10.21 04:29, Stefano Stabellini wrote:
> 
> Hi Stefano
> 
> > On Wed, 6 Oct 2021, Oleksandr Tyshchenko wrote:
> > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > 
> > > The extended region (safe range) is a region of guest physical
> > > address space which is unused and could be safely used to create
> > > grant/foreign mappings instead of wasting real RAM pages from
> > > the domain memory for establishing these mappings.
> > > 
> > > The extended regions are chosen at the domain creation time and
> > > advertised to it via "reg" property under hypervisor node in
> > > the guest device-tree. As region 0 is reserved for grant table
> > > space (always present), the indexes for extended regions are 1...N.
> > > If extended regions could not be allocated for some reason,
> > > Xen doesn't fail and behaves as usual, so only inserts region 0.
> > > 
> > > Please note the following limitations:
> > > - The extended region feature is only supported for 64-bit domain
> > >    currently.
> > > - The ACPI case is not covered.
> > > 
> > > ***
> > > 
> > > The algorithm to choose extended regions for non-direct mapped
> > > DomU is simpler in comparison with the algorithm for direct mapped
> > > Dom0. We usually have a lot of unused space above 4GB, and might
> > > have some unused space below 4GB (depends on guest memory size).
> > > Try to allocate separate 2MB-aligned extended regions from the first
> > > (below 4GB) and second (above 4GB) RAM banks taking into the account
> > > the maximum supported guest physical address space size and the amount
> > > of memory assigned to the guest. The minimum size of extended region
> > > the same as for Dom0 (64MB).
> > > 
> > > Suggested-by: Julien Grall <jgrall@amazon.com>
> > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > ---
> > > ! Stefano, Ian, Michal I dropped your A-b/R-b. I decided to change patch
> > > to make it more functional !
> > > 
> > > Changes RFC -> V2:
> > >     - update patch description
> > >     - drop uneeded "extended-region" DT property
> > >     - clear reg array in finalise_ext_region() and add a TODO
> > > 
> > > Changes V2 -> V3:
> > >     - update patch description, comments in code
> > >     - only pick up regions with size >= 64MB
> > >     - move the region calculation to make_hypervisor_node() and drop
> > >       finalise_ext_region()
> > >     - extend the list of arguments for make_hypervisor_node()
> > >     - do not show warning for 32-bit domain
> > >     - change the region alignment from 1GB to 2MB
> > >     - move EXT_REGION_SIZE to public/arch-arm.h
> > > 
> > > Changes V3 -> V4:
> > >     - add R-b, A-b and T-b
> > > 
> > > Changes V4 -> V5:
> > >     - update patch description and comments in code
> > >     - reflect changes done in previous patch to pass gpaddr_bits
> > >       via createdomain domctl (struct xen_arch_domainconfig)
> > >     - drop R-b, A-b and T-b
> > >     - drop limit for maximum extended region size (128GB)
> > >     - try to also allocate region below 4GB, optimize code
> > >       for calculating extended regions
> > > ---
> > >   tools/libs/light/libxl_arm.c  | 80
> > > ++++++++++++++++++++++++++++++++++++++++---
> > >   xen/include/public/arch-arm.h |  2 ++
> > >   2 files changed, 77 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> > > index 45e0386..cd743f7 100644
> > > --- a/tools/libs/light/libxl_arm.c
> > > +++ b/tools/libs/light/libxl_arm.c
> > > @@ -600,9 +600,21 @@ static int make_timer_node(libxl__gc *gc, void *fdt,
> > >       return 0;
> > >   }
> > >   +#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
> > > +
> > >   static int make_hypervisor_node(libxl__gc *gc, void *fdt,
> > > -                                const libxl_version_info *vers)
> > > +                                const libxl_version_info *vers,
> > > +                                const libxl_domain_build_info *b_info,
> > > +                                const struct xc_dom_image *dom)
> > >   {
> > > +    uint64_t region_size[GUEST_RAM_BANKS] = {0},
> > > region_base[GUEST_RAM_BANKS],
> > > +        banksize[GUEST_RAM_BANKS], bankend[GUEST_RAM_BANKS], ramsize;
> > > +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> > > +                  (GUEST_RAM_BANKS + 1)];
> > > +    be32 *cells = &regs[0];
> > > +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
> > > +    unsigned int i, len, nr_regions = 0;
> > > +    uint8_t gpaddr_bits;
> > >       int res;
> > >       gic_interrupt intr;
> > >   @@ -617,9 +629,67 @@ static int make_hypervisor_node(libxl__gc *gc, void
> > > *fdt,
> > >                                 "xen,xen");
> > >       if (res) return res;
> > >   -    /* reg 0 is grant table space */
> > > -    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> > > GUEST_ROOT_SIZE_CELLS,
> > > -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
> > > +    if (strcmp(dom->guest_type, "xen-3.0-aarch64")) {
> > > +        LOG(WARN, "The extended regions are only supported for 64-bit
> > > guest currently");
> > > +        goto out;
> > > +    }
> > > +
> > > +    gpaddr_bits = b_info->arch_arm.gpaddr_bits;
> > > +    assert(gpaddr_bits >= 32 && gpaddr_bits <= 48);
> > > +
> > > +    /*
> > > +     * Try to allocate separate 2MB-aligned extended regions from the
> > > first
> > > +     * (below 4GB) and second (above 4GB) RAM banks taking into the
> > > account
> > > +     * the maximum supported guest physical address space size and the
> > > amount
> > > +     * of memory assigned to the guest.
> > > +     * As the guest memory layout is not populated yet we cannot rely on
> > > +     * dom->rambank_size[], so calculate the actual size of both banks
> > > using
> > > +     * "max_memkb" value.
> > > +     */
> > > +    ramsize = b_info->max_memkb * 1024;
> > > +    if (ramsize <= GUEST_RAM0_SIZE) {
> > > +        banksize[0] = ramsize;
> > > +        banksize[1] = 0;
> > > +    } else {
> > > +        banksize[0] = GUEST_RAM0_SIZE;
> > > +        banksize[1] = ramsize - GUEST_RAM0_SIZE;
> > > +    }
> > > +
> > > +    bankend[0] = GUEST_RAM0_BASE + GUEST_RAM0_SIZE;
> > > +    bankend[1] = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE +
> > > GUEST_RAM1_SIZE);
> > > +
> > > +    for (i = 0; i < GUEST_RAM_BANKS; i++) {
> > > +        region_base[i] = bankbase[i] + ALIGN_UP_TO_2MB(banksize[i]);
> > > +        if (bankend[i] > region_base[i])
> > > +            region_size[i] = bankend[i] - region_base[i];
> > > +    }
> > This seems correct but it looks a bit overkill. I would have written
> > like this:
> > 
> >      if (ramsize <= GUEST_RAM0_SIZE) {
> >          region_base[0] = GUEST_RAM0_BASE + ALIGN_UP_TO_2MB(ramsize);
> >          region_size[0] = GUEST_RAM0_SIZE - ALIGN_UP_TO_2MB(ramsize);
> >          region_base[1] = GUEST_RAM1_BASE;
> >          region_size[1] = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE +
> > GUEST_RAM1_SIZE) -
> >                           region_base[0];
> Why  "- region_base[0]" in last expression? I think it should be "-
> region_base[1]", the same as for "else" case (so it can be moved out of
> if-else construct). Also we need to check
> 
> that min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE) is greater
> than region_base[1] before the subtraction. If gpaddr_bits = 32 (on Arm64) we
> will get incorrect result.
> 
> 
> >      } else {
> >          region_size[0] = 0;
> >          region_base[1] = GUEST_RAM1_BASE + ALIGN_UP_TO_2MB(ramsize -
> > GUEST_RAM0_SIZE);
> >          region_size[1] = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE +
> > GUEST_RAM1_SIZE) -
> >                           region_base[1];
> >      }
> > 
> > Which removes the needs for banksize, bankend, bankbase. What do you
> > think? Your version works too, so I am OK anyway.
> Thank you for looking into this.
> 
> I think, you version will also work with adjustments. I am OK either way. Your
> version reduces the number of locals, so probably better.  Although "min(1ULL
> << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE)" construction probably
> wants latching in local bank1end.
> 
> 
> Below the updated version:
> 
>     if (ramsize <= GUEST_RAM0_SIZE) {
>         region_base[0] = GUEST_RAM0_BASE + ALIGN_UP_TO_2MB(ramsize);
>         region_size[0] = GUEST_RAM0_SIZE - ALIGN_UP_TO_2MB(ramsize);
>         region_base[1] = GUEST_RAM1_BASE;
>     } else
>         region_base[1] = GUEST_RAM1_BASE + ALIGN_UP_TO_2MB(ramsize - GUEST_RAM0_SIZE);
> 
>     bank1end = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE);
>     if (bank1end > region_base[1])
>         region_size[1] = bank1end - region_base[1];


Yeah I like this. I'd be happy to go with it.
--8323329-942583794-1633638569=:414--

