Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972252C59F4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 18:03:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38867.71675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiKfa-0004mG-40; Thu, 26 Nov 2020 17:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38867.71675; Thu, 26 Nov 2020 17:02:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiKfZ-0004lO-VJ; Thu, 26 Nov 2020 17:02:57 +0000
Received: by outflank-mailman (input) for mailman id 38867;
 Thu, 26 Nov 2020 17:02:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C6x3=FA=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kiKfY-0004PR-N1
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 17:02:56 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e4aed5f0-dd65-427c-bc66-61e41117ad43;
 Thu, 26 Nov 2020 17:02:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6146A1516;
 Thu, 26 Nov 2020 09:02:46 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D9E43F23F;
 Thu, 26 Nov 2020 09:02:45 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=C6x3=FA=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kiKfY-0004PR-N1
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 17:02:56 +0000
X-Inumbo-ID: e4aed5f0-dd65-427c-bc66-61e41117ad43
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id e4aed5f0-dd65-427c-bc66-61e41117ad43;
	Thu, 26 Nov 2020 17:02:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6146A1516;
	Thu, 26 Nov 2020 09:02:46 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D9E43F23F;
	Thu, 26 Nov 2020 09:02:45 -0800 (PST)
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 7/8] xen/arm: Remove Linux specific code that is not usable in XEN
Date: Thu, 26 Nov 2020 17:02:06 +0000
Message-Id: <1d9da8ed4845aeb9e86a5ce6750b811bd7e2020e.1606406359.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606406359.git.rahul.singh@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
In-Reply-To: <cover.1606406359.git.rahul.singh@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>

struct io_pgtable_ops, struct io_pgtable_cfg, struct iommu_flush_ops,
and struct iommu_ops related code are linux specific.

Remove code related to above struct as code is dead code in XEN.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 457 --------------------------
 1 file changed, 457 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 40e3890a58..55d1cba194 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -402,13 +402,7 @@
 #define ARM_SMMU_CMDQ_SYNC_TIMEOUT_US	1000000 /* 1s! */
 #define ARM_SMMU_CMDQ_SYNC_SPIN_COUNT	10
 
-#define MSI_IOVA_BASE			0x8000000
-#define MSI_IOVA_LENGTH			0x100000
-
 static bool disable_bypass = 1;
