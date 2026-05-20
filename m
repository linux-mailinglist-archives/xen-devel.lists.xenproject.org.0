Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KOQBEyjDWqu0gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:04:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739DE58D393
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313882.1583912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPfeX-0007ey-9d; Wed, 20 May 2026 12:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313882.1583912; Wed, 20 May 2026 12:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPfeX-0007cZ-6n; Wed, 20 May 2026 12:03:57 +0000
Received: by outflank-mailman (input) for mailman id 1313882;
 Wed, 20 May 2026 12:03:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wPfeV-0007cR-Aw
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 12:03:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPfeU-003szj-Ju
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:03:54 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0da329-bab6-0a2a0a5309dd-0a2a4507cb62-8
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:03:54 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0da32a-229c-0a2a45070019-d155802bc1d9-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:03:54 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490229aa522so14630605e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 05:03:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe7dd22sm174526595e9.7.2026.05.20.05.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 05:03:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1779278634; x=1779883434; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yW2WdulNizvKxY3NV0lffQCauWLj96CfNpycZyhRj+s=;
        b=O3aKlMl52znZvXD6eadddXVEFgwc5OjxvRnLByYp8DGfmvck8FT965wBrRhdCRdKUm
         /9+8Oh7c8APpCJvPGuGsTn6FP0qInRJMDNyShi3dkUqSnCdQPl4JfSERjuxGmlBVKXx6
         3slqk3iNfjPoyzxH7BozcWA28SEVt98OwWs9wJL6uBMLhmpS5cJ77oJfvxuIsZfjqJyk
         1N8RsfotvEhmSKtxDqFX0Iq0IZDGEUFd43DskdQAwLtBEGiLDAfjIsn00KO/4HBvuld9
         EHQeoJPME96wga1lh8jrRAkSMp/5CVqwGkeecW1Ogh10gqBe0HUJ7OwkVk1vJaJvNqOA
         qTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278634; x=1779883434;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yW2WdulNizvKxY3NV0lffQCauWLj96CfNpycZyhRj+s=;
        b=hhuoEPyJ0ROvyZ9f9S8HdNcJuzs4o+IdqSmV+9Ux2XH9NMQNRqjJjc5orbOaMdjcdu
         kJIVHFzcCMcXeCbAt+Uoe9KERycirvAeREzdexGRy1z9skKrt+dxKSCtD/5WMB3OGTxS
         0+9c77PhQgDfgF/PUU29oRORDKCvIwHlJrU16XIHFTigGVQgdjKtyVwbQrZCvlYEEP5t
         UX45Q4foeTpWl/pinCoNOLd8jWI40on7frEczbELbVJDzby1CIBf4sbrp93uv1O+usTM
         M+zeP/pzqZYHC+gjdaZfNy3YFPQzwaEr0cVLMtzqF/KlH1CaZMuK2V8D5ghF7CFRdbvf
         T4jA==
X-Forwarded-Encrypted: i=1; AFNElJ/t//401Z1XZIygl7+470bjq50t95FVBsBsrr309I4lellAHGF+Xkqh26bud+sJfwWsX7LgFhlE5Y0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyM1DiNqjXO9KiQ9FsNH91QsZ/RarHyBjwa0Ay8BmT8troiXDGq
	+ccFvxnQ5rPh1wYFMu26OKnCbC/voY+T3Iro2KLhh4A+DzjUqNS3jeINsN6sGUkalw==
X-Gm-Gg: Acq92OHY9NPdy+YmWulrU+3sMOoUwsOq+b6AXVxzYUQEI3UOFncxh/g5xAllgV9xagw
	zx8pd5kJt+MJBItEwywwfARRKT6PlIA6qHiCls55x1H+UUGvi4Ew+1L7RNzBqo8X3vOOMFTECM6
	+QIEYQ4Y8MX94RioeMjDa+dlhkg3dmxUZyqqPonO2oyuXrO1/qNbseS39sxuM+KVijjcWdfTqns
	J1m2wvmJxODtIBLNySI8vGPMUN9i0hEA31uQR+aPFtz0M7OVXvOSsA7aCALGoOsowWuWGFEb3E2
	2YlBIN10CAtMANRgDGIw+fTdkgUdTRnP8Ktt4pEHJKyuAt27/cXGkVp6vO8Y5exD9lV0USMm4wS
	Ia47UaJBmPBALsBitNwfZnR9aNUQfcDhV1+I/iNWlbVVvZVYdE2lfRgn4beJVg26TH7iqQ1Wst+
	a94NJluVHsMGrbJqISHtSg2Mq8Nb+QKusL2DZpIWvuFfIdZvLQaLRDUnWbgcLjaK8O7+6xSh9GP
	heiD3EOEcTtOfU/CltTgmeeDA==
