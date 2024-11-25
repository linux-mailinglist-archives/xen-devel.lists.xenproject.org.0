Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362E49D8565
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 13:24:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842491.1258029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFY8d-0007NJ-1D; Mon, 25 Nov 2024 12:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842491.1258029; Mon, 25 Nov 2024 12:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFY8c-0007LH-UW; Mon, 25 Nov 2024 12:24:22 +0000
Received: by outflank-mailman (input) for mailman id 842491;
 Mon, 25 Nov 2024 12:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z5yF=SU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tFY8c-0007LB-3y
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 12:24:22 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f60f8a8-ab28-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 13:24:15 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa51bf95ce1so429546666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 04:24:15 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa534232086sm316567666b.42.2024.11.25.04.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 04:24:14 -0800 (PST)
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
X-Inumbo-ID: 2f60f8a8-ab28-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJmNjBmOGE4LWFiMjgtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTM3NDU1LjUzOTI4MSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732537455; x=1733142255; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hfm1ExUQ/8Jn4+mZEHN5mQaAmYauZk4TrBhqQzL27js=;
        b=c7jWHucWThVoXfiu8CP6IEOlvtEQD4cgfv6eFyQmq3YBbSh8Ipq3h99n50IItr/uj0
         n22G2MKGvdF8aZ8nHw3FpKXGpnCes0hjAtV2fE+0wr82IBGcGmZQ69g6PNM1mVduCTYq
         ps0alHUhtnAONvyzkpYVm4nDA9gU4kQksVeHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732537455; x=1733142255;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfm1ExUQ/8Jn4+mZEHN5mQaAmYauZk4TrBhqQzL27js=;
        b=HK1K7dzGQnzu/x7vHEqxFf0lk0JN3EMgxS3CQvVFD578/nGFH6+JJuSeZDeaYmEXQf
         7R8xWamc+IGSN/oGtL8bdG+US1kPbFZ+eizDrKzcxgBVU8PL9ktRzTCQFXDfGmQqDMJv
         g5gpI5bpVDgCIrdxX2v3cEQa3nB+Ie31ZtqX4OrluuOIo4JXcAUVKBVNAeHH8n+pWANp
         wnNK67GHFlgh3Arqi9l18HGhYQrHKN2tPTrHC4PSu45QuPNekj8Tj0FV7j7Ibgp18Iaq
         TdTXlSimDoNs+un77qy4s0rMEweetXekl00yHNUnLQ87o3TjqHCUde0i4PCtk6wUXfOR
         YCSA==
X-Forwarded-Encrypted: i=1; AJvYcCWj+yiyNjBBWFnsFNNOvyOYcWHN4E9+X6yiYSMf35cemplabfqopZ0xAcHUx6EL54JGGx7DDww04iw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaZKGA38iX8iSpVtsZ15Wg5yQTQ1M/Pwe3GP/+4Lz3gg4SpnyG
	yLdGKJPIbRQXNBZ74XbyplfxBDWOEwKdeckOAAZtt7SCMAz64+gOzurxv8d8ytU=
X-Gm-Gg: ASbGncsKDMRtYISw5prBTa0WnWYGd42NXpGMwETAzX8UtA86SwXuJwytPyPYHPpXYrs
	yQ3ryFqiRhsdXPmyZQ+rTM+2e9zDKhuKVa54dpeykh+2forap4eNkDsktwhZa4HRRDbGw1h9+kR
	WivfabvEPXVyxC5UqjtVjcNwCwk8LjnX6vecJOXG5nmXC2fo1D0xStjX7xu2h9hQMvEXKtKU15J
	NBwqXGCJFiqCpTCVNTcBsNgcZXxm6qtG2dF69ljLTSlFVMbFu+u06g/0Tb0gcs=
X-Google-Smtp-Source: AGHT+IGGcnnhD8KESB32D4vLfERniD8kzn0TN/Up5OYa8CSNMGXkirnEB4JafpGkHtg2uq8607zvGg==
X-Received: by 2002:a17:906:cca:b0:aa5:c28:6eb6 with SMTP id a640c23a62f3a-aa50c286f60mr1017577066b.27.1732537454910;
        Mon, 25 Nov 2024 04:24:14 -0800 (PST)
Message-ID: <284fc770-88e0-4bd2-bd04-8de97613153c@citrix.com>
Date: Mon, 25 Nov 2024 12:24:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen: common: add ability to enable stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241122210719.2572072-1-volodymyr_babchuk@epam.com>
 <20241122210719.2572072-2-volodymyr_babchuk@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241122210719.2572072-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/11/2024 9:07 pm, Volodymyr Babchuk wrote:
