Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A2366238A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 11:58:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473492.734129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEpqc-0004wL-2B; Mon, 09 Jan 2023 10:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473492.734129; Mon, 09 Jan 2023 10:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEpqb-0004ub-VR; Mon, 09 Jan 2023 10:57:45 +0000
Received: by outflank-mailman (input) for mailman id 473492;
 Mon, 09 Jan 2023 10:57:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEpqa-0004uV-Pl
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 10:57:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEpqa-0002tO-Fc; Mon, 09 Jan 2023 10:57:44 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.1.158]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEpqa-0004em-8b; Mon, 09 Jan 2023 10:57:44 +0000
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
	bh=DisyklBe5soDqZmTSfIpDs6EqXU/3Me8FA8/h5eys9I=; b=Qph4OWtpGLVxVOXnm5PrShrxF7
	qRyy02FRJnJykqEouy1kzDF51o2Cgq10ynAV2t+R7sLNfqwMmpF2hXAznUqjoa9BIYio0m+S3B8zY
	0S3IHpgTydzLQLUekLLAHCgjcevxP9kymFypkMtUmWAjZ8MLO2FeJoLZDW+PNOIibLSE=;
Message-ID: <6db41bd2-ab71-422a-4235-a9209e984915@xen.org>
Date: Mon, 9 Jan 2023 10:57:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 06/13] xen/arm: assign shared memory to owner when host
 address not provided
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-7-Penny.Zheng@arm.com>
 <d7f12897-c6cc-0895-b70e-53c0b88bd0f9@xen.org>
 <AM0PR08MB453041150588948050F718D4F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB453041150588948050F718D4F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/01/2023 07:49, Penny Zheng wrote:
> Hi Julien

Hi Penny,

> Happy new year~~~~

Happy new year too!

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Sunday, January 8, 2023 8:53 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v1 06/13] xen/arm: assign shared memory to owner
>> when host address not provided
>>
>> Hi,
>>
>> On 15/11/2022 02:52, Penny Zheng wrote:
>>> @@ -922,33 +927,82 @@ static mfn_t __init
>> acquire_shared_memory_bank(struct domain *d,
>>>        d->max_pages += nr_pfns;
>>>
>>>        smfn = maddr_to_mfn(pbase);
>>> -    res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
>>> -    if ( res )
>>> +    page = mfn_to_page(smfn);
>>> +    /*
>>> +     * If page is allocated from heap as static shared memory, then we just
>>> +     * assign it to the owner domain
>>> +     */
>>> +    if ( page->count_info == (PGC_state_inuse | PGC_static) )
>> I am a bit confused how this can help differentiating becaPGC_state_inuse is
>> 0. So effectively, you are checking that count_info is equal to PGC_static.
>>
> 
> When host address is provided, the host address range defined in
> xen,static-mem will be stored as a "struct membank" with type
> of "MEMBANK_STATIC_DOMAIN" in "bootinfo.reserved_mem"
> Then it will be initialized as static memory through "init_staticmem_pages"
> So here its page->count_info is PGC_state_free |PGC_static.
> For pages allocated from heap, its page state is different, being PGC_state_inuse.
> So actually, we are checking page state to tell the difference                                                    .

Ok. This is definitely not obvious from the code. But I think this is a
very fragile assumption.

Instead, it would be better if we allocate the memory in 
acquire_shared_memory_bank() when the host address is not provided.

> 
>> But as I wrote in a previous patch, I don't think you should convert
>> {xen,dom}heap pages to a static pages.
>>
> 
> I agree that taking reference could also prevent giving these pages back to heap.
> But may I ask what is your concern on converting {xen,dom}heap pages to a static pages?

A few reasons:
  1) I consider them as two distinct allocators. So far they have the 
same behavior, but in the future this may change.
  2) If the page is freed you really don't want the domain to be able to 
re-use the page for a different purpose.


I realize that 2) is already a problem today with static pages. So I 
think the best is to ensure that pages allocated for shared memory never 
reach the any of the allocators.

