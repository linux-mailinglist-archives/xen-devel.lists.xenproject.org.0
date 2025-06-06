Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0CBAD0A6D
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jun 2025 01:44:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008989.1388125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNgjG-0006Qs-7E; Fri, 06 Jun 2025 23:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008989.1388125; Fri, 06 Jun 2025 23:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNgjG-0006Nn-4Y; Fri, 06 Jun 2025 23:44:06 +0000
Received: by outflank-mailman (input) for mailman id 1008989;
 Fri, 06 Jun 2025 23:44:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRk0=YV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNgjE-0006NF-UM
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 23:44:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f7049a7-4330-11f0-b894-0df219b8e170;
 Sat, 07 Jun 2025 01:44:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 42B795C5430;
 Fri,  6 Jun 2025 23:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C596BC4CEEB;
 Fri,  6 Jun 2025 23:43:59 +0000 (UTC)
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
X-Inumbo-ID: 1f7049a7-4330-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749253440;
	bh=UxnHsLBxKoqqdULPyLYsw8tJWQSBh6OiK9hn8z55btc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FIqDEzPr2MZBXnpsfxwjEy5pYzkK3uF/EbeBG1GRITX7bWco3+gJOaPsTGnk3yhSP
	 ZKjbSflOGowqvW7H79uQ8PESmDl6cMZIYW/CWYU89HZsbp31BO9u6UixGf+BUwwSNl
	 /TV0G+F92VyVablaLuw6ScwcksF2o63ckVYxPyQbXTRcbTDwtILYf3bjqD5EGBv35A
	 jpmzbSteUiMEk+8PowfGGWQZDABHspoVIMDHY6uMkOctqCTLP+aWm+jmuKPEZv19AF
	 BWHdOxe3CugCDCfyQ/9ocCm0zjcd8cGAr/ASwGIP80Q5yo1vULPFWGqXSyZbRH7WHT
	 L6kWTQNsGhSgA==
Date: Fri, 6 Jun 2025 16:43:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 11/15] xen/dt: Move bootinfo-independent helpers out
 of bootinfo-fdt.c
In-Reply-To: <20250605194810.2782031-12-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506061642440.2495561@ubuntu-linux-20-04-desktop>
References: <20250605194810.2782031-1-agarciav@amd.com> <20250605194810.2782031-12-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Jun 2025, Alejandro Vallejo wrote:
> ... back into bootfdt.c
> 
> These will be required by x86 later on to detect modules in the early scan of
> the FDT. They are independent of bootinfo, so it's cleaner for them to exist in
> a separate file.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

