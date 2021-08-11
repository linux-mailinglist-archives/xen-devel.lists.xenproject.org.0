Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BF13E92BC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 15:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166060.303275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDoL5-0003NY-S3; Wed, 11 Aug 2021 13:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166060.303275; Wed, 11 Aug 2021 13:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDoL5-0003Ku-Oz; Wed, 11 Aug 2021 13:32:11 +0000
Received: by outflank-mailman (input) for mailman id 166060;
 Wed, 11 Aug 2021 13:32:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mDoL4-0003Kn-LN
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 13:32:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDoL4-0006bA-DT; Wed, 11 Aug 2021 13:32:10 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDoL4-0003zB-6l; Wed, 11 Aug 2021 13:32:10 +0000
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
	bh=Rbd0+v3tZxtRB1VGMg/GjT7C8VAssbcdCSVQ08rPCqU=; b=dmujIkMMiDSIzqMAcCqEO0RBhX
	UGZsZ33n2Ny9Yo9iR5qrn8ugJC4tCnyR0C5M3o/BeWhkf8lxaEDvPFq9sc/xiZfENTv3GXz60disp
	3jDx4GZ5mExvmqNna9guMDNKUoNXdgvcxyKuTMP2k/pwWb1cXKTq/edCgR2kgCqA+ee0=;
Subject: Re: [PATCH V4 01/10] xen/arm: introduce domain on Static Allocation
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-2-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7c99d0dd-ef62-10a8-a11e-d2ca52910591@xen.org>
Date: Wed, 11 Aug 2021 14:32:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728102758.3269446-2-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 28/07/2021 11:27, Penny Zheng wrote:
> Static Allocation refers to system or sub-system(domains) for which memory
> areas are pre-defined by configuration using physical address ranges.
> Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
> beginning, shall never go to heap allocator or boot allocator for any use.
> 
> Domains on Static Allocation is supported through device tree property
> `xen,static-mem` specifying reserved RAM banks as this domain's guest RAM.
> By default, they shall be mapped to the fixed guest RAM address
> `GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`.
> 
> This patch introduces this new `xen,static-mem` feature, and also documents
> and parses this new attribute at boot time and stores related info in
> static_mem for later initialization.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   docs/misc/arm/device-tree/booting.txt | 40 +++++++++++++++++++++
>   xen/arch/arm/bootfdt.c                | 51 +++++++++++++++++++++++++++
>   xen/include/asm-arm/setup.h           |  2 ++
>   3 files changed, 93 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 5243bc7fd3..2a1ddca29b 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -268,3 +268,43 @@ The DTB fragment is loaded at 0xc000000 in the example above. It should
>   follow the convention explained in docs/misc/arm/passthrough.txt. The
>   DTB fragment will be added to the guest device tree, so that the guest
>   kernel will be able to discover the device.
> +
> +
> +Static Allocation
> +=============
> +
> +Static Allocation refers to system or sub-system(domains) for which memory
> +areas are pre-defined by configuration using physical address ranges.
> +Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
> +beginning, shall never go to heap allocator or boot allocator for any use.

I don't understand "as parts of RAM reserved in the beginning". Could 
you clarify it?

> +
> +Domains on Static Allocation is supported through static memory property,
> +defined under according /domUx in the name of "xen,static-mem", which are

We don't require the domU node to be called /domUx.

> +specifying physical RAM as this domain's guest RAM.
>

How about:

Memory can be statically allocated to a domain using the property 
"xen,static-mem" defined in the domain configuration.

> +The size of address-cells/size-cells must be defined in

I would say "The number of cells for the address and the size must be 
defined using respectively the properties..."

> +"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".
> +
> +On memory allocation, these pre-defined static memory ranges shall be
> +firstly mapped to the fixed guest bank "GUEST_RAM0". Until it exhausts the
> +`GUEST_RAM0_SIZE`, then it will seek to `GUEST_RAM1_BASE`, and so on.
> +`GUEST_RAM0` may take up several pre-defined physical RAM regions.

GUEST_RAM0 & co are not part of the stable ABI. So I don't think the 
documentation should mention them.

But I am not convinced we should provide a guarantee how the allocation 
will happen. Why does it matter?

> +
> +The dtb property should look like as follows:

