Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE20874CA6
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 11:47:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689758.1075022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riBGu-0001Op-5H; Thu, 07 Mar 2024 10:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689758.1075022; Thu, 07 Mar 2024 10:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riBGu-0001Le-0l; Thu, 07 Mar 2024 10:46:44 +0000
Received: by outflank-mailman (input) for mailman id 689758;
 Thu, 07 Mar 2024 10:46:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riBGs-0001LT-AB
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 10:46:42 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb5afb53-dc6f-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 11:46:41 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a44628725e3so101459666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 02:46:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i7-20020a17090639c700b00a45ae9636d2sm2297200eje.107.2024.03.07.02.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 02:46:40 -0800 (PST)
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
X-Inumbo-ID: fb5afb53-dc6f-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709808401; x=1710413201; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZ3Hlv3IloJ+ZC2OKOC4rqgHWvC3LhHGBUj0s74mEFI=;
        b=GJRSK7DoLd8NSqC8t/Uf37znVjVKoMZsArc+kHBY8ARH7oyauFfaEBx4e5VZBTAKg0
         9OyixqIci/9Z3Bz9c7evUhP0SeFnbv1+17GT5i65ZK7quLGHK+cXaDHEh3O0IDT2xOGA
         MPQvcxcJpLrZslfFcDis/02eGuWuKZDVxRc1x43PW5ZgXUHVIbzawP9fOEugJ5yqi0DP
         DQ4zTwPBQOfqcXboQL+/iuYZzWawjQsBYULEuTi0N0WC6qiRPD989ie/u2r1IrHonjLN
         cUNi0kzbWrpm5CEgsK+PPFjzQVq+Ft6QaFMfTjMax391Ox75sQB6g7JYcMJPvCYPh+jp
         OvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709808401; x=1710413201;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ3Hlv3IloJ+ZC2OKOC4rqgHWvC3LhHGBUj0s74mEFI=;
        b=NKLo/SjhjECoRfoZGBVb47901HG3c5HK2Yk1bMBdEKUeyvyWryE4LPLzl8RAKXF06r
         Xty8faytvKAygO0rgL9HWC09y7ezlh+CBcj2a1lxcOoh2SHgRi8JfFKfQ1cF7/sCiZFa
         zTd9J6CTBEVyd5Rc3FQb0GU79SAfxLPln2oMTTX7ZbKA1a3EyYSegPEhympGueo14B7R
         7MjiQHDPZ60TWit1Rh69PHcU57UPCq++UhSukShLz+FaZ96HNY71YQ2DvqBXaI0iHlug
         giYZcI9o4ejSrfIUDZm5EEba5dA/Pib7vh4XG5Kqpa4X3qiY7wvdmtv0YGce6aeGVPEj
         aD3g==
X-Forwarded-Encrypted: i=1; AJvYcCUEwPFtQgG48GYFKP3eDNIMralYYi19KaT68gqyJtyeDXPLhIb7sQ1BkwJktMWg6xq2tzO7PmUgko/J9yuDrTLXuUkd+Cy8NAJO9Wctw7E=
X-Gm-Message-State: AOJu0Yy9WBFojLYCZI5teAnuX596UxAwlQg1kPhD/OpE49zl2gkLT0H3
	cZEGpwNTX8VjnWSFH6bWz4rc9+1gVwHjMUu3S9UrJrnlFMiOP1sMz22CthtqZw==
X-Google-Smtp-Source: AGHT+IG2QmYH74T2ZqsmxzCAYzR6PKE5C77KI/OsRCHlk7x9YXnp8/40KEn72bakMQ8fanJArv+llA==
X-Received: by 2002:a17:906:4902:b0:a45:1254:abd5 with SMTP id b2-20020a170906490200b00a451254abd5mr8819334ejq.58.1709808400644;
        Thu, 07 Mar 2024 02:46:40 -0800 (PST)
