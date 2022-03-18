Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 899E64DD2AD
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 03:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291813.495562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV1te-0008Ai-Ez; Fri, 18 Mar 2022 01:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291813.495562; Fri, 18 Mar 2022 01:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV1te-00089C-9y; Fri, 18 Mar 2022 01:59:18 +0000
Received: by outflank-mailman (input) for mailman id 291813;
 Fri, 18 Mar 2022 01:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3xU5=T5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nV1tc-000896-BL
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 01:59:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 021a5cdf-a65f-11ec-8eba-a37418f5ba1a;
 Fri, 18 Mar 2022 02:59:13 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 375BC6163F;
 Fri, 18 Mar 2022 01:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4453BC340E9;
 Fri, 18 Mar 2022 01:59:11 +0000 (UTC)
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
X-Inumbo-ID: 021a5cdf-a65f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647568751;
	bh=9HVAGB5mth5mnFD0dCzJ+u6sNxIxeQFFZHql4IPwhW4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DnvqL/zLoQxGIKP457sZb2HRfaSZYKN5Z+0Xchx3QwGej6d3Zjrst2HOC7/Kc7W2n
	 9t50/7NSMwVKUfu2Y52I6pdTOJlTcCs1R9UWeyWbje5lTrnbVt+3FdrvEVPbRC8fSB
	 X3sXyLraFHKrS2khadB/MXAWVnLlPZ0LHgacRqRQiXQT1iiJnuVcoG9eG/0I2IyA3A
	 cGIhgZGwIe7jj2EjEemMjPYSjSEhrRntadacSYotY7iRr02bZRQUoxDNvL19XCcbSE
	 OhvrfasbUiFl6bQu5zXfeKP7aoaGFIT1ykVfzQV4KL4BI7qC9Cxn6uZUJBApKZ8eQL
	 rDCeCGttyduMA==
Date: Thu, 17 Mar 2022 18:59:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, nd@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 01/13] xen/arm: introduce static shared memory
In-Reply-To: <20220311061123.1883189-2-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2203171619250.3497@ubuntu-linux-20-04-desktop>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-2-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Mar 2022, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> This patch serie introduces a new feature: setting up static
> shared memory on a dom0less system, through device tree configuration.
> 
> This commit parses shared memory node at boot-time, and reserve it in
> bootinfo.reserved_mem to avoid other use.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>  docs/misc/arm/device-tree/booting.txt | 118 ++++++++++++++++++++++++++
>  xen/arch/arm/bootfdt.c                |  52 ++++++++++++
>  2 files changed, 170 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index a94125394e..f702ade817 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -355,3 +355,121 @@ device-tree:
>  
>  This will reserve a 512MB region starting at the host physical address
>  0x30000000 to be exclusively used by DomU1.
> +
> +Static Shared Memory
> +=============

We ran out of = :-)


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
> +    physical address, as the target address of the mapping.

This is good. We also need to say how to know how many cells each of the
three elements take: how many cells is the host physical address, how
many cells is the size, how many cells is the guest physical address.

This node is a subnode of a xen,domain compatible node (or chosen) which
comes with an #address-cells and a #size-cells. This is similarly to
multiboot,kernel nodes, so we could do the same. Here we could say that
the number of cells for the host address (and size) is the same as the
guest pseudo-physical address and they are inherited from the parent
node.


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
> +Dom0 and DomU1.It will get mapped at 0x10000000 in Dom0 guest physical address
                 ^ " "

> +space, and at 0x50000000 in DomU1 guest physical address space. Dom0 is
> +explicitly defined as the owner domain, and DomU1 is the borrower domain.
> +
> +For the static shared memory region identified as 0x1, host physical
> +address starting at 0x50000000 of 512MB will be reserved to be shared between
> +DomU1 and DomU2. It will get mapped at 0x60000000 in DomU1 guest physical
> +address space, and at 0x70000000 in DomU2 guest physical address space. DomU1
> +and DomU2 are both the borrower domain, the owner domain is the default owner
> +domain dom_shared.
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index afaa0e249b..7de0f8cea9 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -363,6 +363,56 @@ static int __init process_domain_node(const void *fdt, int node,
>                                     size_cells, &bootinfo.reserved_mem, true);
>  }
>  
> +static __initdata DECLARE_BITMAP(shm_mask, NR_MEM_BANKS);
> +static int __init process_shm_node(const void *fdt, int node,
> +                                   u32 address_cells, u32 size_cells)
> +{
> +    const struct fdt_property *prop;
> +    const __be32 *cell;
> +    paddr_t paddr, size;
> +    struct meminfo *mem = &bootinfo.reserved_mem;
> +    u32 id;
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
> +    id = device_tree_get_u32(fdt, node, "xen,shm-id", NR_MEM_BANKS);
> +    if ( id >= NR_MEM_BANKS )
> +        return -EINVAL;
> +
> +    /*
> +     * A shared memory region could be shared between multiple domains. We
> +     * use the shm_mask bitmask to prevent iterating over all reserved memory
> +     * regions each time.
> +     */
> +    if ( !test_bit(id, shm_mask) )
> +    {
> +        /*
> +         * xen,shared-mem = <paddr, size, gaddr>;
> +         * Memory region starting from physical address #paddr of #size shall
> +         * be mapped to guest physical address #gaddr as shared memory region.
> +         */
> +        cell = (const __be32 *)prop->data;
> +        device_tree_get_reg(&cell, address_cells, size_cells, &paddr, &size);
> +
> +        /* shared memory shall be reserved from other use. */
> +        mem->bank[mem->nr_banks].start = paddr;
> +        mem->bank[mem->nr_banks].size = size;
> +        mem->bank[mem->nr_banks].xen_domain = true;
> +        mem->nr_banks++;
> +        set_bit(id, shm_mask);
> +    }
> +    return 0;
> +}
> +
>  static int __init early_scan_node(const void *fdt,
>                                    int node, const char *name, int depth,
>                                    u32 address_cells, u32 size_cells,
> @@ -383,6 +433,8 @@ static int __init early_scan_node(const void *fdt,
>          process_chosen_node(fdt, node, name, address_cells, size_cells);
>      else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
>          rc = process_domain_node(fdt, node, name, address_cells, size_cells);
> +    else if ( depth <= 3 && device_tree_node_compatible(fdt, node, "xen,domain-shared-memory-v1") )
> +        rc = process_shm_node(fdt, node, address_cells, size_cells);
>  
>      if ( rc < 0 )
>          printk("fdt: node `%s': parsing failed\n", name);
> -- 
> 2.25.1
> 

