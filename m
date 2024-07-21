Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2AE938409
	for <lists+xen-devel@lfdr.de>; Sun, 21 Jul 2024 10:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761348.1171308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVSDa-0007bR-74; Sun, 21 Jul 2024 08:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761348.1171308; Sun, 21 Jul 2024 08:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVSDa-0007Zb-4A; Sun, 21 Jul 2024 08:46:58 +0000
Received: by outflank-mailman (input) for mailman id 761348;
 Sun, 21 Jul 2024 08:46:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sVSDX-0007ZV-TJ
 for xen-devel@lists.xenproject.org; Sun, 21 Jul 2024 08:46:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sVSDX-00022h-Bt; Sun, 21 Jul 2024 08:46:55 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sVSDX-0005x1-3M; Sun, 21 Jul 2024 08:46:55 +0000
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
	bh=DZNadkR7hvtm84GP3b19HRXbzyRyW5fdIGFfipsrH+k=; b=H2kZSZ8SK4q2ynaKKFasOh0Dxl
	mHyG+Mt3aR8nJwH7UYEQWgdo+8oUVd9Xzry22YHal/YhbhxHZSTKvdlexXr1FcorWRrJy2YcTNpID
	wKGKPlpi0j9gb8paE4ZBP/25+TMlo2Rsdnt8A/F6VY3BWBJaW7hQofvp+wS3i42ZGrG8=;
Message-ID: <8fd1cc2c-9dda-4e74-b242-fe8aa862955d@xen.org>
Date: Sun, 21 Jul 2024 09:46:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] xen/riscv: setup fixmap mapping
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 12/07/2024 17:22, Oleksii Kurochko wrote:
> Introduce a function to set up fixmap mappings and L0 page
> table for fixmap.
> 
> Additionally, defines were introduced in riscv/config.h to
> calculate the FIXMAP_BASE address.
> This involved introducing BOOT_FDT_VIRT_{START, SIZE} and
> XEN_SIZE, XEN_VIRT_END.
> 
> Also, the check of Xen size was updated in the riscv/lds.S
> script to use XEN_SIZE instead of a hardcoded constant.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>   - newly introduced patch
> ---
>   xen/arch/riscv/include/asm/config.h |  9 ++++++
>   xen/arch/riscv/include/asm/fixmap.h | 48 +++++++++++++++++++++++++++++
>   xen/arch/riscv/include/asm/mm.h     |  2 ++
>   xen/arch/riscv/include/asm/page.h   |  7 +++++
>   xen/arch/riscv/mm.c                 | 35 +++++++++++++++++++++
>   xen/arch/riscv/setup.c              |  2 ++
>   xen/arch/riscv/xen.lds.S            |  2 +-
>   7 files changed, 104 insertions(+), 1 deletion(-)
>   create mode 100644 xen/arch/riscv/include/asm/fixmap.h
> 
> diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
> index 50583aafdc..3275477c17 100644
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -74,11 +74,20 @@
>   #error "unsupported RV_STAGE1_MODE"
>   #endif
>   
> +#define XEN_SIZE                MB(2)

NIT: I would name it XEN_VIRT_SIZE to be consistent with the start/end.

> +#define XEN_VIRT_END            (XEN_VIRT_START + XEN_SIZE)
Can we get away with not introducing *_END and just use START, SIZE? The 
reason I am asking is with "end" it is never clear whether it is 
inclusive or exclusive. For instance, here you use an exclusive range 
but ...

> +
> +#define BOOT_FDT_VIRT_START     XEN_VIRT_END
> +#define BOOT_FDT_VIRT_SIZE      MB(4)
> +
>   #define DIRECTMAP_SLOT_END      509
>   #define DIRECTMAP_SLOT_START    200
>   #define DIRECTMAP_VIRT_START    SLOTN(DIRECTMAP_SLOT_START)
>   #define DIRECTMAP_SIZE          (SLOTN(DIRECTMAP_SLOT_END) - SLOTN(DIRECTMAP_SLOT_START))
>   
> +#define FIXMAP_BASE             (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
> +#define FIXMAP_ADDR(n)          (FIXMAP_BASE + (n) * PAGE_SIZE)
> +
>   #define FRAMETABLE_SCALE_FACTOR  (PAGE_SIZE/sizeof(struct page_info))
>   #define FRAMETABLE_SIZE_IN_SLOTS (((DIRECTMAP_SIZE / SLOTN(1)) / FRAMETABLE_SCALE_FACTOR) + 1)
>   
> diff --git a/xen/arch/riscv/include/asm/fixmap.h b/xen/arch/riscv/include/asm/fixmap.h
> new file mode 100644
> index 0000000000..fcfb82d69c
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/fixmap.h
> @@ -0,0 +1,48 @@
> +/*
> + * fixmap.h: compile-time virtual memory allocation
> + */
> +#ifndef __ASM_FIXMAP_H
> +#define __ASM_FIXMAP_H
> +
> +#include <xen/bug.h>
> +#include <xen/page-size.h>
> +#include <xen/pmap.h>
> +
> +#include <asm/page.h>
> +
> +/* Fixmap slots */
> +#define FIX_PMAP_BEGIN (0) /* Start of PMAP */
> +#define FIX_PMAP_END (FIX_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of PMAP */

... here is seems to be inclusive. Furthermore if you had 32-bit address 
space, it is also quite easy to have to create a region right at the top 
of it. So when END is exclusive, it would become 0.

So on Arm, we decided to start to get rid of "end". I would consider to 
do the same on RISC-V for new functions.

