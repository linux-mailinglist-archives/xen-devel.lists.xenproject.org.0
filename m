Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2E4CFE8B4
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 16:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196797.1514512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdVLy-0005ty-KF; Wed, 07 Jan 2026 15:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196797.1514512; Wed, 07 Jan 2026 15:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdVLy-0005rc-H2; Wed, 07 Jan 2026 15:21:42 +0000
Received: by outflank-mailman (input) for mailman id 1196797;
 Wed, 07 Jan 2026 15:21:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdVLx-0005rW-C1
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 15:21:41 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cb19851-ebdc-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 16:21:33 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43246af170aso550931f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 07:21:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df90dsm10442080f8f.20.2026.01.07.07.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 07:21:32 -0800 (PST)
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
X-Inumbo-ID: 8cb19851-ebdc-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767799293; x=1768404093; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ObtFpf/ESWwhgMFs0iRTF/460Gv7mXQWIOwe6+TXYjM=;
        b=V3PvMqHVrb5LErqjPrPSSuWHEKSdq+Ja5SmtrwbietkHxNwprJPANEQaEjT5Q//64N
         PGEUalJCEmU9i3M9yEyZ2tCWgy1MFtIM8eiM4tvdqxWDTdH1ztZISkQYjjDsnS0TYfS3
         h29ryYoV9E6Uoll+yRABkFbcG5lawd1fDAtyINfAPMSMIJfaDF4x564Pe8/e4v8Ofyhy
         4GrZQ6YH1uODB7FwqFEXxE7rBvOMn3CUkGQKjFx1SfUEoJgpv9gFCkdQPt/zpsvTG74o
         m5TIWy697ZisZ4txvucRr47OPEX5CLm9vGSlNUCUgRwFUCMLwVeWAJaqC+uvzOBD261m
         LIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799293; x=1768404093;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObtFpf/ESWwhgMFs0iRTF/460Gv7mXQWIOwe6+TXYjM=;
        b=D6qazMWNt3sac1n2QNnRZv/KKJ1N75vMP43xLm+GPfeUg+JULfMdVB9BX6fJ+W1xfO
         EQ5B3qPjjLmSCm4c85VdwV3hvxC9QyEbCdkyO0bUY9/p0ixPk/tpa1VG1InB30a+5IYJ
         SNr0BnbiiWj2ZhDFIZrFwOVr1uQr3HCRXXi166kk8lskmYC9heFi6jeKGBQdivw89UfR
         ta5q5EtY4rJmcv91ZLYVu2X0DNIf4vARAG9gkzuE7AFvp+ebnw+BZRhadj7XnvjYnjKi
         2eZDVv7CYHzuSWnXLWN2g3xfbuCQ97mI3EZIYcv2UrWAlO17uL7czKR493uVH/GZePHk
         EhrA==
X-Forwarded-Encrypted: i=1; AJvYcCUkNRMzn/zYbp5+qdcx5ziIEUmD+8X/rTG4+B+EyxaFfBfxgF6apSOugnzoQNdmq6CenU57P2hc3iI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNh9+ZSBRWc2ksS+XhjMMHFMRanzdhr/6HsTyy0j85PaTyBDGE
	rYxSuLbObcd3A7IpU0jTgmmJwdbfaGtHtVlsJmTLMcBw2MMx3fHDZxk9ODKrJZ3Dtw==
X-Gm-Gg: AY/fxX5sR8KJvQQkHM+o2s/8mwkWEn/QJxR7nBoQzZ/Ts5Fc3j7So4Wi1wwEf7A0myE
	jP9+rRkTFniAGWeVBqbIcVvKsrSleyzuMRhg+9iEmUK56HJkTGhXgqiZ4aXSNWF8wY2KNuIAH1X
	CO2cPfQkpyzazrpIuzKe6T0AXucZBwh2xzLdIOXJlbSXQKYFCxa/ev66B45W7uGov3ZIRnxuvlF
	roP9+euFYhq/Oz59hyV1wS3VbgmyGkzc+3Li8vjhzYlpg8o1mBQHX9xSXmt9GeeCDao4H/rUEu6
	0kTj1P4q+PmrGPbbVLfzRuJf6Dp8A8xk91qJmA6E8bOMZwOTp5/NDkN1wg2aX5YXvNBZkMsW+Lg
	AoeD/KQrX9F0Z2HpXe65AnBTl57hCbL6kfp5qEbMftOAf0QayN1m5+Ao4UoAALknFb/K+V9n7xL
	+SN/7y0CFBg/NcqYGL3WvL4OCGrSsSigl6ADYJ88BL+1Ov16dDwiNhI7QHNn69s5+D940YeeQtH
	Mg/zm1DV7Pe4A==
