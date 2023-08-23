Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17403785F09
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 19:59:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589472.921397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYs8a-0004zz-Sj; Wed, 23 Aug 2023 17:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589472.921397; Wed, 23 Aug 2023 17:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYs8a-0004yJ-Pl; Wed, 23 Aug 2023 17:59:24 +0000
Received: by outflank-mailman (input) for mailman id 589472;
 Wed, 23 Aug 2023 17:59:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYs8Z-0004yD-DA
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 17:59:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYs8Y-0007be-0J; Wed, 23 Aug 2023 17:59:22 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.29.180]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYs8X-0000ar-N4; Wed, 23 Aug 2023 17:59:21 +0000
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
	bh=rc1oVAKoclNXg8FCrjpb2j/3/hIAKW6WNPNzzFaOdjI=; b=cy8UUZR/ZEbAKzpihyL/x0cCU4
	Ws4nKlDz9v2aAYntyJjDn5DeLV+IkVS7JGM1MFNAt9ckQBBNgoyM9aebwwUQRQ+xwfsxoTJI2rzTs
	b66I/6Bie4NyYSoJ6jS+n8i1OPLP5I73hbclxzmp53PROqKkJIyP5utGpSkR4xjCyb4k=;
Message-ID: <5264912e-b2bf-4b5e-9f3f-460df21c5141@xen.org>
Date: Wed, 23 Aug 2023 18:59:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] xen/arm: mmu: relocate copy_from_paddr() to
 setup.c
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
 <Penny.Zheng@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Wei Chen <Wei.Chen@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-13-Henry.Wang@arm.com>
 <b9476973-519b-210d-6ca2-ca614d1e1279@xen.org>
 <2FABB940-CFFB-4EA2-8BC5-758E58025EF0@arm.com>
 <82f36b28-9452-4b4b-92ed-8df784cb07b9@xen.org>
 <alpine.DEB.2.22.394.2308221656400.6458@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2308221656400.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 23/08/2023 01:10, Stefano Stabellini wrote:
> On Tue, 22 Aug 2023, Julien Grall wrote:
>>>> I also don't like the idea of having again a massive mm.c files. So maybe
>>>> we need a split like:
>>>>    * File 1: Boot CPU0 MM bringup (mmu/setup.c)
>>>>    * File 2: Secondary CPUs MM bringup (mmu/smpboot.c)
>>>>    * File 3: Page tables update. (mmu/pt.c)
>>>>
>>>> Ideally file 1 should contain only init code/data so it can be marked as
>>>> .init. So the static pagetables may want to be defined in mmu/pt.c.
>>>
>>> So based on Julien’s suggestion, Penny and I worked a bit on the current
>>> functions in “arch/arm/mm.c” and we would like to propose below split
>>> scheme, would you please comment on if below makes sense to you,
>>> thanks!
>>>
>>> """
>>> static void __init __maybe_unused build_assertions()      -> arch/arm/mm.c
>>
>> All the existing build assertions seems to be MMU specific. So shouldn't they
>> be moved to mmu/mm.c.
>>
>>> static lpae_t *xen_map_table()                            -> mmu/pt.c
>>> static void xen_unmap_table()                             -> mmu/pt.c
>>> void dump_pt_walk()                                       -> mmu/pt.c
>>> void dump_hyp_walk()                                      -> mmu/pt.c
>>> lpae_t mfn_to_xen_entry()                                 -> mmu/pt.c
>>> void set_fixmap()                                         -> mmu/pt.c
>>> void clear_fixmap()                                       -> mmu/pt.c
>>> void flush_page_to_ram()                                  -> arch/arm/mm.c?
>>
>> I think it should stay in arch/arm/mm.c because you will probably need to
>> clean a page even on MPU systems.
> 
> I take you are referring to flush_page_to_ram() only, and not the other
> functions above

That's correct.

> 
> 
>>> lpae_t pte_of_xenaddr()                                   -> mmu/pt.c
>>> void * __init early_fdt_map()                             -> mmu/setup.c
>>> void __init remove_early_mappings()                       -> mmu/setup.c
>>> static void xen_pt_enforce_wnx()                          -> mmu/pt.c,
>>> export it
>>
>> AFAIU, it would be called from smpboot.c and setup.c. For the former, the
>> caller is mmu_init_secondary_cpu() which I think can be folded in head.S.
>>
>> If we do that, then xen_pt_enforce_wnx() can be moved in setup.c and doesn't
>> need to be exported.
>>
>>> static void clear_table()                                 -> mmu/smpboot.c
>>> void __init setup_pagetables()                            -> mmu/setup.c
>>> static void clear_boot_pagetables()                       -> mmu/smpboot.c
> 
> Why clear_table() and clear_boot_pagetables() in mmu/smpboot.c rather
> than mmu/setup.c ? It is OK either way as it does seem to make much of a
> difference but I am curious.

I initially wondered the same. But then I didn't comment because 
clear_boot_pagetables() is only used in order to prepare the page-tables 
for the secondary boot CPU.

Also, even if today we don't support CPU hotplug, there is nothing 
preventing us to do (in fact there was a series on the ML for that). 
This means clear_table() & co would need to be outside of the init 
section and we would need to remove the check that all 
variables/functions defined in setup.c are residing in it.

Saying that, we should not need to clear the boot page tables anymore 
for arm64 because secondary CPUs will directly jump to the runtime 
page-tables. So the code could be cleaned up a bit. Anyway, this is not 
a request for this series and could be done afterwards by someone else.

Cheers,

-- 
Julien Grall

