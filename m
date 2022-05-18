Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC57852C251
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 20:32:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332447.556139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrOSg-0004bB-BO; Wed, 18 May 2022 18:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332447.556139; Wed, 18 May 2022 18:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrOSg-0004Yi-8M; Wed, 18 May 2022 18:31:54 +0000
Received: by outflank-mailman (input) for mailman id 332447;
 Wed, 18 May 2022 18:31:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nrOSe-0004Yc-00
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 18:31:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nrOSc-0002g7-Fs; Wed, 18 May 2022 18:31:50 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[10.95.143.196]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nrOSc-0001bO-24; Wed, 18 May 2022 18:31:50 +0000
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
	bh=qbaZJgFoVl7FyJ/0Eyr+451DJr6dzsHNu+3Tdv9xf0w=; b=F8zYvB14eiJVJHCw6wX1o7wb4U
	xFuFiVfbRw3SJABgV73/frVB6iWUcBP1Ng46NAc6bHhlBYc+fUH49xA5TQhiT95m5NTdp604UUHcf
	edtYoYoanMXSnLtzFcaLksx8Q22w/kpwa0wI3XraljSaX0SELdz4faYQJmqFTZSzBtAQ=;
Message-ID: <f00fa29e-d59a-471a-ef05-4f72787ad8e8@xen.org>
Date: Wed, 18 May 2022 19:31:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [XEN][RFC PATCH v3 10/14] xen/arm: Implement device tree node
 removal functionalities
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-11-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220308194704.14061-11-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 08/03/2022 19:47, Vikram Garhwal wrote:
> Introduce sysctl XEN_SYSCTL_dt_overlay to remove device-tree nodes added using
> device tree overlay.
> 
> xl overlay remove file.dtbo:
>      Removes all the nodes in a given dtbo.
>      First, removes IRQ permissions and MMIO accesses. Next, it finds the nodes
>      in dt_host and delete the device node entries from dt_host.
> 
>      The nodes get removed only if it is not used by any of dom0 or domio.
> 
> Also, added overlay_track struct to keep the track of added node through device
> tree overlay. overlay_track has dt_host_new which is unflattened form of updated
> fdt and name of overlay nodes. When a node is removed, we also free the memory
> used by overlay_track for the particular overlay node.
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>   xen/common/Makefile          |   1 +
>   xen/common/dt_overlay.c      | 447 +++++++++++++++++++++++++++++++++++
>   xen/common/sysctl.c          |  10 +
>   xen/include/public/sysctl.h  |  18 ++
>   xen/include/xen/dt_overlay.h |  47 ++++
>   5 files changed, 523 insertions(+)
>   create mode 100644 xen/common/dt_overlay.c
>   create mode 100644 xen/include/xen/dt_overlay.h
> 
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index dc8d3a13f5..2eb5734f8e 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -54,6 +54,7 @@ obj-y += wait.o
>   obj-bin-y += warning.init.o
>   obj-$(CONFIG_XENOPROF) += xenoprof.o
>   obj-y += xmalloc_tlsf.o
> +obj-$(CONFIG_OVERLAY_DTB) += dt_overlay.o
>   
>   obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
>   
> diff --git a/xen/common/dt_overlay.c b/xen/common/dt_overlay.c
> new file mode 100644
> index 0000000000..fcb31de495
> --- /dev/null
> +++ b/xen/common/dt_overlay.c
> @@ -0,0 +1,447 @@
> +/*
> + * xen/common/dt_overlay.c
> + *
> + * Device tree overlay support in Xen.
> + *
> + * Copyright (c) 2021 Xilinx Inc.
> + * Written by Vikram Garhwal <fnu.vikram@xilinx.com>
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms and conditions of the GNU General Public
> + * License, version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#include <xen/iocap.h>
> +#include <xen/xmalloc.h>
> +#include <asm/domain_build.h>
> +#include <xen/dt_overlay.h>
> +#include <xen/guest_access.h>
> +
> +static LIST_HEAD(overlay_tracker);
> +static DEFINE_SPINLOCK(overlay_lock);
> +
> +static int dt_overlay_remove_node(struct dt_device_node *device_node)
> +{
> +    struct dt_device_node *np;
> +    struct dt_device_node *parent_node;
> +    struct dt_device_node *current_node;
> +
> +    parent_node = device_node->parent;
> +
> +    current_node = parent_node;
> +
> +    if ( parent_node == NULL )
> +    {
> +        dt_dprintk("%s's parent node not found\n", device_node->name);
> +        return -EFAULT;
> +    }
> +
> +    np = parent_node->child;
> +
> +    if ( np == NULL )
> +    {
> +        dt_dprintk("parent node %s's not found\n", parent_node->name);
> +        return -EFAULT;
> +    }
> +
> +    /* If node to be removed is only child node or first child. */
> +    if ( !dt_node_cmp(np->full_name, device_node->full_name) )
> +    {
> +        current_node->allnext = np->allnext;

While reviewing the previous patches, I realized that we have nothing to 
prevent someone to browse the device-tree while it is modified.

I am not sure this can be solved with just refcounting (like Linux 
does). So maybe we need a read-write-lock. I am open to other 
suggestions here.

> +
> +        /* If node is first child but not the only child. */
> +        if ( np->sibling != NULL )
> +            current_node->child = np->sibling;
> +        else
> +            /* If node is only child. */
> +            current_node->child = NULL;

Those 4 lines can be replaced with one line:

current_node->child = np->sibling;

> +        return 0;
> +    }
> +
> +    for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
> +    {
> +        current_node = np;
> +        if ( !dt_node_cmp(np->sibling->full_name, device_node->full_name) )
> +        {
> +            /* Found the node. Now we remove it. */
> +            current_node->allnext = np->allnext->allnext;

I find this code quite confusing to read. AFAICT, 'np' and 
'current_node' are exactly the same here. Why do you use different name 
to access it?

> +
> +            if ( np->sibling->sibling )
> +                current_node->sibling = np->sibling->sibling;
> +            else
> +                current_node->sibling = NULL;

Same here. This could be replaced with:

current_node->child = nb->sibling->sibling;

> +
> +            break;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +/* Basic sanity check for the dtbo tool stack provided to Xen. */
> +static int check_overlay_fdt(const void *overlay_fdt, uint32_t overlay_fdt_size)
> +{
> +    if ( (fdt_totalsize(overlay_fdt) != overlay_fdt_size) ||
> +          fdt_check_header(overlay_fdt) )
> +    {
> +        printk(XENLOG_ERR "The overlay FDT is not a valid Flat Device Tree\n");
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +static unsigned int overlay_node_count(void *fdto)
> +{
> +    unsigned int num_overlay_nodes = 0;
> +    int fragment;
> +
> +    fdt_for_each_subnode(fragment, fdto, 0)
> +    {
> +
> +        int subnode;
> +        int overlay;
> +
> +        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
> +
> +        /*
> +         * Overlay value can be < 0. But fdt_for_each_subnode() loop checks for
> +         * overlay >= 0. So, no need for a overlay>=0 check here.
> +         */
> +
> +        fdt_for_each_subnode(subnode, fdto, overlay)
> +        {
> +            num_overlay_nodes++;
> +        }
> +    }
> +
> +    return num_overlay_nodes;
> +}
> +
> +/*
> + * overlay_get_nodes_info will get the all node's full name with path. This is
> + * useful when checking node for duplication i.e. dtbo tries to add nodes which
> + * already exists in device tree.
> + */

AFAIU the code below will only retrieve one level of nodes. So if you have

foo {
   bar {
   }
}

Only foo will be part of the nodes_full_path. Is it correct?

> +static int overlay_get_nodes_info(const void *fdto, char ***nodes_full_path,
> +                                  unsigned int num_overlay_nodes)
> +{
> +    int fragment;
> +    unsigned int node_num = 0;
> +
> +    *nodes_full_path = xmalloc_bytes(num_overlay_nodes * sizeof(char *));
> +
> +    if ( *nodes_full_path == NULL )
> +        return -ENOMEM;
> +    memset(*nodes_full_path, 0x0, num_overlay_nodes * sizeof(char *));
> +
> +    fdt_for_each_subnode(fragment, fdto, 0)
> +    {
> +        int target;
> +        int overlay;
> +        int subnode;
> +        const char *target_path;
> +
> +        target = fdt_overlay_target_offset(device_tree_flattened, fdto,
> +                                           fragment, &target_path);
> +        if ( target < 0 )
> +            return target;
> +
> +        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
> +
> +        /*
> +         * Overlay value can be < 0. But fdt_for_each_subnode() loop checks for
> +         * overlay >= 0. So, no need for a overlay>=0 check here.
> +         */
> +        fdt_for_each_subnode(subnode, fdto, overlay)
> +        {
> +            const char *node_name = NULL;
> +            unsigned int node_name_len = 0;
> +            unsigned int target_path_len = strlen(target_path);
> +            unsigned int node_full_name_len = 0;
> +
> +            node_name = fdt_get_name(fdto, subnode, &node_name_len);
> +
> +            if ( node_name == NULL )
> +                return -EINVAL;
> +
> +            /*
> +             * Magic number 2 is for adding '/'. This is done to keep the
> +             * node_full_name in the correct full node name format.
> +             */
> +            node_full_name_len = target_path_len + node_name_len + 2;
> +
> +            (*nodes_full_path)[node_num] = xmalloc_bytes(node_full_name_len);
> +
> +            if ( (*nodes_full_path)[node_num] == NULL )
> +                return -ENOMEM;
> +
> +            memcpy((*nodes_full_path)[node_num], target_path, target_path_len);
> +
> +            (*nodes_full_path)[node_num][target_path_len] = '/';
> +
> +            memcpy((*nodes_full_path)[node_num] + target_path_len + 1, node_name,
> +                   node_name_len);
> +
> +            (*nodes_full_path)[node_num][node_full_name_len - 1] = '\0';
> +
> +            node_num++;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +/* Remove nodes from dt_host. */
> +static int remove_nodes(char **full_dt_node_path, int **nodes_irq,
> +                        int *node_num_irq, unsigned int num_nodes)

Most of the information above are stored in overlay_track. So can we 
pass a pointer to the overlay_track?

Also, I think most of the parameter (include overlay track) should not 
be modified here. So please use const.

> +{
> +    struct domain *d = hardware_domain;
> +    int rc = 0;
> +    struct dt_device_node *overlay_node;
> +    unsigned int naddr;
> +    unsigned int i, j, nirq;
> +    u64 addr, size;
> +    domid_t domid = 0;
> +
> +    for ( j = 0; j < num_nodes; j++ )
> +    {
> +        dt_dprintk("Finding node %s in the dt_host\n", full_dt_node_path[j]);
> +
> +        overlay_node = dt_find_node_by_path(full_dt_node_path[j]);
> +
> +        if ( overlay_node == NULL )

This error (and some below) may happen because we partially removed the 
DTBO but stopped because on error. So on the next run, it is possible 
that "overlay_node" will be NULL and therefore you will not be able to 
remove the node.

In your use-case, are you planning to ask the admin to reboot if you 
can't remove a node?

> +        {
> +            printk(XENLOG_ERR "Device %s is not present in the tree. Removing nodes failed\n",
> +                   full_dt_node_path[j]);
> +            return -EINVAL;
> +        }
> +
> +        domid = dt_device_used_by(overlay_node);
> +
> +        dt_dprintk("Checking if node %s is used by any domain\n",
> +                   full_dt_node_path[j]);
> +
> +        /* Remove the node iff it's assigned to domain 0 or domain io. */
> +        if ( domid != 0 && domid != DOMID_IO )

I think I asked before, but I have seen no answer on that. What will 
prevent the device to not be assigned after this check?

Also, in general, I think it would be helpful if you answer on the ML 
questions. This would at least confirm that you have seen them and we 
agree on what to do.

> +        {
> +            printk(XENLOG_ERR "Device %s as it is being used by domain %d. Removing nodes failed\n",
> +                   full_dt_node_path[j], domid);
> +            return -EINVAL;
> +        }
> +
> +        dt_dprintk("Removing node: %s\n", full_dt_node_path[j]);
> +
> +        nirq = node_num_irq[j];
> +
> +        /* Remove IRQ permission */
> +        for ( i = 0; i < nirq; i++ )
> +        {
> +            rc = nodes_irq[j][i];
> +            /*
> +             * TODO: We don't handle shared IRQs for now. So, it is assumed that
> +             * the IRQs was not shared with another domain.
> +             */

This is not what I meant in v2. Interrupts cannot be shared between 
domain on Arm. However, interrupts can be shared between devices.

This is the latter part that needs a TODO.

In addition to that, as I wrote, an IRQ can be assigned to a *single* 
domain without the device been assigned to that domain. So I think this 
needs to be checked possibly by using the information stored in "desc" 
to know where the IRQ was routed to.

> +            rc = irq_deny_access(d, rc);
> +            if ( rc )
> +            {
> +                printk(XENLOG_ERR "unable to revoke access for irq %u for %s\n",
> +                       i, dt_node_full_name(overlay_node));
> +                return rc;
> +            }
> +        }
> +
> +        rc = iommu_remove_dt_device(overlay_node);
> +        if ( rc != 0 && rc != -ENXIO )
> +            return rc;
> +
> +        naddr = dt_number_of_address(overlay_node);
> +
> +        /* Remove mmio access. */
> +        for ( i = 0; i < naddr; i++ )
> +        {
> +            rc = dt_device_get_address(overlay_node, i, &addr, &size);
> +            if ( rc )
> +            {
> +                printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
> +                       i, dt_node_full_name(overlay_node));
> +                return rc;
> +            }
> +
> +            rc = iomem_deny_access(d, paddr_to_pfn(addr),
> +                                   paddr_to_pfn(PAGE_ALIGN(addr + size - 1)));

I think you missed my comment here. Similar to the IRQs, you are asking 
for trouble to parse the device-tree again. It would be better to store 
the information using a rangeset (see include/xen/rangeset.h).

I also think the double array for the IRQs should be converted to a 
rangeset as this would simplify the code.

Furthemore, you are removing the permission but not the mapping in the 
P2M. Can you clarify why?


> +            if ( rc )
> +            {
> +                printk(XENLOG_ERR "Unable to remove dom%d access to"
> +                        " 0x%"PRIx64" - 0x%"PRIx64"\n",
> +                        d->domain_id,
> +                        addr & PAGE_MASK, PAGE_ALIGN(addr + size) - 1);
> +                return rc;
> +            }
> +        }
> +
> +        rc = dt_overlay_remove_node(overlay_node);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return rc;
> +}

[...]

> + * overlay_node_track describes information about added nodes through dtbo.
> + * @entry: List pointer.
> + * @dt_host_new: Pointer to the updated dt_host_new unflattened 'updated fdt'.
> + * @fdt: Stores the fdt.
> + * @nodes_fullname: Stores the full name of nodes.
> + * @nodes_irq: Stores the IRQ added from overlay dtb.
> + * @node_num_irq: Stores num of IRQ for each node in overlay dtb.
> + * @num_nodes: Stores total number of nodes in overlay dtb.
> + */
> +struct overlay_track {
> +    struct list_head entry;
> +    struct dt_device_node *dt_host_new;
> +    void *fdt;
> +    char **nodes_fullname;

Looking at the code, the main use for the fullname are to check the FDT 
match and looking up in the DT.

In order to check the DT, you could use memcmp() to confirm both the 
stored FDT and the one provided by the user match.

For the lookup, you could avoid it by storing a pointer to the root of 
the new subtrees.

Please let me know if you disagree with this approach.

> +    int **nodes_irq;
> +    int *node_num_irq;
> +    unsigned int num_nodes;
> +};
> +
> +long dt_sysctl(struct xen_sysctl *op);
> +#endif

Cheers,

-- 
Julien Grall

