Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBB66C675D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 12:58:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513817.795404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJa0-0000am-Aa; Thu, 23 Mar 2023 11:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513817.795404; Thu, 23 Mar 2023 11:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJa0-0000YE-7c; Thu, 23 Mar 2023 11:58:04 +0000
Received: by outflank-mailman (input) for mailman id 513817;
 Thu, 23 Mar 2023 11:58:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pfJZz-0000Y6-F7
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 11:58:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pfJZy-0006KX-0Q; Thu, 23 Mar 2023 11:58:02 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.18.79]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pfJZx-0006co-L2; Thu, 23 Mar 2023 11:58:01 +0000
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
	bh=BmrDscVcCoL5bBK3V/1a3l04QW0IO6bblcDuxIbXh4g=; b=lJQuwU5trO55h34D4xaXU6Ty7J
	9S7qkLdR6QlMVscPApTBBwCsA3CVJJ5K5EQ8iTOl4SPBsfeR4jW7K9eHNfXHX3wCgygZwvhYcBwM6
	lppmsDEB3p/I216gCe2fqg526xFkGPmkGUf3o4m5REmWo1VnO781kdWedyKjtwFqsbkw=;
Message-ID: <98194c59-6bd8-7b98-c94d-df0f4faf0c04@xen.org>
Date: Thu, 23 Mar 2023 11:57:59 +0000
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
 <60444252-80b6-230e-9090-2c96d5d6187d@xen.org>
 <c9f4b34c4aef31906e715c7ddce8e077e5eef52c.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c9f4b34c4aef31906e715c7ddce8e077e5eef52c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/03/2023 11:18, Oleksii wrote:
> Hi Julien,

Hi Oleksii,

