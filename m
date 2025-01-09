Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C16A078ED
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 15:16:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868426.1279939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVtK8-0005be-FY; Thu, 09 Jan 2025 14:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868426.1279939; Thu, 09 Jan 2025 14:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVtK8-0005ZH-Bx; Thu, 09 Jan 2025 14:15:48 +0000
Received: by outflank-mailman (input) for mailman id 868426;
 Thu, 09 Jan 2025 14:15:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=29Hz=UB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVtK6-0005ZB-7N
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 14:15:46 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 376090e3-ce94-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 15:15:45 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53f757134cdso953551e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 06:15:45 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428c34a843sm206737e87.227.2025.01.09.06.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 06:15:44 -0800 (PST)
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
X-Inumbo-ID: 376090e3-ce94-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736432145; x=1737036945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6xxfiP4WmzfQPbRxXHqCmC5n91VlUpR0NNXs4iZjpNE=;
        b=a2JfvD+GWRAEVLK0oq3fF7X+Jq56QiTD1qbYat60A3mZWk0LPaW46JO8gDMGeeeehT
         btDh9YLaC2CXPqr10Yugyll02ulCPseygjjNF5JopyCEmJsxbabj45kPC/XgU86Ipgaq
         XbSOayj2rBIqcKrXitWN2UZhAGi2UY+uDp8Xza2qCiL9/WVLVC0RSDeU/IQNcXZdbzFe
         DphMuREC+xIs7OEUrbcQZ9RHCoh2z3+8qnox0Bv+GxTx8LizCatHK/zUWBQ2dCilyZlZ
         Cv/MIglz0Xi0kZtvXLHYMF1QmfKG9ysfWWv/Hkl6PE/ut2v8fri/kiIzv+af79lu3agj
         s0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736432145; x=1737036945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xxfiP4WmzfQPbRxXHqCmC5n91VlUpR0NNXs4iZjpNE=;
        b=KKwbufsFnOo8SGvmS+6jkjX2XL7m1W8qnhywMPe4MPaiEt3VNKSJttHwjgrRm8uJxO
         6riiMCtmFCXJF/BS5aQv44dyCqB5Wuiwpgt+l+mf+gm8gFIeoJ9PJzOJhVSgjsU9c4Le
         O5NyZ1hzgU3uCpbsscyHIfLOTt2CMTXFBB5GuyixotYPm/31/6yYiTHocE/v6J1NnSqo
         HiaNpNN7W1SSa2iNmHxyS18O0bFn5L1R7daDNPi0sB+RdNgANHSrBe6iDC/dzg7dDYtB
         tW8yfCeVAM/qS5PalFHTOpru1cHSrONUacmeZdK+NqoIaa/JGlYWhn0wU/XDmZ/cEDFH
         EGug==
X-Forwarded-Encrypted: i=1; AJvYcCXT+pUuD1MD1uW+gludP0/1VihLjM0ZUN7yehzsO40xc3TTels5rcZq8hE5rDvGYq0jYXPv3YSRQNw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxP3nq89j85TsTENHTIn2zyds9LA+acOmPgJREs7u+bIeZbUYIb
	TQXv+2NpPHQ4Z2ajaeixhwPtqKXfU5CsNIg3Nf/LbJzeV9rbAq3N
X-Gm-Gg: ASbGncsu2nKg7DJaUyrYAR55cHwXvbFKfjq2miYlK2PgmIgdcyXo6Yos1gR1UN3Gbej
	a9F406Rj+o64Ged5gZzSfkVmPw+jcz/m0s23gt0d+0SwN0RLbfkC+FZTh3U5Gp+hpe8ME7orJT9
	E1HcVVS9XGohYOl7BcyPLKOrnZy5AWhxPrrPtsiVRpcefJxabVNyIBDNywF8NLVzW3UXtVvv4YK
	c3+TvAN0UY2EEyWxi4G+QiN6OD6xiDSmIU+ko9uMW4DLGUhBznaz3qaLQl85fR2z/cgmA==
X-Google-Smtp-Source: AGHT+IHel5ua3qEGJqpPpe1hSKsEQ1zqHmsEDJFUF7yUcSNdmcL/rX8alGtHJMzw76K+Fo9ttltdrA==
X-Received: by 2002:a05:6512:3d8a:b0:53e:44a4:34e0 with SMTP id 2adb3069b0e04-542845bf90amr2149177e87.16.1736432144436;
        Thu, 09 Jan 2025 06:15:44 -0800 (PST)
