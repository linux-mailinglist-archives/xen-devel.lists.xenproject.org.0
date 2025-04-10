Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECA4A84446
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 15:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945711.1343852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rgO-0004hv-3r; Thu, 10 Apr 2025 13:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945711.1343852; Thu, 10 Apr 2025 13:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rgO-0004fk-0z; Thu, 10 Apr 2025 13:11:04 +0000
Received: by outflank-mailman (input) for mailman id 945711;
 Thu, 10 Apr 2025 13:11:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2rgM-0004Mp-BP
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 13:11:02 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f984715-160d-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 15:11:00 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so5372635e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 06:11:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d89389f72sm4678192f8f.42.2025.04.10.06.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 06:10:59 -0700 (PDT)
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
X-Inumbo-ID: 3f984715-160d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744290660; x=1744895460; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s4DAJzFIDzzDLXLHYWDPPr8NuaBtrMYzoPLQrKsVwN4=;
        b=N+k/upMyYWj5ot/J419PzdYynuVPRUP08ktYAyePr0qObl9ymxYCYjwaPY0GnO/jTF
         crQZpr5UFgh2kD2e5I3jpYXVgBdK5XxJiSDC0svXAn+HOt+uICO509Kj3pXviuHgZ5G9
         WH4a3lyXwCqeU8WFWZY9/BlK1F7APh7Dlq1jWAHL/Tu/bK6WtwGtbP89Iq+B/3SGa//u
         Pqt9lzPV1TCtOBP0Ayrz5O0prspIGxKzanTRcLdv36djbV0wT8clxTtCYmrDhKgpE1/T
         Ul32I9l9P9q9AZpyejtZPJAmaniwY7EOKcrvBvUSZs4Y4n7O/eGmjVNVB0lw8uwZ60vX
         kNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290660; x=1744895460;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4DAJzFIDzzDLXLHYWDPPr8NuaBtrMYzoPLQrKsVwN4=;
        b=Hw497ogniRTXs2CNNcT7MFeJfvoI402qh0XJS1GDmKKE0EV8NJf+Tp79T0gaeRiLTU
         BANRcldn0MNUToTESLPq4IV23Q5AQ/fgZ86/zRIeUJXZ1lMiS0r4sHRfby41lheYWi0F
         4D1o06QX/Yep0Y5lvW6ZcIFkvvRu98QG0bblkFCUvDBl27GFrz2xm8Rt8lI6jgnJhRHM
         ORQyURNHZ2lbVuOsdOlLrdTMSPN+S6Oy4H1QXsD3AqiD2v3qjAqO1CoTNGGpIK6UVs0c
         ARTdOpRwET2uWpwUQKbyfNJ7TGJDCz7HemBG72yNYMLeeaqYIOU3W5lNvSYdM3xECTB7
         hXlg==
X-Forwarded-Encrypted: i=1; AJvYcCXhydzSsK4pcMhRarSzwj+dDFye692TsPx4TQVKyXPG+8j+//j59Pe1m6GI4/iep3sKjKGA9lKpqBE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8a+Yn2Lk6Kluoqdh0/mcOWQ3hvNzjwrXz5E21I4SjSVNDYQMy
	LAo34RJxe7zCH96NS2yxTFi/42Z8tVZirQQmIQ3DYkr1W0CbzKKSZuqZ1vvJKg==
X-Gm-Gg: ASbGncsYPKmo3kstI44xaQCKCUK+ZY3OtRF1q4G9976dNr829QShZeUWbOYj1WggyY3
	onNXCq8S0CUSthT9eeUjleRVz0VHYFkt5MqTTlggi6SdxITG5cHpt/mi9j39oE/EuegxiMHQ6Y7
	ku6V/KGbRdm6W/xlOXWMO3udANp0qrRsNOP3FdaWunB+QxEkMqtRKe2V7vf7Nfc604O8sPrfMIM
	UzVSKM0ffgkK4ofkz2XRRJLedMZCWItYWOu3HpIRMU3mDLYJ6vRu/lgNVVqlgtAFWacn5+hPiJQ
	iALOuzszUl8ayuTD86mxTl3onghNMxB0P5f/5QHCUQKBezgrSvt3jqDohgzlbo5UefN//wlEnrC
	x3mYhykOlrzM6K3Grf/YugNEVbQ==
