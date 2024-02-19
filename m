Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EAA85A1D7
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 12:22:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682773.1061923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc1jI-0001Nx-Sh; Mon, 19 Feb 2024 11:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682773.1061923; Mon, 19 Feb 2024 11:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc1jI-0001M2-Pn; Mon, 19 Feb 2024 11:22:36 +0000
Received: by outflank-mailman (input) for mailman id 682773;
 Mon, 19 Feb 2024 11:22:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc1jH-0001Lv-AD
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 11:22:35 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ccd4605-cf19-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 12:22:32 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d23114b19dso15200591fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 03:22:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t18-20020a05600c451200b0040fd1629443sm11197016wmo.18.2024.02.19.03.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 03:22:32 -0800 (PST)
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
X-Inumbo-ID: 2ccd4605-cf19-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708341752; x=1708946552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pfPxolcSGvkU83gfDkTy6gFgXMHnooKhqzLG+gYAG5I=;
        b=HNV8kr/6LondVT2fR0zqHIMC8kPjj4pJDWUQh9F3UL4cof3rMtbseC0lEkylnR0P7o
         vDxLHtEgh9GXTt2tYQLBt0LpcpNNL64wmBrK+lfjmby9HM+aYedxTQioKfWPB1v0tMl1
         0C1IMCOoj5wEAbe/HxrVVB8xqu7BvPU/CQycwt/8FA1RgFgJJNUfny+SretsI/OHzMSk
         jLoSnRBt4hv9/3iwMyQ+IpxsQ+bJlOR9z2sUoXM7t6b5rbHiMYS7JRdS5mxZg9qRlKIf
         gLa27dFkHxv1uvhoxjxONFaATFqXrJDEOeHcBKCH9p9G4R9YAva6WwET7e+IrPjwHrJ8
         4OYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708341752; x=1708946552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfPxolcSGvkU83gfDkTy6gFgXMHnooKhqzLG+gYAG5I=;
        b=IoEsJOngJ2pjs0QUNObfNH6jRaohGR+V7OzDFai6k7NlRkiabF275+MMBm3eQ7d04X
         Ro5Puwl79M8gG1s/fLa/VMEaF3jAQOvG4TH2F8XvNeHP6PlF0fj6tfsjsS3ckjh8wUsK
         1zlkkGLwhRPXCc+YJi1GrcgHFywM77dJ4T0MLA26eSuNNVlOcWbeQezVK+K3kUPxUmOS
         bOISo5xzozbmqQvaCaq032j/eNhHFJWRgL37XnpBuwFlg2PSQgYFHeOg1VoxKf59C397
         NNg59XPg74LqygadtuQNp6CVHQ4vvDo5X8k0S+DlAZ1fXN4BGVkvYZNKieeEWjbgPmvv
         e/qA==
X-Forwarded-Encrypted: i=1; AJvYcCVN4EM6uvFD663F08wc7AlYfmldiOgTkHePiWTQlRotC3/rigs4fafA9qU2cljtxck/i74/uyMs70qZCKU4w0HhTx2x+Kh6kLCTydXrvlQ=
X-Gm-Message-State: AOJu0YwL9sSngoK4Sr6UP4ML7ummIwTXmJvQSmjDNRx9xutvzIzScyS+
	SdIJ/qyk7vAOWjbZSrchhMvn+uGh586F4BGidBhXtwCoqFPL0VQt4+t8PMTIvRtgUto+3Pl+hLQ
	=
X-Google-Smtp-Source: AGHT+IHIOEQx3O40dIDP9N8/4SnuFyNe/i6UTB+Wa0fe974lV2YMo3ukMB7PFAmDfR+Ih4HNMCu5Zg==
X-Received: by 2002:a05:651c:626:b0:2d2:21d8:bd6a with SMTP id k38-20020a05651c062600b002d221d8bd6amr4710890lje.44.1708341752297;
        Mon, 19 Feb 2024 03:22:32 -0800 (PST)
