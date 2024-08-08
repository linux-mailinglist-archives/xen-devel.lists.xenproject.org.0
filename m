Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D01CA94BF2D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 16:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774317.1184787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3qE-0001B3-QF; Thu, 08 Aug 2024 14:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774317.1184787; Thu, 08 Aug 2024 14:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3qE-00018k-Nb; Thu, 08 Aug 2024 14:10:10 +0000
Received: by outflank-mailman (input) for mailman id 774317;
 Thu, 08 Aug 2024 14:10:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sc3qD-00011i-4N
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 14:10:09 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea487ef0-558f-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 16:10:07 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52efd8807aaso1135878e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 07:10:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c0cc2asm745458666b.63.2024.08.08.07.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 07:10:06 -0700 (PDT)
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
X-Inumbo-ID: ea487ef0-558f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723126207; x=1723731007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fz7OM67V+Q4sMkAh3kEyC5umDcwm4wOSg5gaazlgMNA=;
        b=AvfL6kHnfvcnQ+YHsK2PRTLFkMURzknOdrIjorcz9+nwkZkkeo0JqItWz09jc22QrH
         Uk60s3HI3Y4pCDXLUjLHJarfIrGhqAvtIb94bGwC10XNijl6KiYEKvNwPRZbZJgI2uqK
         syxjTtafFSz+jHjkUomJvzVCSEshtm5mP1PRXXNYBprRPF5+VVsArtFGJn5BJrj56bME
         WZYwh8eRnuYi9k2BtmDbQM9fqe69RGEz/Xvo4poW0uXoOMbx4Xq1tDLfXOVdOfm2vqOH
         G7Ne3XdrGga4qvywIMjAgpNYQgO84BAYZDYTgKrWnxj1Uj/rEwZNWdi/NUAneP0egiTx
         5O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126207; x=1723731007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fz7OM67V+Q4sMkAh3kEyC5umDcwm4wOSg5gaazlgMNA=;
        b=Hs6WF37ulCjAr712ctNIToxmH5lamI3GsBlQiwFRl85MGYycC1fIiuD3KiwT2c77rV
         bBHKWzKUlU8Z/+KMTZQQjeatuu/2+tT7lVX/PztvscP48+BEAhJp1cJPLTkGwngBM29r
         evCiPOdj94x2OqGcFJ3zgWay/Po6aTnCgjpG+/vdKDMoXnrZHlEk+5qtWeswd1mGGe6O
         f70YhbInzQLne/4S7Rz8lBlTFRBggHKCuCmSaoUxVGn39+T9MfdtZsFi3yYLrNX3orAI
         rQS5f53/7fvlAJiqSaFVclgKTUKqskF3ad8q63KI5zqHf9Xl3YheTqK7C0nvH06wFCaP
         XLJg==
X-Forwarded-Encrypted: i=1; AJvYcCW2ZCbKORtOh++1fiMQfxvlg77pHyIuOCwzVu7AgRKWWnZOqYKAsuBjiJfb72ooNa4EUUY60dxMnVXkKEJNskpP3UpIppHC5/s5pBwgZSI=
X-Gm-Message-State: AOJu0YyMwSdY27ErVaxl1ud1PqncfNSAYIFM/isrpXBX/i7aTaVg4/M1
	vtvjnNS5WgeARbRS0X+K22BxkSsAT6/k51WkfLdTgkVLMtGY77mIYq7GMmN94Q==
X-Google-Smtp-Source: AGHT+IEIWVKDQXoB7DXQ5/2rLddR/leRKMZqk2QwHIiGZj+LpsV0CWAej3/HEE7mhocJ2R6a0dJcJA==
X-Received: by 2002:a05:6512:b03:b0:530:db85:e02a with SMTP id 2adb3069b0e04-530e5875653mr1591848e87.22.1723126206430;
        Thu, 08 Aug 2024 07:10:06 -0700 (PDT)
Message-ID: <b1b7eaea-450c-44bd-b97a-491183a292ff@suse.com>
Date: Thu, 8 Aug 2024 16:10:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] tools/hvmloader: Fix non-deterministic cpuid()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
 <20240808134251.29995-2-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20240808134251.29995-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2024 15:42, Alejandro Vallejo wrote:
> hvmloader's cpuid() implementation deviates from Xen's in that the value
> passed on ecx is unspecified. This means that when used on leaves that
> implement subleaves it's unspecified which one you get; though it's more
> than likely an invalid one.
> 
> Import Xen's implementation so there are no surprises.
> 
> Fixes: 318ac791f9f9 ("Add utilities needed for SMBIOS generation to
> hvmloader")
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Minor remark: A Fixes: tag wants to go all on a single line.

> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -267,15 +267,6 @@ memcmp(const void *s1, const void *s2, unsigned n)
>      return 0;
>  }
>  
> -void
> -cpuid(uint32_t idx, uint32_t *eax, uint32_t *ebx, uint32_t *ecx, uint32_t *edx)
> -{
> -    asm volatile (
> -        "cpuid"
> -        : "=a" (*eax), "=b" (*ebx), "=c" (*ecx), "=d" (*edx)
> -        : "0" (idx) );

Compared to the original ...

> --- a/tools/firmware/hvmloader/util.h
> +++ b/tools/firmware/hvmloader/util.h
> @@ -184,9 +184,30 @@ int uart_exists(uint16_t uart_base);
>  int lpt_exists(uint16_t lpt_base);
>  int hpet_exists(unsigned long hpet_base);
>  
> -/* Do cpuid instruction, with operation 'idx' */
> -void cpuid(uint32_t idx, uint32_t *eax, uint32_t *ebx,
> -           uint32_t *ecx, uint32_t *edx);
> +/* Some CPUID calls want 'count' to be placed in ecx */
> +static inline void cpuid_count(
> +    uint32_t leaf,
> +    uint32_t subleaf,
> +    uint32_t *eax,
> +    uint32_t *ebx,
> +    uint32_t *ecx,
> +    uint32_t *edx)
> +{
> +    asm volatile ( "cpuid"
> +          : "=a" (*eax), "=b" (*ebx), "=c" (*ecx), "=d" (*edx)
> +          : "a" (leaf), "c" (subleaf) );

... you alter indentation, without it becoming clear why you do so. Imo
there are only two ways of indenting this which are conforming to our
style - either as it was (secondary lines indented by one more level,
i.e. 4 more spaces) or

    asm volatile ( "cpuid"
                   : "=a" (*eax), "=b" (*ebx), "=c" (*ecx), "=d" (*edx)
                   : "a" (leaf), "c" (subleaf) );

I guess I'll take the liberty and adjust while committing.

Jan

