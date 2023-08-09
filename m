Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3AA776A8F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 22:55:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581361.910023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTqCs-0002b7-P9; Wed, 09 Aug 2023 20:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581361.910023; Wed, 09 Aug 2023 20:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTqCs-0002Yf-MK; Wed, 09 Aug 2023 20:55:02 +0000
Received: by outflank-mailman (input) for mailman id 581361;
 Wed, 09 Aug 2023 20:55:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTx5=D2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qTqCr-0002WX-0Y
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 20:55:01 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0086e657-36f7-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 22:54:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3653A828538F;
 Wed,  9 Aug 2023 15:54:58 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id usqnpS88QlFm; Wed,  9 Aug 2023 15:54:55 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D03BD82856F5;
 Wed,  9 Aug 2023 15:54:55 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PnUMHGvrVBQm; Wed,  9 Aug 2023 15:54:55 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 22566828538F;
 Wed,  9 Aug 2023 15:54:55 -0500 (CDT)
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
X-Inumbo-ID: 0086e657-36f7-11ee-b281-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D03BD82856F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691614495; bh=zHXCCnOOWO7/rMYgzVXLYuRN9Jt9vZQbfdwIISnfup4=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=kiV3x0gRXnlAS9zV6imJ9vcMgD4y2zSWngAgbpziNzB7s/Tve75im7WMejaPm2jLr
	 92CxvqwTF8ae/AF4E2h5XoKfdoFvNX7jreXFEn9xGQFqonsq7qfsQ/FXCWJgKeLUSA
	 apDoWxbtigB/YDagSm35TGD6Ig+1dQlQ93WQjvQQ=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <ad54705c-62eb-7ce1-6d2e-49e60e6dc6f9@raptorengineering.com>
Date: Wed, 9 Aug 2023 15:54:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] xen/ppc: Implement initial Radix MMU support
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690582001.git.sanastasio@raptorengineering.com>
 <ed166c38bbcf82ad58a14353a880d1e208cb2ff1.1690582001.git.sanastasio@raptorengineering.com>
 <55e1391e-a289-72bd-f663-62276cf4b065@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <55e1391e-a289-72bd-f663-62276cf4b065@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/1/23 8:18 AM, Jan Beulich wrote:
> On 29.07.2023 00:21, Shawn Anastasio wrote:
>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/bitops.h
>> @@ -0,0 +1,11 @@
>> +#ifndef _ASM_PPC_BITOPS_H
>> +#define _ASM_PPC_BITOPS_H
>> +
>> +#include <xen/compiler.h>
> 
> Not a big deal, but ...
> 
>> +/* PPC bit number conversion */
>> +#define PPC_BITLSHIFT(be)	(BITS_PER_LONG - 1 - (be))
>> +#define PPC_BIT(bit)		(1UL << PPC_BITLSHIFT(bit))
>> +#define PPC_BITMASK(bs, be)	((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
>> +
>> +#endif /* _ASM_PPC_BITOPS_H */
> 
> ... nothing here looks to require that #include.
>

Good point, I'll drop it.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/mm.h
>> @@ -0,0 +1,19 @@
>> +#ifndef _ASM_PPC_MM_H
>> +#define _ASM_PPC_MM_H
>> +
>> +#include <asm/config.h>
> 
> This is included by xen/config.h, which in turn is included from the
> compiler command line.
> 

