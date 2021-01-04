Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D932E96F9
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 15:16:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61249.107603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQet-0006V6-LU; Mon, 04 Jan 2021 14:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61249.107603; Mon, 04 Jan 2021 14:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQet-0006Uh-HL; Mon, 04 Jan 2021 14:16:31 +0000
Received: by outflank-mailman (input) for mailman id 61249;
 Mon, 04 Jan 2021 14:16:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kwQes-0006Uc-5i
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 14:16:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwQer-0002mg-7G; Mon, 04 Jan 2021 14:16:29 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwQeq-0006kD-Q7; Mon, 04 Jan 2021 14:16:29 +0000
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
	bh=IFJPZ05VyqgZggTViO+zJ7JQRG6rpH4gkSXBKwWeIY8=; b=jbg3uBmPIVolDqw8pGhAxuFxuk
	UqfgJ2AwhIPIVRfDV+545BrR1rowiqabZQGtM7DmmChceX5MztMVHtLomyxD9FPPJOCHsc77wzjAH
	pSVw82CDptFwBVS3bDsjeHbsr8fPbFhFMf6quiXGksUTrS3zvSnjfGEAMoP3xQJB8djE=;
Subject: Re: [PATCH v2] gnttab: defer allocation of status frame tracking
 array
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <57dc915c-c373-5003-80f7-279dd300d571@suse.com>
 <bab2f11f-dd59-87fb-1311-2732a71543d0@xen.org>
 <9535c420-9fd7-a8e6-6efe-7494ef6611db@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f82ddfe7-853d-ca15-2373-a38068f65ef7@xen.org>
Date: Mon, 4 Jan 2021 14:16:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9535c420-9fd7-a8e6-6efe-7494ef6611db@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 04/01/2021 13:37, Jan Beulich wrote:
> On 24.12.2020 10:57, Julien Grall wrote:
>> Hi Jan,
>>
>> On 23/12/2020 15:13, Jan Beulich wrote:
>>> This array can be large when many grant frames are permitted; avoid
>>> allocating it when it's not going to be used anyway, by doing this only
>>> in gnttab_populate_status_frames().
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> v2: Defer allocation to when a domain actually switches to the v2 grant
>>>       API.
>>>
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -1725,6 +1728,17 @@ gnttab_populate_status_frames(struct dom
>>>        /* Make sure, prior version checks are architectural visible */
>>>        block_speculation();
>>>    
>>> +    if ( gt->status == ZERO_BLOCK_PTR )
>>> +    {
>>> +        gt->status = xzalloc_array(grant_status_t *,
>>> +                                   grant_to_status_frames(gt->max_grant_frames));
>>> +        if ( !gt->status )
>>> +        {
>>> +            gt->status = ZERO_BLOCK_PTR;
>>> +            return -ENOMEM;
>>> +        }
>>> +    }
>>> +
>>>        for ( i = nr_status_frames(gt); i < req_status_frames; i++ )
>>>        {
>>>            if ( (gt->status[i] = alloc_xenheap_page()) == NULL )
>>> @@ -1745,18 +1759,23 @@ status_alloc_failed:
>>>            free_xenheap_page(gt->status[i]);
>>>            gt->status[i] = NULL;
>>>        }
>>> +    if ( !nr_status_frames(gt) )
>>> +    {
>>> +        xfree(gt->status);
>>> +        gt->status = ZERO_BLOCK_PTR;
>>> +    }
>>>        return -ENOMEM;
>>>    }
>>>    
>>>    static int
>>>    gnttab_unpopulate_status_frames(struct domain *d, struct grant_table *gt)
>>>    {
>>> -    unsigned int i;
>>> +    unsigned int i, n = nr_status_frames(gt);
>>>    
>>>        /* Make sure, prior version checks are architectural visible */
>>>        block_speculation();
>>>    
>>> -    for ( i = 0; i < nr_status_frames(gt); i++ )
>>> +    for ( i = 0; i < n; i++ )
>>>        {
>>>            struct page_info *pg = virt_to_page(gt->status[i]);
>>>            gfn_t gfn = gnttab_get_frame_gfn(gt, true, i);
>>> @@ -1811,12 +1830,12 @@ gnttab_unpopulate_status_frames(struct d
>>>            page_set_owner(pg, NULL);
>>>        }
>>>    
>>> -    for ( i = 0; i < nr_status_frames(gt); i++ )
>>> -    {
>>> -        free_xenheap_page(gt->status[i]);
>>> -        gt->status[i] = NULL;
>>> -    }
>>>        gt->nr_status_frames = 0;
>>> +    smp_wmb(); /* Just in case - all accesses should be under lock. */
>>
>> I think gt->status cannot be accessed locklessly. If a entity read
>> gt->nr_status_frames != 0, then there is no promise the array will be
>> accessible when trying to access it as it may have been freed.
> 
> Yet the common principle of (pointer,count) pairs to describe arrays
> to be updated / accessed in sequences guaranteeing a non-zero count
> implies a valid pointer could as well be considered to apply here.
> I.e. when freeing, at least in principle clearing count first would
> be a sensible thing to do, wouldn't it?

I am not arguing on whether this is a sensible thing to do but how 
someone else can make use of it. The common lockless pattern to access 
the array would be checking the count and if it is not zero, then access 
the array. Imagine the following:

CPU0 (free the array)       | CPU1 (access the array)
                             |
                             | if ( !gt->nr_status_frames )
gt->nr_status_frames = 0;   |   return;
smp_wmb();                  |
gt->status = NULL;          |
                             | smp_rmb();
                             | access gt->status[X];

Without any lock (or refcounting), I can't see how the example above 
would be safe.

> Subsequently allocation and
> consumers could be updated to follow suit ...
The allocation and free cannot happen locklessly (at least in the 
current state). For the consumers see above.

> 
>> So I would drop the barrier here.
> 
> I certainly can (unless double checking would tell me otherwise),
> but I'm not convinced this is a good idea. I'd rather have a barrier
> too many in the code than one too little, even if the "too little"
> may only be the result of a future change.

Future-proof code is always good to have. However, we need to avoid 
adding barriers that doesn't seem to usuable either today or in the future.

Your in-code comment suggests the barrier would help when the array is 
access without any lock. However, I can't see how this hypothetical code 
would work. Can you provide an example how you can deal with memory 
freed behind your back?

> And this isn't a path
> where performance considerations would suggest avoiding barriers
> when they're not strictly needed.

I am not concerned about the performance here.

Cheers,

-- 
Julien Grall

