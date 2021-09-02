Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F63FF59C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 23:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177670.323259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLuIP-0006wu-CG; Thu, 02 Sep 2021 21:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177670.323259; Thu, 02 Sep 2021 21:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLuIP-0006uh-84; Thu, 02 Sep 2021 21:30:53 +0000
Received: by outflank-mailman (input) for mailman id 177670;
 Thu, 02 Sep 2021 21:30:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wyV=NY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mLuIN-0006ub-3k
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 21:30:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0aa8547e-0c35-11ec-aece-12813bfff9fa;
 Thu, 02 Sep 2021 21:30:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDEE4610E6;
 Thu,  2 Sep 2021 21:30:48 +0000 (UTC)
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
X-Inumbo-ID: 0aa8547e-0c35-11ec-aece-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630618249;
	bh=SLLuobHZM2VYjHSWMTHYRwcUffU8KYJOq5ruqibBR64=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f8FK93V2OYaaKdFvFnGFaHEAexfiuTJGZY97ZPySQ0CYfgMPs5/7QLlJLNCFtGSqr
	 V6rGbaRAlheJA3Abr6uN2DVei8eP3/Ts4SsIttdw7TfJCh/DgO6VbcCW447AUQbvZM
	 ph2xIHLoyjVrwLqPjl2M6tKtsDk8FG8jNq6N/jqnzeg1Svt+KdDWqtC8/16ttbDp9W
	 +b5XgW9bHlUj/dVJvOYZgUOFJt1dkuDJlS5jA2lhV20CbHBAYYj817eKDl01853ukn
	 w9R35gjESE5s3VPcnD96mB8XGlBeEivZVRtRMW9iAbX4pytLLhfLeS4zhV2ON7dkHN
	 cdJMoQML2ULsg==
Date: Thu, 2 Sep 2021 14:30:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Penny Zheng <penny.zheng@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
Subject: Re: [PATCH v5 2/7] xen/arm: introduce domain on Static Allocation
In-Reply-To: <20210824095045.2281500-3-penny.zheng@arm.com>
Message-ID: <alpine.DEB.2.21.2109021312051.26072@sstabellini-ThinkPad-T480s>
References: <20210824095045.2281500-1-penny.zheng@arm.com> <20210824095045.2281500-3-penny.zheng@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Aug 2021, Penny Zheng wrote:
> Static Allocation refers to system or sub-system(domains) for which memory
> areas are pre-defined by configuration using physical address ranges.
> Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
> beginning, shall never go to heap allocator or boot allocator for any use.
> 
> Memory can be statically allocated to a domain using the property "xen,static-
> mem" defined in the domain configuration. The number of cells for the address
> and the size must be defined using respectively the properties
> "#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".
> 
> This patch introduces this new `xen,static-mem` feature, and also documents
> and parses this new attribute at boot time.
> 
> This patch also introduces a new field "bool xen_domain" in "struct membank"
> to tell the difference of one memory bank is reserved as the whole
> hardware resource, or bind to one specific xen domain node, through
> "xen,static-mem"
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v5 changes:
> - check the node using the Xen domain binding whether contains the property
> "xen,static-mem", not the property itself
> - add "rc = ..." to get the error propagated
> - introduce new field "bool xen_domain", then static memory shall be also stored
> as reserved memory(bootinfo.reserved_mem), but being bind to one
> specific Xen domain node.
> - doc refinement
> ---
>  docs/misc/arm/device-tree/booting.txt | 33 ++++++++++++++++++++++++
>  xen/arch/arm/bootfdt.c                | 36 +++++++++++++++++++++++++--
>  xen/include/asm-arm/setup.h           |  1 +
>  3 files changed, 68 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 5243bc7fd3..95b20ddc3a 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -268,3 +268,36 @@ The DTB fragment is loaded at 0xc000000 in the example above. It should
>  follow the convention explained in docs/misc/arm/passthrough.txt. The
>  DTB fragment will be added to the guest device tree, so that the guest
>  kernel will be able to discover the device.
> +
> +
> +Static Allocation
> +=============
> +
> +Static Allocation refers to system or sub-system(domains) for which memory
> +areas are pre-defined by configuration using physical address ranges.
> +
> +Memory can be statically allocated to a domain using the property "xen,static-
> +mem" defined in the domain configuration. The number of cells for the address
> +and the size must be defined using respectively the properties
> +"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".
> +
> +Below is an example on how to specify the static memory region in the
> +device-tree:
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
> +This will reserve a 512MB region starting at the host physical address
> +0x30000000 to be exclusively used by DomU1

