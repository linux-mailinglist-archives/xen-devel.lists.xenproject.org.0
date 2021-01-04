Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DA72E9786
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 15:45:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61280.107681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwR64-0001H3-Dz; Mon, 04 Jan 2021 14:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61280.107681; Mon, 04 Jan 2021 14:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwR64-0001Ge-AC; Mon, 04 Jan 2021 14:44:36 +0000
Received: by outflank-mailman (input) for mailman id 61280;
 Mon, 04 Jan 2021 14:44:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwR62-0001GZ-Vo
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 14:44:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c524f25-e4ed-4cad-b325-a16a55ec0294;
 Mon, 04 Jan 2021 14:44:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A447ACBA;
 Mon,  4 Jan 2021 14:44:32 +0000 (UTC)
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
X-Inumbo-ID: 7c524f25-e4ed-4cad-b325-a16a55ec0294
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609771472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nxvf797BqsiGlAXHtyfbskLU9VIpW++nRTZwaucmmFM=;
	b=R2h44IuVlBqzWz8Eo4AWlhwKXPghQtecaBXFNem8K1jBBX4w//Q59s2jeydvmT6kF4V/Te
	0WB7S37HEpgTmw6fS0mB4zgruOtxYbcOccfZnu4WltQfKDgHB/WhhKaV0jEgd51G4FO9C5
	1q2lDPmvqJu2rqb9sI0cN0Er+X6YQ6M=
Subject: Re: [PATCH v2] gnttab: defer allocation of status frame tracking
 array
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <57dc915c-c373-5003-80f7-279dd300d571@suse.com>
 <bab2f11f-dd59-87fb-1311-2732a71543d0@xen.org>
 <9535c420-9fd7-a8e6-6efe-7494ef6611db@suse.com>
 <f82ddfe7-853d-ca15-2373-a38068f65ef7@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7dbb3b5a-1d7f-43e4-90b0-d731fa8f08c9@suse.com>
Date: Mon, 4 Jan 2021 15:44:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f82ddfe7-853d-ca15-2373-a38068f65ef7@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.01.2021 15:16, Julien Grall wrote:
> Hi Jan,
> 
> On 04/01/2021 13:37, Jan Beulich wrote:
>> On 24.12.2020 10:57, Julien Grall wrote:
>>> Hi Jan,
>>>
>>> On 23/12/2020 15:13, Jan Beulich wrote:
>>>> This array can be large when many grant frames are permitted; avoid
>>>> allocating it when it's not going to be used anyway, by doing this only
>>>> in gnttab_populate_status_frames().
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> v2: Defer allocation to when a domain actually switches to the v2 grant
>>>>       API.
>>>>
>>>> --- a/xen/common/grant_table.c
>>>> +++ b/xen/common/grant_table.c
>>>> @@ -1725,6 +1728,17 @@ gnttab_populate_status_frames(struct dom
>>>>        /* Make sure, prior version checks are architectural visible */
>>>>        block_speculation();
>>>>    
>>>> +    if ( gt->status == ZERO_BLOCK_PTR )
>>>> +    {
>>>> +        gt->status = xzalloc_array(grant_status_t *,
>>>> +                                   grant_to_status_frames(gt->max_grant_frames));
>>>> +        if ( !gt->status )
>>>> +        {
>>>> +            gt->status = ZERO_BLOCK_PTR;
>>>> +            return -ENOMEM;
>>>> +        }
>>>> +    }
>>>> +
>>>>        for ( i = nr_status_frames(gt); i < req_status_frames; i++ )
>>>>        {
>>>>            if ( (gt->status[i] = alloc_xenheap_page()) == NULL )
>>>> @@ -1745,18 +1759,23 @@ status_alloc_failed:
>>>>            free_xenheap_page(gt->status[i]);
>>>>            gt->status[i] = NULL;
>>>>        }
>>>> +    if ( !nr_status_frames(gt) )
>>>> +    {
>>>> +        xfree(gt->status);
>>>> +        gt->status = ZERO_BLOCK_PTR;
>>>> +    }
>>>>        return -ENOMEM;
>>>>    }
>>>>    
>>>>    static int
>>>>    gnttab_unpopulate_status_frames(struct domain *d, struct grant_table *gt)
>>>>    {
>>>> -    unsigned int i;
>>>> +    unsigned int i, n = nr_status_frames(gt);
>>>>    
>>>>        /* Make sure, prior version checks are architectural visible */
>>>>        block_speculation();
>>>>    
>>>> -    for ( i = 0; i < nr_status_frames(gt); i++ )
>>>> +    for ( i = 0; i < n; i++ )
>>>>        {
>>>>            struct page_info *pg = virt_to_page(gt->status[i]);
>>>>            gfn_t gfn = gnttab_get_frame_gfn(gt, true, i);
>>>> @@ -1811,12 +1830,12 @@ gnttab_unpopulate_status_frames(struct d
>>>>            page_set_owner(pg, NULL);
>>>>        }
>>>>    
>>>> -    for ( i = 0; i < nr_status_frames(gt); i++ )
>>>> -    {
>>>> -        free_xenheap_page(gt->status[i]);
>>>> -        gt->status[i] = NULL;
>>>> -    }
>>>>        gt->nr_status_frames = 0;
>>>> +    smp_wmb(); /* Just in case - all accesses should be under lock. */
>>>
>>> I think gt->status cannot be accessed locklessly. If a entity read
>>> gt->nr_status_frames != 0, then there is no promise the array will be
>>> accessible when trying to access it as it may have been freed.
>>
>> Yet the common principle of (pointer,count) pairs to describe arrays
>> to be updated / accessed in sequences guaranteeing a non-zero count
>> implies a valid pointer could as well be considered to apply here.
>> I.e. when freeing, at least in principle clearing count first would
>> be a sensible thing to do, wouldn't it?
> 
> I am not arguing on whether this is a sensible thing to do but how 
> someone else can make use of it. The common lockless pattern to access 
> the array would be checking the count and if it is not zero, then access 
> the array. Imagine the following:
> 
> CPU0 (free the array)       | CPU1 (access the array)
>                              |
>                              | if ( !gt->nr_status_frames )
> gt->nr_status_frames = 0;   |   return;
> smp_wmb();                  |
> gt->status = NULL;          |
>                              | smp_rmb();
>                              | access gt->status[X];
> 
> Without any lock (or refcounting), I can't see how the example above 
> would be safe.

Sure, I shouldn't have over-simplified. You can't guard against
a racing free this way. You can guard against an incomplete
allocation by setting count strictly after pointer. And the
natural order of freeing then is clearing count before freeing
pointer. I'll go and check that accesses indeed do all happen
under lock, and drop the barrier if so.

Jan

