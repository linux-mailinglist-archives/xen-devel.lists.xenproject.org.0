Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D259A6C4D6C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 15:21:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513487.794554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pezKx-0000xF-S9; Wed, 22 Mar 2023 14:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513487.794554; Wed, 22 Mar 2023 14:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pezKx-0000vN-OW; Wed, 22 Mar 2023 14:21:11 +0000
Received: by outflank-mailman (input) for mailman id 513487;
 Wed, 22 Mar 2023 14:21:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pezKw-0000vH-IJ
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 14:21:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pezKv-0007gr-BL; Wed, 22 Mar 2023 14:21:09 +0000
Received: from [15.248.2.159] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pezKv-0002cI-2M; Wed, 22 Mar 2023 14:21:09 +0000
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
	bh=9cKoXziBhSsKdtKyNSQ7069aSRitwOlpgY9BbzwUhJY=; b=B7MPOUiJMhUmld+5kNAgTVDk4o
	ZBT12Gq9EISCnKTdKDtZfnY/3MsXxFkZ7dVU6tVIwUsT8M44Yx9UC2qu1kONXs613b2C3iD/iHrlj
	KdLarmhxrb2J+MX2xp4jBawI/afEUx3w1rb+Kxx+RVhyQgIPwkbwKQ6OTtU5S1j1Tmvs=;
Message-ID: <60444252-80b6-230e-9090-2c96d5d6187d@xen.org>
Date: Wed, 22 Mar 2023 14:21:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
 <85a21ada5a0fc44bb9db1dcc1f6cf191a6e66bfb.1678984041.git.oleksii.kurochko@gmail.com>
 <9ff0e335-6cb2-be49-046d-745ce05f7086@xen.org>
 <5169c6c8a0c4c90b56e3f525a55de464edf7181e.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5169c6c8a0c4c90b56e3f525a55de464edf7181e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 22/03/2023 09:55, Oleksii wrote:
> Hi Jullien,

Hi,

