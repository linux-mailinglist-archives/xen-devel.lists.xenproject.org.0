Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44486B1379D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 11:37:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061160.1426670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugKIB-0005S1-8a; Mon, 28 Jul 2025 09:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061160.1426670; Mon, 28 Jul 2025 09:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugKIB-0005PF-5v; Mon, 28 Jul 2025 09:37:11 +0000
Received: by outflank-mailman (input) for mailman id 1061160;
 Mon, 28 Jul 2025 09:37:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugKIA-0005Ot-2e
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 09:37:10 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e26a5ad-6b96-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 11:37:08 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b78310b296so747461f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 02:37:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31efc2f579asm1540202a91.30.2025.07.28.02.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 02:37:07 -0700 (PDT)
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
X-Inumbo-ID: 6e26a5ad-6b96-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753695428; x=1754300228; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1w4QXslunNl9xe829TKIcKVe/jvv4JohU2HgZliVUio=;
        b=MjlZGmv7Hhgy970H488UxCwiaATkkCzt/4u7ojusRuVABXr8KzKydUKWDfk2hPEz9c
         5qTTjXRwGAQofZSVYTxVOLDRT05sGh6OAnEAckHcf1iYjUDtT/s5nvGcDg7ImjwNO0vo
         OHQwF1Zenm87ZSVXbBmxbcFxXpGvHE/YNSc06JoZq9tZ0kaddhIThCEr8n8qWJk92wjt
         XEmsHwU9uxjcTKkbyNXNq7bnrfdSxU+Aj7/oBf3+ZZljqMcSrDsfw1x/soRJ5AT2/yy2
         mChaR6QZS6yKn5Nuln9+s2jyY1mhvVx9etAIbkHfmtUVFKsTv8jQh9EZwV7aamiRNmWc
         lvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695428; x=1754300228;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1w4QXslunNl9xe829TKIcKVe/jvv4JohU2HgZliVUio=;
        b=fdYCDB/ar353K1LMyqvx0qX8/WNglUaHmpdvfrXBjNfAzSjfDijof7dqcnDsnmFDc5
         rC+yGyiM5j3irRC6A9SbGIpXWZEW2xKcf1LuK4Faq0MRKiH8hO6gtxdoEV7gB1gSxo9s
         +3V5kNz1WYTyyF5X0BTGG8ONAmS/+b3erlQsCXXTvIiJifa37doZdzbPJYHsVW7XpACy
         kPYyG43K991LConEQ2AnT1zBuzWkK0YiUGuOYYOq+n1BEuoTjVu5/XcwJ7p7vfvpyKzu
         Sg49OnHr98H8tVx6ESwn4XuEKL40b+WJFjCVG/8bpapEMfxYSgtNzMj+SA1e9nVnkIOY
         hNlg==
X-Forwarded-Encrypted: i=1; AJvYcCUw0wlP/KgfRYPRsOLYWT8Hj9K1scqjfyD15dVoso/CqoitXkrUZletQap5B1GcZBZnH+5ckMMt1w8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfGJFC9yUWr0rQhYEW5fDJTsdwWD8VeT0YDmHzVvDYiAdtuM7S
	6bHsT0sKICQvFTP6Pc2Z2qmh8C99/MXCgzrf0swBHc2k8Od2iWEg2HSDoNStJCLKgA==
X-Gm-Gg: ASbGnct0xFHrogaE6IFdfG25A66Fqy4T7MTLANdJh6imNoTi8iqEuvTjO5vqvS/hSp8
	b6jnSWR246qHF8Qe96vtVpKXCbFd5YRgEg/DXIHKYAsZ2kdmuOiLnBqwP7LUDIR9OlXn5D8m6Xw
	jzYc/8zKJj1BAPGoIVt7Lb3QW1pJY36t/Wjtel6tcTI/XXIAmqCszWKpd1FbgcE+BezKrk9/9oS
	LivN/K6kIAasZMSKA75vH93YzbWzuQq3YPzyMAN7vAzS1QVcTnFWgbePwMo4IyUYqOaXXqsnghl
	icRIVKz5jl+Zo2ce75R3GPWvCzJNjnccE9pF+uhF1ZqZabWfeo2zX6AdvB2tq6sFvc6q62QkpWy
	OGewdZbd4SjA090KJM7cYip4JcWiu3ttkuyX2NHTTp/snpBVDZNTDK8cTF8up653beihC2zHp4M
	xnLL06BB4=
X-Google-Smtp-Source: AGHT+IH4bTu6FfwrJujL7/ADRicRT1DSWE+5bIQn/JZN4uBujuOoBuXy4Ahi7N6thqPifoe4QiJsdQ==
X-Received: by 2002:a05:6000:1a85:b0:3a3:7ba5:9618 with SMTP id ffacd0b85a97d-3b77675bb6fmr6729636f8f.29.1753695427992;
        Mon, 28 Jul 2025 02:37:07 -0700 (PDT)
Message-ID: <a6f8f7e9-157a-4c99-a15a-cae4b2043ef2@suse.com>
Date: Mon, 28 Jul 2025 11:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: add deviations of MISRA C Rule 5.5
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7f5223bf37ed42c90e4bd426659eaa87c2c6879f.1753455885.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <7f5223bf37ed42c90e4bd426659eaa87c2c6879f.1753455885.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.07.2025 18:24, Dmytro Prokopchuk1 wrote:
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -142,6 +142,31 @@ Deviations related to MISRA C:2012 Rules:
>         memmove.
>       - Tagged as `deliberate` for ECLAIR.
>  
> +   * - R5.5
> +     - Clashes between bitops functions and macros names are deliberate and are
> +       needed for input validation and error handling, ensures that the size of
> +       the object being pointed to by 'addr' meets the minimum requirements for
> +       the bit operation, preventing unsafe operations on improperly sized data
> +       types that could lead to undefined behavior or memory corruption.
> +       The macros encapsulate this conditional logic into a single, reusable form;
> +       which simplifies the code, avoids redundant function call.
> +     - Specified macros should be ignored.

At the risk of going too far with nitpicking: Who are "specified macros" here? The
text doesn't mention any names. In fact, the way it's written it could be taken to
mean all macros there, including any that are yet to be added. I don't think such
is appropriate for a deviation.

> +   * - R5.5
> +     - Clashes between 'pirq_cleanup_check' function and macro names are deliberate.
> +       The purpose is to ensure that the specific cleanup action ('pirq_cleanup_check')
> +       is performed conditionally when the parameter 'event channel number' equals
> +       zero, otherwise it does nothing.
> +       This approach simplifies the code, avoids redundant function call.
> +     - Specified macro should be ignored.

Here it's clear which macro is meant, but ...

> +   * - R5.5
> +     - Clashes between grant table functions and macros names are deliberate.
> +       These macros address differences in argument count during compile-time,
> +       effectively discarding unused parameters to avoid warnings or errors
> +       related to unused arguments.
> +     - Specified macro should be ignored.

... here it again isn't.

Jan

