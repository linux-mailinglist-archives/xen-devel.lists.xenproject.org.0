Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFC942CAEA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 22:25:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208845.365094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maknp-0001Rb-W2; Wed, 13 Oct 2021 20:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208845.365094; Wed, 13 Oct 2021 20:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maknp-0001Oz-T1; Wed, 13 Oct 2021 20:24:41 +0000
Received: by outflank-mailman (input) for mailman id 208845;
 Wed, 13 Oct 2021 20:24:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJnr=PB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1makno-0001On-1s
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 20:24:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eaed5955-ce29-4a96-9686-1a7970222053;
 Wed, 13 Oct 2021 20:24:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23AAF60E54;
 Wed, 13 Oct 2021 20:24:36 +0000 (UTC)
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
X-Inumbo-ID: eaed5955-ce29-4a96-9686-1a7970222053
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634156676;
	bh=+UMjMy2IemJd35i1rYj5WcYDueKIDEFnLy41UpgHX38=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DANJF70636w/wve/nf0/RyRcsVD8V/mG3B+WXoUAksBLdn9m2IHW47nNuLgbHO47w
	 RS0vcIqkRrfVyG6Cakp/kk2HwV3Jx09Nhvf1nwssayWEAkFO+KOoNJKtdny3EQMKg/
	 qvfpU6TKASBhwt+vz1BX15HOt4kDNkrPAhdxMlaBIatS8SfZVF+78zxpMoY1boIQKH
	 zyBerc5JxSgNwg1YYN5ZEIIxkVYKC2tdBfkbYylrUXfbtw0NI0pq2jqy/Lxjjq54hY
	 hjicUL2WQN0j1cGlSISTCCG9Mk1BdThWP+MJiOr/A4iALwCxUWgCTy2MEagZo0gQob
	 Zb7eTA4ekGVLg==
Date: Wed, 13 Oct 2021 13:24:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for
 DomU
In-Reply-To: <510cdb07-3702-4c96-d0be-d1916e36c697@gmail.com>
Message-ID: <alpine.DEB.2.21.2110131324180.9408@sstabellini-ThinkPad-T480s>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com> <1633974539-7380-3-git-send-email-olekstysh@gmail.com> <c98c1acd-86c0-f556-643e-e472b696644f@xen.org> <51f9154f-3b65-c7c0-cd93-cecdc2a0975e@gmail.com> <641173d4-2629-e4b6-d4ec-06bd629141cc@xen.org>
 <acc06366-b381-daa0-8e2a-54c2761019af@gmail.com> <dea074a1-fad2-9b25-5b44-8de23eee83d7@gmail.com> <d076afcc-5fde-e83e-1632-371406bdd387@xen.org> <1fc5d4ae-1426-0061-a1e8-dd939de30cc3@gmail.com> <2faf58fa-2e06-635f-27fe-9ba642db27b0@xen.org>
 <0125116e-1e8a-8e68-62fb-dfc868ea76d4@gmail.com> <a9b9b16d-daf0-0bd3-cc1b-f3812f670e69@xen.org> <b2285058-360d-ebef-836e-5b87658e8847@gmail.com> <510cdb07-3702-4c96-d0be-d1916e36c697@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1500327332-1634156676=:9408"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1500327332-1634156676=:9408
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 13 Oct 2021, Oleksandr wrote:
> On 13.10.21 21:26, Oleksandr wrote:
> > 
> > On 13.10.21 20:07, Julien Grall wrote:
> > 
> > Hi Julien
> > 
> > > Hi,
> > > 
> > > On 13/10/2021 17:44, Oleksandr wrote:
> > > > On 13.10.21 19:24, Julien Grall wrote:
> > > > > On 13/10/2021 16:49, Oleksandr wrote:
> > > > > > 
> > > > > > On 13.10.21 18:15, Julien Grall wrote:
> > > > > > > On 13/10/2021 14:46, Oleksandr wrote:
> > > > > > > > 
> > > > > > > > Hi Julien
> > > > > > > 
> > > > > > > Hi Oleksandr,
> > > > > > 
> > > > > > Hi Julien
> > > > > > 
> > > > > > 
> > > > > > Thank you for the prompt response.
> > > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > > On 13.10.21 00:43, Oleksandr wrote:
> > > > > > > > diff --git a/tools/libs/light/libxl_arm.c
> > > > > > > > b/tools/libs/light/libxl_arm.c
> > > > > > > > index e3140a6..53ae0f3 100644
> > > > > > > > --- a/tools/libs/light/libxl_arm.c
> > > > > > > > +++ b/tools/libs/light/libxl_arm.c
> > > > > > > > @@ -615,9 +615,12 @@ static int make_hypervisor_node(libxl__gc
> > > > > > > > *gc, void *fdt,
> > > > > > > >                                 "xen,xen");
> > > > > > > >       if (res) return res;
> > > > > > > > 
> > > > > > > > -    /* reg 0 is grant table space */
> > > > > > > > +    /*
> > > > > > > > +     * reg 0 is a placeholder for grant table space, reg 1...N
> > > > > > > > are
> > > > > > > > +     * the placeholders for extended regions.
> > > > > > > > +     */
> > > > > > > >       res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> > > > > > > > GUEST_ROOT_SIZE_CELLS,
> > > > > > > > -                            1,GUEST_GNTTAB_BASE,
> > > > > > > > GUEST_GNTTAB_SIZE);
> > > > > > > > +                            GUEST_RAM_BANKS + 1, 0, 0, 0, 0, 0,
> > > > > > > > 0);
> > > > > > > 
> > > > > > > Here you are relying on GUEST_RAM_BANKS == 2. I think this is
> > > > > > > pretty fragile as this may change in the future.
> > > > > > > 
> > > > > > > fdt_property_regs() is not really suitable for here. I would
> > > > > > > suggest to create a new helper fdt_property_placeholder() which
> > > > > > > takes the address cells, size cells and the number of ranges. The
> > > > > > > function will then create N range that are zeroed.
> > > > > > 
> > > > > > You are right. Probably, we could add an assert here for now to be
> > > > > > triggered if "GUEST_RAM_BANKS != 2"?
> > > > > > But, if you still think we need to make it with the helper right
> > > > > > now, I will. However, I don't know how long this will take.
> > > > > 
> > > > > I would prefer if we introduce the helper now. Below a potential
> > > > > version (not compiled):
> > > > 
> > > > 
> > > > You wouldn't believe)))
> > > > I decided to not wait for the answer and re-check. So, I ended up with
> > > > the similar to what you suggested below. Thank you.
> > > > Yes, it will work if add missing locals. However, I initially named it
> > > > exactly as was suggested (fdt_property_placeholder) and got a
> > > > compilation error, since fdt_property_placeholder is already present.
> > > > So, I was thinking to choose another name or to even open-code it, but I
> > > > see you already proposed new name fdt_property_reg_placeholder.
> > > 
> > > Ah I didn't realize that libfdt already implemented
> > > fdt_property_placeholder(). The function sounds perfect for us (and the
> > > code is nicer :)), but unfortunately this was introdcued only in 2017. So
> > > it is possible that some distros may not ship the last libfdt.
> > > 
> > > So for now, I think we need to implement our own. In a follow-up we could
> > > try to provide a compat layer as we did for other missing fdt_* helpers.
> > > 
> > > Cheers,
> > 
> > 
> > Well, I hope that I addressed all your comments. If so, I will prepare V7.
> 
> 
> May I please ask, are you *preliminary* OK with new changes requested by
> Julien? The main changes are to bring finalize_*() back (hopefully there is a
> way how to downsize a placeholder), avoid relying on the fact that Bank 0 is
> always below 4GB, adding a convenient helper to create a placeholder for N
> ranges plus some code hardening, etc.

