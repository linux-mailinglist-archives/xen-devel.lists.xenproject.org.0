Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43735933D14
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 14:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759957.1169662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU3ur-0008Gu-C8; Wed, 17 Jul 2024 12:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759957.1169662; Wed, 17 Jul 2024 12:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU3ur-0008En-9L; Wed, 17 Jul 2024 12:37:53 +0000
Received: by outflank-mailman (input) for mailman id 759957;
 Wed, 17 Jul 2024 12:37:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xtCR=OR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sU3up-0008Eg-Ar
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 12:37:51 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60132663-4439-11ef-8776-851b0ebba9a2;
 Wed, 17 Jul 2024 14:37:48 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2eea7e2b0e6so92053331fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 05:37:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bba6fc7sm74316905ad.68.2024.07.17.05.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 05:37:47 -0700 (PDT)
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
X-Inumbo-ID: 60132663-4439-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721219868; x=1721824668; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cXQPh5t+LUQgHz/69oM3W6nL62Op3MMx8nd7bMDQVU8=;
        b=d1Nc6js2c0g5ihBVMm+NUn2M7VahCYKuyuy+fFZ+gWZjy9LC0ybT5Wfcc+vmiSqZmz
         uMe2vAC+E3Og0fAtZR9zQNZQF/0K7tyiYbDtOBSSfeVJMo2pt6ZXFh0LsKGm+gpq81aP
         8T3hrs0vfOlrJCW8FXmnamCcUOKn4+tZX+FK/0kWmm5JiFXn9msjyhM9XC/EBR18VDfh
         e1y9DhsXlxjNkpxVAhUWya8098B38lwvgLhDvl9I8chWM6ECFwjyr0u3F8Xxr4jpdNPg
         Z+Er0eJIhBBs8GuFBuy4gw7fN0VubTNjiCseMAW0CVX0qUl6fVTom6ww95R2KQR9rqWV
         IR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721219868; x=1721824668;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXQPh5t+LUQgHz/69oM3W6nL62Op3MMx8nd7bMDQVU8=;
        b=uv8N5VbYZfjILiuVhm/U9cFKtiEALiV+b+SihuhqO7PmTBgh6nHiKpPcm+l5EvFJE9
         g/TuQpu0s8skG/FNNR5LvYqrVOFcdUZu9v/Rv1pqoaI6Hu2ZEJofNh8CqPIDhhkjUTpp
         j5UXm/K1xI/wqjdqlUx3Ee+fZRb0b3pC4Kk7L0iiJIFUU1XJRUktWbk04RolEGJ4NTL6
         NWTldvqKhfNFQYbggXOkmj3Af5sGFTcdW9WY1PPfcbLNrkpf5bY8LKbhQxK5LL9N50Kx
         hTyeZQ6CUXyG0iCqd8WVEPQDpLKGcfHQIzTvL8thpP89UH0jXIzsHa1Lz5zy46goLO50
         KE+w==
X-Forwarded-Encrypted: i=1; AJvYcCWO6bHj/R0eUwFIFB42rpy5KIb4FXzFHr25qSG+4jN79mtnwhQP7La9kSB10d/kg2ZigOhIpaoWJGgSLajncvSk4zTZd86A25HM6rmUqJk=
X-Gm-Message-State: AOJu0YzdyqdkKfJNrFTpGcsPKTWLpBJ6gTgMc1Wr6Q4/qKdhbiJLjCfQ
	hwd4BrzHDj0XT7WnPoWkPZH1DVSJb+uGd6Ma4kQGrJI1F9IXvVEYXs1rCZXQNw==
X-Google-Smtp-Source: AGHT+IGSNgpbTgPUpEmsQ/kyS2pzK25SuJl1ZnQ0lFs2pSgcfOcrJDSFIKvj0825duutktj1X5cbgQ==
X-Received: by 2002:a2e:8558:0:b0:2ec:541b:4b53 with SMTP id 38308e7fff4ca-2eefd16725dmr11029971fa.43.1721219867967;
        Wed, 17 Jul 2024 05:37:47 -0700 (PDT)
