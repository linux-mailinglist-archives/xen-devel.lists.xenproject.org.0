Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D819390EA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 16:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762077.1172179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuHb-0002wq-TY; Mon, 22 Jul 2024 14:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762077.1172179; Mon, 22 Jul 2024 14:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuHb-0002ti-R1; Mon, 22 Jul 2024 14:44:59 +0000
Received: by outflank-mailman (input) for mailman id 762077;
 Mon, 22 Jul 2024 14:44:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sVuHa-0002tc-OD
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 14:44:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sVuHa-0008TS-8a; Mon, 22 Jul 2024 14:44:58 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sVuHa-0002G0-02; Mon, 22 Jul 2024 14:44:58 +0000
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
	bh=02p29+YY269D48FvIkA6iubAUOWyMsjdj8I8LGHx5is=; b=ITTem54MMJPnMNlfqEnLnsdh7S
	9X25J6+V8msfi7KTe6j8zKMevoQzInyQBhDH9yvecO52h4vs72j0ck+T5ekCvvhmAU2lgZBuu+5XL
	1HhMsZN3b/+zQpDXJo1DYwXUJ0xGltngRfcTJfQTBEAJpdMewQRfJ4jsXthSWc7EcapA=;
Message-ID: <f13fe8e6-69f3-4eb5-bdf8-b2b5377c7a4a@xen.org>
Date: Mon, 22 Jul 2024 15:44:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] xen/riscv: setup fixmap mapping
Content-Language: en-GB
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
 <8fd1cc2c-9dda-4e74-b242-fe8aa862955d@xen.org>
 <3ce708acbe360854f88dc4c93b36c2359955915f.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3ce708acbe360854f88dc4c93b36c2359955915f.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 22/07/2024 15:31, Oleksii wrote:
> Hi Julien,

Hi Oleksii,

