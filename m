Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF33A741937
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 22:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556570.869197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEbMd-0005sm-HC; Wed, 28 Jun 2023 20:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556570.869197; Wed, 28 Jun 2023 20:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEbMd-0005r7-Dr; Wed, 28 Jun 2023 20:02:07 +0000
Received: by outflank-mailman (input) for mailman id 556570;
 Wed, 28 Jun 2023 20:02:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEbMb-0005r1-44
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 20:02:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEbMa-0004iX-LU; Wed, 28 Jun 2023 20:02:04 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.5.86])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEbMa-0006MN-Cv; Wed, 28 Jun 2023 20:02:04 +0000
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
	bh=z7kaW0DkKEMRASFh8v49K6iHDnepn4M2siDcYffrRP8=; b=YhV2+o6dFGTwZ7jY2EfAePnW6U
	o/bUXXUXtqqGoS1eGR74RHJR+SheTLDcXYfOuN5N2ZrZk0b7KAxo3wL8sjVXLmuEnhjpvY1JNynFm
	gW8Hv5qxJ2TIDGcxryJZIeLmCmE02Ausu24ZUODRT1ybcN9MIP11Aks81Gz4isvHgIF8=;
Message-ID: <158d8b0a-77dc-fccb-716d-36887524a4df@xen.org>
Date: Wed, 28 Jun 2023 21:02:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 5/9] xen/arm: Rework the code mapping Xen to avoid relying
 on the size of Xen
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Henry.Wang@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-6-julien@xen.org>
 <170a1f3c-526a-dfd9-0d87-101fb77f3415@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <170a1f3c-526a-dfd9-0d87-101fb77f3415@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/06/2023 12:43, Michal Orzel wrote:
> 
> 
> On 25/06/2023 22:49, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, the maximum size of Xen binary we can support is 2MB.
>> This is what we reserved in the virtual address but also what all
>> the code in Xen relies on as we only allocate one L3 page-table.
>>
>> When feature like UBSAN (will be enabled in a follow-up patch) and GCOV
>> are enabled, the binary will be way over 2MB.
>>
>> The code is now reworked so it doesn't realy on a specific size but
> s/realy/rely
> 
>> will instead look at the reversed size and compute the number of
>> page-table to allocate/map.
>>
>> While at it, replace any reference to 4KB mappings with a more
>> generic word because the page-size may change in the future.
>>
>> Also fix the typo s/tlb/tbl/ in code move in arm32/head.S
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/arch/arm/arm32/head.S         | 61 ++++++++++++++++++++++++-------
>>   xen/arch/arm/arm64/head.S         | 51 +++++++++++++++++++++-----
>>   xen/arch/arm/include/asm/config.h |  1 +
>>   xen/arch/arm/include/asm/lpae.h   |  8 ++--
>>   xen/arch/arm/mm.c                 | 24 +++++++-----
>>   5 files changed, 108 insertions(+), 37 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index 5e3692eb3abf..5448671de897 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -373,35 +373,55 @@ ENDPROC(cpu_init)
>>   .endm
>>
>>   /*
>> - * Macro to create a page table entry in \ptbl to \tbl
>> + * Macro to create a page table entry in \ptbl to \tbl (physical
>> + * address)
>>    *
>>    * ptbl:    table symbol where the entry will be created
>> - * tbl:     table symbol to point to
>> + * tbl:     physical address of the table to point to
>>    * virt:    virtual address
>>    * lvl:     page-table level
>>    *
>>    * Preserves \virt
>> - * Clobbers r1 - r4
>> + * Clobbers \tbl, r1 - r3
>>    *
>>    * Also use r10 for the phys offset.
> This no longer applies.

Good point. I will remove it.

> 
>>    *
>> - * Note that \virt should be in a register other than r1 - r4
>> + * Note that \tbl and \virt should be in a register other than r1 - r3
>>    */
>> -.macro create_table_entry, ptbl, tbl, virt, lvl
>> -        get_table_slot r1, \virt, \lvl  /* r1 := slot in \tlb */
>> -        lsl   r1, r1, #3                /* r1 := slot offset in \tlb */
>> -
>> -        load_paddr r4, \tbl
>> +.macro create_table_entry_from_paddr, ptbl, tbl, virt, lvl
>> +        get_table_slot r1, \virt, \lvl  /* r1 := slot in \tbl */
>> +        lsl   r1, r1, #3                /* r1 := slot offset in \tbl */
>>
>>           movw  r2, #PT_PT             /* r2:r3 := right for linear PT */
>> -        orr   r2, r2, r4             /*           + \tlb paddr */
>> +        orr   r2, r2, \tbl           /*           + \tbl paddr */
>>           mov   r3, #0
>>
>> -        adr_l r4, \ptbl
>> +        adr_l \tbl, \ptbl            /* \tbl := (v,p)addr of \ptbl */
>>
>> -        strd  r2, r3, [r4, r1]
>> +        strd  r2, r3, [\tbl, r1]
>>   .endm
>>
>> +
>> +/*
>> + * Macro to create a page table entry in \ptbl to \tbl (symbol)
>> + *
>> + * ptbl:    table symbol where the entry will be created
>> + * tbl:     table symbol to point to
>> + * virt:    virtual address
>> + * lvl:     page-table level
>> + *
>> + * Preserves \virt
>> + * Clobbers r1 - r4
>> + *
>> + * Also use r10 for the phys offset.
>> + *
>> + * Note that \virt should be in a register other than r1 - r4
>> + */
>> +.macro create_table_entry, ptbl, tbl, virt, lvl
>> +        load_paddr r4, \tbl
>> +        create_table_entry_from_paddr \ptbl, r4, \virt, \lvl
>> + .endm
>> +
>>   /*
>>    * Macro to create a mapping entry in \tbl to \paddr. Only mapping in 3rd
>>    * level table (i.e page granularity) is supported.
>> @@ -451,13 +471,26 @@ ENDPROC(cpu_init)
>>    * Output:
>>    *   r12: Was a temporary mapping created?
>>    *
>> - * Clobbers r0 - r4
>> + * Clobbers r0 - r5
>>    */
>>   create_page_tables:
>>           /* Prepare the page-tables for mapping Xen */
>>           mov_w r0, XEN_VIRT_START
>>           create_table_entry boot_pgtable, boot_second, r0, 1
>> -        create_table_entry boot_second, boot_third, r0, 2
>> +
>> +        /*
>> +         * We need to use a stash register because
>> +         * create_table_entry_paddr() will clobber the register storing
>> +         * the physical address of the table to point to.
>> +         */
>> +        load_paddr r5, boot_third
>> +        mov_w r4, XEN_VIRT_START
> Can you just reuse r0 that is already set to XEN_VIRT_START not to repeat this operation over and over again?
I decided against this approach for a few reasons:
  * I wanted the register to be ordered when 
