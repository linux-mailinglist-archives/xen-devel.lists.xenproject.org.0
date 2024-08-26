Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FE195EFFD
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 13:41:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783421.1192753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siY4y-0000Vr-Kq; Mon, 26 Aug 2024 11:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783421.1192753; Mon, 26 Aug 2024 11:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siY4y-0000T3-Hq; Mon, 26 Aug 2024 11:40:12 +0000
Received: by outflank-mailman (input) for mailman id 783421;
 Mon, 26 Aug 2024 11:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siY4x-0000Nl-JG
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 11:40:11 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eed4d4f6-639f-11ef-8776-851b0ebba9a2;
 Mon, 26 Aug 2024 13:40:03 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5bed0a2ae0fso5201315a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Aug 2024 04:40:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0515ab2f1sm5433696a12.97.2024.08.26.04.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 04:40:02 -0700 (PDT)
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
X-Inumbo-ID: eed4d4f6-639f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724672402; x=1725277202; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KUipUyunrK4D+X9IuF93LnSIGw4leY+HQ/GTbuO5DNk=;
        b=UFfKxbyn7C8wR0X7rPy4L9kx3XDssflw5AukUN4FlkpOBKGlhMHtAnsWb3lfs0Bozm
         R3AxGjYPvfF3JMRTY8NmwcaF9/ut7d+gj7Tol78irg3GgnGA3/FF7xlnNDvUqS/m/KuO
         O86WvrPNr/gL/dbqzr2j+/y12vnTGHMDEKyc0J6mmsdetwFORhvhzNRoZ4CIM/x066PI
         oMLIq5YvwwwMfA7xEocSGNeMOKguTjPLtmSdedl2WaWtv4Kr6gCor9msxDybR/1RfS+z
         sfEAs1UefrIbwPuYStgy/vqFgJHLY981Iw7MBe3QSj+kuIYhhWdaElywgKe9nCPtQof9
         0dnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724672402; x=1725277202;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUipUyunrK4D+X9IuF93LnSIGw4leY+HQ/GTbuO5DNk=;
        b=wnM7bFzRqsT55QtEuTHbXnZGbwDOikaMIErMSzmiIjZuSOT/L+yqDOTvGEu42kAaTV
         oKrRRO7Zroq1etDtx6s524oThUgIlfBF4+Xqjo1Ilu2cbLLa1WkRxJckLS3ej/HrylHM
         FmFWx4QKbT+dr8rzJZQGBdZa/i7k6l5pHR1cegH3rdDcX0xMcIqO8OVx3BzOkKypWMth
         GRKYylzroatYie55wuPF3QP3/2TbkFpLmWY6wWfUtLqbVoZGZXA8IpMQAdH8Ph7Ii9qf
         br2bYeud7hSP2yp38ZljqTBv0lExxiNY8MDuNRFk/awm7BhyVfoWOHtMOr5azlmuBOs8
         bWyg==
X-Forwarded-Encrypted: i=1; AJvYcCXMt8BSvWbViuXZtrxogGEsDUONBEOCz0qQ5xx5QBt3ZwkX6EQefu1A2P+a8EQsXqIFsJ28OaF7zb4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBlhHOu+qsW2Oq5fm1tqC3jRo7fUv+YRiS84fj2gbDgqb13IUm
	3EEmv/wMAA5BlT9D+xDnpbcMDTJ1K8IhcykBcbDB5VyKHR2qzC2Zl0GeyyL20Q==
X-Google-Smtp-Source: AGHT+IHMGfY0itxQ5wB3Q77TcuQ+GOBqZfcMkWtRiFhO5SvUpkRayxLvVYCAi3XC79L/QjSk6fftqg==
X-Received: by 2002:a05:6402:3894:b0:57d:12c3:eca6 with SMTP id 4fb4d7f45d1cf-5c089174241mr6180473a12.18.1724672402321;
        Mon, 26 Aug 2024 04:40:02 -0700 (PDT)
Message-ID: <14c385ce-c61d-48e3-aa09-7b450af34b6c@suse.com>
Date: Mon, 26 Aug 2024 13:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] xen/bitops: Introduce generic_hweightl() and
 hweightl()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240822230635.954557-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.08.2024 01:06, Andrew Cooper wrote:
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -35,6 +35,12 @@ extern void __bitop_bad_size(void);
 unsigned int __pure generic_ffsl(unsigned long x);
 unsigned int __pure generic_flsl(unsigned long x);
 
> +/*
> + * Hamming Weight, also called Population Count.  Returns the number of set
> + * bits in @x.
> + */
> +unsigned int __pure generic_hweightl(unsigned long x);

Aren't this and ...

> @@ -284,6 +290,18 @@ static always_inline __pure unsigned int fls64(uint64_t x)
>          (_v & (_v - 1)) != 0;                   \
>      })
>  
> +static always_inline __pure unsigned int hweightl(unsigned long x)

... this even __attribute_const__?

> +{
> +    if ( __builtin_constant_p(x) )
> +        return __builtin_popcountl(x);

How certain are you that compilers (even old ones) will reliably fold
constant expressions here, and never emit a libgcc call instead? The
conditions look to be more tight than just __builtin_constant_p(); a
pretty absurd example:

unsigned ltest(void) {
    return __builtin_constant_p("") ? __builtin_popcountl((unsigned long)"") : ~0;
}

> --- /dev/null
> +++ b/xen/lib/generic-hweightl.c
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/bitops.h>
> +#include <xen/init.h>
> +#include <xen/self-tests.h>
> +
> +/* Mask value @b broadcast to every byte in a long */
> +#if BITS_PER_LONG == 32
> +# define MASK(b) ((b) * 0x01010101UL)
> +#elif BITS_PER_LONG == 64
> +# define MASK(b) ((b) * 0x0101010101010101UL)
> +#else
> +# error Extend me please
> +#endif
> +
> +unsigned int generic_hweightl(unsigned long x)
> +{
> +    x -= (x >> 1) & MASK(0x55);
> +    x =  (x & MASK(0x33)) + ((x >> 2) & MASK(0x33));
> +    x =  (x + (x >> 4)) & MASK(0x0f);
> +
> +    if ( IS_ENABLED(CONFIG_HAS_FAST_MULTIPLY) )
> +        return (x * MASK(0x01)) >> (BITS_PER_LONG - 8);

I realize it's nitpicking, yet especially this use isn't really "mask"-
like. Could I talk you into naming the macro e.g. BCST()?

> +    x += x >> 8;
> +    x += x >> 16;
> +#if BITS_PER_LONG > 32
> +    x += x >> 32;
> +#endif
> +
> +    return x & 0xff;
> +}

Perhaps #undef MASK here, or else ...

> +#ifdef CONFIG_SELF_TESTS
> +static void __init __constructor test_generic_hweightl(void)
> +{
> +    RUNTIME_CHECK(generic_hweightl, 0, 0);
> +    RUNTIME_CHECK(generic_hweightl, 1, 1);
> +    RUNTIME_CHECK(generic_hweightl, 3, 2);
> +    RUNTIME_CHECK(generic_hweightl, 7, 3);
> +    RUNTIME_CHECK(generic_hweightl, 0xff, 8);
> +
> +    RUNTIME_CHECK(generic_hweightl, 1 | (1UL << (BITS_PER_LONG - 1)), 2);
> +    RUNTIME_CHECK(generic_hweightl, -1UL, BITS_PER_LONG);
> +}

... actually use it some here, to have a few more cases?

Jan

