Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9186D021D0
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 11:29:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197544.1515048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdnG6-0006lc-Ur; Thu, 08 Jan 2026 10:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197544.1515048; Thu, 08 Jan 2026 10:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdnG6-0006jw-R7; Thu, 08 Jan 2026 10:28:50 +0000
Received: by outflank-mailman (input) for mailman id 1197544;
 Thu, 08 Jan 2026 10:28:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdnG5-0006ja-L4
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 10:28:49 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1b55c1b-ec7c-11f0-b15e-2bf370ae4941;
 Thu, 08 Jan 2026 11:28:48 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42fb5810d39so1654947f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 02:28:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0daa84sm15450699f8f.2.2026.01.08.02.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 02:28:47 -0800 (PST)
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
X-Inumbo-ID: d1b55c1b-ec7c-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767868128; x=1768472928; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zNup6adGZkuCQuKzXd+xhAU69SGktIrsd4oRrCyU8M8=;
        b=Zv9OglEcC47QR8ZiixddAmg/TUMg6EcAKM3xpmlWcbErqb/1/WQGDQEy4TOVb+S5P1
         Mx+t8H0PzGGeRx/5RiVYp7CnPyw60FwJUuwaBvV7ik6NyvE2xE5pfUfMt+MNUa9ZCTzI
         QCtud1MT90KjtKhQp6ng3SHtOXsUNdRRpIaMODFCmBZNJ5Pek2BRmNaL1nlHQ0YALh65
         tIdYYIi4JJJxNACPYM80PbZFdSzaI+FqUHmaOzHZJIbtedLxnCxVyh1t3a76t7W6L1qK
         KZqO9j/XPJZaPvtQLQOBtZ33FqOHhx+zCwGapoQLaJHRpX51I+c2hUQD60YQpUiCWBkg
         YSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767868128; x=1768472928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNup6adGZkuCQuKzXd+xhAU69SGktIrsd4oRrCyU8M8=;
        b=i5nDARy5MDdU9NfXkDQmVS0sv2Jy5j+c6FsVCYdU5f1SlJ138FUx2UAbJM6kmueMS7
         xW5J8FSKqZUGpe57KPd+zKZQfjXMbrcz4uQNYkh3fqRpVCXMc6M6q22L4o3UWm35oZye
         CGqP+ts/SY+h0ZSU4DkT7XsJLp+v1HQfhKwxUtsYKqIWPfQtriTja98O0IR4R3o+NtOQ
         qF4VektkloG8E2Wbk3jbFrKiljhxcaMhRheEG/zyKnRFpe+j22UW3BZvqw38s9QD3O4c
         pVIoOMNKbLcpfwKaJJfiuX32xmEop/tLKVqLC4CywAgIsGl3jZODDd55ryEwZvzCNgf9
         epGA==
X-Forwarded-Encrypted: i=1; AJvYcCWYY3pFrPLbC/55Ljb3ptlaCbufYrxE9qpfcVfoGgOFX49h2SUYmETDuPRJamb1R8AAo+VTF4KvtlE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgY8rrl4suBpSxacdXshmlTO6cP3WCgLj3lVeggSAZ4wpU7ycv
	FD5yDRFKdPMhCG/QyuZ1WNo0xC0MkVBdZnpEZUEg/2HZw3lHw4U7RigZSP2C+diL0g==
X-Gm-Gg: AY/fxX7X0CoyC4bWm/GfUjLgKpLYuKzCylgbFdkh/v1+Omy5gP1SyNlr8s3cxAU8BdR
	LRRuc0Fry8x/R/f9MCTgmU1WORRoYrrMW0ZiRsJeIRyBKqkOjYX3JnJprFo2shC2BLY2IG1uXD/
	GeeaH5yQUPHyxBxQ8wM4PEYBH6N8zPStycaWOzvlLnEcHPKoSzl3ardRzIeFPREMY8AyFuxy1C7
	C9muy5tROPEGaidsvh+PisdXKY7iPDX4JkSQZEkkhZG9YCWMm7Iet8VYmnbAiDf7axCI5c6Ok5n
	vIx4tOmhpnA1xLg6qTxPJoDXHB+0X8O074zQ230+8RBVajgStMYOshZlID50lHxGyLkp0mwXoaW
	aWDvcz7pSWVTm/hAV2MJLKhX4IyB37KW6BxovnsaLQSfeABAc9IrICuawOG+5Ofzf0Uh8xWopmR
	YH3CKUOiu7r4ksRlst8Q3gmusA6ckLX+i/H+0c9ND3ABXWPP6dzWVC1IVMLGPApCRgrCq6rkekg
	bpVYO1+r/jBIQ==
