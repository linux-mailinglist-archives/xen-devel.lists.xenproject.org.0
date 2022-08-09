Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7902458DEA7
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 20:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383123.618240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLTpK-0003su-7Y; Tue, 09 Aug 2022 18:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383123.618240; Tue, 09 Aug 2022 18:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLTpK-0003q7-4I; Tue, 09 Aug 2022 18:19:38 +0000
Received: by outflank-mailman (input) for mailman id 383123;
 Tue, 09 Aug 2022 18:19:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oLTpI-0003q1-G0
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 18:19:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oLTpI-00056o-5b; Tue, 09 Aug 2022 18:19:36 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.14.84]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oLTpH-0005jz-WA; Tue, 09 Aug 2022 18:19:36 +0000
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
	bh=50cTcQN9kQWrwNQ7hdY31jwdICssF8lJSJBZGSkq80U=; b=RwfYEAQ+OA8JHpVTKtEezs04L6
	NmU7nygMpC+Qnot/cycW6W7cCEmkBVSQQYOwvSiwWQQRfpv4yXepgPfT1OS0/9UsKmLkVS2zxqtId
	CZ3uywi9hH5NTQkrRDRF8KHriqBn7QTpLisCkWiBkRF8QhQbklnjqZpxliMAQTl7iu3w=;
Message-ID: <0f1e12d0-1c58-8457-b3ff-26048f46430a@xen.org>
Date: Tue, 9 Aug 2022 19:19:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH] xen/arm: smmuv1: Set s2cr to type fault when the devices
 are deassigned
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
 <e6a8807af0832db752d735e4f9ebddaa6bbd7c12.1659713886.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e6a8807af0832db752d735e4f9ebddaa6bbd7c12.1659713886.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

title: The driver is for both smmuv1 and v2. Are you suggesting the 
issue only occurs on v1?

On 05/08/2022 16:43, Rahul Singh wrote:
> When devices are deassigned/assigned, SMMU global fault is observed
> because SMEs are freed in detach function and not allocated again when
> the device is assigned back to the guest.
> 
> Don't free the SMEs when devices are deassigned, set the s2cr to type
> fault. This way the SMMU will generate a fault if a DMA access is done
> by a device not assigned to a guest
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

AFAICT, this is fixing 0435784cc75d ("xen/arm: smmuv1: Intelligent SMR 
allocation"). If I am correct, can you add a Fixes tag?

> ---
>   xen/drivers/passthrough/arm/smmu.c | 32 +++++++++++++++---------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 69511683b4..141948decd 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -1598,21 +1598,6 @@ out_err:
>   	return ret;
>   }
>   
> -static void arm_smmu_master_free_smes(struct arm_smmu_master_cfg *cfg)

IIUC, the function needs to be moved because you need to use 
arm_smmu_write_s2cr(). If so, I would suggest to mention in the commit 
message because at first it seems unwarranted.

> -{
> -    struct arm_smmu_device *smmu = cfg->smmu;
> -	int i, idx;
> -	struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
> -
> -	spin_lock(&smmu->stream_map_lock);
> -	for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
> -		if (arm_smmu_free_sme(smmu, idx))
> -			arm_smmu_write_sme(smmu, idx);
> -		cfg->smendx[i] = INVALID_SMENDX;
> -	}
> -	spin_unlock(&smmu->stream_map_lock);
> -}
> -
>   static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
>   				      struct arm_smmu_master_cfg *cfg)
>   {
> @@ -1635,6 +1620,20 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
>   	return 0;
>   }
>   
> +static void arm_smmu_domain_remove_master(struct arm_smmu_domain *smmu_domain,
> +				      struct arm_smmu_master_cfg *cfg)
> +{
> +	int i, idx;

NIT: I would suggest to take the opportunity to switch to "unsigned int" 
and ...

> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	struct arm_smmu_s2cr *s2cr = smmu->s2crs;
> +	struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);

... use const here. "cfg" and "smmu" can't be consistent but 
"smmu_domain" technically could (thanks to how C works). That said, I 
quite dislike it as the code ends up to be confusing...

> +
> +	for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
> +		s2cr[idx] = s2cr_init_val;
> +		arm_smmu_write_s2cr(smmu, idx);
> +	}
> +}
> +
>   static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   {
>   	int ret;
> @@ -1684,10 +1683,11 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>   
>   static void arm_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
>   {
> +	struct arm_smmu_domain *smmu_domain = domain->priv;
>   	struct arm_smmu_master_cfg *cfg = find_smmu_master_cfg(dev);
>   
>   	if (cfg)
> -		arm_smmu_master_free_smes(cfg);
> +		return arm_smmu_domain_remove_master(smmu_domain, cfg);

Why are you using adding a 'return' here?

Cheers,

-- 
Julien Grall

