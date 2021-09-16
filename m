Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0EB40ED68
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 00:35:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188808.338131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQzyY-0006gQ-7b; Thu, 16 Sep 2021 22:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188808.338131; Thu, 16 Sep 2021 22:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQzyY-0006dZ-41; Thu, 16 Sep 2021 22:35:26 +0000
Received: by outflank-mailman (input) for mailman id 188808;
 Thu, 16 Sep 2021 22:35:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ef7n=OG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQzyW-0006dT-MN
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 22:35:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe660cc7-c5c6-4ba4-9163-bf04931612c1;
 Thu, 16 Sep 2021 22:35:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A8426113E;
 Thu, 16 Sep 2021 22:35:22 +0000 (UTC)
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
X-Inumbo-ID: fe660cc7-c5c6-4ba4-9163-bf04931612c1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631831722;
	bh=9wf8RrJc7qaYHtjJvC7AdPnrubDpeoy0Zr2TU7L4zko=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mL2Wp6LfDlOUBgd23tUSsIcPBbkgqvjc38m+SCA6c+Y7qvoITjdMEN5IqsdoCqiIr
	 rI/uSf/+QmxnoQwUc1t45xwe3QANgYumBew/iPdG1ZeClzaxbbYMSPmwqpSPi6DDq6
	 qjkqmqyWgx9OR4Mr0A+R+Ctp+K4z1BAbRiDMq08XFGnWaAWmBlGQJoVaQZbIDSxNMB
	 sQkPYqup3vCoMgw+/4JKr0evBgmx9oZr87OkRKyaUn50SdWbXeE+9tgpAwOv4pSYqN
	 5yT3pO7S3D3gl1nzpG+U4Of93zutDTmWi5cEx8urzgWbPn8tG9wNhD0vJywrLymuyv
	 2Ty8BvY2CPXRg==
Date: Thu, 16 Sep 2021 15:35:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Henry Wang <Henry.Wang@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH V2 3/3] libxl/arm: Add handling of extended regions for
 DomU
