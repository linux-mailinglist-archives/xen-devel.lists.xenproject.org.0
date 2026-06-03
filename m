Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AdhTCmftH2oqsgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:01:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927F4635F45
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:01:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dbwiq4Or;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1325925.1591291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhTG-0006iI-Qm; Wed, 03 Jun 2026 09:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325925.1591291; Wed, 03 Jun 2026 09:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhTG-0006gj-Md; Wed, 03 Jun 2026 09:01:06 +0000
Received: by outflank-mailman (input) for mailman id 1325925;
 Wed, 03 Jun 2026 09:01:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUhTE-0006gd-Hw
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:01:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUhTD-0030xi-JE
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:01:03 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1fed44-5cb7-0a2a0a5109dd-0a2a4503a8b6-48
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:01:03 +0200
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1fed4f-672d-0a2a45030019-d155d035d526-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:01:03 +0200
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-68ed5b52767so4819a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 02:01:03 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf0553040a7sm114786866b.50.2026.06.03.02.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 02:01:02 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780477263; x=1781082063; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfL7r7VuMlXd5Z4UAmYZ49UlFZwuryFedY8y/cAFmVI=;
        b=dbwiq4OrYtIYwjYxuoqdDLYvWcXlkrMd+MnsM91gq9fb8dvhF487jQPqtcfDNi+ECm
         A7ux7eZ/cao++H8lfsWMaLS5IVS9JbAWAmr61ldht6up8FTfNnjNmouwzZpftpNdpgJ2
         7uXaVYUJxSHe60W/w5O1Rg11v4TgPCrrPsrm+fARD9fKhecXV8D0807Xfs9VuG0OnrOD
         mPmKadp8rgOa9z6rcePUq/OWhB2NPMZXn6vKaUkB3MHS/dEGXRP6ici57v1al6YFreWj
         XNVLjNc3XyWooPkmupycGAXfWLVr0OLhseHLofy3sH6X7X5qewWHds1wb8YHwjg24G/D
         9KUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780477263; x=1781082063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfL7r7VuMlXd5Z4UAmYZ49UlFZwuryFedY8y/cAFmVI=;
        b=LMhtYFVQZ6132qrSg7sGU1G9K/ecNdZK4qTKGcljjHd46cwSiMam1NicCffkyq1le1
         iM6wsXhYi/66EQcdz4CokxANIKikZeD0SGNIdte6Sdf0ZNvRBkZB9mTDSNhhAYLqnXVq
         jMkiCMtEIJJbFr194c4r+GzhZ5gTfgZIGogqEeIu29XKlvZQJheMKBQHShIHg90WHiFI
         M0edsFjdIpUrzsISUZVyHt1yZoO35NNX2kOMQfvZU4DvIgWR/iSszdH3Sjj/JDeZOjb5
         fVgvYCPSS4T8g6zPB71BnXaO7PNDpsuS37yl2HM8hBcMnVk5b3mDpMoPuRPUm5otr8TM
         fbzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Bf0ttF/iFxL7fUcusiKrAh1nGqj3SQdZVsWPH7GgvB3VJrszjpVL15rnsmprOoYXYlf3CMWngl9I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPQWR4Crv3BPh5FDuEqML1V3irFIJId/cRDQAfyenst5orQUAM
	mSn3Gh97xB0Ihx5oEY/2fPlenYsHkEYf2kQi//CyfaKnlHLWgjJ5r9Z+
X-Gm-Gg: Acq92OFqRBXWN426Hm5qo0KkxoW0CmueV+GyYiT7yhFZd+uBH9fAGuUgNlunTgvwhib
	htWP2yalwByJRMQuQi5Zbuf7JcBz717CX9dFiDByNGIPXmH8qOBKtOJ59xahGxhUEJKaiHPhsJX
	86Q2T1CBqhZ2lYi3oYfzYER8iv+H5saXDKTqDPSyvBiw0EGF9qxe0UJrZsWLeJ8iQ3eUw34tolK
	BhOfAWLxmlvsXzoycDj2yGEpDNvl6hft4Pzkb66qs3l8nQlSUAD5nQaBXF1whvrrjMp/iJlB41D
	hd/HVBM5UWoqu0HwXEsL+zoyhhwNFnA40l23xCJB1KEtJSlWdkKwYnwhLYugp5tgXi13jxqr9By
	4O9cz5pQsYWr48IiaCgUiF/FgPXoj2ZAyPpVNGl79Vpgg7AOndv3YoEFWbznWh3nlne1SuSAcs9
	P6+wqjOohUIELk1BpvL3qTbN64LyyYoYWGQry10qrDGf6w509tRWmcp/j+xOdG0A4xgmOAA/Deh
	s9Cpe8+dfG2YPDl
