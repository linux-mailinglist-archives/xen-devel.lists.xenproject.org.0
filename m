Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9794F412A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 23:27:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299295.509909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbqhk-0007DJ-Hk; Tue, 05 Apr 2022 21:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299295.509909; Tue, 05 Apr 2022 21:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbqhk-0007BD-E8; Tue, 05 Apr 2022 21:27:12 +0000
Received: by outflank-mailman (input) for mailman id 299295;
 Tue, 05 Apr 2022 21:27:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzGd=UP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nbqhj-0007B7-43
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 21:27:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 265d85ea-b527-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 23:27:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB169B81FCC;
 Tue,  5 Apr 2022 21:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFA5C385A0;
 Tue,  5 Apr 2022 21:27:07 +0000 (UTC)
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
X-Inumbo-ID: 265d85ea-b527-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649194027;
	bh=ngvpwmI93N1gEc4OkREiMZqxJruyrnJnmYo76hyTizc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M/hUAy39E3uVgpYf8Z0UjhHCzx7B2uKzO4jKeTevEgbYVPQqLPLyTdGOgznzA5LlL
	 5+BTAfQwp1rDkn8n89q7hC1HJQpUCuP8J7RJeRXzve3uY8E3mLU2sHcJov75RAV5sS
	 3VRAz6cRaQ5L5DFuwpVpVmwdjKm6+ZUZ+FVaI0ECtVLW9Zz13hu1y9/BNyt8xCQkTs
	 KykREcb8O+ig6dcd1xgGPMEZxuG1SZTuh8VdocSjhMZyOhpxzaop9yndNZ1gguv5+L
	 iaEf9RNtfYmpQyOpQ6TM/QjdCCjWdwNu2PXxOsvjJQrntJZPxHXypaotMweZab2gbI
	 kBWWKzxCLpHzQ==
Date: Tue, 5 Apr 2022 14:27:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Hongyan Xia <hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 14/19] xen/arm: add Persistent Map (PMAP)
 infrastructure
