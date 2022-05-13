Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C66B525EA7
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 11:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328310.551310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npRTF-0000gO-Lh; Fri, 13 May 2022 09:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328310.551310; Fri, 13 May 2022 09:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npRTF-0000eM-H7; Fri, 13 May 2022 09:20:25 +0000
Received: by outflank-mailman (input) for mailman id 328310;
 Fri, 13 May 2022 09:20:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1npRTE-0000eG-KY
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 09:20:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npRTE-00049p-D1; Fri, 13 May 2022 09:20:24 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.8.158]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npRTE-0001bV-6s; Fri, 13 May 2022 09:20:24 +0000
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
	bh=ogGkrUlV54a47cqNz5EA2FF+ojxeOuJth8TYpd9x6HY=; b=mC2nN19LVhvl5gAlEc+QYS0gm3
	kUjKhJPGFUcsUntRt9b8S61098DbatsAF0Jao4NFqEt160S6mB/dVBaeBeqqJJ09ouEK6MpxLPwFE
	WZWtDAeHP/hyp3hXGC7XrqScUQ+GONgm2ng7eLl9VhL8VMak73z7zboznEeRnwiW4A6k=;
Message-ID: <82da0dc0-c5e3-c480-0ec2-c5df269dbe3e@xen.org>
Date: Fri, 13 May 2022 10:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 4/8] xen/arm: introduce put_page_nr and get_page_nr
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220512091129.2802997-1-Penny.Zheng@arm.com>
 <20220512091129.2802997-5-Penny.Zheng@arm.com>
 <47b4d6c2-3bc7-02bc-be5a-a2b782541c3c@xen.org>
 <DU2PR08MB73258BDEB855D72AF0D0875FF7CA9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB73258BDEB855D72AF0D0875FF7CA9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2022 03:22, Penny Zheng wrote:
> Hi Julien

Hi Penny,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Thursday, May 12, 2022 6:14 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v3 4/8] xen/arm: introduce put_page_nr and get_page_nr
>>
>>
>>
>> On 12/05/2022 10:11, Penny Zheng wrote:
>>> Later, we need to add the right amount of references, which should be
>>> the number of borrower domains, to the owner domain. Since we only
>>> have
>>> get_page() to increment the page reference by 1, a loop is needed per
>>> page, which is inefficient and time-consuming.
>>>
>>> To save the loop time, this commit introduces a set of new helpers
>>> put_page_nr() and get_page_nr() to increment/drop the page reference by
>> nr.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>> v3 changes:
>>> - check overflow with "n"
>>> - remove spurious change
>>> - bring back the check that we enter the loop only when count_info is
>>> greater than 0
>>> ---
>>> v2 change:
>>> - new commit
>>> ---
>>>    xen/arch/arm/include/asm/mm.h |  4 ++++
>>>    xen/arch/arm/mm.c             | 36 ++++++++++++++++++++++++++---------
>>>    2 files changed, 31 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/include/asm/mm.h
>>> b/xen/arch/arm/include/asm/mm.h index 424aaf2823..c737d51e4d 100644
>>> --- a/xen/arch/arm/include/asm/mm.h
>>> +++ b/xen/arch/arm/include/asm/mm.h
>>> @@ -347,6 +347,10 @@ void free_init_memory(void);
>>>    int guest_physmap_mark_populate_on_demand(struct domain *d,
>> unsigned long gfn,
>>>                                              unsigned int order);
>>>
>>> +extern bool get_page_nr(struct page_info *page, const struct domain
>> *domain,
>>> +                        unsigned long nr); extern void
>>> +put_page_nr(struct page_info *page, unsigned long nr);
>>> +
>>>    extern void put_page_type(struct page_info *page);
>>>    static inline void put_page_and_type(struct page_info *page)
>>>    {
>>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c index
>>> 7b1f2f4906..a9461e07aa 100644
>>> --- a/xen/arch/arm/mm.c
>>> +++ b/xen/arch/arm/mm.c
>>> @@ -1537,7 +1537,8 @@ long arch_memory_op(int op,
>> XEN_GUEST_HANDLE_PARAM(void) arg)
>>>        return 0;
>>>    }
>>>
>>> -struct domain *page_get_owner_and_reference(struct page_info *page)
>>> +static struct domain *page_get_owner_and_nr_reference(struct page_info
>> *page,
>>> +                                                      unsigned long
>>> +nr)
>>>    {
>>>        unsigned long x, y = page->count_info;
>>>        struct domain *owner;
>>> @@ -1548,10 +1549,10 @@ struct domain
>> *page_get_owner_and_reference(struct page_info *page)
>>>             * Count ==  0: Page is not allocated, so we cannot take a reference.
>>>             * Count == -1: Reference count would wrap, which is invalid.
>>>             */
>>> -        if ( unlikely(((x + 1) & PGC_count_mask) <= 1) )
>>> +        if ( unlikely(((x + nr) & PGC_count_mask) <= 1) )
>>
>> This check looks wrong to me. You want to make sure that the right equation
>> return is at least equal to n otherwise.
>>
> 
> Right, right, I haven't considered thoroughly! A thousand thanks for the following
> detailed explanation~
> 
>> Furthermore, I think we need to restrict 'nr' to PGC_count_mask to fully catch
>> any overflow.
>>
>> Before the loop, the code would look like:
>>
>> /* Restrict nr to avoid "double" overflow */ if ( nr >= PGC_count_mask ) {
>>       ASSERT_UNREACHABLE();
>>       return NULL;
>> }
>>
>> The check in the loop would look like:
>>
>> if ( unlikely((x + nr) & PGC_count_mask) <= n )
>>
>> That said, it might be easier to read the overflow check if we do:
>>
>> count = x & PGC_count_mask;
>> if ( !count || ((PGC_count_mask - count) <= n) )
>>
>> I haven't measured and check which of the two options would result to better
>> code and performance (get_page() is often called).
>>
> 
> Correct me if I understand wrongly:
> IMO, only option two is actually catching any overflow? Let (PGC_count_mask - count) <= nr
> stay in the loop, not before the loop like option 1, to cover the changeable page->count_info.
Both option should catch the overflow. In option 1, this was 2 part check:


if ( nr >= PGC_count_mask )
   ...

do
{
    if ( unlikely((x + nr) & PGC_count_mask <= n )
       return NULL;
    ...
} while (...);

Cheers,

-- 
Julien Grall

