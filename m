Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C07A956F43
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 17:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779855.1189537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg4e1-00088j-8S; Mon, 19 Aug 2024 15:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779855.1189537; Mon, 19 Aug 2024 15:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg4e1-00087E-5e; Mon, 19 Aug 2024 15:50:09 +0000
Received: by outflank-mailman (input) for mailman id 779855;
 Mon, 19 Aug 2024 15:50:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sg4e0-000878-0K
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 15:50:08 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b42428bf-5e42-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 17:50:06 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2f3cb747ed7so24909171fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 08:50:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbe7f5a7sm5711564a12.76.2024.08.19.08.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 08:50:04 -0700 (PDT)
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
X-Inumbo-ID: b42428bf-5e42-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724082605; x=1724687405; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Po3KThdD7MNVErjQbOPd8Dxie8OQ7fkehxCZAy1gWxM=;
        b=F/asJgNn6nTs+fwH+2u0S4bkn3UY4nJcPkr+lrATQnIXjB4JYrqh2ycK0P9faT0RAA
         cnkymUkoQWabpmahks+OZGot5T3VsVouuOETWcTasRjzgdcOpnkXcn2FZihD7C1z237M
         QM3D6Ih24fkpYf8Mwzo8REzP89TwZHHg173ydSIXUCDoA4ama/fzq9Ioj5O8jxY98E91
         88FObnOzT+O9ieeqx4BuynlyESTZ2Z5B/6mRiCWF2IVJgn5mOAlFuIgjToXx9RNIBCbW
         LPS05/bpGI92y1kTsANBwywqb3617JEkrYDnQrUhmuPHPmo/hgoNKaDC7EoFkhVK5km6
         Cypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724082605; x=1724687405;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Po3KThdD7MNVErjQbOPd8Dxie8OQ7fkehxCZAy1gWxM=;
        b=rT0gwhwXCE3ZmwKC/vkh2UE5Uc6olrzaX4bsh35pbQBzcQZXzCdvy8HlVEO6q2F4GU
         KfXfaV3GOSwax7NyAOMRXKDQN9difu21f1Ikm4jaIsJZKkmgokpXn5RYcdGItNwLHJ8e
         XPFOURMHXwEmxcHE2gqnXGJfXAux23Gz3820PklriATaZUdlfVNag1aWWQKnfaGkVqmu
         ZDppctBtx77tEsLn0up7/TOhiunAdzqL9/Pu9AVZ8oHzmuVbS64WmBdYrUcOGQGJ3HVy
         6xFe//JCgg/0fO+dhZr0A3wNX4rFKMhwH5mPtlAN5Ud2XUStm49g2SDh0BLw8ZWZUjfX
         LR0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqGjg2NSeoN7bu3xpPBGMHRfhwQOkYm9m6pyB9JyXpfVUWztdyYX/Poou5/N37YXhx0s7LxHfft20+6XjT1R0jeX5XM6P6Hf7gqxCexI8=
X-Gm-Message-State: AOJu0Yymir8EQkRPPjfP3fKJUOX0E/bdNSfCLUolsnRFKibQ2C4XLkQp
	GSNU9VvrPvTIOWheNOfeK1fFeRZ73bwlkB7pF/WlyZgW47Us+pcLjxHfX/AJcA==
X-Google-Smtp-Source: AGHT+IF87tscRqjFl/EveJoJPLH6RkGRGktHJikUdvVkJPyrxf1XqkKLhZYquT/rFoojBuXvKrDcAQ==
X-Received: by 2002:a05:651c:1063:b0:2f2:9bc2:d573 with SMTP id 38308e7fff4ca-2f3be586baamr69805211fa.15.1724082604647;
        Mon, 19 Aug 2024 08:50:04 -0700 (PDT)
