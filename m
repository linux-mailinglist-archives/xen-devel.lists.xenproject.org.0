Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2669791807D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 14:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748787.1156646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMRNT-0002kT-KC; Wed, 26 Jun 2024 12:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748787.1156646; Wed, 26 Jun 2024 12:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMRNT-0002i8-HU; Wed, 26 Jun 2024 12:03:55 +0000
Received: by outflank-mailman (input) for mailman id 748787;
 Wed, 26 Jun 2024 12:03:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMRNS-0002i2-ME
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 12:03:54 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26e4528e-33b4-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 14:03:51 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ec6635aa43so27840571fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 05:03:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fa36cc1d10sm59153625ad.305.2024.06.26.05.03.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 05:03:48 -0700 (PDT)
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
X-Inumbo-ID: 26e4528e-33b4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719403431; x=1720008231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tZO/76Y9olr8ovq6vNDsmdXHtHSiBbUHFWBc3FZmZwE=;
        b=NZMP5rE35rQuT6BxYD5YqTGKPG2A1SMO4VFd19vRSBnD5xNFXGxi0lfK4DVbDU8fCB
         7SSj3hjSNKUiKXoru2FR7f419MN6W+im/71KKojGYL0cZGVx9T8qfq/u5I/8Gci906b6
         89pUrCo1YZTHmjJN5Bt30QYA39pev/D9UpU8OZo43gyhFB6G2iKDmkDiOTeGlQi0zMma
         p7g++LlgGx4G9nV66BadmzfLl5pKZjSQkIPz/SSMag3fs1yXY4Z4uRtADw3Y/KfUQfhR
         17ikA74qNehab05VmdIhu14ceLBRO4+E4aDvzjRL3/myaxSVgP1RPQ72MHkI9JoHi9Ql
         mywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719403431; x=1720008231;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZO/76Y9olr8ovq6vNDsmdXHtHSiBbUHFWBc3FZmZwE=;
        b=lpKe57WIGQ0o0ennuRXA3GZLiW5j7ma2mUr2DU4fZfLZOUW7OWvucQfp4CfFuHj/IN
         k7pEkSiw1kQEC7GCvdRTsoPAEu4Y6eBA5bJ6uScUmPcUfWfqYDD0zA6FoXSr6l9gzL7g
         kbDoS8aRuL7ohmtyJ1E9K3oivyvFNeDDzBJxm64q7fUNZpbH1Qe2vql/puEZNfra+Cuu
         ygVBpr1M4arZZrUSMCbAxBgaAmFgzaJvmYv1U7AMZZPFMVKI1addnXqk1UXUJ0SIChsl
         etrvQcfVF2c2xybSYFDfz7KLqO015Pt4i9Csh9Bu13J5uUiDaeQmciUhzdKM9ntDQrhe
         Wrug==
X-Forwarded-Encrypted: i=1; AJvYcCWzMEKWkuXOFfUHlcWp43STEWSa7Xu05P+UKRv/XoebBUdpvqIzdsrehbkX1Ll87WR9KdqZRxhbM/kksWvl9MVwDHd937pqiIIo3OeCb+U=
X-Gm-Message-State: AOJu0YwXBYR8623+n5tHq9e9E4FVQli+79nl4AasCgbwS9cN9iF6L6tZ
	B0O8ysI77s+8s2wri01DGMYVKw4mzft3bOy9866CqI8b78o7zhVQWq4KjPwIjA==
X-Google-Smtp-Source: AGHT+IGko7qA0T0N3eT81HLLZG6/J2IJOHMPen0/SwFxmLKYCReQrqzjm8nIAStrCodP/Ipe+cKWMw==
X-Received: by 2002:a2e:874f:0:b0:2ec:55fd:f118 with SMTP id 38308e7fff4ca-2ec57967b67mr65020081fa.1.1719403429701;
        Wed, 26 Jun 2024 05:03:49 -0700 (PDT)
Message-ID: <38c35f34-a55c-4647-874e-9d88fa899a58@suse.com>
Date: Wed, 26 Jun 2024 14:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] xen/bitops: Introduce for_each_set_bit()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
 <20240625190719.788643-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240625190719.788643-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 21:07, Andrew Cooper wrote:
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -56,6 +56,16 @@ static always_inline __pure unsigned int ffs64(uint64_t x)
>          return !x || (uint32_t)x ? ffs(x) : ffs(x >> 32) + 32;
>  }
>  
> +/*
> + * A type-generic ffs() which picks the appropriate ffs{,l,64}() based on it's
> + * argument.
> + */
> +#define ffs_g(x)                                        \
> +    sizeof(x) <= sizeof(int) ? ffs(x) :                 \
> +        sizeof(x) <= sizeof(long) ? ffsl(x) :           \
> +        sizeof(x) <= sizeof(uint64_t) ? ffs64(x) :      \
> +        ({ BUILD_ERROR("ffs_g() Bad input type"); 0; })

I guess the lack of parentheses around the entire construct might be the
reason for the problems you're seeing, as that ...

> @@ -92,6 +102,20 @@ static always_inline __pure unsigned int fls64(uint64_t x)
>      }
>  }
>  
> +/*
> + * for_each_set_bit() - Iterate over all set bits in a scalar value.
> + *
> + * @iter An iterator name.  Scoped is within the loop only.
> + * @val  A scalar value to iterate over.
> + *
> + * A copy of @val is taken internally.
> + */
> +#define for_each_set_bit(iter, val)                     \
> +    for ( typeof(val) __v = (val); __v; )               \
> +        for ( unsigned int (iter);                      \
> +              __v && ((iter) = ffs_g(__v) - 1, true);   \

... affects what effect the "- 1" here has.

Jan

