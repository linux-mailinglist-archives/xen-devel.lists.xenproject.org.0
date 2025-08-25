Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84632B3462B
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:44:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093539.1449014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZMv-0005hd-R8; Mon, 25 Aug 2025 15:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093539.1449014; Mon, 25 Aug 2025 15:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZMv-0005f4-OO; Mon, 25 Aug 2025 15:44:25 +0000
Received: by outflank-mailman (input) for mailman id 1093539;
 Mon, 25 Aug 2025 15:44:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqZMu-0005ey-As
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:44:24 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f3577d5-81ca-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 17:44:23 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad681so6241535a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 08:44:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c3119f876sm5163432a12.12.2025.08.25.08.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 08:44:22 -0700 (PDT)
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
X-Inumbo-ID: 5f3577d5-81ca-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756136662; x=1756741462; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SelmiBWLC3Bwgp6pMShhmRezbxMTAYDdyvfHVbhyZpc=;
        b=JEJj+XJFdmBsRHjB2GbDHa6VG+P2pwn7qG6I4ERbKo0q7pKLTVPDAmhTNnxKycX543
         Mpml3/9V8RGv8PZP1Bm5UCWeBj8vN71idGRTUXlbs3BNsHly/d1Dz2xTnWSNjGvnMQkQ
         ZCGv0qVTgkiCkVXEzu3ykI+UVk4oZqfT0vLFVyU8PbXqsgZEPi5wytUebO208bf2wheF
         4/LJcrONPeZmxJhfI++axstfbN1qXbXhzRgCiHUWHkYucJ2R1x6dEKf1B9ECH5AimTsO
         t4KjW+JZSe9LZXezp40VJdi0R529RTGQSWj85tXiM5HC841I6Hsny7Q++3XtgM1621TU
         PhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756136662; x=1756741462;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SelmiBWLC3Bwgp6pMShhmRezbxMTAYDdyvfHVbhyZpc=;
        b=SW12qJOKbgGlluabqcJF8udPTdTwLdD/RD7y9KWRz3mFtazwZCifWwjkJ4C4oNqo53
         hgGL50D+M7yRu4DEyW85S/MnT6ufQwEdCsq7rpI1dNsw0HMw6FOmDCcS0zUEHPYwWuH+
         5Fu4SxLWoKVLmqCyN/vYLXw/8gljy8lm9M1rPgytCfLAMwbAPk1N+JF8OA2ghCoRXlu9
         lYIjouiwlk1FlmGNCU3FVikfqdbUL5sRMArlODXW4J91XKU9SIrOrNneShHe8fnCq0rQ
         SseCA/KXK4NJ8GGXsEskE715UuViBxmwUHL1xwHwcvjNExLPZnPWOE3tHl8GjwhOVmkH
         2hxA==
X-Forwarded-Encrypted: i=1; AJvYcCUaEmW0N7+gqZhT6G0VXckbakYLrqwUa8aKjrwU26kEaIAp5rrjfGFKsotbsZKLWM1+4ltcrVlVwuA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4YX4yeqila/V3d+LVC2LHYmGGhKn2TbmrsthSi+sg0dDn0SaF
	iRENi8RsuwqKHi5ktZ6NFyHmqq2svX1b5CyH/v0EdxlZKSnaxF3UccPhH61E1JS/Dg==
X-Gm-Gg: ASbGnctljW7t0cQQWrN5BOV04pXaEn3xusIv6cu1dP2DVX/X2754m4nWJp/rS4QvXY9
	aA+MZLMgcAbddnENuQ29fk8vvl1xjUz/0gSxVouPlYHYD3hL05to2C18E37BgKbkIzWG/P2xqNX
	HrT3HpIlvveV3rvtvCuHhccEzcxES1tvmPp/03j8zytsg62TCGGya6uQdnSuEUITCRoizvNP9+T
	1Ot/SITN/Q3IXkeZ3vcJo+5KJqMcbQdrjK2NxQHeeertwIbFxL5JB+AZSZF2FqhFExd8LNJJeXf
	ECGF/Dvsi3/TBQR3blv5R+tZmVFaJ6i0iTW5/C3X5ZqekWK3ICVIRpgpBDDbdRQSgZzuinDDxsl
	PCEwaov6J5lmbtZUUXWUKVldSGX8JKYwbutqrmE6X2sgX2UCbNbAeVXZSZivv7PC4/bHrtlAHie
	fAuAra/+c=
X-Google-Smtp-Source: AGHT+IFtF/9uRxwyTe+tCsUzSI4CWEi8mIBSqMLYsuruFF6nQU5pzz+BWCqM3LA1CS/L045vQxq+Rw==
X-Received: by 2002:a05:6402:2813:b0:61c:4dca:9d2a with SMTP id 4fb4d7f45d1cf-61c4dcaaaacmr5890613a12.3.1756136662466;
        Mon, 25 Aug 2025 08:44:22 -0700 (PDT)
Message-ID: <5e234850-489c-4cb2-a1a5-3ced693239eb@suse.com>
Date: Mon, 25 Aug 2025 17:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/13] xen/cpufreq: bypass governor-related para for
 amd-cppc-epp
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-13-Penny.Zheng@amd.com>
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
In-Reply-To: <20250822105218.3601273-13-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2025 12:52, Penny Zheng wrote:
> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -832,9 +832,13 @@ static void print_cppc_para(unsigned int cpuid,
>  /* print out parameters about cpu frequency */
>  static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
>  {
> -    bool hwp = strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) == 0;
> +    bool is_goverless = false;

I first thought this would be a typo just in the description. Please make
this is_governor_less, or - if you absolutely want to have a shorter
identifier - is_govless (albeit then you might also consider to drop the
is_ prefix).

> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -956,3 +956,17 @@ int __init cpufreq_register_driver(const struct cpufreq_driver *driver_data)
>  
>      return 0;
>  }
> +
> +#ifdef CONFIG_PM_OP
> +/*
> + * Governor-less cpufreq driver indicates the driver doesn't rely on Xen
> + * governor to do performance tuning, mostly it has hardware built-in
> + * algorithm to calculate runtime workload and adjust cores frequency
> + * automatically. like Intel HWP, or CPPC in AMD.

Nit: Capital letter please at the start of a sentence.

> + */
> +bool cpufreq_is_governorless(unsigned int cpuid)
> +{
> +    return processor_pminfo[cpuid]->init && (hwp_active() ||
> +                                             cpufreq_driver.setpolicy);
> +}
> +#endif /* CONFIG_PM_OP */

Aiui the #ifdef is to please Misra, but that's not very nice to have. Does
any of the constituents stand in the way of this becoming an inline function
in a suitable header file?

Jan