In-Reply-To: <20220221102218.33785-15-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204051423490.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-15-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-878656267-1649194027=:2910984"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-878656267-1649194027=:2910984
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 21 Feb 2022, Julien Grall wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> The basic idea is like Persistent Kernel Map (PKMAP) in Linux. We
> pre-populate all the relevant page tables before the system is fully
> set up.
> 
> We will need it on Arm in order to rework the arm64 version of
> xenheap_setup_mappings() as we may need to use pages allocated from
> the boot allocator before they are effectively mapped.
> 
> This infrastructure is not lock-protected therefore can only be used
> before smpboot. After smpboot, map_domain_page() has to be used.
> 
> This is based on the x86 version [1] that was originally implemented
> by Wei Liu.
> 
> The PMAP infrastructure is implemented in common code with some
> arch helpers to set/clear the page-table entries and convertion
> between a fixmap slot to a virtual address...
> 
> As mfn_to_xen_entry() now needs to be exported, take the opportunity
> to swich the parameter attr from unsigned to unsigned int.
> 
> [1] <e92da4ad6015b6089737fcccba3ec1d6424649a5.1588278317.git.hongyxia@amazon.com>
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> [julien: Adapted for Arm]
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v3:
>         - s/BITS_PER_LONG/BITS_PER_BYTE/
>         - Move pmap to common code
> 
>     Changes in v2:
>         - New patch
> 
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/arm/Kconfig              |  1 +
>  xen/arch/arm/include/asm/fixmap.h | 17 +++++++
>  xen/arch/arm/include/asm/lpae.h   |  8 ++++
>  xen/arch/arm/include/asm/pmap.h   | 33 +++++++++++++
>  xen/arch/arm/mm.c                 |  7 +--
>  xen/common/Kconfig                |  3 ++
>  xen/common/Makefile               |  1 +
>  xen/common/pmap.c                 | 79 +++++++++++++++++++++++++++++++
>  xen/include/xen/pmap.h            | 16 +++++++
>  9 files changed, 159 insertions(+), 6 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/pmap.h
>  create mode 100644 xen/common/pmap.c
>  create mode 100644 xen/include/xen/pmap.h
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4d3..a89a67802aa9 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -14,6 +14,7 @@ config ARM
>  	select HAS_DEVICE_TREE
>  	select HAS_PASSTHROUGH
>  	select HAS_PDX
> +	select HAS_PMAP
>  	select IOMMU_FORCE_PT_SHARE
>  
>  config ARCH_DEFCONFIG
> diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
> index 1cee51e52ab9..c46a15e59de4 100644
> --- a/xen/arch/arm/include/asm/fixmap.h
> +++ b/xen/arch/arm/include/asm/fixmap.h
> @@ -5,12 +5,20 @@
>  #define __ASM_FIXMAP_H
>  
>  #include <xen/acpi.h>
> +#include <xen/pmap.h>
>  
>  /* Fixmap slots */
>  #define FIXMAP_CONSOLE  0  /* The primary UART */
>  #define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
>  #define FIXMAP_ACPI_BEGIN  2  /* Start mappings of ACPI tables */
>  #define FIXMAP_ACPI_END    (FIXMAP_ACPI_BEGIN + NUM_FIXMAP_ACPI_PAGES - 1)  /* End mappings of ACPI tables */
> +#define FIXMAP_PMAP_BEGIN (FIXMAP_ACPI_END + 1) /* Start of PMAP */
> +#define FIXMAP_PMAP_END (FIXMAP_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of PMAP */
> +
> +#define FIXMAP_LAST FIXMAP_PMAP_END
> +
> +#define FIXADDR_START FIXMAP_ADDR(0)
> +#define FIXADDR_TOP FIXMAP_ADDR(FIXMAP_LAST)
>  
>  #ifndef __ASSEMBLY__
>  
> @@ -19,6 +27,15 @@ extern void set_fixmap(unsigned map, mfn_t mfn, unsigned attributes);
>  /* Remove a mapping from a fixmap entry */
>  extern void clear_fixmap(unsigned map);
>  
> +#define fix_to_virt(slot) ((void *)FIXMAP_ADDR(slot))
> +
> +static inline unsigned int virt_to_fix(vaddr_t vaddr)
> +{
> +    BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
> +
> +    return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
> +}
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* __ASM_FIXMAP_H */
> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
> index 8cf932b5c947..6099037da1c0 100644
> --- a/xen/arch/arm/include/asm/lpae.h
> +++ b/xen/arch/arm/include/asm/lpae.h
> @@ -4,6 +4,7 @@
>  #ifndef __ASSEMBLY__
>  
>  #include <xen/page-defs.h>
> +#include <xen/mm-frame.h>
>  
>  /*
>   * WARNING!  Unlike the x86 pagetable code, where l1 is the lowest level and
> @@ -168,6 +169,13 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
>          third_table_offset(addr)            \
>      }
>  
> +/*
> + * Standard entry type that we'll use to build Xen's own pagetables.
> + * We put the same permissions at every level, because they're ignored
> + * by the walker in non-leaf entries.
> + */
> +lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
> +
>  #endif /* __ASSEMBLY__ */
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/pmap.h b/xen/arch/arm/include/asm/pmap.h
> new file mode 100644
> index 000000000000..70eafe2891d7
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/pmap.h
> @@ -0,0 +1,33 @@
> +#ifndef __ASM_PMAP_H__
> +#define __ASM_PMAP_H__
> +
> +#include <xen/mm.h>
> +
> +/* XXX: Find an header to declare it */
> +extern lpae_t xen_fixmap[XEN_PT_LPAE_ENTRIES];

Why not fixmap.h?

The rest of the ARM stuff looks fine.


