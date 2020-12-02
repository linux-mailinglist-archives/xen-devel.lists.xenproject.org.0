Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CE52CB167
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 01:21:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42348.76116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkFsl-0002UC-Er; Wed, 02 Dec 2020 00:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42348.76116; Wed, 02 Dec 2020 00:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkFsl-0002Tn-Bc; Wed, 02 Dec 2020 00:20:31 +0000
Received: by outflank-mailman (input) for mailman id 42348;
 Wed, 02 Dec 2020 00:20:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GudV=FG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kkFsk-0002Tf-CM
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 00:20:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c11489d7-6c4c-4183-9e0f-11cf252e5f22;
 Wed, 02 Dec 2020 00:20:29 +0000 (UTC)
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
X-Inumbo-ID: c11489d7-6c4c-4183-9e0f-11cf252e5f22
Date: Tue, 1 Dec 2020 16:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606868428;
	bh=qyMhDrZnkHAEKbdQSOWunqEA0ieuUB8ftXYMtUKkDa8=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=Xx+DCCJdkqkD6Bo43+XUqHMIF9JmuX0r2XHH8NJd6dDlVRTnKMSqRamN9TNr5tQbK
	 GIrEl7Hbdg/zQF6TUvfV+qivEK6Ib5lV6p7GB/Wfo5xF92udV1pVm3LdHU7gibCTtN
	 d2Em2H5+N5riSZexUJ6vkhYcY7f/SJldbnbqt47w=
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/8] xen/arm: revert patch related to XArray
In-Reply-To: <612c1adabc1c26a539abf0dc05ea20b51e66e85f.1606406359.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2012011620180.1100@sstabellini-ThinkPad-T480s>
References: <cover.1606406359.git.rahul.singh@arm.com> <612c1adabc1c26a539abf0dc05ea20b51e66e85f.1606406359.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Nov 2020, Rahul Singh wrote:
> XArray is not implemented in XEN revert the patch that introduce the
> XArray code in SMMUv3 driver.
> 
> Once XArray is implemented in XEN this patch can be added in XEN.
> 
> Reverted the commit 0299a1a81ca056e79c1a7fb751f936ec0d5c7afe
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 27 +++++++++------------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 97eac61ea4..cec304e51a 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -638,6 +638,7 @@ struct arm_smmu_device {
>  
>  #define ARM_SMMU_MAX_ASIDS		(1 << 16)
>  	unsigned int			asid_bits;
> +	DECLARE_BITMAP(asid_map, ARM_SMMU_MAX_ASIDS);
>  
>  #define ARM_SMMU_MAX_VMIDS		(1 << 16)
>  	unsigned int			vmid_bits;
> @@ -703,8 +704,6 @@ struct arm_smmu_option_prop {
>  	const char *prop;
>  };
>  
> -static DEFINE_XARRAY_ALLOC1(asid_xa);
> -
>  static struct arm_smmu_option_prop arm_smmu_options[] = {
>  	{ ARM_SMMU_OPT_SKIP_PREFETCH, "hisilicon,broken-prefetch-cmd" },
>  	{ ARM_SMMU_OPT_PAGE0_REGS_ONLY, "cavium,cn9900-broken-page1-regspace"},
> @@ -1366,14 +1365,6 @@ static void arm_smmu_free_cd_tables(struct arm_smmu_domain *smmu_domain)
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
> @@ -2006,9 +1997,10 @@ static void arm_smmu_domain_free(struct iommu_domain *domain)
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
> @@ -2023,15 +2015,14 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
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
> @@ -2064,7 +2055,7 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
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

