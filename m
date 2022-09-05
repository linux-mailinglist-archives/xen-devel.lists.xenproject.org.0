Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE19B5ADB5A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 00:20:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399210.640303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVKRV-0007fu-LK; Mon, 05 Sep 2022 22:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399210.640303; Mon, 05 Sep 2022 22:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVKRV-0007di-Ie; Mon, 05 Sep 2022 22:19:45 +0000
Received: by outflank-mailman (input) for mailman id 399210;
 Mon, 05 Sep 2022 22:19:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+J0v=ZI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oVKRU-0007dc-Bd
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 22:19:44 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d74b82b8-2d68-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 00:19:43 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7101B81598;
 Mon,  5 Sep 2022 22:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A02C433D7;
 Mon,  5 Sep 2022 22:19:41 +0000 (UTC)
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
X-Inumbo-ID: d74b82b8-2d68-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662416381;
	bh=2zCGslPKOq0qjEIEfD18prRPd7UwxPKZojQ4MBgjtHM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tKP46uVhbhNgBVwHssDzVyIeWjXXbkxsoG8qrcx5Cdcuyf4NkO1heJqnZ9YIqU8Qa
	 Md1IffVcq5ynecUTNKljW98fW2Y2+Xbdu1/fm2TwzKDLOv5FZEdRe00OCa8yKxKV5G
	 MZHpSVkDhcZyRHJsJJFvu++A9VknQEK4UwoGtD6WMNea12EDKdU18+PyeAT7821259
	 Y7WSNe/mXu2/8CtUePlWylvAKjKlPFuF16IYqVb6PwPdZr65ZTp4N4/QsM8psXXeK6
	 AARKuP6gF6JZ2RB6Q9k8ONiz8mPx4/vuQDOz3py/mdDbZwkV07TKZzdnL1ZUY543Sl
	 2jhyoYqSE+awQ==