Message-ID: <554a43e8-7d8d-45c4-936d-36f02c207531@suse.com>
Date: Mon, 19 Feb 2024 12:22:32 +0100
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
In-Reply-To: <28844fdfcf5eea515497fb7b5fd8ea6fb1c5ebaa.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.02.2024 14:41, Oleksii wrote:
>>> +        : "=r" (ret), "+A" (*ptr) \
>>> +        : "r" (new) \
>>> +        : "memory" ); \
>>> +})
>>> +
>>> +#define emulate_xchg_1_2(ptr, new, ret, release_barrier,
>>> acquire_barrier) \
>>> +({ \
>>> +    uint32_t *ptr_32b_aligned = (uint32_t *)ALIGN_DOWN((unsigned
>>> long)ptr, 4); \
>>
>> You now appear to assume that this macro is only used with inputs not
>> crossing word boundaries. That's okay as long as suitably guaranteed
>> at the use sites, but imo wants saying in a comment.
>>
>>> +    uint8_t mask_l = ((unsigned long)(ptr) & (0x8 - sizeof(*ptr)))
>>> * BITS_PER_BYTE; \
>>
>> Why 0x8 (i.e. spanning 64 bits), not 4 (matching the uint32_t use
>> above)?
> The idea to read 8 bytes was to deal with crossing word boundary. So if
> our address is 0x3 and we have to xchg() 2 bytes, what will cross 4
> byte boundary. Instead we align add 0x3, so it will become 0x0 and then
> just always work with 8 bytes.

Then what if my 2-byte access crosses a dword boundary? A cache line
one? A page one?

>>> +    unsigned long new_ = (unsigned long)(new) << mask_l; \
>>> +    unsigned long ret_; \
>>> +    unsigned long rc; \
>>
>> Similarly, why unsigned long here?
> sizeof(unsigned long) is 8 bytes and it was chosen as we are working
> with lc/sc.d which are working with 8 bytes.
> 
>>
>> I also wonder about the mix of underscore suffixed (or not) variable
>> names here.
> If the question about ret_, then the same as before size of ret
> argument of the macros will be 1 or 2, but {lc/sc}.d expected to work
> with 8 bytes.

Then what's the uint32_t * about?

>>> +        release_barrier \
>>> +        "0: lr.d %0, %2\n" \
>>
>> Even here it's an 8-byte access. Even if - didn't check - the insn
>> was
>> okay to use with just a 4-byte aligned pointer, wouldn't it make
>> sense
>> then to 8-byte align it, and be consistent throughout this macro wrt
>> the base unit acted upon? Alternatively, why not use lr.w here, thus
>> reducing possible collisions between multiple CPUs accessing the same
>> cache line?
> According to the docs:
> LR and SC operate on naturally-aligned 64-bit (RV64 only) or 32-bit
> words in memory. Misaligned
> addresses will generate misaligned address exceptions.
> 
> My intention was to deal with 4-byte crossing boundary. so if ptr is 4-
> byte aligned then by reading 8-bytes we shouldn't care about boundary
> crossing, if I am not missing something.

If a ptr is 4-byte aligned, there's no point reading more than 4 bytes.

>>> +        "   and  %1, %0, %z4\n" \
>>> +        "   or   %1, %1, %z3\n" \
>>> +        "   sc.d %1, %1, %2\n" \
>>> +        "   bnez %1, 0b\n" \
>>> +        acquire_barrier \
>>> +        : "=&r" (ret_), "=&r" (rc), "+A" (*ptr_32b_aligned) \
>>> +        : "rJ" (new_), "rJ" (~mask) \
>>
>> I think that as soon as there are more than 2 or maybe 3 operands,
>> legibility is vastly improved by using named asm() operands.
> Just to clarify you mean that it would be better to use instead of %0
> use names?

Yes. Just like you have it in one of the other patches that I looked at
later.

>>> +        : "memory"); \
>>
>> Nit: Missing blank before closing parenthesis.
>>
>>> +    \
>>> +    ret = (__typeof__(*(ptr)))((ret_ & mask) >> mask_l); \
>>> +})
>>
>> Why does "ret" need to be a macro argument? If you had only the
>> expression here, not the the assigment, ...
>>
>>> +#define __xchg_generic(ptr, new, size, sfx, release_barrier,
>>> acquire_barrier) \
>>> +({ \
>>> +    __typeof__(ptr) ptr__ = (ptr); \
>>
>> Is this local variable really needed? Can't you use "ptr" directly
>> in the three macro invocations?
>>
>>> +    __typeof__(*(ptr)) new__ = (new); \
>>> +    __typeof__(*(ptr)) ret__; \
>>> +    switch (size) \
>>> +    { \
>>> +    case 1: \
>>> +    case 2: \
>>> +        emulate_xchg_1_2(ptr__, new__, ret__, release_barrier,
>>> acquire_barrier); \
>>
>> ... this would become
>>
>>         ret__ = emulate_xchg_1_2(ptr__, new__, release_barrier,
>> acquire_barrier); \
>>
>> But, unlike assumed above, there's no enforcement here that a 2-byte
>> quantity won't cross a word, double-word, cache line, or even page
>> boundary. That might be okay if then the code would simply crash
>> (like
>> the AMO insns emitted further down would), but aiui silent
>> misbehavior
>> would result.
> As I mentioned above with 4-byte alignment and then reading and working
> with 8-byte then crossing a word or double-word boundary shouldn't be
> an issue.
> 
> I am not sure that I know how to check that we are crossing cache line
> boundary.
> 
> Regarding page boundary, if the next page is mapped then all should
> work fine, otherwise it will be an exception.

Are you sure lr.d / sc.d are happy to access across such a boundary,
when both pages are mapped?

To me it seems pretty clear that for atomic accesses you want to
demand natural alignment, i.e. 2-byte alignment for 2-byte accesses.
This way you can be sure no potentially problematic boundaries will
be crossed.

>>> +        break; \
>>> +    case 4: \
>>> +        __amoswap_generic(ptr__, new__, ret__,\
>>> +                          ".w" sfx,  release_barrier,
>>> acquire_barrier); \
>>> +        break; \
>>> +    case 8: \
>>> +        __amoswap_generic(ptr__, new__, ret__,\
>>> +                          ".d" sfx,  release_barrier,
>>> acquire_barrier); \
>>> +        break; \
>>> +    default: \
>>> +        STATIC_ASSERT_UNREACHABLE(); \
>>> +    } \
>>> +    ret__; \
>>> +})
>>> +
>>> +#define xchg_relaxed(ptr, x) \
>>> +({ \
>>> +    __typeof__(*(ptr)) x_ = (x); \
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
>>> +
>>> +#define xchg(ptr,x) \
>>> +({ \
>>> +    __typeof__(*(ptr)) ret__; \
>>> +    ret__ = (__typeof__(*(ptr))) \
>>> +            __xchg_generic(ptr, (unsigned long)(x),
>>> sizeof(*(ptr)), \
>>> +                           ".aqrl", "", ""); \
>>
>> The .aqrl doesn't look to affect the (emulated) 1- and 2-byte cases.
>>
>> Further, amoswap also exists in release-only and acquire-only forms.
>> Why do you prefer explicit barrier insns over those? (Looks to
>> similarly apply to the emulation path as well as to the cmpxchg
>> machinery then, as both lr and sc also come in all four possible
>> acquire/release forms. Perhaps for the emulation path using
>> explicit barriers is better, in case the acquire/release forms of
>> lr/sc - being used inside the loop - might perform worse.)
> As 1- and 2-byte cases are emulated I decided that is not to provide
> sfx argument for emulation macros as it will not have to much affect on
> emulated types and just consume more performance on acquire and release
> version of sc/ld instructions.

Question is whether the common case (4- and 8-byte accesses) shouldn't
be valued higher, with 1- and 2-byte emulation being there just to
allow things to not break altogether.

>> No RISCV_..._BARRIER for use here and ...
>>
>>> +    ret__; \
>>> +})
>>> +
>>> +#define __cmpxchg(ptr, o, n, s) \
>>> +({ \
>>> +    __typeof__(*(ptr)) ret__; \
>>> +    ret__ = (__typeof__(*(ptr))) \
>>> +            __cmpxchg_generic(ptr, (unsigned long)(o), (unsigned
>>> long)(n), \
>>> +                              s, ".rl", "", " fence rw, rw\n"); \
>>
>> ... here? And anyway, wouldn't it make sense to have
>>
>> #define cmpxchg(ptr, o, n) __cmpxchg(ptr, o, n, sizeof(*(ptr))
>>
>> to limit redundancy?
>>
>> Plus wouldn't
>>
>> #define __cmpxchg(ptr, o, n, s) \
>>     ((__typeof__(*(ptr))) \
>>      __cmpxchg_generic(ptr, (unsigned long)(o), (unsigned long)(n), \
>>                        s, ".rl", "", " fence rw, rw\n"))
>>
>> be shorter and thus easier to follow as well? As I notice only now,
>> this would apparently apply further up as well.
> I understand your point about "#define cmpxchg(ptr, o, n) __cmpxchg(",
> but I can't undestand how the definition of __cmxchng should be done
> shorter. Could you please clarify that?

You did notice that in my form there's no local variable, and hence
also no macro-wide scope ( ({ ... }) )?

Jan

