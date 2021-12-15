Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DE0475BD3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 16:29:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247440.426675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxWCv-0005Hp-PC; Wed, 15 Dec 2021 15:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247440.426675; Wed, 15 Dec 2021 15:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxWCv-0005Fs-Li; Wed, 15 Dec 2021 15:28:41 +0000
Received: by outflank-mailman (input) for mailman id 247440;
 Wed, 15 Dec 2021 15:28:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uCzL=RA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mxWCt-0005Fm-OZ
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 15:28:39 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac7fdbfa-5dbb-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 16:28:37 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id b19so32083415ljr.12
 for <xen-devel@lists.xenproject.org>; Wed, 15 Dec 2021 07:28:38 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l22sm365963lfc.307.2021.12.15.07.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 07:28:37 -0800 (PST)
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
X-Inumbo-ID: ac7fdbfa-5dbb-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vg7Dm1smVZxgfGUzJHFPwHjldCpWgF79YZo3lBpnGu0=;
        b=fhnDyo38zsMz7KcqM4yslSLJnY47Q7bjQq2mvRKIMiE2veBFjmyDDZO8zklfMcUM+y
         kRoMuPhcPubBBiNyHtzMdmByBl5cfgn4pLjfovRpVmM475wMM9X/K70+4bMi0qje1of7
         Fi3VSjOhChqAegPMuoMEA4IfINUzzFEHDh4Nzf7w6jDqSLNJ8ytHn7yo1I/UG9Wud6tL
         5xZicaNX8p5vqymYsbPkEz4YXy1VzoNp6xDADDabSd1E7WaExk7D4TF9w2bdTVgrjHe3
         w8v14jnwrOw3Sjgy8jWdzI2pmV3YYSVZZpkinNTbAYtFAFvxqz/FWvW8NjFOSCOCyKE3
         mGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vg7Dm1smVZxgfGUzJHFPwHjldCpWgF79YZo3lBpnGu0=;
        b=6U8/+echeVccU5KF+G3RKGkFLmz8zYTKZyoRlYcnRyuiUMAkg9KdRO/CYIqa1wt7CL
         kONXJ82IfvcXwYFrz7MIKP4cq/T4eQmdYHxA4Ra0QlZgjRNSKM89/P8pqxBkb9reWXal
         RoQ88zvC5u6tWOPrFjN47vUeITZkDOIpv3/XvjFEu+IEb7d+4l+JAgv0kwM8wq7Rib8/
         mVg+/AZ/OuC5Ooyd7yqe3TtaqXEu2M+Ws6eeZ0bzHdIFqXbAu4xFZEVoQCL/cqkd0NCx
         /PaJvHjn7bvjCPpFllv1aoSHD8RQgz0w6urfiXzphx4ZFsfKZsN2Hy2GKeTmxqiEX6Tq
         QMXg==
X-Gm-Message-State: AOAM5321zuxf7Dcyim3J781rqAeMDhY+WrAgqajFNRXuhu8X4WEpM0Ag
	0ogvQXetG2geyPI7GrUdO9s=
X-Google-Smtp-Source: ABdhPJxBAMtsVJBtGLdn2yBjtpbNB6tqfiQV2JkGF0h7zh8wXGQbCQzYKVBRvHXA0Amo5a9h0+vZfQ==
X-Received: by 2002:a2e:bc1b:: with SMTP id b27mr10701166ljf.91.1639582117624;
        Wed, 15 Dec 2021 07:28:37 -0800 (PST)
Subject: Re: [PATCH v2 14/18] IOMMU: fold flush-all hook into "flush one"
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <e40ee980-9151-101a-1484-b1710aaeafb0@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d0c860ea-2134-d8dd-9bf8-87cd9c1a9305@gmail.com>
Date: Wed, 15 Dec 2021 17:28:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e40ee980-9151-101a-1484-b1710aaeafb0@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 24.09.21 12:53, Jan Beulich wrote:

Hi Jan

> Having a separate flush-all hook has always been puzzling me some. We
> will want to be able to force a full flush via accumulated flush flags
> from the map/unmap functions. Introduce a respective new flag and fold
> all flush handling to use the single remaining hook.
>
> Note that because of the respective comments in SMMU and IPMMU-VMSA
> code, I've folded the two prior hook functions into one.

Changes to IPMMU-VMSA lgtm, for SMMU-v2 I think the same.


