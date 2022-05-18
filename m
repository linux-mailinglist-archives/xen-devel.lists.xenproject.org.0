Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80F052C2FD
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 21:04:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332468.556162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrOxP-0000Mb-Ao; Wed, 18 May 2022 19:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332468.556162; Wed, 18 May 2022 19:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrOxP-0000J3-7F; Wed, 18 May 2022 19:03:39 +0000
Received: by outflank-mailman (input) for mailman id 332468;
 Wed, 18 May 2022 19:03:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nrOxN-0000Ix-Tz
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 19:03:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nrOxM-0003D3-Mq; Wed, 18 May 2022 19:03:36 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[10.95.143.196]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nrOxM-0003b1-Bo; Wed, 18 May 2022 19:03:36 +0000
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
	bh=hhoziTlvIZBhB24NZ1ZT1zfaKgpBh70uYGusgmJVMEs=; b=LCf79+9NsVKtgkn3wgAsN6NO9H
	B9GyPZi8f+bMyC/t3JmFJoEcM4r8CjhttMk3GT/vhAQQ8bbNNrqol05rB47rFjRCko2s3i30cYwDX
	r5xc6Q4BWIoPhcm7oxZQ7MWIccDBmlofD/1cHCv1yh8TktWiZ8GOEaQIHDfVzIiwgOQg=;
Message-ID: <ef3dc3b8-0ac6-2cd6-0e18-d7da13fd4c25@xen.org>
Date: Wed, 18 May 2022 20:03:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [XEN][RFC PATCH v3 11/14] xen/arm: Implement device tree node
 addition functionalities
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-12-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220308194704.14061-12-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 08/03/2022 19:47, Vikram Garhwal wrote:
> Update sysctl XEN_SYSCTL_dt_overlay to enable support for dtbo nodes addition
> using device tree overlay.
> 
> xl overlay add file.dtbo:
>      Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
>      device_tree_flattened) is created and updated with overlay nodes. This
>      updated fdt is further unflattened to a dt_host_new. Next, it checks if any
>      of the overlay nodes already exists in the dt_host. If overlay nodes doesn't
>      exist then find the overlay nodes in dt_host_new, find the overlay node's
>      parent in dt_host and add the nodes as child under their parent in the
>      dt_host. The node is attached as the last node under target parent.
> 
>      Finally, add IRQs, add device to IOMMUs, set permissions and map MMIO for the
>      overlay node.
> 
> When a node is added using overlay, a new entry is allocated in the
> overlay_track to keep the track of memory allocation due to addition of overlay
> node. This is helpful for freeing the memory allocated when a device tree node
> is removed.
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>   xen/common/dt_overlay.c     | 324 ++++++++++++++++++++++++++++++++++++
>   xen/include/public/sysctl.h |   1 +
>   2 files changed, 325 insertions(+)
> 
> diff --git a/xen/common/dt_overlay.c b/xen/common/dt_overlay.c
> index fcb31de495..01aed62d74 100644
> --- a/xen/common/dt_overlay.c
> +++ b/xen/common/dt_overlay.c
> @@ -82,6 +82,64 @@ static int dt_overlay_remove_node(struct dt_device_node *device_node)
>       return 0;
>   }
>   
> +static int dt_overlay_add_node(struct dt_device_node *device_node,
> +                  const char *parent_node_path)
> +{
> +    struct dt_device_node *parent_node;
> +    struct dt_device_node *np;
> +    struct dt_device_node *next_node;
> +    struct dt_device_node *new_node;
> +
> +    parent_node = dt_find_node_by_path(parent_node_path);
> +
> +    new_node = device_node;

You only use device_node to set new_node. So the local variable is a bit 
pointless. I don't mind whether you want to rename the parameter 
new_node or keep the existing name.

> +
> +    if ( new_node == NULL )

OOI, how could it be NULL?

> +        return -EINVAL;
> +
> +    if ( parent_node == NULL )
> +    {
> +        dt_dprintk("Node not found. Partial dtb will not be added");
> +        return -EINVAL;
> +    }
> +
> +    /*
> +     * If node is found. We can attach the device_node as a child of the

Below you use new_node rather than device_node

> +     * parent node.
> +     */
> +
> +    /* If parent has no child. */
> +    if ( parent_node->child == NULL )
> +    {
> +        next_node = parent_node->allnext;
> +        new_node->parent = parent_node;
> +        parent_node->allnext = new_node;
> +        parent_node->child = new_node;
> +        /* Now plug next_node at the end of device_node. */

Same.

> +        new_node->allnext = next_node;
> +    } else {

Coding style:

The } and { should be on there own line. I.e:

}
else
{

> +        /* If parent has at least one child node. */
> +
> +        /*
> +         *  Iterate to the last child node of parent.
> +         */
> +        for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
> +        {
> +        }
> +
> +        next_node = np->allnext;
> +        new_node->parent = parent_node;
> +        np->sibling = new_node;
> +        np->allnext = new_node;
> +        /* Now plug next_node at the end of device_node. */

Same remark about device node.

> +        new_node->sibling = next_node;
> +        new_node->allnext = next_node;
> +        np->sibling->sibling = NULL;
> +    }
> +
> +    return 0;
> +}
> +
>   /* Basic sanity check for the dtbo tool stack provided to Xen. */
>   static int check_overlay_fdt(const void *overlay_fdt, uint32_t overlay_fdt_size)
>   {
> @@ -377,6 +435,267 @@ out:
>       return rc;
>   }
>   
> +/*
> + * Adds device tree nodes under target node.
> + * We use dt_host_new to unflatten the updated device_tree_flattened. This is
> + * done to avoid the removal of device_tree generation, iomem regions mapping to
> + * hardware domain done by handle_node().
> + */
> +static long handle_add_overlay_nodes(void *overlay_fdt,
> +                                     uint32_t overlay_fdt_size)
> +{
> +    int rc = 0;
> +    struct dt_device_node *overlay_node;
> +    char **nodes_full_path = NULL;
> +    int **nodes_irq = NULL;
> +    int *node_num_irq = NULL;
> +    void *fdt = NULL;
> +    struct dt_device_node *dt_host_new = NULL;
> +    struct domain *d = hardware_domain;
> +    struct overlay_track *tr = NULL;
> +    unsigned int naddr;
> +    unsigned int num_irq;
> +    unsigned int i, j, k;
> +    unsigned int num_overlay_nodes;
> +    u64 addr, size;
> +
> +    fdt = xmalloc_bytes(fdt_totalsize(device_tree_flattened));
> +    if ( fdt == NULL )
> +        return -ENOMEM;
> +
> +    num_overlay_nodes = overlay_node_count(overlay_fdt);
> +    if ( num_overlay_nodes == 0 )
> +    {
> +        xfree(fdt);
> +        return -ENOMEM;
> +    }
> +
> +    spin_lock(&overlay_lock);
> +
> +    memcpy(fdt, device_tree_flattened, fdt_totalsize(device_tree_flattened));
> +
> +    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);