X-Google-Smtp-Source: AGHT+IH241JPlrZpjbda0iiIDWOKjPYiM3PYgLFjJAemZquoBsXJDu5G/ikuzNdZyJGl488iPkF3mw==
X-Received: by 2002:a05:6000:40df:b0:430:f742:fbc7 with SMTP id ffacd0b85a97d-432c36328c5mr7024918f8f.14.1767868128142;
        Thu, 08 Jan 2026 02:28:48 -0800 (PST)
Message-ID: <f8808dd1-d571-49ea-8739-ed06dd6c79d1@suse.com>
Date: Thu, 8 Jan 2026 11:28:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/15] xen/riscv: introduce vtimer_set_timer() and
 vtimer_expired()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <8cd3efa488b3da2a6751c92d20bbfeb87b3ba39a.1766595589.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8cd3efa488b3da2a6751c92d20bbfeb87b3ba39a.1766595589.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.12.2025 18:03, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/vtimer.h
> +++ b/xen/arch/riscv/include/asm/vtimer.h
> @@ -22,4 +22,6 @@ void vcpu_timer_destroy(struct vcpu *v);
>  
>  int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config);
>  
> +void vtimer_set_timer(struct vtimer *t, const uint64_t ticks);
> +
>  #endif /* ASM__RISCV__VTIMER_H */
> diff --git a/xen/arch/riscv/vtimer.c b/xen/arch/riscv/vtimer.c
> index 5ba533690bc2..99a0c5986f1d 100644
> --- a/xen/arch/riscv/vtimer.c
> +++ b/xen/arch/riscv/vtimer.c
> @@ -1,6 +1,8 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> +#include <xen/domain.h>

Is this really needed, when ...

>  #include <xen/sched.h>

... this is already there?

> +#include <xen/time.h>

Don't you mean xen/timer.h here?

> @@ -15,7 +17,9 @@ int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config)
>  
>  static void vtimer_expired(void *data)
>  {
> -    panic("%s: TBD\n", __func__);
> +    struct vtimer *t = data;

Pointer-to-const please.

> @@ -37,3 +41,27 @@ void vcpu_timer_destroy(struct vcpu *v)
>  
>      kill_timer(&v->arch.vtimer.timer);
>  }
> +
> +void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
> +{
> +    s_time_t expires = ticks_to_ns(ticks - boot_clock_cycles);

boot_clock_cycles is known to just Xen. If the guest provided input is an
absolute value, how would that work across migration? Doesn't there need
to be a guest-specific bias instead?

> +    vcpu_unset_interrupt(t->v, IRQ_VS_TIMER);
> +
> +    /*
> +     * According to the RISC-V sbi spec:
> +     *   If the supervisor wishes to clear the timer interrupt without
> +     *   scheduling the next timer event, it can either request a timer
> +     *   interrupt infinitely far into the future (i.e., (uint64_t)-1),
> +     *   or it can instead mask the timer interrupt by clearing sie.STIE CSR
> +     *   bit.
> +     */

And SBI is the only way to set the expiry value? No CSR access? (Question
also concerns the unconditional vcpu_unset_interrupt() above.)

> +    if ( ticks == ((uint64_t)~0ULL) )

Nit: With the cast you won't need the ULL suffix.

> +    {
> +        stop_timer(&t->timer);
> +
> +        return;
> +    }
> +
> +    set_timer(&t->timer, expires);

See the handling of VCPUOP_set_singleshot_timer for what you may want to
do if the expiry asked for is (perhaps just very slightly) into the past.
There you'll also find a use of migrate_timer(), which you will want to
at least consider using here as well.

Jan

