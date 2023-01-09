Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBFE66224F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 11:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473471.734099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEoyE-0007GA-EC; Mon, 09 Jan 2023 10:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473471.734099; Mon, 09 Jan 2023 10:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEoyE-0007EG-BJ; Mon, 09 Jan 2023 10:01:34 +0000
Received: by outflank-mailman (input) for mailman id 473471;
 Mon, 09 Jan 2023 10:01:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEoyC-0007EA-Ar
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 10:01:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEoyB-0001fy-Vb; Mon, 09 Jan 2023 10:01:31 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.1.158]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEoyB-0002YM-Pm; Mon, 09 Jan 2023 10:01:31 +0000
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
	bh=dfINzAzh++LGzgBuhBGmyhM9SrR6FkgJApXtlpHnQNU=; b=vqWeODwC/lqjLuIrPBOXCv02it
	AGBEd0fi/1DEqgKSbdplhKfHBjegu0UKjZRPkUuWzQvWkqgjn5W1sjINC249sDUXKAif//x0fa1E6
	xx6CINl1qff8tE0fCbPM1phqFqkZwmJz2v0D/madtDe8uF7KTBqpCfYwrz7EqJSl6dJs=;
Message-ID: <1ff6107c-bcfe-353a-04ed-b429ac65a81d@xen.org>
Date: Mon, 9 Jan 2023 10:01:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 01/13] xen/arm: re-arrange the static shared memory
 region
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-2-Penny.Zheng@arm.com>
 <dd5b93c3-51d1-40ad-88b4-5bbd54633651@xen.org>
 <AM0PR08MB4530A8EA76480621255CEFC9F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB4530A8EA76480621255CEFC9F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Penny,

On 09/01/2023 07:48, Penny Zheng wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Sunday, January 8, 2023 7:44 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v1 01/13] xen/arm: re-arrange the static shared memory
>> region
>> On 15/11/2022 02:52, Penny Zheng wrote:
>>> This commit re-arranges the static shared memory regions into a
>>> separate array shm_meminfo. And static shared memory region now
>> would
>>> have its own structure 'shm_membank' to hold all shm-related members,
>>> like shm_id, etc, and a pointer to the normal memory bank 'membank'.
>>> This will avoid continuing to grow 'membank'.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>>    xen/arch/arm/bootfdt.c            | 40 +++++++++++++++++++------------
>>>    xen/arch/arm/domain_build.c       | 35 ++++++++++++++++-----------
>>>    xen/arch/arm/include/asm/kernel.h |  2 +-
>>>    xen/arch/arm/include/asm/setup.h  | 16 +++++++++----
>>>    4 files changed, 59 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c index
>>> 6014c0f852..ccf281cd37 100644
>>> --- a/xen/arch/arm/bootfdt.c
>>> +++ b/xen/arch/arm/bootfdt.c
>>> @@ -384,6 +384,7 @@ static int __init process_shm_node(const void *fdt,
>> int node,
>>>        const __be32 *cell;
>>>        paddr_t paddr, gaddr, size;
>>>        struct meminfo *mem = &bootinfo.reserved_mem;
>>
>> After this patch, 'mem' is barely going to be used. So I would recommend to
>> remove it or restrict the scope.
>>
> 
> Hope I understand correctly, you are saying that all static shared memory bank will be
> described as "struct shm_membank". That's right.
> However when host address is provided, we still need an instance of "struct membank"
> to refer to in "bootinfo.reserved_mem". Only in this way, it could be initialized properly in
> as static pages.
> That's why I put a "struct membank*" pointer in "struct shm_membank" to refer to the
> same object.

I wasn't talking about the field in "struct shm_membank". Instead, I was 
referring to the local variable:

struct meminfo *mem = &bootinfo.reserved_mem;

AFAICT, the only use after this patch is when you add a new bank in 
shm_mem. So you could restrict the scope of the local variable.

> If I removed instance in bootinfo.reserved_mem, a few more path needs to be updated, like
> Init_staticmem_pages, dt_unreserved_regions, etc
>   
>> This will make easier to confirm that most of the use of 'mem' have been
>> replaced with 'shm_mem' and reduce the risk of confusion between the two
>> (the name are quite similar).
>>
>> [...]
>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index bd30d3798c..c0fd13f6ed 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -757,20 +757,20 @@ static int __init
>> acquire_nr_borrower_domain(struct domain *d,
>>>    {
>>>        unsigned int bank;
>>>
>>> -    /* Iterate reserved memory to find requested shm bank. */
>>> -    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
>>> +    /* Iterate static shared memory to find requested shm bank. */
>>> +    for ( bank = 0 ; bank < bootinfo.shm_mem.nr_banks; bank++ )
>>>        {
>>> -        paddr_t bank_start = bootinfo.reserved_mem.bank[bank].start;
>>> -        paddr_t bank_size = bootinfo.reserved_mem.bank[bank].size;
>>> +        paddr_t bank_start = bootinfo.shm_mem.bank[bank].membank-
>>> start;
>>> +        paddr_t bank_size =
>>> + bootinfo.shm_mem.bank[bank].membank->size;
>>
>> I was expecting a "if (type == MEMBANK_STATIC_DOMAIN) ..."  to be
>> removed. But it looks like there was none. I guess that was a mistake in the
>> existing code?
>>
> 
> Oh, you're right, the type shall also be checked.

Just to clarify, with this patch you don't need to check the type. I was 
pointing out a latent error in the existing code.

> 
>>>
>>>            if ( (pbase == bank_start) && (psize == bank_size) )
>>>                break;
>>>        }
>>>
>>> -    if ( bank == bootinfo.reserved_mem.nr_banks )
>>> +    if ( bank == bootinfo.shm_mem.nr_banks )
>>>            return -ENOENT;
>>>
>>> -    *nr_borrowers =
>> bootinfo.reserved_mem.bank[bank].nr_shm_borrowers;
>>> +    *nr_borrowers = bootinfo.shm_mem.bank[bank].nr_shm_borrowers;
>>>
>>>        return 0;
>>>    }
>>> @@ -907,11 +907,18 @@ static int __init
>> append_shm_bank_to_domain(struct kernel_info *kinfo,
>>>                                                paddr_t start, paddr_t size,
>>>                                                const char *shm_id)
>>>    {
>>> +    struct membank *membank;
>>> +
>>>        if ( kinfo->shm_mem.nr_banks >= NR_MEM_BANKS )
>>>            return -ENOMEM;
>>>
>>> -    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start = start;
>>> -    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size = size;
>>> +    membank = xmalloc_bytes(sizeof(struct membank));
>>
>> You allocate memory but never free it. However, I think it would be better to
>> avoid the dynamic allocation. So I would consider to not use the structure
>> shm_membank and instead create a specific one for the domain construction.
>>
> 
> True, a local variable "struct meminfo shm_banks" could be introduced only
> for domain construction in function construct_domU

Hmmm... I didn't suggest to introduce a local variable. I would still 
much prefer if we keep using 'kinfo' because we keep all the domain 
building information in one place.

So ``struct meninfo`` should want to be defined in ``kinfo``.

Cheers,

-- 
Julien Grall

