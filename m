Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B6A9EDCD9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 01:53:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855420.1268341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLXRl-00045p-0c; Thu, 12 Dec 2024 00:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855420.1268341; Thu, 12 Dec 2024 00:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLXRk-00043L-Te; Thu, 12 Dec 2024 00:52:52 +0000
Received: by outflank-mailman (input) for mailman id 855420;
 Thu, 12 Dec 2024 00:52:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IXdK=TF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tLXRj-00043F-Pe
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 00:52:51 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 694ec305-b823-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 01:52:50 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso263335e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 16:52:50 -0800 (PST)
Received: from [192.168.189.19] ([81.6.40.111])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362559f984sm384725e9.25.2024.12.11.16.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 16:52:49 -0800 (PST)
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
X-Inumbo-ID: 694ec305-b823-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733964770; x=1734569570; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vCoqLBeS9dpIWkInTTrdalCtTm92FScKnOSa7+WTxt4=;
        b=fLj4Wq0PmbB0iiLcjj80amak/QyD0zq69Fty94wXZ086ByO3dQACh0bUGODXynxBQl
         YqW+UecuhGmXm3zIEYds5YVj9TsiIAiNWgHu1oiVRnXqrWZ3pOt3xWTPkRglhKiydy2H
         4Vm/9Ke20xJX60OY3Ebqc7Syntm3I81q9o0cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733964770; x=1734569570;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCoqLBeS9dpIWkInTTrdalCtTm92FScKnOSa7+WTxt4=;
        b=Pz8QaIHd4ZGqAV/HlLKQ5yMZhTiUjjpEKRzIJgS8hfTwrVCEGQJWnnKGRKEiEyn1Fa
         eAH3GmqnuartGJW7LwoWZXraGMTpkk+hebuCywO9iP3nd1kRy5JyuzHbIki+tmH4ORAh
         btBBWxVaQpjSAfKrSImr3Ec++EAgVkBNxQ5nUkHL4dIfzNmPXngwZn8lkWwZJNd9Bl/i
         4KT83KOO+sKtwEL33BVHKNrdmtNecBZsG8LajGubGy3YJhXkEmx/7NPpgD1hkPMlS8Y5
         KZ1wjb/KNur52Jz7mnBU9ExtYWtq8xTX/rCroQTu6nUTRCEaejnusr2tMWFDXWL/yID9
         EyMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvBJGPzXRTSmJygqe6f9mZKGE8sti1SjcFs4yAmtZgxfphu+KXoun0E2uj0j+n02rWSWjismClG0Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9V1vFIpWMT6eEfk7u37YRon9rr6frIK05b3BPC/VieXbExdfh
	NDX9onyv4HrP/uMktbypjOYPvbNdAsTqn4BKd18lvi33x5mYEeG+/0VRZBXwaKRFiRNSiQFLlER
	ngKZCHg==
X-Gm-Gg: ASbGncs0VymXeXyxkUykfqdEUGV/M5kXPckQkYDwVwTatyJdrEeY/IOrU7wXWdPgNZM
	v9q3hBpCodz59G3NTW4ex03aVzS3UsDBpmn/jizlCmktVSgCQnTevNCon3LlZUEzuxyeYnSDIJz
	Ck+VTlSui4QgGPNKZ3ZqKMZ2FgC8/s2ClkapgFmZawC6LTCU7jgkaxX/0CKojTyP7nQW9JJBin1
	NwUbfW3Ck793ppkwe0GN8shm4aJRYRbPANWvpwg1Z8GCqpm1dry1CDUMEPfOd5v
X-Google-Smtp-Source: AGHT+IEXQBhYH8CuetOYMFxIYVgmnXM8cDT7pS3FM8ENTQW9M4RqjmmYIMcxpkozOVnjvy1S1LN2Qg==
X-Received: by 2002:a05:600c:b86:b0:436:1c04:aa8e with SMTP id 5b1f17b1804b1-4361c3746c2mr41311665e9.16.1733964769683;
        Wed, 11 Dec 2024 16:52:49 -0800 (PST)
Message-ID: <6b5326de-1ffb-4bac-b698-0e17435e89bc@citrix.com>
Date: Thu, 12 Dec 2024 00:52:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen: common: add ability to enable stack protector
To: Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
 <20241211020424.401614-3-volodymyr_babchuk@epam.com>
 <0d04abb1-dae1-47d1-93e3-23d88399fa64@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0d04abb1-dae1-47d1-93e3-23d88399fa64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/12/2024 8:16 am, Jan Beulich wrote:
