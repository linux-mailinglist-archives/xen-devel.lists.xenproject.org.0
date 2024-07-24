Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2380A93B5D8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 19:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764445.1174889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWfik-00046d-6P; Wed, 24 Jul 2024 17:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764445.1174889; Wed, 24 Jul 2024 17:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWfik-000445-39; Wed, 24 Jul 2024 17:24:10 +0000
Received: by outflank-mailman (input) for mailman id 764445;
 Wed, 24 Jul 2024 17:24:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rh+e=OY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sWfij-00043z-2P
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 17:24:09 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8839c426-49e1-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 19:24:07 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a77ec5d3b0dso11425666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 10:24:07 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a92dddccdsm206680066b.79.2024.07.24.10.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 10:24:06 -0700 (PDT)
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
X-Inumbo-ID: 8839c426-49e1-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721841847; x=1722446647; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Rvyrsvi4VDHSNTEoTN5RHC0ozeuUeA8jV41FRDsJis=;
        b=hE0SX6Jc+MvvtI9AtIe+7N9hcH1HOR4XlUzWvjU4BfT86VMZB0Y2vpjOc1iQWmm8iD
         FFZfEPGTb+KkDfNeoIMcAZpZVrzv07WsSZJFgT2y80/eldnlF7aVmHJe11MbnRR8oKXv
         ja0kwnzcy6ZAt0YdmqUHxzkGAe81LlTwkd35E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721841847; x=1722446647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Rvyrsvi4VDHSNTEoTN5RHC0ozeuUeA8jV41FRDsJis=;
        b=FPkw3ZSzI2kmBntN+ksopDeHntFgs42TsgzhNtgfZKFbjV+vVqGzx5GAZVdz0Og6EH
         ozhgtaRuOZasBuKPWL/Nr/epyKIYN9Kqo1aUC9AXYpW37Aoxf4kDf2YB2vyL1q7nGaZQ
         cSt4vQZfQFz7YrqOzGxfcD10IZZds8aErVksjcsTisv22GBiKrQRln46e6a2CmwxDdFq
         16+kd+R6YlerdNfEk49r2fBuksJWDKuH/MgG3QgnRg8LQwAbqWpJFF6mzaKH2FY9ABzn
         h5Fax7qpPik22ilw51fb5UamaPqI5y7/3S/kY2e8aEb3l82CCGcVndccpH/faZx1Pjw8
         5NRw==
X-Forwarded-Encrypted: i=1; AJvYcCX2Bl4SbyKai3oRJ6x5cT1WuMN1QkMqIfltgCk6j70qf24AKc6Ag9VhLiYntnxDPbnq/vy6ajna4POPKnFsxqtnB5yxC7WrmMPxA4SviDM=
X-Gm-Message-State: AOJu0YwMsT6lXDWnadDe/w8vBvVin3pvUCjWvz0tOO1puNthNCWDCzW6
	PHJzDo4JUlvCX9UY1H4QjoHVMzKzWNgKsWh99NzUYvFW3vwCm/H9VlSeJ0qGs9I=
X-Google-Smtp-Source: AGHT+IFK1AvohhlDV9rKjIsqQFeMp48KS4yansf0Mvz5b0VmVQ0mtr2EhnUvOKmgBzBSmEmEPlwUeg==
X-Received: by 2002:a17:906:fca7:b0:a7a:c197:8712 with SMTP id a640c23a62f3a-a7ac528ecb7mr7009866b.59.1721841846848;
        Wed, 24 Jul 2024 10:24:06 -0700 (PDT)
Message-ID: <4f24cc9a-3eb8-4c6f-bcb4-a9e04a50cd9e@citrix.com>
Date: Wed, 24 Jul 2024 18:24:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] hvmloader: Rework hypercall infrastructure
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240717111231.3517605-1-andrew.cooper3@citrix.com>
 <ec6f3d2b-d5be-4ff5-9bf1-79eb5a3a85e1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ec6f3d2b-d5be-4ff5-9bf1-79eb5a3a85e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2024 1:37 pm, Jan Beulich wrote:
> On 17.07.2024 13:12, Andrew Cooper wrote:
>> Right now, the hypercall page is at a hardcoded physical address, and making
>> hypercalls involves indirect calls to compile-time constant addresses.
>> e.g. HYPERCALL_memory_op is:
>>
>>   mov    $0x80180,%eax
>>   call   *%eax
>>
>> Instead, import the hypercall infrastructure from XTF to have hypercall_page[]
>> fully within the hvmloader image, and prepared at compile time rather than
>> runtime.  This uses direct calls, so HYPERCALL_memory_op now disassembles as:
>>
>>   call   132180 <HYPERCALL_memory_op>
>>
>> which is faster and clearer.
> Just to mention it - even with a fixed address using indirect calls shouldn't
> have been necessary (minus assembler bugs, that is).

