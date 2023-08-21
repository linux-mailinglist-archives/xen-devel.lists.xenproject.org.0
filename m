Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A184D783046
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 20:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587800.919204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY9hc-0002Rt-0P; Mon, 21 Aug 2023 18:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587800.919204; Mon, 21 Aug 2023 18:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY9hb-0002Q9-TM; Mon, 21 Aug 2023 18:32:35 +0000
Received: by outflank-mailman (input) for mailman id 587800;
 Mon, 21 Aug 2023 18:32:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qY9ha-0002Py-6j
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 18:32:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY9hZ-0006IK-LV; Mon, 21 Aug 2023 18:32:33 +0000
Received: from [54.239.6.178] (helo=[192.168.0.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY9hZ-0007ol-FB; Mon, 21 Aug 2023 18:32:33 +0000
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
	bh=jDAjLywbQQ2qFbJip23pXPK4n8kQudBgutFd/sffvPw=; b=sK/KckO3VhGXfhFm5PzFGpQamG
	ZjKOmoUbN7SaW3mi6+0UUTO6iHVj1/5Lz3VYMvr49/fyEuqgOQFaXsKypvbRYQtq8Fr0E5dcHctRq
	OmZgihJgZZVUK0iPtKhakNMdiIfYiKkUI7UiPrmPrMjoXmspPBqFCjRrP4oRvSuVM4nY=;
Message-ID: <c039015f-43d4-491f-b44c-8ece186e08e4@xen.org>
Date: Mon, 21 Aug 2023 19:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/13] xen/arm: mm: Use generic variable/function names
 for extendability
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-10-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814042536.878720-10-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/08/2023 05:25, Henry Wang wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> As preparation for MPU support, which will use some variables/functions
> for both MMU and MPU system, We rename the affected variable/function
> to more generic names:
> - init_ttbr -> init_mm,

You moved init_ttbr to mm/mmu.c. So why does this need to be renamed?

And if you really planned to use it for the MPU code. Then init_ttbr 
should not have been moved.

> - mmu_init_secondary_cpu() -> mm_init_secondary_cpu()
> - init_secondary_pagetables() -> init_secondary_mm()

The original naming were not great but the new one are a lot more 
confusing as they seem to just be a reshuffle of word.

mm_init_secondary_cpu() is only setting the WxN bit. For the MMU, I 
think it can be done much earlier. Do you have anything to add in it? If 
not, then I would consider to get rid of it.

For init_secondary_mm(), I would renamed it to prepare_secondary_mm().

> - Add a wrapper update_mm_mapping() for MMU system's
>    update_identity_mapping()
> 
> Modify the related in-code comment to reflect above changes, take the
> opportunity to fix the incorrect coding style of the in-code comments.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v5:
> - Rebase on top of xen/arm: mm: add missing extern variable declaration
> v4:
> - Extract the renaming part from the original patch:
>    "[v3,13/52] xen/mmu: extract mmu-specific codes from mm.c/mm.h"
> ---
>   xen/arch/arm/arm32/head.S           |  4 ++--
>   xen/arch/arm/arm64/mmu/head.S       |  2 +-
>   xen/arch/arm/arm64/mmu/mm.c         | 11 ++++++++---
>   xen/arch/arm/arm64/smpboot.c        |  6 +++---
>   xen/arch/arm/include/asm/arm64/mm.h |  7 ++++---
>   xen/arch/arm/include/asm/mm.h       | 12 +++++++-----
>   xen/arch/arm/mmu/mm.c               | 20 ++++++++++----------
>   xen/arch/arm/smpboot.c              |  4 ++--
>   8 files changed, 37 insertions(+), 29 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 33b038e7e0..03ab68578a 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -238,11 +238,11 @@ GLOBAL(init_secondary)
>   secondary_switched:
>           /*
>            * Non-boot CPUs need to move on to the proper pagetables, which were
> -         * setup in init_secondary_pagetables.
> +         * setup in init_secondary_mm.
>            *
>            * XXX: This is not compliant with the Arm Arm.
>            */
> -        mov_w r4, init_ttbr          /* VA of HTTBR value stashed by CPU 0 */
> +        mov_w r4, init_mm            /* VA of HTTBR value stashed by CPU 0 */
>           ldrd  r4, r5, [r4]           /* Actual value */
>           dsb
>           mcrr  CP64(r4, r5, HTTBR)
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index ba2ddd7e67..58d91c9088 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -302,7 +302,7 @@ ENDPROC(enable_mmu)
>   ENTRY(enable_secondary_cpu_mm)
>           mov   x5, lr
>   
> -        load_paddr x0, init_ttbr
> +        load_paddr x0, init_mm
>           ldr   x0, [x0]
>   
>           bl    enable_mmu
> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> index 78b7c7eb00..ed0fc5ff7b 100644
> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -106,7 +106,7 @@ void __init arch_setup_page_tables(void)
>       prepare_runtime_identity_mapping();
>   }
>   
> -void update_identity_mapping(bool enable)
> +static void update_identity_mapping(bool enable)

