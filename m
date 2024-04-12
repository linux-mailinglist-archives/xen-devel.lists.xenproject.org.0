Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB338A2445
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 05:20:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704306.1100636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv7SH-0003sO-4N; Fri, 12 Apr 2024 03:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704306.1100636; Fri, 12 Apr 2024 03:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv7SH-0003qg-1n; Fri, 12 Apr 2024 03:19:57 +0000
Received: by outflank-mailman (input) for mailman id 704306;
 Fri, 12 Apr 2024 03:19:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvpr=LR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rv7SF-0003qa-Gy
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 03:19:55 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86d9b037-f87b-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 05:19:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8BE0B8284D62;
 Thu, 11 Apr 2024 22:19:51 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id qEBAD_gWDevB; Thu, 11 Apr 2024 22:19:50 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0942A828530B;
 Thu, 11 Apr 2024 22:19:50 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CKCBiRhpl2Pk; Thu, 11 Apr 2024 22:19:49 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 9EE928284D62;
 Thu, 11 Apr 2024 22:19:49 -0500 (CDT)
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
X-Inumbo-ID: 86d9b037-f87b-11ee-94a3-07e782e9044d
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0942A828530B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1712891990; bh=GYu38ISAGP6e2ln2YRbcplCflcCBKOpv3oDwhCpf2W0=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=o8EZHHMTs3GAEkf3wKAdJfWcwcREm7Bdt3ppbfYDRzWLAdyx3HNeqTPh7FNW3DTlX
	 Ni4N/rVg6jgmiaGj8fc6MK8O4JlZB2mKhJ7nSXDv8VccymLyb5+VUESxYUkOVuwikn
	 wQtmwV3G7kHGSc+aCov/6ejGpxK7DECl6HPvHVMU=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <dec634ec-b028-42c9-a8b1-64e32c86dfbb@raptorengineering.com>
Date: Thu, 11 Apr 2024 22:19:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] xen/ppc: mm-radix: Allocate all paging structures
 at runtime
To: Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <00f22a6a08451614179219fd430539fbb1e6e8cf.1710443965.git.sanastasio@raptorengineering.com>
 <beab0b2a-b8ff-475c-885f-dec8518b9a8f@suse.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <beab0b2a-b8ff-475c-885f-dec8518b9a8f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 3/25/24 10:39 AM, Jan Beulich wrote:
> On 14.03.2024 23:15, Shawn Anastasio wrote:
>> --- a/xen/arch/ppc/mm-radix.c
>> +++ b/xen/arch/ppc/mm-radix.c
>> @@ -21,69 +21,101 @@ void enable_mmu(void);
>>  #define radix_dprintk(...)
>>  #endif
>>
>> -#define INITIAL_LVL1_PD_COUNT      1
>> -#define INITIAL_LVL2_LVL3_PD_COUNT 2
>> -#define INITIAL_LVL4_PT_COUNT      256
>> -
>> -static size_t __initdata initial_lvl1_pd_pool_used;
>> -static struct lvl1_pd initial_lvl1_pd_pool[INITIAL_LVL1_PD_COUNT];
>> -
>> -static size_t __initdata initial_lvl2_lvl3_pd_pool_used;
>> -static struct lvl2_pd initial_lvl2_lvl3_pd_pool[INITIAL_LVL2_LVL3_PD_COUNT];
>> -
>> -static size_t __initdata initial_lvl4_pt_pool_used;
>> -static struct lvl4_pt initial_lvl4_pt_pool[INITIAL_LVL4_PT_COUNT];
>> -
>> -/* Only reserve minimum Partition and Process tables  */
>>  #define PATB_SIZE_LOG2 16 /* Only supported partition table size on POWER9 */
>>  #define PATB_SIZE      (1UL << PATB_SIZE_LOG2)
>> -#define PRTB_SIZE_LOG2 12
>> +#define PRTB_SIZE_LOG2 24 /* Maximum process table size on POWER9 */
>>  #define PRTB_SIZE      (1UL << PRTB_SIZE_LOG2)
>>
>> -static struct patb_entry
>> -    __aligned(PATB_SIZE) initial_patb[PATB_SIZE / sizeof(struct patb_entry)];
>> +static struct patb_entry *initial_patb;
>> +static struct prtb_entry *initial_prtb;
>>
>> -static struct prtb_entry
>> -    __aligned(PRTB_SIZE) initial_prtb[PRTB_SIZE / sizeof(struct prtb_entry)];
>> +static mfn_t __initdata min_alloc_mfn = {-1};
>> +static mfn_t __initdata max_alloc_mfn = {0};
>>
>> -static __init struct lvl1_pd *lvl1_pd_pool_alloc(void)
>> +/*
>> + * A thin wrapper for alloc_boot_pages that keeps track of the maximum and
>> + * minimum mfns that have been allocated. This information is used by
>> + * setup_initial_mapping to include the allocated pages in the initial
>> + * page mapping.
>> + */
>> +static mfn_t __init initial_page_alloc(unsigned long nr_pfns,
>> +                                       unsigned long pfn_align)
>>  {
>> -    if ( initial_lvl1_pd_pool_used >= INITIAL_LVL1_PD_COUNT )
>> -    {
>> -        early_printk("Ran out of space for LVL1 PD!\n");
>> -        die();
>> -    }
>> +    mfn_t mfn_first, mfn_last;
>>
>> -    return &initial_lvl1_pd_pool[initial_lvl1_pd_pool_used++];
>> -}
>> +    mfn_first = alloc_boot_pages(nr_pfns, pfn_align);
>> +    mfn_last = _mfn(mfn_x(mfn_first) + nr_pfns - 1);
> 
> Please can you use mfn_add() here?
> 