This binding is OK.  We might want to clarify what is the purpose of the
"memory" property when "xen,static-mem" is present. I would suggest to
write that when "xen,static-mem" is present, the "memory" property
becomes optional. Or even better:

"""
When present, the xen,static-mem property supersedes the memory property.
"""


In the future when Xen will support direct mapping, I assume that we'll
also add a direct-map property to enable it.  Something like:

    domU1 {
        compatible = "xen,domain";
        #address-cells = <0x2>;
        #size-cells = <0x2>;
        cpus = <2>;
        #xen,static-mem-address-cells = <0x1>;
        #xen,static-mem-size-cells = <0x1>;
        xen,static-mem = <0x30000000 0x20000000>;
        direct-map;
        ...
    };

Maybe I would add a statement to clarify it that xen,static-mem doesn't
automatically imply direct mapping. Something like:

"""
The static memory will be mapped in the guest at the usual guest memory
addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
xen/include/public/arch-arm.h.
"""

The rest of the patch looks OK. One minor NIT below.



> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 8c81be3379..00f34eec58 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -66,7 +66,7 @@ void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
>  static int __init device_tree_get_meminfo(const void *fdt, int node,
>                                            const char *prop_name,
>                                            u32 address_cells, u32 size_cells,
> -                                          void *data)
> +                                          void *data, bool xen_domain)
>  {
>      const struct fdt_property *prop;
>      unsigned int i, banks;
> @@ -90,6 +90,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>              continue;
>          mem->bank[mem->nr_banks].start = start;
>          mem->bank[mem->nr_banks].size = size;
> +        mem->bank[mem->nr_banks].xen_domain = xen_domain;
>          mem->nr_banks++;
>      }
>  
> @@ -184,7 +185,8 @@ static int __init process_memory_node(const void *fdt, int node,
>          return -EINVAL;
>      }
>  
> -    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells, data);
> +    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
> +                                   data, false);
>  }
>  
>  static int __init process_reserved_memory_node(const void *fdt, int node,
> @@ -338,6 +340,34 @@ static void __init process_chosen_node(const void *fdt, int node,
>      add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
>  }
>  
> +static int __init process_domain_node(const void *fdt, int node,
> +                                       const char *name,
> +                                       u32 address_cells, u32 size_cells)
> +{
> +    const struct fdt_property *prop;
> +
> +    printk("Checking for \"xen,static-mem\" in domain node\n");
> +
> +    prop = fdt_get_property(fdt, node, "xen,static-mem", NULL);
> +    if ( !prop )
> +        /* No "xen,static-mem" present. */
> +        return 0;
> +
> +    address_cells = device_tree_get_u32(fdt, node,
> +                                        "#xen,static-mem-address-cells", 0);
> +    size_cells = device_tree_get_u32(fdt, node,
> +                                     "#xen,static-mem-size-cells", 0);
> +    if ( address_cells < 1 || size_cells < 1 )
> +    {
> +        printk("fdt: node `%s': invalid #xen,static-mem-address-cells or #xen,static-mem-size-cells",
> +               name);
> +        return -EINVAL;
> +    }
> +
> +    return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
> +                                   size_cells, &bootinfo.reserved_mem, true);
> +}
> +
>  static int __init early_scan_node(const void *fdt,
>                                    int node, const char *name, int depth,
>                                    u32 address_cells, u32 size_cells,
> @@ -356,6 +386,8 @@ static int __init early_scan_node(const void *fdt,
>          process_multiboot_node(fdt, node, name, address_cells, size_cells);
>      else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
>          process_chosen_node(fdt, node, name, address_cells, size_cells);
> +    else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
> +        rc = process_domain_node(fdt, node, name, address_cells, size_cells);
>  
>      if ( rc < 0 )
>          printk("fdt: node `%s': parsing failed\n", name);
> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
> index c4b6af6029..6c3c16294b 100644
> --- a/xen/include/asm-arm/setup.h
> +++ b/xen/include/asm-arm/setup.h
> @@ -24,6 +24,7 @@ typedef enum {
>  struct membank {
>      paddr_t start;
>      paddr_t size;
> +    bool xen_domain; /* whether memory bank is bind to Xen domain. */
                                  ^ a or the      ^ bound to a 


>  };
>  
>  struct meminfo {
> -- 
> 2.25.1
> 

