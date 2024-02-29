Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B3A86CD9B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 16:52:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687251.1070439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfihr-00075u-2H; Thu, 29 Feb 2024 15:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687251.1070439; Thu, 29 Feb 2024 15:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfihq-00072u-VF; Thu, 29 Feb 2024 15:52:22 +0000
Received: by outflank-mailman (input) for mailman id 687251;
 Thu, 29 Feb 2024 15:52:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfihp-0006Ea-4r
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 15:52:21 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85879405-d71a-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 16:52:20 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56648955ac5so1484277a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 07:52:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e20-20020a056402105400b0056518035195sm713202edu.69.2024.02.29.07.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 07:52:19 -0800 (PST)
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
X-Inumbo-ID: 85879405-d71a-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709221940; x=1709826740; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVzVZ/oy9DLrxSYVu+pp2bLxrUV0JY0FX+M/mynUhX8=;
        b=AYzGuqvE7GX3BR8XiwHnukl8uemoAs+3NTv4JZsGMwzVL4e/x3a77NQvr/FzAD95Ky
         /j32yB1YROEA3vxE6GXurDVdYKcW0a0BQrKdIbY18F/tHkaSUe5svqz8xz1GkDZ/dbVj
         v5wcIlV6GCTd7hOIvQRArplq6XTuF884yYgWNtnYJ5Lfz7fi7XKfOIPEbpN/+9MT0qHY
         89ogUZX2EkRsZYMZhR/dOcP6Ap0S/S+1UjlD6tS8Po1+KoE86S7r8KU3Y7RrEVZdXl9M
         pgxaEYxQy7NIVEiw9eUnubHfnE3tDONeYEQjyxOoJL6OjodoIxavK042UDIdglJ4mo1T
         EDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709221940; x=1709826740;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVzVZ/oy9DLrxSYVu+pp2bLxrUV0JY0FX+M/mynUhX8=;
        b=dqqJVu13mNyKLcGmMnILcFMW4PGglB8zT8RFKuEttc5HmixztkOO9hp54NgFkJqUFx
         ukh0lHSI5KntTTIVf9WJw6y7sVXr7uja4LBV0NtA8RtbmspUiiajOB7G9L4XQB+hQ+au
         ynJJf/OkP9iEit1qjpM3WDH9Qc0ZwDc/QBqk/4Hx4MBVWeq1OIFBXO6FqiShQLVuQBOl
         Tb1CaCLJWJlG7eOCVk9OXLi4kPaB0LGPsBnM6FKESK0yiN7EQirdpABhjAIhNrgVDvLf
         Cj8A85WarHO+fjfFVdVCoh3S7sS1ZJjt5IaK5VdSZfXbs8xMIZhtwtRxMEUdGU7jS712
         bq7w==
X-Forwarded-Encrypted: i=1; AJvYcCUGSCM+xEOQujiYbMkBfHuAij9ZPfI17dB4vDGWrXGUhOGjYFVgzRtjd7HNqXbp/jXWS4AKZvmvTUxIa+PZpGJRbJAOE5yR6aogWK+Agbs=
X-Gm-Message-State: AOJu0YxHNqBYn9W6K+mCugBMC78aUuPQ9sFNL9BlppprSPN9HicvBj9Y
	KKGaPaZA1aieOeKBxxPeepzOjiMut1DCMmmDRBtJQ1X/QoOhhPKpG8Y6D+1mSg==
X-Google-Smtp-Source: AGHT+IEI6liXWThAakrsd/J5jlIdLgYzZwRT1hc1i/v5CzIJJqvbqNjbeqyEabxRBLMYPjyOGq3Sfw==
X-Received: by 2002:a05:6402:903:b0:566:3f3e:3a23 with SMTP id g3-20020a056402090300b005663f3e3a23mr1696214edz.1.1709221939925;
        Thu, 29 Feb 2024 07:52:19 -0800 (PST)
Message-ID: <4c2ca7b7-0e21-4866-8aaf-1987cf3306b5@suse.com>
Date: Thu, 29 Feb 2024 16:52:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/23] xen/asm-generic: introduce generic fls() and
 flsl() functions
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <df7ab5055ef08fa595f913072302770a3f6a5c33.1708962629.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <df7ab5055ef08fa595f913072302770a3f6a5c33.1708962629.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 18:38, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/bitops/fls.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_GENERIC_BITOPS_FLS_H_
> +#define _ASM_GENERIC_BITOPS_FLS_H_
> +
> +/**
> + * fls - find last (most-significant) bit set
> + * @x: the word to search
> + *
> + * This is defined the same way as ffs.
> + * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
> + */
> +
> +static inline int fls(unsigned int x)
> +{
> +    return generic_fls(x);
> +}

This being an inline function, it requires generic_fls() to be declared.
Yet there's no other header included here. I think these headers would
better be self-contained. Or else (e.g. because of this leading to an
#include cycle) something needs saying somewhere.

The other thing here that worries me is the use of plain int as return
type. Yes, generic_fls() is declared like that, too. But no, the return
value there or here cannot be negative.

Jan

