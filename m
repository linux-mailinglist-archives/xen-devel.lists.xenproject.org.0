Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9848B42A82F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 17:23:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207417.363242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJcB-0007gW-Rr; Tue, 12 Oct 2021 15:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207417.363242; Tue, 12 Oct 2021 15:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maJcB-0007eB-Oh; Tue, 12 Oct 2021 15:22:51 +0000
Received: by outflank-mailman (input) for mailman id 207417;
 Tue, 12 Oct 2021 15:22:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4MT=PA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1maJcA-0007e2-1P
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 15:22:50 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51189108-88eb-4a6b-ac44-ae0b12c6c4d7;
 Tue, 12 Oct 2021 15:22:48 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y15so89241219lfk.7
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 08:22:48 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id p28sm527189lfo.71.2021.10.12.08.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 08:22:47 -0700 (PDT)
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
X-Inumbo-ID: 51189108-88eb-4a6b-ac44-ae0b12c6c4d7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=hf2FXdcY4s9X1KBXkqZ5Xi2KBuIbpX3oPckN48EfHcA=;
        b=OQJyn1STCvk1Oh3mt/vSwtb31fN+UOa2GuC2ClFJCrx+BUAy1J91IfML9EeNgTONLc
         m0a0IerZnLcPwFo8UEGsOfybnhc1RhUwGFCJ/eUsfOih7TmA8F7DWrfmau4La1ygZKA3
         z/RZ77RvD7Ht/MrOXqFruXanMEx+HIKSRiM8Gz8wk+KW9KCmul5rz8UTrUvKeP+0UHMh
         Y2rnN/FR7fisYCaWhBWMzdaP90/NgNEnFl0G5+OIs4qJ6g+4vEq3LeA3aLDWP++SSnDH
         NPQ2hlrPTfn6f/T/vx+oTXZf02r4I2Di5tzB5qRjajl7bCGHRRxIf6LsUWZ6DcrJXyfC
         tN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=hf2FXdcY4s9X1KBXkqZ5Xi2KBuIbpX3oPckN48EfHcA=;
        b=rv5XoIyo7mfrel/ztVfNSC++Mn4gJbdUD2CvjimM7RBgJHHB+9tW08Wkb9NQZqCdQT
         tS2xhXpaAMAO11rzk2ChZIvH1E0lArnwEh5AWcL/QHV+QgWXiH73vpz/74DIh03cyn4e
         CPUwUabDi33T8j7PN8mjoS3L7tYILzi85M0DDJeNVHGQLfuRWGkfX9XMuJGrdE9Y1gCz
         j2ER6EXunHjaAmniW+Wqm0oSt4NZZZmNO8r+PUJybYu+VgN4Hww5CouU2oc4a7ITq/z6
         Ff7BIxE6JL1Y+Ahg41dp8EHxG2SNQmPdhbiSUcBubxgOmFxZte2jhV+bO3CMZtmUACun
         gkig==
X-Gm-Message-State: AOAM5315KjRo0iD1GOX4hbkkyfkXj0OvpWpZnkk1KSyyzjcgBFRoU5bo
	kpcAAz42m7xIey2007KS5Bk=
X-Google-Smtp-Source: ABdhPJz2/Ti1298+rt7ijsjieji4H5vFh6d1KY4M1PtEXVszO5emQtBk1sbhPN9yau08dYvuJqbpPA==
X-Received: by 2002:a05:6512:3b21:: with SMTP id f33mr6809453lfv.88.1634052167324;
        Tue, 12 Oct 2021 08:22:47 -0700 (PDT)
Subject: Re: [PATCH V6 2/2] libxl/arm: Add handling of extended regions for
 DomU
From: Oleksandr <olekstysh@gmail.com>
To: Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
 <1633974539-7380-3-git-send-email-olekstysh@gmail.com>
Message-ID: <37b38f3c-ffc6-b808-13a3-525dcac07d4e@gmail.com>
Date: Tue, 12 Oct 2021 18:22:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1633974539-7380-3-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11.10.21 20:48, Oleksandr Tyshchenko wrote:

