Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4707559FC5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 19:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355793.583675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4nWR-0007wx-Th; Fri, 24 Jun 2022 17:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355793.583675; Fri, 24 Jun 2022 17:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4nWR-0007tf-Q4; Fri, 24 Jun 2022 17:55:11 +0000
Received: by outflank-mailman (input) for mailman id 355793;
 Fri, 24 Jun 2022 17:55:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4nWQ-0007tZ-BT
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 17:55:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4nWP-0004J2-VN; Fri, 24 Jun 2022 17:55:09 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4nWP-0004Dn-PS; Fri, 24 Jun 2022 17:55:09 +0000
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
	bh=JO00fkty48Zh8fsa4ezsLZvRhS4z1PJ9w1aOv2dQOTE=; b=aDJ3E5qL0YU3H0sUA8+z0fBmd5
	dMdR5+bGDW2TqzVXWz2fZdXgrspWB7Pu1+axj20swOsqXlGNB/056IuV7mmDyxzB6F/goPRLZ6t49
	2k+hhQkzSKQj3cKNaU28LVsu4iSiPF1mo3iabBDrutmkEX6pNBXAqk7o2hu1b3TNS7Lk=;
Message-ID: <45a41132-1520-a894-a9eb-6688c79a660d@xen.org>
Date: Fri, 24 Jun 2022 18:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v5 1/8] xen/arm: introduce static shared memory
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-2-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220620051114.210118-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 20/06/2022 06:11, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> This patch serie introduces a new feature: setting up static

Typo: s/serie/series/

> shared memory on a dom0less system, through device tree configuration.
> 
> This commit parses shared memory node at boot-time, and reserve it in
> bootinfo.reserved_mem to avoid other use.
> 
> This commits proposes a new Kconfig CONFIG_STATIC_SHM to wrap
> static-shm-related codes, and this option depends on static memory(
> CONFIG_STATIC_MEMORY). That's because that later we want to reuse a few
> helpers, guarded with CONFIG_STATIC_MEMORY, like acquire_staticmem_pages, etc,
> on static shared memory.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> v5 change:
> - no change
> ---
> v4 change:
> - nit fix on doc
> ---
> v3 change:
> - make nr_shm_domain unsigned int
> ---
> v2 change:
> - document refinement
> - remove bitmap and use the iteration to check
> - add a new field nr_shm_domain to keep the number of shared domain
> ---
>   docs/misc/arm/device-tree/booting.txt | 120 ++++++++++++++++++++++++++
>   xen/arch/arm/Kconfig                  |   6 ++
>   xen/arch/arm/bootfdt.c                |  68 +++++++++++++++
>   xen/arch/arm/include/asm/setup.h      |   3 +
>   4 files changed, 197 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 98253414b8..6467bc5a28 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -378,3 +378,123 @@ device-tree:
>   
>   This will reserve a 512MB region starting at the host physical address
>   0x30000000 to be exclusively used by DomU1.
> +
> +Static Shared Memory
> +====================
> +
> +The static shared memory device tree nodes allow users to statically set up
> +shared memory on dom0less system, enabling domains to do shm-based
> +communication.
> +
> +- compatible
> +
> +    "xen,domain-shared-memory-v1"
> +
> +- xen,shm-id
> +
> +    An 8-bit integer that represents the unique identifier of the shared memory
> +    region. The maximum identifier shall be "xen,shm-id = <0xff>".
> +
> +- xen,shared-mem
> +
> +    An array takes a physical address, which is the base address of the
> +    shared memory region in host physical address space, a size, and a guest
> +    physical address, as the target address of the mapping. The number of cells
> +    for the host address (and size) is the same as the guest pseudo-physical
> +    address and they are inherited from the parent node.

Sorry for jump in the discussion late. But as this is going to be a 
stable ABI, I would to make sure the interface is going to be easily 
extendable.

AFAIU, with your proposal the host physical address is mandatory. I 
would expect that some user may want to share memory but don't care 
about the exact location in memory. So I think it would be good to make 
it optional in the binding.

I think this wants to be done now because it would be difficult to 
change the binding afterwards (the host physical address is the first 
set of cells).

The Xen doesn't need to handle the optional case.

[...]

> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index be9eff0141..7321f47c0f 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -139,6 +139,12 @@ config TEE
>   
>   source "arch/arm/tee/Kconfig"
>   
> +config STATIC_SHM
> +	bool "Statically shared memory on a dom0less system" if UNSUPPORTED

You also want to update SUPPORT.md.

> +	depends on STATIC_MEMORY
> +	help
> +	  This option enables statically shared memory on a dom0less system.
> +
>   endmenu
>   
>   menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index ec81a45de9..38dcb05d5d 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -361,6 +361,70 @@ static int __init process_domain_node(const void *fdt, int node,
>                                      size_cells, &bootinfo.reserved_mem, true);
>   }
>   
> +#ifdef CONFIG_STATIC_SHM
> +static int __init process_shm_node(const void *fdt, int node,
> +                                   u32 address_cells, u32 size_cells)
> +{
> +    const struct fdt_property *prop;
> +    const __be32 *cell;
> +    paddr_t paddr, size;
> +    struct meminfo *mem = &bootinfo.reserved_mem;
> +    unsigned long i;

nr_banks is "unsigned int" so I think this should be "unsigned int" as well.

> +
> +    if ( address_cells < 1 || size_cells < 1 )
> +    {
> +        printk("fdt: invalid #address-cells or #size-cells for static shared memory node.\n");
> +        return -EINVAL;
> +    }
> +
> +    prop = fdt_get_property(fdt, node, "xen,shared-mem", NULL);
> +    if ( !prop )
> +        return -ENOENT;
> +
> +    /*
> +     * xen,shared-mem = <paddr, size, gaddr>;
> +     * Memory region starting from physical address #paddr of #size shall
> +     * be mapped to guest physical address #gaddr as static shared memory
> +     * region.
> +     */
> +    cell = (const __be32 *)prop->data;
> +    device_tree_get_reg(&cell, address_cells, size_cells, &paddr, &size);

Please check the len of the property to confirm is it big enough to 
contain "paddr", "size", and "gaddr".

> +    for ( i = 0; i < mem->nr_banks; i++ )
> +    {
> +        /*
> +         * A static shared memory region could be shared between multiple
> +         * domains.
> +         */
> +        if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
> +            break;
> +    }
> +
> +    if ( i == mem->nr_banks )
> +    {
> +        if ( i < NR_MEM_BANKS )
> +        {
> +            /* Static shared memory shall be reserved from any other use. */
> +            mem->bank[mem->nr_banks].start = paddr;
> +            mem->bank[mem->nr_banks].size = size;
> +            mem->bank[mem->nr_banks].xen_domain = true;
> +            mem->nr_banks++;
> +        }
> +        else
> +        {
> +            printk("Warning: Max number of supported memory regions reached.\n");
> +            return -ENOSPC;
> +        }
> +    }
> +    /*
> +     * keep a count of the number of domains, which later may be used to
> +     * calculate the number of the reference count.
> +     */
> +    mem->bank[i].nr_shm_domain++;
> +
> +    return 0;
> +}
> +#endif
> +
>   static int __init early_scan_node(const void *fdt,
>                                     int node, const char *name, int depth,
>                                     u32 address_cells, u32 size_cells,
> @@ -386,6 +450,10 @@ static int __init early_scan_node(const void *fdt,
>           process_chosen_node(fdt, node, name, address_cells, size_cells);
>       else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
>           rc = process_domain_node(fdt, node, name, address_cells, size_cells);
> +#ifdef CONFIG_STATIC_SHM
> +    else if ( depth <= 3 && device_tree_node_compatible(fdt, node, "xen,domain-shared-memory-v1") )
> +        rc = process_shm_node(fdt, node, address_cells, size_cells);
> +#endif
>   
>       if ( rc < 0 )
>           printk("fdt: node `%s': parsing failed\n", name);
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 2bb01ecfa8..5063e5d077 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -27,6 +27,9 @@ struct membank {
>       paddr_t start;
>       paddr_t size;
>       bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
> +#ifdef CONFIG_STATIC_SHM
> +    unsigned int nr_shm_domain;
> +#endif
>   };
>   
>   struct meminfo {

Cheers,

-- 
Julien Grall