Message-ID: <ec6f3d2b-d5be-4ff5-9bf1-79eb5a3a85e1@suse.com>
Date: Wed, 17 Jul 2024 14:37:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] hvmloader: Rework hypercall infrastructure
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240717111231.3517605-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240717111231.3517605-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.07.2024 13:12, Andrew Cooper wrote:
> Right now, the hypercall page is at a hardcoded physical address, and making
> hypercalls involves indirect calls to compile-time constant addresses.
> e.g. HYPERCALL_memory_op is:
> 
>   mov    $0x80180,%eax
>   call   *%eax
> 
> Instead, import the hypercall infrastructure from XTF to have hypercall_page[]
> fully within the hvmloader image, and prepared at compile time rather than
> runtime.  This uses direct calls, so HYPERCALL_memory_op now disassembles as:
> 
>   call   132180 <HYPERCALL_memory_op>
> 
> which is faster and clearer.

Just to mention it - even with a fixed address using indirect calls shouldn't
have been necessary (minus assembler bugs, that is).

> Remove the loop over multiple hypercall pages.  It was long ago realised to be
> an unworkable design, and eax fixed in the ABI to 1.
> 
> Pass -z noexecstack to LD to stop newer bintuils complaining about the absence
> of .note.GNU-stack.  hvmloader is not a regular binary, and in fact its stack
> is always executable owing to operating in unpaged mode.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> There doesn't appear to be any sensible AFLAGS infrastructure to set
> -D__ASSEMBLY__.  Opecoding it once seemed like the least bad option.

I agree.

> ---
>  tools/firmware/hvmloader/Makefile         |   3 +
>  tools/firmware/hvmloader/config.h         |   1 -
>  tools/firmware/hvmloader/hvmloader.c      |   7 +-
>  tools/firmware/hvmloader/hvmloader.lds    |   4 +-
>  tools/firmware/hvmloader/hypercall.h      | 121 ++++++----------------
>  tools/firmware/hvmloader/hypercall_page.S |  67 ++++++++++++
>  6 files changed, 105 insertions(+), 98 deletions(-)
>  create mode 100644 tools/firmware/hvmloader/hypercall_page.S

May I ask that the new file use a hyphen in place of the underscore?

> @@ -142,8 +141,7 @@ static void init_hypercalls(void)
>  
>      /* Fill in hypercall transfer pages. */
>      cpuid(base + 2, &eax, &ebx, &ecx, &edx);
> -    for ( i = 0; i < eax; i++ )
> -        wrmsr(ebx, HYPERCALL_PHYSICAL_ADDRESS + (i << 12) + i);
> +    wrmsr(ebx, (unsigned long)hypercall_page);

Convert the comment to singular then, too?

> --- a/tools/firmware/hvmloader/hvmloader.lds
> +++ b/tools/firmware/hvmloader/hvmloader.lds
> @@ -7,9 +7,9 @@ SECTIONS
>     * NB: there's no need to use the AT keyword in order to set the LMA, by
>     * default the linker will use VMA = LMA unless specified otherwise.
>     */
> -  .text : { *(.text) *(.text.*) }
> +  .text : { *(.text) *(.text.*)}

Likely merely a leftover from some experimentation?

