Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536798CFB4A
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 10:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730632.1135769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBVeY-0007qm-4Q; Mon, 27 May 2024 08:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730632.1135769; Mon, 27 May 2024 08:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBVeY-0007oi-0y; Mon, 27 May 2024 08:24:22 +0000
Received: by outflank-mailman (input) for mailman id 730632;
 Mon, 27 May 2024 08:24:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBVeW-0007oc-9M
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 08:24:20 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82aa0e91-1c02-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 10:24:18 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57864327f6eso3282063a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 01:24:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57860a2eab3sm4401359a12.28.2024.05.27.01.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 01:24:17 -0700 (PDT)
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
X-Inumbo-ID: 82aa0e91-1c02-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716798257; x=1717403057; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BaTlOnCaTA/1XHNDwnVyAuCDZhHsZEyVzojdDKal27s=;
        b=XxdvfbM28j5EisTjHpqxQfQfSflHXClW7ikd9KKZ0XuXsc4c4I6iLoVGlDAR7zFOiO
         r9bWslAXRosyWiHkp1Avj+YERK5ZOmmzjEvKU0nQ1GJjs02hzJQTZrTg2tK1eeWebCN/
         FrtPXKeb704iKWXbRK7lzPh+7hwCMrpjEGvnqiMhmkFeSdu2VmIpidssSpVfPhf5/yaY
         2NRHkzZjeNVRfdXhW8R4JpODAe4zoMVPM5AbIDAPm1GSpNZz0XOBrQmqkulEn0Dqy9zh
         nPCVrnXALtFm86Q1kGzlA9ZAYjiojcLU+cWa+MebKcDG6Vq+UCLpamI5fsxXX/T3Dfyc
         iNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716798257; x=1717403057;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BaTlOnCaTA/1XHNDwnVyAuCDZhHsZEyVzojdDKal27s=;
        b=KumRrXNYV6O09uz2YxqKROy0l/achY3NLCM19uXRT5lZGFtMqjSLogqoPZPZpRxh0O
         AqCL6chS3GykoBn/6eUwEb+H/sF/zUE1EI7LHA4wD5EM0FjnOrh+QqawzYy4YOsUbc+Y
         dsmKu0I0LzcwXThGRXzMuYpbACaUiDP2pInYCjKHA8r38FxSb3MYr6VnWqrB0NS4eGtm
         NU+SPlsaEDtNI50/yS2flWW4VooMCXWsEBUxvCu3Pbv9Q2RrBwHJ2KY7Wct+KLsv/8p5
         2yTmV1lpVYrQQwYH8lYkhJOrApAC9xz1uXDPP0BnmxE48OT2Z25FZkNdpA8bO8SXvHpn
         d+hQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0oUpcyA4FtL+IqJGjC2H7C+6pYhdiTry6Nt9s7RLwsk/zri7C9kR26kLAKZWCgLQ+gwkVYtCst85WHRP2J5mliUy0dMB+7wksyPqUENM=
X-Gm-Message-State: AOJu0Yw7d4SkP/V08m6vnEjaTj4EppXTWHLIwHwRpjQeLLpl744K08NI
	BiEc371i3SlLmUVU/VVZyt7Yvf0Sc5CQ1XhN8CYoPFqC+nQ6QTwX9dOdBT+LZA==
X-Google-Smtp-Source: AGHT+IGgnmxEyutQ0DzAbAPiRUjk+mU6UIbJa0hcLR8dIaVnTVUrpe34xgvjHGLwUjoZB/2FFfcHyg==
X-Received: by 2002:a50:8d4c:0:b0:572:3fac:e085 with SMTP id 4fb4d7f45d1cf-57843f1589fmr10741572a12.13.1716798257439;
        Mon, 27 May 2024 01:24:17 -0700 (PDT)
Message-ID: <c70f769b-57b9-4f71-9c31-8052b773d28a@suse.com>
Date: Mon, 27 May 2024 10:24:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] xen/bitops: Cleanup ahead of rearrangements
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
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240524200338.1232391-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 22:03, Andrew Cooper wrote:
>  * Rename __attribute_pure__ to just __pure before it gains users.
>  * Introduce __constructor which is going to be used in lib/, and is
>    unconditionally cf_check.
>  * Identify the areas of xen/bitops.h which are a mess.
>  * Introduce xen/boot-check.h as helpers for compile and boot time testing.
>    This provides a statement of the ABI, and a confirmation that arch-specific
>    implementations behave as expected.
> 
> Sadly Clang 7 and older isn't happy with the compile time checks.  Skip them,
> and just rely on the runtime checks.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Further remarks, though:

> ---
>  xen/include/xen/bitops.h     | 13 ++++++--
>  xen/include/xen/boot-check.h | 60 ++++++++++++++++++++++++++++++++++++
>  xen/include/xen/compiler.h   |  3 +-
>  3 files changed, 72 insertions(+), 4 deletions(-)
>  create mode 100644 xen/include/xen/boot-check.h

The bulk of the changes isn't about bitops; it's just that you're intending
to first use it for testing there. The subject prefix therefore is somewhat
misleading.

> --- /dev/null
> +++ b/xen/include/xen/boot-check.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +/*
> + * Helpers for boot-time checks of basic logic, including confirming that
> + * examples which should be calculated by the compiler are.
> + */
> +#ifndef XEN_BOOT_CHECK_H
> +#define XEN_BOOT_CHECK_H
> +
> +#include <xen/lib.h>
> +
> +/* Hide a value from the optimiser. */
> +#define HIDE(x)                                                         \
> +    ({ typeof(x) _x = (x); asm volatile ( "" : "+r" (_x) ); _x; })

In principle this is a macro that could be of use elsewhere. That's also
reflected in its entirely generic name. It therefore feels mis-placed in
this header. Otoh though the use of "+r" is more restricting than truly
necessary: While I'm not sure if "+g" would work, i.e. if that wouldn't
cause issues with literals, pretty surely "+rm" ought to work, removing
the strict requirement for the compiler to put a certain value in a
register.

Assuming you may have reservations against "+g" / "+rm" (and hence the
construct wants keeping here), maybe rename to e.g. BOOT_CHECK_HIDE()?
Alternatively, if generalized, moving to xen/macros.h would seem
appropriate to me.

Finally, plainly as a remark with no request for any change (but
possibly a minor argument against moving to xen/macros.h), this construct
won't, afaict, work if x is of array(-of-const) type. A more specialized
variant may need introducing, should any such use ever appear.

Jan

