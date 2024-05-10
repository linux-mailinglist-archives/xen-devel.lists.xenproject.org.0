Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4FD8C2BF7
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 23:38:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720078.1123060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5XwD-0004cu-BS; Fri, 10 May 2024 21:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720078.1123060; Fri, 10 May 2024 21:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5XwD-0004bO-8h; Fri, 10 May 2024 21:37:57 +0000
Received: by outflank-mailman (input) for mailman id 720078;
 Fri, 10 May 2024 21:37:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s5XwC-0004bI-1l
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 21:37:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5XwB-0007VM-Kc; Fri, 10 May 2024 21:37:55 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5XwB-0002CX-Ck; Fri, 10 May 2024 21:37:55 +0000
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
	bh=U1d9YXDaA9GQHUJ6ut9tZLYFSAMZ/8EBZ7ZZK6wdh2U=; b=2A3whaY+/dBpHNthoRv9gI9ITV
	kDGBA4L5Mg1f1TeQGkHYyu8mwcu2ZV4nK0GVtuCGR8P2JQqMpIMOw4u4c3Gjlza8qfLuQNLkXc4YT
	JfK83fga0kfh8v/1v+Mx1pddUAj8QgU8R7VWUkLjbHC1QYq3s0VuJGDs7XXZ43QhkuMw=;
Message-ID: <e1cf9c7c-581d-4bec-acaf-654d40b7ac07@xen.org>
Date: Fri, 10 May 2024 22:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] xen/p2m: put reference for superpage
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
 <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-4-luca.fancellu@arm.com>
 <b7d1d40b-c634-4830-aa4b-b0475bdff8fc@xen.org>
 <9F196831-D294-4227-B86F-E8EEACB5B076@arm.com>
 <0857d348-1305-40d2-9596-e0e5f4490c4a@xen.org>
 <64648f8c-3eea-47c5-bdc5-6d4fc6531c60@xen.org> <ZjyFxrvHJ04ZlBGg@macbook>
 <bd463f7a-eadf-441f-96e3-3a39f647f160@xen.org> <ZjyzTCOSeNvPq2Np@macbook>
 <37b842c7-c46e-4948-8139-a07bfc2a6f37@xen.org> <ZjzIWsoRmgmWkgGh@macbook>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZjzIWsoRmgmWkgGh@macbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 09/05/2024 13:58, Roger Pau Monné wrote:
> On Thu, May 09, 2024 at 01:12:00PM +0100, Julien Grall wrote:
>> Hi,
>>
>> On 09/05/2024 12:28, Roger Pau Monné wrote:
>>> On Thu, May 09, 2024 at 10:50:56AM +0100, Julien Grall wrote:
>>>>
>>>>
>>>> On 09/05/2024 09:13, Roger Pau Monné wrote:
>>>>> On Wed, May 08, 2024 at 11:11:04PM +0100, Julien Grall wrote:
>>>>> Also the interactions with the remote domain would need to be audited,
>>>>> as the remote domain shattering the superpage would need to be
>>>>> replicated in the mapping side in order to account for the changes.
>>>>
>>>> ... I don't understand this one. How is this different from today's where a
>>>> domain can foreign map a 2MB which may be using a superpage in the remote
>>>> domain?
>>>
>>> Hm, right, I was wrong with that I think, as long as proper references
>>> as taken for the superpage entries it should be fine.
>>>
>>>>>    Not sure all paths will be easy to
>>>>> audit for preemption if it's more than relinquish_p2m_mapping() that
>>>>> you need to adjust.
>>>>
>>>> I thought about it yesterday. But I came to the conclusion that if we have
>>>> any concern about removing 1GB foreign superpage then we would already have
>>>> the problem today as a domain can map contiguously 1GB worth of foreign
>>>> mapping using small pages.
>>>
>>> Yeah, but in that case addition or removal is done in 4K chunks, and
>>> hence we can preempt during the operation.
>>
>> I am not entirely sure how that would work. From my understand, today, most
>> of the users of the P2M code expects the operation to complete in one go and
>> if preemption is needed then the caller is responsible to handle it by
>> breaking up the happy.
>>
>> With your suggestion, it sounds like you want to rework how the preemption
>> today and push it to the P2M code. This would mean we would need to modify
>> all the callers to check for -EERESTART (or similar) and also tell them how
>> many pages were handled so the call can be restarted where it stopped. Is it
>> what you had in mind?
> 
> TBH, I didn't have a specific location in mind about where to do the
> split.
> 
> One solution that could simplify it is allowing foreign entries to
> only be removed by specific functions, so that the split required in
> order to do the removal can be handled by the caller knowing it's
> dealing with a foreign map superpage.

That would work. It would require quite a bit of work though.

> But that would require the superpage to be shattered, and hence will
> require creating lower levle leaf entries in order to do the
> shattering and the removal in 4K chunks.
> 
>> I don't expect the work to be trivial, so I wonder if this is really worth
>> it to try to change the way we preempt.
>>
>>>
>>> OTOH for 1GB given the code here the page could be freed in one go,
>>> without a chance of preempting the operation.
>>>
>>> Maybe you have to shatter superpages into 4K entries and then remove
>>> them individually, as to allow for preemption to be possible by
>>> calling put_page() for each 4K chunk?
>> This would require to allocate some pages from the P2M pool for the tables.
>> As the pool may be exhausted, it could be problematic when relinquishing the
>> resources.
> 
> Indeed, it's not ideal.
> 
>> It may be possible to find a way to have memory available by removing other
>> mappings first. But it feels a bit hackish and I would rather prefer if we
>> avoid allocating any memory when relinquishing.
> 
> Maybe it could be helpful to provide a function to put a superpage,
> that internally calls free_domheap_pages() with the appropriate order
> so that freeing a superpage only takes a single free_domheap_pages()
> call. 

Today, free_domheap_page() is only called when the last reference is 
removed. I don't thinkt here is any guarantee that all the references 
will dropped at the same time.

 >  That could reduce some of the contention around the heap_lock
 > and d->page_alloc_lock locks.

 From previous experience (when Hongyan and I worked on optimizing 
init_heap_pages() for Live-Update), the lock is actually not the biggest 
problem. The issue is adding the pages back to the heap (which may 
requiring merging). So as long as the pages are not freed contiguously, 
we may not gain anything.

Anyway, it sound like someone needs to spend some time investigating 
this issue.

> 
> Note also that a foreign unmap resulting in a page free is also not
> the common case, as that should only happen when the foreign domain
> has been destroyed, or the page ballooned out, so to benchmark the
> worst case some effort will be needed in order to model this
> scenario.

Good callout. It may be easier to reproduce it with some XTF tests. 
Unfortunately, I don't have the bandwith to look at it. Maybe Luca can?

Otherwise, we may have to accept not supporting 1GB superpage for the 
time being for shared memory. But I am not actually sure this is a big 
problem?

Cheers,

-- 
Julien Grall

