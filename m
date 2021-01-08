Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849F52EFBE0
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 00:52:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63928.113313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky1YD-0007Bc-R5; Fri, 08 Jan 2021 23:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63928.113313; Fri, 08 Jan 2021 23:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky1YD-0007BD-Nj; Fri, 08 Jan 2021 23:52:13 +0000
Received: by outflank-mailman (input) for mailman id 63928;
 Fri, 08 Jan 2021 23:52:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkaL=GL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ky1YC-0007B8-3R
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 23:52:12 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 100fecaf-1d1c-4b1a-85cc-39c5cacf8c6f;
 Fri, 08 Jan 2021 23:52:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64CB720578;
 Fri,  8 Jan 2021 23:52:10 +0000 (UTC)
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
X-Inumbo-ID: 100fecaf-1d1c-4b1a-85cc-39c5cacf8c6f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610149930;
	bh=t8HWHhRczAan4F/tBKhV0eyz/jNGEqjWshYHbTi2cHM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=D9tTvxKAb9q968CDpZwp8hyssVeWlUC1GQdvRyPDf/1kmf40B9sVh5nvYOUMlLTNT
	 05SHxzmhEA3MUsQ7YKKOt+4+pV3+Fcje+I39u2zY43Dh5ldfpdLZC9VQkyq81/ytRA
	 IMqvsUpbZ+B80a/S/i4NHpvJRJj/ai6mXgnt9egHuY4F4BF56tLkU3uawGo2z3NNLN
	 BGrfkMys70MWrerY7ydWhw5xe1UMBUOxU8BdXJrbvpeDMqMWLZsaMilbd6WYZWgTja
	 H1FgH/qeP6L1+z5cTtt6w2qLmPo+FVqeB1JGPeFrL+tjY5EuRQ0Io59vSJrn2aH2eO
	 K8YLIRJkc3bqA==
Date: Fri, 8 Jan 2021 15:52:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 04/11] xen/arm: smmuv3: Remove support for Stage-1
 translation on SMMUv3.
