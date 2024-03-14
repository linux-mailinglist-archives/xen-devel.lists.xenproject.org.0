Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A44987BE31
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 14:59:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693262.1081131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklc6-0002m6-96; Thu, 14 Mar 2024 13:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693262.1081131; Thu, 14 Mar 2024 13:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklc6-0002ka-5p; Thu, 14 Mar 2024 13:59:18 +0000
Received: by outflank-mailman (input) for mailman id 693262;
 Thu, 14 Mar 2024 13:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rklc4-0002kB-Lv
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 13:59:16 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b3253bb-e20b-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 14:59:15 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a44ad785a44so110491566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 06:59:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v23-20020a1709067d9700b00a4663a7120asm732563ejo.166.2024.03.14.06.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 06:59:14 -0700 (PDT)
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
X-Inumbo-ID: 0b3253bb-e20b-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710424755; x=1711029555; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PTZHmdbshlGJsjltfROdPt/9dSDQ3SNpaFHQiXFxfzU=;
        b=EDLvOM/TGWtj1QeRg9UISkzkAgfcHAH/Dw9PpMbVgoQJgOH+1kvD/hYp0gvRJB3VNZ
         Wro1LWtk/Tlmve3Y7vHInBX3B2U2uU4HiOYWr1edIfnYmHula9NzNvnwmGCuhszxa8C/
         01fA3pveoYW1lTCuw8XYK++i76neXFNNUbB1V2sSyEqDjZn9WRzEXN/LEtlYO+EyZTqt
         dCq9EifE0yYBRFL7mOP/b3acpKrL3Ivlk47dfK6ykvzS32UuoQRRDn317ps8PokRtMH5
         USZzaDDAcJZasEYUMbLFB/j/w913liphW55ouAqsAZMMp3PMk9gHJ3l6xLmAuBdQA9y8
         555g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710424755; x=1711029555;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTZHmdbshlGJsjltfROdPt/9dSDQ3SNpaFHQiXFxfzU=;
        b=hHfIsG1lH65YvWWupjW+W5lmgrL/MCcgPcvVliYdeDNGCkTz5QpdF8QJAoOZFNf6YO
         KV3+Wbw5HjnfhE7RK1ha0Aaz6NvjaksCrkgsFTHF4kCAbTITkEC9XPsM28GAZ3Igbehl
         YQ2sa2jW0wF40bf/ygA+NxhfewcdSYkCP5YV7jIcvxr/7k2bX+H1B9LzBlecUXPmchx7
         h99nSjjDVOFqS5HA3Eo3vqecBtS2LJouXIqJ/cml4CHegQBzsywoJy1LRrGaI2BBdzda
         wRQOvZY3AzCdmiloS6Dnc45WZ0UeVEYuvQfnbpHynK0+taCprxe99/poGjkdMFNWVtIy
         Wj8g==
X-Forwarded-Encrypted: i=1; AJvYcCWompE1cLW4v0DrFiunS5bU15uCz4iukSJCb1LpzkADPswjIKLiSM8bpVx7/PJccjrdcqzquPTSdDjXqAnHyvKG1dzNZ//aCEYdYAadVug=
X-Gm-Message-State: AOJu0YxfYwCfEdpF5EM1e0bJtF2HDSxn4iEN9Nol7+zDsf2Uxpz83HBD
	J4tmQ/Ep1/8VHpiocR79nBByWv/JnUTtjPJvccyBZ5T25ZzzcaxUme3ZHza+hg==
X-Google-Smtp-Source: AGHT+IGdSMmJxR7r40xC+jIBEfDp5KWLTkBsjfq30vkny9N2IIt1A4cHNyuBVGz7OlYqEGT66nGrlg==
X-Received: by 2002:a17:907:cbc8:b0:a46:2772:de9b with SMTP id vk8-20020a170907cbc800b00a462772de9bmr645749ejc.22.1710424755139;
        Thu, 14 Mar 2024 06:59:15 -0700 (PDT)
Message-ID: <141bc66c-79f4-474e-8421-34f9aaa2d47c@suse.com>
Date: Thu, 14 Mar 2024 14:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] xen/bitops: Cleanup ahead of rearrangements
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
 <20240313172716.2325427-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240313172716.2325427-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 18:27, Andrew Cooper wrote:
>  * Rename __attribute_pure__ to just __pure before it gains users.
>  * Identify the areas of xen/bitops.h which are a mess.
>  * Create common/bitops.c for compile and runtime testing.  This provides a
>    statement of the ABI, and a confirmation that arch-specific implementations
>    behave as expected.

If this is the sole purpose of the new file, then ...

> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -1,5 +1,6 @@
>  obj-$(CONFIG_ARGO) += argo.o
>  obj-y += bitmap.o
> +obj-y += bitops.o

obj-bin-y += bitops.init.o

please.

> --- /dev/null
> +++ b/xen/common/bitops.c
> @@ -0,0 +1,41 @@
> +#include <xen/bitops.h>
> +#include <xen/bug.h>
> +#include <xen/init.h>
> +
> +/* Hide a value from the optimiser. */
> +#define HIDE(x) ({ typeof(x) _x = x; asm volatile ( "" : "+r" (_x) ); _x; })

Irrespective of the question of leading underscores, x wants parenthesizing here.

> +/*
> + * Check that fn(val) can be calcuated by the compiler, and that it gives the
> + * expected answer.
> + */
> +#define COMPILE_CHECK(fn, val, res)                                     \
> +    do {                                                                \
> +        if ( fn(val) != res )                                           \
> +            asm (".error \"Compile time check '" STR(fn(val) == res) "' failed\""); \

Nit: Blanks missing immediately inside the outermost pair of parentheses. (As
per your own reply it's unclear whether this would actually survive.)

> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -85,7 +85,8 @@
>  #define inline inline __init
>  #endif
>  
> -#define __attribute_pure__  __attribute__((__pure__))
> +#define __pure  __attribute__((__pure__))

I'd say either there be just a single padding blank or enough to align the
rhs with ...

>  #define __attribute_const__ __attribute__((__const__))
>  #define __transparent__     __attribute__((__transparent_union__))

... these.

Jan

