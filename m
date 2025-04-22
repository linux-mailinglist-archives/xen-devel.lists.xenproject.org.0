Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB1CA95A19
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 02:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961584.1352966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u71No-0007Kl-Sa; Tue, 22 Apr 2025 00:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961584.1352966; Tue, 22 Apr 2025 00:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u71No-0007I4-PN; Tue, 22 Apr 2025 00:21:04 +0000
Received: by outflank-mailman (input) for mailman id 961584;
 Tue, 22 Apr 2025 00:21:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQRL=XI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u71Nn-0007Hy-Fh
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 00:21:03 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aafe8ae0-1f0f-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 02:21:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 495C06116A;
 Tue, 22 Apr 2025 00:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A50C4CEE4;
 Tue, 22 Apr 2025 00:20:58 +0000 (UTC)
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
X-Inumbo-ID: aafe8ae0-1f0f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745281259;
	bh=yEwDvuqmyGgsFhW8jKlaut3NaGF9FI0cGuuDcQ1bBEs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jWkqIwQv/XTSxppEsqafGYajMH7UXOJdz0gcE80dDnoqVdp1MjJsm4QspahLulpVh
	 GFiBI+ULhRuTeBnmR7NQLebyBuYLNsZyNppYRGKgWpEICP580vPNZIR211bkRL0aIR
	 w1TnwLhcncw2TZcOFfb4W6mX1EXKWnBkqbxvIYc41Zl7LrJOcP/IhZ6WMd48rkskvE
	 vkFfHQjEO9i6ZluSknMLLUFe9YgQiUYHDy3KJ0quaoMsaVqEFJV4+Vy6NwYZWLf5DX
	 id6ge8OqaN2yCernACJr858k/4ixlz0Xi312v82TQ74d/4cVPQXjDuAJhTeSnmI660
	 W8+7Yoq/UMlpA==
Date: Mon, 21 Apr 2025 17:20:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Rahul Singh <rahul.singh@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v9 5/8] xen/arm: smmuv3: Add PCI devices support for
 SMMUv3
In-Reply-To: <96dd4cb828377a5a09881ddb5ee5ded1df3dde1e.1741958647.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504211719400.785180@ubuntu-linux-20-04-desktop>
References: <cover.1741958647.git.mykyta_poturai@epam.com> <96dd4cb828377a5a09881ddb5ee5ded1df3dde1e.1741958647.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Mar 2025, Mykyta Poturai wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> Implement support for PCI devices in the SMMU driver. Trigger iommu-map
> parsing when new PCI device is added. Add checks to assign/deassign
> functions to ensure PCI devices are handled correctly. Implement basic
> quarantining.
> 
> All pci devices are automatically assigned to hardware domain if it exists
> to ensure it can probe them.
> 
> TODO:
> Implement scratch page quarantining support.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
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
> * address TODO: use d->pci_lock in arm_smmu_assign_dev()
> * remove !is_hardware_domain and pdev->domain == d checks in assign to
>   support future dom0less use case when dom0 is using vPCI
> * check if pdev->domain exists before assigning to it
> * don't print ""
> * change assign logic to remove reassign reimplementation
> * explain pdev->devfn check
> * make reassign check stricter and update comment
> 
> v5->v6:
> * check for hardware_domain == NULL (dom0less test case)
> * locking: assign pdev->domain before list_add()
> 
> v4->v5:
> * deassign from hwdom
> * add TODO regarding locking
> * fixup after dropping ("xen/arm: Move is_protected flag to struct device")
> 
> v3->v4:
> * no change
> 
> v2->v3:
> * rebase
> * invoke iommu_add_pci_sideband_ids() from add_device hook
> 
> v1->v2:
> * ignore add_device/assign_device/reassign_device calls for phantom functions
>   (i.e. devfn != pdev->devfn)
> 
> downstream->v1:
> * rebase
> * move 2 replacements of s/dt_device_set_protected(dev_to_dt(dev))/device_set_protected(dev)/
>   from this commit to ("xen/arm: Move is_protected flag to struct device")
>   so as to not break ability to bisect
> * adjust patch title (remove stray space)
> * arm_smmu_(de)assign_dev: return error instead of crashing system
> * remove arm_smmu_remove_device() stub
> * update condition in arm_smmu_reassign_dev
> * style fixup
> 
> (cherry picked from commit 7ed6c3ab250d899fe6e893a514278e406a2893e8 from
>  the downstream branch poc/pci-passthrough from
>  https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 117 +++++++++++++++++++++++---
>  1 file changed, 106 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index cee5724022..9c7c13f800 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -1467,14 +1467,35 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
>  }
>  /* Forward declaration */
>  static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *dev);
> +static int arm_smmu_assign_dev(struct domain *d, u8 devfn, struct device *dev,
> +			       u32 flag);
> +static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
> +				 struct device *dev);
>  
>  static int arm_smmu_add_device(u8 devfn, struct device *dev)
>  {
>  	int i, ret;
>  	struct arm_smmu_device *smmu;
>  	struct arm_smmu_master *master;
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +	struct iommu_fwspec *fwspec;
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

Do we need to return on error?


> +	}
> +#endif
>  
> +	fwspec = dev_iommu_fwspec_get(dev);
>  	if (!fwspec)
>  		return -ENODEV;
>  
> @@ -1519,17 +1540,38 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
>  	 */
>  	arm_smmu_enable_pasid(master);
>  
> -	if (dt_device_is_protected(dev_to_dt(dev))) {
> -		dev_err(dev, "Already added to SMMUv3\n");
> -		return -EEXIST;
> -	}
> +	if ( !dev_is_pci(dev) )
> +	{
> +		if (dt_device_is_protected(dev_to_dt(dev))) {
> +			dev_err(dev, "Already added to SMMUv3\n");
> +			return -EEXIST;
> +		}
>  
> -	/* Let Xen know that the master device is protected by an IOMMU. */
> -	dt_device_set_protected(dev_to_dt(dev));
> +		/* Let Xen know that the master device is protected by an IOMMU. */
> +		dt_device_set_protected(dev_to_dt(dev));
> +	}
>  
>  	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
>  			dev_name(fwspec->iommu_dev), fwspec->num_ids);
>  
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
> +		{
> +			ret = arm_smmu_assign_dev(pdev->domain, devfn, dev, 0);
> +			if (ret)
> +				goto err_free_master;
> +		}
> +	}
> +#endif
> +
>  	return 0;
>  
>  err_free_master:
> @@ -2622,6 +2664,42 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
>  	struct arm_smmu_domain *smmu_domain;
>  	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
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
> +			struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +			if ( !iommu_quarantine )
> +				return 0;
> +
> +			if ( master && master->domain )
> +				arm_smmu_deassign_dev(master->domain->d, devfn, dev);
> +
> +			return 0;
> +		}
> +	}
> +#endif
> +
>  	spin_lock(&xen_domain->lock);
>  
>  	/*
> @@ -2655,7 +2733,7 @@ out:
>  	return ret;
>  }
>  
> -static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
> +static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device *dev)
>  {
>  	struct iommu_domain *io_domain = arm_smmu_get_domain(d, dev);
>  	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> @@ -2667,6 +2745,21 @@ static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
>  		return -ESRCH;
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
> +		/* dom_io is used as a sentinel for quarantined devices */
> +		if ( d == dom_io )
> +			return 0;
> +	}
> +#endif
> +
>  	spin_lock(&xen_domain->lock);
>  
>  	arm_smmu_detach_dev(master);
> @@ -2685,14 +2778,16 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
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

