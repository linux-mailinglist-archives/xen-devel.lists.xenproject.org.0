Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0665A2859
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 15:17:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393876.633062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRZCy-0004jC-OZ; Fri, 26 Aug 2022 13:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393876.633062; Fri, 26 Aug 2022 13:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRZCy-0004g7-Li; Fri, 26 Aug 2022 13:17:12 +0000
Received: by outflank-mailman (input) for mailman id 393876;
 Fri, 26 Aug 2022 13:17:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oRZCw-0004g1-Tz
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 13:17:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oRZCw-0000pr-NE; Fri, 26 Aug 2022 13:17:10 +0000
Received: from [54.239.6.187] (helo=[192.168.16.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oRZCw-0003OS-D1; Fri, 26 Aug 2022 13:17:10 +0000
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
	bh=TwziuoZ2Tquc/OoLUWuF1x7NUGZaFT1iIuhtbuC+UZw=; b=hJz7hf/uyGLOIKUiJBmTKmE1FW
	D5FDEFPrClGTHwiaX7+J1wzAdM9VNfap7/1U9aQkrM2CWRqjEKhXUbshl7cur3/4dLlx4aSN4Q6aC
	JyRskTjDzngWN2ayHxfqf+qPHwQ9kcc4nvKJB9z5bw01oVVSJIi8ZLXeusuJm6e8Rnac=;
Message-ID: <ce6c2e20-2d5f-dccc-e4d0-0e8ce92caeb4@xen.org>
Date: Fri, 26 Aug 2022 14:17:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v6 1/9] xen/arm: introduce static shared memory
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220721132115.3015761-1-Penny.Zheng@arm.com>
 <20220721132115.3015761-2-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220721132115.3015761-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 21/07/2022 14:21, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> This patch series introduces a new feature: setting up static
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
> ---
> v6 change:
> - when host physical address is ommited, output the error message since
> xen doesn't support it at the moment
> - add the following check: 1) The shm ID matches and the region exactly match
> 2) The shm ID doesn't match and the region doesn't overlap
> - change it to "unsigned int" to be aligned with nr_banks
> - check the len of the property to confirm is it big enough to
> contain "paddr", "size", and "gaddr"
> - shm_id defined before nr_shm_domain, so we could re-use the existing hole and
> avoid increasing the size of the structure.
> - change "nr_shm_domain" to "nr_shm_borrowers", to not increment if the role
> is owner in parsing code
> - make "xen,shm_id" property as arbitrary string, with a strict limit on
> the number of characters, MAX_SHM_ID_LENGTH
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
>   docs/misc/arm/device-tree/booting.txt | 124 ++++++++++++++++++++
>   xen/arch/arm/Kconfig                  |   6 +
>   xen/arch/arm/bootfdt.c                | 157 ++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/setup.h      |   9 ++
>   4 files changed, 296 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 98253414b8..8013fb98fe 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -378,3 +378,127 @@ device-tree:
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
> +    An arbitrary string that represents the unique identifier of the shared
> +    memory region, with a strict limit on the number of characters(\0 included),
> +    `MAX_SHM_ID_LENGTH(16)`. e.g. "xen,shm-id = "my-shared-mem-1"".
> +
> +- xen,shared-mem
> +
> +    An array takes a physical address, which is the base address of the
> +    shared memory region in host physical address space, a size, and a guest
> +    physical address, as the target address of the mapping.
> +    e.g. xen,shared-mem = < [host physical address] [size] [guest address] >

Your implementation below is checking for overlap and also have some 
restriction. Can they be documented in the binding?

> +
> +    The number of cells for the host address (and size) is the same as the
> +    guest pseudo-physical address and they are inherited from the parent node.

In v5, we discussed to have the host address optional. However, the 
binding has not been updated to reflect that. Note that I am not asking 
to implement, but instead request that the binding can be used for such 
setup.

