Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF1F435E0C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 11:35:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214255.372752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdUTU-0006qw-M8; Thu, 21 Oct 2021 09:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214255.372752; Thu, 21 Oct 2021 09:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdUTU-0006ou-J6; Thu, 21 Oct 2021 09:35:00 +0000
Received: by outflank-mailman (input) for mailman id 214255;
 Thu, 21 Oct 2021 09:34:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mdUTT-0006oo-4G
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 09:34:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdUTS-0005MY-DQ; Thu, 21 Oct 2021 09:34:58 +0000
Received: from [54.239.6.190] (helo=[192.168.27.91])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdUTS-0006y0-78; Thu, 21 Oct 2021 09:34:58 +0000
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
	bh=AWkHphHUrYUhcyB9cSpAthxNiuPulKkEyutMJrkC3PU=; b=ZzOIwzyGx4jaRYJXF+iHYuwAAa
	859D3CmHMVAJApc8kY+GRCGQkzbJwmUaJnFsBuj9nOYTSsXzET+T3sj6icdm1EMYLinQ3ygNHWYd1
	joH4HG2hBZ8+gGLbJPaHc8C1DspcI4hXbGF2I8A6JeouzuPa5p2Z1DeRH/GhUR18qGVg=;
Message-ID: <e4551e28-7405-60b4-ddea-1830e3da1925@xen.org>
Date: Thu, 21 Oct 2021 10:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [XEN][RFC PATCH 08/13] xen/iommu: Introduce
 iommu_remove_dt_devices function
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
 <1630562763-390068-9-git-send-email-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1630562763-390068-9-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 02/09/2021 07:05, Vikram Garhwal wrote:
> iommu_remove_dt_device function is introduced for supporting dynamic programming
> i.e. adding and removing a node during runtime. When user removes the device
> node, iommu_remove_dt_device() removes the device entry from smmu-masters too
> using following steps:
>      1. Find if SMMU master exists for the device node.
>      2. Remove the SMMU master.

I would prefer if this patch is split in two:
   * Part 1: Add the generic helper
   * Part 2: Implement the callback for the SMMU

> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>   xen/drivers/passthrough/arm/smmu.c    | 53 +++++++++++++++++++++++++++++++++++
>   xen/drivers/passthrough/device_tree.c | 30 ++++++++++++++++++++
>   xen/include/xen/iommu.h               |  2 ++
>   3 files changed, 85 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index c9dfc4c..7b615bc 100644
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
> @@ -853,6 +864,31 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
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
> +
> +	ret = remove_smmu_master(smmu, master);

Can you add a comment why you are not clearing the dev_node->is_protected?

> +
> +	if (ret)
> +		return ret;
> +
> +	master->of_node = NULL;

NIT: This is a bit pointless to do given that you are freeing master 
right after.

> +	kfree(master);
> +	return 0;
> +}
> +
>   static int register_smmu_master(struct arm_smmu_device *smmu,
>   				struct device *dev,
>   				struct of_phandle_args *masterspec)
> @@ -876,6 +912,22 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
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
> @@ -2876,6 +2928,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
>       .init = arm_smmu_iommu_domain_init,
>       .hwdom_init = arm_smmu_iommu_hwdom_init,
>       .add_device = arm_smmu_dt_add_device_generic,
> +    .remove_device = arm_smmu_dt_remove_device_generic,
>       .teardown = arm_smmu_iommu_domain_teardown,
>       .iotlb_flush = arm_smmu_iotlb_flush,
>       .iotlb_flush_all = arm_smmu_iotlb_flush_all,
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 98f2aa0..37f4945 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -127,6 +127,36 @@ int iommu_release_dt_devices(struct domain *d)
>       return 0;
>   }
>   
> +int iommu_remove_dt_device(struct dt_device_node *np)
> +{
> +    const struct iommu_ops *ops = iommu_get_ops();
> +    struct device *dev = dt_to_dev(np);
> +    int rc = 1;

You set rc to 1 but AFAICT the value is never used.

> +
> +    if ( !ops )
> +        return -EINVAL;

It would be better to return -EOPNOSUPP.

> +
> +    if ( iommu_dt_device_is_assigned(np) )
> +        return -EPERM;
> +
> +    /*
> +     * The driver which supports generic IOMMU DT bindings must have
> +     * these callback implemented.
> +     */

I think we should make ops->remove_device optional.

> +    if ( !ops->remove_device )
> +        return -EINVAL;
It would be better to return -EOPNOSUPP.

> +
> +    /*
> +     * Remove master device from the IOMMU if latter is present and available.
> +     */
> +    rc = ops->remove_device(0, dev);

This will need to be interlocked with other IOMMU request.

> +
> +    if ( rc == 0 )
> +        iommu_fwspec_free(dev);
> +
> +    return rc;
> +}
> +
>   int iommu_add_dt_device(struct dt_device_node *np)
>   {
>       const struct iommu_ops *ops = iommu_get_ops();
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 6b2cdff..c4d5d12 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -215,6 +215,8 @@ int iommu_release_dt_devices(struct domain *d);
>    */
>   int iommu_add_dt_device(struct dt_device_node *np);
>   
> +int iommu_remove_dt_device(struct dt_device_node *np);
> +
>   int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
>                          XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
>   
> 

Cheers,

-- 
Julien Grall

