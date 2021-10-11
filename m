Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B654297E5
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 22:00:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206544.362143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma1T6-0005sM-Tk; Mon, 11 Oct 2021 20:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206544.362143; Mon, 11 Oct 2021 20:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ma1T6-0005pX-Qb; Mon, 11 Oct 2021 20:00:16 +0000
Received: by outflank-mailman (input) for mailman id 206544;
 Mon, 11 Oct 2021 20:00:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gQnf=O7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ma1T5-0005pR-9g
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 20:00:15 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8ac4d2e-2acd-11ec-80f4-12813bfff9fa;
 Mon, 11 Oct 2021 20:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD22E6052B;
 Mon, 11 Oct 2021 20:00:12 +0000 (UTC)
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
X-Inumbo-ID: d8ac4d2e-2acd-11ec-80f4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633982413;
	bh=ygTf15c1Vzl9hOp5eIAKzulGVPoWhgm/vsmgtPkfFDA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ncqsgkb4WISD6mB0k3p884YO2Aao/2S5U37DTNdQQuBsT09BKNNhPeLOPGOAIYgDz
	 3mGqe/J+AuxSOM8NLsXRmjMUDt32X2otE3uvnfi5nnIN4NucUmd0XEKklMn98zPUSC
	 Poctbcb1LyFiDtJkiqoXuVyMISNf0LIs187rh4gQdu6Vvt77BpsnhR2U1+xC+SwZo/
	 IDlxLYHtoJAJfCj76twkFKLCEvoqvtblH19FPjORkYzDQ8GeB52A738BqLc5lqDYp8
	 1QqeNjO9awApyxrxFD8A98UF/okKyBuD8OEUM1D1J5F7Y3w9aI5n72xx+9Z4jSExxE
	 Pc7xwi+nmrFKw==
Date: Mon, 11 Oct 2021 13:00:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for
 DomU
