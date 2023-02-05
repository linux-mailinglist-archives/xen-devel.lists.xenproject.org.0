Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F33968B205
	for <lists+xen-devel@lfdr.de>; Sun,  5 Feb 2023 22:52:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489946.758526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOmvi-0002tK-Vt; Sun, 05 Feb 2023 21:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489946.758526; Sun, 05 Feb 2023 21:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pOmvi-0002pw-Sp; Sun, 05 Feb 2023 21:52:10 +0000
Received: by outflank-mailman (input) for mailman id 489946;
 Sun, 05 Feb 2023 21:52:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pOmvh-0002pq-3n
 for xen-devel@lists.xenproject.org; Sun, 05 Feb 2023 21:52:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pOmvg-0002K2-R7; Sun, 05 Feb 2023 21:52:08 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pOmvg-0000fO-L4; Sun, 05 Feb 2023 21:52:08 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=xnqDBk6xPdw309UqTwMdtSsOvwiXsPkD09RmWniMJIE=; b=ByEAfBxfgDnpgIcNZ2oGtuBBDU
	5mzY/esZIbCcg8ji1nljqUKsx+allLcgSQlNBTxVVLtzk8pp8PNB0gLz3oNMZQ1pYredhJfJccJ15
	B5X0ZpRaT8SuPVYi5QAYivfGUOR1UM62bbr+BwiKPyT/NB2bEuWOQhGnTKBbtZhiJel0=;
Message-ID: <c37bfe2e-3a2a-d916-3b7a-76ffefcc5c66@xen.org>
Date: Sun, 5 Feb 2023 21:52:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-21-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 20/40] xen/mpu: plump early_fdt_map in MPU systems
In-Reply-To: <20230113052914.3845596-21-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2023 05:28, Penny Zheng wrote:
> In MPU system, device tree binary can be packed with Xen
> image through CONFIG_DTB_FILE, or provided by bootloader through x0.
> 
> In MPU system, each section in xen.lds.S is PAGE_SIZE aligned.
> So in order to not overlap with the previous BSS section, dtb section
> should be made page-aligned too.
> We add . = ALIGN(PAGE_SIZE); in the head of dtb section to make it happen.
> 
> In this commit, we map early FDT with a transient MPU memory region at
> rear with REGION_HYPERVISOR_BOOT.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/include/asm/arm64/mpu.h |  5 +++
>   xen/arch/arm/mm_mpu.c                | 63 +++++++++++++++++++++++++---
>   xen/arch/arm/xen.lds.S               |  5 ++-
>   3 files changed, 67 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index fcde6ad0db..b85e420a90 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -45,18 +45,22 @@
>    * [3:4] Execute Never
>    * [5:6] Access Permission
>    * [7]   Region Present
> + * [8]   Boot-only Region
>    */
>   #define _REGION_AI_BIT            0
>   #define _REGION_XN_BIT            3
>   #define _REGION_AP_BIT            5
>   #define _REGION_PRESENT_BIT       7
> +#define _REGION_BOOTONLY_BIT      8

In a follow-up patch, you are replacing BOOTONLY with TRANSIENT. Please 
avoid renaming new functions and instead introduce them with the correct 
name from the start.

