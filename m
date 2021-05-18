Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BBE38747A
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 10:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128949.242060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1livYY-0008Uk-PY; Tue, 18 May 2021 08:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128949.242060; Tue, 18 May 2021 08:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1livYY-0008RY-Lo; Tue, 18 May 2021 08:58:26 +0000
Received: by outflank-mailman (input) for mailman id 128949;
 Tue, 18 May 2021 08:58:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1livYW-0008P6-R7
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 08:58:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1livYW-00078k-Le; Tue, 18 May 2021 08:58:24 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1livYW-0002ZH-F7; Tue, 18 May 2021 08:58:24 +0000
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
	bh=g5vg7X3Q/mEzrFWNuBk1vvNTZJEr4MJvkFawdSa5SIE=; b=oBQurQcVJzTH/kAJpCn1p2qpKO
	fRBGgw8qkTDY3OJW+/yAUdZIi9Ygl/3QWj172D9juyxTkfRZ3vy09gxUCpEpu2Hd8aFw4ZrrFEJPF
	YTgTj4IJ3WkiHYRGwL/FFo17stgTjI8xEu4KHouDGbSSPfpj9LFmjjHaLMR8NmJcHGVg=;
Subject: Re: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-2-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e1b90f06-92d2-11da-c556-4081907124b8@xen.org>
Date: Tue, 18 May 2021 09:58:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518052113.725808-2-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 18/05/2021 06:21, Penny Zheng wrote:
> Static Allocation refers to system or sub-system(domains) for which memory
> areas are pre-defined by configuration using physical address ranges.
> Those pre-defined memory, -- Static Momery, as parts of RAM reserved in the

s/Momery/Memory/

> beginning, shall never go to heap allocator or boot allocator for any use.
> 
> Domains on Static Allocation is supported through device tree property
> `xen,static-mem` specifying reserved RAM banks as this domain's guest RAM.
> By default, they shall be mapped to the fixed guest RAM address
> `GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`.
> 
> This patch introduces this new `xen,static-mem` property to define static
> memory nodes in device tree file.
> This patch also documents and parses this new attribute at boot time and
> stores related info in static_mem for later initialization.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   docs/misc/arm/device-tree/booting.txt | 33 +++++++++++++++++
>   xen/arch/arm/bootfdt.c                | 52 +++++++++++++++++++++++++++
>   xen/include/asm-arm/setup.h           |  2 ++
>   3 files changed, 87 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 5243bc7fd3..d209149d71 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -268,3 +268,36 @@ The DTB fragment is loaded at 0xc000000 in the example above. It should
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
> +Those pre-defined memory, -- Static Momery, as parts of RAM reserved in the

s/Momery/Memory/

> +beginning, shall never go to heap allocator or boot allocator for any use.
> +
> +Domains on Static Allocation is supported through device tree property
> +`xen,static-mem` specifying reserved RAM banks as this domain's guest RAM.

I would suggest to use "physical RAM" when you refer to the host memory.

> +By default, they shall be mapped to the fixed guest RAM address
> +`GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`.

There are a few bits that needs to clarified or part of the description:
   1) "By default" suggests there is an alternative possibility. 
However, I don't see any.
   2) Will the first region of xen,static-mem be mapped to 
GUEST_RAM0_BASE and the second to GUEST_RAM1_BASE? What if a third 
region is specificed?
   3) We don't guarantee the base address and the size of the banks. 
Wouldn't it be better to let the admin select the region he/she wants?
   4) How do you determine the number of cells for the address and the size?

> +Static Allocation is only supported on AArch64 for now.

The code doesn't seem to be AArch64 specific. So why can't this be used 
for 32-bit Arm?

> +
> +The dtb property should look like as follows:
> +
> +        chosen {
> +            domU1 {
> +                compatible = "xen,domain";
> +                #address-cells = <0x2>;
> +                #size-cells = <0x2>;
> +                cpus = <2>;
> +                xen,static-mem = <0x0 0x30000000 0x0 0x20000000>;
> +
> +                ...
> +            };
> +        };
> +
> +DOMU1 on Static Allocation has reserved RAM bank at 0x30000000 of 512MB size

Do you mean "DomU1 will have a static memory of 512MB reserved from the 
physical address..."?

> +as guest RAM.
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index dcff512648..e9f14e6a44 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -327,6 +327,55 @@ static void __init process_chosen_node(const void *fdt, int node,
>       add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
>   }
>   
> +static int __init process_static_memory(const void *fdt, int node,
> +                                        const char *name,
> +                                        u32 address_cells, u32 size_cells,
> +                                        void *data)
> +{
> +    int i;
> +    int banks;
> +    const __be32 *cell;
> +    paddr_t start, size;
> +    u32 reg_cells = address_cells + size_cells;
> +    struct meminfo *mem = data;
> +    const struct fdt_property *prop;
> +
> +    if ( address_cells < 1 || size_cells < 1 )
> +    {
> +        printk("fdt: invalid #address-cells or #size-cells for static memory");
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * Check if static memory property belongs to a specific domain, that is,
> +     * its node `domUx` has compatible string "xen,domain".
> +     */
> +    if ( fdt_node_check_compatible(fdt, node, "xen,domain") != 0 )
> +        printk("xen,static-mem property can only locate under /domUx node.\n");
> +
> +    prop = fdt_get_property(fdt, node, name, NULL);
> +    if ( !prop )
> +        return -ENOENT;
> +
> +    cell = (const __be32 *)prop->data;
> +    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
> +
> +    for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
> +    {
> +        device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
> +        /* Some DT may describe empty bank, ignore them */
> +        if ( !size )
> +            continue;
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
>   static int __init early_scan_node(const void *fdt,
>                                     int node, const char *name, int depth,
>                                     u32 address_cells, u32 size_cells,
> @@ -345,6 +394,9 @@ static int __init early_scan_node(const void *fdt,
>           process_multiboot_node(fdt, node, name, address_cells, size_cells);
>       else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
>           process_chosen_node(fdt, node, name, address_cells, size_cells);
> +    else if ( depth == 2 && fdt_get_property(fdt, node, "xen,static-mem", NULL) )
> +        process_static_memory(fdt, node, "xen,static-mem", address_cells,
> +                              size_cells, &bootinfo.static_mem);

I am a bit concerned to add yet another method to parse the DT and all 
the extra code it will add like in patch #2.

 From the host PoV, they are memory reserved for a specific purpose. 
Would it be possible to consider the reserve-memory binding for that 
purpose? This will happen outside of chosen, but we could use a phandle 
to refer the region.

>   
>       if ( rc < 0 )
>           printk("fdt: node `%s': parsing failed\n", name);
> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
> index 5283244015..5e9f296760 100644
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

