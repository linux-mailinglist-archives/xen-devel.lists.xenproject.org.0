Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB6D746DA3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 11:35:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558194.872068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGcRQ-0001od-VP; Tue, 04 Jul 2023 09:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558194.872068; Tue, 04 Jul 2023 09:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGcRQ-0001ln-RS; Tue, 04 Jul 2023 09:35:24 +0000
Received: by outflank-mailman (input) for mailman id 558194;
 Tue, 04 Jul 2023 09:35:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGcRP-0001lf-Lg
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 09:35:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGcRO-0003Fv-8L; Tue, 04 Jul 2023 09:35:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGcRO-0003v9-0j; Tue, 04 Jul 2023 09:35:22 +0000
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
	bh=RysJKHX805si3y8duGvxE6FJG8/oDUeDZbBQ5KU+Eyg=; b=vptPXrl9TfUUghBuv8/BcgVsmJ
	G9h+D3vrjZ1yD0CuBQ3rqAdKZgUvmS8iH5acZtqpCieBYkvcbpp0qBcQBhibFURj+U+FFvZ8Agizs
	5aX/uhpC1QULMNxmRGJapIURMGj/kNpEPytrYi9/swQ0ASVC4LbsFS12a5RFeeYmG8+w=;
Message-ID: <855fd25d-07bb-0b08-4c25-75e652c142a6@xen.org>
Date: Tue, 4 Jul 2023 10:35:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 4/7] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <20230607030220.22698-5-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230607030220.22698-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/06/2023 04:02, Stewart Hildebrand wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The main purpose of this patch is to add a way to register PCI device
> (which is behind the IOMMU) using the generic PCI-IOMMU DT bindings [1]
> before assigning that device to a domain.
> 
> This behaves similarly to the existing iommu_add_dt_device API, except it
> handles PCI devices, and it is to be invoked from the add_device hook in the
> SMMU driver.
> 
> The function of_map_id to translate an ID through a downstream mapping

You called the function dt_map_id in Xen.

