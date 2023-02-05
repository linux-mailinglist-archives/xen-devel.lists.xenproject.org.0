Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A535768B1F7
	for <lists+xen-devel@lfdr.de>; Sun,  5 Feb 2023 22:37:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489930.758500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOmgr-0008EA-4G; Sun, 05 Feb 2023 21:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489930.758500; Sun, 05 Feb 2023 21:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOmgr-0008BQ-1T; Sun, 05 Feb 2023 21:36:49 +0000
Received: by outflank-mailman (input) for mailman id 489930;
 Sun, 05 Feb 2023 21:36:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pOmgq-0008BK-34
 for xen-devel@lists.xenproject.org; Sun, 05 Feb 2023 21:36:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pOmgp-0001sO-Lb; Sun, 05 Feb 2023 21:36:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pOmgp-0008Fz-H7; Sun, 05 Feb 2023 21:36:47 +0000
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
	bh=ZqrmuQ9dLxa5H22TvQN1+OSjR901nErJ+uR839KHeOE=; b=viQBJN2FRVfCVBiUj15cTot6Qa
	HEryOxJXgrjxPJh810dyoT4s7zV80H7z1WI9N8vtkU5vFiogZ/dWq8+AfHX1dy3uQXTw79y1EbqT0
	dmFzs2lBk0/B6zUCX8jDwu95MnvmJMkPOsrQ3TUxCUgqNnJaza6Tj5jAKuFevPq1WCUE=;
Message-ID: <185b3850-e11e-01a0-be90-f21a631310a9@xen.org>
Date: Sun, 5 Feb 2023 21:36:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 17/40] xen/mpu: plump virt/maddr/mfn convertion in MPU
 system
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-18-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230113052914.3845596-18-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

title: typo: s/convertion/conversion/

On 13/01/2023 05:28, Penny Zheng wrote:
> virt_to_maddr and maddr_to_virt are used widely in Xen code. So
> even there is no VMSA in MPU system, we keep the interface name to
> stay the same code flow.
> 
> We move the existing virt/maddr convertion from mm.h to mm_mmu.h.
> And the MPU version of virt/maddr convertion is simple, returning

ditto.

> the input address as the output.
> 
> We should overide virt_to_mfn/mfn_to_virt in source file mm_mpu.c the

ditto: s/overide/override/

> same way in mm_mmu.c.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/include/asm/mm.h     | 26 --------------------------
>   xen/arch/arm/include/asm/mm_mmu.h | 26 ++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/mm_mpu.h | 13 +++++++++++++
>   xen/arch/arm/mm_mpu.c             |  6 ++++++
>   4 files changed, 45 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 9b4c07d965..e29158028a 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -250,32 +250,6 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
>   /* Page-align address and convert to frame number format */
>   #define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
>   
> -static inline paddr_t __virt_to_maddr(vaddr_t va)
> -{
> -    uint64_t par = va_to_par(va);
> -    return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
> -}
> -#define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
> -
> -#ifdef CONFIG_ARM_32
> -static inline void *maddr_to_virt(paddr_t ma)
> -{
> -    ASSERT(is_xen_heap_mfn(maddr_to_mfn(ma)));
> -    ma -= mfn_to_maddr(directmap_mfn_start);
> -    return (void *)(unsigned long) ma + XENHEAP_VIRT_START;
> -}
> -#else
> -static inline void *maddr_to_virt(paddr_t ma)
> -{
> -    ASSERT((mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) <
> -           (DIRECTMAP_SIZE >> PAGE_SHIFT));
> -    return (void *)(XENHEAP_VIRT_START -
> -                    (directmap_base_pdx << PAGE_SHIFT) +
> -                    ((ma & ma_va_bottom_mask) |
> -                     ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
> -}
> -#endif
> -
>   /*
>    * Translate a guest virtual address to a machine address.
>    * Return the fault information if the translation has failed else 0.
> diff --git a/xen/arch/arm/include/asm/mm_mmu.h b/xen/arch/arm/include/asm/mm_mmu.h
> index a5e63d8af8..6d7e5ddde7 100644
> --- a/xen/arch/arm/include/asm/mm_mmu.h
> +++ b/xen/arch/arm/include/asm/mm_mmu.h
> @@ -23,6 +23,32 @@ extern uint64_t init_ttbr;
>   extern void setup_directmap_mappings(unsigned long base_mfn,
>                                        unsigned long nr_mfns);
>   
> +static inline paddr_t __virt_to_maddr(vaddr_t va)
> +{
> +    uint64_t par = va_to_par(va);
> +    return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
> +}
> +#define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
> +
> +#ifdef CONFIG_ARM_32
> +static inline void *maddr_to_virt(paddr_t ma)
> +{
> +    ASSERT(is_xen_heap_mfn(maddr_to_mfn(ma)));
> +    ma -= mfn_to_maddr(directmap_mfn_start);
> +    return (void *)(unsigned long) ma + XENHEAP_VIRT_START;
> +}
> +#else
> +static inline void *maddr_to_virt(paddr_t ma)
> +{
> +    ASSERT((mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) <
> +           (DIRECTMAP_SIZE >> PAGE_SHIFT));
> +    return (void *)(XENHEAP_VIRT_START -
> +                    (directmap_base_pdx << PAGE_SHIFT) +
> +                    ((ma & ma_va_bottom_mask) |
> +                     ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
> +}
> +#endif
> +
>   #endif /* __ARCH_ARM_MM_MMU__ */
>   
>   /*
> diff --git a/xen/arch/arm/include/asm/mm_mpu.h b/xen/arch/arm/include/asm/mm_mpu.h
> index 1f3cff7743..3a4b07f187 100644
> --- a/xen/arch/arm/include/asm/mm_mpu.h
> +++ b/xen/arch/arm/include/asm/mm_mpu.h
> @@ -4,6 +4,19 @@
>   
>   #define setup_mm_mappings(boot_phys_offset) ((void)(boot_phys_offset))
>   
> +static inline paddr_t __virt_to_maddr(vaddr_t va)
> +{
> +    /* In MPU system, VA == PA. */
> +    return (paddr_t)va;
> +}
> +#define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))

This define is exactly the same as the MMU version. Can it be 
implemented in mm.h?

> +
> +static inline void *maddr_to_virt(paddr_t ma)
> +{
> +    /* In MPU system, VA == PA. */
> +    return (void *)ma;
> +}
> +
>   #endif /* __ARCH_ARM_MM_MPU__ */
>   
>   /*
> diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
> index 87a12042cc..c9e17ab6da 100644
> --- a/xen/arch/arm/mm_mpu.c
> +++ b/xen/arch/arm/mm_mpu.c
> @@ -29,6 +29,12 @@
>   pr_t __aligned(PAGE_SIZE) __section(".data.page_aligned")
>        xen_mpumap[ARM_MAX_MPU_MEMORY_REGIONS];
>   
> +/* Override macros from asm/page.h to make them work with mfn_t */
> +#undef virt_to_mfn
> +#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> +#undef mfn_to_virt
> +#define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))

They should be implemented when you need them.

> +
>   /* Index into MPU memory region map for fixed regions, ascending from zero. */
>   uint64_t __ro_after_init next_fixed_region_idx;
>   /*

Cheers,

-- 
Julien Grall

