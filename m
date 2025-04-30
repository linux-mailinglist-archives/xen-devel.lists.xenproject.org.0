Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AF6AA4319
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 08:28:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973342.1361483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA0vI-0006iw-6j; Wed, 30 Apr 2025 06:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973342.1361483; Wed, 30 Apr 2025 06:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA0vI-0006h2-3j; Wed, 30 Apr 2025 06:28:00 +0000
Received: by outflank-mailman (input) for mailman id 973342;
 Wed, 30 Apr 2025 06:27:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA0vH-0006gt-0s
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 06:27:59 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41840e7f-258c-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 08:27:57 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5f62ef3c383so12548308a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 23:27:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecf9a17sm890289466b.99.2025.04.29.23.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 23:27:56 -0700 (PDT)
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
X-Inumbo-ID: 41840e7f-258c-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745994477; x=1746599277; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1qD8/eC/zZl2V3aqGq7id38qjUXXTHFtyhEwCHL44+k=;
        b=P/RCrkeX1+uorpIDM2hfXf7DE40YVEwiWwHPXGAjRBpJvp4VVeN/6hxySqqv7+mqFf
         iLPlQC9KE8wDhCfNyzHfUcSSdM8XlU8EjB9vFE9zM09eCKvL0TZ3kVaBNUm2wfpCy3AE
         kFuEG1K1339a0juBk/nPAXYHaq1D/I7zQ93XxowrSC9NG0Njp8mQvLws22DYVxPe5INM
         X8zH/CW2CxrtEwAiyoS6FUlZTS5YdLVqG09/49ag79dD0iJvkhKmsfaSPF7z8wjR1fKd
         i1nEKPahRr8ltm2sGOrBHXHo+FdII3GvlGHu0AWNqIL0hZbZ3WHmlNogMNFOWGUQkNZR
         1K4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745994477; x=1746599277;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qD8/eC/zZl2V3aqGq7id38qjUXXTHFtyhEwCHL44+k=;
        b=REi1HjTF1kDHOWQxpZdHzzvuljoQ0MJ0d3/I2L8YZc65EEQeE4evMORyaBzOvL1WuM
         knoR73MQRHrHUIIYcLZAqiXeRq4I2mKHbnqhdHLYFKKDLEI5W8YzN31bYFctwNIrDwyb
         5iOKTSbRzIMk5ZVgzOVCyfNH2B//YSD1qLqn3Y06VY1gefj0taMg5ZU37rM55E7Wi8ci
         yKuUhxxz/fy8e58J2jnIfX8t5kJ+Owiask1P8mINehsi9pH+xg9ejRxfQNFX9t5DF6Kg
         XUQKzT2ttQKA6dckgyyi97ScVTDmhLXkwYsxSwlYJ+WhKutUohyyR/EF3bDZSoOZBkRA
         1ZzA==
X-Forwarded-Encrypted: i=1; AJvYcCWvadb5qpWp8vEWc+eQVd854EobQ4V32Bsa2uPNicndcykLkvAoI7YMqmgN4HhiMyY0Tjy5j9ypzkk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVTvSGCM3VfOf0jlkLAuNWEcLFtVve2pi1Mj9mrZGOwdqNWhLq
	26qHMv6qYRjNAP7L/Bd30m/AfRrNiZU4aswKueDsvzPEGKiurI1W4aPJaT4nKA==
X-Gm-Gg: ASbGnctwsCUuNdNM46j+EsKnc+GCwBipIVJiB9CrNXM5/DEWsfnXPs1JfI7VXIc2yVB
	z7XSC+T7X8/LJkuC7MDCnFXbs0xJmyA9H4J1DghFKrVd60nEzKzRjLmeZnweCEODyfY7K9nMfCk
	eCEp9tbPookisVstEB7tcAeNA9GkMnTUZ6DkJ0buKy/gxNY0olWU1D9tRXJnb6QEh5ry7Qj/OPI
	LvnS4SWRVWqjQEficG5D2E3HHI5cG+UFlUC9mZsJrUepzaHVuCkTKw/RWFTnjQerUs2ySgTOmt3
	KDUt+jnN6Q4bea0fWfjIlInbw49y+SKaEcl6hOkOG04WmiGw3b+PT9Rlp4u0fgD60UAhWd4CvsH
	a3iBFBa0w8nPQxvi9zGzdTrujTA==
X-Google-Smtp-Source: AGHT+IGue4q2aECjR03a+d+yd0Vbla8JGqM9Y3b0UAPR7VsZH+oxddXv7VbITO36UZvTX5zV55WHEg==
X-Received: by 2002:a17:907:7285:b0:ac3:49f0:4d10 with SMTP id a640c23a62f3a-acee24b4576mr133689366b.38.1745994476828;
        Tue, 29 Apr 2025 23:27:56 -0700 (PDT)
