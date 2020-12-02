Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8662CB19E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 01:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42360.76140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkGAn-0003oF-Bi; Wed, 02 Dec 2020 00:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42360.76140; Wed, 02 Dec 2020 00:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkGAn-0003nq-8T; Wed, 02 Dec 2020 00:39:09 +0000
Received: by outflank-mailman (input) for mailman id 42360;
 Wed, 02 Dec 2020 00:39:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GudV=FG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kkGAl-0003nl-RJ
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 00:39:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f8d86e0-3b20-4353-b789-0e05f7beb5b8;
 Wed, 02 Dec 2020 00:39:06 +0000 (UTC)
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
X-Inumbo-ID: 6f8d86e0-3b20-4353-b789-0e05f7beb5b8
Date: Tue, 1 Dec 2020 16:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606869546;
	bh=3nSprtXt+pbb2ty+p/ANcgmcJOmruqh0rcNzj8s6KqE=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=ZywtJ5SwZfJlv2BSTup54nEvdgjFnbajxBfpA1jT7ckuJFg8Qu2migTiMqb9Q+/Zm
	 ebK68DvPNJXKBNFfYWvDb7GIWlI4otPe/0daV1zm76hHPgs6OJrLVWcfLBV8cRVpPt
	 s3wfYMET4QBdCkSXP7ecni06vRTw9sHPDa6xQHQw=
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 5/8] xen/arm: Remove support for PCI ATS on SMMUv3
In-Reply-To: <78079d1d6e9d2e7e87125da131e9bdb5809b838a.1606406359.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2012011637560.1100@sstabellini-ThinkPad-T480s>
References: <cover.1606406359.git.rahul.singh@arm.com> <78079d1d6e9d2e7e87125da131e9bdb5809b838a.1606406359.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Nov 2020, Rahul Singh wrote:
> PCI ATS functionality is not implemented and tested on ARM. Remove the
> PCI ATS support, once PCI ATS support is tested and available this
> patch can be added.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

This looks like a revert of 9ce27afc0830f. Can we add that as a note to
the commit message?

One very minor comment at the bottom


> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 273 --------------------------
>  1 file changed, 273 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 401f7ae006..6a33628087 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -460,16 +460,6 @@ struct arm_smmu_cmdq_ent {
>  			u64			addr;
>  		} tlbi;
>  
> -		#define CMDQ_OP_ATC_INV		0x40
> -		#define ATC_INV_SIZE_ALL	52
> -		struct {
> -			u32			sid;
> -			u32			ssid;
> -			u64			addr;
> -			u8			size;
> -			bool			global;
> -		} atc;
> -
>  		#define CMDQ_OP_PRI_RESP	0x41
>  		struct {
>  			u32			sid;
> @@ -632,7 +622,6 @@ struct arm_smmu_master {
>  	struct list_head		domain_head;
>  	u32				*sids;
>  	unsigned int			num_sids;
> -	bool				ats_enabled;
>  	unsigned int			ssid_bits;
>  };
>  
> @@ -650,7 +639,6 @@ struct arm_smmu_domain {
>  
>  	struct io_pgtable_ops		*pgtbl_ops;
>  	bool				non_strict;
> -	atomic_t			nr_ats_masters;
>  
>  	enum arm_smmu_domain_stage	stage;
>  	union {
> @@ -886,14 +874,6 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
>  	case CMDQ_OP_TLBI_S12_VMALL:
>  		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
>  		break;
> -	case CMDQ_OP_ATC_INV:
> -		cmd[0] |= FIELD_PREP(CMDQ_0_SSV, ent->substream_valid);
> -		cmd[0] |= FIELD_PREP(CMDQ_ATC_0_GLOBAL, ent->atc.global);
> -		cmd[0] |= FIELD_PREP(CMDQ_ATC_0_SSID, ent->atc.ssid);
> -		cmd[0] |= FIELD_PREP(CMDQ_ATC_0_SID, ent->atc.sid);
> -		cmd[1] |= FIELD_PREP(CMDQ_ATC_1_SIZE, ent->atc.size);
> -		cmd[1] |= ent->atc.addr & CMDQ_ATC_1_ADDR_MASK;
> -		break;
>  	case CMDQ_OP_PRI_RESP:
>  		cmd[0] |= FIELD_PREP(CMDQ_0_SSV, ent->substream_valid);
>  		cmd[0] |= FIELD_PREP(CMDQ_PRI_0_SSID, ent->pri.ssid);
> @@ -925,7 +905,6 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu)
>  		[CMDQ_ERR_CERROR_NONE_IDX]	= "No error",
>  		[CMDQ_ERR_CERROR_ILL_IDX]	= "Illegal command",
>  		[CMDQ_ERR_CERROR_ABT_IDX]	= "Abort on command fetch",
> -		[CMDQ_ERR_CERROR_ATC_INV_IDX]	= "ATC invalidate timeout",
>  	};
>  
>  	int i;
> @@ -945,14 +924,6 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu)
>  		dev_err(smmu->dev, "retrying command fetch\n");
>  	case CMDQ_ERR_CERROR_NONE_IDX:
>  		return;
> -	case CMDQ_ERR_CERROR_ATC_INV_IDX:
> -		/*
> -		 * ATC Invalidation Completion timeout. CONS is still pointing
> -		 * at the CMD_SYNC. Attempt to complete other pending commands
> -		 * by repeating the CMD_SYNC, though we might well end up back
> -		 * here since the ATC invalidation may still be pending.
> -		 */
> -		return;
>  	case CMDQ_ERR_CERROR_ILL_IDX:
>  	default:
>  		break;
> @@ -1422,9 +1393,6 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>  		val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
>  	}
>  
> -	if (master->ats_enabled)
> -		dst[1] |= cpu_to_le64(FIELD_PREP(STRTAB_STE_1_EATS,
> -						 STRTAB_STE_1_EATS_TRANS));
>  
>  	arm_smmu_sync_ste_for_sid(smmu, sid);
>  	/* See comment in arm_smmu_write_ctx_desc() */
> @@ -1633,112 +1601,6 @@ static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
>  	return IRQ_WAKE_THREAD;
>  }
>  
> -static void
> -arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
> -			struct arm_smmu_cmdq_ent *cmd)
> -{
> -	size_t log2_span;
> -	size_t span_mask;
> -	/* ATC invalidates are always on 4096-bytes pages */
> -	size_t inval_grain_shift = 12;
> -	unsigned long page_start, page_end;
> -
> -	*cmd = (struct arm_smmu_cmdq_ent) {
> -		.opcode			= CMDQ_OP_ATC_INV,
> -		.substream_valid	= !!ssid,
> -		.atc.ssid		= ssid,
> -	};
> -
> -	if (!size) {
> -		cmd->atc.size = ATC_INV_SIZE_ALL;
> -		return;
> -	}
> -
> -	page_start	= iova >> inval_grain_shift;
> -	page_end	= (iova + size - 1) >> inval_grain_shift;
> -
> -	/*
> -	 * In an ATS Invalidate Request, the address must be aligned on the
> -	 * range size, which must be a power of two number of page sizes. We
> -	 * thus have to choose between grossly over-invalidating the region, or
> -	 * splitting the invalidation into multiple commands. For simplicity
> -	 * we'll go with the first solution, but should refine it in the future
> -	 * if multiple commands are shown to be more efficient.
> -	 *
> -	 * Find the smallest power of two that covers the range. The most
> -	 * significant differing bit between the start and end addresses,
> -	 * fls(start ^ end), indicates the required span. For example:
> -	 *
> -	 * We want to invalidate pages [8; 11]. This is already the ideal range:
> -	 *		x = 0b1000 ^ 0b1011 = 0b11
> -	 *		span = 1 << fls(x) = 4
> -	 *
> -	 * To invalidate pages [7; 10], we need to invalidate [0; 15]:
> -	 *		x = 0b0111 ^ 0b1010 = 0b1101
> -	 *		span = 1 << fls(x) = 16
> -	 */
> -	log2_span	= fls_long(page_start ^ page_end);
> -	span_mask	= (1ULL << log2_span) - 1;
> -
> -	page_start	&= ~span_mask;
> -
> -	cmd->atc.addr	= page_start << inval_grain_shift;
> -	cmd->atc.size	= log2_span;
> -}
> -
> -static int arm_smmu_atc_inv_master(struct arm_smmu_master *master,
> -				   struct arm_smmu_cmdq_ent *cmd)
> -{
> -	int i;
> -
> -	if (!master->ats_enabled)
> -		return 0;
> -
> -	for (i = 0; i < master->num_sids; i++) {
> -		cmd->atc.sid = master->sids[i];
> -		arm_smmu_cmdq_issue_cmd(master->smmu, cmd);
> -	}
> -
> -	return arm_smmu_cmdq_issue_sync(master->smmu);
> -}
> -
> -static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
> -				   int ssid, unsigned long iova, size_t size)
> -{
> -	int ret = 0;
> -	unsigned long flags;
> -	struct arm_smmu_cmdq_ent cmd;
> -	struct arm_smmu_master *master;
> -
> -	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_ATS))
> -		return 0;
> -
> -	/*
> -	 * Ensure that we've completed prior invalidation of the main TLBs
> -	 * before we read 'nr_ats_masters' in case of a concurrent call to
> -	 * arm_smmu_enable_ats():
> -	 *
> -	 *	// unmap()			// arm_smmu_enable_ats()
> -	 *	TLBI+SYNC			atomic_inc(&nr_ats_masters);
> -	 *	smp_mb();			[...]
> -	 *	atomic_read(&nr_ats_masters);	pci_enable_ats() // writel()
> -	 *
> -	 * Ensures that we always see the incremented 'nr_ats_masters' count if
> -	 * ATS was enabled at the PCI device before completion of the TLBI.
> -	 */
> -	smp_mb();
> -	if (!atomic_read(&smmu_domain->nr_ats_masters))
> -		return 0;
> -
> -	arm_smmu_atc_inv_to_cmd(ssid, iova, size, &cmd);
> -
> -	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
> -	list_for_each_entry(master, &smmu_domain->devices, domain_head)
> -		ret |= arm_smmu_atc_inv_master(master, &cmd);
> -	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
> -
> -	return ret ? -ETIMEDOUT : 0;
> -}
>  
>  /* IO_PGTABLE API */
>  static void arm_smmu_tlb_inv_context(void *cookie)
> @@ -1765,7 +1627,6 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  	 */
>  	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>  	arm_smmu_cmdq_issue_sync(smmu);
> -	arm_smmu_atc_inv_domain(smmu_domain, 0, 0, 0);
>  }
>  
>  static void arm_smmu_tlb_inv_range_nosync(unsigned long iova, size_t size,
> @@ -2106,108 +1967,6 @@ static void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master)
>  	}
>  }
>  
> -static bool arm_smmu_ats_supported(struct arm_smmu_master *master)
> -{
> -	struct device *dev = master->dev;
> -	struct arm_smmu_device *smmu = master->smmu;
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> -
> -	if (!(smmu->features & ARM_SMMU_FEAT_ATS))
> -		return false;
> -
> -	if (!(fwspec->flags & IOMMU_FWSPEC_PCI_RC_ATS))
> -		return false;
> -
> -	return dev_is_pci(dev) && pci_ats_supported(to_pci_dev(dev));
> -}
> -
> -static void arm_smmu_enable_ats(struct arm_smmu_master *master)
> -{
> -	size_t stu;
> -	struct pci_dev *pdev;
> -	struct arm_smmu_device *smmu = master->smmu;
> -	struct arm_smmu_domain *smmu_domain = master->domain;
> -
> -	/* Don't enable ATS at the endpoint if it's not enabled in the STE */
> -	if (!master->ats_enabled)
> -		return;
> -
> -	/* Smallest Translation Unit: log2 of the smallest supported granule */
> -	stu = __ffs(smmu->pgsize_bitmap);
> -	pdev = to_pci_dev(master->dev);
> -
> -	atomic_inc(&smmu_domain->nr_ats_masters);
> -	arm_smmu_atc_inv_domain(smmu_domain, 0, 0, 0);
> -	if (pci_enable_ats(pdev, stu))
> -		dev_err(master->dev, "Failed to enable ATS (STU %zu)\n", stu);
> -}
> -
> -static void arm_smmu_disable_ats(struct arm_smmu_master *master)
> -{
> -	struct arm_smmu_cmdq_ent cmd;
> -	struct arm_smmu_domain *smmu_domain = master->domain;
> -
> -	if (!master->ats_enabled)
> -		return;
> -
> -	pci_disable_ats(to_pci_dev(master->dev));
> -	/*
> -	 * Ensure ATS is disabled at the endpoint before we issue the
> -	 * ATC invalidation via the SMMU.
> -	 */
> -	wmb();
> -	arm_smmu_atc_inv_to_cmd(0, 0, 0, &cmd);
> -	arm_smmu_atc_inv_master(master, &cmd);
> -    atomic_dec(&smmu_domain->nr_ats_masters);
> -}
> -
> -static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
> -{
> -	int ret;
> -	int features;
> -	int num_pasids;
> -	struct pci_dev *pdev;
> -
> -	if (!dev_is_pci(master->dev))
> -		return -ENODEV;
> -
> -	pdev = to_pci_dev(master->dev);
> -
> -	features = pci_pasid_features(pdev);
> -	if (features < 0)
> -		return features;
> -
> -	num_pasids = pci_max_pasids(pdev);
> -	if (num_pasids <= 0)
> -		return num_pasids;
> -
> -	ret = pci_enable_pasid(pdev, features);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to enable PASID\n");
> -		return ret;
> -	}
> -
> -	master->ssid_bits = min_t(u8, ilog2(num_pasids),
> -				  master->smmu->ssid_bits);
> -	return 0;
> -}
> -
> -static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
> -{
> -	struct pci_dev *pdev;
> -
> -	if (!dev_is_pci(master->dev))
> -		return;
> -
> -	pdev = to_pci_dev(master->dev);
> -
> -	if (!pdev->pasid_enabled)
> -		return;
> -
> -	master->ssid_bits = 0;
> -	pci_disable_pasid(pdev);
> -}
> -
>  static void arm_smmu_detach_dev(struct arm_smmu_master *master)
>  {
>  	unsigned long flags;
> @@ -2216,14 +1975,11 @@ static void arm_smmu_detach_dev(struct arm_smmu_master *master)
>  	if (!smmu_domain)
>  		return;
>  
> -	arm_smmu_disable_ats(master);
> -
>  	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
>  	list_del(&master->domain_head);
>  	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>  
>  	master->domain = NULL;
> -	master->ats_enabled = false;
>  	arm_smmu_install_ste_for_dev(master);
>  }
>  
> @@ -2271,17 +2027,12 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  
>  	master->domain = smmu_domain;
>  
> -	if (smmu_domain->stage != ARM_SMMU_DOMAIN_BYPASS)
> -		master->ats_enabled = arm_smmu_ats_supported(master);
> -
>  	arm_smmu_install_ste_for_dev(master);
>  
>  	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
>  	list_add(&master->domain_head, &smmu_domain->devices);
>  	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>  
> -	arm_smmu_enable_ats(master);
> -
>  out_unlock:
>  	mutex_unlock(&smmu_domain->init_mutex);
>  	return ret;
> @@ -2410,16 +2161,6 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>  
>  	master->ssid_bits = min(smmu->ssid_bits, fwspec->num_pasid_bits);
>  
> -	/*
> -	 * Note that PASID must be enabled before, and disabled after ATS:
> -	 * PCI Express Base 4.0r1.0 - 10.5.1.3 ATS Control Register
> -	 *
> -	 *   Behavior is undefined if this bit is Set and the value of the PASID
> -	 *   Enable, Execute Requested Enable, or Privileged Mode Requested bits
> -	 *   are changed.
> -	 */
> -	arm_smmu_enable_pasid(master);
> -
>  	if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB))
>  		master->ssid_bits = min_t(u8, master->ssid_bits,
>  					  CTXDESC_LINEAR_CDMAX);
> @@ -2442,7 +2183,6 @@ static void arm_smmu_release_device(struct device *dev)
>  
>  	master = dev_iommu_priv_get(dev);
>  	arm_smmu_detach_dev(master);
> -	arm_smmu_disable_pasid(master);
>  	kfree(master);
>  	iommu_fwspec_free(dev);
>  }
> @@ -2997,15 +2737,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool bypass)
>  		}
>  	}
>  
> -	if (smmu->features & ARM_SMMU_FEAT_ATS) {
> -		enables |= CR0_ATSCHK;
> -		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> -					      ARM_SMMU_CR0ACK);
> -		if (ret) {
> -			dev_err(smmu->dev, "failed to enable ATS check\n");
> -			return ret;
> -		}
> -	}
>  
>  	ret = arm_smmu_setup_irqs(smmu);
>  	if (ret) {
> @@ -3076,13 +2807,9 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	if (IS_ENABLED(CONFIG_PCI_PRI) && reg & IDR0_PRI)
>  		smmu->features |= ARM_SMMU_FEAT_PRI;
>  
> -	if (IS_ENABLED(CONFIG_PCI_ATS) && reg & IDR0_ATS)
> -		smmu->features |= ARM_SMMU_FEAT_ATS;
> -
>  	if (reg & IDR0_SEV)
>  		smmu->features |= ARM_SMMU_FEAT_SEV;
>  
> -
>  	if (reg & IDR0_HYP)

spurious change

