Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5DE6C68AE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 13:44:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513849.795484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKId-0002jE-TU; Thu, 23 Mar 2023 12:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513849.795484; Thu, 23 Mar 2023 12:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKId-0002gT-Q2; Thu, 23 Mar 2023 12:44:11 +0000
Received: by outflank-mailman (input) for mailman id 513849;
 Thu, 23 Mar 2023 12:44:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pfKIc-0002g8-86
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 12:44:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pfKIb-0007Rt-MT; Thu, 23 Mar 2023 12:44:09 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.18.79]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pfKIb-0000IP-Fu; Thu, 23 Mar 2023 12:44:09 +0000
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
	bh=JXNkX6mCQ12J6fWiSpxUNoETCP4ol34oY64CGQBSb1g=; b=XSJlleTM1XCHGTPUqV13OoNUOh
	5V5xsfnRi/vQgO7nVsuFcuqtg2NlaYIdxMvUo73Ky5rR+pBlYBKxQT59m8KruE9Dj0IgHQ0448hcz
	Mwe8X1qX9agTZXW1JsEY/BX28ktS/PR7qdnBdDk3oKbBytPUR1GX1w+mm2gVuE7feSpE=;
Message-ID: <79e83610-5980-d9b5-7994-6b0cb2b9049a@xen.org>
Date: Thu, 23 Mar 2023 12:44:07 +0000
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
 <98194c59-6bd8-7b98-c94d-df0f4faf0c04@xen.org>
 <1da599963f20f84c84a9114e10776da3ed0d35e2.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1da599963f20f84c84a9114e10776da3ed0d35e2.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 23/03/2023 12:30, Oleksii wrote:
> On Thu, 2023-03-23 at 11:57 +0000, Julien Grall wrote:
>> On 23/03/2023 11:18, Oleksii wrote:
>>> Hi Julien,
>>
>> Hi Oleksii,
>>
>>> On Wed, 2023-03-22 at 14:21 +0000, Julien Grall wrote:
>>> ...
>>>>
>>>>>>> +    unsigned long page_addr;
>>>>>>> +
>>>>>>> +    // /* align start addresses */
>>>>>>> +    // map_start &= XEN_PT_LEVEL_MAP_MASK(0);
>>>>>>> +    // pa_start &= XEN_PT_LEVEL_MAP_MASK(0);
>>>>>>
>>>>>> They should be switched to ASSERT() or BUG_ON().
>>>>> Sure. Thanks. I'll update.
>>>>>>
>>>>>>> +
>>>>>>> +    page_addr = map_start;
>>>>>>> +    while ( page_addr < map_end )
>>>>>>
>>>>>> This loop is continue to assume that only the mapping can
>>>>>> first
>>>>>> in
>>>>>> 2MB
>>>>>> section (or less if the start is not 2MB aligned).
>>>>>>
>>>>>> I am OK if you want to assume it, but I think this should be
>>>>>> documented
>>>>>> (with words and ASSERT()/BUG_ON()) to avoid any mistake.
>>>>> I add a check in setup_initial_pagetables:
>>>>>         BUG_ON(load_addr_start % (PAGE_ENTRIES * PAGE_SIZE) !=
>>>>> 0);
>>>>> Probably this is not a correct place and should be moved to
>>>>> setup_initial_mapping() instead of setup_initial_pagetables()
>>>>
>>>> Yes it should be moved in setup_initial_mapping().
>>> Then I'll moved it to setup_initial_mapping()
>>>>
>>>>>>
>>>>>>> +    {
>>>>>>> +        unsigned long index2 = pt_index(2, page_addr);
>>>>>>> +        unsigned long index1 = pt_index(1, page_addr);
>>>>>>> +        unsigned long index0 = pt_index(0, page_addr);
>>>>>>> +
>>>>>>> +        /* Setup level2 table */
>>>>>>> +        second[index2] = paddr_to_pte((unsigned
>>>>>>> long)first);
>>>>>>> +        second[index2].pte |= PTE_TABLE;
>>>>>>> +
>>>>>>> +        /* Setup level1 table */
>>>>>>> +        first[index1] = paddr_to_pte((unsigned
>>>>>>> long)zeroeth);
>>>>>>> +        first[index1].pte |= PTE_TABLE;
>>>>>>> +
>>>>>>> +
>>>>>>
>>>>>> NIT: Spurious line?
>>>>> Yeah, should be removed. Thanks.
>>>>>>
>>>>>>> +        /* Setup level0 table */
>>>>>>> +        if ( !pte_is_valid(&zeroeth[index0]) )
>>>>>>
>>>>>> On the previous version, you said it should be checked for
>>>>>> each
>>>>>> level.
>>>>> I had a terrible internet connection, and my message wasn't
>>>>> sent.
>>>>
>>>> No worries.
>>>>
>>>>>
>>>>> I decided not to check that l2 and l1 are used only for
>>>>> referring
>>>>> to
>>>>> the next page table but not leaf PTE. So it is safe to
>>>>> overwrite it
>>>>> each time (the addresses of page tables are the same all the
>>>>> time)
>>>>
>>>> You are letting the caller to decide which page-table to use for
>>>> each
>>>> level. So you are at the mercy that caller will do the right
>>>> thing.
>>>>
>>>> IHMO, this is a pretty bad idea because debugging page-tables
>>>> error
>>>> are
>>>> difficult. So it is better to have safety in place. This is not
>>>> worth...
>>>>
>>>>     and
>>>>> probably it will be better from optimization point of view to
>>>>> ignore if
>>>>> clauses.
>>>>
>>>> ... the optimization in particular when this is at boot time.
>>> I didn't think about that caller will do always the right thing so
>>> I will add the check.
>>>>
>>>>>
>>>>> And it is needed in case of L0 because it is possible that some
>>>>> addressed were marked with specific flag ( execution, read,
>>>>> write )
>>>>> and
>>>>> so not to overwrite the flags set before the check is needed.
>>>> In which case you should really report an error because the
>>>> caller
>>>> may
>>>> have decide to set execution flag and you don't honor. So when
>>>> the
>>>> code
>>>> is executed, you will receive a fault and this may be hard to
>>>> find
>>>> out
>>>> what happen.
>>>
>>> Right now, it is expected situation that the caller will try to
>>> change
>>> execution flag during the setup of initial page tables. >
>>> It is possible in the currently implemented logic of the setup of
>>> initial page tables.
>>
>> This sounds like a bug in your caller implementation. You should not
>> try
>> to workaround this in your code updating the page-tables.
>>
>>> Let me explain what I mean.
>>>
>>> The first step of setup_initial_pagetables() is to map .text,
>>> .init,
>>> .rodata with necessary flags RX, RX, R.
>>> Remaining sections will have RW flags, and to map them,
>>> setup_initial_mapping() is called for the whole range of
>>> [linker_start,
>>> linker_end] not to map them one by one thereby during this step
>>> setup_initial_mapping() will try to remap addresses ranges which
>>> overlap with .text, .init, .rodata with RW flags but it should
>>> leave
>>> with the previously set flags.
>> Why do you need to call setup_init_mapping() with the whole range? In
>> fact the only reason I can think this is useful is when you when to
>> create a 1:1 mapping when the linker and load address is different.
> It is needed to not map each section separately one by one as most of
> the sections have the same PTE_FLAGS (Read, Write, eXectuable, etc )
> 
> So it was decided to map the following sections separately as they have
> 'unique' flags:
>   - .text -> RX
>   - .rodata -> R
>   - .init.text -> RX
> 
> All other sections are RW and could be covered by one call of
> setup_init_mapping() for the whole range:
>   - .data.ro_after_init
>   - .data.read_mostly
>   - .data
>   - .init.data
>   - .bss
> So some ranges ( .text, .rodata, .init.text ) from the whole range will
> be skipped as already mapped and the rest sections will be mapped
> during one call of setup_init_mapping().

This approach is very fragile and not scalable because:
  * You can't use setup_initial_mapping() to change the permission flags.
  * You can't catch caller mistakes (e.g. imagine you end up to use a 
different physical region).

I can see two solutions:

   1) Loop through the region page and page and check within permission 
you want (see the loop in setup_pagetables() for Arm).
   2) Re-order the calls so you want first all Xen and then update the 
permission flags as it fits.

I don't have a strong preference between the two options here.

Cheers,

-- 
Julien Grall

