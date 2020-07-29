Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B1B232706
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 23:38:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0tlx-000082-9Y; Wed, 29 Jul 2020 21:38:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hQvr=BI=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k0tlw-00007i-3D
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 21:38:00 +0000
X-Inumbo-ID: c4cfa557-d1e3-11ea-aa68-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4cfa557-d1e3-11ea-aa68-12813bfff9fa;
 Wed, 29 Jul 2020 21:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NTLuQuHmN+ZPuU1Qs58GQHwETFBehkSexxez9KdpQAM=; b=PfY69rbPxpUq8llAzouTy0NkxL
 WUTy4wdSefXgY/qPyC+Phm3TEiPz9kGaFyiN/mV0BZYgjzkLB08KmmeS1O/SCllyhBLdc8qyn5VxE
 krk55BuJHnsdZj/di7ezLSsY+HcOfcbexno3MpJWUc/L2Ax/Cb44m2woWetzixy+//xg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0tlt-0002rv-4p; Wed, 29 Jul 2020 21:37:57 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k0tls-0007Rh-PB; Wed, 29 Jul 2020 21:37:57 +0000
Subject: Re: [RFC v2 2/2] arm,smmu: add support for generic DT bindings
To: Brian Woods <brian.woods@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <1595390431-24805-1-git-send-email-brian.woods@xilinx.com>
 <1595390431-24805-3-git-send-email-brian.woods@xilinx.com>
From: Julien Grall <julien@xen.org>
Message-ID: <854e0671-898d-1a78-3dfd-92d8f6b82348@xen.org>
Date: Wed, 29 Jul 2020 22:37:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595390431-24805-3-git-send-email-brian.woods@xilinx.com>
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
> Restructure some of the code and add supporting functions for adding
> generic device tree (DT) binding support.  

It feels to me you want to split the patch in two:
    1) Restructure the code
    2) Add support for DT bindings

> This will allow for using
> current Linux device trees with just modifying the chosen field to
> enable Xen.

So what happen if the legacy binding and generic bindings co-exist. 
Which one will be used?

> 
> Signed-off-by: Brian Woods <brian.woods@xilinx.com>
> ---
> 
> Just realized that I'm fairly sure I need to do some work on the SMRs.
> Other than that though, I think things should be okayish.

The SMMU code in Xen is pretty awful (I know I adapted it for Xen). It 
would be hard to make it worse :).

> 
> v1 -> v2
>      - Corrected how reading of DT is done with generic bindings
> 
> 
>   xen/drivers/passthrough/arm/smmu.c    | 102 +++++++++++++++++++++++++---------
>   xen/drivers/passthrough/device_tree.c |  17 +-----
>   2 files changed, 78 insertions(+), 41 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 7a5c6cd..25c090a 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -251,6 +251,8 @@ struct iommu_group
>   	atomic_t ref;
>   };
>   
> +static const struct arm_smmu_device *find_smmu(const struct device *dev);
> +
>   static struct iommu_group *iommu_group_alloc(void)
>   {
>   	struct iommu_group *group = xzalloc(struct iommu_group);
> @@ -772,56 +774,104 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
>   	return 0;
>   }
>   
> -static int register_smmu_master(struct arm_smmu_device *smmu,
> -				struct device *dev,
> -				struct of_phandle_args *masterspec)
> +static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
> +					 struct device *dev,
> +					 struct iommu_fwspec *fwspec)
>   {
> -	int i, ret = 0;
> +	int i;
>   	struct arm_smmu_master *master;
> +	struct device_node *dev_node = dev_get_dev_node(dev);
>   
> -	master = find_smmu_master(smmu, masterspec->np);
> +	master = find_smmu_master(smmu, dev_node);
>   	if (master) {
>   		dev_err(dev,
>   			"rejecting multiple registrations for master device %s\n",
> -			masterspec->np->name);
> +			dev_node->name);
>   		return -EBUSY;
>   	}
>   
>   	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
>   	if (!master)
>   		return -ENOMEM;
> -	master->of_node = masterspec->np;
>   
> -	ret = iommu_fwspec_init(&master->of_node->dev, smmu->dev);
> -	if (ret) {
> -		kfree(master);
> -		return ret;
> -	}
> -	master->cfg.fwspec = dev_iommu_fwspec_get(&master->of_node->dev);
> -
> -	/* adding the ids here */
> -	ret = iommu_fwspec_add_ids(&masterspec->np->dev,
> -				   masterspec->args,
> -				   masterspec->args_count);
> -	if (ret)
> -		return ret;
> +	master->of_node = dev_node;
> +	master->cfg.fwspec = fwspec;
>   
>   	/* Xen: Let Xen know that the device is protected by an SMMU */
> -	dt_device_set_protected(masterspec->np);
> +	dt_device_set_protected(dev_node);
>   
>   	if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH)) {
> -		for (i = 0; i < master->cfg.fwspec->num_ids; ++i) {
> -			if (masterspec->args[i] >= smmu->num_mapping_groups) {
> +		for (i = 0; i < fwspec->num_ids; ++i) {
> +			if (fwspec->ids[i] >= smmu->num_mapping_groups) {
>   				dev_err(dev,
>   					"stream ID for master device %s greater than maximum allowed (%d)\n",
> -					masterspec->np->name, smmu->num_mapping_groups);
> +					dev_node->name, smmu->num_mapping_groups);
>   				return -ERANGE;
>   			}
>   		}
>   	}
> +
>   	return insert_smmu_master(smmu, master);
>   }
>   
> +static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
> +{
> +	struct arm_smmu_device *smmu;
> +	struct iommu_fwspec *fwspec;
> +
> +	fwspec = dev_iommu_fwspec_get(dev);
> +	if (fwspec == NULL)
> +		return -ENXIO;
> +
> +	smmu = (struct arm_smmu_device *) find_smmu(fwspec->iommu_dev)

Please don't use explicit cast to remove a const. If you need 
find_smmu() to return a non-const value, then you should drop the const 
from the return function.


> +	if (smmu == NULL)
> +		return -ENXIO;
> +
> +	return arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);

This feels a bit odd to me to call a "legacy" function from a "generic" 
call. How about remove "legacy" from the function name?

> +}
> +
> +static int arm_smmu_dt_xlate_generic(struct device *dev,
> +				    const struct of_phandle_args *spec)

Please use dt_phandle_args to stay consistent with the naming and the 
fact the code is mostly Xen specific (though derived from Linux).

>   
> -static __init const struct arm_smmu_device *find_smmu(const struct device *dev)
> +static const struct arm_smmu_device *find_smmu(const struct device *dev)
>   {
>   	struct arm_smmu_device *smmu;
>   	bool found = false;
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index acf6b62..dd9cf65 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -158,22 +158,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
>            * these callback implemented.
>            */
>           if ( !ops->add_device || !ops->dt_xlate )
> -        {
> -            /*
> -             * Some Device Trees may expose both legacy SMMU and generic
> -             * IOMMU bindings together. However, the SMMU driver is only
> -             * supporting the former and will protect them during the
> -             * initialization. So we need to skip them and not return
> -             * error here.
> -             *
> -             * XXX: This can be dropped when the SMMU is able to deal
> -             * with generic bindings.
> -             */
> -            if ( dt_device_is_protected(np) )
> -                return 0;
> -            else
> -                return -EINVAL;
> -        }

I would add a comment in the commit message explaining the hack in 
iommu_add_dt_device() can be removed.

> +            return -EINVAL;
>   
>           if ( !dt_device_is_available(iommu_spec.np) )
>               break;
> 

Cheers,


-- 
Julien Grall

