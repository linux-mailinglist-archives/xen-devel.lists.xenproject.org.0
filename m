Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92805B29E04
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 11:35:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085800.1444086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unwGh-000375-VU; Mon, 18 Aug 2025 09:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085800.1444086; Mon, 18 Aug 2025 09:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unwGh-00035w-Qq; Mon, 18 Aug 2025 09:35:07 +0000
Received: by outflank-mailman (input) for mailman id 1085800;
 Mon, 18 Aug 2025 09:35:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unwGg-00035q-2i
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 09:35:06 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ef470cf-7c16-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 11:35:04 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb72d5409so626318766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 02:35:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce73e2esm789634666b.39.2025.08.18.02.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 02:35:03 -0700 (PDT)
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
X-Inumbo-ID: 9ef470cf-7c16-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755509704; x=1756114504; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y0h/cw0gX211U0sPkNm2gimTeh/JW3YIboXNlfSM/zA=;
        b=Oi4JeTkoZ9OFi7fwl4RVr230x5lHcFYa0vyd+sLhYO5r6K09fLGaJJKSAYKCRz/VV4
         cS0dm7RuX4EcCmYrAdH9uBM2dDSXS1x+DLa7Eflnut+dM3KksXzv4KZicLhziwblHRVt
         amveK62FE4+OgDR8IKqQxG1h1qf/iKg8p4bLUzCsbf0lx9+jQ0mb5jVYzn01Ln3gsjwE
         75SS86P30ZXGG1u+KJ5iaN7DelrOQLU44v+Vdr55JWtK6mbUeLKusP6zpUct0ea7g5AK
         /2pSL12arLUWs1mIV/hBqG/h40tLkfvUH6WG+kTM8Nnd+Ia5Dz2ksvAIc1VEwGXjefb0
         sJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755509704; x=1756114504;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0h/cw0gX211U0sPkNm2gimTeh/JW3YIboXNlfSM/zA=;
        b=SWIrjZE3WXhsr4cVkYqJNRErkyuPGtzBkAoiWlUMPeKX7LldVCNBquUn33A3wfyXPH
         tERDxqLnXgR3wYOOPE7klKSf7BUMC+mu0BmwgllKPgxRXyqe1s6AIoJPmyBb9OePIoKF
         pYSDxQBbeXZJk2DUrAxfCy8clgcS2wWz3WefTVm7MRF4ZezkV4j/1GQTQKfI3CKcNlSS
         fBekCzv+xf6d3BcBlJX9jyzLsNLF06u9CxDJM5q8QLrOA0Z0PnrQdwCdZvrA2pWxM3sA
         totbNhCZ9Vzl2DXfPpjR/5mn9fnM4AbZ6ujVvmY1x2FYbFBwuaYM/fCi+ZsXnow8ECAk
         KiKw==
X-Forwarded-Encrypted: i=1; AJvYcCXfTYHQ3Q88hWyYY5oMYDUt2KmpLxWEgZB7R2lHxg5cC5ntlaG42ErUVCUeejI2cXczggS9WyHArq4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhfymHCWGXjBTdO/HKC+sCWN5j4HRTpvlfL0glBGgF3qPNoEWR
	u0YMIInem8+85yVmuAdEf4R1PBOD6wn5HQVcNwLsya/8aBarZY7vLE/KdCpY6q7C3Q==
X-Gm-Gg: ASbGncsOKk2CwN3XON9CP47yZb4LdD5tobRNMZYUgZauLeJz47QK1fazBBzEoIBqOwV
	o9jyk+KrUmFDzg3qdUpVovQwopMqw3ZxpMl3wes9uAk+FUXjETgTYz0YeqgFi2HqxiBJvVL6CCI
	Ig8RtQayuhPZdrYnQq03hor81vu0GTbciRFf72sSZP9Z9wWuoeFXVIvPBVme/HwI9ANMAP3pT32
	mgJhVMI/qIZ9PZ9E+R4m7FxLkXx72vHEtf2gtJtlLMoTwPIkv1lJOoMdz3b15nED66jlwIoG65J
	dF754P+oa6M0rzH3KLJdjvOOu47f9Wq4YUmWVhy9HcWSAHnKwofDEWsr3NbOAJu79KJG0uhm75G
	2f/YAVhJuZqR4BlAj1y/IsGMYxru4xeB4DSR9mc67Gy2Bu21vKyldhgy94KI3UsCy7k35iIlLkh
	WEMZVDDybdSNc9fdbUeQ==
