Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9593EB550
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 14:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166768.304396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEWB9-0003lp-2G; Fri, 13 Aug 2021 12:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166768.304396; Fri, 13 Aug 2021 12:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEWB8-0003iW-Ui; Fri, 13 Aug 2021 12:20:50 +0000
Received: by outflank-mailman (input) for mailman id 166768;
 Fri, 13 Aug 2021 12:20:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mEWB6-0003iQ-Ss
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 12:20:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEWB6-0005Uc-MT; Fri, 13 Aug 2021 12:20:48 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEWB6-0007Cr-Gg; Fri, 13 Aug 2021 12:20:48 +0000
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
	bh=Z4cZSiy3Lsa12mbm+nQyoN1NBBlIKFCv6vtaLUye23g=; b=fHg60slP8TMG5yXaR2iEjmsKDl
	KlftYNfx/lu6eCLVRCVrZ4BwdFfZAzRZ2HlhsP9d+J+jJCYvdd1E6JYqzgYIPpxmYZ0ouWkE6Pz09
	eIfLW63D/40zVaOjoB+czhRkAJupNJLUlnD0Vq++6b903Jw8sqtUKdwSTlYYifFesGRM=;
Subject: Re: [PATCH V4 05/10] xen/arm: static memory initialization
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-6-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6d131379-68e8-ff26-d579-db2afd678072@xen.org>
Date: Fri, 13 Aug 2021 13:20:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728102758.3269446-6-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 28/07/2021 11:27, Penny Zheng wrote:
> This patch introduces static memory initialization, during system boot up.
> 
> The new function init_staticmem_pages is responsible for static memory
> initialization.
> 
> Helper free_staticmem_pages is the equivalent of free_heap_pages, to free
> nr_mfns pages of static memory.
> 
> This commit also introduces new CONFIG_STATIC_MEMORY to avoid bringing dead
> codes in other archs.
> 
> Put asynchronous scrubbing for pages of static memory in TODO list.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v4 change:
> - move the option CONFIG_STATIC_MEMORY to common code, and with Arm
> "select"ing it
> - replace round_pg{down,up}() with PFN_DOWN()/PFN_UP()
> ---
>   xen/arch/arm/Kconfig    |  1 +
>   xen/arch/arm/setup.c    | 24 ++++++++++++++++++++++++
>   xen/common/Kconfig      |  3 +++
>   xen/common/page_alloc.c | 20 ++++++++++++++++++++
>   xen/include/xen/mm.h    |  6 ++++++
>   5 files changed, 54 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..cc7a943d27 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -15,6 +15,7 @@ config ARM
>   	select HAS_PASSTHROUGH
>   	select HAS_PDX
>   	select IOMMU_FORCE_PT_SHARE
> +	select STATIC_MEMORY

Given the list of TODOs, I think it would be better if STATIC_MEMORY is 
user selectable and gated by UNSUPPORTED.

We can remove the dependency on UNSUPPORTED once every have been addressed.

>   
>   config ARCH_DEFCONFIG
>   	string
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index f569134317..369f6631ee 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -622,6 +622,26 @@ static void __init init_pdx(void)
>       }
>   }
>   
> +/* Static memory initialization */
> +static void __init init_staticmem_pages(void)
> +{
> +    unsigned int bank;
> +
> +    /* TODO: Considering NUMA-support scenario. */
> +    for ( bank = 0 ; bank < bootinfo.static_mem.nr_banks; bank++ )
> +    {
> +        unsigned long bank_start = PFN_UP(bootinfo.static_mem.bank[bank].start);

I would prefer if bank_start is a mfn_t.

> +        unsigned long bank_size = PFN_DOWN(bootinfo.static_mem.bank[bank].size);

NIT: I would suggest to name it bank_pages or bank_nr_pages. This would 
make clear in the user that this contains pages.

> +        unsigned long bank_end = bank_start + bank_size;

mfn_t please.

> +
> +        if ( bank_end <= bank_start )

This will mean you will need to use mfn_x() for both. This code would be 
less nice but at least it avoids mixing address and MFN.

> +            return;
> +
> +        free_staticmem_pages(mfn_to_page(_mfn(bank_start)),
> +                             bank_size, false);
> +    }
> +}
> +
>   #ifdef CONFIG_ARM_32
>   static void __init setup_mm(void)
>   {
> @@ -749,6 +769,8 @@ static void __init setup_mm(void)
>       /* Add xenheap memory that was not already added to the boot allocator. */
>       init_xenheap_pages(mfn_to_maddr(xenheap_mfn_start),
>                          mfn_to_maddr(xenheap_mfn_end));
> +
> +    init_staticmem_pages();
>   }
>   #else /* CONFIG_ARM_64 */
>   static void __init setup_mm(void)
> @@ -802,6 +824,8 @@ static void __init setup_mm(void)
>   
>       setup_frametable_mappings(ram_start, ram_end);
>       max_page = PFN_DOWN(ram_end);
> +
> +    init_staticmem_pages();
>   }
>   #endif
>   
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 0ddd18e11a..8f736eea82 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -67,6 +67,9 @@ config MEM_ACCESS
>   config NEEDS_LIBELF
>   	bool
>   
> +config STATIC_MEMORY
> +	bool
> +
>   menu "Speculative hardening"
>   
>   config SPECULATIVE_HARDEN_ARRAY
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index a3ee5eca9e..2acb73e323 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1519,6 +1519,26 @@ static void free_heap_pages(
>       spin_unlock(&heap_lock);
>   }
>   
> +#ifdef CONFIG_STATIC_MEMORY
> +/* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
> +void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> +                                 bool need_scrub)
> +{
> +    mfn_t mfn = page_to_mfn(pg);
> +    unsigned long i;
> +
> +    for ( i = 0; i < nr_mfns; i++ )
> +    {
> +        mark_page_free(&pg[i], mfn_add(mfn, i));
> +
> +        if ( need_scrub )
> +        {
> +            /* TODO: asynchronous scrubbing for pages of static memory. */
> +            scrub_one_page(pg);
> +        }
> +    }
> +}
> +#endif
>   
>   /*
>    * Following rules applied for page offline:
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 667f9dac83..8e8fb5a615 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -85,6 +85,12 @@ bool scrub_free_pages(void);
>   } while ( false )
>   #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
>   
> +#ifdef CONFIG_STATIC_MEMORY
> +/* These functions are for static memory */
> +void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> +                          bool need_scrub);
> +#endif
> +
>   /* Map machine page range in Xen virtual address space. */
>   int map_pages_to_xen(
>       unsigned long virt,
> 

Cheers,

-- 
Julien Grall

