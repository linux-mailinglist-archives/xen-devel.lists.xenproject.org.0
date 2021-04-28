Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 195EF36D82D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 15:19:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119340.225790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbk5v-0006H6-DG; Wed, 28 Apr 2021 13:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119340.225790; Wed, 28 Apr 2021 13:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbk5v-0006Gh-9q; Wed, 28 Apr 2021 13:19:11 +0000
Received: by outflank-mailman (input) for mailman id 119340;
 Wed, 28 Apr 2021 13:19:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lbk5u-0006Gb-03
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 13:19:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbk5q-0005vk-NP; Wed, 28 Apr 2021 13:19:06 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbk5q-00033z-FN; Wed, 28 Apr 2021 13:19:06 +0000
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
	bh=DxuBhAX3lsT1hRldIN66Xd0lE8F6yBD/eSoZcZ4kPsQ=; b=19Jl+RA+zXja8MMOYUR3budJ+u
	GdnlKPDLWklTfa59PbB0dCjtqO7epa2x4VBJSav9Wl50lhAgag/3dGfSlN3NP2GmpjOKE50v3/XvA
	gNTkxFKodGjZBVBCQIkTLB2LgdxEdPgPWdsss/JVxNwwuAtij/2jaxCgV6fIvBGOCUU0=;
Subject: Re: [PATCH RESEND v3 1/3] arm,smmu: switch to using iommu_fwspec
 functions
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 rahul.singh@arm.com, brian.woods@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2104131055580.4885@sstabellini-ThinkPad-T480s>
 <20210413175905.15123-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <c3173a62-55ad-389d-0b49-9641f50351a9@xen.org>
Date: Wed, 28 Apr 2021 14:19:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210413175905.15123-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 13/04/2021 18:59, Stefano Stabellini wrote:
> From: Brian Woods <brian.woods@xilinx.com>
> 
> Modify the smmu driver so that it uses the iommu_fwspec helper
> functions.  This means both ARM IOMMU drivers will both use the
> iommu_fwspec helper functions, making enabling generic device tree
> bindings in the SMMU driver much cleaner.
> 
> Signed-off-by: Brian Woods <brian.woods@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Rahul Singh <rahul.singh@arm.com> > ---
>   xen/drivers/passthrough/arm/smmu.c    | 75 ++++++++++++++++++---------
>   xen/drivers/passthrough/device_tree.c |  7 +++
>   2 files changed, 58 insertions(+), 24 deletions(-)

It would be nice to have a changelog. This can help to figure out what 
changes was done in each revision.

> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 3456daa03f..ac75e23268 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -32,6 +32,9 @@
>    *	- 4k and 64k pages, with contiguous pte hints.
>    *	- Up to 48-bit addressing (dependent on VA_BITS)
>    *	- Context fault reporting
> + *
> + * Changes compared to Linux driver:
> + *	- support for fwspec
>    */
>   
>   
> @@ -49,6 +52,7 @@
>   #include <asm/atomic.h>
>   #include <asm/device.h>
>   #include <asm/io.h>
> +#include <asm/iommu_fwspec.h>
>   #include <asm/platform.h>
>   
>   /* Xen: The below defines are redefined within the file. Undef it */
> @@ -615,13 +619,11 @@ struct arm_smmu_smr {
>   
>   struct arm_smmu_master_cfg {
>   	struct arm_smmu_device		*smmu;
> -	int				num_streamids;
> -	u16				streamids[MAX_MASTER_STREAMIDS];
>   	s16				smendx[MAX_MASTER_STREAMIDS];
>   };
>   #define INVALID_SMENDX			-1
> -#define for_each_cfg_sme(cfg, i, idx) \
> -	for (i = 0; idx = cfg->smendx[i], i < cfg->num_streamids; ++i)
> +#define for_each_cfg_sme(cfg, i, idx, num) \
> +	for (i = 0; idx = cfg->smendx[i], i < num; ++i)
>   
>   struct arm_smmu_master {
>   	struct device_node		*of_node;
> @@ -711,6 +713,14 @@ static struct arm_smmu_option_prop arm_smmu_options[] = {
>   	{ 0, NULL},
>   };
>   
> +static inline struct iommu_fwspec *
> +arm_smmu_get_fwspec(struct arm_smmu_master_cfg *cfg)
> +{
> +	struct arm_smmu_master *master = container_of(cfg,
> +			                                      struct arm_smmu_master, cfg);
> +	return dev_iommu_fwspec_get(&master->of_node->dev);
> +}
> +
>   static void parse_driver_options(struct arm_smmu_device *smmu)
>   {
>   	int i = 0;
> @@ -804,8 +814,9 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
>   				struct device *dev,
>   				struct of_phandle_args *masterspec)
>   {
> -	int i;
> +	int i, ret = 0;
>   	struct arm_smmu_master *master;
> +	struct iommu_fwspec *fwspec;
>   
>   	master = find_smmu_master(smmu, masterspec->np);
>   	if (master) {
> @@ -815,24 +826,29 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
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
> +	fwspec = dev_iommu_fwspec_get(dev);
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
> +	for (i = 0; i < fwspec->num_ids; ++i) {
>   		u16 streamid = masterspec->args[i];
>   
>   		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
> @@ -842,9 +858,9 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
>   				masterspec->np->name, smmu->num_mapping_groups);
>   			return -ERANGE;
>   		}
> -		master->cfg.streamids[i] = streamid;
>   		master->cfg.smendx[i] = INVALID_SMENDX;
>   	}
> +

NIT: Spurious line.

>   	return insert_smmu_master(smmu, master);
>   }
>   
> @@ -1498,22 +1514,23 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
>   	struct arm_smmu_device *smmu = cfg->smmu;
>   	struct arm_smmu_smr *smrs = smmu->smrs;
>   	int i, idx, ret;
> +	struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
>   
>   	spin_lock(&smmu->stream_map_lock);
>   	/* Figure out a viable stream map entry allocation */
> -	for_each_cfg_sme(cfg, i, idx) {
> +	for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
>   		if (idx != INVALID_SMENDX) {
>   			ret = -EEXIST;
>   			goto out_err;
>   		}
>   
> -		ret = arm_smmu_find_sme(smmu, cfg->streamids[i], 0);
> +		ret = arm_smmu_find_sme(smmu, fwspec->ids[i], 0);
>   		if (ret < 0)
>   			goto out_err;
>   
>   		idx = ret;
>   		if (smrs && smmu->s2crs[idx].count == 0) {
> -			smrs[idx].id = cfg->streamids[i];
> +			smrs[idx].id = fwspec->ids[i];
>   			smrs[idx].mask = 0; /* We don't currently share SMRs */
>   			smrs[idx].valid = true;
>   		}
> @@ -1522,7 +1539,7 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
>   	}
>   
>   	/* It worked! Now, poke the actual hardware */
> -	for_each_cfg_sme(cfg, i, idx) {
> +	for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
>   		arm_smmu_write_sme(smmu, idx);
>   	}
>   
> @@ -1542,9 +1559,10 @@ static void arm_smmu_master_free_smes(struct arm_smmu_master_cfg *cfg)
>   {
>       struct arm_smmu_device *smmu = cfg->smmu;
>   	int i, idx;
> +	struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
>   
>   	spin_lock(&smmu->stream_map_lock);
> -	for_each_cfg_sme(cfg, i, idx) {
> +	for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
>   		if (arm_smmu_free_sme(smmu, idx))
>   			arm_smmu_write_sme(smmu, idx);
>   		cfg->smendx[i] = INVALID_SMENDX;
> @@ -1560,8 +1578,9 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
>   	enum arm_smmu_s2cr_type type = S2CR_TYPE_TRANS;
>   	u8 cbndx = smmu_domain->cfg.cbndx;
>   	int i, idx;
> +	struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
>   
> -	for_each_cfg_sme(cfg, i, idx) {
> +	for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
>   		if (type == s2cr[idx].type && cbndx == s2cr[idx].cbndx)
>   			continue;
>   
> @@ -1960,6 +1979,7 @@ static int arm_smmu_add_device(struct device *dev)
>   	struct arm_smmu_master_cfg *cfg;
>   	struct iommu_group *group;
>   	void (*releasefn)(void *) = NULL;
> +	int ret;
>   
>   	smmu = find_smmu_for_device(dev);
>   	if (!smmu)
> @@ -1967,19 +1987,26 @@ static int arm_smmu_add_device(struct device *dev)
>   
>   	if (dev_is_pci(dev)) {
>   		struct pci_dev *pdev = to_pci_dev(dev);
> +		struct iommu_fwspec *fwspec;
>   
>   		cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
>   		if (!cfg) {
>   			return -ENOMEM;
>   		}
>   
> -		cfg->num_streamids = 1;
> +		ret = iommu_fwspec_init(dev, smmu->dev);
> +		if (ret) {
> +			kfree(cfg);
> +			return ret;
> +		}
> +		fwspec = dev_iommu_fwspec_get(dev);
> +
>   		/*
>   		 * Assume Stream ID == Requester ID for now.
>   		 * We need a way to describe the ID mappings in FDT.
>   		 */
>   		pci_for_each_dma_alias(pdev, __arm_smmu_get_pci_sid,
> -				       &cfg->streamids[0]);
> +				       &fwspec->ids[0]);
>   		releasefn = __arm_smmu_release_pci_iommudata;
>   		cfg->smmu = smmu;
>   	} else {
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 999b831d90..a51ae3c9c3 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -140,6 +140,13 @@ int iommu_add_dt_device(struct dt_device_node *np)
>       if ( !ops )
>           return -EINVAL;
>   
> +	/*
> +	 * This is needed in case a device has both the iommus property and
> +	 * also apperars in the mmu-masters list.

s/apperars/appears/

> +	 */
> +    if ( dt_device_is_protected(np) )
> +        return 0;
We already have a check dt_device_is_protected() below. So why a second 
one is necessary?

But... as I pointed out in v2, I don't particularly like the idea to 
keep adding hack for the SMMUv{1, 2} in generic code.

In fact what you describe above is nothing different than someone 
calling twice iommu_add_dt_device() on a device. This can already happen 
today because XEN_DOMCTL_assign_device will try to add the device first 
and then assign. So if your VM reboot, iommu_add_dt_device() would 
return -EEXIST.

The code in XEN_DOMCTL_assign_device is already able to deal with 
-EEXIST. So I think the other callers should deal with it. 
Alternatively, I could be convinced to return...

> +
>       if ( dev_iommu_fwspec_get(dev) )
>           return -EEXIST;

... 0 here instead.

Cheers,

-- 
Julien Grall

