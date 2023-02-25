Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E1D6A2B2C
	for <lists+xen-devel@lfdr.de>; Sat, 25 Feb 2023 18:54:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501826.773575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVyjM-0000GT-1q; Sat, 25 Feb 2023 17:53:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501826.773575; Sat, 25 Feb 2023 17:53:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVyjL-0000EG-VQ; Sat, 25 Feb 2023 17:53:07 +0000
Received: by outflank-mailman (input) for mailman id 501826;
 Sat, 25 Feb 2023 17:53:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pVyjL-0000EA-12
 for xen-devel@lists.xenproject.org; Sat, 25 Feb 2023 17:53:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVyjK-0005kr-C5; Sat, 25 Feb 2023 17:53:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVyjK-00024W-2O; Sat, 25 Feb 2023 17:53:06 +0000
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
	bh=JEFiM2K6exuMEs/6AcCfS5dqBplMhSpN3XSGJ2LUGtI=; b=ZyeUiYW0bH0/slMPs54W+k6P/n
	SsM7ZmtYkhHI4NsVcnqOIZMMi04pgtAQ8f9U4251hlOA7QG1bifcJ9YYNQTdKGpBEi6GvfwCW9Qve
	RvbhNVVrGpIwBh8i6cwphmV6wtT28CN6Lf+wYTfZ9OGBdU79R9zr+oKkOP2ih6MzVyIg=;
Message-ID: <fca300ad-0fd1-70ed-4cd4-82e89f5c3351@xen.org>
Date: Sat, 25 Feb 2023 17:53:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
 <a145fbbfb166d9f6bd4859b669d23a1f52004b2b.1677250203.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 1/3] xen/riscv: introduce setup_initial_pages
In-Reply-To: <a145fbbfb166d9f6bd4859b669d23a1f52004b2b.1677250203.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 24/02/2023 15:06, Oleksii Kurochko wrote:
> Mostly the code for setup_initial_pages was taken from Bobby's
> repo except for the following changes:
> * Use only a minimal part of the code enough to enable MMU
> * rename {_}setup_initial_pagetables functions
> * add writable argument for _setup_initial_pagetables to have
>    an opportunity to make some sections read-only
> * update setup_initial_pagetables function to make some sections
>    read-only
> * change the order of _setup_inital_pagetables()
>    in setup_initial_pagetable():
>    * first it is called for text, init, rodata sections
>    * after call it for ranges [link_addr_start : link_addr_end] and
>      [load_addr_start : load_addr_end]
>    Before it was done first for the ranges and after for sections but
>    in that case read-only status will be equal to 'true' and
>    as sections' addresses  can/are inside the ranges the read-only status
>    won't be updated for them as it was set up before.
> 
> Origin: https://gitlab.com/xen-on-risc-v/xen/-/tree/riscv-rebase 4af165b468af
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   xen/arch/riscv/Makefile           |   1 +
>   xen/arch/riscv/include/asm/mm.h   |   9 ++
>   xen/arch/riscv/include/asm/page.h |  90 ++++++++++++
>   xen/arch/riscv/mm.c               | 223 ++++++++++++++++++++++++++++++
>   4 files changed, 323 insertions(+)
>   create mode 100644 xen/arch/riscv/include/asm/mm.h
>   create mode 100644 xen/arch/riscv/include/asm/page.h
>   create mode 100644 xen/arch/riscv/mm.c
> 
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 443f6bf15f..956ceb02df 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,5 +1,6 @@
>   obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>   obj-y += entry.o
> +obj-y += mm.o
>   obj-$(CONFIG_RISCV_64) += riscv64/
>   obj-y += sbi.o
>   obj-y += setup.o
> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
> new file mode 100644
> index 0000000000..fc1866b1d8
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -0,0 +1,9 @@
> +#ifndef _ASM_RISCV_MM_H
> +#define _ASM_RISCV_MM_H
> +
> +void setup_initial_pagetables(unsigned long load_addr_start,
> +                              unsigned long load_addr_end,
> +                              unsigned long linker_addr_start,
> +                              unsigned long linker_addr_end);
> +
> +#endif /* _ASM_RISCV_MM_H */
> diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
> new file mode 100644
> index 0000000000..fabbe1305f
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -0,0 +1,90 @@
> +#ifndef _ASM_RISCV_PAGE_H
> +#define _ASM_RISCV_PAGE_H
> +
> +#include <xen/const.h>
> +#include <xen/types.h>
> +
> +#define PAGE_ENTRIES            512

