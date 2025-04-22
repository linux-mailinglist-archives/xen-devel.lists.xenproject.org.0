Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72165A95A18
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 02:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961574.1352955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u71Lj-0005kB-GN; Tue, 22 Apr 2025 00:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961574.1352955; Tue, 22 Apr 2025 00:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u71Lj-0005ht-Dg; Tue, 22 Apr 2025 00:18:55 +0000
Received: by outflank-mailman (input) for mailman id 961574;
 Tue, 22 Apr 2025 00:18:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQRL=XI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u71Lh-0005hn-RF
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 00:18:53 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b3d33bc-1f0f-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 02:18:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AF091A4BDDF;
 Tue, 22 Apr 2025 00:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11081C4CEE4;
 Tue, 22 Apr 2025 00:18:43 +0000 (UTC)
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
X-Inumbo-ID: 5b3d33bc-1f0f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745281125;
	bh=d/rbRLFf/WPTiNsK6UpC44Kl3Kit4qbD0Ls3ayVByOE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CMmW+UGgwt6wAYBPLl2tvLkt3PPKPIHtubtbaYE7Bfa8A4N+2gySVmzar6KD7Lqg3
	 A79EkflOgVsgj/PSEEiIlRwCzCmIle/jrGG2F24kpAVl26omzS0t/I1Xue00TYGZfV
	 qo3t7mG9ybfWvF9NNcEq+khBmhDF+hyvNbJPAhoB1/t9Z7t+3Z4FlGbzMDgjX67fFh
	 Ypa2YeDhxsgWUP1rD2WBT7mdGgs5xUgPRzc28HfJo47JvysKrVFzqVpFKKhWL7I42l
	 YXbHIxXSGiImcd3T978WEaWSxmvexwurFvSSZbKIdHFH8JJ4e0ccN9nkwD4cZrRKXo
	 p3vcThWnJeKNA==
Date: Mon, 21 Apr 2025 17:18:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Julien Grall <julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v9 4/8] xen/arm: smmuv2: Add PCI devices support for
 SMMUv2