> On Tue, 2023-03-21 at 17:58 +0000, Julien Grall wrote:
>> Hi,
>>
>> I will try to not repeat the comment already made.
>>
>> On 16/03/2023 16:43, Oleksii Kurochko wrote:
>>> Mostly the code for setup_initial_pages was taken from Bobby's
>>> repo except for the following changes:
>>> * Use only a minimal part of the code enough to enable MMU
>>> * rename {_}setup_initial_pagetables functions
>>> * add an argument for setup_initial_mapping to have
>>>     an opportunity to make set PTE flags.
>>> * update setup_initial_pagetables function to map sections
>>>     with correct PTE flags.
>>> * introduce separate enable_mmu() to be able for proper
>>>     handling the case when load start address isn't equal to
>>>     linker start address.
>>> * map linker addresses range to load addresses range without
>>>     1:1 mapping.
>>> * add safety checks such as:
>>>     * Xen size is less than page size
>>>     * linker addresses range doesn't overlap load addresses
>>>       range
>>> * Rework macros {THIRD,SECOND,FIRST,ZEROETH}_{SHIFT,MASK}
>>> * change PTE_LEAF_DEFAULT to RX instead of RWX.
>>> * Remove phys_offset as it isn't used now.
>>> * Remove alignment  of {map, pa}_start &= XEN_PT_LEVEL_MAP_MASK(0);
>>> in
>>>     setup_inital_mapping() as they should be already aligned.
>>> * Remove clear_pagetables() as initial pagetables will be
>>>     zeroed during bss initialization
>>> * Remove __attribute__((section(".entry")) for
>>> setup_initial_pagetables()
>>>     as there is no such section in xen.lds.S
>>> * Update the argument of pte_is_valid() to "const pte_t *p"
>>>
>>> Origin:
>>> https://gitlab.com/xen-on-risc-v/xen/-/tree/riscv-rebase 4af165b468
>>> af
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in V2:
>>>    * update the commit message:
>>>    * Remove {ZEROETH,FIRST,...}_{SHIFT,MASK, SIZE,...} and
>>>      introduce instead of them XEN_PT_LEVEL_*() and LEVEL_*
>>>    * Rework pt_linear_offset() and pt_index based on
>>> XEN_PT_LEVEL_*()
>>>    * Remove clear_pagetables() functions as pagetables were zeroed
>>> during
>>>      .bss initialization
>>>    * Rename _setup_initial_pagetables() to setup_initial_mapping()
>>>    * Make PTE_DEFAULT equal to RX.
>>>    * Update prototype of setup_initial_mapping(..., bool writable) -
>>>>
>>>      setup_initial_mapping(..., UL flags)
>>>    * Update calls of setup_initial_mapping according to new
>>> prototype
>>>    * Remove unnecessary call of:
>>>      _setup_initial_pagetables(..., load_addr_start, load_addr_end,
>>> load_addr_start, ...)
>>>    * Define index* in the loop of setup_initial_mapping
>>>    * Remove attribute "__attribute__((section(".entry")))" for
>>> setup_initial_pagetables()
>>>      as we don't have such section
>>>    * make arguments of paddr_to_pte() and pte_is_valid() as const.
>>>    * make xen_second_pagetable static.
>>>    * use <xen/kernel.h> instead of declaring extern unsigned long
>>> _stext, 0etext, _srodata, _erodata
>>>    * update  'extern unsigned long __init_begin' to 'extern unsigned
>>> long __init_begin[]'
>>>    * use aligned() instead of
>>> "__attribute__((__aligned__(PAGE_SIZE)))"
>>>    * set __section(".bss.page_aligned") for page tables arrays
>>>    * fix identatations
>>>    * Change '__attribute__((section(".entry")))' to '__init'
>>>    * Remove phys_offset as it isn't used now.
>>>    * Remove alignment  of {map, pa}_start &=
>>> XEN_PT_LEVEL_MAP_MASK(0); in
>>>      setup_inital_mapping() as they should be already aligned.
>>>    * Remove clear_pagetables() as initial pagetables will be
>>>      zeroed during bss initialization
>>>    * Remove __attribute__((section(".entry")) for
>>> setup_initial_pagetables()
>>>      as there is no such section in xen.lds.S
>>>    * Update the argument of pte_is_valid() to "const pte_t *p"
>>> ---
>>>    xen/arch/riscv/Makefile           |   1 +
>>>    xen/arch/riscv/include/asm/mm.h   |   8 ++
>>>    xen/arch/riscv/include/asm/page.h |  67 +++++++++++++++++
>>>    xen/arch/riscv/mm.c               | 121
>>> ++++++++++++++++++++++++++++++
>>>    xen/arch/riscv/riscv64/head.S     |  65 ++++++++++++++++
>>>    xen/arch/riscv/xen.lds.S          |   2 +
>>>    6 files changed, 264 insertions(+)
>>>    create mode 100644 xen/arch/riscv/include/asm/mm.h
>>>    create mode 100644 xen/arch/riscv/include/asm/page.h
>>>    create mode 100644 xen/arch/riscv/mm.c
>>>
>>> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
>>> index 443f6bf15f..956ceb02df 100644
>>> --- a/xen/arch/riscv/Makefile
>>> +++ b/xen/arch/riscv/Makefile
>>> @@ -1,5 +1,6 @@
>>>    obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>>>    obj-y += entry.o
>>> +obj-y += mm.o
>>>    obj-$(CONFIG_RISCV_64) += riscv64/
>>>    obj-y += sbi.o
>>>    obj-y += setup.o
>>> diff --git a/xen/arch/riscv/include/asm/mm.h
>>> b/xen/arch/riscv/include/asm/mm.h
>>> new file mode 100644
>>> index 0000000000..3cc98fe45b
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>> @@ -0,0 +1,8 @@
>>> +#ifndef _ASM_RISCV_MM_H
>>> +#define _ASM_RISCV_MM_H
>>> +
>>> +void setup_initial_pagetables(void);
>>> +
>>> +extern void enable_mmu(void);
>>> +
>>> +#endif /* _ASM_RISCV_MM_H */
>>> diff --git a/xen/arch/riscv/include/asm/page.h
>>> b/xen/arch/riscv/include/asm/page.h
>>> new file mode 100644
>>> index 0000000000..fb8329a191
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/page.h
>>> @@ -0,0 +1,67 @@
>>> +#ifndef _ASM_RISCV_PAGE_H
>>> +#define _ASM_RISCV_PAGE_H
>>> +
>>> +#include <xen/const.h>
>>> +#include <xen/types.h>
>>> +
>>> +#define PAGE_ENTRIES                (1 << PAGETABLE_ORDER)
>>> +#define VPN_MASK                    ((unsigned long)(PAGE_ENTRIES
>>> - 1))
>>> +
>>> +#define PAGE_ORDER                  (12)
>>> +
>>> +#ifdef CONFIG_RISCV_64
>>> +#define PAGETABLE_ORDER             (9)
>>> +#else /* CONFIG_RISCV_32 */
>>> +#define PAGETABLE_ORDER             (10)
>>> +#endif
>>> +
>>> +#define LEVEL_ORDER(lvl)            (lvl * PAGETABLE_ORDER)
>>> +#define LEVEL_SHIFT(lvl)            (LEVEL_ORDER(lvl) +
>>> PAGE_ORDER)
>>> +#define LEVEL_SIZE(lvl)             (_AT(paddr_t, 1) <<
>>> LEVEL_SHIFT(lvl))
>>> +
>>> +#define XEN_PT_LEVEL_SHIFT(lvl)     LEVEL_SHIFT(lvl)
>>> +#define XEN_PT_LEVEL_ORDER(lvl)     LEVEL_ORDER(lvl)
>>> +#define XEN_PT_LEVEL_SIZE(lvl)      LEVEL_SIZE(lvl)
>>> +#define XEN_PT_LEVEL_MAP_MASK(lvl)  (~(XEN_PT_LEVEL_SIZE(lvl) -
>>> 1))
>>> +#define XEN_PT_LEVEL_MASK(lvl)      (VPN_MASK <<
>>> XEN_PT_LEVEL_SHIFT(lvl))
>>> +
>>> +#define PTE_SHIFT                   10
>>> +
>>> +#define PTE_VALID                   BIT(0, UL)
>>> +#define PTE_READABLE                BIT(1, UL)
>>> +#define PTE_WRITABLE                BIT(2, UL)
>>> +#define PTE_EXECUTABLE              BIT(3, UL)
>>> +#define PTE_USER                    BIT(4, UL)
>>> +#define PTE_GLOBAL                  BIT(5, UL)
>>> +#define PTE_ACCESSED                BIT(6, UL)
>>> +#define PTE_DIRTY                   BIT(7, UL)
>>> +#define PTE_RSW                     (BIT(8, UL) | BIT(9, UL))
>>> +
>>> +#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE |
>>> PTE_EXECUTABLE)
>>> +#define PTE_TABLE                   (PTE_VALID)
>>> +
>>> +/* Calculate the offsets into the pagetables for a given VA */
>>> +#define pt_linear_offset(lvl, va)   ((va) >>
>>> XEN_PT_LEVEL_SHIFT(lvl))
>>> +
>>> +#define pt_index(lvl, va)   pt_linear_offset(lvl, (va) &
>>> XEN_PT_LEVEL_MASK(lvl))
>>> +
>>> +/* Page Table entry */
>>> +typedef struct {
>>> +    uint64_t pte;
>>> +} pte_t;
>>> +
>>> +/* Shift the VPN[x] or PPN[x] fields of a virtual or physical
>>> address
>>> + * to become the shifted PPN[x] fields of a page table entry */
>>> +#define addr_to_ppn(x) (((x) >> PAGE_SHIFT) << PTE_SHIFT)
>>> +
>>> +static inline pte_t paddr_to_pte(const unsigned long paddr)
>>> +{
>>> +    return (pte_t) { .pte = addr_to_ppn(paddr) };
>>> +}
>>> +
>>> +static inline bool pte_is_valid(const pte_t *p)
>>> +{
>>> +    return p->pte & PTE_VALID;
>>> +}
>>> +
>>> +#endif /* _ASM_RISCV_PAGE_H */
>>> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
>>> new file mode 100644
>>> index 0000000000..0df6b47441
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/mm.c
>>> @@ -0,0 +1,121 @@
>>> +#include <xen/compiler.h>
>>> +#include <xen/init.h>
>>> +#include <xen/kernel.h>
>>> +#include <xen/lib.h>
>>> +#include <xen/page-size.h>
>>> +
>>> +#include <asm/boot-info.h>
>>> +#include <asm/config.h>
>>> +#include <asm/csr.h>
>>> +#include <asm/mm.h>
>>> +#include <asm/page.h>
>>> +#include <asm/traps.h>
>>> +
>>> +/*
>>> + * xen_second_pagetable is indexed with the VPN[2] page table
>>> entry field
>>> + * xen_first_pagetable is accessed from the VPN[1] page table
>>> entry field
>>> + * xen_zeroeth_pagetable is accessed from the VPN[0] page table
>>> entry field
>>> + */
>>> +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>>> +    xen_second_pagetable[PAGE_ENTRIES];
>>> +static pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>>> +    xen_first_pagetable[PAGE_ENTRIES];
>>> +static pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>>> +    xen_zeroeth_pagetable[PAGE_ENTRIES];
>>> +
>>> +extern unsigned long __init_begin[];
>>> +extern unsigned long __init_end[];
>>> +extern unsigned char cpu0_boot_stack[STACK_SIZE];
>>> +
>>> +static void __init
>>> +setup_initial_mapping(pte_t *second, pte_t *first, pte_t *zeroeth,
>>> +                      unsigned long map_start,
>>> +                      unsigned long map_end,
>>> +                      unsigned long pa_start,
>>> +                      unsigned long flags)
>>> +{
>>> +    unsigned long page_addr;
>>> +
>>> +    // /* align start addresses */
>>> +    // map_start &= XEN_PT_LEVEL_MAP_MASK(0);
>>> +    // pa_start &= XEN_PT_LEVEL_MAP_MASK(0);
>>
>> They should be switched to ASSERT() or BUG_ON().
> Sure. Thanks. I'll update.
>>
>>> +
>>> +    page_addr = map_start;
>>> +    while ( page_addr < map_end )
>>
>> This loop is continue to assume that only the mapping can first in
>> 2MB
>> section (or less if the start is not 2MB aligned).
>>
>> I am OK if you want to assume it, but I think this should be
>> documented
>> (with words and ASSERT()/BUG_ON()) to avoid any mistake.
> I add a check in setup_initial_pagetables:
>       BUG_ON(load_addr_start % (PAGE_ENTRIES * PAGE_SIZE) != 0);
> Probably this is not a correct place and should be moved to
> setup_initial_mapping() instead of setup_initial_pagetables()

Yes it should be moved in setup_initial_mapping().

>>
>>> +    {
>>> +        unsigned long index2 = pt_index(2, page_addr);
>>> +        unsigned long index1 = pt_index(1, page_addr);
>>> +        unsigned long index0 = pt_index(0, page_addr);
>>> +
>>> +        /* Setup level2 table */
>>> +        second[index2] = paddr_to_pte((unsigned long)first);
>>> +        second[index2].pte |= PTE_TABLE;
>>> +
>>> +        /* Setup level1 table */
>>> +        first[index1] = paddr_to_pte((unsigned long)zeroeth);
>>> +        first[index1].pte |= PTE_TABLE;
>>> +
>>> +
>>
>> NIT: Spurious line?
> Yeah, should be removed. Thanks.
>>
>>> +        /* Setup level0 table */
>>> +        if ( !pte_is_valid(&zeroeth[index0]) )
>>
>> On the previous version, you said it should be checked for each
>> level.
> I had a terrible internet connection, and my message wasn't sent.

No worries.

> 
> I decided not to check that l2 and l1 are used only for referring to
> the next page table but not leaf PTE. So it is safe to overwrite it
> each time (the addresses of page tables are the same all the time)

You are letting the caller to decide which page-table to use for each 
level. So you are at the mercy that caller will do the right thing.

IHMO, this is a pretty bad idea because debugging page-tables error are 
difficult. So it is better to have safety in place. This is not worth...

  and
> probably it will be better from optimization point of view to ignore if
> clauses.

... the optimization in particular when this is at boot time.

> 
> And it is needed in case of L0 because it is possible that some
> addressed were marked with specific flag ( execution, read, write ) and
> so not to overwrite the flags set before the check is needed.
In which case you should really report an error because the caller may 
have decide to set execution flag and you don't honor. So when the code 
is executed, you will receive a fault and this may be hard to find out 
what happen.

> 
>> the next page table but not leaf PTE.But here you still only check
>> for a single level.
>>
>> Furthermore, I would strongly suggest to also check the valid PTE is
>> the
>> same as you intend to write to catch any override (they are a pain to
>> debug).
> but if load addresses and linker addresses don't overlap is it possible
> situation that valid PTE will be overridden?

A bug in the code. In fact, if you add the check you would have notice 
that your existing code is buggy (see below).

>>
>>> +        {
>>> +            /* Update level0 table */
>>> +            zeroeth[index0] = paddr_to_pte((page_addr - map_start)
>>> + pa_start);
>>> +            zeroeth[index0].pte |= flags;
>>> +        }
>>> +
>>> +        /* Point to next page */
>>> +        page_addr += XEN_PT_LEVEL_SIZE(0);
>>> +    }
>>> +}
>>> +
>>> +/*
>>> + * setup_initial_pagetables:
>>> + *
>>> + * Build the page tables for Xen that map the following:
>>> + *   load addresses to linker addresses

I would suggest to expand because this is not entirely what you exactly 
are doing. In fact...

>>> + */
>>> +void __init setup_initial_pagetables(void)
>>> +{
>>> +    pte_t *second;
>>> +    pte_t *first;
>>> +    pte_t *zeroeth;
>>> +
>>> +    unsigned long load_addr_start   = boot_info.load_start;
>>> +    unsigned long load_addr_end     = boot_info.load_end;
>>> +    unsigned long linker_addr_start = boot_info.linker_start;
>>> +    unsigned long linker_addr_end   = boot_info.linker_end;
>>> +
>>> +    BUG_ON(load_addr_start % (PAGE_ENTRIES * PAGE_SIZE) != 0);
>>> +    if (load_addr_start != linker_addr_start)
>>> +        BUG_ON((linker_addr_end > load_addr_start && load_addr_end
>>>> linker_addr_start));
>>
>> I would suggest to switch to a panic() with an error message as this
>> would help the user understanding what this is breaking.
>>
>> Alternatively, you could document what this check is for.
> I think I will document it for now as panic() isn't ready for use now.
>>
>>> +
>>> +    /* Get the addresses where the page tables were loaded */
>>> +    second  = (pte_t *)(&xen_second_pagetable);
>>> +    first   = (pte_t *)(&xen_first_pagetable);
>>> +    zeroeth = (pte_t *)(&xen_zeroeth_pagetable);
>>> +
>>> +    setup_initial_mapping(second, first, zeroeth,
>>> +                          LOAD_TO_LINK((unsigned long)&_stext),
>>> +                          LOAD_TO_LINK((unsigned long)&_etext),
>>> +                          (unsigned long)&_stext,
>>> +                          PTE_LEAF_DEFAULT);
>>> +
>>> +    setup_initial_mapping(second, first, zeroeth,
>>> +                          LOAD_TO_LINK((unsigned
>>> long)&__init_begin),
>>> +                          LOAD_TO_LINK((unsigned
>>> long)&__init_end),
>>> +                          (unsigned long)&__init_begin,
>>> +                          PTE_LEAF_DEFAULT | PTE_WRITABLE);
>>> +
>>> +    setup_initial_mapping(second, first, zeroeth,
>>> +                          LOAD_TO_LINK((unsigned long)&_srodata),
>>> +                          LOAD_TO_LINK((unsigned long)&_erodata),
>>> +                          (unsigned long)(&_srodata),
>>> +                          PTE_VALID | PTE_READABLE);
>>> +
>>> +    setup_initial_mapping(second, first, zeroeth,
>>> +                          linker_addr_start,
>>> +                          linker_addr_end,
>>> +                          load_addr_start,
>>> +                          PTE_LEAF_DEFAULT | PTE_READABLE);

... this is not cover above. AFAIU, this is the one for the 1:1 mapping.

>>
>> As I said in v1, you need to use a different set of page-table here.
> If I understand you correctly I have to use a different set of page-
> table in case when it is possible that size of Xen will be larger then
> PAGE_SIZE. So I added to xen.lds.S a check to be sure that the size
> fits into PAGE_SIZE.

This is not what I was referring to. I was pointing out that second, 
first, zeroeth are exactly the same for all the callers. You want to 
introduce a second set of zeroeth table. You will want to do the same 
for first but it is not always used.

Otherwise, this is not going to work if Xen is loaded at a different 
address than the runtime.

That said, when I spoke with Andrew yesterday, he mentioned that your 
initial goal is to support the case where Xen is loaded at the runtime 
address. I understand this simplifies a lot the code and I told him I 
was OK with that. However, it would be good to document what are your 
goals in each series (this is not always clear what you skip on purpose).

> 
>> Also, where do you guarantee that Xen will be loaded at a 2MB aligned
>> address? (For a fact I know that UEFI is only guarantee 4KB
>> alignment).
> There is a check in setup_initial_pagetables:
>       BUG_ON(load_addr_start % (PAGE_ENTRIES * PAGE_SIZE) != 0);

This is not very obvious the check is to confirm that Xen is probably 
aligned. I would suggest to add a comment.

Also, you might want to use XEN_PT_LEVEL_SIZE(..) to make it more 
obvious what sort of alignment you are trying to enforce.

>>> +        la      sp, cpu0_boot_stack
>>> +        li      t0, STACK_SIZE
>>> +        add     sp, sp, t0
>>> +
>>> +        /*
>>> +         * Re-init an address of exception handler as it was
>>> overwritten  with
>>> +         * the address of the .L_mmu_is_enabled label.
>>> +         * Before jump to trap_init save return address of
>>> enable_mmu() to
>>> +         * know where we should back after enable_mmu() will be
>>> finished.
>>> +         */
>>> +        mv      s0, ra
>>> +        lla     t0, trap_init
>>> +        jalr    ra, t0
>>> +
>>> +        /*
>>> +         * Re-calculate the return address of enable_mmu()
>>> function for case
>>> +         * when linker start address isn't equal to load start
>>> address
>>> +         */
>>> +        add     s0, s0, t1
>>> +        mv      ra, s0
>>> +
>>> +        ret
>>
>> Missing ENDPROC?
> I haven't seen the usage of ENDPROC for RISC-V so it looks like it is
> not necessary.

Ok. Would the objdump be able to report the function properly then? I 
know that on Arm, it was necessary report assembly function properly.

>>
>>> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
>>> index eed457c492..e4ac4e84b6 100644
>>> --- a/xen/arch/riscv/xen.lds.S
>>> +++ b/xen/arch/riscv/xen.lds.S
>>> @@ -179,3 +179,5 @@ SECTIONS
>>>    
>>>    ASSERT(!SIZEOF(.got),      ".got non-empty")
>>>    ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
>>> +
>>> +ASSERT(_end - _start <= MB(2), "Xen too large for early-boot
>>> assumptions")
>>
> ~ Oleksii
> 

Cheers,

-- 
Julien Grall