NIT: AFAIU, the number here is based on ...

> +#define VPN_BITS                (9)

... this. So I would suggest to define PAGE_ENTRIES using VPN_BITS.

> +#define VPN_MASK                ((unsigned long)((1 << VPN_BITS) - 1))
NIT: Use 1UL and you can avoid the cast.

> +
> +#ifdef CONFIG_RISCV_64
> +/* L3 index Bit[47:39] */
> +#define THIRD_SHIFT             (39)
> +#define THIRD_MASK              (VPN_MASK << THIRD_SHIFT)
> +/* L2 index Bit[38:30] */
> +#define SECOND_SHIFT            (30)
> +#define SECOND_MASK             (VPN_MASK << SECOND_SHIFT)
> +/* L1 index Bit[29:21] */
> +#define FIRST_SHIFT             (21)
> +#define FIRST_MASK              (VPN_MASK << FIRST_SHIFT)
> +/* L0 index Bit[20:12] */
> +#define ZEROETH_SHIFT           (12)
> +#define ZEROETH_MASK            (VPN_MASK << ZEROETH_SHIFT)

On Arm, we are trying to phase out ZEROETH_* and co because the name is 
too generic. Instead, we now introduce a generic macro that take a level 
and then compute the mask/shift (see XEN_PT_LEVEL_*).

You should be able to do in RISC-V and reduce the amount of defines 
introduced.

> +
> +#else // CONFIG_RISCV_32

Coding style: comments in Xen are using /* ... */

> +
> +/* L1 index Bit[31:22] */
> +#define FIRST_SHIFT             (22)
> +#define FIRST_MASK              (VPN_MASK << FIRST_SHIFT)
> +
> +/* L0 index Bit[21:12] */
> +#define ZEROETH_SHIFT           (12)
> +#define ZEROETH_MASK            (VPN_MASK << ZEROETH_SHIFT)
> +#endif
> +
> +#define THIRD_SIZE              (1 << THIRD_SHIFT)
> +#define THIRD_MAP_MASK          (~(THIRD_SIZE - 1))
> +#define SECOND_SIZE             (1 << SECOND_SHIFT)
> +#define SECOND_MAP_MASK         (~(SECOND_SIZE - 1))
> +#define FIRST_SIZE              (1 << FIRST_SHIFT)
> +#define FIRST_MAP_MASK          (~(FIRST_SIZE - 1))
> +#define ZEROETH_SIZE            (1 << ZEROETH_SHIFT)
> +#define ZEROETH_MAP_MASK        (~(ZEROETH_SIZE - 1))
> +
> +#define PTE_SHIFT               10
> +
> +#define PTE_VALID               BIT(0, UL)
> +#define PTE_READABLE            BIT(1, UL)
> +#define PTE_WRITABLE            BIT(2, UL)
> +#define PTE_EXECUTABLE          BIT(3, UL)
> +#define PTE_USER                BIT(4, UL)
> +#define PTE_GLOBAL              BIT(5, UL)
> +#define PTE_ACCESSED            BIT(6, UL)
> +#define PTE_DIRTY               BIT(7, UL)
> +#define PTE_RSW                 (BIT(8, UL) | BIT(9, UL))
> +
> +#define PTE_LEAF_DEFAULT        (PTE_VALID | PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)

We should avoid vulnerable default flags. So this should either be RW or RX.