AFAICT, this doesn't need to be checked within the lock. So it would be 
better to move it before grabbing the lock and the allocation.

> +    if ( rc )
> +    {
> +        xfree(fdt);
> +        return rc;
> +    }
> +
> +    /*
> +     * overlay_get_nodes_info is called to get the node information from dtbo.
> +     * This is done before fdt_overlay_apply() because the overlay apply will
> +     * erase the magic of overlay_fdt.
> +     */
> +    rc = overlay_get_nodes_info(overlay_fdt, &nodes_full_path,
> +                                num_overlay_nodes);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "Getting nodes information failed with error %d\n",
> +               rc);
> +        goto err;
> +    }
> +
> +    nodes_irq = xmalloc_bytes(num_overlay_nodes * sizeof(int *));
> +
> +    if ( nodes_irq == NULL )
> +    {
> +        rc = -ENOMEM;
> +        goto err;
> +    }
> +    memset(nodes_irq, 0x0, num_overlay_nodes * sizeof(int *));
> +
> +    node_num_irq = xmalloc_bytes(num_overlay_nodes * sizeof(int));
> +    if ( node_num_irq == NULL )
> +    {
> +        rc = -ENOMEM;
> +        goto err;
> +    }
> +    memset(node_num_irq, 0x0, num_overlay_nodes * sizeof(int));
> +
> +    rc = fdt_overlay_apply(fdt, overlay_fdt);

I am a bit puzzled how this work. Above, you allocated 'fdt' with the 
size of the current device-tree. So there might not be enough space in 
the current fdt to apply the overlay. Can you clarify it?

> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "Adding overlay node failed with error %d\n", rc);
> +        goto err;
> +    }
> +
> +    for ( j = 0; j < num_overlay_nodes; j++ )
> +    {
> +        /* Check if any of the node already exists in dt_host. */
> +        overlay_node = dt_find_node_by_path(nodes_full_path[j]);
> +        if ( overlay_node != NULL )
> +        {
> +            printk(XENLOG_ERR "node %s exists in device tree\n",
> +                   nodes_full_path[j]);
> +            rc = -EINVAL;
> +            goto err;
> +        }
> +    }
> +
> +    /* Unflatten the fdt into a new dt_host. */
> +    unflatten_device_tree(fdt, &dt_host_new);

As I mentionned before, unflatten_device_tree() may fail to allocate 
memory. So it needs to be updated to propogate any error in order to use 
it in an hypercall.

