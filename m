Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8EA2D77BD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 15:25:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50657.89389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knjMR-0000R1-RE; Fri, 11 Dec 2020 14:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50657.89389; Fri, 11 Dec 2020 14:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knjMR-0000Qc-Nq; Fri, 11 Dec 2020 14:25:31 +0000
Received: by outflank-mailman (input) for mailman id 50657;
 Fri, 11 Dec 2020 14:25:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1knjMP-0000Ph-N5
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 14:25:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knjMJ-0007SQ-J7; Fri, 11 Dec 2020 14:25:23 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1knjMJ-0006Yz-Bl; Fri, 11 Dec 2020 14:25:23 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=zDYThixRDAossD0v/B7rJxf/STHrtG2oS1TgDu3csnw=; b=LRyQze3Vp5SI3v/aTfrUPZuN3L
	qGRmwfNbC1zJuceOyVBYxFY89LbyLgYHsiiItUFdkKhqMbxKYppoj6g1SQKNkd8jTL9QatIilB7+s
	yVurjeSYJha0hIH5LPxaeR6gQl9AR+cEjbBdpl89LB5bAlNwkbq8wStNkb7N4YbR7cLE=;
Subject: Re: [PATCH v3 7/8] xen/arm: Add support for SMMUv3 driver
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1607617848.git.rahul.singh@arm.com>
 <33645b592bc5935a3b28ad576a819d06ed81e8dd.1607617848.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e26c96cb-245b-6927-c4a7-224c2114df42@xen.org>
Date: Fri, 11 Dec 2020 14:25:20 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <33645b592bc5935a3b28ad576a819d06ed81e8dd.1607617848.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 10/12/2020 16:57, Rahul Singh wrote:
>   struct arm_smmu_strtab_cfg {
> @@ -613,8 +847,13 @@ struct arm_smmu_device {
>   		u64			padding;
>   	};
>   
> -	/* IOMMU core code handle */
> -	struct iommu_device		iommu;
> +	/* Need to keep a list of SMMU devices */
> +	struct list_head		devices;
> +
> +	/* Tasklets for handling evts/faults and pci page request IRQs*/
> +	struct tasklet		evtq_irq_tasklet;
> +	struct tasklet		priq_irq_tasklet;
> +	struct tasklet		combined_irq_tasklet;
>   };
>   
>   /* SMMU private data for each master */
> @@ -638,7 +877,6 @@ enum arm_smmu_domain_stage {
>   
>   struct arm_smmu_domain {
>   	struct arm_smmu_device		*smmu;
> -	struct mutex			init_mutex; /* Protects smmu pointer */

Hmmm... Your commit message says the mutex would be replaced by a 
spinlock. However, you are dropping the lock. What I did miss?

[...]

> @@ -1578,6 +1841,17 @@ static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
>   	struct arm_smmu_device *smmu = smmu_domain->smmu;
>   	struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
>   	typeof(&arm_lpae_s2_cfg.vtcr) vtcr = &arm_lpae_s2_cfg.vtcr;
> +	uint64_t reg = READ_SYSREG64(VTCR_EL2);

Please don't use VTCR_EL2 here. You should be able to infer the 
parameter from the p2m_ipa_bits.

Also, I still don't see code that will restrict the IPA bits because on 
the support for the SMMU.

> +
> +	vtcr->tsz	= FIELD_GET(STRTAB_STE_2_VTCR_S2T0SZ, reg);
> +	vtcr->sl	= FIELD_GET(STRTAB_STE_2_VTCR_S2SL0, reg);
> +	vtcr->irgn	= FIELD_GET(STRTAB_STE_2_VTCR_S2IR0, reg);
> +	vtcr->orgn	= FIELD_GET(STRTAB_STE_2_VTCR_S2OR0, reg);
> +	vtcr->sh	= FIELD_GET(STRTAB_STE_2_VTCR_S2SH0, reg);
> +	vtcr->tg	= FIELD_GET(STRTAB_STE_2_VTCR_S2TG, reg);
> +	vtcr->ps	= FIELD_GET(STRTAB_STE_2_VTCR_S2PS, reg);
> +
> +	arm_lpae_s2_cfg.vttbr  = page_to_maddr(cfg->domain->arch.p2m.root);
>   
>   	vmid = arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
>   	if (vmid < 0)
> @@ -1592,6 +1866,11 @@ static int arm_smmu_domain_finalise_s2(struct arm_smmu_domain *smmu_domain,
>   			  FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, vtcr->sh) |
>   			  FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, vtcr->tg) |
>   			  FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, vtcr->ps);
> +
> +	printk(XENLOG_DEBUG
> +		   "SMMUv3: d%u: vmid 0x%x vtcr 0x%"PRIpaddr" p2maddr 0x%"PRIpaddr"\n",
> +		   cfg->domain->domain_id, cfg->vmid, cfg->vtcr, cfg->vttbr);
> +
>   	return 0;
>   }

[...]

> @@ -1923,8 +2239,8 @@ static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>   		return -ENOMEM;
>   	}
>   
> -	if (!WARN_ON(q->base_dma & (qsz - 1))) { > -		dev_info(smmu->dev, "allocated %u entries for %s\n",
> +	if (unlikely(q->base_dma & (qsz - 1))) {
> +		dev_warn(smmu->dev, "allocated %u entries for %s\n",
dev_warn() is not the same as WARN_ON(). But really, the first step is 
for you to try to change behavior of WARN_ON() in Xen.

If this doesn't go through then we can discuss about approach to 
mitigate it.

Cheers,

-- 
Julien Grall

