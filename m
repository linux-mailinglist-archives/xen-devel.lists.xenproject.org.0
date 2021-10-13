Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AD042C4A9
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 17:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208623.364820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafyI-0000VO-4K; Wed, 13 Oct 2021 15:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208623.364820; Wed, 13 Oct 2021 15:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafyI-0000Td-05; Wed, 13 Oct 2021 15:15:10 +0000
Received: by outflank-mailman (input) for mailman id 208623;
 Wed, 13 Oct 2021 15:15:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mafyG-0000Sm-Sk
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 15:15:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mafyF-0007cE-17; Wed, 13 Oct 2021 15:15:07 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.17.188]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mafyE-0001Pl-Qb; Wed, 13 Oct 2021 15:15:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=p0NTIthwzg4fLyeSq/oiRRGmFQWHTU3rVQ40+G/ZVbo=; b=nyLOCgUwdX0G34o9+k9VOhyy8W
	zT2JoSyRSgWU+aM0tDjW5Vz8S/KHg3mUiUDull1/tsCCivnMgJp3BHkWAImdKxhimsZJ1PuJPWPLx
	a8bR1WmkLrzyvNK/mqirOKfTY2HCV8+4z/RR14VkcLQx7XzByrLVXqRJdW6YKCvTZCSs=;
Message-ID: <d076afcc-5fde-e83e-1632-371406bdd387@xen.org>
Date: Wed, 13 Oct 2021 16:15:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for
 DomU
To: Oleksandr <olekstysh@gmail.com>
Cc: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
 <1633974539-7380-3-git-send-email-olekstysh@gmail.com>
 <c98c1acd-86c0-f556-643e-e472b696644f@xen.org>
 <51f9154f-3b65-c7c0-cd93-cecdc2a0975e@gmail.com>
 <641173d4-2629-e4b6-d4ec-06bd629141cc@xen.org>
 <acc06366-b381-daa0-8e2a-54c2761019af@gmail.com>
 <dea074a1-fad2-9b25-5b44-8de23eee83d7@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dea074a1-fad2-9b25-5b44-8de23eee83d7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/10/2021 14:46, Oleksandr wrote:
> 
> Hi Julien

Hi Oleksandr,

> On 13.10.21 00:43, Oleksandr wrote:
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e3140a6..53ae0f3 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -615,9 +615,12 @@ static int make_hypervisor_node(libxl__gc *gc, void 
> *fdt,
>                                 "xen,xen");
>       if (res) return res;
> 
> -    /* reg 0 is grant table space */
> +    /*
> +     * reg 0 is a placeholder for grant table space, reg 1...N are
> +     * the placeholders for extended regions.
> +     */
>       res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, 
> GUEST_ROOT_SIZE_CELLS,
> -                            1,GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
> +                            GUEST_RAM_BANKS + 1, 0, 0, 0, 0, 0, 0);

Here you are relying on GUEST_RAM_BANKS == 2. I think this is pretty 
fragile as this may change in the future.

fdt_property_regs() is not really suitable for here. I would suggest to 
create a new helper fdt_property_placeholder() which takes the address 
cells, size cells and the number of ranges. The function will then 
create N range that are zeroed.