> +
> +
> +- role (Optional)
> +
> +    A string property specifying the ownership of a shared memory region,
> +    the value must be one of the following: "owner", or "borrower"
> +    A shared memory region could be explicitly backed by one domain, which is
> +    called "owner domain", and all the other domains who are also sharing
> +    this region are called "borrower domain".
> +    If not specified, the default value is "borrower" and owner is
> +    DOMID_IO, a system domain.
> +
> +As an example:
> +
> +chosen {
> +    #address-cells = <0x1>;
> +    #size-cells = <0x1>;
> +    xen,xen-bootargs = "console=dtuart dtuart=serial0 bootscrub=0";
> +
> +    ......
> +
> +    /* this is for Dom0 */
> +    dom0-shared-mem@10000000 {
> +        compatible = "xen,domain-shared-memory-v1";
> +        role = "owner";
> +        xen,shm-id = "my-shared-mem-0";
> +        xen,shared-mem = <0x10000000 0x10000000 0x10000000>;
> +    }
> +
> +    domU1 {
> +        compatible = "xen,domain";
> +        #address-cells = <0x1>;
> +        #size-cells = <0x1>;
> +        memory = <0 131072>;
> +        cpus = <2>;
> +        vpl011;
> +
> +        /*
> +         * shared memory region identified as 0x0(xen,shm-id = <0x0>)
> +         * is shared between Dom0 and DomU1.
> +         */
> +        domU1-shared-mem@10000000 {
> +            compatible = "xen,domain-shared-memory-v1";
> +            role = "borrower";
> +            xen,shm-id = "my-shared-mem-0";
> +            xen,shared-mem = <0x10000000 0x10000000 0x50000000>;
> +        }
> +
> +        /*
> +         * shared memory region identified as 0x1(xen,shm-id = <0x1>)
> +         * is shared between DomU1 and DomU2.
> +         */
> +        domU1-shared-mem@50000000 {
> +            compatible = "xen,domain-shared-memory-v1";
> +            xen,shm-id = "my-shared-mem-1";
> +            xen,shared-mem = <0x50000000 0x20000000 0x60000000>;
> +        }
> +
> +        ......
> +
> +    };
> +
> +    domU2 {
> +        compatible = "xen,domain";
> +        #address-cells = <0x1>;
> +        #size-cells = <0x1>;
> +        memory = <0 65536>;
> +        cpus = <1>;
> +
> +        /*
> +         * shared memory region identified as 0x1(xen,shm-id = <0x1>)
> +         * is shared between domU1 and domU2.
> +         */
> +        domU2-shared-mem@50000000 {
> +            compatible = "xen,domain-shared-memory-v1";
> +            xen,shm-id = "my-shared-mem-1";
> +            xen,shared-mem = <0x50000000 0x20000000 0x70000000>;
> +        }
> +
> +        ......
> +    };
> +};
> +
> +This is an example with two static shared memory regions.
> +
> +For the static shared memory region identified as "my-shared-mem-0", host
> +physical address starting at 0x10000000 of 256MB will be reserved to be
> +shared between Dom0 and DomU1. It will get mapped at 0x10000000 in Dom0 guest
> +physical address space, and at 0x50000000 in DomU1 guest physical address space.
> +Dom0 is explicitly defined as the owner domain, and DomU1 is the borrower domain.
> +
> +For the static shared memory region identified as "my-shared-mem-1", host
> +physical address starting at 0x50000000 of 512MB will be reserved to be
> +shared between DomU1 and DomU2. It will get mapped at 0x60000000 in DomU1 guest
> +physical address space, and at 0x70000000 in DomU2 guest physical address space.
> +DomU1 and DomU2 are both the borrower domain, the owner domain is the default
> +owner domain DOMID_IO.
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
> +	depends on STATIC_MEMORY
> +	help
> +	  This option enables statically shared memory on a dom0less system.
> +
>   endmenu
>   
>   menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index ec81a45de9..c62d8867ec 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -13,6 +13,7 @@
>   #include <xen/init.h>
>   #include <xen/efi.h>
>   #include <xen/device_tree.h>
> +#include <xen/lib.h>
>   #include <xen/libfdt/libfdt.h>
>   #include <xen/sort.h>
>   #include <xsm/xsm.h>
> @@ -361,6 +362,158 @@ static int __init process_domain_node(const void *fdt, int node,
>                                      size_cells, &bootinfo.reserved_mem, true);
>   }
>   
> +#ifdef CONFIG_STATIC_SHM
> +static int __init process_shm_node(const void *fdt, int node,
> +                                   u32 address_cells, u32 size_cells)
> +{
> +    const struct fdt_property *prop, *prop_id, *prop_role;
> +    const __be32 *cell;
> +    paddr_t paddr, size;
> +    struct meminfo *mem = &bootinfo.reserved_mem;
> +    unsigned int i;
> +    int len;
> +    bool owner = false;
> +    const char *shm_id;
> +
> +    if ( address_cells < 1 || size_cells < 1 )
> +    {
> +        printk("fdt: invalid #address-cells or #size-cells for static shared memory node.\n");
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * "xen,shm-id" property holds an arbitrary string with a strict limit
> +     * on the number of characters, MAX_SHM_ID_LENGTH
> +     */
> +    prop_id = fdt_get_property(fdt, node, "xen,shm-id", NULL);
> +    if ( !prop_id )
> +        return -ENOENT;
> +    shm_id = (const char *)prop_id->data;
> +    if ( strnlen(shm_id, MAX_SHM_ID_LENGTH) == MAX_SHM_ID_LENGTH )
> +    {
> +        printk("fdt: invalid xen,shm-id %s, it must be limited to %d characters\n",

NIT: s/%d/%u/ as MAX_SHM_ID_LENGTH can not be negative.

> +               shm_id, MAX_SHM_ID_LENGTH);
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * "role" property is optional and if it is defined explicitly,
> +     * it must be either `owner` or `borrower`.
> +     */
> +    prop_role = fdt_get_property(fdt, node, "role", NULL);
> +    if ( prop_role )
> +    {
> +        if ( !strcmp(prop_role->data, "owner") )
> +            owner = true;
> +        else if ( strcmp(prop_role->data, "borrower") )
> +        {
> +            printk("fdt: invalid `role` property for static shared memory node.\n");
> +            return -EINVAL;
> +        }
> +    }
> +
> +    /*
> +     * xen,shared-mem = <paddr, size, gaddr>;
> +     * Memory region starting from physical address #paddr of #size shall
> +     * be mapped to guest physical address #gaddr as static shared memory
> +     * region.
> +     */
> +    prop = fdt_get_property(fdt, node, "xen,shared-mem", &len);
> +    if ( !prop )
> +        return -ENOENT;
> +
> +    if ( len != dt_cells_to_size(address_cells + size_cells + address_cells) )
> +    {
> +        /* TODO: physical address is optional. */

NIT: I would drop this comment because the printk() clearly indicate 
what's unsupported.

> +        if ( len == dt_cells_to_size(size_cells + address_cells) )
> +            printk("fdt: host physical address must be chosen by users at the moment.\n");
> +
> +        printk("fdt: invalid `xen,shared-mem` property.\n");
> +        return -EINVAL;
> +    }
> +
> +    cell = (const __be32 *)prop->data;
> +    device_tree_get_reg(&cell, address_cells, size_cells, &paddr, &size);
> +
> +    if ( !size )
> +    {
> +        printk("fdt: the size for static shared memory region can not be zero\n");
> +        return -EINVAL;
> +    }
> +
> +    for ( i = 0; i < mem->nr_banks; i++ )
> +    {
> +        /*
> +         * Meet the following check:
> +         * 1) The shm ID matches and the region exactly match
> +         * 2) The shm ID doesn't match and the region doesn't overlap
> +         * with an existing one
> +         */
> +        if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
> +        {
> +            if ( strncmp(shm_id, mem->bank[i].shm_id, MAX_SHM_ID_LENGTH) == 0 )
> +                break;
> +            else
> +            {
> +                printk("fdt: xen,shm-id %s does not match for all the nodes using the same region.\n",
> +                       shm_id);
> +                return -EINVAL;
> +            }
> +        }
> +        else
> +        {
> +            paddr_t end = paddr + size;
> +            paddr_t bank_end = mem->bank[i].start + mem->bank[i].size;

In both cases, end/bank_end may end up to be lower than 
paddr/mem->bank[i].start. So I think we also want to check that they 
don't overflow.

> +
> +            if ( (end <= mem->bank[i].start) || (paddr >= bank_end) )
> +            {
> +                if ( strncmp(shm_id, mem->bank[i].shm_id,
> +                             MAX_SHM_ID_LENGTH) != 0 )

You have already validate the string. So you could use strcmp() here. 
Otherwise, it seems...

> +                    continue;
> +                else
> +                {
> +                    printk("fdt: different shared memory region could not share the same shm ID %s\n",
> +                           shm_id);

... odd to print the value if you don't trust it :).

> +                    return -EINVAL;
> +                }
> +            }
> +            else
> +            {
> +                printk("fdt: shared memory region overlap with an existing entry %#"PRIpaddr" - %#"PRIpaddr"\n",
> +                        mem->bank[i].start, bank_end);
> +                return -EINVAL;
> +            }
> +        }
> +    }
> +
> +    if ( i == mem->nr_banks )
> +    {
> +        if ( i < NR_MEM_BANKS )
> +        {
> +            /* Static shared memory shall be reserved from any other use. */
> +            safe_strcpy(mem->bank[mem->nr_banks].shm_id, shm_id);
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
> +     * keep a count of the number of borrowers, which later may be used
> +     * to calculate the reference count.
> +     */
> +    if ( !owner )
> +        mem->bank[i].nr_shm_borrowers++;
> +
> +    return 0;
> +}
> +#endif
> +
>   static int __init early_scan_node(const void *fdt,
>                                     int node, const char *name, int depth,
>                                     u32 address_cells, u32 size_cells,
> @@ -386,6 +539,10 @@ static int __init early_scan_node(const void *fdt,
>           process_chosen_node(fdt, node, name, address_cells, size_cells);
>       else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
>           rc = process_domain_node(fdt, node, name, address_cells, size_cells);
> +#ifdef CONFIG_STATIC_SHM
> +    else if ( depth <= 3 && device_tree_node_compatible(fdt, node, "xen,domain-shared-memory-v1") )
> +        rc = process_shm_node(fdt, node, address_cells, size_cells);
> +#endif
I would prefer if we provide a dummy helper for process_shm_node() when 
!CONFIG_STATIC_SHM. This would also have the advantage to let the user 
know that they are trying to use shared memory with a Xen that doesn't 
support it.

>   
>       if ( rc < 0 )
>           printk("fdt: node `%s': parsing failed\n", name);
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 2bb01ecfa8..39d4e93b8b 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -23,10 +23,19 @@ typedef enum {
>   }  bootmodule_kind;
>   
>   
> +#ifdef CONFIG_STATIC_SHM
> +/* Indicates the maximum number of characters(\0 included) for shm_id */
> +#define MAX_SHM_ID_LENGTH 16
> +#endif

Is the #ifdef really needed?

> +
>   struct membank {
>       paddr_t start;
>       paddr_t size;
>       bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
> +#ifdef CONFIG_STATIC_SHM
> +    char shm_id[MAX_SHM_ID_LENGTH];
> +    unsigned int nr_shm_borrowers;
> +#endif
>   };

If I calculated right, the structure will grow from 24 to 40 bytes. At 
the moment, this is protected with CONFIG_STATIC_SHM which is 
unsupported. However, I think we will need to do something as we can't 
continue to grow 'membank' like that.

I don't have a quick suggestion for 4.17 (the feature freeze is in a 
week). Long term, I think we will want to consider to move the shm ID in 
a separate array that could be referenced here.

The other solution would be to have the shared memory regions in a 
separate array. They would have their own structure which would either 
embedded "membank" or contain a pointer/index to the bank.

Cheers,

-- 
Julien Grall