> On Sun, 2024-07-21 at 09:46 +0100, Julien Grall wrote:
>> Hi Oleksii,
>>
>> On 12/07/2024 17:22, Oleksii Kurochko wrote:
>>> Introduce a function to set up fixmap mappings and L0 page
>>> table for fixmap.
>>>
>>> Additionally, defines were introduced in riscv/config.h to
>>> calculate the FIXMAP_BASE address.
>>> This involved introducing BOOT_FDT_VIRT_{START, SIZE} and
>>> XEN_SIZE, XEN_VIRT_END.
>>>
>>> Also, the check of Xen size was updated in the riscv/lds.S
>>> script to use XEN_SIZE instead of a hardcoded constant.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in V2:
>>>    - newly introduced patch
>>> ---
>>>    xen/arch/riscv/include/asm/config.h |  9 ++++++
>>>    xen/arch/riscv/include/asm/fixmap.h | 48
>>> +++++++++++++++++++++++++++++
>>>    xen/arch/riscv/include/asm/mm.h     |  2 ++
>>>    xen/arch/riscv/include/asm/page.h   |  7 +++++
>>>    xen/arch/riscv/mm.c                 | 35 +++++++++++++++++++++
>>>    xen/arch/riscv/setup.c              |  2 ++
>>>    xen/arch/riscv/xen.lds.S            |  2 +-
>>>    7 files changed, 104 insertions(+), 1 deletion(-)
>>>    create mode 100644 xen/arch/riscv/include/asm/fixmap.h
>>>
>>> diff --git a/xen/arch/riscv/include/asm/config.h
>>> b/xen/arch/riscv/include/asm/config.h
>>> index 50583aafdc..3275477c17 100644
>>> --- a/xen/arch/riscv/include/asm/config.h
>>> +++ b/xen/arch/riscv/include/asm/config.h
>>> @@ -74,11 +74,20 @@
>>>    #error "unsupported RV_STAGE1_MODE"
>>>    #endif
>>>    
>>> +#define XEN_SIZE                MB(2)
>>
>> NIT: I would name it XEN_VIRT_SIZE to be consistent with the
>> start/end.
>>
>>> +#define XEN_VIRT_END            (XEN_VIRT_START + XEN_SIZE)
>> Can we get away with not introducing *_END and just use START, SIZE?
>> The
>> reason I am asking is with "end" it is never clear whether it is
>> inclusive or exclusive. For instance, here you use an exclusive range
>> but ...
>>
>>> +
>>> +#define BOOT_FDT_VIRT_START     XEN_VIRT_END
>>> +#define BOOT_FDT_VIRT_SIZE      MB(4)
>>> +
>>>    #define DIRECTMAP_SLOT_END      509
>>>    #define DIRECTMAP_SLOT_START    200
>>>    #define DIRECTMAP_VIRT_START    SLOTN(DIRECTMAP_SLOT_START)
>>>    #define DIRECTMAP_SIZE          (SLOTN(DIRECTMAP_SLOT_END) -
>>> SLOTN(DIRECTMAP_SLOT_START))
>>>    
>>> +#define FIXMAP_BASE             (BOOT_FDT_VIRT_START +
>>> BOOT_FDT_VIRT_SIZE)
>>> +#define FIXMAP_ADDR(n)          (FIXMAP_BASE + (n) * PAGE_SIZE)
>>> +
>>>    #define FRAMETABLE_SCALE_FACTOR  (PAGE_SIZE/sizeof(struct
>>> page_info))
>>>    #define FRAMETABLE_SIZE_IN_SLOTS (((DIRECTMAP_SIZE / SLOTN(1)) /
>>> FRAMETABLE_SCALE_FACTOR) + 1)
>>>    
>>> diff --git a/xen/arch/riscv/include/asm/fixmap.h
>>> b/xen/arch/riscv/include/asm/fixmap.h
>>> new file mode 100644
>>> index 0000000000..fcfb82d69c
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/fixmap.h
>>> @@ -0,0 +1,48 @@
>>> +/*
>>> + * fixmap.h: compile-time virtual memory allocation
>>> + */
>>> +#ifndef __ASM_FIXMAP_H
>>> +#define __ASM_FIXMAP_H
>>> +
>>> +#include <xen/bug.h>
>>> +#include <xen/page-size.h>
>>> +#include <xen/pmap.h>
>>> +
>>> +#include <asm/page.h>
>>> +
>>> +/* Fixmap slots */
>>> +#define FIX_PMAP_BEGIN (0) /* Start of PMAP */
>>> +#define FIX_PMAP_END (FIX_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of
>>> PMAP */
>>
>> ... here is seems to be inclusive. Furthermore if you had 32-bit
>> address
>> space, it is also quite easy to have to create a region right at the
>> top
>> of it. So when END is exclusive, it would become 0.
>>
>> So on Arm, we decided to start to get rid of "end". I would consider
>> to
>> do the same on RISC-V for new functions.
> I will refactor the code and get rid of "end".
> 
>>
>>> +#define FIX_MISC (FIX_PMAP_END + 1)  /* Ephemeral mappings of
>>> hardware */
>>
>> Are you going to use this fixmap? If not, then I would consider to
>> remove it.
> Yes, it used now in copy_from_paddr():
>     /**
>      * copy_from_paddr - copy data from a physical address
>      * @dst: destination virtual address
>      * @paddr: source physical address
>      * @len: length to copy
>      */
>     void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long
>     len)
>     {
>         void *src = (void *)FIXMAP_ADDR(FIXMAP_MISC);
>     
>         while (len) {
>             unsigned long l, s;
>     
>             s = paddr & (PAGE_SIZE-1);
>             l = min(PAGE_SIZE - s, len);
>     
>             set_fixmap(FIXMAP_MISC, maddr_to_mfn(paddr),
>     PAGE_HYPERVISOR_WC);
>             memcpy(dst, src + s, l);
>             clear_fixmap(FIXMAP_MISC);
>     
>             paddr += l;
>             dst += l;
>             len -= l;
>         }
>     }
> 
>>
>>> +
>>> +#define FIX_LAST FIX_MISC
>>> +
>>> +#define FIXADDR_START FIXMAP_ADDR(0)
>>> +#define FIXADDR_TOP FIXMAP_ADDR(FIX_LAST)
>>> +
>>> +#ifndef __ASSEMBLY__
>>> +
>>> +/*
>>> + * Direct access to xen_fixmap[] should only happen when {set,
>>> + * clear}_fixmap() is unusable (e.g. where we would end up to
>>> + * recursively call the helpers).
>>> + */
>>> +extern pte_t xen_fixmap[];
>>> +
>>> +/* Map a page in a fixmap entry */
>>> +extern void set_fixmap(unsigned int map, mfn_t mfn, unsigned int
>>> attributes);
>>> +/* Remove a mapping from a fixmap entry */
>>> +extern void clear_fixmap(unsigned int map);
>>
>> Neither of the functions seem to be implemented in this patch. Can
>> you
>> clarify what's the plan for them?
> You are right, it could be dropped now. But in future this functions
> are used for copy_from_paddr(). Look at the code above.