Thanks for letting me know. Will drop.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/page.h
>> @@ -0,0 +1,178 @@
>> +#ifndef _ASM_PPC_PAGE_H
>> +#define _ASM_PPC_PAGE_H
>> +
>> +#include <xen/types.h>
>> +
>> +#include <asm/bitops.h>
>> +#include <asm/byteorder.h>
>> +
>> +#define PDE_VALID     PPC_BIT(0)
>> +#define PDE_NLB_MASK  0xfffffffffffffUL
>> +#define PDE_NLB_SHIFT 5UL
>> +#define PDE_NLS_MASK  0x1f
>> +
>> +#define PTE_VALID     PPC_BIT(0)
>> +#define PTE_LEAF      PPC_BIT(1)
>> +#define PTE_REFERENCE PPC_BIT(55)
>> +#define PTE_CHANGE    PPC_BIT(56)
>> +
>> +/* PTE Attributes */
>> +#define PTE_ATT_SAO            PPC_BIT(59) /* Strong Access Ordering */
>> +#define PTE_ATT_NON_IDEMPOTENT PPC_BIT(58)
>> +#define PTE_ATT_TOLERANT       (PPC_BIT(58) | PPC_BIT(59))
>> +
>> +/* PTE Encoded Access Authority*/
>> +#define PTE_EAA_PRIVILEGED PPC_BIT(60)
>> +#define PTE_EAA_READ       PPC_BIT(61)
>> +#define PTE_EAA_WRITE      PPC_BIT(62)
>> +#define PTE_EAA_EXECUTE    PPC_BIT(63)
>> +
>> +/* Field shifts/masks */
>> +#define PTE_RPN_MASK  0x1fffffffffffUL
>> +#define PTE_RPN_SHIFT 12UL
>> +#define PTE_ATT_MASK  0x3UL
>> +#define PTE_ATT_SHIFT 4UL
>> +#define PTE_EAA_MASK  0xfUL
> 
> Did you consider introducing just *_MASK values, utilizing MASK_INSR()
> and MASK_EXTR() instead of open-coded shifting/masking?
>

I actually wasn't aware of MASK_INSR/MASK_EXTR when writing this. I've
just looked into it though, and I don't think using them makes the code
much cleaner. Specifically I'm looking at the implementations of
`pte_to_paddr` and `pde_to_paddr` which both need to ensure that the
returned value retains its original shift.

For example, with pte_to_paddr, this change would be:
-     return be64_to_cpu(pte.pte) & (PTE_RPN_MASK << PTE_RPN_SHIFT);
+     return MASK_EXTR(be64_to_cpu(pte.pte), PTE_RPN_MASK) << PTE_RPN_SHIFT;

In addition to updating the definitions of the *_MASK macros to include
the right-most padding zeros.

- #define PTE_RPN_MASK  0x1fffffffffffUL
+ #define PTE_RPN_MASK  0x1fffffffffff000UL

I don't really think this is an improvement, so I'm tempted to keep the
code as-is. If you feel strongly about the usage of MASK_{INSR,EXTR},
though, I could make the change.

