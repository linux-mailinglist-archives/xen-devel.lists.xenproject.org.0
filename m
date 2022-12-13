Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0132E64ACF7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 02:23:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460062.717859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4u0O-000643-4h; Tue, 13 Dec 2022 01:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460062.717859; Tue, 13 Dec 2022 01:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4u0O-00061X-1X; Tue, 13 Dec 2022 01:22:48 +0000
Received: by outflank-mailman (input) for mailman id 460062;
 Tue, 13 Dec 2022 01:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuKI=4L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p4u0M-00061R-Ll
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 01:22:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a538f4b4-7a84-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 02:22:45 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E2E716129E;
 Tue, 13 Dec 2022 01:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394D3C433D2;
 Tue, 13 Dec 2022 01:22:39 +0000 (UTC)
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
X-Inumbo-ID: a538f4b4-7a84-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670894560;
	bh=jeoipqnn/uPmDWG7Qi39Hdguj6vsPV/XKp7+lI1DLmU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qgw66+FpBKBvaNA4BbFzsFLEa9iYukvkpELcAzAepLZEE5w68+ybhMvrRtMo6+teu
	 YSSu37ZQhIabnWs2GPnUXajBpeVNWqFEFX+so1JxrEwQWEgGyTkVphChvfy0pJSAut
	 RS3SeR9NVuhCIe9Anoy60TMFpMlzHhGwi7H5yiIHoZsihNzMmT6+x8hv0ZYBU0DOfl
	 qeEWhH0fJY+ATXxIMHrBdFjF+lkX0aUbZlsOFZhSRZWz3XY8qGm8VWzk8oXJ88WhtX
	 3zNDt7tj4RzG2R4CRd0SeXxPVssBwAkP7h9dJ7EfJyXXoz5YdjNOgpZyuwAuhGJYZH
	 BhoXG+vERucIw==
Date: Mon, 12 Dec 2022 17:22:35 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 12/18] xen/arm64: Rework the memory layout
In-Reply-To: <20221212095523.52683-13-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212121710470.3075842@ubuntu-linux-20-04-desktop>
References: <20221212095523.52683-1-julien@xen.org> <20221212095523.52683-13-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Dec 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Xen is currently not fully compliant with the Arm Arm because it will
> switch the TTBR with the MMU on.
> 
> In order to be compliant, we need to disable the MMU before
> switching the TTBR. The implication is the page-tables should
> contain an identity mapping of the code switching the TTBR.
> 
> In most of the case we expect Xen to be loaded in low memory. I am aware
> of one platform (i.e AMD Seattle) where the memory start above 512GB.
> To give us some slack, consider that Xen may be loaded in the first 2TB
> of the physical address space.
> 
> The memory layout is reshuffled to keep the first two slots of the zeroeth
> level free. Xen will now be loaded at (2TB + 2MB). This requires a slight
> tweak of the boot code because XEN_VIRT_START cannot be used as an
> immediate.
> 
> This reshuffle will make trivial to create a 1:1 mapping when Xen is
> loaded below 2TB.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> 
>     Changes in v2:
>         - Reword the commit message
>         - Load Xen at 2TB + 2MB
>         - Update the documentation to reflect the new layout
> ---
>  xen/arch/arm/arm64/head.S         |  3 ++-
>  xen/arch/arm/include/asm/config.h | 34 +++++++++++++++++++++----------
>  xen/arch/arm/mm.c                 | 11 +++++-----
>  3 files changed, 31 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index ad014716db6f..23c2c7491db2 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -607,7 +607,8 @@ create_page_tables:
>           * need an additional 1:1 mapping, the virtual mapping will
>           * suffice.
>           */
> -        cmp   x19, #XEN_VIRT_START
> +        ldr   x0, =XEN_VIRT_START
> +        cmp   x19, x0
>          bne   1f
>          ret
>  1:
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
> index 6c1b762e976d..9fe6bfeeeb95 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -72,15 +72,12 @@
>  #include <xen/page-size.h>
>  
>  /*
> - * Common ARM32 and ARM64 layout:
> + * ARM32 layout:
>   *   0  -   2M   Unmapped
>   *   2M -   4M   Xen text, data, bss
>   *   4M -   6M   Fixmap: special-purpose 4K mapping slots
>   *   6M -  10M   Early boot mapping of FDT
> - *   10M - 12M   Livepatch vmap (if compiled in)
> - *
> - * ARM32 layout:
> - *   0  -  12M   <COMMON>
> + *  10M -  12M   Livepatch vmap (if compiled in)
>   *
>   *  32M - 128M   Frametable: 24 bytes per page for 16GB of RAM
>   * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
> @@ -90,8 +87,17 @@
>   *   2G -   4G   Domheap: on-demand-mapped
>   *
>   * ARM64 layout:
> - * 0x0000000000000000 - 0x0000007fffffffff (512GB, L0 slot [0])
> - *   0  -  12M   <COMMON>
> + * 0x0000000000000000 - 0x00001fffffffffff (2TB, L0 slots [0..1])
> + *

Extra blank line


> + *  Reserved to identity map Xen
> + *
> + * 0x0000020000000000 - 0x000028fffffffff (512TB, L0 slot [2]
> + *  (Relative offsets)
> + *   0  -   2M   Unmapped
> + *   2M -   4M   Xen text, data, bss
> + *   4M -   6M   Fixmap: special-purpose 4K mapping slots
> + *   6M -  10M   Early boot mapping of FDT
> + *  10M -  12M   Livepatch vmap (if compiled in)
>   *
>   *   1G -   2G   VMAP: ioremap and early_ioremap
>   *
> @@ -107,7 +113,17 @@
>   *  Unused
>   */
>  
> +#ifdef CONFIG_ARM_32
>  #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
> +#else
> +
> +#define SLOT0_ENTRY_BITS  39
> +#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
> +#define SLOT0_ENTRY_SIZE  SLOT0(1)
> +
> +#define XEN_VIRT_START          (SLOT0(2) + _AT(vaddr_t, MB(2)))
> +#endif

