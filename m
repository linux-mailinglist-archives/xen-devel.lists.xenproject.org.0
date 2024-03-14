Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4057887C2AB
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 19:30:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693435.1081506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkppl-0003fQ-6n; Thu, 14 Mar 2024 18:29:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693435.1081506; Thu, 14 Mar 2024 18:29:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkppl-0003cG-4I; Thu, 14 Mar 2024 18:29:41 +0000
Received: by outflank-mailman (input) for mailman id 693435;
 Thu, 14 Mar 2024 18:29:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y43E=KU=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rkppk-0003cA-4I
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 18:29:40 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cec5240e-e230-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 19:29:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 899908285394;
 Thu, 14 Mar 2024 13:29:34 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 3G_ib1pnrOqR; Thu, 14 Mar 2024 13:29:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 623108285461;
 Thu, 14 Mar 2024 13:29:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ThLNig8R0o33; Thu, 14 Mar 2024 13:29:33 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 9AC758285394;
 Thu, 14 Mar 2024 13:29:32 -0500 (CDT)
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
X-Inumbo-ID: cec5240e-e230-11ee-a1ee-f123f15fe8a2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 623108285461
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710440973; bh=WJm5lBRkhO+k/HUqpQUQBRC3VGg2b99MohoQAWlMCYI=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=qyXZjaqH4tLtAUd20bBv8L0E5ork2O7MX6UVFqGIdoUxAOxhzWuYtUlXPhZIPBtBQ
	 yZPuVuH7c3gua50HVyx4toisH33HekyEIfUQb204oLUj6zmND8oGTg0iha9IzBJ3JP
	 1FEbCEln4Eo8lSvmGw6mYUfLyKHR8FdpMLOV5bNw=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <9bad9729-1d77-4a7d-9c9f-33bd8f50fb0d@raptorengineering.com>
Date: Thu, 14 Mar 2024 13:29:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] xen/ppc: mm-radix: Allocate Partition and Process
 Tables at runtime
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <f49a4a372a9f82e217fa56ba0dc3068deff32ef5.1702607884.git.sanastasio@raptorengineering.com>
 <6ba01b31-fc51-4d12-83a2-4754ccfb6339@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <6ba01b31-fc51-4d12-83a2-4754ccfb6339@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

I'm revisiting this series in preparation for a v3 and had some
follow-up comments.

On 12/21/23 1:06 AM, Jan Beulich wrote:
> On 15.12.2023 03:44, Shawn Anastasio wrote:
>> In the initial mm-radix implementation, the in-memory partition and
>> process tables required to configure the MMU were allocated statically
>> since the boot allocator was not yet available.
>>
>> Now that it is, allocate these tables at runtime and bump the size of
>> the Process Table to its maximum supported value (on POWER9). Also bump
>> the number of static LVL2/3 PD frames to tolerate cases where the boot
>> allocator returns an address outside of the range of the LVL2 frame used
>> for Xen.
> 
> Don't you need to bump to 4, in case PATB and PRTB end up sufficiently
> far apart? Or even further, considering that you may need distinct L2
> and L3 for each of Xen, PATB, and PRTB?
>

In practice this won't happen since the boot allocator will start from
the top of free address space and move downwards, while the PowerNV
firmware allocates all of its memory towards the bottom of the physical
address space. I see your point though, and will likely end up scrapping
the static page table allocation entirely (see below).

> However, with there being memory to allocate now, is there a reason you
> still reserve (perhaps more than necessary) static memory for the
> page tables, rather than allocating those dynamically as well?
>

Initially I had avoided doing this to simplify the identity mapping of
the paging structures themselves, since dynamically allocating them
would (obviously) mean that their location wouldn't be known ahead of
time and that would complicate the process of mapping them.

On second thought though, this can be trivially solved by keeping track
of the maximum and minimum addresses returned by all calls to
alloc_boot_pages() in this early paging code and then simply identity
mapping that entire region, and I think that this is worth doing to
avoid these wasteful static allocations.

