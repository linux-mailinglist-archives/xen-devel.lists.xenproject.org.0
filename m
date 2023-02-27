Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20FD6A482A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 18:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502842.774855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWhQL-0002uK-NU; Mon, 27 Feb 2023 17:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502842.774855; Mon, 27 Feb 2023 17:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWhQL-0002rO-Jq; Mon, 27 Feb 2023 17:36:29 +0000
Received: by outflank-mailman (input) for mailman id 502842;
 Mon, 27 Feb 2023 17:36:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pWhQJ-0002rI-W2
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 17:36:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pWhQJ-0006rY-Di; Mon, 27 Feb 2023 17:36:27 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.16.186]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pWhQJ-0005Jc-3r; Mon, 27 Feb 2023 17:36:27 +0000
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
	bh=dho0XloKh1//pn/ArxdTM71Bv2vfHZJjCwAdFErs5rw=; b=0nF9RGKju6c8r8y1wTV/nMvZ14
	SvfbozGZ6c/9eIwtDPAa1ngkCq42IDpZo0S5yazea+6daR+v6SCykaqdwtlchmk86e7opTnd9ZtVn
	XiJblheB2mBFqUWgXGa+TGCUztGHpyIzCQ8ZlIqhJOym8YHvhmEg7NItyiNIbZ0sqrfk=;
Message-ID: <98d45f93-b611-1016-45b5-3d7487af261f@xen.org>
Date: Mon, 27 Feb 2023 17:36:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v1 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
 <a145fbbfb166d9f6bd4859b669d23a1f52004b2b.1677250203.git.oleksii.kurochko@gmail.com>
 <fca300ad-0fd1-70ed-4cd4-82e89f5c3351@xen.org>
 <a0f3f1ca4277c1f8aeeaf6531d90c5b04c244af9.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a0f3f1ca4277c1f8aeeaf6531d90c5b04c244af9.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 27/02/2023 16:52, Oleksii wrote:
> On Sat, 2023-02-25 at 17:53 +0000, Julien Grall wrote:
>>> +/*
>>> + * WARNING: load_addr() and linker_addr() are to be called only
>>> when the MMU is
>>> + * disabled and only when executed by the primary CPU.  They
>>> cannot refer to
>>> + * any global variable or functions.
>>
>> I find interesting you are saying when _setup_initial_pagetables() is
>> called from setup_initial_pagetables(). Would you be able to explain
>> how
>> this is different?
> I am not sure that I understand your question correctly but
> _setup_initial_pagetables() was introduced to map some addresses with
> write/read flag. Probably I have to rename it to something that is more
> clear.

So the comment suggests that you code cannot refer to global 
functions/variables when the MMU is off. So I have multiple questions:
   * Why only global? IOW, why static would be OK?
   * setup_initial_pagetables() has a call to 
_setup_initial_pagetables() (IOW referring to another function). Why is 
it fine?
   * You have code in the next patch referring to global variables 
(mainly _start and _end). How is this different?

>>
>>> + */
>>> +
>>> +/*
>>> + * Convert an addressed layed out at link time to the address
>>> where it was loaded
>>
>> Typo: s/addressed/address/ ?
> Yes, it should be address. and 'layed out' should be changed to 'laid
> out'...
>>
>>> + * by the bootloader.
>>> + */
>>
>> Looking at the implementation, you seem to consider that any address
>> not
>> in the range [linker_addr_start, linker_addr_end[ will have a 1:1
>> mappings.
>>
>> I am not sure this is what you want. So I would consider to throw an
>> error if such address is passed.
> I thought that at this stage and if no relocation was done it is 1:1
> except the case when load_addr_start != linker_addr_start.

The problem is what you try to map one to one may clash with the linked 
region for Xen. So it is not always possible to map the region 1:1.

Therefore, I don't see any use for the else part here.

> 
> 
>>
>>> +#define
>>> load_addr(linker_address)
>>>      \
>>> +
>>> ({
>>>          \
>>> +        unsigned long __linker_address = (unsigned
>>> long)(linker_address);      \
>>> +        if ( linker_addr_start <= __linker_address
>>> &&                          \
>>> +            __linker_address < linker_addr_end
>>> )                               \
>>> +
>>> {
>>>      \
>>> +            __linker_address
>>> =                                                 \
>>> +                __linker_address - linker_addr_start +
>>> load_addr_start;        \
>>> +
>>> }
>>>      \
>>> +
>>> __linker_address;
>>>      \
>>> +    })
>>> +
>>> +/* Convert boot-time Xen address from where it was loaded by the
>>> boot loader to the address it was layed out
>>> + * at link-time.
>>> + */
>>
>> Coding style: The first line is too long and multi-line comments look
>> like:
>>
>> /*
>>    * Foo
>>    * Bar
>>    */
>>
>>> +#define
>>> linker_addr(load_address)
>>>      \
>>
>> Same remark as for load_addr() above.
>>
>>> +
>>> ({
>>>          \
>>> +        unsigned long __load_address = (unsigned
>>> long)(load_address);          \
>>> +        if ( load_addr_start <= __load_address
>>> &&                              \
>>> +            __load_address < load_addr_end
>>> )                                   \
>>> +
>>> {
>>>      \
>>> +            __load_address
>>> =                                                   \
>>> +                __load_address - load_addr_start +
>>> linker_addr_start;          \
>>> +
>>> }
>>>      \
>>> +
>>> __load_address;
>>>      \
>>> +    })
>>> +
>>> +static void __attribute__((section(".entry")))
>>> +_setup_initial_pagetables(pte_t *second, pte_t *first, pte_t
>>> *zeroeth,
>> Can this be named to setup_initial_mapping() so this is clearer and
>> avoid the one '_' different with the function below.
> Sure. It will be better.
>>
>>> +                         unsigned long map_start,
>>> +                         unsigned long map_end,
>>> +                         unsigned long pa_start,
>>> +                         bool writable)
>>
>> What about the executable bit?
> It's always executable... But as you mentioned above PTE_LEAF_DEFAULT
> should be either RX or RW.
> I think it makes sense to add flags instead of writable.
>>
>>> +{
>>> +    unsigned long page_addr;
>>> +    unsigned long index2;
>>> +    unsigned long index1;
>>> +    unsigned long index0;
>>
>> index* could be defined in the loop below.
> It could. But I am curious why it is better?
>>
>>> +
>>> +    /* align start addresses */
>>> +    map_start &= ZEROETH_MAP_MASK;
>>> +    pa_start &= ZEROETH_MAP_MASK;
>>
>> Hmmm... I would actually expect the address to be properly aligned
>> and
>> therefore not require an alignment here.
>>
>> Otherwise, this raise the question of what happen if you have region
>> using the same page?
> That map_start &=  ZEROETH_MAP_MASK is needed to page number of address
> w/o page offset.

My point is why would the page offset be non-zero?

>>
>>> +
>>> +    page_addr = map_start;
>>> +    while ( page_addr < map_end )
>>
>> Looking at the loop, it looks like you are assuming that the region
>> will
>> never cross a boundary of a page-table (either L0, L1, L2). I am not
>> convinced you can make such assumption (see below).
>>
>> But if you really want to make such assumption then you should add
>> some
>> guard (either BUILD_BUG_ON(), ASSERT(), proper check) in your code to
>> avoid any surprise in the future.
> I am not sure that I fully understand what is the problem here.
> The address is aligned on (1<<12) boundary and each itearation is
> mapped (1<<12) page so all looks fine or I misunderstood you.

Let's take an example, imagine the region you want to map is 4MB. 
AFAICT, you are only passing one L0 page-table. So your code will end up 
to overwrite the previous entries in the zeroeth page-table and then add 
another link in the L1 page-table.

>>
>>> +    {
>>> +        index2 = pagetable_second_index(page_addr);
>>> +        index1 = pagetable_first_index(page_addr);
>>> +        index0 = pagetable_zeroeth_index(page_addr);
>>> +
>>> +        /* Setup level2 table */
>>> +        second[index2] = paddr_to_pte((unsigned long)first);
>>> +        second[index2].pte |= PTE_TABLE;
>>> +
>>> +        /* Setup level1 table */
>>> +        first[index1] = paddr_to_pte((unsigned long)zeroeth);
>>> +        first[index1].pte |= PTE_TABLE;
>>> +
>>> +        /* Setup level0 table */
>>> +        if ( !pte_is_valid(&zeroeth[index0]) )
>>
>> Can you explain why you are checking !pte_is_valid() for the L0 entry
>> but not the other?
> My mistake it should be checked for each level.

In which case, shouldn't you return an error if the entry is always valid?

>>
>>> +        {
>>> +            /* Update level0 table */
>>> +            zeroeth[index0] = paddr_to_pte((page_addr - map_start)
>>> + pa_start);
>>> +            zeroeth[index0].pte |= PTE_LEAF_DEFAULT;
>>> +            zeroeth[index0].pte &= ~((!writable) ? PTE_WRITABLE :
>>> 0);
>>
>> Looking at the default value, it would mean that a non-writable
>> mapping
>> is automatically executable. This seems wrong for the section is not
>> meant to be executable (like rodata).
> Yes, you are right. I'll reowrk setup_initial_mapping() to pass flags
> instead of write/read - only flag.
>>
>>> +        }
>>> +
>>> +        /* Point to next page */
>>> +        page_addr += ZEROETH_SIZE;
>>> +    }
>>> +}
>>> +
>>> +/*
>>> + * setup_initial_pagetables:
>>> + *
>>> + * 1) Build the page tables for Xen that map the following:
>>> + *   1.1)  The physical location of Xen (where the bootloader
>>> loaded it)
>>> + *   1.2)  The link-time location of Xen (where the linker
>>> expected Xen's
>>> + *         addresses to be)
>>> + * 2) Load the page table into the SATP and enable the MMU
>>> + */
>>> +void __attribute__((section(".entry")))
>>
>> I couldn't find a section ".entry" in the linker.
>>
>>> +setup_initial_pagetables(unsigned long load_addr_start,
>>> +                         unsigned long load_addr_end,
>>> +                         unsigned long linker_addr_start,
>>> +                         unsigned long linker_addr_end)
>>> +{
>>> +    pte_t *second;
>>> +    pte_t *first;
>>> +    pte_t *zeroeth;
>>> +
>>> +    clear_pagetables(load_addr_start, load_addr_end,
>>> +                     linker_addr_start, linker_addr_end);
>>> +
>>> +    /* Get the addresses where the page tables were loaded */
>>> +    second  = (pte_t *)load_addr(&xen_second_pagetable);
>>> +    first   = (pte_t *)load_addr(&xen_first_pagetable);
>>> +    zeroeth = (pte_t *)load_addr(&xen_zeroeth_pagetable);
>>
>> I would consider to embed the type cast in load_addr() so you are
>> adding
>> some type safety within your code.
> Definitely it will be better but setup_initial_mapping() uses 'unsigned
> long' for passing address that should be mapped.

One possibility would be to introduce a new wrapper for the typesafety. 
Anyway, it is not essential for now. Let's at least get the logic 
correct first :).

>>
>>> +
>>> +    /*
>>> +     * Create a mapping from Xen's link-time addresses to where
>>> they were actually loaded.
>>
>> This is line is way long than 80 characters. Please make sure to wrap
>> it
>> 80 characters.
>>
>>> +     */
>>> +    _setup_initial_pagetables(second, first, zeroeth,
>>> +                              linker_addr(&_stext),
>>> +                              linker_addr(&_etext),
>>> +                              load_addr(&_stext),
>>> +                              false);
>>> +    _setup_initial_pagetables(second, first, zeroeth,
>>> +                              linker_addr(&__init_begin),
>>> +                              linker_addr(&__init_end),
>>> +                              load_addr(&__init_begin),
>>> +                              true);
>>> +    _setup_initial_pagetables(second, first, zeroeth,
>>> +                              linker_addr(&_srodata),
>>> +                              linker_addr(&_erodata),
>>> +                              load_addr(&_srodata),
>>> +                              false);
>>> +    _setup_initial_pagetables(second, first, zeroeth,
>>> +                              linker_addr_start,
>>> +                              linker_addr_end,
>>> +                              load_addr_start,
>>> +                              true);
>>
>> Where do you guarantee that Xen will always fit in an L0 table and
>> the
>> start address is aligned to the size of an L0 table?
> I don't guarantee that it fit in an L0 table but the start address is
> aligned to the size of the L0 table at the start.
Then it should be fixed.

>>
>>> +
>>> +    /*
>>> +     * Create a mapping of the load time address range to... the
>>> load time address range.
>>
>> Same about the line length here.
>>
>>> +     * This mapping is used at boot time only.
>>> +     */
>>> +    _setup_initial_pagetables(second, first, zeroeth,
>>
>> This can only work if Xen is loaded at its linked address. So you
>> need a
>> separate set of L0, L1 tables for the identity mapping.
>>
>> That said, this would not be sufficient because:
>>     1) Xen may not be loaded at a 2M boundary (you can control with
>> U-boot, but not with EFI). So this may cross a boundary and therefore
>> need multiple pages.
>>     2) The load region may overlap the link address
>>
>> While I think it would be good to handle those cases from the start,
>> I
>> would understand why are not easy to solve. So I think the minimum is
>> to
>> throw some errors if you are in a case you can't support.
> Do you mean to throw some error in load_addr()/linkder_addr()?

In this case, I meant to check if load_addr != linker_addr, then throw 
an error.

Cheers,

-- 
Julien Grall