-module_param_named(disable_bypass, disable_bypass, bool, S_IRUGO);
-MODULE_PARM_DESC(disable_bypass,
-	"Disable bypass streams such that incoming transactions from devices that are not attached to an iommu domain will report an abort back to the device and will not be allowed to pass through the SMMU.");
 
 enum pri_resp {
 	PRI_RESP_DENY = 0,
@@ -599,7 +593,6 @@ struct arm_smmu_domain {
 	struct arm_smmu_device		*smmu;
 	struct mutex			init_mutex; /* Protects smmu pointer */
 
-	struct io_pgtable_ops		*pgtbl_ops;
 	bool				non_strict;
 
 	enum arm_smmu_domain_stage	stage;
@@ -1297,74 +1290,6 @@ static void arm_smmu_tlb_inv_context(void *cookie)
 	arm_smmu_cmdq_issue_sync(smmu);
 }
 
-static void arm_smmu_tlb_inv_range_nosync(unsigned long iova, size_t size,
-					  size_t granule, bool leaf, void *cookie)
-{
-	struct arm_smmu_domain *smmu_domain = cookie;
-	struct arm_smmu_device *smmu = smmu_domain->smmu;
-	struct arm_smmu_cmdq_ent cmd = {
-		.tlbi = {
-			.leaf	= leaf,
-			.addr	= iova,
-		},
-	};
-
-	cmd.opcode	= CMDQ_OP_TLBI_S2_IPA;
-	cmd.tlbi.vmid	= smmu_domain->s2_cfg.vmid;
-
-	do {
-		arm_smmu_cmdq_issue_cmd(smmu, &cmd);
-		cmd.tlbi.addr += granule;
-	} while (size -= granule);
-}
-
-static void arm_smmu_tlb_inv_page_nosync(struct iommu_iotlb_gather *gather,
-					 unsigned long iova, size_t granule,
-					 void *cookie)
-{
-	arm_smmu_tlb_inv_range_nosync(iova, granule, granule, true, cookie);
-}
-
-static void arm_smmu_tlb_inv_walk(unsigned long iova, size_t size,
-				  size_t granule, void *cookie)
-{
-	struct arm_smmu_domain *smmu_domain = cookie;
-	struct arm_smmu_device *smmu = smmu_domain->smmu;
-
-	arm_smmu_tlb_inv_range_nosync(iova, size, granule, false, cookie);
-	arm_smmu_cmdq_issue_sync(smmu);
-}
-
-static void arm_smmu_tlb_inv_leaf(unsigned long iova, size_t size,
-				  size_t granule, void *cookie)
-{
-	struct arm_smmu_domain *smmu_domain = cookie;
-	struct arm_smmu_device *smmu = smmu_domain->smmu;
-
-	arm_smmu_tlb_inv_range_nosync(iova, size, granule, true, cookie);
-	arm_smmu_cmdq_issue_sync(smmu);
-}
-
-static const struct iommu_flush_ops arm_smmu_flush_ops = {
-	.tlb_flush_all	= arm_smmu_tlb_inv_context,
-	.tlb_flush_walk = arm_smmu_tlb_inv_walk,
-	.tlb_flush_leaf = arm_smmu_tlb_inv_leaf,
-	.tlb_add_page	= arm_smmu_tlb_inv_page_nosync,
-};
-
-/* IOMMU API */
-static bool arm_smmu_capable(enum iommu_cap cap)
-{
-	switch (cap) {
-	case IOMMU_CAP_CACHE_COHERENCY:
-		return true;
-	case IOMMU_CAP_NOEXEC:
-		return true;
-	default:
-		return false;
-	}
-}
-
 static struct iommu_domain *arm_smmu_domain_alloc(unsigned type)
 {
 	struct arm_smmu_domain *smmu_domain;
@@ -1421,7 +1346,6 @@ static void arm_smmu_domain_free(struct iommu_domain *domain)
 	struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
 
 	iommu_put_dma_cookie(domain);
-	free_io_pgtable_ops(smmu_domain->pgtbl_ops);
 
 	if (cfg->vmid)
 		arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
@@ -1429,7 +1353,6 @@ static void arm_smmu_domain_free(struct iommu_domain *domain)
 	kfree(smmu_domain);
 }
 
-
 static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
 				       struct arm_smmu_master *master,
 				       struct io_pgtable_cfg *pgtbl_cfg)
@@ -1437,7 +1360,6 @@ static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
 	int vmid;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
-	typeof(&pgtbl_cfg->arm_lpae_s2_cfg.vtcr) vtcr;
 
 	vmid = arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
 	if (vmid < 0)
@@ -1461,20 +1383,12 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
 {
 	int ret;
 	unsigned long ias, oas;
-	enum io_pgtable_fmt fmt;
-	struct io_pgtable_cfg pgtbl_cfg;
-	struct io_pgtable_ops *pgtbl_ops;
 	int (*finalise_stage_fn)(struct arm_smmu_domain *,
 				 struct arm_smmu_master *,
 				 struct io_pgtable_cfg *);
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 
-	if (domain->type == IOMMU_DOMAIN_IDENTITY) {
-		smmu_domain->stage = ARM_SMMU_DOMAIN_BYPASS;
-		return 0;
-	}
-
 	/* Restrict the stage to what we can actually support */
 	smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
 
@@ -1483,40 +1397,17 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
 	case ARM_SMMU_DOMAIN_S2:
 		ias = smmu->ias;
 		oas = smmu->oas;
-		fmt = ARM_64_LPAE_S2;
 		finalise_stage_fn = arm_smmu_domain_finalise_s2;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	pgtbl_cfg = (struct io_pgtable_cfg) {
-		.pgsize_bitmap	= smmu->pgsize_bitmap,
-		.ias		= ias,
-		.oas		= oas,
-		.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENCY,
-		.tlb		= &arm_smmu_flush_ops,
-		.iommu_dev	= smmu->dev,
-	};
-
-	if (smmu_domain->non_strict)
-		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
-
-	pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
-	if (!pgtbl_ops)
-		return -ENOMEM;
-
-	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
-	domain->geometry.aperture_end = (1UL << pgtbl_cfg.ias) - 1;
-	domain->geometry.force_aperture = true;
-
 	ret = finalise_stage_fn(smmu_domain, master, &pgtbl_cfg);
 	if (ret < 0) {
-		free_io_pgtable_ops(pgtbl_ops);
 		return ret;
 	}
 
-	smmu_domain->pgtbl_ops = pgtbl_ops;
 	return 0;
 }
 
