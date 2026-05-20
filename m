Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO0QGj2cDWoS0AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 13:34:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE71E58C976
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 13:34:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313844.1583877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPfAm-0001q3-9C; Wed, 20 May 2026 11:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313844.1583877; Wed, 20 May 2026 11:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPfAm-0001n9-6P; Wed, 20 May 2026 11:33:12 +0000
Received: by outflank-mailman (input) for mailman id 1313844;
 Wed, 20 May 2026 11:33:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPfAk-0001n1-CO
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 11:33:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPfAj-00Cnhr-OT
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 13:33:09 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0d9be7-e002-0a2a0a5209dd-0a2a45018818-48
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 13:33:09 +0200
Received: from [209.85.208.45] (helo=mail-ed1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a0d9bf5-c1f2-0a2a45010019-d155d02dec16-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 13:33:09 +0200
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-672645dbfeaso6351047a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 04:33:09 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68738e20f86sm622667a12.9.2026.05.20.04.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 04:33:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779276789; x=1779881589; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjT9tOmgUBgHGv7WWQJyM8WLeUlcoezaeON/2eV3idU=;
        b=rpm3I6FzMvxXTDC6/fStvxHdgDxG52absRWqmkbO5e48ZmfBWvN2CZLViX/REyp8uj
         sgxyvfwnkZoUfmwfsqZxOSasi3d7aBDueo++VA6YdX3F99q2zFeH35CnHPvbMv5doZyl
         gChQfbFVLCn45cEkhfU0UiCp2rbYBk94DuioUvZnfdYQ/veyiHgrcq+bTGvUsDhgSKyb
         QI3+J1pHOUsD/4b2EFCFMLg9FF0xqEj1qOovHusB4nzaJ5L++MEpkk0XxpNOR40vpKLO
         63iIrAWevrhILX8AgN8jtpLk4ogbtGmndRbA49p7ESbGS76ojdBcqmRbGACtS2nsST8K
         l/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779276789; x=1779881589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjT9tOmgUBgHGv7WWQJyM8WLeUlcoezaeON/2eV3idU=;
        b=efMQEiYgcAC8wlhyYFL4hjMNwLevfddUs7y8zMJZIO4D72WEDxD6kd6/DPFSyaEVjB
         HSAGQeiYXUCs6pn6TsY6z6l4nrcyVEtiOTjgfITGZtWLfru7AAkdqn7x2pi01zS4lrWK
         hGZa3r+/FQwcuIJAMGJkqanomK0gbARJteryJ2chwhYa8pPwvR8o4xeyZBh9X/1wymmx
         Skwu75I3WUv6gDQaeswq4tCWl9t7JRLMtHwzZweYDvJz32reM3F3zFTPWycmZRjR8+Ty
         d+wwI8+VPGG3nnjAiIcioa2tzXDIgfvJctg1o6ciTlwHdN6fJeXNGH9yjZ9cXUpp6E/5
         wKRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+2W/5FU5prW5jJ5IhYTYgArmN/dDM/DI/RL33F4eFKL0Ep11hKFGc402zSaf8pJ9xgoA3t+/oacAo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEPsqUw6INFlUw6QLRqJQYs5BqHW5G98wNMAyLLOWIRsQil6HZ
	5dVWkxDI8NKKwmszTOfLW4JZY5t5Pg7UrBFjmNdALaztq3AZCtiM/BCX
X-Gm-Gg: Acq92OFroolBNurZiQEybdFbbGjtq2VmZXgTK/VXel4/GsRkFXOFpZ2ix6JmDeXej9Y
	BxR8kOd8I26ZyRDBczxqkXMK/BeKxXrm90fHX7w8L3ZeIV/R3O73V5L0VKb04SMeCQ04dleHPZx
	38AfvJYkhUza1YwinLVos3qmL3n6mvF2Afx0Jyi3zXKKwmTqkKFvUQkQJc5Ffaqr7ywwSe1w7da
	VT+hQX1OscpBla+oh7gXSS6bLsqCjuZrwmmPVdegqWSfKe41JFe+HMhoqMQYudxaT4kZUT4xAlL
	SugVUiKf3KNOtqC4Lpn+dAVrlgY4ZQF/3AbcQAtMl6cn7G4aletRtMyOAxY7f86AFh5+vdXM6yh
	QXmbNv4QWzopeU21WnLOuqXg8wmTvBviEYwdFc1QXoy5Pk2F3SfspjEjqUK7PgW1ryhXoj59SOr
	oevWmnrr1ekuB7+9tCuWvvJlk2VvIA4BQDgAErzFLq4/MJBoi+PpqWHvKltniZ9QA5ooh/YYcxS
	GM=
X-Received: by 2002:a05:6402:5bcd:b0:676:e2c2:9034 with SMTP id 4fb4d7f45d1cf-683bd28c712mr6927106a12.13.1779276789072;
        Wed, 20 May 2026 04:33:09 -0700 (PDT)
Message-ID: <12e89d4e-2856-4130-aaa7-1ec1a742c72f@gmail.com>
Date: Wed, 20 May 2026 13:33:07 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ea274abd-d7be-4fee-a147-936a8adc1c81@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1779276789-B7555FF4-C30E98E8/10/73395122804
X-purgate-type: spam
X-purgate-size: 4233
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email];
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
X-Rspamd-Queue-Id: BE71E58C976
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 1:53 PM, Jan Beulich wrote:
> On 19.05.2026 13:22, Oleksii Kurochko wrote:
>> On 5/19/26 12:55 PM, Oleksii Kurochko wrote:
>>> On 5/19/26 11:37 AM, Jan Beulich wrote:
>>>> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>>>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
>>>>> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
>>>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>>>
>>>>> However, it does not guard against d->shared_info being NULL.  The
>>>>> shared_info() macro expands to a member access through d->shared_info,
>>>>> so when an architecture does not allocate a shared_info page the
>>>>> dereference triggers UBSAN:
>>>>>     UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>>     member access within null pointer of type 'struct shared_info_t'
>>>>>
>>>>> Extend the existing fallback condition to also cover the case where no
>>>>> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
>>>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>>>
>>>>> Fixes: 295514ff75506 ("common: convert vCPU info area registration")
>>>>
>>>> I question this, largely (but not only) because I also ...
>>>>
>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>>>> ---
>>>>> RISC-V does not allocate a shared_info page at the momemnt because its
>>>>> guests run in dom0less mode and do not use the Xen PV ABI, so
>>>>> d->shared_info remains NULL throughout domain lifetime.
>>>>
>>>> ... question this mode of operation. Yes, you may (for now) be able to
>>>> get
>>>> away without, but e.g. event channels will want supporting at some point.
>>>> Which will require a shared info page. Better put that in place right
>>>> away,
>>>> even if the guests you test with don't use it (yet). Certain other common
>>>> code also assumes d->shared_info to never be NULL for an alive domain.
>>>>
>>>
>>> Would it be fine than to allocate it in arch_domain_create() ... :
>>>
>>>       if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>>>           goto fail;
>>>
>>>       clear_page(d->shared_info);
>>>
>>> ... but without calling share_xen_page_with_guest() after that
>>> allocation as share_xen_page_with_guest() isn't implemented at the moment?
> 
> I would have said "yes" here, but ...
> 
>> Or could it be an option for all arch-s move allocation of
>> d->shared_info to domain_create() in common just after arch_domain_create()?
> 
> ... Andrew's reply pretty much rules out not only this option, but the
> shared-info-page concept as a whole (for RISC-V). See my reply there. In
> the meantime, the change as suggested may then indeed be what we want to
> go with, albeit (a) with a better description and (b) perhaps covering
> all d->shared_info uses.

Looking at guest kernel code (Linux), FIFO is tried first, so if RISC-V 
is going to support only FIFO, d->shared_info could legally be NULL.

Looking at the Xen side, if an architecture decides to support only 
FIFO, d->shared_info is touched only in vcpu_info_reset(), which is 
called from vcpu_create().

All other places where d->shared_info is accessed should not be 
reachable except for one case in event_fifo.c: when a guest issues the 
EVTCHNOP_init_control hypercall, setup_ports() reads from shared_info(d, 
evtchn_pending):
   static void setup_ports(struct domain *d, unsigned int prev_evtchns)
   {
   ...
           if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending))
               evtchn->pending = true;
   ...
       }
   }

This looks like it handles the transition from the 2L ABI to the FIFO 
ABI: if a guest started with 2L and then switched to FIFO, any events 
already pending in shared_info(d, evtchn_pending) need to be migrated to 
FIFO's per-channel evtchn->pending flag. But it looks like I am missing 
something here as I mentioned at the start that Linux uses or FIFO or 2L.

Am I missing something?

~ Oleksii