>> @@ -105,80 +157,43 @@ static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
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
>> -        {
>> -            lvl4 = lvl4_pt_pool_alloc();
>> -            *pde = paddr_to_pde(__pa(lvl4), PDE_VALID,
>> -                                XEN_PT_ENTRIES_LOG2_LVL_4);
>> -        }
>> -        else
>> -            lvl4 = __va(pde_to_paddr(*pde));
>> -
>> -        /* Finally, create PTE in LVL 4 PT */
>> -        pte = pt_entry(lvl4, page_addr);
>> -        if ( !pte_is_valid(*pte) )
>> +        else if ( is_kernel_rodata(page_addr) )
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
>> +            radix_dprintk("%016lx being marked as RODATA (RO)\n", page_addr);
>> +            flags = PTE_XEN_RO;
>>          }
>>          else
>>          {
>> -            early_printk("BUG: Tried to create PTE for already-mapped page!");
>> -            die();
>> +            radix_dprintk("%016lx being marked as DEFAULT (RW)\n", page_addr);
>> +            flags = PTE_XEN_RW;
>>          }
>> +
>> +        map_page_initial(lvl1, page_addr, (page_addr - map_start) + phys_base, flags);
>> +    }
>> +
>> +    /* Map runtime-allocated PATB, PRTB */
>> +    for ( page_addr = (uint64_t)initial_patb;
>> +          page_addr < (uint64_t)initial_patb + PATB_SIZE;
> 
> While technically not an issue, casting pointers to fixed width types is
> generally bogus. page_addr itself would likely better also be of a
> different type (unsigned long, uintptr_t, or vaddr_t; the latter only if
> that's meant to represent hypervisor virtual addresses, not guest ones).
>

Noted. I'll go with one of the other types you suggested.

>> +          page_addr += PAGE_SIZE )
>> +    {
>> +        map_page_initial(lvl1, page_addr, __pa(page_addr), PTE_XEN_RW);
>> +    }
>> +
>> +    for ( page_addr = (uint64_t)initial_prtb;
>> +          page_addr < (uint64_t)initial_prtb + PRTB_SIZE;
>> +          page_addr += PAGE_SIZE )
>> +    {
>> +        map_page_initial(lvl1, page_addr, __pa(page_addr), PTE_XEN_RW);
>>      }
> 
> Just as a remark (you're the maintainer) - in cases like these we generally
> prefer to omit the braces.
> 

Noted. In this case I feel pretty strongly that the braces aid
readability so I'm inclined to keep them.

>> @@ -210,6 +225,16 @@ void __init setup_initial_pagetables(void)
>>  {
>>      struct lvl1_pd *root = lvl1_pd_pool_alloc();
>>      unsigned long lpcr;
>> +    mfn_t patb_mfn, prtb_mfn;
>> +
>> +    /* Allocate mfns for in-memory tables using the boot allocator */
>> +    prtb_mfn = alloc_boot_pages(PRTB_SIZE / PAGE_SIZE,
>> +                                max(1, PRTB_SIZE_LOG2 - PAGE_SHIFT));
>> +    patb_mfn = alloc_boot_pages(PATB_SIZE / PAGE_SIZE,
>> +                                max(1, PATB_SIZE_LOG2 - PAGE_SHIFT));
>> +
>> +    initial_patb = __va(mfn_to_maddr(patb_mfn));
>> +    initial_prtb = __va(mfn_to_maddr(prtb_mfn));
> 
> Overall, what's the plan wrt directmap: Are you meaning to not have one
> covering all memory? If you do, I wonder if you wouldn't be better off
> mapping memory as you pass it to the boot allocator, such that you
> won't need to map things piecemeal like you're doing here.
>

This isn't a design decision that I've made yet, but I'm inclined to
think that having a directmap would be a reasonable decision. Mapping
memory as it is passed to the boot allocator seems reasonable in
theory, but unless I'm missing something, doing so would create a
chicken-and-egg problem since the act of mapping pages requires
allocating page frames for the paging structures, and per your prior
suggestion I'm planning to do that using the boot allocator itself.

This is probably something I'd want to revisit once the PPC mm code is
more fleshed out.

> Jan

Thanks,
Shawn

