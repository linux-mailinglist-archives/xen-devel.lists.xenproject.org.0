Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAEF86B2C2
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 16:10:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686694.1069022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLYf-0006Dw-Ci; Wed, 28 Feb 2024 15:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686694.1069022; Wed, 28 Feb 2024 15:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfLYf-0006CJ-9u; Wed, 28 Feb 2024 15:09:21 +0000
Received: by outflank-mailman (input) for mailman id 686694;
 Wed, 28 Feb 2024 15:09:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfLYe-0006CD-7M
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 15:09:20 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 583ebc9e-d64b-11ee-afd8-a90da7624cb6;
 Wed, 28 Feb 2024 16:09:18 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so839164766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 07:09:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 tl26-20020a170907c31a00b00a3fb7cafad8sm1950097ejc.39.2024.02.28.07.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 07:09:18 -0800 (PST)
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
X-Inumbo-ID: 583ebc9e-d64b-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709132958; x=1709737758; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YhZYBZtincd42tPqrvkY4hq/5948OK8ztponalyQ6jU=;
        b=Frhw5RUBd9Tn8lhhSCcBeo+cjTVmYmDiuGj2Iwz68oPmqHOrkKv1plvtxkpj0cUGjL
         T6xt3aHrqvDIhUiy2312cBdY+ySow+fRCi12agNjxAULOIEL+wHbHeBOawRKf5WeFmtX
         0dQZVGFKx8maan6oMjZCoOxaUwxfilmO8Nez1UqQx60WNctW51thKSW1NM3YxHS10e/t
         2afM7LagjivzSHJjLHWVL3nJfdqz0lad5Kv5Tr6zA73Nt92IALnX/0bZpVwlWl/xjw4W
         rdaDd10nMCUgs0iqVCwD39/ZkmuXrAZQ/2RbfqB7FI87oJmc9oQDW7EaGFXH3D8LSMxC
         u0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709132958; x=1709737758;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YhZYBZtincd42tPqrvkY4hq/5948OK8ztponalyQ6jU=;
        b=iVogyMErvXDF1Uvo4o1PSvv9POT/TLgj/0hDeCaSSIoHjF7p/na4+HJd4s6Dn3zwUb
         2M9rp+qBcqkW+Y30OIknIPT3SMr/O4feg8oM27uKdMLcRRBdNdm+Pf5O9NLJBAavQcPJ
         HNCk5VLz5yA8zxwp8C0Mp79zrMNORZANokmKGZn/Htmtn3/XHArwUVhmVwlkoNjtHrnC
         lcVmt/1ZkoQL16DqUvx1CeOIo2vPju+mzpBB6q829gtOZafXy4RAfHc4DG1mobWiqUpW
         v3UzbUGdn9bbwENbcUyuTnNjCiJRAByii1cZQSYdpBOyEdQrDPtlH+U7VfE22FvVOyA/
         tZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu4tOXWYfFPH7ImVGn6GHqLX6PF4C0WLhuQ6Gh2J+EIjB82oEPAM93t7hDmBxghKO2n4oHyNwWG81KJwoaIhK/WDvWtowH6ADHqSOSc3k=
X-Gm-Message-State: AOJu0Yxz7PSiq5bbrp4p/QSJglgRX05KQ0N6u+IgjfzsIDEQEPrVnTb8
	PBX0EChL0Iz5aJJJ21OixOpF4HGqTuZD8M77IXdsjN0iLGT6UqDTlY2IaEksFg==
X-Google-Smtp-Source: AGHT+IHHh5meT+s6XrienMEnMAIQbHI5+pawTXEro+uy6nwugh3YlOXbsgdMWeFaZSp+eVXRciaFpA==
X-Received: by 2002:a17:906:d204:b0:a43:da8a:9ec9 with SMTP id w4-20020a170906d20400b00a43da8a9ec9mr2739154ejz.68.1709132958618;
        Wed, 28 Feb 2024 07:09:18 -0800 (PST)
Message-ID: <411c0f54-67cd-4b12-83ec-218703045707@suse.com>
Date: Wed, 28 Feb 2024 16:09:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] xen/spinlock: add
 rspin_[un]lock_irq[save|restore]()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-6-jgross@suse.com>
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
In-Reply-To: <20231212094725.22184-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2023 10:47, Juergen Gross wrote:
> Instead of special casing rspin_lock_irqsave() and
> rspin_unlock_irqrestore() for the console lock, add those functions
> to spinlock handling and use them where needed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch

In how far is this a necessary part of the series?

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -647,13 +647,15 @@ void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs)
>  void show_execution_state(const struct cpu_user_regs *regs)
>  {
>      /* Prevent interleaving of output. */
> -    unsigned long flags = console_lock_recursive_irqsave();
> +    unsigned long flags;
> +
> +    rspin_lock_irqsave(&console_lock, flags);
>  
>      show_registers(regs);
>      show_code(regs);
>      show_stack(regs);
>  
> -    console_unlock_recursive_irqrestore(flags);
> +    rspin_unlock_irqrestore(&console_lock, flags);
>  }
>  
>  void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs)
> @@ -663,7 +665,7 @@ void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs)
>  
>  void vcpu_show_execution_state(struct vcpu *v)
>  {
> -    unsigned long flags = 0;
> +    unsigned long flags;
>  
>      if ( test_bit(_VPF_down, &v->pause_flags) )
>      {
> @@ -698,7 +700,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>  #endif
>  
>      /* Prevent interleaving of output. */
> -    flags = console_lock_recursive_irqsave();
> +    rspin_lock_irqsave(&console_lock, flags);
>  
>      vcpu_show_registers(v);
>  
> @@ -708,7 +710,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>           * Stop interleaving prevention: The necessary P2M lookups involve
>           * locking, which has to occur with IRQs enabled.
>           */
> -        console_unlock_recursive_irqrestore(flags);
> +        rspin_unlock_irqrestore(&console_lock, flags);
>  
>          show_hvm_stack(v, &v->arch.user_regs);
>      }
> @@ -717,7 +719,7 @@ void vcpu_show_execution_state(struct vcpu *v)
>          if ( guest_kernel_mode(v, &v->arch.user_regs) )
>              show_guest_stack(v, &v->arch.user_regs);
>  
> -        console_unlock_recursive_irqrestore(flags);
> +        rspin_unlock_irqrestore(&console_lock, flags);
>      }
>  

I view these as layering violations; ...

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -120,7 +120,7 @@ static int __read_mostly sercon_handle = -1;
>  int8_t __read_mostly opt_console_xen; /* console=xen */
>  #endif
>  
> -static DEFINE_RSPINLOCK(console_lock);
> +DEFINE_RSPINLOCK(console_lock);

... this should remain static. The question therefore just is whether
to omit this patch or ...

> @@ -1158,22 +1158,6 @@ void console_end_log_everything(void)
>      atomic_dec(&print_everything);
>  }
>  
> -unsigned long console_lock_recursive_irqsave(void)
> -{
> -    unsigned long flags;
> -
> -    local_irq_save(flags);
> -    rspin_lock(&console_lock);
> -
> -    return flags;
> -}
> -
> -void console_unlock_recursive_irqrestore(unsigned long flags)
> -{
> -    rspin_unlock(&console_lock);
> -    local_irq_restore(flags);
> -}

... whether to retain these two functions as thin wrappers around the
new, more generic construct.

Jan