>> +#define PTE_XEN_BASE (PTE_VALID | PTE_EAA_PRIVILEGED | PTE_REFERENCE)
>> +#define PTE_XEN_RW   (PTE_XEN_BASE | PTE_EAA_READ | PTE_EAA_WRITE | PTE_CHANGE)
>> +#define PTE_XEN_RO   (PTE_XEN_BASE | PTE_EAA_READ)
>> +#define PTE_XEN_RX   (PTE_XEN_BASE | PTE_EAA_READ | PTE_EAA_EXECUTE)
>> +
>> +/*
>> + * Radix Tree layout for 64KB pages:
>> + *
>> + * [ L1 (ROOT) PAGE DIRECTORY (8192 * sizeof(pde_t)) ]
>> + *                     |
>> + *                     |
>> + *                     v
>> + *    [ L2 PAGE DIRECTORY (512 * sizeof(pde_t)) ]
>> + *                     |
>> + *                     |
>> + *                     v
>> + *    [ L3 PAGE DIRECTORY (512 * sizeof(pde_t)) ]
>> + *                     |
>> + *                     |
>> + *                     v
>> + *      [ L4 PAGE TABLE (32 * sizeof(pte_t)) ]
>> + *                     |
>> + *                     |
>> + *                     v
>> + *            [ PAGE TABLE ENTRY ]
>> + */
>> +
>> +#define XEN_PT_ENTRIES_LOG2_LVL_1 13 /* 2**13 entries, maps 2**13 * 512GB = 4PB */
>> +#define XEN_PT_ENTRIES_LOG2_LVL_2 9  /* 2**9  entries, maps 2**9  * 1GB = 512GB */
>> +#define XEN_PT_ENTRIES_LOG2_LVL_3 9  /* 2**9  entries, maps 2**9  * 1GB = 512GB */
>> +#define XEN_PT_ENTRIES_LOG2_LVL_4 5  /* 2**5  entries, maps 2**5  * 64K = 2MB */
>> +
>> +#define XEN_PT_SHIFT_LVL_1    (XEN_PT_SHIFT_LVL_2 + XEN_PT_ENTRIES_LOG2_LVL_2)
>> +#define XEN_PT_SHIFT_LVL_2    (XEN_PT_SHIFT_LVL_3 + XEN_PT_ENTRIES_LOG2_LVL_3)
>> +#define XEN_PT_SHIFT_LVL_3    (XEN_PT_SHIFT_LVL_4 + XEN_PT_ENTRIES_LOG2_LVL_4)
>> +#define XEN_PT_SHIFT_LVL_4    PAGE_SHIFT
>> +
>> +#define XEN_PT_ENTRIES_LOG2_LVL(lvl) (XEN_PT_ENTRIES_LOG2_LVL_##lvl)
>> +#define XEN_PT_SHIFT_LVL(lvl)        (XEN_PT_SHIFT_LVL_##lvl)
>> +#define XEN_PT_ENTRIES_LVL(lvl)      (1UL << XEN_PT_ENTRIES_LOG2_LVL(lvl))
>> +#define XEN_PT_MASK_LVL(lvl)         (XEN_PT_ENTRIES_LVL(lvl) - 1)
>> +#define XEN_PT_INDEX_LVL(lvl, va)    ((va >> XEN_PT_SHIFT_LVL(lvl)) & XEN_PT_MASK_LVL(lvl))
>> +
>> +/*
>> + * Calculate the index of the provided virtual address in the provided
>> + * page table struct
>> + */
>> +#define pt_index(pt, va) _Generic((pt), \
> 
> Earlier on I did ask about the minimum compiler version you require for
> building the PPC hypervisor. Iirc you said about any, but here you're
> using another feature where I'm not sure how far back it is available.
> As indicated back then, it would be nice if ./README could gain
> respective information.
> 

I'm locally building with gcc 10 (shipped with Debian 11), and the Xen
CI image for ppc64le builds uses gcc 11 I believe. _Generic and the
other features I'm using are certainly available further back, but I
haven't personally tested anything earlier. If there's no objections,
I'm tempted to just codify gcc 10 as the minimum supported compiler
version and leave it up to users if they want to try testing on earlier
versions.

>> +    struct lvl1_pd * : XEN_PT_INDEX_LVL(1, (va)), \
>> +    struct lvl2_pd * : XEN_PT_INDEX_LVL(2, (va)), \
>> +    struct lvl3_pd * : XEN_PT_INDEX_LVL(3, (va)), \
>> +    struct lvl4_pt * : XEN_PT_INDEX_LVL(4, (va)))
>> +
>> +#define pt_entry(pt, va) (&((pt)->entries[pt_index((pt), (va))]))
> 
> As to style: Here (and elsewhere) you put unnecessary parentheses
> around two of the three uses of the macro arguments. If you think you
> want to keep it like that, feel free; in general we're recommending to
> omit ones not really needed, to help readability. Otoh a little higher
> up in XEN_PT_INDEX_LVL() parentheses are missing around va.
>

If possible I'd prefer to just leave it as-is. Unconditionally
parenthesizing macro arguments seems less error-prone as a general
policy, though I agree the latter two here are unnecessary.

That said, the lack of parenthesis around va in XEN_PT_INDEX_LEVEL was
definitely an oversight and I'll fix that.

