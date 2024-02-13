Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D44853204
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 14:34:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679903.1057692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZsv0-00058F-Pp; Tue, 13 Feb 2024 13:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679903.1057692; Tue, 13 Feb 2024 13:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZsv0-00056g-M9; Tue, 13 Feb 2024 13:33:50 +0000
Received: by outflank-mailman (input) for mailman id 679903;
 Tue, 13 Feb 2024 13:33:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W/Jz=JW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZsuz-00056X-H8
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 13:33:49 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8302d66e-ca74-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 14:33:45 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-511898b6c9eso2613430e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 05:33:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k9-20020a05600c1c8900b00410d7e55e5asm5979328wms.3.2024.02.13.05.33.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 05:33:45 -0800 (PST)
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
X-Inumbo-ID: 8302d66e-ca74-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707831226; x=1708436026; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vkTO5zSlzkJtpY0MPB6f8Repo9RXVis+7FLHryO9m30=;
        b=fLN8BB9MmuNYY4W640TLWe6hrPOhRn8KHjjN9tEUoQMopXGcLi/X7qxOAzzyIUZV/8
         QKGaNVM4Zp7UYtVdDjkDiLGI+IbICMb7usyoiWSJQMd8I51Yo6giEfq1BJsIqG/K0koL
         nSsWsqOVb7NSyf9VkSmR/fm1BDvfyKpdVVBs3/mKn1b/JbOtTKmVcjUkixAIFRP0+F1o
         8yQ2opB2q5sRyijMxyrJlzH9/fF84v0fPHvHgIHJZJx7dSR+pBAcE6BqKv14BAPcqw35
         n/YkzNEC7lWouLPVdT/bviW+kelf20bgSteg5rhVUnuGWcoat61WLmxy9f0YS7Txyglg
         Ymsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707831226; x=1708436026;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vkTO5zSlzkJtpY0MPB6f8Repo9RXVis+7FLHryO9m30=;
        b=tB7WrU9NM4ZGrW6OrrRSHly8vQFnS+ugbOG5BnwTvzIUI4Oa5BmqkGUhwbZPertYEY
         nuBHqjwxMPcwL7QTgqElWDMxFWUibOKaRciT+ET+FvdYm6guTn2rKKW/gBY8NFeisR58
         1HZF5ngnYG0J1E6yYwZ/vFnYlg/qV6kkz52oDwaiBG2JUgYnBkmB67/3hjpY8oFP7XY/
         ifkwTKk/Mo8LJq/bCI6mq/KfxXyQUn1Mzfx6SVAqZHVtIxqdZJkv1iFEkmQAU0WafXtd
         GRUYuqVJH8NQ+NRSzJRbd9vPK+GKQQKQ2fCpMzzgROlUO+qOooiU5xQW1hOIoFM29vrl
         81XA==
X-Forwarded-Encrypted: i=1; AJvYcCUTfaAFPUcDcHM1DsTAzkbDoSZAwbAKLBNHcrk5zsPI+k7/l9mm60xH2H2BUuQndY77ShsRIrdfKqY7u95Xl+vXfq+dxYr9JFdPAgfSVX8=
X-Gm-Message-State: AOJu0Yz7bYy3UDkpqQSV2QBCi8o+yCl7YKvzi3yIcKD1ZnMSjXqQTM3m
	tcaAJwjTHZ9K9VYvzwjJhR8rTUIVm2aAvlBTAdIdaXsV4heBhFHs+6MBo5H6Dg==
X-Google-Smtp-Source: AGHT+IHcj3x6nvAL7HVr4bPP42Ixi1io8v+s4J0nTS7NJr1uE6k67EtoqOMHc/uhJlmhI382/1Qk+g==
X-Received: by 2002:a05:6512:5d5:b0:511:87b5:7ddb with SMTP id o21-20020a05651205d500b0051187b57ddbmr4862133lfo.37.1707831226053;
        Tue, 13 Feb 2024 05:33:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVd1A1yc0QgMvdpXaMOJvsnTVfODSzpxYia1m5rE8gIR46x6vRTXbXxIY+5kN2QS1bVAu+hRhgt/3r3PjSIe0wZo3oUPqp8ldnVl5gM2r8Yufv3PlJWkFGmhQ1sPwLwnfT1db04twQkEfUnGJVuzn40KmW+ZQqQbnpXaTn1Y64GYhdgiUeD9i1l9rYU94lR89Z/PYd/L6DzU4T04AtpGnk7jQaoPbFUvD/c80t+aQztkRUhDUZXvOwo7g/QSarbbFiZCsifkQ+caDvyXma8gh6EGhS6GXtsyWWZtpYc3UB3NtAibLn1gQ==
Message-ID: <6be5102a-624c-463a-9821-c618d110ce7a@suse.com>
Date: Tue, 13 Feb 2024 14:33:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 25/30] xen/riscv: add minimal stuff to processor.h to
 build full Xen
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <9efbc232f64b6192cf83f865b8987846fe082720.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <9efbc232f64b6192cf83f865b8987846fe082720.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -45,6 +45,13 @@ config RISCV_ISA_C
>  
>  	  If unsure, say Y.
>  
> +config TOOLCHAIN_HAS_ZIHINTPAUSE
> +	bool
> +	default y

Shorter as "def_bool y".

> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zihintpause)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zihintpause)

So for a reason I cannot really see -mabi= is indeed required here,
or else the compiler sees an issue with the D extension. But enabling
both M and A shouldn't really be needed in this check, as being
unrelated?

> +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23600

What's the linker dependency here? Depending on the answer I might further
ask why "TOOLCHAIN" when elsewhere we use CC_HAS_ or HAS_CC_ or HAS_AS_.

That said, you may or may not be aware that personally I'm against
encoding such in Kconfig, and my repeated attempts to get the respective
discussion unstuck have not led anywhere. Therefore if you keep this, I'll
be in trouble whether to actually ack the change as a whole.

> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -12,6 +12,9 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +/* TODO: need to be implemeted */
> +#define smp_processor_id() 0
> +
>  /* On stack VCPU state */
>  struct cpu_user_regs
>  {
> @@ -53,6 +56,26 @@ struct cpu_user_regs
>      unsigned long pregs;
>  };
>  
> +/* TODO: need to implement */
> +#define cpu_to_core(cpu)   (0)
> +#define cpu_to_socket(cpu) (0)
> +
> +static inline void cpu_relax(void)
> +{
> +#ifdef __riscv_zihintpause
> +    /*
> +     * Reduce instruction retirement.
> +     * This assumes the PC changes.
> +     */
> +    __asm__ __volatile__ ("pause");
> +#else
> +    /* Encoding of the pause instruction */
> +    __asm__ __volatile__ (".insn 0x100000F");
> +#endif

Like elsewhere, nit: Missing blanks immediately inside the parentheses.

> +    barrier();

It's probably okay to be separate, but I'd suggest folding this right
into the asm()-s.

Jan