> +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
> +{
> +    lpae_t *entry = &xen_fixmap[slot];
> +    lpae_t pte;
> +
> +    ASSERT(!lpae_is_valid(*entry));
> +
> +    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
> +    pte.pt.table = 1;
> +    write_pte(entry, pte);
> +}
> +
> +static inline void arch_pmap_unmap(unsigned int slot)
> +{
> +    lpae_t pte = {};
> +
> +    write_pte(&xen_fixmap[slot], pte);
> +
> +    flush_xen_tlb_range_va_local(FIXMAP_ADDR(slot), PAGE_SIZE);
> +}
> +
> +void arch_pmap_map_slot(unsigned int slot, mfn_t mfn);
> +void arch_pmap_clear_slot(void *ptr);
> +
> +#endif /* __ASM_PMAP_H__ */
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index d6a4b9407c43..b7942464d4de 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -290,12 +290,7 @@ void dump_hyp_walk(vaddr_t addr)
>      dump_pt_walk(ttbr, addr, HYP_PT_ROOT_LEVEL, 1);
>  }
>  
> -/*
> - * Standard entry type that we'll use to build Xen's own pagetables.
> - * We put the same permissions at every level, because they're ignored
> - * by the walker in non-leaf entries.
> - */
> -static inline lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned attr)
> +lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
>  {
>      lpae_t e = (lpae_t) {
>          .pt = {
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index db687b1785e7..b6c55af2eb03 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -49,6 +49,9 @@ config HAS_KEXEC
>  config HAS_PDX
>  	bool
>  
> +config HAS_PMAP
> +	bool
> +
>  config HAS_SCHED_GRANULARITY
>  	bool
>  
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index ca839118e4d1..8b42b0828134 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -28,6 +28,7 @@ obj-y += multicall.o
>  obj-y += notifier.o
>  obj-y += page_alloc.o
>  obj-$(CONFIG_HAS_PDX) += pdx.o
> +obj-bin-$(CONFIG_HAS_PMAP) += pmap.init.o
>  obj-$(CONFIG_PERF_COUNTERS) += perfc.o
>  obj-y += preempt.o
>  obj-y += random.o
> diff --git a/xen/common/pmap.c b/xen/common/pmap.c
> new file mode 100644
> index 000000000000..cea730ead545
> --- /dev/null
> +++ b/xen/common/pmap.c
> @@ -0,0 +1,79 @@
> +#include <xen/bitops.h>
> +#include <xen/init.h>
> +#include <xen/pmap.h>
> +
> +#include <asm/pmap.h>
> +#include <asm/fixmap.h>
> +
> +/*
> + * Simple mapping infrastructure to map / unmap pages in fixed map.
> + * This is used to set up the page table for mapcache, which is used
> + * by map domain page infrastructure.
> + *
> + * This structure is not protected by any locks, so it must not be used after
> + * smp bring-up.
> + */
> +
> +/* Bitmap to track which slot is used */
> +static unsigned long __initdata inuse;
> +
> +void *__init pmap_map(mfn_t mfn)
> +{
> +    unsigned long flags;
> +    unsigned int idx;
> +    unsigned int slot;
> +
> +    BUILD_BUG_ON(sizeof(inuse) * BITS_PER_BYTE < NUM_FIX_PMAP);
> +
> +    ASSERT(system_state < SYS_STATE_smp_boot);
> +
> +    local_irq_save(flags);
> +
> +    idx = find_first_zero_bit(&inuse, NUM_FIX_PMAP);
> +    if ( idx == NUM_FIX_PMAP )
> +        panic("Out of PMAP slots\n");
> +
> +    __set_bit(idx, &inuse);
> +
> +    slot = idx + FIXMAP_PMAP_BEGIN;
> +    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
> +
> +    /*
> +     * We cannot use set_fixmap() here. We use PMAP when there is no direct map,
> +     * so map_pages_to_xen() called by set_fixmap() needs to map pages on
> +     * demand, which then calls pmap() again, resulting in a loop. Modify the
> +     * PTEs directly instead. The same is true for pmap_unmap().
> +     */
> +    arch_pmap_map(slot, mfn);
> +
> +    local_irq_restore(flags);
> +
> +    return fix_to_virt(slot);
> +}
> +
> +void __init pmap_unmap(const void *p)
> +{
> +    unsigned long flags;
> +    unsigned int idx;
> +    unsigned int slot = virt_to_fix((unsigned long)p);
> +
> +    ASSERT(system_state < SYS_STATE_smp_boot);
> +    ASSERT(slot >= FIXMAP_PMAP_BEGIN && slot <= FIXMAP_PMAP_END);
> +
> +    idx = slot - FIXMAP_PMAP_BEGIN;
> +    local_irq_save(flags);
> +
> +    __clear_bit(idx, &inuse);
> +    arch_pmap_unmap(slot);
> +
> +    local_irq_restore(flags);
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/pmap.h b/xen/include/xen/pmap.h
> new file mode 100644
> index 000000000000..93e61b10870e
> --- /dev/null
> +++ b/xen/include/xen/pmap.h
> @@ -0,0 +1,16 @@
> +#ifndef __XEN_PMAP_H__
> +#define __XEN_PMAP_H__
> +
> +/* Large enough for mapping 5 levels of page tables with some headroom */
> +#define NUM_FIX_PMAP 8
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/mm-frame.h>
> +
> +void *pmap_map(mfn_t mfn);
> +void pmap_unmap(const void *p);
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* __XEN_PMAP_H__ */
> -- 
> 2.32.0
> 
--8323329-878656267-1649194027=:2910984--

