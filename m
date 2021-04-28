Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B2736D8F2
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 15:56:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119382.225838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbkgF-0001cW-67; Wed, 28 Apr 2021 13:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119382.225838; Wed, 28 Apr 2021 13:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbkgF-0001c7-2p; Wed, 28 Apr 2021 13:56:43 +0000
Received: by outflank-mailman (input) for mailman id 119382;
 Wed, 28 Apr 2021 13:56:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lbkgD-0001bG-Pl
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 13:56:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbkgC-0006XB-5s; Wed, 28 Apr 2021 13:56:40 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbkgB-0005jy-ST; Wed, 28 Apr 2021 13:56:40 +0000
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
	bh=z+23nAtDHbUY6XtDN0eg5wKMgkU70ngjKlgGQv+CiUg=; b=tg1BVbf7E59GdeIW3ghPuyhEqH
	4yjSCsVeKyaswNUY0hJa/p/mfmM8sw1d6Y9t3anpnuUG/T8sZGA1jEw4WWNQA/3aF/uNYhDDvtgvX
	XwRCDg+A8YOaqxFBCm07gWG7pqErAm1xnZSz5pKRTLo2Yo99SEkntVVm3vGUA2INiDC4=;
Subject: Re: [PATCH RESEND v3 3/3] arm,smmu: add support for generic DT
 bindings. Implement add_device and dt_xlate.
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 rahul.singh@arm.com, brian.woods@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2104131055580.4885@sstabellini-ThinkPad-T480s>
 <20210413175905.15123-3-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <a9802e45-9405-5b19-3d21-9c4b56374f23@xen.org>
Date: Wed, 28 Apr 2021 14:56:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210413175905.15123-3-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 13/04/2021 18:59, Stefano Stabellini wrote:
> From: Brian Woods <brian.woods@xilinx.com>
> 
> Now that all arm iommu drivers support generic bindings we can remove
> the workaround from iommu_add_dt_device().

Well, it was just added in a different place in patch #1. ;) I have 
commented about it in patch #1.

> 
> Note that if both legacy bindings and generic bindings are present in
> device tree, the legacy bindings are the ones that are used
Can you oultine what guarantee that? Also what happen if some of devices 
are using the generic bindings while other are using the legacy one?
> 
> Signed-off-by: Brian Woods <brian.woods@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/drivers/passthrough/arm/smmu.c    | 42 ++++++++++++++++++++++++++-
>   xen/drivers/passthrough/device_tree.c | 17 +----------
>   2 files changed, 42 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index f949c110ad..b564851a56 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -254,6 +254,8 @@ struct iommu_group
>   	atomic_t ref;
>   };
>   
> +static struct arm_smmu_device *find_smmu(const struct device *dev);
> +
>   static struct iommu_group *iommu_group_alloc(void)
>   {
>   	struct iommu_group *group = xzalloc(struct iommu_group);
> @@ -442,6 +444,8 @@ static struct iommu_group *iommu_group_get(struct device *dev)
>   #define SMR_VALID			(1U << 31)
>   #define SMR_MASK_SHIFT			16
>   #define SMR_ID_SHIFT			0
> +#define SMR_ID_MASK			0x7fff
> +#define SMR_MASK_MASK			0x7fff
>   
>   #define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
>   #define S2CR_CBNDX_SHIFT		0
> @@ -872,6 +876,40 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
>   					     fwspec);
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
> +	smmu = find_smmu(fwspec->iommu_dev);
> +	if (smmu == NULL)
> +		return -ENXIO;
> +
> +	return arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);

Patch #2 seems to imply the code was reworked to have distinct path 
between legacy and generic. But now, you are calling the legacy code 
from the generic helper. This is pretty confusing, can you explain 
what's going on?

> +}
> +
> +static int arm_smmu_dt_xlate_generic(struct device *dev,
> +				    const struct dt_phandle_args *spec)

This seems to be a verbatim copy from Linux. It would be good to mention 
it in the commit message. This would make easier to track any change.

> +{
> +	uint32_t mask, fwid = 0;
> +
> +	if (spec->args_count > 0)
> +		fwid |= (SMR_ID_MASK & spec->args[0]) << SMR_ID_SHIFT;
> +
> +	if (spec->args_count > 1)
> +		fwid |= (SMR_MASK_MASK & spec->args[1]) << SMR_MASK_SHIFT;
> +	else if (!of_property_read_u32(spec->np, "stream-match-mask", &mask))
> +		fwid |= (SMR_MASK_MASK & mask) << SMR_MASK_SHIFT;
> +
> +	return iommu_fwspec_add_ids(dev,
> +				    &fwid,
> +				    1);

NIT: This feels a bit odd to read. Can't they be defined on the same line?

> +}
> +
>   static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
>   {
>   	struct arm_smmu_device *smmu;
> @@ -2836,6 +2874,7 @@ static void arm_smmu_iommu_domain_teardown(struct domain *d)
>   static const struct iommu_ops arm_smmu_iommu_ops = {
>       .init = arm_smmu_iommu_domain_init,
>       .hwdom_init = arm_smmu_iommu_hwdom_init,
> +    .add_device = arm_smmu_dt_add_device_generic,
>       .teardown = arm_smmu_iommu_domain_teardown,
>       .iotlb_flush = arm_smmu_iotlb_flush,
>       .iotlb_flush_all = arm_smmu_iotlb_flush_all,
> @@ -2843,9 +2882,10 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
>       .reassign_device = arm_smmu_reassign_dev,
>       .map_page = arm_iommu_map_page,
>       .unmap_page = arm_iommu_unmap_page,
> +    .dt_xlate = arm_smmu_dt_xlate_generic,
>   };
>   
> -static __init const struct arm_smmu_device *find_smmu(const struct device *dev)
> +static struct arm_smmu_device *find_smmu(const struct device *dev)
>   {
>   	struct arm_smmu_device *smmu;
>   	bool found = false;
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index a51ae3c9c3..ae07f272e1 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -162,22 +162,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
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
> +            return -EINVAL;
>   
>           if ( !dt_device_is_available(iommu_spec.np) )
>               break;
> 

-- 
Julien Grall

