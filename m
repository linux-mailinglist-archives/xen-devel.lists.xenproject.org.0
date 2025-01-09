Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83885A07425
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 12:05:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868176.1279730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqM0-0001Bk-EQ; Thu, 09 Jan 2025 11:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868176.1279730; Thu, 09 Jan 2025 11:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqM0-0001A8-BM; Thu, 09 Jan 2025 11:05:32 +0000
Received: by outflank-mailman (input) for mailman id 868176;
 Thu, 09 Jan 2025 11:05:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVqLy-0001A2-Qg
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 11:05:30 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a30e4c90-ce79-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 12:05:29 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso6006375e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 03:05:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e37d46sm17035495e9.25.2025.01.09.03.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 03:05:28 -0800 (PST)
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
X-Inumbo-ID: a30e4c90-ce79-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736420729; x=1737025529; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Oe0prP2niGOAvwz4fU40U6wRNqlRneVV+fa3c7A2ILI=;
        b=OiTDyFFnlgzfePuPqd5ZG6I5baM4M2m51zUeJRq48wpUiTXbODcPgFGE6ej3xgsru4
         JG2uK5I5PD+8Dsri0Bp/lkQNnCHkcSlhziPOFQv0Y/Wuj4XKUS3gMiWszxmDc6ZF1gn+
         X62tmxI1ng+aZnbGXT+QeWF2Va8hytlCD1cC4keNF2bPc3Cp0I30U7idp6O9v61gO33j
         XmnnOFWsejUivuOpKZ9F/pwyFHd6XhG0mvyz77yp+GeiCA3d+LcKtmclcAkTxrd6Pn5m
         hHDqdGrYyMwD58yGUCyCzTaFgDYCfpqq5rYAsf6V4+anvMoxqwcYpMiUq1P6me0oZ/Ge
         MZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736420729; x=1737025529;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oe0prP2niGOAvwz4fU40U6wRNqlRneVV+fa3c7A2ILI=;
        b=joLNfVXYnJsvxE3t5RHd/Ppp29rPgwzKmke60M65liUKy9KG1K3rDfdtAje5h4eiSf
         slcPpFTOnapMlv4wsNrMYV1jFijL6A19uRUHVFzpO8ugd2tSXLIO2mL4IfLefimknA+0
         3oGrMFgs0mkBv/pN3V7Ne82hXvhGIBZA7UYWmit4InziO772uOB+SvrrhXKfiz53hYu+
         2aqm2Zz3g5vbIQzS30A1J69129MKb+hDQiKpnO5SW/jNGolPHzP9CmSFI3sEdfkgq7Mq
         6SyFQj98BFRHYcbONIL1MK20h+ozEeOIxOLY6YSjYFfArkprOD/86kjIam9KfvaXs/it
         sAwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXnXZiuIHjcDccKzZ4e5ABoLzauJRlQ1VgVpLu3ByrqrITUb0pPyKKFwexg9oqGUOV1W9tTJuq9hw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcAFTlEAbwmmQfEP10o7SfLgU6z1L7SpyDHK6NFv3rYnrc5Qek
	mkRbJ/1VZRAUn6hQEN/iVliXRC1Aeu7dOTiob9EAZd+TStIYlMa8DdsLBbYH3A==
X-Gm-Gg: ASbGncvUle2d7EBHewLmXDwSuvR5e4cLIRVql3mGseIvNeTJRwMhP1NT1/rY4T8t4UI
	bqwmV3v/IrgaihHOW/kJydiAvJ6J2Aiu0VjLVW8ZL1Sg3Q6BWMoYX5RPJq8QKc30bUYUCWuFP0R
	PSL3y9jIVm6ebER3+762cC91RAL6VbBj5J48QrY+mSl79QJaw72PB6x28RGCt7uAdlMSe2OqxSD
	kFhHVnvg0bWTS+uRY8/Kjmd9NecyK1u2FgC73H+3zGTAEXSo1vN1ROhN1WGBSPoZorvU/yhvCm/
	GJtL6RVUP9r1Bhzto2RmeBEWCFdVFpZVRLNsmUZp8g==
X-Google-Smtp-Source: AGHT+IHPeRqiSHaKBg1uVtAg3eN+nXkPd56j+JZFXlRvUsQUf7n7/q+exSOo5FidMzidAWV8tMICqg==
X-Received: by 2002:a05:600c:4f47:b0:434:e8cf:6390 with SMTP id 5b1f17b1804b1-436e2684dfcmr51478495e9.6.1736420728909;
        Thu, 09 Jan 2025 03:05:28 -0800 (PST)
Message-ID: <8eea1edb-edcf-45a6-b688-92fca86c25b1@suse.com>
Date: Thu, 9 Jan 2025 12:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/11] xen/cpufreq: introduce policy type when
 cpufreq_driver->setpolicy exists
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: stefano.stabellini@amd.com, Ray.Huang@amd.com, Xenia.Ragiadakou@amd.com,
 Jason.Andryuk@amd.com, xen-devel@lists.xenproject.org
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-7-Penny.Zheng@amd.com>
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
In-Reply-To: <20241203081111.463400-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2024 09:11, Penny Zheng wrote:
> --- a/xen/drivers/cpufreq/utility.c
> +++ b/xen/drivers/cpufreq/utility.c
> @@ -484,3 +484,14 @@ int __cpufreq_set_policy(struct cpufreq_policy *data,
>  
>      return __cpufreq_governor(data, CPUFREQ_GOV_LIMITS);
>  }
> +
> +unsigned int cpufreq_parse_policy(struct cpufreq_governor *gov)
> +{
> +    if ( !strncasecmp(gov->name, "performance", CPUFREQ_NAME_LEN) )
> +        return CPUFREQ_POLICY_PERFORMANCE;
> +
> +    if ( !strncasecmp(gov->name, "powersave", CPUFREQ_NAME_LEN) )
> +        return CPUFREQ_POLICY_POWERSAVE;
> +
> +    return CPUFREQ_POLICY_UNKNOWN;
> +}
> diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
> index acf133430b..cad27f6811 100644
> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -133,6 +133,17 @@ extern int cpufreq_register_governor(struct cpufreq_governor *governor);
>  extern struct cpufreq_governor *__find_governor(const char *governor);
>  #define CPUFREQ_DEFAULT_GOVERNOR &cpufreq_gov_dbs
>  
> +#define CPUFREQ_POLICY_UNKNOWN      0
> +/*
> + * If cpufreq_driver->target() exists, the ->governor decides what frequency
> + * within the limits is used. If cpufreq_driver->setpolicy() exists, these
> + * two generic policies are available:
> + */
> +#define CPUFREQ_POLICY_POWERSAVE    1
> +#define CPUFREQ_POLICY_PERFORMANCE  2
> +
> +unsigned int cpufreq_parse_policy(struct cpufreq_governor *gov);
> +
>  /* pass a target to the cpufreq driver */
>  extern int __cpufreq_driver_target(struct cpufreq_policy *policy,
>                                     unsigned int target_freq,

The new function has no callers, making it difficult to review the change (not
seeing how it is used) and violating Misra (by introducing unreachable code).

Jan