@@ -1626,71 +1517,6 @@ out_unlock:
 	return ret;
 }
 
-static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
-			phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
-{
-	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
-
-	if (!ops)
-		return -ENODEV;
-
-	return ops->map(ops, iova, paddr, size, prot, gfp);
-}
-
-static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
-			     size_t size, struct iommu_iotlb_gather *gather)
-{
-	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
-	struct io_pgtable_ops *ops = smmu_domain->pgtbl_ops;
-
-	if (!ops)
-		return 0;
-
-	return ops->unmap(ops, iova, size, gather);
-}
-
-static void arm_smmu_flush_iotlb_all(struct iommu_domain *domain)
-{
-	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
-
-	if (smmu_domain->smmu)
-		arm_smmu_tlb_inv_context(smmu_domain);
-}
-
-static void arm_smmu_iotlb_sync(struct iommu_domain *domain,
-				struct iommu_iotlb_gather *gather)
-{
-	struct arm_smmu_device *smmu = to_smmu_domain(domain)->smmu;
-
-	if (smmu)
-		arm_smmu_cmdq_issue_sync(smmu);
-}
-
-static phys_addr_t
-arm_smmu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
-{
-	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
-
-	if (domain->type == IOMMU_DOMAIN_IDENTITY)
-		return iova;
-
-	if (!ops)
-		return 0;
-
-	return ops->iova_to_phys(ops, iova);
-}
-
-static struct platform_driver arm_smmu_driver;
-
-static
-struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
-{
-	struct device *dev = driver_find_device_by_fwnode(&arm_smmu_driver.driver,
-							  fwnode);
-	put_device(dev);
-	return dev ? dev_get_drvdata(dev) : NULL;
-}
-
 static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
 {
 	unsigned long limit = smmu->strtab_cfg.num_l1_ents;
@@ -1701,206 +1527,6 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
 	return sid < limit;
 }
 
