Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355E4B10C58
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 15:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056107.1424250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewSR-0002hX-D8; Thu, 24 Jul 2025 13:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056107.1424250; Thu, 24 Jul 2025 13:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uewSR-0002ex-AF; Thu, 24 Jul 2025 13:58:03 +0000
Received: by outflank-mailman (input) for mailman id 1056107;
 Thu, 24 Jul 2025 13:58:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uewSP-0002ep-Q5
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 13:58:01 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35ad1ca9-6896-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 15:58:00 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4563cfac19cso11064535e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 06:58:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fc605afsm2232962f8f.9.2025.07.24.06.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 06:57:59 -0700 (PDT)
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
X-Inumbo-ID: 35ad1ca9-6896-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753365480; x=1753970280; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jcsjBHxnlPW4ONNOz4H/1Kjlt+v3kDlR7qC1iKO2CCo=;
        b=AQAv/zJRNlmHsndeQyE0H0oXRlwTYquW7jqVnmmDa8QiJ3qF0OzD3E5gf9hMjlXg36
         lrYZ0bqNKMDXL1Ezz5sQZ4fWVhMjcsJD8n5yDd+Z2cBLqzELZ91zflrmCI0MO9ius+Xe
         saUwLM/+44LS3poPA2EKB2FLddzrDZj4JuZvQkGvw6xzCzxjNawmaEtDqi6QJzlWSqvc
         XStZ5JY6g4lK4atX8oO/p6238qpAnZ2MxsAUuJY5/z6pLG4S4ST2diG6zm1iO7H5qa7f
         LrP5z8J/bnc2ApeEVyOc/8eQcfWxYn+cKf8Wn4CpCntTh61GuCgb4S/YrIqL6d/OMzzF
         caYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365480; x=1753970280;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcsjBHxnlPW4ONNOz4H/1Kjlt+v3kDlR7qC1iKO2CCo=;
        b=ZSEmpLh6HTPXKkkYt7VpUQqlIYRvgtQM3jDpfmivvUNI3xYdIRZH85smPx8z8Jjp5C
         7Tpawb5Q2UI4vgsnYiB9zv0DDMZuDzhGBW0jNWuhD4cTNJZ4eCzDNklf1ylRuhzz7n7a
         OtqovwN1Ii6uAzKr1pOxS9DAGpkdbh7uBrqKGefx8wM8/zlrWl8jUhfPMe7B3Rj5A+gH
         V1hDTgx+QAXWzTBcw/1ws2+Na4O1XYtYuioAqVPJGTQn14fetYILIILW2W1Vips/frX2
         ikk9zZXwWtfRTeJhpX2B7NUgY3hMeB/64pRRH7RWCkYUpNc9y8jy1uCbEhHcsRcJqRqG
         k4LA==
X-Forwarded-Encrypted: i=1; AJvYcCXlOOA4RPA0OiP8zHMxt5y6LrZOC5HfJRXR/W8Jr5gw9RzG/7+zG7Jm8hAKG2f9n1/UFOLmE8e4QGY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrEbgIddjCa0fvBeRjwWZyOZEOXSZRnll2nujaxaSJ3N1OT/7K
	xxN1gfXA8Y0C0fm/2TtKOvK4quWBidUA8Td1fmoRN4lgTGriI6JyKFcedMFkcM8bmg==
X-Gm-Gg: ASbGnctjCVIwgvmjyGhC86hPoBZyaaVslQvrnz8plU7YoVaTNmt6iHbi49GT+pvroeU
	uRHFu8Amef81Bdg0p3uWB/9fCuu+E+bHDZQAC5olXQUGMt/zMvHbLLpReULqqJAp3MRm7oialp3
	ASXD3bopTER4hgSR9HD+xVDy8Pv/JdF2/Ae18m9AM0EZ0Rj/0qL2Gn6Rgn0Sb5AL4jBBMG602Qy
	FD+b7XjDVVwVS23q7Fn+mTOXIkyjVZ0QfH9j+0Q5F/W94j7EdgROtMRuimOPN0l1vLubF9H5JXg
	Z5kuTgh7UX4bAbnuine/0cLheCb3h5vEHrI/IwK9PboYoAXwW2KlXhDIvzc5fZSWp0Zd1WZyY77
	BeJF/5cIfZmM3SUe+XVAfGp0cC1KalrY480ziKYPLeGNG2QOORU51Ow2xkC+G0Rem+xd+d7VZWB
	xfoOZ9vKM=
X-Google-Smtp-Source: AGHT+IHfSk2S1G0oalUhluI+Kmjfs/07b2jmRRbrfFIDYR1T0ukmFR0dolY6UKgWxHidmP+N8y1qyA==
X-Received: by 2002:a05:600c:1c22:b0:456:1dd2:4e47 with SMTP id 5b1f17b1804b1-45868ca176bmr70540165e9.15.1753365479677;
        Thu, 24 Jul 2025 06:57:59 -0700 (PDT)
Message-ID: <c48475a9-b527-447b-9c8c-508e5c107e03@suse.com>
Date: Thu, 24 Jul 2025 15:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/19] xen/cpufreq: introduce helper
 cpufreq_in_cppc_passive_mode()
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-18-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-18-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:51, Penny Zheng wrote:
> --- a/xen/drivers/acpi/pm-op.c
> +++ b/xen/drivers/acpi/pm-op.c
> @@ -152,7 +152,15 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      else
>          strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
>  
> -    ret = get_cpufreq_cppc(op->cpuid, &op->u.get_para.u.cppc_para);
> +    /*
> +     * When cpufreq driver in cppc passive mode, it has both cppc and governor
> +     * info. Users could only rely on "get-cpufreq-cppc" to acquire CPPC info.
> +     * And it returns governor info in "get-cpufreq-para"
> +     */

Which of the two they need to invoke to obtain a complete picture? Both?
I'm confused by you bypassing get_cpufreq_cppc() (i.e. get_hwp_para())
for yet another reason, when - aiui - some information there is relevant
in both active and passive modes.

> +    if ( cpufreq_in_cppc_passive_mode(op->cpuid) )
> +        ret = -ENODEV;
> +    else
> +        ret = get_cpufreq_cppc(op->cpuid, &op->u.get_para.u.cppc_para);

Any reason the extra check isn't put in get_cpufreq_cppc(), alongside the
hwp_active() one?

> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -962,3 +962,9 @@ int __init cpufreq_register_driver(const struct cpufreq_driver *driver_data)
>  
>      return 0;
>  }
> +
> +bool cpufreq_in_cppc_passive_mode(unsigned int cpuid)
> +{
> +    return processor_pminfo[cpuid]->init & XEN_CPPC_INIT &&

Nit: Please use parentheses when using & and && together.

Also, isn't this function going to become unreachable when PM_OP=n, thus
violating Misra rule 2.1?

Jan