Message-ID: <f5519911-6a3a-468a-98ec-3345339847cd@suse.com>
Date: Mon, 19 Aug 2024 17:50:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86: Put trampoline in .init.data section
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-2-alejandro.vallejo@cloud.com>
 <ad72cc97-b9dd-4e7e-93f6-333805e40785@suse.com>
 <CACHz=Zh7wK58mbB762fnevHEKW9qhp-NRJ6buNe1b-qLxP0qPg@mail.gmail.com>
 <b9b40658-ff13-4240-98a2-4811411e31b6@suse.com>
 <CACHz=Zj8h-TeDa2Ey8EKKEOpXJqx9MnL+AGpdTBY1B8PZ0==mA@mail.gmail.com>
 <a3d901f9-0a74-4cef-b616-77d338dda314@suse.com>
 <CACHz=ZgCd81NV7yXZ-Lud-QP8sj05mH9N0c-1z=eBv3pz2ENAw@mail.gmail.com>
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
In-Reply-To: <CACHz=ZgCd81NV7yXZ-Lud-QP8sj05mH9N0c-1z=eBv3pz2ENAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.08.2024 17:30, Frediano Ziglio wrote:
> On Mon, Aug 19, 2024 at 3:30 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 19.08.2024 16:16, Frediano Ziglio wrote:
>>> On Thu, Aug 8, 2024 at 9:54 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 08.08.2024 10:00, Frediano Ziglio wrote:
>>>>> On Thu, Aug 8, 2024 at 8:34 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 07.08.2024 15:48, Alejandro Vallejo wrote:
>>>>>>> This change allows to put the trampoline in a separate, not executable
>>>>>>> section. The trampoline contains a mix of code and data (data which
>>>>>>> is modified from C code during early start so must be writable).
>>>>>>> This is in preparation for W^X patch in order to satisfy UEFI CA
>>>>>>> memory mitigation requirements.
>>>>>>
>>>>>> Which, aiui, has the downside of disassembly of the section no longer
>>>>>> happening by default, when using objdump or similar tools, which go from
>>>>>> section attributes. Why is it being in .init.text (and hence RX) not
>>>>>> appropriate? It should - in principle at least - be possible to avoid
>>>>>> all in-place writing to it, but instead only ever write to its relocated
>>>>>> copy. Quite a bit more code churn of course.
>>>>>>
>>>>>> I wonder if we shouldn't put the trampoline in its own section, RWX in
>>>>>> the object file, and switched to whatever appropriate in the binary
>>>>>> (which really may be RX, not RW).
>>>>>
>>>>> We cannot have RWX to satisfy UEFI CA memory mitigation, that's why I
>>>>> had to move it, code sections should not be writeable. We can mark
>>>>> either RX or RW but we use the data very early so we are not able to
>>>>> change the permissions (we can try with all complications that this
>>>>> could bring like how to report an error at so early stages).
>>>>
>>>> The early writing could be done away with, as indicated. There's not
>>>> really any strict requirement to write to the trampoline region within
>>>> the Xen image. All updates to it could in principle be done after it
>>>> was copied into low memory. Then (and of course only then) could it be
>>>> part of an RX section in the image, maybe .init.text, maybe a separate
>>>> .trampoline section.
>>>
>>>    how strong are you on this? Is this "objdump" thing such a big
>>> issue? The code contains a lot of 16 bit code which would require
>>> additional options anyway. Won't be an assembly listing output more
>>> helpful instead?
>>
>> Well. Whether a listing can serve as a stand-in depends on the situation.
>> Not being able to disassemble code (e.g. also in the final executable)
>> can be pretty limiting. The need to pass extra options is related, but
>> not really an argument against.
> 
> If some code is inside some data section (in the final binary) you can
> use -D option to disassemble everything, even data. For instance a
> "objdump -D xen-syms -m i8086" and look for some "trampoline" symbols.
> Yes, the output of -D is surely longer than -d.

Well, no, I surely don't want to disassemble all data. Based on what I've
observed in the past, I also wouldn't be surprised if objdump didn't get
utterly confused by disassembling data, perhaps to the point of crashing.

>>> Could I ouput the trampoline in a code section ("ax" instead of "aw")
>>> and then later move it into .init.data section assuring .init.data is
>>> writeable but not executable?
>>
>> Could you go into a little more detail on what you mean here? At the
>> first glance my reaction is "yes, sure, why not", but much depends on
>> what exactly is meant.
> 
> For instance you could put the trampoline into a
>     .section .init.trampoline, "awx", @progbits
> section (having the "x" will be disassembled by objdump -d head.o).
> Then in xen/arch/x86/xen.lds.S in the .init.data section having something like
> ...
>   DECL_SECTION(.init.data) {
>        *(.init.bss.stack_aligned)
>       (.init.trampoline)
>    ...
> this will put the trampoline in .init.data section of the final
> object. At this point the .init.data containing code will have execute
> permission that you would have to fix using objcopy command.
> The final trampoline will be in a data section not executable so to
> use objdump you will need the -D option, but not disassembling head.o.
> In theory we could keep the temporary object file before the objcopy
> adjustment to avoid the -D but I don't think it would save a lot of
> burdain.

Part of my "want to be able to disassemble" also applies to the final
binaries. Since iirc one can disassemble individual sections, an option
may be to have .trampoline be its own section even in the final (PE)
binary?

In any event, especially as long as there is no really good option, I
think I'd like to have input from Andrew and/or Roger as well.

Jan

