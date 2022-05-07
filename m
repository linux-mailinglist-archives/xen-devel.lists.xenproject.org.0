Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0EB51E2E8
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 03:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323475.545130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn8w0-00048T-FM; Sat, 07 May 2022 01:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323475.545130; Sat, 07 May 2022 01:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn8w0-00045Y-Bz; Sat, 07 May 2022 01:08:36 +0000
Received: by outflank-mailman (input) for mailman id 323475;
 Sat, 07 May 2022 01:08:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DtL8=VP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nn8vz-00045S-4Y
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 01:08:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35eab187-cda2-11ec-a406-831a346695d4;
 Sat, 07 May 2022 03:08:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BFCEE61D48;
 Sat,  7 May 2022 01:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA137C385A8;
 Sat,  7 May 2022 01:08:29 +0000 (UTC)
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
X-Inumbo-ID: 35eab187-cda2-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651885710;
	bh=0OA13OCQQD4sy8PnYYHChoy0+eOjGGqnw3ftitWrgFE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LARMJpkgZjp1uvYTm3shy2d1/ZaouxGbnqGEhtTa4cL+177kaSLQK89o6LjMpPY5j
	 /ckDncSlL67wGcsX8lJBTFtlubuCLP6Rq6wZYXU6iIhGYxWG+g5xiH9oW9uphU2H/H
	 JV3pDcXlSNuTCaREWLswamt2mOpShMmWVbOBvcorkUN72oL6h3WgZTEoa1IV5BmT3A
	 B5tpRmCvkdE7vlmjROmEjeaAqreGE9Fu6p6chHJSWfjn5NSj0xK4w6R1Z9WXr7LSlu
	 YxCTQp1jho9DiFHbfDNxHa/b+QwViY4iLPRYuKrDPgVrrWRHHNG3YcAufp1zrS2qOU
	 a6IiVUimwqPpQ==
Date: Fri, 6 May 2022 18:08:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/9] xen/arm: introduce static shared memory
In-Reply-To: <20220506072502.2177828-2-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205061744400.43560@ubuntu-linux-20-04-desktop>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com> <20220506072502.2177828-2-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 May 2022, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> This patch serie introduces a new feature: setting up static
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

Thanks Penny, this version of the series is already so much better than
v1! I have only few minor comments left on the series. One NIT at the
bottom of this file.


> ---
> v2 change:
> - document refinement
> - remove bitmap and use the iteration to check
> - add a new field nr_shm_domain to keep the number of shared domain
> ---
>  docs/misc/arm/device-tree/booting.txt | 120 ++++++++++++++++++++++++++
>  xen/arch/arm/Kconfig                  |   6 ++
>  xen/arch/arm/bootfdt.c                |  68 +++++++++++++++
>  xen/arch/arm/include/asm/setup.h      |   3 +
>  4 files changed, 197 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index a94125394e..e63ce171fc 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -355,3 +355,123 @@ device-tree:
>  
>  This will reserve a 512MB region starting at the host physical address
>  0x30000000 to be exclusively used by DomU1.
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
> +    An u8 value represents the unique identifier of the shared memory region.
> +    The maximum identifier shall be "xen,shm-id = <0xff>".
> +
> +- xen,shared-mem
> +
> +    An array takes a physical address, which is the base address of the
> +    shared memory region in host physical address space, a size, and a guest
> +    physical address, as the target address of the mapping. The number of cells
> +    for the host address (and size) is the same as the guest pseudo-physical
> +    address and they are inherited from the parent node.
> +
> +- role (Optional)
> +
> +    A string property specifying the ownership of a shared memory region,
> +    the value must be one of the following: "owner", or "borrower"
> +    A shared memory region could be explicitly backed by one domain, which is
> +    called "owner domain", and all the other domains who are also sharing
> +    this region are called "borrower domain".
> +    If not specified, the default value is "borrower" and owner is
> +    "dom_shared", a system domain.
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
> +        xen,shm-id = <0x0>;
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
> +            xen,shm-id = <0x0>;
> +            xen,shared-mem = <0x10000000 0x10000000 0x50000000>;
> +        }
> +
> +        /*
> +         * shared memory region identified as 0x1(xen,shm-id = <0x1>)
> +         * is shared between DomU1 and DomU2.
> +         */
> +        domU1-shared-mem@50000000 {
> +            compatible = "xen,domain-shared-memory-v1";
> +            xen,shm-id = <0x1>;
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
> +            xen,shm-id = <0x1>;
> +            xen,shared-mem = <0x50000000 0x20000000 0x70000000>;
> +        }
> +
> +        ......
> +    };
> +};
> +
> +This is an example with two static shared memory regions.
> +
> +For the static shared memory region identified as 0x0, host physical
> +address starting at 0x10000000 of 256MB will be reserved to be shared between
> +Dom0 and DomU1. It will get mapped at 0x10000000 in Dom0 guest physical address
> +space, and at 0x50000000 in DomU1 guest physical address space. Dom0 is
> +explicitly defined as the owner domain, and DomU1 is the borrower domain.
> +
> +For the static shared memory region identified as 0x1, host physical
> +address starting at 0x50000000 of 512MB will be reserved to be shared between
> +DomU1 and DomU2. It will get mapped at 0x60000000 in DomU1 guest physical
> +address space, and at 0x70000000 in DomU2 guest physical address space. DomU1
> +and DomU2 are both the borrower domain, the owner domain is the default owner
> +domain dom_shared.
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..5ee9921f56 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -106,6 +106,12 @@ config TEE
>  
>  source "arch/arm/tee/Kconfig"
>  
> +config STATIC_SHM
> +	bool "Statically shared memory on a dom0less system" if UNSUPPORTED
> +	depends on STATIC_MEMORY
> +	help
> +	  This option enables statically shared memory on a dom0less system.
> +
>  endmenu
>  
>  menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index e318ef9603..9bd08776a7 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -363,6 +363,70 @@ static int __init process_domain_node(const void *fdt, int node,
>                                     size_cells, &bootinfo.reserved_mem, true);
>  }
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
>  static int __init early_scan_node(const void *fdt,
>                                    int node, const char *name, int depth,
>                                    u32 address_cells, u32 size_cells,
> @@ -383,6 +447,10 @@ static int __init early_scan_node(const void *fdt,
>          process_chosen_node(fdt, node, name, address_cells, size_cells);
>      else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
>          rc = process_domain_node(fdt, node, name, address_cells, size_cells);
> +#ifdef CONFIG_STATIC_SHM
> +    else if ( depth <= 3 && device_tree_node_compatible(fdt, node, "xen,domain-shared-memory-v1") )
> +        rc = process_shm_node(fdt, node, address_cells, size_cells);
> +#endif
>  
>      if ( rc < 0 )
>          printk("fdt: node `%s': parsing failed\n", name);
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 7a1e1d6798..38e02ced36 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -27,6 +27,9 @@ struct membank {
>      paddr_t start;
>      paddr_t size;
>      bool xen_domain; /* whether the memory bank is bound to a Xen domain. */
> +#ifdef CONFIG_STATIC_SHM
> +    unsigned long nr_shm_domain;
> +#endif

This is a NIT but unsigned int would be more than enough. The benefit is
that the following uint8_t end up not needing extra memory on arm64. I
realize this is an overoptimization so it is fine anyway.

Other than this, the patch looks good to me.