In retrospect, it would have been better to keep the code movement as is
and do any changes as a separate patch. But given that I was the one to
ask for it:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/device-tree/Makefile       |   1 +
>  xen/common/device-tree/bootfdt.c      |  97 ++++++++++++++++++++++++
>  xen/common/device-tree/bootinfo-fdt.c | 104 --------------------------
>  3 files changed, 98 insertions(+), 104 deletions(-)
>  create mode 100644 xen/common/device-tree/bootfdt.c
> 
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 8a3f2be89e..8abc069c4b 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -1,3 +1,4 @@
> +obj-y += bootfdt.init.o
>  obj-y += bootinfo-fdt.init.o
>  obj-y += bootinfo.init.o
>  obj-y += device-tree.o
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> new file mode 100644
> index 0000000000..6acf83d197
> --- /dev/null
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -0,0 +1,97 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <xen/bootfdt.h>
> +#include <xen/bug.h>
> +#include <xen/lib.h>
> +#include <xen/libfdt/libfdt.h>
> +
> +uint32_t __init device_tree_get_u32(const void *fdt, int node,
> +                                    const char *prop_name, uint32_t dflt)
> +{
> +    const struct fdt_property *prop;
> +
> +    prop = fdt_get_property(fdt, node, prop_name, NULL);
> +    if ( !prop || prop->len < sizeof(uint32_t) )
> +        return dflt;
> +
> +    return fdt32_to_cpu(*(const uint32_t*)prop->data);
> +}
> +
> +int __init device_tree_for_each_node(const void *fdt, int node,
> +                                     device_tree_node_func func,
> +                                     void *data)
> +{
> +    /*
> +     * We only care about relative depth increments, assume depth of
> +     * node is 0 for simplicity.
> +     */
> +    int depth = 0;
> +    const int first_node = node;
> +    uint32_t address_cells[DEVICE_TREE_MAX_DEPTH];
> +    uint32_t size_cells[DEVICE_TREE_MAX_DEPTH];
> +    int ret;
> +
> +    do {
> +        const char *name = fdt_get_name(fdt, node, NULL);
> +        uint32_t as, ss;
> +
> +        if ( depth >= DEVICE_TREE_MAX_DEPTH )
> +        {
> +            printk("Warning: device tree node `%s' is nested too deep\n",
> +                   name);
> +            continue;
> +        }
> +
> +        as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
> +        ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
> +
> +        address_cells[depth] = device_tree_get_u32(fdt, node,
> +                                                   "#address-cells", as);
> +        size_cells[depth] = device_tree_get_u32(fdt, node,
> +                                                "#size-cells", ss);
> +
> +        /* skip the first node */
> +        if ( node != first_node )
> +        {
> +            ret = func(fdt, node, name, depth, as, ss, data);
> +            if ( ret != 0 )
> +                return ret;
> +        }
> +
> +        node = fdt_next_node(fdt, node, &depth);
> +    } while ( node >= 0 && depth > 0 );
> +
> +    return 0;
> +}
> +
> +void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> +                                uint32_t size_cells, paddr_t *start,
> +                                paddr_t *size)
> +{
> +    uint64_t dt_start, dt_size;
> +
> +    /*
> +     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-bit.
> +     * Thus, there is an implicit cast from uint64_t to paddr_t.
> +     */
> +    dt_start = dt_next_cell(address_cells, cell);
> +    dt_size = dt_next_cell(size_cells, cell);
> +
> +    if ( dt_start != (paddr_t)dt_start )
> +    {
> +        printk("Physical address greater than max width supported\n");
> +        WARN();
> +    }
> +
> +    if ( dt_size != (paddr_t)dt_size )
> +    {
> +        printk("Physical size greater than max width supported\n");
> +        WARN();
> +    }
> +
> +    /*
> +     * Xen will truncate the address/size if it is greater than the maximum
> +     * supported width and it will give an appropriate warning.
> +     */
> +    *start = dt_start;
> +    *size = dt_size;
> +}
> diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
> index 195249f700..695c4bfc49 100644
> --- a/xen/common/device-tree/bootinfo-fdt.c
> +++ b/xen/common/device-tree/bootinfo-fdt.c
> @@ -109,39 +109,6 @@ static bool __init device_tree_is_memory_node(const void *fdt, int node,
>      return true;
>  }
>  
> -void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> -                                uint32_t size_cells, paddr_t *start,
> -                                paddr_t *size)
> -{
> -    uint64_t dt_start, dt_size;
> -
> -    /*
> -     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-bit.
> -     * Thus, there is an implicit cast from uint64_t to paddr_t.
> -     */
> -    dt_start = dt_next_cell(address_cells, cell);
> -    dt_size = dt_next_cell(size_cells, cell);
> -
> -    if ( dt_start != (paddr_t)dt_start )
> -    {
> -        printk("Physical address greater than max width supported\n");
> -        WARN();
> -    }
> -
> -    if ( dt_size != (paddr_t)dt_size )
> -    {
> -        printk("Physical size greater than max width supported\n");
> -        WARN();
> -    }
> -
> -    /*
> -     * Xen will truncate the address/size if it is greater than the maximum
> -     * supported width and it will give an appropriate warning.
> -     */
> -    *start = dt_start;
> -    *size = dt_size;
> -}
> -
>  static int __init device_tree_get_meminfo(const void *fdt, int node,
>                                            const char *prop_name,
>                                            u32 address_cells, u32 size_cells,
> @@ -202,77 +169,6 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>      return 0;
>  }
>  
> -uint32_t __init device_tree_get_u32(const void *fdt, int node,
> -                                    const char *prop_name, uint32_t dflt)
> -{
> -    const struct fdt_property *prop;
> -
> -    prop = fdt_get_property(fdt, node, prop_name, NULL);
> -    if ( !prop || prop->len < sizeof(uint32_t) )
> -        return dflt;
> -
> -    return fdt32_to_cpu(*(const uint32_t*)prop->data);
> -}
> -
> -/**
> - * device_tree_for_each_node - iterate over all device tree sub-nodes
> - * @fdt: flat device tree.
> - * @node: parent node to start the search from
> - * @func: function to call for each sub-node.
> - * @data: data to pass to @func.
> - *
> - * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
> - *
> - * Returns 0 if all nodes were iterated over successfully.  If @func
> - * returns a value different from 0, that value is returned immediately.
> - */
> -int __init device_tree_for_each_node(const void *fdt, int node,
> -                                     device_tree_node_func func,
> -                                     void *data)
> -{
> -    /*
> -     * We only care about relative depth increments, assume depth of
> -     * node is 0 for simplicity.
> -     */
> -    int depth = 0;
> -    const int first_node = node;
> -    u32 address_cells[DEVICE_TREE_MAX_DEPTH];
> -    u32 size_cells[DEVICE_TREE_MAX_DEPTH];
> -    int ret;
> -
> -    do {
> -        const char *name = fdt_get_name(fdt, node, NULL);
> -        u32 as, ss;
> -
> -        if ( depth >= DEVICE_TREE_MAX_DEPTH )
> -        {
> -            printk("Warning: device tree node `%s' is nested too deep\n",
> -                   name);
> -            continue;
> -        }
> -
> -        as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
> -        ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
> -
> -        address_cells[depth] = device_tree_get_u32(fdt, node,
> -                                                   "#address-cells", as);
> -        size_cells[depth] = device_tree_get_u32(fdt, node,
> -                                                "#size-cells", ss);
> -
> -        /* skip the first node */
> -        if ( node != first_node )
> -        {
> -            ret = func(fdt, node, name, depth, as, ss, data);
> -            if ( ret != 0 )
> -                return ret;
> -        }
> -
> -        node = fdt_next_node(fdt, node, &depth);
> -    } while ( node >= 0 && depth > 0 );
> -
> -    return 0;
> -}
> -
>  static int __init process_memory_node(const void *fdt, int node,
>                                        const char *name, int depth,
>                                        u32 address_cells, u32 size_cells,
> -- 
> 2.43.0
> 

