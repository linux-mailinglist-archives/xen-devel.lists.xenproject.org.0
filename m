Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEaDMhG6DWpT2wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 15:41:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0F958EF71
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 15:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313969.1583984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPhAD-00083c-F2; Wed, 20 May 2026 13:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313969.1583984; Wed, 20 May 2026 13:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPhAD-000829-Bk; Wed, 20 May 2026 13:40:45 +0000
Received: by outflank-mailman (input) for mailman id 1313969;
 Wed, 20 May 2026 13:40:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPhAB-000823-Oa
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 13:40:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPhAB-007npu-4L
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 15:40:43 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0db9d5-bab6-0a2a0a5309dd-0a2a45099c06-36
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 15:40:42 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0db9da-2497-0a2a45090019-d1558035eccc-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 15:40:42 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48a7fe4f40bso58833975e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 06:40:42 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fed253f93sm129612165e9.16.2026.05.20.06.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 06:40:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779284442; x=1779889242; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v+2UzxBb3zs5SgWY6m3PxM1VuB1SPTX8E5PmlgRv8jw=;
        b=UOER0mM99X1ILjRZVTDjC9rNPp2j2LaxeFPpRRDjZp/DCqYkJ6eOWFUsl45Wd6xUst
         4s6ID4tRdRs0+SWRo7vbYIB3fKCisqkFpx1kZkAyytismd7ila0VbYUVC6JfZZlOA/Ah
         z3FKRWWMtiODzdiSoo+47TNJWtEQc/oYsz+HcT5QZYzIYJqaVZFtinfPQopdYKGc7jLR
         rHqd6g/GAFadOKxcn7DU6XUrulOrIkogxd2qObjpjOUMjcKG2/ggQ1PUQBz7m58KAb6k
         H2Rfq6OVC3wXgI1QrRM9NWlIsZdnOCZSXdMyA9QWmFBMTom/RIPXiIz+lAhfBEox/BOR
         /yOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284442; x=1779889242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+2UzxBb3zs5SgWY6m3PxM1VuB1SPTX8E5PmlgRv8jw=;
        b=BvJPLWF2eDzGUDuyQ1yQFhad1Bm4h0DLczSv8O75yaP+f/u8pwzgoxm46NZRZJyqQk
         pajRHYIaJ2b91Nx3yHOVHehR3tkBW5h9/BpulYAeapOq65SysuZrpwvp5gipSIeTvN4q
         2RPfWh8pQV0FZzYIw98vBfvey/e7GXC7IaYyMEkyydchlZg50p0G5oZvE2P6raEt+QhF
         ZhPM4P2xxpLpF5hJJaT8jcDsJ6xh7lUYnkyXTXvNXDsNBtIMrFvqXTfXAkbq8grym/Id
         nYNdRzRveTZQajvsVoLGRNo+CCtnmiQOgIqeeurFqONGSO4z6oKeKsq7m4wi9BerlLua
         gWVw==
X-Forwarded-Encrypted: i=1; AFNElJ/XHoqx0GUqQbJ7BM7spost22JHIRG/35KMl1y2RMFHxdqacMaXoLIiFra+vjoe9VWSgL3bpu95BKQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzs3XJJ2dYUgcM6MP/fV9otBaZXL8/y5+/74p6ynoJi5X4yKvYr
	WWEYOQ3JggARQ/iHCmVpzTTwnCrUlp+f84RINeANnyAMDlaP2pWSrnBN
X-Gm-Gg: Acq92OF+Ph7ug7UwbbFn8aXhDx920pj7JBkkEpWHSFOHDK8yhYrBLgoebK6KhtCFVDZ
	szoxlAlHBWPtJ6KveLERiZK8ijIioAF+CyAgliC4UriPRLG1AnfIpdvGHs26XDGNiuLWamq6nHZ
	NwmUQ+Sx4PphW91MLl+1T113NRt4FJ9hooOdtGUYg5RafeebXR+DTh2gaOYj9sRP56/gLWscQ0L
	qEV98EvsabCzUOdqhYkCXLvdoKuqY+pkNL0fWmtZKmKz6vTVWYoktNEEUTKqwUm2Z+KL6kw8gLv
	vMX8dRBSaLfhR0MlM2ddFqle6qNHxxEusMXzttIVxptCz1sLPDEgUTjRDz/6Kf+SMu2CGQ5FoAT
	rn4tNzyQpdSpgZKHzbT+LnW8csAGGDtUL+/V5rinPOg67z90q2Iuc7ApgHok9jTfbBAJSvpPWmW
	as5fkiUnKpkBjA7RBXmcgiUdoUVGps6q1Pmx5NZYAqO49QJVGTFF78HV/wOoMpxh1uwVeQOZVBq
	tI=
X-Received: by 2002:a05:600c:45c6:b0:490:2248:dc93 with SMTP id 5b1f17b1804b1-4902248dcd5mr91982665e9.12.1779284442105;
        Wed, 20 May 2026 06:40:42 -0700 (PDT)
