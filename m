Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D48DD3BC9F7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 12:32:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151007.279131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0iMm-0006xC-Q7; Tue, 06 Jul 2021 10:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151007.279131; Tue, 06 Jul 2021 10:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0iMm-0006tG-Mq; Tue, 06 Jul 2021 10:31:48 +0000
Received: by outflank-mailman (input) for mailman id 151007;
 Tue, 06 Jul 2021 10:31:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m0iMk-0006tA-So
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 10:31:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0iMk-0006xj-Nb; Tue, 06 Jul 2021 10:31:46 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0iMk-0005i5-HS; Tue, 06 Jul 2021 10:31:46 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=u829M/p7D6gorvRKzHDQ7cVGvaLt5wIJ5XcJbKzPRVM=; b=Fyt+Y2k2Om/QOnebmzFccLEioq
	NLa4bA2BAnRujJwNtvznNMilddO+nEw6TANpS8nh6eBCRLqSeHd9jG0OzgZhkoL/ftWILhsPCGxX9
	dY7Ozhsk0JW/3jx9iAIxIGLutoCGMBM1ICp3UqVBPvOeVTunfr5jKTz+VJ5cqFhk27uo=;
Subject: Re: [PATCH 6/9] xen/arm: introduce alloc_staticmem_pages and
 alloc_domstatic_pages
To: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Penny Zheng <Penny.Zheng@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-7-penny.zheng@arm.com>
 <c31a85c3-89ea-76a4-3b29-a411d419fb59@suse.com>
 <VE1PR08MB5215E2802F3DE22F1F244023F71B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <caa11a54-acb6-928d-de3a-8e081a7c3d34@suse.com>
 <c6ab1b8d-1598-f7fc-f717-f58f8e0aba68@xen.org>
 <ea219d56-ea73-8904-ab47-421bd5c53a9f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <564b9851-4e3a-b98d-08a8-483c9ed83bb4@xen.org>
Date: Tue, 6 Jul 2021 11:31:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ea219d56-ea73-8904-ab47-421bd5c53a9f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 06/07/2021 10:59, Jan Beulich wrote:
> On 06.07.2021 11:39, Julien Grall wrote:
>> Hi Jan & Penny,
>>
>> On 06/07/2021 07:53, Jan Beulich wrote:
>>> On 06.07.2021 07:58, Penny Zheng wrote:
>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>> Sent: Thursday, June 10, 2021 6:23 PM
>>>>>
>>>>> On 07.06.2021 04:43, Penny Zheng wrote:
>>>>>> --- a/xen/common/page_alloc.c
>>>>>> +++ b/xen/common/page_alloc.c
>>>>>> @@ -1065,6 +1065,75 @@ static struct page_info *alloc_heap_pages(
>>>>>>        return pg;
>>>>>>    }
>>>>>>
>>>>>> +#ifdef CONFIG_STATIC_ALLOCATION
>>>>>> +/*
>>>>>> + * Allocate nr_mfns contiguous pages, starting at #smfn, of static memory.
>>>>>> + * It is the equivalent of alloc_heap_pages for static memory  */
>>>>>> +static struct page_info *alloc_staticmem_pages(unsigned long nr_mfns,
>>>>>> +                                               mfn_t smfn,
>>>>>> +                                               unsigned int memflags)
>>>>>> +{
>>>>>> +    bool need_tlbflush = false;
>>>>>> +    uint32_t tlbflush_timestamp = 0;
>>>>>> +    unsigned long i;
>>>>>> +    struct page_info *pg;
>>>>>> +
>>>>>> +    /* For now, it only supports allocating at specified address. */
>>>>>> +    if ( !mfn_valid(smfn) || !nr_mfns )
>>>>>> +    {
>>>>>> +        printk(XENLOG_ERR
>>>>>> +               "Invalid %lu static memory starting at %"PRI_mfn"\n",
>>>>>
>>>>> Reading a log containing e.g. "Invalid 0 static memory starting at ..." I don't
>>>>> think I would recognize that the "0" is the count of pages.
>>>>
>>>> Sure. How about "try to allocate out of range page %"PRI_mfn"\n"?
>>>
>>> This still doesn't convey _both_ parts of the if() that would cause
>>> the log message to be issued.
>>>
>>>>>> +               nr_mfns, mfn_x(smfn));
>>>>>> +        return NULL;
>>>>>> +    }
>>>>>> +    pg = mfn_to_page(smfn);
>>>>>> +
>>>>>> +    for ( i = 0; i < nr_mfns; i++ )
>>>>>> +    {
>>>>>> +        /*
>>>>>> +         * Reference count must continuously be zero for free pages
>>>>>> +         * of static memory(PGC_reserved).
>>>>>> +         */
>>>>>> +        ASSERT(pg[i].count_info & PGC_reserved);
>>>>>
>>>>> What logic elsewhere guarantees that this will hold? ASSERT()s are to verify
>>>>> that assumptions are met. But I don't think you can sensibly assume the caller
>>>>> knows the range is reserved (and free), or else you could get away without any
>>>>> allocation function.
>>>>
>>>> The caller shall only call alloc_staticmem_pages when it knows range is reserved,
>>>> like, alloc_staticmem_pages is only called in the context of alloc_domstatic_pages
>>>> for now.
>>>
>>> If the caller knows the static ranges, this isn't really "allocation".
>>> I.e. I then question the need for "allocating" in the first place.
>>
>> We still need to setup the page so the reference counting works
>> properly. So can you clarify whether you are objecting on the name? If
>> yes, do you have a better suggestion?
> 
> It's not the name alone but the disconnect between name and actual
> behavior. Note that here we've started from an ASSERT(), which is
> reasonable to have if the caller knows where static pages are, but
> which should be converted to an if() when talking about allocation
> (i.e. the caller may not have enough knowledge). If it's not really
> allocation, how about naming it "acquire" or "obtain" (and the
> config option perhaps STATIC_MEMORY)?

The caller will fetch the information from the Device Tree but it 
doesn't sanity check it. I think it can be easy to make mistake as the 
information will be scattered in various node of the DT.

So I think it would be better if we have a check in both prod and debug 
build to ease the integration.

Regarding the name itself, anyone of the one you suggested are fine with 
me because to me the difference between them is too subtle to be 
understood by most of the users.

Cheers,

-- 
Julien Grall

