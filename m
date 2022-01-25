Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209C049BADF
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 19:03:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260514.450145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCQ9Y-0008MD-DN; Tue, 25 Jan 2022 18:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260514.450145; Tue, 25 Jan 2022 18:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCQ9Y-0008Jl-9w; Tue, 25 Jan 2022 18:02:48 +0000
Received: by outflank-mailman (input) for mailman id 260514;
 Tue, 25 Jan 2022 18:02:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nCQ9X-0008Jf-7E
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 18:02:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCQ9W-0003cv-K8; Tue, 25 Jan 2022 18:02:46 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.30.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCQ9W-00077Y-DR; Tue, 25 Jan 2022 18:02:46 +0000
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
	bh=Cxnmn6BPKpuxzhshFWiZ390/5z/mBp0QNP6RALEWyhU=; b=rtgl5g4GWLusQONZnhtrWMHoPG
	cAHM3lWBzDPmG542aVJwlR1Zf0V3Skhb0Zew3uMJ55TS78IIES958ek/oss2LsopavCpy+OS90jgf
	RjmO3iO4RuhvPYOB2mZ/FXcceJMw97xP8dBasr6h8RrpV86H7g92GztT/DNcKg6Isze0=;
Message-ID: <cab13e7b-295a-c3e8-428a-4176c9f6de28@xen.org>
Date: Tue, 25 Jan 2022 18:02:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-2-sstabellini@kernel.org>
 <f3b2ae98-c7af-d8c0-b0a4-52e622517c34@xen.org>
 <alpine.DEB.2.22.394.2201241652330.27308@ubuntu-linux-20-04-desktop>
 <14af544d-0d20-9b58-4d70-5f5086ece032@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <14af544d-0d20-9b58-4d70-5f5086ece032@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 25/01/2022 08:22, Jan Beulich wrote:
> On 25.01.2022 02:10, Stefano Stabellini wrote:
>> On Sun, 23 Jan 2022, Julien Grall wrote:
>>>> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
>>>> index da88ad141a..5b0bcaaad4 100644
>>>> --- a/xen/common/event_channel.c
>>>> +++ b/xen/common/event_channel.c
>>>> @@ -232,7 +232,7 @@ int evtchn_allocate_port(struct domain *d, evtchn_port_t
>>>> port)
>>>>        return 0;
>>>>    }
>>>>    -static int get_free_port(struct domain *d)
>>>> +int get_free_port(struct domain *d)
>>>
>>> I dislike the idea to expose get_free_port() (or whichever name we decide)
>>> because this can be easily misused.
>>>
>>> In fact looking at your next patch (#3), you are misusing it as it is meant to
>>> be called with d->event_lock. I know this doesn't much matter
>>> in your situation because this is done at boot with no other domains running
>>> (or potentially any event channel allocation). However, I still think we
>>> should get the API right.
>>>
>>> I am also not entirely happy of open-coding the allocation in domain_build.c.
>>> Instead, I would prefer if we provide a new helper to allocate an unbound
>>> event channel. This would be similar to your v1 (I still need to review the
>>> patch though).
>>
>> I am happy to go back to v1 and address feedback on that patch. However,
>> I am having difficulties with the implementation. Jan pointed out:
>>
>>
>>>> -
>>>> -    chn->state = ECS_UNBOUND;
>>>
>>> This cannot be pulled ahead of the XSM check (or in general anything
>>> potentially resulting in an error), as check_free_port() relies on
>>> ->state remaining ECS_FREE until it is known that the calling function
>>> can't fail anymore.
>>
>> This makes it difficult to reuse _evtchn_alloc_unbound for the
>> implementation of evtchn_alloc_unbound. In fact, I couldn't find a way
>> to do it.
>>
>> Instead, I just create a new public function called
>> "evtchn_alloc_unbound" and renamed the existing funtion to
>> "_evtchn_alloc_unbound" (this to addresses Jan's feedback that the
>> static function should be the one starting with "_"). So the function
>> names are inverted compared to v1.
>>
>> Please let me know if you have any better suggestions.
>>
>>
>> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
>> index da88ad141a..c6b7dd7fbd 100644
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -18,6 +18,7 @@
>>   
>>   #include <xen/init.h>
>>   #include <xen/lib.h>
>> +#include <xen/err.h>
>>   #include <xen/errno.h>
>>   #include <xen/sched.h>
>>   #include <xen/irq.h>
>> @@ -284,7 +285,27 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
>>       xsm_evtchn_close_post(chn);
>>   }
>>   
>> -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>> +struct evtchn *evtchn_alloc_unbound(struct domain *d, domid_t remote_dom)
>> +{
>> +    struct evtchn *chn;
>> +    int port;
>> +
>> +    if ( (port = get_free_port(d)) < 0 )
>> +        return ERR_PTR(port);
>> +    chn = evtchn_from_port(d, port);
>> +
>> +    evtchn_write_lock(chn);
>> +
>> +    chn->state = ECS_UNBOUND;
>> +    chn->u.unbound.remote_domid = remote_dom;
>> +    evtchn_port_init(d, chn);
>> +
>> +    evtchn_write_unlock(chn);
>> +
>> +    return chn;
>> +}
>> +
>> +static int _evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>   {
>>       struct evtchn *chn;
>>       struct domain *d;
> 
> Instead of introducing a clone of this function (with, btw, still
> insufficient locking), did you consider simply using the existing
> evtchn_alloc_unbound() as-is, i.e. with the caller passing
> evtchn_alloc_unbound_t *?

This is feasible with some tweaking. Which reminds me that I have a 
similar patch to what you describe:

https://xenbits.xen.org/gitweb/?p=people/julieng/xen-unstable.git;a=commit;h=560d656a9a792450530eeefd0d06cfd54dcd7685

This is doing more than what we need here as it takes care about 
restoring a port (for Live-Update).

Note that They are forward port from 4.11 to unstable and untested on 
the latter.

Cheers,

-- 
Julien Grall