-static struct iommu_ops arm_smmu_ops;
-
-static struct iommu_device *arm_smmu_probe_device(struct device *dev)
-{
-	int i, ret;
-	struct arm_smmu_device *smmu;
-	struct arm_smmu_master *master;
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-
-	if (!fwspec || fwspec->ops != &arm_smmu_ops)
-		return ERR_PTR(-ENODEV);
-
-	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
-		return ERR_PTR(-EBUSY);
-
-	smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
-	if (!smmu)
-		return ERR_PTR(-ENODEV);
-
-	master = kzalloc(sizeof(*master), GFP_KERNEL);
-	if (!master)
-		return ERR_PTR(-ENOMEM);
-
-	master->dev = dev;
-	master->smmu = smmu;
-	master->sids = fwspec->ids;
-	master->num_sids = fwspec->num_ids;
-	dev_iommu_priv_set(dev, master);
-
-	/* Check the SIDs are in range of the SMMU and our stream table */
-	for (i = 0; i < master->num_sids; i++) {
-		u32 sid = master->sids[i];
-
-		if (!arm_smmu_sid_in_range(smmu, sid)) {
-			ret = -ERANGE;
-			goto err_free_master;
-		}
-
-		/* Ensure l2 strtab is initialised */
-		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
-			ret = arm_smmu_init_l2_strtab(smmu, sid);
-			if (ret)
-				goto err_free_master;
-		}
-	}
-
-	return &smmu->iommu;
-
-err_free_master:
-	kfree(master);
-	dev_iommu_priv_set(dev, NULL);
-	return ERR_PTR(ret);
-}
-
-static void arm_smmu_release_device(struct device *dev)
-{
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct arm_smmu_master *master;
-
-	if (!fwspec || fwspec->ops != &arm_smmu_ops)
-		return;
-
-	master = dev_iommu_priv_get(dev);
-	arm_smmu_detach_dev(master);
-	kfree(master);
-	iommu_fwspec_free(dev);
-}
-
-static struct iommu_group *arm_smmu_device_group(struct device *dev)
-{
-	struct iommu_group *group;
-
-	/*
-	 * We don't support devices sharing stream IDs other than PCI RID
-	 * aliases, since the necessary ID-to-device lookup becomes rather
-	 * impractical given a potential sparse 32-bit stream ID space.
-	 */
-	if (dev_is_pci(dev))
-		group = pci_device_group(dev);
-	else
-		group = generic_device_group(dev);
-
-	return group;
-}
-
-static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
-				    enum iommu_attr attr, void *data)
-{
-	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
-
-	switch (domain->type) {
-	case IOMMU_DOMAIN_UNMANAGED:
-		switch (attr) {
-		case DOMAIN_ATTR_NESTING:
-			*(int *)data = (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED);
-			return 0;
-		default:
-			return -ENODEV;
-		}
-		break;
-	case IOMMU_DOMAIN_DMA:
-		switch (attr) {
-		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
-			*(int *)data = smmu_domain->non_strict;
-			return 0;
-		default:
-			return -ENODEV;
-		}
-		break;
-	default:
-		return -EINVAL;
-	}
-}
-
-static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
-				    enum iommu_attr attr, void *data)
-{
-	int ret = 0;
-	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
-
-	mutex_lock(&smmu_domain->init_mutex);
-
-	switch (domain->type) {
-	case IOMMU_DOMAIN_UNMANAGED:
-		switch (attr) {
-		case DOMAIN_ATTR_NESTING:
-			if (smmu_domain->smmu) {
-				ret = -EPERM;
-				goto out_unlock;
-			}
-
-			if (*(int *)data)
-				smmu_domain->stage = ARM_SMMU_DOMAIN_NESTED;
-			else
-				smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
-			break;
-		default:
-			ret = -ENODEV;
-		}
-		break;
-	case IOMMU_DOMAIN_DMA:
-		switch(attr) {
-		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
-			smmu_domain->non_strict = *(int *)data;
-			break;
-		default:
-			ret = -ENODEV;
-		}
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-out_unlock:
-	mutex_unlock(&smmu_domain->init_mutex);
-	return ret;
-}
-
-static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args *args)
-{
-	return iommu_fwspec_add_ids(dev, args->args, 1);
-}
-
-static void arm_smmu_get_resv_regions(struct device *dev,
-				      struct list_head *head)
-{
-	struct iommu_resv_region *region;
-	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
-
-	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
-					 prot, IOMMU_RESV_SW_MSI);
-	if (!region)
-		return;
-
-	list_add_tail(&region->list, head);
-
-	iommu_dma_get_resv_regions(dev, head);
-}
-
-static struct iommu_ops arm_smmu_ops = {
-	.capable		= arm_smmu_capable,
-	.domain_alloc		= arm_smmu_domain_alloc,
-	.domain_free		= arm_smmu_domain_free,
-	.attach_dev		= arm_smmu_attach_dev,
-	.map			= arm_smmu_map,
-	.unmap			= arm_smmu_unmap,
-	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
-	.iotlb_sync		= arm_smmu_iotlb_sync,
-	.iova_to_phys		= arm_smmu_iova_to_phys,
-	.probe_device		= arm_smmu_probe_device,
-	.release_device		= arm_smmu_release_device,
-	.device_group		= arm_smmu_device_group,
-	.domain_get_attr	= arm_smmu_domain_get_attr,
-	.domain_set_attr	= arm_smmu_domain_set_attr,
-	.of_xlate		= arm_smmu_of_xlate,
-	.get_resv_regions	= arm_smmu_get_resv_regions,
-	.put_resv_regions	= generic_iommu_put_resv_regions,
-	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
-};
-
 /* Probing and initialisation functions */
 static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 				   struct arm_smmu_queue *q,
@@ -2406,7 +2032,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	switch (FIELD_GET(IDR0_STALL_MODEL, reg)) {
 	case IDR0_STALL_MODEL_FORCE:
 		smmu->features |= ARM_SMMU_FEAT_STALL_FORCE;
-		fallthrough;
 	case IDR0_STALL_MODEL_STALL:
 		smmu->features |= ARM_SMMU_FEAT_STALLS;
 	}
