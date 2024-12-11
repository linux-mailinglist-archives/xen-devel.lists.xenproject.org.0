Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941719EC6DB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 09:17:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854060.1267356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHtw-0005mu-JC; Wed, 11 Dec 2024 08:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854060.1267356; Wed, 11 Dec 2024 08:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHtw-0005kN-F8; Wed, 11 Dec 2024 08:16:56 +0000
Received: by outflank-mailman (input) for mailman id 854060;
 Wed, 11 Dec 2024 08:16:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLHtu-0005Ut-V5
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 08:16:54 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47dc4dbb-b798-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 09:16:54 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so3040037f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 00:16:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-728eb09fbbcsm1289485b3a.44.2024.12.11.00.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 00:16:53 -0800 (PST)
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
X-Inumbo-ID: 47dc4dbb-b798-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733905013; x=1734509813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xt/vhDq6tvtRtAp65Oap9JwGCMVSXroswoLz9opvCjU=;
        b=ex1i9Htj9a0Xqixx/70MYouJFWt9w7Lll/uVR2fcrT3ouMIM2cNwOVmADPwXH59dJX
         AaSODCEVHPtoEWXLIAzLWKMzJzUhZ61QlghG+VdfjUl1KUiHFBotrvQjhH17ZOI6u3al
         g435p+6cC3+caJj2yZ0DlGRG8mziOyfzEugUzQz6ntMoov9+Yv+yPGddpeH7pL8ST5nE
         piL5X9e36l153LYRuWggwQpVWDZSS5eb0Zhq2fS3jlKrJ3J460FKZ1VrTdy2LW+9dNSe
         m1FuJVYBuHt1I26z3Idyr11gFY/qh4EjowCxOFNgjZ+9pK4qOfOm1SRduiD+ChjLonu7
         jbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733905013; x=1734509813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xt/vhDq6tvtRtAp65Oap9JwGCMVSXroswoLz9opvCjU=;
        b=vn3JN4ipVIEY0e9LnpZE6KCMJecHrbZihqkbVZw11Wq076cdh+ReZMTyB9foUn5+iu
         gqXCC1rF0T7yNTYTEfpLDpG7YseBksHTjfeJsLq+7mxE9HoQRoDHc9qvQcNMAjXEFkiY
         bA+lAUdGqa9iIVZwBbQlo8HYhBegLoaoGKebNvdi86YRghIahrAq+GoGtJSsPq26z5qf
         FckDAeKtmyfG/qSY2Kr2PODpgmVm1ovw5VEUNbyrP8HmM8Vy9YbdYkyO3A21Lakg9BXh
         ibQ9rksxNSfdw6U8xOZnE+Bt3SPhHYnBHaU+u7F1Loixm2+Z5bUs9ARRR7Mts4sjvGHE
         BQGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlqO8SL4ARRKVbQFWnP7u4fjh8dha4NMKb4UtEEZdwPgI5Apqn70LQxuUD4SqHpHLuO5UvAKZdnmA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9IxfV1WglqHcr/TE82GVtOPD3D/4R3LBVvu/EQzYziAtZRS3c
	sk4hjIet6roa/lYpnfkLkyvlyqu7pFdTeVoWLxXB5eKmqN4zRbebe9ZxwTzfag==
X-Gm-Gg: ASbGnctDr8I52oMtmMHg2L+g+nS8uHaB8KaL/0KWMgWhyVnQMljbgBgZ3B8tTXIuy1P
	jqb+tqnGe1X5AfzHcmlao/AidFiZCEvBFpqKurKdw1rg/PKknXaT+2JyOUk2oIp5KNJQ+Behfrc
	z/xcn0ZOpJIJ8mtnAnFXBPOqDrSUpJBZCSsxhjY3uMRE4yRsqUMI1VVEpsgaa1FX8mqu3X12+S0
	YpfqSXeBshPTyNXORLuFZpn7SZfyzgKanyFwReDfo77aHcoo509ZK4wP96y0WoDA039ZZJwv1HY
	omGnzpH4cwWI6TZxd2tXBy/7auoKZkBbJWhomtI=
X-Google-Smtp-Source: AGHT+IGg7YdYyWOgyoU4IzGC41llIXBd4pWw8wCA3r7WqaRRxAR7HcSpRm32WreOv64slQQR5FfXSQ==
X-Received: by 2002:a5d:6d03:0:b0:385:f9ed:1632 with SMTP id ffacd0b85a97d-3864ce9d5b4mr1415511f8f.28.1733905013586;
        Wed, 11 Dec 2024 00:16:53 -0800 (PST)
