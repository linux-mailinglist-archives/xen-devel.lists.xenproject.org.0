Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4AF2EFBCA
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 00:44:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63918.113297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky1Q8-000657-Sm; Fri, 08 Jan 2021 23:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63918.113297; Fri, 08 Jan 2021 23:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky1Q8-00064h-PR; Fri, 08 Jan 2021 23:43:52 +0000
Received: by outflank-mailman (input) for mailman id 63918;
 Fri, 08 Jan 2021 23:43:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkaL=GL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ky1Q6-00064X-KN
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 23:43:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e8ba0d8-a232-4bbc-a7f9-55be6c11f4e1;
 Fri, 08 Jan 2021 23:43:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B834620786;
 Fri,  8 Jan 2021 23:43:48 +0000 (UTC)
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
X-Inumbo-ID: 3e8ba0d8-a232-4bbc-a7f9-55be6c11f4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610149429;
	bh=7f49tMoZ7QvzEZfZSGGly4F/yZSTG1BlciQYxtT4cfw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XrZDWEJPZUpRB1PKWzafJn0PmKLm9vY16PEAtEpSBX7g1w9PlLVEG0Uo780g+IS0/
	 uwY9rma7gXl+PBQR3Ken2YAns4rfBaN/C3Xu4tWPUXGiaS7pHwD6ckdGTMU3mA7Hxu
	 2siG9Ybp1qDw3waqtChsWX8kUcTTFNMjYYnEZIb5BwANNIUjoPLApKM2VncimXUELw
	 5c8ARJSeIeXqpOfJ+B/p2//xQd5z/zGeCMTD+5ddLGSSFulT6tRZ209BSleQHjTLSq
	 ERNM4VrlROX6rvZkeJmmP4vvvUV5C4zV+SuGsJGri2tVBaHYarRhVZ54Ek5pQ9UfIH
	 bhm/137SziDVg==
Date: Fri, 8 Jan 2021 15:43:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 03/11] xen/arm: smmuv3: Revert patch related to
 XArray
In-Reply-To: <d634c8f020c2d5af458f6055fc4cc15eba6ca02c.1610115608.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2101081543410.26153@sstabellini-ThinkPad-T480s>
References: <cover.1610115608.git.rahul.singh@arm.com> <d634c8f020c2d5af458f6055fc4cc15eba6ca02c.1610115608.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Jan 2021, Rahul Singh wrote:
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
> Changes in V3:
> - Added consequences of reverting this patch in commit message
> Changes in V4: Rebase
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