>       if (res) return res;
> 
>       /*
> @@ -1069,6 +1072,74 @@ static void finalise_one_node(libxl__gc *gc, void 
> *fdt, const char *uname,
>       }
>   }
> 
> +#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
> +
> +static void finalise_ext_region(libxl__gc *gc, struct xc_dom_image *dom)

The function is doing more than finalizing extend regions, it also 
create the grant table regs. So how about naming it: 
finalize_hypervisor_node()?

> +{
> +    void *fdt = dom->devicetree_blob;
> +    uint64_t region_size[GUEST_RAM_BANKS] = {0}, 
> region_base[GUEST_RAM_BANKS],
> +        bankend[GUEST_RAM_BANKS];
> +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> +                  (GUEST_RAM_BANKS + 1)];
> +    be32 *cells = &regs[0];
> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
> +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
> +    unsigned int i, len, nr_regions = 0;
> +    libxl_dominfo info;
> +    int offset, rc;
> +
> +    offset = fdt_path_offset(fdt, "/hypervisor");
> +    assert(offset > 0);
> +
> +    rc = libxl_domain_info(CTX, &info, dom->guest_domid);
> +    assert(!rc);
> +
> +    assert(info.gpaddr_bits <= 64);

Neither of the two should be assert(). They should be proper check so we 
don't end up with a disaster (in particularly for the former) if there 
is a problem.

> +
> +    /*
> +     * Try to allocate separate 2MB-aligned extended regions from the 
> first
> +     * and second RAM banks taking into the account the maximum supported
> +     * guest physical address space size and the amount of memory assigned
> +     * to the guest.
> +     */
> +    for (i = 0; i < GUEST_RAM_BANKS; i++) {
> +        region_base[i] = bankbase[i] +
> +            ALIGN_UP_TO_2MB((uint64_t)dom->rambank_size[i] << 
> XC_PAGE_SHIFT);
> +
> +        bankend[i] = ~0ULL >> (64 - info.gpaddr_bits);
> +        bankend[i] = min(bankend[i], bankbase[i] + banksize[i] - 1);
> +        if (bankend[i] > region_base[i])
> +            region_size[i] = bankend[i] - region_base[i] + 1;
> +    } > +
> +    /*
> +     * The region 0 for grant table space must be always present. If we 
> managed
> +     * to allocate the extended regions then insert them as regions 1...N.
> +     */
> +    set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +              GUEST_GNTTAB_BASE, GUEST_GNTTAB_SIZE);
> +
> +    for (i = 0; i < GUEST_RAM_BANKS; i++) {
> +        if (region_size[i] < GUEST_EXT_REGION_MIN_SIZE)
> +            continue;
> +
> +        LOG(DEBUG, "Extended region %u: %#"PRIx64"->%#"PRIx64"",
> +            nr_regions, region_base[i], region_base[i] + region_size[i]);
> +
> +        set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +                  region_base[i], region_size[i]);
> +        nr_regions++;
> +    }
> +
> +    if (!nr_regions)
> +        LOG(WARN, "The extended regions cannot be allocated, not enough 
> space");
> +
> +    len = sizeof(regs[0]) * (GUEST_ROOT_ADDRESS_CELLS + 
> GUEST_ROOT_SIZE_CELLS) *
> +        (nr_regions + 1);
> +    rc = fdt_setprop(fdt, offset, "reg", regs, len);
> +    assert(!rc);

We should propagate the error.

> +}
> +
>   int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
>                                                  uint32_t domid,
> libxl_domain_config *d_config,
> @@ -1109,6 +1180,8 @@ int 
> libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
> 
>       }
> 
> +    finalise_ext_region(gc, dom);
> +
>       for (i = 0; i < GUEST_RAM_BANKS; i++) {
>           const uint64_t size = (uint64_t)dom->rambank_size[i] << 
> XC_PAGE_SHIFT;
> 
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index d46c61f..7425a78 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -438,6 +438,11 @@ typedef uint64_t xen_callback_t;
> 
>   #define GUEST_RAM_BANKS   2
> 
> +/*
> + * The way to find the extended regions (to be exposed to the guest as 
> unused
> + * address space) relies on the fact that the regions reserved for the RAM
> + * below are big enough to also accommodate such regions.
> + */
>   #define GUEST_RAM0_BASE   xen_mk_ullong(0x40000000) /* 3GB of low RAM 
> @ 1GB */
>   #define GUEST_RAM0_SIZE   xen_mk_ullong(0xc0000000)
> 
> @@ -451,6 +456,8 @@ typedef uint64_t xen_callback_t;
>   #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>   #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
> 
> +#define GUEST_EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */

I would prefer if this value is not part of the public header because 
this is not a value that the hypervisor needs to know. So it is better 
to restrict it to the libxl_arm.c

Cheers,

-- 
Julien Grall

