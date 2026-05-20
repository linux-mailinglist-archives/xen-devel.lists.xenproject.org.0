Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMA6Gq7DDWr32wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 16:22:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C709758F7F5
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 16:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314015.1584030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPhoB-0007XR-CG; Wed, 20 May 2026 14:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314015.1584030; Wed, 20 May 2026 14:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPhoB-0007Uu-9K; Wed, 20 May 2026 14:22:03 +0000
Received: by outflank-mailman (input) for mailman id 1314015;
 Wed, 20 May 2026 14:22:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPhoA-0007Uo-76
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:22:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPho9-004OG2-JC
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 16:22:01 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0dc380-e002-0a2a0a5209dd-0a2a4504a230-18
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 16:22:01 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0dc389-1dec-0a2a45040019-d155dd34d577-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 16:22:01 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43d7645adbdso3360641f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 07:22:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3b18fsm50031998f8f.11.2026.05.20.07.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 07:22:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779286921; x=1779891721; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c/9AEJH/l3xIg12uGcEio/MBEycibDFrO4TX5PYp34M=;
        b=cTpGx3b/Bh6ScVuj0RODIbbZtyWHXHDVaIq3VqwtFL05P4ssFrj+el6x50x8h6xrg4
         LSStvBYtyNi4445w6uaxog+4r+h8xeWHeZX+DonNz2A1yjfvrdDnO4WFA/TWMbXknQ0h
         GEIvtGb3F/pO6A+4INDawe7n1+YFgd6jgGS7hpuHZi/LgU30DsIBg1a1f1OStBfyKyQj
         OxnB4pr0Smz/QctWFOiOdfYH7ruAYFmVG0fsQQCkTD//2MRFol2XhVRDJtmVcUZxy5KH
         3jtYlZqvmbtOM5pSMt5lM2qmnAnGIbajKdt3iVVVWrZXhhR0zrmGtTMrVMU/S/ahFZV6
         1vNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286921; x=1779891721;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/9AEJH/l3xIg12uGcEio/MBEycibDFrO4TX5PYp34M=;
        b=RqmH+TzPaan6NkukI2dIQPdsGMIxFjBYvO2V50tRzbJO/aQj9YTP/aZdxdB4593OID
         c3HD9sXntqzeyd1JLSAqmUx7k5ylKD1Yd8D+NDkHF2L0+HpqFKaGmP+ilMoDD6EmLm/b
         /7ZighTMxmotTQ9l8aGEZdR+J3ToGCjapKNUoTlU3q4AU6OQNGRBaRRsp49KxxpPLZRa
         1epgxfakI4mf3lyvm9S144v6D4WJzmGt6ho1bCKUwRXOFTPCbMKd2f+zO6MM6Lus8NV/
         3UzQCSCqcItJw1p/oZVJodCfOwq9g744Mowd8zAw84nWvK5PKvm/KTw7sKf8U1rkeuRW
         GinA==
X-Forwarded-Encrypted: i=1; AFNElJ/tX/bjkESG6Vz3jmAhsbrL8CRu0GUo6rRp2D0BI2kLztScn/bN3Ug9VgyyxYP3BRpZdz9qU0aSIss=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8l+WJFaE7qNNcJtLR2euPmWvzjXOvNIZU5YTmTYM/7DEdsQHK
	3eh3SRCb9ys2NWLwC3nRsYzONJAyYroL/q9pSR8HlIbr3M0fHEldGvy3bNhH5EScwA==
X-Gm-Gg: Acq92OGBQyEuZteTUczZ50P6s/dlOfgIBashwrZMWB8cV6URw05tYild+VeLM22vgIn
	QGOl+RXSaCtInygFPzbMdHSBIctg8nqfJ+VG0dOgkdzCz5oq0S67EfBhEfi4Flivv2ewaoojHtg
	bAUCJK9Wb5HGLtVrWkKh98eamvBxM+5JCgelbZW9t85RORn+Y0+0z2RJI1l19RqQLhPsAieU3wF
	CJSs2EQel9fvqiW68ZgiNQT44Aail7KHZdDvuTx9YZ0pbvnW+fvjamrGr51XE2cniRfnVDOuKS0
	bmxxDmpX75b+qXMH1P/Zly4Y6PqWhCmFEiGMPgctyvX3LenbHZJUh41qvtXE32LNa3mrZi3tLf8
	6uuyLzhzVb7BClQq1i3mq6luVDWW+N+c2K7y9QGX/FuBR7BgbVIa2NeMhLFSdfo9giaedO5x1fj
	hjoxqXeA4qB2QW4VHeqT8PfNDT9K+LfBfZ640mxKVeaimdUcRBBsKyefpSBCSTVyd4os65dU2y2
	c+b1SJU09TGIGvsZeyMUF218g==
X-Received: by 2002:a5d:5f53:0:b0:44b:9dca:7d93 with SMTP id ffacd0b85a97d-45e5c58761emr37830394f8f.26.1779286920565;
        Wed, 20 May 2026 07:22:00 -0700 (PDT)
Message-ID: <5f2013a0-d90b-49c9-bd18-afeffebac74e@suse.com>
Date: Wed, 20 May 2026 16:21:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/domain: fix UBSAN null pointer dereference in
 vcpu_info_reset()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <eec28059-d7c5-4d30-80ff-7b1b57d706ec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1779286921-41D7C3FF-A1796CA4/10/73395122804