>> +typedef struct
>> +{
>> +    __be64 pde;
>> +} pde_t;
>> +
>> +typedef struct
>> +{
>> +    __be64 pte;
>> +} pte_t;
>> +
>> +struct lvl1_pd
>> +{
>> +    pde_t entries[1U << XEN_PT_ENTRIES_LOG2_LVL_1];
>> +};
>> +
>> +struct lvl2_pd
>> +{
>> +    pde_t entries[1U << XEN_PT_ENTRIES_LOG2_LVL_2];
>> +};
>> +
>> +struct lvl3_pd
>> +{
>> +    pde_t entries[1U << XEN_PT_ENTRIES_LOG2_LVL_3];
>> +};
>> +
>> +struct lvl4_pt
>> +{
>> +    pte_t entries[1U << XEN_PT_ENTRIES_LOG2_LVL_4];
>> +};
>> +
>> +static inline pte_t paddr_to_pte(paddr_t paddr, unsigned long flags)
>> +{
>> +    return (pte_t){ .pte = cpu_to_be64(paddr | flags | PTE_LEAF) };
>> +}
>> +
>> +static inline pde_t paddr_to_pde(paddr_t paddr, unsigned long flags, unsigned long nls)
>> +{
>> +    return (pde_t){ .pde = cpu_to_be64(paddr | flags | nls) };
>> +}
> 
> In these two, are you sure you want to demand all callers to only ever
> pass in page-aligned addresses?
>

Fair point. Perhaps it would be best to mask the caller-provided
address.

>> +static inline paddr_t pte_to_paddr(pte_t pte)
>> +{
>> +    return be64_to_cpu(pte.pte) & (PTE_RPN_MASK << PTE_RPN_SHIFT);
>> +}
>> +
>> +static inline paddr_t pde_to_paddr(pde_t pde)
>> +{
>> +    return be64_to_cpu(pde.pde) & (PDE_NLB_MASK << PDE_NLB_SHIFT);
>> +}
>> +
>> +static inline bool pte_is_valid(pte_t pte)
>> +{
>> +    return pte.pte & be64_to_cpu(PTE_VALID);
>> +}
>> +
>> +static inline bool pde_is_valid(pde_t pde)
>> +{
>> +    return pde.pde & be64_to_cpu(PDE_VALID);
>> +}
>> +
>> +/*
>> + * ISA 3.0 partition and process table entry format
>> + */
>> +struct patb_entry {
>> +	__be64 patb0;
>> +	__be64 patb1;
>> +};
>> +#define PATB0_HR PPC_BIT(0) /* host uses radix */
>> +#define PATB1_GR PPC_BIT(0) /* guest uses radix; must match HR */
>> +
>> +struct prtb_entry {
>> +	__be64 prtb0;
>> +	__be64 reserved;
>> +};
>> +
>> +/*
>> + * We support 52 bits, hence:
>> + * bits 52 - 31 = 21, 0b10101
>> + * RTS encoding details
>> + * bits 0 - 3 of rts -> bits 6 - 8 unsigned long
>> + * bits 4 - 5 of rts -> bits 62 - 63 of unsigned long
>> + */
>> +#define RTS_FIELD ((0x2UL << 61) | (0x5UL << 5))
> 
> I'm afraid I can't bring comment and #define together. Bits 0-3 are
> 4 bits; bits 6-8 are only three. And I'd expect the lower ends of
> the ranges to appear as shift counts in the expression.
>

Yes, I agree that this is confusing. For reference, this comment was
verbatim copied from a comment in Linux[*] and I admittedly didn't pay
as much attention to it as I did to the expression itself.

As far as I can tell, the original author's intent was to use 1-indexed
non-PPC-style bit numbering and wrote 0-3 instead of 1-3 as a mistake.
Under this interpretation, the comment makes more sense as do the
shift counts in the expression being off by one.

I'll rewrite it to correct the mistake and use standard 0-indexing for
bits. Something like:

/*
 * We support 52 bits, hence:
 * bits 52 - 31 = 21, 0b10101
 * RTS encoding details
 * bits 0 - 2 of rts -> bits 5 - 7 of unsigned long
 * bits 3 - 4 of rts -> bits 61 - 62 of unsigned long
 */

[*] arch/powerpc/include/asm/book3s/64/radix.h:radix__get_tree_size

>> --- a/xen/arch/ppc/include/asm/processor.h
>> +++ b/xen/arch/ppc/include/asm/processor.h
>> @@ -133,6 +133,37 @@ struct cpu_user_regs
>>      uint32_t entry_vector;
>>  };
>>  
>> +static __inline__ void sync(void)
>> +{
>> +    asm volatile ( "sync" );
>> +}
>> +
>> +static __inline__ void isync(void)
>> +{
>> +    asm volatile ( "isync" );
>> +}
>> +
>> +static inline unsigned long mfmsr(void)
>> +{
>> +    unsigned long msr;
>> +    asm volatile ( "mfmsr %0" : "=&r"(msr) );
> 
> Why the &?

This was in the original Xen 3.2 header that this function was taken
from, but I agree that it seems strange. I'll drop it in v2.

> Also nit: Missing blank between closing double quote and opening paren.
> More instances of this below.
>

Will fix.

>> +    return msr;
>> +}
>> +
>> +static inline void mtmsrd(unsigned long msr)
>> +{
>> +    asm volatile ( "mtmsrd %0" : : "r"(msr) );
>> +}
>> +
>> +#define mtspr(reg, val) asm volatile ( "mtspr %0,%1" : : "K"(reg), "r"(val) )
>> +
>> +#define mfspr(reg)                                                             \
>> +    ({                                                                         \
>> +        unsigned long val;                                                     \
>> +        asm volatile ( "mfspr %0,%1" : "=r"(val) : "K"(reg) );                 \
>> +        val;                                                                   \
>> +    })
> 
> Why #define-s here when higher up you successfully use inline functions?
> 

This was a temporary thing that I meant to convert into a full function
before committing but seem to have overlooked. Thanks for pointing it
out.

> Also (nit) blanks would again be nice ahead of the commas.
> 

Will do.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/regs.h
>> @@ -0,0 +1,138 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, write to the Free Software
>> + * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
> 
> You have an SPDX line first thing - why the spelled out license?
>

Leftover from importing the header from Xen 3.2. Will drop.

>> --- /dev/null
>> +++ b/xen/arch/ppc/mm-radix.c
>> @@ -0,0 +1,268 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#include <xen/init.h>
>> +#include <xen/kernel.h>
>> +#include <xen/types.h>
>> +#include <xen/lib.h>
> 
> Nit: Please sort headers whenever possibly; also ...
> 
>> +#include <asm/bitops.h>
>> +#include <asm/byteorder.h>
>> +#include <asm/early_printk.h>
>> +#include <asm/mm.h>
>> +#include <asm/page.h>
>> +#include <asm/processor.h>
>> +#include <asm/regs.h>
>> +#include <asm/msr.h>
> 
> ... this group then.
>

I'll alphabetically sort both groups.

>> +void enable_mmu(void);
>> +
>> +#define INITIAL_LVL1_PD_COUNT      1
>> +#define INITIAL_LVL2_LVL3_PD_COUNT 2
>> +#define INITIAL_LVL4_PT_COUNT      256
>> +
>> +static size_t initial_lvl1_pd_pool_used;
>> +static struct lvl1_pd __aligned(sizeof(struct lvl1_pd))
>> +initial_lvl1_pd_pool[INITIAL_LVL1_PD_COUNT];
>> +
>> +static size_t initial_lvl2_lvl3_pd_pool_used;
>> +static struct lvl2_pd __aligned(sizeof(struct lvl2_pd))
>> +initial_lvl2_lvl3_pd_pool[INITIAL_LVL2_LVL3_PD_COUNT];
>> +
>> +static size_t initial_lvl4_pt_pool_used;
>> +static struct lvl4_pt __aligned(sizeof(struct lvl4_pt))
>> +initial_lvl4_pt_pool[INITIAL_LVL4_PT_COUNT];
> 
> Can instances of these structures usefully exist and be not suitably
> aligned? If not, having the types rather than the instances already
> declare the necessary alignment would seem better to me.
>

