Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D3188DC14
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 12:08:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698426.1090041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpR7z-0002e6-9b; Wed, 27 Mar 2024 11:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698426.1090041; Wed, 27 Mar 2024 11:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpR7z-0002at-6j; Wed, 27 Mar 2024 11:07:31 +0000
Received: by outflank-mailman (input) for mailman id 698426;
 Wed, 27 Mar 2024 11:07:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpR7x-0002al-El
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 11:07:29 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32c5c9b0-ec2a-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 12:07:28 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a46d0a8399aso126173266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 04:07:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a8-20020a170906670800b00a4710e7817esm5307365ejp.135.2024.03.27.04.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 04:07:27 -0700 (PDT)
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
X-Inumbo-ID: 32c5c9b0-ec2a-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711537647; x=1712142447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zegOue7UV3ZNNNDbafI17QLirkPrTLHYo8D7OEQ1Rjo=;
        b=TjftFTi9q9UxiVOwrvOkPjnHNShjHakpgHvUqhVYOScoNvbfxlDBiILI7IQ2bX3eSx
         dZQSYgZc8WlfpGjXMS/MLjPmwCIpeHB2KNhxJY2AmbmSsxBS6L6HnIcuYOTjngz2ljMc
         aHWLDCBwIHBZqkQX2Zw+ZQ7HtZAuFnRX4bqc383vZWAUxEH6L0WVjHKJm9FecVm69hRY
         rhco4VHq4qb+hdX8qjrLGLuwxu2HP0PdV/JwuBVOEzazBygIZI+Sdd+nS9wemO2/o4f/
         0vd4SWTimY95P485SfxAuTXQE10W+Kte0HSidFpi2kY6Of9g1MJqLQIc411Bdb3ew4Yy
         ZNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711537647; x=1712142447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zegOue7UV3ZNNNDbafI17QLirkPrTLHYo8D7OEQ1Rjo=;
        b=bumjVGJ3sR/xUwNiwV8TW9hyNkYziqHSLny6Q3CK0UdGbDkQzYFiZbMDB0X+LvKeKJ
         a8KhroQOthtQGU9ocFpECjK2fH1H+8n6T7CBx1kibDJ7e4RxMlFGgRkgRCbDQoFtTLqB
         BbM2WEijVXIeA0P5Jvl3HECXM51flXhoWuUgV0WN/jnLZ1MnsxJxsyd+Ucb95BCXTspw
         qEvV5HWnExo8+MAplVNU6b8NQRUpLlzs2dExLk6gfCIh5b7KRVRlii2c/YfY1VYhd9qV
         9rbvV65b4RmnOlHtprsKBp9vC+E0Nnsw6UlwVRmP0DXseJ/vcRnrzy10asS5AmUAvWMl
         0Y9A==
X-Forwarded-Encrypted: i=1; AJvYcCVulvC6B/nOoL6eLU8w9agVao18FwRRdqNNg+lXUiqticeJTR2aOnLhz4P3SFNACU1CJkiIEp202PZ0y182j8pT5fv5FU/ThU49bQMpYQg=
X-Gm-Message-State: AOJu0Yxz5XBtBtUUEZEaIHIvm/W+RGwGn8CSL/UDGJ6P8lhmwTtkTE9N
	PFvufv+EZPx96VyX6liziAh+uL3p2h6SujG+McUZItlJv+CQ85rcyS16P0g5xg==
X-Google-Smtp-Source: AGHT+IEd4cMFvWL6QBn5vugx47Qsa8iMGIOr3e6cBPvykYS98nkR+0xEekpXuZfZZmng6TQorwGuVw==
X-Received: by 2002:a17:906:b4a:b0:a4e:4d9:7ce4 with SMTP id v10-20020a1709060b4a00b00a4e04d97ce4mr1228500ejg.30.1711537647532;
        Wed, 27 Mar 2024 04:07:27 -0700 (PDT)