create_table_entry_from_paddr is called.
  * There is a necessary largish comment on top of XEN_VIRT_START. So it 
makes more "difficult" to find the content of the registers.

I am actually a bit puzzled with your comment given you were recently 
the one that was pushing for adding extra ISB in the code (I still need 
to send a patch for that) to make the code clearer. ISBs are way more 
expensive than executing two instructions. So is this request just down 
to a matter of taste?

> 
>> +.rept XEN_NR_ENTRIES(2)
>> +        mov   r0, r5                        /* r0 := paddr(l3 table) */
>> +        create_table_entry_from_paddr boot_second, r0, r4, 2
>> +        add   r4, r4, #XEN_PT_LEVEL_SIZE(2) /* r4 := Next vaddr */
>> +        add   r5, r5, #PAGE_SIZE            /* r5 := Next table */
>> +.endr
>>
>>           /*
>>            * Find the size of Xen in pages and multiply by the size of a
>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
>> index 66bc85d4c39e..c9e2e36506d9 100644
>> --- a/xen/arch/arm/arm64/head.S
>> +++ b/xen/arch/arm/arm64/head.S
>> @@ -490,6 +490,31 @@ ENDPROC(cpu_init)
>>           ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
>>   .endm
>>
>> +/*
>> + * Macro to create a page table entry in \ptbl to \tbl
>> + * ptbl:    table symbol where the entry will be created
>> + * tbl:     physical address of the table to point to
>> + * virt:    virtual address
>> + * lvl:     page-table level
>> + * tmp1:    scratch register
>> + * tmp2:    scratch register
>> + *
>> + * Preserves \virt
>> + * Clobbers \tbl, \tmp1, \tmp2
>> + *
>> + * Note that all parameters using registers should be distinct.
>> + */
>> +.macro create_table_entry_from_paddr, ptbl, tbl, virt, lvl, tmp1, tmp2
>> +        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tlb */
> s/tlb/tbl

I will fix this one...

> 
>> +
>> +        mov   \tmp2, #PT_PT                 /* \tmp2 := right for linear PT */
>> +        orr   \tmp2, \tmp2, \tbl            /*          + \tlb */
> s/tlb/tbl

... this one and ...
> 
>> +
>> +        adr_l \tbl, \ptbl                   /* \tlb := address(\ptbl) */
> s/tlb/tbl