> On Wed, 2023-03-22 at 14:21 +0000, Julien Grall wrote:
> ...
>>
>>>>> +    unsigned long page_addr;
>>>>> +
>>>>> +    // /* align start addresses */
>>>>> +    // map_start &= XEN_PT_LEVEL_MAP_MASK(0);
>>>>> +    // pa_start &= XEN_PT_LEVEL_MAP_MASK(0);
>>>>
>>>> They should be switched to ASSERT() or BUG_ON().
>>> Sure. Thanks. I'll update.
>>>>
>>>>> +
>>>>> +    page_addr = map_start;
>>>>> +    while ( page_addr < map_end )
>>>>
>>>> This loop is continue to assume that only the mapping can first
>>>> in
>>>> 2MB
>>>> section (or less if the start is not 2MB aligned).
>>>>
>>>> I am OK if you want to assume it, but I think this should be
>>>> documented
>>>> (with words and ASSERT()/BUG_ON()) to avoid any mistake.
>>> I add a check in setup_initial_pagetables:
>>>        BUG_ON(load_addr_start % (PAGE_ENTRIES * PAGE_SIZE) != 0);
>>> Probably this is not a correct place and should be moved to
>>> setup_initial_mapping() instead of setup_initial_pagetables()
>>
>> Yes it should be moved in setup_initial_mapping().
> Then I'll moved it to setup_initial_mapping()
>>
>>>>
>>>>> +    {
>>>>> +        unsigned long index2 = pt_index(2, page_addr);
>>>>> +        unsigned long index1 = pt_index(1, page_addr);
>>>>> +        unsigned long index0 = pt_index(0, page_addr);
>>>>> +
>>>>> +        /* Setup level2 table */
>>>>> +        second[index2] = paddr_to_pte((unsigned long)first);
>>>>> +        second[index2].pte |= PTE_TABLE;
>>>>> +
>>>>> +        /* Setup level1 table */
>>>>> +        first[index1] = paddr_to_pte((unsigned long)zeroeth);
>>>>> +        first[index1].pte |= PTE_TABLE;
>>>>> +
>>>>> +
>>>>
>>>> NIT: Spurious line?
>>> Yeah, should be removed. Thanks.
>>>>
>>>>> +        /* Setup level0 table */
>>>>> +        if ( !pte_is_valid(&zeroeth[index0]) )
>>>>
>>>> On the previous version, you said it should be checked for each
>>>> level.
>>> I had a terrible internet connection, and my message wasn't sent.
>>
>> No worries.
>>
>>>
>>> I decided not to check that l2 and l1 are used only for referring
>>> to
>>> the next page table but not leaf PTE. So it is safe to overwrite it
>>> each time (the addresses of page tables are the same all the time)
>>
>> You are letting the caller to decide which page-table to use for each
>> level. So you are at the mercy that caller will do the right thing.
>>
>> IHMO, this is a pretty bad idea because debugging page-tables error
>> are
>> difficult. So it is better to have safety in place. This is not
>> worth...
>>
>>    and
>>> probably it will be better from optimization point of view to
>>> ignore if
>>> clauses.
>>
>> ... the optimization in particular when this is at boot time.
> I didn't think about that caller will do always the right thing so
> I will add the check.
>>
>>>
>>> And it is needed in case of L0 because it is possible that some
>>> addressed were marked with specific flag ( execution, read, write )
>>> and
>>> so not to overwrite the flags set before the check is needed.
>> In which case you should really report an error because the caller
>> may
>> have decide to set execution flag and you don't honor. So when the
>> code
>> is executed, you will receive a fault and this may be hard to find
>> out
>> what happen.
> 
> Right now, it is expected situation that the caller will try to change
> execution flag during the setup of initial page tables. >
> It is possible in the currently implemented logic of the setup of
> initial page tables.

This sounds like a bug in your caller implementation. You should not try 
to workaround this in your code updating the page-tables.

> Let me explain what I mean.
> 
> The first step of setup_initial_pagetables() is to map .text, .init,
> .rodata with necessary flags RX, RX, R.
> Remaining sections will have RW flags, and to map them,
> setup_initial_mapping() is called for the whole range of [linker_start,
> linker_end] not to map them one by one thereby during this step
> setup_initial_mapping() will try to remap addresses ranges which
> overlap with .text, .init, .rodata with RW flags but it should leave
> with the previously set flags.
Why do you need to call setup_init_mapping() with the whole range? In 
fact the only reason I can think this is useful is when you when to 
create a 1:1 mapping when the linker and load address is different. But...

>>>>> +
>>>>> +    /* Get the addresses where the page tables were loaded */
>>>>> +    second  = (pte_t *)(&xen_second_pagetable);
>>>>> +    first   = (pte_t *)(&xen_first_pagetable);
>>>>> +    zeroeth = (pte_t *)(&xen_zeroeth_pagetable);
>>>>> +
>>>>> +    setup_initial_mapping(second, first, zeroeth,
>>>>> +                          LOAD_TO_LINK((unsigned
>>>>> long)&_stext),
>>>>> +                          LOAD_TO_LINK((unsigned
>>>>> long)&_etext),
>>>>> +                          (unsigned long)&_stext,
>>>>> +                          PTE_LEAF_DEFAULT);
>>>>> +
>>>>> +    setup_initial_mapping(second, first, zeroeth,
>>>>> +                          LOAD_TO_LINK((unsigned
>>>>> long)&__init_begin),
>>>>> +                          LOAD_TO_LINK((unsigned
>>>>> long)&__init_end),
>>>>> +                          (unsigned long)&__init_begin,
>>>>> +                          PTE_LEAF_DEFAULT | PTE_WRITABLE);
>>>>> +
>>>>> +    setup_initial_mapping(second, first, zeroeth,
>>>>> +                          LOAD_TO_LINK((unsigned
>>>>> long)&_srodata),
>>>>> +                          LOAD_TO_LINK((unsigned
>>>>> long)&_erodata),
>>>>> +                          (unsigned long)(&_srodata),
>>>>> +                          PTE_VALID | PTE_READABLE);
>>>>> +
>>>>> +    setup_initial_mapping(second, first, zeroeth,
>>>>> +                          linker_addr_start,
>>>>> +                          linker_addr_end,
>>>>> +                          load_addr_start,
>>>>> +                          PTE_LEAF_DEFAULT | PTE_READABLE);
>>
>> ... this is not cover above. AFAIU, this is the one for the 1:1
>> mapping.
> But there is no 1:1 mapping.
> I thought that 1:1 mapping is when the physical address is equal to
> 0x10020 then after MMU is enabled the virtual address will be the same
> 0x10020 and mapped to 0x10020.
> 
> Probably I missed something but this code maps all linker addresses
> to correspondent load addresses and it will be 1:1 only in case when
> load address is equal to linker address.

... here you say this is not the purpose.

Also, if you don't intend to deal with load != link address yet, then 
the following BUG_ON() needs to be updated:

+    if (load_addr_start != linker_addr_start)
+        BUG_ON((linker_addr_end > load_addr_start && load_addr_end > 
linker_addr_start));

>>
>>>>
>>>> As I said in v1, you need to use a different set of page-table
>>>> here.
>>> If I understand you correctly I have to use a different set of
>>> page-
>>> table in case when it is possible that size of Xen will be larger
>>> then
>>> PAGE_SIZE. So I added to xen.lds.S a check to be sure that the size
>>> fits into PAGE_SIZE.
>>
>> This is not what I was referring to. I was pointing out that second,
>> first, zeroeth are exactly the same for all the callers. You want to
>> introduce a second set of zeroeth table. You will want to do the same
>> for first but it is not always used.
>>
>> Otherwise, this is not going to work if Xen is loaded at a different
>> address than the runtime.
> Ok.
> 
> I understand what do you mean in general but still I am not sure that I
> understand a particular case when I am sure that the size of Xen is no
> bigger then 2MB and load address is aligned on 2Mb boundary.
> 
> The size of one l0 page table is 512 (1 << 9 ) entries which covers 4K
> (1 << 12) * 512 = 2 Mb of memory so it should be fine.
> All the callers in my case are trying to map addresses from
> [linker_start, linker_end] which is not bigger then 2 MB and is aligned
> on 2 MB boundary.

I interpreted that your last call was meant to be for the 1:1 mapping 
when load != link address. It looks like I was wrong, so the same 
page-table should be OK.

> 
>>
>> That said, when I spoke with Andrew yesterday, he mentioned that your
>> initial goal is to support the case where Xen is loaded at the
>> runtime
>> address. I understand this simplifies a lot the code and I told him I
>> was OK with that. However, it would be good to document what are your
>> goals in each series (this is not always clear what you skip on
>> purpose).
>>
>>>
>>>> Also, where do you guarantee that Xen will be loaded at a 2MB
>>>> aligned
>>>> address? (For a fact I know that UEFI is only guarantee 4KB
>>>> alignment).
>>> There is a check in setup_initial_pagetables:
>>>        BUG_ON(load_addr_start % (PAGE_ENTRIES * PAGE_SIZE) != 0);
>>
>> This is not very obvious the check is to confirm that Xen is probably
>> aligned. I would suggest to add a comment.
>>
>> Also, you might want to use XEN_PT_LEVEL_SIZE(..) to make it more
>> obvious what sort of alignment you are trying to enforce.
> I will update add the comment and use XEN_PT_LEVEL_SIZE(...) instead.
>>
>>>>> +        la      sp, cpu0_boot_stack
>>>>> +        li      t0, STACK_SIZE
>>>>> +        add     sp, sp, t0
>>>>> +
>>>>> +        /*
>>>>> +         * Re-init an address of exception handler as it was
>>>>> overwritten  with
>>>>> +         * the address of the .L_mmu_is_enabled label.
>>>>> +         * Before jump to trap_init save return address of
>>>>> enable_mmu() to
>>>>> +         * know where we should back after enable_mmu() will
>>>>> be
>>>>> finished.
>>>>> +         */
>>>>> +        mv      s0, ra
>>>>> +        lla     t0, trap_init
>>>>> +        jalr    ra, t0
>>>>> +
>>>>> +        /*
>>>>> +         * Re-calculate the return address of enable_mmu()
>>>>> function for case
>>>>> +         * when linker start address isn't equal to load start
>>>>> address
>>>>> +         */
>>>>> +        add     s0, s0, t1
>>>>> +        mv      ra, s0
>>>>> +
>>>>> +        ret
>>>>
>>>> Missing ENDPROC?
>>> I haven't seen the usage of ENDPROC for RISC-V so it looks like it
>>> is
>>> not necessary.
>>
>> Ok. Would the objdump be able to report the function properly then? I
>> know that on Arm, it was necessary report assembly function properly.
> It is fine for RISC-V:
> 
> Disassembly of section .text:
> 
> 0000000000200000 <_start>:
>    200000:       10401073                csrw    sie,zero
>    200004:       6299                    lui     t0,0x6
> ...
>    20003c:       00000013                nop
> 
> 0000000000200040 <enable_mmu>:
>    200040:       0003a297                auipc   t0,0x3a
> ...
>    20009e:       941a                    add     s0,s0,t1
>    2000a0:       80a2                    mv      ra,s0
>    2000a2:       8082                    ret
>          ...
> 
> 00000000002000b0 <__bitmap_empty>:
>    2000b0:       1141                    addi    sp,sp,-16
>    2000b2:       e422                    sd      s0,8(sp)
>    2000b4:       0800                    addi    s0,sp,16
> ...

Perfect thanks!

Cheers,

-- 
Julien Grall