> (which is also suitable for mapping Requester ID) was borrowed from Linux
> (v5.10-rc6) and updated according to the Xen code base.
> 
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v3->v4:
> * wrap #include <asm/acpi.h> and if ( acpi_disabled ) in #ifdef CONFIG_ACPI
> * fix Michal's remarks about style, parenthesis, and print formats
> * remove !ops->dt_xlate check since it is already in iommu_dt_xlate helper
> * rename s/iommu_dt_pci_map_id/dt_map_id/ because it is generic, not specific
>    to iommu
> * update commit description
> 
> v2->v3:
> * new patch title (was: iommu/arm: Introduce iommu_add_dt_pci_device API)
> * renamed function
>    from: iommu_add_dt_pci_device
>    to: iommu_add_dt_pci_sideband_ids
> * removed stale ops->add_device check
> * iommu.h: add empty stub iommu_add_dt_pci_sideband_ids for !HAS_DEVICE_TREE
> * iommu.h: add iommu_add_pci_sideband_ids helper
> * iommu.h: don't wrap prototype in #ifdef CONFIG_HAS_PCI
> * s/iommu_fwspec_free(pci_to_dev(pdev))/iommu_fwspec_free(dev)/
> 
> v1->v2:
> * remove extra devfn parameter since pdev fully describes the device
> * remove ops->add_device() call from iommu_add_dt_pci_device(). Instead, rely on
>    the existing iommu call in iommu_add_device().
> * move the ops->add_device and ops->dt_xlate checks earlier
> 
> downstream->v1:
> * rebase
> * add const qualifier to struct dt_device_node *np arg in dt_map_id()
> * add const qualifier to struct dt_device_node *np declaration in iommu_add_pci_device()
> * use stdint.h types instead of u8/u32/etc...
> * rename functions:
>    s/dt_iommu_xlate/iommu_dt_xlate/
>    s/dt_map_id/iommu_dt_pci_map_id/
>    s/iommu_add_pci_device/iommu_add_dt_pci_device/
> * add device_is_protected check in iommu_add_dt_pci_device
> * wrap prototypes in CONFIG_HAS_PCI
> 
> (cherry picked from commit 734e3bf6ee77e7947667ab8fa96c25b349c2e1da from
>   the downstream branch poc/pci-passthrough from
>   https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
> ---
>   xen/drivers/passthrough/device_tree.c | 134 ++++++++++++++++++++++++++
>   xen/include/xen/device_tree.h         |  25 +++++
>   xen/include/xen/iommu.h               |  22 ++++-
>   3 files changed, 180 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index ff9e66ebf92a..bd0aed5df651 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -154,6 +154,140 @@ static int iommu_dt_xlate(struct device *dev,
>       return ops->dt_xlate(dev, iommu_spec);
>   }
>   
> +#ifdef CONFIG_HAS_PCI

The code below doesn't seem to be specific to PCI.

> +int dt_map_id(const struct dt_device_node *np, uint32_t id,
> +              const char *map_name, const char *map_mask_name,
> +              struct dt_device_node **target, uint32_t *id_out)

AFAICT, this function can also be used outside of the IOMMU code. So 
shouldn't this be implemented in common/device_tree.c?


> +{
> +    uint32_t map_mask, masked_id, map_len;
> +    const __be32 *map = NULL;
> +
> +    if ( !np || !map_name || (!target && !id_out) )
> +        return -EINVAL;
> +
> +    map = dt_get_property(np, map_name, &map_len);
> +    if ( !map )
> +    {
> +        if ( target )
> +            return -ENODEV;
> +
> +        /* Otherwise, no map implies no translation */
> +        *id_out = id;
> +        return 0;
> +    }
> +
> +    if ( !map_len || (map_len % (4 * sizeof(*map))) )
> +    {
> +        printk(XENLOG_ERR "%s: Error: Bad %s length: %u\n", np->full_name,
> +               map_name, map_len);

I think it would be helpful if you add the function name in the error 
message.

> +        return -EINVAL;
> +    }
> +
> +    /* The default is to select all bits. */
> +    map_mask = 0xffffffff;

Please add a U. That said, I would switch to GENMASK(31, 0) so it is 
easier to check the value.

> +
> +    /*
> +     * Can be overridden by "{iommu,msi}-map-mask" property.
> +     * If df_property_read_u32() fails, the default is used.

s/df/dt/

> +     */
> +    if ( map_mask_name )
> +        dt_property_read_u32(np, map_mask_name, &map_mask);
> +
> +    masked_id = map_mask & id;
> +    for ( ; (int)map_len > 0; map_len -= 4 * sizeof(*map), map += 4 )

Why do you cast map_len to 'int'?

> +    {
> +        struct dt_device_node *phandle_node;
> +        uint32_t id_base = be32_to_cpup(map + 0);
> +        uint32_t phandle = be32_to_cpup(map + 1);
> +        uint32_t out_base = be32_to_cpup(map + 2);
> +        uint32_t id_len = be32_to_cpup(map + 3);
> +
> +        if ( id_base & ~map_mask )
> +        {
> +            printk(XENLOG_ERR "%s: Invalid %s translation - %s-mask (0x%"PRIx32") ignores id-base (0x%"PRIx32")\n",
> +                   np->full_name, map_name, map_name, map_mask, id_base);

Same here about adding the function name.

> +            return -EFAULT;
> +        }
> +
> +        if ( (masked_id < id_base) || (masked_id >= (id_base + id_len)) )
> +            continue;
> +
> +        phandle_node = dt_find_node_by_phandle(phandle);
> +        if ( !phandle_node )
> +            return -ENODEV;
> +
> +        if ( target )
> +        {
> +            if ( !*target )
> +                *target = phandle_node;
> +
> +            if ( *target != phandle_node )
> +                continue;
> +        }
> +
> +        if ( id_out )
> +            *id_out = masked_id - id_base + out_base;
> +
> +        printk(XENLOG_DEBUG "%s: %s, using mask %08"PRIx32", id-base: %08"PRIx32", out-base: %08"PRIx32", length: %08"PRIx32", id: %08"PRIx32" -> %08"PRIx32"\n",

How about using dprintk()?

> +               np->full_name, map_name, map_mask, id_base, out_base, id_len, id,
> +               masked_id - id_base + out_base);
> +        return 0;
> +    }
> +
> +    printk(XENLOG_ERR "%s: no %s translation for id 0x%"PRIx32" on %s\n",
> +           np->full_name, map_name, id, (target && *target) ? (*target)->full_name : NULL);

Same here about adding the function name.

> +
> +    /*
> +     * NOTE: Linux bypasses translation without returning an error here,
> +     * but should we behave in the same way on Xen? Restrict for now.
> +     */

Can you outline why we would want to bypass the translation?

> +    return -EFAULT;
> +}
> +
> +int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    const struct iommu_ops *ops = iommu_get_ops();
> +    struct dt_phandle_args iommu_spec = { .args_count = 1 };
> +    struct device *dev = pci_to_dev(pdev);
> +    const struct dt_device_node *np;
> +    int rc = NO_IOMMU;

AFAICT, the initial value will never be read. So is it necessary?

> +
> +    if ( !iommu_enabled )
> +        return NO_IOMMU;
> +
> +    if ( !ops )
> +        return -EINVAL;
> +
> +    if ( device_is_protected(dev) )
> +        return 0;

These two lines are a bit odd to read because you would think that if 
the device is protected, then you want to continue translation. So can 
you add a comment explaining what this check means?

> +
> +    if ( dev_iommu_fwspec_get(dev) )
> +        return -EEXIST;
> +
> +    np = pci_find_host_bridge_node(pdev);
> +    if ( !np )
> +        return -ENODEV;
> +
> +    /*
> +     * According to the Documentation/devicetree/bindings/pci/pci-iommu.txt
> +     * from Linux.
> +     */
> +    rc = dt_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
> +                   "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
> +    if ( rc )
> +        return (rc == -ENODEV) ? NO_IOMMU : rc;
> +
> +    rc = iommu_dt_xlate(dev, &iommu_spec);
> +    if ( rc < 0 )
> +    {
> +        iommu_fwspec_free(dev);
> +        return -EINVAL;
> +    }
> +
> +    return rc;
> +}
> +#endif /* CONFIG_HAS_PCI */
> +
>   int iommu_add_dt_device(struct dt_device_node *np)
>   {
>       const struct iommu_ops *ops = iommu_get_ops();
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index c2f315140560..8385cd538a58 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -892,6 +892,31 @@ int dt_count_phandle_with_args(const struct dt_device_node *np,
>    */
>   int dt_get_pci_domain_nr(struct dt_device_node *node);
>   
> +#ifdef CONFIG_HAS_PCI

In Xen, we don't usually add #ifdef for prototype only.

> +/**
> + * dt_map_id - Translate an ID through a downstream mapping.
> + * @np: root complex device node.
> + * @id: device ID to map.
> + * @map_name: property name of the map to use.
> + * @map_mask_name: optional property name of the mask to use.
> + * @target: optional pointer to a target device node.
> + * @id_out: optional pointer to receive the translated ID.
> + *
> + * Given a device ID, look up the appropriate implementation-defined
> + * platform ID and/or the target device which receives transactions on that
> + * ID, as per the "iommu-map" and "msi-map" bindings. Either of @target or
> + * @id_out may be NULL if only the other is required. If @target points to
> + * a non-NULL device node pointer, only entries targeting that node will be
> + * matched; if it points to a NULL value, it will receive the device node of
> + * the first matching target phandle, with a reference held.
> + *
> + * Return: 0 on success or a standard error code on failure.
> + */
> +int dt_map_id(const struct dt_device_node *np, uint32_t id,
> +              const char *map_name, const char *map_mask_name,
> +              struct dt_device_node **target, uint32_t *id_out);
> +#endif /* CONFIG_HAS_PCI */
> +
>   struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
>   
>   #ifdef CONFIG_DEVICE_TREE_DEBUG
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 405db59971c5..3cac177840f7 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -26,6 +26,9 @@
>   #include <xen/spinlock.h>
>   #include <public/domctl.h>
>   #include <public/hvm/ioreq.h>
> +#ifdef CONFIG_ACPI
> +#include <asm/acpi.h>
> +#endif
>   #include <asm/device.h>
>   
>   TYPE_SAFE(uint64_t, dfn);
> @@ -219,7 +222,8 @@ int iommu_dt_domain_init(struct domain *d);
>   int iommu_release_dt_devices(struct domain *d);
>   
>   /*
> - * Helper to add master device to the IOMMU using generic IOMMU DT bindings.
> + * Helpers to add master device to the IOMMU using generic (PCI-)IOMMU
> + * DT bindings.
>    *
>    * Return values:
>    *  0 : device is protected by an IOMMU
> @@ -228,12 +232,28 @@ int iommu_release_dt_devices(struct domain *d);
>    *      (IOMMU is not enabled/present or device is not connected to it).
>    */
>   int iommu_add_dt_device(struct dt_device_node *np);
> +int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev);
>   
>   int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
>                          XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
>   
> +#else /* !HAS_DEVICE_TREE */
> +static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    return 0;
Shouldn't this return an error because we wouldn't be able to add the 
Device?

> +}
>   #endif /* HAS_DEVICE_TREE */
>   
> +static inline int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    int ret = 0;

Same here.

> +#ifdef CONFIG_ACPI
> +    if ( acpi_disabled )
> +#endif
> +        ret = iommu_add_dt_pci_sideband_ids(pdev);
> +    return ret;
> +}
> +
>   struct page_info;
>   
>   /*

Cheers,

-- 
Julien Grall

