Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64419A6DA45
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 13:51:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925452.1328328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twhGH-0004Ki-VT; Mon, 24 Mar 2025 12:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925452.1328328; Mon, 24 Mar 2025 12:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twhGH-0004JF-S9; Mon, 24 Mar 2025 12:50:37 +0000
Received: by outflank-mailman (input) for mailman id 925452;
 Mon, 24 Mar 2025 12:50:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twhGG-0004J9-WA
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 12:50:37 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9338115c-08ae-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 13:50:34 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso29747525e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 05:50:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd9eb21sm119885595e9.32.2025.03.24.05.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 05:50:32 -0700 (PDT)
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
X-Inumbo-ID: 9338115c-08ae-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742820633; x=1743425433; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B9Zg7WBDczl8ZHbP4kS7eA4HJj/dtwCJhNUgZVS4T7Y=;
        b=Xw9SLp6O4j4hGXJY3c/JISae22Gyay5tPM6cdG9XH2r8hezK7ERF2qbKBZnwVIeejM
         WMoZk35/1R06GhgCv8f1mb0PvIIikqLKn2NEWqP5+yZV7gsLoCrnLaeV2RmfGahYOtZR
         Z+DigbQSuXEuElLUT+FKu33ciaLO2ovG9Ob6YHPc7mglCZZ4uTbktzfg6e6GO2TliucT
         x7k04C+UrpLvAbiUIjy3sepiEEM949ZTwSPMajfO7l6zhfJdlt+JxVPWuXoGf+PAve5D
         fzCiZy7jClMlXmu53tHSqivvrw1sw11Cp3+pn2Qc5k9Z42x8/7mfGotexGfOC9AAYxU2
         hNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820633; x=1743425433;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9Zg7WBDczl8ZHbP4kS7eA4HJj/dtwCJhNUgZVS4T7Y=;
        b=QlF7wRPzlnMBtavoZSf3Bi/fIIMZHVHUTi8ZTP5dhBU8loTH4rd9Ov5ErF8at5Y82+
         g356lj75OZy89IeS0FqERgxpPoSDJ9tC/8x351y5Rh/DH3AAXgMEtP602yOfmNEOQsKQ
         6floD2h2iaO54D1X8wAsCZZ2wPfbNH3t9zp6Wh3AD+j9aUKg2jBCuZM/qE9itVFtKsjl
         QW+MKLN+JKrgclbyg8agfuJPyv3uu4b5+vS4IX4s3AIZLofXJYLn5/HCL8cFRFLnjgZj
         LqI6rndTHUDDQ+selRN8tUEnY3DR2IHtbpiMO/MtWBaZfGmsqwyqymfXNuUIEZU1JtrP
         TVdg==
X-Forwarded-Encrypted: i=1; AJvYcCWqMuZwFcxSI0Ykyuh4bKDylZnRnHmvUPeNJWfxLt5rEE48+fIanQxoijVXjTYFQS0m3rbwskxKD+I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDw9c5v/LmI/7FSqtwB5fWNwWxYinmb3yC4wySnZH29Ykp9PU4
	6SNjelbo6kDTJh0o/hwnoY+qvL+bAcNXU9fwZj5+46Fh+7PgI8EcHl/vBeUsJA==
X-Gm-Gg: ASbGncsMdTrm71Tp1OCxZJ/KQNmMZMfjaC59PmmgAv7vHjyeh7RklbqBOp0P0ZXIs1o
	bKs41B+4ImI7UbPh+kiXSbrdjc8jGEV7Hnev9dnLKUX9VQ0kSUDZSwM5V6Yl95tyogKxoCwHLg4
	f0GEWGf8R65X9i2nxbZ0I/VzLsIPR9fPS9AM9jDSJhhmAvENk3dzlbdBoU46BDqaL8kbo0mntgn
	puM8thbOntB2P1mnM//8IEs9it5N7bq3VFBTTq1x6DOfrykZSwb3o/V1/GCg1GaBJUiIsRTCUEe
	vAHcS057cWyODS6CNoTk179nBeDiVls/p1f47mD5PCySDpmX8Q8FPi1tyMFIbUIRYuyUnoiY2BB
	MrkNTplyTMV0bONEMV2CFmResdVZfVA==
X-Google-Smtp-Source: AGHT+IFQ3/Mk59edNv0dfuBcv/iHehyJ4nhAkXFNlF9fB6Q8RSXa7DDbMwa8utSM7jVqqPXgGgVIpg==
X-Received: by 2002:a05:600c:3516:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-43d50a52671mr121961135e9.31.1742820633011;
        Mon, 24 Mar 2025 05:50:33 -0700 (PDT)
Message-ID: <a4231eb6-b195-4ce0-b9ca-bdf928a21fbd@suse.com>
Date: Mon, 24 Mar 2025 13:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] xen: common: add ability to enable stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250318023234.1210659-1-volodymyr_babchuk@epam.com>
 <20250318023234.1210659-2-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250318023234.1210659-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2025 03:34, Volodymyr Babchuk wrote:
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
> Stack guard value is initialized in two phases:
> 
> 1. Pre-defined randomly-selected value.
> 
> 2. Own implementation linear congruent random number generator. It
> relies on get_cycles() being available very early. If get_cycles()
> returns zero, it would leave pre-defined value from the previous
> step.
> 
> boot_stack_chk_guard_setup() is declared as inline, so it can be

It's an always-inline function, and that is so important that it should
be got right in the description as well.

> --- /dev/null
> +++ b/xen/common/stack-protector.c
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
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
> +void asmlinkage __stack_chk_fail(void)

The use of asmlinkage here comes close to an abuse: The Misra deviation is
about C code called from assembly code only. This isn't the case here; instead
it's a function that the compiler generates calls to without source code
explicitly saying so.

This imo wants approving from the Misra side as well, and even if approved
likely requires a justifying code comment.

> --- /dev/null
> +++ b/xen/include/xen/stack-protector.h
> @@ -0,0 +1,39 @@
> +#ifndef __XEN_STACK_PROTECTOR_H__
> +#define __XEN_STACK_PROTECTOR_H__
> +
> +extern unsigned long __stack_chk_guard;
> +
> +/*
> + * This function should be called from a C function that escapes stack
> + * canary tracking (by calling reset_stack_and_jump() for example).
> + */
> +static always_inline void boot_stack_chk_guard_setup(void)
> +{
> +#ifdef CONFIG_STACK_PROTECTOR
> +
> +	/*

Nit: Hard tab slipped in.

Jan

