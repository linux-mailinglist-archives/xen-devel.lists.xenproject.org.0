Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC968CDCED
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 00:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728902.1133979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAH8e-0008Vj-S4; Thu, 23 May 2024 22:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728902.1133979; Thu, 23 May 2024 22:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAH8e-0008UC-Oi; Thu, 23 May 2024 22:42:20 +0000
Received: by outflank-mailman (input) for mailman id 728902;
 Thu, 23 May 2024 22:42:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sAH8c-0008U6-HV
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 22:42:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAH8c-0007n0-DT; Thu, 23 May 2024 22:42:18 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAH8c-0008RA-4n; Thu, 23 May 2024 22:42:18 +0000
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
	bh=MKSSdCDliWElWe1MT0ed4Gi7k4ta2XLjuxWA8fnaqIM=; b=qjpfxFELQDNAXeCjNizUrQ9Xb7
	y5LOtFuQfPogR5EuZXbwojbcp3SC4EanmI+egvyhOhNCbV7KC3E0q+7DjUqJAmWq0AH+X2mJ0c07A
	Vk7s8JzieClcrFFB1UEdX8DanxGHCv4yrQpVWmUAtNINf1whPWI+N9vMGjaBhzz1Pfsk=;
Message-ID: <a9033982-9c7b-4b16-b2c0-e47a3f73e452@xen.org>
Date: Thu, 23 May 2024 23:42:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] xen/arm: Support device detachment from domains
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20240523074040.1611264-1-xin.wang2@amd.com>
 <20240523074040.1611264-8-xin.wang2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240523074040.1611264-8-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 23/05/2024 08:40, Henry Wang wrote:
> Similarly as the device attachment from DT overlay to domain, this
> commit implements the device detachment from domain. The DOMCTL
> XEN_DOMCTL_dt_overlay op is extended to have the operation
> XEN_DOMCTL_DT_OVERLAY_DETACH. The detachment of the device is
> implemented by unmapping the IRQ and IOMMU resources. Note that with
> these changes, the device de-registration from the IOMMU driver should
> only happen at the time when the DT overlay is removed from the Xen
> device tree.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
> v4:
> - Split the original patch, only do device detachment from domain.
> ---
>   xen/common/dt-overlay.c     | 243 ++++++++++++++++++++++++++++--------
>   xen/include/public/domctl.h |   3 +-
>   2 files changed, 194 insertions(+), 52 deletions(-)
> 
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> index 1087f9b502..693b6e4777 100644
> --- a/xen/common/dt-overlay.c
> +++ b/xen/common/dt-overlay.c
> @@ -392,24 +392,100 @@ find_track_entry_from_tracker(const void *overlay_fdt,
>       return entry;
>   }
>   
> +static int remove_irq(unsigned long s, unsigned long e, void *data)
> +{
> +    struct domain *d = data;
> +    int rc = 0;
> +
> +    /*
> +     * IRQ should always have access unless there are duplication of
> +     * of irqs in device tree. There are few cases of xen device tree
> +     * where there are duplicate interrupts for the same node.
> +     */
> +    if (!irq_access_permitted(d, s))

Because of this check, it means that ...

> +        return 0;
> +    /*
> +     * TODO: We don't handle shared IRQs for now. So, it is assumed that
> +     * the IRQs was not shared with another domain.
> +     */
> +    rc = irq_deny_access(d, s);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "unable to revoke access for irq %ld\n", s);
> +        return rc;
> +    }
> +
> +    rc = release_guest_irq(d, s);

... release_guest_irq() fails on the next retry it will pass. I don't 
think this is what we want.

Instead, we probably want to re-order the call.

> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "unable to release irq %ld\n", s);
> +        return rc;
> +    }
> +
> +    return rc;
> +}
> +
> +static int remove_all_irqs(struct rangeset *irq_ranges, struct domain *d)
> +{
> +    return rangeset_report_ranges(irq_ranges, 0, ~0UL, remove_irq, d);
> +}
> +
> +static int remove_iomem(unsigned long s, unsigned long e, void *data)
> +{
> +    struct domain *d = data;
> +    int rc = 0;
> +    p2m_type_t t;
> +    mfn_t mfn;
> +
> +    mfn = p2m_lookup(d, _gfn(s), &t);

What are you trying to addres with this check? For instance, the fact 
that the first MFN is mapped, doesn't guarantee the rest is.

> +    if ( mfn_x(mfn) == 0 || mfn_x(mfn) == ~0UL )

I don't understand why we are checking for 0 here. In theory, it is 
valid MFN. Also, the second part wants to be INVALID_MFN.

> +        return -EINVAL;
> +
> +    rc = iomem_deny_access(d, s, e);

iomem_deny_access() works on MFN but here you pass an MFN. Are you 
assuming the GFN == MFN? How would that work for domains that are not 
direct mapped?

> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "Unable to remove %pd access to %#lx - %#lx\n",
> +               d, s, e);
> +        return rc;
> +    }
> +
> +    rc = unmap_mmio_regions(d, _gfn(s), e - s, _mfn(s));
> +    if ( rc )
> +        return rc;
> +
> +    return rc;
> +}
> +
> +static int remove_all_iomems(struct rangeset *iomem_ranges, struct domain *d)
> +{
> +    return rangeset_report_ranges(iomem_ranges, 0, ~0UL, remove_iomem, d);
> +}
> +
>   /* Check if node itself can be removed and remove node from IOMMU. */
> -static int remove_node_resources(struct dt_device_node *device_node)
> +static int remove_node_resources(struct dt_device_node *device_node,
> +                                 struct domain *d)
>   {
>       int rc = 0;
>       unsigned int len;
>       domid_t domid;
>   
> -    domid = dt_device_used_by(device_node);
> +    if ( !d )

I looked at the code, I am a bit unsure how "d" can be NULL. Do you have 
any pointer?

> +    {
> +        domid = dt_device_used_by(device_node);
>   
> -    dt_dprintk("Checking if node %s is used by any domain\n",
> -               device_node->full_name);
> +        dt_dprintk("Checking if node %s is used by any domain\n",
> +                   device_node->full_name);
>   
> -    /* Remove the node if only it's assigned to hardware domain or domain io. */
> -    if ( domid != hardware_domain->domain_id && domid != DOMID_IO )
> -    {
> -        printk(XENLOG_ERR "Device %s is being used by domain %u. Removing nodes failed\n",
> -               device_node->full_name, domid);
> -        return -EINVAL;
> +        /*
> +         * We also check if device is assigned to DOMID_IO as when a domain
> +         * is destroyed device is assigned to DOMID_IO.
> +         */
> +        if ( domid != DOMID_IO )
> +        {
> +            printk(XENLOG_ERR "Device %s is being assigned to %u. Device is assigned to %d\n",
> +                   device_node->full_name, DOMID_IO, domid);
> +            return -EINVAL;
> +        }
>       }
>   
>       /* Check if iommu property exists. */
> @@ -417,9 +493,12 @@ static int remove_node_resources(struct dt_device_node *device_node)
>       {
>           if ( dt_device_is_protected(device_node) )
>           {
> -            rc = iommu_remove_dt_device(device_node);
> -            if ( rc < 0 )
> -                return rc;
> +            if ( !list_empty(&device_node->domain_list) )
> +            {
> +                rc = iommu_deassign_dt_device(d, device_node);
> +                if ( rc < 0 )
> +                    return rc;
> +            }
>           }
>       }
>   
> @@ -428,7 +507,8 @@ static int remove_node_resources(struct dt_device_node *device_node)
>   
>   /* Remove all descendants from IOMMU. */
>   static int
> -remove_descendant_nodes_resources(const struct dt_device_node *device_node)
> +remove_descendant_nodes_resources(const struct dt_device_node *device_node,
> +                                  struct domain *d)
>   {
>       int rc = 0;
>       struct dt_device_node *child_node;
> @@ -438,12 +518,12 @@ remove_descendant_nodes_resources(const struct dt_device_node *device_node)
>       {
>           if ( child_node->child )
>           {
> -            rc = remove_descendant_nodes_resources(child_node);
> +            rc = remove_descendant_nodes_resources(child_node, d);
>               if ( rc )
>                   return rc;
>           }
>   
> -        rc = remove_node_resources(child_node);
> +        rc = remove_node_resources(child_node, d);
>           if ( rc )
>               return rc;
>       }
> @@ -456,8 +536,7 @@ static int remove_nodes(const struct overlay_track *tracker)
>   {
>       int rc = 0;
>       struct dt_device_node *overlay_node;
> -    unsigned int j;
> -    struct domain *d = hardware_domain;
> +    unsigned int j, len;
>   
>       for ( j = 0; j < tracker->num_nodes; j++ )
>       {
> @@ -467,18 +546,15 @@ static int remove_nodes(const struct overlay_track *tracker)
>   
>           write_lock(&dt_host_lock);
>   
> -        rc = remove_descendant_nodes_resources(overlay_node);
> -        if ( rc )
> +        /* Check if iommu property exists. */
> +        if ( dt_get_property(overlay_node, "iommus", &len) )

Why do we need to check for the property in the "iommus" rather than ...

>           {
> -            write_unlock(&dt_host_lock);
> -            return rc;
> -        }
> -
> -        rc = remove_node_resources(overlay_node);
> -        if ( rc )
> -        {
> -            write_unlock(&dt_host_lock);
> -            return rc;
> +            if ( dt_device_is_protected(overlay_node) )

... relying on dt_device_is_protected()?

> +            {
> +                rc = iommu_remove_dt_device(overlay_node);
> +                if ( rc < 0 )
> +                    return rc;
> +            }
>           }
>   
>           dt_dprintk("Removing node: %s\n", overlay_node->full_name);
> @@ -493,22 +569,6 @@ static int remove_nodes(const struct overlay_track *tracker)
>           write_unlock(&dt_host_lock);
>       }
>   
> -    /* Remove IRQ access. */
> -    if ( tracker->irq_ranges )
> -    {
> -        rc = rangeset_consume_ranges(tracker->irq_ranges, irq_remove_cb, d);
> -        if ( rc )
> -            return rc;
> -    }
> -
> -   /* Remove mmio access. */
> -    if ( tracker->iomem_ranges )
> -    {
> -        rc = rangeset_consume_ranges(tracker->iomem_ranges, iomem_remove_cb, d);
> -        if ( rc )
> -            return rc;
> -    }
> -
>       return rc;
>   }
>   
> @@ -534,7 +594,6 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
>       {
>           rc = -EINVAL;
>           goto out;
> -

Valid but unrelated change?

>       }
>   
>       rc = remove_nodes(entry);
> @@ -552,9 +611,6 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
>   
>       xfree(entry->nodes_address);
>   
> -    rangeset_destroy(entry->irq_ranges);
> -    rangeset_destroy(entry->iomem_ranges);
> -
>       xfree(entry);
>   
>    out:
> @@ -840,6 +896,88 @@ static long handle_add_overlay_nodes(void *overlay_fdt,
>       return rc;
>   }
>   
> +static long handle_detach_overlay_nodes(struct domain *d,
> +                                        const void *overlay_fdt,
> +                                        uint32_t overlay_fdt_size)
> +{
> +    int rc;
> +    unsigned int j;
> +    struct overlay_track *entry;
> +
> +    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
> +    if ( rc )
> +        return rc;
> +
> +    spin_lock(&overlay_lock);
> +
> +    entry = find_track_entry_from_tracker(overlay_fdt, overlay_fdt_size);
> +    if ( entry == NULL )
> +    {
> +        rc = -EINVAL;
> +        goto out;
> +    }
> +
> +    for ( j = 0; j < entry->num_nodes; j++ )
> +    {
> +        struct dt_device_node *overlay_node;
> +
> +        overlay_node = (struct dt_device_node *)entry->nodes_address[j];

Can you remind me why nodes_address is storing unsigned long rather 
struct dt_device_node?

> +        if ( overlay_node == NULL )
> +        {
> +            rc = -EINVAL;
> +            goto out;
> +        }
> +
> +        write_lock(&dt_host_lock);
> +        rc = remove_descendant_nodes_resources(overlay_node, d);
> +        if ( rc )
> +        {
> +            write_unlock(&dt_host_lock);
> +            goto out;
> +        }
> +
> +        rc = remove_node_resources(overlay_node, d);
> +        if ( rc )
> +        {
> +            write_unlock(&dt_host_lock);
> +            goto out;
> +        }
> +        write_unlock(&dt_host_lock);
> +
> +        rc = remove_all_irqs(entry->irq_ranges, d);

I am really confused. This is called in the for loop but entry doesn't 
seem to change. So why do we need to call it for every iteration? Also...


> +        if ( rc )
> +            goto out;
> +
> +        rc = remove_all_iomems(entry->iomem_ranges, d);
> +        if ( rc )
> +            goto out;
> +    }
> +
> +    /* Remove IRQ access. */
> +    if ( entry->irq_ranges )
> +    {
> +        rc = rangeset_consume_ranges(entry->irq_ranges, irq_remove_cb, d);

... remove_all_irqs() will revert the permission. So why do we need to 
do it again?

> +        if ( rc )
> +            goto out;
> +    }
> +
> +    /* Remove mmio access. */
> +    if ( entry->iomem_ranges )
> +    {
> +        rc = rangeset_consume_ranges(entry->iomem_ranges, iomem_remove_cb, d);

Same question here.

> +        if ( rc )
> +            goto out;
> +    }
> +
> +    rangeset_destroy(entry->irq_ranges);
> +    rangeset_destroy(entry->iomem_ranges);
> +
> + out:
> +    spin_unlock(&overlay_lock);
> +
> +    return rc;
> +}
> +
>   static long handle_attach_overlay_nodes(struct domain *d,
>                                           const void *overlay_fdt,
>                                           uint32_t overlay_fdt_size)
> @@ -956,7 +1094,8 @@ long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op)
>       long ret;
>       void *overlay_fdt;
>   
> -    if ( op->overlay_op != XEN_DOMCTL_DT_OVERLAY_ATTACH )
> +    if ( op->overlay_op != XEN_DOMCTL_DT_OVERLAY_ATTACH &&
> +         op->overlay_op != XEN_DOMCTL_DT_OVERLAY_DETACH )
>           return -EOPNOTSUPP;
>   
>       if ( op->overlay_fdt_size == 0 || op->overlay_fdt_size > KB(500) )
> @@ -979,7 +1118,9 @@ long dt_overlay_domctl(struct domain *d, struct xen_domctl_dt_overlay *op)
>           return -EFAULT;
>       }
>   
> -    if ( op->overlay_op == XEN_DOMCTL_DT_OVERLAY_ATTACH )
> +    if ( op->overlay_op == XEN_DOMCTL_DT_OVERLAY_DETACH )
> +        ret = handle_detach_overlay_nodes(d, overlay_fdt, op->overlay_fdt_size);
> +    else
>           ret = handle_attach_overlay_nodes(d, overlay_fdt, op->overlay_fdt_size);
>   
>       xfree(overlay_fdt);
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index ac3c2a7c4c..e91f743fa4 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1195,7 +1195,8 @@ struct xen_domctl_dt_overlay {
>       XEN_GUEST_HANDLE_64(const_void) overlay_fdt;  /* IN: overlay fdt. */
>       uint32_t overlay_fdt_size;              /* IN: Overlay dtb size. */
>   #define XEN_DOMCTL_DT_OVERLAY_ATTACH                1
> -    uint8_t overlay_op;                     /* IN: Attach. */
> +#define XEN_DOMCTL_DT_OVERLAY_DETACH                2
> +    uint8_t overlay_op;                     /* IN: Attach/Detach. */

Changing the comment for every operation we add is not really scalable 
:). If you want an explanation, can it be generic?

>       uint8_t pad[3];                         /* IN: Must be zero. */
>   };
>   #endif

Cheers,

-- 
Julien Grall

