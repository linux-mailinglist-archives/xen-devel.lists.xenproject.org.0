Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECB3AC98E0
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 03:48:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001864.1382005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLBKD-0004mw-Ie; Sat, 31 May 2025 01:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001864.1382005; Sat, 31 May 2025 01:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLBKD-0004l7-Fi; Sat, 31 May 2025 01:47:53 +0000
Received: by outflank-mailman (input) for mailman id 1001864;
 Sat, 31 May 2025 01:47:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uLBKB-0004l1-HT
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 01:47:51 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41f46661-3dc1-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 03:47:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2FF1BA4F7D4;
 Sat, 31 May 2025 01:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7458CC4CEEB;
 Sat, 31 May 2025 01:47:47 +0000 (UTC)
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
X-Inumbo-ID: 41f46661-3dc1-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748656068;
	bh=cHJ0RQCjlVXnQW79Eot28b8kZr7pVK5w3KP+uYfvCIc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bocx9vb32gq6PGRfOfCh+f3D96XX5cAvu3i9V+7H6uHVapFXPCIE9I/lggHa/m381
	 lT1HxLraaZha+JkepifxQsljRcB81fQLcajymfK26f+lw2aaXDDNdOoKA1FIY+0Ils
	 49eZnIWg1hH/P3964gIX1vZ5tNKnAmR7twAEkzoO/0ublY7O8opT5OcDwKNbQW5oiF
	 COskZYElbNcFk7E7Ylt2qeJNHVLCMsB+DkTlkBGKsoXxcCT+PmJzbJgBJcKt7HMFgP
	 6FTfFuwkmm2nvpbkP0o2PawFp29vWMhiD7jLJP03K1hIAycvDQGd9sdJROoKii6PRs
	 ywJ8qPMh/vu1g==
Date: Fri, 30 May 2025 18:47:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 15/19] xen/dt: Move bootinfo-independent helpers out of
 bootinfo-fdt.c
In-Reply-To: <20250530120242.39398-16-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505301845410.1147082@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-16-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Alejandro Vallejo wrote:
> ... back into bootfdt.c
> 
> These will be required by x86 later on to detect modules in the early scan of
> the FDT. They are independent of bootinfo, so it's cleaner for them to exist in
> a separate file.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
>  xen/common/device-tree/Makefile       |   1 +
>  xen/common/device-tree/bootfdt.c      |  97 ++++++++++++++++++++++++
>  xen/common/device-tree/bootinfo-fdt.c | 104 --------------------------
>  3 files changed, 98 insertions(+), 104 deletions(-)
>  create mode 100644 xen/common/device-tree/bootfdt.c
> 
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index bb6d5ddec5..922c5bba9b 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -1,3 +1,4 @@
> +obj-y += bootfdt.init.o
>  obj-y += bootinfo-fdt.init.o
>  obj-y += bootinfo.init.o
>  obj-y += device-tree.o
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> new file mode 100644
> index 0000000000..5decf17faf
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
> +    if ( !prop || prop->len < sizeof(u32) )

Ah this is where the u32->uint32_t renaming is done!
Since we are at it, we can change the u32 in the sizeof


> +        return dflt;
> +
> +    return fdt32_to_cpu(*(uint32_t*)prop->data);
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
> +    u32 address_cells[DEVICE_TREE_MAX_DEPTH];
> +    u32 size_cells[DEVICE_TREE_MAX_DEPTH];

same here?


> +    int ret;
> +
> +    do {
> +        const char *name = fdt_get_name(fdt, node, NULL);
> +        u32 as, ss;
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
> index bb5f45771e..736f877616 100644
> --- a/xen/common/device-tree/bootinfo-fdt.c
> +++ b/xen/common/device-tree/bootinfo-fdt.c
> @@ -112,39 +112,6 @@ static bool __init device_tree_is_memory_node(const void *fdt, int node,
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
> @@ -205,77 +172,6 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>      return 0;
>  }
>  
> -u32 __init device_tree_get_u32(const void *fdt, int node,
> -                               const char *prop_name, u32 dflt)
> -{
> -    const struct fdt_property *prop;
> -
> -    prop = fdt_get_property(fdt, node, prop_name, NULL);
> -    if ( !prop || prop->len < sizeof(u32) )
> -        return dflt;
> -
> -    return fdt32_to_cpu(*(uint32_t*)prop->data);
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