X-Received: by 2002:a05:600c:4ed0:b0:490:778:4fec with SMTP id 5b1f17b1804b1-49007785052mr241394625e9.33.1779278633692;
        Wed, 20 May 2026 05:03:53 -0700 (PDT)
Message-ID: <2d8166e4-009f-4066-b96d-fb9e41b548a1@suse.com>
Date: Wed, 20 May 2026 14:03:52 +0200
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
In-Reply-To: <12e89d4e-2856-4130-aaa7-1ec1a742c72f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1779278634-09F6EC48-F09931CD/10/73395122804
X-purgate-type: spam
X-purgate-size: 4547
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:baptiste.le-duc@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 739DE58D393
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.05.2026 13:33, Oleksii Kurochko wrote:
> 
> 
> On 5/19/26 1:53 PM, Jan Beulich wrote:
>> On 19.05.2026 13:22, Oleksii Kurochko wrote:
>>> On 5/19/26 12:55 PM, Oleksii Kurochko wrote:
>>>> On 5/19/26 11:37 AM, Jan Beulich wrote:
>>>>> On 19.05.2026 10:39, Oleksii Kurochko wrote:
>>>>>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
>>>>>> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
>>>>>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>>>>>>
>>>>>> However, it does not guard against d->shared_info being NULL.  The
>>>>>> shared_info() macro expands to a member access through d->shared_info,
>>>>>> so when an architecture does not allocate a shared_info page the
>>>>>> dereference triggers UBSAN:
>>>>>>     UBSAN: Undefined behaviour in common/domain.c:325:10
>>>>>>     member access within null pointer of type 'struct shared_info_t'
>>>>>>
>>>>>> Extend the existing fallback condition to also cover the case where no
>>>>>> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
>>>>>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>>>>>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>>>>>
>>>>>> Fixes: 295514ff75506 ("common: convert vCPU info area registration")
>>>>>
>>>>> I question this, largely (but not only) because I also ...
>>>>>
>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>>> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
>>>>>> ---
>>>>>> RISC-V does not allocate a shared_info page at the momemnt because its
>>>>>> guests run in dom0less mode and do not use the Xen PV ABI, so
>>>>>> d->shared_info remains NULL throughout domain lifetime.
>>>>>
>>>>> ... question this mode of operation. Yes, you may (for now) be able to
>>>>> get
>>>>> away without, but e.g. event channels will want supporting at some point.
>>>>> Which will require a shared info page. Better put that in place right
>>>>> away,
>>>>> even if the guests you test with don't use it (yet). Certain other common
>>>>> code also assumes d->shared_info to never be NULL for an alive domain.
>>>>>
>>>>
>>>> Would it be fine than to allocate it in arch_domain_create() ... :
>>>>
>>>>       if ( (d->shared_info = alloc_xenheap_pages(0, 0)) == NULL )
>>>>           goto fail;
>>>>
>>>>       clear_page(d->shared_info);
>>>>
>>>> ... but without calling share_xen_page_with_guest() after that
>>>> allocation as share_xen_page_with_guest() isn't implemented at the moment?
>>
>> I would have said "yes" here, but ...
>>
>>> Or could it be an option for all arch-s move allocation of
>>> d->shared_info to domain_create() in common just after arch_domain_create()?
>>
>> ... Andrew's reply pretty much rules out not only this option, but the
>> shared-info-page concept as a whole (for RISC-V). See my reply there. In
>> the meantime, the change as suggested may then indeed be what we want to
>> go with, albeit (a) with a better description and (b) perhaps covering
>> all d->shared_info uses.
> 
> Looking at guest kernel code (Linux), FIFO is tried first, so if RISC-V 
> is going to support only FIFO, d->shared_info could legally be NULL.
> 
> Looking at the Xen side, if an architecture decides to support only 
> FIFO, d->shared_info is touched only in vcpu_info_reset(), which is 
> called from vcpu_create().
> 
> All other places where d->shared_info is accessed should not be 
> reachable except for one case in event_fifo.c: when a guest issues the 
> EVTCHNOP_init_control hypercall, setup_ports() reads from shared_info(d, 
> evtchn_pending):
>    static void setup_ports(struct domain *d, unsigned int prev_evtchns)
>    {
>    ...
>            if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending))
>                evtchn->pending = true;
>    ...
>        }
>    }
> 
> This looks like it handles the transition from the 2L ABI to the FIFO 
> ABI: if a guest started with 2L and then switched to FIFO, any events 
> already pending in shared_info(d, evtchn_pending) need to be migrated to 
> FIFO's per-channel evtchn->pending flag. But it looks like I am missing 
> something here as I mentioned at the start that Linux uses or FIFO or 2L.
> 
> Am I missing something?

Quite likely you aren't, but I didn't check. My earlier "covering all" may
well resolve to merely stating things accordingly in the patch description.

Jan

