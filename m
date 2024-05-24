Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A828CDF80
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 04:30:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729033.1134168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKh4-00037Q-6p; Fri, 24 May 2024 02:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729033.1134168; Fri, 24 May 2024 02:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKh4-000362-3h; Fri, 24 May 2024 02:30:06 +0000
Received: by outflank-mailman (input) for mailman id 729033;
 Fri, 24 May 2024 02:30:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6bJ=M3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sAKWq-0003tc-9f
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 02:19:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d4c5ebd-1974-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 04:19:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D4C8D62FA9;
 Fri, 24 May 2024 02:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14004C2BD10;
 Fri, 24 May 2024 02:19:27 +0000 (UTC)
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
X-Inumbo-ID: 0d4c5ebd-1974-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716517169;
	bh=OeUveWZsipaAlOiI4w9FYgFuXr/DUI3Ezg3sFoJuz/s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UoZOQuSwP4sUVPbgW/GAkT7i6yrCDdgbSOR5WTlKmWmiFjIIDYk4hGznKAgfQ9Vrt
	 bjnCwzWqvda65XoZWUc2vWPXhUt/CmsxDLBvpoiy5EhdYO63x75BpeaupyXp/KueuP
	 ygS6KQgzYChfBnQK6Hl1saEu4IOyJnuB2bjEkQ2tMm7sChf3UcXF9W2gW+Js31WKhX
	 jurkDWd1Ureg+8IKOXL2CuJUPsJQ+EIdTWEBZYUtBk9jbvfQSsj8esSa8hSSTQ/Mvx
	 emr3noGgP845RCKFkcIfGujqRkCewyZeeKD+yBPr/KokTDz9lVNtllprTxehuM0P7K
	 WuCpklM3TOPzg==
Date: Thu, 23 May 2024 19:19:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v4 5/9] xen/arm: Add XEN_DOMCTL_dt_overlay and device
 attachment to domains
In-Reply-To: <311c645f-d0cf-45ef-abb3-c7d8a58f1130@xen.org>
Message-ID: <alpine.DEB.2.22.394.2405231805500.2557291@ubuntu-linux-20-04-desktop>
References: <20240523074040.1611264-1-xin.wang2@amd.com> <20240523074040.1611264-6-xin.wang2@amd.com> <311c645f-d0cf-45ef-abb3-c7d8a58f1130@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 May 2024, Julien Grall wrote:
> Hi Henry,
> 
> On 23/05/2024 08:40, Henry Wang wrote:
> > In order to support the dynamic dtbo device assignment to a running
> > VM, the add/remove of the DT overlay and the attach/detach of the
> > device from the DT overlay should happen separately. Therefore,
> > repurpose the existing XEN_SYSCTL_dt_overlay to only add the DT
> > overlay to Xen device tree
> 
> I think it would be worth mentioning in the commit message why changing the
> sysctl behavior is fine. The feature is experimental and therefore breaking
> compatibility is ok.

Added


> > , instead of assigning the device to the
> > hardware domain at the same time. Add the XEN_DOMCTL_dt_overlay with
> > operations XEN_DOMCTL_DT_OVERLAY_ATTACH to do the device assignment
> > to the domain.
> > 
> > The hypervisor firstly checks the DT overlay passed from the toolstack
> > is valid. Then the device nodes are retrieved from the overlay tracker
> > based on the DT overlay. The attach of the device is implemented by
> > mapping the IRQ and IOMMU resources.
> 
> So, the expectation is the user will always want to attach all the devices in
> the overlay to a single domain. Is that correct?

Yes, also added to the commit message

