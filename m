Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UeYRMX3jH2psrwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:19:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9606359FC
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:19:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=STBAsLdN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325861.1591203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUgoF-0004Tb-Mb; Wed, 03 Jun 2026 08:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325861.1591203; Wed, 03 Jun 2026 08:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUgoF-0004Qn-Jf; Wed, 03 Jun 2026 08:18:43 +0000
Received: by outflank-mailman (input) for mailman id 1325861;
 Wed, 03 Jun 2026 08:18:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUgoD-0004Qh-QJ
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:18:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUgoC-00AzUf-Vd
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 10:18:40 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fe35e-5cb7-0a2a0a5109dd-0a2a450ac83a-4
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:18:40 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fe360-56b3-0a2a450a0019-d155dd30b52c-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:18:40 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-46019edc13dso881293f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 01:18:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ed944sm5824957f8f.13.2026.06.03.01.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 01:18:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1780474720; x=1781079520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ltnj7qP4dHNYgIS+6csI6KSRGLxGpwRNTKtee/zoKG8=;
        b=STBAsLdNiKXSdvUWRV1wVHvCgoT/edh7ydqfNx+I//rKSctFzWkyhwsThKKIY8cFbj
         6cXuiqnfUR1PsaknyDZshOps6rW8V2SxXTruLQKkQBwt6+5Q/FwWhqKvSCh2hgkpo6fB
         gBXhiKvbKW8NwrMoC4ba6w6SMZl+1uUm6xkJvzcly7u4zVWquzhspw+kjnKtSh0IO75M
         HjkLZLr0TZk0IFFIfp88QPPC2j4VSs8ZXMNstH92NSzDhHv+ck3A10s2uK5S3m0281Ac
         a1DGe0d5SxOPYx6UqtmGHByEWf7L2/cfjzU1URx4BAL3AxYfrLT1F+XdJbxM8LMR9Mrr
         rLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474720; x=1781079520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ltnj7qP4dHNYgIS+6csI6KSRGLxGpwRNTKtee/zoKG8=;
        b=itiKUlpptNSj6iK7HqyYXs3fkrPL09vAdE49IQ913tbH7CowpsbF6oUzrWkUpLHwpc
         vpCL/n1jvCcfHah5r96CxyIER/2CuMHeOJw6ZIphRwBAUzubgNMtEUh9GuiwW3c5299t
         Mq+8GCaOVLWkNLun2bBkjOSOjeslg6Ds5uGE3JdnBSWdtVqPAMYLrp5IsMNA+WbIiyTU
         +VGxFjKQYG58q93+vlsCzXFlQLHl9nSp9KeMY5tfu5eVZjlj5WCwb+G8gLTtrLqyZJVK
         3qxJAagc1BkRnQEkvRm8MTg8wO2tMuoIrL88Xje6X+7Z+zxTSzjw/7LA0dEpaRE6jRw/
         PSOg==
X-Forwarded-Encrypted: i=1; AFNElJ9xdend2DkUoMunNgkMP7BlP3Gy7igUEuJr3pFB5V4dlPA84PWZHbbM9DXjRavnQ2ux5f+yOQZ4jJE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSb3Ob91MG9cpCKj8rgQ1x+3wO13W/UQzL5kJqs2Q3JGD0zMFD
	TNjl7bOrxLiqpGV6RUzr6XP+qHXyMOQ/KuPSvOlrQhY+SATYDa6Rp+FJSILkcCwjOA==
X-Gm-Gg: Acq92OFl+nhJGy3+Gs3eMWY+fEFvnI+pUspE2AlV6O+ixac1qQOWVGW9O6S2c3sjlQb
	H3/NJIG+5tf8dbiPrVRqpoSsJPbsWJz/p86+Q1RshWtGPJdWzu46qnSSyG+SfXsmMQq75vffKBc
	26/CX9+9wunjMnXHYMI7tJvgQU/rnupGMsoPxVmMjhmmNgUGzLZ9fnvlVlPgsUyKRPfGWvLMJW+
	CGnRW7QgMCcU93bbr4UnCbwXtk6cUfF0hw6ZXrTCZLAxixMspP3UcQJPMgnvBtTU0V4N9aCekde
	dQjtM3hXErsrYn4LjL+a8i7JWaQcrf/ItpbLmSFIFqQ/dPIPnqXFCEOKqxuEb2/ibqvv3GkycvX
	LdOI7kSoVeCB66CQeq83agsYXICqM5rWv8R/GakGq0cmHSGM4BtWk7GZRm7Hf4nQLY3JQOS+Bz2
	vljaiQzM79x00CI1EKgr+azp+gylXXl7Oiqh74YwhNs7OB9SRKjrSa7NB2+4b1enI/WagQa8hNn
	/BUnYcH1K9D70t8bparXJWeB4eN5qp7JtKd