In-Reply-To: <fa31ae5fa173348b4c0abf714d3c32f182e8860b.1741958647.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504211701190.785180@ubuntu-linux-20-04-desktop>
References: <cover.1741958647.git.mykyta_poturai@epam.com> <fa31ae5fa173348b4c0abf714d3c32f182e8860b.1741958647.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Mar 2025, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Implement support for PCI devices in the SMMU driver. Make arm_smmu_master
> structure to hold a pointer to the device to allow it to hold PCI devices.
> Trigger iommu-map parsing when new PCI device is added. Add checks to
> assign/deassign functions to ensure PCI devices are handled correctly.
> Implement basic quarantining.
> 
> All pci devices are automatically assigned to hardware domain if it exists
> to ensure it can probe them.
> 
> TODO:
> Implement scratch page quarantining support.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v8->v9:
> * no change
> 
> v7->v8:
> * no change
> 
> v6->v7:
> * use d->pci_lock in arm_smmu_assign_dev()
> * remove !is_hardware_domain and pdev->domain == d checks in assign to
>   support future dom0less use case when dom0 is using vPCI
> * remove stale todo in dev_get_dev_node
> * don't print ""
> * remove redundant dt_device_is_protected check
> * remove assign/deassing prints
> * change assign logic to remove reassign reimplementation
> * check if pdev->domain exists before assigning to it
> * explain pdev->devfn check
> * make reassign check stricter and update comment
> 
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
>   IPMMU-VMSA drivers
> 
> v2->v3:
> * invoke iommu_add_pci_sideband_ids() from add_device hook
> 
> v1->v2:
> * ignore add_device/assign_device/reassign_device calls for phantom functions
>   (i.e. devfn != pdev->devfn)
> 
> downstream->v1:
> * wrap unused function in #ifdef 0
> * remove the remove_device() stub since it was submitted separately to the list
>   [XEN][PATCH v6 12/19] xen/smmu: Add remove_device callback for smmu_iommu ops
>   https://lists.xenproject.org/archives/html/xen-devel/2023-05/msg00204.html
> * arm_smmu_(de)assign_dev: return error instead of crashing system
> * update condition in arm_smmu_reassign_dev
> * style fixup
> * add && !is_hardware_domain(d) into condition in arm_smmu_assign_dev()
> 
> (cherry picked from commit 0c11a7f65f044c26d87d1e27ac6283ef1f9cfb7a from
>  the downstream branch spider-master from
>  https://github.com/xen-troops/xen.git)
> ---
>  xen/drivers/passthrough/arm/smmu.c | 190 ++++++++++++++++++++++-------
>  1 file changed, 147 insertions(+), 43 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 03d22bce1e..cfddcbb1ad 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -132,11 +132,21 @@ enum irqreturn {
>  
>  typedef enum irqreturn irqreturn_t;
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
>  #define dev_dbg(dev, fmt, ...) dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
>  #define dev_notice(dev, fmt, ...) dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
> @@ -188,6 +198,7 @@ static void __iomem *devm_ioremap_resource(struct device *dev,
>   * Xen: PCI functions
>   * TODO: It should be implemented when PCI will be supported
>   */
> +#if 0 /* unused */
>  #define to_pci_dev(dev)	(NULL)
>  static inline int pci_for_each_dma_alias(struct pci_dev *pdev,
>  					 int (*fn) (struct pci_dev *pdev,
> @@ -197,6 +208,7 @@ static inline int pci_for_each_dma_alias(struct pci_dev *pdev,
>  	BUG();
>  	return 0;
>  }
> +#endif

I think we should remove them if they are not used.


>  /* Xen: misc */
>  #define PHYS_MASK_SHIFT		PADDR_BITS
> @@ -631,7 +643,7 @@ struct arm_smmu_master_cfg {
>  	for (i = 0; idx = (cfg)->smendx[i], (i) < (num); ++(i))
>  
>  struct arm_smmu_master {
> -	struct device_node		*of_node;
> +	struct device			*dev;
>  	struct rb_node			node;
>  	struct arm_smmu_master_cfg	cfg;
>  };
> @@ -723,7 +735,7 @@ arm_smmu_get_fwspec(struct arm_smmu_master_cfg *cfg)
>  {
>  	struct arm_smmu_master *master = container_of(cfg,
>  			                                      struct arm_smmu_master, cfg);
> -	return dev_iommu_fwspec_get(&master->of_node->dev);
> +	return dev_iommu_fwspec_get(master->dev);
>  }
>  
>  static void parse_driver_options(struct arm_smmu_device *smmu)
> @@ -742,21 +754,11 @@ static void parse_driver_options(struct arm_smmu_device *smmu)
>  
>  static struct device_node *dev_get_dev_node(struct device *dev)
>  {
> -#if 0 /* Xen: TODO: Add support for PCI */
> -	if (dev_is_pci(dev)) {
> -		struct pci_bus *bus = to_pci_dev(dev)->bus;
> -
> -		while (!pci_is_root_bus(bus))
> -			bus = bus->parent;
> -		return bus->bridge->parent->of_node;
> -	}
> -#endif
> -
>  	return dev->of_node;
>  }
>  
>  static struct arm_smmu_master *find_smmu_master(struct arm_smmu_device *smmu,
> -						struct device_node *dev_node)
> +						struct device *dev)
>  {
>  	struct rb_node *node = smmu->masters.rb_node;
>  
> @@ -765,9 +767,9 @@ static struct arm_smmu_master *find_smmu_master(struct arm_smmu_device *smmu,
>  
>  		master = container_of(node, struct arm_smmu_master, node);
>  
> -		if (dev_node < master->of_node)
> +		if (dev < master->dev)
>  			node = node->rb_left;
> -		else if (dev_node > master->of_node)
> +		else if (dev > master->dev)
>  			node = node->rb_right;
>  		else
>  			return master;
> @@ -802,9 +804,9 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
>  			= container_of(*new, struct arm_smmu_master, node);
>  
>  		parent = *new;
> -		if (master->of_node < this->of_node)
> +		if (master->dev < this->dev)
>  			new = &((*new)->rb_left);
> -		else if (master->of_node > this->of_node)
> +		else if (master->dev > this->dev)
>  			new = &((*new)->rb_right);
>  		else
>  			return -EEXIST;
> @@ -836,28 +838,30 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
>  	struct arm_smmu_master *master;
>  	struct device_node *dev_node = dev_get_dev_node(dev);
>  
> -	master = find_smmu_master(smmu, dev_node);
> +	master = find_smmu_master(smmu, dev);
>  	if (master) {
>  		dev_err(dev,
> -			"rejecting multiple registrations for master device %s\n",
> -			dev_node->name);
> +			"rejecting multiple registrations for master device\n");
>  		return -EBUSY;
>  	}
>  
>  	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
>  	if (!master)
>  		return -ENOMEM;
> -	master->of_node = dev_node;
> +	master->dev = dev;
>  
> -	/* Xen: Let Xen know that the device is protected by an SMMU */
> -	dt_device_set_protected(dev_node);
> +	if ( !dev_is_pci(dev) )
> +	{
> +		/* Xen: Let Xen know that the device is protected by an SMMU */
> +		dt_device_set_protected(dev_node);
> +	}
>  
>  	for (i = 0; i < fwspec->num_ids; ++i) {
>  		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
>  		     (fwspec->ids[i] >= smmu->num_mapping_groups)) {
>  			dev_err(dev,
> -				"stream ID for master device %s greater than maximum allowed (%d)\n",
> -				dev_node->name, smmu->num_mapping_groups);
> +				"SMMU stream ID %d is greater than maximum allowed (%d)\n",
> +				fwspec->ids[i], smmu->num_mapping_groups);
>  			return -ERANGE;
>  		}
>  		master->cfg.smendx[i] = INVALID_SMENDX;
> @@ -872,7 +876,7 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_smmu_device *smmu,
>  	struct device_node *dev_node = dev_get_dev_node(dev);
>  	int ret;
>  
> -	master = find_smmu_master(smmu, dev_node);
> +	master = find_smmu_master(smmu, dev);
>  	if (master == NULL) {
>  		dev_err(dev,
>  			"No registrations found for master device %s\n",
> @@ -884,8 +888,9 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_smmu_device *smmu,
>  	if (ret)
>  		return ret;
>  
> -	/* Protected by dt_host_lock and dtdevs_lock as caller holds these locks. */
> -	dev_node->is_protected = false;
> +	if ( !dev_is_pci(dev) )
> +		/* Protected by dt_host_lock and dtdevs_lock as caller holds these locks. */
> +		dev_node->is_protected = false;
>  
>  	kfree(master);
>  	return 0;
> @@ -914,6 +919,12 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
>  					     fwspec);
>  }
>  
> +/* Forward declaration */
> +static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
> +			       struct device *dev, u32 flag);
> +static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
> +				 struct device *dev);
> +
>  /*
>   * The driver which supports generic IOMMU DT bindings must have this
>   * callback implemented.
> @@ -938,6 +949,23 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
>  {
>  	struct arm_smmu_device *smmu;
>  	struct iommu_fwspec *fwspec;
> +	int ret;
> +
> +#ifdef CONFIG_HAS_PCI
> +	if ( dev_is_pci(dev) )
> +	{
> +		struct pci_dev *pdev = dev_to_pci(dev);
> +		int ret;
> +
> +		/* Ignore calls for phantom functions */
> +		if ( devfn != pdev->devfn )
> +			return 0;
> +
> +		ret = iommu_add_pci_sideband_ids(pdev);
> +		if ( ret < 0 )
> +			iommu_fwspec_free(dev);

Should we return here in case of errors?


> +	}
> +#endif
>  
>  	fwspec = dev_iommu_fwspec_get(dev);
>  	if (fwspec == NULL)
> @@ -947,7 +975,25 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
>  	if (smmu == NULL)
>  		return -ENXIO;
>  
> -	return arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);
> +	ret = arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);
> +	if ( ret )
> +		return ret;
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
> +		if ( pdev->domain )
> +			ret = arm_smmu_assign_dev(pdev->domain, devfn, dev, 0);
> +	}
> +#endif
> +
> +	return ret;
>  }
>  
>  static int arm_smmu_dt_xlate_generic(struct device *dev,
> @@ -970,11 +1016,10 @@ static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
>  {
>  	struct arm_smmu_device *smmu;
>  	struct arm_smmu_master *master = NULL;
> -	struct device_node *dev_node = dev_get_dev_node(dev);
>  
>  	spin_lock(&arm_smmu_devices_lock);
>  	list_for_each_entry(smmu, &arm_smmu_devices, list) {
> -		master = find_smmu_master(smmu, dev_node);
> +		master = find_smmu_master(smmu, dev);
>  		if (master)
>  			break;
>  	}
> @@ -2066,6 +2111,7 @@ static bool arm_smmu_capable(enum iommu_cap cap)
>  }
>  #endif
>  
> +#if 0 /* Not used */
>  static int __arm_smmu_get_pci_sid(struct pci_dev *pdev, u16 alias, void *data)
>  {
>  	*((u16 *)data) = alias;
> @@ -2076,6 +2122,7 @@ static void __arm_smmu_release_pci_iommudata(void *data)
>  {
>  	kfree(data);
>  }
> +#endif
>  
>  static int arm_smmu_add_device(struct device *dev)
>  {
> @@ -2083,12 +2130,13 @@ static int arm_smmu_add_device(struct device *dev)
>  	struct arm_smmu_master_cfg *cfg;
>  	struct iommu_group *group;
>  	void (*releasefn)(void *data) = NULL;
> -	int ret;
>  
>  	smmu = find_smmu_for_device(dev);
>  	if (!smmu)
>  		return -ENODEV;
>  
> +	/* There is no need to distinguish here, thanks to PCI-IOMMU DT bindings */

Let's remove this code then. This driver deviated too much from the
Linux original anyway to worry about the ability to update the code


> +#if 0
>  	if (dev_is_pci(dev)) {
>  		struct pci_dev *pdev = to_pci_dev(dev);
>  		struct iommu_fwspec *fwspec;
> @@ -2113,10 +2161,12 @@ static int arm_smmu_add_device(struct device *dev)
>  				       &fwspec->ids[0]);
>  		releasefn = __arm_smmu_release_pci_iommudata;
>  		cfg->smmu = smmu;
> -	} else {
> +	} else
> +#endif
> +	{
>  		struct arm_smmu_master *master;
>  
> -		master = find_smmu_master(smmu, dev->of_node);
> +		master = find_smmu_master(smmu, dev);
>  		if (!master) {
>  			return -ENODEV;
>  		}
> @@ -2784,6 +2834,42 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
>  			return -ENOMEM;
>  	}
>  
> +#ifdef CONFIG_HAS_PCI
> +	if ( dev_is_pci(dev) )
> +	{
> +		struct pci_dev *pdev = dev_to_pci(dev);
> +
> +		/* Ignore calls for phantom functions */
> +		if ( devfn != pdev->devfn )
> +			return 0;
> +
> +		ASSERT(pcidevs_locked());
> +
> +		write_lock(&pdev->domain->pci_lock);
> +		list_del(&pdev->domain_list);
> +		write_unlock(&pdev->domain->pci_lock);
> +
> +		pdev->domain = d;
> +
> +		write_lock(&d->pci_lock);
> +		list_add(&pdev->domain_list, &d->pdev_list);
> +		write_unlock(&d->pci_lock);
> +
> +		/* dom_io is used as a sentinel for quarantined devices */
> +		if ( d == dom_io )
> +		{
> +			struct iommu_domain *domain = dev_iommu_domain(dev);
> +			if ( !iommu_quarantine )
> +				return 0;
> +
> +			if ( domain && domain->priv )
> +				arm_smmu_deassign_dev(domain->priv->cfg.domain, devfn, dev);
> +
> +			return 0;
> +		}
> +	}
> +#endif
> +
>  	if (!dev_iommu_group(dev)) {
>  		ret = arm_smmu_add_device(dev);
>  		if (ret)
> @@ -2833,11 +2919,27 @@ out:
>  	return ret;
>  }
>  
> -static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
> +static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
> +				 struct device *dev)
>  {
>  	struct iommu_domain *domain = dev_iommu_domain(dev);
>  	struct arm_smmu_xen_domain *xen_domain;
>  
> +#ifdef CONFIG_HAS_PCI
> +	if ( dev_is_pci(dev) )
> +	{
> +		struct pci_dev *pdev = dev_to_pci(dev);
> +
> +		/* Ignore calls for phantom functions */
> +		if ( devfn != pdev->devfn )
> +			return 0;
> +
> +		/* dom_io is used as a sentinel for quarantined devices */
> +		if ( d == dom_io )
> +			return 0;
> +	}
> +#endif
> +
>  	xen_domain = dom_iommu(d)->arch.priv;
>  
>  	if (!domain || domain->priv->cfg.domain != d) {
> @@ -2864,14 +2966,16 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
>  {
>  	int ret = 0;
>  
> -	/* Don't allow remapping on other domain than hwdom */
> -	if ( t && !is_hardware_domain(t) )
> +	/* Don't allow remapping on other domain than hwdom
> +	 * or dom_io for PCI devices
> +	 */
> +	if ( t && !is_hardware_domain(t) && (t != dom_io || !dev_is_pci(dev)) )
>  		return -EPERM;
>  
>  	if (t == s)
>  		return 0;
>  
> -	ret = arm_smmu_deassign_dev(s, dev);
> +	ret = arm_smmu_deassign_dev(s, devfn, dev);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.34.1
> 

