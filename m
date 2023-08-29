Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBA278D0CB
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:46:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592631.925407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb8PG-0005ro-VB; Tue, 29 Aug 2023 23:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592631.925407; Tue, 29 Aug 2023 23:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb8PG-0005pb-RO; Tue, 29 Aug 2023 23:45:58 +0000
Received: by outflank-mailman (input) for mailman id 592631;
 Tue, 29 Aug 2023 23:45:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jw1q=EO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qb8PF-0005pV-78
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:45:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30b93ade-46c6-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 01:45:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6089F61C41;
 Tue, 29 Aug 2023 23:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B695C433C7;
 Tue, 29 Aug 2023 23:45:50 +0000 (UTC)
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
X-Inumbo-ID: 30b93ade-46c6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693352751;
	bh=sMMFuHlYCVN70oonuWzP4jeZn7P/QwCbAEtpX30ZDsg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JxgXIlqvUK7/DxKphGDis5Ox4FRJTFmaNZHoD5Fpf01XQx5neiHxD7XIcnRDPnc4J
	 kcZEyLfRYj1MNFbQNEFvhm3B8zaDBBRiKQRXohHWnDbsNIGyHwStGPo6RTYu/8OIC4
	 YXQHrBNGXNPXXMRI4D0jPFXuxlUDHYxUS+vDiJBGQIeVDwSW1LZ6vMlHEImqMZvoQC
	 km7jg1KtrPrXtZyaZ7x85y4ANYL/bxj/57rgWUslGtT2JCz1AQIWMuglOwjRzZ/O5G
	 cH4/RNpAWDpFZpZvTJAUEkQum4lhgRTOL27HVhZG39NrFzlQgwodGPlcoQgbgKr50t
	 8pHCmVtzgIJcg==
Date: Tue, 29 Aug 2023 16:45:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    sstabellini@kernel.org, julien@xen.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH v10 16/20] xen/arm: Implement device tree node
 removal functionalities
In-Reply-To: <20230825080222.14247-17-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2308291638010.6458@ubuntu-linux-20-04-desktop>
References: <20230825080222.14247-1-vikram.garhwal@amd.com> <20230825080222.14247-17-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Aug 2023, Vikram Garhwal wrote:
> Introduce sysctl XEN_SYSCTL_dt_overlay to remove device-tree nodes added using
> device tree overlay.
> 
> xl dt-overlay remove file.dtbo:
>     Removes all the nodes in a given dtbo.
>     First, removes IRQ permissions and MMIO accesses. Next, it finds the nodes
>     in dt_host and delete the device node entries from dt_host.
> 
>     The nodes get removed only if it is not used by any of dom0 or domio.
> 
> Also, added overlay_track struct to keep the track of added node through device
> tree overlay. overlay_track has dt_host_new which is unflattened form of updated
> fdt and name of overlay nodes. When a node is removed, we also free the memory
> used by overlay_track for the particular overlay node.
> 
> Nested overlay removal is supported in sequential manner only i.e. if
> overlay_child nests under overlay_parent, it is assumed that user first removes
> overlay_child and then removes overlay_parent.
> Also, this is an experimental feature so it is expected from user to make sure
> correct device tree overlays are used when adding nodes and making sure devices
> are not being used by other domain before removing them from Xen tree.
> Partially added/removed i.e. failures while removing the overlay may cause other
> failures and might need a system reboot.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v9:
>     Remove iommu and IRQ routing as this will not be done while adding the nodes.

I understand about IRQ routing. But I am confused by the removal of the
call to iommu_remove_dt_device.

handle_device (called by add_nodes) calls iommu_add_dt_device when
adding the device for dom0 (this is the "own_device" case)

So here we need to remove it from the iommu? That seems like a mistake?