Sorry for the silly question and I apologize if I got the math wrong.

1<<39 is 512MB, so:

slot0 is [0..512MB]
slot1 is [512MB..1TB]
slot2 is [1TB..1.5TB]
slot3 is [1.5TB..2TB]
slot4 is [2TB..2.5TB]

So, if we want Xen just above 2TB we should use slot4? Which would be
SLOT0(4) ?


>  #define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
>  
>  #define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
> @@ -164,10 +180,6 @@
>  
>  #else /* ARM_64 */
>  
> -#define SLOT0_ENTRY_BITS  39
> -#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
> -#define SLOT0_ENTRY_SIZE  SLOT0(1)
> -
>  #define VMAP_VIRT_START  GB(1)
>  #define VMAP_VIRT_SIZE   GB(1)
>  
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index d0b1cf55f550..cc11f5c639e6 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -153,7 +153,7 @@ static void __init __maybe_unused build_assertions(void)
>  #endif
>      /* Page table structure constraints */
>  #ifdef CONFIG_ARM_64
> -    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
> +    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START) < 2);
>  #endif
>      BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
>  #ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
> @@ -498,10 +498,11 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>      phys_offset = boot_phys_offset;
>  
>  #ifdef CONFIG_ARM_64
> -    p = (void *) xen_pgtable;
> -    p[0] = pte_of_xenaddr((uintptr_t)xen_first);
> -    p[0].pt.table = 1;
> -    p[0].pt.xn = 0;
> +    pte = pte_of_xenaddr((uintptr_t)xen_first);
> +    pte.pt.table = 1;
> +    pte.pt.xn = 0;
> +    xen_pgtable[zeroeth_table_offset(XEN_VIRT_START)] = pte;
> +
>      p = (void *) xen_first;
>  #else
>      p = (void *) cpu0_pgtable;
> -- 
> 2.38.1
> 