Hi Ian, Stefano

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
>    currently.
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
> ---
> Changes RFC -> V2:
>     - update patch description
>     - drop uneeded "extended-region" DT property
>     - clear reg array in finalise_ext_region() and add a TODO
>
> Changes V2 -> V3:
>     - update patch description, comments in code
>     - only pick up regions with size >= 64MB
>     - move the region calculation to make_hypervisor_node() and drop
>       finalise_ext_region()
>     - extend the list of arguments for make_hypervisor_node()
>     - do not show warning for 32-bit domain
>     - change the region alignment from 1GB to 2MB
>     - move EXT_REGION_SIZE to public/arch-arm.h
>
> Changes V3 -> V4:
>     - add R-b, A-b and T-b
>
> Changes V4 -> V5:
>     - update patch description and comments in code
>     - reflect changes done in previous patch to pass gpaddr_bits
>       via createdomain domctl (struct xen_arch_domainconfig)
>     - drop R-b, A-b and T-b
>     - drop limit for maximum extended region size (128GB)
>     - try to also allocate region below 4GB, optimize code
>       for calculating extended regions
>
> Change V5 -> V6:
>     - reflect changes done in previous patch to pass gpaddr_bits
>       via getdomaininfo domctl (struct xen_domctl_getdomaininfo)
>     - reduce the number of local variables, rework calculations
> ---
>   tools/libs/light/libxl_arm.c  | 76 ++++++++++++++++++++++++++++++++++++++++---
>   xen/include/public/arch-arm.h |  2 ++
>   2 files changed, 73 insertions(+), 5 deletions(-)
>
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e3140a6..c0e8415 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -598,9 +598,20 @@ static int make_timer_node(libxl__gc *gc, void *fdt,
>       return 0;
>   }
>   
> +#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))
> +
>   static int make_hypervisor_node(libxl__gc *gc, void *fdt,
> -                                const libxl_version_info *vers)
> +                                const libxl_version_info *vers,
> +                                const libxl_domain_build_info *b_info,
> +                                const struct xc_dom_image *dom)
>   {
> +    uint64_t region_size[GUEST_RAM_BANKS] = {0}, region_base[GUEST_RAM_BANKS],
> +        bank1end, ramsize;
> +    uint32_t regs[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
> +                  (GUEST_RAM_BANKS + 1)];
> +    be32 *cells = &regs[0];
> +    unsigned int i, len, nr_regions = 0;
> +    libxl_dominfo info;
>       int res;
>       gic_interrupt intr;
>   
> @@ -615,9 +626,64 @@ static int make_hypervisor_node(libxl__gc *gc, void *fdt,
>                                 "xen,xen");
>       if (res) return res;
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

If this appears to be the last version, may I please ask to remove 
unneeded "\n" in the message above while committing? Thank you.


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
>       if (res) return res;
>   
>       /*
> @@ -963,7 +1029,7 @@ next_resize:
>           }
>   
>           FDT( make_timer_node(gc, fdt, ainfo, state->clock_frequency) );
> -        FDT( make_hypervisor_node(gc, fdt, vers) );
> +        FDT( make_hypervisor_node(gc, fdt, vers, info, dom) );
>   
>           if (info->arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART)
>               FDT( make_vpl011_uart_node(gc, fdt, ainfo, dom) );
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index d46c61f..19ca2b0 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -451,6 +451,8 @@ typedef uint64_t xen_callback_t;
>   #define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE, GUEST_RAM1_BASE }
>   #define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE, GUEST_RAM1_SIZE }
>   
> +#define GUEST_EXT_REGION_MIN_SIZE   xen_mk_ullong(0x0004000000) /* 64MB */
> +
>   /* Current supported guest VCPUs */
>   #define GUEST_MAX_VCPUS 128
>   

-- 
Regards,

Oleksandr Tyshchenko


