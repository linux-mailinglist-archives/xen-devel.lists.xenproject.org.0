Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0003D824510
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 16:34:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661846.1031575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLPj8-0002nY-6O; Thu, 04 Jan 2024 15:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661846.1031575; Thu, 04 Jan 2024 15:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLPj8-0002kl-3g; Thu, 04 Jan 2024 15:33:46 +0000
Received: by outflank-mailman (input) for mailman id 661846;
 Thu, 04 Jan 2024 15:33:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLPj6-0002jO-B9
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 15:33:44 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3c3d27b-ab16-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 16:33:42 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ccb4adbffbso7641091fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 07:33:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r5-20020a922a05000000b0035ff4335bd6sm7530093ile.19.2024.01.04.07.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 07:33:41 -0800 (PST)
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
X-Inumbo-ID: a3c3d27b-ab16-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704382421; x=1704987221; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D7+afRLTAZzEL3gTG8+aIdeS1qKWQF/ZgaHX5p3pp9Q=;
        b=WBlVRKsSrwJw16pJSVN4oqk0HEaPIeun/u9kV9dr7Y41DS4JDsRl8NW46rqqeUMhGC
         zqOil+a5hpDhvr6Y5YZimXOQvg2q1Q1LpVcrPJGz0A0XwC1/mIfdeVWI34DiMYthoYhy
         1cBxZ/dwoGfxUlKuYpoIzGSTKzjOK15LHx47l/kz/mxsBA1SHbsBACqY/Fyl3c/h+ZiF
         rT5Y8HlyqXC93HyzwfzsYodYLyo0rdnd9k3LC7ORu+X2IiX8UmvpEj2rSvhsux3S3FoQ
         6I6ogdiNLUbzMyrolbPsXIXbMshjUJh/Ds67cUxs2OUijCzeIjJzCLK/ctfu1hyRg3uG
         vFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704382421; x=1704987221;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7+afRLTAZzEL3gTG8+aIdeS1qKWQF/ZgaHX5p3pp9Q=;
        b=nHgcdIIpaD9Wl5eHBZ3/8I/lZYgsftiFGVPKyM1cXJpSvYZYEJ8aUza0Uo7cL3ODhM
         kFN7YGwVGkBLATnP8blW779FkQry9L9wW5aFE0iwbesjuXiErjcMWLCV8DWio13vVrT9
         S8uvEKS1foFNbCECnnhDpalmeZkZD2tIxKGF76uA71+EWVhQmdwsHP8+yRUk0Vw2ie+g
         aNs0p3o3JgpOsC0uu3CVzQEZNHG7mErqYQ1+VYrfMOeySAWZBsTjjwFYCkVaARNpx++/
         QKUS15u9AvD+jJrur/P/0BFd2yBwpiL+zUvCaH2Ig0db2ZKe4+CAUoIa3XdwyqpAZRI5
         joPA==
X-Gm-Message-State: AOJu0YyPEdIDdRX1F47W7138as8UJRGDbLaVGN1QhRtoWpSUlgYLSY8I
	TvhRYlrH8+4ps375DJ/dFJQfKh0Mn8xU
X-Google-Smtp-Source: AGHT+IFm7a5CoP2ST7F/19QiivJ+JsvxDKkljiEAP54J8urys4+q4T01PqZ4Kvz4xUlP2jFJom+MuQ==
X-Received: by 2002:a05:651c:1690:b0:2cc:7575:edf9 with SMTP id bd16-20020a05651c169000b002cc7575edf9mr390451ljb.91.1704382421579;
        Thu, 04 Jan 2024 07:33:41 -0800 (PST)
