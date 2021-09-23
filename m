Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5105E415C09
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193635.344919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTM5X-0001d3-AQ; Thu, 23 Sep 2021 10:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193635.344919; Thu, 23 Sep 2021 10:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTM5X-0001aK-5O; Thu, 23 Sep 2021 10:36:23 +0000
Received: by outflank-mailman (input) for mailman id 193635;
 Thu, 23 Sep 2021 10:36:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTM5W-0001aA-8P
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:36:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTM5V-0005VS-Qk; Thu, 23 Sep 2021 10:36:21 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTM5U-00008b-VY; Thu, 23 Sep 2021 10:36:21 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=vorgyAnbI5+9T68OIx6ZYiApShBPdVYjqchNEhNY5iU=; b=2spFwcbr5eGbwb4s6fjk6/tGnW
	3OonzNNRsw8X0J19o7VjLqdq926DJF1HuwVqI77JRztCUPr+lOXIz3FVCn4yRJDE+DRQfd0xVvMLa
	OD4AXjwC8kqPsG8xV3nJ+ZE3myOJhCzqce+rwX03EJf+MNuNBif0DWUsvbQAFiMRZrnE=;
Subject: Re: [PATCH 03/11] xen/arm: introduce 1:1 direct-map for domUs
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-4-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <27b7e2c9-168e-68ef-e372-0571b81676fc@xen.org>
Date: Thu, 23 Sep 2021 15:36:02 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210923031115.1429719-4-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 23/09/2021 08:11, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Cases where domU needs 1:1 direct-map memory map:

"1:1" and "direct-map" means pretty much the same. Given that the 
property is name "direct-map", then I would drop "1:1".

>    * IOMMU not present in the system.
>    * IOMMU disabled if it doesn't cover a specific device and all the guests
> are trusted. Thinking a mixed scenario, where a few devices with IOMMU and
> a few without, then guest DMA security still could not be totally guaranteed.
> So users may want to disable the IOMMU, to at least gain some performance
> improvement from IOMMU disabled.
>    * IOMMU disabled as a workaround when it doesn't have enough bandwidth.
> To be specific, in a few extreme situation, when multiple devices do DMA
> concurrently, these requests may exceed IOMMU's transmission capacity.
>    * IOMMU disabled when it adds too much latency on DMA. For example,
> TLB may be missing in some IOMMU hardware, which may bring latency in DMA
> progress, so users may want to disable it in some realtime scenario.
> 
> *WARNING:
> Users should be aware that it is not always secure to assign a device without
> IOMMU protection.
> When the device is not protected by the IOMMU, the administrator should make
> sure that:
>   1. The device is assigned to a trusted guest.
>   2. Users have additional security mechanism on the platform.

The two requirements are only necessary for device that are DMA-capable. 
For device that can't do DMA, it will likely be fine to assign to 
non-trusted guest.

> 
> Given that with direct-map, the IOMMU could be used but it is not required.

I can't parse it.

> This commit avoids setting XEN_DOMCTL_CDF_iommu when the IOMMU is disabled and
> direct_map is requested.
> 
> Since, for now, 1:1 direct-map is only supported when domain on Static

I think "Since" seems unnecessary.

> Allocation, that is, "xen.static-mem" is defined in the domain configuration.
> 
> This commit also re-implements allocate_static_memory to allocate static memory
> as guest RAM for 1:1 direct-map domain.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   docs/misc/arm/device-tree/booting.txt |   9 ++
>   xen/arch/arm/domain_build.c           | 117 +++++++++++++++++---------
>   2 files changed, 85 insertions(+), 41 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 44cd9e1a9a..3d637c747e 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -164,6 +164,15 @@ with the following properties:
>       Both #address-cells and #size-cells need to be specified because
>       both sub-nodes (described shortly) have reg properties.
>   
> +- direct-map
> +
> +    Optional for Domain on Static Allocation.
> +    An empty property to request the memory of the domain to be 1:1
> +    direct-map(guest physical address == physical address).
> +    WARNING: Users must be aware of this risk, that guests having access
> +    to hardware with DMA capacity must be trusted, or it could use the
> +    DMA engine to access any other memory area.

The WARNING is only applicable if the device is not protected by an 
IOMMU. So this should be clarified because one may want still want to 
use the direct-map (e.g. because the OS relies on the host layout) and 
have IOMMU enabled.

