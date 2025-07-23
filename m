Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAACB0F757
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 17:44:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054425.1423211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebdp-0007Uz-Ij; Wed, 23 Jul 2025 15:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054425.1423211; Wed, 23 Jul 2025 15:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebdp-0007T2-Fo; Wed, 23 Jul 2025 15:44:25 +0000
Received: by outflank-mailman (input) for mailman id 1054425;
 Wed, 23 Jul 2025 15:44:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uebdo-0007Rb-Qn
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 15:44:24 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6e1117d-67db-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 17:44:21 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so5431991f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 08:44:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cbc6aab8sm9714922b3a.157.2025.07.23.08.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 08:44:20 -0700 (PDT)
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
X-Inumbo-ID: e6e1117d-67db-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753285461; x=1753890261; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9oHIgwMd9pBhx3kUOYmjYm6BoDrRUjqpCYg53OHiSBY=;
        b=LfcxJcnGhuGcSKrSW9Xdl2WA3K4TbEOo5S4KD+5ZTlzKxzAwyT9RO66KK/P9O2l+hi
         gMaft6nTT/BxpbbBomWXN9e63m7jiKk2YwKLDcE0rFc8T1iuBzLir7ntuam8K2yyhw9k
         Mx4BNJ5UthRXSGmncmOLCwJuPGWt1BbNr42zjQG5vYZpe1HMnBC2hGGXg22Hy2f1W1aM
         qu9ExiT5Ot2un4YZFmLJbP+jWao8V2hgTepzHJbsmh0Nf4hfORn6VWL4NyKTpNP2QkAC
         Q9OyD3IHGscDKbp0tDZQTMUVL+etdqYTW6LWp863rUHp4h16sVDQnt3/mNtax0JcBms6
         B7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753285461; x=1753890261;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oHIgwMd9pBhx3kUOYmjYm6BoDrRUjqpCYg53OHiSBY=;
        b=Y1pVtSw09wxJ1/aumuJoufoSCvCqqklXfatqyC6cJK+S8qs8ih46gUa7PnCh0FrFzf
         GgXTXRf/OkOJidLvmvC7F94p5V97YUnZhr2P1iqfzuDsezuv8IqiwQ1L3C/A9adqDcXS
         KS2WzEZwmNMUGt7QDbey2Wqi8a00YGoWcmOKptty3mwka37lySQj6WOYMvpg0rrxJIGR
         EjvRVG/o8LUFqXmuIs71yFrWNnYb2ZdnIB7a0MDfn8fl2UTm7gg1KDZwvmd/FiwmA/H7
         Seh1Y3XEjf/y4NVF0Dvuv9Yic+mwCL+0xglmcRIzOZaVhe7CqAxwCtryBCA3rTbgNE5Y
         TC3g==
X-Forwarded-Encrypted: i=1; AJvYcCXYsi10eqzhIzRSSoeGDxf8uiD49tlznZNSIwu2+wJgX8LGu7KX8Qwk+8dPqoFpgg+rsvFCnoWYU64=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsS/2XtioGpIz8Cqupo6cV2EbFSfoYgTs11WBt+gr3odjeJdDh
	hjZyzQwHBOR6VqcBXI9l6jflzxbP0Dn47wdGnBDPsZPZT7fTpu4WT9K/BDSJlAO/ZQ==
X-Gm-Gg: ASbGnctfmf+mlWrC9ywZDzTUqNYJf2jikd87VewKyeN7FXO1a6BfFkeItU34GDaGzaY
	qZo9+1S6B1/szI5l3GzsjqgARsahv4XxZCj5PFpog330V02gIQfk1xvOZRihPPD+mLsGt5Ik6K8
	QTdRzIpQutzdG0xngBc/8XIWzRgd5wZA+0ww8cd9zDx16F56WI/p02kY7ClRdWK2MWrNQIi88E/
	Wz2Gctbm49ywHLlCipifqYDUXR7fArYJQNqgEdkbfNz4ZaIKvAchlmf7eF2phzkPyhJBf214Ug7
	ZZ9I2nxzKyutxeMOGDB10A4sNJKGY8ePt5VAbIQH+999xNknhP8wYX4WdeSLsDYwIY53HQr/w0l
	RE4bFOW9Ba/DsDql3ALLxmhzxTaSYmEzLP6L+4d9SPAI07W5JRnkhMq4P7OPHt4V0kVdyj/YVQh
	/6DlXHSi4=
X-Google-Smtp-Source: AGHT+IEfI2KYYZOXsdoQYBfAH/Poafrsr+kOYTv2CY3yLMCWwBOmCsmtYM/e2OQ0Wt/ZKk2nkeBp7g==
X-Received: by 2002:a5d:584f:0:b0:3b6:a03:f7a8 with SMTP id ffacd0b85a97d-3b768e9f7c3mr3062351f8f.22.1753285461247;
        Wed, 23 Jul 2025 08:44:21 -0700 (PDT)
Message-ID: <7e4a43f1-b232-46f3-abcb-d9cd2dad03f2@suse.com>
Date: Wed, 23 Jul 2025 17:44:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/19] xen/cpufreq: get performance policy from
 governor set via xenpm
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-15-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-15-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:51, Penny Zheng wrote:
> Even if Xen governor is not used in amd-cppc active mode, we could
> somehow deduce which performance policy (CPUFREQ_POLICY_xxx) user wants to
> apply through which governor they choose, such as:
> If user chooses performance governor, they want maximum performance, then
> the policy shall be CPUFREQ_POLICY_PERFORMANCE
> If user chooses powersave governor, they want the least power consumption,
> then the policy shall be CPUFREQ_POLICY_POWERSAVE
> Function cpufreq_policy_from_governor() is responsible for above transition,
> and it shall be also effective when users setting new governor through xenpm.
> 
> ondemand and userspace are forbidden choices, and if users specify

Is this stale? You permit ...

> such options, we shall not only give warning message to suggest using
> "xenpm set-cpufreq-cppc", but also error out.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v4 -> v5:
> - new commit
> ---
> v5 -> v6:
> - refactor warning message
> ---
>  xen/drivers/acpi/pm-op.c      | 8 ++++++++
>  xen/drivers/cpufreq/utility.c | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
> index d10f6db0e4..e616c3316a 100644
> --- a/xen/drivers/acpi/pm-op.c
> +++ b/xen/drivers/acpi/pm-op.c
> @@ -205,6 +205,14 @@ static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
>      if ( new_policy.governor == NULL )
>          return -EINVAL;
>  
> +    new_policy.policy = cpufreq_policy_from_governor(new_policy.governor);
> +    if ( new_policy.policy == CPUFREQ_POLICY_UNKNOWN )

... CPUFREQ_POLICY_ONDEMAND here now, aiui (as per patch 13).

> --- a/xen/drivers/cpufreq/utility.c
> +++ b/xen/drivers/cpufreq/utility.c
> @@ -250,6 +250,7 @@ int __cpufreq_set_policy(struct cpufreq_policy *data,
>      data->min = policy->min;
>      data->max = policy->max;
>      data->limits = policy->limits;
> +    data->policy = policy->policy;
>      if (cpufreq_driver.setpolicy)
>          return alternative_call(cpufreq_driver.setpolicy, data);

This looks like it would belong in the patch introducing the field. More
generally, is the field left uninitialized in certain cases until here?
That we will want to avoid.

Jan

