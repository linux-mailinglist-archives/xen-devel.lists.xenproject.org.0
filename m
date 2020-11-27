Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D334C2C67E1
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 15:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39496.72428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiehY-0007cz-PI; Fri, 27 Nov 2020 14:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39496.72428; Fri, 27 Nov 2020 14:26:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiehY-0007ca-Lo; Fri, 27 Nov 2020 14:26:20 +0000
Received: by outflank-mailman (input) for mailman id 39496;
 Fri, 27 Nov 2020 14:26:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kiehX-0007cU-DM
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:26:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiehV-000666-PI; Fri, 27 Nov 2020 14:26:17 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiehV-0000MU-JY; Fri, 27 Nov 2020 14:26:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kiehX-0007cU-DM
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=4/G7E8NqdL2Dnr5IPRF2frrF0OWnH8yG3AfYGeWfSgg=; b=GCGCgpqIccMuamZaWxk3wDTNbl
	cqM9Y68a+ci3f7jqFAP5fJhVXrEr2I5Lq2GzGfF3y7oRJJUNPsbuWi9Xldmk3bh3OIWubtVfvoFNS
	MVRryZDn+jMlQcR2OVqSY8/PZEvFAoYAzkX31NS/cVZ0zmPANayf5Z4/rshVr6Zxze7k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kiehV-000666-PI; Fri, 27 Nov 2020 14:26:17 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kiehV-0000MU-JY; Fri, 27 Nov 2020 14:26:17 +0000
Subject: Re: [PATCH v8 2/3] xen/events: rework fifo queue locking
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-3-jgross@suse.com>
 <e60e4fce-8c1b-013a-9ec2-20bd2c930619@xen.org>
 <2b099865-647c-3d47-1510-d429c2a4b6c6@suse.com>
 <5f04e881-915f-e2b7-6af3-459af614f8ca@xen.org>
 <c9a8e879-ff55-3fbc-41ab-df836c76be9f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <344c5aac-8931-cf7c-f8fb-531d33a3fd0d@xen.org>
Date: Fri, 27 Nov 2020 14:26:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <c9a8e879-ff55-3fbc-41ab-df836c76be9f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 27/11/2020 14:14, Jürgen Groß wrote:
> On 27.11.20 15:11, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 27/11/2020 14:05, Jürgen Groß wrote:
>>> On 27.11.20 14:58, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 25/11/2020 10:51, Juergen Gross wrote:
>>>>> -static struct evtchn_fifo_queue *lock_old_queue(const struct 
>>>>> domain *d,
>>>>> -                                                struct evtchn 
>>>>> *evtchn,
>>>>> -                                                unsigned long *flags)
>>>>> -{
>>>>> -    struct vcpu *v;
>>>>> -    struct evtchn_fifo_queue *q, *old_q;
>>>>> -    unsigned int try;
>>>>> -    union evtchn_fifo_lastq lastq;
>>>>> -
>>>>> -    for ( try = 0; try < 3; try++ )
>>>>> -    {
>>>>> -        lastq.raw = read_atomic(&evtchn->fifo_lastq);
>>>>> -        v = d->vcpu[lastq.last_vcpu_id];
>>>>> -        old_q = &v->evtchn_fifo->queue[lastq.last_priority];
>>>>> -
>>>>> -        spin_lock_irqsave(&old_q->lock, *flags);
>>>>> -
>>>>> -        v = d->vcpu[lastq.last_vcpu_id];
>>>>> -        q = &v->evtchn_fifo->queue[lastq.last_priority];
>>>>> -
>>>>> -        if ( old_q == q )
>>>>> -            return old_q;
>>>>> -
>>>>> -        spin_unlock_irqrestore(&old_q->lock, *flags);
>>>>> -    }
>>>>> -
>>>>> -    gprintk(XENLOG_WARNING,
>>>>> -            "dom%d port %d lost event (too many queue changes)\n",
>>>>> -            d->domain_id, evtchn->port);
>>>>> -    return NULL;
>>>>> -}
>>>>> -
>>>>>   static int try_set_link(event_word_t *word, event_word_t *w, 
>>>>> uint32_t link)
>>>>>   {
>>>>>       event_word_t new, old;
>>>>> @@ -190,6 +158,9 @@ static void evtchn_fifo_set_pending(struct vcpu 
>>>>> *v, struct evtchn *evtchn)
>>>>>       event_word_t *word;
>>>>>       unsigned long flags;
>>>>>       bool_t was_pending;
>>>>> +    struct evtchn_fifo_queue *q, *old_q;
>>>>> +    unsigned int try;
>>>>> +    bool linked = true;
>>>>>       port = evtchn->port;
>>>>>       word = evtchn_fifo_word_from_port(d, port);
>>>>> @@ -204,17 +175,67 @@ static void evtchn_fifo_set_pending(struct 
>>>>> vcpu *v, struct evtchn *evtchn)
>>>>>           return;
>>>>>       }
>>>>> +    /*
>>>>> +     * Lock all queues related to the event channel (in case of a 
>>>>> queue change
>>>>> +     * this might be two).
>>>>> +     * It is mandatory to do that before setting and testing the 
>>>>> PENDING bit
>>>>> +     * and to hold the current queue lock until the event has put 
>>>>> into the
>>>>> +     * list of pending events in order to avoid waking up a guest 
>>>>> without the
>>>>> +     * event being visibly pending in the guest.
>>>>> +     */
>>>>> +    for ( try = 0; try < 4; try++ )
>>>>
>>>> May I ask why the number of try is 4 rather than the original 3?
>>>
>>> Oh, I think this is just a typo. OTOH it doesn't really matter.
>>
>> I agree that the number of try was likely random and therefore using a 
>> different number should not matter.
>>
>> However, this is making more difficult to review the patch because 
>> this is an unexplained change.
>>
>> I would prefer if this is dropped. But if you want to keep this 
>> change, then it should be explained in the commit message.
> 
> Well, I could argue that there is potentially one lock more to take, so
> the retry number is increased by one, too. ;-)

I will not argue against switching 4 :). I care more about explaining 
what we do because this is really frustrating to read some of the older 
commit where there are not much rationale (I probably wrote some).

Cheers,

-- 
Julien Grall