this one.

> 
>> +
>> +        str   \tmp2, [\tbl, \tmp1, lsl #3]
>> +.endm
>> +
>>   /*
>>    * Macro to create a page table entry in \ptbl to \tbl
>>    *
>> @@ -509,15 +534,8 @@ ENDPROC(cpu_init)
>>    * Note that all parameters using registers should be distinct.
>>    */
>>   .macro create_table_entry, ptbl, tbl, virt, lvl, tmp1, tmp2, tmp3
>> -        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tlb */
>> -
>> -        load_paddr \tmp2, \tbl
>> -        mov   \tmp3, #PT_PT                 /* \tmp3 := right for linear PT */
>> -        orr   \tmp3, \tmp3, \tmp2           /*          + \tlb paddr */
>> -
>> -        adr_l \tmp2, \ptbl
>> -
>> -        str   \tmp3, [\tmp2, \tmp1, lsl #3]
>> +        load_paddr \tmp1, \tbl
>> +        create_table_entry_from_paddr \ptbl, \tmp1, \virt, \lvl, \tmp2, \tmp3
>>   .endm
>>
>>   /*
>> @@ -570,7 +588,20 @@ create_page_tables:
>>           ldr   x0, =XEN_VIRT_START
>>           create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
>>           create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
>> -        create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
>> +
>> +        /*
>> +         * We need to use a stash register because
>> +         * create_table_entry_paddr() will clobber the register storing
>> +         * the physical address of the table to point to.
>> +         */
>> +        load_paddr x4, boot_third
>> +        ldr   x1, =XEN_VIRT_START
> Can you just reuse x0 that is already set to XEN_VIRT_START not to repeat this operation over and over again?

Same as above.

> 
>> +.rept XEN_NR_ENTRIES(2)
>> +        mov   x0, x4                            /* x0 := paddr(l3 table) */
>> +        create_table_entry_from_paddr boot_second, x0, x1, 2, x2, x3
>> +        add   x1, x1, #XEN_PT_LEVEL_SIZE(2)     /* x1 := Next vaddr */
>> +        add   x4, x4, #PAGE_SIZE                /* x4 := Next table */
>> +.endr
>>
>>           /*
>>            * Find the size of Xen in pages and multiply by the size of a
>> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
>> index c969e6da589d..6d246ab23c48 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -125,6 +125,7 @@
>>   #endif
>>
>>   #define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
>> +#define XEN_NR_ENTRIES(lvl)     (XEN_VIRT_SIZE / XEN_PT_LEVEL_SIZE(lvl))
>>
>>   #define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
>>   #define FIXMAP_VIRT_SIZE        _AT(vaddr_t, MB(2))
>> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
>> index 7d2f6fd1bd5a..93e824f01125 100644
>> --- a/xen/arch/arm/include/asm/lpae.h
>> +++ b/xen/arch/arm/include/asm/lpae.h
>> @@ -267,15 +267,17 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
>>
>>   /*
>>    * Macros to define page-tables:
>> - *  - DEFINE_BOOT_PAGE_TABLE is used to define page-table that are used
>> + *  - DEFINE_BOOT_PAGE_TABLE{,S} are used to define page-table that are used
> s/page-table/page-table(s)/ or maybe using the same comment as for runtime pgt macro

I will re-use the same wording as DEFINE_PAGE_TABLE{,S}.

>> -    /* Break up the Xen mapping into 4k pages and protect them separately. */
>> -    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
>> +    /* Break up the Xen mapping into pages and protect them separately. */
>> +    for ( i = 0; i < XEN_NR_ENTRIES(3); i++ )
>>       {
>>           vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
>>
>>           if ( !is_kernel(va) )
>>               break;
>>           pte = pte_of_xenaddr(va);
>> -        pte.pt.table = 1; /* 4k mappings always have this bit set */
>> +        pte.pt.table = 1; /* third level mappings always have this bit set */
>>           if ( is_kernel_text(va) || is_kernel_inittext(va) )
>>           {
>>               pte.pt.xn = 0;
>> @@ -539,10 +539,14 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>>
>>       /* Initialise xen second level entries ... */
>>       /* ... Xen's text etc */
>> +    for ( i = 0; i < XEN_NR_ENTRIES(2); i++ )
>> +    {
>> +        vaddr_t va = XEN_VIRT_START + i * XEN_PT_LEVEL_SIZE(2);
> For consistency with the upper loop, maybe (i << XEN_PT_LEVEL_SHIFT(2)) ?
> 
> These are all just minor comments, so: > Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

Cheers,

-- 
Julien Grall