X-Google-Smtp-Source: AGHT+IEM8JRmJRcETcV3xxkUew572fSMCjkj6PZqhZCzMMIT7XB+pr2C8wN4tuBTqy3bKKmzqRSmmA==
X-Received: by 2002:a5d:5f44:0:b0:425:86da:325f with SMTP id ffacd0b85a97d-432c3778c2bmr4380832f8f.27.1767799292945;
        Wed, 07 Jan 2026 07:21:32 -0800 (PST)
Message-ID: <c3f7b30e-0b39-42d0-88b5-6a5d0801e428@suse.com>
Date: Wed, 7 Jan 2026 16:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/15] xen/riscv: introduce vtimer
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <94ffc70d3050e532290126560355dc548161f466.1766595589.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <94ffc70d3050e532290126560355dc548161f466.1766595589.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.12.2025 18:03, Oleksii Kurochko wrote:
> Introduce a virtual timer structure along with functions to initialize
> and destroy the virtual timer.
> 
> Add a vtimer_expired() function and implement it as a stub, as the timer
> and tasklet subsystems are not functional at this stage.

Shouldn't those pieces of infrastructure be made work then first? I also
don't quite understand why the subsystems not being functional prevents
the function to be implemented as far as possible. Most if not all
functions you need from both subsystems should be available, for living
in common code.

> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -8,6 +8,7 @@
>  #include <public/hvm/params.h>
>  
>  #include <asm/p2m.h>
> +#include <asm/vtimer.h>
>  
>  struct vcpu_vmid {
>      uint64_t generation;
> @@ -52,6 +53,9 @@ struct arch_vcpu
>      struct cpu_info *cpu_info;
>      void *stack;
>  
> +    struct vtimer vtimer;
> +    bool vtimer_initialized;

Assuming the field is really needed (see remark further down), why is this
not part of the struct?

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/vtimer.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * (c) 2023-2024 Vates
> + */
> +
> +#ifndef ASM__RISCV__VTIMER_H
> +#define ASM__RISCV__VTIMER_H
> +
> +#include <xen/timer.h>
> +
> +struct domain;
> +struct vcpu;

I don't think this one is needed, as long as you have ...

> +struct xen_arch_domainconfig;
> +
> +struct vtimer {
> +    struct vcpu *v;

... this. Question is why this is here: You should be able to get hold of the
struct vcpu containing a struct vtimer using container_of().

> --- /dev/null
> +++ b/xen/arch/riscv/vtimer.c
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/sched.h>
> +
> +#include <public/xen.h>
> +
> +#include <asm/vtimer.h>
> +
> +int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config)
> +{
> +    /* Nothing to do at the moment */
> +
> +    return 0;
> +}

The function has no caller and does nothing - why do we need it?

> +static void vtimer_expired(void *data)
> +{
> +    panic("%s: TBD\n", __func__);
> +}
> +
> +int vcpu_vtimer_init(struct vcpu *v)
> +{
> +    struct vtimer *t = &v->arch.vtimer;
> +
> +    t->v = v;
> +    init_timer(&t->timer, vtimer_expired, t, v->processor);
> +
> +    v->arch.vtimer_initialized = true;

init_timer() has specific effects (like setting t->function to non-NULL
and t->status to other than TIMER_STATUS_invalid). Can't you leverage
that instead of having a separate boolean? (Iirc we do so elsewhere.)

Jan