X-Received: by 2002:a5d:4d4c:0:b0:456:d5bf:e24d with SMTP id ffacd0b85a97d-460216bdfd8mr2370041f8f.2.1780474720215;
        Wed, 03 Jun 2026 01:18:40 -0700 (PDT)
Message-ID: <033aa467-ad86-48be-a59b-05315aa3cf4c@suse.com>
Date: Wed, 3 Jun 2026 10:18:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/domain: fix UBSAN null pointer dereference of
 d->shared_info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <9df0b08e-6185-4d0e-bd06-32fe9d684ad0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1780474720-6FD588B7-E4667D90/10/73395122804
X-purgate-type: spam
X-purgate-size: 9058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D9606359FC

On 03.06.2026 10:07, Oleksii Kurochko wrote:
> On 6/3/26 7:54 AM, Jan Beulich wrote:
>> On 02.06.2026 18:11, Oleksii Kurochko wrote:
>>> On 6/2/26 1:19 PM, Jan Beulich wrote:
>>>> On 25.05.2026 15:20, Oleksii Kurochko wrote:
>>>>> It is legal to have d->shared_info equal to NULL for architectures which
>>>>> support only the FIFO ABI for event channel management.
>>>>>
>>>>> Having d->shared_info == NULL leads to a UBSAN issue on such architectures:
>>>>>     UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>>            member access within null pointer of type 'struct shared_info_t'
>>>>>
>>>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
>>>>> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
>>>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>>> Extend the existing fallback condition to also cover the case where no
>>>>> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
>>>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>>>
>>>>> Additionally, if an architecture supports only the FIFO ABI, setup_ports()
>>>>> should be updated to avoid a NULL pointer dereference of d->shared_info,
>>>>> since in that case there will be no pending events in
>>>>> shared_info->evtchn_pending and the pending flag of the FIFO event channel
>>>>> does not need to be set to true.
>>>>> update_domain_wallclock_time() accesses d->shared_info via shared_info()
>>>>> macro. On architectures that do not allocate a shared_info page (currently
>>>>> RISC-V, which runs guests in dom0less mode without the PV ABI), this causes
>>>>> a NULL dereference. The early return is safe: if there is no shared_info
>>>>> page, there is nothing to update. For all existing architectures (x86, ARM)
>>>>> that do allocate it, the guard is never taken and behavior is unchanged.
>>>>>
>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>> ---
>>>>> Changes in v2:
>>>>>    - Update commit message + subject.
>>>>>    - Drop Fixes tag.
>>>>>    - Handle migration of pending events from 2L and FIFO ABIs when arch
>>>>>      support only FIFO ABI.
>>>>
>>>> What does this item describe? On an arch supporting only FIFO, how could
>>>> evtchn need migrating from 2L?
>>>
>>> Agree this item is inaccurate.
>>>
>>> evtchn_init() always calls evtchn_2l_init(d) first
>>> (event_channel.c:1627), so every domain starts with 2L regardless of
>>> arch (of course, it is just initialization of evtchn_port_ops which
>>> aren't really used when only FIFO is supported).
>>>
>>> setup_ports() is called during the guest-initiated 2L→FIFO transition
>>> (event_fifo.c:637), not at arch init time. There is no arch that
>>> supports "only FIFO" as a starting state and that is why it is needed to
>>> guard setup_ports() against NULL d->shared_info when migrating 2L
>>> pending state to FIFO even 2L wasn't really used by an arch with only
>>> FIFO support.
>>
>> Imo on arch-es not supporting 2L, domains shouldn't start in 2L mode.
> 
> Agree but will it be easy to achieve now with the current code base?
> 
> The best what could be done it is avoid calling evtchn_2l_init() now in 
> event_channel.c and:
> 1. Add a new Kconfig symbol, CONFIG_HAS_EVTCHN_2L (or re-use 
> HAS_SHARED_INFO suggested before), selected by x86 and ARM.

I'd stick to just HAS_SHARED_INFO as long as a separate control for 2-
level evtchn isn't strictly needed.

> 2. In evtchn_init() (event_channel.c:1627), guard the call:
>     #ifdef CONFIG_HAS_EVTCHN_2L
>        evtchn_2l_init(d);
>     #else
>        evtchn_none_init(d);
>     #endif
> 3. Add a small stub ops table (probably in event_fifo.c or a new 
> event_none.c) with no-op set_pending/clear_pending/unmask, is_pending 
> returning false, is_masked returning true (valid until 
> evtchn_fifo_init_control() replaces them).

That's one of the options (the stubs could then as well live in
event_channel.c). Another might be to put the FIFO ops in place right
away, making sure they can cope with evtchn_fifo_init_control() not
having been called yet.

