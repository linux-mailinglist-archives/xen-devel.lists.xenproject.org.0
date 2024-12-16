Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A869F3317
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 15:24:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858139.1270400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNC0l-00034R-7h; Mon, 16 Dec 2024 14:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858139.1270400; Mon, 16 Dec 2024 14:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNC0l-00032D-54; Mon, 16 Dec 2024 14:23:51 +0000
Received: by outflank-mailman (input) for mailman id 858139;
 Mon, 16 Dec 2024 14:23:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNC0j-000327-IR
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 14:23:49 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cfe19df-bbb9-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 15:23:47 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38637614567so1847626f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 06:23:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8016120sm8179812f8f.23.2024.12.16.06.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 06:23:46 -0800 (PST)
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
X-Inumbo-ID: 5cfe19df-bbb9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734359027; x=1734963827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jwaRtNXHGtnfWOWK+zlhQ+m7hPHIQFVIRx06ln/6DSU=;
        b=gupY2DhCUenMeJMFOaujEzQYoUKIgwSAxw4KI5Z6FiFEJdsRSLR76ROPPyOuCiNtmU
         2uU5biSj94/Lr3k79KmMaITtXtew9QEyubqaoEtchf3C5m2NYrQOoK71DTvy5HEcNZyS
         1XpiEoGz3ypwuYS8bfdugqUg7bBrQfmefd2nZEYkxROtwHcpe9QhG/0vb+BO51QZe2rd
         a9oW9i8NWSHVm8aa1EviaAekLhMYmgupa96Z1TdBI0Vf3+aGb1kux704laawCIk8bdJ0
         ez0h5HNQOSP9nwfJvVeJTSE2BQt4k5j0+SLJ95GvuJ6NTiOTGtt90Qp/nwIJdmsNtKSz
         2OXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734359027; x=1734963827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwaRtNXHGtnfWOWK+zlhQ+m7hPHIQFVIRx06ln/6DSU=;
        b=lhfCfHj50bbSdbyGJ4yHujwfEWz8RGIRc4SUD9bKZ1XwdFozCtOlWNdx0p3uIDjzrr
         gf+hht6Xo2gmF6qEGgzAw2Fk8di6DUgi0uHfs5jZOHlZYzDI//4ygkpt7QFO4h412Gox
         +8Pp01DpHUGmeScQa723Xl51J9NwyI+ZcWjcyrEa1kObdMszXCorddM/EYOx586uHuv+
         Avcp9IDL1bhuAlTQIezpQfg0gtvGNyu3SzdvfAK/sbQVghC4fDT0VpwNRfLIo5LeL8j6
         S0MhjLEOSezc7VPRD350hsUQ0K6SHFYbAm7uib1LvFRvjRyYDYg9Ej/ZX/+DpXmwMBrN
         PtjA==
X-Forwarded-Encrypted: i=1; AJvYcCVrEOv7r/Am9ks+l19iTx0zg73SvcIMFO0oPVlo+7a3pqEoIrH47KvlJSLR3bpag7/SQ1oYvQJa5fc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8mpGyktdXNmWpL5gEKpCvHm2Bwl2YwwmKCDali06/i13LaD1G
	Tm6Qpb+oYhVejXeObXaTXCIQeS6b0Azyr1gVEurJv2b5haifNqEdU9VUfdRiNA==
X-Gm-Gg: ASbGncuRhr07E8Mpd3MW4eejZluiT0asyfh/axg9xTbKaguWWBqWngidcFxkZLkBVAH
	7PaMzCMxezudPORT+sityXuv4iL2RGf6mGaUVi8gaZLmjlSkRDBgHKHGZRCu4xHH3M1pS3stWE+
	+rtzlaOjAgkPxmh+3/4v3q3YcBKG21n+wWsz8YZi9jTmgRAz624FV/Pc+6Nnrz7DUCINGshdaI6
	JKfNh8/Or5fQ6WJu+FT5M+RYAvwOEgdHsDn4qildlfYPOypB6y6zA5hKB9je/q3SdhJfYFktSnJ
	SjDhKYnZszhSj77he27rzNGXszMRhXG9znv+W9ALhw==
X-Google-Smtp-Source: AGHT+IHZR8Sk54lblWHkVSoC8FNLgq7w35pkD3KnKRy5Ffewb/0yBx/S1iZ9PbF0CRu58LQAp1aAPg==
X-Received: by 2002:a05:6000:4613:b0:385:ed16:c8b with SMTP id ffacd0b85a97d-38880ad1d9emr9897752f8f.23.1734359027100;
        Mon, 16 Dec 2024 06:23:47 -0800 (PST)
Message-ID: <19c9ef65-a5bd-4d81-89dc-c780d3ead8b8@suse.com>
Date: Mon, 16 Dec 2024 15:23:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen/riscv: implement data and instruction cache
 operations
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
 <bb6191b21bd387f265e0e25322a30f4ade6e8b3b.1733937787.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <bb6191b21bd387f265e0e25322a30f4ade6e8b3b.1733937787.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 18:27, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -7,6 +7,7 @@
>  
>  #include <xen/bug.h>
>  #include <xen/const.h>
> +#include <xen/errno.h>
>  #include <xen/types.h>
>  
>  #include <asm/atomic.h>
> @@ -148,9 +149,27 @@ static inline bool pte_is_mapping(pte_t p)
>      return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
>  }
>  
> +static inline int clean_and_invalidate_dcache_va_range(const void *p, unsigned long size)
> +{
> +#ifdef CONFIG_QEMU
> +    return 0;
> +#else
> +    return -EOPNOTSUPP;
> +#endif
> +}
> +
> +static inline int clean_dcache_va_range(const void *p, unsigned long size)
> +{
> +#ifdef CONFIG_QEMU
> +    return 0;
> +#else
> +    return -EOPNOTSUPP;
> +#endif
> +}

So testing on real hardware will then effectively become impossible, until
someone goes and implements these?

> --- /dev/null
> +++ b/xen/arch/riscv/platforms/Kconfig
> @@ -0,0 +1,5 @@
> +config QEMU
> +	bool "QEMU aarch virt machine support"
> +	depends on RISCV_64

I understand Arm has it like this, but: Is QEMU really a sufficiently non-
ambiguous name to use? Is the RISCV_64 dependency really needed?

> +	help
> +	  Enable all the required drivers for QEMU riscv64 virt emulated machine.

This line looks to be slightly too long now (after you apparently unwrapped
what Arm has).

Jan

