Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010B2997E8D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 09:38:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815597.1229575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1synjc-00010X-GZ; Thu, 10 Oct 2024 07:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815597.1229575; Thu, 10 Oct 2024 07:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1synjc-0000yx-DC; Thu, 10 Oct 2024 07:37:20 +0000
Received: by outflank-mailman (input) for mailman id 815597;
 Thu, 10 Oct 2024 07:37:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1synjb-0000yr-Ff
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 07:37:19 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79a4d982-86da-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 09:37:17 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2fac3f20f1dso5508291fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 00:37:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c937119cb7sm397087a12.36.2024.10.10.00.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 00:37:16 -0700 (PDT)
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
X-Inumbo-ID: 79a4d982-86da-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728545837; x=1729150637; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tQnXuhNqMxB9TrZXnrkJ3OQqznQ3f1gP5LlC3kIKJRQ=;
        b=SBsphgEy5OvhSTUEk7vG2sX5uv+lNI0fQQyGk3viiWvTxeGJclVSvMKsi++g9l9hfi
         dZuj7m2wx9KL60goAKuKIN7jX131pWfQWA7g9J44s8cAsdi8Wob2AEk9w+594z/zIS7Q
         KC7fAyfrmSxNtCsz144PA8K3HGvQB0HRecy+i8/eBPGGWj55ViW4bKnMRIvvqKp7zzVe
         yEX0FPvm5T4LX2nMmTK9FTWFkrvVl5vmlGU05x46n1t+6DsGKcQ2LJTumiUWmX2oLlVZ
         FxU7bdc5G3PJTzSilK8Gu5iZNxNVTDfTf4kU+otMFODmsYzANiScWwiLd+LpNSg8ZRqd
         dDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728545837; x=1729150637;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQnXuhNqMxB9TrZXnrkJ3OQqznQ3f1gP5LlC3kIKJRQ=;
        b=NowYzZyGKZsdiUwYQu7tW4LowLWLvTMoou/oO1FMIt9wiTb6qmyZGuKu2A7Rlr8pAG
         BVfuDmzRC+YKPnL83SuAXlNxysxcwe7spaiW295qzZvx7eD0eZPJ69FhZNbG7hKuLpgu
         g/ElHT/ZcPiyQNb3YxnBMrO1HZtGlsMpp16PvYcd01bF3CBfQSR0dQt+Ki814wQCM7pr
         7Uo9K/Ovn6oTZxh1p9xGFmRL5gX59+nLaCvbMrfDWskdikMGvmVCtI1gT/+QoHJE5FTu
         GByO/T7pRXOhB8VNabDIkQAD4GZVRawwKTyec567y327RpjYoZdOOdoWXxsLFCD1k/8i
         MxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVprt2GRM+aX229qt/TAUcr3ZXAgJ2SXTbF5WRgK+UdA2TX7Z25XT+AL/npiKcg5DZT7V4AmEZUnLk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywf4c9wKkqkEPWnRuYN7j7nZmzZIw+U6LFgguc73e2YAzg1DIyz
	xFbYOatI3XkAJ6SBb00V1wEJ+I+dz788cwcv2Guhxkgia9kA1+YRj/uIZoEEcg==
X-Google-Smtp-Source: AGHT+IHlmBrMf6y829tp/3wYt8FcIF+gpF58pDTBDybLvFVd1B8B20+aCzUsX7z5rdfzGhpI5DZZ+g==
X-Received: by 2002:a05:651c:b0e:b0:2fa:ccae:d1c5 with SMTP id 38308e7fff4ca-2fb1872cdb0mr36957391fa.10.1728545836753;
        Thu, 10 Oct 2024 00:37:16 -0700 (PDT)
