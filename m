Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A73889517
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 09:18:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697610.1088509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rofWw-0001zj-Ls; Mon, 25 Mar 2024 08:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697610.1088509; Mon, 25 Mar 2024 08:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rofWw-0001xe-J3; Mon, 25 Mar 2024 08:18:06 +0000
Received: by outflank-mailman (input) for mailman id 697610;
 Mon, 25 Mar 2024 08:18:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rofWv-0001xY-6M
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 08:18:05 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32bc4bfe-ea80-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 09:18:02 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a46d0a8399aso848972166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 01:18:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a5-20020a1709065f8500b00a46478fbbbesm2756165eju.153.2024.03.25.01.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 01:18:02 -0700 (PDT)
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
X-Inumbo-ID: 32bc4bfe-ea80-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711354682; x=1711959482; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E3Lkiln8exDA5vqgtQzTSrGCUHrNJVV3YoVoI+pFmhA=;
        b=d8UT94UoN8s/fQDWD//gq2bZq2zVgQuVuqHlQVB884kK6/U5JuAHfr0UfKhQyn+tDk
         76cUYxOoIox7VQaV4YYKGuaf6pjPhwpP1ZcvLY0p9ZPq41f3Fw23ZLbFxa7PqhCbOo8u
         eb7acKSIjFkR53M6z0r6StGnq92F26iseSH0Ro3S8XxfGSh6MZmP6WbfQ94fi/M3qiRs
         TyjYtq/FYfvoQJbQOF9zKR2BBc3t6Sb+k2C5mVOso46vhOsyz5Zw6naDg2E/bP4ISi81
         yVUEAc6lsHKhztRClieYCIkNSNO/sk1zjMHYspoI2VjKCqopwy+h60NMjmK4VFwiJskg
         CmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711354682; x=1711959482;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E3Lkiln8exDA5vqgtQzTSrGCUHrNJVV3YoVoI+pFmhA=;
        b=d8gpEFYvESNnwfS1nHIl2evarm5CDXNi8t5xsEpa7qv+JYwBZ3KrMCq4XLHHF6cHBN
         alGLHxyXrDwAk8q/zr4LpbCVjpC/lgjtS3NZkyNfhtndEqkCoslRkSgCZZK7WnKebNBQ
         +cax4hyeFgAmKPpUS8jPLCtg+K1zRRUO8NgWhm6WgBNz7GDqyjCuW3DlJ8/qzQgEa3FC
         FIamHKhVbrwCLSibRw8bMOwpybe32bpRi4AfHaf8p38BYyXh8E0Hijn/ZjDMiGK4yDPK
         ahMKGtDDCxMkR4g6IWzSiCgFrMZS+UPET1BozudcHSqXiUCVFYwDazq2Pq30hw+7Wn9m
         Xk0w==
X-Forwarded-Encrypted: i=1; AJvYcCWRQQMHD6lcm8KQkbpWN4tG9B8rrE1+T1ERUfHiFcg2P/fehR4Ppx5vz4oU/iEdXOXzDvMkdjjmendcjJU6tV7P91OCwtHAbMQ3P6cz+P8=
X-Gm-Message-State: AOJu0YwfDKezCanDmuUcqIz+stVFK4OYa5PR/5IC9s51CwbpxahtaBz/
	NHzkrStX2iZD3q6cRqYnrr8g77JC5SkMUDbU5QSR/dutfotKgwTUbBvGwQADwQ==
X-Google-Smtp-Source: AGHT+IEFD3GL7ybjjAhay4B6OaPNFKZ2fLn2/4T26BPxlbGO7yCExd6QHV2T+1pSRCNvhTnJrUT99A==
X-Received: by 2002:a17:907:944c:b0:a47:322b:c94d with SMTP id dl12-20020a170907944c00b00a47322bc94dmr6511198ejc.6.1711354682230;
        Mon, 25 Mar 2024 01:18:02 -0700 (PDT)