X-Google-Smtp-Source: AGHT+IEUnvgvy3MLOQTE9zVGaOM+JvZpSJQiOJRaTG2YG2LNCOqOaX59beoqpIRToWWSxCeXcU8yuQ==
X-Received: by 2002:a05:600c:46cb:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-43f2f0fd059mr24684255e9.16.1744290660045;
        Thu, 10 Apr 2025 06:11:00 -0700 (PDT)
Message-ID: <18277077-2cf0-466f-8bde-f7955806bcb2@suse.com>
Date: Thu, 10 Apr 2025 15:10:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/14] xen/riscv: introduce smp_clear_cpu_maps()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <ce3460b3857cca9e6f3072a8ddd50b31cb46b855.1744126720.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ce3460b3857cca9e6f3072a8ddd50b31cb46b855.1744126720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:57, Oleksii Kurochko wrote:
> Initialize cpu_{possible, online, present}_map by using smp_clear_cpu_maps().
> 
> Drop DEFINE_PER_CPU(unsigned int, cpu_id) from stubs.c as this variable isn't
> expected to be used in RISC-V at all.
> 
> Move declaration of cpu_{possible,online,present}_map from stubs.c to smpboot.c
> as now smpboot.c is now introduced.
> Other defintions keep in stubs.c as they are not initialized and not needed, at
> the moment.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/Makefile          |  1 +
>  xen/arch/riscv/include/asm/smp.h |  2 ++
>  xen/arch/riscv/setup.c           |  2 ++
>  xen/arch/riscv/smpboot.c         | 15 +++++++++++++++
>  xen/arch/riscv/stubs.c           |  6 ------
>  5 files changed, 20 insertions(+), 6 deletions(-)
>  create mode 100644 xen/arch/riscv/smpboot.c
> 
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 0c6c4a38a3..f551bf32a2 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -10,6 +10,7 @@ obj-y += sbi.o
>  obj-y += setup.o
>  obj-y += shutdown.o
>  obj-y += smp.o
> +obj-y += smpboot.o
>  obj-y += stubs.o
>  obj-y += time.o
>  obj-y += traps.o
> diff --git a/xen/arch/riscv/include/asm/smp.h b/xen/arch/riscv/include/asm/smp.h
> index 5e170b57b3..188c033718 100644
> --- a/xen/arch/riscv/include/asm/smp.h
> +++ b/xen/arch/riscv/include/asm/smp.h
> @@ -26,6 +26,8 @@ static inline void set_cpuid_to_hartid(unsigned long cpuid,
>  
>  void setup_tp(unsigned int cpuid);
>  
> +void smp_clear_cpu_maps(void);
> +
>  #endif
>  
>  /*
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 4e416f6e44..7f68f3f5b7 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -72,6 +72,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      remove_identity_mapping();
>  
> +    smp_clear_cpu_maps();
> +
>      set_processor_id(0);
>  
>      set_cpuid_to_hartid(0, bootcpu_id);
> diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
> new file mode 100644
> index 0000000000..0f4dcc28e1
> --- /dev/null
> +++ b/xen/arch/riscv/smpboot.c
> @@ -0,0 +1,15 @@
> +#include <xen/cpumask.h>
> +#include <xen/init.h>
> +
> +cpumask_t cpu_online_map;
> +cpumask_t cpu_present_map;
> +cpumask_t cpu_possible_map;

__read_mostly for all of them, perhaps (if CPU hotplug isn't expected to
be supported) even __ro_after_init for the latter two?

As to cpu_possible_map - do you predict that you'll actually use it? Arm
does (and instead has only a fake cpu_present_map), but on x86 we get away
without.

> +void __init smp_clear_cpu_maps(void)
> +{
> +    cpumask_clear(&cpu_possible_map);
> +    cpumask_clear(&cpu_online_map);

What's the point of these? All three maps start out fully zeroed.

> +    cpumask_set_cpu(0, &cpu_possible_map);
> +    cpumask_set_cpu(0, &cpu_online_map);

These are contradicting the name of the function. The somewhat equivalent
function we have on x86 is smp_prepare_boot_cpu().

> +    cpumask_copy(&cpu_present_map, &cpu_possible_map);

Another cpumask_set_cpu() is probably cheaper here then.

Jan

