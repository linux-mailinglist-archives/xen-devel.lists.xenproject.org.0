Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77220A56342
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 10:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904763.1312596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTht-0006jO-P2; Fri, 07 Mar 2025 09:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904763.1312596; Fri, 07 Mar 2025 09:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTht-0006hH-MU; Fri, 07 Mar 2025 09:09:25 +0000
Received: by outflank-mailman (input) for mailman id 904763;
 Fri, 07 Mar 2025 09:09:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tqThs-0006hB-22
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 09:09:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqThr-006u2t-2T;
 Fri, 07 Mar 2025 09:09:23 +0000
Received: from [2a02:8012:3a1:0:9517:10f4:44fb:20af]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqThr-00C9g3-0S;
 Fri, 07 Mar 2025 09:09:23 +0000
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
	bh=BFpTOSDy50ZixyM5uUXTyzOmmMUItVK4jkyiJjzaB1I=; b=0o5cqTbwg8bELn3kO0lyFr9QBm
	mQgXJwiX6NAua+H0aF9S4NyvqDrKz6DpsPzqFMQJHSAGL4Dy9giSBpYPBiw1MQqCR/xfIrDmVVJN7
	m17Mk4euUSc9NTDItcKFPG0uMcIUeiiDoL3cdXPyOFqAdKMtZeAj2Q2eCMDhaN0Xm/J0=;
Message-ID: <9a257d60-3047-4d8a-b461-ce793d5f89e8@xen.org>
Date: Fri, 7 Mar 2025 09:09:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250307075818.740649-1-luca.fancellu@arm.com>
 <20250307075818.740649-2-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250307075818.740649-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 07/03/2025 07:58, Luca Fancellu wrote:
> When Xen is built without HAS_PASSTHROUGH, there are some parts
> in arm where iommu_* functions are called in the codebase, but
> their implementation is under xen/drivers/passthrough that is
> not built.
> 
> So provide some stub for these functions in order to build Xen
> when !HAS_PASSTHROUGH, which is the case for example on systems
> with MPU support.
> 
> For gnttab_need_iommu_mapping() in the Arm part, modify the macro
> to use IS_ENABLED for the HAS_PASSTHROUGH Kconfig.
> 
> Fixes: 0388a5979b21 ("xen/arm: mpu: Introduce choice between MMU and MPU")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v4 changes:
>   - re-introduced stub for iommu_use_hap_pt, Stefano suggested
>     it is ok to have it in iommu.h.
>   - Reworded comment in iommu_domain_init from Jan suggestion
> 
> v3 Changes:
>   - removed stub for iommu_use_hap_pt, another solution will be
>     done for the instance in common arm code.
>   - Moved a comment close to the macro it was referred to
>   - add comment to iommu_domain_init() stub
>   - modified commit message
>   - Add fixes tag
> 
> v2 Changes:
>   - modify gnttab_need_iommu_mapping to use IS_ENABLED
>   - removed macro that didn't allow some of the parameter to be
>     evaluated
>   - Changed commit message
> ---
> ---
>   xen/arch/arm/include/asm/grant_table.h |  5 +--
>   xen/include/xen/iommu.h                | 50 +++++++++++++++++++++++++-
>   2 files changed, 52 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
> index d3c518a926b9..c5d87b60c4df 100644
> --- a/xen/arch/arm/include/asm/grant_table.h
> +++ b/xen/arch/arm/include/asm/grant_table.h
> @@ -73,8 +73,9 @@ int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
>   #define gnttab_status_gfn(d, t, i)                                       \
>       page_get_xenheap_gfn(gnttab_status_page(t, i))
>   
> -#define gnttab_need_iommu_mapping(d)                    \
> -    (is_domain_direct_mapped(d) && is_iommu_enabled(d))
> +#define gnttab_need_iommu_mapping(d)                                     \
> +    (IS_ENABLED(CONFIG_HAS_PASSTHROUGH) && is_domain_direct_mapped(d) && \
> +     is_iommu_enabled(d))
>   
>   #endif /* __ASM_GRANT_TABLE_H__ */
>   /*
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 77a514019cc6..5ac038521e23 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -110,6 +110,8 @@ extern int8_t iommu_hwdom_reserved;
>   
>   extern unsigned int iommu_dev_iotlb_timeout;
>   
> +#ifdef CONFIG_HAS_PASSTHROUGH
> +
>   int iommu_setup(void);
>   int iommu_hardware_setup(void);
>   
> @@ -122,6 +124,28 @@ int arch_iommu_domain_init(struct domain *d);
>   void arch_iommu_check_autotranslated_hwdom(struct domain *d);
>   void arch_iommu_hwdom_init(struct domain *d);
>   
> +#else
> +
> +static inline int iommu_setup(void)
> +{
> +    return -ENODEV;
> +}
> +
> +static inline int iommu_domain_init(struct domain *d, unsigned int opts)
> +{
> +    /*
> +     * Return as the real iommu_domain_init() would: Success when
> +     * !is_iommu_enabled(), following from !iommu_enabled when !HAS_PASSTHROUGH
> +     */
> +    return 0;
> +}
> +
> +static inline void iommu_hwdom_init(struct domain *d) {}
> +
> +static inline void iommu_domain_destroy(struct domain *d) {}
> +
> +#endif /* HAS_PASSTHROUGH */
> +
>   /*
>    * The following flags are passed to map (applicable ones also to unmap)
>    * operations, while some are passed back by lookup operations.
> @@ -209,6 +233,8 @@ struct msi_msg;
>   #ifdef CONFIG_HAS_DEVICE_TREE
>   #include <xen/device_tree.h>
>   
> +#ifdef CONFIG_HAS_PASSTHROUGH
> +
>   int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev);
>   int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev);
>   int iommu_dt_domain_init(struct domain *d);
> @@ -238,6 +264,26 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>    */
>   int iommu_remove_dt_device(struct dt_device_node *np);
>   
> +#else
> +
> +static inline int iommu_assign_dt_device(struct domain *d,
> +                                         struct dt_device_node *dev)
> +{
> +    return -EINVAL;
> +}
> +
> +static inline int iommu_add_dt_device(struct dt_device_node *np)
> +{
> +    return 1;

I would suggest to add a comment explain what 1 means. IIRC, this means 
"no iommu" present.

Other than that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