X-Received: by 2002:a17:907:1998:b0:bee:f79b:17ca with SMTP id a640c23a62f3a-bf0aef05ddfmr128554466b.35.1780477262595;
        Wed, 03 Jun 2026 02:01:02 -0700 (PDT)
Message-ID: <0e53e87e-df9f-4c30-a089-8c4e45babcab@gmail.com>
Date: Wed, 3 Jun 2026 11:01:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/domain: fix UBSAN null pointer dereference of
 d->shared_info
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <04dd784b6b9a4dfca9a313ea8802d8d514d65021.1779712171.git.oleksii.kurochko@gmail.com>
 <3aef7763-aea3-496a-8c18-d3659f590373@suse.com>
 <fb1b1194-5855-49d9-99fc-d35a3038833c@gmail.com>
 <3eb9ab3d-dc4d-4019-89c8-9f7dbdc528cd@suse.com>
 <9df0b08e-6185-4d0e-bd06-32fe9d684ad0@gmail.com>
 <033aa467-ad86-48be-a59b-05315aa3cf4c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <033aa467-ad86-48be-a59b-05315aa3cf4c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1780477263-39171938-EEB1183C/10/73395122804
X-purgate-type: spam
X-purgate-size: 10962
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 927F4635F45



On 6/3/26 10:18 AM, Jan Beulich wrote:
> On 03.06.2026 10:07, Oleksii Kurochko wrote:
>> On 6/3/26 7:54 AM, Jan Beulich wrote:
>>> On 02.06.2026 18:11, Oleksii Kurochko wrote:
>>>> On 6/2/26 1:19 PM, Jan Beulich wrote:
>>>>> On 25.05.2026 15:20, Oleksii Kurochko wrote:
>>>>>> It is legal to have d->shared_info equal to NULL for architectures which
>>>>>> support only the FIFO ABI for event channel management.
>>>>>>
>>>>>> Having d->shared_info == NULL leads to a UBSAN issue on such architectures:
>>>>>>      UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>>>             member access within null pointer of type 'struct shared_info_t'
>>>>>>
>>>>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
>>>>>> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
>>>>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>>>> Extend the existing fallback condition to also cover the case where no
>>>>>> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
>>>>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>>>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>>>>
>>>>>> Additionally, if an architecture supports only the FIFO ABI, setup_ports()
>>>>>> should be updated to avoid a NULL pointer dereference of d->shared_info,
>>>>>> since in that case there will be no pending events in
>>>>>> shared_info->evtchn_pending and the pending flag of the FIFO event channel
>>>>>> does not need to be set to true.
>>>>>> update_domain_wallclock_time() accesses d->shared_info via shared_info()
>>>>>> macro. On architectures that do not allocate a shared_info page (currently
>>>>>> RISC-V, which runs guests in dom0less mode without the PV ABI), this causes
>>>>>> a NULL dereference. The early return is safe: if there is no shared_info
>>>>>> page, there is nothing to update. For all existing architectures (x86, ARM)
>>>>>> that do allocate it, the guard is never taken and behavior is unchanged.
>>>>>>
>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>>     - Update commit message + subject.
>>>>>>     - Drop Fixes tag.
>>>>>>     - Handle migration of pending events from 2L and FIFO ABIs when arch
>>>>>>       support only FIFO ABI.
>>>>>
>>>>> What does this item describe? On an arch supporting only FIFO, how could
>>>>> evtchn need migrating from 2L?
>>>>
>>>> Agree this item is inaccurate.
>>>>
>>>> evtchn_init() always calls evtchn_2l_init(d) first
>>>> (event_channel.c:1627), so every domain starts with 2L regardless of
>>>> arch (of course, it is just initialization of evtchn_port_ops which
>>>> aren't really used when only FIFO is supported).
>>>>
>>>> setup_ports() is called during the guest-initiated 2L→FIFO transition
>>>> (event_fifo.c:637), not at arch init time. There is no arch that
>>>> supports "only FIFO" as a starting state and that is why it is needed to
>>>> guard setup_ports() against NULL d->shared_info when migrating 2L
>>>> pending state to FIFO even 2L wasn't really used by an arch with only
>>>> FIFO support.
>>>
>>> Imo on arch-es not supporting 2L, domains shouldn't start in 2L mode.
>>
>> Agree but will it be easy to achieve now with the current code base?
>>
>> The best what could be done it is avoid calling evtchn_2l_init() now in
>> event_channel.c and:
>> 1. Add a new Kconfig symbol, CONFIG_HAS_EVTCHN_2L (or re-use
>> HAS_SHARED_INFO suggested before), selected by x86 and ARM.
> 
> I'd stick to just HAS_SHARED_INFO as long as a separate control for 2-
> level evtchn isn't strictly needed.
> 
>> 2. In evtchn_init() (event_channel.c:1627), guard the call:
>>      #ifdef CONFIG_HAS_EVTCHN_2L
>>         evtchn_2l_init(d);
>>      #else
>>         evtchn_none_init(d);
>>      #endif
>> 3. Add a small stub ops table (probably in event_fifo.c or a new
>> event_none.c) with no-op set_pending/clear_pending/unmask, is_pending
>> returning false, is_masked returning true (valid until
>> evtchn_fifo_init_control() replaces them).
> 
> That's one of the options (the stubs could then as well live in
> event_channel.c). Another might be to put the FIFO ops in place right
> away, making sure they can cope with evtchn_fifo_init_control() not
> having been called yet.