Message-ID: <eec28059-d7c5-4d30-80ff-7b1b57d706ec@gmail.com>
Date: Wed, 20 May 2026 15:40:40 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2d8166e4-009f-4066-b96d-fb9e41b548a1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1779284442-89B7BA53-0EFB91F3/10/73395122804
X-purgate-type: spam
X-purgate-size: 5326
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: 2C0F958EF71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/26 2:03 PM, Jan Beulich wrote:
> On 20.05.2026 13:33, Oleksii Kurochko wrote:
>>
>>
>> On 5/19/26 1:53 PM, Jan Beulich wrote:
>>> On 19.05.2026 13:22, Oleksii Kurochko wrote:
>>>> On 5/19/26 12:55 PM, Oleksii Kurochko wrote:
>>>>> On 5/19/26 11:37 AM, Jan Beulich wrote:
>>>>>> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>>>>>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
>>>>>>> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
>>>>>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>>>>>
>>>>>>> However, it does not guard against d->shared_info being NULL.  The
>>>>>>> shared_info() macro expands to a member access through d->shared_info,
>>>>>>> so when an architecture does not allocate a shared_info page the
>>>>>>> dereference triggers UBSAN:
>>>>>>>      UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>>>>      member access within null pointer of type 'struct shared_info_t'
>>>>>>>
>>>>>>> Extend the existing fallback condition to also cover the case where no
>>>>>>> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
>>>>>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>>>>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>>>>>
>>>>>>> Fixes: 295514ff75506 ("common: convert vCPU info area registration")
>>>>>>
>>>>>> I question this, largely (but not only) because I also ...
>>>>>>
>>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>>>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>>>>>> ---
>>>>>>> RISC-V does not allocate a shared_info page at the momemnt because its
>>>>>>> guests run in dom0less mode and do not use the Xen PV ABI, so
>>>>>>> d->shared_info remains NULL throughout domain lifetime.
>>>>>>
>>>>>> ... question this mode of operation. Yes, you may (for now) be able to
>>>>>> get
>>>>>> away without, but e.g. event channels will want supporting at some point.
>>>>>> Which will require a shared info page. Better put that in place right
>>>>>> away,
>>>>>> even if the guests you test with don't use it (yet). Certain other common
>>>>>> code also assumes d->shared_info to never be NULL for an alive domain.
>>>>>>
>>>>>
>>>>> Would it be fine than to allocate it in arch_domain_create() ... :
>>>>>
>>>>>        if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>>>>>            goto fail;
>>>>>
>>>>>        clear_page(d->shared_info);
>>>>>
>>>>> ... but without calling share_xen_page_with_guest() after that
>>>>> allocation as share_xen_page_with_guest() isn't implemented at the moment?
>>>
>>> I would have said "yes" here, but ...
>>>
>>>> Or could it be an option for all arch-s move allocation of
>>>> d->shared_info to domain_create() in common just after arch_domain_create()?
>>>
>>> ... Andrew's reply pretty much rules out not only this option, but the
>>> shared-info-page concept as a whole (for RISC-V). See my reply there. In
>>> the meantime, the change as suggested may then indeed be what we want to
>>> go with, albeit (a) with a better description and (b) perhaps covering
>>> all d->shared_info uses.
>>
>> Looking at guest kernel code (Linux), FIFO is tried first, so if RISC-V
>> is going to support only FIFO, d->shared_info could legally be NULL.
>>
>> Looking at the Xen side, if an architecture decides to support only
>> FIFO, d->shared_info is touched only in vcpu_info_reset(), which is
>> called from vcpu_create().
>>
>> All other places where d->shared_info is accessed should not be
>> reachable except for one case in event_fifo.c: when a guest issues the
>> EVTCHNOP_init_control hypercall, setup_ports() reads from shared_info(d,
>> evtchn_pending):
>>     static void setup_ports(struct domain *d, unsigned int prev_evtchns)
>>     {
>>     ...
>>             if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending))
>>                 evtchn->pending = true;
>>     ...
>>         }
>>     }
>>
>> This looks like it handles the transition from the 2L ABI to the FIFO
>> ABI: if a guest started with 2L and then switched to FIFO, any events
>> already pending in shared_info(d, evtchn_pending) need to be migrated to
>> FIFO's per-channel evtchn->pending flag. But it looks like I am missing
>> something here as I mentioned at the start that Linux uses or FIFO or 2L.
>>
>> Am I missing something?
> 
> Quite likely you aren't, but I didn't check. My earlier "covering all" may
> well resolve to merely stating things accordingly in the patch description.

If either FIFO or 2L can be used, shouldn't guest_test_bit(d, port, 
&shared_info(d, evtchn_pending)) in setup_ports() be dropped? If FIFO 
was chosen by Linux, there won't be any events in &shared_info(d, 
evtchn_pending), so it is essentially dead code that could just be 
dropped. Or would it be better to leave it and skip only if 
d->shared_info is allocated: if ( d->shared_info && guest_test_bit(...) 
)  to cover the case when a guest wants to switch from 2L to FIFO (if 
that is even a possible case at all, since as I mentioned above, the 
guest (Linux) chooses the event ABI once and it stays for its lifetime)?

~ Oleksii

