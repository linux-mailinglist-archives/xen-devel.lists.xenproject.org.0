Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C093B8FB9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:25:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148321.274113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lysw2-0008GG-C7; Thu, 01 Jul 2021 09:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148321.274113; Thu, 01 Jul 2021 09:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lysw2-0008Dt-8y; Thu, 01 Jul 2021 09:24:38 +0000
Received: by outflank-mailman (input) for mailman id 148321;
 Thu, 01 Jul 2021 09:24:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lysw1-0008Dl-1m
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:24:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lysw0-0001Az-RV; Thu, 01 Jul 2021 09:24:36 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lysw0-0004A1-LE; Thu, 01 Jul 2021 09:24:36 +0000
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
	bh=V9NFK2lNy9CaNbbZHIo9REyjCJIGDMiOwcehHQbUPIU=; b=jFn1yYam50B8QuzUsAepb1skS+
	FvcJMKbPvhzP4wFrcqzal3j51OvEnH8fruVbz6eYAVf0TxbVMXJo9cgBt4hAgwOl4tuaYMZDUchM9
	gxBqH4IvW8MFH5frsJx6zOXsH5BMEpeAo5lsnT5fWh4CIRXVLUf4FRs3m3sTmEpXGbyQ=;
Subject: Re: [PATCH 5/9] xen: introduce assign_pages_nr
To: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Penny Zheng <penny.zheng@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-6-penny.zheng@arm.com>
 <41a7389b-630c-6cf4-fa28-7d80cb79176b@suse.com>
 <e7e89abb-1601-0cdf-71d2-c22af86057c4@xen.org>
 <dab3331b-f3b9-4318-bf43-9f994c7d1121@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b7220a85-6eec-278f-8b1d-d474470406a6@xen.org>
Date: Thu, 1 Jul 2021 10:24:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dab3331b-f3b9-4318-bf43-9f994c7d1121@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/07/2021 09:26, Jan Beulich wrote:
> On 30.06.2021 20:29, Julien Grall wrote:
>> On 10/06/2021 10:49, Jan Beulich wrote:
>>> On 07.06.2021 04:43, Penny Zheng wrote:
>>>> Introduce new interface assign_pages_nr to deal with when page number is
>>>> not in a power-of-two, which will save the trouble each time user needs
>>>> to split the size in a power of 2 to use assign_pages.
>>>
>>> First of all I still don't see why in this one special case it is a
>>> meaningful burden to do the count-to-order conversion in the caller you
>>> mean to add,
>>
>> This sort of works for one caller. However, I would expect some more
>> user in the future (we use it for Live-Update).
>>
>>> and hence why we really need this new function (to keep it
>>> simple, you could even have the caller not break down to arbitrary
>>> power-of-2 chunks, but simply iterate over all individual [order-0]
>>> pages).
>>
>> The function assign_pages() will always use 1U << order (and sadly 1 <<
>> order). So we would end up to convert the count in multiple order for
>> then directly converting back to a number. To me, this sounds rather
>> pointless...
>>
>> There are also a slight benefits to call assign_pages() a single time
>> during boot because it will reduce the number of time we need to
>> lock/unlock d->page_alloc_lock.
> 
> Well, all of this is why I did add ...
> 
>>> The more that I'm not happy with the chosen name, despite it
>>> having been suggested during v1 review. _If_ we needed two functions,
>>> imo they ought to be named assign_page() (dealing with a single page of
>>> the given order) and assign_pages(). Backporting confusion could be
>>> helped by altering the order of parameters, such that the compiler
>>> would point out that adjustments at call sites are needed.
> 
> ... this. 

Oh, it wasn't entirely clear whether you were objecting of offering the 
possibility to pass a number of pages rather than an order.

> Not sure whether you not commenting on it means you agree
> with the proposal.

Yes I am happy with your proposal.

> 
>>>> --- a/xen/common/page_alloc.c
>>>> +++ b/xen/common/page_alloc.c
>>>> @@ -2301,14 +2301,14 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
>>>>    }
>>>>    
>>>>    
>>>> -int assign_pages(
>>>> +int assign_pages_nr(
>>>>        struct domain *d,
>>>>        struct page_info *pg,
>>>> -    unsigned int order,
>>>> +    unsigned int nr_pfns,
>>>
>>> Even leaving the naming aspect of "pfns" aside, I can't see why this
>>> can't be simply "nr" (of appropriate type, see next remark).
>>>
>>>>        unsigned int memflags)
>>>>    {
>>>>        int rc = 0;
>>>> -    unsigned long i;
>>>> +    unsigned int i;
>>>
>>> This is not an acceptable type change, at least not as long as it's not
>>> justified at all in the description. While both Arm and x86 will be
>>> fine this way, the code here is supposed to be generic, and hence would
>>> better remain generally correct.
>>
>> I would like to point out the code is already not correct as we are
>> using 1U << order or worse 1 << order :).
> 
> Indeed there are improvements (towards being consistent) to be made. But
> this is not an excuse to make things worse here. At least one of the two
> loops already properly uses 1ul; sadly that's only debugging code. And
> of course something like domain_tot_pages() (and the underlying field)
> dealing with "unsigned int" doesn't help consistency either. As it stands
> we're limiting ourselves to 8Tb VMs, as it seems, and for no good reason.

I actually have a patch in my queue that hardens assign_pages(). I will 
aim to send it later today.

Cheers,

-- 
Julien Grall