> --- a/tools/firmware/hvmloader/hypercall.h
> +++ b/tools/firmware/hvmloader/hypercall.h
> @@ -35,148 +35,91 @@
>  #include <xen/xen.h>
>  #include "config.h"
>  
> -#define hcall_addr(name)                                                \
> -    ((unsigned long)HYPERCALL_PHYSICAL_ADDRESS + __HYPERVISOR_##name * 32)
> -
> -#define _hypercall0(type, name)                 \
> -({                                              \
> -    long __res;                                 \
> -    asm volatile (                              \
> -        "call *%%eax"                           \
> -        : "=a" (__res)                          \
> -        : "0" (hcall_addr(name))                \
> -        : "memory" );                           \
> -    (type)__res;                                \
> -})
> -
> -#define _hypercall1(type, name, a1)             \
> -({                                              \
> -    long __res, __ign1;                         \
> -    asm volatile (                              \
> -        "call *%%eax"                           \
> -        : "=a" (__res), "=b" (__ign1)           \
> -        : "0" (hcall_addr(name)),               \
> -          "1" ((long)(a1))                      \
> -        : "memory" );                           \
> -    (type)__res;                                \
> -})
> -
> -#define _hypercall2(type, name, a1, a2)                 \
> -({                                                      \
> -    long __res, __ign1, __ign2;                         \
> -    asm volatile (                                      \
> -        "call *%%eax"                                   \
> -        : "=a" (__res), "=b" (__ign1), "=c" (__ign2)    \
> -        : "0" (hcall_addr(name)),                       \
> -          "1" ((long)(a1)), "2" ((long)(a2))            \
> -        : "memory" );                                   \
> -    (type)__res;                                        \
> -})
> -
> -#define _hypercall3(type, name, a1, a2, a3)             \
> -({                                                      \
> -    long __res, __ign1, __ign2, __ign3;                 \
> -    asm volatile (                                      \
> -        "call *%%eax"                                   \
> -        : "=a" (__res), "=b" (__ign1), "=c" (__ign2),   \
> -          "=d" (__ign3)                                 \
> -        : "0" (hcall_addr(name)),                       \
> -          "1" ((long)(a1)), "2" ((long)(a2)),           \
> -          "3" ((long)(a3))                              \
> -        : "memory" );                                   \
> -    (type)__res;                                        \
> -})
> -
> -#define _hypercall4(type, name, a1, a2, a3, a4)         \
> -({                                                      \
> -    long __res, __ign1, __ign2, __ign3, __ign4;         \
> -    asm volatile (                                      \
> -        "call *%%eax"                                   \
> -        : "=a" (__res), "=b" (__ign1), "=c" (__ign2),   \
> -          "=d" (__ign3), "=S" (__ign4)                  \
> -        : "0" (hcall_addr(name)),                       \
> -          "1" ((long)(a1)), "2" ((long)(a2)),           \
> -          "3" ((long)(a3)), "4" ((long)(a4))            \
> -        : "memory" );                                   \
> -    (type)__res;                                        \
> -})
> -
> -#define _hypercall5(type, name, a1, a2, a3, a4, a5)     \
> -({                                                      \
> -    long __res, __ign1, __ign2, __ign3, __ign4, __ign5; \
> -    asm volatile (                                      \
> -        "call *%%eax"                                   \
> -        : "=a" (__res), "=b" (__ign1), "=c" (__ign2),   \
> -          "=d" (__ign3), "=S" (__ign4), "=D" (__ign5)   \
> -        : "0" (hcall_addr(name)),                       \
> -          "1" ((long)(a1)), "2" ((long)(a2)),           \
> -          "3" ((long)(a3)), "4" ((long)(a4)),           \
> -          "5" ((long)(a5))                              \
> -        : "memory" );                                   \
> -    (type)__res;                                        \
> -})
> +extern const char hypercall_page[];
> +
> +#define _hypercall2(type, hcall, a1, a2)                                \
> +    ({                                                                  \
> +        long res, _a1 = (long)(a1), _a2 = (long)(a2);                   \
> +        asm volatile (                                                  \
> +            "call hypercall_page + %c[offset]"                          \
> +            : "=a" (res), "+b" (_a1), "+c" (_a2)                        \
> +            : [offset] "i" (hcall * 32)                                 \
> +            : "memory" );                                               \
> +        (type)res;                                                      \
> +    })
> +
> +#define _hypercall3(type, hcall, a1, a2, a3)                            \
> +    ({                                                                  \
> +        long res, _a1 = (long)(a1), _a2 = (long)(a2), _a3 = (long)(a3); \
> +        asm volatile (                                                  \
> +            "call hypercall_page + %c[offset]"                          \
> +            : "=a" (res), "+b" (_a1), "+c" (_a2), "+d" (_a3)            \
> +            : [offset] "i" (hcall * 32)                                 \
> +            : "memory" );                                               \
> +        (type)res;                                                      \
> +    })

Not having _hypercall0() and _hypercall1() anymore is certainly a little
odd. If one needed to use such a hypercall, even if only for debugging,
the extra work needed (every time) would be larger than necessary. I'm
definitely less worried about _hypercall4() and _hypercall5().

In any event the removal of any wrappers could do with mentioning in the
description, to indicate it's deliberate (and why).

>  static inline int
>  hypercall_sched_op(
>      int cmd, void *arg)
>  {
> -    return _hypercall2(int, sched_op, cmd, arg);
> +    return _hypercall2(int, __HYPERVISOR_sched_op, cmd, arg);
>  }

I know you don't really like token concatenation in cases like these ones,
but these adjustments all don't look as if they were necessary right here.
The new macros use the macro parameter only in ways where token pasting
would continue to work, afaics. And in the new assembly file you use very
similar token pasting anyway.

> --- /dev/null
> +++ b/tools/firmware/hvmloader/hypercall_page.S
> @@ -0,0 +1,67 @@
> +#include <xen/xen.h>
> +
> +        .section ".hcall", "aw"

Why "aw"? I'd have expected "awx" if you really think the writable part
needs expressing here, or else "ax". Otherwise I think a brief comment as
wanted as to the absence of x for something that is executable.

Also may I ask that you add @progbits?

> +        .align 4096

PAGE_SIZE? And then again ...

> +        .globl hypercall_page
> +hypercall_page:
> +         /* Poisoned with `ret` for safety before hypercalls are set up. */
> +        .fill 4096, 1, 0xc3
> +        .type hypercall_page, STT_OBJECT
> +        .size hypercall_page, 4096

... here?

As to the "poisoning" - how does RET provide any safety? If a call happened
early, the uncertainty of what %eax is set to would make it unpredictable
how such a caller would further behave. Imo better to crash / hang in such
a case, perhaps by using INT3 instead.

I notice that matches earlier behavior, but there the comment at least
validly said "rendering them no-ops" (yet still without considering
possible problems resulting from doing so).

> +#define DECLARE_HYPERCALL(name)                                                 \
> +        .globl HYPERCALL_ ## name;                                              \
> +        .type  HYPERCALL_ ## name, STT_FUNC;                                    \
> +        .size  HYPERCALL_ ## name, 32;                                          \
> +        .set   HYPERCALL_ ## name, hypercall_page + __HYPERVISOR_ ## name * 32
> +
> +DECLARE_HYPERCALL(set_trap_table)
> +DECLARE_HYPERCALL(mmu_update)
> +DECLARE_HYPERCALL(set_gdt)
> +DECLARE_HYPERCALL(stack_switch)
> +DECLARE_HYPERCALL(set_callbacks)
> +DECLARE_HYPERCALL(fpu_taskswitch)
> +DECLARE_HYPERCALL(sched_op_compat)
> +DECLARE_HYPERCALL(platform_op)
> +DECLARE_HYPERCALL(set_debugreg)
> +DECLARE_HYPERCALL(get_debugreg)
> +DECLARE_HYPERCALL(update_descriptor)
> +DECLARE_HYPERCALL(memory_op)
> +DECLARE_HYPERCALL(multicall)
> +DECLARE_HYPERCALL(update_va_mapping)
> +DECLARE_HYPERCALL(set_timer_op)
> +DECLARE_HYPERCALL(event_channel_op_compat)
> +DECLARE_HYPERCALL(xen_version)
> +DECLARE_HYPERCALL(console_io)
> +DECLARE_HYPERCALL(physdev_op_compat)
> +DECLARE_HYPERCALL(grant_table_op)
> +DECLARE_HYPERCALL(vm_assist)
> +DECLARE_HYPERCALL(update_va_mapping_otherdomain)
> +DECLARE_HYPERCALL(iret)
> +DECLARE_HYPERCALL(vcpu_op)
> +DECLARE_HYPERCALL(set_segment_base)
> +DECLARE_HYPERCALL(mmuext_op)
> +DECLARE_HYPERCALL(xsm_op)
> +DECLARE_HYPERCALL(nmi_op)
> +DECLARE_HYPERCALL(sched_op)
> +DECLARE_HYPERCALL(callback_op)
> +DECLARE_HYPERCALL(xenoprof_op)
> +DECLARE_HYPERCALL(event_channel_op)
> +DECLARE_HYPERCALL(physdev_op)
> +DECLARE_HYPERCALL(hvm_op)
> +DECLARE_HYPERCALL(sysctl)
> +DECLARE_HYPERCALL(domctl)
> +DECLARE_HYPERCALL(kexec_op)
> +DECLARE_HYPERCALL(tmem_op)

We're not going to ever need this in hvmloader, are we? There are quite a
few more that I'd suggest to leave out, but this one stands out for no
longer existing even in the hypervisor.

Jan

> +DECLARE_HYPERCALL(argo_op)
> +DECLARE_HYPERCALL(xenpmu_op)
> +
> +DECLARE_HYPERCALL(arch_0)
> +DECLARE_HYPERCALL(arch_1)
> +DECLARE_HYPERCALL(arch_2)
> +DECLARE_HYPERCALL(arch_3)
> +DECLARE_HYPERCALL(arch_4)
> +DECLARE_HYPERCALL(arch_5)
> +DECLARE_HYPERCALL(arch_6)
> +DECLARE_HYPERCALL(arch_7)