I can't think of a scenario in which we'd want instances of these
structures without alignment. I'll go ahead and apply the alignment to
the struct definitions instead.

>> +/* Only reserve minimum Partition and Process tables  */
>> +#define PATB_SIZE_LOG2 16 /* Only supported partition table size on POWER9 */
>> +#define PATB_SIZE      (1UL << PATB_SIZE_LOG2)
>> +#define PRTB_SIZE_LOG2 12
>> +#define PRTB_SIZE      (1UL << PRTB_SIZE_LOG2)
>> +
>> +static struct patb_entry
>> +    __aligned(PATB_SIZE) initial_patb[PATB_SIZE / sizeof(struct patb_entry)];
>> +
>> +static struct prtb_entry
>> +    __aligned(PRTB_SIZE) initial_prtb[PRTB_SIZE / sizeof(struct prtb_entry)];
> 
> The situation is different here, as array here aren't embedded into
> the type (being just single entries).
>

Right.

>> +_Static_assert(sizeof(initial_patb) == PATB_SIZE);
> 
> Is this really useful. And if so, why no similar check for prtb?
> Furthermore BUILD_BUG_ON() would be better, playing again into what
> the range of suitable compilers is for this to build.
>

This was a debug statement that I had inadvertently left in. I'll remove
it.