Message-ID: <dd45b338-7b43-442d-85cd-307b3d228d87@suse.com>
Date: Thu, 7 Mar 2024 11:46:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/23] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <ce7604de39b3480553eeaeafc11138494016983f.1708962629.git.oleksii.kurochko@gmail.com>
 <23ff1c20-91f3-4c60-9562-7f1cd57c1043@suse.com>
 <f6e16589bfbcd94d6f62c34f080cbcd3406eca6f.camel@gmail.com>
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
In-Reply-To: <f6e16589bfbcd94d6f62c34f080cbcd3406eca6f.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2024 11:35, Oleksii wrote:
> On Wed, 2024-03-06 at 15:56 +0100, Jan Beulich wrote:
>> On 26.02.2024 18:38, Oleksii Kurochko wrote:
>>> The header was taken from Linux kernl 6.4.0-rc1.
>>>
>>> Addionally, were updated:
>>> * add emulation of {cmp}xchg for 1/2 byte types using 32-bit atomic
>>>   access.
>>> * replace tabs with spaces
>>> * replace __* variale with *__
>>> * introduce generic version of xchg_* and cmpxchg_*.
>>>
>>> Implementation of 4- and 8-byte cases were left as it is done in
>>> Linux kernel as according to the RISC-V spec:
>>> ```
>>> Table A.5 ( only part of the table was copied here )
>>>
>>> Linux Construct       RVWMO Mapping
>>> atomic <op> relaxed    amo<op>.{w|d}
>>> atomic <op> acquire    amo<op>.{w|d}.aq
>>> atomic <op> release    amo<op>.{w|d}.rl
>>> atomic <op>            amo<op>.{w|d}.aqrl
>>>
>>> Linux Construct       RVWMO LR/SC Mapping
>>> atomic <op> relaxed    loop: lr.{w|d}; <op>; sc.{w|d}; bnez loop
>>> atomic <op> acquire    loop: lr.{w|d}.aq; <op>; sc.{w|d}; bnez loop
>>> atomic <op> release    loop: lr.{w|d}; <op>; sc.{w|d}.aqrl∗ ; bnez
>>> loop OR
>>>                        fence.tso; loop: lr.{w|d}; <op>; sc.{w|d}∗ ;
>>> bnez loop
>>> atomic <op>            loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl; bnez
>>> loop
>>>
>>> The Linux mappings for release operations may seem stronger than
>>> necessary,
>>> but these mappings are needed to cover some cases in which Linux
>>> requires
>>> stronger orderings than the more intuitive mappings would provide.
>>> In particular, as of the time this text is being written, Linux is
>>> actively
>>> debating whether to require load-load, load-store, and store-store
>>> orderings
>>> between accesses in one critical section and accesses in a
>>> subsequent critical
>>> section in the same hart and protected by the same synchronization
>>> object.
>>> Not all combinations of FENCE RW,W/FENCE R,RW mappings with aq/rl
>>> mappings
>>> combine to provide such orderings.
>>> There are a few ways around this problem, including:
>>> 1. Always use FENCE RW,W/FENCE R,RW, and never use aq/rl. This
>>> suffices
>>>    but is undesirable, as it defeats the purpose of the aq/rl
>>> modifiers.
>>> 2. Always use aq/rl, and never use FENCE RW,W/FENCE R,RW. This does
>>> not
>>>    currently work due to the lack of load and store opcodes with aq
>>> and rl
>>>    modifiers.
>>
>> As before I don't understand this point. Can you give an example of
>> what
>> sort of opcode / instruction is missing?
> If I understand the spec correctly then l{b|h|w|d} and s{b|h|w|d}
> instructions don't have aq or rl annotation.

How would load insns other that LR and store insns other than SC come
into play here?

>>> 3. Strengthen the mappings of release operations such that they
>>> would
>>>    enforce sufficient orderings in the presence of either type of
>>> acquire mapping.
>>>    This is the currently-recommended solution, and the one shown in
>>> Table A.5.
>>> ```
>>>
>>> But in Linux kenrel atomics were strengthen with fences:
>>> ```
>>> Atomics present the same issue with locking: release and acquire
>>> variants need to be strengthened to meet the constraints defined
>>> by the Linux-kernel memory consistency model [1].
>>>
>>> Atomics present a further issue: implementations of atomics such
>>> as atomic_cmpxchg() and atomic_add_unless() rely on LR/SC pairs,
>>> which do not give full-ordering with .aqrl; for example, current
>>> implementations allow the "lr-sc-aqrl-pair-vs-full-barrier" test
>>> below to end up with the state indicated in the "exists" clause.
>>>
>>> In order to "synchronize" LKMM and RISC-V's implementation, this
>>> commit strengthens the implementations of the atomics operations
>>> by replacing .rl and .aq with the use of ("lightweigth") fences,
>>> and by replacing .aqrl LR/SC pairs in sequences such as:
>>>
>>> 0:      lr.w.aqrl  %0, %addr
>>>         bne        %0, %old, 1f
>>>         ...
>>>         sc.w.aqrl  %1, %new, %addr
>>>         bnez       %1, 0b
>>> 1:
>>>
>>> with sequences of the form:
>>>
>>> 0:      lr.w       %0, %addr
>>>         bne        %0, %old, 1f
>>>               ...
>>>         sc.w.rl    %1, %new, %addr   /* SC-release   */
>>>         bnez       %1, 0b
>>>         fence      rw, rw            /* "full" fence */
>>> 1:
>>>
>>> following Daniel's suggestion.
>>>
>>> These modifications were validated with simulation of the RISC-V
>>> memory consistency model.
>>>
>>> C lr-sc-aqrl-pair-vs-full-barrier
>>>
>>> {}
>>>
>>> P0(int *x, int *y, atomic_t *u)
>>> {
>>>         int r0;
>>>         int r1;
>>>
>>>         WRITE_ONCE(*x, 1);
>>>         r0 = atomic_cmpxchg(u, 0, 1);
>>>         r1 = READ_ONCE(*y);
>>> }
>>>
>>> P1(int *x, int *y, atomic_t *v)
>>> {
>>>         int r0;
>>>         int r1;
>>>
>>>         WRITE_ONCE(*y, 1);
>>>         r0 = atomic_cmpxchg(v, 0, 1);
>>>         r1 = READ_ONCE(*x);
>>> }
>>>
>>> exists (u=1 /\ v=1 /\ 0:r1=0 /\ 1:r1=0)
>>
>> While I'm entirely willing to trust this can happen, I can't bring
>> this
>> in line with the A extension spec.
>>
>> Additionally it's not clear to me in how far all of this applies when
>> you don't really use LR/SC in the 4- and 8-byte cases (and going
>> forward
>> likely also not in the 1- and 2-byte case, utilizing Zahba when
>> available).
> It just explain what combination of fences, lr/sc, amoswap, .aq and .rl
> annotation can be combined, and why combinations introduced in this
> patch are used.

Except that I don't understand that explanation, iow why said combination
of values could be observed even when using suffixes properly.

>>> +    uint8_t new_val_pos = ((unsigned long)(ptr) & (0x4 -
>>> sizeof(*ptr))) * BITS_PER_BYTE; \
>>
>> Why uint8_t?
> It is enough to cover possible start bit position of value that should
> be updated, so I decided to use uint8_t.

Please take a look at the "Types" section in ./CODING_STYLE.

>>> +    { \
>>> +    case 1: \
>>> +    case 2: \
>>> +        ret__ = emulate_xchg_1_2(ptr, new__, sfx, pre, post); \
>>> +        break; \
>>> +    case 4: \
>>> +        __amoswap_generic(ptr, new__, ret__,\
>>> +                          ".w" sfx,  pre, post); \
>>> +        break; \
>>> +    case 8: \
>>> +        __amoswap_generic(ptr, new__, ret__,\
>>> +                          ".d" sfx,  pre, post); \
>>> +        break; \
>>
>> In io.h you make sure to avoid rv64-only insns. Here you don't. The
>> build
>> would fail either way, but this still looks inconsistent.
>>
>> Also nit: Stray double blands (twice) ahead of "pre". Plus with this
>> style
>> of line continuation you want to consistently have exactly one blank
>> ahead
>> of each backslash.
>>
>>> +    default: \
>>> +        STATIC_ASSERT_UNREACHABLE(); \
>>> +    } \
>>> +    ret__; \
>>> +})
>>> +
>>> +#define xchg_relaxed(ptr, x) \
>>> +({ \
>>> +    __typeof__(*(ptr)) x_ = (x); \
>>
>> What is the purpose of this, when __xchg_generic() already does this
>> same
>> type conversion?
>>
>>> +    (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(*(ptr)),
>>> "", "", ""); \
>>> +})
>>> +
>>> +#define xchg_acquire(ptr, x) \
>>> +({ \
>>> +    __typeof__(*(ptr)) x_ = (x); \
>>> +    (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(*(ptr)), \
>>> +                                       "", "",
>>> RISCV_ACQUIRE_BARRIER); \
>>> +})
>>> +
>>> +#define xchg_release(ptr, x) \
>>> +({ \
>>> +    __typeof__(*(ptr)) x_ = (x); \
>>> +    (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(*(ptr)),\
>>> +                                       "", RISCV_RELEASE_BARRIER,
>>> ""); \
>>> +})
>>
>> As asked before: Are there going to be any uses of these three?
>> Common
>> code doesn't require them. And not needing to provide them would
>> simplify things quite a bit, it seems.
> I checked my private branches and it looks to me that I introduced them
> only for the correspondent atomic operations ( which was copied from
> Linux Kernel ) which are not also used.
> 
> So we could definitely drop these macros for now, but should
> xchg_generic() be updated as well? If to look at:
>  #define xchg(ptr, x) __xchg_generic(ptr, (unsigned long)(x), sizeof(*
> (ptr)), \
>                                     ".aqrl", "", "")
> Last two arguments start to be unneeded, but I've wanted to leave them,
> in case someone will needed to back xchg_{release, acquire, ...}. Does
> it make any sense?

It all depends on how it's justified in the description.

>>> +#define xchg(ptr, x) __xchg_generic(ptr, (unsigned long)(x),
>>> sizeof(*(ptr)), \
>>> +                                    ".aqrl", "", "")
>>
>> According to the earlier comment (where I don't follow the example
>> given),
>> is .aqrl sufficient here? And even if it was for the 4- and 8-byte
>> cases,
>> is it sufficient in the 1- and 2-byte emulation case (where it then
>> is
>> appended to just the SC)?
> If I understand your question correctly then accroding to the spec.,
> .aqrl is enough for amo<op>.{w|d} instructions:
>    Linux Construct        RVWMO AMO Mapping
>    atomic <op> relaxed    amo<op>.{w|d}
>    atomic <op> acquire    amo<op>.{w|d}.aq
>    atomic <op> release    amo<op>.{w|d}.rl
>    atomic <op>            amo<op>.{w|d}.aqrl
> but in case of lr/sc you are right sc requires suffix too:
>    Linux Construct        RVWMO LR/SC Mapping
>    atomic <op> relaxed    loop: lr.{w|d}; <op>; sc.{w|d}; bnez loop
>    atomic <op> acquire    loop: lr.{w|d}.aq; <op>; sc.{w|d}; bnez loop
>    atomic <op> release    loop: lr.{w|d}; <op>; sc.{w|d}.aqrl∗ ; bnez 
>    loop OR fence.tso; loop: lr.{w|d}; <op>; sc.{w|d}∗ ; bnez loop
>    atomic <op>            loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl; bnez
>    loop
>    
> I will add sc_sfx to emulate_xchg_1_2(). The only question is left if
> __xchg_generic(ptr, new, size, sfx, pre, post) should be changed to:
> __xchg_generic(ptr, new, size, sfx1, sfx2, pre, post) to cover both
> cases amo<op>.{w|d}.sfx1 and lr.{w|d}.sfx1 ... sc.{w|d}.sfx2?

I expect that's going to be necessary. In the end you'll see what's needed
when making the code adjustment.

Jan

