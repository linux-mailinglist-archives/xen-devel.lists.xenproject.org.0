Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E413A843B4
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945641.1343803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rOl-0005lf-Mt; Thu, 10 Apr 2025 12:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945641.1343803; Thu, 10 Apr 2025 12:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rOl-0005j4-Jr; Thu, 10 Apr 2025 12:52:51 +0000
Received: by outflank-mailman (input) for mailman id 945641;
 Thu, 10 Apr 2025 12:52:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2rOj-0005iy-UX
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:52:49 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1ab2039-160a-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 14:52:43 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso6949495e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 05:52:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233a273fsm50147495e9.9.2025.04.10.05.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 05:52:42 -0700 (PDT)
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
X-Inumbo-ID: b1ab2039-160a-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744289563; x=1744894363; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfgM1l/4dmks/gLxsp9QrtjrUBAsLktsGldJ/L0y2NA=;
        b=gW+ganqIx3VCGuhnISo1Ejksw/QJMpxztgPO64nFp6wRFTjbZfUHHhDxhXmV6CjL8T
         0TIGmhpsVSQiiW5V744SJE+csmot7+nsL4OXhbV8HO3N3Xyx9Oz0fK/UbX4aVU8SYk6x
         VQDK2OUNDfw67aWfQcIC0pknqH23r1vm4Njc+Z8mQjy+R3CP6QqwOtMViD0DAsg8sJdr
         cJ6ObWBDLAJKu2C9goLWbkC++OcLyJ6UbbuCVWoEIpN+sn45kU1Dha2A8HPReDUa5E8U
         6ntbQAif8iMmhi8kxU8NhHSN4HoMuwLqKw6LM7HFluDYsTBLfCzIRr2CiZ8lOjy7DJwi
         3kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744289563; x=1744894363;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfgM1l/4dmks/gLxsp9QrtjrUBAsLktsGldJ/L0y2NA=;
        b=WdTQ3k+tVw0H/GqOkhyOAx+fOFlkEkFznScAXm+0KHB7AhI4t9HGUluktdF0AorTTT
         4IwOKDKgONVPuPZEvxqNrEmkG824JfidyzIMWcJzwEsR7RL0OSkNZCmPS0/hWVVjzlsA
         rauSfxeFLi0H+vWENZr/1D00U8DsAs/am7Sk63NhP9mT2biG/Wq40iHCJwikWj3omT0m
         imeHBM6ejhf8XEwlRSdbU1v20qKGAFROktGu2dGPJIusHgHCkEa3B9sIR0/wpzSAaJ6E
         9/s04FhV++ZnOl/sqJUT/0xInODAdhlsjhg0yIFIx/AzgE3qkeIHIbar/1my8gk6VmXF
         Ct6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbFGp4IsXUCvHejkQrfQnPXBJdiiIjDrm40Id83J8tl1+Yrqs1VQvi8RPeUFNX/V32cgtVUXDZEg0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrjKourTnI5b1RUPdL9acSgu5ZhZdAPO0CDFSnADOSAblWEFv0
	jBcdXz0zZRNJFWQ2+x+3ebgjbDBV0n+RgVTQa0uxAdJkHKUE++mLcF0Iuq/WjA==
X-Gm-Gg: ASbGncsV8zVgvElsdJGLD8lADLqeSYkLVhiD9CG0lyHKHB0gdfEsIgsVEodzY3SuJAk
	9Bg6v89YI/6LDUrLUaX2Fp6T+haiANTzv57iND+oBsSIS1CY6m3BF6OXYExtjBY6cZnkWgTddgX
	rD+96VsjzSTBGnp+qy6H8WeO9G709BEh3NwYk/t4HPu94sJsEYjeukZ5Myo7rgv1eaCG8x1sV32
	7whfnjdkfMYZ34suApEUhbySsM3uoX5EjbLAGm/vqVpaEtg+Ds//8qK187ZbL+YSCszhRwoAtzq
	bs7NP0Yvz6CkjSy18dGaaM1rvstQl+dxcBY/h41gJtYV6Uf139RYd+bzgqrrCT8IrOc8Mpj84Wx
	y5tLAUZGlK0KOiVTDsQG1PUL5gA==
X-Google-Smtp-Source: AGHT+IEOvJkiigP6QOYZx/eZD8GkV7eMy3tM/VHVtVelGX34hLwm+/ZSV71vMpd6Ig62fmkxQSwgmQ==
X-Received: by 2002:a05:6000:40c9:b0:391:2d76:baaa with SMTP id ffacd0b85a97d-39d8f4d3a7cmr2251782f8f.46.1744289563050;
        Thu, 10 Apr 2025 05:52:43 -0700 (PDT)
Message-ID: <7f26a9cb-a685-4a2a-a470-8c5e94ddc31e@suse.com>
Date: Thu, 10 Apr 2025 14:52:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/14] xen/riscv: implement get_s_time()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <e503aee3ef743210a8188a7da9e70a169dec1287.1744126720.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e503aee3ef743210a8188a7da9e70a169dec1287.1744126720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:57, Oleksii Kurochko wrote:
> @@ -23,6 +24,11 @@ static inline cycles_t get_cycles(void)
>      return csr_read(CSR_TIME);
>  }
>  
> +static inline s_time_t ticks_to_ns(uint64_t ticks)
> +{
> +    return muldiv64(ticks, SECONDS(1), 1000 * cpu_khz);
> +}

Why the extra multiplication by 1000? I.e. why not
"muldiv64(ticks, MILLISECONDS(1), cpu_khz)", getting away with just one
multiplication and a reduced risk of encountering intermediate overflow
(affecting only hypothetical above 4THz CPUs then)?

> --- a/xen/arch/riscv/time.c
> +++ b/xen/arch/riscv/time.c
> @@ -4,10 +4,17 @@
>  #include <xen/init.h>
>  #include <xen/lib.h>
>  #include <xen/sections.h>
> +#include <xen/types.h>
>  
>  unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
>  uint64_t __ro_after_init boot_clock_cycles;
>  
> +s_time_t get_s_time(void)
> +{
> +    uint64_t ticks = get_cycles() - boot_clock_cycles;
> +    return ticks_to_ns(ticks);

Nit: Blank line between declaration(s) and statement(s) please, as well as
ahead of the main "return" of a function.

Happy to make both adjustments upon committing, so long as you agree; then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