Some FIFO ops are dependent on evtchn_fifo_init_control:

evtchn_fifo_word_from_port() is used in FIFO ops, and it dereferences 
d->evtchn_fifo unconditionally at event_fifo.c:65:
   if ( unlikely(port >= d->evtchn_fifo->num_evtchns) )

evtchn_fifo_set_pending() additionally dereferences 
v->evtchn_fifo->queue[...] at line 202, which is also NULL before 
per-vcpu FIFO init.

It looks safer to go with no-op operations.

> 
>>>>>> --- a/xen/common/domain.c
>>>>>> +++ b/xen/common/domain.c
>>>>>> @@ -320,7 +320,7 @@ void vcpu_info_reset(struct vcpu *v)
>>>>>>         struct domain *d = v->domain;
>>>>>>     
>>>>>>         v->vcpu_info_area.map =
>>>>>> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
>>>>>> +        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS && d->shared_info)
>>>>>>              ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>>>>>              : &dummy_vcpu_info);
>>>>>>     }
>>>>>
>>>>> At the example of this: The extra conditionals are dead code on x86 and
>>>>> Arm. While the status of the respective Misra rule is still uncertain
>>>>> for Xen, imo we'd be better off avoiding the introduction of new dead
>>>>> code. Which in turn means we may need some kind of abstraction to have
>>>>> these extra conditionals in place only for arch-es not supporting
>>>>> shared-info at all.
>>>>
>>>> What about then add config HAS_SHARED_INFO to xen/common/Kconfig and then:
>>>
>>> We're getting closer. Imo we want to go farther, though: shared_info() as a
>>> construct should be unavailable when !HAS_SHARED_INFO. _That_ then will
>>> make obvious (by causing build failures) that all respective use sites were
>>> properly dealt with.
>>
>> I will add then:
>>
>> +#ifdef CONFIG_HAS_SHARED_INFO
>>    #define shared_info(d, field)      __shared_info(d, (d)->shared_info,
>> field)
>> +#endif
>>
>> But with doing that we have only option of using #ifdef HAS_SHARED_INFO
>> in the place where shared_info() is used. If it is fine then I will be
>> happy to do in this way.
> 
> Well, I gave a suggestion to avoid such #ifdef-ary, ...
> 
>>>> --- a/xen/common/domain.c
>>>> +++ b/xen/common/domain.c
>>>> @@ -319,10 +319,14 @@ void vcpu_info_reset(struct vcpu *v)
>>>>     {
>>>>         struct domain *d = v->domain;
>>>>
>>>> +#ifdef CONFIG_HAS_SHARED_INFO
>>>>         v->vcpu_info_area.map =
>>>> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS && d->shared_info)
>>>> -         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>>> -         : &dummy_vcpu_info);
>>>> +        (v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
>>>> +        ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>>> +        : &dummy_vcpu_info;
>>>> +#else
>>>> +    v->vcpu_info_area.map = &dummy_vcpu_info;
>>>> +#endif
>>>>     }
>>>
>>> I agree with #ifdef here.
>>>
>>>> --- a/xen/common/event_fifo.c
>>>> +++ b/xen/common/event_fifo.c
>>>> @@ -562,9 +562,10 @@ static void setup_ports(struct domain *d, unsigned
>>>> int prev_evtchns)
>>>>
>>>>             evtchn = evtchn_from_port(d, port);
>>>>
>>>> -        if ( d->shared_info &&
>>>> -             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>> +#ifdef CONFIG_HAS_SHARED_INFO
>>>> +        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>>                 evtchn->pending = true;
>>>> +#endif
>>>
>>> While as per above shared_info() would best not exist when !HAS_SHARED_INFO
>>> (in which case #ifdef may be unavoidable here), an alternative where
>>> IS_ENABLED() could be used here may want at least considering. E.g.
>>> causing a link-time failure when shared_info() is used (and not compiled
>>> out).
> 
> ... here. There are downsides to this, so which route to go needs settling
> on.

For an alternative approach are you okay with the following introduction:

#ifdef CONFIG_HAS_SHARED_INFO
#define shared_info(d, field)      __shared_info(d, (d)->shared_info, field)
#else
void *__shared_info_unavailable(void);
#define shared_info(d, field) \
     (*(typeof(__shared_info(d, (d)->shared_info, field)) 
*)__shared_info_unavailable())
#endif

And then use IS_ENABLED(CONFIG_HAS_SHARED_INFO) everywhere where 
shared_info() is used including the case above:

v->vcpu_info_area.map =
     IS_ENABLED(CONFIG_HAS_SHARED_INFO) && v->vcpu_id < XEN_LEGACY_MAX_VCPUS
     ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
     : &dummy_vcpu_info;

Everything that in event_2l.c could go for now without 
IS_ENABLED(CONFIG_HAS_SHARED_INFO) where shared_info() is used as that 
code isn't expected to be called by arch which doesn't support 2L so no 
linkage error will occur.

> 
>>>> --- a/xen/common/time.c
>>>> +++ b/xen/common/time.c
>>>> @@ -94,8 +94,9 @@ void update_domain_wallclock_time(struct domain *d)
>>>>         uint32_t *wc_version;
>>>>         uint64_t sec;
>>>>
>>>> -    if ( !d->shared_info )
>>>> -        return;
>>>> +#ifndef CONFIG_HAS_SHARED_INFO
>>>> +    return;
>>>> +#endif
>>>>
>>>>         spin_lock(&wc_lock);
>>>
>>> Constructs like this are imo somewhat ugly. Using IS_ENABLED() instead
>>> would make things at least a little better (again imo).
>>
>> Considering mentioned above it would be better to #ifdef the whole buddy
>> of the function:
>>
>> void update_domain_wallclock_time(struct domain *d)
>>    {
>> +#ifdef CONFIG_HAS_SHARED_INFO
>> +
>>        uint32_t *wc_version;
>>        uint64_t sec;
>>
>> -#ifndef CONFIG_HAS_SHARED_INFO
>> -    return;
>> -#endif
>> -
>>        spin_lock(&wc_lock);
>>
>>        wc_version = &shared_info(d, wc_version);
>> @@ -120,6 +118,8 @@ void update_domain_wallclock_time(struct domain *d)
>>        *wc_version = version_update_end(*wc_version);
>>
>>        spin_unlock(&wc_lock);
>> +
>> +#endif /* CONFIG_HAS_SHARED_INFO */
>>    }
> 
> In which case there's no point having use sites actually call here. I.e.
> we then may want to have an inline stub when !HAS_SHARED_INFO.
> 
>> Considering also that shared_info is expected to be used only for 2L
>> then it would be better to introduce CONFIG_HAS_EVTCHN_2L instead.
> 
> How does the event channel model in use matter for
> update_domain_wallclock_time()?

Just implicitly because of that 2l uses shared_info page but 
theoretically it is possible that this page will be used for something 
else or for some other event channel ABI implementation so 
CONFIG_HAS_SHARED_INFO is better to use.

~ Oleksii