Do you mean "node" rather than "property"?

> +
> +    / {
> +        chosen {
> +            domU1 {
> +                compatible = "xen,domain";
> +                #address-cells = <0x2>;
> +                #size-cells = <0x2>;
> +                cpus = <2>;
> +                #xen,static-mem-address-cells = <0x1>;
> +                #xen,static-mem-size-cells = <0x1>;
> +                xen,static-mem = <0x30000000 0x20000000>;
> +                ...
> +            };
> +        };
> +    };
> +
> +DomU1 will have a static memory of 512MB reserved from the physical address
> +0x30000000 to 0x50000000.

I would write "This will reserve a 512MB region starting at the host 
physical address 0x30000000 to be exclusively used by DomU1".

> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 476e32e0f5..d2714446e1 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -193,6 +193,55 @@ static int __init process_reserved_memory_node(const void *fdt, int node,
>       return 0;
>   }
>   
> +static int __init process_static_memory(const void *fdt, int node, void *data)
> +{

This is pretty much a copy of process_memory_node(). So can we avoid the 
duplication?

I think I mentionned it in the past but I can't find the outcome.

> +    int i = 0, banks;
> +    const __be32 *cell;
> +    paddr_t start, size;
> +    u32 address_cells, size_cells, reg_cells;
> +    struct meminfo *mem = data;
> +    const struct fdt_property *prop;
> +
> +
> +    address_cells = device_tree_get_u32(fdt, node,
> +                                        "#xen,static-mem-address-cells", 0);
> +    size_cells = device_tree_get_u32(fdt, node,
> +                                     "#xen,static-mem-size-cells", 0);
> +    if ( (address_cells == 0) || (size_cells == 0) )
> +    {
> +         printk("Missing \"#xen,static-mem-address-cell\" or "
> +                 "\"#xen,static-mem-address-cell\".\n");
> +         return -EINVAL;
> +    }
> +    reg_cells = address_cells + size_cells;
> +
> +    prop = fdt_get_property(fdt, node, "xen,static-mem", NULL);
> +    /*
> +     * Static memory shall belong to a specific domain, that is,
> +     * its node `domUx` has compatible string "xen,domain".
> +     */

This code is just checking the node compatible is "xen,domain". So I 
would drop the "domUx". This is also...

> +    if ( fdt_node_check_compatible(fdt, node, "xen,domain") != 0 )
> +    {
> +        printk("xen,static-mem property can only be located under /domUx node.\n");

... not correct.

> +        return -EINVAL;
> +    }
> +
> +    cell = (const __be32 *)prop->data;
> +    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
> +
> +    for ( ; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
> +    {
> +        device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
> +        mem->bank[mem->nr_banks].start = start;
> +        mem->bank[mem->nr_banks].size = size;
> +        mem->nr_banks++;
> +    }
> +
> +    if ( i < banks )
> +        return -ENOSPC;
> +    return 0;
> +}
> +
>   static int __init process_reserved_memory(const void *fdt, int node,
>                                             const char *name, int depth,
>                                             u32 address_cells, u32 size_cells)
> @@ -346,6 +395,8 @@ static int __init early_scan_node(const void *fdt,
>           process_multiboot_node(fdt, node, name, address_cells, size_cells);
>       else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
>           process_chosen_node(fdt, node, name, address_cells, size_cells);
> +    else if ( depth == 2 && fdt_get_property(fdt, node, "xen,static-mem", NULL) )

How about checking the compatible instead?

> +        process_static_memory(fdt, node, &bootinfo.static_mem);

You want "rc = ..." so the error is propaged if there is an issue (e.g. 
we don't have space for more static region).

>   
>       if ( rc < 0 )
>           printk("fdt: node `%s': parsing failed\n", name);
> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
> index c4b6af6029..e076329fc4 100644
> --- a/xen/include/asm-arm/setup.h
> +++ b/xen/include/asm-arm/setup.h
> @@ -74,6 +74,8 @@ struct bootinfo {
>   #ifdef CONFIG_ACPI
>       struct meminfo acpi;
>   #endif
> +    /* Static Memory */
> +    struct meminfo static_mem;
>   };
>   
>   extern struct bootinfo bootinfo;
> 

Cheers,

-- 
Julien Grall