Message-ID: <18629419-6051-4d00-8b1a-218427b93ef6@suse.com>
Date: Thu, 10 Oct 2024 09:37:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] lib/x86: Relax checks about policy compatibility
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-2-alejandro.vallejo@cloud.com>
 <1a57c4c9-baa9-44b4-8a3f-0f821d8c2484@suse.com>
 <D4RED6YCM7AH.1QVPIV4K9SB5O@cloud.com>
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
In-Reply-To: <D4RED6YCM7AH.1QVPIV4K9SB5O@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2024 17:57, Alejandro Vallejo wrote:
> On Wed Oct 9, 2024 at 10:40 AM BST, Jan Beulich wrote:
>> On 01.10.2024 14:37, Alejandro Vallejo wrote:
>>> --- a/xen/lib/x86/policy.c
>>> +++ b/xen/lib/x86/policy.c
>>> @@ -15,7 +15,16 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>>>  #define FAIL_MSR(m) \
>>>      do { e.msr = (m); goto out; } while ( 0 )
>>>  
>>> -    if ( guest->basic.max_leaf > host->basic.max_leaf )
>>> +    /*
>>> +     * Old AMD hardware doesn't expose topology information in leaf 0xb. We
>>> +     * want to emulate that leaf with credible information because it must be
>>> +     * present on systems in which we emulate the x2APIC.
>>> +     *
>>> +     * For that reason, allow the max basic guest leaf to be larger than the
>>> +     * hosts' up until 0xb.
>>> +     */
>>> +    if ( guest->basic.max_leaf > 0xb &&
>>> +         guest->basic.max_leaf > host->basic.max_leaf )
>>>          FAIL_CPUID(0, NA);
>>>  
>>>      if ( guest->feat.max_subleaf > host->feat.max_subleaf )
>>
>> I'm concerned by this in multiple ways:
>>
>> 1) It's pretty ad hoc, and hence doesn't make clear how to deal with similar
>> situations in the future.
> 
> I agree. I don't have a principled suggestion for how to deal with other cases
> where we might have to bump the max leaf. It may be safe (as is here becasue
> everything below it is either used or unimplemnted), but AFAIU some leaves
> might be problematic to expose, even as zeroes. I suspect that's the problem
> you hint at later on about AMX and AVX10?

Not exactly, but perhaps somewhat related (see below).

>> 2) Why would we permit going up to leaf 0xb when x2APIC is off in the respective
>> leaf?
> 
> I assume you mean when the x2APIC is not emulated? One reason is to avoid a
> migration barrier, as otherwise we can't migrate VMs created in "leaf
> 0xb"-capable hardware to non-"leaf 0xb"-capable even though the migration is
> perfectly safe.

Leaf 0xb ought to be synthesized anyway (to match the guest's topology);
hardware capabilities hence don't matter here.

> Also, it's benign and simplifies everything. Otherwise we have to find out
> during early creation not only whether the host has leaf 0xb, but also whether
> we're emulating an x2APIC or not.

The policy passed by the tool stack will tell you what the choice there was.

> Furthermore, not doing this would actively prevent emulating an x2APIC on AMD
> Lisbon-like silicon even though it's fine to do so.

I'm afraid I don't understand this. If the tool stack cleared the x2APIC bit,
x2APIC ought to not be emulated. If it sets it (as permitted by the max
policy), x2APIC would be emulated.

> Note that we have a broken
> invariant in existing code where the x2APIC is emulated and leaf 0xb is not
> exposed at all; not even to show the x2APIC IDs.

Well, fixing this is what this series is about, isn't it?

>> 3) We similarly force a higher extended leaf in order to accommodate the LFENCE-
>> is-dispatch-serializing bit. Yet there's no similar extra logic there in the
>> function here.
> 
> That's done on the host policy though, so there's no clash.

There's no clash, sure, but ...

> In calculate_host_policy()...
> 
> ```
>       /*
>        * For AMD/Hygon hardware before Zen3, we unilaterally modify LFENCE to be
>        * dispatch serialising for Spectre mitigations.  Extend max_extd_leaf
>        * beyond what hardware supports, to include the feature leaf containing
>        * this information.
>        */
>       if ( cpu_has_lfence_dispatch )
>           max_extd_leaf = max(max_extd_leaf, 0x80000021U);
> ```
> 
> One could imagine doing the same for leaf 0xb and dropping this patch, but then
> we'd have to synthesise something on that leaf for hardware that doesn't have
> it, which is a lot more annoying.

... we're doing things one way there and another way here. Which is generally
undesirable imo.

>> 4) While there the guest vs host check won't matter, the situation with AMX and
>> AVX10 leaves imo still wants considering here right away. IOW (taken together
>> with at least 3) above) I think we need to first settle on a model for
>> collectively all max (sub)leaf handling. That in particular needs to properly
>> spell out who's responsible for what (tool stack vs Xen).
> 
> I'm not sure I follow. What's the situation with AMX and AVX10 that you refer
> to?

See the prereq series to both, most recently posted at
https://lists.xen.org/archives/html/xen-devel/2024-08/msg00591.html

That's hacky; Andrew has indicated that he'd like to take care of this (mostly)
in the tool stack instead. Yet so far nothing has surfaced, hence I'm keeping
to have this dependency for both series.

Jan

> I'd assume that making ad-hoc decisions on this is pretty much unavoidable,
> but maybe the solution to the problem you mention would highlight a more
> general approach.
> 
> Cheers,
> Alejandro