> +#define PTE_TABLE               (PTE_VALID)
> +
> +/* Calculate the offsets into the pagetables for a given VA */
> +#define zeroeth_linear_offset(va)   ((va) >> ZEROETH_SHIFT)
> +#define first_linear_offset(va)     ((va) >> FIRST_SHIFT)
> +#define second_linear_offset(va)    ((va) >> SECOND_SHIFT)
> +#define third_linear_offset(va)     ((va) >> THIRD_SHIFT)
> +
> +#define pagetable_zeroeth_index(va) zeroeth_linear_offset((va) & ZEROETH_MASK)
> +#define pagetable_first_index(va)   first_linear_offset((va) & FIRST_MASK)
> +#define pagetable_second_index(va)  second_linear_offset((va) & SECOND_MASK)
> +#define pagetable_third_index(va)   third_linear_offset((va) & THIRD_MASK)
> +
> +/* Page Table entry */
> +typedef struct {
> +    uint64_t pte;
> +} pte_t;
> +
> +/* Shift the VPN[x] or PPN[x] fields of a virtual or physical address
> + * to become the shifted PPN[x] fields of a page table entry */
> +#define addr_to_ppn(x) (((x) >> PAGE_SHIFT) << PTE_SHIFT)
> +
> +static inline pte_t paddr_to_pte(unsigned long paddr)
> +{
> +    return (pte_t) { .pte = addr_to_ppn(paddr) };
> +}
> +
> +static inline bool pte_is_valid(pte_t *p)
> +{
> +    return p->pte & PTE_VALID;
> +}
> +
> +#endif /* _ASM_RISCV_PAGE_H */
> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> new file mode 100644
> index 0000000000..6e172376eb
> --- /dev/null
> +++ b/xen/arch/riscv/mm.c
> @@ -0,0 +1,223 @@
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +
> +#include <asm/csr.h>
> +#include <asm/mm.h>
> +#include <asm/page.h>
> +
> +/*
> + * xen_second_pagetable is indexed with the VPN[2] page table entry field
> + * xen_first_pagetable is accessed from the VPN[1] page table entry field
> + * xen_zeroeth_pagetable is accessed from the VPN[0] page table entry field
> + */
> +pte_t xen_second_pagetable[PAGE_ENTRIES] __attribute__((__aligned__(PAGE_SIZE)));
> +static pte_t xen_first_pagetable[PAGE_ENTRIES]
> +    __attribute__((__aligned__(PAGE_SIZE)));
> +static pte_t xen_zeroeth_pagetable[PAGE_ENTRIES]
> +    __attribute__((__aligned__(PAGE_SIZE)));
> +
> +extern unsigned long _stext;
> +extern unsigned long _etext;
> +extern unsigned long __init_begin;
> +extern unsigned long __init_end;
> +extern unsigned long _srodata;
> +extern unsigned long _erodata;
> +
> +paddr_t phys_offset;

This is defined, set but not used.

> +
> +#define resolve_early_addr(x) \

This helper seems to behave the same wasy as linker_addr(). So any 
reason to not use it?

I will make this assumption this can be used and not comment on the 
implement of resolve_early_addr().

> +    ({                                                                          \
> +         unsigned long * __##x;                                                 \
> +        if ( load_addr_start <= x && x < load_addr_end )                        \
> +            __##x = (unsigned long *)x;                                         \
> +        else                                                                    \
> +            __##x = (unsigned long *)(x + load_addr_start - linker_addr_start); \
> +        __##x;                                                                  \
> +     })
> +
> +static void __init clear_pagetables(unsigned long load_addr_start,
> +                             unsigned long load_addr_end,
> +                             unsigned long linker_addr_start,
> +                             unsigned long linker_addr_end)
> +{
> +    unsigned long *p;
> +    unsigned long page;
> +    unsigned long i;
> +
> +    page = (unsigned long)&xen_second_pagetable[0];
> +
> +    p = resolve_early_addr(page);
> +    for ( i = 0; i < ARRAY_SIZE(xen_second_pagetable); i++ )

The entries in xen_second_pagetable are a pte_t (uint64_t). But ...

> +    {
> +        p[i] = 0ULL;

... the type here will be unsigned long. So you may not fully zero the 
page-table on 32-bit architecture. Therefore you want to define as pte_t.

That said, given the page table will be part of BSS, you should not need 
to zero again assuming you clear BSS before hand.

If you clear afterwards, then you *must* move them out of BSS.

The same applies for xen_{first, zeroeth}_pagetable below.

> +    }
> +
> +    page = (unsigned long)&xen_first_pagetable[0];
> +    p = resolve_early_addr(page);
> +    for ( i = 0; i < ARRAY_SIZE(xen_first_pagetable); i++ )
> +    {
> +        p[i] = 0ULL;
> +    }
> +
> +    page = (unsigned long)&xen_zeroeth_pagetable[0];
> +    p = resolve_early_addr(page);
> +    for ( i = 0; i < ARRAY_SIZE(xen_zeroeth_pagetable); i++ )
> +    {
> +        p[i] = 0ULL;
> +    }
> +}
> +
> +/*
> + * WARNING: load_addr() and linker_addr() are to be called only when the MMU is
> + * disabled and only when executed by the primary CPU.  They cannot refer to
> + * any global variable or functions.

I find interesting you are saying when _setup_initial_pagetables() is 
called from setup_initial_pagetables(). Would you be able to explain how 
this is different?

> + */
> +
> +/*
> + * Convert an addressed layed out at link time to the address where it was loaded

Typo: s/addressed/address/ ?

> + * by the bootloader.
> + */