@@ -2426,7 +2051,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	switch (FIELD_GET(IDR0_TTF, reg)) {
 	case IDR0_TTF_AARCH32_64:
 		smmu->ias = 40;
-		fallthrough;
 	case IDR0_TTF_AARCH64:
 		break;
 	default:
@@ -2515,21 +2139,10 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	default:
 		dev_info(smmu->dev,
 			"unknown output address size. Truncating to 48-bit\n");
-		fallthrough;
 	case IDR5_OAS_48_BIT:
 		smmu->oas = 48;
 	}
 
-	if (arm_smmu_ops.pgsize_bitmap == -1UL)
-		arm_smmu_ops.pgsize_bitmap = smmu->pgsize_bitmap;
-	else
-		arm_smmu_ops.pgsize_bitmap |= smmu->pgsize_bitmap;
-
-	/* Set the DMA mask for our table walker */
-	if (dma_set_mask_and_coherent(smmu->dev, DMA_BIT_MASK(smmu->oas)))
-		dev_warn(smmu->dev,
-			 "failed to set DMA mask for table walker\n");
-
 	smmu->ias = max(smmu->ias, smmu->oas);
 
 	dev_info(smmu->dev, "ias %lu-bit, oas %lu-bit (features 0x%08x)\n",
@@ -2595,9 +2208,6 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
 
 	parse_driver_options(smmu);
 
-	if (of_dma_is_coherent(dev->of_node))
-		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
-
 	return ret;
 }
 
@@ -2609,55 +2219,6 @@ static unsigned long arm_smmu_resource_size(struct arm_smmu_device *smmu)
 		return SZ_128K;
 }
 
-static int arm_smmu_set_bus_ops(struct iommu_ops *ops)
-{
-	int err;
-
-#ifdef CONFIG_PCI
-	if (pci_bus_type.iommu_ops != ops) {
-		err = bus_set_iommu(&pci_bus_type, ops);
-		if (err)
-			return err;
-	}
-#endif
-#ifdef CONFIG_ARM_AMBA
-	if (amba_bustype.iommu_ops != ops) {
-		err = bus_set_iommu(&amba_bustype, ops);
-		if (err)
-			goto err_reset_pci_ops;
-	}
-#endif
-	if (platform_bus_type.iommu_ops != ops) {
-		err = bus_set_iommu(&platform_bus_type, ops);
-		if (err)
-			goto err_reset_amba_ops;
-	}
-
-	return 0;
-
-err_reset_amba_ops:
-#ifdef CONFIG_ARM_AMBA
-	bus_set_iommu(&amba_bustype, NULL);
-#endif
-err_reset_pci_ops: __maybe_unused;
-#ifdef CONFIG_PCI
-	bus_set_iommu(&pci_bus_type, NULL);
-#endif
-	return err;
-}
-
-static void __iomem *arm_smmu_ioremap(struct device *dev, resource_size_t start,
-				      resource_size_t size)
-{
-	struct resource res = {
-		.flags = IORESOURCE_MEM,
-		.start = start,
-		.end = start + size - 1,
-	};
-
-	return devm_ioremap_resource(dev, &res);
-}
-
 static int arm_smmu_device_probe(struct platform_device *pdev)
 {
 	int irq, ret;
@@ -2785,21 +2346,3 @@ static const struct of_device_id arm_smmu_of_match[] = {
 	{ .compatible = "arm,smmu-v3", },
 	{ },
 };
-MODULE_DEVICE_TABLE(of, arm_smmu_of_match);
-
-static struct platform_driver arm_smmu_driver = {
-	.driver	= {
-		.name			= "arm-smmu-v3",
-		.of_match_table		= arm_smmu_of_match,
-		.suppress_bind_attrs	= true,
-	},
-	.probe	= arm_smmu_device_probe,
-	.remove	= arm_smmu_device_remove,
-	.shutdown = arm_smmu_device_shutdown,
-};
-module_platform_driver(arm_smmu_driver);
-
-MODULE_DESCRIPTION("IOMMU API for ARM architected SMMUv3 implementations");
-MODULE_AUTHOR("Will Deacon <will@kernel.org>");
-MODULE_ALIAS("platform:arm-smmu-v3");
-MODULE_LICENSE("GPL v2");
-- 
2.17.1


