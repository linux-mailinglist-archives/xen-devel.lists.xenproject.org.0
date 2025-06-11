Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45011AD5A32
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 17:21:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011874.1390398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPNFC-00089X-Ny; Wed, 11 Jun 2025 15:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011874.1390398; Wed, 11 Jun 2025 15:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPNFC-00086Y-KW; Wed, 11 Jun 2025 15:20:02 +0000
Received: by outflank-mailman (input) for mailman id 1011874;
 Wed, 11 Jun 2025 15:20:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPNFB-00081J-6H
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 15:20:01 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89aa672b-46d7-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 17:19:59 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a361b8a664so5535340f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 08:19:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0eb0f1sm9219153b3a.169.2025.06.11.08.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 08:19:58 -0700 (PDT)
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
X-Inumbo-ID: 89aa672b-46d7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749655198; x=1750259998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x3403/vazUymk0RGnXWKuHJGeaVp4ALuTSVCw56osog=;
        b=fWGUIokcIrPd7NZv1mg7edrMpN2ByEuS30ptChTT+Nm4d44+KW3GGf1C9baIrf7Rv0
         3vajlcixSq1Y6VGJ4wQX7P7u6Fn5BoxkBRKlpNpwbR+J+V1PqLHIKDuPBvRZi2ZtMBsM
         uAnXjoz2mbuiyTduY50x21AT3b5ifj4CHx5T097M9aAgRPw7pE7B2pgEFC5eMvFH4Us2
         r3SMv3nNY+iDC6NsElmOOSeF/RID0N1U/ViqnnsF+TispfpOfHUSE/p81axvwIKd9YjF
         LO7jE6yVJYIVWr4rGpRFu7/+jzkAxusLjRpDMRdJ431geXGgaMKSP4Kf6tUFvFMXRPrd
         nV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749655198; x=1750259998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3403/vazUymk0RGnXWKuHJGeaVp4ALuTSVCw56osog=;
        b=GTkjvEpOUukarOSu0YebI7mlZum6VP7dzHRNai65Cp2jQM8H1F9bwiOg4+LXBaHXT6
         VKO7bqzfZTv7rGziSO1bZnC/Gg+jHR61BDgu2bSKNdcXSuUWwUdmHYL3cFjIrxiPjadS
         wTWZBqCHPL5lu1L6RaJyClUonlI386z0JnHQ8HtmuVY5VSkJ+gySMRwPJ9/uD9Jn8Uq0
         tPESA/Ysdj+t6kADhsL/+COm4FRg1ru1jTtyet2f55/NnKDCWue6qhoeFzqJFE6Y4p7e
         FU7QxY5GeSK/7uYHMKp2UI6zspQhpHXWca1b1w+pQuE4kyl6l0DbSXoYKy5tVh5/x1jO
         2NIw==
X-Forwarded-Encrypted: i=1; AJvYcCX067G7ja0zHaCbZVnmjTtNjtowrxwJJOzdUGeltvTApEXEcDpQOHlTM4lLFQLCroerIlW9uxKoom8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMO3N9bIh1fw5o7K4K4Y+Ky0mPSs4eb7bF06L1ZcyuOR9PhOnL
	J72qdKZb0BANMBM/h2aimw/1ruSLbk2qEYZfmhnXKYhyTaqap3j2/X2lCY/xw27qHw==
X-Gm-Gg: ASbGnctYQx/Ru8AVxeUOuv0pLWPV7ygMgCX6uDJzbR3y2RhQPh9VEdrzvsFDqOmEMBe
	EnVQDQJ3pdjQ0/iGZoQ9rqHwToBPYLvuhZ3OA832l6+a30uzYtsDDwBHjN+9sXu/iIY4/WC1M/Z
	YJh668Dk86I2jE4J5aQjB8UaM96Sfj1nLIqn5K8sEOL7xHHZngm9uJ1YR/svkp3PFghBSSnnD4l
	tagI3fcaCyQPvr8yasao1XlKkjjyvIuIrDitBWDjqzE86zVLHfgbE3jVYWxHKY/2YlHa7n8bV6h
	eGUOBvYOqNWv8fn6lAIKHNOpt1oSBPvDHe9BqW5vsUeMBd4CVQcvxesdLZg1WzZvEBZO2tPGuMe
	q8S4z/VXJnLaKp/sIKFhA/5iDDp1Y2cUBXKuQUdkGap7urBA=
X-Google-Smtp-Source: AGHT+IFxnPPwUw3DO4zTIpLr1dx4fs7xrh6LY7bgF7/OXwPxIfS2dgVTHYcQ4xAyE4Ii8CQqbcb4ow==
X-Received: by 2002:a05:6000:288e:b0:3a4:ebc2:d6ec with SMTP id ffacd0b85a97d-3a5586f26bfmr2996346f8f.14.1749655198507;
        Wed, 11 Jun 2025 08:19:58 -0700 (PDT)
Message-ID: <0d60d42f-d844-41b5-a8ca-bdfe7883d15b@suse.com>
Date: Wed, 11 Jun 2025 17:19:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/18] xen/pmstat: guard perf.states[] access with
 XEN_PX_INIT
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> Accessing to perf.states[] array shall not be only guarded with user-defined
> hypercall input, so we add XEN_PX_INIT check to gain safety.

What is "guarded with user-defined hypercall input"? And what safety are we
lacking?

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -228,10 +228,13 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      ret = copy_to_guest(op->u.get_para.affected_cpus,
>                          data, op->u.get_para.cpu_num);
>  
> -    for ( i = 0; i < op->u.get_para.freq_num; i++ )
> -        data[i] = pmpt->perf.states[i].core_frequency * 1000;
> -    ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
> -                         data, op->u.get_para.freq_num);
> +    if ( pmpt->perf.init & XEN_PX_INIT )
> +    {
> +        for ( i = 0; i < op->u.get_para.freq_num; i++ )
> +            data[i] = pmpt->perf.states[i].core_frequency * 1000;
> +        ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
> +                             data, op->u.get_para.freq_num);
> +    }

Going from just the code change: You want to avoid copying out frequency
values when none have been reported? But when none have been reported,
isn't pmpt->perf.state_count (against which op->u.get_para.freq_num was
validated) simply going to be 0? If not, how would callers know that no
data was handed back to them?

Jan

