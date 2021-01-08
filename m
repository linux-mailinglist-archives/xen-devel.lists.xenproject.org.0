Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A9E2EFBC7
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 00:43:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63914.113285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky1PX-0005yG-FZ; Fri, 08 Jan 2021 23:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63914.113285; Fri, 08 Jan 2021 23:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky1PX-0005xq-BJ; Fri, 08 Jan 2021 23:43:15 +0000
Received: by outflank-mailman (input) for mailman id 63914;
 Fri, 08 Jan 2021 23:43:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkaL=GL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ky1PV-0005xi-FL
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 23:43:13 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee761678-f80e-4a03-b028-d48ba966b6e1;
 Fri, 08 Jan 2021 23:43:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7F0220786;
 Fri,  8 Jan 2021 23:43:08 +0000 (UTC)
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
X-Inumbo-ID: ee761678-f80e-4a03-b028-d48ba966b6e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610149389;
	bh=unSABLqtLJ38+Xv+P2DrNwyfSovmI4gy5PrW+Vz/7Eg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=n+4Q5LT7sGJlQhLuwEWntfC2GNYBDzU5t4Sb/lNs2G1rasq1jlKmqmeAxRZu2FBgN
	 tYwO+6SxjEXadGdIKXvh3YFd8QGmJJGkiVn+4f0/5OjwQbqmfl/M/1s3MQoVs7J93/
	 YdDawMnL+DVN4B2n5oevyKR0Jy3keSO990z9P7wfvb0BZxN/DbFYP0W/XZWHlSfFd7
	 GK5/tgBtydoCeun0bFmU6ds18nFZ5Ra/KDNv+P69DEgyKxo2ZDcKVJgUIf3Yp48rp2
	 stEnhP9XwbPdgEJl51QtuwxwdQFvpcmPqZINoORqwx/JT7NLTP4X7QcHdijIIcVEJ1
	 FU4JjFvFG4Gaw==
Date: Fri, 8 Jan 2021 15:43:08 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 02/11] xen/arm: Revert atomic operation related
 command-queue insertion patch