> diff --git a/Config.mk b/Config.mk
> index f1eab9a20a..c9fef4659f 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -190,7 +190,7 @@ endif
>  APPEND_LDFLAGS += $(foreach i, $(APPEND_LIB), -L$(i))
>  APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
>  
> -EMBEDDED_EXTRA_CFLAGS := -fno-pie -fno-stack-protector -fno-stack-protector-all
> +EMBEDDED_EXTRA_CFLAGS := -fno-pie
>  EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
>  
>  XEN_EXTFILES_URL ?= https://xenbits.xen.org/xen-extfiles
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index 2a81af28a1..41424f6aca 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -54,6 +54,8 @@ TARGET_CFLAGS += $(CFLAGS)
>  TARGET_CPPFLAGS += $(CPPFLAGS)
>  $(call cc-options-add,TARGET_CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  
> +$(call cc-option-add,TARGET_CFLAGS,CC,-fno-stack-protector)
> +

I'd suggest splitting this into two patches, so removing the flags from
EMBEDDED_EXTRA_CFLAGS is separate from the new infrastructure.

Also, we're losing -fno-stack-protector-all, with no discussion.

AFAICT, it was introduced in c/s f8beb54e245 in 2004, alongside
-fno-stack-protector.  But further investigation shows that it is not,
nor has ever been, a valid option to GCC or Clang.

I've submitted a patch in isolation to drop this.  (And Jan has reviewed
it while I've been writing the rest of the email, so I'll get it
committed in due course).

> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 90268d9249..0ffd825510 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -86,6 +86,9 @@ config HAS_UBSAN
>  config HAS_VMAP
>  	bool
>  
> +config HAS_STACK_PROTECTOR
> +	bool
> +
>  config MEM_ACCESS_ALWAYS_ON
>  	bool
>  
> @@ -516,4 +519,14 @@ config TRACEBUFFER
>  	  to be collected at run time for debugging or performance analysis.
>  	  Memory and execution overhead when not active is minimal.
>  
> +config STACK_PROTECTOR
> +	bool "Stack protection"
> +	depends on HAS_STACK_PROTECTOR
> +	help
> +	  Use compiler's option -fstack-protector (supported both by GCC
> +	  and clang) to generate code that checks for corrupted stack

Clang

> +	  and halts the system in case of any problems.
> +
> +	  Please note that this option will impair performance.
> +

I think we probably want a top-level Hardening menu.  Or maybe a
Compiler Options?

There are multiple levels of stack protector, not to mention other
options such as trivial-auto-var-init that we want in due course.


>  endmenu
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index b279b09bfb..a9f2d05476 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -45,6 +45,7 @@ obj-y += shutdown.o
>  obj-y += softirq.o
>  obj-y += smp.o
>  obj-y += spinlock.o
> +obj-$(CONFIG_STACK_PROTECTOR) += stack_protector.o
>  obj-y += stop_machine.o
>  obj-y += symbols.o
>  obj-y += tasklet.o
> diff --git a/xen/common/stack_protector.c b/xen/common/stack_protector.c
> new file mode 100644
> index 0000000000..de7c20f682
> --- /dev/null
> +++ b/xen/common/stack_protector.c

stack-protector.c please.

> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <xen/lib.h>
> +#include <xen/random.h>
> +
> +#ifndef CONFIG_X86
> +/*
> + * GCC uses TLS to store stack canary value on x86.
> + * All other platforms use this global variable.
> + */
> +unsigned long __stack_chk_guard;
> +#endif

Don't bother excluding x86 like this.  Leave that to whomever adds x86
support.

Especially as the global form is the only one we're liable to want to
introduce in the first place.

> +
> +void __stack_chk_fail(void)
> +{
> +	panic("Detected stack corruption\n");
> +}

Xen style, not Linux please.


> diff --git a/xen/include/xen/stack_protector.h b/xen/include/xen/stack_protector.h
> new file mode 100644
> index 0000000000..97f1eb5ac0
> --- /dev/null
> +++ b/xen/include/xen/stack_protector.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN__STACK_PROTECTOR_H
> +#define XEN__STACK_PROTECTOR_H
> +
> +#ifdef CONFIG_STACKPROTECTOR
> +
> +#ifndef CONFIG_X86
> +extern unsigned long __stack_chk_guard;
> +#endif
> +
> +/*
> + * This function should be always inlined. Also it should be called
> + * from a function that never returns.
> + */
> +static inline void boot_stack_chk_guard_setup(void)

You must use always_inline if you need it to be always inline.

But, the rest of the comment isn't entirely accurate.  It can also be
from a function with stack-protector disabled.

But the best option is to initialise __stack_chk_guard from asm before
calling into C.

~Andrew

