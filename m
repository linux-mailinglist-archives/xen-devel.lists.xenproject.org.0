Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA47881299
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 14:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695918.1086225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwFo-0005rg-QX; Wed, 20 Mar 2024 13:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695918.1086225; Wed, 20 Mar 2024 13:45:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmwFo-0005pD-LP; Wed, 20 Mar 2024 13:45:16 +0000
Received: by outflank-mailman (input) for mailman id 695918;
 Wed, 20 Mar 2024 13:45:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmwFm-0005p6-TY
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 13:45:14 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 134936ef-e6c0-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 14:45:12 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a45f257b81fso884596566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 06:45:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k23-20020a1709063e1700b00a4661caeed7sm7300279eji.48.2024.03.20.06.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 06:45:12 -0700 (PDT)
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
X-Inumbo-ID: 134936ef-e6c0-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710942312; x=1711547112; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MJHwRbdqumhmMAU912wFafkBvn6i8kLPZastUG278yc=;
        b=dqfhnpVx+HjTpxcNMKks2SDGuZWENAxVMmturoPL6+gNoTy+PrH0RwH8oeYh5d2qC3
         Ja4RsIqXSTNOmFYbBasvUION2O+P/cbUSlHfmBj4rfBqLsrRS9tR/Lcg4JEV4UZ0m87w
         5JqJA9GSUp9YRC86A4j26WM/sXtKuOUU14AIIVA5DKqHoxyYiLEHqqEB7Tbad05Of+Nt
         nJcDyhE5Od8n8KuIEn/uEnu0b5LJdKlIcUfoOFdf4LU5CFUjTi/aDNNZ/aP3Ie4vkb/U
         3NEQIWiYiCHv/IVj6GX+QslYQ1v6JzdKfbDXS4r/ZGoHCIdQ9DNdg490qJ4GGEahK6Sz
         egkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710942312; x=1711547112;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJHwRbdqumhmMAU912wFafkBvn6i8kLPZastUG278yc=;
        b=qyT1pQpDWsiIO7yTHy2gC8Y0pazEt1pHnMidAT5fNrZxKIejV9LBCfTo/tZxWgdQHP
         83gOBmvqVk2XIs7+HWfG7ektSaGzANe9aEbnGIPilsG4nJba43AXN9DjKnoKZjwuNFKn
         YAkN7BA0j5yCerUgVPJukoNqEtsQQS/VSNtXltPM/bZMHipZ7kE9Ovf2JJjOHwMRcb/a
         eiugImec3XYYCo1ULCekk/RL8puDIKNvwrfPxwcDRJCj9wQ0TF5i4JWciEUCgv1/+vM8
         jsXSHUNL+6zPlu6SYV38W0MVK7mIrvGtPKTjX0H0R1UiUQV9G4+9+N6vFbTvdrctUE7r
         0hRg==
X-Forwarded-Encrypted: i=1; AJvYcCUFoXJXTPhWpYs7wzJ+QTZbHiDGjCIz1cge10gG5I/1/hzKCbxCZUVuqNAl4YpesPETlGyS3mf3tBFQGNo2JwunEolUBulhgz9oi63apk4=
X-Gm-Message-State: AOJu0YxC6VIJmzprOTFmCNdWY0Il5gyjiehFrAJW5XpefTSnhKxnSDLM
	Vw2ksn60M9AlIOuqKNe3bED5O1jv+uCmQr23sQiyRkgGA9pgLMzwBHTWZT6Emg==
X-Google-Smtp-Source: AGHT+IGDlr2Kz8YrdZBAUi3YzMckE2ASVw0i2DruNNgjHjRo8gnKtfbQ+kc6lCxjjlP0Ciz9hdJMQw==
X-Received: by 2002:a17:906:468f:b0:a46:d591:873c with SMTP id a15-20020a170906468f00b00a46d591873cmr1354441ejr.18.1710942312231;
        Wed, 20 Mar 2024 06:45:12 -0700 (PDT)
Message-ID: <dd9fb309-d89b-4658-8a1d-1c22758a6a95@suse.com>
Date: Wed, 20 Mar 2024 14:45:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] xen: Switch to new TRACE() API
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
 <20240318163552.3808695-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240318163552.3808695-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 17:35, Andrew Cooper wrote:
> @@ -736,9 +736,19 @@ static void vlapic_update_timer(struct vlapic *vlapic, uint32_t lvtt,
>              delta = delta * vlapic->hw.timer_divisor / old_divisor;
>          }
>  
> -        TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(delta),
> -                        TRC_PAR_LONG(is_periodic ? period : 0),
> -                        vlapic->pt.irq);
> +        if ( unlikely(tb_init_done) )
> +        {
> +            struct {
> +                uint64_t delta, period;
> +                uint32_t irq;
> +            } __packed d = {
> +                .delta = delta,
> +                .period = is_periodic ? period : 0,
> +                .irq = vlapic->pt.irq,
> +            };
> +
> +            trace_time(TRC_HVM_EMUL_LAPIC_START_TIMER, sizeof(d), &d);
> +        }

Instead of this open-coding, how about

        if ( is_periodic )
            TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, delta, delta >> 32,
                       period, period >> 32, vlapic->pt.irq);
        else
            TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, delta, delta >> 32,
                       0, 0, vlapic->pt.irq);

thus improving similarity / grep-ability with ...

> @@ -1208,8 +1218,8 @@ void vlapic_tdt_msr_set(struct vlapic *vlapic, uint64_t value)
>  
>          vlapic->hw.tdt_msr = value;
>          /* .... reprogram tdt timer */
> -        TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(delta),
> -                        TRC_PAR_LONG(0LL), vlapic->pt.irq);
> +        TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, delta, delta >> 32,
> +                   0, 0, vlapic->pt.irq);
>          create_periodic_time(v, &vlapic->pt, delta, 0,
>                               vlapic->pt.irq, vlapic_tdt_pt_cb,
>                               &vlapic->timer_last_update, false);
> @@ -1222,8 +1232,8 @@ void vlapic_tdt_msr_set(struct vlapic *vlapic, uint64_t value)
>          /* trigger a timer event if needed */
>          if ( value > 0 )
>          {
> -            TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(0LL),
> -                            TRC_PAR_LONG(0LL), vlapic->pt.irq);
> +            TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, 0, 0,
> +                       0, 0, vlapic->pt.irq);
>              create_periodic_time(v, &vlapic->pt, 0, 0,
>                                   vlapic->pt.irq, vlapic_tdt_pt_cb,
>                                   &vlapic->timer_last_update, false);

... these.

> @@ -1476,8 +1486,19 @@ static void lapic_rearm(struct vlapic *s)
>                (uint32_t)tmict * s->hw.timer_divisor);
>      is_periodic = vlapic_lvtt_period(s);
>  
> -    TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(period),
> -             TRC_PAR_LONG(is_periodic ? period : 0LL), s->pt.irq);
> +    if ( unlikely(tb_init_done) )
> +    {
> +         struct {
> +             uint64_t delta, period;
> +             uint32_t irq;
> +        } __packed d = {
> +             .delta = period,
> +             .period = is_periodic ? period : 0,
> +             .irq = s->pt.irq,
> +        };
> +
> +        trace_time(TRC_HVM_EMUL_LAPIC_START_TIMER, sizeof(d), &d);
> +    }

Same here then.

Other than that you had an ack from me for this already, which you may
very well retain / reinstate.

Jan