> On 11.12.2024 03:04, Volodymyr Babchuk wrote:
>> Both GCC and Clang support -fstack-protector feature, which add stack
>> canaries to functions where stack corruption is possible. This patch
>> makes general preparations to enable this feature on different
>> supported architectures:
>>
>>  - Added CONFIG_HAS_STACK_PROTECTOR option so each architecture
>>    can enable this feature individually
>>  - Added user-selectable CONFIG_STACK_PROTECTOR option
>>  - Implemented code that sets up random stack canary and a basic
>>    handler for stack protector failures
>>
>> Stack guard value is initialized in three phases:
>>
>> 1. Pre-defined randomly-selected value.
>>
>> 2. Early use of linear congruent random number generator. It relies on
>> get_cycles() being available very early. If get_cycles() returns zero,
>> it would leave pre-defined value from the previous step. Even when
>> get_cycles() is available, it's return value may be easily predicted,
>> especially on embedded systems, where boot time is quite consistent.
>>
>> 3. After hypervisor is sufficiently initialized, stack guard can be
>> set-up with get_random() function, which is expected to provide better
>> randomness.
>>
>> Also this patch adds comment to asm-generic/random.h about stack
>> protector dependency on it.
>>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>
>> ---
>>
>> Changes in v3:
>>  - Fixed coding style in stack-protector.h
>>  - Extended panic() message
>>  - Included missed random.h
>>  - Renamed Kconfig option
>>  - Used Andrew's suggestion for the Kconfig help text
>>  - Added "asmlinkage" attribute to __stack_chk_fail() to make Eclair
>>  happy
>>  - Initial stack guard value is random
>>  - Added LCG to generate stack guard value at early boot stages
>>  - Added comment to asm-generic/random.h about dependencies
>>  - Extended the commit message
>>
>> Changes in v2:
>>  - Moved changes to EMBEDDED_EXTRA_CFLAGS into separate patch
>>  - Renamed stack_protector.c to stack-protector.c
>>  - Renamed stack_protector.h to stack-protector.h
>>  - Removed #ifdef CONFIG_X86 in stack-protector.h
>>  - Updated comment in stack-protector.h
>>    (also, we can't call boot_stack_chk_guard_setup() from asm code in
>>    general case, because it calls get_random() and get_random() may
>>    depend in per_cpu infrastructure, which is initialized later)
>>  - Fixed coding style
>>  - Moved CONFIG_STACK_PROTECTOR into newly added "Compiler options"
>>  submenu
>>  - Marked __stack_chk_guard as __ro_after_init
>> ---
>>  xen/Makefile                      |  4 +++
>>  xen/common/Kconfig                | 15 ++++++++++
>>  xen/common/Makefile               |  1 +
>>  xen/common/stack-protector.c      | 47 +++++++++++++++++++++++++++++++
>>  xen/include/asm-generic/random.h  |  5 ++++
>>  xen/include/xen/stack-protector.h | 30 ++++++++++++++++++++
>>  6 files changed, 102 insertions(+)
>>  create mode 100644 xen/common/stack-protector.c
>>  create mode 100644 xen/include/xen/stack-protector.h
>>
>> diff --git a/xen/Makefile b/xen/Makefile
>> index 34ed8c0fc7..0de0101fd0 100644
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -432,7 +432,11 @@ else
>>  CFLAGS_UBSAN :=
>>  endif
>>  
>> +ifeq ($(CONFIG_STACK_PROTECTOR),y)
>> +CFLAGS += -fstack-protector
>> +else
>>  CFLAGS += -fno-stack-protector
>> +endif
> Personally I'd prefer if we consistently used the list approach we use
> in various places, whenever possible:
>
> CFLAGS-stack-protector-y := -fno-stack-protector
> CFLAGS-stack-protector-$(CONFIG_STACK_PROTECTOR) := -fstack-protector
> CFLAGS += $(CFLAGS-stack-protector-y)

No - please stop this antipattern.

It saves 2 lines of code and makes the logic complete unintelligible.

I have a very strong preference for this patch to happen as Volodymyr
presented, and without the double := replacing the more-legible ifeq.

