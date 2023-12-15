Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E430881502C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 20:29:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655344.1023084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEDre-00049g-1R; Fri, 15 Dec 2023 19:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655344.1023084; Fri, 15 Dec 2023 19:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rEDrd-00047D-V3; Fri, 15 Dec 2023 19:28:49 +0000
Received: by outflank-mailman (input) for mailman id 655344;
 Fri, 15 Dec 2023 19:28:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rEDrc-000477-Sf
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 19:28:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rEDrb-0005qj-QH; Fri, 15 Dec 2023 19:28:47 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.3.206]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rEDrb-00048W-IR; Fri, 15 Dec 2023 19:28:47 +0000
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
	bh=3IqicZryB/mpkkmkQeXM3Gtkzp+ZABa/cLdKPTvJN5o=; b=hYe0ltWScltbs9LJmeTa7zrApV
	JmS83mErhLplGMljjXGeoPb5wHqzUTSiLoZrGuwQKZTJi6WG420o/XaOZHL3tNF2OvPp/G1wM5QWT
	Q/D7Gn8zT15XoXBhLnojV2N/oZ//wVjRMdOxtqQsgjMhs9LhhqIK48gRY85y94PvMZDg=;
Message-ID: <c348f48c-d774-40ed-b90f-c254a7171d90@xen.org>
Date: Fri, 15 Dec 2023 19:28:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
 <20231109182716.367119-4-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231109182716.367119-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 09/11/2023 18:27, Stewart Hildebrand wrote:
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
> The function dt_map_id to translate an ID through a downstream mapping
> (which is also suitable for mapping Requester ID) was borrowed from Linux
> (v5.10-rc6) and updated according to the Xen code base.
> 
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v5->v6:
> * pass ops to iommu_dt_xlate()
> 
> v4->v5:
> * style: add newlines after variable declarations and before return in iommu.h
> * drop device_is_protected() check in iommu_add_dt_pci_sideband_ids()
> * rebase on top of ("dynamic node programming using overlay dtbo") series
> * fix typo in commit message
> * remove #ifdef around dt_map_id() prototype
> * move dt_map_id() to xen/common/device_tree.c
> * add function name in error prints
> * use dprintk for debug prints
> * use GENMASK and #include <xen/bitops.h>
> * fix typo in comment
> * remove unnecessary (int) cast in loop condition
> * assign *id_out and return success in case of no translation in dt_map_id()
> * don't initialize local variable unnecessarily
> * return error in case of ACPI/no DT in iommu_add_{dt_}pci_sideband_ids()
> 
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
>   xen/common/device_tree.c              | 91 +++++++++++++++++++++++++++
>   xen/drivers/passthrough/device_tree.c | 42 +++++++++++++
>   xen/include/xen/device_tree.h         | 23 +++++++
>   xen/include/xen/iommu.h               | 24 ++++++-
>   4 files changed, 179 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index b1c29529514f..5cb84864b89b 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -10,6 +10,7 @@
>    * published by the Free Software Foundation.
>    */
>   
> +#include <xen/bitops.h>
>   #include <xen/types.h>
>   #include <xen/init.h>
>   #include <xen/guest_access.h>
> @@ -2243,6 +2244,96 @@ int dt_get_pci_domain_nr(struct dt_device_node *node)
>       return (u16)domain;
>   }
>   
> +int dt_map_id(const struct dt_device_node *np, uint32_t id,

OOI (no changes requested), compare to Linux, why did you rename 'rid' 
to 'id'? Are we going to pass something different than a requester ID?

> +              const char *map_name, const char *map_mask_name,
> +              struct dt_device_node **target, uint32_t *id_out)
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
> +        printk(XENLOG_ERR "%s(): %s: Error: Bad %s length: %u\n", __func__,
> +               np->full_name, map_name, map_len);
> +        return -EINVAL;
> +    }
> +
> +    /* The default is to select all bits. */
> +    map_mask = GENMASK(31, 0);
> +
> +    /*
> +     * Can be overridden by "{iommu,msi}-map-mask" property.
> +     * If dt_property_read_u32() fails, the default is used.
> +     */
> +    if ( map_mask_name )
> +        dt_property_read_u32(np, map_mask_name, &map_mask);
> +
> +    masked_id = map_mask & id;
> +    for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4 )
> +    {
> +        struct dt_device_node *phandle_node;
> +        uint32_t id_base = be32_to_cpup(map + 0);
> +        uint32_t phandle = be32_to_cpup(map + 1);
> +        uint32_t out_base = be32_to_cpup(map + 2);
> +        uint32_t id_len = be32_to_cpup(map + 3);
> +
> +        if ( id_base & ~map_mask )
> +        {
> +            printk(XENLOG_ERR "%s(): %s: Invalid %s translation - %s-mask (0x%"PRIx32") ignores id-base (0x%"PRIx32")\n",
> +                   __func__, np->full_name, map_name, map_name, map_mask,
> +                   id_base);
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
> +        dprintk(XENLOG_DEBUG, "%s: %s, using mask %08"PRIx32", id-base: %08"PRIx32", out-base: %08"PRIx32", length: %08"PRIx32", id: %08"PRIx32" -> %08"PRIx32"\n",
> +               np->full_name, map_name, map_mask, id_base, out_base, id_len, id,
> +               masked_id - id_base + out_base);
> +        return 0;
> +    }
> +
> +    dprintk(XENLOG_DEBUG, "%s: no %s translation for id 0x%"PRIx32" on %s\n",
> +           np->full_name, map_name, id,
> +           (target && *target) ? (*target)->full_name : NULL);
> +
> +    if ( id_out )
> +        *id_out = id;
> +
> +    return 0;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 4c35281d98ad..edbd3f17adc5 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -161,6 +161,48 @@ static int iommu_dt_xlate(struct device *dev,
>       return ops->dt_xlate(dev, iommu_spec);
>   }
>   
> +#ifdef CONFIG_HAS_PCI
> +int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    const struct iommu_ops *ops = iommu_get_ops();
> +    struct dt_phandle_args iommu_spec = { .args_count = 1 };
> +    struct device *dev = pci_to_dev(pdev);
> +    const struct dt_device_node *np;
> +    int rc;
> +
> +    if ( !iommu_enabled )
> +        return NO_IOMMU;
> +
> +    if ( !ops )
> +        return -EINVAL;
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

It is not fully clear why in Xen we directly call dt_map_id() (aka 
of_map_rid() in Linux) whereas Linux will may map multiple RID via 
pci_for_each_dma_alias(). Can you clarify?

Cheers,

-- 
Julien Grall

