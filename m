Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC08C74BCC
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 16:05:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167579.1493866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM6EC-0001RE-Jm; Thu, 20 Nov 2025 15:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167579.1493866; Thu, 20 Nov 2025 15:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM6EC-0001Pn-Fk; Thu, 20 Nov 2025 15:05:44 +0000
Received: by outflank-mailman (input) for mailman id 1167579;
 Thu, 20 Nov 2025 15:05:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM6EB-0001Ph-6F
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 15:05:43 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 610f3683-c622-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 16:05:40 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-64175dfc338so1735251a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 07:05:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6453642d32csm2276106a12.21.2025.11.20.07.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 07:05:39 -0800 (PST)
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
X-Inumbo-ID: 610f3683-c622-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763651140; x=1764255940; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ByylHfQnPZvGEQHY3X/YavdxzE54LB3esZlhDtkxop8=;
        b=T2pe0v33shn0/0nKPOmoPc4o8Yi0Xlm7pyxjz8yi85coS1BN35CM/XgeYVf7MHG/tf
         YsMz74zOppw0FFxgUI7t2d1TgCfSB8xMDeRHbgnuPU8Iyk011lJtoGuQvgtyv2AGxPmJ
         2va8Cop2lkQs8YGLoIhd4hL68BUJHGps18TqeBX9S0coZOEZvJ2TKELWLNToXL/BX+hO
         /7cOUczD6MnBPOS2YrE/UDg/gmF++/wWDRwDD9iqhFb7KdTeT1TG4fUInno/V1vbDuWK
         lb/e85HXqjOdyDNGHqfrAPEcdouhqFN/duyQPfHdIiswltu/AEeI+5t29UqNeBzJ7vR0
         Mtzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651140; x=1764255940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByylHfQnPZvGEQHY3X/YavdxzE54LB3esZlhDtkxop8=;
        b=lHSdMKOk9z+WrqDh7cRQU+luGtSCnaY+HXfq6BzrHrFv+MDHVGcy6oYn/gksR8zjSh
         Uu4WQPoiOXDWsEytpa7sSXP9FGBVB1cQe+mLn/bUqXDbIcarMhGe0eKwkDekuF7H9yze
         U0BUG22LeFbbPeqgUIqhcCqMxalyqoS+K7JlsMr+mL6GzPddX6X4Rbovz/ZAyA3mntsU
         kGguv2EXD9Ax1Otj9+A7VzuFwY0B5bYJt2mND3JtmlSGKVnJMnZAdfTWnLx9hf+UweKo
         eeuNnP6WknQSlpEYEUFOE0hUUiJnkszuEgi9AAh1ifcBr2Q7VE2nhACXyNS91y9f2UgY
         uW+A==
X-Forwarded-Encrypted: i=1; AJvYcCXYb4C6/EEUPLk4nKfolzkI6a76ALgWHTM7keXvmjqPZg225gSHENNhs1hXbueO3kltddrYomrwEis=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxl29BUjCH6/t/WZaKym7ksuq3c1rlc7Jw1+6WrAl6xCe+qw7WK
	cYM9XbGja3J907rXDF+l3HKk7sl+yVdpshggvvn+9UxGOAry7cKUMBegryB2+iWyBQ==
X-Gm-Gg: ASbGncvceRLldwas94G/xnyfuqOBC4QlXgfmI/4QzGpG9dB3u5f4JdMNf6n5Qp8Q5kK
	TeIT7o757CitF53sfDzAYtY3AyHbVhzG1592pli6RM4OjE2AkP9fjfItC1eFMPnUmhzB9D8MKg4
	l5rQfZL9yH93otwqCHP7Lh3a9BWzW9x1gjEjfATjz9fHCcZcJwTIJiLwkARVzf0tjt32QwyO4TX
	4APXdE8QdMlcq7XqArLyPl7vf/Edqled6Uze+fG/M7yU4cWS50fxh8ZpR04UTbzbDQI/QGqq54G
	XcYGGlhZA7lvvOFhR/mBNGbDtu9E7fRqjafAd21cNBABdUAcrepb5RNn9FgvD6szjj3m6jCf4Gl
	oEmfgWWdW4K6U3s+UuvORecXilS6Gje6+T4mMnKR+PmvOML98Ka+xvQ4hGiOI+joZvsKb0BPPhE
	GMdIAqOFy9P57fOPdjF18ezxfiMj5zQZlBI8S370RmTn6o1OQhG32VhG53zFjQ7brPdtEYqp4Qv
	IyAa1s/odtFHA==
X-Google-Smtp-Source: AGHT+IFGGYVhdkFxLngxTFOOgzUgeP1CmzYdEg28D8M4laYXpXe2rnGKV9nn1Sd/iTAlLoAI4xIeyg==
X-Received: by 2002:a05:6402:90a:b0:640:c640:98c5 with SMTP id 4fb4d7f45d1cf-645388e3dbcmr2491000a12.34.1763651140179;
        Thu, 20 Nov 2025 07:05:40 -0800 (PST)
Message-ID: <126dc8bb-4f89-4a40-b39a-1b09d78b3eac@suse.com>
Date: Thu, 20 Nov 2025 16:05:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] x86/i8259: redo workaround for AMD spurious PIC
 interrupts
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251120090637.25087-1-roger.pau@citrix.com>
 <20251120095826.25782-1-roger.pau@citrix.com>
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
In-Reply-To: <20251120095826.25782-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.11.2025 10:58, Roger Pau Monne wrote:
> --- a/xen/arch/x86/i8259.c
> +++ b/xen/arch/x86/i8259.c
> @@ -407,21 +407,14 @@ void __init init_IRQ(void)
>          per_cpu(vector_irq, cpu)[LEGACY_VECTOR(irq)] = irq;
>  
>          /*
> -         * The interrupt affinity logic never targets interrupts to offline
> -         * CPUs, hence it's safe to use cpumask_all here.
> -         *
>           * Legacy PIC interrupts are only targeted to CPU0, but depending on
>           * the platform they can be distributed to any online CPU in hardware.
> -         * Note this behavior has only been observed on AMD hardware. In order
> -         * to cope install all active legacy vectors on all CPUs.
> -         *
> -         * IO-APIC will change the destination mask if/when taking ownership of
> -         * the interrupt.
> +         * Note this behavior has only been observed on AMD hardware. Set the
> +         * target CPU as expected here, and cope with the possibly spurious
> +         * interrupts in do_IRQ().  This behavior has only been observed
> +         * during AP bringup.
>           */
> -        cpumask_copy(desc->arch.cpu_mask,
> -                     (boot_cpu_data.x86_vendor &
> -                      (X86_VENDOR_AMD | X86_VENDOR_HYGON) ? &cpumask_all
> -                                                          : cpumask_of(cpu)));
> +        cpumask_copy(desc->arch.cpu_mask, cpumask_of(cpu));
>          desc->arch.vector = LEGACY_VECTOR(irq);
>      }

Doesn't this collide with what setup_vector_irq() does (see also patch 04)? If
you don't set all bits here, not all CPUs will have the vector_irq[] slot set
correctly for do_IRQ() to actually be able to associate the vector with the
right IRQ.

Jan

