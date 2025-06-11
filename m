Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FFBAD5A92
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 17:34:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011894.1390429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPNSd-0003b9-AB; Wed, 11 Jun 2025 15:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011894.1390429; Wed, 11 Jun 2025 15:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPNSd-0003Z3-7S; Wed, 11 Jun 2025 15:33:55 +0000
Received: by outflank-mailman (input) for mailman id 1011894;
 Wed, 11 Jun 2025 15:33:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPNSb-0003Ye-Mk
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 15:33:53 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79a3bca9-46d9-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 17:33:51 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-452f9735424so18946105e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 08:33:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2f5ee6f6desm7406427a12.26.2025.06.11.08.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 08:33:50 -0700 (PDT)
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
X-Inumbo-ID: 79a3bca9-46d9-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749656031; x=1750260831; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p6IijF46VP9n2iEZKPwXmjPunatZLRSO+wk+fQ8PcOw=;
        b=W7cH9jpOFW4pGDEWulc3CGJrwJHUpPEtDzKCsxKriPIIT1NPtJDgE6eLM9VhTadTpA
         A3LPcvDUGRTsDkg7/BscK6bon4e7cbCMUudSXNSBIxYsouOf//Bp2nmR1E1GdPYoSdEp
         kfFvJAFXKDGTWFpZDFY9M0UxVY6vMzidPolHJU+oXLjIPyLQUKTXpVTft7ZCwVYMBTEy
         xNKHajweOIaAOzOc7+s4vMyBiRjW7dwvVxfWuub8GNORYw0jBQP9LrRnOOIw+TmrncE7
         1aS6Ne12Z49Ej26SZB4kBQ/qh23d7clZinYRpnE+5CkORAyybHowYX0TmOq70XP4PjUC
         lAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749656031; x=1750260831;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6IijF46VP9n2iEZKPwXmjPunatZLRSO+wk+fQ8PcOw=;
        b=e4Wy5FwI3KeRTitV9YxrkST27cx8FGBQJ8GSQFvZYFRt45BOO4PrJw99qYlhXYCO0n
         gnY7g9jWpsxAyDS8xbBsOXJ63c0tHpivdS0DHNku6gko2OG08z71HMwOxxLQimvdkQVF
         O74Ev+pSBkJtT9E7wxSxgRuODxHBk91JK0iWAsmXqrP8u8DubFo0zH6msk+SKkWNiP5T
         bRI0sszNCRKQeg4/t627W0KoykCDt270AY1aLrVURZW86K7OOPslfFiw9r/Z3Ar4jNEn
         vX3aiCkvC1ehDSvCCVisnW3IPvFxivL9/6P7ZsSOYvM2HWmJA9UMNGRCGOtLQxeU8/4b
         GLEw==
X-Forwarded-Encrypted: i=1; AJvYcCVHIUoWWjDGO0bgNKtHPNGvUXiQPjg/IvlzB3OeG75+vR93brFLLwxwPZj1bLsAjjaV+uLMwLASA0g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywx8E9AEYaePEsQJWdVx1Z1+5xuHOFKpLWdY4LY1K659iiRFxxT
	70x6+5Y05Hju7Y8u0Dq5Z0vs9kiibV2uFqN9EXx5nlsuAqdJpAM7GiGP1Ddyu7KBQg==
X-Gm-Gg: ASbGncvWTHKZQHbFKsLQcuRI11lXZlJK8MngZZ3ehVLSJnQgYdO+Kzg0g7NZvp2XvIk
	sFdJ7J3AvXztGxcHI1zjK/Laq4EBhhVFNtwSl7CbBf56n5/ccdq/bZZ1ddH95mXdlQNgZb/Wr51
	8YyQ1V7Un+7sY2OX6QwM8AxiqiPFQPWMv7msMijuTzNFIiOb9LeZ9zZzUf9mCaXGWA6dK+Va5zg
	G2eGy7TT6WZaSWel5j+cAOLwPemv0vYWGAN1uZTyEmixBc40ZiZyYCpY2PmuIVFXqSFSKsIADo9
	tydnPKaUyZMZSrJHFwyQAEmnUcouaF/fY6Zr/cSziDNOyX0Exu9JooViwU21CtqRGT4ijXr7vYh
	T/RYAOjdUpXKkVAekhlMJh/iqFo+gxylEmB61oNNm2GM+ahU=