Message-ID: <0d04abb1-dae1-47d1-93e3-23d88399fa64@suse.com>
Date: Wed, 11 Dec 2024 09:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen: common: add ability to enable stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241211020424.401614-1-volodymyr_babchuk@epam.com>
 <20241211020424.401614-3-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20241211020424.401614-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2024 03:04, Volodymyr Babchuk wrote:
> Both GCC and Clang support -fstack-protector feature, which add stack
> canaries to functions where stack corruption is possible. This patch
> makes general preparations to enable this feature on different
> supported architectures:
> 
>  - Added CONFIG_HAS_STACK_PROTECTOR option so each architecture
>    can enable this feature individually
>  - Added user-selectable CONFIG_STACK_PROTECTOR option
>  - Implemented code that sets up random stack canary and a basic
>    handler for stack protector failures
> 
> Stack guard value is initialized in three phases:
> 
> 1. Pre-defined randomly-selected value.
> 
> 2. Early use of linear congruent random number generator. It relies on
> get_cycles() being available very early. If get_cycles() returns zero,
> it would leave pre-defined value from the previous step. Even when
> get_cycles() is available, it's return value may be easily predicted,
> especially on embedded systems, where boot time is quite consistent.
> 
> 3. After hypervisor is sufficiently initialized, stack guard can be
> set-up with get_random() function, which is expected to provide better
> randomness.
> 
> Also this patch adds comment to asm-generic/random.h about stack
> protector dependency on it.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> Changes in v3:
>  - Fixed coding style in stack-protector.h
>  - Extended panic() message
>  - Included missed random.h
>  - Renamed Kconfig option
>  - Used Andrew's suggestion for the Kconfig help text
>  - Added "asmlinkage" attribute to __stack_chk_fail() to make Eclair
>  happy
>  - Initial stack guard value is random
>  - Added LCG to generate stack guard value at early boot stages
>  - Added comment to asm-generic/random.h about dependencies
>  - Extended the commit message
> 
> Changes in v2:
>  - Moved changes to EMBEDDED_EXTRA_CFLAGS into separate patch
>  - Renamed stack_protector.c to stack-protector.c
>  - Renamed stack_protector.h to stack-protector.h
>  - Removed #ifdef CONFIG_X86 in stack-protector.h
>  - Updated comment in stack-protector.h
>    (also, we can't call boot_stack_chk_guard_setup() from asm code in
>    general case, because it calls get_random() and get_random() may
>    depend in per_cpu infrastructure, which is initialized later)
>  - Fixed coding style
>  - Moved CONFIG_STACK_PROTECTOR into newly added "Compiler options"
>  submenu
>  - Marked __stack_chk_guard as __ro_after_init
> ---
>  xen/Makefile                      |  4 +++
>  xen/common/Kconfig                | 15 ++++++++++
>  xen/common/Makefile               |  1 +
>  xen/common/stack-protector.c      | 47 +++++++++++++++++++++++++++++++
>  xen/include/asm-generic/random.h  |  5 ++++
>  xen/include/xen/stack-protector.h | 30 ++++++++++++++++++++
>  6 files changed, 102 insertions(+)
>  create mode 100644 xen/common/stack-protector.c
>  create mode 100644 xen/include/xen/stack-protector.h
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index 34ed8c0fc7..0de0101fd0 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -432,7 +432,11 @@ else
>  CFLAGS_UBSAN :=
>  endif
>  
> +ifeq ($(CONFIG_STACK_PROTECTOR),y)
> +CFLAGS += -fstack-protector
> +else
>  CFLAGS += -fno-stack-protector
> +endif

Personally I'd prefer if we consistently used the list approach we use
in various places, whenever possible:

CFLAGS-stack-protector-y := -fno-stack-protector
CFLAGS-stack-protector-$(CONFIG_STACK_PROTECTOR) := -fstack-protector
CFLAGS += $(CFLAGS-stack-protector-y)

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -86,6 +86,9 @@ config HAS_UBSAN
>  config HAS_VMAP
>  	bool
>  
> +config HAS_STACK_PROTECTOR
> +	bool

Please obey to alphabetic sorting in this region of the file.

