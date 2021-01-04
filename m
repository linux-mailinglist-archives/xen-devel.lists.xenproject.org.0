Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5512E9625
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 14:38:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61209.107487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQ3M-00024l-Ur; Mon, 04 Jan 2021 13:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61209.107487; Mon, 04 Jan 2021 13:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQ3M-00024M-Rn; Mon, 04 Jan 2021 13:37:44 +0000
Received: by outflank-mailman (input) for mailman id 61209;
 Mon, 04 Jan 2021 13:37:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwQ3L-00024H-Tr
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 13:37:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a231363-4380-4056-a5b7-051fe40578a3;
 Mon, 04 Jan 2021 13:37:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 360F9B768;
 Mon,  4 Jan 2021 13:37:37 +0000 (UTC)
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
X-Inumbo-ID: 5a231363-4380-4056-a5b7-051fe40578a3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609767457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pHCG2PYGrENryepFWf4AkoGA8ic6FQ1pPGTihpGPL3c=;
	b=dQu00RUPyWwIIdQUKOlIS7vbWTXUldzWbN3p/WezzDC/+ZN0rkI0L+XlnNHmhoLMbCf/2i
	zP9DKYbdBaOArBKlgCE4aodIMH4Zj/aZM4+uZVaXljFEZM9hVE6bWt+doeVv5dvSD3cavD
	kgfAiScEBZ8PhmrfXflhDSsiX52mxb4=
Subject: Re: [PATCH v2] gnttab: defer allocation of status frame tracking
 array
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <57dc915c-c373-5003-80f7-279dd300d571@suse.com>
 <bab2f11f-dd59-87fb-1311-2732a71543d0@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9535c420-9fd7-a8e6-6efe-7494ef6611db@suse.com>
Date: Mon, 4 Jan 2021 14:37:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <bab2f11f-dd59-87fb-1311-2732a71543d0@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.12.2020 10:57, Julien Grall wrote:
> Hi Jan,
> 
> On 23/12/2020 15:13, Jan Beulich wrote:
>> This array can be large when many grant frames are permitted; avoid
>> allocating it when it's not going to be used anyway, by doing this only
>> in gnttab_populate_status_frames().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Defer allocation to when a domain actually switches to the v2 grant
>>      API.
>>
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -1725,6 +1728,17 @@ gnttab_populate_status_frames(struct dom
>>       /* Make sure, prior version checks are architectural visible */
>>       block_speculation();
>>   
>> +    if ( gt->status == ZERO_BLOCK_PTR )
>> +    {
>> +        gt->status = xzalloc_array(grant_status_t *,
>> +                                   grant_to_status_frames(gt->max_grant_frames));
>> +        if ( !gt->status )
>> +        {
>> +            gt->status = ZERO_BLOCK_PTR;
>> +            return -ENOMEM;
>> +        }
>> +    }
>> +
>>       for ( i = nr_status_frames(gt); i < req_status_frames; i++ )
>>       {
>>           if ( (gt->status[i] = alloc_xenheap_page()) == NULL )
>> @@ -1745,18 +1759,23 @@ status_alloc_failed:
>>           free_xenheap_page(gt->status[i]);
>>           gt->status[i] = NULL;
>>       }
>> +    if ( !nr_status_frames(gt) )
>> +    {
>> +        xfree(gt->status);
>> +        gt->status = ZERO_BLOCK_PTR;
>> +    }
>>       return -ENOMEM;
>>   }
>>   
>>   static int
>>   gnttab_unpopulate_status_frames(struct domain *d, struct grant_table *gt)
>>   {
>> -    unsigned int i;
>> +    unsigned int i, n = nr_status_frames(gt);
>>   
>>       /* Make sure, prior version checks are architectural visible */
>>       block_speculation();
>>   
>> -    for ( i = 0; i < nr_status_frames(gt); i++ )
>> +    for ( i = 0; i < n; i++ )
>>       {
>>           struct page_info *pg = virt_to_page(gt->status[i]);
>>           gfn_t gfn = gnttab_get_frame_gfn(gt, true, i);
>> @@ -1811,12 +1830,12 @@ gnttab_unpopulate_status_frames(struct d
>>           page_set_owner(pg, NULL);
>>       }
>>   
>> -    for ( i = 0; i < nr_status_frames(gt); i++ )
>> -    {
>> -        free_xenheap_page(gt->status[i]);
>> -        gt->status[i] = NULL;
>> -    }
>>       gt->nr_status_frames = 0;
>> +    smp_wmb(); /* Just in case - all accesses should be under lock. */
> 
> I think gt->status cannot be accessed locklessly. If a entity read 
> gt->nr_status_frames != 0, then there is no promise the array will be 
> accessible when trying to access it as it may have been freed.

Yet the common principle of (pointer,count) pairs to describe arrays
to be updated / accessed in sequences guaranteeing a non-zero count
implies a valid pointer could as well be considered to apply here.
I.e. when freeing, at least in principle clearing count first would
be a sensible thing to do, wouldn't it? Subsequently allocation and
consumers could be updated to follow suit ...

> So I would drop the barrier here.

I certainly can (unless double checking would tell me otherwise),
but I'm not convinced this is a good idea. I'd rather have a barrier
too many in the code than one too little, even if the "too little"
may only be the result of a future change. And this isn't a path
where performance considerations would suggest avoiding barriers
when they're not strictly needed.

Jan

