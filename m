Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Md/JKHODWr53QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 17:09:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C919D590867
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 17:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314085.1584101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPiXT-0000Kb-6I; Wed, 20 May 2026 15:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314085.1584101; Wed, 20 May 2026 15:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPiXT-0000IA-3k; Wed, 20 May 2026 15:08:51 +0000
Received: by outflank-mailman (input) for mailman id 1314085;
 Wed, 20 May 2026 15:08:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPiXR-0000I3-QR
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 15:08:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPiXR-00DT2t-5v
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 17:08:49 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0dce70-bab6-0a2a0a5309dd-0a2a4502ed92-28
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 17:08:49 +0200
Received: from [209.85.218.49] (helo=mail-ej1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0dce81-af86-0a2a45020019-d155da31ac02-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 17:08:49 +0200
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-bd2087858c4so1093140866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:08:49 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bd4f4bce1a4sm871556666b.5.2026.05.20.08.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 08:08:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779289729; x=1779894529; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lTugFGXKT8kvgrB1D0VxjRNU93aeE2uqD4QSZQAJ/Es=;
        b=ktpzsD+GE64Ft9LOMXWhdShXE+2/1rFU5w0vMP1gkRu0Vmp5JLKFJZfjOTCoSvYNnb
         fsVvHhZnlN0pvu32ZJpEDp6J9DCqApj4in6D6BVwURWId0UqqXv6qT/RK/+yDPDQq2V6
         D2/iKIze4BR2YZUhKq58+s5kso5W7h6sUIwXqpZ8d2AalRUyvWosLSC0FK+74CcmB0C5
         mY2bbfkxa9dXSMcB6mknQ8xsYUFaSI4Bv/lv0F4fRlK3DFPXj78dUMIbiIXxH5esEY0k
         MRP0/9asH4lrBS1f4Qr6Vq+2TbTXkDbZh4DPuZiCnLSiCPrJif+MMKPydMKWJrIQKHex
         /Tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289729; x=1779894529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTugFGXKT8kvgrB1D0VxjRNU93aeE2uqD4QSZQAJ/Es=;
        b=IycqiVcvDlyzWvvQ4FDDf66vQ9DLaOZ2+iwOfEqoZl5sojK1SArrWnXCjr3gyri9xd
         RJ6Y29qQdvrAqq1DXrJbOcPwk03vyhnmpJSxOfK+Wx8fMoaFJaYX2Q3AJBrvqudqlPCK
         p2oIKOGfpIQyZf2cq6Gx2J6QaqqmGptG50MnAzFK3FsEJqiEwMytLffOLwXYfe0o7sJ8
         yeqNMIEUjeMY2vk5bvh/8acqwdgcUZjU4TvHp5y+8TNwlhzBHcCnHwwGkBo0vbVjB4Fn
         WF+df2uCZlPXTluHlZulMHucV+Txxaol1FR5GuZPJag2a/URFMUzj4rRZ9lWLZq738ax
         Hjyw==
X-Forwarded-Encrypted: i=1; AFNElJ/B3IvqywZp4gD/GiotlJzpR/cTXXldvhOfa9lb3eUu7GZoU9EELdKeHPjY1LV2X8Rnqu8PxnD3gm4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLHN2WS50Rg62BMkowpNRehVfJURV4CTtM1OVjV7kluZ6YU4fx
	aK9f/vYJzsYeny8hzJO8tCpo5h16AYLlOMJCtG9Ee9QT+aCiIfTWCOGS
X-Gm-Gg: Acq92OHBOXzG8HyTKLPcg2Ym5b6ftfWWeUbYLhAnF359yFvItZVOM1QdlHFcp3SOr6J
	UqLkdo3hrKflHRkL+XaVJyO2WfSZv2uX0tTBOI1AQPPQ3JVSeQ0qOUz+PjTS2RLgGhGK3BUUUT9
	MnWMsB8aebGo1qDQnVNusgsZZMil6Bf21KLXYPNPkwlJkAQlSlaViyXSRgk586yUNlehDNZMi6b
	4QZfKooADEdSdJy/rp5csN36rcHbqKKgQLO7nJxOK17G2ZCQNc1D6GMCxNHPhWklr4EJINX7Gdv
	JWa+uN++olVbj/xs7KPPOeq5MsI1DacfeaMYEETVa4oxXNRviXftoa4+eSyN1B1S2cHnY65qU7s
	wI6h3ZAFLaXXvY1XkOkS2nQ2bVEgwJsFfPoeRjMwHGT6Z94xxrFMJXmK/WtCCdEYO4jmRqvj7Me
	TCDYQNXp0TzHW6Zsb7PIOUmftnK+83mEFyGOOznVQVpG+XFfOjuJI14l+GH98+xPpV8FVXXSxkf
	6AZXJCeQo0yPQ==
X-Received: by 2002:a17:907:1787:b0:bd5:5ac:d70e with SMTP id a640c23a62f3a-bd5179060fcmr1450956266b.26.1779289728336;
        Wed, 20 May 2026 08:08:48 -0700 (PDT)
Message-ID: <16fb059d-84a1-4f2c-bd25-36ac1fc6d0c1@gmail.com>
Date: Wed, 20 May 2026 17:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/domain: fix UBSAN null pointer dereference in
 vcpu_info_reset()
To: Jan Beulich <jbeulich@suse.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <09ae75638f9e7991163ed3633e7a60461d93da70.1779179301.git.oleksii.kurochko@gmail.com>
 <2be07ba3-879b-4c79-8103-b4951ab4cf53@suse.com>
 <bedfec37-4c74-40dc-904e-b80e33461be7@gmail.com>
 <e77cb8b3-35ce-4fc1-b98c-d4e889502acf@gmail.com>
 <ea274abd-d7be-4fee-a147-936a8adc1c81@suse.com>
 <12e89d4e-2856-4130-aaa7-1ec1a742c72f@gmail.com>
 <2d8166e4-009f-4066-b96d-fb9e41b548a1@suse.com>
 <eec28059-d7c5-4d30-80ff-7b1b57d706ec@gmail.com>
 <5f2013a0-d90b-49c9-bd18-afeffebac74e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <5f2013a0-d90b-49c9-bd18-afeffebac74e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1779289729-81F76161-96B95780/10/73395122804
X-purgate-type: spam
X-purgate-size: 7236
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:baptiste.le-duc@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C919D590867
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/26 4:21 PM, Jan Beulich wrote:
> On 20.05.2026 15:40, Oleksii Kurochko wrote:
>>
>>
>> On 5/20/26 2:03 PM, Jan Beulich wrote:
>>> On 20.05.2026 13:33, Oleksii Kurochko wrote:
>>>>
>>>>
>>>> On 5/19/26 1:53 PM, Jan Beulich wrote:
>>>>> On 19.05.2026 13:22, Oleksii Kurochko wrote:
>>>>>> On 5/19/26 12:55 PM, Oleksii Kurochko wrote:
>>>>>>> On 5/19/26 11:37 AM, Jan Beulich wrote:
>>>>>>>> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>>>>>>>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
>>>>>>>>> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
>>>>>>>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>>>>>>>
>>>>>>>>> However, it does not guard against d->shared_info being NULL.  The
>>>>>>>>> shared_info() macro expands to a member access through d->shared_info,
>>>>>>>>> so when an architecture does not allocate a shared_info page the
>>>>>>>>> dereference triggers UBSAN:
>>>>>>>>>       UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>>>>>>       member access within null pointer of type 'struct shared_info_t'
>>>>>>>>>
>>>>>>>>> Extend the existing fallback condition to also cover the case where no
>>>>>>>>> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
>>>>>>>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>>>>>>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>>>>>>>
>>>>>>>>> Fixes: 295514ff75506 ("common: convert vCPU info area registration")
>>>>>>>>
>>>>>>>> I question this, largely (but not only) because I also ...
>>>>>>>>
>>>>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>>>>>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>>>>>>>> ---
>>>>>>>>> RISC-V does not allocate a shared_info page at the momemnt because its
>>>>>>>>> guests run in dom0less mode and do not use the Xen PV ABI, so
>>>>>>>>> d->shared_info remains NULL throughout domain lifetime.
>>>>>>>>
>>>>>>>> ... question this mode of operation. Yes, you may (for now) be able to
>>>>>>>> get
>>>>>>>> away without, but e.g. event channels will want supporting at some point.
>>>>>>>> Which will require a shared info page. Better put that in place right
>>>>>>>> away,
>>>>>>>> even if the guests you test with don't use it (yet). Certain other common
>>>>>>>> code also assumes d->shared_info to never be NULL for an alive domain.
>>>>>>>>
>>>>>>>
>>>>>>> Would it be fine than to allocate it in arch_domain_create() ... :
>>>>>>>
>>>>>>>         if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>>>>>>>             goto fail;
>>>>>>>
>>>>>>>         clear_page(d->shared_info);
>>>>>>>
>>>>>>> ... but without calling share_xen_page_with_guest() after that
>>>>>>> allocation as share_xen_page_with_guest() isn't implemented at the moment?
>>>>>
>>>>> I would have said "yes" here, but ...
>>>>>
>>>>>> Or could it be an option for all arch-s move allocation of
>>>>>> d->shared_info to domain_create() in common just after arch_domain_create()?
>>>>>
>>>>> ... Andrew's reply pretty much rules out not only this option, but the
>>>>> shared-info-page concept as a whole (for RISC-V). See my reply there. In
>>>>> the meantime, the change as suggested may then indeed be what we want to
>>>>> go with, albeit (a) with a better description and (b) perhaps covering
>>>>> all d->shared_info uses.
>>>>
>>>> Looking at guest kernel code (Linux), FIFO is tried first, so if RISC-V
>>>> is going to support only FIFO, d->shared_info could legally be NULL.
>>>>
>>>> Looking at the Xen side, if an architecture decides to support only
>>>> FIFO, d->shared_info is touched only in vcpu_info_reset(), which is
>>>> called from vcpu_create().
>>>>
>>>> All other places where d->shared_info is accessed should not be
>>>> reachable except for one case in event_fifo.c: when a guest issues the
>>>> EVTCHNOP_init_control hypercall, setup_ports() reads from shared_info(d,
>>>> evtchn_pending):
>>>>      static void setup_ports(struct domain *d, unsigned int prev_evtchns)
>>>>      {
>>>>      ...
>>>>              if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending))
>>>>                  evtchn->pending = true;
>>>>      ...
>>>>          }
>>>>      }
>>>>
>>>> This looks like it handles the transition from the 2L ABI to the FIFO
>>>> ABI: if a guest started with 2L and then switched to FIFO, any events
>>>> already pending in shared_info(d, evtchn_pending) need to be migrated to
>>>> FIFO's per-channel evtchn->pending flag. But it looks like I am missing
>>>> something here as I mentioned at the start that Linux uses or FIFO or 2L.
>>>>
>>>> Am I missing something?
>>>
>>> Quite likely you aren't, but I didn't check. My earlier "covering all" may
>>> well resolve to merely stating things accordingly in the patch description.
>>
>> If either FIFO or 2L can be used, shouldn't guest_test_bit(d, port,
>> &shared_info(d, evtchn_pending)) in setup_ports() be dropped? If FIFO
>> was chosen by Linux, there won't be any events in &shared_info(d,
>> evtchn_pending), so it is essentially dead code that could just be
>> dropped.
> 
> Why would it be dead code? Who said that a guest couldn't to 2L for a
> while, then switch to FIFO? Think of boot loaders, for example.