In-Reply-To: <1633974539-7380-3-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2110111300030.25528@sstabellini-ThinkPad-T480s>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com> <1633974539-7380-3-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Oct 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The extended region (safe range) is a region of guest physical
> address space which is unused and could be safely used to create
> grant/foreign mappings instead of wasting real RAM pages from
> the domain memory for establishing these mappings.
> 
> The extended regions are chosen at the domain creation time and
> advertised to it via "reg" property under hypervisor node in
> the guest device-tree. As region 0 is reserved for grant table
> space (always present), the indexes for extended regions are 1...N.
> If extended regions could not be allocated for some reason,
> Xen doesn't fail and behaves as usual, so only inserts region 0.
> 
> Please note the following limitations:
> - The extended region feature is only supported for 64-bit domain
>   currently.
> - The ACPI case is not covered.
> 
> ***
> 
> The algorithm to choose extended regions for non-direct mapped
> DomU is simpler in comparison with the algorithm for direct mapped
> Dom0. We usually have a lot of unused space above 4GB, and might
> have some unused space below 4GB (depends on guest memory size).
> Try to allocate separate 2MB-aligned extended regions from the first
> (below 4GB) and second (above 4GB) RAM banks taking into the account
> the maximum supported guest physical address space size and the amount
> of memory assigned to the guest. The minimum size of extended region
> the same as for Dom0 (64MB).
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes RFC -> V2:
>    - update patch description
>    - drop uneeded "extended-region" DT property
>    - clear reg array in finalise_ext_region() and add a TODO
> 
> Changes V2 -> V3:
>    - update patch description, comments in code
>    - only pick up regions with size >= 64MB
>    - move the region calculation to make_hypervisor_node() and drop
>      finalise_ext_region()
>    - extend the list of arguments for make_hypervisor_node()
>    - do not show warning for 32-bit domain
>    - change the region alignment from 1GB to 2MB
>    - move EXT_REGION_SIZE to public/arch-arm.h
> 
> Changes V3 -> V4:
>    - add R-b, A-b and T-b
> 
> Changes V4 -> V5:
>    - update patch description and comments in code
>    - reflect changes done in previous patch to pass gpaddr_bits
>      via createdomain domctl (struct xen_arch_domainconfig)
>    - drop R-b, A-b and T-b
>    - drop limit for maximum extended region size (128GB)
>    - try to also allocate region below 4GB, optimize code
>      for calculating extended regions
> 
> Change V5 -> V6:
>    - reflect changes done in previous patch to pass gpaddr_bits
>      via getdomaininfo domctl (struct xen_domctl_getdomaininfo)
>    - reduce the number of local variables, rework calculations
> ---
>  tools/libs/light/libxl_arm.c  | 76 ++++++++++++++++++++++++++++++++++++++++---
>  xen/include/public/arch-arm.h |  2 ++
>  2 files changed, 73 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e3140a6..c0e8415 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -598,9 +598,20 @@ static int make_timer_node(libxl__gc *gc, void *fdt,
>      return 0;
>  }
>  
> +#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
> +
>  static int make_hypervisor_node(libxl__gc *gc, void *fdt,
> -                                const libxl_version_info *vers)
> +                                const libxl_version_info *vers,
> +                                const libxl_domain_build_info *b_info,
> +                                const struct xc_dom_image *dom)
>  {
> +    uint64_t region_size[GUEST_RAM_BANKS] = {0}, region_base[GUEST_RAM_BANKS],
> +        bank1end, ramsize;
> +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> +                  (GUEST_RAM_BANKS + 1)];
> +    be32 *cells = &regs[0];
> +    unsigned int i, len, nr_regions = 0;
> +    libxl_dominfo info;
>      int res;
>      gic_interrupt intr;
>  
> @@ -615,9 +626,64 @@ static int make_hypervisor_node(libxl__gc *gc, void *fdt,
>                                "xen,xen");
>      if (res) return res;
>  
> -    /* reg 0 is grant table space */
> -    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
> +    if (strcmp(dom->guest_type, "xen-3.0-aarch64")) {
> +        LOG(WARN, "The extended regions are only supported for 64-bit guest currently");
> +        goto out;
> +    }
> +
> +    res = libxl_domain_info(CTX, &info, dom->guest_domid);
> +    if (res) return res;
> +
> +    assert(info.gpaddr_bits >= 32 && info.gpaddr_bits <= 48);
> +
> +    /*
> +     * Try to allocate separate 2MB-aligned extended regions from the first
> +     * (below 4GB) and second (above 4GB) RAM banks taking into the account
> +     * the maximum supported guest physical address space size and the amount
> +     * of memory assigned to the guest.
> +     * As the guest memory layout is not populated yet we cannot rely on
> +     * dom->rambank_size[], so calculate the actual size of both banks using
> +     * "max_memkb" value.
> +     */
> +    ramsize = b_info->max_memkb * 1024;
> +    if (ramsize <= GUEST_RAM0_SIZE) {
> +        region_base[0] = GUEST_RAM0_BASE + ALIGN_UP_TO_2MB(ramsize);
> +        region_size[0] = GUEST_RAM0_SIZE - ALIGN_UP_TO_2MB(ramsize);
> +        region_base[1] = GUEST_RAM1_BASE;
> +    } else
> +        region_base[1] = GUEST_RAM1_BASE +
> +            ALIGN_UP_TO_2MB(ramsize - GUEST_RAM0_SIZE);
> +
> +    bank1end = min(1ULL << info.gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE);
> +    if (bank1end > region_base[1])
> +        region_size[1] = bank1end - region_base[1];
> +
> +out:
> +    /*
> +     * The region 0 for grant table space must be always present. If we managed
> +     * to allocate the extended regions then insert them as regions 1...N.
> +     */
> +    set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +              GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
> +
> +    for (i = 0; i < GUEST_RAM_BANKS; i++) {
> +        if (region_size[i] < GUEST_EXT_REGION_MIN_SIZE)
> +            continue;
> +
> +        LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"\n",
> +            nr_regions, region_base[i], region_base[i] + region_size[i]);
> +
> +        set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +                  region_base[i], region_size[i]);
> +        nr_regions++;
> +    }
> +
> +    if (!nr_regions)
> +        LOG(WARN, "The extended regions cannot be allocated, not enough space");
> +
> +    len = sizeof(regs[0]) * (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> +        (nr_regions + 1);
> +    res = fdt_property(fdt, "reg", regs, len);
>      if (res) return res;
>  
>      /*
> @@ -963,7 +1029,7 @@ next_resize:
>          }
>  
>          FDT( make_timer_node(gc, fdt, ainfo, state->clock_frequency) );
> -        FDT( make_hypervisor_node(gc, fdt, vers) );
> +        FDT( make_hypervisor_node(gc, fdt, vers, info, dom) );
>  
>          if (info->arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART)
>              FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index d46c61f..19ca2b0 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -451,6 +451,8 @@ typedef uint64_t xen_callback_t;
>  #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>  #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
>  
> +#define GUEST_EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
> +
>  /* Current supported guest VCPUs */
>  #define GUEST_MAX_VCPUS 128
>  
> -- 
> 2.7.4
> 