>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -86,6 +86,9 @@ config HAS_UBSAN
>>  config HAS_VMAP
>>  	bool
>>  
>> +config HAS_STACK_PROTECTOR
>> +	bool
> Please obey to alphabetic sorting in this region of the file.
>
>> @@ -213,6 +216,18 @@ config SPECULATIVE_HARDEN_LOCK
>>  
>>  endmenu
>>  
>> +menu "Compiler options"
>> +
>> +config STACK_PROTECTOR
>> +	bool "Stack protector"
>> +	depends on HAS_STACK_PROTECTOR
>> +	help
>> +	  Enable the Stack Protector compiler hardening option. This inserts a
>> +	  canary value in the stack frame of functions, and performs an integrity
>> +	  check on exit.

I'd be tempted to say "on function exit" to be a little more specific.

>> +
>> +endmenu
> "Compiler options" reads a little odd to me as a menu title. The preceding one
> is "Speculative hardening"; how about making this one "Other hardening" or some
> such?

In an ideal world, we'd have "Code hardening", with speculative just
being one item in the list beside stack protector, trivial auto var
init, FineIBT, etc.

>
>> --- /dev/null
>> +++ b/xen/common/stack-protector.c
>> @@ -0,0 +1,47 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
> Nit: I don't think we permit C++ comments as per our style.
>
>> +#include <xen/init.h>
>> +#include <xen/lib.h>
>> +#include <xen/random.h>
>> +#include <xen/time.h>
>> +
>> +/*
>> + * Initial value is chosen by a fair dice roll.
>> + * It will be updated during boot process.
>> + */
>> +#if BITS_PER_LONG == 32
>> +unsigned long __ro_after_init __stack_chk_guard = 0xdd2cc927UL;
>> +#else
>> +unsigned long __ro_after_init __stack_chk_guard = 0x2d853605a4d9a09cUL;
>> +#endif
>> +
>> +/* This function should be called from ASM only */
> And with no (stack-protector enabled) C functions up the call stack. This
> may be as easy to express in the comment as by simply adding "early".
> However, considering the so far hypothetical case of offering the feature
> also on x86: What about xen.efi, which from the very start uses C code?

The necessary property is "with no functions to unwind that have an
active canary".

This is why it ends up as "from early assembly, or a noreturn function",
where really the latter is even really "has an exit which escapes canary
tracking, such as Xen's reset_stack_and_jmp()".

>
>> +void __init asmlinkage boot_stack_chk_guard_setup_early(void)
>> +{
>> +    /*
>> +     * Linear congruent generator (X_n+1 = X_n * a + c).
>> +     *
>> +     * Constant is taken from "Tables Of Linear Congruential
>> +     * Generators Of Different Sizes And Good Lattice Structure" by
>> +     * Pierre L’Ecuyer.
>> +     */
>> +#if BITS_PER_LONG == 32
>> +    const unsigned long a = 2891336453UL;
>> +#else
>> +    const unsigned long a = 2862933555777941757UL;
>> +#endif
>> +    const unsigned long c = 1;
>> +
>> +    unsigned long cycles = get_cycles();
>> +
>> +    /* Use the initial value if we can't generate random one */
>> +    if ( !cycles )
>> +	    return;
> Nit: Indentation (no hard tabs please).
>
>> +    __stack_chk_guard = cycles * a + c;
>> +}

This is much much nicer.

That said, I don't think we two different setup phases.  I'd suggest
having only this get_cycles implementation and ignore the later
get_random() setup.

It's definitely good enough for a v1, (and frankly, get_random() wants
some separate improvements anyway.)


>> +
>> +void asmlinkage __stack_chk_fail(void)
>> +{
>> +    panic("Stack Protector integrity violation identified in %ps\n",
>> +	  __builtin_return_address(0));
> Again.
>
> Is panic() really the right construct to use here, though?
> __builtin_return_address() will merely identify the immediate caller. A
> full stack trace (from BUG()) would likely be more useful in identifying
> the offender.

Well - we have to be careful, because the backtrace from here is
specifically misleading in this case.

When this trips, it's either the caller itself that broke, or some
sibling call tree which is rubble under the active stack now.

BUG() also comes with 0 information.

So, maybe we want a dump_execution_state() (to get the backtrace), and
then this panic() which states it was a Stack Protection violation,
which hopefully is enough of a hint to people to look in the sibling
call tree.

~Andrew

