Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C9893F970
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 17:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766912.1177454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYSIw-00047a-Ge; Mon, 29 Jul 2024 15:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766912.1177454; Mon, 29 Jul 2024 15:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYSIw-00045G-Ct; Mon, 29 Jul 2024 15:28:54 +0000
Received: by outflank-mailman (input) for mailman id 766912;
 Mon, 29 Jul 2024 15:28:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYSIv-00045A-1k
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 15:28:53 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4251602e-4dbf-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 17:28:52 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso4117692a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 08:28:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab5151csm519880766b.74.2024.07.29.08.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 08:28:50 -0700 (PDT)
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
X-Inumbo-ID: 4251602e-4dbf-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722266931; x=1722871731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8sev3bBuQNQu80TeieCkWveOqmk53YYSZ7PX3Na1KUc=;
        b=cylvhAaaR/YuE9bGaSF6FN77UoNYj9C9mpoX8yQCf+5dDSW62kABXlUtjXdue3zPSo
         4mj5dI8/tk0krPz08M8bnNTsjJwD3o2zNMHncrGpCpsMRIVjOv0RiSuhxMvHY+OKxDn8
         nS3/nkdHa9vzDNPyjZ2ohhykkkrFrr7xA2JoGcgzXn0+tYikEbJycjFzXKg4QFyvM5X8
         j9X54JxBDRFhdoQ2KBzgv26Nus6BwAhTuQa1lD9NfJsRdSPH84TO1Y+4ch++sV9HtKdO
         xqG9UU1D9D+mug0rhFZjlTL5nF5dbIyikLn4N/iEw1NuGjBi7BsvhOeUsfBVnxruE8fo
         lFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722266931; x=1722871731;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sev3bBuQNQu80TeieCkWveOqmk53YYSZ7PX3Na1KUc=;
        b=s1o8R6/3sLV/h4ILtXMobwpJARmR53chJpm6CY8Tl3DE1B33bPvgpbIrFu3JsY/czk
         TOaxuIbknyZIy1LJaDZtqywLO+82eBD+BN93UnPCWv3jRIZAiaaUkvLItjfqko8YwlJ7
         kLlswKx9HwEQaUFpjqTVjTnAn+YrMwSbr4tb51aZlU4gd9eQP1zhXq75Z5vtUJB863jU
         oS5mqDp8m9LIF2KtD+3zlf3FrSQlhBjudbSQ2UFhXh34X/Sg9WNwJPwGV7BJmCbph4n1
         Y8BzBPIWGw2jNWcRSWgGORWAI5NjqCy6JyneNpBGbCvRvclQVtXKZBPPPqJ2MMH32AcC
         HHMw==
X-Forwarded-Encrypted: i=1; AJvYcCVjSzMDMKwS7WJHTCzIs4g+ucBkNH4bEicpoo4H5OOGXUTkGPu4BymTWarHlgghjgFAWu9yOevSS7rKGrxgK3YYZchHu457ppCVGD5JcKs=
X-Gm-Message-State: AOJu0YzOxqzLIk/MdmKJJzSaX0kmpDtSRnWlEY3ilRX4mYvn70YAIuSF
	92JKjD97qYkSix5owJDV2q3R/V4gH97yNpZFoNZ7/hi/10IjS66U31F2wEOB95l7G027vJSPIuc
	=
X-Google-Smtp-Source: AGHT+IEr/4ovTkjmjNyaBWE92JPKvrnHDcmomEMMDvgJH8Gm9uMpnJgUmSuZ2RQE2feOgkjWy8DOKQ==
X-Received: by 2002:a17:907:e8a:b0:a7a:af5d:f30b with SMTP id a640c23a62f3a-a7d401e02c2mr401844566b.66.1722266931198;
        Mon, 29 Jul 2024 08:28:51 -0700 (PDT)
Message-ID: <113b9d4a-d31c-4491-bf8c-96ac97d98f45@suse.com>
Date: Mon, 29 Jul 2024 17:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] xen/riscv: introduce functionality to work with
 cpu info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <4ea9005d4209e24df9b30a7b3c282276084a3cf1.1721834549.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4ea9005d4209e24df9b30a7b3c282276084a3cf1.1721834549.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 17:31, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -12,8 +12,39 @@
