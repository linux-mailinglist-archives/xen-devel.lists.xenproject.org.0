Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA5AB3E09A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 12:50:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104394.1455452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut27L-0007PI-8A; Mon, 01 Sep 2025 10:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104394.1455452; Mon, 01 Sep 2025 10:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut27L-0007Mq-5Q; Mon, 01 Sep 2025 10:50:31 +0000
Received: by outflank-mailman (input) for mailman id 1104394;
 Mon, 01 Sep 2025 10:50:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut27J-0007MC-Du
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 10:50:29 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7885196c-8721-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 12:50:27 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b0415e03e25so152174066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 03:50:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff0681aefdsm774185966b.8.2025.09.01.03.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 03:50:26 -0700 (PDT)
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
X-Inumbo-ID: 7885196c-8721-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756723827; x=1757328627; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6d9FTwOsIjtgog//yAxgk5Yz4RZ5ywhBqfV+xhi/VNU=;
        b=gVycCv4qL9LnmoXlb81VjX7XpOjTJONXmP56IvQNja5/Hip/ZRIthEpaBbn+SFbTuN
         PZ2WDK6UdykQ/eFJf5ZapvNoiiNwrAMDlezvsBoLBrxtAkh8XwckW+Ou3bSVRpT9M6Yq
         sCg0GPrnN0Hh7w8GmjGl9NbUdOLlNfep5f9/pIzlR8IYvsiuwbXlMXhfj1tIToVOQ0ov
         WjGhdglTPnUZeQuYNu5JV0UcYYVynfofijhY0OIK32Z/5z8wnBuLiQ7nhGEeX3TAjkCt
         3gUbWP5bUk34fiMjSL6jf8NBYBVNmFLLwV5O6lFbwP+y9p9QrBKiKftU3wXnDEpP/RIS
         SRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756723827; x=1757328627;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6d9FTwOsIjtgog//yAxgk5Yz4RZ5ywhBqfV+xhi/VNU=;
        b=kajPcrHpUw5ZwkN//+ufwCZ6d81rPS+4c3Kr4d9b+pW9g7RKMGBJKFmQKea243VviP
         LVB8RqUl+8I3s4XCJnmQWA1LZa0MbBugg4E1YVYjPy2Dt+j1Z/fQE0QLSryX4hU/nVUG
         cpT2XVgNcSs+fqIh6ijtXilq/YRfdv9Xf2vY3L6ZMl8NmQfnqHuILayDFSidyVHeQ7JF
         CM+wzQ+UkrAHxxxhrGPMPteaealxW35Se/dMVv/sL/xnWqUGV6oXakeB5Tzqg4e3EBqe
         hRaTaBPMe9hyCW4xYyr/wyMiLXPQK7lQSOFuU2VRRoRM8/dKiEHe/zv/N4M4mUmjeyIG
         pq8g==
X-Forwarded-Encrypted: i=1; AJvYcCXHyvMirNk3Pfm7xryuYJ4EUMdX5tTXeBn3jDD+jwscwJNzkGhVpJE/3EB1KHIXIksC0iVM4yNu7wU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5DY2V66J6+Ldc1JbrtzOvquMBXS30cw4PAhSaKwOuz4v9lGzK
	tetUi9n54zk/klp3QAvYU7O/JZ0+6/969QdZoc8BFY9RtnI2KZ7USzwkB13/W7M3Uw==
X-Gm-Gg: ASbGnct4A6fnecD8zN5I/3tp3KHoBzZHV0kY7xPrLgHjVN8G39O6CgTj41SG25DQ/ib
	s/u4RzJCVWt5CHX9nVr4HInPMbRI7DIsRdRXf9eED9TPGi+vF5uKORjVqkHGkgushxNBa53NOXo
	FbjmIf6/eMONaV205popjLHSCV82VGz0U28AsgcoVDJZ72mbwqY/21LtZZmeaVbvlXzlJQzr2EU
	r2YQeLK9MLfURth3AFwa6+nN8toozCY7aLfuXcVgBwjzdolKjW+ncpWQu065Pa/ZoxYz0TpZuzO
	DyxDJbxFuC0ExnfQFgdadqbuOZu/guGMmAQCXkqf2cR0cvDa5p88CcY6ERJBAxbNzEAEqWsa/co
	mxudgqvSRc8C2z4+UDvppKn6CnFPcs4T0Zp3Q05aOaiv8mrgfE8X5MUloP/0LU1vKzym8XG8E45
	ifJtbJAOB8Hzbc6sTA0Q==