In-Reply-To: <1631297924-8658-4-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2109161516350.21985@sstabellini-ThinkPad-T480s>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com> <1631297924-8658-4-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 Sep 2021, Oleksandr Tyshchenko wrote:
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
> - The extended region feature is only supported for 64-bit domain.
> - The ACPI case is not covered.
> 
> ***
> 
> The algorithm to choose extended regions for non-direct mapped
> DomU is simpler in comparison with the algorithm for direct mapped
> Dom0. As we have a lot of unused space above 4GB, provide single
> 1GB-aligned region from the second RAM bank taking into the account
> the maximum supported guest address space size and the amount of
> memory assigned to the guest. The maximum size of the region is 128GB.
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Changes since RFC:
>    - update patch description
>    - drop uneeded "extended-region" DT property
>    - clear reg array in finalise_ext_region() and add a TODO
> ---
>  tools/libs/light/libxl_arm.c | 89 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e3140a6..8c1d9d7 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -615,9 +615,12 @@ static int make_hypervisor_node(libxl__gc *gc, void *fdt,
>                                "xen,xen");
>      if (res) return res;
>  
> -    /* reg 0 is grant table space */
> +    /*
> +     * reg 0 is a placeholder for grant table space, reg 1 is a placeholder
> +     * for the extended region.
> +     */
>      res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
> +                            2, 0, 0, 0, 0);
>      if (res) return res;
>  
>      /*
> @@ -1069,6 +1072,86 @@ static void finalise_one_node(libxl__gc *gc, void *fdt, const char *uname,
>      }
>  }
>  
> +#define ALIGN_UP_TO_GB(x)   (((x) + GB(1) - 1) & (~(GB(1) - 1)))

Why do we need to align it to 1GB when for Dom0 is aligned to 2MB? I
think it makes sense to have the same alignment requirement.


> +
> +#define EXT_REGION_SIZE   GB(128)

The region needs to be described in xen/include/public/arch-arm.h like
GUEST_RAM1_BASE/SIZE.


> +static void finalise_ext_region(libxl__gc *gc, struct xc_dom_image *dom)
> +{
> +    void *fdt = dom->devicetree_blob;
> +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
> +    be32 *cells = &regs[0];
> +    uint64_t region_size = 0, region_base, bank1end_align, bank1end_max;
> +    uint32_t gpaddr_bits;
> +    libxl_physinfo info;
> +    int offset, rc;
> +
> +    offset = fdt_path_offset(fdt, "/hypervisor");
> +    assert(offset > 0);
> +
> +    if (strcmp(dom->guest_type, "xen-3.0-aarch64")) {
> +        LOG(WARN, "The extended region is only supported for 64-bit guest");
> +        goto out;
> +    }
> +
> +    rc = libxl_get_physinfo(CTX, &info);
> +    assert(!rc);
> +
> +    gpaddr_bits = info.gpaddr_bits;
> +    assert(gpaddr_bits >= 32 && gpaddr_bits <= 48);
> +
> +    /*
> +     * Try to allocate single 1GB-aligned extended region from the second RAM
> +     * bank (above 4GB) taking into the account the maximum supported guest
> +     * address space size and the amount of memory assigned to the guest.
> +     * The maximum size of the region is 128GB.
> +     */
> +    bank1end_max = min(1ULL << gpaddr_bits, GUEST_RAM1_BASE + GUEST_RAM1_SIZE);
> +    bank1end_align = GUEST_RAM1_BASE +
> +        ALIGN_UP_TO_GB((uint64_t)dom->rambank_size[1] << XC_PAGE_SHIFT);
> +
> +    if (bank1end_max <= bank1end_align) {
> +        LOG(WARN, "The extended region cannot be allocated, not enough space");
> +        goto out;
> +    }
> +
> +    if (bank1end_max - bank1end_align > EXT_REGION_SIZE) {
> +        region_base = bank1end_max - EXT_REGION_SIZE;
> +        region_size = EXT_REGION_SIZE;
> +    } else {
> +        region_base = bank1end_align;
> +        region_size = bank1end_max - bank1end_align;
> +    }
> +
> +out:
> +    /*
> +     * The first region for grant table space must be always present.
> +     * If we managed to allocate the extended region then insert it as
> +     * a second region.
> +     * TODO If we failed to allocate the region, we end up inserting
> +     * zero-sized region. This is because we don't know in advance when
> +     * creating hypervisor node whether it would be possible to allocate
> +     * a region, but we have to create a placeholder anyway. The Linux driver
> +     * is able to deal with by checking the region size. We cannot choose
> +     * a region when creating hypervisor node because the guest memory layout
> +     * is not know at that moment (and dom->rambank_size[1] is empty).
> +     * We need to find a way not to expose invalid regions.
> +     */

This is not great -- it would be barely spec compliant. 

When make_hypervisor_node is called we know the max memory of the guest
as build_info.max_memkb should be populate, right?

If so, we could at least detect whether we can have an extended region
(if not caculate the exact start address) from make_hypervisor_node.

total_guest_memory = build_info.max_memkb * 1024;
rambank1_approx = total_guest_memory - GUEST_RAM0_SIZE;
extended_region_size = GUEST_RAM1_SIZE - rambank1_approx;

if (extended_region_size >= MIN_EXT_REGION_SIZE)
    allocate_ext_region


> +    memset(regs, 0, sizeof(regs));
> +    set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +              GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
> +    if (region_size > 0) {

I think we want to check against a minimum amount rather than 0. Maybe 64MB?


> +        LOG(DEBUG, "Extended region: %#"PRIx64"->%#"PRIx64"\n",
> +            region_base, region_base + region_size);
> +
> +        set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +                  region_base, region_size);
> +    }
> +
> +    rc = fdt_setprop_inplace(fdt, offset, "reg", regs, sizeof(regs));
> +    assert(!rc);
> +}
> +
>  int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
>                                                 uint32_t domid,
>                                                 libxl_domain_config *d_config,
> @@ -1109,6 +1192,8 @@ int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
>  
>      }
>  
> +    finalise_ext_region(gc, dom);
> +
>      for (i = 0; i < GUEST_RAM_BANKS; i++) {
>          const uint64_t size = (uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT;
>  
> -- 
> 2.7.4
> 