Message-ID: <5fd69614-a236-4a5b-8ec1-8cfea6d28d32@suse.com>
Date: Thu, 4 Jan 2024 16:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Use -Wuninitialized and -Winit-self
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20231228193907.3052681-1-andrew.cooper3@citrix.com>
 <1248487f-4852-41f5-9ffd-d4d12897a622@suse.com>
 <7d35a648-a69b-4dfb-bf4f-d30272df5e9b@citrix.com>
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
In-Reply-To: <7d35a648-a69b-4dfb-bf4f-d30272df5e9b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.01.2024 15:33, Andrew Cooper wrote:
> On 04/01/2024 1:41 pm, Jan Beulich wrote:
>> On 28.12.2023 20:39, Andrew Cooper wrote:
>>> The use of uninitialised data is undefined behaviour.  At -O2 with trivial
>>> examples, both Clang and GCC delete the variable, and in the case of a
>>> function return, the caller gets whatever was stale in %rax prior to the call.
>>>
>>> Clang includes -Wuninitialized within -Wall, but GCC only includes it in
>>> -Wextra, which is not used by Xen at this time.
>>>
>>> Furthermore, the specific pattern of assigning a variable to itself in its
>>> declaration is only diagnosed by GCC with -Winit-self.  Clang does diagnoise
>>> simple forms of this pattern with a plain -Wuninitialized, but it fails to
>>> diagnose the instances in Xen that GCC manages to find.
>>>
>>> GCC, with -Wuninitialized and -Winit-self notices:
>>>
>>>   arch/x86/time.c: In function ‘read_pt_and_tsc’:
>>>   arch/x86/time.c:297:14: error: ‘best’ is used uninitialized in this function [-Werror=uninitialized]
>>>     297 |     uint32_t best = best;
>>>         |              ^~~~
>>>   arch/x86/time.c: In function ‘read_pt_and_tmcct’:
>>>   arch/x86/time.c:1022:14: error: ‘best’ is used uninitialized in this function [-Werror=uninitialized]
>>>    1022 |     uint64_t best = best;
>>>         |              ^~~~
>>>
>>> and both have logic paths where best can be returned while uninitalised.
>> I disagree. In both cases the variables are reliably set during the first
>> loop iteration.
> 
> I suggest you pay attention to the precision of the integers.
> 
> It is hard (likely prohibitively hard) to avoid entering the if(), but
> it is not impossible.

Okay, let's go into the details then. For initialization to be skipped,
two successive rdtsc_ordered() (taking read_pt_and_tsc() as reference)
need to return values 2^^64-1 apart. How do you see that happening, when
(iirc) we've been in agreement more than once that TSC rollover isn't
possible with current or foreseeable hardware?

Things are naturally less unlikely in read_pt_and_tmcct(), for it being
32-bit quantities there. Otoh iirc the APIC timer ticks at rate quite a
bit lower than the TSC. So 2^^32-1 ticks are still a lot of time.

> The compiler really has emitted logic paths where stack rubble is returned.

Of course, since it can't make assumptions on realistic value ranges.

>> Furthermore this initialize-to-self is a well known pattern to suppress the
>> -Wuninitialized induced warnings, originally used by Linux'es
>> uninitialized_var().
> 
> I'm glad you cited this, because it proves my point.
> 
> Notice how it was purged from Linux slowly over the course of 8 years
> because it had been shown to create real bugs, by hiding real uses of
> uninitialised variables.

I'm fully aware of this. The construct was used wrongly in too many cases.
Still I recall times where I was actively asked to use the construct.

> I'm honestly surprised that it hasn't come up yet in the MISRA work.
> 
>>  If we really want to use -Winit-self (and hence disallow
>> use of this pattern even in cases like the ones here, where they're used to
>> suppress false positive warnings), this should imo be done separately from
>> adding -Wuninitialized, and only after proper weighing of the pros and cons
>> (a wider Cc list would be required anyway for the xen/Makefile change).
> 
> There are exactly two uses of this antipattern in the entirety of Xen. 
> They are both in x86 init code.

These two instances aren't all that old. If you deem them antipatterns (I
don't, albeit I see fair room for abuse), why did you not object (suggesting
whatever better alternative)?

> Do you honestly think trying to block a patch this clear and obvious is
> going to be a good use of anyone's time.

Well, you're dong two things at a time, both of which may be clear and
obvious to you. I agree for one half, but I have reservations with the
other. Hence asking that you at least involve all REST maintainers by
Cc-ing them on the patch submission isn't a waste of time, I don't think.
And note, I'm not saying "no" to that second part of the change, but I
do see downsides alongside the upsides you (and I) see.

>>>  In
>>> both cases, initialise to ~0 like the associated *_min variable which also
>>> gates updating best.
>> Considering the affected functions are both __init, this change isn't a big
>> problem. But if you were truly concerned of the one theoretical case, you
>> can't get away with this either: If the variables really remained unwritten,
>> by returning ~0 you'd end up confusing the caller.
> 
> The fact this is a crap API design doesn't make it ok to use undefined
> behaviour.

Thank you for wording it that way.

> Getting ~0 back is strictly less bad than getting stack rubble because
> at least it's obviously wrong.

But then why not change things so there's no issue anymore? Plus I'm not
sure how / whether "obviously wrong" would manifest. I expect it would
be an entirely unobvious boot hang, or other misbehavior.

Jan