X-Google-Smtp-Source: AGHT+IFcYaloBf0HsFv8YN6Nzg2GaDqZD7ji+PjPyzWnEB8lqLV2r12D7BrJ6RxXNlCgngdI97Oz6Q==
X-Received: by 2002:a17:907:3e23:b0:af9:8688:42de with SMTP id a640c23a62f3a-afcdc363c08mr1202263766b.41.1755509704167;
        Mon, 18 Aug 2025 02:35:04 -0700 (PDT)
Message-ID: <1d6494f6-fbef-436f-a379-a98e02b20710@suse.com>
Date: Mon, 18 Aug 2025 11:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/22] x86/traps: Enable FRED when requested
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-23-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-23-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:23, Andrew Cooper wrote:
> With the shadow stack and exception handling adjustements in place, we can now
> activate FRED when appropriate.  Note that opt_fred is still disabled by
> default.
> 
> Introduce init_fred() to set up all the MSRs relevant for FRED.  FRED uses
> MSR_STAR (entries from Ring3 only), and MSR_FRED_SSP_SL0 aliases MSR_PL0_SSP
> when CET-SS is active.  Otherwise, they're all new MSRs.
> 
> With init_fred() existing, load_system_tables() and legacy_syscall_init()
> should only be used when setting up IDT delivery.  Insert ASSERT()s to this
> effect, and adjust the various *_init() functions to make this property true.
> 
> Per the documentation, ap_early_traps_init() is responsible for switching off
> the boot GDT, which needs doing even in FRED mode.
> 
> Finally, set CR4.FRED in {bsp,ap}_early_traps_init().

Probably you've done that already, but these last two paragraphs will need
updating following patch 08 v1.1.

> Xen can now boot in FRED mode up until starting a PV guest, where it faults
> because IRET is not permitted to change privilege.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -274,6 +279,44 @@ static void __init init_ler(void)
>      setup_force_cpu_cap(X86_FEATURE_XEN_LBR);
>  }
>  
> +/*
> + * Set up all MSRs relevant for FRED event delivery.
> + *
> + * Xen does not use any of the optional config in MSR_FRED_CONFIG, so all that
> + * is needed is the entrypoint.
> + *
> + * Because FRED always provides a good stack, NMI and #DB do not need any
> + * special treatment.  Only #DF needs another stack level, and #MC for the
> + * offchance that Xen's main stack suffers an uncorrectable error.
> + *
> + * FRED reuses MSR_STAR to provide the segment selector values to load on
> + * entry from Ring3.  Entry from Ring0 leave %cs and %ss unmodified.
> + */
> +static void init_fred(void)
> +{
> +    unsigned long stack_top = get_stack_bottom() & ~(STACK_SIZE - 1);
> +
> +    ASSERT(opt_fred == 1);
> +
> +    wrmsrns(MSR_STAR, XEN_MSR_STAR);
> +    wrmsrns(MSR_FRED_CONFIG, (unsigned long)entry_FRED_R3);
> +
> +    wrmsrns(MSR_FRED_RSP_SL0, (unsigned long)(&get_cpu_info()->_fred + 1));
> +    wrmsrns(MSR_FRED_RSP_SL1, 0);

In the event of a bug somewhere causing this slot to be accessed, is the
wrapping behavior well-defined, resulting in an attempt to write to the
top end of VA space? (Then again, if the wrapping itself caused a fault,
the overall effect would be largely the same - in many cases #DF.)

Jan