In-Reply-To: <562b3a44f5b3bb6d685d63854748218228c5f09e.1610115608.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2101081542530.26153@sstabellini-ThinkPad-T480s>
References: <cover.1610115608.git.rahul.singh@arm.com> <562b3a44f5b3bb6d685d63854748218228c5f09e.1610115608.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Jan 2021, Rahul Singh wrote:
> Linux SMMUv3 code implements the commands-queue insertion based on
> atomic operations implemented in Linux. Atomic functions used by the
> commands-queue insertion are not implemented in XEN therefore revert the
> patch that implemented the commands-queue insertion based on atomic
> operations.
> 
> Reverted the other patches also that are implemented based on the code
> that introduced the atomic-operations.
> 
> Atomic operations are introduced in the patch "iommu/arm-smmu-v3: Reduce
> contention during command-queue insertion" that fixed the bottleneck of
> the SMMU command queue insertion operation. A new algorithm for
> inserting commands into the queue is introduced in this patch, which is
> lock-free on the fast-path.
> 
> Consequence of reverting the patch is that the command queue insertion
> will be slow for large systems as spinlock will be used to serializes
> accesses from all CPUs to the single queue supported by the hardware.
> 
> Once the proper atomic operations will be available in XEN the driver
> can be updated.
> 
> Following commits are reverted in this patch:
> 1. "iommu/arm-smmu-v3: Add SMMUv3.2 range invalidation support"
>     commit 6a481a95d4c198a2dd0a61f8877b92a375757db8.
> 2. "iommu/arm-smmu-v3: Batch ATC invalidation commands"
>     commit 9e773aee8c3e1b3ba019c5c7f8435aaa836c6130.
> 3. "iommu/arm-smmu-v3: Batch context descriptor invalidation"
>     commit edd0351e7bc49555d8b5ad8438a65a7ca262c9f0.
> 4. "iommu/arm-smmu-v3: Add command queue batching helpers
>     commit 4ce8da453640147101bda418640394637c1a7cfc.
> 5. "iommu/arm-smmu-v3: Fix ATC invalidation ordering wrt main TLBs"
>     commit 353e3cf8590cf182a9f42e67993de3aca91e8090.
> 6. "iommu/arm-smmu-v3: Defer TLB invalidation until ->iotlb_sync()"
>     commit 2af2e72b18b499fa36d3f7379fd010ff25d2a984.
> 7. "iommu/arm-smmu-v3: Reduce contention during command-queue insertion"
>     commit 587e6c10a7ce89a5924fdbeff2ec524fbd6a124b.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in V3:
> - Added consequences of reverting this patch in commit message.
> - List all the commits that are reverted in this patch in commit
>   message.
> Changes in V4: Rebase
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 878 ++++++--------------------
>  1 file changed, 186 insertions(+), 692 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index f578677a5c..8b7747ed38 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -69,9 +69,6 @@
>  #define IDR1_SSIDSIZE			GENMASK(10, 6)
>  #define IDR1_SIDSIZE			GENMASK(5, 0)
>  
> -#define ARM_SMMU_IDR3			0xc
> -#define IDR3_RIL			(1 << 10)
> -
>  #define ARM_SMMU_IDR5			0x14
>  #define IDR5_STALL_MAX			GENMASK(31, 16)
>  #define IDR5_GRAN64K			(1 << 6)
> @@ -187,7 +184,7 @@
>  
>  #define Q_IDX(llq, p)			((p) & ((1 << (llq)->max_n_shift) - 1))
>  #define Q_WRP(llq, p)			((p) & (1 << (llq)->max_n_shift))
> -#define Q_OVERFLOW_FLAG			(1U << 31)
> +#define Q_OVERFLOW_FLAG			(1 << 31)
>  #define Q_OVF(p)			((p) & Q_OVERFLOW_FLAG)
>  #define Q_ENT(q, p)			((q)->base +			\
>  					 Q_IDX(&((q)->llq), p) *	\
> @@ -330,15 +327,6 @@
>  #define CMDQ_ERR_CERROR_ABT_IDX		2
>  #define CMDQ_ERR_CERROR_ATC_INV_IDX	3
>  
> -#define CMDQ_PROD_OWNED_FLAG		Q_OVERFLOW_FLAG
> -
> -/*
> - * This is used to size the command queue and therefore must be at least
> - * BITS_PER_LONG so that the valid_map works correctly (it relies on the
> - * total number of queue entries being a multiple of BITS_PER_LONG).
> - */
> -#define CMDQ_BATCH_ENTRIES		BITS_PER_LONG
> -
>  #define CMDQ_0_OP			GENMASK_ULL(7, 0)
>  #define CMDQ_0_SSV			(1UL << 11)
>  
> @@ -351,14 +339,9 @@
>  #define CMDQ_CFGI_1_LEAF		(1UL << 0)
>  #define CMDQ_CFGI_1_RANGE		GENMASK_ULL(4, 0)
>  
> -#define CMDQ_TLBI_0_NUM			GENMASK_ULL(16, 12)
> -#define CMDQ_TLBI_RANGE_NUM_MAX		31
> -#define CMDQ_TLBI_0_SCALE		GENMASK_ULL(24, 20)
>  #define CMDQ_TLBI_0_VMID		GENMASK_ULL(47, 32)
>  #define CMDQ_TLBI_0_ASID		GENMASK_ULL(63, 48)
>  #define CMDQ_TLBI_1_LEAF		(1UL << 0)
> -#define CMDQ_TLBI_1_TTL			GENMASK_ULL(9, 8)
> -#define CMDQ_TLBI_1_TG			GENMASK_ULL(11, 10)
>  #define CMDQ_TLBI_1_VA_MASK		GENMASK_ULL(63, 12)
>  #define CMDQ_TLBI_1_IPA_MASK		GENMASK_ULL(51, 12)
>  
> @@ -407,8 +390,9 @@
>  #define PRIQ_1_ADDR_MASK		GENMASK_ULL(63, 12)
>  
>  /* High-level queue structures */
> -#define ARM_SMMU_POLL_TIMEOUT_US	1000000 /* 1s! */
> -#define ARM_SMMU_POLL_SPIN_COUNT	10
> +#define ARM_SMMU_POLL_TIMEOUT_US	100
> +#define ARM_SMMU_CMDQ_SYNC_TIMEOUT_US	1000000 /* 1s! */
> +#define ARM_SMMU_CMDQ_SYNC_SPIN_COUNT	10
>  
>  #define MSI_IOVA_BASE			0x8000000
>  #define MSI_IOVA_LENGTH			0x100000
> @@ -483,13 +467,9 @@ struct arm_smmu_cmdq_ent {
>  		#define CMDQ_OP_TLBI_S2_IPA	0x2a
>  		#define CMDQ_OP_TLBI_NSNH_ALL	0x30
>  		struct {
> -			u8			num;
> -			u8			scale;
>  			u16			asid;
>  			u16			vmid;
>  			bool			leaf;
> -			u8			ttl;
> -			u8			tg;
>  			u64			addr;
>  		} tlbi;
>  
> @@ -513,24 +493,15 @@ struct arm_smmu_cmdq_ent {
>  
>  		#define CMDQ_OP_CMD_SYNC	0x46
>  		struct {
> +			u32			msidata;
>  			u64			msiaddr;
>  		} sync;
>  	};
>  };
>  
>  struct arm_smmu_ll_queue {
> -	union {
> -		u64			val;
> -		struct {
> -			u32		prod;
> -			u32		cons;
> -		};
> -		struct {
> -			atomic_t	prod;
> -			atomic_t	cons;
> -		} atomic;
> -		u8			__pad[SMP_CACHE_BYTES];
> -	} ____cacheline_aligned_in_smp;
> +	u32				prod;
> +	u32				cons;
>  	u32				max_n_shift;
>  };
>  
> @@ -548,23 +519,9 @@ struct arm_smmu_queue {
>  	u32 __iomem			*cons_reg;
>  };
>  
> -struct arm_smmu_queue_poll {
> -	ktime_t				timeout;
> -	unsigned int			delay;
> -	unsigned int			spin_cnt;
> -	bool				wfe;
> -};
> -
>  struct arm_smmu_cmdq {
>  	struct arm_smmu_queue		q;
> -	atomic_long_t			*valid_map;
> -	atomic_t			owner_prod;
> -	atomic_t			lock;
> -};
> -
> -struct arm_smmu_cmdq_batch {
> -	u64				cmds[CMDQ_BATCH_ENTRIES * CMDQ_ENT_DWORDS];
> -	int				num;
> +	spinlock_t			lock;
>  };
>  
>  struct arm_smmu_evtq {
> @@ -647,7 +604,6 @@ struct arm_smmu_device {
>  #define ARM_SMMU_FEAT_HYP		(1 << 12)
>  #define ARM_SMMU_FEAT_STALL_FORCE	(1 << 13)
>  #define ARM_SMMU_FEAT_VAX		(1 << 14)
> -#define ARM_SMMU_FEAT_RANGE_INV		(1 << 15)
>  	u32				features;
>  
>  #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
> @@ -660,6 +616,8 @@ struct arm_smmu_device {
>  
>  	int				gerr_irq;
>  	int				combined_irq;
> +	u32				sync_nr;
> +	u8				prev_cmd_opcode;
>  
>  	unsigned long			ias; /* IPA */
>  	unsigned long			oas; /* PA */
> @@ -677,6 +635,12 @@ struct arm_smmu_device {
>  
>  	struct arm_smmu_strtab_cfg	strtab_cfg;
>  
> +	/* Hi16xx adds an extra 32 bits of goodness to its MSI payload */
> +	union {
> +		u32			sync_count;
> +		u64			padding;
> +	};
> +
>  	/* IOMMU core code handle */
>  	struct iommu_device		iommu;
>  };
> @@ -763,21 +727,6 @@ static void parse_driver_options(struct arm_smmu_device *smmu)
>  }
>  
>  /* Low-level queue manipulation functions */
> -static bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
> -{
> -	u32 space, prod, cons;
> -
> -	prod = Q_IDX(q, q->prod);
> -	cons = Q_IDX(q, q->cons);
> -
> -	if (Q_WRP(q, q->prod) == Q_WRP(q, q->cons))
> -		space = (1 << q->max_n_shift) - (prod - cons);
> -	else
> -		space = cons - prod;
> -
> -	return space >= n;
> -}
> -
>  static bool queue_full(struct arm_smmu_ll_queue *q)
>  {
>  	return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
> @@ -790,12 +739,9 @@ static bool queue_empty(struct arm_smmu_ll_queue *q)
>  	       Q_WRP(q, q->prod) == Q_WRP(q, q->cons);
>  }
>  
> -static bool queue_consumed(struct arm_smmu_ll_queue *q, u32 prod)
> +static void queue_sync_cons_in(struct arm_smmu_queue *q)
>  {
> -	return ((Q_WRP(q, q->cons) == Q_WRP(q, prod)) &&
> -		(Q_IDX(q, q->cons) > Q_IDX(q, prod))) ||
> -	       ((Q_WRP(q, q->cons) != Q_WRP(q, prod)) &&
> -		(Q_IDX(q, q->cons) <= Q_IDX(q, prod)));
> +	q->llq.cons = readl_relaxed(q->cons_reg);
>  }
>  
>  static void queue_sync_cons_out(struct arm_smmu_queue *q)
> @@ -826,34 +772,46 @@ static int queue_sync_prod_in(struct arm_smmu_queue *q)
>  	return ret;
>  }
>  
> -static u32 queue_inc_prod_n(struct arm_smmu_ll_queue *q, int n)
> +static void queue_sync_prod_out(struct arm_smmu_queue *q)
>  {
> -	u32 prod = (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + n;
> -	return Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
> +	writel(q->llq.prod, q->prod_reg);
>  }
>  
> -static void queue_poll_init(struct arm_smmu_device *smmu,
> -			    struct arm_smmu_queue_poll *qp)
> +static void queue_inc_prod(struct arm_smmu_ll_queue *q)
>  {
> -	qp->delay = 1;
> -	qp->spin_cnt = 0;
> -	qp->wfe = !!(smmu->features & ARM_SMMU_FEAT_SEV);
> -	qp->timeout = ktime_add_us(ktime_get(), ARM_SMMU_POLL_TIMEOUT_US);
> +	u32 prod = (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + 1;
> +	q->prod = Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
>  }
>  
> -static int queue_poll(struct arm_smmu_queue_poll *qp)
> +/*
> + * Wait for the SMMU to consume items. If sync is true, wait until the queue
> + * is empty. Otherwise, wait until there is at least one free slot.
> + */
> +static int queue_poll_cons(struct arm_smmu_queue *q, bool sync, bool wfe)
>  {
> -	if (ktime_compare(ktime_get(), qp->timeout) > 0)
> -		return -ETIMEDOUT;
> +	ktime_t timeout;
> +	unsigned int delay = 1, spin_cnt = 0;
>  
> -	if (qp->wfe) {
> -		wfe();
> -	} else if (++qp->spin_cnt < ARM_SMMU_POLL_SPIN_COUNT) {
> -		cpu_relax();
> -	} else {
> -		udelay(qp->delay);
> -		qp->delay *= 2;
> -		qp->spin_cnt = 0;
> +	/* Wait longer if it's a CMD_SYNC */
> +	timeout = ktime_add_us(ktime_get(), sync ?
> +					    ARM_SMMU_CMDQ_SYNC_TIMEOUT_US :
> +					    ARM_SMMU_POLL_TIMEOUT_US);
> +
> +	while (queue_sync_cons_in(q),
> +	      (sync ? !queue_empty(&q->llq) : queue_full(&q->llq))) {
> +		if (ktime_compare(ktime_get(), timeout) > 0)
> +			return -ETIMEDOUT;
> +
> +		if (wfe) {
> +			wfe();
> +		} else if (++spin_cnt < ARM_SMMU_CMDQ_SYNC_SPIN_COUNT) {
> +			cpu_relax();
> +			continue;
> +		} else {
> +			udelay(delay);
> +			delay *= 2;
> +			spin_cnt = 0;
> +		}
>  	}
>  
>  	return 0;
> @@ -867,6 +825,17 @@ static void queue_write(__le64 *dst, u64 *src, size_t n_dwords)
>  		*dst++ = cpu_to_le64(*src++);
>  }
>  
> +static int queue_insert_raw(struct arm_smmu_queue *q, u64 *ent)
> +{
> +	if (queue_full(&q->llq))
> +		return -ENOSPC;
> +
> +	queue_write(Q_ENT(q, q->llq.prod), ent, q->ent_dwords);
> +	queue_inc_prod(&q->llq);
> +	queue_sync_prod_out(q);
> +	return 0;
> +}
> +
>  static void queue_read(__le64 *dst, u64 *src, size_t n_dwords)
>  {
>  	int i;
> @@ -916,22 +885,14 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
>  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);
>  		break;
>  	case CMDQ_OP_TLBI_NH_VA:
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_NUM, ent->tlbi.num);
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_SCALE, ent->tlbi.scale);
>  		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
>  		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_ASID, ent->tlbi.asid);
>  		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
> -		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TTL, ent->tlbi.ttl);
> -		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TG, ent->tlbi.tg);
>  		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_VA_MASK;
>  		break;
>  	case CMDQ_OP_TLBI_S2_IPA:
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_NUM, ent->tlbi.num);
> -		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_SCALE, ent->tlbi.scale);
>  		cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, ent->tlbi.vmid);
>  		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_LEAF, ent->tlbi.leaf);
> -		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TTL, ent->tlbi.ttl);
> -		cmd[1] |= FIELD_PREP(CMDQ_TLBI_1_TG, ent->tlbi.tg);
>  		cmd[1] |= ent->tlbi.addr & CMDQ_TLBI_1_IPA_MASK;
>  		break;
>  	case CMDQ_OP_TLBI_NH_ASID:
> @@ -964,14 +925,20 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
>  		cmd[1] |= FIELD_PREP(CMDQ_PRI_1_RESP, ent->pri.resp);
>  		break;
>  	case CMDQ_OP_CMD_SYNC:
> -		if (ent->sync.msiaddr) {
> +		if (ent->sync.msiaddr)
>  			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_IRQ);
> -			cmd[1] |= ent->sync.msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
> -		} else {
> +		else
>  			cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_CS, CMDQ_SYNC_0_CS_SEV);
> -		}
>  		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSH, ARM_SMMU_SH_ISH);
>  		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
> +		/*
> +		 * Commands are written little-endian, but we want the SMMU to
> +		 * receive MSIData, and thus write it back to memory, in CPU
> +		 * byte order, so big-endian needs an extra byteswap here.
> +		 */
> +		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIDATA,
> +				     cpu_to_le32(ent->sync.msidata));
> +		cmd[1] |= ent->sync.msiaddr & CMDQ_SYNC_1_MSIADDR_MASK;
>  		break;
>  	default:
>  		return -ENOENT;
> @@ -980,27 +947,6 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
>  	return 0;
>  }
>  
> -static void arm_smmu_cmdq_build_sync_cmd(u64 *cmd, struct arm_smmu_device *smmu,
> -					 u32 prod)
> -{
> -	struct arm_smmu_queue *q = &smmu->cmdq.q;
> -	struct arm_smmu_cmdq_ent ent = {
> -		.opcode = CMDQ_OP_CMD_SYNC,
> -	};
> -
> -	/*
> -	 * Beware that Hi16xx adds an extra 32 bits of goodness to its MSI
> -	 * payload, so the write will zero the entire command on that platform.
> -	 */
> -	if (smmu->features & ARM_SMMU_FEAT_MSI &&
> -	    smmu->features & ARM_SMMU_FEAT_COHERENCY) {
> -		ent.sync.msiaddr = q->base_dma + Q_IDX(&q->llq, prod) *
> -				   q->ent_dwords * 8;
> -	}
> -
> -	arm_smmu_cmdq_build_cmd(cmd, &ent);
> -}
> -
>  static void arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu)
>  {
>  	static const char *cerror_str[] = {
> @@ -1059,474 +1005,109 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu)
>  	queue_write(Q_ENT(q, cons), cmd, q->ent_dwords);
>  }
>  
> -/*
> - * Command queue locking.
> - * This is a form of bastardised rwlock with the following major changes:
> - *
> - * - The only LOCK routines are exclusive_trylock() and shared_lock().
> - *   Neither have barrier semantics, and instead provide only a control
> - *   dependency.
> - *
> - * - The UNLOCK routines are supplemented with shared_tryunlock(), which
> - *   fails if the caller appears to be the last lock holder (yes, this is
> - *   racy). All successful UNLOCK routines have RELEASE semantics.
> - */
> -static void arm_smmu_cmdq_shared_lock(struct arm_smmu_cmdq *cmdq)
> -{
> -	int val;
> -
> -	/*
> -	 * We can try to avoid the cmpxchg() loop by simply incrementing the
> -	 * lock counter. When held in exclusive state, the lock counter is set
> -	 * to INT_MIN so these increments won't hurt as the value will remain
> -	 * negative.
> -	 */
> -	if (atomic_fetch_inc_relaxed(&cmdq->lock) >= 0)
> -		return;
> -
> -	do {
> -		val = atomic_cond_read_relaxed(&cmdq->lock, VAL >= 0);
> -	} while (atomic_cmpxchg_relaxed(&cmdq->lock, val, val + 1) != val);
> -}
> -
> -static void arm_smmu_cmdq_shared_unlock(struct arm_smmu_cmdq *cmdq)
> -{
> -	(void)atomic_dec_return_release(&cmdq->lock);
> -}
> -
> -static bool arm_smmu_cmdq_shared_tryunlock(struct arm_smmu_cmdq *cmdq)
> +static void arm_smmu_cmdq_insert_cmd(struct arm_smmu_device *smmu, u64 *cmd)
>  {
> -	if (atomic_read(&cmdq->lock) == 1)
> -		return false;
> -
> -	arm_smmu_cmdq_shared_unlock(cmdq);
> -	return true;
> -}
> -
> -#define arm_smmu_cmdq_exclusive_trylock_irqsave(cmdq, flags)		\
> -({									\
> -	bool __ret;							\
> -	local_irq_save(flags);						\
> -	__ret = !atomic_cmpxchg_relaxed(&cmdq->lock, 0, INT_MIN);	\
> -	if (!__ret)							\
> -		local_irq_restore(flags);				\
> -	__ret;								\
> -})
> -
> -#define arm_smmu_cmdq_exclusive_unlock_irqrestore(cmdq, flags)		\
> -({									\
> -	atomic_set_release(&cmdq->lock, 0);				\
> -	local_irq_restore(flags);					\
> -})
> -
> -
> -/*
> - * Command queue insertion.
> - * This is made fiddly by our attempts to achieve some sort of scalability
> - * since there is one queue shared amongst all of the CPUs in the system.  If
> - * you like mixed-size concurrency, dependency ordering and relaxed atomics,
> - * then you'll *love* this monstrosity.
> - *
> - * The basic idea is to split the queue up into ranges of commands that are
> - * owned by a given CPU; the owner may not have written all of the commands
> - * itself, but is responsible for advancing the hardware prod pointer when
> - * the time comes. The algorithm is roughly:
> - *
> - * 	1. Allocate some space in the queue. At this point we also discover
> - *	   whether the head of the queue is currently owned by another CPU,
> - *	   or whether we are the owner.
> - *
> - *	2. Write our commands into our allocated slots in the queue.
> - *
> - *	3. Mark our slots as valid in arm_smmu_cmdq.valid_map.
> - *
> - *	4. If we are an owner:
> - *		a. Wait for the previous owner to finish.
> - *		b. Mark the queue head as unowned, which tells us the range
> - *		   that we are responsible for publishing.
> - *		c. Wait for all commands in our owned range to become valid.
> - *		d. Advance the hardware prod pointer.
> - *		e. Tell the next owner we've finished.
> - *
> - *	5. If we are inserting a CMD_SYNC (we may or may not have been an
> - *	   owner), then we need to stick around until it has completed:
> - *		a. If we have MSIs, the SMMU can write back into the CMD_SYNC
> - *		   to clear the first 4 bytes.
> - *		b. Otherwise, we spin waiting for the hardware cons pointer to
> - *		   advance past our command.
> - *
> - * The devil is in the details, particularly the use of locking for handling
> - * SYNC completion and freeing up space in the queue before we think that it is
> - * full.
> - */
> -static void __arm_smmu_cmdq_poll_set_valid_map(struct arm_smmu_cmdq *cmdq,
> -					       u32 sprod, u32 eprod, bool set)
> -{
> -	u32 swidx, sbidx, ewidx, ebidx;
> -	struct arm_smmu_ll_queue llq = {
> -		.max_n_shift	= cmdq->q.llq.max_n_shift,
> -		.prod		= sprod,
> -	};
> -
> -	ewidx = BIT_WORD(Q_IDX(&llq, eprod));
> -	ebidx = Q_IDX(&llq, eprod) % BITS_PER_LONG;
> -
> -	while (llq.prod != eprod) {
> -		unsigned long mask;
> -		atomic_long_t *ptr;
> -		u32 limit = BITS_PER_LONG;
> -
> -		swidx = BIT_WORD(Q_IDX(&llq, llq.prod));
> -		sbidx = Q_IDX(&llq, llq.prod) % BITS_PER_LONG;
> -
> -		ptr = &cmdq->valid_map[swidx];
> -
> -		if ((swidx == ewidx) && (sbidx < ebidx))
> -			limit = ebidx;
> -
> -		mask = GENMASK(limit - 1, sbidx);
> -
> -		/*
> -		 * The valid bit is the inverse of the wrap bit. This means
> -		 * that a zero-initialised queue is invalid and, after marking
> -		 * all entries as valid, they become invalid again when we
> -		 * wrap.
> -		 */
> -		if (set) {
> -			atomic_long_xor(mask, ptr);
> -		} else { /* Poll */
> -			unsigned long valid;
> +	struct arm_smmu_queue *q = &smmu->cmdq.q;
> +	bool wfe = !!(smmu->features & ARM_SMMU_FEAT_SEV);
>  
> -			valid = (ULONG_MAX + !!Q_WRP(&llq, llq.prod)) & mask;
> -			atomic_long_cond_read_relaxed(ptr, (VAL & mask) == valid);
> -		}
> +	smmu->prev_cmd_opcode = FIELD_GET(CMDQ_0_OP, cmd[0]);
>  
> -		llq.prod = queue_inc_prod_n(&llq, limit - sbidx);
> +	while (queue_insert_raw(q, cmd) == -ENOSPC) {
> +		if (queue_poll_cons(q, false, wfe))
> +			dev_err_ratelimited(smmu->dev, "CMDQ timeout\n");
>  	}
>  }
>  
> -/* Mark all entries in the range [sprod, eprod) as valid */
> -static void arm_smmu_cmdq_set_valid_map(struct arm_smmu_cmdq *cmdq,
> -					u32 sprod, u32 eprod)
> -{
> -	__arm_smmu_cmdq_poll_set_valid_map(cmdq, sprod, eprod, true);
> -}
> -
> -/* Wait for all entries in the range [sprod, eprod) to become valid */
> -static void arm_smmu_cmdq_poll_valid_map(struct arm_smmu_cmdq *cmdq,
> -					 u32 sprod, u32 eprod)
> -{
> -	__arm_smmu_cmdq_poll_set_valid_map(cmdq, sprod, eprod, false);
> -}
> -
> -/* Wait for the command queue to become non-full */
> -static int arm_smmu_cmdq_poll_until_not_full(struct arm_smmu_device *smmu,
> -					     struct arm_smmu_ll_queue *llq)
> +static void arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> +				    struct arm_smmu_cmdq_ent *ent)
>  {
> +	u64 cmd[CMDQ_ENT_DWORDS];
>  	unsigned long flags;
> -	struct arm_smmu_queue_poll qp;
> -	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
> -	int ret = 0;
>  
> -	/*
> -	 * Try to update our copy of cons by grabbing exclusive cmdq access. If
> -	 * that fails, spin until somebody else updates it for us.
> -	 */
> -	if (arm_smmu_cmdq_exclusive_trylock_irqsave(cmdq, flags)) {
> -		WRITE_ONCE(cmdq->q.llq.cons, readl_relaxed(cmdq->q.cons_reg));
> -		arm_smmu_cmdq_exclusive_unlock_irqrestore(cmdq, flags);
> -		llq->val = READ_ONCE(cmdq->q.llq.val);
> -		return 0;
> +	if (arm_smmu_cmdq_build_cmd(cmd, ent)) {
> +		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
> +			 ent->opcode);
> +		return;
>  	}
>  
> -	queue_poll_init(smmu, &qp);
> -	do {
> -		llq->val = READ_ONCE(smmu->cmdq.q.llq.val);
> -		if (!queue_full(llq))
> -			break;
> -
> -		ret = queue_poll(&qp);
> -	} while (!ret);
> -
> -	return ret;
> +	spin_lock_irqsave(&smmu->cmdq.lock, flags);
> +	arm_smmu_cmdq_insert_cmd(smmu, cmd);
> +	spin_unlock_irqrestore(&smmu->cmdq.lock, flags);
>  }
>  
>  /*
> - * Wait until the SMMU signals a CMD_SYNC completion MSI.
> - * Must be called with the cmdq lock held in some capacity.
> + * The difference between val and sync_idx is bounded by the maximum size of
> + * a queue at 2^20 entries, so 32 bits is plenty for wrap-safe arithmetic.
>   */
> -static int __arm_smmu_cmdq_poll_until_msi(struct arm_smmu_device *smmu,
> -					  struct arm_smmu_ll_queue *llq)
> -{
> -	int ret = 0;
> -	struct arm_smmu_queue_poll qp;
> -	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
> -	u32 *cmd = (u32 *)(Q_ENT(&cmdq->q, llq->prod));
> -
> -	queue_poll_init(smmu, &qp);
> -
> -	/*
> -	 * The MSI won't generate an event, since it's being written back
> -	 * into the command queue.
> -	 */
> -	qp.wfe = false;
> -	smp_cond_load_relaxed(cmd, !VAL || (ret = queue_poll(&qp)));
> -	llq->cons = ret ? llq->prod : queue_inc_prod_n(llq, 1);
> -	return ret;
> -}
> -
> -/*
> - * Wait until the SMMU cons index passes llq->prod.
> - * Must be called with the cmdq lock held in some capacity.
> - */
> -static int __arm_smmu_cmdq_poll_until_consumed(struct arm_smmu_device *smmu,
> -					       struct arm_smmu_ll_queue *llq)
> -{
> -	struct arm_smmu_queue_poll qp;
> -	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
> -	u32 prod = llq->prod;
> -	int ret = 0;
> -
> -	queue_poll_init(smmu, &qp);
> -	llq->val = READ_ONCE(smmu->cmdq.q.llq.val);
> -	do {
> -		if (queue_consumed(llq, prod))
> -			break;
> -
> -		ret = queue_poll(&qp);
> -
> -		/*
> -		 * This needs to be a readl() so that our subsequent call
> -		 * to arm_smmu_cmdq_shared_tryunlock() can fail accurately.
> -		 *
> -		 * Specifically, we need to ensure that we observe all
> -		 * shared_lock()s by other CMD_SYNCs that share our owner,
> -		 * so that a failing call to tryunlock() means that we're
> -		 * the last one out and therefore we can safely advance
> -		 * cmdq->q.llq.cons. Roughly speaking:
> -		 *
> -		 * CPU 0		CPU1			CPU2 (us)
> -		 *
> -		 * if (sync)
> -		 * 	shared_lock();
> -		 *
> -		 * dma_wmb();
> -		 * set_valid_map();
> -		 *
> -		 * 			if (owner) {
> -		 *				poll_valid_map();
> -		 *				<control dependency>
> -		 *				writel(prod_reg);
> -		 *
> -		 *						readl(cons_reg);
> -		 *						tryunlock();
> -		 *
> -		 * Requires us to see CPU 0's shared_lock() acquisition.
> -		 */
> -		llq->cons = readl(cmdq->q.cons_reg);
> -	} while (!ret);
> -
> -	return ret;
> -}
> -
> -static int arm_smmu_cmdq_poll_until_sync(struct arm_smmu_device *smmu,
> -					 struct arm_smmu_ll_queue *llq)
> +static int __arm_smmu_sync_poll_msi(struct arm_smmu_device *smmu, u32 sync_idx)
>  {
> -	if (smmu->features & ARM_SMMU_FEAT_MSI &&
> -	    smmu->features & ARM_SMMU_FEAT_COHERENCY)
> -		return __arm_smmu_cmdq_poll_until_msi(smmu, llq);
> -
> -	return __arm_smmu_cmdq_poll_until_consumed(smmu, llq);
> -}
> -
> -static void arm_smmu_cmdq_write_entries(struct arm_smmu_cmdq *cmdq, u64 *cmds,
> -					u32 prod, int n)
> -{
> -	int i;
> -	struct arm_smmu_ll_queue llq = {
> -		.max_n_shift	= cmdq->q.llq.max_n_shift,
> -		.prod		= prod,
> -	};
> +	ktime_t timeout;
> +	u32 val;
>  
> -	for (i = 0; i < n; ++i) {
> -		u64 *cmd = &cmds[i * CMDQ_ENT_DWORDS];
> +	timeout = ktime_add_us(ktime_get(), ARM_SMMU_CMDQ_SYNC_TIMEOUT_US);
> +	val = smp_cond_load_acquire(&smmu->sync_count,
> +				    (int)(VAL - sync_idx) >= 0 ||
> +				    !ktime_before(ktime_get(), timeout));
>  
> -		prod = queue_inc_prod_n(&llq, i);
> -		queue_write(Q_ENT(&cmdq->q, prod), cmd, CMDQ_ENT_DWORDS);
> -	}
> +	return (int)(val - sync_idx) < 0 ? -ETIMEDOUT : 0;
>  }
>  
> -/*
> - * This is the actual insertion function, and provides the following
> - * ordering guarantees to callers:
> - *
> - * - There is a dma_wmb() before publishing any commands to the queue.
> - *   This can be relied upon to order prior writes to data structures
> - *   in memory (such as a CD or an STE) before the command.
> - *
> - * - On completion of a CMD_SYNC, there is a control dependency.
> - *   This can be relied upon to order subsequent writes to memory (e.g.
> - *   freeing an IOVA) after completion of the CMD_SYNC.
> - *
> - * - Command insertion is totally ordered, so if two CPUs each race to
> - *   insert their own list of commands then all of the commands from one
> - *   CPU will appear before any of the commands from the other CPU.
> - */
> -static int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
> -				       u64 *cmds, int n, bool sync)
> +static int __arm_smmu_cmdq_issue_sync_msi(struct arm_smmu_device *smmu)
>  {
> -	u64 cmd_sync[CMDQ_ENT_DWORDS];
> -	u32 prod;
> +	u64 cmd[CMDQ_ENT_DWORDS];
>  	unsigned long flags;
> -	bool owner;
> -	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
> -	struct arm_smmu_ll_queue llq = {
> -		.max_n_shift = cmdq->q.llq.max_n_shift,
> -	}, head = llq;
> -	int ret = 0;
> -
> -	/* 1. Allocate some space in the queue */
> -	local_irq_save(flags);
> -	llq.val = READ_ONCE(cmdq->q.llq.val);
> -	do {
> -		u64 old;
> -
> -		while (!queue_has_space(&llq, n + sync)) {
> -			local_irq_restore(flags);
> -			if (arm_smmu_cmdq_poll_until_not_full(smmu, &llq))
> -				dev_err_ratelimited(smmu->dev, "CMDQ timeout\n");
> -			local_irq_save(flags);
> -		}
> -
> -		head.cons = llq.cons;
> -		head.prod = queue_inc_prod_n(&llq, n + sync) |
> -					     CMDQ_PROD_OWNED_FLAG;
> -
> -		old = cmpxchg_relaxed(&cmdq->q.llq.val, llq.val, head.val);
> -		if (old == llq.val)
> -			break;
> -
> -		llq.val = old;
> -	} while (1);
> -	owner = !(llq.prod & CMDQ_PROD_OWNED_FLAG);
> -	head.prod &= ~CMDQ_PROD_OWNED_FLAG;
> -	llq.prod &= ~CMDQ_PROD_OWNED_FLAG;
> -
> -	/*
> -	 * 2. Write our commands into the queue
> -	 * Dependency ordering from the cmpxchg() loop above.
> -	 */
> -	arm_smmu_cmdq_write_entries(cmdq, cmds, llq.prod, n);
> -	if (sync) {
> -		prod = queue_inc_prod_n(&llq, n);
> -		arm_smmu_cmdq_build_sync_cmd(cmd_sync, smmu, prod);
> -		queue_write(Q_ENT(&cmdq->q, prod), cmd_sync, CMDQ_ENT_DWORDS);
> -
> -		/*
> -		 * In order to determine completion of our CMD_SYNC, we must
> -		 * ensure that the queue can't wrap twice without us noticing.
> -		 * We achieve that by taking the cmdq lock as shared before
> -		 * marking our slot as valid.
> -		 */
> -		arm_smmu_cmdq_shared_lock(cmdq);
> -	}
> -
> -	/* 3. Mark our slots as valid, ensuring commands are visible first */
> -	dma_wmb();
> -	arm_smmu_cmdq_set_valid_map(cmdq, llq.prod, head.prod);
> -
> -	/* 4. If we are the owner, take control of the SMMU hardware */
> -	if (owner) {
> -		/* a. Wait for previous owner to finish */
> -		atomic_cond_read_relaxed(&cmdq->owner_prod, VAL == llq.prod);
> -
> -		/* b. Stop gathering work by clearing the owned flag */
> -		prod = atomic_fetch_andnot_relaxed(CMDQ_PROD_OWNED_FLAG,
> -						   &cmdq->q.llq.atomic.prod);
> -		prod &= ~CMDQ_PROD_OWNED_FLAG;
> -
> -		/*
> -		 * c. Wait for any gathered work to be written to the queue.
> -		 * Note that we read our own entries so that we have the control
> -		 * dependency required by (d).
> -		 */
> -		arm_smmu_cmdq_poll_valid_map(cmdq, llq.prod, prod);
> +	struct arm_smmu_cmdq_ent ent = {
> +		.opcode = CMDQ_OP_CMD_SYNC,
> +		.sync	= {
> +			.msiaddr = virt_to_phys(&smmu->sync_count),
> +		},
> +	};
>  
> -		/*
> -		 * d. Advance the hardware prod pointer
> -		 * Control dependency ordering from the entries becoming valid.
> -		 */
> -		writel_relaxed(prod, cmdq->q.prod_reg);
> +	spin_lock_irqsave(&smmu->cmdq.lock, flags);
>  
> -		/*
> -		 * e. Tell the next owner we're done
> -		 * Make sure we've updated the hardware first, so that we don't
> -		 * race to update prod and potentially move it backwards.
> -		 */
> -		atomic_set_release(&cmdq->owner_prod, prod);
> +	/* Piggy-back on the previous command if it's a SYNC */
> +	if (smmu->prev_cmd_opcode == CMDQ_OP_CMD_SYNC) {
> +		ent.sync.msidata = smmu->sync_nr;
> +	} else {
> +		ent.sync.msidata = ++smmu->sync_nr;
> +		arm_smmu_cmdq_build_cmd(cmd, &ent);
> +		arm_smmu_cmdq_insert_cmd(smmu, cmd);
>  	}
>  
> -	/* 5. If we are inserting a CMD_SYNC, we must wait for it to complete */
> -	if (sync) {
> -		llq.prod = queue_inc_prod_n(&llq, n);
> -		ret = arm_smmu_cmdq_poll_until_sync(smmu, &llq);
> -		if (ret) {
> -			dev_err_ratelimited(smmu->dev,
> -					    "CMD_SYNC timeout at 0x%08x [hwprod 0x%08x, hwcons 0x%08x]\n",
> -					    llq.prod,
> -					    readl_relaxed(cmdq->q.prod_reg),
> -					    readl_relaxed(cmdq->q.cons_reg));
> -		}
> +	spin_unlock_irqrestore(&smmu->cmdq.lock, flags);
>  
> -		/*
> -		 * Try to unlock the cmq lock. This will fail if we're the last
> -		 * reader, in which case we can safely update cmdq->q.llq.cons
> -		 */
> -		if (!arm_smmu_cmdq_shared_tryunlock(cmdq)) {
> -			WRITE_ONCE(cmdq->q.llq.cons, llq.cons);
> -			arm_smmu_cmdq_shared_unlock(cmdq);
> -		}
> -	}
> -
> -	local_irq_restore(flags);
> -	return ret;
> +	return __arm_smmu_sync_poll_msi(smmu, ent.sync.msidata);
>  }
>  
> -static int arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
> -				   struct arm_smmu_cmdq_ent *ent)
> +static int __arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>  {
>  	u64 cmd[CMDQ_ENT_DWORDS];
> +	unsigned long flags;
> +	bool wfe = !!(smmu->features & ARM_SMMU_FEAT_SEV);
> +	struct arm_smmu_cmdq_ent ent = { .opcode = CMDQ_OP_CMD_SYNC };
> +	int ret;
>  
> -	if (arm_smmu_cmdq_build_cmd(cmd, ent)) {
> -		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
> -			 ent->opcode);
> -		return -EINVAL;
> -	}
> +	arm_smmu_cmdq_build_cmd(cmd, &ent);
>  
> -	return arm_smmu_cmdq_issue_cmdlist(smmu, cmd, 1, false);
> -}
> +	spin_lock_irqsave(&smmu->cmdq.lock, flags);
> +	arm_smmu_cmdq_insert_cmd(smmu, cmd);
> +	ret = queue_poll_cons(&smmu->cmdq.q, true, wfe);
> +	spin_unlock_irqrestore(&smmu->cmdq.lock, flags);
>  
> -static int arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
> -{
> -	return arm_smmu_cmdq_issue_cmdlist(smmu, NULL, 0, true);
> +	return ret;
>  }
>  
> -static void arm_smmu_cmdq_batch_add(struct arm_smmu_device *smmu,
> -				    struct arm_smmu_cmdq_batch *cmds,
> -				    struct arm_smmu_cmdq_ent *cmd)
> +static int arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>  {
> -	if (cmds->num == CMDQ_BATCH_ENTRIES) {
> -		arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmds, cmds->num, false);
> -		cmds->num = 0;
> -	}
> -	arm_smmu_cmdq_build_cmd(&cmds->cmds[cmds->num * CMDQ_ENT_DWORDS], cmd);
> -	cmds->num++;
> -}
> +	int ret;
> +	bool msi = (smmu->features & ARM_SMMU_FEAT_MSI) &&
> +		   (smmu->features & ARM_SMMU_FEAT_COHERENCY);
>  
> -static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
> -				      struct arm_smmu_cmdq_batch *cmds)
> -{
> -	return arm_smmu_cmdq_issue_cmdlist(smmu, cmds->cmds, cmds->num, true);
> +	ret = msi ? __arm_smmu_cmdq_issue_sync_msi(smmu)
> +		  : __arm_smmu_cmdq_issue_sync(smmu);
> +	if (ret)
> +		dev_err_ratelimited(smmu->dev, "CMD_SYNC timeout\n");
> +	return ret;
>  }
>  
>  /* Context descriptor manipulation functions */
> @@ -1536,7 +1117,6 @@ static void arm_smmu_sync_cd(struct arm_smmu_domain *smmu_domain,
>  	size_t i;
>  	unsigned long flags;
>  	struct arm_smmu_master *master;
> -	struct arm_smmu_cmdq_batch cmds = {};
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	struct arm_smmu_cmdq_ent cmd = {
>  		.opcode	= CMDQ_OP_CFGI_CD,
> @@ -1550,12 +1130,12 @@ static void arm_smmu_sync_cd(struct arm_smmu_domain *smmu_domain,
>  	list_for_each_entry(master, &smmu_domain->devices, domain_head) {
>  		for (i = 0; i < master->num_sids; i++) {
>  			cmd.cfgi.sid = master->sids[i];
> -			arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
> +			arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>  		}
>  	}
>  	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>  
> -	arm_smmu_cmdq_batch_submit(smmu, &cmds);
> +	arm_smmu_cmdq_issue_sync(smmu);
>  }
>  
>  static int arm_smmu_alloc_cd_leaf_table(struct arm_smmu_device *smmu,
> @@ -2190,16 +1770,17 @@ arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
>  	cmd->atc.size	= log2_span;
>  }
>  
> -static int arm_smmu_atc_inv_master(struct arm_smmu_master *master)
> +static int arm_smmu_atc_inv_master(struct arm_smmu_master *master,
> +				   struct arm_smmu_cmdq_ent *cmd)
>  {
>  	int i;
> -	struct arm_smmu_cmdq_ent cmd;
>  
> -	arm_smmu_atc_inv_to_cmd(0, 0, 0, &cmd);
> +	if (!master->ats_enabled)
> +		return 0;
>  
>  	for (i = 0; i < master->num_sids; i++) {
> -		cmd.atc.sid = master->sids[i];
> -		arm_smmu_cmdq_issue_cmd(master->smmu, &cmd);
> +		cmd->atc.sid = master->sids[i];
> +		arm_smmu_cmdq_issue_cmd(master->smmu, cmd);
>  	}
>  
>  	return arm_smmu_cmdq_issue_sync(master->smmu);
> @@ -2208,11 +1789,10 @@ static int arm_smmu_atc_inv_master(struct arm_smmu_master *master)
>  static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>  				   int ssid, unsigned long iova, size_t size)
>  {
> -	int i;
> +	int ret = 0;
>  	unsigned long flags;
>  	struct arm_smmu_cmdq_ent cmd;
>  	struct arm_smmu_master *master;
> -	struct arm_smmu_cmdq_batch cmds = {};
>  
>  	if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_ATS))
>  		return 0;
> @@ -2237,18 +1817,11 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
>  	arm_smmu_atc_inv_to_cmd(ssid, iova, size, &cmd);
>  
>  	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
> -	list_for_each_entry(master, &smmu_domain->devices, domain_head) {
> -		if (!master->ats_enabled)
> -			continue;
> -
> -		for (i = 0; i < master->num_sids; i++) {
> -			cmd.atc.sid = master->sids[i];
> -			arm_smmu_cmdq_batch_add(smmu_domain->smmu, &cmds, &cmd);
> -		}
> -	}
> +	list_for_each_entry(master, &smmu_domain->devices, domain_head)
> +		ret |= arm_smmu_atc_inv_master(master, &cmd);
>  	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
>  
> -	return arm_smmu_cmdq_batch_submit(smmu_domain->smmu, &cmds);
> +	return ret ? -ETIMEDOUT : 0;
>  }
>  
>  /* IO_PGTABLE API */
> @@ -2270,26 +1843,23 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  	/*
>  	 * NOTE: when io-pgtable is in non-strict mode, we may get here with
>  	 * PTEs previously cleared by unmaps on the current CPU not yet visible
> -	 * to the SMMU. We are relying on the dma_wmb() implicit during cmd
> -	 * insertion to guarantee those are observed before the TLBI. Do be
> -	 * careful, 007.
> +	 * to the SMMU. We are relying on the DSB implicit in
> +	 * queue_sync_prod_out() to guarantee those are observed before the
> +	 * TLBI. Do be careful, 007.
>  	 */
>  	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>  	arm_smmu_cmdq_issue_sync(smmu);
> -	arm_smmu_atc_inv_domain(smmu_domain, 0, 0, 0);
>  }
>  
> -static void arm_smmu_tlb_inv_range(unsigned long iova, size_t size,
> -				   size_t granule, bool leaf,
> -				   struct arm_smmu_domain *smmu_domain)
> +static void arm_smmu_tlb_inv_range_nosync(unsigned long iova, size_t size,
> +					  size_t granule, bool leaf, void *cookie)
>  {
> +	struct arm_smmu_domain *smmu_domain = cookie;
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
> -	unsigned long start = iova, end = iova + size, num_pages = 0, tg = 0;
> -	size_t inv_range = granule;
> -	struct arm_smmu_cmdq_batch cmds = {};
>  	struct arm_smmu_cmdq_ent cmd = {
>  		.tlbi = {
>  			.leaf	= leaf,
> +			.addr	= iova,
>  		},
>  	};
>  
> @@ -2304,78 +1874,37 @@ static void arm_smmu_tlb_inv_range(unsigned long iova, size_t size,
>  		cmd.tlbi.vmid	= smmu_domain->s2_cfg.vmid;
>  	}
>  
> -	if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> -		/* Get the leaf page size */
> -		tg = __ffs(smmu_domain->domain.pgsize_bitmap);
> -
> -		/* Convert page size of 12,14,16 (log2) to 1,2,3 */
> -		cmd.tlbi.tg = (tg - 10) / 2;
> -
> -		/* Determine what level the granule is at */
> -		cmd.tlbi.ttl = 4 - ((ilog2(granule) - 3) / (tg - 3));
> -
> -		num_pages = size >> tg;
> -	}
> -
> -	while (iova < end) {
> -		if (smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> -			/*
> -			 * On each iteration of the loop, the range is 5 bits
> -			 * worth of the aligned size remaining.
> -			 * The range in pages is:
> -			 *
> -			 * range = (num_pages & (0x1f << __ffs(num_pages)))
> -			 */
> -			unsigned long scale, num;
> -
> -			/* Determine the power of 2 multiple number of pages */
> -			scale = __ffs(num_pages);
> -			cmd.tlbi.scale = scale;
> -
> -			/* Determine how many chunks of 2^scale size we have */
> -			num = (num_pages >> scale) & CMDQ_TLBI_RANGE_NUM_MAX;
> -			cmd.tlbi.num = num - 1;
> -
> -			/* range is num * 2^scale * pgsize */
> -			inv_range = num << (scale + tg);
> -
> -			/* Clear out the lower order bits for the next iteration */
> -			num_pages -= num << scale;
> -		}
> -
> -		cmd.tlbi.addr = iova;
> -		arm_smmu_cmdq_batch_add(smmu, &cmds, &cmd);
> -		iova += inv_range;
> -	}
> -	arm_smmu_cmdq_batch_submit(smmu, &cmds);
> -
> -	/*
> -	 * Unfortunately, this can't be leaf-only since we may have
> -	 * zapped an entire table.
> -	 */
> -	arm_smmu_atc_inv_domain(smmu_domain, 0, start, size);
> +	do {
> +		arm_smmu_cmdq_issue_cmd(smmu, &cmd);
> +		cmd.tlbi.addr += granule;
> +	} while (size -= granule);
>  }
>  
>  static void arm_smmu_tlb_inv_page_nosync(struct iommu_iotlb_gather *gather,
>  					 unsigned long iova, size_t granule,
>  					 void *cookie)
>  {
> -	struct arm_smmu_domain *smmu_domain = cookie;
> -	struct iommu_domain *domain = &smmu_domain->domain;
> -
> -	iommu_iotlb_gather_add_page(domain, gather, iova, granule);
> +	arm_smmu_tlb_inv_range_nosync(iova, granule, granule, true, cookie);
>  }
>  
>  static void arm_smmu_tlb_inv_walk(unsigned long iova, size_t size,
>  				  size_t granule, void *cookie)
>  {
> -	arm_smmu_tlb_inv_range(iova, size, granule, false, cookie);
> +	struct arm_smmu_domain *smmu_domain = cookie;
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +
> +	arm_smmu_tlb_inv_range_nosync(iova, size, granule, false, cookie);
> +	arm_smmu_cmdq_issue_sync(smmu);
>  }
>  
>  static void arm_smmu_tlb_inv_leaf(unsigned long iova, size_t size,
>  				  size_t granule, void *cookie)
>  {
> -	arm_smmu_tlb_inv_range(iova, size, granule, true, cookie);
> +	struct arm_smmu_domain *smmu_domain = cookie;
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +
> +	arm_smmu_tlb_inv_range_nosync(iova, size, granule, true, cookie);
> +	arm_smmu_cmdq_issue_sync(smmu);
>  }
>  
>  static const struct iommu_flush_ops arm_smmu_flush_ops = {
> @@ -2701,6 +2230,7 @@ static void arm_smmu_enable_ats(struct arm_smmu_master *master)
>  
>  static void arm_smmu_disable_ats(struct arm_smmu_master *master)
>  {
> +	struct arm_smmu_cmdq_ent cmd;
>  	struct arm_smmu_domain *smmu_domain = master->domain;
>  
>  	if (!master->ats_enabled)
> @@ -2712,7 +2242,8 @@ static void arm_smmu_disable_ats(struct arm_smmu_master *master)
>  	 * ATC invalidation via the SMMU.
>  	 */
>  	wmb();
> -	arm_smmu_atc_inv_master(master);
> +	arm_smmu_atc_inv_to_cmd(0, 0, 0, &cmd);
> +	arm_smmu_atc_inv_master(master, &cmd);
>  	atomic_dec(&smmu_domain->nr_ats_masters);
>  }
>  
> @@ -2856,13 +2387,18 @@ static int arm_smmu_map(struct iommu_domain *domain, unsigned long iova,
>  static size_t arm_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
>  			     size_t size, struct iommu_iotlb_gather *gather)
>  {
> +	int ret;
>  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>  	struct io_pgtable_ops *ops = smmu_domain->pgtbl_ops;
>  
>  	if (!ops)
>  		return 0;
>  
> -	return ops->unmap(ops, iova, size, gather);
> +	ret = ops->unmap(ops, iova, size, gather);
> +	if (ret && arm_smmu_atc_inv_domain(smmu_domain, 0, iova, size))
> +		return 0;
> +
> +	return ret;
>  }
>  
>  static void arm_smmu_flush_iotlb_all(struct iommu_domain *domain)
> @@ -2876,10 +2412,10 @@ static void arm_smmu_flush_iotlb_all(struct iommu_domain *domain)
>  static void arm_smmu_iotlb_sync(struct iommu_domain *domain,
>  				struct iommu_iotlb_gather *gather)
>  {
> -	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> +	struct arm_smmu_device *smmu = to_smmu_domain(domain)->smmu;
>  
> -	arm_smmu_tlb_inv_range(gather->start, gather->end - gather->start,
> -			       gather->pgsize, true, smmu_domain);
> +	if (smmu)
> +		arm_smmu_cmdq_issue_sync(smmu);
>  }
>  
>  static phys_addr_t
> @@ -3177,49 +2713,18 @@ static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>  	return 0;
>  }
>  
> -static void arm_smmu_cmdq_free_bitmap(void *data)
> -{
> -	unsigned long *bitmap = data;
> -	bitmap_free(bitmap);
> -}
> -
> -static int arm_smmu_cmdq_init(struct arm_smmu_device *smmu)
> -{
> -	int ret = 0;
> -	struct arm_smmu_cmdq *cmdq = &smmu->cmdq;
> -	unsigned int nents = 1 << cmdq->q.llq.max_n_shift;
> -	atomic_long_t *bitmap;
> -
> -	atomic_set(&cmdq->owner_prod, 0);
> -	atomic_set(&cmdq->lock, 0);
> -
> -	bitmap = (atomic_long_t *)bitmap_zalloc(nents, GFP_KERNEL);
> -	if (!bitmap) {
> -		dev_err(smmu->dev, "failed to allocate cmdq bitmap\n");
> -		ret = -ENOMEM;
> -	} else {
> -		cmdq->valid_map = bitmap;
> -		devm_add_action(smmu->dev, arm_smmu_cmdq_free_bitmap, bitmap);
> -	}
> -
> -	return ret;
> -}
> -
>  static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
>  {
>  	int ret;
>  
>  	/* cmdq */
> +	spin_lock_init(&smmu->cmdq.lock);
>  	ret = arm_smmu_init_one_queue(smmu, &smmu->cmdq.q, ARM_SMMU_CMDQ_PROD,
>  				      ARM_SMMU_CMDQ_CONS, CMDQ_ENT_DWORDS,
>  				      "cmdq");
>  	if (ret)
>  		return ret;
>  
> -	ret = arm_smmu_cmdq_init(smmu);
> -	if (ret)
> -		return ret;
> -
>  	/* evtq */
>  	ret = arm_smmu_init_one_queue(smmu, &smmu->evtq.q, ARM_SMMU_EVTQ_PROD,
>  				      ARM_SMMU_EVTQ_CONS, EVTQ_ENT_DWORDS,
> @@ -3800,15 +3305,9 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	/* Queue sizes, capped to ensure natural alignment */
>  	smmu->cmdq.q.llq.max_n_shift = min_t(u32, CMDQ_MAX_SZ_SHIFT,
>  					     FIELD_GET(IDR1_CMDQS, reg));
> -	if (smmu->cmdq.q.llq.max_n_shift <= ilog2(CMDQ_BATCH_ENTRIES)) {
> -		/*
> -		 * We don't support splitting up batches, so one batch of
> -		 * commands plus an extra sync needs to fit inside the command
> -		 * queue. There's also no way we can handle the weird alignment
> -		 * restrictions on the base pointer for a unit-length queue.
> -		 */
> -		dev_err(smmu->dev, "command queue size <= %d entries not supported\n",
> -			CMDQ_BATCH_ENTRIES);
> +	if (!smmu->cmdq.q.llq.max_n_shift) {
> +		/* Odd alignment restrictions on the base, so ignore for now */
> +		dev_err(smmu->dev, "unit-length command queue not supported\n");
>  		return -ENXIO;
>  	}
>  
> @@ -3828,11 +3327,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	if (smmu->sid_bits <= STRTAB_SPLIT)
>  		smmu->features &= ~ARM_SMMU_FEAT_2_LVL_STRTAB;
>  
> -	/* IDR3 */
> -	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR3);
> -	if (FIELD_GET(IDR3_RIL, reg))
> -		smmu->features |= ARM_SMMU_FEAT_RANGE_INV;
> -
>  	/* IDR5 */
>  	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR5);
>  
> -- 
> 2.17.1
> 