Good catch, will do.

>> -static __init struct lvl2_pd *lvl2_pd_pool_alloc(void)
>> -{
>> -    if ( initial_lvl2_lvl3_pd_pool_used >= INITIAL_LVL2_LVL3_PD_COUNT )
>> -    {
>> -        early_printk("Ran out of space for LVL2/3 PD!\n");
>> -        die();
>> -    }
>> +    min_alloc_mfn = _mfn(min(mfn_x(min_alloc_mfn), mfn_x(mfn_first)));
>> +    max_alloc_mfn = _mfn(max(mfn_x(max_alloc_mfn), mfn_x(mfn_last)));
> 
> Together with the comment ahead of the function - is there some kind of
> assumption here that this range won't span almost all of system memory?
> E.g. expecting allocations to be almost contiguous? If so, I wonder how
> reliable this is, and whether using a rangeset wouldn't be better here.
> 

You're right that this is only sane (i.e. not mapping almost all of
system memory) when the assumption that alloc_boot_pages returns
mostly-contiguous regions holds. I'm not super happy with this either,
but I struggled to come up with a better solution that doesn't involve
re-inventing a rangeset-like data structure.

Looking into your suggestion of using xen/common's rangeset, it looks
like that won't work since it relies on xmalloc which is not yet set up.
I suspect there is a chicken-and-egg problem here that would preclude
xmalloc from sanely working this early on in the boot, but I might be
wrong about that.

I could reinvent a basic statically-allocated rangeset data structure
for this purpose if you think that's the best path forward.