> Changes from v8:
>     Remove IRQs and IOMMU entries using rangesets instead of parsing each node.
> Changes from v7:
>     Add dt-overlay.c in MAINTAINERS.
>     Add comments for dt_overlay_remove_node.
>     Rename handle_remove_irq_iommu() to remove_resources().
>     Add comment regarding false mapping flag for reason behind not removing the
>     mapping..
>     Remove irq_access_premitted() check.
>     Add error handling for remove_all_descendant_nodes
>     Change read_lock with write_lock.
>     Remove check_overlay_fdt() call from handle_remove_overlay_nodes().
>     Re-organize dt_sysctl and reutnr -EOPNOSTSUPP for error cases. Also, renamed
>         this function to dt_overlay_sysctl.
>     Remove unnecessary header includes in dt-overlay.h
>     Correct indentation and make func   tion inputs const wherever possible.
>     Make overlay_fdt const_void inside xen_sysctl_dt_overlay{}.
>     Add comment regarding why we not removing IRQ and MMIO mappings.
>     Move overlay_node_count() out of this patch as it's not being used here
>         anymore.
> Changes from v6:
>     Add explicit padding for xen_system_dt_overlay{}
>     Update license.
>     Rearrange xfree in dt_sysctl()
>     Update overlay_track struct comment with relevant message.
>     Fix missing xen/errno.h for builds without CONFIG_OVERLAY_DTB cases.
>     Fix header formatting.
> ---
> ---
>  MAINTAINERS                  |   1 +
>  xen/arch/arm/sysctl.c        |  16 +-
>  xen/common/Makefile          |   1 +
>  xen/common/dt-overlay.c      | 392 +++++++++++++++++++++++++++++++++++
>  xen/include/public/sysctl.h  |  24 +++
>  xen/include/xen/dt-overlay.h |  63 ++++++
>  6 files changed, 496 insertions(+), 1 deletion(-)
>  create mode 100644 xen/common/dt-overlay.c
>  create mode 100644 xen/include/xen/dt-overlay.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0805d35cd..c41a7c5440 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -301,6 +301,7 @@ M:	Julien Grall <julien@xen.org>
>  S:	Supported
>  F:	xen/common/libfdt/
>  F:	xen/common/device_tree.c
> +F:	xen/common/dt-overlay.c
>  F:	xen/include/xen/libfdt/
>  F:	xen/include/xen/device_tree.h
>  F:	xen/drivers/passthrough/device_tree.c
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index e9a0661146..5cda0dc674 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -9,6 +9,7 @@
>  
>  #include <xen/types.h>
>  #include <xen/lib.h>
> +#include <xen/dt-overlay.h>
>  #include <xen/errno.h>
>  #include <xen/hypercall.h>
>  #include <asm/arm64/sve.h>
> @@ -25,7 +26,20 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  long arch_do_sysctl(struct xen_sysctl *sysctl,
>                      XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>  {
> -    return -ENOSYS;
> +    long ret;
> +
> +    switch ( sysctl->cmd )
> +    {
> +    case XEN_SYSCTL_dt_overlay:
> +        ret = dt_overlay_sysctl(&sysctl->u.dt_overlay);
> +        break;
> +
> +    default:
> +        ret = -ENOSYS;
> +        break;
> +    }
> +
> +    return ret;
>  }
>  
>  /*
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 46049eac35..e7e96b1087 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
>  obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
>  obj-$(CONFIG_IOREQ_SERVER) += dm.o
>  obj-y += domain.o
> +obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
>  obj-y += event_2l.o
>  obj-y += event_channel.o
>  obj-y += event_fifo.o
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> new file mode 100644
> index 0000000000..12a3029fee
> --- /dev/null
> +++ b/xen/common/dt-overlay.c
> @@ -0,0 +1,392 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * xen/common/dt-overlay.c
> + *
> + * Device tree overlay support in Xen.
> + *
> + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
> + *
> + */
> +#include <asm/domain_build.h>
> +#include <xen/dt-overlay.h>
> +#include <xen/guest_access.h>
> +#include <xen/iocap.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/xmalloc.h>
> +
> +static LIST_HEAD(overlay_tracker);
> +static DEFINE_SPINLOCK(overlay_lock);
> +
> +/* Find last descendants of the device_node. */
> +static struct dt_device_node *
> +find_last_descendants_node(const struct dt_device_node *device_node)
> +{
> +    struct dt_device_node *child_node;
> +
> +    for ( child_node = device_node->child; child_node->sibling != NULL;
> +          child_node = child_node->sibling );
> +
> +    /* If last child_node also have children. */
> +    if ( child_node->child )
> +        child_node = find_last_descendants_node(child_node);
> +
> +    return child_node;
> +}
> +
> +static int dt_overlay_remove_node(struct dt_device_node *device_node)
> +{
> +    struct dt_device_node *np;
> +    struct dt_device_node *parent_node;
> +    struct dt_device_node *last_descendant = device_node->child;
> +
> +    parent_node = device_node->parent;
> +
> +    /* Check if we are trying to remove "/" i.e. root node. */
> +    if ( parent_node == NULL )
> +    {
> +        dt_dprintk("%s's parent node not found\n", device_node->name);
> +        return -EFAULT;
> +    }
> +
> +    /* Sanity check for linking between parent and child node. */
> +    np = parent_node->child;
> +    if ( np == NULL )
> +    {
> +        dt_dprintk("parent node %s's not found\n", parent_node->name);
> +        return -EFAULT;
> +    }
> +
> +    /* If node to be removed is only child node or first child. */
> +    if ( !dt_node_cmp(np->full_name, device_node->full_name) )
> +    {
> +        parent_node->child = np->sibling;
> +
> +        /*
> +         * Iterate over all child nodes of device_node. Given that we are
> +         * removing a node, we need to remove all it's descendants too.
> +         * Reason behind finding last_descendant:
> +         * If device_node has multiple children, device_node->allnext will point
> +         * to first_child and first_child->allnext will be a sibling. When the
> +         * device_node and it's all children are removed, parent_node->allnext
> +         * should point to node next to last children.
> +         */
> +        if ( last_descendant )
> +        {
> +            last_descendant = find_last_descendants_node(device_node);
> +            parent_node->allnext = last_descendant->allnext;
> +        }
> +        else
> +            parent_node->allnext = np->allnext;
> +
> +        return 0;
> +    }
> +
> +    for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
> +    {
> +        if ( !dt_node_cmp(np->sibling->full_name, device_node->full_name) )
> +        {
> +            /* Found the node. Now we remove it. */
> +            np->sibling = np->sibling->sibling;
> +
> +            if ( np->child )
> +                np = find_last_descendants_node(np);
> +
> +            /*
> +             * Iterate over all child nodes of device_node. Given that we are
> +             * removing parent node, we need to remove all it's descendants too.
> +             */
> +            if ( last_descendant )
> +                last_descendant = find_last_descendants_node(device_node);
> +
> +            if ( last_descendant )
> +                np->allnext = last_descendant->allnext;
> +            else
> +                np->allnext = np->allnext->allnext;
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
> +static int irq_remove_cb(unsigned long s, unsigned long e, void *dom,
> +                         unsigned long *c)
> +{
> +    int rc;
> +    struct domain *d = dom;
> +
> +    /*
> +     * TODO: We don't handle shared IRQs for now. So, it is assumed that
> +     * the IRQs was not shared with another devices.
> +     * TODO: Undo the IRQ routing.
> +     */
> +    rc = irq_deny_access(d, s);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "unable to revoke access for irq %lu\n", s);
> +    }
> +    else
> +        *c += e - s + 1;
> +
> +    return rc;
> +
> +}
> +
> +static int iomem_remove_cb(unsigned long s, unsigned long e, void *dom,
> +                           unsigned long *c)
> +{
> +    int rc;
> +    struct domain *d = dom;
> +
> +    /*
> +    * Remove mmio access.
> +    * TODO: Support for remove/add the mapping in P2M.
> +    */
> +    rc = iomem_deny_access(d, s, e);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "Unable to remove dom%d access to"
> +               " 0x%"PRIx64" - 0x%"PRIx64"\n",
> +               d->domain_id,
> +               s & PAGE_MASK, PAGE_ALIGN(e) - 1);
> +    }
> +    else
> +        *c += e - s + 1;
> +
> +    return rc;
> +}
> +
> +/* Check if node itself can be removed. */
> +static bool check_node_removable(struct dt_device_node *device_node)
> +{
> +    domid_t domid;
> +
> +    domid = dt_device_used_by(device_node);
> +
> +    dt_dprintk("Checking if node %s is used by any domain\n",
> +               device_node->full_name);
> +
> +    /* Remove the node if only it's assigned to hardware domain or domain io. */
> +    if ( domid != hardware_domain->domain_id && domid != DOMID_IO )
> +    {
> +        printk(XENLOG_ERR "Device %s is being used by domain %u. Removing nodes failed\n",
> +               device_node->full_name, domid);
> +        return false;
> +    }
> +
> +
> +    return true;
> +}
> +
> +/* Check if all descendants of the given node are removable. */
> +static bool
> +check_descendant_nodes_removable(const struct dt_device_node *device_node)
> +{
> +    bool rc = true;
> +    struct dt_device_node *child_node;
> +
> +    for ( child_node = device_node->child; child_node != NULL;
> +         child_node = child_node->sibling )
> +    {
> +        if ( child_node->child )
> +        {
> +            rc = check_descendant_nodes_removable(child_node);
> +            if ( !rc )
> +                return rc;
> +        }
> +
> +        rc = check_node_removable(child_node);
> +        if ( !rc )
> +            return rc;
> +    }
> +
> +    return rc;
> +}
> +
> +/* Remove nodes from dt_host. */
> +static int remove_nodes(const struct overlay_track *tracker)
> +{
> +    int rc = 0;
> +    struct dt_device_node *overlay_node;
> +    unsigned int j;
> +    struct domain *d = hardware_domain;
> +
> +    for ( j = 0; j < tracker->num_nodes; j++ )
> +    {
> +        overlay_node = (struct dt_device_node *)tracker->nodes_address[j];
> +        if ( overlay_node == NULL )
> +        {
> +            printk(XENLOG_ERR "Device %s is not present in the tree. Removing nodes failed\n",
> +                   overlay_node->full_name);
> +            return -EINVAL;
> +        }
> +
> +        if ( !check_descendant_nodes_removable(overlay_node) )
> +            return -EINVAL;
> +
> +        if ( !check_node_removable(overlay_node) )
> +            return -EINVAL;
> +
> +        dt_dprintk("Removing node: %s\n", overlay_node->full_name);
> +
> +        write_lock(&dt_host_lock);
> +
> +        rc = dt_overlay_remove_node(overlay_node);
> +        if ( rc )
> +        {
> +            write_unlock(&dt_host_lock);
> +            return rc;
> +        }
> +
> +        write_unlock(&dt_host_lock);
> +    }
> +
> +    /* Remove IRQ access. */
> +    if ( tracker->irq_ranges )
> +    {
> +        rc = rangeset_consume_ranges(tracker->irq_ranges, irq_remove_cb, d);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +   /* Remove mmio access. */
> +    if ( tracker->iomem_ranges )
> +    {
> +        rc = rangeset_consume_ranges(tracker->iomem_ranges, iomem_remove_cb, d);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return rc;
> +}
> +
> +/*
> + * First finds the device node to remove. Check if the device is being used by
> + * any dom and finally remove it from dt_host. IOMMU is already being taken care
> + * while destroying the domain.
> + */
> +static long handle_remove_overlay_nodes(const void *overlay_fdt,
> +                                        uint32_t overlay_fdt_size)
> +{
> +    int rc;
> +    struct overlay_track *entry, *temp, *track;
> +    bool found_entry = false;
> +
> +    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
> +    if ( rc )
> +        return rc;
> +
> +    spin_lock(&overlay_lock);
> +
> +    /*
> +     * First check if dtbo is correct i.e. it should one of the dtbo which was
> +     * used when dynamically adding the node.
> +     * Limitation: Cases with same node names but different property are not
> +     * supported currently. We are relying on user to provide the same dtbo
> +     * as it was used when adding the nodes.
> +     */
> +    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
> +    {
> +        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0 )
> +        {
> +            track = entry;
> +            found_entry = true;
> +            break;
> +        }
> +    }
> +
> +    if ( !found_entry )
> +    {
> +        rc = -EINVAL;
> +
> +        printk(XENLOG_ERR "Cannot find any matching tracker with input dtbo."
> +               " Removing nodes is supported only for prior added dtbo.\n");
> +        goto out;
> +
> +    }
> +
> +    rc = remove_nodes(entry);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "Removing node failed\n");
> +        goto out;
> +    }
> +
> +    list_del(&entry->entry);
> +
> +    xfree(entry->dt_host_new);
> +    xfree(entry->fdt);
> +    xfree(entry->overlay_fdt);
> +
> +    xfree(entry->nodes_address);
> +
> +    rangeset_destroy(entry->irq_ranges);
> +    rangeset_destroy(entry->iomem_ranges);
> +
> +    xfree(entry);
> +
> + out:
> +    spin_unlock(&overlay_lock);
> +    return rc;
> +}
> +
> +long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
> +{
> +    long ret;
> +    void *overlay_fdt;
> +
> +    if ( op->overlay_op != XEN_SYSCTL_DT_OVERLAY_ADD &&
> +         op->overlay_op != XEN_SYSCTL_DT_OVERLAY_REMOVE )
> +        return -EOPNOTSUPP;
> +
> +    if ( op->overlay_fdt_size == 0 || op->overlay_fdt_size > KB(500) )
> +        return -EINVAL;
> +
> +    if ( op->pad[0] || op->pad[1] || op->pad[2] )
> +        return -EINVAL;
> +
> +    overlay_fdt = xmalloc_bytes(op->overlay_fdt_size);
> +
> +    if ( overlay_fdt == NULL )
> +        return -ENOMEM;
> +
> +    ret = copy_from_guest(overlay_fdt, op->overlay_fdt, op->overlay_fdt_size);
> +    if ( ret )
> +    {
> +        gprintk(XENLOG_ERR, "copy from guest failed\n");
> +        xfree(overlay_fdt);
> +
> +        return -EFAULT;
> +    }
> +
> +    if ( op->overlay_op == XEN_SYSCTL_DT_OVERLAY_REMOVE )
> +        ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
> +
> +    xfree(overlay_fdt);
> +
> +    return ret;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index fa7147de47..900239133a 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -1059,6 +1059,25 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
>  #endif
>  
> +#if defined(__arm__) || defined (__aarch64__)
> +/*
> + * XEN_SYSCTL_dt_overlay
> + * Performs addition/removal of device tree nodes under parent node using dtbo.
> + * This does in three steps:
> + *  - Adds/Removes the nodes from dt_host.
> + *  - Adds/Removes IRQ permission for the nodes.
> + *  - Adds/Removes MMIO accesses.
> + */
> +struct xen_sysctl_dt_overlay {
> +    XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
> +    uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
> +#define XEN_SYSCTL_DT_OVERLAY_ADD                   1
> +#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
> +    uint8_t overlay_op;                     /* IN: Add or remove. */
> +    uint8_t pad[3];                         /* IN: Must be zero. */
> +};
> +#endif
> +
>  struct xen_sysctl {
>      uint32_t cmd;
>  #define XEN_SYSCTL_readconsole                    1
> @@ -1089,6 +1108,7 @@ struct xen_sysctl {
>  #define XEN_SYSCTL_livepatch_op                  27
>  /* #define XEN_SYSCTL_set_parameter              28 */
>  #define XEN_SYSCTL_get_cpu_policy                29
> +#define XEN_SYSCTL_dt_overlay                    30
>      uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
>      union {
>          struct xen_sysctl_readconsole       readconsole;
> @@ -1119,6 +1139,10 @@ struct xen_sysctl {
>  #if defined(__i386__) || defined(__x86_64__)
>          struct xen_sysctl_cpu_policy        cpu_policy;
>  #endif
> +
> +#if defined(__arm__) || defined (__aarch64__)
> +        struct xen_sysctl_dt_overlay        dt_overlay;
> +#endif
>          uint8_t                             pad[128];
>      } u;
>  };
> diff --git a/xen/include/xen/dt-overlay.h b/xen/include/xen/dt-overlay.h
> new file mode 100644
> index 0000000000..c0567741ee
> --- /dev/null
> +++ b/xen/include/xen/dt-overlay.h
> @@ -0,0 +1,63 @@
> + /* SPDX-License-Identifier: GPL-2.0-only */
> + /*
> + * xen/dt-overlay.h
> + *
> + * Device tree overlay support in Xen.
> + *
> + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
> + *
> + */
> +#ifndef __XEN_DT_OVERLAY_H__
> +#define __XEN_DT_OVERLAY_H__
> +
> +#include <xen/device_tree.h>
> +#include <xen/list.h>
> +#include <xen/rangeset.h>
> +
> +/*
> + * overlay_track describes information about added nodes through dtbo.
> + * @entry: List pointer.
> + * @dt_host_new: Pointer to the updated dt_host_new which is unflattened from
> +    the 'updated fdt'.
> + * @fdt: Stores the fdt.
> + * @overlay_fdt: Stores a copy of input overlay_fdt.
> + * @nodes_address: Stores each overlay_node's address.
> + * @num_nodes: Total number of nodes in overlay dtb.
> + * @iomem_ranges: Range set to keep track of all IOMEMs.
> + * @irq_ranges: Range set to keep track of all added IRQs.
> + */
> +struct overlay_track {
> +    struct list_head entry;
> +    struct dt_device_node *dt_host_new;
> +    void *fdt;
> +    void *overlay_fdt;
> +    unsigned long *nodes_address;
> +    unsigned int num_nodes;
> +    struct rangeset *iomem_ranges;
> +    struct rangeset *irq_ranges;
> +};
> +
> +struct xen_sysctl_dt_overlay;
> +
> +#ifdef CONFIG_OVERLAY_DTB
> +long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op);
> +#else
> +#include <xen/errno.h>
> +static inline long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif
> +
> +#endif /* __XEN_DT_OVERLAY_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> -- 
> 2.17.1
> 

