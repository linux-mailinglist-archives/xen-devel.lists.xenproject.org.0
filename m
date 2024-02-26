Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FCA867814
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 15:20:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685561.1066461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rebq8-0007c0-21; Mon, 26 Feb 2024 14:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685561.1066461; Mon, 26 Feb 2024 14:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rebq7-0007Zk-VI; Mon, 26 Feb 2024 14:20:19 +0000
Received: by outflank-mailman (input) for mailman id 685561;
 Mon, 26 Feb 2024 14:20:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rebq6-0007YQ-Bg
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 14:20:18 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 294c1257-d4b2-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 15:20:15 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so502497466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 06:20:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 lu2-20020a170906fac200b00a3d1c0a3d5dsm2480455ejb.63.2024.02.26.06.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 06:20:15 -0800 (PST)
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
X-Inumbo-ID: 294c1257-d4b2-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708957215; x=1709562015; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qhOeWIZKnxkG91hGdjdz+br2BrR2hSoGpLpqsWeiUvg=;
        b=XgBtzANJ5uE3f4irkFrJXlkPFpov4LIOdAaJGaKsddzgeBDiPCOYE9nZwrTetbRcsY
         gvmHKSWsOBGApaNJJXteLFaYXmtCAIL+a8f05hPb5p4HxdlDudL1QoMM6Wi4aF8dzYnm
         0B+gi2fFno0QYjVQZW8DR6dDDviUfDmVXKJ2chSqBsmerNkcMiOgtQLjJTwy8n92Kwcb
         b4AW0jSr/3SJwxjgz8VVq95oDKmOVq1dUx0SQYKDUtECmwy6iXTkXtBgdxDfqkwLMgJb
         liBrCng3BECx+nysTcWJ8FmoJ629F3DSeEr2Q/DAeyjXkRkJlhOhoeZbHe9MF0qqOBOS
         gZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708957215; x=1709562015;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhOeWIZKnxkG91hGdjdz+br2BrR2hSoGpLpqsWeiUvg=;
        b=T6npQxvPo5f9pfEh2XECI4nu/bCci7fdO7q6IUmuACTmbbED3qXE6nwvsiqCCJA1Bn
         xcyxT2vikrkpRbkqDfj71pdxuko3n0lcFTsY1ShriQ8spyUTx23iuJjHWUPJTODRVpdv
         2lsom8aTWL4V25T60uq1oRhPzIb67KUSLnPWQdFkt6ZVLvnaiS89AeF1vgOwaREUjMop
         A599WrWDx0dKevXPyPm3cfvqrXXukB5aJbZtMHzvxDORrn6aHs3KpRziMu8XQGvmdxTI
         1ufLBxf5NPRiqnFiY/zjgDlBIqJXbw6OOKEO613G18mv+rXm8zthY+XyDgMj5k3O8IFW
         VbDg==
X-Forwarded-Encrypted: i=1; AJvYcCXSXtMRQsug0pF5He1n10qk4zwoy/WM+8+nWscQxCw/3kRiXf53qsSxUToh30uepfDzKqBjDha4ZigW9avGymBtqpAmueytoifAZ62ALpA=
X-Gm-Message-State: AOJu0YyLh3rFwLrptE/00ickRZUVGFJ7g6tfzatMMU34FfpabKara4/u
	Gu6ARXtMXieN82TLSag0oRTi9kzBbt79Ys/Z3NoNf79UvvoLa5NS+pw/8f/4MA==
X-Google-Smtp-Source: AGHT+IG0gJ7ZFtUME12dZVyQhDkSa2kpsdrg0sqieBQCFDtppOQtaNZgCxfMXzYGYYWaJjHHTxNtvw==
X-Received: by 2002:a17:907:78d7:b0:a43:74fa:4d06 with SMTP id kv23-20020a17090778d700b00a4374fa4d06mr972956ejc.60.1708957215359;
        Mon, 26 Feb 2024 06:20:15 -0800 (PST)