> @@ -213,6 +216,18 @@ config SPECULATIVE_HARDEN_LOCK
>  
>  endmenu
>  
> +menu "Compiler options"
> +
> +config STACK_PROTECTOR
> +	bool "Stack protector"
> +	depends on HAS_STACK_PROTECTOR
> +	help
> +	  Enable the Stack Protector compiler hardening option. This inserts a
> +	  canary value in the stack frame of functions, and performs an integrity
> +	  check on exit.
> +
> +endmenu

"Compiler options" reads a little odd to me as a menu title. The preceding one
is "Speculative hardening"; how about making this one "Other hardening" or some
such?

> --- /dev/null
> +++ b/xen/common/stack-protector.c
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Nit: I don't think we permit C++ comments as per our style.

> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/random.h>
> +#include <xen/time.h>
> +
> +/*
> + * Initial value is chosen by a fair dice roll.
> + * It will be updated during boot process.
> + */
> +#if BITS_PER_LONG == 32
> +unsigned long __ro_after_init __stack_chk_guard = 0xdd2cc927UL;
> +#else
> +unsigned long __ro_after_init __stack_chk_guard = 0x2d853605a4d9a09cUL;
> +#endif
> +
> +/* This function should be called from ASM only */

And with no (stack-protector enabled) C functions up the call stack. This
may be as easy to express in the comment as by simply adding "early".
However, considering the so far hypothetical case of offering the feature
also on x86: What about xen.efi, which from the very start uses C code?

> +void __init asmlinkage boot_stack_chk_guard_setup_early(void)
> +{
> +    /*
> +     * Linear congruent generator (X_n+1 = X_n * a + c).
> +     *
> +     * Constant is taken from "Tables Of Linear Congruential
> +     * Generators Of Different Sizes And Good Lattice Structure" by
> +     * Pierre L’Ecuyer.
> +     */
> +#if BITS_PER_LONG == 32
> +    const unsigned long a = 2891336453UL;
> +#else
> +    const unsigned long a = 2862933555777941757UL;
> +#endif
> +    const unsigned long c = 1;
> +
> +    unsigned long cycles = get_cycles();
> +
> +    /* Use the initial value if we can't generate random one */
> +    if ( !cycles )
> +	    return;

Nit: Indentation (no hard tabs please).

> +    __stack_chk_guard = cycles * a + c;
> +}
> +
> +void asmlinkage __stack_chk_fail(void)
> +{
> +    panic("Stack Protector integrity violation identified in %ps\n",
> +	  __builtin_return_address(0));

Again.

Is panic() really the right construct to use here, though?
__builtin_return_address() will merely identify the immediate caller. A
full stack trace (from BUG()) would likely be more useful in identifying
the offender.

> --- a/xen/include/asm-generic/random.h
> +++ b/xen/include/asm-generic/random.h
> @@ -2,6 +2,11 @@
>  #ifndef __ASM_GENERIC_RANDOM_H__
>  #define __ASM_GENERIC_RANDOM_H__
>  
> +/*
> + * When implementing arch_get_random(), please make sure that
> + * it can provide random data before stack protector is initialized
> + * (i.e. before boot_stack_chk_guard_setup() is called).
> + */
>  static inline unsigned int arch_get_random(void)
>  {
>      return 0;

What exactly will go (entirely) wrong if the comment isn't followed?
(I'm afraid anyway that the comment living here is easy to miss.)

> --- /dev/null
> +++ b/xen/include/xen/stack-protector.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN__STACK_PROTECTOR_H
> +#define XEN__STACK_PROTECTOR_H
> +
> +#ifdef CONFIG_STACK_PROTECTOR
> +
> +#include <xen/random.h>
> +
> +extern unsigned long __stack_chk_guard;
> +
> +/*
> + * This function should be always inlined. Also it should be called
> + * from a function that never returns or a function that has
> + * stack-protector disabled.
> + */

As to the latter - that's not just "a function" but an entire call
stack that would need to have stack protector disabled.

> +static always_inline void boot_stack_chk_guard_setup(void)
> +{
> +    __stack_chk_guard = get_random();
> +    if (BITS_PER_LONG == 64)

Nit: Style (missing blanks).

> +        __stack_chk_guard |= ((unsigned long)get_random()) << 32;

Nit: No real need for the outer pair of parentheses.

Jan