X-Google-Smtp-Source: AGHT+IHkx3ELT9yqKVJK86Q6A2sjt0uicsn9i3Lbek1FfZ7AGMAuO0px/S4yr6ge3eqEaYjHyCAxsw==
X-Received: by 2002:a17:907:97c7:b0:afe:b3be:90f3 with SMTP id a640c23a62f3a-b01d8a2fdc5mr781327266b.10.1756723826767;
        Mon, 01 Sep 2025 03:50:26 -0700 (PDT)
Message-ID: <b6adcd89-0a5e-4de8-b72d-8f20534b639a@suse.com>
Date: Mon, 1 Sep 2025 12:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/23] x86/traps: Enable FRED when requested
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-15-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-15-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:04, Andrew Cooper wrote:
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

Nit: That's {bsp,percpu}_traps_init() now, aiui.

> --- a/xen/arch/x86/include/asm/traps.h
> +++ b/xen/arch/x86/include/asm/traps.h
> @@ -16,6 +16,8 @@ void traps_init(void);
>  void bsp_traps_reinit(void);
>  void percpu_traps_init(void);
>  
> +void nocall entry_FRED_R3(void);

Can't we constrain this decl to the sole C file needing it?

> @@ -268,6 +272,52 @@ static void __init init_ler(void)
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
> + * This makes Stack Level 1 unused, but we use #DB's stacks, and with the
> + * regular and shadow stacks reversed as posion to guarantee that any use
> + * escalates to #DF.
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
> +    /*
> +     * MSR_FRED_RSP_* all come with an 64-byte alignment check, avoiding the
> +     * need for an explicit BUG_ON().
> +     */
> +    wrmsrns(MSR_FRED_RSP_SL0, (unsigned long)(&get_cpu_info()->_fred + 1));
> +    wrmsrns(MSR_FRED_RSP_SL1, stack_top + (IST_DB * IST_SHSTK_SIZE)); /* Poison */

So the use of IST_SHSTK_SIZE here (and PAGE_SIZE below) is to have the SL1
stacks "the wrong way round". I first thought this was a mistake, not the
least also due to the typo below. I think this wants commenting upon.

> +    wrmsrns(MSR_FRED_RSP_SL2, stack_top + (1 + IST_MCE)  * PAGE_SIZE);
> +    wrmsrns(MSR_FRED_RSP_SL3, stack_top + (1 + IST_DF)   * PAGE_SIZE);
> +    wrmsrns(MSR_FRED_STK_LVLS, ((2UL << (X86_EXC_MC * 2)) |
> +                                (3UL << (X86_EXC_DF * 2))));
> +
> +    if ( cpu_has_xen_shstk )
> +    {
> +        wrmsrns(MSR_FRED_SSP_SL0, stack_top + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE);
> +        wrmsrns(MSR_FRED_RSP_SL1, stack_top + (1 + IST_DF)  * PAGE_SIZE); /* Poison */

MSR_FRED_SSP_SL1 and presumably IST_DB?

Also (nit) both of these lines are too long; the double blank ahead of * on
the latter one probably also wants dropping.

> +        wrmsrns(MSR_FRED_SSP_SL2, stack_top + (IST_MCE * IST_SHSTK_SIZE));
> +        wrmsrns(MSR_FRED_SSP_SL3, stack_top + (IST_DF  * IST_SHSTK_SIZE));
> +    }
> +}

Because of the intentional asymmetry for SL1, maybe the writing of
MSR_FRED_STK_LVLS would better move below here?

> @@ -356,8 +410,13 @@ void __init traps_init(void)
>   */
>  void __init bsp_traps_reinit(void)
>  {
> -    load_system_tables();
> -    percpu_traps_init();
> +    if ( opt_fred )
> +        init_fred();
> +    else
> +    {
> +        load_system_tables();
> +        percpu_traps_init();

Doesn't this need to stay outside of the if/else, ...

> +    }
>  }
>  
>  /*
> @@ -366,7 +425,8 @@ void __init bsp_traps_reinit(void)
>   */
>  void percpu_traps_init(void)
>  {
> -    legacy_syscall_init();
> +    if ( !opt_fred )
> +        legacy_syscall_init();
>  
>      if ( cpu_has_xen_lbr )
>          wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);

... for this to still be done?

Jan

