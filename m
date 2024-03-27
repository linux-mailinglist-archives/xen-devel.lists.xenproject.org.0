Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F2988D77B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 08:40:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698324.1089888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpNtQ-0000PN-HI; Wed, 27 Mar 2024 07:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698324.1089888; Wed, 27 Mar 2024 07:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpNtQ-0000NO-E5; Wed, 27 Mar 2024 07:40:16 +0000
Received: by outflank-mailman (input) for mailman id 698324;
 Wed, 27 Mar 2024 07:40:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpNtO-0000NG-On
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 07:40:14 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ea091fa-ec0d-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 08:40:12 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a44f2d894b7so779383466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 00:40:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 wn1-20020a170907068100b00a4dfd94fd40sm789681ejb.199.2024.03.27.00.40.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 00:40:11 -0700 (PDT)
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
X-Inumbo-ID: 3ea091fa-ec0d-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711525212; x=1712130012; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9lP3rUv43mzNjT6fyW8vfw22i8hX3jzWZ1YZcyMJkr0=;
        b=fFOK7Nfp+PWXGUGKfEJB4HNXTnYZOmiEWnFhzdy8Cr2+SfJd0kDxPD2t680bpz0Cl8
         KHsKltiFxfe14VUiuoyJwaN9QWfGmtaZOLM1lPDgXHpHRVDrtWQ4de1lGGax/AykDEFO
         tz2zS+iKDhn04FWCU6k2JMvVtz/GSs+7TL2gdfsA3u6kCIv3nviuv2ff3slhlQWGbh4m
         bfabNl2DvJL+4LESLl5/2DPeNyqmoeL4LXQcRbbMzJFqJo+uqmgDbCgeB5or1+Q6rEgJ
         7knJdMbTau+mU3Z50f43JqB9ujW4PJIDx5zAFnEruYmh0qQ5wRZ3mjRy38sBzktp+feX
         wb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525212; x=1712130012;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9lP3rUv43mzNjT6fyW8vfw22i8hX3jzWZ1YZcyMJkr0=;
        b=LNPq+1rUFJCTfOzQv1oXQGnTV79AoD98B6Ph54/KcJUW5M9JewP5UqFHGloKy/zU9H
         Rl9k9mGLPYPbhf45Cvz8FVdfidneHD6w7nLjgeoFCme9kyBMKkomKWuJpeS8H/Zh78lw
         6IwB7+kiAJg8Lv7FO2mKzgkFlcyiKPBNaTxRSkAS8sNXKd+uWQa/Tw1xgio12jW2ij3c
         I85fzsp3Qu4+RRpLq+FqD3wKgo/ataLyqfpFcq5pvU5FdxFkzjLkwibhKpoHhUpYF0KC
         sB6SbVWEvOEIJznHHX3r7N1+Ga/F8WECiLUm60UnDGr14+ONTF5ISFYDWEHph/88Yk/n
         cWiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8WgerMAAZkwAbvNELBJz/WSzFMvQsz3qjPYjlEKzwLfCAxNPNOmHaySOEL+6jQQHnVcDrx+0tGKIMWqekzCatFUWh9ACLY+v1nMWHbTg=
X-Gm-Message-State: AOJu0Yzt1+6kTvP0I7cdRg4CwBuLQzVjfF1Vh96NFJZGBvqT+ScHh1AU
	eELaOo+DZGILPIJhqZrwWGUseXvVMBuF8Yr6TMXFh6U5/fY4wZrHcRTvqiPnFg==
X-Google-Smtp-Source: AGHT+IH92B036ESIBZF8P1vl4I6jasxPuSqu0c0t7U6niijrLmjKyTUaFWqJhdDuYN1j3APriM9UHA==
X-Received: by 2002:a17:906:3b98:b0:a4a:ba53:27a6 with SMTP id u24-20020a1709063b9800b00a4aba5327a6mr3668626ejf.46.1711525211841;
        Wed, 27 Mar 2024 00:40:11 -0700 (PDT)