>   #define _REGION_XN                (2U << _REGION_XN_BIT)
>   #define _REGION_RO                (2U << _REGION_AP_BIT)
>   #define _REGION_PRESENT           (1U << _REGION_PRESENT_BIT)
> +#define _REGION_BOOTONLY          (1U << _REGION_BOOTONLY_BIT)
>   #define REGION_AI_MASK(x)         (((x) >> _REGION_AI_BIT) & 0x7U)
>   #define REGION_XN_MASK(x)         (((x) >> _REGION_XN_BIT) & 0x3U)
>   #define REGION_AP_MASK(x)         (((x) >> _REGION_AP_BIT) & 0x3U)
>   #define REGION_RO_MASK(x)         (((x) >> _REGION_AP_BIT) & 0x2U)
> +#define REGION_BOOTONLY_MASK(x)   (((x) >> _REGION_BOOTONLY_BIT) & 0x1U)
>   
>   /*
>    * _REGION_NORMAL is convenience define. It is not meant to be used
> @@ -68,6 +72,7 @@
>   #define REGION_HYPERVISOR_RO      (_REGION_NORMAL|_REGION_XN|_REGION_RO)
>   
>   #define REGION_HYPERVISOR         REGION_HYPERVISOR_RW
> +#define REGION_HYPERVISOR_BOOT    (REGION_HYPERVISOR_RW|_REGION_BOOTONLY)
>   
>   #define INVALID_REGION            (~0UL)
>   
> diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
> index 08720a7c19..b34dbf4515 100644
> --- a/xen/arch/arm/mm_mpu.c
> +++ b/xen/arch/arm/mm_mpu.c
> @@ -20,11 +20,16 @@
>    */
>   
>   #include <xen/init.h>
> +#include <xen/libfdt/libfdt.h>
>   #include <xen/mm.h>
>   #include <xen/page-size.h>
> +#include <xen/pfn.h>
> +#include <xen/sizes.h>
>   #include <xen/spinlock.h>
>   #include <asm/arm64/mpu.h>
> +#include <asm/early_printk.h>
>   #include <asm/page.h>
> +#include <asm/setup.h>
>   
>   #ifdef NDEBUG
>   static inline void
> @@ -62,6 +67,8 @@ uint64_t __ro_after_init max_xen_mpumap;
>   
>   static DEFINE_SPINLOCK(xen_mpumap_lock);
>   
> +static paddr_t dtb_paddr;
> +
>   /* Write a MPU protection region */
>   #define WRITE_PROTECTION_REGION(sel, pr, prbar_el2, prlar_el2) ({       \
>       uint64_t _sel = sel;                                                \
> @@ -403,7 +410,16 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>   
>           /* During boot time, the default index is next_fixed_region_idx. */
>           if ( system_state <= SYS_STATE_active )
> -            idx = next_fixed_region_idx;
> +        {
> +            /*
> +             * If it is a boot-only region (i.e. region for early FDT),
> +             * it shall be added from the tail for late init re-organizing
> +             */
> +            if ( REGION_BOOTONLY_MASK(flags) )
> +                idx = next_transient_region_idx;
> +            else
> +                idx = next_fixed_region_idx;
> +        }
>   
>           xen_mpumap[idx] = pr_of_xenaddr(base, limit - 1, REGION_AI_MASK(flags));
>           /* Set permission */
> @@ -465,14 +481,51 @@ int map_pages_to_xen(unsigned long virt,
>                                mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
>   }
>   
> -/* TODO: Implementation on the first usage */
> -void dump_hyp_walk(vaddr_t addr) > +void * __init early_fdt_map(paddr_t fdt_paddr)

A fair amount of this code is the same as the MMU version. Can we share 
some code?

>   {
> +    void *fdt_virt;
> +    uint32_t size;
> +
> +    /*
> +     * Check whether the physical FDT address is set and meets the minimum
> +     * alignment requirement. Since we are relying on MIN_FDT_ALIGN to be at
> +     * least 8 bytes so that we always access the magic and size fields
> +     * of the FDT header after mapping the first chunk, double check if
> +     * that is indeed the case.
> +     */
> +     BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
> +     if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
> +         return NULL;
> +
> +    dtb_paddr = fdt_paddr;
> +    /*
> +     * In MPU system, device tree binary can be packed with Xen image
> +     * through CONFIG_DTB_FILE, or provided by bootloader through x0.
> +     * Map FDT with a transient MPU memory region of MAX_FDT_SIZE.
> +     * After that, we can do some magic check.
> +     */
> +    if ( map_pages_to_xen(round_pgdown(fdt_paddr),
> +                          maddr_to_mfn(round_pgdown(fdt_paddr)),
> +                          round_pgup(MAX_FDT_SIZE) >> PAGE_SHIFT,
> +                          REGION_HYPERVISOR_BOOT) )
> +        panic("Unable to map the device-tree.\n");
> +
> +    /* VA == PA */
> +    fdt_virt = maddr_to_virt(fdt_paddr);
> +
> +    if ( fdt_magic(fdt_virt) != FDT_MAGIC )
> +        return NULL;
> +
> +    size = fdt_totalsize(fdt_virt);
> +    if ( size > MAX_FDT_SIZE )
> +        return NULL;
> +
> +    return fdt_virt;
>   }
>   
> -void * __init early_fdt_map(paddr_t fdt_paddr)

Same as the previous patch, why do you implmenet early_fdt_map() at a 
different place in the file?

> +/* TODO: Implementation on the first usage */
> +void dump_hyp_walk(vaddr_t addr)
>   {
> -    return NULL;
>   }
>   
>   void __init remove_early_mappings(void)
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 79965a3c17..0565e22a1f 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -218,7 +218,10 @@ SECTIONS
>     _end = . ;
>   
>     /* Section for the device tree blob (if any). */
> -  .dtb : { *(.dtb) } :text
> +  .dtb : {
> +      . = ALIGN(PAGE_SIZE);
> +      *(.dtb)
> +  } :text
>   
>     DWARF2_DEBUG_SECTIONS
>   

Cheers,

-- 
Julien Grall

