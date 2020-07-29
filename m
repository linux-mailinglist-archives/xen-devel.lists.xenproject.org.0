Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E9B23269F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 23:09:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0tJS-00063m-SN; Wed, 29 Jul 2020 21:08:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hQvr=BI=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k0tJS-00063h-1i
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 21:08:34 +0000
X-Inumbo-ID: a81d9e30-d1df-11ea-aa66-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a81d9e30-d1df-11ea-aa66-12813bfff9fa;
 Wed, 29 Jul 2020 21:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zVpYACbU4MPht8AlhKCnilCOtSu+EU/xz3z2jevWnEY=; b=Bc0Kh2nJPje5D4sBton4IptPVi
 nL2DdlPls1y+HuNQXXJ8vbWKPbSKDef9miGnLv2mafd8iYOQ7Lxv1e8932uCKa+TY5MqVYDie/+89
 e+Yo04N4vx136D6lRSzPl95tvorztmMfwzTBpOMDOf5FpQ0+a0lixe7lJ6+Pn/p6Ms9o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0tJO-0002GY-II; Wed, 29 Jul 2020 21:08:30 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0tJO-0005fQ-5c; Wed, 29 Jul 2020 21:08:30 +0000
Subject: Re: [RFC v2 1/2] arm,smmu: switch to using iommu_fwspec functions
To: Brian Woods <brian.woods@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <1595390431-24805-1-git-send-email-brian.woods@xilinx.com>
 <1595390431-24805-2-git-send-email-brian.woods@xilinx.com>
From: Julien Grall <julien@xen.org>
Message-ID: <572599f3-8abf-4be5-3840-73665557c631@xen.org>
Date: Wed, 29 Jul 2020 22:08:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595390431-24805-2-git-send-email-brian.woods@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Brian,

On 22/07/2020 05:00, Brian Woods wrote:
> Modify the smmu driver so that it uses the iommu_fwspec helper
> functions.  This means both ARM IOMMU drivers will both use the
> iommu_fwspec helper functions.
> 
> Signed-off-by: Brian Woods <brian.woods@xilinx.com>
> ---
> 
> Interested in if combining the legacy and generic bindings paths are
> worth or if Xen plans to depreicate legacy bindings at some point.

The legacy binding is technically already deprecated in Linux. However, 
I don't think we can remove it completely until Linux does it.

Ideally, I would like the legacy master to be probed as part of 
add_device rather than when the IOMMU initialization (see more below).


