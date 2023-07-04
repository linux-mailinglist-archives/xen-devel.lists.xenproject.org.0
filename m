Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A717479B4
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 23:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558731.873084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGnyH-0005J0-3L; Tue, 04 Jul 2023 21:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558731.873084; Tue, 04 Jul 2023 21:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGnyH-0005Fz-0R; Tue, 04 Jul 2023 21:54:05 +0000
Received: by outflank-mailman (input) for mailman id 558731;
 Tue, 04 Jul 2023 21:54:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGnyF-0005Ft-Ng
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 21:54:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGnyF-00041k-4w; Tue, 04 Jul 2023 21:54:03 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGnyE-0007sv-VT; Tue, 04 Jul 2023 21:54:03 +0000
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
	bh=uqqWERl+3py7lBkgztSNuyc4I9voSLciyyk0zf9QtZM=; b=wqP/GM+vVWgzLOnCD/ZVdbeiVZ
	Pc1itbPrQyMgmCv0SKjY6mr9QEP1ZyeXHIGp/XxwpPp9kCUBoiYzWtNeqn6W3q2JDaKK6lPBsm51x
	ZzbQ68xC4q2A2v21pE3QUyGihxLX515VGSqZa7Y6jRFIPdmqCeZR/Ksmwy0ny7raYylU=;
Message-ID: <ee493a26-234c-876e-e19f-3708c13cb484@xen.org>
Date: Tue, 4 Jul 2023 22:54:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 10/52] xen/arm: Move MMU related definitions from
 config.h to mmu/layout.h
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-11-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230626033443.2943270-11-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 26/06/2023 04:34, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> Xen defines some global configuration macros for Arm in config.h.
> We still want to use it for MMU systems, but there are some address

Did you mean MPU?

> layout related definitions that are defined for MMU systems only.
> These definitions could not be used by MPU systems, but adding
> ifdefery with CONFIG_HAS_MPU to gate these definitions will result
> in a messy and hard-to-read/maintain code.
> 
> So we keep some common definitions still in config.h, but move MMU
> related definitions to a new file - mmu/layout.h to avoid spreading
> "#ifdef" everywhere.

Just to ease the review, can you add some details which one are 
considered common?

Also, this patch will need to be rebased on top of the latest staging.

> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v1 -> v2:
> 1. Remove duplicated FIXMAP definitions from config_mmu.h
> ---
> v3:
> 1. name the new header layout.h
> ---
>   xen/arch/arm/include/asm/config.h     | 127 +----------------------
>   xen/arch/arm/include/asm/mmu/layout.h | 141 ++++++++++++++++++++++++++
>   2 files changed, 143 insertions(+), 125 deletions(-)
>   create mode 100644 xen/arch/arm/include/asm/mmu/layout.h
> 
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
> index 30f4665ba9..204b3dec13 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -71,131 +71,8 @@
>   #include <xen/const.h>
>   #include <xen/page-size.h>
>   
> -/*
> - * ARM32 layout:
> - *   0  -   2M   Unmapped
> - *   2M -   4M   Xen text, data, bss
> - *   4M -   6M   Fixmap: special-purpose 4K mapping slots
> - *   6M -  10M   Early boot mapping of FDT
> - *   10M - 12M   Livepatch vmap (if compiled in)
> - *
> - *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
> - * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
> - *                    space
> - *
> - *   1G -   2G   Xenheap: always-mapped memory
> - *   2G -   4G   Domheap: on-demand-mapped
> - *
> - * ARM64 layout:
> - * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
> - *
> - *  Reserved to identity map Xen
> - *
> - * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
> - *  (Relative offsets)
> - *   0  -   2M   Unmapped
> - *   2M -   4M   Xen text, data, bss
> - *   4M -   6M   Fixmap: special-purpose 4K mapping slots
> - *   6M -  10M   Early boot mapping of FDT
> - *  10M -  12M   Livepatch vmap (if compiled in)
> - *
> - *   1G -   2G   VMAP: ioremap and early_ioremap
> - *
> - *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
> - *
> - * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
> - *  Unused
> - *
> - * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
> - *  1:1 mapping of RAM
> - *
> - * 0x0000850000000000 - 0x0000ffffffffffff (123TB, L0 slots [266..511])
> - *  Unused
> - */
> -
> -#ifdef CONFIG_ARM_32
> -#define XEN_VIRT_START          _AT(vaddr_t, MB(2))
> -#else
> -
> -#define SLOT0_ENTRY_BITS  39
> -#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
> -#define SLOT0_ENTRY_SIZE  SLOT0(1)
> -
> -#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
> -#endif
> -
> -#define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
> -
> -#define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
> -#define FIXMAP_VIRT_SIZE        _AT(vaddr_t, MB(2))
> -
> -#define FIXMAP_ADDR(n)          (FIXMAP_VIRT_START + (n) * PAGE_SIZE)
> -
> -#define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE)
> -#define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
> -
> -#ifdef CONFIG_LIVEPATCH
> -#define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
> -#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
> -#endif
> -
> -#define HYPERVISOR_VIRT_START  XEN_VIRT_START
> -
> -#ifdef CONFIG_ARM_32
> -
> -#define CONFIG_SEPARATE_XENHEAP 1
> -
> -#define FRAMETABLE_VIRT_START  _AT(vaddr_t, MB(32))
> -#define FRAMETABLE_SIZE        MB(128-32)
> -#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
> -
> -#define VMAP_VIRT_START        _AT(vaddr_t, MB(256))
> -#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
> -
> -#define XENHEAP_VIRT_START     _AT(vaddr_t, GB(1))
> -#define XENHEAP_VIRT_SIZE      _AT(vaddr_t, GB(1))
> -
> -#define DOMHEAP_VIRT_START     _AT(vaddr_t, GB(2))
> -#define DOMHEAP_VIRT_SIZE      _AT(vaddr_t, GB(2))
> -
> -#define DOMHEAP_ENTRIES        1024  /* 1024 2MB mapping slots */
> -
> -/* Number of domheap pagetable pages required at the second level (2MB mappings) */
> -#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
> -
> -/*
> - * The temporary area is overlapping with the domheap area. This may
> - * be used to create an alias of the first slot containing Xen mappings
> - * when turning on/off the MMU.
> - */
> -#define TEMPORARY_AREA_FIRST_SLOT    (first_table_offset(DOMHEAP_VIRT_START))
> -
> -/* Calculate the address in the temporary area */
> -#define TEMPORARY_AREA_ADDR(addr)                           \
> -     (((addr) & ~XEN_PT_LEVEL_MASK(1)) |                    \
> -      (TEMPORARY_AREA_FIRST_SLOT << XEN_PT_LEVEL_SHIFT(1)))
> -
> -#define TEMPORARY_XEN_VIRT_START    TEMPORARY_AREA_ADDR(XEN_VIRT_START)
> -
> -#else /* ARM_64 */
> -
> -#define IDENTITY_MAPPING_AREA_NR_L0  4
> -
> -#define VMAP_VIRT_START  (SLOT0(4) + GB(1))
> -#define VMAP_VIRT_SIZE   GB(1)
> -
> -#define FRAMETABLE_VIRT_START  (SLOT0(4) + GB(32))
> -#define FRAMETABLE_SIZE        GB(32)
> -#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
> -
> -#define DIRECTMAP_VIRT_START   SLOT0(256)
> -#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (266 - 256))
> -#define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
> -
> -#define XENHEAP_VIRT_START     directmap_virt_start
> -
> -#define HYPERVISOR_VIRT_END    DIRECTMAP_VIRT_END
> -
> +#ifndef CONFIG_HAS_MPU

We are not going to introduce HAS_MPU yet in Xen. So can you use 
CONFIG_HAS_MMU?

Also, I would add:

#else
# error "Unknown memory management layout"
#endif

> +#include <asm/mmu/layout.h>
>   #endif
>   
>   #define NR_hypercalls 64
> diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include/asm/mmu/layout.h
> new file mode 100644
> index 0000000000..8deda6b84d
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mmu/layout.h
> @@ -0,0 +1,141 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

GPL-2.0 is deprecated and should not be used for new file. This should 
instead be GPL-2.0-only