Looking at the implementation, you seem to consider that any address not 
in the range [linker_addr_start, linker_addr_end[ will have a 1:1 mappings.

I am not sure this is what you want. So I would consider to throw an 
error if such address is passed.

> +#define load_addr(linker_address)                                              \
> +    ({                                                                         \
> +        unsigned long __linker_address = (unsigned long)(linker_address);      \
> +        if ( linker_addr_start <= __linker_address &&                          \
> +            __linker_address < linker_addr_end )                               \
> +        {                                                                      \
> +            __linker_address =                                                 \
> +                __linker_address - linker_addr_start + load_addr_start;        \
> +        }                                                                      \
> +        __linker_address;                                                      \
> +    })
> +
> +/* Convert boot-time Xen address from where it was loaded by the boot loader to the address it was layed out
> + * at link-time.
> + */

Coding style: The first line is too long and multi-line comments look like:

/*
  * Foo
  * Bar
  */

> +#define linker_addr(load_address)                                              \

Same remark as for load_addr() above.

> +    ({                                                                         \
> +        unsigned long __load_address = (unsigned long)(load_address);          \
> +        if ( load_addr_start <= __load_address &&                              \
> +            __load_address < load_addr_end )                                   \
> +        {                                                                      \
> +            __load_address =                                                   \
> +                __load_address - load_addr_start + linker_addr_start;          \
> +        }                                                                      \
> +        __load_address;                                                        \
> +    })
> +
> +static void __attribute__((section(".entry")))
> +_setup_initial_pagetables(pte_t *second, pte_t *first, pte_t *zeroeth,
Can this be named to setup_initial_mapping() so this is clearer and 
avoid the one '_' different with the function below.

> +                         unsigned long map_start,
> +                         unsigned long map_end,
> +                         unsigned long pa_start,
> +                         bool writable)

What about the executable bit?

> +{
> +    unsigned long page_addr;
> +    unsigned long index2;
> +    unsigned long index1;
> +    unsigned long index0;

index* could be defined in the loop below.

> +
> +    /* align start addresses */
> +    map_start &= ZEROETH_MAP_MASK;
> +    pa_start &= ZEROETH_MAP_MASK;

Hmmm... I would actually expect the address to be properly aligned and 
therefore not require an alignment here.

Otherwise, this raise the question of what happen if you have region 
using the same page?

> +
> +    page_addr = map_start;
> +    while ( page_addr < map_end )

Looking at the loop, it looks like you are assuming that the region will 
never cross a boundary of a page-table (either L0, L1, L2). I am not 
convinced you can make such assumption (see below).

But if you really want to make such assumption then you should add some 
guard (either BUILD_BUG_ON(), ASSERT(), proper check) in your code to 
avoid any surprise in the future.

> +    {
> +        index2 = pagetable_second_index(page_addr);
> +        index1 = pagetable_first_index(page_addr);
> +        index0 = pagetable_zeroeth_index(page_addr);
> +
> +        /* Setup level2 table */
> +        second[index2] = paddr_to_pte((unsigned long)first);
> +        second[index2].pte |= PTE_TABLE;
> +
> +        /* Setup level1 table */
> +        first[index1] = paddr_to_pte((unsigned long)zeroeth);
> +        first[index1].pte |= PTE_TABLE;
> +
> +        /* Setup level0 table */
> +        if ( !pte_is_valid(&zeroeth[index0]) )

Can you explain why you are checking !pte_is_valid() for the L0 entry 
but not the other?

> +        {
> +            /* Update level0 table */
> +            zeroeth[index0] = paddr_to_pte((page_addr - map_start) + pa_start);
> +            zeroeth[index0].pte |= PTE_LEAF_DEFAULT;
> +            zeroeth[index0].pte &= ~((!writable) ? PTE_WRITABLE : 0);

Looking at the default value, it would mean that a non-writable mapping 
is automatically executable. This seems wrong for the section is not 
meant to be executable (like rodata).

> +        }
> +
> +        /* Point to next page */
> +        page_addr += ZEROETH_SIZE;
> +    }
> +}
> +
> +/*
> + * setup_initial_pagetables:
> + *
> + * 1) Build the page tables for Xen that map the following:
> + *   1.1)  The physical location of Xen (where the bootloader loaded it)
> + *   1.2)  The link-time location of Xen (where the linker expected Xen's
> + *         addresses to be)
> + * 2) Load the page table into the SATP and enable the MMU
> + */
> +void __attribute__((section(".entry")))

I couldn't find a section ".entry" in the linker.

> +setup_initial_pagetables(unsigned long load_addr_start,
> +                         unsigned long load_addr_end,
> +                         unsigned long linker_addr_start,
> +                         unsigned long linker_addr_end)
> +{
> +    pte_t *second;
> +    pte_t *first;
> +    pte_t *zeroeth;
> +
> +    clear_pagetables(load_addr_start, load_addr_end,
> +                     linker_addr_start, linker_addr_end);
> +
> +    /* Get the addresses where the page tables were loaded */
> +    second  = (pte_t *)load_addr(&xen_second_pagetable);
> +    first   = (pte_t *)load_addr(&xen_first_pagetable);
> +    zeroeth = (pte_t *)load_addr(&xen_zeroeth_pagetable);

I would consider to embed the type cast in load_addr() so you are adding 
some type safety within your code.

> +
> +    /*
> +     * Create a mapping from Xen's link-time addresses to where they were actually loaded.

This is line is way long than 80 characters. Please make sure to wrap it 
80 characters.

> +     */
> +    _setup_initial_pagetables(second, first, zeroeth,
> +                              linker_addr(&_stext),
> +                              linker_addr(&_etext),
> +                              load_addr(&_stext),
> +                              false);
> +    _setup_initial_pagetables(second, first, zeroeth,
> +                              linker_addr(&__init_begin),
> +                              linker_addr(&__init_end),
> +                              load_addr(&__init_begin),
> +                              true);
> +    _setup_initial_pagetables(second, first, zeroeth,
> +                              linker_addr(&_srodata),
> +                              linker_addr(&_erodata),
> +                              load_addr(&_srodata),
> +                              false);
> +    _setup_initial_pagetables(second, first, zeroeth,
> +                              linker_addr_start,
> +                              linker_addr_end,
> +                              load_addr_start,
> +                              true);

Where do you guarantee that Xen will always fit in an L0 table and the 
start address is aligned to the size of an L0 table?

> +
> +    /*
> +     * Create a mapping of the load time address range to... the load time address range.

Same about the line length here.

> +     * This mapping is used at boot time only.
> +     */
> +    _setup_initial_pagetables(second, first, zeroeth,

This can only work if Xen is loaded at its linked address. So you need a 
separate set of L0, L1 tables for the identity mapping.

That said, this would not be sufficient because:
   1) Xen may not be loaded at a 2M boundary (you can control with 
U-boot, but not with EFI). So this may cross a boundary and therefore 
need multiple pages.
   2) The load region may overlap the link address

While I think it would be good to handle those cases from the start, I 
would understand why are not easy to solve. So I think the minimum is to 
throw some errors if you are in a case you can't support.

> +                              load_addr_start,
> +                              load_addr_end,
> +                              load_addr_start,
> +                              true); > +
> +    /* Ensure page table writes precede loading the SATP */
> +    asm volatile("sfence.vma");
> +
> +    /* Enable the MMU and load the new pagetable for Xen */
> +    csr_write(CSR_SATP,
> +              (load_addr(xen_second_pagetable) >> PAGE_SHIFT) | SATP_MODE_SV39 << SATP_MODE_SHIFT);

IHMO, it would make sense to introduce within the series the code to 
jump off the identity mapping and then remove it.

> +
> +    phys_offset = load_addr_start - linker_addr_start;
> +
> +    return;
> +}

Cheers,

-- 
Julien Grall

