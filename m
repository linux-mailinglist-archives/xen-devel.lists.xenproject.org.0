Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDEB2EFBE6
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 00:57:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63933.113325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky1cp-0007Mn-IM; Fri, 08 Jan 2021 23:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63933.113325; Fri, 08 Jan 2021 23:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky1cp-0007MO-Ea; Fri, 08 Jan 2021 23:56:59 +0000
Received: by outflank-mailman (input) for mailman id 63933;
 Fri, 08 Jan 2021 23:56:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkaL=GL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ky1cn-0007MJ-Kt
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 23:56:57 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5f56224-3b55-4e18-a42d-8ce67876c736;
 Fri, 08 Jan 2021 23:56:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D56FC23998;
 Fri,  8 Jan 2021 23:56:54 +0000 (UTC)
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
X-Inumbo-ID: f5f56224-3b55-4e18-a42d-8ce67876c736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610150215;
	bh=g8mseGwMUQGTQ3s2xAunmfGXzoYW7lgdIDSuechTWsM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZZKsgeKa2n7Nsp9dNxU0Ipjp6Vwn/tWeljlwaJ+WwH1C2yu9xbT8jyugIV+DjlkcS
	 5vfA3MXbqKt+MCZoaV5WNFFIYPPi9qB5mp0Mf8TnTNt5AZmKVvNqflKuaN7KpM87Av
	 WnKro07gOJctlL29ASZZR8iwRkoz4mOO6jCYOgCGcI6g5UYe3hFdlKTyU8JBYu7mR+
	 w7dsDrc6bt/hjywR0I2muVCHtQr/4d3R3CPxOY08olSWVdpstWvZXVnCEkEDxenKuK
	 BWE2sXg9LertjK2JqsG5P6WdEwiWcfYjXBLre6jgHgw32M14bC369l8wOEU9XtZk6U
	 bItkyg6MH+5cA==
Date: Fri, 8 Jan 2021 15:56:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 05/11] xen/arm: smmuv3: Remove Linux specific code
 that is not usable in XEN
