Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7EB8190AD
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 20:25:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657111.1025824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFfin-0000op-3Z; Tue, 19 Dec 2023 19:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657111.1025824; Tue, 19 Dec 2023 19:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFfim-0000n9-Vo; Tue, 19 Dec 2023 19:25:40 +0000
Received: by outflank-mailman (input) for mailman id 657111;
 Tue, 19 Dec 2023 19:25:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFfik-0000n1-Tp
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 19:25:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFfik-0000y3-An; Tue, 19 Dec 2023 19:25:38 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.3.234]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFfij-0004K6-Vj; Tue, 19 Dec 2023 19:25:38 +0000
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
	bh=kM37ZU/xQB6q4WgQWCg4wzFAFLTp8//OUWyKrWXg/Mo=; b=iltjb7B9iIkKv2CrmLwKmVVpfe
	I4MJE/xyupg4bkjrm1EHF7a50KosIXQECUYvURVrFS70ytfygGntcM28qeoyOmYPsS6nzMrL5JyYX
	xxQQL/TlVz0wBkrigWlL2YZsKaMBHQ0HeqVYbXnUrJzidO6OB5l9NqQDSW/SkefGAMv4=;
Message-ID: <673e0acc-98e0-4e26-887c-0ef6109bc595@xen.org>
Date: Tue, 19 Dec 2023 19:25:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] xen/arm: smmuv2: Add PCI devices support for
 SMMUv2
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
 <20231109182716.367119-6-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231109182716.367119-6-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 09/11/2023 18:27, Stewart Hildebrand wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

In general, we should avoid blank commit. In this case, I think some 
details would be useful about the implementation. Some of the details I 
am interested in is how the logic works and why we don't handle the same 
quarantine options as x86?

> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v5->v6:
> * check for hardware_domain == NULL (dom0less test case)
> * locking: assign pdev->domain before list_add()
> 
> v4->v5:
> * assign device to pdev->domain (usually dom0) by default in add_device() hook
> * deassign from hwdom
> * rebase on top of ("dynamic node programming using overlay dtbo") series
> * remove TODO in comment about device prints
> * add TODO regarding locking
> * fixup after dropping ("xen/arm: Move is_protected flag to struct device")
> 
> v3->v4:
> * add new device_is_protected check in add_device hook to match SMMUv3 and
>    IPMMU-VMSA drivers
> 
> v2->v3:
> * invoke iommu_add_pci_sideband_ids() from add_device hook
> 
> v1->v2:
> * ignore add_device/assign_device/reassign_device calls for phantom functions
>    (i.e. devfn != pdev->devfn)
> 
> downstream->v1:
> * wrap unused function in #ifdef 0
> * remove the remove_device() stub since it was submitted separately to the list
>    [XEN][PATCH v6 12/19] xen/smmu: Add remove_device callback for smmu_iommu ops
>    https://lists.xenproject.org/archives/html/xen-devel/2023-05/msg00204.html
> * arm_smmu_(de)assign_dev: return error instead of crashing system
> * update condition in arm_smmu_reassign_dev
> * style fixup
> * add && !is_hardware_domain(d) into condition in arm_smmu_assign_dev()
> 
> (cherry picked from commit 0c11a7f65f044c26d87d1e27ac6283ef1f9cfb7a from
>   the downstream branch spider-master from
>   https://github.com/xen-troops/xen.git)
> ---
>   xen/drivers/passthrough/arm/smmu.c | 199 ++++++++++++++++++++++++-----
>   1 file changed, 169 insertions(+), 30 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 11fc1d22ef0a..24d1c0353025 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -131,11 +131,21 @@ enum irqreturn {
>   
>   typedef enum irqreturn irqreturn_t;
>   
> -/* Device logger functions
> - * TODO: Handle PCI
> - */
> -#define dev_print(dev, lvl, fmt, ...)						\
> -	 printk(lvl "smmu: %s: " fmt, dt_node_full_name(dev_to_dt(dev)), ## __VA_ARGS__)
> +/* Device logger functions */
> +#ifndef CONFIG_HAS_PCI
> +#define dev_print(dev, lvl, fmt, ...)    \
> +    printk(lvl "smmu: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
> +#else
> +#define dev_print(dev, lvl, fmt, ...) ({                                \
> +    if ( !dev_is_pci((dev)) )                                           \
> +        printk(lvl "smmu: %s: " fmt, dev_name((dev)), ## __VA_ARGS__);  \
> +    else                                                                \
> +    {                                                                   \
> +        struct pci_dev *pdev = dev_to_pci((dev));                       \
> +        printk(lvl "smmu: %pp: " fmt, &pdev->sbdf, ## __VA_ARGS__);     \
> +    }                                                                   \
> +})
> +#endif
>   
>   #define dev_dbg(dev, fmt, ...) dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
>   #define dev_notice(dev, fmt, ...) dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
> @@ -187,6 +197,7 @@ static void __iomem *devm_ioremap_resource(struct device *dev,
>    * Xen: PCI functions
>    * TODO: It should be implemented when PCI will be supported
>    */
> +#if 0 /* unused */
>   #define to_pci_dev(dev)	(NULL)
>   static inline int pci_for_each_dma_alias(struct pci_dev *pdev,
>   					 int (*fn) (struct pci_dev *pdev,
> @@ -196,6 +207,7 @@ static inline int pci_for_each_dma_alias(struct pci_dev *pdev,
>   	BUG();
>   	return 0;
>   }
> +#endif
>   
>   /* Xen: misc */
>   #define PHYS_MASK_SHIFT		PADDR_BITS
> @@ -631,7 +643,7 @@ struct arm_smmu_master_cfg {
>   	for (i = 0; idx = cfg->smendx[i], i < num; ++i)
>   
>   struct arm_smmu_master {
> -	struct device_node		*of_node;
> +	struct device			*dev;
>   	struct rb_node			node;
>   	struct arm_smmu_master_cfg	cfg;
>   };
> @@ -723,7 +735,7 @@ arm_smmu_get_fwspec(struct arm_smmu_master_cfg *cfg)
>   {
>   	struct arm_smmu_master *master = container_of(cfg,
>   			                                      struct arm_smmu_master, cfg);
> -	return dev_iommu_fwspec_get(&master->of_node->dev);
> +	return dev_iommu_fwspec_get(master->dev);
>   }
>   
>   static void parse_driver_options(struct arm_smmu_device *smmu)
> @@ -756,7 +768,7 @@ static struct device_node *dev_get_dev_node(struct device *dev)
>   }
>   
>   static struct arm_smmu_master *find_smmu_master(struct arm_smmu_device *smmu,
> -						struct device_node *dev_node)
> +						struct device *dev)
>   {
>   	struct rb_node *node = smmu->masters.rb_node;
>   
> @@ -765,9 +777,9 @@ static struct arm_smmu_master *find_smmu_master(struct arm_smmu_device *smmu,
>   
>   		master = container_of(node, struct arm_smmu_master, node);
>   
> -		if (dev_node < master->of_node)
> +		if (dev < master->dev)
>   			node = node->rb_left;
> -		else if (dev_node > master->of_node)
> +		else if (dev > master->dev)
>   			node = node->rb_right;
>   		else
>   			return master;
> @@ -802,9 +814,9 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
>   			= container_of(*new, struct arm_smmu_master, node);
>   
>   		parent = *new;
> -		if (master->of_node < this->of_node)
> +		if (master->dev < this->dev)
>   			new = &((*new)->rb_left);
> -		else if (master->of_node > this->of_node)
> +		else if (master->dev > this->dev)
>   			new = &((*new)->rb_right);
>   		else
>   			return -EEXIST;
> @@ -836,28 +848,37 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
>   	struct arm_smmu_master *master;
>   	struct device_node *dev_node = dev_get_dev_node(dev);

Looking at this call, there is a Todo "Add support of PCI". If this 
function is now only meant to be used for platform device, then should 
we remove the TODO in it?

>   
> -	master = find_smmu_master(smmu, dev_node);
> +	master = find_smmu_master(smmu, dev);
>   	if (master) {
>   		dev_err(dev,
>   			"rejecting multiple registrations for master device %s\n",
> -			dev_node->name);
> +			dev_node ? dev_node->name : "");

Printing "" looks a bit odd. But I wonder if this is actually redundant 
with the content printed by dev_err()?

>   		return -EBUSY;
>   	}
>   
>   	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
>   	if (!master)
>   		return -ENOMEM;
> -	master->of_node = dev_node;
> +	master->dev = dev;
>   
> -	/* Xen: Let Xen know that the device is protected by an SMMU */
> -	dt_device_set_protected(dev_node);
> +	if ( !dev_is_pci(dev) )

I think a comment should stay to explain how someone known that the PCI 
device will be protected by an IOMMU.

> +	{
> +		if ( dt_device_is_protected(dev_node) )
> +		{
> +			dev_err(dev, "Already added to SMMU\n");
> +			return -EEXIST;
> +		}

This checks seems to be unrelated with the rest of the patch. Can you 
explain?

> +
> +		/* Xen: Let Xen know that the device is protected by an SMMU */
> +		dt_device_set_protected(dev_node);
> +	}
>   
>   	for (i = 0; i < fwspec->num_ids; ++i) {
>   		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
>   		     (fwspec->ids[i] >= smmu->num_mapping_groups)) {
>   			dev_err(dev,
>   				"stream ID for master device %s greater than maximum allowed (%d)\n",
> -				dev_node->name, smmu->num_mapping_groups);
> +				dev_node ? dev_node->name : "", smmu->num_mapping_groups);

Same remark as above for "".

>   			return -ERANGE;
>   		}
>   		master->cfg.smendx[i] = INVALID_SMENDX;
> @@ -872,7 +893,7 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_smmu_device *smmu,
>   	struct device_node *dev_node = dev_get_dev_node(dev);
>   	int ret;
>   
> -	master = find_smmu_master(smmu, dev_node);
> +	master = find_smmu_master(smmu, dev);
>   	if (master == NULL) {
>   		dev_err(dev,
>   			"No registrations found for master device %s\n",
> @@ -884,8 +905,9 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_smmu_device *smmu,
>   	if (ret)
>   		return ret;
>   
> -	/* Protected by dt_host_lock and dtdevs_lock as caller holds these locks. */
> -	dev_node->is_protected = false;
> +	if ( !dev_is_pci(dev) )
> +		/* Protected by dt_host_lock and dtdevs_lock as caller holds these locks. */
> +		dev_node->is_protected = false;
>   
>   	kfree(master);
>   	return 0;
> @@ -914,6 +936,12 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
>   					     fwspec);
>   }
>   
> +/* Forward declaration */
> +static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
> +			       struct device *dev, u32 flag);
> +static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
> +				 struct device *dev);
> +
>   /*
>    * The driver which supports generic IOMMU DT bindings must have this
>    * callback implemented.
> @@ -938,6 +966,22 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
>   {
>   	struct arm_smmu_device *smmu;
>   	struct iommu_fwspec *fwspec;
> +	int ret;
> +
> +#ifdef CONFIG_HAS_PCI
> +	if ( dev_is_pci(dev) )
> +	{
> +		struct pci_dev *pdev = dev_to_pci(dev);
> +		int ret;
> +
> +		if ( devfn != pdev->devfn )
> +			return 0;
> +
> +		ret = iommu_add_pci_sideband_ids(pdev);
> +		if ( ret < 0 )
> +			iommu_fwspec_free(dev);
> +	}
> +#endif
>   
>   	fwspec = dev_iommu_fwspec_get(dev);
>   	if (fwspec == NULL)
> @@ -947,7 +991,24 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
>   	if (smmu == NULL)
>   		return -ENXIO;
>   
> -	return arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);
> +	ret = arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);
> +	if ( ret )
axc> +		return ret;
> +
> +#ifdef CONFIG_HAS_PCI
> +	if ( dev_is_pci(dev) )
> +	{
> +		struct pci_dev *pdev = dev_to_pci(dev);
> +
> +		/*
> +		 * During PHYSDEVOP_pci_device_add, Xen does not assign the
> +		 * device, so we must do it here.
> +		 */

In the context of dom0less, the hardware domain may not exist at all. 
And even if it exists, you will first assign the device to the hardware 
domain and then re-assign to the guest just after.

This looks wrong.

> +		ret = arm_smmu_assign_dev(pdev->domain, devfn, dev, 0);
> +	}
> +#endif
> +
> +	return ret;
>   }
>   
>   static int arm_smmu_dt_xlate_generic(struct device *dev,
> @@ -970,11 +1031,10 @@ static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
>   {
>   	struct arm_smmu_device *smmu;
>   	struct arm_smmu_master *master = NULL;
> -	struct device_node *dev_node = dev_get_dev_node(dev);
>   
>   	spin_lock(&arm_smmu_devices_lock);
>   	list_for_each_entry(smmu, &arm_smmu_devices, list) {
> -		master = find_smmu_master(smmu, dev_node);
> +		master = find_smmu_master(smmu, dev);
>   		if (master)
>   			break;
>   	}
> @@ -2066,6 +2126,7 @@ static bool arm_smmu_capable(enum iommu_cap cap)
>   }
>   #endif
>   
> +#if 0 /* Not used */
>   static int __arm_smmu_get_pci_sid(struct pci_dev *pdev, u16 alias, void *data)
>   {
>   	*((u16 *)data) = alias;
> @@ -2076,6 +2137,7 @@ static void __arm_smmu_release_pci_iommudata(void *data)
>   {
>   	kfree(data);
>   }
> +#endif
>   
>   static int arm_smmu_add_device(struct device *dev)
>   {
> @@ -2083,12 +2145,13 @@ static int arm_smmu_add_device(struct device *dev)
>   	struct arm_smmu_master_cfg *cfg;
>   	struct iommu_group *group;
>   	void (*releasefn)(void *data) = NULL;
> -	int ret;
>   
>   	smmu = find_smmu_for_device(dev);
>   	if (!smmu)
>   		return -ENODEV;
>   
> +	/* There is no need to distinguish here, thanks to PCI-IOMMU DT bindings */
> +#if 0
>   	if (dev_is_pci(dev)) {
>   		struct pci_dev *pdev = to_pci_dev(dev);
>   		struct iommu_fwspec *fwspec;
> @@ -2113,10 +2176,12 @@ static int arm_smmu_add_device(struct device *dev)
>   				       &fwspec->ids[0]);
>   		releasefn = __arm_smmu_release_pci_iommudata;
>   		cfg->smmu = smmu;
> -	} else {
> +	} else
> +#endif
> +	{
>   		struct arm_smmu_master *master;
>   
> -		master = find_smmu_master(smmu, dev->of_node);
> +		master = find_smmu_master(smmu, dev);
>   		if (!master) {
>   			return -ENODEV;
>   		}
> @@ -2784,6 +2849,61 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
>   			return -ENOMEM;
>   	}
>   
> +#ifdef CONFIG_HAS_PCI
> +	if ( dev_is_pci(dev) && !is_hardware_domain(d) )
> +	{
> +		struct pci_dev *pdev = dev_to_pci(dev);
> +
> +		printk(XENLOG_INFO "Assigning device %04x:%02x:%02x.%u to dom%d\n",
> +		       pdev->seg, pdev->bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
> +		       d->domain_id);

Is this a left-over debug? If not, shouldn't this happen in a caller 
instead because this is quite generic?

> +
> +		if ( devfn != pdev->devfn || pdev->domain == d )
> +			return 0;
> +
> +		ASSERT(pcidevs_locked());
> +
> +		/* TODO: acquire pci_lock */

What's the plan for this TODO? (The commit message is blank).

> +#if 0
> +		write_lock(&pdev->domain->pci_lock);
> +#endif
> +		list_del(&pdev->domain_list);
> +#if 0
> +		write_unlock(&pdev->domain->pci_lock);
> +#endif
> +
> +		pdev->domain = d;
> +
> +#if 0
> +		write_lock(&d->pci_lock);
> +#endif
> +		list_add(&pdev->domain_list, &d->pdev_list);
> +#if 0
> +		write_unlock(&d->pci_lock);
> +#endif
> +
> +		if ( hardware_domain )
> +		{
> +			domain = dev_iommu_domain(dev);
> +
> +			/*
> +			 * Xen may not deassign the device from hwdom before
> +			 * assigning it elsewhere.
> +			 */

This comment leave more question than it really answer. Why can't Xen 
call reassign? IOW, it feels wrong to reimplement re-assign within 
assign. At mimimum, this should be consolidated.

> +			if ( domain && is_hardware_domain(domain->priv->cfg.domain) )
> +			{
> +				ret = arm_smmu_deassign_dev(hardware_domain, devfn, dev);
> +				if ( ret )
> +					return ret;
> +			}
> +		}
> +
> +		/* dom_io is used as a sentinel for quarantined devices */
> +		if ( d == dom_io )
> +			return 0;
> +	}
> +#endif
> +
>   	if (!dev_iommu_group(dev)) {
>   		ret = arm_smmu_add_device(dev);
>   		if (ret)
> @@ -2833,11 +2953,30 @@ out:
>   	return ret;
>   }
>   
> -static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
> +static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
> +				 struct device *dev)
>   {
>   	struct iommu_domain *domain = dev_iommu_domain(dev);
>   	struct arm_smmu_xen_domain *xen_domain;
>   
> +#ifdef CONFIG_HAS_PCI
> +	if ( dev_is_pci(dev) )
> +	{
> +		struct pci_dev *pdev = dev_to_pci(dev);
> +
> +		printk(XENLOG_INFO "Deassigning device %04x:%02x:%02x.%u from dom%d\n",
> +		       pdev->seg, pdev->bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
> +		       d->domain_id);

Same questions as above for the printk.

> +
> +		if ( devfn != pdev->devfn )
> +			return 0;

I don't understand this check. Are you sanity checking pdev->devfn, and 
if so shouldn't not this return an error?

> +
> +		/* dom_io is used as a sentinel for quarantined devices */
> +		if ( d == dom_io )
> +			return 0;
> +	}
> +#endif
> +
>   	xen_domain = dom_iommu(d)->arch.priv;
>   
>   	if (!domain || domain->priv->cfg.domain != d) {
> @@ -2865,13 +3004,13 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
>   	int ret = 0;
>   
>   	/* Don't allow remapping on other domain than hwdom */

This comment now ...

> -	if ( t && !is_hardware_domain(t) )
> +	if ( t && !is_hardware_domain(t) && t != dom_io )

... now doesn't match the check. You are also relaxing for everyone but 
don't really explain why.

>   		return -EPERM;
>   
>   	if (t == s)
>   		return 0;
>   
> -	ret = arm_smmu_deassign_dev(s, dev);
> +	ret = arm_smmu_deassign_dev(s, devfn, dev);
>   	if (ret)
>   		return ret;
>   

Cheers,

-- 
Julien Grall