Yes, I am OK with it


> > diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> > index e3140a6..a780155 100644
> > --- a/tools/libs/light/libxl_arm.c
> > +++ b/tools/libs/light/libxl_arm.c
> > @@ -269,6 +269,21 @@ static int fdt_property_regs(libxl__gc *gc, void *fdt,
> >      return fdt_property(fdt, "reg", regs, sizeof(regs));
> >  }
> > 
> > +static int fdt_property_reg_placeholder(libxl__gc *gc, void *fdt,
> > +                                        unsigned int addr_cells,
> > +                                        unsigned int size_cells,
> > +                                        unsigned int num_regs)
> > +{
> > +    uint32_t regs[num_regs * (addr_cells + size_cells)];
> > +    be32 *cells = &regs[0];
> > +    unsigned int i;
> > +
> > +    for (i = 0; i < num_regs; i++)
> > +        set_range(&cells, addr_cells, size_cells, 0, 0);
> > +
> > +    return fdt_property(fdt, "reg", regs, sizeof(regs));
> > +}
> > +
> >  static int make_root_properties(libxl__gc *gc,
> >                                  const libxl_version_info *vers,
> >                                  void *fdt)
> > @@ -615,9 +630,13 @@ static int make_hypervisor_node(libxl__gc *gc, void
> > *fdt,
> >                                "xen,xen");
> >      if (res) return res;
> > 
> > -    /* reg 0 is grant table space */
> > -    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> > GUEST_ROOT_SIZE_CELLS,
> > -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
> > +    /*
> > +     * reg 0 is a placeholder for grant table space, reg 1...N are
> > +     * the placeholders for extended regions.
> > +     */
> > +    res = fdt_property_reg_placeholder(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
> > +                                       GUEST_ROOT_SIZE_CELLS,
> > +                                       GUEST_RAM_BANKS + 1);
> >      if (res) return res;
> > 
> >      /*
> > @@ -1069,20 +1088,93 @@ static void finalise_one_node(libxl__gc *gc, void
> > *fdt, const char *uname,
> >      }
> >  }
> > 
> > +#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
> > +
> > +#define EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
> > +
> > +static int finalize_hypervisor_node(libxl__gc *gc, struct xc_dom_image
> > *dom)
> > +{
> > +    void *fdt = dom->devicetree_blob;
> > +    uint64_t region_size[GUEST_RAM_BANKS] = {0},
> > region_base[GUEST_RAM_BANKS],
> > +        bankend[GUEST_RAM_BANKS];
> > +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> > +                  (GUEST_RAM_BANKS + 1)];
> > +    be32 *cells = &regs[0];
> > +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
> > +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
> > +    unsigned int i, len, nr_regions = 0;
> > +    libxl_dominfo info;
> > +    int offset, rc;
> > +
> > +    offset = fdt_path_offset(fdt, "/hypervisor");
> > +    if (offset < 0)
> > +        return offset;
> > +
> > +    rc = libxl_domain_info(CTX, &info, dom->guest_domid);
> > +    if (rc)
> > +        return rc;
> > +
> > +    if (info.gpaddr_bits > 64)
> > +        return ERROR_INVAL;
> > +
> > +    /*
> > +     * Try to allocate separate 2MB-aligned extended regions from the first
> > +     * and second RAM banks taking into the account the maximum supported
> > +     * guest physical address space size and the amount of memory assigned
> > +     * to the guest.
> > +     */
> > +    for (i = 0; i < GUEST_RAM_BANKS; i++) {
> > +        region_base[i] = bankbase[i] +
> > +            ALIGN_UP_TO_2MB((uint64_t)dom->rambank_size[i] <<
> > XC_PAGE_SHIFT);
> > +
> > +        bankend[i] = ~0ULL >> (64 - info.gpaddr_bits);
> > +        bankend[i] = min(bankend[i], bankbase[i] + banksize[i] - 1);
> > +        if (bankend[i] > region_base[i])
> > +            region_size[i] = bankend[i] - region_base[i] + 1;
> > +    }
> > +
> > +    /*
> > +     * The region 0 for grant table space must be always present. If we
> > managed
> > +     * to allocate the extended regions then insert them as regions 1...N.
> > +     */
> > +    set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> > +              GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
> > +
> > +    for (i = 0; i < GUEST_RAM_BANKS; i++) {
> > +        if (region_size[i] < EXT_REGION_MIN_SIZE)
> > +            continue;
> > +
> > +        LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"",
> > +            nr_regions, region_base[i], region_base[i] + region_size[i]);
> > +
> > +        set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> > +                  region_base[i], region_size[i]);
> > +        nr_regions++;
> > +    }
> > +
> > +    if (!nr_regions)
> > +        LOG(WARN, "The extended regions cannot be allocated, not enough
> > space");
> > +
> > +    len = sizeof(regs[0]) * (GUEST_ROOT_ADDRESS_CELLS +
> > GUEST_ROOT_SIZE_CELLS) *
> > +        (nr_regions + 1);
> > +
> > +    return fdt_setprop(fdt, offset, "reg", regs, len);
> > +}
> > +
> >  int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
> >                                                 uint32_t domid,
> > libxl_domain_config *d_config,
> >                                                 struct xc_dom_image *dom)
> >  {
> >      void *fdt = dom->devicetree_blob;
> > -    int i;
> > +    int i, res;
> >      const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
> > 
> >      const struct xc_dom_seg *ramdisk = dom->modules[0].blob ?
> >          &dom->modules[0].seg : NULL;
> > 
> >      if (ramdisk) {
> > -        int chosen, res;
> > +        int chosen;
> >          uint64_t val;
> > 
> >          /* Neither the fdt_path_offset() nor either of the
> > @@ -1109,6 +1201,10 @@ int
> > libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
> > 
> >      }
> > 
> > +    res = finalize_hypervisor_node(gc, dom);
> > +    if (res)
> > +        return res;
> > +
> >      for (i = 0; i < GUEST_RAM_BANKS; i++) {
> >          const uint64_t size = (uint64_t)dom->rambank_size[i] <<
> > XC_PAGE_SHIFT;
> > 
> > diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> > index d46c61f..96ead3d 100644
> > --- a/xen/include/public/arch-arm.h
> > +++ b/xen/include/public/arch-arm.h
> > @@ -438,6 +438,11 @@ typedef uint64_t xen_callback_t;
> > 
> >  #define GUEST_RAM_BANKS   2
> > 
> > +/*
> > + * The way to find the extended regions (to be exposed to the guest as
> > unused
> > + * address space) relies on the fact that the regions reserved for the RAM
> > + * below are big enough to also accommodate such regions.
> > + */
> >  #define GUEST_RAM0_BASE   xen_mk_ullong(0x40000000) /* 3GB of low RAM @ 1GB
> > */
> >  #define GUEST_RAM0_SIZE   xen_mk_ullong(0xc0000000)
> > 
> > (END)
> > 
> > 
> -- 
> Regards,
> 
> Oleksandr Tyshchenko
> 
--8323329-1500327332-1634156676=:9408--

