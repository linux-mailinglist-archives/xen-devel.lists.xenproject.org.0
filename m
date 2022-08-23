Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD9559D326
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 10:15:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391731.629672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQP3a-0001m1-Td; Tue, 23 Aug 2022 08:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391731.629672; Tue, 23 Aug 2022 08:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQP3a-0001k1-Pq; Tue, 23 Aug 2022 08:14:42 +0000
Received: by outflank-mailman (input) for mailman id 391731;
 Tue, 23 Aug 2022 08:14:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQP3Z-0001jv-EK
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 08:14:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQP3V-0006bf-Fx; Tue, 23 Aug 2022 08:14:37 +0000
Received: from [54.239.6.189] (helo=[192.168.28.231])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQP3V-0003h3-9C; Tue, 23 Aug 2022 08:14:37 +0000
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
	bh=92yfh7FuRWCaWU02OkdHOpM8+LQT0WySM1CGNVI1f0U=; b=ZcHMdEGVl2oB9+HRybrkBzsH1y
	4HE9r/471qC+7gWj/vbCWtjdt+ygOc7k26KCo89Eswa5aRSGhr4gwTYJVmbM3SPf1HAbIAeyghQJy
	/k8GiIMt7efrqj8EngUdNDjNpKxFuED4jn3lJ+oLdWFytX6E5eLH6R2LoQ75o1iMNJhU=;
Message-ID: <9478285a-2a8a-de07-d6bc-4d9e043b7ccf@xen.org>
Date: Tue, 23 Aug 2022 09:14:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v2 1/7] xen/evtchn: Make sure all buckets below
 d->valid_evtchns are allocated
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1660902588.git.rahul.singh@arm.com>
 <710e9e6477270212136d6f2047fd15a033fa7d71.1660902588.git.rahul.singh@arm.com>
 <90ea98d7-58f1-4808-b691-c3a773a0476d@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <90ea98d7-58f1-4808-b691-c3a773a0476d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 22/08/2022 14:08, Jan Beulich wrote:
> On 19.08.2022 12:02, Rahul Singh wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Since commit 01280dc19cf3 "evtchn: simplify port_is_valid()", the event
>> channels code assumes that all the buckets below d->valid_evtchns are
>> always allocated.
>>
>> This assumption hold in most of the situation because a guest is not
>> allowed to chose the port. Instead, it will be the first free from port
>> 0.
>>
>> When using Guest Transparent Migration and LiveUpdate, we will only
>> preserve ports that are currently in use. As a guest can open/close
>> event channels, this means the ports may be sparse.
>>
>> The existing implementation of evtchn_allocate_port() is not able to
>> deal with such situation and will end up to override bucket or/and leave
>> some bucket unallocated. The latter will result to a droplet crash if
>> the event channel belongs to an unallocated bucket.
>>
>> This can be solved by making sure that all the buckets below
>> d->valid_evtchns are allocated. There should be no impact for most of
>> the situation but LM/LU as only one bucket would be allocated. For
>> LM/LU, we may end up to allocate multiple buckets if ports in use are
>> sparse.
>>
>> A potential alternative is to check that the bucket is valid in
>> is_port_valid(). This should still possible to do it without taking
>> per-domain lock but will result a couple more of memory access.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> 
> While I'm mostly okay with the code, I think the description wants
> changing / amending as long as the features talked about above aren't
> anywhere near reaching upstream (afaict), to at least _also_ mention
> the goal you have with this.

Correct, neither Guest Transparent Migration nor Live-Update is going to 
reach Xen in 4.17 :). Also, if we decide to continue to mention it, then
we would need to s/Guest Transparent Migration/non-cooperative 
migration/ to match the name we decided to use in upstream (see 
docs/designs/non-cooperative-migration.md).

> 
>> Changes in v2:
>>   - new patch in this version to fix the security issue
> 
> I guess you mean "avoid", not "fix".
> 
>> @@ -207,30 +216,35 @@ int evtchn_allocate_port(struct domain *d, evtchn_port_t port)
>>       }
>>       else
>>       {
>> -        struct evtchn *chn;
>> -        struct evtchn **grp;
>> -
>> -        if ( !group_from_port(d, port) )
>> +        do
>>           {
>> -            grp = xzalloc_array(struct evtchn *, BUCKETS_PER_GROUP);
>> -            if ( !grp )
>> -                return -ENOMEM;
>> -            group_from_port(d, port) = grp;
>> -        }
>> +            struct evtchn *chn;
>> +            struct evtchn **grp;
>> +            unsigned int alloc_port = read_atomic(&d->valid_evtchns);
>>   
>> -        chn = alloc_evtchn_bucket(d, port);
>> -        if ( !chn )
>> -            return -ENOMEM;
>> -        bucket_from_port(d, port) = chn;
>> +            if ( !group_from_port(d, alloc_port) )
>> +            {
>> +                grp = xzalloc_array(struct evtchn *, BUCKETS_PER_GROUP);
>> +                if ( !grp )
>> +                    return -ENOMEM;
>> +                group_from_port(d, alloc_port) = grp;
>> +            }
>>   
>> -        /*
>> -         * d->valid_evtchns is used to check whether the bucket can be
>> -         * accessed without the per-domain lock. Therefore,
>> -         * d->valid_evtchns should be seen *after* the new bucket has
>> -         * been setup.
>> -         */
>> -        smp_wmb();
>> -        write_atomic(&d->valid_evtchns, d->valid_evtchns + EVTCHNS_PER_BUCKET);
>> +            chn = alloc_evtchn_bucket(d, alloc_port);
>> +            if ( !chn )
>> +                return -ENOMEM;
>> +            bucket_from_port(d, alloc_port) = chn;
>> +
>> +            /*
>> +             * d->valid_evtchns is used to check whether the bucket can be
>> +             * accessed without the per-domain lock. Therefore,
>> +             * d->valid_evtchns should be seen *after* the new bucket has
>> +             * been setup.
>> +             */
>> +            smp_wmb();
>> +            write_atomic(&d->valid_evtchns,
>> +                         d->valid_evtchns + EVTCHNS_PER_BUCKET);
>> +        } while ( port >= read_atomic(&d->valid_evtchns) );
> 
> This updating of d->valid_evtchns looks a little inconsistent to me,
> wrt the uses of {read,write}_atomic(). To make obvious that there's
> an implicit expectation that no 2nd invocation of this function
> could race the updates, I'd recommend reading allocate_port ahead
> of the loop and then never again. Here you'd then do
> 
>              smp_wmb();
>              allocate_port += EVTCHNS_PER_BUCKET;
>              write_atomic(&d->valid_evtchns, allocate_port);
>          } while ( port >= allocate_port );


I know it is my code. But I agree with this comment :).

> 
> at the same time rendering the code (imo) a little more legible.
> 
> Jan

-- 
Julien Grall