Message-ID: <2bac4852-b5f1-4424-ac1a-29e76563ab2b@suse.com>
Date: Wed, 27 Mar 2024 08:40:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/20] xen/riscv: introduce atomic.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <22ee9c8cc62c76cfb799fed800636e7c8bf25a17.1710517542.git.oleksii.kurochko@gmail.com>
 <78a86041-72e2-410f-b6a7-212656b0dba3@suse.com>
 <cdcf3531a94110d73b9ec60eedf74784b923248c.camel@gmail.com>
 <1a440fbf-f37c-41fe-b31c-0afe0fd77c8e@suse.com>
 <38de6dd8e9555fe4b573f9c2134a618a60c224df.camel@gmail.com>
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
In-Reply-To: <38de6dd8e9555fe4b573f9c2134a618a60c224df.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.03.2024 20:02, Oleksii wrote:
> On Mon, 2024-03-25 at 09:18 +0100, Jan Beulich wrote:
>> On 22.03.2024 13:25, Oleksii wrote:
>>> On Thu, 2024-03-21 at 14:03 +0100, Jan Beulich wrote:
>>>> On 15.03.2024 19:06, Oleksii Kurochko wrote:
>>>>> + */
>>>>> +static always_inline void read_atomic_size(const volatile void
>>>>> *p,
>>>>> +                                           void *res,
>>>>> +                                           unsigned int size)
>>>>> +{
>>>>> +    switch ( size )
>>>>> +    {
>>>>> +    case 1: *(uint8_t *)res = readb(p); break;
>>>>> +    case 2: *(uint16_t *)res = readw(p); break;
>>>>> +    case 4: *(uint32_t *)res = readl(p); break;
>>>>> +    case 8: *(uint32_t *)res  = readq(p); break;
>>>>
>>>> Nit: Excess blank before =.
>>>>
>>>> Also - no #ifdef here to be RV32-ready?
>>> Because there is #ifdef RV32 in io.h for readq().
>>
>> There you'd run into __raw_readq()'s BUILD_BUG_ON(), afaict even for
>> 1-, 2-, or 4-byte accesses. That's not quite what we want here.
> Do you mean that if someone will redefine readq() in another way and
> not wrap it by #ifdef RV32? Except this I am not sure that there is an
> issue as it will be still a compilation error, so anyway it will be
> needed to provide an implementation for __raw_readq().

No. BUILD_BUG_ON() is a compile-time thing. The compiler will encounter
this construct. And hence it will necessarily fail. Which is why the
other approach (causing a linker error) is used elsewhere. And we're
still only in the course of considering to utilize DCE for something
like STATIC_ASSERT_UNREACHABLE(); iirc there was something getting in
the way there.

> One of the reason why I decided to wrap with #ifdef RV32 in io.h to not
> go over the source code and add wrapping. Also for some code it will be
> needed to rewrite it. For example, I am not sure that I can add #ifdef
> inside macros, f.e.:
>    #define write_atomic(p, x)                              \
>    ({                                                      \
>        typeof(*(p)) x__ = (x);                             \
>        switch ( sizeof(*(p)) )                             \
>        {                                                   \
>        case 1: writeb(x__, p); break;                      \
>        case 2: writew(x__, p); break;                      \
>        case 4: writel(x__, p); break;                      \
>        case 8: writeq(x__, p); break;                      \
>        default: __bad_atomic_size(); break;                \
>        }                                                   \
>        x__;                                                \
>    })

You can't add #ifdef there. Such needs abstracting differently.

But of course there's the option of simply not making any of these
constructs RV32-ready. Yet if so, that then will want doing
consistently.

>>>>> +/*
>>>>> + * First, the atomic ops that have no ordering constraints and
>>>>> therefor don't
>>>>> + * have the AQ or RL bits set.  These don't return anything,
>>>>> so
>>>>> there's only
>>>>> + * one version to worry about.
>>>>> + */
>>>>> +#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)  \
>>>>> +static inline                                               \
>>>>> +void atomic##prefix##_##op(c_type i, atomic##prefix##_t *v) \
>>>>> +{                                                           \
>>>>> +    asm volatile (                                          \
>>>>> +        "   amo" #asm_op "." #asm_type " zero, %1, %0"      \
>>>>> +        : "+A" (v->counter)                                 \
>>>>> +        : "r" (I)                                           \
>>>>
>>>> Btw, I consider this pretty confusing. At the 1st and 2nd glance
>>>> this
>>>> looks like a mistake, i.e. as if i was meant. Imo ...
>>>>
>>>>> +        : "memory" );                                       \
>>>>> +}                                                           \
>>>>> +
>>>>> +/*
>>>>> + * Only CONFIG_GENERIC_ATOMIC64=y was ported to Xen that is
>>>>> the
>>>>> reason why
>>>>> + * last argument for ATOMIC_OP isn't used.
>>>>> + */
>>>>> +#define ATOMIC_OPS(op, asm_op, I)                           \
>>>>> +        ATOMIC_OP (op, asm_op, I, w, int,   )
>>>>> +
>>>>> +ATOMIC_OPS(add, add,  i)
>>>>> +ATOMIC_OPS(sub, add, -i)
>>>>> +ATOMIC_OPS(and, and,  i)
>>>>> +ATOMIC_OPS( or,  or,  i)
>>>>> +ATOMIC_OPS(xor, xor,  i)
>>>>
>>>> ... here you want to only pass the (unary) operator (and leaving
>>>> that
>>>> blank
>>>> is as fine as using +).
>>> I agree that a game with 'i' and 'I' looks confusing, but I am not
>>> really understand what is wrong with using ' i' here. It seems that
>>> preprocessed macros looks fine:
>>>    static inline void atomic_add(int i, atomic_t *v) { asm volatile
>>> ( "  
>>>    amo" "add" "." "w" " zero, %1, %0" : "+A" (v->counter) : "r" (i)
>>> :
>>>    "memory" ); }
>>>    
>>>    static inline void atomic_sub(int i, atomic_t *v) { asm volatile
>>> ( "  
>>>    amo" "add" "." "w" " zero, %1, %0" : "+A" (v->counter) : "r" (-
>>> i) :
>>>    "memory" ); }
>>
>> I didn't question the pre-processed result being correct. Instead I
>> said
>> that I consider the construct confusing to the reader, for looking as
>> if
>> there was a mistake (in the case of the letter i used). Note also in
>> particular how the macro invocations need to be in sync with the
>> macro
>> implementation, for lower case i being used both in the macro and in
>> its
>> invocations. Anything parameterized would better be fully so, at the
>> very least to avoid, as said, confusion. (Having macros depend on
>> context at their use sites _may_ be okay for local helper macros, but
>> here we're talking about a not even private header file.)
> I am not sure then I understand how mentioning '+i' will help
> significantly remove confusion.

I'm afraid I don't understand: What "mentioning '+i'" are you referring
to? I'm pretty sure I didn't suggest that. What I suggested was to pass
a bare operator (- or +) as macro argument.

>>>>> +/* This is required to provide a full barrier on success. */
>>>>> +static inline int atomic_add_unless(atomic_t *v, int a, int u)
>>>>> +{
>>>>> +       int prev, rc;
>>>>> +
>>>>> +    asm volatile (
>>>>> +        "0: lr.w     %[p],  %[c]\n"
>>>>> +        "   beq      %[p],  %[u], 1f\n"
>>>>> +        "   add      %[rc], %[p], %[a]\n"
>>>>> +        "   sc.w.rl  %[rc], %[rc], %[c]\n"
>>>>> +        "   bnez     %[rc], 0b\n"
>>>>> +        RISCV_FULL_BARRIER
>>>>
>>>> With this and no .aq on the load, why the .rl on the store?
>>> It is something that LKMM requires [1].
>>>
>>> This is not fully clear to me what is so specific in LKMM, but
>>> accoring
>>> to the spec:
>>>    Ordering Annotation Fence-based Equivalent
>>>    l{b|h|w|d|r}.aq     l{b|h|w|d|r}; fence r,rw
>>>    l{b|h|w|d|r}.aqrl   fence rw,rw; l{b|h|w|d|r}; fence r,rw
>>>    s{b|h|w|d|c}.rl     fence rw,w; s{b|h|w|d|c}
>>>    s{b|h|w|d|c}.aqrl   fence rw,w; s{b|h|w|d|c}
>>>    amo<op>.aq          amo<op>; fence r,rw
>>>    amo<op>.rl          fence rw,w; amo<op>
>>>    amo<op>.aqrl        fence rw,rw; amo<op>; fence rw,rw
>>>    Table 2.2: Mappings from .aq and/or .rl to fence-based
>>> equivalents.
>>>    An alternative mapping places a fence rw,rw after the existing 
>>>    s{b|h|w|d|c} mapping rather than at the front of the
>>>    l{b|h|w|d|r} mapping.
>>
>> I'm afraid I can't spot the specific case in this table. None of the
>> stores in the right column have a .rl suffix.
> Yes, it is expected.
> 
> I am reading this table as (f.e.) amo<op>.rl is an equivalent of fence
> rw,w; amo<op>. (without .rl) 

In which case: How does quoting the table answer my original question?

>>>    It is also safe to translate any .aq, .rl, or .aqrl annotation
>>> into
>>>    the fence-based snippets of
>>>    Table 2.2. These can also be used as a legal implementation of
>>>    l{b|h|w|d} or s{b|h|w|d} pseu-
>>>    doinstructions for as long as those instructions are not added
>>> to
>>>    the ISA.
>>>
>>> So according to the spec, it should be:
>>>  sc.w ...
>>>  RISCV_FULL_BARRIER.
>>>
>>> Considering [1] and how this code looks before, it seems to me that
>>> it
>>> is safe to use lr.w.aq/sc.w.rl here or an fence equivalent.
>>
>> Here you say "or". Then why dos the code use sc.?.rl _and_ a fence?
> I confused this line with amo<op>.aqrl, so based on the table 2.2 above
> s{b|h|w|d|c}.aqrl is transformed to "fence rw,w; s{b|h|w|d|c}", but
> Linux kernel decided to strengthen it with full barrier:
>    -              "0:\n\t"
>    -              "lr.w.aqrl  %[p],  %[c]\n\t"
>    -              "beq        %[p],  %[u], 1f\n\t"
>    -              "add       %[rc],  %[p], %[a]\n\t"
>    -              "sc.w.aqrl %[rc], %[rc], %[c]\n\t"
>    -              "bnez      %[rc], 0b\n\t"
>    -              "1:"
>    +               "0:     lr.w     %[p],  %[c]\n"
>    +               "       beq      %[p],  %[u], 1f\n"
>    +               "       add      %[rc], %[p], %[a]\n"
>    +               "       sc.w.rl  %[rc], %[rc], %[c]\n"
>    +               "       bnez     %[rc], 0b\n"
>    +               "       fence    rw, rw\n"
>    +               "1:\n"
> As they have the following issue:
>    implementations of atomics such as atomic_cmpxchg() and
>    atomic_add_unless() rely on LR/SC pairs,
>    which do not give full-ordering with .aqrl; for example, current
>    implementations allow the "lr-sc-aqrl-pair-vs-full-barrier" test
>    below to end up with the state indicated in the "exists" clause.

Is that really "current implementations", not "the abstract model"?
If so, the use of an explicit fence would be more like a workaround
(and would hence want commenting to that effect).

In neither case can I see my original question answered: Why the .rl
on the store when there is a full fence later?

Jan