> +
>   Under the "xen,domain" compatible node, one or more sub-nodes are present
>   for the DomU kernel and ramdisk.
>   
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 21d8a559af..213ad017dc 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -488,8 +488,14 @@ static bool __init append_static_memory_to_bank(struct domain *d,
>   {
>       int res;
>       unsigned int nr_pages = PFN_DOWN(size);
> -    /* Infer next GFN. */
> -    gfn_t sgfn = gaddr_to_gfn(bank->start + bank->size);
> +    gfn_t sgfn;
> +
> +    if ( !is_domain_direct_mapped(d) )
> +        /* Infer next GFN when GFN != MFN. */
> +        sgfn = gaddr_to_gfn(bank->start + bank->size);
> +    else
> +        sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
> +
>   
>       res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
>       if ( res )
> @@ -537,14 +543,17 @@ static void __init allocate_static_memory(struct domain *d,
>       }

This function was already pretty difficult to read. So I would rather 
not add more complexity in it. Instead, I would look to split the common 
code in a separate helper or possibly duplicate it.

>       reg_cells = addr_cells + size_cells;
>   
> -    /*
> -     * The static memory will be mapped in the guest at the usual guest memory
> -     * addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
> -     * xen/include/public/arch-arm.h.
> -     */
> -    gbank = 0;
> -    gsize = ramsize[gbank];
> -    kinfo->mem.bank[gbank].start = rambase[gbank];
> +    if ( !is_domain_direct_mapped(d) )
> +    {
> +        /*
> +         * The static memory will be mapped in the guest at the usual guest
> +         * memory addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
> +         * xen/include/public/arch-arm.h.
> +         */
> +        gbank = 0;
> +        gsize = ramsize[gbank];
> +        kinfo->mem.bank[gbank].start = rambase[gbank];
> +    } >
>       cell = (const __be32 *)prop->value;
>       nr_banks = (prop->length) / (reg_cells * sizeof (u32));
> @@ -572,42 +581,58 @@ static void __init allocate_static_memory(struct domain *d,
>           printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
>                  d, bank, pbase, pbase + psize);
>   
> -        while ( 1 )
> +        if ( !is_domain_direct_mapped(d) )
>           {
> -            /* Map as much as possible the static range to the guest bank */
> -            if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank], smfn,
> -                                               min(psize, gsize)) )
> -                goto fail;
> -
> -            /*
> -             * The current physical bank is fully mapped.
> -             * Handle the next physical bank.
> -             */
> -            if ( gsize >= psize )
> +            while ( 1 )
>               {
> -                gsize = gsize - psize;
> -                break;
> +                /* Map as much as possible the static range to the guest bank */
> +                if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank],
> +                                                   smfn, min(psize, gsize)) )
> +                    goto fail;
> +
> +                /*
> +                 * The current physical bank is fully mapped.
> +                 * Handle the next physical bank.
> +                 */
> +                if ( gsize >= psize )
> +                {
> +                    gsize = gsize - psize;
> +                    break;
> +                }
> +                /*
> +                 * When current guest bank is not enough to map, exhaust
> +                 * the current one and seek to the next.
> +                 * Before seeking to the next, check if we still have available
> +                 * guest bank.
> +                 */
> +                else if ( (gbank + 1) >= GUEST_RAM_BANKS )
> +                {
> +                    printk(XENLOG_ERR "Exhausted all possible guest banks.\n");
> +                    goto fail;
> +                }
> +                else
> +                {
> +                    psize = psize - gsize;
> +                    smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
> +                    /* Update to the next guest bank. */
> +                    gbank++;
> +                    gsize = ramsize[gbank];
> +                    kinfo->mem.bank[gbank].start = rambase[gbank];
> +                }
>               }
> +        }
> +        else /* 1:1 direct-map. */
> +        {
>               /*
> -             * When current guest bank is not enough to map, exhaust
> -             * the current one and seek to the next.
> -             * Before seeking to the next, check if we still have available
> -             * guest bank.
> +             * One guest memory bank is matched with one physical
> +             * memory bank.
>                */
> -            else if ( (gbank + 1) >= GUEST_RAM_BANKS )
> -            {
> -                printk(XENLOG_ERR "Exhausted all possible guest banks.\n");
> +            gbank = bank;
> +            kinfo->mem.bank[gbank].start = pbase;
> +
> +            if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank],
> +                                               smfn, psize) )
>                   goto fail;
> -            }
> -            else
> -            {
> -                psize = psize - gsize;
> -                smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
> -                /* Update to the next guest bank. */
> -                gbank++;
> -                gsize = ramsize[gbank];
> -                kinfo->mem.bank[gbank].start = rambase[gbank];
> -            }
>           }
>   
>           tot_size += psize;
> @@ -2638,6 +2663,7 @@ void __init create_domUs(void)
>   {
>       struct dt_device_node *node;
>       const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
> +    bool direct_map = false;

This is a bit redundant for just a couple of use. Instead, you could 
directly use d_cfg.flags & XEN_DOMCTL_INTERNAL_directmap.

>   
>       BUG_ON(chosen == NULL);
>       dt_for_each_child_node(chosen, node)
> @@ -2658,8 +2684,17 @@ void __init create_domUs(void)
>               panic("Missing property 'cpus' for domain %s\n",
>                     dt_node_name(node));
>   
> +        direct_map = dt_property_read_bool(node, "direct-map");
> +        d_cfg.flags |= direct_map ? XEN_DOMCTL_INTERNAL_directmap : 0;
>           if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
> -            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> +        {
> +            if ( iommu_enabled )
> +                d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> +            else if ( !direct_map )
> +                panic("Assign a device but IOMMU and direct-map are all disabled\n");
> +            else
> +                warning_add("Please be sure of having trusted guests, when doing device assignment without IOMMU protection\n");
> +        }
>   
>           if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
>           {
> 

Cheers,

-- 
Julien Grall