In-Reply-To: <ced37da262ce72b9d1dfbc8a05580ba4672127d0.1610115608.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2101081556430.26153@sstabellini-ThinkPad-T480s>
References: <cover.1610115608.git.rahul.singh@arm.com> <ced37da262ce72b9d1dfbc8a05580ba4672127d0.1610115608.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Jan 2021, Rahul Singh wrote:
> Remove code that is related to below functionality :
>  1. struct io_pgtable_ops
>  2. struct io_pgtable_cfg
>  3. struct iommu_flush_ops,
>  4. struct iommu_ops
>  5. module_param_named, MODULE_PARM_DESC, module_platform_driver,
>     MODULE_*
>  6. IOMMU domain-types
>  7. arm_smmu_set_bus_ops
>  8. iommu_device_sysfs_add, iommu_device_register,
>     iommu_device_set_fwnode
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in V3:
> - Commit message is updated to add more detail what is removed in this
>   patch.
> - remove instances of io_pgtable_cfg.
> - Added back ARM_SMMU_FEAT_COHERENCY feature.
> Changes in V4: Rebase
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 475 ++------------------------
>  1 file changed, 21 insertions(+), 454 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 869f38b753..5ce14850b4 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -394,13 +394,7 @@
>  #define ARM_SMMU_CMDQ_SYNC_TIMEOUT_US	1000000 /* 1s! */
>  #define ARM_SMMU_CMDQ_SYNC_SPIN_COUNT	10
>  
> -#define MSI_IOVA_BASE			0x8000000
> -#define MSI_IOVA_LENGTH			0x100000
> -
>  static bool disable_bypass = 1;
> -module_param_named(disable_bypass, disable_bypass, bool, S_IRUGO);
> -MODULE_PARM_DESC(disable_bypass,
> -	"Disable bypass streams such that incoming transactions from devices that are not attached to an iommu domain will report an abort back to the device and will not be allowed to pass through the SMMU.");
>  
>  enum pri_resp {
>  	PRI_RESP_DENY = 0,
> @@ -552,6 +546,19 @@ struct arm_smmu_strtab_cfg {
>  	u32				strtab_base_cfg;
>  };
>  
> +struct arm_lpae_s2_cfg {
> +	u64			vttbr;
> +	struct {
> +		u32			ps:3;
> +		u32			tg:2;
> +		u32			sh:2;
> +		u32			orgn:2;
> +		u32			irgn:2;
> +		u32			sl:2;
> +		u32			tsz:6;
> +	} vtcr;
> +};
> +
>  /* An SMMUv3 instance */
>  struct arm_smmu_device {
>  	struct device			*dev;
> @@ -633,7 +640,6 @@ struct arm_smmu_domain {
>  	struct arm_smmu_device		*smmu;
>  	struct mutex			init_mutex; /* Protects smmu pointer */
>  
> -	struct io_pgtable_ops		*pgtbl_ops;
>  	bool				non_strict;
>  	atomic_t			nr_ats_masters;
>  
> @@ -1491,7 +1497,6 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>  	return ret ? -ETIMEDOUT : 0;
>  }
>  
> -/* IO_PGTABLE API */
>  static void arm_smmu_tlb_inv_context(void *cookie)
>  {
>  	struct arm_smmu_domain *smmu_domain = cookie;
> @@ -1512,86 +1517,10 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  	arm_smmu_cmdq_issue_sync(smmu);
>  }
>  
> -static void arm_smmu_tlb_inv_range_nosync(unsigned long iova, size_t size,
> -					  size_t granule, bool leaf, void *cookie)
> -{
> -	struct arm_smmu_domain *smmu_domain = cookie;
> -	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -	struct arm_smmu_cmdq_ent cmd = {
> -		.tlbi = {
> -			.leaf	= leaf,
> -			.addr	= iova,
> -		},
> -	};
> -
> -	if (!size)
> -		return;
> -
> -	cmd.opcode	= CMDQ_OP_TLBI_S2_IPA;
> -	cmd.tlbi.vmid	= smmu_domain->s2_cfg.vmid;
> -
> -	do {
> -		arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> -		cmd.tlbi.addr += granule;
> -	} while (size -= granule);
> -}
> -
> -static void arm_smmu_tlb_inv_page_nosync(struct iommu_iotlb_gather *gather,
> -					 unsigned long iova, size_t granule,
> -					 void *cookie)
> -{
> -	arm_smmu_tlb_inv_range_nosync(iova, granule, granule, true, cookie);
> -}
> -
> -static void arm_smmu_tlb_inv_walk(unsigned long iova, size_t size,
> -				  size_t granule, void *cookie)
> -{
> -	struct arm_smmu_domain *smmu_domain = cookie;
> -	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -
> -	arm_smmu_tlb_inv_range_nosync(iova, size, granule, false, cookie);
> -	arm_smmu_cmdq_issue_sync(smmu);
> -}
> -
> -static void arm_smmu_tlb_inv_leaf(unsigned long iova, size_t size,
> -				  size_t granule, void *cookie)
> -{
> -	struct arm_smmu_domain *smmu_domain = cookie;
> -	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -
> -	arm_smmu_tlb_inv_range_nosync(iova, size, granule, true, cookie);
> -	arm_smmu_cmdq_issue_sync(smmu);
> -}
> -
> -static const struct iommu_flush_ops arm_smmu_flush_ops = {
> -	.tlb_flush_all	= arm_smmu_tlb_inv_context,
> -	.tlb_flush_walk = arm_smmu_tlb_inv_walk,
> -	.tlb_flush_leaf = arm_smmu_tlb_inv_leaf,
> -	.tlb_add_page	= arm_smmu_tlb_inv_page_nosync,
> -};
> -
> -/* IOMMU API */
> -static bool arm_smmu_capable(enum iommu_cap cap)
> -{
> -	switch (cap) {
> -	case IOMMU_CAP_CACHE_COHERENCY:
> -		return true;
> -	case IOMMU_CAP_NOEXEC:
> -		return true;
> -	default:
> -		return false;
> -	}
> -}
> -
> -static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
> +static struct iommu_domain *arm_smmu_domain_alloc(void)
>  {
>  	struct arm_smmu_domain *smmu_domain;
>  
> -	if (type != IOMMU_DOMAIN_UNMANAGED &&
> -	    type != IOMMU_DOMAIN_DMA &&
> -	    type != IOMMU_DOMAIN_IDENTITY)
> -		return NULL;
> -
>  	/*
>  	 * Allocate the domain and initialise some of its data structures.
>  	 * We can't really do anything meaningful until we've added a
> @@ -1601,12 +1530,6 @@ static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
>  	if (!smmu_domain)
>  		return NULL;
>  
> -	if (type == IOMMU_DOMAIN_DMA &&
> -	    iommu_get_dma_cookie(&smmu_domain->domain)) {
> -		kfree(smmu_domain);
> -		return NULL;
> -	}
> -
>  	mutex_init(&smmu_domain->init_mutex);
>  	INIT_LIST_HEAD(&smmu_domain->devices);
>  	spin_lock_init(&smmu_domain->devices_lock);
> @@ -1638,9 +1561,6 @@ static void arm_smmu_domain_free(struct iommu_domain *domain)
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
>  
> -	iommu_put_dma_cookie(domain);
> -	free_io_pgtable_ops(smmu_domain->pgtbl_ops);
> -
>  	if (cfg->vmid)
>  		arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
>  
> @@ -1649,21 +1569,20 @@ static void arm_smmu_domain_free(struct iommu_domain *domain)
>  
>  
>  static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
> -				       struct arm_smmu_master *master,
> -				       struct io_pgtable_cfg *pgtbl_cfg)
> +				       struct arm_smmu_master *master)
>  {
>  	int vmid;
> +	struct arm_lpae_s2_cfg arm_lpae_s2_cfg;
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
> -	typeof(&pgtbl_cfg->arm_lpae_s2_cfg.vtcr) vtcr;
> +	typeof(&arm_lpae_s2_cfg.vtcr) vtcr = &arm_lpae_s2_cfg.vtcr;
>  
>  	vmid = arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
>  	if (vmid < 0)
>  		return vmid;
>  
> -	vtcr = &pgtbl_cfg->arm_lpae_s2_cfg.vtcr;
>  	cfg->vmid	= (u16)vmid;
> -	cfg->vttbr	= pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
> +	cfg->vttbr	= arm_lpae_s2_cfg.vttbr;
>  	cfg->vtcr	= FIELD_PREP(STRTAB_STE_2_VTCR_S2T0SZ, vtcr->tsz) |
>  			  FIELD_PREP(STRTAB_STE_2_VTCR_S2SL0, vtcr->sl) |
>  			  FIELD_PREP(STRTAB_STE_2_VTCR_S2IR0, vtcr->irgn) |
> @@ -1678,49 +1597,15 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
>  				    struct arm_smmu_master *master)
>  {
>  	int ret;
> -	unsigned long ias, oas;
> -	enum io_pgtable_fmt fmt;
> -	struct io_pgtable_cfg pgtbl_cfg;
> -	struct io_pgtable_ops *pgtbl_ops;
>  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> -	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -
> -	if (domain->type == IOMMU_DOMAIN_IDENTITY) {
> -		smmu_domain->stage = ARM_SMMU_DOMAIN_BYPASS;
> -		return 0;
> -	}
>  
>  	/* Restrict the stage to what we can actually support */
>  	smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
>  
> -
> -	pgtbl_cfg = (struct io_pgtable_cfg) {
> -		.pgsize_bitmap	= smmu->pgsize_bitmap,
> -		.ias		= ias,
> -		.oas		= oas,
> -		.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENCY,
> -		.tlb		= &arm_smmu_flush_ops,
> -		.iommu_dev	= smmu->dev,
> -	};
> -
> -	if (smmu_domain->non_strict)
> -		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
> -
> -	pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
> -	if (!pgtbl_ops)
> -		return -ENOMEM;
> -
> -	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
> -	domain->geometry.aperture_end = (1UL << pgtbl_cfg.ias) - 1;
> -	domain->geometry.force_aperture = true;
> -
> -	ret = arm_smmu_domain_finalise_s2(smmu_domain, master, &pgtbl_cfg);
> -	if (ret < 0) {
> -		free_io_pgtable_ops(pgtbl_ops);
> +	ret = arm_smmu_domain_finalise_s2(smmu_domain, master);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
> -	smmu_domain->pgtbl_ops = pgtbl_ops;
>  	return 0;
>  }
>  
> @@ -1937,76 +1822,6 @@ out_unlock:
>  	return ret;
>  }
>  
> -static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
> -			phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
> -{
> -	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
> -
> -	if (!ops)
> -		return -ENODEV;
> -
> -	return ops->map(ops, iova, paddr, size, prot);
> -}
> -
> -static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
> -			     size_t size, struct iommu_iotlb_gather *gather)
> -{
> -	int ret;
> -	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> -	struct io_pgtable_ops *ops = smmu_domain->pgtbl_ops;
> -
> -	if (!ops)
> -		return 0;
> -
> -	ret = ops->unmap(ops, iova, size, gather);
> -	if (ret && arm_smmu_atc_inv_domain(smmu_domain, 0, iova, size))
> -		return 0;
> -
> -	return ret;
> -}
> -
> -static void arm_smmu_flush_iotlb_all(struct iommu_domain *domain)
> -{
> -	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> -
> -	if (smmu_domain->smmu)
> -		arm_smmu_tlb_inv_context(smmu_domain);
> -}
> -
> -static void arm_smmu_iotlb_sync(struct iommu_domain *domain,
> -				struct iommu_iotlb_gather *gather)
> -{
> -	struct arm_smmu_device *smmu = to_smmu_domain(domain)->smmu;
> -
> -	if (smmu)
> -		arm_smmu_cmdq_issue_sync(smmu);
> -}
> -
> -static phys_addr_t
> -arm_smmu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
> -{
> -	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
> -
> -	if (domain->type == IOMMU_DOMAIN_IDENTITY)
> -		return iova;
> -
> -	if (!ops)
> -		return 0;
> -
> -	return ops->iova_to_phys(ops, iova);
> -}
> -
> -static struct platform_driver arm_smmu_driver;
> -
> -static
> -struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
> -{
> -	struct device *dev = driver_find_device_by_fwnode(&arm_smmu_driver.driver,
> -							  fwnode);
> -	put_device(dev);
> -	return dev ? dev_get_drvdata(dev) : NULL;
> -}
> -
>  static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
>  {
>  	unsigned long limit = smmu->strtab_cfg.num_l1_ents;
> @@ -2017,8 +1832,6 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
>  	return sid < limit;
>  }
>  
> -static struct iommu_ops arm_smmu_ops;
> -
>  static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>  {
>  	int i, ret;
> @@ -2026,16 +1839,12 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>  	struct arm_smmu_master *master;
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  
> -	if (!fwspec || fwspec->ops != &arm_smmu_ops)
> +	if (!fwspec)
>  		return ERR_PTR(-ENODEV);
>  
>  	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
>  		return ERR_PTR(-EBUSY);
>  
> -	smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
> -	if (!smmu)
> -		return ERR_PTR(-ENODEV);
> -
>  	master = kzalloc(sizeof(*master), GFP_KERNEL);
>  	if (!master)
>  		return ERR_PTR(-ENOMEM);
> @@ -2081,153 +1890,11 @@ err_free_master:
>  	return ERR_PTR(ret);
>  }
>  
> -static void arm_smmu_release_device(struct device *dev)
> -{
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> -	struct arm_smmu_master *master;
> -
> -	if (!fwspec || fwspec->ops != &arm_smmu_ops)
> -		return;
> -
> -	master = dev_iommu_priv_get(dev);
> -	arm_smmu_detach_dev(master);
> -	arm_smmu_disable_pasid(master);
> -	kfree(master);
> -	iommu_fwspec_free(dev);
> -}
> -
> -static struct iommu_group *arm_smmu_device_group(struct device *dev)
> -{
> -	struct iommu_group *group;
> -
> -	/*
> -	 * We don't support devices sharing stream IDs other than PCI RID
> -	 * aliases, since the necessary ID-to-device lookup becomes rather
> -	 * impractical given a potential sparse 32-bit stream ID space.
> -	 */
> -	if (dev_is_pci(dev))
> -		group = pci_device_group(dev);
> -	else
> -		group = generic_device_group(dev);
> -
> -	return group;
> -}
> -
> -static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
> -				    enum iommu_attr attr, void *data)
> -{
> -	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> -
> -	switch (domain->type) {
> -	case IOMMU_DOMAIN_UNMANAGED:
> -		switch (attr) {
> -		case DOMAIN_ATTR_NESTING:
> -			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
> -			return 0;
> -		default:
> -			return -ENODEV;
> -		}
> -		break;
> -	case IOMMU_DOMAIN_DMA:
> -		switch (attr) {
> -		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
> -			*(int *)data = smmu_domain->non_strict;
> -			return 0;
> -		default:
> -			return -ENODEV;
> -		}
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
> -static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
> -				    enum iommu_attr attr, void *data)
> -{
> -	int ret = 0;
> -	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> -
> -	mutex_lock(&smmu_domain->init_mutex);
> -
> -	switch (domain->type) {
> -	case IOMMU_DOMAIN_UNMANAGED:
> -		switch (attr) {
> -		case DOMAIN_ATTR_NESTING:
> -			if (smmu_domain->smmu) {
> -				ret = -EPERM;
> -				goto out_unlock;
> -			}
> -
> -			if (*(int *)data)
> -				smmu_domain->stage = ARM_SMMU_DOMAIN_NESTED;
> -			else
> -				smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
> -			break;
> -		default:
> -			ret = -ENODEV;
> -		}
> -		break;
> -	case IOMMU_DOMAIN_DMA:
> -		switch(attr) {
> -		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
> -			smmu_domain->non_strict = *(int *)data;
> -			break;
> -		default:
> -			ret = -ENODEV;
> -		}
> -		break;
> -	default:
> -		ret = -EINVAL;
> -	}
> -
> -out_unlock:
> -	mutex_unlock(&smmu_domain->init_mutex);
> -	return ret;
> -}
> -
>  static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args *args)
>  {
>  	return iommu_fwspec_add_ids(dev, args->args, 1);
>  }
>  
> -static void arm_smmu_get_resv_regions(struct device *dev,
> -				      struct list_head *head)
> -{
> -	struct iommu_resv_region *region;
> -	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
> -
> -	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
> -					 prot, IOMMU_RESV_SW_MSI);
> -	if (!region)
> -		return;
> -
> -	list_add_tail(&region->list, head);
> -
> -	iommu_dma_get_resv_regions(dev, head);
> -}
> -
> -static struct iommu_ops arm_smmu_ops = {
> -	.capable		= arm_smmu_capable,
> -	.domain_alloc		= arm_smmu_domain_alloc,
> -	.domain_free		= arm_smmu_domain_free,
> -	.attach_dev		= arm_smmu_attach_dev,
> -	.map			= arm_smmu_map,
> -	.unmap			= arm_smmu_unmap,
> -	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
> -	.iotlb_sync		= arm_smmu_iotlb_sync,
> -	.iova_to_phys		= arm_smmu_iova_to_phys,
> -	.probe_device		= arm_smmu_probe_device,
> -	.release_device		= arm_smmu_release_device,
> -	.device_group		= arm_smmu_device_group,
> -	.domain_get_attr	= arm_smmu_domain_get_attr,
> -	.domain_set_attr	= arm_smmu_domain_set_attr,
> -	.of_xlate		= arm_smmu_of_xlate,
> -	.get_resv_regions	= arm_smmu_get_resv_regions,
> -	.put_resv_regions	= generic_iommu_put_resv_regions,
> -	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
> -};
> -
>  /* Probing and initialisation functions */
>  static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>  				   struct arm_smmu_queue *q,
> @@ -2927,16 +2594,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  		smmu->oas = 48;
>  	}
>  
> -	if (arm_smmu_ops.pgsize_bitmap == -1UL)
> -		arm_smmu_ops.pgsize_bitmap = smmu->pgsize_bitmap;
> -	else
> -		arm_smmu_ops.pgsize_bitmap |= smmu->pgsize_bitmap;
> -
> -	/* Set the DMA mask for our table walker */
> -	if (dma_set_mask_and_coherent(smmu->dev, DMA_BIT_MASK(smmu->oas)))
> -		dev_warn(smmu->dev,
> -			 "failed to set DMA mask for table walker\n");
> -
>  	smmu->ias = max(smmu->ias, smmu->oas);
>  
>  	dev_info(smmu->dev, "ias %lu-bit, oas %lu-bit (features 0x%08x)\n",
> @@ -3016,43 +2673,6 @@ static unsigned long arm_smmu_resource_size(struct arm_smmu_device *smmu)
>  		return SZ_128K;
>  }
>  
> -static int arm_smmu_set_bus_ops(struct iommu_ops *ops)
> -{
> -	int err;
> -
> -#ifdef CONFIG_PCI
> -	if (pci_bus_type.iommu_ops != ops) {
> -		err = bus_set_iommu(&pci_bus_type, ops);
> -		if (err)
> -			return err;
> -	}
> -#endif
> -#ifdef CONFIG_ARM_AMBA
> -	if (amba_bustype.iommu_ops != ops) {
> -		err = bus_set_iommu(&amba_bustype, ops);
> -		if (err)
> -			goto err_reset_pci_ops;
> -	}
> -#endif
> -	if (platform_bus_type.iommu_ops != ops) {
> -		err = bus_set_iommu(&platform_bus_type, ops);
> -		if (err)
> -			goto err_reset_amba_ops;
> -	}
> -
> -	return 0;
> -
> -err_reset_amba_ops:
> -#ifdef CONFIG_ARM_AMBA
> -	bus_set_iommu(&amba_bustype, NULL);
> -#endif
> -err_reset_pci_ops: __maybe_unused;
> -#ifdef CONFIG_PCI
> -	bus_set_iommu(&pci_bus_type, NULL);
> -#endif
> -	return err;
> -}
> -
>  static void __iomem *arm_smmu_ioremap(struct device *dev, resource_size_t start,
>  				      resource_size_t size)
>  {
> @@ -3145,68 +2765,15 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	/* Record our private device structure */
> -	platform_set_drvdata(pdev, smmu);
> -
>  	/* Reset the device */
>  	ret = arm_smmu_device_reset(smmu, bypass);
>  	if (ret)
>  		return ret;
>  
> -	/* And we're up. Go go go! */
> -	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
> -				     "smmu3.%pa", &ioaddr);
> -	if (ret)
> -		return ret;
> -
> -	iommu_device_set_ops(&smmu->iommu, &arm_smmu_ops);
> -	iommu_device_set_fwnode(&smmu->iommu, dev->fwnode);
> -
> -	ret = iommu_device_register(&smmu->iommu);
> -	if (ret) {
> -		dev_err(dev, "Failed to register iommu\n");
> -		return ret;
> -	}
> -
> -	return arm_smmu_set_bus_ops(&arm_smmu_ops);
> -}
> -
> -static int arm_smmu_device_remove(struct platform_device *pdev)
> -{
> -	struct arm_smmu_device *smmu = platform_get_drvdata(pdev);
> -
> -	arm_smmu_set_bus_ops(NULL);
> -	iommu_device_unregister(&smmu->iommu);
> -	iommu_device_sysfs_remove(&smmu->iommu);
> -	arm_smmu_device_disable(smmu);
> -
>  	return 0;
>  }
>  
> -static void arm_smmu_device_shutdown(struct platform_device *pdev)
> -{
> -	arm_smmu_device_remove(pdev);
> -}
> -
>  static const struct of_device_id arm_smmu_of_match[] = {
>  	{ .compatible = "arm,smmu-v3", },
>  	{ },
>  };
> -MODULE_DEVICE_TABLE(of, arm_smmu_of_match);
> -
> -static struct platform_driver arm_smmu_driver = {
> -	.driver	= {
> -		.name			= "arm-smmu-v3",
> -		.of_match_table		= arm_smmu_of_match,
> -		.suppress_bind_attrs	= true,
> -	},
> -	.probe	= arm_smmu_device_probe,
> -	.remove	= arm_smmu_device_remove,
> -	.shutdown = arm_smmu_device_shutdown,
> -};
> -module_platform_driver(arm_smmu_driver);
> -
> -MODULE_DESCRIPTION("IOMMU API for ARM architected SMMUv3 implementations");
> -MODULE_AUTHOR("Will Deacon <will@kernel.org>");
> -MODULE_ALIAS("platform:arm-smmu-v3");
> -MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 