> +#define FIX_MISC (FIX_PMAP_END + 1)  /* Ephemeral mappings of hardware */

Are you going to use this fixmap? If not, then I would consider to 
remove it.

> +
> +#define FIX_LAST FIX_MISC
> +
> +#define FIXADDR_START FIXMAP_ADDR(0)
> +#define FIXADDR_TOP FIXMAP_ADDR(FIX_LAST)
> +
> +#ifndef __ASSEMBLY__
> +
> +/*
> + * Direct access to xen_fixmap[] should only happen when {set,
> + * clear}_fixmap() is unusable (e.g. where we would end up to
> + * recursively call the helpers).
> + */
> +extern pte_t xen_fixmap[];
> +
> +/* Map a page in a fixmap entry */
> +extern void set_fixmap(unsigned int map, mfn_t mfn, unsigned int attributes);
> +/* Remove a mapping from a fixmap entry */
> +extern void clear_fixmap(unsigned int map);

Neither of the functions seem to be implemented in this patch. Can you 
clarify what's the plan for them?

Also, I know that for x86/arm, we have some function prefixed with 
extern. But AFAIK, we are trying to get rid of them.

In any case, I think for RISC-V we need some consistency. For instance, 
here you define with extern but...

> +
> +#define fix_to_virt(slot) ((void *)FIXMAP_ADDR(slot))
> +
> +static inline unsigned int virt_to_fix(vaddr_t vaddr)
> +{
> +    BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
> +
> +    return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
> +}
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* __ASM_FIXMAP_H */
> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
> index 25af9e1aaa..a0bdc2bc3a 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -255,4 +255,6 @@ static inline unsigned int arch_get_dma_bitsize(void)
>       return 32; /* TODO */
>   }
>   
> +void setup_fixmap_mappings(void);

... here it is without.

> +
>   #endif /* _ASM_RISCV_MM_H */
> diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
> index c831e16417..cbbf3656d1 100644
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -81,6 +81,13 @@ static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
>       BUG_ON("unimplemented");
>   }
>   
> +/* Write a pagetable entry. */
> +static inline void write_pte(pte_t *p, pte_t pte)
> +{
> +    *p = pte;
> +    asm volatile ("sfence.vma");
> +}
> +
>   #endif /* __ASSEMBLY__ */
>   
>   #endif /* _ASM_RISCV_PAGE_H */
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> index 7d09e781bf..d69a174b5d 100644
> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -49,6 +49,9 @@ stage1_pgtbl_root[PAGETABLE_ENTRIES];
>   pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>   stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT * PAGETABLE_ENTRIES];
>   
> +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> +xen_fixmap[PAGETABLE_ENTRIES];

Can you add a BUILD_BUG_ON() to check that the number of entries in the 
fixmap will never be above PAGETABLE_ENTRIES?

> +
>   #define HANDLE_PGTBL(curr_lvl_num)                                          \
>       index = pt_index(curr_lvl_num, page_addr);                              \
>       if ( pte_is_valid(pgtbl[index]) )                                       \
> @@ -191,6 +194,38 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
>       return is_mode_supported;
>   }
>   
> +void __init setup_fixmap_mappings(void)
> +{
> +    pte_t *pte;
> +    unsigned int i;
> +
> +    pte = &stage1_pgtbl_root[pt_index(HYP_PT_ROOT_LEVEL, FIXMAP_ADDR(0))];
> +
> +    for ( i = HYP_PT_ROOT_LEVEL - 1; i != 0; i-- )

I am a little bit confused with the - 1. Is this because you only want 
to map at L1 (I am not sure if this is the correct naming for RISC-V)?

In any case, I think it would be worth a comment.

> +    {
> +        BUG_ON(!pte_is_valid(*pte));
> +
> +        pte = (pte_t *)LOAD_TO_LINK(pte_to_paddr(*pte));
> +        pte = &pte[pt_index(i, FIXMAP_ADDR(0))];
> +    }
> +
> +    BUG_ON( pte_is_valid(*pte) );

Coding style: BUG_ON(pte_is_valid(*pte));

> +
> +    if ( !pte_is_valid(*pte) )

I am a bit confused with this check. Above, Xen will crash if the PTE is 
valid. So why do we need a runtime check?

> +    {
> +        pte_t tmp = paddr_to_pte(LINK_TO_LOAD((unsigned long)&xen_fixmap), PTE_TABLE);
> +
> +        write_pte(pte, tmp);
> +
> +        printk("(XEN) fixmap is mapped\n");
> +    }
> +
> +    /*
> +     * We only need the zeroeth table allocated, but not the PTEs set, because
> +     * set_fixmap() will set them on the fly.

This function doesn't seem to exists yet (?).

> +     */
> +}
> +
>   /*
>    * setup_initial_pagetables:
>    *
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 4defad68f4..13f0e8c77d 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -46,6 +46,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>       test_macros_from_bug_h();
>   #endif
>   
> +    setup_fixmap_mappings();
> +
>       printk("All set up\n");
>   
>       for ( ;; )
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index 070b19d915..63b1dd7bb6 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -181,6 +181,6 @@ ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
>    * Changing the size of Xen binary can require an update of
>    * PGTBL_INITIAL_COUNT.
>    */
> -ASSERT(_end - _start <= MB(2), "Xen too large for early-boot assumptions")
> +ASSERT(_end - _start <= XEN_SIZE, "Xen too large for early-boot assumptions")
>   
>   ASSERT(_ident_end - _ident_start <= IDENT_AREA_SIZE, "identity region is too big");

Cheers,

-- 
Julien Grall

