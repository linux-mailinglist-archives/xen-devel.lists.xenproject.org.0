Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA3487BEAC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 15:16:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693271.1081150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklsZ-0007BF-NM; Thu, 14 Mar 2024 14:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693271.1081150; Thu, 14 Mar 2024 14:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklsZ-00078i-Kh; Thu, 14 Mar 2024 14:16:19 +0000
Received: by outflank-mailman (input) for mailman id 693271;
 Thu, 14 Mar 2024 14:16:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rklsY-00078c-9Z
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 14:16:18 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b4b14a6-e20d-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 15:16:16 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a466381b411so118311966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 07:16:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qs28-20020a170906459c00b00a4550e8ae70sm755944ejc.63.2024.03.14.07.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 07:16:15 -0700 (PDT)
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
X-Inumbo-ID: 6b4b14a6-e20d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710425775; x=1711030575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=imitLls3Iml+yz8NLBOmoFjmf4ds0peculVdTuXhQEM=;
        b=ELyDaQV7WnXRMiIAaLCKyHVQMwMKd625lrp5ZqV07WkLf0i2BdVd4v8EQ3jGjGfwH8
         kXzeTzWVFLKj+ocSiFgR4bos/yJq/7EhinjeOYQmkd0t+GmLUEpUoDjhq4aOsQ9YIT6r
         +6gM0X2FDYwvz50b5HI9qFQN63OZEXBIR7cT2VAxh84NCIKsm73NZC0R6NzishbvrOh9
         aY7MkedrhGln+kgM6BlATpUdZUlFJ/YAxkSzeF8WcXuVK1sd8fUQbpOTZaZDJ5oiXn44
         PabZzf16W+BDUcqZlHBIXYKr02EYX3WxSTmGBhj6FNpFOzjtqd0mPrbb6ixfIY4kR1nl
         NOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710425775; x=1711030575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=imitLls3Iml+yz8NLBOmoFjmf4ds0peculVdTuXhQEM=;
        b=GQGt0OYln8ONs+OY+MEeaRDpGiWEZrHutG7xGYbXK8Lf90KiahJeHRwnRUpETVBw0q
         Noy9oQE5ltKKBDIJjuZhA2FD20TSxusFWKxuXUu78/EE/QTkZvXcZnvk4wSQGN/wD0W8
         xDkuTO9IQw+t7GvEd95N5zjfXuDQPdXtRIFagM+yVTp4CKEwUfk145pxAwUF4t0ur3xh
         rBNRTh0sfIoT3KYKMDMzLLB3bK82z2qFwgqn5ZRBHrBBAb7Z4bJjjq5QtS7OFtrQXjVP
         muDLYOhLtQLlNFAdnfqlyCxWBWvdq4rJVNwuu49YA11LwX37L72JIjum/LGPkYUmPKfE
         IN8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqlBbuAzaslhfVbRbyIPgXOBocyVJK764HteivROle15B5a73RnXQOpTcmsns+i6fXiHDlzz5pwYfYBoLVGiiAx2S4e7NuIrapUmwKOAU=
X-Gm-Message-State: AOJu0YwJITsH2LUfGCgzWUnL9nUNIZm0ouBSIr8w+b5ZtQI7PWek67pG
	ghdKAz9BKNQfoUqINOJ9Qw8RvRbyzWMf5cGtY0ypDOZsO5ZWznJvExbwEOJJtg==
X-Google-Smtp-Source: AGHT+IGsvL/wr3RjqyuVvH5rKRhKBzNE1OlHkuczQufEM5OD/OAhhclESnIszZUBkH6kRwORALOONA==
X-Received: by 2002:a17:906:6899:b0:a44:7bbe:d774 with SMTP id n25-20020a170906689900b00a447bbed774mr759918ejr.9.1710425775394;
        Thu, 14 Mar 2024 07:16:15 -0700 (PDT)
Message-ID: <76a1e81d-86d1-438c-975e-c4db46af93ee@suse.com>
Date: Thu, 14 Mar 2024 15:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] xen/bitops: Implement ffs() in common logic
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <20240313172716.2325427-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240313172716.2325427-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 18:27, Andrew Cooper wrote:
> --- a/xen/arch/arm/include/asm/bitops.h
> +++ b/xen/arch/arm/include/asm/bitops.h
> @@ -157,7 +157,7 @@ static inline int fls(unsigned int x)
>  }
>  
>  
> -#define ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
> +#define arch_ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })

The way the macro is invoked, I don't think the helper local variable
is then needed anymore?

> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -430,16 +430,23 @@ static inline int ffsl(unsigned long x)
>      return (int)r+1;
>  }
>  
> -static inline int ffs(unsigned int x)
> +static inline unsigned int arch_ffs(unsigned int x)
>  {
> -    int r;
> +    int r = -1;
> +
> +    /*
> +     * The AMD manual states that BSF won't modify the destination register if
> +     * x=0.  The Intel manual states that the result is undefined, but the
> +     * architects have said that the register is written back with it's old
> +     * value, possibly zero extended above 32 bits.
> +     */
> +    asm ( "bsf %[val], %[res]"
> +          : [res] "+r" (r)
> +          : [val] "rm" (x) );

And this isn't what the compiler would be doing anyway?

Also, just to mention it: I take it that you/we are sure that disallowing
both operands to be the same register is still better than ...

> -    asm ( "bsf %1,%0\n\t"
> -          "jnz 1f\n\t"
> -          "mov $-1,%0\n"
> -          "1:" : "=r" (r) : "rm" (x));

... the original form?

> --- a/xen/common/bitops.c
> +++ b/xen/common/bitops.c
> @@ -34,8 +34,18 @@
>          RUNTIME_CHECK(fn, val, res);            \
>      } while ( 0 )
>  
> +static void test_ffs(void)

Nit: __init please, even if there ought to be no reason for the compiler
to not inline this function.

> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -110,6 +110,21 @@ static inline int generic_flsl(unsigned long x)
>  
>  #include <asm/bitops.h>
>  
> +/*
> + * Find First Set bit.  Bits are labelled from 1.
> + */
> +static always_inline __pure unsigned int ffs(unsigned int x)

Why always_inline?

> +{
> +    if ( __builtin_constant_p(x) )
> +        return __builtin_ffs(x);
> +
> +#ifndef arch_ffs
> +#define arch_ffs __builtin_ffs
> +#endif
> +
> +    return arch_ffs(x);
> +}

Just to mention it: __builtin_ffs() takes and returns plain int. I'm
happy about our own helper being unsigned-correct, but anything like
this has a Misra angle too.

Jan

