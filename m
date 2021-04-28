Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D20636D839
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 15:24:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119352.225814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbkAr-0007G4-CB; Wed, 28 Apr 2021 13:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119352.225814; Wed, 28 Apr 2021 13:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbkAr-0007Ff-97; Wed, 28 Apr 2021 13:24:17 +0000
Received: by outflank-mailman (input) for mailman id 119352;
 Wed, 28 Apr 2021 13:24:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lbkAp-0007Fa-On
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 13:24:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbkAn-000619-Sk; Wed, 28 Apr 2021 13:24:13 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbkAn-0003jb-Lr; Wed, 28 Apr 2021 13:24:13 +0000
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
	bh=BfmwjtxpTqfULQSOpPgJAWr61uzi2QVJe+BRWGqYGWE=; b=QyjmcsBrKzFba7di+1RG0GXkbX
	QU0rF0H9GOgsu1pGaZchZBi4ijmxjiGpRddR4aNwDRVB/4K0iY+ovi28lXeWG/UKoIAKmcxThDeEg
	hOVRSGBPJH/9U4E1nAC8bTq5CVDpwhDQ9rQBLrjAzxvRfpXYYxmOhMdUY3MxAMUoaEyo=;
Subject: Re: [PATCH RESEND v3 2/3] arm,smmu: restructure code in preparation
 to new bindings support
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 rahul.singh@arm.com, brian.woods@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2104131055580.4885@sstabellini-ThinkPad-T480s>
 <20210413175905.15123-2-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <c412eb38-8fdf-3d12-7e38-2e5eddcd7285@xen.org>
Date: Wed, 28 Apr 2021 14:24:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210413175905.15123-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 13/04/2021 18:59, Stefano Stabellini wrote:
> From: Brian Woods <brian.woods@xilinx.com>
> 
> Restructure some of the code and add supporting functions for adding
> generic device tree (DT) binding support.  This will allow for using
> current Linux device trees with just modifying the chosen field to
> enable Xen.
> 
> Signed-off-by: Brian Woods <brian.woods@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/drivers/passthrough/arm/smmu.c | 62 +++++++++++++++++-------------
>   1 file changed, 35 insertions(+), 27 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index ac75e23268..f949c110ad 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -810,52 +810,36 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
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
> -	struct iommu_fwspec *fwspec;
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
> -
> -	ret = iommu_fwspec_init(&master->of_node->dev, smmu->dev);
> -	if (ret) {
> -		kfree(master);
> -		return ret;
> -	}
> -	fwspec = dev_iommu_fwspec_get(dev);
> -
> -	/* adding the ids here */
> -	ret = iommu_fwspec_add_ids(&masterspec->np->dev,
> -				   masterspec->args,
> -				   masterspec->args_count);
> -	if (ret)
> -		return ret;
> +	master->of_node = dev_node;
>   
>   	/* Xen: Let Xen know that the device is protected by an SMMU */
> -	dt_device_set_protected(masterspec->np);
> +	dt_device_set_protected(dev_node);
>   
>   	for (i = 0; i < fwspec->num_ids; ++i) {
> -		u16 streamid = masterspec->args[i];
> -
>   		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
> -		     (streamid >= smmu->num_mapping_groups)) {
> +		     (fwspec->ids[i] >= smmu->num_mapping_groups)) {
>   			dev_err(dev,
>   				"stream ID for master device %s greater than maximum allowed (%d)\n",
> -				masterspec->np->name, smmu->num_mapping_groups);
> +				dev_node->name, smmu->num_mapping_groups);
>   			return -ERANGE;
>   		}
>   		master->cfg.smendx[i] = INVALID_SMENDX;
> @@ -864,6 +848,30 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
>   	return insert_smmu_master(smmu, master);
>   }
>   
> +static int register_smmu_master(struct arm_smmu_device *smmu,
> +				struct device *dev,
> +				struct of_phandle_args *masterspec)
> +{
> +	int ret = 0;
> +	struct iommu_fwspec *fwspec;
> +
> +	ret = iommu_fwspec_init(&masterspec->np->dev, smmu->dev);
> +	if (ret)
> +		return ret;
> +
> +	fwspec = dev_iommu_fwspec_get(&masterspec->np->dev);
> +
> +	ret = iommu_fwspec_add_ids(&masterspec->np->dev,
> +				   masterspec->args,
> +				   masterspec->args_count);
> +	if (ret)
> +		return ret;
> +
> +	return arm_smmu_dt_add_device_legacy(smmu,
> +					     &masterspec->np->dev,
> +					     fwspec);
> +}
> +
>   static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
>   {
>   	struct arm_smmu_device *smmu;
> 

-- 
Julien Grall

