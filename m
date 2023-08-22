Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87487783BFA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 10:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588250.919749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYMy9-0001bj-E4; Tue, 22 Aug 2023 08:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588250.919749; Tue, 22 Aug 2023 08:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYMy9-0001Yp-A8; Tue, 22 Aug 2023 08:42:33 +0000
Received: by outflank-mailman (input) for mailman id 588250;
 Tue, 22 Aug 2023 08:42:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYMy7-0001Yh-QI
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 08:42:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYMy6-0005cw-V7; Tue, 22 Aug 2023 08:42:30 +0000
Received: from [54.239.6.178] (helo=[192.168.0.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYMy6-00033T-Mo; Tue, 22 Aug 2023 08:42:30 +0000
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
	bh=w19jLVhwOIag+OSo/0CqM6UbVXoJ9yoKdhb8WFtwHys=; b=1jz5tooOZj0JUL6mMK1/pSF16i
	gwh2su97Qu40tbo1sv95mVMUf93ZWMWAuY4uO3otZjIcYNAK0NUWnsDkXzVufkaSS/vHFq4uNXUdb
	tFrpGKwLGkal4OTYmc/58ehxbzL29upyA3++cyMnYdPzFkBGCJvVKquuX4Z8C88zZOeQ=;
Message-ID: <82f36b28-9452-4b4b-92ed-8df784cb07b9@xen.org>
Date: Tue, 22 Aug 2023 09:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] xen/arm: mmu: relocate copy_from_paddr() to
 setup.c
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-13-Henry.Wang@arm.com>
 <b9476973-519b-210d-6ca2-ca614d1e1279@xen.org>
 <2FABB940-CFFB-4EA2-8BC5-758E58025EF0@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2FABB940-CFFB-4EA2-8BC5-758E58025EF0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/08/2023 08:44, Henry Wang wrote:
>> On Aug 22, 2023, at 05:31, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 14/08/2023 05:25, Henry Wang wrote:
>>> From: Penny Zheng <Penny.Zheng@arm.com>
>>> Function copy_from_paddr() is defined in asm/setup.h, so it is better
>>> to be implemented in setup.c.
>>
>> I don't agree with this reasoning. We used setup.h to declare prototype for function that are out of setup.c.
>>
>> Looking at the overall of this series, it is unclear to me what is the difference between mmu/mm.c and mmu/setup.c. I know this is technically not a new problem but as we split the code, it would be a good opportunity to have a better split.
>>
>> For instance, we have setup_mm() defined in setup.c but setup_pagetables() and mm.c. Both are technically related to the memory management. So having them in separate file is a bit odd.
> 
> Skimming through the comments, it looks like we have a common problem
> in patch 7, 9, 10, 12 about how to move/split the code. So instead of having
> the discussion in each patch, I would like to propose that we can discuss all
> of these in a common place here.

+1.

> 
>>
>> I also don't like the idea of having again a massive mm.c files. So maybe we need a split like:
>>   * File 1: Boot CPU0 MM bringup (mmu/setup.c)
>>   * File 2: Secondary CPUs MM bringup (mmu/smpboot.c)
>>   * File 3: Page tables update. (mmu/pt.c)
>>
>> Ideally file 1 should contain only init code/data so it can be marked as .init. So the static pagetables may want to be defined in mmu/pt.c.
> 
> So based on Julien’s suggestion, Penny and I worked a bit on the current
> functions in “arch/arm/mm.c” and we would like to propose below split
> scheme, would you please comment on if below makes sense to you,
> thanks!
> 
> """
> static void __init __maybe_unused build_assertions()      -> arch/arm/mm.c

All the existing build assertions seems to be MMU specific. So shouldn't 
they be moved to mmu/mm.c.

> static lpae_t *xen_map_table()                            -> mmu/pt.c
> static void xen_unmap_table()                             -> mmu/pt.c
> void dump_pt_walk()                                       -> mmu/pt.c
> void dump_hyp_walk()                                      -> mmu/pt.c
> lpae_t mfn_to_xen_entry()                                 -> mmu/pt.c
> void set_fixmap()                                         -> mmu/pt.c
> void clear_fixmap()                                       -> mmu/pt.c
> void flush_page_to_ram()                                  -> arch/arm/mm.c?

I think it should stay in arch/arm/mm.c because you will probably need 
to clean a page even on MPU systems.

> lpae_t pte_of_xenaddr()                                   -> mmu/pt.c
> void * __init early_fdt_map()                             -> mmu/setup.c
> void __init remove_early_mappings()                       -> mmu/setup.c
> static void xen_pt_enforce_wnx()                          -> mmu/pt.c, export it

AFAIU, it would be called from smpboot.c and setup.c. For the former, 
the caller is mmu_init_secondary_cpu() which I think can be folded in 
head.S.

If we do that, then xen_pt_enforce_wnx() can be moved in setup.c and 
doesn't need to be exported.

> static void clear_table()                                 -> mmu/smpboot.c
> void __init setup_pagetables()                            -> mmu/setup.c
> static void clear_boot_pagetables()                       -> mmu/smpboot.c
> int init_secondary_pagetables()                           -> mmu/smpboot.c
> void mmu_init_secondary_cpu()                             -> mmu/smpboot.c
> void __init setup_directmap_mappings()                    -> mmu/setup.c
> void __init setup_frametable_mappings()                   -> mmu/setup.c
> void *__init arch_vmap_virt_end()                         -> arch/arm/mm.c or mmu/setup.c?

AFAIU, the VMAP will not be used for MPU systems. So this would want to 
go in mmu/. I am ok with setup.c.

> void *ioremap_attr()                                      -> mmu/pt.c
> void *ioremap()                                           -> mmu/pt.c
> static int create_xen_table()                             -> mmu/pt.c
> static int xen_pt_next_level()                            -> mmu/pt.c
> static bool xen_pt_check_entry()                          -> mmu/pt.c
> static int xen_pt_update_entry()                          -> mmu/pt.c
> static int xen_pt_mapping_level()                         -> mmu/pt.c
> static unsigned int xen_pt_check_contig()                 -> mmu/pt.c
> static int xen_pt_update()                                -> mmu/pt.c
> int map_pages_to_xen()                                    -> mmu/pt.c
> int __init populate_pt_range()                            -> mmu/pt.c
> int destroy_xen_mappings()                                -> mmu/pt.c
> int modify_xen_mappings()                                 -> mmu/pt.c
> void free_init_memory()                                   -> mmu/setup.c
> void arch_dump_shared_mem_info()                          -> arch/arm/mm.c
> int steal_page()                                          -> arch/arm/mm.c
> int page_is_ram_type()                                    -> arch/arm/mm.c
> unsigned long domain_get_maximum_gpfn()                   -> arch/arm/mm.c
> void share_xen_page_with_guest()                          -> arch/arm/mm.c
> int xenmem_add_to_physmap_one()                           -> arch/arm/mm.c
> long arch_memory_op()                                     -> arch/arm/mm.c
> static struct domain *page_get_owner_and_nr_reference()   -> arch/arm/mm.c
> struct domain *page_get_owner_and_reference()             -> arch/arm/mm.c
> void put_page_nr()                                        -> arch/arm/mm.c
> void put_page()                                           -> arch/arm/mm.c
> bool get_page_nr()                                        -> arch/arm/mm.c
> bool get_page()                                           -> arch/arm/mm.c
> int get_page_type()                                       -> arch/arm/mm.c
> void put_page_type()                                      -> arch/arm/mm.c
> int create_grant_host_mapping()                           -> arch/arm/mm.c
> int replace_grant_host_mapping()                          -> arch/arm/mm.c
> bool is_iomem_page()                                      -> arch/arm/mm.c
> void clear_and_clean_page()                               -> arch/arm/mm.c
> unsigned long get_upper_mfn_bound()                       -> arch/arm/mm.c
> """

The placement of all the ones I didn't comment on look fine to me. It 
would be good to have a second opinion from either Bertrand or Stefano 
before you start moving the functions.

>>> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
>>> index e05cca3f86..889ada6b87 100644
>>> --- a/xen/arch/arm/mmu/setup.c
>>> +++ b/xen/arch/arm/mmu/setup.c
>>> @@ -329,6 +329,33 @@ void __init setup_mm(void)
>>>   }
>>>   #endif
>>>   +/*
>>
>> Why did the second '*' disappear?
> 
> According to the CODING_STYLE, we should use something like this:
> 
> /*
>   * Example, multi-line comment block.
>   *
>   * Note beginning and end markers on separate lines and leading '*'.
>   */
> 
> Instead of "/**” in the beginning. But I think you made a point, I need
> to mention that I took the opportunity to fix the comment style in commit
> message.

We have started to use /** which I think is for Doxygen (see the PDX 
series). So I think the CODING_STYLE needs to be updated rather than 
removing the extra *.

Cheers,

-- 
Julien Grall