I jsut based my assumption on Linux use case, if generally such switch 
is okay then I will add to my original patch what I suggested here ...

> 
> Jan
> 
>> Or would it be better to leave it and skip only if
>> d->shared_info is allocated: if ( d->shared_info && guest_test_bit(...)
>> )  to cover the case when a guest wants to switch from 2L to FIFO (if
>> that is even a possible case at all, since as I mentioned above, the
>> guest (Linux) chooses the event ABI once and it stays for its lifetime)?

... + refactor commit message:
```
xen/domain: fix UBSAN null pointer dereference of d->shared_info

It is legal to have d->shared_info equal to NULL for architectures which
support only the FIFO ABI for event channel management.

Having d->shared_info == NULL leads to a UBSAN issue on such architectures:
   UBSAN: Undefined behaviour in common/domain.c:325:10
          member access within null pointer of type 'struct shared_info_t'

vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
and falls back to dummy_vcpu_info for vcpus beyond that limit.
Extend the existing fallback condition to also cover the case where no
shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
instead. This is the correct behaviour: dummy_vcpu_info already serves
as the safe stand-in for vcpus that have no usable shared_info slot.

Additionally, if an architecture supports only the FIFO ABI, setup_ports()
should be updated to avoid a NULL pointer dereference of d->shared_info,
since in that case there will be no pending events in
shared_info->evtchn_pending and the pending flag of the FIFO event 
channel does not need to be set to true.
```

~ Oleksii


