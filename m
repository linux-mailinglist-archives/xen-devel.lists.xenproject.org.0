Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270C4960ADB
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 14:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783948.1193278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivbF-00058Y-H2; Tue, 27 Aug 2024 12:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783948.1193278; Tue, 27 Aug 2024 12:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sivbF-000567-EM; Tue, 27 Aug 2024 12:47:05 +0000
Received: by outflank-mailman (input) for mailman id 783948;
 Tue, 27 Aug 2024 12:47:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sivbE-00053y-7c
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 12:47:04 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 755b89cc-6472-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 14:47:03 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53346132365so6370538e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 05:47:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e582d658sm106142166b.99.2024.08.27.05.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 05:47:01 -0700 (PDT)
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
X-Inumbo-ID: 755b89cc-6472-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724762822; x=1725367622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Fcbd5gfGYgfYdd4EgpLTKcTATs3KULp5Wcu79qKzW0=;
        b=gPTGt7o/HffXwusW9h9iwjD+xdtcxB3CVSB6l6h9n0wgNzasm+l8Ws4vFXvYMHryaN
         f2R4W311q8ZnSVSughYCObhtrMZwnxpqdzC9vkvwtZF6eQlI7n+MP18SpDkGd5O8mUyb
         hLKMTsu6RyBSy3DYobRQJ6sNfIZpon+ST4j/DjpsnRSECf8fY400QDDePOjk5IeS+/T6
         unftLlFnvlB4HMA5Wt8oZA3Ld/IvS3bRTdjMsfIkhklJgWYIknmwnP05yHf1IEBBB0zY
         KcHBruEcVgWBFxWsvuwZYuKChJNEZiCORLJswXyi6WfUvJqJXbIPomG3aU9q/KNhIlhu
         Jw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724762822; x=1725367622;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Fcbd5gfGYgfYdd4EgpLTKcTATs3KULp5Wcu79qKzW0=;
        b=FqYWvnYrmmoUpbaTDCQkPrw/F2WlLQpVIbojJQbCJyVPw5xXY0sokbvW/ARbLctY6b
         d1oorCuopfRdN95PS+VbBGEGV/R/lW29zGVcuP1eiLCbXyaLGbEhiGgWIYpTq7LlCZJw
         li/m7lG+A2Vr2PQLwS4a8tse78kiljJydKsLTPLDZr81hkBUpRusirgd5Kt0quzEWBny
         zyGFKh49XzW87vn7MUJ3bWwrRj9QrTKHlPA9dg1vXwdvNMJQEDnknqMI+uNSj4kWttOK
         nWhcg1+5n2wzz/UAgaTW98EgCfgyHFYglb835u32IpzOznXP2HqK9eQ3gQHEkrivHtKG
         yMXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7OmQ7rGvIqDLUPWBuCq7W4oRg+X5gYBHL5pa3HRqQDaDBaUUxofXa0PRtFNZI5OmuSqEbTtqg/1w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnZeQo6dZq7MCElyMB6zCQEgRFEijtpb2ozZOPOMP/aAwuMONt
	xHr2yddCQBDa1RDlpyXfgwmc9/+nyxaz66Vh9nQowUkyT/K9jHb9jQI2ioeqhQ==
X-Google-Smtp-Source: AGHT+IFXkyiXzCW5qVYyXEVkH63Hi4iRumyfv0hUAVbO1oqLqOd2GDZ5Ai9IzzqiN6EqlgHwWcWp+g==
X-Received: by 2002:a05:6512:3a84:b0:52e:9c0a:3514 with SMTP id 2adb3069b0e04-5344e4f4329mr1578817e87.44.1724762822230;
        Tue, 27 Aug 2024 05:47:02 -0700 (PDT)