Date: Mon, 5 Sep 2022 15:19:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, Robin Murphy <robin.murphy@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 05/10] xen/arm: smmuv3: Remove the page 1 fixup
In-Reply-To: <6a8cb40d46ab3e688df1f037e4fdacdcd98e3c6a.1662394710.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209051519270.3931@ubuntu-linux-20-04-desktop>
References: <cover.1662394710.git.rahul.singh@arm.com> <6a8cb40d46ab3e688df1f037e4fdacdcd98e3c6a.1662394710.git.rahul.singh@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Sep 2022, Rahul Singh wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> Backport Linux commit 86d2d9214880. This is the clean backport without
> any changes.
> 
> Since we now keep track of page 1 via a separate pointer that
> already encapsulates aliasing to page 0 as necessary, we can remove
> the clunky fixup routine and simply use the relevant bases directly.
> The current architecture spec (IHI0070D.a) defines
> SMMU_{EVENTQ,PRIQ}_{PROD,CONS} as offsets relative to page 1, so the
> cleanup represents a little bit of convergence as well as just
> lines of code saved.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 86d2d9214880
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3:
>  - fix "q->cons_reg = page + cons_off"
> Changes in v2:
>  - fix commit msg.
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 42 ++++++++++-----------------
>  xen/drivers/passthrough/arm/smmu-v3.h |  8 ++---
>  2 files changed, 20 insertions(+), 30 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index e65b226b85..272adebb0b 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -238,15 +238,6 @@ static struct arm_smmu_option_prop arm_smmu_options[] = {
>  	{ 0, NULL},
>  };
>  
> -static inline void __iomem *arm_smmu_page1_fixup(unsigned long offset,
> -						 struct arm_smmu_device *smmu)
> -{
> -	if (offset > SZ_64K)
> -		return smmu->page1 + offset - SZ_64K;
> -
> -	return smmu->base + offset;
> -}
> -
>  static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
>  {
>  	return container_of(dom, struct arm_smmu_domain, domain);
> @@ -1581,6 +1572,7 @@ static int arm_smmu_dt_xlate(struct device *dev,
>  /* Probing and initialisation functions */
>  static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>  				   struct arm_smmu_queue *q,
> +				   void __iomem *page,
>  				   unsigned long prod_off,
>  				   unsigned long cons_off,
>  				   size_t dwords, const char *name)
> @@ -1609,8 +1601,8 @@ static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>  			 1 << q->llq.max_n_shift, name);
>  	}
>  
> -	q->prod_reg	= arm_smmu_page1_fixup(prod_off, smmu);
> -	q->cons_reg	= arm_smmu_page1_fixup(cons_off, smmu);
> +	q->prod_reg	= page + prod_off;
> +	q->cons_reg	= page + cons_off;
>  	q->ent_dwords	= dwords;
>  
>  	q->q_base  = Q_BASE_RWA;
> @@ -1627,16 +1619,16 @@ static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
>  
>  	/* cmdq */
>  	spin_lock_init(&smmu->cmdq.lock);
> -	ret = arm_smmu_init_one_queue(smmu, &smmu->cmdq.q, ARM_SMMU_CMDQ_PROD,
> -				      ARM_SMMU_CMDQ_CONS, CMDQ_ENT_DWORDS,
> -				      "cmdq");
> +	ret = arm_smmu_init_one_queue(smmu, &smmu->cmdq.q, smmu->base,
> +					  ARM_SMMU_CMDQ_PROD, ARM_SMMU_CMDQ_CONS,
> +					  CMDQ_ENT_DWORDS, "cmdq");
>  	if (ret)
>  		return ret;
>  
>  	/* evtq */
> -	ret = arm_smmu_init_one_queue(smmu, &smmu->evtq.q, ARM_SMMU_EVTQ_PROD,
> -				      ARM_SMMU_EVTQ_CONS, EVTQ_ENT_DWORDS,
> -				      "evtq");
> +	ret = arm_smmu_init_one_queue(smmu, &smmu->evtq.q, smmu->page1,
> +					  ARM_SMMU_EVTQ_PROD, ARM_SMMU_EVTQ_CONS,
> +					  EVTQ_ENT_DWORDS, "evtq");
>  	if (ret)
>  		return ret;
>  
> @@ -1644,9 +1636,9 @@ static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
>  	if (!(smmu->features & ARM_SMMU_FEAT_PRI))
>  		return 0;
>  
> -	return arm_smmu_init_one_queue(smmu, &smmu->priq.q, ARM_SMMU_PRIQ_PROD,
> -				       ARM_SMMU_PRIQ_CONS, PRIQ_ENT_DWORDS,
> -				       "priq");
> +	return arm_smmu_init_one_queue(smmu, &smmu->priq.q, smmu->page1,
> +					   ARM_SMMU_PRIQ_PROD, ARM_SMMU_PRIQ_CONS,
> +					   PRIQ_ENT_DWORDS, "priq");
>  }
>  
>  static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
> @@ -2090,10 +2082,8 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  
>  	/* Event queue */
>  	writeq_relaxed(smmu->evtq.q.q_base, smmu->base + ARM_SMMU_EVTQ_BASE);
> -	writel_relaxed(smmu->evtq.q.llq.prod,
> -		       arm_smmu_page1_fixup(ARM_SMMU_EVTQ_PROD, smmu));
> -	writel_relaxed(smmu->evtq.q.llq.cons,
> -		       arm_smmu_page1_fixup(ARM_SMMU_EVTQ_CONS, smmu));
> +	writel_relaxed(smmu->evtq.q.llq.prod, smmu->page1 + ARM_SMMU_EVTQ_PROD);
> +	writel_relaxed(smmu->evtq.q.llq.cons, smmu->page1 + ARM_SMMU_EVTQ_CONS);
>  
>  	enables |= CR0_EVTQEN;
>  	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> @@ -2108,9 +2098,9 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>  		writeq_relaxed(smmu->priq.q.q_base,
>  			       smmu->base + ARM_SMMU_PRIQ_BASE);
>  		writel_relaxed(smmu->priq.q.llq.prod,
> -			       arm_smmu_page1_fixup(ARM_SMMU_PRIQ_PROD, smmu));
> +			       smmu->page1 + ARM_SMMU_PRIQ_PROD);
>  		writel_relaxed(smmu->priq.q.llq.cons,
> -			       arm_smmu_page1_fixup(ARM_SMMU_PRIQ_CONS, smmu));
> +			       smmu->page1 + ARM_SMMU_PRIQ_CONS);
>  
>  		enables |= CR0_PRIQEN;
>  		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
> index c45d2f16c4..0742bc393f 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.h
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -130,15 +130,15 @@
>  #define ARM_SMMU_CMDQ_CONS		0x9c
>  
>  #define ARM_SMMU_EVTQ_BASE		0xa0
> -#define ARM_SMMU_EVTQ_PROD		0x100a8
> -#define ARM_SMMU_EVTQ_CONS		0x100ac
> +#define ARM_SMMU_EVTQ_PROD		0xa8
> +#define ARM_SMMU_EVTQ_CONS		0xac
>  #define ARM_SMMU_EVTQ_IRQ_CFG0		0xb0
>  #define ARM_SMMU_EVTQ_IRQ_CFG1		0xb8
>  #define ARM_SMMU_EVTQ_IRQ_CFG2		0xbc
>  
>  #define ARM_SMMU_PRIQ_BASE		0xc0
> -#define ARM_SMMU_PRIQ_PROD		0x100c8
> -#define ARM_SMMU_PRIQ_CONS		0x100cc
> +#define ARM_SMMU_PRIQ_PROD		0xc8
> +#define ARM_SMMU_PRIQ_CONS		0xcc
>  #define ARM_SMMU_PRIQ_IRQ_CFG0		0xd0
>  #define ARM_SMMU_PRIQ_IRQ_CFG1		0xd8
>  #define ARM_SMMU_PRIQ_IRQ_CFG2		0xdc
> -- 
> 2.25.1
> 

