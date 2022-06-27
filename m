Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 261C755B7EA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 08:24:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356203.584281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5i9e-0002AS-5U; Mon, 27 Jun 2022 06:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356203.584281; Mon, 27 Jun 2022 06:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5i9e-00027R-2h; Mon, 27 Jun 2022 06:23:26 +0000
Received: by outflank-mailman (input) for mailman id 356203;
 Mon, 27 Jun 2022 06:23:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXPS=XC=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o5i9c-00027L-JJ
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 06:23:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a4c350e1-f5e1-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 08:23:22 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3CD02B;
 Sun, 26 Jun 2022 23:23:21 -0700 (PDT)
Received: from [10.57.42.186] (unknown [10.57.42.186])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 059B03F5A1;
 Sun, 26 Jun 2022 23:23:19 -0700 (PDT)
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
X-Inumbo-ID: a4c350e1-f5e1-11ec-b725-ed86ccbb4733
Message-ID: <f078812a-bdd0-d27b-28ce-62c0c131ecdb@arm.com>
Date: Mon, 27 Jun 2022 08:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/7] xen/arm: Remove most of the *_VIRT_END defines
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-2-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220624091146.35716-2-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 24.06.2022 11:11, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, *_VIRT_END may either point to the address after the end
> or the last address of the region.
> 
> The lack of consistency make quite difficult to reason with them.
> 
> Furthermore, there is a risk of overflow in the case where the address
> points past to the end. I am not aware of any cases, so this is only a
> latent bug.
> 
> Start to solve the problem by removing all the *_VIRT_END exclusively used
> by the Arm code and add *_VIRT_SIZE when it is not present.
> 
> Take the opportunity to rename BOOT_FDT_SLOT_SIZE to BOOT_FDT_VIRT_SIZE
> for better consistency and use _AT(vaddr_t, ).
> 
> Also take the opportunity to fix the coding style of the comment touched
> in mm.c.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
> 
> I noticed that a few functions in Xen expect [start, end[. This is risky
> as we may end up with end < start if the region is defined right at the
> top of the address space.
> 
> I haven't yet tackle this issue. But I would at least like to get rid
> of *_VIRT_END.
> 
> This was originally sent separately (lets call it v0).
> 
>     Changes in v1:
>         - Mention the coding style change.
> ---
>  xen/arch/arm/include/asm/config.h | 18 ++++++++----------
>  xen/arch/arm/livepatch.c          |  2 +-
>  xen/arch/arm/mm.c                 | 13 ++++++++-----
>  3 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
> index 3e2a55a91058..66db618b34e7 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -111,12 +111,11 @@
>  #define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SIZE)
>  
>  #define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
> -#define BOOT_FDT_SLOT_SIZE     MB(4)
> -#define BOOT_FDT_VIRT_END      (BOOT_FDT_VIRT_START + BOOT_FDT_SLOT_SIZE)
> +#define BOOT_FDT_VIRT_SIZE     _AT(vaddr_t, MB(4))
>  
>  #ifdef CONFIG_LIVEPATCH
>  #define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
> -#define LIVEPATCH_VMAP_END     (LIVEPATCH_VMAP_START + MB(2))
> +#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
>  #endif
>  
>  #define HYPERVISOR_VIRT_START  XEN_VIRT_START
> @@ -132,18 +131,18 @@
>  #define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
>  
>  #define VMAP_VIRT_START        _AT(vaddr_t,0x10000000)
> +#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
>  
>  #define XENHEAP_VIRT_START     _AT(vaddr_t,0x40000000)
> -#define XENHEAP_VIRT_END       _AT(vaddr_t,0x7fffffff)
> -#define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
> -#define DOMHEAP_VIRT_END       _AT(vaddr_t,0xffffffff)
> +#define XENHEAP_VIRT_SIZE      _AT(vaddr_t, GB(1))
>  
> -#define VMAP_VIRT_END    XENHEAP_VIRT_START
> +#define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
> +#define DOMHEAP_VIRT_SIZE      _AT(vaddr_t, GB(2))
>  
>  #define DOMHEAP_ENTRIES        1024  /* 1024 2MB mapping slots */
>  
>  /* Number of domheap pagetable pages required at the second level (2MB mappings) */
> -#define DOMHEAP_SECOND_PAGES ((DOMHEAP_VIRT_END - DOMHEAP_VIRT_START + 1) >> FIRST_SHIFT)
> +#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
>  
>  #else /* ARM_64 */
>  
> @@ -152,12 +151,11 @@
>  #define SLOT0_ENTRY_SIZE  SLOT0(1)
>  
>  #define VMAP_VIRT_START  GB(1)
> -#define VMAP_VIRT_END    (VMAP_VIRT_START + GB(1))
> +#define VMAP_VIRT_SIZE   GB(1)
>  
>  #define FRAMETABLE_VIRT_START  GB(32)
>  #define FRAMETABLE_SIZE        GB(32)
>  #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
> -#define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
>  
>  #define DIRECTMAP_VIRT_START   SLOT0(256)
>  #define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
> diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
> index 75e8adcfd6a1..57abc746e60b 100644
> --- a/xen/arch/arm/livepatch.c
> +++ b/xen/arch/arm/livepatch.c
> @@ -175,7 +175,7 @@ void __init arch_livepatch_init(void)
>      void *start, *end;
>  
>      start = (void *)LIVEPATCH_VMAP_START;
> -    end = (void *)LIVEPATCH_VMAP_END;
> +    end = start + LIVEPATCH_VMAP_SIZE;
>  
>      vm_init_type(VMAP_XEN, start, end);
>  
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index be37176a4725..0607c65f95cd 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -128,9 +128,11 @@ static DEFINE_PAGE_TABLE(xen_first);
>  /* xen_pgtable == root of the trie (zeroeth level on 64-bit, first on 32-bit) */
>  static DEFINE_PER_CPU(lpae_t *, xen_pgtable);
>  #define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
> -/* xen_dommap == pages used by map_domain_page, these pages contain
> +/*
> + * xen_dommap == pages used by map_domain_page, these pages contain
>   * the second level pagetables which map the domheap region
> - * DOMHEAP_VIRT_START...DOMHEAP_VIRT_END in 2MB chunks. */
> + * starting at DOMHEAP_VIRT_START in 2MB chunks.
> + */
>  static DEFINE_PER_CPU(lpae_t *, xen_dommap);
>  /* Root of the trie for cpu0, other CPU's PTs are dynamically allocated */
>  static DEFINE_PAGE_TABLE(cpu0_pgtable);
> @@ -476,7 +478,7 @@ mfn_t domain_page_map_to_mfn(const void *ptr)
>      int slot = (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
>      unsigned long offset = (va>>THIRD_SHIFT) & XEN_PT_LPAE_ENTRY_MASK;
>  
> -    if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )
> +    if ( (va >= VMAP_VIRT_START) && ((VMAP_VIRT_START - va) < VMAP_VIRT_SIZE) )
The second condition does not seem to be correct. Instead, this check should like like following:
if ( (va >= VMAP_VIRT_START) && (va < (VMAP_VIRT_START + VMAP_VIRT_SIZE)) )

>          return virt_to_mfn(va);
>  
>      ASSERT(slot >= 0 && slot < DOMHEAP_ENTRIES);
> @@ -570,7 +572,8 @@ void __init remove_early_mappings(void)
>      int rc;
>  
>      /* destroy the _PAGE_BLOCK mapping */
> -    rc = modify_xen_mappings(BOOT_FDT_VIRT_START, BOOT_FDT_VIRT_END,
> +    rc = modify_xen_mappings(BOOT_FDT_VIRT_START,
> +                             BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE,
>                               _PAGE_BLOCK);
>      BUG_ON(rc);
>  }
> @@ -850,7 +853,7 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>  
>  void *__init arch_vmap_virt_end(void)
>  {
> -    return (void *)VMAP_VIRT_END;
> +    return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
>  }
>  
>  /*

The rest looks good.

Cheers,
Michal

