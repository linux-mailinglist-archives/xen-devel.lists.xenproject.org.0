Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B3B9648A8
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 16:37:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785940.1195484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjgGk-00067v-4C; Thu, 29 Aug 2024 14:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785940.1195484; Thu, 29 Aug 2024 14:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjgGk-00066B-0o; Thu, 29 Aug 2024 14:37:02 +0000
Received: by outflank-mailman (input) for mailman id 785940;
 Thu, 29 Aug 2024 14:37:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjgGi-000665-Uw
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 14:37:00 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 255e78e0-6614-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 16:36:58 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5becd359800so827312a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 07:36:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c7304fsm767642a12.29.2024.08.29.07.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 07:36:57 -0700 (PDT)
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
X-Inumbo-ID: 255e78e0-6614-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724942218; x=1725547018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vx31+ZcZhCXIra5jHzn5w+458vRmv7WDBiTjEo5e6sM=;
        b=VF/Nu6dU0eC23PKq1fljE130q1tLk0yAcbyv+sTxLekdC4OPKj/759Mc2Y3oEh78vL
         mRLe7No7naWsxuW0OxKSFguXY/hnvR7jX8XpxECciemuTTZCfWkbDdz3sCtViAkiYksa
         tpenH3IDz3JdAyNVr+i7hmrwV4UHtD/hA2W8td20KuQW5cTW7Xi7TehNLxN9S/EXn8DU
         03OmvXHKLV4lXMR00qKhwA8mKOpm71WKMCqTutR3mVFLcwkaelSpPb8F01tSBML4J1+Q
         ZOqECGJCcpJ2HVP3D/ox0noGj/JOnZG2N+ug9zxA1MyfF7G3IaPNvLUpZ229/rNda2r1
         wLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724942218; x=1725547018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vx31+ZcZhCXIra5jHzn5w+458vRmv7WDBiTjEo5e6sM=;
        b=oK3PY0CI64baOnUpPzuoLehUpE+YqWTMvFMOuAO1zOQnlnMxvKUGRa7VYt23GK/G5Q
         mluZ4VXAa8kIrAUtH7k2LbeXXTdTpSqjpRBWBhoPuRdNLXynsEodN8Tg5ovfmqnULKNc
         TyV5+wmOPs3fdPtx8vs3npdSKSjW4CshrYX5RhTLNuvxAea62RoKbhe+3GZixNJr1oof
         hL+SQRML7m8juqfVuDzMqhY5mxL5Hvvfe/iL36rxRvEqS7lUlkE9NQTMzBtjOMVAn9Pi
         LNqeYUwxLAHrqcoDmVypWRdstLkrttyRiIscF5RyEJfegVUM4PKgJ+OFBoIaDoKgB7rG
         kY8g==
X-Forwarded-Encrypted: i=1; AJvYcCUMFtlYTPDcxmSpk3tHSm3hcpcTlYuEw76TohlVnIR6cp0CIG/At2yxhytp6kobBxA0tn+0pVRS8KU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziuxYfGx7XMf7OrcXmjavfmf5H0EPDP+0dnlwY5MvjNMbexQ95
	5uTSZbEmQu7zJNPAvQ2uODpWobpyy3aDywUUfJilFqDxV2KodbsXXD6hJgpkXw==
X-Google-Smtp-Source: AGHT+IFFi3B8ot9bFyw+6VkEBpYUQlN0J2uZ8nVRvjIoQVenmJ3o+cpwMGoMVKHZUV3399eO27NgDA==
X-Received: by 2002:a05:6402:84b:b0:5c0:c6a7:bd24 with SMTP id 4fb4d7f45d1cf-5c21ed976d1mr3012681a12.30.1724942217883;
        Thu, 29 Aug 2024 07:36:57 -0700 (PDT)
Message-ID: <48377e77-2458-439c-b594-21bde610ffbb@suse.com>
Date: Thu, 29 Aug 2024 16:36:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] x86/bitops: Use the POPCNT instruction when
 available
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
 <20240828220351.2686408-12-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240828220351.2686408-12-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.08.2024 00:03, Andrew Cooper wrote:
> It has existed in x86 CPUs since 2008, so we're only 16 years late adding
> support.  With all the other scafolding in place, implement arch_hweightl()
> for x86.
> 
> The only complication is that the call to arch_generic_hweightl() is behind
> the compilers back.  Address this by writing it in ASM and ensure that it
> preserves all registers.
> 
> Copy the code generation from generic_hweightl().  It's not a complicated
> algorithm, and is easy to regenerate if needs be, but cover it with the same
> unit tests as test_generic_hweightl() just for piece of mind.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> v2:
>  * Fix MISRA 8.2 (parameter name) and 8.5 (single declaration) regressions.
>  * Rename {arch->x86}-generic-hweightl.{S->c}
>  * Adjust ASM formating
> 
> The __constructor trick to cause any reference to $foo() to pull in
> test_$foo() only works when both are in the same TU.  i.e. what I did in
> v1 (putting test_arch_generic_hweightl() in the regular generic-hweightl.c)
> didn't work.

I'm afraid I don't understand this. What exactly didn't work, breaking in which
way? Presumably as much as you, I don't really like the global asm() in a C
file, when ideally the same could be written with less clutter in an assembly
one.

> This in turn means that arch_generic_hweightl() needs writing in a global asm
> block, and also that we can't use FUNC()/END().  While we could adjust it to
> work for GCC/binutils, we can't have CPP macros in Clang-IAS strings.

What does Clang different from gcc there? I was hoping that at least their pre-
processors would work in (sufficiently) similar ways.

> --- /dev/null
> +++ b/xen/lib/x86-generic-hweightl.c
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/bitops.h>
> +#include <xen/init.h>
> +#include <xen/self-tests.h>
> +
> +/*
> + * An implementation of generic_hweightl() used on hardware without the POPCNT
> + * instruction.
> + *
> + * This function is called from within an ALTERNATIVE in arch_hweightl().
> + * i.e. behind the back of the compiler.  Therefore all registers are callee
> + * preserved.
> + *
> + * The ASM is what GCC-12 emits for generic_hweightl() in a release build of
> + * Xen, with spilling of %rdi/%rdx to preserve the callers registers.
> + *
> + * Note: When we can use __attribute__((no_caller_saved_registers))
> + *       unconditionally (GCC 7, Clang 5), we can implement this in plain C.
> + */
> +asm (
> +    ".type arch_generic_hweightl, STT_FUNC\n\t"
> +    ".globl arch_generic_hweightl\n\t"
> +    ".hidden arch_generic_hweightl\n\t"
> +    ".balign " STR(CONFIG_FUNCTION_ALIGNMENT) ", 0x90\n\t"

Maybe better avoid open-coding CODE_FILL, in case we want to change that
down the road?

Also could I talk you into dropping the \t there? Canonical assembly code
wants ...

> +    "arch_generic_hweightl:\n\t"

.. labels unindented.

Jan

