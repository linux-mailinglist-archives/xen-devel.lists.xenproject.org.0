Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E443D2503
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jul 2021 15:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159764.293794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6ZEc-0000cN-3p; Thu, 22 Jul 2021 13:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159764.293794; Thu, 22 Jul 2021 13:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6ZEb-0000Zm-WB; Thu, 22 Jul 2021 13:59:33 +0000
Received: by outflank-mailman (input) for mailman id 159764;
 Thu, 22 Jul 2021 13:59:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m6ZEa-0000ZQ-Gc
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 13:59:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6ZEZ-0008Pe-46; Thu, 22 Jul 2021 13:59:31 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6ZEY-0003Vw-Uc; Thu, 22 Jul 2021 13:59:31 +0000
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
	bh=cKqQtA8qiY2P02JIQvdO9Q9CSjFiZ09trP7WWjxzzLw=; b=GR4y1E5P8Yxad/m4atBiXqf5n1
	O4YDiD+DSbNqodOW+/Ppa//3IXVj62WGmP+pevXFw2CFaJhYuJgnw3jmUM3pw3FxnzMdckD+I90cZ
	8wVSisbHCdj/+N3ydFSaiz1aCvgkAa638XHephY2/9YX2eCVRqFW4FXAQ+iA0RuW6A1E=;
Subject: Re: [PATCH v4 3/3] arm,smmu: add support for generic DT bindings.
 Implement add_device and dt_xlate.
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 rahul.singh@arm.com, brian.woods@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2107161657300.3916@sstabellini-ThinkPad-T480s>
 <20210716235939.9585-3-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <ffdb7819-ac55-2438-e561-4208e81740d4@xen.org>
Date: Thu, 22 Jul 2021 14:59:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210716235939.9585-3-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 17/07/2021 00:59, Stefano Stabellini wrote:
> From: Brian Woods <brian.woods@xilinx.com>
> 
> For the legacy path, arm_smmu_dt_add_device_legacy is called by
> register_smmu_master scanning mmu-masters (a fwspec entry is also
> created.) For the generic path, arm_smmu_dt_add_device_generic gets
> called instead. Then, arm_smmu_dt_add_device_generic calls
> arm_smmu_dt_add_device_legacy afterwards, shared with the legacy path.
> This way most of the low level implementation is shared between the two
> paths.
> 
> If both legacy bindings and generic bindings are present in device tree,
> the legacy bindings are the ones that are used. That's because
> mmu-masters is parsed by
> xen/drivers/passthrough/arm/smmu.c:arm_smmu_device_dt_probe which is
> called by arm_smmu_dt_init. It happens very early. iommus is parsed by
> xen/drivers/passthrough/device_tree.c:iommu_add_dt_device which is
> called by xen/arch/arm/domain_build.c:handle_device and happens
> afterwards.
> 
> arm_smmu_dt_xlate_generic is a verbatim copy from Linux
> (drivers/iommu/arm/arm-smmu/arm-smmu.c:arm_smmu_of_xlate, version
> v5.10).
> 
> A workaround was introduced by cf4af9d6d6c (xen/arm: boot with device
> trees with "mmu-masters" and "iommus") because the SMMU driver only
> supported the legacy bindings. Remove it now.
> 
> Signed-off-by: Brian Woods <brian.woods@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> Changes in v4:
> - improve indentation
> - improve commit message
> ---
>   xen/drivers/passthrough/arm/smmu.c    | 40 ++++++++++++++++++++++++++-
>   xen/drivers/passthrough/device_tree.c | 17 +-----------
>   2 files changed, 40 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 252e8c1680..a065ba3f4e 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -255,6 +255,8 @@ struct iommu_group
>   	atomic_t ref;
>   };
>   
> +static struct arm_smmu_device *find_smmu(const struct device *dev);
> +
>   static struct iommu_group *iommu_group_alloc(void)
>   {
>   	struct iommu_group *group = xzalloc(struct iommu_group);
> @@ -443,6 +445,8 @@ static struct iommu_group *iommu_group_get(struct device *dev)
>   #define SMR_VALID			(1U << 31)
>   #define SMR_MASK_SHIFT			16
>   #define SMR_ID_SHIFT			0
> +#define SMR_ID_MASK			0x7fff
> +#define SMR_MASK_MASK			0x7fff
>   
>   #define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
>   #define S2CR_CBNDX_SHIFT		0
> @@ -871,6 +875,38 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
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
> +}
> +
> +static int arm_smmu_dt_xlate_generic(struct device *dev,
> +				    const struct dt_phandle_args *spec)
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
> +	return iommu_fwspec_add_ids(dev, &fwid, 1);
> +}
> +
>   static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
>   {
>   	struct arm_smmu_device *smmu;
> @@ -2835,6 +2871,7 @@ static void arm_smmu_iommu_domain_teardown(struct domain *d)
>   static const struct iommu_ops arm_smmu_iommu_ops = {
>       .init = arm_smmu_iommu_domain_init,
>       .hwdom_init = arm_smmu_iommu_hwdom_init,
> +    .add_device = arm_smmu_dt_add_device_generic,
>       .teardown = arm_smmu_iommu_domain_teardown,
>       .iotlb_flush = arm_smmu_iotlb_flush,
>       .iotlb_flush_all = arm_smmu_iotlb_flush_all,
> @@ -2842,9 +2879,10 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
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
> index 911f82a561..af6c2b2dfe 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -159,22 +159,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
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