Why not simply renaming this function to update_mm_mapping()? But...

>   {
>       paddr_t id_addr = virt_to_maddr(_start);
>       int rc;
> @@ -120,6 +120,11 @@ void update_identity_mapping(bool enable)
>       BUG_ON(rc);
>   }
>   
> +void update_mm_mapping(bool enable)

... the new name it quite confusing. What is the mapping it is referring to?

If you don't want to keep update_identity_mapping(), then I would 
consider to simply wrap...

> +{
> +    update_identity_mapping(enable);
> +}
> +
>   extern void switch_ttbr_id(uint64_t ttbr);
>   
>   typedef void (switch_ttbr_fn)(uint64_t ttbr);
> @@ -131,7 +136,7 @@ void __init switch_ttbr(uint64_t ttbr)
>       lpae_t pte;
>   
>       /* Enable the identity mapping in the boot page tables */
> -    update_identity_mapping(true);
> +    update_mm_mapping(true);
>   
>       /* Enable the identity mapping in the runtime page tables */
>       pte = pte_of_xenaddr((vaddr_t)switch_ttbr_id);
> @@ -148,7 +153,7 @@ void __init switch_ttbr(uint64_t ttbr)
>        * Note it is not necessary to disable it in the boot page tables
>        * because they are not going to be used by this CPU anymore.
>        */
> -    update_identity_mapping(false);
> +    update_mm_mapping(false);
>   }
>   
>   /*
> diff --git a/xen/arch/arm/arm64/smpboot.c b/xen/arch/arm/arm64/smpboot.c
> index 9637f42469..2b1d086a1e 100644
> --- a/xen/arch/arm/arm64/smpboot.c
> +++ b/xen/arch/arm/arm64/smpboot.c
> @@ -111,18 +111,18 @@ int arch_cpu_up(int cpu)
>       if ( !smp_enable_ops[cpu].prepare_cpu )
>           return -ENODEV;
>   
> -    update_identity_mapping(true);
> +    update_mm_mapping(true);

... with #ifdef CONFIG_MMU here...

>   
>       rc = smp_enable_ops[cpu].prepare_cpu(cpu);
>       if ( rc )
> -        update_identity_mapping(false);
> +        update_mm_mapping(false);

... here and ...


>   
>       return rc;
>   }
>   
>   void arch_cpu_up_finish(void)
>   {
> -    update_identity_mapping(false);
> +    update_mm_mapping(false);

... here.

>   }
>   
>   /*
> diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
> index e0bd23a6ed..7a389c4b21 100644
> --- a/xen/arch/arm/include/asm/arm64/mm.h
> +++ b/xen/arch/arm/include/asm/arm64/mm.h
> @@ -15,13 +15,14 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>   void arch_setup_page_tables(void);
>   
>   /*
> - * Enable/disable the identity mapping in the live page-tables (i.e.
> - * the one pointed by TTBR_EL2).
> + * In MMU system, enable/disable the identity mapping in the live
> + * page-tables (i.e. the one pointed by TTBR_EL2) through
> + * update_identity_mapping().
>    *
>    * Note that nested call (e.g. enable=true, enable=true) is not
>    * supported.
>    */
> -void update_identity_mapping(bool enable);
> +void update_mm_mapping(bool enable);
>   
>   #endif /* __ARM_ARM64_MM_H__ */
>   
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index dc1458b047..8084c62c01 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -170,7 +170,7 @@ struct page_info
>   #define PGC_need_scrub    PGC_allocated
>   
>   /* Non-boot CPUs use this to find the correct pagetables. */
> -extern uint64_t init_ttbr;
> +extern uint64_t init_mm;
>   
>   #ifdef CONFIG_ARM_32
>   #define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
> @@ -205,11 +205,13 @@ extern void setup_pagetables(unsigned long boot_phys_offset);
>   extern void *early_fdt_map(paddr_t fdt_paddr);
>   /* Remove early mappings */
>   extern void remove_early_mappings(void);
> -/* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
> - * new page table */
> -extern int init_secondary_pagetables(int cpu);
> +/*
> + * Allocate and initialise pagetables for a secondary CPU. Sets init_mm to the
> + * new page table
> + */
> +extern int init_secondary_mm(int cpu);
>   /* Switch secondary CPUS to its own pagetables and finalise MMU setup */

Regardless what I wrote above, this comment is not accurate anymore as 
we don't switch the page tables for the secondary CPUs. We are only 
enable WxN.

In any case, this comment would need to be reworded to be more generic.

Cheers,

-- 
Julien Grall

