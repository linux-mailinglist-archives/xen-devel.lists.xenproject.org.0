Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD71D417E19
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 01:16:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195678.348481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTuP8-0007J6-Nb; Fri, 24 Sep 2021 23:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195678.348481; Fri, 24 Sep 2021 23:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTuP8-0007HG-KJ; Fri, 24 Sep 2021 23:14:54 +0000
Received: by outflank-mailman (input) for mailman id 195678;
 Fri, 24 Sep 2021 23:14:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTuP7-0007HA-5Q
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 23:14:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 381f411a-1d8d-11ec-bb27-12813bfff9fa;
 Fri, 24 Sep 2021 23:14:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7385E61250;
 Fri, 24 Sep 2021 23:14:50 +0000 (UTC)
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
X-Inumbo-ID: 381f411a-1d8d-11ec-bb27-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632525290;
	bh=CWMIq8TaRZSwls8j6/ZsjbJCxxFHzW2UK3jD1MhVyQ4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fv0xl2DmwVtUO+5MekrXMjHXaJwSRTkVksPm4oyvI7f/uAq6MgHCzH1B8rm/Yw0fF
	 crb58dRIF7fMmFKMJMlXwTPf7F0fkXnt+epe6co7FC3P907GijbbkaVL1QBz9TAt0S
	 /TgD5oiCBCZl//Ikvu+uhHrn9dAUuXzsH1ueG90+BWL1aJv3k11RhPq4Ate9h24Jde
	 kUAPaup0oBpASPJKgPTzKbPcvqEU8+kG31B8ZZEhg1fnWvCkIfu+GevE9rZtfahVma
	 /GDfMjZjoNLVxywVe5k4atzvwO99eAoOacl6/KuZ/WD2+PrUqp7se378f8KczJHkvY
	 YEZcQQoeGQXhw==
Date: Fri, 24 Sep 2021 16:14:49 -0700 (PDT)
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
Subject: Re: [PATCH V3 3/3] libxl/arm: Add handling of extended regions for
 DomU
In-Reply-To: <1632437334-12015-4-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2109241614300.17979@sstabellini-ThinkPad-T480s>
References: <1632437334-12015-1-git-send-email-olekstysh@gmail.com> <1632437334-12015-4-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Sep 2021, Oleksandr Tyshchenko wrote:
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
> Dom0. As we have a lot of unused space above 4GB, provide single
> 2MB-aligned region from the second RAM bank taking into the account
> the maximum supported guest address space size and the amount of
> memory assigned to the guest. The maximum size of the region is 128GB.
> The minimum size is 64MB.
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
> ---
>  tools/libs/light/libxl_arm.c  | 70 +++++++++++++++++++++++++++++++++++++++----
>  xen/include/public/arch-arm.h |  3 ++
>  2 files changed, 68 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e3140a6..a67b68e 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -598,9 +598,17 @@ static int make_timer_node(libxl__gc *gc, void *fdt,
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
> +    uint64_t region_size = 0, region_base, ramsize, bank1size,
> +        bank1end_align, bank1end_max;
> +    uint8_t gpaddr_bits;
> +    libxl_physinfo physinfo;
>      int res;
>      gic_interrupt intr;
>  
> @@ -615,9 +623,61 @@ static int make_hypervisor_node(libxl__gc *gc, void *fdt,
>                                "xen,xen");
>      if (res) return res;
>  
> -    /* reg 0 is grant table space */
> -    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
> +    if (strcmp(dom->guest_type, "xen-3.0-aarch64")) {
> +        LOG(DEBUG, "The extended regions are only supported for 64-bit guest currently");
> +        goto out;
> +    }
> +
> +    res = libxl_get_physinfo(CTX, &physinfo);
> +    assert(!res);
> +
> +    gpaddr_bits = physinfo.gpaddr_bits;
> +    assert(gpaddr_bits >= 32 && gpaddr_bits <= 48);
> +
> +    /*
> +     * Try to allocate single 2MB-aligned extended region from the second RAM
> +     * bank (above 4GB) taking into the account the maximum supported guest
> +     * address space size and the amount of memory assigned to the guest.
> +     * As the guest memory layout is not populated yet we cannot rely on
> +     * dom->rambank_size[1], so calculate the actual size of the second bank
> +     * using "max_memkb" value.
> +     */
> +    bank1end_max = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE);
> +    ramsize = b_info->max_memkb * 1024;
> +    if (ramsize <= GUEST_RAM0_SIZE)
> +        bank1size = 0;
> +    else
> +        bank1size = ramsize - GUEST_RAM0_SIZE;
> +    bank1end_align = GUEST_RAM1_BASE + ALIGN_UP_TO_2MB(bank1size);
> +
> +    if (bank1end_max <= bank1end_align) {
> +        LOG(WARN, "The extended region cannot be allocated, not enough space");
> +        goto out;
> +    }
> +
> +    if (bank1end_max - bank1end_align > GUEST_EXT_REGION_MAX_SIZE) {
> +        region_base = bank1end_max - GUEST_EXT_REGION_MAX_SIZE;
> +        region_size = GUEST_EXT_REGION_MAX_SIZE;
> +    } else {
> +        region_base = bank1end_align;
> +        region_size = bank1end_max - bank1end_align;
> +    }
> +
> +out:
> +    /*
> +     * The region 0 for grant table space must be always present. If we managed
> +     * to allocate the extended region then insert it as region 1.
> +     */
> +    if (region_size >= GUEST_EXT_REGION_MIN_SIZE) {
> +        LOG(DEBUG, "Extended region: %#"PRIx64"->%#"PRIx64"\n",
> +            region_base, region_base + region_size);
> +
> +        res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +                                2, GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE,
> +                                region_base, region_size);
> +    } else
> +        res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +                                1, GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
>      if (res) return res;
>  
>      /*
> @@ -963,7 +1023,7 @@ next_resize:
>          }
>  
>          FDT( make_timer_node(gc, fdt, ainfo, state->clock_frequency) );
> -        FDT( make_hypervisor_node(gc, fdt, vers) );
> +        FDT( make_hypervisor_node(gc, fdt, vers, info, dom) );
>  
>          if (info->arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART)
>              FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 6b5a5f8..df59933 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -449,6 +449,9 @@ typedef uint64_t xen_callback_t;
>  #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>  #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
>  
> +#define GUEST_EXT_REGION_MAX_SIZE   xen_mk_ullong(0x2000000000) /* 128GB */
> +#define GUEST_EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
> +
>  /* Current supported guest VCPUs */
>  #define GUEST_MAX_VCPUS 128
>  
> -- 
> 2.7.4
> 

