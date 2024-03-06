Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDEB8739EB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 15:57:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689351.1074214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhshH-0003Wc-CY; Wed, 06 Mar 2024 14:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689351.1074214; Wed, 06 Mar 2024 14:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhshH-0003Uc-9Q; Wed, 06 Mar 2024 14:56:43 +0000
Received: by outflank-mailman (input) for mailman id 689351;
 Wed, 06 Mar 2024 14:56:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhshF-0003UR-NS
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 14:56:41 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc9a7c9a-dbc9-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 15:56:40 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso9272739a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 06:56:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ew5-20020a056402538500b005667a11b951sm6991707edb.86.2024.03.06.06.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 06:56:38 -0800 (PST)
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
X-Inumbo-ID: bc9a7c9a-dbc9-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709736999; x=1710341799; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a+FsV5KipwWiSj0tYCsBmAK1zNB7m7w39dTAj0h3ue8=;
        b=egzTev5Iebe3WVIPMcIxcCBIfcL89bVVJBP+t3QS6J1r0fnI+jJali+T7lkYjKcYx4
         wZD9lwA3ICCxPYvyo7Ksf6LDGANT6CPdE7a8z3UpLCF1c32yqwNHGX6779auypJwkbIz
         jfT7YdKWxf3leG01LO1LRBN7Pv87RNnMYr/gtgf7mk303CZn3h54uizfCro2qfbIQ900
         8m1Gkm9S6riYAq5DGIlG47WxLczS86/wy/VBCbI26LAblI4riXUGlADXOiWZWH6FYgwl
         WxpOR29kSGqWYPuyElDZejRU96PFiXc1ZSMAqocz2oMjpU5RhZKmvRSFW1/XxITCPGAq
         TRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709736999; x=1710341799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+FsV5KipwWiSj0tYCsBmAK1zNB7m7w39dTAj0h3ue8=;
        b=OCprdWAKqgg5ltWlvSvFcvz1dJb9YMNvtURpO4PGJ6/PM5VwiWCGErvlm1+Q4RyZs7
         hJhDa1LYGHjcli7YD3PVAd7jlqN1edz9Dj8YqFOTi8eLawkfE/EXE1Y4PM9i+tkHyZw2
         x3xlLEmM7GY9nP31FAdv7SwWK/41Bu6GtKtZEtpsVJuKrNw5EiWnahaZZuyJZZeuMH/N
         R4zfRRIXcBypWPhB/R8+VI05T/rDdKy76TqGJ2bw5TRpi9wua+QmpAjEwNdrch1wX4Au
         x8lMmPXDLmrsU7AAewT9R8q1f5qrkT6PsT5d3ACLswYWQbQRY9hf/zlkg4YhhS4ZlvVA
         MuBg==
X-Forwarded-Encrypted: i=1; AJvYcCWqs8y0fPEGOFS/Gu5iXZZXWXxrZE0kTnkgHKCExxb7Q3gyRBq/ys36CT+dE2Wz49L86ybbydd8t7QzLLSpFxfvkK2Tm6e2aFnOY+jTB2Q=
X-Gm-Message-State: AOJu0Yw1ImwN6rJkWXJT+11A38JhA/xp2n2Uyic2sAskEdAl82d1VveD
	5MXCqkAn13wnqKYF8XS5UdlS8joxStLRHniHol0aMH2ZsSmCDfYngl9svD2fTw==
X-Google-Smtp-Source: AGHT+IHml87uJ/rAIQzOGtXxD1kb84yhDVUUgPf0CZYhVS7D1av1c41eVza4sys0BnbMm4fW5eFNzA==
X-Received: by 2002:a50:cc8e:0:b0:566:1794:7b2 with SMTP id q14-20020a50cc8e000000b00566179407b2mr12584096edi.13.1709736998879;
        Wed, 06 Mar 2024 06:56:38 -0800 (PST)