Message-ID: <4f59127c-6a98-4672-9202-4d48817a1931@suse.com>
Date: Mon, 26 Feb 2024 15:20:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
 <9e50ef30-8dc6-4380-aa65-724e5a376c10@suse.com>
 <28844fdfcf5eea515497fb7b5fd8ea6fb1c5ebaa.camel@gmail.com>
 <554a43e8-7d8d-45c4-936d-36f02c207531@suse.com>
 <1c53b52ee39161a8f59209d28af69fe997479dbc.camel@gmail.com>
 <3b38fe82-ee0f-4666-93e1-bd78fe69c534@suse.com>
 <5d2d35fe014094c991363e42c3e2ad9ca2af3938.camel@gmail.com>
 <44fd5092-7838-4d28-804b-bbfebfd44886@suse.com>
 <56ae27d003b8763af34864ae56433691685c3661.camel@gmail.com>
 <7cab68d1-9bdf-4ea1-b49a-cce1e4af4692@suse.com>
 <4215fb9eb5be5898b3cc9c2977e55ac0e7270b4d.camel@gmail.com>
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
In-Reply-To: <4215fb9eb5be5898b3cc9c2977e55ac0e7270b4d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2024 13:58, Oleksii wrote:
> On Mon, 2024-02-26 at 12:28 +0100, Jan Beulich wrote:
>> On 26.02.2024 12:18, Oleksii wrote:
>>> On Mon, 2024-02-26 at 10:45 +0100, Jan Beulich wrote:
>>>> On 23.02.2024 13:23, Oleksii wrote:
>>>>>>
>>>>>>>>> As 1- and 2-byte cases are emulated I decided that is
>>>>>>>>> not
>>>>>>>>> to
>>>>>>>>> provide
>>>>>>>>> sfx argument for emulation macros as it will not have
>>>>>>>>> to
>>>>>>>>> much
>>>>>>>>> affect on
>>>>>>>>> emulated types and just consume more performance on
>>>>>>>>> acquire
>>>>>>>>> and
>>>>>>>>> release
>>>>>>>>> version of sc/ld instructions.
>>>>>>>>
>>>>>>>> Question is whether the common case (4- and 8-byte
>>>>>>>> accesses)
>>>>>>>> shouldn't
>>>>>>>> be valued higher, with 1- and 2-byte emulation being
>>>>>>>> there
>>>>>>>> just
>>>>>>>> to
>>>>>>>> allow things to not break altogether.
>>>>>>> If I understand you correctly, it would make sense to add
>>>>>>> the
>>>>>>> 'sfx'
>>>>>>> argument for the 1/2-byte access case, ensuring that all
>>>>>>> options
>>>>>>> are
>>>>>>> available for 1/2-byte access case as well.
>>>>>>
>>>>>> That's one of the possibilities. As said, I'm not overly
>>>>>> worried
>>>>>> about
>>>>>> the emulated cases. For the initial implementation I'd
>>>>>> recommend
>>>>>> going
>>>>>> with what is easiest there, yielding the best possible result
>>>>>> for
>>>>>> the
>>>>>> 4- and 8-byte cases. If later it turns out repeated
>>>>>> acquire/release
>>>>>> accesses are a problem in the emulation loop, things can be
>>>>>> changed
>>>>>> to explicit barriers, without touching the 4- and 8-byte
>>>>>> cases.
>>>>> I am confused then a little bit if emulated case is not an
>>>>> issue.
>>>>>
>>>>> For 4- and 8-byte cases for xchg .aqrl is used, for relaxed and
>>>>> aqcuire
>>>>> version of xchg barries are used.
>>>>>
>>>>> The similar is done for cmpxchg.
>>>>>
>>>>> If something will be needed to change in emulation loop it
>>>>> won't
>>>>> require to change 4- and 8-byte cases.
>>>>
>>>> I'm afraid I don't understand your reply.
>>> IIUC, emulated cases it is implemented correctly in terms of usage
>>> barriers. And it also OK not to use sfx for lr/sc instructions and
>>> use
>>> only barriers.
>>>
>>> For 4- and 8-byte cases are used sfx + barrier depending on the
>>> specific case ( relaxed, acquire, release, generic xchg/cmpxchg ).
>>> What also looks to me correct. But you suggested to provide the
>>> best
>>> possible result for 4- and 8-byte cases. 
>>>
>>> So I don't understand what the best possible result is as the
>>> current
>>> one usage of __{cmp}xchg_generic for each specific case  ( relaxed,
>>> acquire, release, generic xchg/cmpxchg ) looks correct to me:
>>> xchg -> (..., ".aqrl", "", "") just suffix .aqrl suffix without
>>> barriers.
>>> xchg_release -> (..., "", RISCV_RELEASE_BARRIER, "" ) use only
>>> release
>>> barrier
>>> xchg_acquire -> (..., "", "", RISCV_ACQUIRE_BARRIER ), only acquire
>>> barrier
>>> xchg_relaxed ->  (..., "", "", "") - no barries, no sfx
>>
>> So first: While explicit barriers are technically okay, I don't
>> follow why
>> you insist on using them when you can achieve the same by suitably
>> tagging
>> the actual insn doing the exchange. Then second: It's somewhat hard
>> for me
>> to see the final effect on the emulation paths without you actually
>> having
>> done the switch. Maybe no special handling is necessary there anymore
>> then. And as said, it may actually be acceptable for the emulation
>> paths
>> to "only" be correct, but not be ideal in terms of performance. After
>> all,
>> if you use the normal 4-byte primitive in there, more (non-explicit)
>> barriers than needed would occur if the involved loop has to take
>> more
>> than one iteration. Which could (but imo doesn't need to be) avoided
>> by
>> using a more relaxed 4-byte primitive there and an explicit barrier
>> outside of the loop.
> 
> According to the spec:
> Table A.5 ( part of the table only I copied here )
> 
> Linux Construct          RVWMO Mapping
> atomic <op> relaxed           amo<op>.{w|d}
> atomic <op> acquire           amo<op>.{w|d}.aq
> atomic <op> release           amo<op>.{w|d}.rl
> atomic <op>                   amo<op>.{w|d}.aqrl
> 
> Linux Construct          RVWMO LR/SC Mapping
> atomic <op> relaxed       loop: lr.{w|d}; <op>; sc.{w|d}; bnez loop
> atomic <op> acquire       loop: lr.{w|d}.aq; <op>; sc.{w|d}; bnez loop
> atomic <op> release       loop: lr.{w|d}; <op>; sc.{w|d}.aqrl∗ ; bnez 
> loop OR
>                           fence.tso; loop: lr.{w|d}; <op>; sc.{w|d}∗ ;
> bnez loop
> atomic <op>               loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl; bnez
> loop

In your consideration what to implement you will want to limit
things to constructs we actually use. I can't find any use of the
relaxed, acquire, or release forms of atomics as mentioned above.

> The Linux mappings for release operations may seem stronger than
> necessary, but these mappings
> are needed to cover some cases in which Linux requires stronger
> orderings than the more intuitive
> mappings would provide. In particular, as of the time this text is
> being written, Linux is actively
> debating whether to require load-load, load-store, and store-store
> orderings between accesses in one
> critical section and accesses in a subsequent critical section in the
> same hart and protected by the
> same synchronization object. Not all combinations of FENCE RW,W/FENCE
> R,RW mappings
> with aq/rl mappings combine to provide such orderings. There are a few
> ways around this problem,
> including:
> 1. Always use FENCE RW,W/FENCE R,RW, and never use aq/rl. This suffices
> but is undesir-
> able, as it defeats the purpose of the aq/rl modifiers.
> 2. Always use aq/rl, and never use FENCE RW,W/FENCE R,RW. This does not
> currently work
> due to the lack of load and store opcodes with aq and rl modifiers.

I don't understand this point: Which specific load and/or store forms
are missing? According to my reading of the A extension spec all
combination of aq/rl exist with both lr and sc.

> 3. Strengthen the mappings of release operations such that they would
> enforce sufficient order-
> ings in the presence of either type of acquire mapping. This is the
> currently-recommended
> solution, and the one shown in Table A.5.
> 
> 
> Based on this it is enough in our case use only suffixed istructions
> (amo<op>.{w|d}{.aq, .rl, .aqrl, .aqrl }, lr.{w|d}.{.aq, .aqrl }.
> 
> 
> But as far as I understand in Linux atomics were strengthen with
> fences:
>     Atomics present the same issue with locking: release and acquire
>     variants need to be strengthened to meet the constraints defined
>     by the Linux-kernel memory consistency model [1].
>     
>     Atomics present a further issue: implementations of atomics such
>     as atomic_cmpxchg() and atomic_add_unless() rely on LR/SC pairs,
>     which do not give full-ordering with .aqrl; for example, current
>     implementations allow the "lr-sc-aqrl-pair-vs-full-barrier" test
>     below to end up with the state indicated in the "exists" clause.
>     
>     In order to "synchronize" LKMM and RISC-V's implementation, this
>     commit strengthens the implementations of the atomics operations
>     by replacing .rl and .aq with the use of ("lightweigth") fences,
>     and by replacing .aqrl LR/SC pairs in sequences such as:
>     
>       0:      lr.w.aqrl  %0, %addr
>               bne        %0, %old, 1f
>               ...
>               sc.w.aqrl  %1, %new, %addr
>               bnez       %1, 0b
>       1:
>     
>     with sequences of the form:
>     
>       0:      lr.w       %0, %addr
>               bne        %0, %old, 1f
>               ...
>               sc.w.rl    %1, %new, %addr   /* SC-release   */
>               bnez       %1, 0b
>               fence      rw, rw            /* "full" fence */
>       1:
>     
>     following Daniel's suggestion.

I'm likely missing something, yet as it looks it does help that the
code fragment above appears to be ...

>     These modifications were validated with simulation of the RISC-V
>     with sequences of the form:
>     
>       0:      lr.w       %0, %addr
>               bne        %0, %old, 1f
>               ...
>               sc.w.rl    %1, %new, %addr   /* SC-release   */
>               bnez       %1, 0b
>               fence      rw, rw            /* "full" fence */
>       1:
>     
>     following Daniel's suggestion.

... entirely the same as this one. Yet there's presumably a reason
for quoting it twice?

>     These modifications were validated with simulation of the RISC-V
>     memory consistency model.
>     
>     C lr-sc-aqrl-pair-vs-full-barrier
>     
>     {}
>     
>     P0(int *x, int *y, atomic_t *u)
>     {
>             int r0;
>             int r1;
>     
>             WRITE_ONCE(*x, 1);
>             r0 = atomic_cmpxchg(u, 0, 1);
>             r1 = READ_ONCE(*y);
>     }
>     
>     P1(int *x, int *y, atomic_t *v)
>     {
>             int r0;
>             int r1;
>     
>             WRITE_ONCE(*y, 1);
>             r0 = atomic_cmpxchg(v, 0, 1);
>             r1 = READ_ONCE(*x);
>     }
>     
>     exists (u=1 /\ v=1 /\ 0:r1=0 /\ 1:r1=0)
>     
>     [1] https://marc.info/?l=linux-kernel&m=151930201102853&w=2
>      
> https://groups.google.com/a/groups.riscv.org/forum/#!topic/isa-dev/hKywNHBkAXM
>         https://marc.info/?l=linux-kernel&m=151633436614259&w=2
> 
> 
> Thereby Linux kernel implementation seems to me more safe and it is a
> reason why I want/wanted to be aligned with it.

Which may end up being okay. I hope you realize though that there's a
lot more explanation needed in the respective commits then compared to
what you've had so far. As a minimum, absolutely anything remotely
unexpected needs to be explained.

Jan