>> +static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
>> +                                         vaddr_t map_start,
>> +                                         vaddr_t map_end,
>> +                                         paddr_t phys_base)
>> +{
>> +    uint64_t page_addr;
>> +
>> +    if ( map_start & ~PAGE_MASK )
>> +    {
>> +        early_printk("Xen _start be aligned to 64k (PAGE_SIZE) boundary\n");
>> +        die();
>> +    }
>> +
>> +    if ( (uint64_t) phys_base & ~PAGE_MASK )
> 
> Why the cast?
>

I believe in an earlier revision of this code I had phys_base's type as
void* or similar, so this is just a leftover that I forgot to clean up.
I'll remove the cast.

>> +    {
>> +        early_printk("Xen should be loaded at 64k (PAGE_SIZE) boundary\n");
>> +        die();
>> +    }
>> +
>> +    for ( page_addr = map_start; page_addr < map_end; page_addr += PAGE_SIZE )
>> +    {
>> +        struct lvl2_pd *lvl2;
>> +        struct lvl3_pd *lvl3;
>> +        struct lvl4_pt *lvl4;
>> +        pde_t *pde;
>> +        pte_t *pte;
>> +
>> +        /* Allocate LVL 2 PD if necessary */
>> +        pde = pt_entry(lvl1, page_addr);
>> +        if ( !pde_is_valid(*pde) )
>> +        {
>> +            lvl2 = lvl2_pd_pool_alloc();
>> +            *pde = paddr_to_pde(__pa(lvl2), PDE_VALID, XEN_PT_ENTRIES_LOG2_LVL_2);
> 
> paddr_to_pde() doesn't mask off the top bits. Are you relying on
> lvl2_pd_pool_alloc() using PIC addressing to get at the value it
> then returns?
>

I'm not sure I understand the question here. The pointer returned by
lvl2_pd_pool_alloc() will indeed have the top address bits set in
accordance with the link address, even before paging is enabled because
of the relocation code and jump to XEN_VIRT_START in patch 2. This is
fine though, since I call __pa() to strip off these bits before passing
it to paddr_to_pde.

> Also this and the similar lines below look to be a little too long.
>

Yeah, I noticed this as well, but my understanding was that lines longer
than 80 columns were permitted in cases where they don't hurt
readability. In any case, I can fix this.

>> +        }
>> +        else
>> +            lvl2 = (struct lvl2_pd *) pde_to_paddr(*pde);
> 
> This casts a physical address to a pointer; normally only virtual
> addresses can be used this way. Could there be a helper added to
> have such a dangerous-looking construct in (ideally) just a single
> place?
>

Fair point. We already have __va() which will work due to the previously
mentioned relocation code in patch 2 even before the MMU is enabled. I
think it might make sense to use that.

>> +        /* Allocate LVL 3 PD if necessary */
>> +        pde = pt_entry(lvl2, page_addr);
>> +        if ( !pde_is_valid(*pde) )
>> +        {
>> +            lvl3 = lvl3_pd_pool_alloc();
>> +            *pde = paddr_to_pde(__pa(lvl3), PDE_VALID, XEN_PT_ENTRIES_LOG2_LVL_3);
>> +        }
>> +        else
>> +            lvl3 = (struct lvl3_pd *) pde_to_paddr(*pde);
>> +
>> +        /* Allocate LVL 4 PT if necessary */
>> +        pde = pt_entry(lvl3, page_addr);
>> +        if ( !pde_is_valid(*pde) )
>> +        {
>> +            lvl4 = lvl4_pt_pool_alloc();
>> +            *pde = paddr_to_pde(__pa(lvl4), PDE_VALID, XEN_PT_ENTRIES_LOG2_LVL_4);
>> +        }
>> +        else
>> +            lvl4 = (struct lvl4_pt *) pde_to_paddr(*pde);
>> +
>> +        /* Finally, create PTE in LVL 4 PT */
>> +        pte = pt_entry(lvl4, page_addr);
>> +        if ( !pte_is_valid(*pte) )
>> +        {
>> +            unsigned long paddr = (page_addr - map_start) + phys_base;
>> +            unsigned long flags;
>> +            radix_dprint(paddr, "being mapped to ");
> 
> Blank line again please between declarations and statements.
>

Will fix.

>> +            radix_dprint(page_addr, "!\n");
>> +            if ( is_kernel_text(page_addr) || is_kernel_inittext(page_addr) )
>> +            {
>> +                radix_dprint(page_addr, "being marked as TEXT (RX)\n");
>> +                flags = PTE_XEN_RX;
>> +            }
>> +            else if ( is_kernel_rodata(page_addr) )
>> +            {
>> +                radix_dprint(page_addr, "being marked as RODATA (RO)\n");
>> +                flags = PTE_XEN_RO;
>> +            }
>> +            else
>> +            {
>> +                radix_dprint(page_addr, "being marked as DEFAULT (RW)\n");
>> +                flags = PTE_XEN_RW;
>> +            }
>> +
>> +            *pte = paddr_to_pte(paddr, flags);
>> +            radix_dprint(paddr_to_pte(paddr, flags).pte,
>> +                             "is result of PTE map!\n");
>> +        }
>> +        else
>> +        {
>> +            early_printk("BUG: Tried to create PTE for already-mapped page!");
>> +            die();
>> +        }
>> +    }
>> +}
>> +
>> +static void setup_partition_table(struct patb_entry *patb, struct lvl1_pd *root)
> 
> __init?
>

Yes, good call. Will add.

>> +{
>> +    unsigned long ptcr;
>> +
>> +    /* Configure entry for LPID 0 to enable Radix and point to root PD */
>> +    uint64_t patb0 = RTS_FIELD | __pa(root) | XEN_PT_ENTRIES_LOG2_LVL_1 | PATB0_HR;
>> +    uint64_t patb1 = __pa(initial_prtb) | (PRTB_SIZE_LOG2 - 12) | PATB1_GR;
>> +    patb[0].patb0 = cpu_to_be64(patb0);
>> +    patb[0].patb1 = cpu_to_be64(patb1);
>> +
>> +    ptcr = __pa(initial_patb) | (PATB_SIZE_LOG2 - 12);
>> +    mtspr(SPRN_PTCR, ptcr);
>> +}
>> +
>> +static void setup_process_table(struct prtb_entry *prtb, struct lvl1_pd *root)
> 
> __init?
>