Message-ID: <89a5586b-bc9d-47da-a2b6-36e2208a6317@suse.com>
Date: Tue, 27 Aug 2024 14:47:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] x86/bitops: Use the POPCNT instruction when available
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-10-andrew.cooper3@citrix.com>
 <03febf18-516b-4677-a0a5-102036c91a29@suse.com>
 <3300b035-46d7-41d3-9908-1a0093c433e8@citrix.com>
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
In-Reply-To: <3300b035-46d7-41d3-9908-1a0093c433e8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.08.2024 13:17, Andrew Cooper wrote:
> On 26/08/2024 2:07 pm, Jan Beulich wrote:
>> On 23.08.2024 01:06, Andrew Cooper wrote:
>>> A few RFC points.
>>>
>>>  * I throught we had an x86 general lib-y but I can't find one, hence why it's
>>>    still in xen/lib/ for now.
>> We indeed have nothing like that yet. The file name should then imo not be
>> arch-* though, but x86-*. Or you could put it in xen/lib/x86/.
> 
> I was worried about xen/lib/x86/ and interfering with userspace.
> 
>> It could even
>> be obj-y rather than lib-y, unless you expect we'll be able to get rid of
>> all uses, which seems unlikely at least due to bitmap_weight(). Otoh with
>> my ABI-level series the call site in arch_hweightl() could then be made go
>> away for v2 and above, at which point it living in lib-y will be preferable.
> 
> Yes, I was specifically trying to account for this.
> 
> I'm expecting the mandatory-popcnt work to end up looking something like:
> 
> diff --git a/xen/arch/x86/include/asm/bitops.h
> b/xen/arch/x86/include/asm/bitops.h
> index 0db698ed3f4c..027eda60c094 100644
> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -480,6 +480,9 @@ static always_inline unsigned int
> arch_hweightl(unsigned long x)
>  {
>      unsigned int r;
>  
> +    if ( IS_ENABLED(CONFIG_REQUIRE_POPCNT /* or whatever */) )
> +        return __builtin_popcountl(x);
> +
>      /*
>       * arch_generic_hweightl() is written in ASM in order to preserve all
>       * registers, as the compiler can't see the call.
> 
> 
> which in turn DCE's the alternative_io() and drops the reference to
> arch_generic_hweightl().

Right, that's along the lines of what I was thinking to re-base to once
your work has gone in. (I have close to zero hope that my work would be
going in first. [1]) Just that I don't think we'll have separate
CONFIG_REQUIRE_<feature> settings. Yet how exactly that wants structuring
is something we ought to discuss there, not here.

>>>  * When we up the minimum toolchain to GCC 7 / Clang 5, we can use a
>>>    __attribute__((no_caller_saved_registers)) and can forgo writing this in asm.
>>>
>>>    GCC seems to need extra help, and wants -mgeneral-regs-only too.  It has a
>>>    habit of complaining about incompatible instructions even when it's not
>>>    emitting them.
>> What is this part about? What incompatible instructions, in particular?
> 
> This was weird.  https://godbolt.org/z/4z1qzWbfE is an example.

That's because apparently in your experiments you didn't add -mno-sse. If you
incrementally add that, then -mno-mmx, then -msoft-float, you'll first see the
diagnostic change and then observe it to finally compile. And yes, from
looking at the gcc code emitting this error, this is solely tied to the ISAs
enabled at the time the function is being compiled. It's independent of the
choice of insns. Pretty clearly a shortcoming, imo.

>>> @@ -475,4 +476,24 @@ static always_inline unsigned int arch_flsl(unsigned long x)
>>>  }
>>>  #define arch_flsl arch_flsl
>>>  
>>> +static always_inline unsigned int arch_hweightl(unsigned long x)
>>> +{
>>> +    unsigned int r;
>>> +
>>> +    /*
>>> +     * arch_generic_hweightl() is written in ASM in order to preserve all
>>> +     * registers, as the compiler can't see the call.
>>> +     *
>>> +     * This limits the POPCNT instruction to using the same ABI as a function
>>> +     * call (input in %rdi, output in %eax) but that's fine.
>>> +     */
>>> +    alternative_io("call arch_generic_hweightl",
>>> +                   "popcnt %[val], %q[res]", X86_FEATURE_POPCNT,
>>> +                   ASM_OUTPUT2([res] "=a" (r) ASM_CALL_CONSTRAINT),
>>> +                   [val] "D" (x));
>> If you made [val] an output ("+D") you could avoid preserving the register
>> in the function. And I'd expect the register wouldn't be re-used often
>> afterwards, so its clobbering likely won't harm code quality very much.
> 
> "+D" means it's modified by the asm, which forces preservation of the
> register, if it's still needed afterwards.
> 
> Plain "D" means not modified by the asm, which means it can be reused if
> necessary.

And we likely would prefer the former: If the register's value isn't
use afterwards (and that's the case as far as the function on its own
goes), the compiler will know it doesn't need to preserve anything.
That way, rather than always preserving (in the called function)
preservation will be limited to just the (likely few) cases where the
value actually is still needed afterwards.

Jan

[1] "x86: allow Kconfig control over psABI level" actually has a suitable
    R-b, but its prereq "build: permit Kconfig control over how to deal
    with unsatisfiable choices" doesn't.

