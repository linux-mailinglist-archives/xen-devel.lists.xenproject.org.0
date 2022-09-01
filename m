Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5286A5A9DE8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 19:20:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396872.637235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTnr1-0005ry-LK; Thu, 01 Sep 2022 17:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396872.637235; Thu, 01 Sep 2022 17:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTnr1-0005pD-HY; Thu, 01 Sep 2022 17:19:47 +0000
Received: by outflank-mailman (input) for mailman id 396872;
 Thu, 01 Sep 2022 17:19:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oTnr0-0005p7-CF
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 17:19:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTnr0-0000Yd-07; Thu, 01 Sep 2022 17:19:46 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.12.167]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTnqz-0001gB-QB; Thu, 01 Sep 2022 17:19:45 +0000
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
	bh=MatNpidnBSSoOOMKery1Yow8frUNsc3/HSYXvmw1YrA=; b=23Fkjnhbu+zCUbXHwlE6WLdyV0
	ubPPVfMpyE4yTsi/sbXZbD83bBW0rcj56ZbmH4iTppj2sirjtQSiXHKXzPYUsUKlWb0vEjREetoY9
	JrURP9PLUqPbMMKbNV5DAKFT9lc3eMXqF3JyrJXWxkSwReL0fnNMVU9MOGITE+TmgbwY=;
Message-ID: <b05106cc-09d8-9a9b-38e5-328cd8caff97@xen.org>
Date: Thu, 1 Sep 2022 18:19:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <50bc7ce9-dc98-127b-d0db-40bf82929fc7@xen.org>
 <AS8PR08MB79913A96E64B31A02C985EB5927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB79913A96E64B31A02C985EB5927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 01/09/2022 17:05, Henry Wang wrote:
>>> @@ -755,17 +779,21 @@ static void __init setup_mm(void)
>>>
>>>        do
>>>        {
>>> -        e = consider_modules(ram_start, ram_end,
>>> +        e = !reserved_heap ?
>>> +            consider_modules(ram_start, ram_end,
>>>                                 pfn_to_paddr(xenheap_pages),
>>> -                             32<<20, 0);
>>> +                             32<<20, 0) :
>>> +            reserved_heap_end;
>>
>> Not entirely related to this series. Now the assumption is the admin
>> will make sure that none of the reserved regions will overlap.
>>
>> Do we have any tool to help the admin to verify it? If yes, can we have
>> a pointer in the documentation? If not, should this be done in Xen?
> 
> In the RFC we had the same discussion of this issue [1] and I think a
> follow-up series might needed to do the overlap check if we want to
> do that in Xen. For the existing tool, I am thinking of ImageBuilder, but
> I am curious about Stefano's opinion.
> 
>>
>> Also, what happen with UEFI? Is it easy to guarantee the region will not
>> be used?
> 
> For now I think it is not easy to guarantee that, do you have some ideas
> in mind? I think I can follow this in above follow-up series to improve things.

I don't have any ideas how we can guarantee it (even when using image 
builder). I think we may have to end up to check the overlaps in Xen.

> 
>>
>>> +
>>>            if ( e )
>>>                break;
>>>
>>>            xenheap_pages >>= 1;
>>>        } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-
>> PAGE_SHIFT) );
>>>
>>> -    if ( ! e )
>>> -        panic("Not not enough space for xenheap\n");
>>> +    if ( ! e ||
>>> +         ( reserved_heap && reserved_heap_pages < 32<<(20-PAGE_SHIFT) ) )
>>> +        panic("Not enough space for xenheap\n");
>>
>> So on arm32, the xenheap *must* be contiguous. AFAICT,
>> reserved_heap_pages is the total number of pages in the heap. They may
>> not be contiguous. So I think this wants to be reworked so we look for
>> one of the region that match the definition written above the loop.
> 
> Thanks for raising this concern, I will do this in V2.
> 
>>
>>>
>>>        domheap_pages = heap_pages - xenheap_pages;
>>>
>>> @@ -810,9 +838,9 @@ static void __init setup_mm(void)
>>>    static void __init setup_mm(void)
>>>    {
>>>        const struct meminfo *banks = &bootinfo.mem;
>>> -    paddr_t ram_start = ~0;
>>> -    paddr_t ram_end = 0;
>>> -    paddr_t ram_size = 0;
>>> +    paddr_t ram_start = ~0, bank_start = ~0;
>>> +    paddr_t ram_end = 0, bank_end = 0;
>>> +    paddr_t ram_size = 0, bank_size = 0;
>>>        unsigned int i;
>>>
>>>        init_pdx();
>>> @@ -821,17 +849,36 @@ static void __init setup_mm(void)
>>>         * We need some memory to allocate the page-tables used for the
>> xenheap
>>>         * mappings. But some regions may contain memory already allocated
>>>         * for other uses (e.g. modules, reserved-memory...).
>>> -     *
>>> +     * If reserved heap regions are properly defined, (only) add these
>> regions
>>> +     * in the boot allocator. > +     */
>>> +    if ( reserved_heap )
>>> +    {
>>> +        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
>>> +        {
>>> +            if ( bootinfo.reserved_mem.bank[i].xen_heap )
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
>>>
>>>        total_pages = 0;
>>>
>>>        for ( i = 0; i < banks->nr_banks; i++ )
>>>        {
>>
>> This code is now becoming quite confusing to understanding. This loop is
>> meant to map the xenheap. If I follow your documentation, it would mean
>> that only the reserved region should be mapped.
> 
> Yes I think this is the same question that I raised in the scissors line of the
> commit message of this patch.

Sorry I didn't notice the comment after the scissors line. This is the 
same question :)

> What I intend to do is still mapping the whole
> RAM because of the xenheap_* variables that you mentioned in...
> 
>>
>> More confusingly, xenheap_* variables will cover the full RAM.
> 
> ...here. But only adding the reserved region to the boot allocator so the
> reserved region can become the heap later on. I am wondering if we
> have a more clear way to do that, any suggestions?

I think your code is correct. It only needs some renaming of the 
existing variable (maybe to directmap_*?) to make clear the area is used 
to access the RAM easily.

Cheers,

-- 
Julien Grall