> +
> +#ifndef __ARM_MMU_LAYOUT_H__
> +#define __ARM_MMU_LAYOUT_H__
> +
> +/*
> + * ARM32 layout:
> + *   0  -   2M   Unmapped
> + *   2M -   4M   Xen text, data, bss
> + *   4M -   6M   Fixmap: special-purpose 4K mapping slots
> + *   6M -  10M   Early boot mapping of FDT
> + *   10M - 12M   Livepatch vmap (if compiled in)
> + *
> + *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
> + * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
> + *                    space
> + *
> + *   1G -   2G   Xenheap: always-mapped memory
> + *   2G -   4G   Domheap: on-demand-mapped
> + *
> + * ARM64 layout:
> + * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
> + *
> + *  Reserved to identity map Xen
> + *
> + * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
> + *  (Relative offsets)
> + *   0  -   2M   Unmapped
> + *   2M -   4M   Xen text, data, bss
> + *   4M -   6M   Fixmap: special-purpose 4K mapping slots
> + *   6M -  10M   Early boot mapping of FDT
> + *  10M -  12M   Livepatch vmap (if compiled in)
> + *
> + *   1G -   2G   VMAP: ioremap and early_ioremap
> + *
> + *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
> + *
> + * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
> + *  Unused
> + *
> + * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
> + *  1:1 mapping of RAM
> + *
> + * 0x0000850000000000 - 0x0000ffffffffffff (123TB, L0 slots [266..511])
> + *  Unused
> + */
> +
> +#ifdef CONFIG_ARM_32
> +#define XEN_VIRT_START          _AT(vaddr_t, MB(2))
> +#else
> +
> +#define SLOT0_ENTRY_BITS  39
> +#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
> +#define SLOT0_ENTRY_SIZE  SLOT0(1)
> +
> +#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
> +#endif
> +
> +#define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
> +
> +#define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
> +#define FIXMAP_VIRT_SIZE        _AT(vaddr_t, MB(2))
> +
> +#define FIXMAP_ADDR(n)          (FIXMAP_VIRT_START + (n) * PAGE_SIZE)
> +
> +#define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE)
> +#define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
> +
> +#ifdef CONFIG_LIVEPATCH
> +#define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
> +#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
> +#endif
> +
> +#define HYPERVISOR_VIRT_START  XEN_VIRT_START
> +
> +#ifdef CONFIG_ARM_32
> +
> +#define CONFIG_SEPARATE_XENHEAP 1
> +
> +#define FRAMETABLE_VIRT_START  _AT(vaddr_t, MB(32))
> +#define FRAMETABLE_SIZE        MB(128-32)
> +#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
> +
> +#define VMAP_VIRT_START        _AT(vaddr_t, MB(256))
> +#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
> +
> +#define XENHEAP_VIRT_START     _AT(vaddr_t, GB(1))
> +#define XENHEAP_VIRT_SIZE      _AT(vaddr_t, GB(1))
> +
> +#define DOMHEAP_VIRT_START     _AT(vaddr_t, GB(2))
> +#define DOMHEAP_VIRT_SIZE      _AT(vaddr_t, GB(2))
> +
> +#define DOMHEAP_ENTRIES        1024  /* 1024 2MB mapping slots */
> +
> +/* Number of domheap pagetable pages required at the second level (2MB mappings) */
> +#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
> +
> +/*
> + * The temporary area is overlapping with the domheap area. This may
> + * be used to create an alias of the first slot containing Xen mappings
> + * when turning on/off the MMU.
> + */
> +#define TEMPORARY_AREA_FIRST_SLOT    (first_table_offset(DOMHEAP_VIRT_START))
> +
> +/* Calculate the address in the temporary area */
> +#define TEMPORARY_AREA_ADDR(addr)                           \
> +     (((addr) & ~XEN_PT_LEVEL_MASK(1)) |                    \
> +      (TEMPORARY_AREA_FIRST_SLOT << XEN_PT_LEVEL_SHIFT(1)))
> +
> +#define TEMPORARY_XEN_VIRT_START    TEMPORARY_AREA_ADDR(XEN_VIRT_START)
> +
> +#else /* ARM_64 */
> +
> +#define IDENTITY_MAPPING_AREA_NR_L0  4
> +
> +#define VMAP_VIRT_START  (SLOT0(4) + GB(1))
> +#define VMAP_VIRT_SIZE   GB(1)
> +
> +#define FRAMETABLE_VIRT_START  (SLOT0(4) + GB(32))
> +#define FRAMETABLE_SIZE        GB(32)
> +#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
> +
> +#define DIRECTMAP_VIRT_START   SLOT0(256)
> +#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (266 - 256))
> +#define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
> +
> +#define XENHEAP_VIRT_START     directmap_virt_start
> +
> +#define HYPERVISOR_VIRT_END    DIRECTMAP_VIRT_END
> +
> +#endif
> +
> +#endif /* __ARM_MMU_LAYOUT_H__ */
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

Cheers,

-- 
Julien Grall