Indeed.

The very proto-form of XTF to investigate XSA-106 was done in HVMLoader
because I needed something HVM based (rather than the MiniOS based PV
work I'd been doing up to that point).

Starting XTF from scratch was a very deliberate decision so as not to
starting with technical debt such as this...

>
>> Remove the loop over multiple hypercall pages.  It was long ago realised to be
>> an unworkable design, and eax fixed in the ABI to 1.
>>
>> Pass -z noexecstack to LD to stop newer bintuils complaining about the absence
>> of .note.GNU-stack.  hvmloader is not a regular binary, and in fact its stack
>> is always executable owing to operating in unpaged mode.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> There doesn't appear to be any sensible AFLAGS infrastructure to set
>> -D__ASSEMBLY__.  Opecoding it once seemed like the least bad option.
> I agree.
>
>> ---
>>  tools/firmware/hvmloader/Makefile         |   3 +
>>  tools/firmware/hvmloader/config.h         |   1 -
>>  tools/firmware/hvmloader/hvmloader.c      |   7 +-
>>  tools/firmware/hvmloader/hvmloader.lds    |   4 +-
>>  tools/firmware/hvmloader/hypercall.h      | 121 ++++++----------------
>>  tools/firmware/hvmloader/hypercall_page.S |  67 ++++++++++++
>>  6 files changed, 105 insertions(+), 98 deletions(-)
>>  create mode 100644 tools/firmware/hvmloader/hypercall_page.S
> May I ask that the new file use a hyphen in place of the underscore?
>
>> @@ -142,8 +141,7 @@ static void init_hypercalls(void)
>>  
>>      /* Fill in hypercall transfer pages. */
>>      cpuid(base + 2, &eax, &ebx, &ecx, &edx);
>> -    for ( i = 0; i < eax; i++ )
>> -        wrmsr(ebx, HYPERCALL_PHYSICAL_ADDRESS + (i << 12) + i);
>> +    wrmsr(ebx, (unsigned long)hypercall_page);
> Convert the comment to singular then, too?
>
>> --- a/tools/firmware/hvmloader/hvmloader.lds
>> +++ b/tools/firmware/hvmloader/hvmloader.lds
>> @@ -7,9 +7,9 @@ SECTIONS
>>     * NB: there's no need to use the AT keyword in order to set the LMA, by
>>     * default the linker will use VMA = LMA unless specified otherwise.
>>     */
>> -  .text : { *(.text) *(.text.*) }
>> +  .text : { *(.text) *(.text.*)}
> Likely merely a leftover from some experimentation?

Ah yes.  I originally had .text.hcall which doesn't work properly after
.text.*

But I also didn't want it disassembled by default, hence ending up in data.

>
>> --- a/tools/firmware/hvmloader/hypercall.h
>> +++ b/tools/firmware/hvmloader/hypercall.h
>> @@ -35,148 +35,91 @@
>>  #include <xen/xen.h>
>>  #include "config.h"
>>  
>> -#define hcall_addr(name)                                                \
>> -    ((unsigned long)HYPERCALL_PHYSICAL_ADDRESS + __HYPERVISOR_##name * 32)
>> -
>> -#define _hypercall0(type, name)                 \
>> -({                                              \
>> -    long __res;                                 \
>> -    asm volatile (                              \
>> -        "call *%%eax"                           \
>> -        : "=a" (__res)                          \
>> -        : "0" (hcall_addr(name))                \
>> -        : "memory" );                           \
>> -    (type)__res;                                \
>> -})
>> -
>> -#define _hypercall1(type, name, a1)             \
>> -({                                              \
>> -    long __res, __ign1;                         \
>> -    asm volatile (                              \
>> -        "call *%%eax"                           \
>> -        : "=a" (__res), "=b" (__ign1)           \
>> -        : "0" (hcall_addr(name)),               \
>> -          "1" ((long)(a1))                      \
>> -        : "memory" );                           \
>> -    (type)__res;                                \
>> -})
>> -
>> -#define _hypercall2(type, name, a1, a2)                 \
>> -({                                                      \
>> -    long __res, __ign1, __ign2;                         \
>> -    asm volatile (                                      \
>> -        "call *%%eax"                                   \
>> -        : "=a" (__res), "=b" (__ign1), "=c" (__ign2)    \
>> -        : "0" (hcall_addr(name)),                       \
>> -          "1" ((long)(a1)), "2" ((long)(a2))            \
>> -        : "memory" );                                   \
>> -    (type)__res;                                        \
>> -})
>> -
>> -#define _hypercall3(type, name, a1, a2, a3)             \
>> -({                                                      \
>> -    long __res, __ign1, __ign2, __ign3;                 \
>> -    asm volatile (                                      \
>> -        "call *%%eax"                                   \
>> -        : "=a" (__res), "=b" (__ign1), "=c" (__ign2),   \
>> -          "=d" (__ign3)                                 \
>> -        : "0" (hcall_addr(name)),                       \
>> -          "1" ((long)(a1)), "2" ((long)(a2)),           \
>> -          "3" ((long)(a3))                              \
>> -        : "memory" );                                   \
>> -    (type)__res;                                        \
>> -})
>> -
>> -#define _hypercall4(type, name, a1, a2, a3, a4)         \
>> -({                                                      \
>> -    long __res, __ign1, __ign2, __ign3, __ign4;         \
>> -    asm volatile (                                      \
>> -        "call *%%eax"                                   \
>> -        : "=a" (__res), "=b" (__ign1), "=c" (__ign2),   \
>> -          "=d" (__ign3), "=S" (__ign4)                  \
>> -        : "0" (hcall_addr(name)),                       \
>> -          "1" ((long)(a1)), "2" ((long)(a2)),           \
>> -          "3" ((long)(a3)), "4" ((long)(a4))            \
>> -        : "memory" );                                   \
>> -    (type)__res;                                        \
>> -})
>> -
>> -#define _hypercall5(type, name, a1, a2, a3, a4, a5)     \
>> -({                                                      \
>> -    long __res, __ign1, __ign2, __ign3, __ign4, __ign5; \
>> -    asm volatile (                                      \
>> -        "call *%%eax"                                   \
>> -        : "=a" (__res), "=b" (__ign1), "=c" (__ign2),   \
>> -          "=d" (__ign3), "=S" (__ign4), "=D" (__ign5)   \
>> -        : "0" (hcall_addr(name)),                       \
>> -          "1" ((long)(a1)), "2" ((long)(a2)),           \
>> -          "3" ((long)(a3)), "4" ((long)(a4)),           \
>> -          "5" ((long)(a5))                              \
>> -        : "memory" );                                   \
>> -    (type)__res;                                        \
>> -})
>> +extern const char hypercall_page[];
>> +
>> +#define _hypercall2(type, hcall, a1, a2)                                \
>> +    ({                                                                  \
>> +        long res, _a1 = (long)(a1), _a2 = (long)(a2);                   \
>> +        asm volatile (                                                  \
>> +            "call hypercall_page + %c[offset]"                          \
>> +            : "=a" (res), "+b" (_a1), "+c" (_a2)                        \
>> +            : [offset] "i" (hcall * 32)                                 \
>> +            : "memory" );                                               \
>> +        (type)res;                                                      \
>> +    })
>> +
>> +#define _hypercall3(type, hcall, a1, a2, a3)                            \
>> +    ({                                                                  \
>> +        long res, _a1 = (long)(a1), _a2 = (long)(a2), _a3 = (long)(a3); \
>> +        asm volatile (                                                  \
>> +            "call hypercall_page + %c[offset]"                          \
>> +            : "=a" (res), "+b" (_a1), "+c" (_a2), "+d" (_a3)            \
>> +            : [offset] "i" (hcall * 32)                                 \
>> +            : "memory" );                                               \
>> +        (type)res;                                                      \
>> +    })
> Not having _hypercall0() and _hypercall1() anymore is certainly a little
> odd. If one needed to use such a hypercall, even if only for debugging,
> the extra work needed (every time) would be larger than necessary. I'm
> definitely less worried about _hypercall4() and _hypercall5().
>
> In any event the removal of any wrappers could do with mentioning in the
> description, to indicate it's deliberate (and why).

I suppose leaving 0 and 1 behind is fine.  That's easy enough.

>
>>  static inline int
>>  hypercall_sched_op(
>>      int cmd, void *arg)
>>  {
>> -    return _hypercall2(int, sched_op, cmd, arg);
>> +    return _hypercall2(int, __HYPERVISOR_sched_op, cmd, arg);
>>  }
> I know you don't really like token concatenation in cases like these ones,
> but these adjustments all don't look as if they were necessary right here.
> The new macros use the macro parameter only in ways where token pasting
> would continue to work, afaics. And in the new assembly file you use very
> similar token pasting anyway.

That's because my judgement is not about simply tokenisation (or not). 
It's about not using ## when it is likely to interfere with
grep/cscope/tags/etc.

The assembly file both isn't really interesting to find this way, and
needs ## in order to work the way it does (differing prefixes in the
hypercall names).

>
>> --- /dev/null
>> +++ b/tools/firmware/hvmloader/hypercall_page.S
>> @@ -0,0 +1,67 @@
>> +#include <xen/xen.h>
>> +
>> +        .section ".hcall", "aw"
> Why "aw"? I'd have expected "awx" if you really think the writable part
> needs expressing here, or else "ax". Otherwise I think a brief comment as
> wanted as to the absence of x for something that is executable.

It's because it's merged with .data (so it doesn't pollute the
disassembly).  "awx" causes a section flags mismatch.

> Also may I ask that you add @progbits?

Ok.

>
>> +        .align 4096
> PAGE_SIZE? And then again ...
>
>> +        .globl hypercall_page
>> +hypercall_page:
>> +         /* Poisoned with `ret` for safety before hypercalls are set up. */
>> +        .fill 4096, 1, 0xc3
>> +        .type hypercall_page, STT_OBJECT
>> +        .size hypercall_page, 4096
> ... here?

HVMLoader doesn't have a suitable constant, and doesn't have _AC().

Although we probably can just get away with (1 << PAGE_SHIFT) and drop
the ul.

>
> As to the "poisoning" - how does RET provide any safety? If a call happened
> early, the uncertainty of what %eax is set to would make it unpredictable
> how such a caller would further behave. Imo better to crash / hang in such
> a case, perhaps by using INT3 instead.
>
> I notice that matches earlier behavior, but there the comment at least
> validly said "rendering them no-ops" (yet still without considering
> possible problems resulting from doing so).

That's a complicated one.  I can't remember why I chose that exact
phraseology, but it's not really about accidentally-too-early case, it's
about error handling.

HVMLoader doesn't have an IDT, so any exception is fatal.  But that's
also something that ideally wants fixing (if it weren't for the fact
that it's more likely that I'll complete plans to remove hvmloader
completely before having time to do an IDT).

But for code which does have a panic() function, there's console_io
(logging) and sched_op (SHUTDOWN_crash) which you want to use just in
case they do work, before moving onto other methods of terminating.


>
>> +#define DECLARE_HYPERCALL(name)                                                 \
>> +        .globl HYPERCALL_ ## name;                                              \
>> +        .type  HYPERCALL_ ## name, STT_FUNC;                                    \
>> +        .size  HYPERCALL_ ## name, 32;                                          \
>> +        .set   HYPERCALL_ ## name, hypercall_page + __HYPERVISOR_ ## name * 32
>> +
>> +DECLARE_HYPERCALL(set_trap_table)
>> +DECLARE_HYPERCALL(mmu_update)
>> +DECLARE_HYPERCALL(set_gdt)
>> +DECLARE_HYPERCALL(stack_switch)
>> +DECLARE_HYPERCALL(set_callbacks)
>> +DECLARE_HYPERCALL(fpu_taskswitch)
>> +DECLARE_HYPERCALL(sched_op_compat)
>> +DECLARE_HYPERCALL(platform_op)
>> +DECLARE_HYPERCALL(set_debugreg)
>> +DECLARE_HYPERCALL(get_debugreg)
>> +DECLARE_HYPERCALL(update_descriptor)
>> +DECLARE_HYPERCALL(memory_op)
>> +DECLARE_HYPERCALL(multicall)
>> +DECLARE_HYPERCALL(update_va_mapping)
>> +DECLARE_HYPERCALL(set_timer_op)
>> +DECLARE_HYPERCALL(event_channel_op_compat)
>> +DECLARE_HYPERCALL(xen_version)
>> +DECLARE_HYPERCALL(console_io)
>> +DECLARE_HYPERCALL(physdev_op_compat)
>> +DECLARE_HYPERCALL(grant_table_op)
>> +DECLARE_HYPERCALL(vm_assist)
>> +DECLARE_HYPERCALL(update_va_mapping_otherdomain)
>> +DECLARE_HYPERCALL(iret)
>> +DECLARE_HYPERCALL(vcpu_op)
>> +DECLARE_HYPERCALL(set_segment_base)
>> +DECLARE_HYPERCALL(mmuext_op)
>> +DECLARE_HYPERCALL(xsm_op)
>> +DECLARE_HYPERCALL(nmi_op)
>> +DECLARE_HYPERCALL(sched_op)
>> +DECLARE_HYPERCALL(callback_op)
>> +DECLARE_HYPERCALL(xenoprof_op)
>> +DECLARE_HYPERCALL(event_channel_op)
>> +DECLARE_HYPERCALL(physdev_op)
>> +DECLARE_HYPERCALL(hvm_op)
>> +DECLARE_HYPERCALL(sysctl)
>> +DECLARE_HYPERCALL(domctl)
>> +DECLARE_HYPERCALL(kexec_op)
>> +DECLARE_HYPERCALL(tmem_op)
> We're not going to ever need this in hvmloader, are we? There are quite a
> few more that I'd suggest to leave out, but this one stands out for no
> longer existing even in the hypervisor.

I suspect I can trim this to just what HVMLoader needs.  It's not as if
we're expecting a major change in functionality.

~Andrew

