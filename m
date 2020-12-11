Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9058F2D6D81
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 02:28:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50010.88456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knXEV-0005gs-NY; Fri, 11 Dec 2020 01:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50010.88456; Fri, 11 Dec 2020 01:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knXEV-0005gD-JB; Fri, 11 Dec 2020 01:28:31 +0000
Received: by outflank-mailman (input) for mailman id 50010;
 Fri, 11 Dec 2020 01:28:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZKjA=FP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knXEU-0005fg-Kh
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 01:28:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11b4fba2-6a62-49e6-ad3a-2fc04b26061f;
 Fri, 11 Dec 2020 01:28:29 +0000 (UTC)
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
X-Inumbo-ID: 11b4fba2-6a62-49e6-ad3a-2fc04b26061f
Date: Thu, 10 Dec 2020 17:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607650108;
	bh=MD8MZlK61mbrRNToR8OyiHXQadaLJYv/gx2kWam42NE=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=JmY5KvRgQluqLPdGuU2taLyrAwFT472aMRHf/i75MUjrFc1ZEfCR95NgeRQ3TagFV
	 hYZKyy0du7kNZ3rBRHzpTI/SCm0kR92iPGuJz9jgAXX547BQj5tkUlrBSbHuAAuLS+
	 kW4zsylGMhsdPr/CKzZeRVjI0Wl1Tw+LQx4gfZbO1OtB0eYBcPWXax+TVcCnxD2aW7
	 /UjQX0tabTZJqXiAORxoK3thDHmVqa3lkJrp3plBMVOcwfL0nD9VutvNNidk4/CHfr
	 mxsBicPgxwNmrhZC8yOD1xhEv/IX6vL/2jjNqP2oD5yRRBJxqBooqQ61j4ttc3HLQ/
	 qGI+gf9UmV1ag==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/8] xen/arm: revert patch related to XArray
In-Reply-To: <ca988f0f6c66a2e35d06c07e226d0145c1320611.1607617848.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2012101529400.6285@sstabellini-ThinkPad-T480s>
References: <cover.1607617848.git.rahul.singh@arm.com> <ca988f0f6c66a2e35d06c07e226d0145c1320611.1607617848.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Dec 2020, Rahul Singh wrote:
> XArray is not implemented in XEN revert the patch that introduce the
> XArray code in SMMUv3 driver.
> 
> XArray is added in preparation for sharing some ASIDs with the CPU,
> 
> As XEN support only Stage-2 translation, ASID is used for Stage-1
> translation there is no consequences of reverting this patch for XEN.
> 
> Once XArray is implemented in XEN this patch can be added in XEN if XEN
> supports Stage-1 translation.
> 
> Reverted the commit 0299a1a81ca056e79c1a7fb751f936ec0d5c7afe
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3:
>  - Added consequences of reverting this patch in commit message
> 
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 27 +++++++++------------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 8b7747ed38..7b29ead48c 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -625,6 +625,7 @@ struct arm_smmu_device {
>  
>  #define ARM_SMMU_MAX_ASIDS		(1 << 16)
>  	unsigned int			asid_bits;
> +	DECLARE_BITMAP(asid_map, ARM_SMMU_MAX_ASIDS);
>  
>  #define ARM_SMMU_MAX_VMIDS		(1 << 16)
>  	unsigned int			vmid_bits;
> @@ -690,8 +691,6 @@ struct arm_smmu_option_prop {
>  	const char *prop;
>  };
>  
> -static DEFINE_XARRAY_ALLOC1(asid_xa);
> -
>  static struct arm_smmu_option_prop arm_smmu_options[] = {
>  	{ ARM_SMMU_OPT_SKIP_PREFETCH, "hisilicon,broken-prefetch-cmd" },
>  	{ ARM_SMMU_OPT_PAGE0_REGS_ONLY, "cavium,cn9900-broken-page1-regspace"},
> @@ -1346,14 +1345,6 @@ static void arm_smmu_free_cd_tables(struct arm_smmu_domain *smmu_domain)
>  	cdcfg->cdtab = NULL;
>  }
>  
> -static void arm_smmu_free_asid(struct arm_smmu_ctx_desc *cd)
> -{
> -	if (!cd->asid)
> -		return;
> -
> -	xa_erase(&asid_xa, cd->asid);
> -}
> -
>  /* Stream table manipulation functions */
>  static void
>  arm_smmu_write_strtab_l1_desc(__le64 *dst, struct arm_smmu_strtab_l1_desc *desc)
> @@ -1988,9 +1979,10 @@ static void arm_smmu_domain_free(struct iommu_domain *domain)
>  	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
>  		struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
>  
> -		if (cfg->cdcfg.cdtab)
> +		if (cfg->cdcfg.cdtab) {
>  			arm_smmu_free_cd_tables(smmu_domain);
> -		arm_smmu_free_asid(&cfg->cd);
> +			arm_smmu_bitmap_free(smmu->asid_map, cfg->cd.asid);
> +		}
>  	} else {
>  		struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
>  		if (cfg->vmid)
> @@ -2005,15 +1997,14 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
>  				       struct io_pgtable_cfg *pgtbl_cfg)
>  {
>  	int ret;
> -	u32 asid;
> +	int asid;
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
>  	typeof(&pgtbl_cfg->arm_lpae_s1_cfg.tcr) tcr = &pgtbl_cfg->arm_lpae_s1_cfg.tcr;
>  
> -	ret = xa_alloc(&asid_xa, &asid, &cfg->cd,
> -		       XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL);
> -	if (ret)
> -		return ret;
> +	asid = arm_smmu_bitmap_alloc(smmu->asid_map, smmu->asid_bits);
> +	if (asid < 0)
> +		return asid;
>  
>  	cfg->s1cdmax = master->ssid_bits;
>  
> @@ -2046,7 +2037,7 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
>  out_free_cd_tables:
>  	arm_smmu_free_cd_tables(smmu_domain);
>  out_free_asid:
> -	arm_smmu_free_asid(&cfg->cd);
> +	arm_smmu_bitmap_free(smmu->asid_map, asid);
>  	return ret;
>  }
>  
> -- 
> 2.17.1
> 