Message-ID: <49cc57f4-f246-4433-841e-b9d1c58da1f2@suse.com>
Date: Wed, 27 Mar 2024 12:07:26 +0100
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
 <2bac4852-b5f1-4424-ac1a-29e76563ab2b@suse.com>
 <f8647945e9d195fd4b2acd0655d7f884ce66fc3a.camel@gmail.com>
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
In-Reply-To: <f8647945e9d195fd4b2acd0655d7f884ce66fc3a.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2024 11:28, Oleksii wrote:
> On Wed, 2024-03-27 at 08:40 +0100, Jan Beulich wrote:
> ...
> 
>>>>>>> +/* This is required to provide a full barrier on success.
>>>>>>> */
>>>>>>> +static inline int atomic_add_unless(atomic_t *v, int a,
>>>>>>> int u)
>>>>>>> +{
>>>>>>> +       int prev, rc;
>>>>>>> +
>>>>>>> +    asm volatile (
>>>>>>> +        "0: lr.w     %[p],  %[c]\n"
>>>>>>> +        "   beq      %[p],  %[u], 1f\n"
>>>>>>> +        "   add      %[rc], %[p], %[a]\n"
>>>>>>> +        "   sc.w.rl  %[rc], %[rc], %[c]\n"
>>>>>>> +        "   bnez     %[rc], 0b\n"
>>>>>>> +        RISCV_FULL_BARRIER
>>>>>>
>>>>>> With this and no .aq on the load, why the .rl on the store?
>>>>> It is something that LKMM requires [1].
>>>>>
>>>>> This is not fully clear to me what is so specific in LKMM, but
>>>>> accoring
>>>>> to the spec:
>>>>>    Ordering Annotation Fence-based Equivalent
>>>>>    l{b|h|w|d|r}.aq     l{b|h|w|d|r}; fence r,rw
>>>>>    l{b|h|w|d|r}.aqrl   fence rw,rw; l{b|h|w|d|r}; fence r,rw
>>>>>    s{b|h|w|d|c}.rl     fence rw,w; s{b|h|w|d|c}
>>>>>    s{b|h|w|d|c}.aqrl   fence rw,w; s{b|h|w|d|c}
>>>>>    amo<op>.aq          amo<op>; fence r,rw
>>>>>    amo<op>.rl          fence rw,w; amo<op>
>>>>>    amo<op>.aqrl        fence rw,rw; amo<op>; fence rw,rw
>>>>>    Table 2.2: Mappings from .aq and/or .rl to fence-based
>>>>> equivalents.
>>>>>    An alternative mapping places a fence rw,rw after the
>>>>> existing 
>>>>>    s{b|h|w|d|c} mapping rather than at the front of the
>>>>>    l{b|h|w|d|r} mapping.
>>>>
>>>> I'm afraid I can't spot the specific case in this table. None of
>>>> the
>>>> stores in the right column have a .rl suffix.
>>> Yes, it is expected.
>>>
>>> I am reading this table as (f.e.) amo<op>.rl is an equivalent of
>>> fence
>>> rw,w; amo<op>. (without .rl) 
>>
>> In which case: How does quoting the table answer my original
>> question?
> Agree, it is starting to be confusing, so let me give an answer to your
> question below.
> 
>>
>>>>>    It is also safe to translate any .aq, .rl, or .aqrl
>>>>> annotation
>>>>> into
>>>>>    the fence-based snippets of
>>>>>    Table 2.2. These can also be used as a legal implementation
>>>>> of
>>>>>    l{b|h|w|d} or s{b|h|w|d} pseu-
>>>>>    doinstructions for as long as those instructions are not
>>>>> added
>>>>> to
>>>>>    the ISA.
>>>>>
>>>>> So according to the spec, it should be:
>>>>>  sc.w ...
>>>>>  RISCV_FULL_BARRIER.
>>>>>
>>>>> Considering [1] and how this code looks before, it seems to me
>>>>> that
>>>>> it
>>>>> is safe to use lr.w.aq/sc.w.rl here or an fence equivalent.
>>>>
>>>> Here you say "or". Then why dos the code use sc.?.rl _and_ a
>>>> fence?
>>> I confused this line with amo<op>.aqrl, so based on the table 2.2
>>> above
>>> s{b|h|w|d|c}.aqrl is transformed to "fence rw,w; s{b|h|w|d|c}", but
>>> Linux kernel decided to strengthen it with full barrier:
>>>    -              "0:\n\t"
>>>    -              "lr.w.aqrl  %[p],  %[c]\n\t"
>>>    -              "beq        %[p],  %[u], 1f\n\t"
>>>    -              "add       %[rc],  %[p], %[a]\n\t"
>>>    -              "sc.w.aqrl %[rc], %[rc], %[c]\n\t"
>>>    -              "bnez      %[rc], 0b\n\t"
>>>    -              "1:"
>>>    +               "0:     lr.w     %[p],  %[c]\n"
>>>    +               "       beq      %[p],  %[u], 1f\n"
>>>    +               "       add      %[rc], %[p], %[a]\n"
>>>    +               "       sc.w.rl  %[rc], %[rc], %[c]\n"
>>>    +               "       bnez     %[rc], 0b\n"
>>>    +               "       fence    rw, rw\n"
>>>    +               "1:\n"
>>> As they have the following issue:
>>>    implementations of atomics such as atomic_cmpxchg() and
>>>    atomic_add_unless() rely on LR/SC pairs,
>>>    which do not give full-ordering with .aqrl; for example, current
>>>    implementations allow the "lr-sc-aqrl-pair-vs-full-barrier" test
>>>    below to end up with the state indicated in the "exists" clause.
>>
>> Is that really "current implementations", not "the abstract model"?
>> If so, the use of an explicit fence would be more like a workaround
>> (and would hence want commenting to that effect).
>>
>> In neither case can I see my original question answered: Why the .rl
>> on the store when there is a full fence later?
> The good explanation for that was provided in the commit addressing a
> similar issue for ARM64 [
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/1391516953-14541-1-git-send-email-will.deacon@arm.com/
> ].
> The same holds true for RISC-V since ARM also employs WMO.
> 
> I would also like to mention another point, as I indicated in another
> email thread
> [ https://lists.xen.org/archives/html/xen-devel/2024-03/msg01582.html ]
> , that now this fence can be omitted and .aqrl can be used instead.
> 
> This was confirmed by Dan (the author of the RVWMO spec)
> [https://lore.kernel.org/linux-riscv/41e01514-74ca-84f2-f5cc-2645c444fd8e@nvidia.com/
> ]
> 
> I hope this addresses your original question. Does it?

I think it does, thanks. Some of this will need putting in at least the
patch description, if not a code comment.

Jan

