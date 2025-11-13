Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3841C56E3B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 11:37:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160927.1488973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJUhf-0008Vp-Fw; Thu, 13 Nov 2025 10:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160927.1488973; Thu, 13 Nov 2025 10:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJUhf-0008Tg-DF; Thu, 13 Nov 2025 10:37:23 +0000
Received: by outflank-mailman (input) for mailman id 1160927;
 Thu, 13 Nov 2025 10:37:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJUhd-0007uQ-FS
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 10:37:21 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb2e9cea-c07c-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 11:37:19 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b727f452fffso279496566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 02:37:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda8d69sm134702666b.50.2025.11.13.02.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 02:37:18 -0800 (PST)
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
X-Inumbo-ID: bb2e9cea-c07c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763030239; x=1763635039; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H6dVcWosJ7I6Kkwur9ex04TNB6MAFRxEteR0K6IOoAA=;
        b=KtQ0myC5CKH85fBCR+MHKb6jTOwYWolGS8m8xNqrhl1qdUuHDbiUIcvL6QKS5wguDl
         gyydNErbx9280eRD63LLZWh8/iQv3q1+BrVwDJXhZ0FVd1YIesJYtxc9HvwFU5BxKMXY
         Vc131kbHOOCx1vkGQZ3TUrMMrqNYGei7faYIl8b1thAfFZb1HKl3mjPy3zpJXGW9ItLZ
         SwKDMh/CMhavEKwwc0Bi1dflmDpipe3mv/qqNQkuxuBDgM7PWa1uWvVjhej1sce4+N2L
         9pTaRXvtFh3RKKlg7vptmxy+Pb9CB21rCZ+DUq3ISKrLxFGkt3Elbgxu5p6MV9Eum2Hs
         GrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030239; x=1763635039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6dVcWosJ7I6Kkwur9ex04TNB6MAFRxEteR0K6IOoAA=;
        b=PMWOW+DORc68AUmNsxlp5o+eTT1BpK+QkwJTwi9Oe4gJ1gxQOslTcnRjXHoHPGVxpo
         AnEQUjNDDkABE45ZjU6cL7chBiX6YH5EY7IFz9xWyXzSPpfgpLvWfqDyf87ZrEMDfMhx
         ohoVknjL+h7ZGyuHnL+ZCxkzRNjYBF8GI7Ykae/AXMNSuocAiLTEQ8n7oH6XorXuH/xV
         1Rny2ObL1GnLvcd/FXgMovTo0jOGBrNO89/t7e7wgoWy5b4Nt0MbrG2pr9KytqrLbDtc
         rnNUKXcT/xwnQBkqJ1d2ygvTKlHuNuxCMMwyLZcTCdafWx2+4wr/qjO92wRepjsBgOWa
         LtAg==
X-Forwarded-Encrypted: i=1; AJvYcCXbyPUYeJOLTTFuXk4lZrFBynFfjfp4ZCo6UHeY6/s0VeVQCPb0xT0YwwRa404SyhaULI3zhqDEI3w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwazUqIuzQLeCMFbshKLvv0UvE0FTllFbPFPUGuYTrNTiNBFMEZ
	BGj+83+U8IlHMC5O8uOSSsbdwwnQMLXPmmL1MeSGhB/N7ibYPj06kcT1CqIodQBAhw==
X-Gm-Gg: ASbGncvzrCTxzJ5cHAeiu6LztDAygh0t9rx90AzwmC6xy7zRAJPnx9JlIYc0xUN6GLA
	gqoo8Pu5pdkuN0HlBQXGvlMZhGSnJGT9tCtXQZb+lQHYRucLqHEYKWiBQyWxoBTV0KnkTkEk7wk
	9Yn2TYeKDE7uWcZjJ+4eLQeeNykBY5LnxNww6A9U41SC6NlHEP2czVHsZgEKUkRGDsyV6yzVB6w
	LiAwjQNrTJhAZ4Wvgwa3FIvXoU4N5LnB9H6ocfwYDCEMqR/2syk9IuHPRsR4rQTxkH7c3c5AJuo
	ZXVwyfW9/yWeMYi4VIvLUllhp3mliMnaQZEWaqmdS5Q4NS45PV2x3eFGgGBNP4/orrK8VSjw51Z
	DFQCGDQN6UWjIqMm+YO9i/dY8KrlkuenCQrvkzMNUnTGgy/cj94Fub3d+TccCu9vBWtKkLEPh1N
	aD5XRpB54Ki2jnzQqVqoxb1LlBoDoQVnAtr4vtZyiYdSi7DbHP8EtdvVThEW99bgINh2CdqT0ID
	vs=
X-Google-Smtp-Source: AGHT+IHOhqpL6Wcjb1RIVcl4yJSLenhKuyI5EeSc4Kuayssr7gCl74tW6cku5q03WgGWg1GE3zb1EQ==
X-Received: by 2002:a17:907:74c:b0:b70:83a2:3f5a with SMTP id a640c23a62f3a-b7346956cb2mr325525066b.0.1763030239247;
        Thu, 13 Nov 2025 02:37:19 -0800 (PST)
Message-ID: <901e9a91-60f0-4b9b-a989-fbd64cf40fb1@suse.com>
Date: Thu, 13 Nov 2025 11:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] smp: Move cpu_up/down helpers to common code
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
 <e0fe3bb03af9c612605a2a5dd9b5670d0428fa1a.1762939773.git.mykyta_poturai@epam.com>
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
In-Reply-To: <e0fe3bb03af9c612605a2a5dd9b5670d0428fa1a.1762939773.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2025 11:51, Mykyta Poturai wrote:
> This will reduce code duplication for the upcoming cpu hotplug support
> on Arm64 patch.
> 
> SMT-disable enforcement check is moved into a separate
> architecture-specific function.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Solely from an x86 perspective this looks okay to me, but on Arm you introduce
...

> --- a/xen/common/smp.c
> +++ b/xen/common/smp.c
> @@ -16,6 +16,7 @@
>   * GNU General Public License for more details.
>   */
>  
> +#include <xen/cpu.h>
>  #include <asm/hardirq.h>
>  #include <asm/processor.h>
>  #include <xen/spinlock.h>
> @@ -104,6 +105,37 @@ void smp_call_function_interrupt(void)
>      irq_exit();
>  }
>  
> +long cf_check cpu_up_helper(void *data)
> +{
> +    unsigned int cpu = (unsigned long)data;
> +    int ret = cpu_up(cpu);
> +
> +    /* Have one more go on EBUSY. */
> +    if ( ret == -EBUSY )
> +        ret = cpu_up(cpu);
> +
> +    if ( !ret && arch_smt_cpu_disable(cpu) )
> +    {
> +        ret = cpu_down_helper(data);
> +        if ( ret )
> +            printk("Could not re-offline CPU%u (%d)\n", cpu, ret);
> +        else
> +            ret = -EPERM;
> +    }
> +
> +    return ret;
> +}
> +
> +long cf_check cpu_down_helper(void *data)
> +{
> +    int cpu = (unsigned long)data;
> +    int ret = cpu_down(cpu);
> +    /* Have one more go on EBUSY. */
> +    if ( ret == -EBUSY )
> +        ret = cpu_down(cpu);
> +    return ret;
> +}

...unreachable code, which - for the case when RUNTIME_CPU_CONTROL=n - won't
even be rectified by the next patch.

Jan

