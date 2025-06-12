Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC08AD6D40
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 12:13:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012767.1391267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPevs-0006Jh-BK; Thu, 12 Jun 2025 10:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012767.1391267; Thu, 12 Jun 2025 10:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPevs-0006Hx-8V; Thu, 12 Jun 2025 10:13:16 +0000
Received: by outflank-mailman (input) for mailman id 1012767;
 Thu, 12 Jun 2025 10:13:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPevq-0006Hr-9Q
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 10:13:14 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d947b63b-4775-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 12:13:13 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so489151f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 03:13:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7488089669asm1102802b3a.52.2025.06.12.03.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 03:13:12 -0700 (PDT)
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
X-Inumbo-ID: d947b63b-4775-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749723192; x=1750327992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bAaUGNrB3gisYCVSsO6qM9UyrwByeIh4rLQB2sgV4Ig=;
        b=X58T1HoE8+/VDd7w+HORaaaeWubGCiLYgd144wxHLyfPyNOisqxJVVn+2Bhf3hAWnd
         /IQBbEFi+VW4Hugx+EyZO2lHEuME5sLg7u+712VDy+XqLpEh+bAvw+/cmPPgjZ6/62yd
         pViMybLQa/ENneWVVg7mx6O0NC+Shm85xi3gIXQTyofi7RZgTVvr6EwFV59gpor+qRLq
         I+IzrL1AyfNNym2RoK00R8EHo9SnNb3Kp41HlNLrv3zZCD+n9OJM79b1n6G6br/TgXr4
         haNLouMesYAoUKFA585pMccUsBMFyzI130UFkZtnyNYS5cQaKPZHAzz3ErQbqDYyXpDf
         Kg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749723192; x=1750327992;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAaUGNrB3gisYCVSsO6qM9UyrwByeIh4rLQB2sgV4Ig=;
        b=lrVeLYVXibG0J3MuqmNs3Au7PA9LS0G3N7Jq+Wq15XJfyDH+zgTjO2MZ6R6u4vPCWs
         e665LW8E96+mW70vCBkykKOOjlmS1iYnwonRYo7YgwyqVKnQIN/1b8c6bAW59SWzVDFH
         kJW6Ynk89d1QRxXb+IvX2QLjTamKGAB4IwRuVYbD0wevz0jgWwt/TwPCa5ycZOq3jFrq
         tGXlIjWWbWPjg/6cD0/+7Qsd8LyKey5EYXq9nYqj3LXizvE72HLtgOaQ/2jA/FoMo6h8
         CKo+vVVZA0HXH5huCRyv6HvLmhltV6eRTd3HydMbrbt5AvNbpK/4RmyYh8PDHXq50aCs
         cWKg==
X-Forwarded-Encrypted: i=1; AJvYcCVSsY/Q/AylrpwNnbA2Gpijpcj53dRkD9d1ghg2JgByM8S6wY8D2qHz+9xPZVkwAZPQu22up4EP1Dk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypBT04jCsD0BuqQ4BxXrWyoCGqKnSPtQgEQXbxzmSu3XhhUt1w
	L0O8+X3hQap/DAF0bp4FGrvxRd/4URRJuy/WeY4ERGtk7xQYLhjYrPvAT+OKQeRGtg==
X-Gm-Gg: ASbGncucZq9jwazlBdoytBl7W+uzoIokcW4bti56/ur6g6YQNGHiH1SuSN36vCy37Fo
	7UsqdDvNCyIhu3cvu1GyvxGc8BjZbH8uHKeKePHkycIYt6I2ipoI3KqyMhOqEODzQxdABgrewSE
	CukL/h8FFKgrizNPsn6qmB1bgmdKeAMkTTlWFEb5YiveU4CHsOVYEh7dtr87qWA0qn2um+E4pcs
	HFvpZFAlHxuqlAaD9fYBBK9Om9C6x8xGtbeFtMa95SMHnPHlQo04TuZTrLNK/lykYwpR11aUGjO
	EEwpDN68mytbLIj9X6ZzS6ukVaGYhQ2tICOexcOYxdRR+qYvWjsS9ZucffaeeHWJ9PpKXde+Jwg
	vi23TRagKzDhW+9+xeN2jcYAbysrzMfvDr3X67RXV+kP3fYI=
X-Google-Smtp-Source: AGHT+IE5UMV7jxpa0yOd1PWPmt1tR5Ts0WQojQVJMylT3dKwSrgnuV35VasKhBmDqxtnqLYyq2CxIQ==
X-Received: by 2002:a05:6000:4304:b0:3a4:f7ae:77e8 with SMTP id ffacd0b85a97d-3a55869b507mr5621712f8f.15.1749723192609;
        Thu, 12 Jun 2025 03:13:12 -0700 (PDT)
Message-ID: <d45da0fa-0ba4-4929-94ac-52ef83bb8926@suse.com>
Date: Thu, 12 Jun 2025 12:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/18] xen/cpufreq: refactor cmdline "cpufreq=xxx"
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-6-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -69,8 +69,55 @@ enum cpufreq_xen_opt __initdata cpufreq_xen_opts[2] = { CPUFREQ_xen,
>                                                          CPUFREQ_none };
>  unsigned int __initdata cpufreq_xen_cnt = 1;
>  
> +static const char __initconst cpufreq_opts_str[][5] = {
> +    [CPUFREQ_none] = "none",
> +    [CPUFREQ_xen] = "xen",
> +    [CPUFREQ_hwp] = "hwp",
> +};
> +
>  static int __init cpufreq_cmdline_parse(const char *s, const char *e);
>  
> +static bool __init cpufreq_opts_contain(enum cpufreq_xen_opt option)
> +{
> +    unsigned int count = cpufreq_xen_cnt;
> +
> +    while ( count )
> +    {
> +        if ( cpufreq_xen_opts[--count] == option )

Instead of this, "while ( count-- )" would likely be slightly better;
less risk of an edit to the loop body (however unlikely that may seem
right now) then bypassing the decrement.

> +            return true;
> +    }
> +
> +    return false;
> +}
> +
> +static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
> +{
> +    int ret = 0;
> +
> +    if ( cpufreq_opts_contain(option) )
> +    {
> +        printk(XENLOG_WARNING "Duplicate cpufreq driver option: %s\n",
> +               cpufreq_opts_str[option]);

Do we really need such a warning?

> +        return 0;
> +    }
> +
> +    cpufreq_controller = FREQCTL_xen;
> +    cpufreq_xen_opts[cpufreq_xen_cnt++] = option;

This could do with (at least) an assertion that we indeed don't overrun the
array.

Jan