> v1 -> v2
>      - removed MAX_MASTER_STREAMIDS
>      - removed unneeded curly brackets
> 
>   xen/drivers/passthrough/arm/smmu.c    | 81 +++++++++++++++++++----------------
>   xen/drivers/passthrough/device_tree.c |  3 ++
>   2 files changed, 47 insertions(+), 37 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 94662a8..7a5c6cd 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -49,6 +49,7 @@
>   #include <asm/atomic.h>
>   #include <asm/device.h>
>   #include <asm/io.h>
> +#include <asm/iommu_fwspec.h>
>   #include <asm/platform.h>
>   
>   /* Xen: The below defines are redefined within the file. Undef it */
> @@ -302,9 +303,6 @@ static struct iommu_group *iommu_group_get(struct device *dev)
>   
>   /***** Start of Linux SMMU code *****/
>   
> -/* Maximum number of stream IDs assigned to a single device */
> -#define MAX_MASTER_STREAMIDS		MAX_PHANDLE_ARGS
> -
>   /* Maximum number of context banks per SMMU */
>   #define ARM_SMMU_MAX_CBS		128
>   
> @@ -597,8 +595,7 @@ struct arm_smmu_smr {
>   };
>   
>   struct arm_smmu_master_cfg {
> -	int				num_streamids;
> -	u16				streamids[MAX_MASTER_STREAMIDS];
> +	struct iommu_fwspec		*fwspec;
>   	struct arm_smmu_smr		*smrs;
>   };
>   
> @@ -779,7 +776,7 @@ static int register_smmu_master(struct arm_smmu_device *smmu,

We originally intended to keep the SMMU driver as close as possible to 
Linux. It turns out to be quite difficult as they reworked a fair bit 
the IOMMU subsystem. Although, I would still like to document the change 
we made in the code.

Could you add a comment maybe at the top of file to mention you added 
support for fwspec?

>   				struct device *dev,
>   				struct of_phandle_args *masterspec)
>   {
> -	int i;
> +	int i, ret = 0;
>   	struct arm_smmu_master *master;
>   
>   	master = find_smmu_master(smmu, masterspec->np);
> @@ -790,34 +787,37 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
>   		return -EBUSY;
>   	}
>   
> -	if (masterspec->args_count > MAX_MASTER_STREAMIDS) {
> -		dev_err(dev,
> -			"reached maximum number (%d) of stream IDs for master device %s\n",
> -			MAX_MASTER_STREAMIDS, masterspec->np->name);
> -		return -ENOSPC;
> -	}
> -
>   	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
>   	if (!master)
>   		return -ENOMEM;
> +	master->of_node = masterspec->np;
>   
> -	master->of_node			= masterspec->np;
> -	master->cfg.num_streamids	= masterspec->args_count;
> +	ret = iommu_fwspec_init(&master->of_node->dev, smmu->dev);
> +	if (ret) {
> +		kfree(master);
> +		return ret;
> +	}
> +	master->cfg.fwspec = dev_iommu_fwspec_get(&master->of_node->dev);
> +
> +	/* adding the ids here */
> +	ret = iommu_fwspec_add_ids(&masterspec->np->dev,
> +				   masterspec->args,
> +				   masterspec->args_count);
> +	if (ret)
> +		return ret;
>   
>   	/* Xen: Let Xen know that the device is protected by an SMMU */
>   	dt_device_set_protected(masterspec->np);
>   
> -	for (i = 0; i < master->cfg.num_streamids; ++i) {
> -		u16 streamid = masterspec->args[i];
> -
> -		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
> -		     (streamid >= smmu->num_mapping_groups)) {
> -			dev_err(dev,
> -				"stream ID for master device %s greater than maximum allowed (%d)\n",
> -				masterspec->np->name, smmu->num_mapping_groups);
> -			return -ERANGE;
> +	if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH)) {
> +		for (i = 0; i < master->cfg.fwspec->num_ids; ++i) {
> +			if (masterspec->args[i] >= smmu->num_mapping_groups) {
> +				dev_err(dev,
> +					"stream ID for master device %s greater than maximum allowed (%d)\n",
> +					masterspec->np->name, smmu->num_mapping_groups);
> +				return -ERANGE;
> +			}
>   		}
> -		master->cfg.streamids[i] = streamid;
>   	}
>   	return insert_smmu_master(smmu, master);
>   }
> @@ -1397,15 +1397,15 @@ static int arm_smmu_master_configure_smrs(struct arm_smmu_device *smmu,
>   	if (cfg->smrs)
>   		return -EEXIST;
>   
> -	smrs = kmalloc_array(cfg->num_streamids, sizeof(*smrs), GFP_KERNEL);
> +	smrs = kmalloc_array(cfg->fwspec->num_ids, sizeof(*smrs), GFP_KERNEL);
>   	if (!smrs) {
>   		dev_err(smmu->dev, "failed to allocate %d SMRs\n",
> -			cfg->num_streamids);
> +			cfg->fwspec->num_ids);
>   		return -ENOMEM;
>   	}
>   
>   	/* Allocate the SMRs on the SMMU */
> -	for (i = 0; i < cfg->num_streamids; ++i) {
> +	for (i = 0; i < cfg->fwspec->num_ids; ++i) {
>   		int idx = __arm_smmu_alloc_bitmap(smmu->smr_map, 0,
>   						  smmu->num_mapping_groups);
>   		if (IS_ERR_VALUE(idx)) {
> @@ -1416,12 +1416,12 @@ static int arm_smmu_master_configure_smrs(struct arm_smmu_device *smmu,
>   		smrs[i] = (struct arm_smmu_smr) {
>   			.idx	= idx,
>   			.mask	= 0, /* We don't currently share SMRs */
> -			.id	= cfg->streamids[i],
> +			.id	= cfg->fwspec->ids[i],
>   		};
>   	}
>   
>   	/* It worked! Now, poke the actual hardware */
> -	for (i = 0; i < cfg->num_streamids; ++i) {
> +	for (i = 0; i < cfg->fwspec->num_ids; ++i) {
>   		u32 reg = SMR_VALID | smrs[i].id << SMR_ID_SHIFT |
>   			  smrs[i].mask << SMR_MASK_SHIFT;
>   		writel_relaxed(reg, gr0_base + ARM_SMMU_GR0_SMR(smrs[i].idx));
> @@ -1448,7 +1448,7 @@ static void arm_smmu_master_free_smrs(struct arm_smmu_device *smmu,
>   		return;
>   
>   	/* Invalidate the SMRs before freeing back to the allocator */
> -	for (i = 0; i < cfg->num_streamids; ++i) {
> +	for (i = 0; i < cfg->fwspec->num_ids; ++i) {
>   		u8 idx = smrs[i].idx;
>   
>   		writel_relaxed(~SMR_VALID, gr0_base + ARM_SMMU_GR0_SMR(idx));
> @@ -1471,10 +1471,10 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
>   	if (ret)
>   		return ret == -EEXIST ? 0 : ret;
>   
> -	for (i = 0; i < cfg->num_streamids; ++i) {
> +	for (i = 0; i < cfg->fwspec->num_ids; ++i) {
>   		u32 idx, s2cr;
>   
> -		idx = cfg->smrs ? cfg->smrs[i].idx : cfg->streamids[i];
> +		idx = cfg->smrs ? cfg->smrs[i].idx : cfg->fwspec->ids[i];
>   		s2cr = S2CR_TYPE_TRANS |
>   		       (smmu_domain->cfg.cbndx << S2CR_CBNDX_SHIFT);
>   		writel_relaxed(s2cr, gr0_base + ARM_SMMU_GR0_S2CR(idx));
> @@ -1499,8 +1499,8 @@ static void arm_smmu_domain_remove_master(struct arm_smmu_domain *smmu_domain,
>   	 * that it can be re-allocated immediately.
>   	 * Xen: Unlike Linux, any access to non-configured stream will fault.
>   	 */
> -	for (i = 0; i < cfg->num_streamids; ++i) {
> -		u32 idx = cfg->smrs ? cfg->smrs[i].idx : cfg->streamids[i];
> +	for (i = 0; i < cfg->fwspec->num_ids; ++i) {
> +		u32 idx = cfg->smrs ? cfg->smrs[i].idx : cfg->fwspec->ids[i];
>   
>   		writel_relaxed(S2CR_TYPE_FAULT,
>   			       gr0_base + ARM_SMMU_GR0_S2CR(idx));
> @@ -1924,14 +1924,21 @@ static int arm_smmu_add_device(struct device *dev)
>   			ret = -ENOMEM;
>   			goto out_put_group;
>   		}
> +		cfg->fwspec = kzalloc(sizeof(struct iommu_fwspec), GFP_KERNEL);
> +		if (!cfg->fwspec) {
> +			kfree(cfg);
> +			ret = -ENOMEM;
> +			goto out_put_group;
> +		}
> +		iommu_fwspec_init(dev, smmu->dev);
>   
> -		cfg->num_streamids = 1;
> +		cfg->fwspec->num_ids = 1;
>   		/*
>   		 * Assume Stream ID == Requester ID for now.
>   		 * We need a way to describe the ID mappings in FDT.
>   		 */
>   		pci_for_each_dma_alias(pdev, __arm_smmu_get_pci_sid,
> -				       &cfg->streamids[0]);
> +				       &cfg->fwspec->ids[0]);
>   		releasefn = __arm_smmu_release_pci_iommudata;
>   	} else {
>   		struct arm_smmu_master *master;
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 999b831..acf6b62 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -140,6 +140,9 @@ int iommu_add_dt_device(struct dt_device_node *np)
>       if ( !ops )
>           return -EINVAL;
>   
> +    if ( dt_device_is_protected(np) )
> +        return 0;

With the fwspec in place, I would have hoped we can remove an specific 
hack for the SMMU in the generic DT code. Could you instead explore 
whether it is possible to initialize the legacy master from add_device?

> +
>       if ( dev_iommu_fwspec_get(dev) )
>           return -EEXIST;
>   
> 

-- 
Julien Grall