Message-ID: <5306c19d-d1a9-477a-9c73-047450efe71e@gmail.com>
Date: Thu, 9 Jan 2025 15:15:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20 PATCH v3] xen/arm: Fully initialise struct membanks_hdr
 fields
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250109130204.42545-1-luca.fancellu@arm.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250109130204.42545-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/9/25 2:02 PM, Luca Fancellu wrote:
> Commit a14593e3995a ("xen/device-tree: Allow region overlapping with
> /memreserve/ ranges") introduced a type in the 'struct membanks_hdr'
> but forgot to update the 'struct kernel_info' initialiser, while
> it doesn't lead to failures because the field is not currently
> used while managing kernel_info structures, it's good to have it
> for completeness.
>
> There are other instance of structures using 'struct membanks_hdr'
> that are dynamically allocated and don't fully initialise these
> fields, provide a static inline helper for that.
>
> Fixes: a14593e3995a ("xen/device-tree: Allow region overlapping with /memreserve/ ranges")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
> Changes from v2:
>   - Banks created by Xen should be MEMORY type. (Michal)
>   - Add R-by Michal
> Changes from v1:
>   - Changed commit title and body msg
>   - initialised max_banks and type for all structures using 'struct membanks_hdr'
> ---
> ---
>   xen/arch/arm/domain_build.c       | 13 ++++---------
>   xen/arch/arm/include/asm/kernel.h |  5 ++++-
>   xen/arch/arm/static-shmem.c       |  3 ++-
>   xen/include/xen/bootfdt.h         | 16 ++++++++++++++++
>   4 files changed, 26 insertions(+), 11 deletions(-)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b072a16249fe..7b47abade196 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1039,7 +1039,7 @@ void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>        */
>       if ( is_hardware_domain(d) )
>       {
> -        struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
> +        struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
>           /*
>            * Exclude the following regions:
>            * 1) Remove reserved memory
> @@ -1057,13 +1057,10 @@ void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>           gnttab->bank[0].start = kinfo->gnttab_start;
>           gnttab->bank[0].size = kinfo->gnttab_size;
>   
> -        hwdom_free_mem = xzalloc_flex_struct(struct membanks, bank,
> -                                             NR_MEM_BANKS);
> +        hwdom_free_mem = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
>           if ( !hwdom_free_mem )
>               goto fail;
>   
> -        hwdom_free_mem->max_banks = NR_MEM_BANKS;
> -
>           if ( find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
>                                        hwdom_free_mem, add_hwdom_free_regions) )
>               goto fail;
> @@ -1293,7 +1290,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
>                                                struct membanks *ext_regions)
>   {
>       int res;
> -    struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
> +    struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
>   
>       /*
>        * Exclude the following regions:
> @@ -1374,12 +1371,10 @@ int __init make_hypervisor_node(struct domain *d,
>       }
>       else
>       {
> -        ext_regions = xzalloc_flex_struct(struct membanks, bank, NR_MEM_BANKS);
> +        ext_regions = membanks_xzalloc(NR_MEM_BANKS, MEMORY);
>           if ( !ext_regions )
>               return -ENOMEM;
>   
> -        ext_regions->max_banks = NR_MEM_BANKS;
> -
>           if ( domain_use_host_layout(d) )
>           {
>               if ( !is_iommu_enabled(d) )
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 7e6e3c82a477..de3f945ae54c 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -92,7 +92,9 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
>   }
>   
>   #ifdef CONFIG_STATIC_SHM
> -#define KERNEL_INFO_SHM_MEM_INIT .shm_mem.common.max_banks = NR_SHMEM_BANKS,
> +#define KERNEL_INFO_SHM_MEM_INIT                \
> +    .shm_mem.common.max_banks = NR_SHMEM_BANKS, \
> +    .shm_mem.common.type = STATIC_SHARED_MEMORY,
>   #else
>   #define KERNEL_INFO_SHM_MEM_INIT
>   #endif
> @@ -100,6 +102,7 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
>   #define KERNEL_INFO_INIT                        \
>   {                                               \
>       .mem.common.max_banks = NR_MEM_BANKS,       \
> +    .mem.common.type = MEMORY,                  \
>       KERNEL_INFO_SHM_MEM_INIT                    \
>   }
>   
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index 66088a426785..8f87154c3587 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -20,7 +20,8 @@ static struct {
>       struct membanks_hdr common;
>       struct membank bank[NR_SHMEM_BANKS];
>   } shm_heap_banks __initdata = {
> -    .common.max_banks = NR_SHMEM_BANKS
> +    .common.max_banks = NR_SHMEM_BANKS,
> +    .common.type = STATIC_SHARED_MEMORY
>   };
>   
>   static inline struct membanks *get_shmem_heap_banks(void)
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index c8bbfd8979b2..80a90e53c001 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -4,6 +4,7 @@
>   #include <xen/types.h>
>   #include <xen/kernel.h>
>   #include <xen/macros.h>
> +#include <xen/xmalloc.h>
>   
>   #define MIN_FDT_ALIGN 8
>   
> @@ -219,4 +220,19 @@ static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
>   }
>   #endif
>   
> +static inline struct membanks *membanks_xzalloc(unsigned int nr,
> +                                                enum region_type type)
> +{
> +    struct membanks *banks = xzalloc_flex_struct(struct membanks, bank, nr);
> +
> +    if ( !banks )
> +        goto out;
> +
> +    banks->max_banks = nr;
> +    banks->type = type;
> +
> + out:
> +    return banks;
> +}
> +
>   #endif /* XEN_BOOTFDT_H */