> +
> +    for ( j = 0; j < num_overlay_nodes; j++ )
> +    {
> +        dt_dprintk("Adding node: %s\n", nodes_full_path[j]);
> +
> +        /* Find the newly added node in dt_host_new by it's full path. */
> +        overlay_node = _dt_find_node_by_path(dt_host_new, nodes_full_path[j]);
> +        if ( overlay_node == NULL )
> +        {
> +            dt_dprintk("%s node not found\n", nodes_full_path[j]);
> +            rc = -EFAULT;
> +            goto remove_node;
> +        }
> +
> +        /* Add the node to dt_host. */
> +        rc = dt_overlay_add_node(overlay_node, overlay_node->parent->full_name);
> +        if ( rc )
> +        {
> +            /* Node not added in dt_host. */
> +            goto remove_node;
> +        }
> +
> +        overlay_node = dt_find_node_by_path(overlay_node->full_name);
> +        if ( overlay_node == NULL )
> +        {
> +            /* Sanity check. But code will never come here. */

Please add ASSERT_UNREACHABLE just to make clear this is not expected.

> +            printk(XENLOG_ERR "Cannot find %s node under updated dt_host\n",
> +                   overlay_node->name);
> +            goto remove_node;
> +        }
> +
> +        /* First let's handle the interrupts. */
> +        rc = handle_device_interrupts(d, overlay_node, false);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "Interrupt failed\n");
> +            goto remove_node;
> +        }
> +
> +        /* Store IRQs for each node. */
> +        num_irq = dt_number_of_irq(overlay_node);
> +        node_num_irq[j] = num_irq;
> +        nodes_irq[j] = xmalloc_bytes(num_irq * sizeof(int));
> +        if ( nodes_irq[j] == NULL )
> +        {
> +            rc = -ENOMEM;
> +            goto remove_node;
> +        }
> +
> +        for ( k = 0; k < num_irq; k++ )
> +        {
> +             nodes_irq[j][k] = platform_get_irq(overlay_node, k);

platform_get_irq() can fail.

> +        }
> +
> +        /* Add device to IOMMUs */
> +        rc = iommu_add_dt_device(overlay_node);
> +        if ( rc < 0 )
> +        {
> +            printk(XENLOG_ERR "Failed to add %s to the IOMMU\n",
> +                   dt_node_full_name(overlay_node));
> +            goto remove_node;
> +        }
> +
> +        /* Set permissions. */
> +        naddr = dt_number_of_address(overlay_node);
> +
> +        dt_dprintk("%s passthrough = %d naddr = %u\n",
> +                   dt_node_full_name(overlay_node), false, naddr);
> +
> +        /* Give permission for map MMIOs */
> +        for ( i = 0; i < naddr; i++ )
> +        {
> +            struct map_range_data mr_data = { .d = d,
> +                                              .p2mt = p2m_mmio_direct_c,
> +                                              .skip_mapping = true };
> +            rc = dt_device_get_address(overlay_node, i, &addr, &size);
> +            if ( rc )
> +            {
> +                printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
> +                       i, dt_node_full_name(overlay_node));
> +                goto remove_node;
> +            }
> +
> +            rc = map_range_to_domain(overlay_node, addr, size, &mr_data);
> +            if ( rc )
> +                goto remove_node;
> +        }
> +    }
> +
> +    /* This will happen if everything above goes right. */
> +    tr = xzalloc(struct overlay_track);

I think it would be best to allocate the overlay structure first. So 1) 
you don't have to undo everything because of an allocation failure and 
2) you can remove a lot of local variables and use "tr-><field>" directly.

> +    if ( tr == NULL )
> +    {
> +        rc = -ENOMEM;
> +        goto remove_node;
> +    }
> +
> +    tr->dt_host_new = dt_host_new;
> +    tr->fdt = fdt;
> +    tr->nodes_fullname = nodes_full_path;
> +    tr->num_nodes = num_overlay_nodes;
> +    tr->nodes_irq = nodes_irq;
> +    tr->node_num_irq = node_num_irq;
> +
> +    if ( tr->nodes_fullname == NULL )
> +    {
> +        rc = -ENOMEM;
> +        goto remove_node;
> +    }
> +
> +    INIT_LIST_HEAD(&tr->entry);
> +    list_add_tail(&tr->entry, &overlay_tracker);
> +
> +    spin_unlock(&overlay_lock);
> +    return rc;
> +
> +/*
> + * Failure case. We need to remove the nodes, free tracker(if tr exists) and
> + * dt_host_new.
> + */
> +remove_node:
> +    rc = remove_nodes(nodes_full_path, nodes_irq, node_num_irq, j);

Looking at the implement of remove_nodes(), it would not be able to cope 
if half of it is initialized. So it an error would be returned (or 
potentially crash as you set node_num_irq[X] before allocating the 
memory) and...

> +
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "Removing node failed\n");
> +        spin_unlock(&overlay_lock);
> +        return rc;

... no memory would be freed. It is not clear to me whether the memory 
leak is on purpose. If it is, then I think it should be written down in 
a comment.

> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index e256aeb7c6..bb3ef44989 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1069,6 +1069,7 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
>   DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
>   #endif
>   
> +#define XEN_SYSCTL_DT_OVERLAY_ADD                   1

I find a bit odd that the documentation is added before the number. I 
think it might make sense to either define the two sysctl in the 
previous patch or in a separate one. I don't mind either way.

>   #define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
>   
>   /*

Cheers,

-- 
Julien Grall

