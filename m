Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B4C95007B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 10:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776073.1186225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdnIG-0000qY-RI; Tue, 13 Aug 2024 08:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776073.1186225; Tue, 13 Aug 2024 08:54:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdnIG-0000oX-OM; Tue, 13 Aug 2024 08:54:16 +0000
Received: by outflank-mailman (input) for mailman id 776073;
 Tue, 13 Aug 2024 08:54:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdnIF-0000oB-1D
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 08:54:15 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cfdf8eb-5951-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 10:54:13 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a611adso6150122a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 01:54:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd1a5df843sm2789607a12.73.2024.08.13.01.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 01:54:11 -0700 (PDT)
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
X-Inumbo-ID: 9cfdf8eb-5951-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723539253; x=1724144053; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AOBUvD3OMc0VHS5L27ULzk7dlY/S8+Su/4Gmbu6759g=;
        b=L6zhF3ePHwPn5XuQGjkwUyjvvTFesNdfFGe+jpXEdcP+xr0M6i6oOeZqZxjAV2Cv3s
         uMS6EsKB3abwgemUvnb50Hnf2jJvlDigMUspnQS29KAOk78Hd7kTsFpNmiEnK+DLej2o
         DyfOCeNuk5Xt60RCFoT65LiMdtsvsQn/t+lLnMT8Z7V8yN1mPwtYvqHZbVtuyCjxdAz6
         ZUJQ8B4jx4JBbcW4gdkiZ/zUoBnduPq3gKT3VWTVGedzlgCsG0vJPZFC1sHmbCrsbBvR
         MMVKOOPKztlCBt5jKBw1x7wAmo9AQprDGV9lFfUYlkEIf0MYKruCzq3y1h1KuyHVZ/ic
         IXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723539253; x=1724144053;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOBUvD3OMc0VHS5L27ULzk7dlY/S8+Su/4Gmbu6759g=;
        b=Q04WSBEZfnJIOtOfJYve+5uXfxMkjS45RtjawH/pzXH57LpMHnPN2VZD+Z+mfj4EhQ
         aKBRceAcWTKl6Rbh6dGef4RW/HyCY+l9DDi1zSbYxz2bYigApjy7Y+aYEh9VS20is8jI
         ZNDcyLC3O+dVQurSLqqV5L0q6YHl1pwoD3xPOUMeW3U4V5A9otsQfsOKQ7EnmmPIoAec
         i36qYBJV5SwHkB06TspgXSGpE+PksVcbfS1nadGs/K9kHeHuN/75waWASmw+QS/n4jLQ
         zTAn8dVcUazArmYpMW0e09EX4on/bUQYoCrgnzFtIbbRvOXyuHcVGoddVuRJmTnAWyj+
         ZrDw==
X-Forwarded-Encrypted: i=1; AJvYcCUWXdY8p0dj05y0SnT0a0Jw6ETX2JFaLZiDcnp555e0x05WQp1oYmPrWE0Pf466xyoUOXzeZIBetv+eeym1BQtMIjoXrheS9DGJTevMG2s=
X-Gm-Message-State: AOJu0Ywc/pSAlftL9N4OHSlB75MTMZtlOXkmUi2xDqrMcobiyNsrbDlY
	btPWvXKPVhEiLCd9FKVxLxaKyY9WWWINcx8GPiMuHA67TJY+nzW5qcaOTtryMA==
X-Google-Smtp-Source: AGHT+IFH/VsQtL/RDrWkpGWAyXGefw4nSD8P7mZ1QN62yx708ZCC1eh4Wj1wuX4EMe6LXkXV1dG2gw==
X-Received: by 2002:a05:6402:d06:b0:5a2:2654:7fd1 with SMTP id 4fb4d7f45d1cf-5bd44c78c9bmr1573150a12.36.1723539252687;
        Tue, 13 Aug 2024 01:54:12 -0700 (PDT)
Message-ID: <e0285026-40c5-4316-8129-d07801a9c233@suse.com>
Date: Tue, 13 Aug 2024 10:54:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] xen/riscv: introduce functionality to work with
 CPU info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
 <452e2960d1f064a2e3abcaae1ac354f48aafd24c.1723214540.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <452e2960d1f064a2e3abcaae1ac354f48aafd24c.1723214540.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.08.2024 18:19, Oleksii Kurochko wrote:
> Introduce struct pcpu_info to store pCPU-related information.
> Initially, it includes only processor_id, but it will be extended
> to include guest CPU information and temporary variables for
> saving/restoring vCPU registers.
> 
> Add set_processor_id() and get_processor_id() functions to set
> and retrieve the processor_id stored in pcpu_info.
> 
> Introduce cpuid_to_hartid_map[NR_CPUS] to map Xen logical CPUs to
> hart IDs (physical CPU IDs). Add auxiliary macros cpuid_to_hartid()
> for convenient access to this mapping.
> 
> Define smp_processor_id() to provide accurate information,
> replacing the previous "dummy" value of 0.
> 
> Initialize tp registers to point to pcpu_info[0].
> Set processor_id to 0 for logical CPU 0 and store the physical CPU ID
> for the current logical CPU in cpuid_to_hartid_map[].
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>  - wrap id with () inside set_processor_id().
>  - code style fixes
>  - update BUG_ON(id > NR_CPUS) in smp_processor_id() and drop the comment
>    above BUG_ON().
>  - s/__cpuid_to_hartid_map/cpuid_to_hartid_map
>  - s/cpuid_to_hartid_map/cpuid_to_harti ( here cpuid_to_hartid_map is the name
>    of the macros ).
>  - update the commit message above the code of TP register initialization in
>    start_xen().

I guess that's once again "comment", not "commit message"?

> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -12,8 +12,32 @@
>  
>  #ifndef __ASSEMBLY__
>  
> -/* TODO: need to be implemeted */
> -#define smp_processor_id() 0
> +#include <xen/bug.h>
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
> +    tp->processor_id = (id);         \
> +} while (0)
> +
> +static inline unsigned int smp_processor_id(void)
> +{
> +    unsigned int id;
> +
> +    id = get_processor_id();
> +
> +    BUG_ON(id > NR_CPUS);

>= ?

> --- a/xen/arch/riscv/include/asm/smp.h
> +++ b/xen/arch/riscv/include/asm/smp.h
> @@ -5,6 +5,8 @@
>  #include <xen/cpumask.h>
>  #include <xen/percpu.h>
>  
> +#define INVALID_HARTID UINT_MAX
> +
>  DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
>  DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
>  
> @@ -14,6 +16,14 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
>   */
>  #define park_offline_cpus false
>  
> +void smp_set_bootcpu_id(unsigned long boot_cpu_hartid);
> +
> +/*
> + * Mapping between linux logical cpu index and hartid.
> + */
> +extern unsigned long cpuid_to_hartid_map[NR_CPUS];
> +#define cpuid_to_hartid(cpu) cpuid_to_hartid_map[cpu]

How wide can hart IDs be? Wider than 32 bits? If not, why unsigned long?
If so, what about RV32 (which generally you at least try cover where
easily possible)?

Is there a reason this needs to be a separate array, rather than being
part of struct pcpu_info?

> @@ -40,6 +41,19 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  {
>      remove_identity_mapping();
>  
> +    /*
> +     * tp register contains an address of physical cpu information.
> +     * So write physical CPU info of boot cpu to tp register
> +     * It will be used later by get_processor_id() ( look at
> +     * <asm/processor.h> ):
> +     *   #define get_processor_id()    (tp->processor_id)
> +     */
> +    asm volatile ( "mv tp, %0" : : "r"((unsigned long)&pcpu_info[0]) );

Perhaps be on the safe side and also add a memory barrier?

Perhaps be on the safe side and do this absolutely first in the function,
or even in assembly (such that initializers of future variables declared
at the top of the function end up safe, too)?

Also nit: Blank please between closing quote and opening parenthesis.
(Otoh you could omit the blank between the two colons.)

> --- /dev/null
> +++ b/xen/arch/riscv/smp.c
> @@ -0,0 +1,4 @@
> +#include <xen/smp.h>
> +
> +/* tp points to one of these per cpu */
> +struct pcpu_info pcpu_info[NR_CPUS];

And they all need setting up statically? Is there a plan to make this
dynamic (which could be recorded in a "fixme" in the comment)?

Jan