Right, to me it is just odd we are definition prototype for functions 
that don't yet exist.

>>
>> Also, I know that for x86/arm, we have some function prefixed with
>> extern. But AFAIK, we are trying to get rid of them.
>>
>> In any case, I think for RISC-V we need some consistency. For
>> instance,
>> here you define with extern but...
>>
>>> +
>>> +#define fix_to_virt(slot) ((void *)FIXMAP_ADDR(slot))
>>> +
>>> +static inline unsigned int virt_to_fix(vaddr_t vaddr)
>>> +{
>>> +    BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
>>> +
>>> +    return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
>>> +}
>>> +
>>> +#endif /* __ASSEMBLY__ */
>>> +
>>> +#endif /* __ASM_FIXMAP_H */
>>> diff --git a/xen/arch/riscv/include/asm/mm.h
>>> b/xen/arch/riscv/include/asm/mm.h
>>> index 25af9e1aaa..a0bdc2bc3a 100644
>>> --- a/xen/arch/riscv/include/asm/mm.h
>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>> @@ -255,4 +255,6 @@ static inline unsigned int
>>> arch_get_dma_bitsize(void)
>>>        return 32; /* TODO */
>>>    }
>>>    
>>> +void setup_fixmap_mappings(void);
>>
>> ... here it is without.
>>
>>> +
>>>    #endif /* _ASM_RISCV_MM_H */
>>> diff --git a/xen/arch/riscv/include/asm/page.h
>>> b/xen/arch/riscv/include/asm/page.h
>>> index c831e16417..cbbf3656d1 100644
>>> --- a/xen/arch/riscv/include/asm/page.h
>>> +++ b/xen/arch/riscv/include/asm/page.h
>>> @@ -81,6 +81,13 @@ static inline void flush_page_to_ram(unsigned
>>> long mfn, bool sync_icache)
>>>        BUG_ON("unimplemented");
>>>    }
>>>    
>>> +/* Write a pagetable entry. */
>>> +static inline void write_pte(pte_t *p, pte_t pte)
>>> +{
>>> +    *p = pte;
>>> +    asm volatile ("sfence.vma");
>>> +}
>>> +
>>>    #endif /* __ASSEMBLY__ */
>>>    
>>>    #endif /* _ASM_RISCV_PAGE_H */
>>> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
>>> index 7d09e781bf..d69a174b5d 100644
>>> --- a/xen/arch/riscv/mm.c
>>> +++ b/xen/arch/riscv/mm.c
>>> @@ -49,6 +49,9 @@ stage1_pgtbl_root[PAGETABLE_ENTRIES];
>>>    pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>>>    stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT * PAGETABLE_ENTRIES];
>>>    
>>> +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>>> +xen_fixmap[PAGETABLE_ENTRIES];
>>
>> Can you add a BUILD_BUG_ON() to check that the number of entries in
>> the
>> fixmap will never be above PAGETABLE_ENTRIES?
> Sure. What is the best place? Somewhere in setup_fixmap_mappings()?

I think so.

Cheers,

-- 
Julien Grall