>  
>  #ifndef __ASSEMBLY__
>  
> -/* TODO: need to be implemeted */
> -#define smp_processor_id() 0
> +#include <xen/bug.h>
> +#include <xen/types.h>
> +
> +register struct pcpu_info *tp asm ("tp");
> +
> +struct pcpu_info {
> +    unsigned int processor_id;
> +};
> +
> +/* tp points to one of these */
> +extern struct pcpu_info pcpu_info[NR_CPUS];
> +
> +#define get_processor_id()      (tp->processor_id)
> +#define set_processor_id(id)    do { \
> +    tp->processor_id = id;           \

Nit: Parentheses around id please.

> +} while(0)

While often we omit the blanks inside the parentheses for such
constructs, the one ahead of the opening paren should still be there.

> +static inline unsigned int smp_processor_id(void)
> +{
> +    unsigned int id;
> +
> +    id = get_processor_id();
> +
> +    /*
> +     * Technically the hartid can be greater than what a uint can hold.
> +     * If such a system were to exist, we will need to change
> +     * the smp_processor_id() API to be unsigned long instead of
> +     * unsigned int.
> +     */
> +    BUG_ON(id > UINT_MAX);

Compilers may complaing about this condition being always false. But: Why
do you check against UINT_MAX, not against NR_CPUS? It's not the hart ID
your retrieving get_processor_id(), but Xen's, isn't it? Even if I'm
missing something here, ...

> --- a/xen/arch/riscv/include/asm/smp.h
> +++ b/xen/arch/riscv/include/asm/smp.h
> @@ -5,6 +5,8 @@
>  #include <xen/cpumask.h>
>  #include <xen/percpu.h>
>  
> +#define INVALID_HARTID UINT_MAX

... this implies that the check above would need to use >=.

> @@ -14,6 +16,14 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
>   */
>  #define park_offline_cpus false
>  
> +void smp_setup_processor_id(unsigned long boot_cpu_hartid);
> +
> +/*
> + * Mapping between linux logical cpu index and hartid.
> + */
> +extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
> +#define cpuid_to_hartid_map(cpu) __cpuid_to_hartid_map[cpu]

May I please ask that there be no new variables with double underscores
at the front or any other namespacing violations?

> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -40,6 +40,19 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  {
>      remove_identity_mapping();
>  
> +    /*
> +     * tp register contains an address of physical cpu information.
> +     * So write physical CPU info of boot cpu to tp register
> +     * It will be used later by get_processor_id() to get process_id ( look at

process_id?

> +     * <asm/processor.h> ):
> +     *   #define get_processor_id()    (tp->processor_id)
> +     */
> +    asm volatile ("mv tp, %0" : : "r"((unsigned long)&pcpu_info[0]));

Nit: Blanks missing.

> --- /dev/null
> +++ b/xen/arch/riscv/smp.c
> @@ -0,0 +1,4 @@
> +#include <xen/smp.h>
> +
> +/* tp points to one of these per cpu */
> +struct pcpu_info pcpu_info[NR_CPUS];
> \ No newline at end of file

Please correct this.

> --- /dev/null
> +++ b/xen/arch/riscv/smpboot.c
> @@ -0,0 +1,12 @@
> +#include <xen/init.h>
> +#include <xen/sections.h>
> +#include <xen/smp.h>
> +
> +unsigned long __cpuid_to_hartid_map[NR_CPUS] __ro_after_init = {
> +    [0 ... NR_CPUS-1] = INVALID_HARTID

Nit: Blanks around - please.

> +};
> +
> +void __init smp_setup_processor_id(unsigned long boot_cpu_hartid)
> +{
> +    cpuid_to_hartid_map(0) = boot_cpu_hartid;
> +}

The function name suggests this can be used for all CPUs, but the
code is pretty clear abut this being for the boot CPU only.