Message-ID: <23ff1c20-91f3-4c60-9562-7f1cd57c1043@suse.com>
Date: Wed, 6 Mar 2024 15:56:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/23] xen/riscv: introduce cmpxchg.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <ce7604de39b3480553eeaeafc11138494016983f.1708962629.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ce7604de39b3480553eeaeafc11138494016983f.1708962629.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.02.2024 18:38, Oleksii Kurochko wrote:
> The header was taken from Linux kernl 6.4.0-rc1.
> 
> Addionally, were updated:
> * add emulation of {cmp}xchg for 1/2 byte types using 32-bit atomic
>   access.
> * replace tabs with spaces
> * replace __* variale with *__
> * introduce generic version of xchg_* and cmpxchg_*.
> 
> Implementation of 4- and 8-byte cases were left as it is done in
> Linux kernel as according to the RISC-V spec:
> ```
> Table A.5 ( only part of the table was copied here )
> 
> Linux Construct       RVWMO Mapping
> atomic <op> relaxed    amo<op>.{w|d}
> atomic <op> acquire    amo<op>.{w|d}.aq
> atomic <op> release    amo<op>.{w|d}.rl
> atomic <op>            amo<op>.{w|d}.aqrl
> 
> Linux Construct       RVWMO LR/SC Mapping
> atomic <op> relaxed    loop: lr.{w|d}; <op>; sc.{w|d}; bnez loop
> atomic <op> acquire    loop: lr.{w|d}.aq; <op>; sc.{w|d}; bnez loop
> atomic <op> release    loop: lr.{w|d}; <op>; sc.{w|d}.aqrl∗ ; bnez loop OR
>                        fence.tso; loop: lr.{w|d}; <op>; sc.{w|d}∗ ; bnez loop
> atomic <op>            loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl; bnez loop
> 
> The Linux mappings for release operations may seem stronger than necessary,
> but these mappings are needed to cover some cases in which Linux requires
> stronger orderings than the more intuitive mappings would provide.
> In particular, as of the time this text is being written, Linux is actively
> debating whether to require load-load, load-store, and store-store orderings
> between accesses in one critical section and accesses in a subsequent critical
> section in the same hart and protected by the same synchronization object.
> Not all combinations of FENCE RW,W/FENCE R,RW mappings with aq/rl mappings
> combine to provide such orderings.
> There are a few ways around this problem, including:
> 1. Always use FENCE RW,W/FENCE R,RW, and never use aq/rl. This suffices
>    but is undesirable, as it defeats the purpose of the aq/rl modifiers.
> 2. Always use aq/rl, and never use FENCE RW,W/FENCE R,RW. This does not
>    currently work due to the lack of load and store opcodes with aq and rl
>    modifiers.

As before I don't understand this point. Can you give an example of what
sort of opcode / instruction is missing?

> 3. Strengthen the mappings of release operations such that they would
>    enforce sufficient orderings in the presence of either type of acquire mapping.
>    This is the currently-recommended solution, and the one shown in Table A.5.
> ```
> 
> But in Linux kenrel atomics were strengthen with fences:
> ```
> Atomics present the same issue with locking: release and acquire
> variants need to be strengthened to meet the constraints defined
> by the Linux-kernel memory consistency model [1].
> 
> Atomics present a further issue: implementations of atomics such
> as atomic_cmpxchg() and atomic_add_unless() rely on LR/SC pairs,
> which do not give full-ordering with .aqrl; for example, current
> implementations allow the "lr-sc-aqrl-pair-vs-full-barrier" test
> below to end up with the state indicated in the "exists" clause.
> 
> In order to "synchronize" LKMM and RISC-V's implementation, this
> commit strengthens the implementations of the atomics operations
> by replacing .rl and .aq with the use of ("lightweigth") fences,
> and by replacing .aqrl LR/SC pairs in sequences such as:
> 
> 0:      lr.w.aqrl  %0, %addr
>         bne        %0, %old, 1f
>         ...
>         sc.w.aqrl  %1, %new, %addr
>         bnez       %1, 0b
> 1:
> 
> with sequences of the form:
> 
> 0:      lr.w       %0, %addr
>         bne        %0, %old, 1f
>               ...
>         sc.w.rl    %1, %new, %addr   /* SC-release   */
>         bnez       %1, 0b
>         fence      rw, rw            /* "full" fence */
> 1:
> 
> following Daniel's suggestion.
> 
> These modifications were validated with simulation of the RISC-V
> memory consistency model.
> 
> C lr-sc-aqrl-pair-vs-full-barrier
> 
> {}
> 
> P0(int *x, int *y, atomic_t *u)
> {
>         int r0;
>         int r1;
> 
>         WRITE_ONCE(*x, 1);
>         r0 = atomic_cmpxchg(u, 0, 1);
>         r1 = READ_ONCE(*y);
> }
> 
> P1(int *x, int *y, atomic_t *v)
> {
>         int r0;
>         int r1;
> 
>         WRITE_ONCE(*y, 1);
>         r0 = atomic_cmpxchg(v, 0, 1);
>         r1 = READ_ONCE(*x);
> }
> 
> exists (u=1 /\ v=1 /\ 0:r1=0 /\ 1:r1=0)

While I'm entirely willing to trust this can happen, I can't bring this
in line with the A extension spec.

Additionally it's not clear to me in how far all of this applies when
you don't really use LR/SC in the 4- and 8-byte cases (and going forward
likely also not in the 1- and 2-byte case, utilizing Zahba when available).

> ---
> Changes in V5:
>  - update the commit message.
>  - drop ALIGN_DOWN().
>  - update the definition of emulate_xchg_1_2(): 
>    - lr.d -> lr.w, sc.d -> sc.w.
>    - drop ret argument.
>    - code style fixes around asm volatile.
>    - update prototype.
>    - use asm named operands.
>    - rename local variables.
>    - add comment above the macros
>  - update the definition of __xchg_generic:
>    - drop local ptr__ variable.
>    - code style fixes around switch()
>    - update prototype.
>  - introduce RISCV_FULL_BARRIES.
>  - redefine cmpxchg()
>  - update emulate_cmpxchg_1_2():
>    - update prototype
>    - update local variables names and usage of them
>    - use name asm operands.
>    - add comment above the macros
> ---
> Changes in V4:
>  - Code style fixes.
>  - enforce in __xchg_*() has the same type for new and *ptr, also "\n"
>    was removed at the end of asm instruction.
>  - dependency from https://lore.kernel.org/xen-devel/cover.1706259490.git.federico.serafini@bugseng.com/
>  - switch from ASSERT_UNREACHABLE to STATIC_ASSERT_UNREACHABLE().
>  - drop xchg32(ptr, x) and xchg64(ptr, x) as they aren't used.
>  - drop cmpxcg{32,64}_{local} as they aren't used.
>  - introduce generic version of xchg_* and cmpxchg_*.
>  - update the commit message.
> ---
> Changes in V3:
>  - update the commit message
>  - add emulation of {cmp}xchg_... for 1 and 2 bytes types
> ---
> Changes in V2:
>  - update the comment at the top of the header.
>  - change xen/lib.h to xen/bug.h.
>  - sort inclusion of headers properly.
> ---
>  xen/arch/riscv/include/asm/cmpxchg.h | 258 +++++++++++++++++++++++++++
>  1 file changed, 258 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h
> 
> diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
> new file mode 100644
> index 0000000000..66cbe26737
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/cmpxchg.h
> @@ -0,0 +1,258 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (C) 2014 Regents of the University of California */
> +
> +#ifndef _ASM_RISCV_CMPXCHG_H
> +#define _ASM_RISCV_CMPXCHG_H
> +
> +#include <xen/compiler.h>
> +#include <xen/lib.h>
> +
> +#include <asm/fence.h>
> +#include <asm/io.h>
> +#include <asm/system.h>
> +
> +#define __amoswap_generic(ptr, new, ret, sfx, pre, post) \
> +({ \
> +    asm volatile( \

Nit: In Xen style this is lacking a blank ahead of the opening parenthesis.

> +        pre \
> +        " amoswap" sfx " %0, %2, %1\n" \
> +        post \
> +        : "=r" (ret), "+A" (*ptr) \
> +        : "r" (new) \
> +        : "memory" ); \
> +})
> +
> +/*
> + * For LR and SC, the A extension requires that the address held in rs1 be
> + * naturally aligned to the size of the operand (i.e., eight-byte aligned
> + * for 64-bit words and four-byte aligned for 32-bit words).
> + * If the address is not naturally aligned, an address-misaligned exception
> + * or an access-fault exception will be generated.
> + * 
> + * Thereby:
> + * - for 1-byte xchg access the containing word by clearing low two bits
> + * - for 2-byte xchg ccess the containing word by clearing first bit.

"first bit" can still be ambiguous. Better say "bit 1".

> + * 

Here and apparently also elsewhere: Stray trailing blank. Git has a config
setting to warn you about (maybe even to automatically strip? such.

> + * If resulting 4-byte access is still misalgined, it will fault just as
> + * non-emulated 4-byte access would.
> + */
> +#define emulate_xchg_1_2(ptr, new, sc_sfx, pre, post) \
> +({ \
> +    uint32_t *aligned_ptr = (uint32_t *)((unsigned long)ptr & ~(0x4 - sizeof(*ptr))); \

Here and elsewhere: sizeof(*(ptr)) (i.e. the inner parentheses are needed
also there).

> +    uint8_t new_val_pos = ((unsigned long)(ptr) & (0x4 - sizeof(*ptr))) * BITS_PER_BYTE; \

Why uint8_t?

> +    unsigned long mask = GENMASK(((sizeof(*ptr)) * BITS_PER_BYTE) - 1, 0) << new_val_pos; \
> +    unsigned int new_ = new << new_val_pos; \
> +    unsigned int old_val; \
> +    unsigned int xchged_val; \
> +    \
> +    asm volatile ( \
> +        pre \
> +        "0: lr.w %[op_oldval], %[op_aligned_ptr]\n" \
> +        "   and  %[op_xchged_val], %[op_oldval], %z[op_nmask]\n" \
> +        "   or   %[op_xchged_val], %[op_xchged_val], %z[op_new]\n" \
> +        "   sc.w" sc_sfx " %[op_xchged_val], %[op_xchged_val], %[op_aligned_ptr]\n" \
> +        "   bnez %[op_xchged_val], 0b\n" \
> +        post \
> +        : [op_oldval] "=&r" (old_val), [op_xchged_val] "=&r" (xchged_val), [op_aligned_ptr]"+A" (*aligned_ptr) \

Too long line. Partly because you have op_ prefixes here which I can't
recognized what they would be good for. The val / _val suffixes also
don't appear to carry much useful information. And "xchged", being
explicitly past tense, doesn't look to fit even up and until the SC,
not to speak of afterwards. Anything wrong with calling this just tmp,
aux, or scratch?

> +        : [op_new] "rJ" (new_), [op_nmask] "rJ" (~mask) \
> +        : "memory" ); \
> +    \
> +    (__typeof__(*(ptr)))((old_val & mask) >> new_val_pos); \
> +})
> +
> +#define __xchg_generic(ptr, new, size, sfx, pre, post) \
> +({ \
> +    __typeof__(*(ptr)) new__ = (new); \
> +    __typeof__(*(ptr)) ret__; \
> +    switch ( size ) \

Can't this use sizeof(*(ptr)), allowing for one less macro parameter?

> +    { \
> +    case 1: \
> +    case 2: \
> +        ret__ = emulate_xchg_1_2(ptr, new__, sfx, pre, post); \
> +        break; \
> +    case 4: \
> +        __amoswap_generic(ptr, new__, ret__,\
> +                          ".w" sfx,  pre, post); \
> +        break; \
> +    case 8: \
> +        __amoswap_generic(ptr, new__, ret__,\
> +                          ".d" sfx,  pre, post); \
> +        break; \

In io.h you make sure to avoid rv64-only insns. Here you don't. The build
would fail either way, but this still looks inconsistent.

Also nit: Stray double blands (twice) ahead of "pre". Plus with this style
of line continuation you want to consistently have exactly one blank ahead
of each backslash.

> +    default: \
> +        STATIC_ASSERT_UNREACHABLE(); \
> +    } \
> +    ret__; \
> +})
> +
> +#define xchg_relaxed(ptr, x) \
> +({ \
> +    __typeof__(*(ptr)) x_ = (x); \

What is the purpose of this, when __xchg_generic() already does this same
type conversion?

> +    (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(*(ptr)), "", "", ""); \
> +})
> +
> +#define xchg_acquire(ptr, x) \
> +({ \
> +    __typeof__(*(ptr)) x_ = (x); \
> +    (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(*(ptr)), \
> +                                       "", "", RISCV_ACQUIRE_BARRIER); \
> +})
> +
> +#define xchg_release(ptr, x) \
> +({ \
> +    __typeof__(*(ptr)) x_ = (x); \
> +    (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(*(ptr)),\
> +                                       "", RISCV_RELEASE_BARRIER, ""); \
> +})

As asked before: Are there going to be any uses of these three? Common
code doesn't require them. And not needing to provide them would
simplify things quite a bit, it seems.

> +#define xchg(ptr, x) __xchg_generic(ptr, (unsigned long)(x), sizeof(*(ptr)), \
> +                                    ".aqrl", "", "")

According to the earlier comment (where I don't follow the example given),
is .aqrl sufficient here? And even if it was for the 4- and 8-byte cases,
is it sufficient in the 1- and 2-byte emulation case (where it then is
appended to just the SC)?

> +#define __generic_cmpxchg(ptr, old, new, ret, lr_sfx, sc_sfx, pre, post)	\
> + ({ \
> +    register unsigned int rc; \
> +    asm volatile( \
> +        pre \
> +        "0: lr" lr_sfx " %0, %2\n" \
> +        "   bne  %0, %z3, 1f\n" \
> +        "   sc" sc_sfx " %1, %z4, %2\n" \
> +        "   bnez %1, 0b\n" \
> +        post \
> +        "1:\n" \
> +        : "=&r" (ret), "=&r" (rc), "+A" (*ptr) \
> +        : "rJ" (old), "rJ" (new) \
> +        : "memory"); \
> + })
> +
> +/*
> + * For LR and SC, the A extension requires that the address held in rs1 be
> + * naturally aligned to the size of the operand (i.e., eight-byte aligned
> + * for 64-bit words and four-byte aligned for 32-bit words).
> + * If the address is not naturally aligned, an address-misaligned exception
> + * or an access-fault exception will be generated.
> + * 
> + * Thereby:
> + * - for 1-byte xchg access the containing word by clearing low two bits
> + * - for 2-byte xchg ccess the containing word by clearing first bit.
> + * 
> + * If resulting 4-byte access is still misalgined, it will fault just as
> + * non-emulated 4-byte access would.
> + *
> + * old_val was casted to unsigned long at the end of the define because of
> + * the following issue:
> + * ./arch/riscv/include/asm/cmpxchg.h:166:5: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
> + * 166 |     (__typeof__(*(ptr)))(old_val >> new_val_pos); \
> + *     |     ^
> + * ./arch/riscv/include/asm/cmpxchg.h:184:17: note: in expansion of macro 'emulate_cmpxchg_1_2'
> + * 184 |         ret__ = emulate_cmpxchg_1_2(ptr, old, new, \
> + *     |                 ^~~~~~~~~~~~~~~~~~~
> + * ./arch/riscv/include/asm/cmpxchg.h:227:5: note: in expansion of macro '__cmpxchg_generic'
> + * 227 |     __cmpxchg_generic(ptr, (unsigned long)(o), (unsigned long)(n), \
> + *     |     ^~~~~~~~~~~~~~~~~
> + * ./include/xen/lib.h:141:26: note: in expansion of macro '__cmpxchg'
> + * 141 |     ((__typeof__(*(ptr)))__cmpxchg(ptr, (unsigned long)o_,              \
> + *     |                          ^~~~~~~~~
> + * common/event_channel.c:109:13: note: in expansion of macro 'cmpxchgptr'
> + * 109 |             cmpxchgptr(&xen_consumers[i], NULL, fn);
> + */

This is too much detail on the compile issue. Just mentioning that said
cast is needed for cmpxchgptr() ought to be sufficient.

> +#define emulate_cmpxchg_1_2(ptr, old, new, sc_sfx, pre, post) \
> +({ \
> +    uint32_t *aligned_ptr = (uint32_t *)((unsigned long)ptr & ~(0x4 - sizeof(*ptr))); \
> +    uint8_t new_val_pos = ((unsigned long)(ptr) & (0x4 - sizeof(*ptr))) * BITS_PER_BYTE; \
> +    unsigned long mask = GENMASK(((sizeof(*ptr)) * BITS_PER_BYTE) - 1, 0) << new_val_pos; \
> +    unsigned int old_ = old << new_val_pos; \
> +    unsigned int new_ = new << new_val_pos; \
> +    unsigned int old_val; \
> +    unsigned int xchged_val; \
> +    \
> +    __asm__ __volatile__ ( \
> +        pre \
> +        "0: lr.w %[op_xchged_val], %[op_aligned_ptr]\n" \
> +        "   and  %[op_oldval], %[op_xchged_val], %z[op_mask]\n" \
> +        "   bne  %[op_oldval], %z[op_old], 1f\n" \
> +        "   xor  %[op_xchged_val], %[op_oldval], %[op_xchged_val]\n" \
> +        "   or   %[op_xchged_val], %[op_xchged_val], %z[op_new]\n" \
> +        "   sc.w" sc_sfx " %[op_xchged_val], %[op_xchged_val], %[op_aligned_ptr]\n" \
> +        "   bnez %[op_xchged_val], 0b\n" \
> +        post \
> +        "1:\n" \
> +        : [op_oldval] "=&r" (old_val), [op_xchged_val] "=&r" (xchged_val), [op_aligned_ptr] "+A" (*aligned_ptr) \
> +        : [op_old] "rJ" (old_), [op_new] "rJ" (new_), \
> +          [op_mask] "rJ" (mask) \
> +        : "memory" ); \
> +    \
> +    (__typeof__(*(ptr)))((unsigned long)old_val >> new_val_pos); \
> +})
> +
> +/*
> + * Atomic compare and exchange.  Compare OLD with MEM, if identical,
> + * store NEW in MEM.  Return the initial value in MEM.  Success is
> + * indicated by comparing RETURN with OLD.
> + */
> +#define __cmpxchg_generic(ptr, old, new, size, sc_sfx, pre, post) \
> +({ \
> +    __typeof__(ptr) ptr__ = (ptr); \
> +    __typeof__(*(ptr)) old__ = (__typeof__(*(ptr)))(old); \
> +    __typeof__(*(ptr)) new__ = (__typeof__(*(ptr)))(new); \
> +    __typeof__(*(ptr)) ret__; \
> +    switch ( size ) \
> +    { \
> +    case 1: \
> +    case 2: \
> +        ret__ = emulate_cmpxchg_1_2(ptr, old, new, \
> +                            sc_sfx, pre, post); \
> +        break; \
> +    case 4: \
> +        __generic_cmpxchg(ptr__, old__, new__, ret__, \
> +                          ".w", ".w"sc_sfx, pre, post); \
> +        break; \
> +    case 8: \
> +        __generic_cmpxchg(ptr__, old__, new__, ret__, \
> +                          ".d", ".d"sc_sfx, pre, post); \
> +        break; \
> +    default: \
> +        STATIC_ASSERT_UNREACHABLE(); \
> +    } \
> +    ret__; \
> +})
> +
> +#define cmpxchg_relaxed(ptr, o, n) \
> +({ \
> +    __typeof__(*(ptr)) o_ = (o); \
> +    __typeof__(*(ptr)) n_ = (n); \
> +    (__typeof__(*(ptr)))__cmpxchg_generic(ptr, \
> +                    o_, n_, sizeof(*(ptr)), "", "", ""); \
> +})
> +
> +#define cmpxchg_acquire(ptr, o, n) \
> +({ \
> +    __typeof__(*(ptr)) o_ = (o); \
> +    __typeof__(*(ptr)) n_ = (n); \
> +    (__typeof__(*(ptr)))__cmpxchg_generic(ptr, o_, n_, sizeof(*(ptr)), \
> +                                          "", "", RISCV_ACQUIRE_BARRIER); \
> +})
> +
> +#define cmpxchg_release(ptr, o, n) \
> +({ \
> +    __typeof__(*(ptr)) o_ = (o); \
> +    __typeof__(*(ptr)) n_ = (n); \
> +    (__typeof__(*(ptr)))__cmpxchg_release(ptr, o_, n_, sizeof(*(ptr)), \

There's no __cmpxchg_release() afaics; dym __cmpxchg_generic()?

Jan