>> @@ -105,81 +138,47 @@ static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
>>          die();
>>      }
>>
>> +    /* Identity map Xen itself */
>>      for ( page_addr = map_start; page_addr < map_end; page_addr += PAGE_SIZE )
>>      {
>> -        struct lvl2_pd *lvl2;
>> -        struct lvl3_pd *lvl3;
>> -        struct lvl4_pt *lvl4;
>> -        pde_t *pde;
>> -        pte_t *pte;
>> -
>> -        /* Allocate LVL 2 PD if necessary */
>> -        pde = pt_entry(lvl1, page_addr);
>> -        if ( !pde_is_valid(*pde) )
>> -        {
>> -            lvl2 = lvl2_pd_pool_alloc();
>> -            *pde = paddr_to_pde(__pa(lvl2), PDE_VALID,
>> -                                XEN_PT_ENTRIES_LOG2_LVL_2);
>> -        }
>> -        else
>> -            lvl2 = __va(pde_to_paddr(*pde));
>> +        unsigned long flags;
>>
>> -        /* Allocate LVL 3 PD if necessary */
>> -        pde = pt_entry(lvl2, page_addr);
>> -        if ( !pde_is_valid(*pde) )
>> +        if ( is_kernel_text(page_addr) || is_kernel_inittext(page_addr) )
>>          {
>> -            lvl3 = lvl3_pd_pool_alloc();
>> -            *pde = paddr_to_pde(__pa(lvl3), PDE_VALID,
>> -                                XEN_PT_ENTRIES_LOG2_LVL_3);
>> +            radix_dprintk("%016lx being marked as TEXT (RX)\n", page_addr);
>> +            flags = PTE_XEN_RX;
>>          }
>> -        else
>> -            lvl3 = __va(pde_to_paddr(*pde));
>> -
>> -        /* Allocate LVL 4 PT if necessary */
>> -        pde = pt_entry(lvl3, page_addr);
>> -        if ( !pde_is_valid(*pde) )
>> +        else if ( is_kernel_rodata(page_addr) )
>>          {
>> -            lvl4 = lvl4_pt_pool_alloc();
>> -            *pde = paddr_to_pde(__pa(lvl4), PDE_VALID,
>> -                                XEN_PT_ENTRIES_LOG2_LVL_4);
>> +            radix_dprintk("%016lx being marked as RODATA (RO)\n", page_addr);
>> +            flags = PTE_XEN_RO;
>>          }
>>          else
>> -            lvl4 = __va(pde_to_paddr(*pde));
>> -
>> -        /* Finally, create PTE in LVL 4 PT */
>> -        pte = pt_entry(lvl4, page_addr);
>> -        if ( !pte_is_valid(*pte) )
>>          {
>> -            unsigned long paddr = (page_addr - map_start) + phys_base;
>> -            unsigned long flags;
>> -
>> -            radix_dprintk("%016lx being mapped to %016lx\n", paddr, page_addr);
>> -            if ( is_kernel_text(page_addr) || is_kernel_inittext(page_addr) )
>> -            {
>> -                radix_dprintk("%016lx being marked as TEXT (RX)\n", page_addr);
>> -                flags = PTE_XEN_RX;
>> -            }
>> -            else if ( is_kernel_rodata(page_addr) )
>> -            {
>> -                radix_dprintk("%016lx being marked as RODATA (RO)\n", page_addr);
>> -                flags = PTE_XEN_RO;
>> -            }
>> -            else
>> -            {
>> -                radix_dprintk("%016lx being marked as DEFAULT (RW)\n", page_addr);
>> -                flags = PTE_XEN_RW;
>> -            }
>> -
>> -            *pte = paddr_to_pte(paddr, flags);
>> -            radix_dprintk("%016lx is the result of PTE map\n",
>> -                paddr_to_pte(paddr, flags).pte);
>> -        }
>> -        else
>> -        {
>> -            early_printk("BUG: Tried to create PTE for already-mapped page!");
>> -            die();
>> +            radix_dprintk("%016lx being marked as DEFAULT (RW)\n", page_addr);
>> +            flags = PTE_XEN_RW;
>>          }
>> +
>> +        map_page_initial(lvl1, page_addr, (page_addr - map_start) + phys_base, flags);
>> +    }
>> +
>> +    previous_max_alloc_mfn = max_alloc_mfn;
>> +
>> +    /*
>> +     * Identity map all pages we've allocated for paging structures. This act
>> +     * itself will allocate more pages, so continue until we've mapped from
>> +     * `max_alloc_mfn` down to `min_alloc_mfn`. This assumes that the heap grows
>> +     * downwards, which matches the behavior of alloc_boot_pages.
>> +     */
>> +    for ( page_addr = (vaddr_t)__va(mfn_to_maddr(max_alloc_mfn));
>> +          mfn_to_maddr(min_alloc_mfn) <= __pa(page_addr);
>> +          page_addr -= PAGE_SIZE)
>> +    {
>> +        map_page_initial(lvl1, page_addr, __pa(page_addr), PTE_XEN_RW);
>>      }
>> +
>> +    if ( mfn_x(previous_max_alloc_mfn) != mfn_x(max_alloc_mfn) )
>> +        panic("Early page heap unexpectedly grew upwards\n");
>>  }
> 
> Oh, yet another assumption on allocator behavior.

Agreed, it's not ideal, but the assumption is explicitly checked and
the worst case is a panic/failure to boot if it is ever explicitly
broken.

Also related to your previous comment, if we go forward with a
rangeset/rangeset-like data structure this assumption could be
eliminated.

> 
> Jan

Thanks,
Shawn