Ditto.

>> +{
>> +    /* Configure entry for PID 0 to point to root PD */
>> +    uint64_t prtb0 = RTS_FIELD | __pa(root) | XEN_PT_ENTRIES_LOG2_LVL_1;
>> +    initial_prtb[0].prtb0 = cpu_to_be64(prtb0);
>> +}
>> +
>> +void __init setup_initial_pagetables(void)
>> +{
>> +    struct lvl1_pd *root = lvl1_pd_pool_alloc();
>> +    unsigned long lpcr;
>> +
>> +    setup_initial_mapping(root,
>> +                         (vaddr_t) _start,
>> +                         (vaddr_t) _end,
>> +                          __pa(_start));
> 
>     setup_initial_mapping(root,
>                           (vaddr_t)_start,
>                           (vaddr_t)_end,
>                           __pa(_start));
> 
> (if flowing across multiple lines is needed / wanted)
>

I just checked and the line without flowing fits within exactly 80
columns, so I'll make that change.

>> --- a/xen/arch/ppc/opal.c
>> +++ b/xen/arch/ppc/opal.c
>> @@ -1,8 +1,10 @@
>>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#include "xen/compiler.h"
> 
> Surely <xen/compiler.h>, but then neither this nor ...
>

This was accidentally added by my editor/clangd and was not my
intention. I'll remove all change to this file in this patch.

>>  #include <asm/boot.h>
>>  #include <asm/early_printk.h>
>>  #include <asm/opal-api.h>
>>  #include <asm/processor.h>
>> +#include <asm/mm.h>
> 
> ... this addition look motivated when nothing else changes in this file.
>

See above.

> Also (I overlooked this in the earlier patch) all xen/ headers generally
> want to come ahead of all asm/ ones.
>

I'll keep that in mind going forward and for the next time I have a
valid reason to touch this file.

>> --- a/xen/arch/ppc/setup.c
>> +++ b/xen/arch/ppc/setup.c
>> @@ -7,6 +7,8 @@
>>  /* Xen stack for bringing up the first CPU. */
>>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZE);
>>  
>> +void __init setup_initial_pagetables(void);
> 
> This needs to live in a header which is included both here and in the
> file defining the function.
>

I see I already declared the function's prototype in mm.h. This was
probably an oversight from before I added that. I'll drop the prototype
from setup.c and include asm/mm.h instead.

>> +static void tlbiel_radix_set_isa300(unsigned int set, unsigned int is,
>> +                                    unsigned int pid, unsigned int ric,
>> +                                    unsigned int prs)
>> +{
>> +    unsigned long rb;
>> +    unsigned long rs;
>> +
>> +    rb = (set << PPC_BITLSHIFT(51)) | (is << PPC_BITLSHIFT(53));
>> +    rs = ((unsigned long) pid << PPC_BITLSHIFT(31));
>> +
>> +    asm volatile ( "tlbiel %0, %1, %2, %3, 1" :
>> +                  : "r"(rb), "r"(rs), "i"(ric), "i"(prs) : "memory" );
> 
> Nit: One too few indenting blanks (besides others that are missing).
> Perhaps also better to pull the standalone : onto this second line.
> Overall perhaps (also for line length)
> 
>     asm volatile ( "tlbiel %0, %1, %2, %3, 1"
>                    :: "r" (rb), "r" (rs), "i" (ric), "i" (prs)
>                    : "memory" );
>

Will do.

>> +void radix__tlbiel_all(unsigned int action)
> 
> Is the double underscore in here intentional?
>

It matches the original Linux file from which this routine was imported
(referenced in the file's top-level comment).

As I understand it, this is meant to indicate a private function that
shouldn't be called outside of radix-specific MMU or TLB code.  As
Linux's radix support code spans multiple files, a static function
wouldn't work for that.

> Jan

Thanks,
Shawn