> For SMMU-v3,
> which lacks a comment towards incapable hardware, I've left both
> functions in place on the assumption that selective and full flushes
> will eventually want separating.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: What we really are going to need is for the map/unmap functions to
>       specify that a wider region needs flushing than just the one
>       covered by the present set of (un)maps. This may still be less than
>       a full flush, but at least as a first step it seemed better to me
>       to keep things simple and go the flush-all route.
> ---
> v2: New.
>
> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -242,7 +242,6 @@ int amd_iommu_get_reserved_device_memory
>   int __must_check amd_iommu_flush_iotlb_pages(struct domain *d, dfn_t dfn,
>                                                unsigned long page_count,
>                                                unsigned int flush_flags);
> -int __must_check amd_iommu_flush_iotlb_all(struct domain *d);
>   void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int dev_id,
>                                dfn_t dfn);
>   
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -475,15 +475,18 @@ int amd_iommu_flush_iotlb_pages(struct d
>   {
>       unsigned long dfn_l = dfn_x(dfn);
>   
> -    ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
> -    ASSERT(flush_flags);
> +    if ( !(flush_flags & IOMMU_FLUSHF_all) )
> +    {
> +        ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
> +        ASSERT(flush_flags);
> +    }
>   
>       /* Unless a PTE was modified, no flush is required */
>       if ( !(flush_flags & IOMMU_FLUSHF_modified) )
>           return 0;
>   
> -    /* If the range wraps then just flush everything */
> -    if ( dfn_l + page_count < dfn_l )
> +    /* If so requested or if the range wraps then just flush everything. */
> +    if ( (flush_flags & IOMMU_FLUSHF_all) || dfn_l + page_count < dfn_l )
>       {
>           amd_iommu_flush_all_pages(d);
>           return 0;
> @@ -508,13 +511,6 @@ int amd_iommu_flush_iotlb_pages(struct d
>   
>       return 0;
>   }
> -
> -int amd_iommu_flush_iotlb_all(struct domain *d)
> -{
> -    amd_iommu_flush_all_pages(d);
> -
> -    return 0;
> -}
>   
>   int amd_iommu_reserve_domain_unity_map(struct domain *d,
>                                          const struct ivrs_unity_map *map,
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -642,7 +642,6 @@ static const struct iommu_ops __initcons
>       .map_page = amd_iommu_map_page,
>       .unmap_page = amd_iommu_unmap_page,
>       .iotlb_flush = amd_iommu_flush_iotlb_pages,
> -    .iotlb_flush_all = amd_iommu_flush_iotlb_all,
>       .reassign_device = reassign_device,
>       .get_device_group_id = amd_iommu_group_id,
>       .enable_x2apic = iov_enable_xt,
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -930,13 +930,19 @@ out:
>   }
>   
>   /* Xen IOMMU ops */
> -static int __must_check ipmmu_iotlb_flush_all(struct domain *d)
> +static int __must_check ipmmu_iotlb_flush(struct domain *d, dfn_t dfn,
> +                                          unsigned long page_count,
> +                                          unsigned int flush_flags)
>   {
>       struct ipmmu_vmsa_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
>   
> +    ASSERT(flush_flags);
> +
>       if ( !xen_domain || !xen_domain->root_domain )
>           return 0;
>   
> +    /* The hardware doesn't support selective TLB flush. */
> +
>       spin_lock(&xen_domain->lock);
>       ipmmu_tlb_invalidate(xen_domain->root_domain);
>       spin_unlock(&xen_domain->lock);
> @@ -944,16 +950,6 @@ static int __must_check ipmmu_iotlb_flus
>       return 0;
>   }
>   
> -static int __must_check ipmmu_iotlb_flush(struct domain *d, dfn_t dfn,
> -                                          unsigned long page_count,
> -                                          unsigned int flush_flags)
> -{
> -    ASSERT(flush_flags);
> -
> -    /* The hardware doesn't support selective TLB flush. */
> -    return ipmmu_iotlb_flush_all(d);
> -}
> -
>   static struct ipmmu_vmsa_domain *ipmmu_get_cache_domain(struct domain *d,
>                                                           struct device *dev)
>   {
> @@ -1303,7 +1299,6 @@ static const struct iommu_ops ipmmu_iomm
>       .hwdom_init      = ipmmu_iommu_hwdom_init,
>       .teardown        = ipmmu_iommu_domain_teardown,
>       .iotlb_flush     = ipmmu_iotlb_flush,
> -    .iotlb_flush_all = ipmmu_iotlb_flush_all,
>       .assign_device   = ipmmu_assign_device,
>       .reassign_device = ipmmu_reassign_device,
>       .map_page        = arm_iommu_map_page,
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -2649,11 +2649,17 @@ static int force_stage = 2;
>    */
>   static u32 platform_features = ARM_SMMU_FEAT_COHERENT_WALK;
>   
> -static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
> +static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t dfn,
> +					     unsigned long page_count,
> +					     unsigned int flush_flags)
>   {
>   	struct arm_smmu_xen_domain *smmu_domain = dom_iommu(d)->arch.priv;
>   	struct iommu_domain *cfg;
>   
> +	ASSERT(flush_flags);
> +
> +	/* ARM SMMU v1 doesn't have flush by VMA and VMID */
> +
>   	spin_lock(&smmu_domain->lock);
>   	list_for_each_entry(cfg, &smmu_domain->contexts, list) {
>   		/*
> @@ -2670,16 +2676,6 @@ static int __must_check arm_smmu_iotlb_f
>   	return 0;
>   }
>   
> -static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t dfn,
> -					     unsigned long page_count,
> -					     unsigned int flush_flags)
> -{
> -	ASSERT(flush_flags);
> -
> -	/* ARM SMMU v1 doesn't have flush by VMA and VMID */
> -	return arm_smmu_iotlb_flush_all(d);
> -}
> -
>   static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
>   						struct device *dev)
>   {
> @@ -2879,7 +2875,6 @@ static const struct iommu_ops arm_smmu_i
>       .add_device = arm_smmu_dt_add_device_generic,
>       .teardown = arm_smmu_iommu_domain_teardown,
>       .iotlb_flush = arm_smmu_iotlb_flush,
> -    .iotlb_flush_all = arm_smmu_iotlb_flush_all,
>       .assign_device = arm_smmu_assign_dev,
>       .reassign_device = arm_smmu_reassign_dev,
>       .map_page = arm_iommu_map_page,
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -3431,7 +3431,6 @@ static const struct iommu_ops arm_smmu_i
>   	.hwdom_init		= arm_smmu_iommu_hwdom_init,
>   	.teardown		= arm_smmu_iommu_xen_domain_teardown,
>   	.iotlb_flush		= arm_smmu_iotlb_flush,
> -	.iotlb_flush_all	= arm_smmu_iotlb_flush_all,
>   	.assign_device		= arm_smmu_assign_dev,
>   	.reassign_device	= arm_smmu_reassign_dev,
>   	.map_page		= arm_iommu_map_page,
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -463,15 +463,12 @@ int iommu_iotlb_flush_all(struct domain
>       const struct domain_iommu *hd = dom_iommu(d);
>       int rc;
>   
> -    if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush_all ||
> +    if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush ||
>            !flush_flags )
>           return 0;
>   
> -    /*
> -     * The operation does a full flush so we don't need to pass the
> -     * flush_flags in.
> -     */
> -    rc = iommu_call(hd->platform_ops, iotlb_flush_all, d);
> +    rc = iommu_call(hd->platform_ops, iotlb_flush, d, INVALID_DFN, 0,
> +                    flush_flags | IOMMU_FLUSHF_all);
>       if ( unlikely(rc) )
>       {
>           if ( !d->is_shutting_down && printk_ratelimit() )
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -731,18 +731,21 @@ static int __must_check iommu_flush_iotl
>                                                   unsigned long page_count,
>                                                   unsigned int flush_flags)
>   {
> -    ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
> -    ASSERT(flush_flags);
> +    if ( flush_flags & IOMMU_FLUSHF_all )
> +    {
> +        dfn = INVALID_DFN;
> +        page_count = 0;
> +    }
> +    else
> +    {
> +        ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
> +        ASSERT(flush_flags);
> +    }
>   
>       return iommu_flush_iotlb(d, dfn, flush_flags & IOMMU_FLUSHF_modified,
>                                page_count);
>   }
>   
> -static int __must_check iommu_flush_iotlb_all(struct domain *d)
> -{
> -    return iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
> -}
> -
>   static void queue_free_pt(struct domain *d, mfn_t mfn, unsigned int next_level)
>   {
>       if ( next_level > 1 )
> @@ -2841,7 +2844,7 @@ static int __init intel_iommu_quarantine
>       spin_unlock(&hd->arch.mapping_lock);
>   
>       if ( !rc )
> -        rc = iommu_flush_iotlb_all(d);
> +        rc = iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
>   
>       /* Pages may be leaked in failure case */
>       return rc;
> @@ -2874,7 +2877,6 @@ static struct iommu_ops __initdata vtd_o
>       .resume = vtd_resume,
>       .crash_shutdown = vtd_crash_shutdown,
>       .iotlb_flush = iommu_flush_iotlb_pages,
> -    .iotlb_flush_all = iommu_flush_iotlb_all,
>       .get_reserved_device_memory = intel_iommu_get_reserved_device_memory,
>       .dump_page_tables = vtd_dump_page_tables,
>   };
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -147,9 +147,11 @@ enum
>   {
>       _IOMMU_FLUSHF_added,
>       _IOMMU_FLUSHF_modified,
> +    _IOMMU_FLUSHF_all,
>   };
>   #define IOMMU_FLUSHF_added (1u << _IOMMU_FLUSHF_added)
>   #define IOMMU_FLUSHF_modified (1u << _IOMMU_FLUSHF_modified)
> +#define IOMMU_FLUSHF_all (1u << _IOMMU_FLUSHF_all)
>   
>   int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>                              unsigned long page_count, unsigned int flags,
> @@ -282,7 +284,6 @@ struct iommu_ops {
>       int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
>                                       unsigned long page_count,
>                                       unsigned int flush_flags);
> -    int __must_check (*iotlb_flush_all)(struct domain *d);
>       int (*get_reserved_device_memory)(iommu_grdm_t *, void *);
>       void (*dump_page_tables)(struct domain *d);
>   
>
>
-- 
Regards,

Oleksandr Tyshchenko