Message-ID: <59bfc389-66c8-4d0f-92e3-c0079a807374@suse.com>
Date: Wed, 30 Apr 2025 08:27:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 jason.andryuk@amd.com, agarciav@amd.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
 <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com>
 <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>
 <06b66971-d8db-456f-8e83-a20ff7df8f5e@suse.com>
 <alpine.DEB.2.22.394.2504291425320.3879245@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504291425320.3879245@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2025 23:52, Stefano Stabellini wrote:
> On Tue, 29 Apr 2025, Jan Beulich wrote:
>> On 28.04.2025 22:00, Stefano Stabellini wrote:
>>> On Mon, 28 Apr 2025, Jan Beulich wrote:
>>>> On 25.04.2025 22:19, Stefano Stabellini wrote:
>>>>> --- a/xen/arch/x86/mm.c
>>>>> +++ b/xen/arch/x86/mm.c
>>>>> @@ -4401,7 +4401,7 @@ int steal_page(
>>>>>      const struct domain *owner;
>>>>>      int rc;
>>>>>  
>>>>> -    if ( paging_mode_external(d) )
>>>>> +    if ( paging_mode_external(d) && !is_hardware_domain(d) )
>>>>>          return -EOPNOTSUPP;
>>>>>  
>>>>>      /* Grab a reference to make sure the page doesn't change under our feet */
>>>>
>>>> Is this (in particular the code following below here) a safe thing to do
>>>> when we don't properly refcount page references from the P2M, yet? It's
>>>> Dom0, yes, but even there I might see potential security implications (as
>>>> top violating privacy of a guest).
>>>
>>> I don't think I am following, could you please elaborate more? The
>>> change I am proposing is to allow Dom0 to share its own pages to the
>>> co-processor. DomUs are not in the picture. I would be happy to add
>>> further restriction to that effect. Is there something else you have in
>>> mind?
>>
>> Once "shared" with the PSP, how would Xen know that this sharing has stopped?
>> Without knowing, how could it safely give the same page to a DomU later on?
>> ("Safely" in both directions: Without compromising privacy of the DomU and
>> without compromising host safety / security.)
> 
> Why would Xen later assign the same page to a DomU? The page comes
> from the hardware domain, which, as of today, cannot be destroyed. BTW I
> realize it is a bit different, but we have been doing the same thing
> with Dom0 1:1 mapped on ARM since the start of the project.

The life cycle of the page within Dom0 may be such that a need arises to
move it elsewhere (balloon out, grant-transfer, and what not).

>>>>> --- a/xen/common/memory.c
>>>>> +++ b/xen/common/memory.c
>>>>> @@ -794,7 +794,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>>>>>              rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
>>>>>                                          exch.out.extent_order) ?: rc;
>>>>>  
>>>>> -            if ( !paging_mode_translate(d) &&
>>>>> +            if ( (!paging_mode_translate(d) || is_hardware_domain(d)) &&
>>>>>                   __copy_mfn_to_guest_offset(exch.out.extent_start,
>>>>>                                              (i << out_chunk_order) + j,
>>>>>                                              mfn) )
>>>>
>>>> Wait, no: A PVH domain (Dom0 or not) can't very well make use of MFNs, can
>>>> it?
>>>
>>> One way or another Dom0 PVH needs to know the MFN to pass it to the
>>> co-processor.
>>
>> I see. That's pretty odd, though. I'm then further concerned of the order of
>> the chunks. At present we're rather lax, in permitting PVH and PV Dom0 the
>> same upper bound. With both CPU and I/O side translation there is, in
>> principle, no reason to permit any kind of contiguity. Of course there's a
>> performance aspect, but that hardly matters in the specific case here. Yet at
>> the same time, once we expose MFNs, contiguity will start mattering as soon
>> as any piece of memory needs to be larger than PAGE_SIZE. Which means it will
>> make tightening of the presently lax handling prone to regressions in this
>> new behavior you're introducing. What chunk size does the PSP driver require?
> 
> I don't know. The memory returned by XENMEM_exchange is contiguous,
> right? Are you worried that Xen cannot allocate the requested amount of
> memory contiguously?

That would be Dom0's problem then. But really for a translated guest the
exchanged chunks being contiguous shouldn't matter, correctness-wise. That is,
within Xen, rather than failing a request, we could choose to retry using
discontiguous chunks (contiguous only in GFN space). Such an (afaict)
otherwise correct change would break your use case, as it would invalidate the
MFN information passed back. (This fallback approach would similarly apply to
other related mem-ops. It's just that during domain creation the tool stack
has its own fallback, so it may not be of much use right now.)

> We have been using this patch for months now and it
> has been working correctly to this day.

Sure, that's a good data point. Yet not a proof of correctness.

Jan

