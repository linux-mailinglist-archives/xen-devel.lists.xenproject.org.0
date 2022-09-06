Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B945AE3A8
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 11:00:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399678.640923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVUR5-0000Je-Ic; Tue, 06 Sep 2022 08:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399678.640923; Tue, 06 Sep 2022 08:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVUR5-0000Gz-FP; Tue, 06 Sep 2022 08:59:59 +0000
Received: by outflank-mailman (input) for mailman id 399678;
 Tue, 06 Sep 2022 08:59:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVUR4-0000Gk-FG
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 08:59:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVUR4-0007Uw-82; Tue, 06 Sep 2022 08:59:58 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.11.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVUR4-0001F0-1k; Tue, 06 Sep 2022 08:59:58 +0000
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
	bh=Ads4QvyUHYv6Lul4z7uLaa22n2NkmCOs2z0DnIPhCPI=; b=iinxC0M5XUmO3T9CanvsArJoJP
	Vd+HGbLWdX7zLqWgt2ulwqhMW6RMsTZ8mQJY18FIWnssbOLiKbCWzcO6juXp+kOrpZXS4i8u55lMN
	aVSNHHz+xXaLEcsfJ03+wlev6kbFjEGCWqD8xPMINlvYS/iYfHG4kRPPKNuoE+mIfmx0=;
Message-ID: <e4b2721b-8ddc-080f-e602-a3c02b2a13f8@xen.org>
Date: Tue, 6 Sep 2022 09:59:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v2 3/4] xen/arm: Handle reserved heap pages in boot and
 heap allocator
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>
 <20220905072635.16294-4-Henry.Wang@arm.com>
 <57082fec-e9ce-eeda-d051-d75a4bc35909@xen.org>
 <AS8PR08MB79915EEF32D662929B1657A3927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB79915EEF32D662929B1657A3927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry

On 06/09/2022 02:53, Henry Wang wrote:
> Thanks for your comments, I added my reply and some of the questions
> that I am not 100% sure inline below.
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Hi Henry,
>>> +
>>> +/*
>>> + * Find the contiguous xenheap region that fits in the reserved heap region
>> with
>>
>> There might be multiple. So "Find a contiguous...". I would also drop
>> "xenheap".
> 
> I will follow the wording that you suggested here and ...
> 
>>
>>> + * required size and alignment, and return the end address of xenheap.
>>
>> I would write "and return the end address of the region if found
>> otherwise 0".
> 
> ...here.
> 
>>
>>> + */
>>> +static paddr_t __init fit_xenheap_in_reserved_heap(uint32_t size, paddr_t
>> align)
>>> +{
>>> +    int i;
>>
>> Please use unsigned int.
> 
> Ah sure.
> 
>>
>>> +    paddr_t end = 0, aligned_start, aligned_end;
>>> +    paddr_t bank_start, bank_size, bank_end;
>>> +
>>> +    for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
>>> +    {
>>> +        if ( bootinfo.reserved_mem.bank[i].type == MEMBANK_RSVD_HEAP )
>> NIT: You could avoid the extra indentation by reverting the condition.
> 
> Sorry I am not 100% sure the extra indentation you were referring to.
> Are you suggesting that we need to do a
> ```
> if ( bootinfo.reserved_mem.bank[i].type != MEMBANK_RSVD_HEAP )
>      continue;
> 
> bank_start = bootinfo.reserved_mem.bank[i].start;
> ...
> ```
> 
> ?

Yes.

> 
> If so I will change in v3.
> 
>>
>>> +        {
>>> +            bank_start = bootinfo.reserved_mem.bank[i].start;
>>> +            bank_size = bootinfo.reserved_mem.bank[i].size;
>>> +            bank_end = bank_start + bank_size;
>>> +
>>> +            if ( bank_size < size )
>>> +                continue;
>>> +
>>> +            aligned_end = bank_end & ~(align - 1);
>>> +            aligned_start = (aligned_end - size) & ~(align - 1);
>>
>> I find the logic a bit confusing. AFAIU, aligned_start could be below
>> the start of the RAM which is not what I would usually expect.
> 
> Yeah I understand your concern. Here I want to make sure even if
> the given size is not aligned (although less likely happen in real life
> given the size calculation logic in setup_mm) the code still work.

I don't think I agree on the less likely here. The regions are provided 
by in the Device-Tree. And there are more chance they are incorrect 
because the value will be specific to a software/device stack.

Related to this discussion, I can't find any alignment requirement in 
the device-tree binding. I think we at least want to require 64KB 
aligned (so the same Device-Tree works if we were going to support 64KB 
page granularity).

>>
>>> +
>>> +            if ( aligned_start > bank_start )
>>> +                /*
>>> +                 * Arm32 allocates xenheap from higher address to lower, so if
>>
>> This code is also called on arm32. So what are you referring to? Is it
>> consider_modules()?
> 
> Yes, I think the current arm32 behavior in consider_modules() is what
> I am referring to. In fact, I just want to add some comments that explain why
> we need the end = max(end, aligned_end) since technically if there are
> multiple reserved heap banks and all of them can fit the xenheap region,
> we can use either of them. But following the current behavior we can only use
> the highest bank to keep the consistency.

Xenheap is currently allocated the highest possible so there is enough 
low memory available for domain memory. This is in order to allow 32-bit
DMA device to function.

I am less certain this makes sense when the heap is reserved. Because an
admin could decide to define the heap solely above/below 4GB.

That said, nothing in the document suggests that domain memory would not 
be allocated from the reserved heap. So I would suggest to write the 
following comment:

"Allocate the xenheap as high as possible to keep low-memory available 
(assuming the admin supplied region below 4GB) for other use (e.g. 
domain memory allocation)."

Also, I think the documentation wants to be updated to clarify whether 
the reserved heap could be used to allocate domain. If it could, then I 
think we need to explain that the region should contain enough memory 
below some 4GB to cater 32-bit DMA.

>> The new wording suggests that the 1GB limit only applies when the admin
>> doesn't specify the reserved heap. However, we don't support larger heap
>> than 1GB. So the limit should also apply for the reserved heap. So how
>> about:
>>
>> - must be at most 1GB or 1/32 the total RAM in the system (or reserved
>> heap if enabled)
> 
> ...here.
> 
>>
>>>         *  - must be at least 32M
>>>         *
>>>         * We try to allocate the largest xenheap possible within these
>>>         * constraints.
>>>         */
>>> -    heap_pages = ram_pages;
>>> +    heap_pages = bootinfo.reserved_heap ? reserved_heap_pages :
>> ram_pages;
>>
>> You can avoid the ternary operation here by setting heap_pages in the
>> 'if' above and add a else for the 'ram_pages' part.
> 
> Sorry I might understand your comment in the wrong way, but do you
> suggest we need to:
> ```
> if ( bootinfo.reserved_heap )
> {
> ...
>      heap_pages = reserved_heap_pages;
> }
> else
>      heap_pages = total_pages;
> ```
> ?

Yes.

> If so I will do that in v3.

Thanks.

>>> +     * in the boot allocator.
>>> +     */
>>> +    if ( bootinfo.reserved_heap )
>>> +    {
>>> +        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
>>> +        {
>>> +            if ( bootinfo.reserved_mem.bank[i].type ==
>> MEMBANK_RSVD_HEAP )
>>> +            {
>>> +                bank_start = bootinfo.reserved_mem.bank[i].start;
>>> +                bank_size = bootinfo.reserved_mem.bank[i].size;
>>> +                bank_end = bank_start + bank_size;
>>> +
>>> +                init_boot_pages(bank_start, bank_end);
>>> +            }
>>> +        }
>>> +    }
>>> +    /*
>>> +     * No reserved heap regions:
>>>         * For simplicity, add all the free regions in the boot allocator.
>>>         */
>>> -    populate_boot_allocator();
>>> +    else
>>> +        populate_boot_allocator();
>>
>> For arm32, shouldn't we also only add the reserved heap (minus the
>> xenheap) to the boot allocator? At which point, I would move the change
>> in populate_boot_allocator().
> 
> Sorry I am not sure what this comment about...as here the code is for arm64.

Right, I wasn't sure where to comment because you don't touch the call 
to populate_boot_allocator().

> For the question, yes.
> For the latter one, do you request some changes? If so, could you please kindly
> elaborate a little bit more? Thanks.

Yes I am requesting some change because I think the code on arm32 is 
incorrect (the boot allocator will not be populated with the reserved heap).

I think the code should be moved in populate_boot_allocator():

if ( bootinfo.reserved_heap )
{
     for ( ...; i < bootinfo.reserved_mem.nr_banks; i++ )
        [....]
        init_boot_pages_pages()
}

Note that to handle arm32, you will also need to exclude the xenheap area.

Cheers,

-- 
Julien Grall