X-Google-Smtp-Source: AGHT+IGmL/ZgGEyce42QTh7zlT/kgshY0AoyCu32gzSNc2VUX0HtW3EiQpjEIDNNsZJX41qwnWSkyA==
X-Received: by 2002:a05:6000:1a8f:b0:3a5:2182:bd17 with SMTP id ffacd0b85a97d-3a55869b80amr2849847f8f.19.1749656030660;
        Wed, 11 Jun 2025 08:33:50 -0700 (PDT)
Message-ID: <005a0e3a-dc8f-480f-8bb9-fd8eb164eb02@suse.com>
Date: Wed, 11 Jun 2025 17:33:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/18] xen/cpufreq: extract _PSD info from "struct
 xen_processor_performance"
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-4-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> @@ -201,14 +221,14 @@ int cpufreq_add_cpu(unsigned int cpu)
>      struct cpufreq_dom *cpufreq_dom = NULL;
>      struct cpufreq_policy new_policy;
>      struct cpufreq_policy *policy;
> -    struct processor_performance *perf;
> +    const struct xen_psd_package *domain_info;
> +    const struct xen_psd_package **domain_info_ptr = &domain_info;

Why's this latter variable needed? Can't you simply ...

> +    uint32_t shared_type;
>  
>      /* to protect the case when Px was not controlled by xen */
>      if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
>          return -EINVAL;
>  
> -    perf = &processor_pminfo[cpu]->perf;
> -
>      if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
>          return -EINVAL;
>  
> @@ -218,10 +238,15 @@ int cpufreq_add_cpu(unsigned int cpu)
>      if (per_cpu(cpufreq_cpu_policy, cpu))
>          return 0;
>  
> -    if (perf->shared_type == CPUFREQ_SHARED_TYPE_HW)
> +    ret = get_psd_info(cpu, &shared_type, domain_info_ptr);

... pass &domain_info here, ...

> +    if ( ret )
> +        return ret;
> +    domain_info = *domain_info_ptr;

... also eliminating the need for this assignment? (Same again further down.)

> @@ -464,6 +505,17 @@ static void print_PPC(unsigned int platform_limit)
>      printk("\t_PPC: %d\n", platform_limit);
>  }
>  
> +static int check_psd_pminfo(uint32_t shared_type)
> +{
> +    /* check domain coordination */

Nit: Comment style (wants to start with a capital letter). Yes, there are many
bad examples in this file (some even visible in patch context here), but in new
code style guidelines should be followed.

> +    if ( shared_type != CPUFREQ_SHARED_TYPE_ALL &&
> +         shared_type != CPUFREQ_SHARED_TYPE_ANY &&
> +         shared_type != CPUFREQ_SHARED_TYPE_HW )
> +        return -EINVAL;
> +
> +    return 0;
> +}

Looks as if the function would rather want to return a boolean value.

And anyway - I can't really spot the need for this helper, as I also can't
spot ...

> @@ -545,14 +597,9 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
>  
>      if ( perf->flags & XEN_PX_PSD )
>      {
> -        /* check domain coordination */
> -        if ( perf->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
> -             perf->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
> -             perf->shared_type != CPUFREQ_SHARED_TYPE_HW )
> -        {
> -            ret = -EINVAL;
> +        ret = check_psd_pminfo(perf->shared_type);
> +        if ( ret )
>              goto out;
> -        }
>  
>          pxpt->shared_type = perf->shared_type;
>          memcpy(&pxpt->domain_info, &perf->domain_info,

... the need for this change. And even if there is a need, a follow-on
question would be how this relates to the subject of this patch.

Jan

