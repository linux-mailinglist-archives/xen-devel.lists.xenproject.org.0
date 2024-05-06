Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EC28BCCB6
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 13:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717557.1119884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3wMF-00077V-PM; Mon, 06 May 2024 11:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717557.1119884; Mon, 06 May 2024 11:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3wMF-00075z-MS; Mon, 06 May 2024 11:18:11 +0000
Received: by outflank-mailman (input) for mailman id 717557;
 Mon, 06 May 2024 11:18:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3wME-00075t-1x
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 11:18:10 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5132ddb6-0b9a-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 13:18:08 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41b782405bbso11752075e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 04:18:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 iv16-20020a05600c549000b0041bff91ea43sm15702641wmb.37.2024.05.06.04.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 04:18:08 -0700 (PDT)
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
X-Inumbo-ID: 5132ddb6-0b9a-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714994288; x=1715599088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bbPEahgx1/JOW7KB6YqGwbxrg9vduTiudeqA5BcZtsc=;
        b=BHzsFoDf9oSLrl5GBlIXwg6WtVfOBIh41cDSr/GraarNBduaveGg7IHVnio2QNBmWv
         ihnwceXVrTKqqueLkm/LjgdHoNlc7CL+VD4VHUv5JW0uNv3bgsoT1cl/JBFpqNoXmqzI
         Tv9xIhd6MXcpV4xUeXyQKQxecMgDgiNqBgKmH2ZFH+qQi5aP067o8TKrEwWFHxXauWJJ
         15BYs5Nbpl6gjWofeOvsp2cj6gpWldiVk+9hZ3ZiBSF0uBnbY4YwpHIKatLkt6Jc65oa
         bog69H6qcRrxlZgkzY9VGax2OFlMa+eOnlNk3oDCdCWgcmsZIwoVXVXLLUuytDvh2do4
         uCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714994288; x=1715599088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bbPEahgx1/JOW7KB6YqGwbxrg9vduTiudeqA5BcZtsc=;
        b=R9sSkvBsomo7JjNgxHvGF0yiA+diGwbLLGPrUWEVqiOpaZGNmH2GSPhz/7H+hNgvNa
         UKYRlDeXNpSK4wx+RrQJfRv4NXmS0D5NV345uK+mxPH0ExDYhPFY4YHegEdKmWeFCIs9
         9qwM4p8HxGfKcKN6HxXZOseK0wPkd1MMQtbqm/SpDuPSFuZYBi5PfiaKsE9RfWi71kH/
         e59+i0VDoFidTAgGgtHAXmfo60bpff7dpyy681Ih4mGdCSMmP2Qf6C0iLeuHaakFgQzh
         c34LkKsHIvL16n4qGhpvGCqZuDJtu2hiHKn8O5Vw5H9PTvwzh32PZTibs7+KfY9LUUm2
         NbOA==
X-Forwarded-Encrypted: i=1; AJvYcCXs1XUk+k8BwHSOxrqOSHcSAi6WzjHIT9/NOz1+65bTUkxUp6HWVq6coujmuAYEwOGrtgymKKODTeRe4RqXKJg3kpgeNzTym67hxH6Ucr0=
X-Gm-Message-State: AOJu0YwoIbeE6MsZro1TW2aXtX20+Jn/DCucwRjwMUBoXDyv+3dzzt3S
	A8BJtTULh2ZzwzgRZUFvO1H+whON1nbXuUBUVnm37u0+iCCHxYjE5Yohj4mMhg==
X-Google-Smtp-Source: AGHT+IEPvgX1YR01s3+KyrpN9dhm8u3W/Unz/twTIDZtWHlIouDEJkkSgV8dx2J5/2hiUbBlMXIXvA==
X-Received: by 2002:a05:600c:34d2:b0:41c:3e1:9dbd with SMTP id d18-20020a05600c34d200b0041c03e19dbdmr6829468wmq.40.1714994288279;
        Mon, 06 May 2024 04:18:08 -0700 (PDT)
Message-ID: <12d7600c-ccfa-430c-9c62-a2402b9620b8@suse.com>
Date: Mon, 6 May 2024 13:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/5] x86/intel: move vmce_has_lmce() routine to
 header
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
 <e759fc187f2e3f23f42666b2a8461ae851591d50.1714640459.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <e759fc187f2e3f23f42666b2a8461ae851591d50.1714640459.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2024 11:14, Sergiy Kibrik wrote:
> Moving this function out of mce_intel.c would make it possible to disable
> build of Intel MCE code later on, because the function gets called from
> common x86 code.
> 
> Add internal check for CONFIG_INTEL option, as MCG_LMCE_P bit is currently
> specific to Intel CPUs only.

My previously voiced concern regarding this was not addressed. If ...

> --- a/xen/arch/x86/cpu/mcheck/mce.h
> +++ b/xen/arch/x86/cpu/mcheck/mce.h
> @@ -170,6 +170,11 @@ static inline int mce_bank_msr(const struct vcpu *v, uint32_t msr)
>      return 0;
>  }
>  
> +static inline bool vmce_has_lmce(const struct vcpu *v)
> +{
> +    return IS_ENABLED(CONFIG_INTEL) && v->arch.vmce.mcg_cap & MCG_LMCE_P;

... the IS_ENABLED() indeed is to stay, the & wants parenthesizing.

Jan