X-purgate-type: spam
X-purgate-size: 5648
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:baptiste.le-duc@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C709758F7F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.05.2026 15:40, Oleksii Kurochko wrote:
> 
> 
> On 5/20/26 2:03 PM, Jan Beulich wrote:
>> On 20.05.2026 13:33, Oleksii Kurochko wrote:
>>>
>>>
>>> On 5/19/26 1:53 PM, Jan Beulich wrote:
>>>> On 19.05.2026 13:22, Oleksii Kurochko wrote:
>>>>> On 5/19/26 12:55 PM, Oleksii Kurochko wrote:
>>>>>> On 5/19/26 11:37 AM, Jan Beulich wrote:
>>>>>>> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>>>>>>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
>>>>>>>> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
>>>>>>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>>>>>>
>>>>>>>> However, it does not guard against d->shared_info being NULL.  The
>>>>>>>> shared_info() macro expands to a member access through d->shared_info,
>>>>>>>> so when an architecture does not allocate a shared_info page the
>>>>>>>> dereference triggers UBSAN:
>>>>>>>>      UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>>>>>      member access within null pointer of type 'struct shared_info_t'
>>>>>>>>
>>>>>>>> Extend the existing fallback condition to also cover the case where no
>>>>>>>> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
>>>>>>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>>>>>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>>>>>>
>>>>>>>> Fixes: 295514ff75506 ("common: convert vCPU info area registration")
>>>>>>>
>>>>>>> I question this, largely (but not only) because I also ...
>>>>>>>
>>>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>>>>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>>>>>>> ---
>>>>>>>> RISC-V does not allocate a shared_info page at the momemnt because its
>>>>>>>> guests run in dom0less mode and do not use the Xen PV ABI, so
>>>>>>>> d->shared_info remains NULL throughout domain lifetime.
>>>>>>>
>>>>>>> ... question this mode of operation. Yes, you may (for now) be able to
>>>>>>> get
>>>>>>> away without, but e.g. event channels will want supporting at some point.
>>>>>>> Which will require a shared info page. Better put that in place right
>>>>>>> away,
>>>>>>> even if the guests you test with don't use it (yet). Certain other common
>>>>>>> code also assumes d->shared_info to never be NULL for an alive domain.
>>>>>>>
>>>>>>
>>>>>> Would it be fine than to allocate it in arch_domain_create() ... :
>>>>>>
>>>>>>        if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>>>>>>            goto fail;
>>>>>>
>>>>>>        clear_page(d->shared_info);
>>>>>>
>>>>>> ... but without calling share_xen_page_with_guest() after that
>>>>>> allocation as share_xen_page_with_guest() isn't implemented at the moment?
>>>>
>>>> I would have said "yes" here, but ...
>>>>
>>>>> Or could it be an option for all arch-s move allocation of
>>>>> d->shared_info to domain_create() in common just after arch_domain_create()?
>>>>
>>>> ... Andrew's reply pretty much rules out not only this option, but the
>>>> shared-info-page concept as a whole (for RISC-V). See my reply there. In
>>>> the meantime, the change as suggested may then indeed be what we want to
>>>> go with, albeit (a) with a better description and (b) perhaps covering
>>>> all d->shared_info uses.
>>>
>>> Looking at guest kernel code (Linux), FIFO is tried first, so if RISC-V
>>> is going to support only FIFO, d->shared_info could legally be NULL.
>>>
>>> Looking at the Xen side, if an architecture decides to support only
>>> FIFO, d->shared_info is touched only in vcpu_info_reset(), which is
>>> called from vcpu_create().
>>>
>>> All other places where d->shared_info is accessed should not be
>>> reachable except for one case in event_fifo.c: when a guest issues the
>>> EVTCHNOP_init_control hypercall, setup_ports() reads from shared_info(d,
>>> evtchn_pending):
>>>     static void setup_ports(struct domain *d, unsigned int prev_evtchns)
>>>     {
>>>     ...
>>>             if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending))
>>>                 evtchn->pending = true;
>>>     ...
>>>         }
>>>     }
>>>
>>> This looks like it handles the transition from the 2L ABI to the FIFO
>>> ABI: if a guest started with 2L and then switched to FIFO, any events
>>> already pending in shared_info(d, evtchn_pending) need to be migrated to
>>> FIFO's per-channel evtchn->pending flag. But it looks like I am missing
>>> something here as I mentioned at the start that Linux uses or FIFO or 2L.
>>>
>>> Am I missing something?
>>
>> Quite likely you aren't, but I didn't check. My earlier "covering all" may
>> well resolve to merely stating things accordingly in the patch description.
> 
> If either FIFO or 2L can be used, shouldn't guest_test_bit(d, port, 
> &shared_info(d, evtchn_pending)) in setup_ports() be dropped? If FIFO 
> was chosen by Linux, there won't be any events in &shared_info(d, 
> evtchn_pending), so it is essentially dead code that could just be 
> dropped.

Why would it be dead code? Who said that a guest couldn't to 2L for a
while, then switch to FIFO? Think of boot loaders, for example.

Jan

> Or would it be better to leave it and skip only if 
> d->shared_info is allocated: if ( d->shared_info && guest_test_bit(...) 
> )  to cover the case when a guest wants to switch from 2L to FIFO (if 
> that is even a possible case at all, since as I mentioned above, the 
> guest (Linux) chooses the event ABI once and it stays for its lifetime)?
> 
> ~ Oleksii


