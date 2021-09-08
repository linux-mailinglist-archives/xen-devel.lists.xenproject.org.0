Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834044041F6
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 01:55:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182485.330068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO7OW-0007yp-Lh; Wed, 08 Sep 2021 23:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182485.330068; Wed, 08 Sep 2021 23:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO7OW-0007wo-Ia; Wed, 08 Sep 2021 23:54:20 +0000
Received: by outflank-mailman (input) for mailman id 182485;
 Wed, 08 Sep 2021 23:54:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IK88=N6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mO7OV-0007wi-6k
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 23:54:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13fbed2c-1100-11ec-b18f-12813bfff9fa;
 Wed, 08 Sep 2021 23:54:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D58FE60F93;
 Wed,  8 Sep 2021 23:54:16 +0000 (UTC)
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
X-Inumbo-ID: 13fbed2c-1100-11ec-b18f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631145257;
	bh=9nUyLz8jYEkDv/4J+XH04a+GDFKO8RY50xUdH5tN5Pw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Nb1pZZyQrX1qFh3lL9zIXsuxNfNkWkvVFfXr2GYQFpHqI+7SBJH2kXqcoahJIqRm+
	 ku3caOLCMMcTjxEGugErVTVyl8L9Os1HEt2CJ21eshwFQeHq1Sm7MKt27/V/7d89cQ
	 050DtswCRK8hoVbj4t/6Ngb0a78xnuIXLhYDXHxDQLFwFDW2H6pS4pmxH/s10Z/X4q
	 wY8O+Ru5EKak54Kcdqp85gtEntqGseryMD0o+a7rGfyJyE3D1iESmpj/pMEfE1BTT9
	 w7LFRxcBzuBIrkkK+JlCPa9R4Ea530o8VK37te7V9l9JnH1YtwSpFDoSftCr+kfFC3
	 BxEJpZrihKXqQ==
Date: Wed, 8 Sep 2021 16:54:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Penny Zheng <penny.zheng@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com, jbeulich@suse.com
Subject: Re: [PATCH v6 2/7] xen/arm: introduce domain on Static Allocation
In-Reply-To: <20210908095248.545981-3-penny.zheng@arm.com>
Message-ID: <alpine.DEB.2.21.2109081631400.10523@sstabellini-ThinkPad-T480s>
References: <20210908095248.545981-1-penny.zheng@arm.com> <20210908095248.545981-3-penny.zheng@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Sep 2021, Penny Zheng wrote:
> Static Allocation refers to system or sub-system(domains) for which memory
> areas are pre-defined by configuration using physical address ranges.
> 
> Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
> beginning, shall never go to heap allocator or boot allocator for any use.
> 
> Memory can be statically allocated to a domain using the property "xen,static-
> mem" defined in the domain configuration. The number of cells for the address
> and the size must be defined using respectively the properties
> "#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".
> 
> The property 'memory' is still needed and should match the amount of memory
> given to the guest. Currently, it either comes from static memory or lets Xen
> allocate from heap. *Mixing* is not supported.
> 
> The static memory will be mapped in the guest at the usual guest memory
> addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
> xen/include/public/arch-arm.h.
> 
> This patch introduces this new `xen,static-mem` feature, and also documents
> and parses this new attribute at boot time.
> 
> This patch also introduces a new field "bool xen_domain" in "struct membank"
> to tell whether the memory bank is reserved as the whole hardware resource,
> or bind to a xen domain node, through "xen,static-mem"
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  docs/misc/arm/device-tree/booting.txt | 42 +++++++++++++++++++++++++++
>  xen/arch/arm/bootfdt.c                | 30 +++++++++++++++++--
>  xen/include/asm-arm/setup.h           |  1 +
>  3 files changed, 71 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 5243bc7fd3..44cd9e1a9a 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -268,3 +268,45 @@ The DTB fragment is loaded at 0xc000000 in the example above. It should
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
> +The property 'memory' is still needed and should match the amount of memory
> +given to the guest. Currently, it either comes from static memory or lets Xen
> +allocate from heap. *Mixing* is not supported.
> +
> +The static memory will be mapped in the guest at the usual guest memory
> +addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
> +xen/include/public/arch-arm.h.
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
> +                memory = <0x0 0x80000>;
> +                #xen,static-mem-address-cells = <0x1>;
> +                #xen,static-mem-size-cells = <0x1>;
> +                xen,static-mem = <0x30000000 0x20000000>;
> +                ...
> +            };
> +        };
> +    };
> +
> +This will reserve a 512MB region starting at the host physical address
> +0x30000000 to be exclusively used by DomU1.
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index b01badda3e..afaa0e249b 100644
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
> @@ -97,6 +97,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>              continue;
>          mem->bank[mem->nr_banks].start = start;
>          mem->bank[mem->nr_banks].size = size;
> +        mem->bank[mem->nr_banks].xen_domain = xen_domain;
>          mem->nr_banks++;
>      }
>  
> @@ -185,7 +186,8 @@ static int __init process_memory_node(const void *fdt, int node,
>                                        u32 address_cells, u32 size_cells,
>                                        void *data)
>  {
> -    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells, data);
> +    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
> +                                   data, false);
>  }
>  
>  static int __init process_reserved_memory_node(const void *fdt, int node,
> @@ -339,6 +341,28 @@ static void __init process_chosen_node(const void *fdt, int node,
>      add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
>  }
>  
> +static int __init process_domain_node(const void *fdt, int node,
> +                                      const char *name,
> +                                      u32 address_cells, u32 size_cells)
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
> +
> +    return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
> +                                   size_cells, &bootinfo.reserved_mem, true);
> +}
> +
>  static int __init early_scan_node(const void *fdt,
>                                    int node, const char *name, int depth,
>                                    u32 address_cells, u32 size_cells,
> @@ -357,6 +381,8 @@ static int __init early_scan_node(const void *fdt,
>          process_multiboot_node(fdt, node, name, address_cells, size_cells);
>      else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
>          process_chosen_node(fdt, node, name, address_cells, size_cells);
> +    else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
> +        rc = process_domain_node(fdt, node, name, address_cells, size_cells);
>  
>      if ( rc < 0 )
>          printk("fdt: node `%s': parsing failed\n", name);
> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
> index c4b6af6029..95da0b7ab9 100644
> --- a/xen/include/asm-arm/setup.h
> +++ b/xen/include/asm-arm/setup.h
> @@ -24,6 +24,7 @@ typedef enum {
>  struct membank {
>      paddr_t start;
>      paddr_t size;
> +    bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
>  };
>  
>  struct meminfo {
> -- 
> 2.25.1
> 