In-Reply-To: <94de5db736a438a38f87e8b4c04ef5b2985ca820.1610115608.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2101081552010.26153@sstabellini-ThinkPad-T480s>
References: <cover.1610115608.git.rahul.singh@arm.com> <94de5db736a438a38f87e8b4c04ef5b2985ca820.1610115608.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Jan 2021, Rahul Singh wrote:
> Linux SMMUv3 driver supports both Stage-1 and Stage-2 translations.
> As of now only Stage-2 translation support has been tested.
> 
> Once Stage-1 translation support is tested this patch can be added.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in V3: Rebase
> Changes in V4: Rebase
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 468 +-------------------------
>  1 file changed, 15 insertions(+), 453 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 7b29ead48c..869f38b753 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -449,19 +449,14 @@ struct arm_smmu_cmdq_ent {
>  
>  		#define CMDQ_OP_CFGI_STE	0x3
>  		#define CMDQ_OP_CFGI_ALL	0x4
> -		#define CMDQ_OP_CFGI_CD		0x5
> -		#define CMDQ_OP_CFGI_CD_ALL	0x6
>  		struct {
>  			u32			sid;
> -			u32			ssid;
>  			union {
>  				bool		leaf;
>  				u8		span;
>  			};
>  		} cfgi;
>  
> -		#define CMDQ_OP_TLBI_NH_ASID	0x11
> -		#define CMDQ_OP_TLBI_NH_VA	0x12
>  		#define CMDQ_OP_TLBI_EL2_ALL	0x20
>  		#define CMDQ_OP_TLBI_S12_VMALL	0x28
>  		#define CMDQ_OP_TLBI_S2_IPA	0x2a
> @@ -541,32 +536,6 @@ struct arm_smmu_strtab_l1_desc {
>  	dma_addr_t			l2ptr_dma;
>  };
>  
> -struct arm_smmu_ctx_desc {
> -	u16				asid;
> -	u64				ttbr;
> -	u64				tcr;
> -	u64				mair;
> -};
> -
> -struct arm_smmu_l1_ctx_desc {
> -	__le64				*l2ptr;
> -	dma_addr_t			l2ptr_dma;
> -};
> -
> -struct arm_smmu_ctx_desc_cfg {
> -	__le64				*cdtab;
> -	dma_addr_t			cdtab_dma;
> -	struct arm_smmu_l1_ctx_desc	*l1_desc;
> -	unsigned int			num_l1_ents;
> -};
> -
> -struct arm_smmu_s1_cfg {
> -	struct arm_smmu_ctx_desc_cfg	cdcfg;
> -	struct arm_smmu_ctx_desc	cd;
> -	u8				s1fmt;
> -	u8				s1cdmax;
> -};
> -
>  struct arm_smmu_s2_cfg {
>  	u16				vmid;
>  	u64				vttbr;
> @@ -623,15 +592,10 @@ struct arm_smmu_device {
>  	unsigned long			oas; /* PA */
>  	unsigned long			pgsize_bitmap;
>  
> -#define ARM_SMMU_MAX_ASIDS		(1 << 16)
> -	unsigned int			asid_bits;
> -	DECLARE_BITMAP(asid_map, ARM_SMMU_MAX_ASIDS);
> -
>  #define ARM_SMMU_MAX_VMIDS		(1 << 16)
>  	unsigned int			vmid_bits;
>  	DECLARE_BITMAP(vmid_map, ARM_SMMU_MAX_VMIDS);
>  
> -	unsigned int			ssid_bits;
>  	unsigned int			sid_bits;
>  
>  	struct arm_smmu_strtab_cfg	strtab_cfg;
> @@ -655,7 +619,6 @@ struct arm_smmu_master {
>  	u32				*sids;
>  	unsigned int			num_sids;
>  	bool				ats_enabled;
> -	unsigned int			ssid_bits;
>  };
>  
>  /* SMMU private data for an IOMMU domain */
> @@ -675,10 +638,7 @@ struct arm_smmu_domain {
>  	atomic_t			nr_ats_masters;
>  
>  	enum arm_smmu_domain_stage	stage;
> -	union {
> -		struct arm_smmu_s1_cfg	s1_cfg;
> -		struct arm_smmu_s2_cfg	s2_cfg;
> -	};
> +	struct arm_smmu_s2_cfg	s2_cfg;
>  
>  	struct iommu_domain		domain;
>  
> @@ -869,34 +829,19 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
>  		cmd[1] |= FIELD_PREP(CMDQ_PREFETCH_1_SIZE, ent->prefetch.size);
>  		cmd[1] |= ent->prefetch.addr & CMDQ_PREFETCH_1_ADDR_MASK;
>  		break;
> -	case CMDQ_OP_CFGI_CD:
> -		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SSID, ent->cfgi.ssid);
> -		/* Fallthrough */
>  	case CMDQ_OP_CFGI_STE:
>  		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
>  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_LEAF, ent->cfgi.leaf);
>  		break;
> -	case CMDQ_OP_CFGI_CD_ALL:
> -		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
> -		break;
>  	case CMDQ_OP_CFGI_ALL:
>  		/* Cover the entire SID range */
>  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
>  		break;
> -	case CMDQ_OP_TLBI_NH_VA:
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
> -		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
> -		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_VA_MASK;
> -		break;
>  	case CMDQ_OP_TLBI_S2_IPA:
>  		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
>  		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
>  		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_IPA_MASK;
>  		break;
> -	case CMDQ_OP_TLBI_NH_ASID:
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
> -		/* Fallthrough */
>  	case CMDQ_OP_TLBI_S12_VMALL:
>  		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
>  		break;
> @@ -1109,242 +1054,6 @@ static int arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>  	return ret;
>  }
>  
> -/* Context descriptor manipulation functions */
> -static void arm_smmu_sync_cd(struct arm_smmu_domain *smmu_domain,
> -			     int ssid, bool leaf)
> -{
> -	size_t i;
> -	unsigned long flags;
> -	struct arm_smmu_master *master;
> -	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -	struct arm_smmu_cmdq_ent cmd = {
> -		.opcode	= CMDQ_OP_CFGI_CD,
> -		.cfgi	= {
> -			.ssid	= ssid,
> -			.leaf	= leaf,
> -		},
> -	};
> -
> -	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
> -	list_for_each_entry(master, &smmu_domain->devices, domain_head) {
> -		for (i = 0; i < master->num_sids; i++) {
> -			cmd.cfgi.sid = master->sids[i];
> -			arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> -		}
> -	}
> -	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
> -
> -	arm_smmu_cmdq_issue_sync(smmu);
> -}
> -
> -static int arm_smmu_alloc_cd_leaf_table(struct arm_smmu_device *smmu,
> -					struct arm_smmu_l1_ctx_desc *l1_desc)
> -{
> -	size_t size = CTXDESC_L2_ENTRIES * (CTXDESC_CD_DWORDS << 3);
> -
> -	l1_desc->l2ptr = dmam_alloc_coherent(smmu->dev, size,
> -					     &l1_desc->l2ptr_dma, GFP_KERNEL);
> -	if (!l1_desc->l2ptr) {
> -		dev_warn(smmu->dev,
> -			 "failed to allocate context descriptor table\n");
> -		return -ENOMEM;
> -	}
> -	return 0;
> -}
> -
> -static void arm_smmu_write_cd_l1_desc(__le64 *dst,
> -				      struct arm_smmu_l1_ctx_desc *l1_desc)
> -{
> -	u64 val = (l1_desc->l2ptr_dma & CTXDESC_L1_DESC_L2PTR_MASK) |
> -		  CTXDESC_L1_DESC_V;
> -
> -	/* See comment in arm_smmu_write_ctx_desc() */
> -	WRITE_ONCE(*dst, cpu_to_le64(val));
> -}
> -
> -static __le64 *arm_smmu_get_cd_ptr(struct arm_smmu_domain *smmu_domain,
> -				   u32 ssid)
> -{
> -	__le64 *l1ptr;
> -	unsigned int idx;
> -	struct arm_smmu_l1_ctx_desc *l1_desc;
> -	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -	struct arm_smmu_ctx_desc_cfg *cdcfg = &smmu_domain->s1_cfg.cdcfg;
> -
> -	if (smmu_domain->s1_cfg.s1fmt == STRTAB_STE_0_S1FMT_LINEAR)
> -		return cdcfg->cdtab + ssid * CTXDESC_CD_DWORDS;
> -
> -	idx = ssid >> CTXDESC_SPLIT;
> -	l1_desc = &cdcfg->l1_desc[idx];
> -	if (!l1_desc->l2ptr) {
> -		if (arm_smmu_alloc_cd_leaf_table(smmu, l1_desc))
> -			return NULL;
> -
> -		l1ptr = cdcfg->cdtab + idx * CTXDESC_L1_DESC_DWORDS;
> -		arm_smmu_write_cd_l1_desc(l1ptr, l1_desc);
> -		/* An invalid L1CD can be cached */
> -		arm_smmu_sync_cd(smmu_domain, ssid, false);
> -	}
> -	idx = ssid & (CTXDESC_L2_ENTRIES - 1);
> -	return l1_desc->l2ptr + idx * CTXDESC_CD_DWORDS;
> -}
> -
> -static int arm_smmu_write_ctx_desc(struct arm_smmu_domain *smmu_domain,
> -				   int ssid, struct arm_smmu_ctx_desc *cd)
> -{
> -	/*
> -	 * This function handles the following cases:
> -	 *
> -	 * (1) Install primary CD, for normal DMA traffic (SSID = 0).
> -	 * (2) Install a secondary CD, for SID+SSID traffic.
> -	 * (3) Update ASID of a CD. Atomically write the first 64 bits of the
> -	 *     CD, then invalidate the old entry and mappings.
> -	 * (4) Remove a secondary CD.
> -	 */
> -	u64 val;
> -	bool cd_live;
> -	__le64 *cdptr;
> -	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -
> -	if (WARN_ON(ssid >= (1 << smmu_domain->s1_cfg.s1cdmax)))
> -		return -E2BIG;
> -
> -	cdptr = arm_smmu_get_cd_ptr(smmu_domain, ssid);
> -	if (!cdptr)
> -		return -ENOMEM;
> -
> -	val = le64_to_cpu(cdptr[0]);
> -	cd_live = !!(val & CTXDESC_CD_0_V);
> -
> -	if (!cd) { /* (4) */
> -		val = 0;
> -	} else if (cd_live) { /* (3) */
> -		val &= ~CTXDESC_CD_0_ASID;
> -		val |= FIELD_PREP(CTXDESC_CD_0_ASID, cd->asid);
> -		/*
> -		 * Until CD+TLB invalidation, both ASIDs may be used for tagging
> -		 * this substream's traffic
> -		 */
> -	} else { /* (1) and (2) */
> -		cdptr[1] = cpu_to_le64(cd->ttbr & CTXDESC_CD_1_TTB0_MASK);
> -		cdptr[2] = 0;
> -		cdptr[3] = cpu_to_le64(cd->mair);
> -
> -		/*
> -		 * STE is live, and the SMMU might read dwords of this CD in any
> -		 * order. Ensure that it observes valid values before reading
> -		 * V=1.
> -		 */
> -		arm_smmu_sync_cd(smmu_domain, ssid, true);
> -
> -		val = cd->tcr |
> -#ifdef __BIG_ENDIAN
> -			CTXDESC_CD_0_ENDI |
> -#endif
> -			CTXDESC_CD_0_R | CTXDESC_CD_0_A | CTXDESC_CD_0_ASET |
> -			CTXDESC_CD_0_AA64 |
> -			FIELD_PREP(CTXDESC_CD_0_ASID, cd->asid) |
> -			CTXDESC_CD_0_V;
> -
> -		/* STALL_MODEL==0b10 && CD.S==0 is ILLEGAL */
> -		if (smmu->features & ARM_SMMU_FEAT_STALL_FORCE)
> -			val |= CTXDESC_CD_0_S;
> -	}
> -
> -	/*
> -	 * The SMMU accesses 64-bit values atomically. See IHI0070Ca 3.21.3
> -	 * "Configuration structures and configuration invalidation completion"
> -	 *
> -	 *   The size of single-copy atomic reads made by the SMMU is
> -	 *   IMPLEMENTATION DEFINED but must be at least 64 bits. Any single
> -	 *   field within an aligned 64-bit span of a structure can be altered
> -	 *   without first making the structure invalid.
> -	 */
> -	WRITE_ONCE(cdptr[0], cpu_to_le64(val));
> -	arm_smmu_sync_cd(smmu_domain, ssid, true);
> -	return 0;
> -}
> -
> -static int arm_smmu_alloc_cd_tables(struct arm_smmu_domain *smmu_domain)
> -{
> -	int ret;
> -	size_t l1size;
> -	size_t max_contexts;
> -	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -	struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
> -	struct arm_smmu_ctx_desc_cfg *cdcfg = &cfg->cdcfg;
> -
> -	max_contexts = 1 << cfg->s1cdmax;
> -
> -	if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB) ||
> -	    max_contexts <= CTXDESC_L2_ENTRIES) {
> -		cfg->s1fmt = STRTAB_STE_0_S1FMT_LINEAR;
> -		cdcfg->num_l1_ents = max_contexts;
> -
> -		l1size = max_contexts * (CTXDESC_CD_DWORDS << 3);
> -	} else {
> -		cfg->s1fmt = STRTAB_STE_0_S1FMT_64K_L2;
> -		cdcfg->num_l1_ents = DIV_ROUND_UP(max_contexts,
> -						  CTXDESC_L2_ENTRIES);
> -
> -		cdcfg->l1_desc = devm_kcalloc(smmu->dev, cdcfg->num_l1_ents,
> -					      sizeof(*cdcfg->l1_desc),
> -					      GFP_KERNEL);
> -		if (!cdcfg->l1_desc)
> -			return -ENOMEM;
> -
> -		l1size = cdcfg->num_l1_ents * (CTXDESC_L1_DESC_DWORDS << 3);
> -	}
> -
> -	cdcfg->cdtab = dmam_alloc_coherent(smmu->dev, l1size, &cdcfg->cdtab_dma,
> -					   GFP_KERNEL);
> -	if (!cdcfg->cdtab) {
> -		dev_warn(smmu->dev, "failed to allocate context descriptor\n");
> -		ret = -ENOMEM;
> -		goto err_free_l1;
> -	}
> -
> -	return 0;
> -
> -err_free_l1:
> -	if (cdcfg->l1_desc) {
> -		devm_kfree(smmu->dev, cdcfg->l1_desc);
> -		cdcfg->l1_desc = NULL;
> -	}
> -	return ret;
> -}
> -
> -static void arm_smmu_free_cd_tables(struct arm_smmu_domain *smmu_domain)
> -{
> -	int i;
> -	size_t size, l1size;
> -	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -	struct arm_smmu_ctx_desc_cfg *cdcfg = &smmu_domain->s1_cfg.cdcfg;
> -
> -	if (cdcfg->l1_desc) {
> -		size = CTXDESC_L2_ENTRIES * (CTXDESC_CD_DWORDS << 3);
> -
> -		for (i = 0; i < cdcfg->num_l1_ents; i++) {
> -			if (!cdcfg->l1_desc[i].l2ptr)
> -				continue;
> -
> -			dmam_free_coherent(smmu->dev, size,
> -					   cdcfg->l1_desc[i].l2ptr,
> -					   cdcfg->l1_desc[i].l2ptr_dma);
> -		}
> -		devm_kfree(smmu->dev, cdcfg->l1_desc);
> -		cdcfg->l1_desc = NULL;
> -
> -		l1size = cdcfg->num_l1_ents * (CTXDESC_L1_DESC_DWORDS << 3);
> -	} else {
> -		l1size = cdcfg->num_l1_ents * (CTXDESC_CD_DWORDS << 3);
> -	}
> -
> -	dmam_free_coherent(smmu->dev, l1size, cdcfg->cdtab, cdcfg->cdtab_dma);
> -	cdcfg->cdtab_dma = 0;
> -	cdcfg->cdtab = NULL;
> -}
> -
>  /* Stream table manipulation functions */
>  static void
>  arm_smmu_write_strtab_l1_desc(__le64 *dst, struct arm_smmu_strtab_l1_desc *desc)
> @@ -1394,7 +1103,6 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>  	u64 val = le64_to_cpu(dst[0]);
>  	bool ste_live = false;
>  	struct arm_smmu_device *smmu = NULL;
> -	struct arm_smmu_s1_cfg *s1_cfg = NULL;
>  	struct arm_smmu_s2_cfg *s2_cfg = NULL;
>  	struct arm_smmu_domain *smmu_domain = NULL;
>  	struct arm_smmu_cmdq_ent prefetch_cmd = {
> @@ -1409,25 +1117,13 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>  		smmu = master->smmu;
>  	}
>  
> -	if (smmu_domain) {
> -		switch (smmu_domain->stage) {
> -		case ARM_SMMU_DOMAIN_S1:
> -			s1_cfg = &smmu_domain->s1_cfg;
> -			break;
> -		case ARM_SMMU_DOMAIN_S2:
> -		case ARM_SMMU_DOMAIN_NESTED:
> -			s2_cfg = &smmu_domain->s2_cfg;
> -			break;
> -		default:
> -			break;
> -		}
> -	}
> +	if (smmu_domain)
> +		s2_cfg = &smmu_domain->s2_cfg;
>  
>  	if (val & STRTAB_STE_0_V) {
>  		switch (FIELD_GET(STRTAB_STE_0_CFG, val)) {
>  		case STRTAB_STE_0_CFG_BYPASS:
>  			break;
> -		case STRTAB_STE_0_CFG_S1_TRANS:
>  		case STRTAB_STE_0_CFG_S2_TRANS:
>  			ste_live = true;
>  			break;
> @@ -1443,7 +1139,7 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>  	val = STRTAB_STE_0_V;
>  
>  	/* Bypass/fault */
> -	if (!smmu_domain || !(s1_cfg || s2_cfg)) {
> +	if (!smmu_domain || !(s2_cfg)) {
>  		if (!smmu_domain && disable_bypass)
>  			val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_ABORT);
>  		else
> @@ -1462,25 +1158,6 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>  		return;
>  	}
>  
> -	if (s1_cfg) {
> -		BUG_ON(ste_live);
> -		dst[1] = cpu_to_le64(
> -			 FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
> -			 FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> -			 FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> -			 FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
> -			 FIELD_PREP(STRTAB_STE_1_STRW, STRTAB_STE_1_STRW_NSEL1));
> -
> -		if (smmu->features & ARM_SMMU_FEAT_STALLS &&
> -		   !(smmu->features & ARM_SMMU_FEAT_STALL_FORCE))
> -			dst[1] |= cpu_to_le64(STRTAB_STE_1_S1STALLD);
> -
> -		val |= (s1_cfg->cdcfg.cdtab_dma & STRTAB_STE_0_S1CTXPTR_MASK) |
> -			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS) |
> -			FIELD_PREP(STRTAB_STE_0_S1CDMAX, s1_cfg->s1cdmax) |
> -			FIELD_PREP(STRTAB_STE_0_S1FMT, s1_cfg->s1fmt);
> -	}
> -
>  	if (s2_cfg) {
>  		BUG_ON(ste_live);
>  		dst[2] = cpu_to_le64(
> @@ -1502,7 +1179,6 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>  						 STRTAB_STE_1_EATS_TRANS));
>  
>  	arm_smmu_sync_ste_for_sid(smmu, sid);
> -	/* See comment in arm_smmu_write_ctx_desc() */
>  	WRITE_ONCE(dst[0], cpu_to_le64(val));
>  	arm_smmu_sync_ste_for_sid(smmu, sid);
>  
> @@ -1822,14 +1498,8 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	struct arm_smmu_cmdq_ent cmd;
>  
> -	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
> -		cmd.opcode	= CMDQ_OP_TLBI_NH_ASID;
> -		cmd.tlbi.asid	= smmu_domain->s1_cfg.cd.asid;
> -		cmd.tlbi.vmid	= 0;
> -	} else {
> -		cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
> -		cmd.tlbi.vmid	= smmu_domain->s2_cfg.vmid;
> -	}
> +	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
> +	cmd.tlbi.vmid	= smmu_domain->s2_cfg.vmid;
>  
>  	/*
>  	 * NOTE: when io-pgtable is in non-strict mode, we may get here with
> @@ -1857,13 +1527,8 @@ static void arm_smmu_tlb_inv_range_nosync(unsigned long iova, size_t size,
>  	if (!size)
>  		return;
>  
> -	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
> -		cmd.opcode	= CMDQ_OP_TLBI_NH_VA;
> -		cmd.tlbi.asid	= smmu_domain->s1_cfg.cd.asid;
> -	} else {
> -		cmd.opcode	= CMDQ_OP_TLBI_S2_IPA;
> -		cmd.tlbi.vmid	= smmu_domain->s2_cfg.vmid;
> -	}
> +	cmd.opcode	= CMDQ_OP_TLBI_S2_IPA;
> +	cmd.tlbi.vmid	= smmu_domain->s2_cfg.vmid;
>  
>  	do {
>  		arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> @@ -1971,75 +1636,17 @@ static void arm_smmu_domain_free(struct iommu_domain *domain)
>  {
>  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
>  
>  	iommu_put_dma_cookie(domain);
>  	free_io_pgtable_ops(smmu_domain->pgtbl_ops);
>  
> -	/* Free the CD and ASID, if we allocated them */
> -	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
> -		struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
> -
> -		if (cfg->cdcfg.cdtab) {
> -			arm_smmu_free_cd_tables(smmu_domain);
> -			arm_smmu_bitmap_free(smmu->asid_map, cfg->cd.asid);
> -		}
> -	} else {
> -		struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
> -		if (cfg->vmid)
> -			arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
> -	}
> +	if (cfg->vmid)
> +		arm_smmu_bitmap_free(smmu->vmid_map, cfg->vmid);
>  
>  	kfree(smmu_domain);
>  }
>  
> -static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
> -				       struct arm_smmu_master *master,
> -				       struct io_pgtable_cfg *pgtbl_cfg)
> -{
> -	int ret;
> -	int asid;
> -	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -	struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
> -	typeof(&pgtbl_cfg->arm_lpae_s1_cfg.tcr) tcr = &pgtbl_cfg->arm_lpae_s1_cfg.tcr;
> -
> -	asid = arm_smmu_bitmap_alloc(smmu->asid_map, smmu->asid_bits);
> -	if (asid < 0)
> -		return asid;
> -
> -	cfg->s1cdmax = master->ssid_bits;
> -
> -	ret = arm_smmu_alloc_cd_tables(smmu_domain);
> -	if (ret)
> -		goto out_free_asid;
> -
> -	cfg->cd.asid	= (u16)asid;
> -	cfg->cd.ttbr	= pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> -	cfg->cd.tcr	= FIELD_PREP(CTXDESC_CD_0_TCR_T0SZ, tcr->tsz) |
> -			  FIELD_PREP(CTXDESC_CD_0_TCR_TG0, tcr->tg) |
> -			  FIELD_PREP(CTXDESC_CD_0_TCR_IRGN0, tcr->irgn) |
> -			  FIELD_PREP(CTXDESC_CD_0_TCR_ORGN0, tcr->orgn) |
> -			  FIELD_PREP(CTXDESC_CD_0_TCR_SH0, tcr->sh) |
> -			  FIELD_PREP(CTXDESC_CD_0_TCR_IPS, tcr->ips) |
> -			  CTXDESC_CD_0_TCR_EPD1 | CTXDESC_CD_0_AA64;
> -	cfg->cd.mair	= pgtbl_cfg->arm_lpae_s1_cfg.mair;
> -
> -	/*
> -	 * Note that this will end up calling arm_smmu_sync_cd() before
> -	 * the master has been added to the devices list for this domain.
> -	 * This isn't an issue because the STE hasn't been installed yet.
> -	 */
> -	ret = arm_smmu_write_ctx_desc(smmu_domain, 0, &cfg->cd);
> -	if (ret)
> -		goto out_free_cd_tables;
> -
> -	return 0;
> -
> -out_free_cd_tables:
> -	arm_smmu_free_cd_tables(smmu_domain);
> -out_free_asid:
> -	arm_smmu_bitmap_free(smmu->asid_map, asid);
> -	return ret;
> -}
>  
>  static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
>  				       struct arm_smmu_master *master,
> @@ -2075,9 +1682,6 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
>  	enum io_pgtable_fmt fmt;
>  	struct io_pgtable_cfg pgtbl_cfg;
>  	struct io_pgtable_ops *pgtbl_ops;
> -	int (*finalise_stage_fn)(struct arm_smmu_domain *,
> -				 struct arm_smmu_master *,
> -				 struct io_pgtable_cfg *);
>  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  
> @@ -2087,29 +1691,8 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
>  	}
>  
>  	/* Restrict the stage to what we can actually support */
> -	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1))
> -		smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
> -	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
> -		smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
> -
> -	switch (smmu_domain->stage) {
> -	case ARM_SMMU_DOMAIN_S1:
> -		ias = (smmu->features & ARM_SMMU_FEAT_VAX) ? 52 : 48;
> -		ias = min_t(unsigned long, ias, VA_BITS);
> -		oas = smmu->ias;
> -		fmt = ARM_64_LPAE_S1;
> -		finalise_stage_fn = arm_smmu_domain_finalise_s1;
> -		break;
> -	case ARM_SMMU_DOMAIN_NESTED:
> -	case ARM_SMMU_DOMAIN_S2:
> -		ias = smmu->ias;
> -		oas = smmu->oas;
> -		fmt = ARM_64_LPAE_S2;
> -		finalise_stage_fn = arm_smmu_domain_finalise_s2;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> +	smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
> +
>  
>  	pgtbl_cfg = (struct io_pgtable_cfg) {
>  		.pgsize_bitmap	= smmu->pgsize_bitmap,
> @@ -2131,7 +1714,7 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
>  	domain->geometry.aperture_end = (1UL << pgtbl_cfg.ias) - 1;
>  	domain->geometry.force_aperture = true;
>  
> -	ret = finalise_stage_fn(smmu_domain, master, &pgtbl_cfg);
> +	ret = arm_smmu_domain_finalise_s2(smmu_domain, master, &pgtbl_cfg);
>  	if (ret < 0) {
>  		free_io_pgtable_ops(pgtbl_ops);
>  		return ret;
> @@ -2264,8 +1847,6 @@ static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
>  		return ret;
>  	}
>  
> -	master->ssid_bits = min_t(u8, ilog2(num_pasids),
> -				  master->smmu->ssid_bits);
>  	return 0;
>  }
>  
> @@ -2281,7 +1862,6 @@ static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
>  	if (!pdev->pasid_enabled)
>  		return;
>  
> -	master->ssid_bits = 0;
>  	pci_disable_pasid(pdev);
>  }
>  
> @@ -2337,13 +1917,6 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  			dev_name(smmu->dev));
>  		ret = -ENXIO;
>  		goto out_unlock;
> -	} else if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1 &&
> -		   master->ssid_bits != smmu_domain->s1_cfg.s1cdmax) {
> -		dev_err(dev,
> -			"cannot attach to incompatible domain (%u SSID bits != %u)\n",
> -			smmu_domain->s1_cfg.s1cdmax, master->ssid_bits);
> -		ret = -EINVAL;
> -		goto out_unlock;
>  	}
>  
>  	master->domain = smmu_domain;
> @@ -2490,8 +2063,6 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>  		}
>  	}
>  
> -	master->ssid_bits = min(smmu->ssid_bits, fwspec->num_pasid_bits);
> -
>  	/*
>  	 * Note that PASID must be enabled before, and disabled after ATS:
>  	 * PCI Express Base 4.0r1.0 - 10.5.1.3 ATS Control Register
> @@ -2502,10 +2073,6 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>  	 */
>  	arm_smmu_enable_pasid(master);
>  
> -	if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB))
> -		master->ssid_bits = min_t(u8, master->ssid_bits,
> -					  CTXDESC_LINEAR_CDMAX);
> -
>  	return &smmu->iommu;
>  
>  err_free_master:
> @@ -3259,13 +2826,10 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  		smmu->features |= ARM_SMMU_FEAT_STALLS;
>  	}
>  
> -	if (reg & IDR0_S1P)
> -		smmu->features |= ARM_SMMU_FEAT_TRANS_S1;
> -
>  	if (reg & IDR0_S2P)
>  		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
>  
> -	if (!(reg & (IDR0_S1P | IDR0_S2P))) {
> +	if (!(reg & IDR0_S2P)) {
>  		dev_err(smmu->dev, "no translation support!\n");
>  		return -ENXIO;
>  	}
> @@ -3283,7 +2847,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	}
>  
>  	/* ASID/VMID sizes */
> -	smmu->asid_bits = reg & IDR0_ASID16 ? 16 : 8;
>  	smmu->vmid_bits = reg & IDR0_VMID16 ? 16 : 8;
>  
>  	/* IDR1 */
> @@ -3308,7 +2871,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  					     FIELD_GET(IDR1_PRIQS, reg));
>  
>  	/* SID/SSID sizes */
> -	smmu->ssid_bits = FIELD_GET(IDR1_SSIDSIZE, reg);
>  	smmu->sid_bits = FIELD_GET(IDR1_SIDSIZE, reg);
>  
>  	/*
> -- 
> 2.17.1
> 