>   
>> [...]
>>
>>> +static int __init assign_shared_memory(struct domain *d,
>>> +                                       struct shm_membank *shm_membank,
>>> +                                       paddr_t gbase) {
>>> +    int ret = 0;
>>> +    unsigned long nr_pages, nr_borrowers;
>>> +    struct page_info *page;
>>> +    unsigned int i;
>>> +    struct meminfo *meminfo;
>>> +
>>> +    /* Host address is not provided in "xen,shared-mem" */
>>> +    if ( shm_membank->mem.banks.meminfo )
>>> +    {
>>> +        meminfo = shm_membank->mem.banks.meminfo;
>>> +        for ( i = 0; i < meminfo->nr_banks; i++ )
>>> +        {
>>> +            ret = acquire_shared_memory(d,
>>> +                                        meminfo->bank[i].start,
>>> +                                        meminfo->bank[i].size,
>>> +                                        gbase);
>>> +            if ( ret )
>>> +                return ret;
>>> +
>>> +            gbase += meminfo->bank[i].size;
>>> +        }
>>> +    }
>>> +    else
>>> +    {
>>> +        ret = acquire_shared_memory(d,
>>> +                                    shm_membank->mem.bank->start,
>>> +                                    shm_membank->mem.bank->size, gbase);
>>> +        if ( ret )
>>> +            return ret;
>>> +    }
>>
>> Looking at this change and...
>>
>>> +
>>>        /*
>>>         * Get the right amount of references per page, which is the number of
>>>         * borrower domains.
>>> @@ -984,23 +1076,37 @@ static int __init assign_shared_memory(struct
>> domain *d,
>>>         * So if the borrower is created first, it will cause adding pages
>>>         * in the P2M without reference.
>>>         */
>>> -    page = mfn_to_page(smfn);
>>> -    for ( i = 0; i < nr_pages; i++ )
>>> +    if ( shm_membank->mem.banks.meminfo )
>>>        {
>>> -        if ( !get_page_nr(page + i, d, nr_borrowers) )
>>> +        meminfo = shm_membank->mem.banks.meminfo;
>>> +        for ( i = 0; i < meminfo->nr_banks; i++ )
>>>            {
>>> -            printk(XENLOG_ERR
>>> -                   "Failed to add %lu references to page %"PRI_mfn".\n",
>>> -                   nr_borrowers, mfn_x(smfn) + i);
>>> -            goto fail;
>>> +            page = mfn_to_page(maddr_to_mfn(meminfo->bank[i].start));
>>> +            nr_pages = PFN_DOWN(meminfo->bank[i].size);
>>> +            ret = add_shared_memory_ref(d, page, nr_pages, nr_borrowers);
>>> +            if ( ret )
>>> +                goto fail;
>>>            }
>>>        }
>>> +    else
>>> +    {
>>> +        page = mfn_to_page(
>>> +                maddr_to_mfn(shm_membank->mem.bank->start));
>>> +        nr_pages = shm_membank->mem.bank->size >> PAGE_SHIFT;
>>> +        ret = add_shared_memory_ref(d, page, nr_pages, nr_borrowers);
>>> +        if ( ret )
>>> +            return ret;
>>> +    }
>>
>> ... this one. The code to deal with a bank is exactly the same. But you need
>> the duplication because you special case "one bank".
>>
>> As I wrote in a previous patch, I don't think we should special case it.
>> If the concern is memory usage, then we should look at reworking meminfo
>> instead (or using a different structure).
>>
> 
> A few concerns explained why I didn't choose "struct meminfo" over two
> pointers "struct membank*" and "struct meminfo*".
> 1) memory usage is the main reason.
> If we use "struct meminfo" over the current "struct membank*" and "struct meminfo*",
> "struct shm_meminfo" will become a array of 256 "struct shm_membank", with
> "struct shm_membank" being also an 256-item array, that is 256 * 256, too big for
> a structure and If I remembered clearly, it will lead to "more than PAGE_SIZE" compiling error.

I am not aware of any place where we would restrict the size of kinfo in 
upstream. Can you give me a pointer?

> FWIT, either reworking meminfo or using a different structure, are both leading to sizing down
> the array, hmmm, I don't know which size is suitable. That's why I prefer pointer
> and dynamic allocation.

I would expect that in most cases, you will need only one bank when the 
host address is not provided. So I think this is a bit odd to me to 
impose a "large" allocation for them.

> 2) If we use "struct meminfo*" over the current "struct membank*" and "struct meminfo*",
> we will need a new flag to differentiate two scenarios(host address provided or not), As
> the special case "struct membank*" is already helping us differentiate.
> And since when host address is provided, the related "struct membank" also needs to be
> reserved in "bootinfo.reserved_mem". That's why I used pointer " struct membank*" to
> avoid memory waste.

I am confused... Today you are defining as:

struct {
     struct membank *;
     struct {
        struct meminfo *;
        unsigned long total_size;
     }
}

So on arm64 host, you would use 24 bytes. If we were using an union 
instead. We would use 16 bytes. Adding a 32-bit fields, would bring to 
20 bytes (assuming we can re-use a padding).

Therefore, there is no memory waste here with a flag...

Cheers,

-- 
Julien Grall

