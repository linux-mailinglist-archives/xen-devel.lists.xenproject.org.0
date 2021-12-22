Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A903647D3AF
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 15:32:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250859.432068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n02eY-0002vQ-Vh; Wed, 22 Dec 2021 14:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250859.432068; Wed, 22 Dec 2021 14:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n02eY-0002td-SW; Wed, 22 Dec 2021 14:31:38 +0000
Received: by outflank-mailman (input) for mailman id 250859;
 Wed, 22 Dec 2021 14:31:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n02eX-0002tT-95
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 14:31:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n02eW-0005vM-S2; Wed, 22 Dec 2021 14:31:36 +0000
Received: from [54.239.6.186] (helo=[192.168.17.226])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n02eW-0001DW-2Y; Wed, 22 Dec 2021 14:31:36 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ZK9BKjudfEPQRMxjMcW++g5OisrGBve3vjozfNesKrQ=; b=30G4UTKHrnf+CFPGpuqBHpbDVs
	p+AHYZWHcXs3c1d1AbYZOF4DFsoogV7DRnAGVgRIDks/BnBB8k6w8RfvORhRKDAREtYVehLMcHmd8
	CgHCO+5FFjzNy0frNLO/RnRCqBprLKHb7s/9Itqs63dGPcoXNAHw5Vzsc3lBEiU4guzQ=;
Message-ID: <c8b48110-1410-6134-1584-3852eae6217b@xen.org>
Date: Wed, 22 Dec 2021 15:31:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [XEN][RFC PATCH v2 06/12] xen/smmu: Add remove_device callback
 for smmu_iommu ops
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
 <1636441347-133850-7-git-send-email-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1636441347-133850-7-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/11/2021 08:02, Vikram Garhwal wrote:
> Add remove_device callback for removing the device entry from smmu-master using
> following steps:
> 1. Find if SMMU master exists for the device node.
> 2. Remove the SMMU master
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>   xen/drivers/passthrough/arm/smmu.c | 54 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index c9dfc4c..1a32e2c 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -816,6 +816,17 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
>   	return 0;
>   }
>   
> +static int remove_smmu_master(struct arm_smmu_device *smmu,
> +			      struct arm_smmu_master *master)
> +{
> +	if (!(smmu->masters.rb_node))

Coding style: The inner () are not necessary.

Also, is this check only there for code hardening purpose? If yes, then 
I would add an ASSERT_UNREACHABLE() in the if body to allow catching the 
error in debug build.

> +		return -ENOENT;
> +
> +	rb_erase(&master->node, &smmu->masters);
> +
> +	return 0;
> +}
> +
>   static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
>   					 struct device *dev,
>   					 struct iommu_fwspec *fwspec)
> @@ -853,6 +864,32 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
>   	return insert_smmu_master(smmu, master);
>   }
>   
> +static int arm_smmu_dt_remove_device_legacy(struct arm_smmu_device *smmu,
> +					 struct device *dev)
> +{
> +	struct arm_smmu_master *master;
> +	struct device_node *dev_node = dev_get_dev_node(dev);
> +	int ret;
> +
> +	master = find_smmu_master(smmu, dev_node);
> +	if (master == NULL) {
> +		dev_err(dev,
> +			"No registrations found for master device %s\n",
> +			dev_node->name);
> +		return -EINVAL;
> +	}

Even if the IOMMU subsystem check it, it would be good that the SMMU 
driver also check the device is not currently used before removing it.

If it is, then we should return -EBUSY.

> +
> +	ret = remove_smmu_master(smmu, master);
> +
> +	if (ret)
> +		return ret;
> +
> +    dev_node->is_protected = false;

Coding style: The indentation looks off compare to the other line.

> +
> +	kfree(master);
> +	return 0;
> +}
> +
>   static int register_smmu_master(struct arm_smmu_device *smmu,
>   				struct device *dev,
>   				struct of_phandle_args *masterspec)
> @@ -876,6 +913,22 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
>   					     fwspec);
>   }
>   
> +static int arm_smmu_dt_remove_device_generic(u8 devfn, struct device *dev)
> +{
> +	struct arm_smmu_device *smmu;
> +	struct iommu_fwspec *fwspec;
> +
> +	fwspec = dev_iommu_fwspec_get(dev);
> +	if (fwspec == NULL)
> +		return -ENXIO;
> +
> +	smmu = find_smmu(fwspec->iommu_dev);
> +	if (smmu == NULL)
> +		return -ENXIO;
> +
> +	return arm_smmu_dt_remove_device_legacy(smmu, dev);
> +}
> +
>   static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
>   {
>   	struct arm_smmu_device *smmu;
> @@ -2876,6 +2929,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
>       .init = arm_smmu_iommu_domain_init,
>       .hwdom_init = arm_smmu_iommu_hwdom_init,
>       .add_device = arm_smmu_dt_add_device_generic,
> +    .remove_device = arm_smmu_dt_remove_device_generic,
>       .teardown = arm_smmu_iommu_domain_teardown,
>       .iotlb_flush = arm_smmu_iotlb_flush,
>       .iotlb_flush_all = arm_smmu_iotlb_flush_all,

Cheers,

-- 
Julien Grall