>>>>> --- a/xen/common/domain.c
>>>>> +++ b/xen/common/domain.c
>>>>> @@ -320,7 +320,7 @@ void vcpu_info_reset(struct vcpu *v)
>>>>>        struct domain *d = v->domain;
>>>>>    
>>>>>        v->vcpu_info_area.map =
>>>>> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
>>>>> +        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS && d->shared_info)
>>>>>             ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>>>>             : &dummy_vcpu_info);
>>>>>    }
>>>>
>>>> At the example of this: The extra conditionals are dead code on x86 and
>>>> Arm. While the status of the respective Misra rule is still uncertain
>>>> for Xen, imo we'd be better off avoiding the introduction of new dead
>>>> code. Which in turn means we may need some kind of abstraction to have
>>>> these extra conditionals in place only for arch-es not supporting
>>>> shared-info at all.
>>>
>>> What about then add config HAS_SHARED_INFO to xen/common/Kconfig and then:
>>
>> We're getting closer. Imo we want to go farther, though: shared_info() as a
>> construct should be unavailable when !HAS_SHARED_INFO. _That_ then will
>> make obvious (by causing build failures) that all respective use sites were
>> properly dealt with.
> 
> I will add then:
> 
> +#ifdef CONFIG_HAS_SHARED_INFO
>   #define shared_info(d, field)      __shared_info(d, (d)->shared_info, 
> field)
> +#endif
> 
> But with doing that we have only option of using #ifdef HAS_SHARED_INFO 
> in the place where shared_info() is used. If it is fine then I will be 
> happy to do in this way.

Well, I gave a suggestion to avoid such #ifdef-ary, ...

>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -319,10 +319,14 @@ void vcpu_info_reset(struct vcpu *v)
>>>    {
>>>        struct domain *d = v->domain;
>>>
>>> +#ifdef CONFIG_HAS_SHARED_INFO
>>>        v->vcpu_info_area.map =
>>> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS && d->shared_info)
>>> -         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>> -         : &dummy_vcpu_info);
>>> +        (v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
>>> +        ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>> +        : &dummy_vcpu_info;
>>> +#else
>>> +    v->vcpu_info_area.map = &dummy_vcpu_info;
>>> +#endif
>>>    }
>>
>> I agree with #ifdef here.
>>
>>> --- a/xen/common/event_fifo.c
>>> +++ b/xen/common/event_fifo.c
>>> @@ -562,9 +562,10 @@ static void setup_ports(struct domain *d, unsigned
>>> int prev_evtchns)
>>>
>>>            evtchn = evtchn_from_port(d, port);
>>>
>>> -        if ( d->shared_info &&
>>> -             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>> +#ifdef CONFIG_HAS_SHARED_INFO
>>> +        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
>>>                evtchn->pending = true;
>>> +#endif
>>
>> While as per above shared_info() would best not exist when !HAS_SHARED_INFO
>> (in which case #ifdef may be unavoidable here), an alternative where
>> IS_ENABLED() could be used here may want at least considering. E.g.
>> causing a link-time failure when shared_info() is used (and not compiled
>> out).

... here. There are downsides to this, so which route to go needs settling
on.

>>> --- a/xen/common/time.c
>>> +++ b/xen/common/time.c
>>> @@ -94,8 +94,9 @@ void update_domain_wallclock_time(struct domain *d)
>>>        uint32_t *wc_version;
>>>        uint64_t sec;
>>>
>>> -    if ( !d->shared_info )
>>> -        return;
>>> +#ifndef CONFIG_HAS_SHARED_INFO
>>> +    return;
>>> +#endif
>>>
>>>        spin_lock(&wc_lock);
>>
>> Constructs like this are imo somewhat ugly. Using IS_ENABLED() instead
>> would make things at least a little better (again imo).
> 
> Considering mentioned above it would be better to #ifdef the whole buddy 
> of the function:
> 
> void update_domain_wallclock_time(struct domain *d)
>   {
> +#ifdef CONFIG_HAS_SHARED_INFO
> +
>       uint32_t *wc_version;
>       uint64_t sec;
> 
> -#ifndef CONFIG_HAS_SHARED_INFO
> -    return;
> -#endif
> -
>       spin_lock(&wc_lock);
> 
>       wc_version = &shared_info(d, wc_version);
> @@ -120,6 +118,8 @@ void update_domain_wallclock_time(struct domain *d)
>       *wc_version = version_update_end(*wc_version);
> 
>       spin_unlock(&wc_lock);
> +
> +#endif /* CONFIG_HAS_SHARED_INFO */
>   }

In which case there's no point having use sites actually call here. I.e.
we then may want to have an inline stub when !HAS_SHARED_INFO.

> Considering also that shared_info is expected to be used only for 2L 
> then it would be better to introduce CONFIG_HAS_EVTCHN_2L instead.

How does the event channel model in use matter for
update_domain_wallclock_time()?

Jan

