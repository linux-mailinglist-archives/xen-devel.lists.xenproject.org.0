Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4625049BF6E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 00:14:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260596.450364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCV0o-0004jV-M2; Tue, 25 Jan 2022 23:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260596.450364; Tue, 25 Jan 2022 23:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCV0o-0004gm-Iv; Tue, 25 Jan 2022 23:14:06 +0000
Received: by outflank-mailman (input) for mailman id 260596;
 Tue, 25 Jan 2022 23:14:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nCV0n-0004gQ-EB
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 23:14:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCV0m-0000lB-S4; Tue, 25 Jan 2022 23:14:04 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.30.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCV0m-0004Eb-IG; Tue, 25 Jan 2022 23:14:04 +0000
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
	bh=9/U1eLyTfR/V372XRkvuy/CVkY5+R1UaZ+sEH8I/1W0=; b=Hky3SlAN6HuWd43Q/XbwmHCMZg
	1OhNLXpGkPH9kUAjJJj6McImYHH6pzShqLcKT100/g0StbVYpefSYXWRXZn2qp6rgV4ZcAlwezK8F
	PHquAX3qh2obGIXQGBlTG5qgSWi3qfOKCn1tuIoSRmFc21zwLWyVOm2+LPo5t21Htwn4=;
Message-ID: <a992cf74-a75a-43d0-f83a-cd9549f586a8@xen.org>
Date: Tue, 25 Jan 2022 23:14:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-2-sstabellini@kernel.org>
 <f3b2ae98-c7af-d8c0-b0a4-52e622517c34@xen.org>
 <alpine.DEB.2.22.394.2201241652330.27308@ubuntu-linux-20-04-desktop>
 <14af544d-0d20-9b58-4d70-5f5086ece032@suse.com>
 <alpine.DEB.2.22.394.2201251435030.27308@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2201251435030.27308@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 25/01/2022 22:49, Stefano Stabellini wrote:
> On Tue, 25 Jan 2022, Jan Beulich wrote:
>> On 25.01.2022 02:10, Stefano Stabellini wrote:
>>> On Sun, 23 Jan 2022, Julien Grall wrote:
>>>>> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
>>>>> index da88ad141a..5b0bcaaad4 100644
>>>>> --- a/xen/common/event_channel.c
>>>>> +++ b/xen/common/event_channel.c
>>>>> @@ -232,7 +232,7 @@ int evtchn_allocate_port(struct domain *d, evtchn_port_t
>>>>> port)
>>>>>        return 0;
>>>>>    }
>>>>>    -static int get_free_port(struct domain *d)
>>>>> +int get_free_port(struct domain *d)
>>>>
>>>> I dislike the idea to expose get_free_port() (or whichever name we decide)
>>>> because this can be easily misused.
>>>>
>>>> In fact looking at your next patch (#3), you are misusing it as it is meant to
>>>> be called with d->event_lock. I know this doesn't much matter
>>>> in your situation because this is done at boot with no other domains running
>>>> (or potentially any event channel allocation). However, I still think we
>>>> should get the API right.
>>>>
>>>> I am also not entirely happy of open-coding the allocation in domain_build.c.
>>>> Instead, I would prefer if we provide a new helper to allocate an unbound
>>>> event channel. This would be similar to your v1 (I still need to review the
>>>> patch though).
>>>
>>> I am happy to go back to v1 and address feedback on that patch. However,
>>> I am having difficulties with the implementation. Jan pointed out:
>>>
>>>
>>>>> -
>>>>> -    chn->state = ECS_UNBOUND;
>>>>
>>>> This cannot be pulled ahead of the XSM check (or in general anything
>>>> potentially resulting in an error), as check_free_port() relies on
>>>> ->state remaining ECS_FREE until it is known that the calling function
>>>> can't fail anymore.
>>>
>>> This makes it difficult to reuse _evtchn_alloc_unbound for the
>>> implementation of evtchn_alloc_unbound. In fact, I couldn't find a way
>>> to do it.
>>>
>>> Instead, I just create a new public function called
>>> "evtchn_alloc_unbound" and renamed the existing funtion to
>>> "_evtchn_alloc_unbound" (this to addresses Jan's feedback that the
>>> static function should be the one starting with "_"). So the function
>>> names are inverted compared to v1.
>>>
>>> Please let me know if you have any better suggestions.
>>>
>>>
>>> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
>>> index da88ad141a..c6b7dd7fbd 100644
>>> --- a/xen/common/event_channel.c
>>> +++ b/xen/common/event_channel.c
>>> @@ -18,6 +18,7 @@
>>>   
>>>   #include <xen/init.h>
>>>   #include <xen/lib.h>
>>> +#include <xen/err.h>
>>>   #include <xen/errno.h>
>>>   #include <xen/sched.h>
>>>   #include <xen/irq.h>
>>> @@ -284,7 +285,27 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
>>>       xsm_evtchn_close_post(chn);
>>>   }
>>>   
>>> -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>> +struct evtchn *evtchn_alloc_unbound(struct domain *d, domid_t remote_dom)
>>> +{
>>> +    struct evtchn *chn;
>>> +    int port;
>>> +
>>> +    if ( (port = get_free_port(d)) < 0 )
>>> +        return ERR_PTR(port);
>>> +    chn = evtchn_from_port(d, port);
>>> +
>>> +    evtchn_write_lock(chn);
>>> +
>>> +    chn->state = ECS_UNBOUND;
>>> +    chn->u.unbound.remote_domid = remote_dom;
>>> +    evtchn_port_init(d, chn);
>>> +
>>> +    evtchn_write_unlock(chn);
>>> +
>>> +    return chn;
>>> +}
>>> +
>>> +static int _evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>>>   {
>>>       struct evtchn *chn;
>>>       struct domain *d;
>>
>> Instead of introducing a clone of this function (with, btw, still
>> insufficient locking), did you consider simply using the existing
>> evtchn_alloc_unbound() as-is, i.e. with the caller passing
>> evtchn_alloc_unbound_t *?
> 
> Yes, we tried that first. Unfortunately the (dummy) XSM check cannot
> work. This is how we would want to call the function:
> 
> 
>      alloc.dom = d->domain_id;
>      alloc.remote_dom = hardware_domain->domain_id;
>      rc = evtchn_alloc_unbound(&alloc);
> 
> 
> This is the implementation of the XSM check:
> 
> static XSM_INLINE int xsm_evtchn_unbound(
>      XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn, domid_t id2)
> {
>      XSM_ASSERT_ACTION(XSM_TARGET);
>      return xsm_default_action(action, current->domain, d);
> }
> 
> 
> Note the usage of current->domain. If you have any suggestions on how to
> fix it please let me know.

If I am not mistaken, current should still point to a domain (in this 
case idle).

So one alternative would be to ignore XSM if current->domain == idle and 
the system is booting (this could be part of xsm_default_action())

Another alternative would be to switch current to another domain. 'dom0' 
wouldn't be a solution because it doesn't exist for "true" dom0less. So 
a possibility would be to use dom_xen or create a fake build domain to 
be used for XSM check during boot.

Cheers,

-- 
Julien Grall

