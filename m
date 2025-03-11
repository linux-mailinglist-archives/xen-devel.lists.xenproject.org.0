Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F6EA5CEB8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:04:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908887.1315921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts4uB-0008VI-Kz; Tue, 11 Mar 2025 19:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908887.1315921; Tue, 11 Mar 2025 19:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts4uB-0008SX-HQ; Tue, 11 Mar 2025 19:04:43 +0000
Received: by outflank-mailman (input) for mailman id 908887;
 Tue, 11 Mar 2025 19:04:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ts4uA-0008SP-Jn
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:04:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts4uA-00EgR6-1B;
 Tue, 11 Mar 2025 19:04:42 +0000
Received: from [2a02:8012:3a1:0:d5e1:ab8b:3d02:5aa4]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts4u9-004bd6-30;
 Tue, 11 Mar 2025 19:04:42 +0000
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
	bh=yTqWG+q77ofATb9AUI2XDMk5hdzmbk9y5IIv/j7CXRw=; b=R0PaKPP1Ke7gJUOx+ZtYOs2poe
	96JAA6DO3Kaci/oNlc3aEJfwiExIYlor8Kc9OG2B/Y9jTbxsmN/Z5+tQn90YlgzJ53Tc5r4L6X2us
	/jMVqu59L/kDeZbgZ0PusgkNE/QLVRQAHFwJhyHzp0i5WvgF0FbJwdcC96//Zb+RyASI=;
Message-ID: <06966fe2-17f6-40b2-a0ac-56fad426c951@xen.org>
Date: Tue, 11 Mar 2025 19:04:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/9] xen/events: don't allow binding a global virq from
 any domain
Content-Language: en-GB
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-2-jgross@suse.com>
 <24a909a8-c6a9-4c09-b819-24c10e0762c3@xen.org>
 <e6352575-c2cb-4616-b305-1cd64480de1a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e6352575-c2cb-4616-b305-1cd64480de1a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 11/03/2025 09:51, Jürgen Groß wrote:
> On 11.03.25 10:35, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 04/02/2025 11:33, Juergen Gross wrote:
>>> Today Xen will happily allow binding a global virq by a domain which
>>> isn't configured to receive it. This won't result in any bad actions,
>>> but the bind will appear to have succeeded with no event ever being
>>> received by that event channel.
>>>
>>> Instead of allowing the bind, error out if the domain isn't set to
>>> handle that virq. Note that this check is inside the write_lock() on
>>> purpose, as a future patch will put a related check into
>>> set_global_virq_handler() with the addition of using the same lock.
>>  > > Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> I see this patch was already committed. But I have a question about 
>> the logic.
>>
>>> ---
>>> V6:
>>> - new patch
>>> V7:
>>> - move handling domain check inside locked region (Jan Beulich)
>>> - style fix (Jan Beulich)
>>> ---
>>>   xen/common/event_channel.c | 21 +++++++++++++++++----
>>>   1 file changed, 17 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
>>> index 46281b16ce..cd6f5a1211 100644
>>> --- a/xen/common/event_channel.c
>>> +++ b/xen/common/event_channel.c
>>> @@ -120,6 +120,13 @@ static uint8_t 
>>> get_xen_consumer(xen_event_channel_notification_t fn)
>>>   /* Get the notification function for a given Xen-bound event 
>>> channel. */
>>>   #define xen_notification_fn(e) (xen_consumers[(e)->xen_consumer-1])
>>> +static struct domain *__read_mostly global_virq_handlers[NR_VIRQS];
>>> +
>>> +static struct domain *get_global_virq_handler(unsigned int virq)
>>> +{
>>> +    return global_virq_handlers[virq] ?: hardware_domain;
>>> +}
>>> +
>>>   static bool virq_is_global(unsigned int virq)
>>>   {
>>>       switch ( virq )
>>> @@ -469,6 +476,7 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, 
>>> evtchn_port_t port)
>>>       struct domain *d = current->domain;
>>>       int            virq = bind->virq, vcpu = bind->vcpu;
>>>       int            rc = 0;
>>> +    bool           is_global;
>>>       if ( (virq < 0) || (virq >= ARRAY_SIZE(v->virq_to_evtchn)) )
>>>           return -EINVAL;
>>> @@ -478,8 +486,9 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, 
>>> evtchn_port_t port)
>>>       * speculative execution.
>>>       */
>>>       virq = array_index_nospec(virq, ARRAY_SIZE(v->virq_to_evtchn));
>>> +    is_global = virq_is_global(virq);
>>> -    if ( virq_is_global(virq) && (vcpu != 0) )
>>> +    if ( is_global && vcpu != 0 )
>>>           return -EINVAL;
>>>       if ( (v = domain_vcpu(d, vcpu)) == NULL )
>>> @@ -487,6 +496,12 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, 
>>> evtchn_port_t port)
>>>       write_lock(&d->event_lock);
>>> +    if ( is_global && get_global_virq_handler(virq) != d )
>>
>> What prevent a race between get_global_virq_handler() and 
>> set_global_virq_handler()? Also, it is not clear in the implementation 
>> of get_global_virq_handler() that it will ever only read 
>> global_virq_handlers[virq] once.
> 
> set_global_virq_handler() is taking the event_lock of the domain
> registered as handler.
> 
> So if a domain is registered for handling a virq, d->event_lock is
> protecting against the handling domain to be changed. Concurrent
> calls of set_global_virq_handler() are handled via taking the
> global_virq_handlers_lock spin_lock.

I agree this would work for evtchn_bind_virq() because we only ever 
compare. But I still wonder whether get_global_virq_handler() should 
gain an ACCESS_ONCE()? Could the compiler decide to read 
global_virq_handlers[...] twice and therefore return NULL?

Cheers,

-- 
Julien Grall