> > 
> > Signed-off-by: Henry Wang <xin.wang2@amd.com>
> > Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> > ---
> > v4:
> > - Split the original patch, only do the device attachment.
> > v3:
> > - Style fixes for arch-selection #ifdefs.
> > - Do not include public/domctl.h, only add a forward declaration of
> >    struct xen_domctl_dt_overlay.
> > - Extract the overlay track entry finding logic to a function, drop
> >    the unused variables.
> > - Use op code 1&2 for XEN_DOMCTL_DT_OVERLAY_{ATTACH,DETACH}.
> > v2:
> > - New patch.
> > ---
> >   xen/arch/arm/domctl.c        |   3 +
> >   xen/common/dt-overlay.c      | 199 ++++++++++++++++++++++++++---------
> >   xen/include/public/domctl.h  |  14 +++
> >   xen/include/public/sysctl.h  |  11 +-
> >   xen/include/xen/dt-overlay.h |   7 ++
> >   5 files changed, 176 insertions(+), 58 deletions(-)
> > 
> > diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> > index ad56efb0f5..12a12ee781 100644
> > --- a/xen/arch/arm/domctl.c
> > +++ b/xen/arch/arm/domctl.c
> > @@ -5,6 +5,7 @@
> >    * Copyright (c) 2012, Citrix Systems
> >    */
> >   +#include <xen/dt-overlay.h>
> >   #include <xen/errno.h>
> >   #include <xen/guest_access.h>
> >   #include <xen/hypercall.h>
> > @@ -176,6 +177,8 @@ long arch_do_domctl(struct xen_domctl *domctl, struct
> > domain *d,
> >             return rc;
> >       }
> > +    case XEN_DOMCTL_dt_overlay:
> > +        return dt_overlay_domctl(d, &domctl->u.dt_overlay);
> >       default:
> >           return subarch_do_domctl(domctl, d, u_domctl);
> >       }
> > diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> > index 9cece79067..1087f9b502 100644
> > --- a/xen/common/dt-overlay.c
> > +++ b/xen/common/dt-overlay.c
> > @@ -356,6 +356,42 @@ static int overlay_get_nodes_info(const void *fdto,
> > char **nodes_full_path)
> >       return 0;
> >   }
> >   +/* This function should be called with the overlay_lock taken */
> > +static struct overlay_track *
> > +find_track_entry_from_tracker(const void *overlay_fdt,
> > +                              uint32_t overlay_fdt_size)
> > +{
> > +    struct overlay_track *entry, *temp;
> > +    bool found_entry = false;
> > +
> > +    ASSERT(spin_is_locked(&overlay_lock));
> > +
> > +    /*
> > +     * First check if dtbo is correct i.e. it should one of the dtbo which
> > was
> > +     * used when dynamically adding the node.
> > +     * Limitation: Cases with same node names but different property are
> > not
> > +     * supported currently. We are relying on user to provide the same dtbo
> > +     * as it was used when adding the nodes.
> > +     */
> > +    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
> > +    {
> > +        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0
> > )
> > +        {
> > +            found_entry = true;
> > +            break;
> > +        }
> > +    }
> > +
> > +    if ( !found_entry )
> > +    {
> > +        printk(XENLOG_ERR "Cannot find any matching tracker with input
> > dtbo."
> > +               " Operation is supported only for prior added dtbo.\n");
> > +        return NULL;
> > +    }
> > +
> > +    return entry;
> > +}
> > +
> >   /* Check if node itself can be removed and remove node from IOMMU. */
> >   static int remove_node_resources(struct dt_device_node *device_node)
> >   {
> > @@ -485,8 +521,7 @@ static long handle_remove_overlay_nodes(const void
> > *overlay_fdt,
> >                                           uint32_t overlay_fdt_size)
> >   {
> >       int rc;
> > -    struct overlay_track *entry, *temp, *track;
> > -    bool found_entry = false;
> > +    struct overlay_track *entry;
> >         rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
> >       if ( rc )
> > @@ -494,29 +529,10 @@ static long handle_remove_overlay_nodes(const void
> > *overlay_fdt,
> >         spin_lock(&overlay_lock);
> >   -    /*
> > -     * First check if dtbo is correct i.e. it should one of the dtbo which
> > was
> > -     * used when dynamically adding the node.
> > -     * Limitation: Cases with same node names but different property are
> > not
> > -     * supported currently. We are relying on user to provide the same dtbo
> > -     * as it was used when adding the nodes.
> > -     */
> > -    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
> > -    {
> > -        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0
> > )
> > -        {
> > -            track = entry;
> > -            found_entry = true;
> > -            break;
> > -        }
> > -    }
> > -
> > -    if ( !found_entry )
> > +    entry = find_track_entry_from_tracker(overlay_fdt, overlay_fdt_size);
> > +    if ( entry == NULL )
> >       {
> >           rc = -EINVAL;
> > -
> > -        printk(XENLOG_ERR "Cannot find any matching tracker with input
> > dtbo."
> > -               " Removing nodes is supported only for prior added
> > dtbo.\n");
> >           goto out;
> >         }
> > @@ -620,15 +636,7 @@ static long add_nodes(struct overlay_track *tr, char
> > **nodes_full_path)
> >               return -EFAULT;
> >           }
> >   -        rc = handle_device(hardware_domain, overlay_node,
> > p2m_mmio_direct_c,
> > -                           tr->iomem_ranges,
> > -                           tr->irq_ranges);
> >           write_unlock(&dt_host_lock);
> > -        if ( rc )
> > -        {
> > -            printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
> > -            return rc;
> > -        }
> >             /* Keep overlay_node address in tracker. */
> >           tr->nodes_address[j] = (unsigned long)overlay_node;
> > @@ -638,9 +646,7 @@ static long add_nodes(struct overlay_track *tr, char
> > **nodes_full_path)
> >   }
> >   /*
> >    * Adds device tree nodes under target node.
> > - * We use tr->dt_host_new to unflatten the updated device_tree_flattened.
> > This
> > - * is done to avoid the removal of device_tree generation, iomem regions
> > mapping
> > - * to hardware domain done by handle_node().
> > + * We use tr->dt_host_new to unflatten the updated device_tree_flattened.
> >    */
> >   static long handle_add_overlay_nodes(void *overlay_fdt,
> >                                        uint32_t overlay_fdt_size)
> > @@ -774,20 +780,6 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
> >           goto err;
> >       }
> >   -    tr->irq_ranges = rangeset_new(hardware_domain, "Overlays:
> > Interrupts", 0);
> > -    if (tr->irq_ranges == NULL)
> > -    {
> > -        printk(XENLOG_ERR "Creating IRQ rangeset failed");
> > -        goto err;
> > -    }
> > -
> > -    tr->iomem_ranges = rangeset_new(hardware_domain, "Overlay: I/O Memory",
> > 0);
> > -    if (tr->iomem_ranges == NULL)
> > -    {
> > -        printk(XENLOG_ERR "Creating IOMMU rangeset failed");
> > -        goto err;
> > -    }
> > -
> >       rc = add_nodes(tr, nodes_full_path);
> >       if ( rc )
> >       {
> > @@ -843,14 +835,83 @@ static long handle_add_overlay_nodes(void
> > *overlay_fdt,
> >       xfree(tr->nodes_address);
> >       xfree(tr->fdt);
> >   -    rangeset_destroy(tr->irq_ranges);
> > -    rangeset_destroy(tr->iomem_ranges);
> > -
> >       xfree(tr);
> >         return rc;
> >   }
> >   +static long handle_attach_overlay_nodes(struct domain *d,
> > +                                        const void *overlay_fdt,
> > +                                        uint32_t overlay_fdt_size)
> > +{
> > +    int rc;
> > +    unsigned int j;
> > +    struct overlay_track *entry;
> > +
> > +    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    spin_lock(&overlay_lock);
> > +
> > +    entry = find_track_entry_from_tracker(overlay_fdt, overlay_fdt_size);
> > +    if ( entry == NULL )
> > +    {
> > +        rc = -EINVAL;
> > +        goto out;
> > +    }
> > +
> > +    entry->irq_ranges = rangeset_new(d, "Overlays: Interrupts", 0);
> > +    if (entry->irq_ranges == NULL)
> > +    {
> > +        rc = -ENOMEM;
> > +        printk(XENLOG_ERR "Creating IRQ rangeset failed");
> > +        goto out;
> > +    }
> > +
> > +    entry->iomem_ranges = rangeset_new(d, "Overlay: I/O Memory", 0);
> > +    if (entry->iomem_ranges == NULL)
> > +    {
> > +        rc = -ENOMEM;
> > +        printk(XENLOG_ERR "Creating IOMMU rangeset failed");
> > +        goto out;
> > +    }
> > +
> > +    for ( j = 0; j < entry->num_nodes; j++ )
> > +    {
> > +        struct dt_device_node *overlay_node;
> > +
> > +        overlay_node = (struct dt_device_node *)entry->nodes_address[j];
> > +        if ( overlay_node == NULL )
> > +        {
> > +            rc = -EINVAL;
> > +            goto out;
> > +        }
> > +
> > +        write_lock(&dt_host_lock);
> > +        rc = handle_device(d, overlay_node, p2m_mmio_direct_c,
> > +                           entry->iomem_ranges, entry->irq_ranges);
> > +        write_unlock(&dt_host_lock);
> > +        if ( rc )
> > +        {
> > +            printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
> > +            goto out;
> > +        }
> > +    }
> > +
> > +    spin_unlock(&overlay_lock);
> > +
> > +    return 0;
> > +
> > + out:
> > +    spin_unlock(&overlay_lock);
> > +
> > +    rangeset_destroy(entry->irq_ranges);
> > +    rangeset_destroy(entry->iomem_ranges);
> > +
> > +    return rc;
> > +}
> > +
> >   long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
> >   {
> >       long ret;
> > @@ -890,6 +951,42 @@ long dt_overlay_sysctl(struct xen_sysctl_dt_overlay
> > *op)
> >       return ret;
> >   }
> >   +long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay
> > *op)
> > +{
> > +    long ret;
> > +    void *overlay_fdt;
> > +
> > +    if ( op->overlay_op != XEN_DOMCTL_DT_OVERLAY_ATTACH )
> > +        return -EOPNOTSUPP;
> > +
> > +    if ( op->overlay_fdt_size == 0 || op->overlay_fdt_size > KB(500) )
> 
> Let's avoid to hardocode KB(500) a second time (it alredy exists in the sysctl
> path).
> 
> But I would actually consider to allow up to 512KB because...

I left it as is because I wasn't sure what you wanted as a change. Did
you mean that you would like the check to be removed, or did you mean
that you would like an #define instead of writing KB(500)?

It is fine either way for me, or to keep it as is, please make the
desired change on commit.


> > +        return -EINVAL;
> > +
> > +    if ( op->pad[0] || op->pad[1] || op->pad[2] )
> > +        return -EINVAL;
> > +
> > +    overlay_fdt = xmalloc_bytes(op->overlay_fdt_size);
> 
> ... xmalloc_bytes() will be more efficient. If the size is not power of 2
> pages, it will free the leftover. Anyway, this could be a follow-up patch.

Leaving this as is for now


> > +
> > +    if ( overlay_fdt == NULL )
> > +        return -ENOMEM;
> > +
> > +    ret = copy_from_guest(overlay_fdt, op->overlay_fdt,
> > op->overlay_fdt_size);
> > +    if ( ret )
> > +    {
> > +        gprintk(XENLOG_ERR, "copy from guest failed\n");
> > +        xfree(overlay_fdt);
> > +
> > +        return -EFAULT;
> > +    }
> > +
> > +    if ( op->overlay_op == XEN_DOMCTL_DT_OVERLAY_ATTACH )
> > +        ret = handle_attach_overlay_nodes(d, overlay_fdt,
> > op->overlay_fdt_size);
> 
> I think you would return 0 if the operation is not supported. But I think we
> need to return -EOPNOTSUPP.

I made the change


> > +
> > +    xfree(overlay_fdt);
> > +
> > +    return ret;
> > +}
> > +
> >   /*
> >    * Local variables:
> >    * mode: C
> > diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> > index a33f9ec32b..ac3c2a7c4c 100644
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> 
> If I am not mistkane, this is the first change in the domctl header for 4.19.
> So you want to bump XEN_DOMCTL_INTERFACE_VERSION.

Done


> > @@ -1190,6 +1190,16 @@ struct xen_domctl_vmtrace_op {
> >   typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
> >   DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
> >   +#if defined(__arm__) || defined(__aarch64__)
> > +struct xen_domctl_dt_overlay {
> > +    XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
> > +    uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
> > +#define XEN_DOMCTL_DT_OVERLAY_ATTACH                1
> 
> OOI, why not starting from 0?

I think it was to avoid the risk of confusing zero as uninitialized with
a real operation.


> > +    uint8_t overlay_op;                     /* IN: Attach. */
> > +    uint8_t pad[3];                         /* IN: Must be zero. */
> > +};
> > +#endif
> > +
> >   struct xen_domctl {
> >       uint32_t cmd;
> >   #define XEN_DOMCTL_createdomain                   1
> > @@ -1277,6 +1287,7 @@ struct xen_domctl {
> >   #define XEN_DOMCTL_vmtrace_op                    84
> >   #define XEN_DOMCTL_get_paging_mempool_size       85
> >   #define XEN_DOMCTL_set_paging_mempool_size       86
> > +#define XEN_DOMCTL_dt_overlay                    87
> >   #define XEN_DOMCTL_gdbsx_guestmemio            1000
> >   #define XEN_DOMCTL_gdbsx_pausevcpu             1001
> >   #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
> > @@ -1339,6 +1350,9 @@ struct xen_domctl {
> >           struct xen_domctl_vuart_op          vuart_op;
> >           struct xen_domctl_vmtrace_op        vmtrace_op;
> >           struct xen_domctl_paging_mempool    paging_mempool;
> > +#if defined(__arm__) || defined(__aarch64__)
> > +        struct xen_domctl_dt_overlay        dt_overlay;
> > +#endif
> >           uint8_t                             pad[128];
> >       } u;
> >   };
> > diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> > index febaa4b16a..3a6e7d48f0 100644
> > --- a/xen/include/public/sysctl.h
> > +++ b/xen/include/public/sysctl.h
> > @@ -1184,14 +1184,11 @@ typedef struct xen_sysctl_cpu_policy
> > xen_sysctl_cpu_policy_t;
> >   DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
> >   #endif
> >   -#if defined(__arm__) || defined (__aarch64__)
> > +#if defined(__arm__) || defined(__aarch64__)
> 
> This seems like unrelated change. Maybe mention in the commit message that you
> are fixing the coding style?

Done


> >   /*
> >    * XEN_SYSCTL_dt_overlay
> > - * Performs addition/removal of device tree nodes under parent node using
> > dtbo.
> > - * This does in three steps:
> > - *  - Adds/Removes the nodes from dt_host.
> > - *  - Adds/Removes IRQ permission for the nodes.
> > - *  - Adds/Removes MMIO accesses.
> > + * Performs addition/removal of device tree nodes under parent node using
> > dtbo
> > + * from dt_host.
> >    */
> >   struct xen_sysctl_dt_overlay {
> >       XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
> > @@ -1265,7 +1262,7 @@ struct xen_sysctl {
> >           struct xen_sysctl_cpu_policy        cpu_policy;
> >   #endif
> >   -#if defined(__arm__) || defined (__aarch64__)
> > +#if defined(__arm__) || defined(__aarch64__)
> >           struct xen_sysctl_dt_overlay        dt_overlay;
> >   #endif
> >           uint8_t                             pad[128];
> > diff --git a/xen/include/xen/dt-overlay.h b/xen/include/xen/dt-overlay.h
> > index c0567741ee..7f0f3741b5 100644
> > --- a/xen/include/xen/dt-overlay.h
> > +++ b/xen/include/xen/dt-overlay.h
> > @@ -39,15 +39,22 @@ struct overlay_track {
> >   };
> >     struct xen_sysctl_dt_overlay;
> > +struct xen_domctl_dt_overlay;
> >     #ifdef CONFIG_OVERLAY_DTB
> >   long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op);
> > +long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op);
> >   #else
> >   #include <xen/errno.h>
> >   static inline long dt_overlay_sysctl(struct xen_sysctl_dt_overlay *op)
> >   {
> >       return -EOPNOTSUPP;
> >   }
> 
> NIT: Newline here please.

Done

> 
> > +static inline long dt_overlay_domctl(struct domain *d,
> > +                                     struct xen_domctl_dt_overlay *op)
> > +{
> > +    return -EOPNOTSUPP;
> > +}
> >   #endif
> >     #endif /* __XEN_DT_OVERLAY_H__ */
> 
> Cheers,
> 
> -- 
> Julien Grall
> 