Message-ID: <1a440fbf-f37c-41fe-b31c-0afe0fd77c8e@suse.com>
Date: Mon, 25 Mar 2024 09:18:03 +0100
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
In-Reply-To: <cdcf3531a94110d73b9ec60eedf74784b923248c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.03.2024 13:25, Oleksii wrote:
> On Thu, 2024-03-21 at 14:03 +0100, Jan Beulich wrote:
>> On 15.03.2024 19:06, Oleksii Kurochko wrote:
>>> + */
>>> +static always_inline void read_atomic_size(const volatile void *p,
>>> +                                           void *res,
>>> +                                           unsigned int size)
>>> +{
>>> +    switch ( size )
>>> +    {
>>> +    case 1: *(uint8_t *)res = readb(p); break;
>>> +    case 2: *(uint16_t *)res = readw(p); break;
>>> +    case 4: *(uint32_t *)res = readl(p); break;
>>> +    case 8: *(uint32_t *)res  = readq(p); break;
>>
>> Nit: Excess blank before =.
>>
>> Also - no #ifdef here to be RV32-ready?
> Because there is #ifdef RV32 in io.h for readq().

There you'd run into __raw_readq()'s BUILD_BUG_ON(), afaict even for
1-, 2-, or 4-byte accesses. That's not quite what we want here.

>>> +/*
>>> + * First, the atomic ops that have no ordering constraints and
>>> therefor don't
>>> + * have the AQ or RL bits set.  These don't return anything, so
>>> there's only
>>> + * one version to worry about.
>>> + */
>>> +#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)  \
>>> +static inline                                               \
>>> +void atomic##prefix##_##op(c_type i, atomic##prefix##_t *v) \
>>> +{                                                           \
>>> +    asm volatile (                                          \
>>> +        "   amo" #asm_op "." #asm_type " zero, %1, %0"      \
>>> +        : "+A" (v->counter)                                 \
>>> +        : "r" (I)                                           \
>>
>> Btw, I consider this pretty confusing. At the 1st and 2nd glance this
>> looks like a mistake, i.e. as if i was meant. Imo ...
>>
>>> +        : "memory" );                                       \
>>> +}                                                           \
>>> +
>>> +/*
>>> + * Only CONFIG_GENERIC_ATOMIC64=y was ported to Xen that is the
>>> reason why
>>> + * last argument for ATOMIC_OP isn't used.
>>> + */
>>> +#define ATOMIC_OPS(op, asm_op, I)                           \
>>> +        ATOMIC_OP (op, asm_op, I, w, int,   )
>>> +
>>> +ATOMIC_OPS(add, add,  i)
>>> +ATOMIC_OPS(sub, add, -i)
>>> +ATOMIC_OPS(and, and,  i)
>>> +ATOMIC_OPS( or,  or,  i)
>>> +ATOMIC_OPS(xor, xor,  i)
>>
>> ... here you want to only pass the (unary) operator (and leaving that
>> blank
>> is as fine as using +).
> I agree that a game with 'i' and 'I' looks confusing, but I am not
> really understand what is wrong with using ' i' here. It seems that
> preprocessed macros looks fine:
>    static inline void atomic_add(int i, atomic_t *v) { asm volatile ( "  
>    amo" "add" "." "w" " zero, %1, %0" : "+A" (v->counter) : "r" (i) :
>    "memory" ); }
>    
>    static inline void atomic_sub(int i, atomic_t *v) { asm volatile ( "  
>    amo" "add" "." "w" " zero, %1, %0" : "+A" (v->counter) : "r" (-i) :
>    "memory" ); }

I didn't question the pre-processed result being correct. Instead I said
that I consider the construct confusing to the reader, for looking as if
there was a mistake (in the case of the letter i used). Note also in
particular how the macro invocations need to be in sync with the macro
implementation, for lower case i being used both in the macro and in its
invocations. Anything parameterized would better be fully so, at the
very least to avoid, as said, confusion. (Having macros depend on
context at their use sites _may_ be okay for local helper macros, but
here we're talking about a not even private header file.)

>>> +/* This is required to provide a full barrier on success. */
>>> +static inline int atomic_add_unless(atomic_t *v, int a, int u)
>>> +{
>>> +       int prev, rc;
>>> +
>>> +    asm volatile (
>>> +        "0: lr.w     %[p],  %[c]\n"
>>> +        "   beq      %[p],  %[u], 1f\n"
>>> +        "   add      %[rc], %[p], %[a]\n"
>>> +        "   sc.w.rl  %[rc], %[rc], %[c]\n"
>>> +        "   bnez     %[rc], 0b\n"
>>> +        RISCV_FULL_BARRIER
>>
>> With this and no .aq on the load, why the .rl on the store?
> It is something that LKMM requires [1].
> 
> This is not fully clear to me what is so specific in LKMM, but accoring
> to the spec:
>    Ordering Annotation Fence-based Equivalent
>    l{b|h|w|d|r}.aq     l{b|h|w|d|r}; fence r,rw
>    l{b|h|w|d|r}.aqrl   fence rw,rw; l{b|h|w|d|r}; fence r,rw
>    s{b|h|w|d|c}.rl     fence rw,w; s{b|h|w|d|c}
>    s{b|h|w|d|c}.aqrl   fence rw,w; s{b|h|w|d|c}
>    amo<op>.aq          amo<op>; fence r,rw
>    amo<op>.rl          fence rw,w; amo<op>
>    amo<op>.aqrl        fence rw,rw; amo<op>; fence rw,rw
>    Table 2.2: Mappings from .aq and/or .rl to fence-based equivalents.
>    An alternative mapping places a fence rw,rw after the existing 
>    s{b|h|w|d|c} mapping rather than at the front of the
>    l{b|h|w|d|r} mapping.

I'm afraid I can't spot the specific case in this table. None of the
stores in the right column have a .rl suffix.

>    It is also safe to translate any .aq, .rl, or .aqrl annotation into
>    the fence-based snippets of
>    Table 2.2. These can also be used as a legal implementation of
>    l{b|h|w|d} or s{b|h|w|d} pseu-
>    doinstructions for as long as those instructions are not added to
>    the ISA.
> 
> So according to the spec, it should be:
>  sc.w ...
>  RISCV_FULL_BARRIER.
> 
> Considering [1] and how this code looks before, it seems to me that it
> is safe to use lr.w.aq/sc.w.rl here or an fence equivalent.

Here you say "or". Then why dos the code use sc.?.rl _and_ a fence?

> But in general it ( a combination of fence, .aq, .rl ) can be
> considered as the same things in this context, so it is possible to
> leave this function as is to be synced here with Linux kernel.

In turn I also don't understand this. Yes, the excess .rl certainly
doesn't render things unsafe. But what's the purpose of the .rl? That's
what my original question boiled down to.

Jan

> [1]https://lore.kernel.org/lkml/1520274276-21871-1-git-send-email-parri.andrea@gmail.com/
> 
> ~ Oleksii


