Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91138960C74
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 15:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784043.1193399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwUi-00070i-BK; Tue, 27 Aug 2024 13:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784043.1193399; Tue, 27 Aug 2024 13:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siwUi-0006zA-8M; Tue, 27 Aug 2024 13:44:24 +0000
Received: by outflank-mailman (input) for mailman id 784043;
 Tue, 27 Aug 2024 13:44:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1siwUh-0006ti-0P
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 13:44:23 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 773a492f-647a-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 15:44:22 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a86acbaddb4so473481066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 06:44:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e54851a8sm111056766b.29.2024.08.27.06.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 06:44:21 -0700 (PDT)
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
X-Inumbo-ID: 773a492f-647a-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724766262; x=1725371062; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RV+DxkttUXiV0vbnMI++tRBCTodxkM3RRM2Fbm+HshM=;
        b=QCXw+/IbREDojWveGDxuxRYtxZyj6gloJNZUcVvZw5MWF+v+JW9stIpOkUqDsRYXAw
         hh+GBGLYsnIEA1wxpsqaAwuoUqg7EGh8fvy39jgkV2CScWC8qY1TOojY9Xo36LePP/Ww
         e8BgpXCZyqAqep3kYBHEBijmKC7+XROXTogCH+argyJVVW0iia+CRH4BUPFhqHNaV+LY
         RL7jW7LoJ+lPjaYGbVWKNgPBLLlGnmmW/8k2BBJbkm9E8V+WAGmCTrPqANMYXf+5dR5c
         Dcg30CWyL+fN0x7WoxWI5Ua0hbOyuYhmF6Lflc5DVPQcQmbTWqGhqSLjcmHoMY9LrpSK
         rlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724766262; x=1725371062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RV+DxkttUXiV0vbnMI++tRBCTodxkM3RRM2Fbm+HshM=;
        b=RytLMdYzYGUriVEIl+mMsWX0hbJqTjfyi7R0cTQ7KnJiBA69dBDVaqTRtLoJaXmFzx
         4EO/V5SobssSTs1f0DOFD31P/4z9jzEB3LWN+hoMyi7J7fz/e4EchbfWOZ+QOnV6Urfr
         tTbdpL+o8z1zj3HpxyC75rSFQmZHKilk0VvPmcW1yZH+baqLcWd/cHwPcy9AWV4Yz4wg
         LMSrLEJZhvJ5y7Kd3sq3r+oHp2N1vbyaLx52LoSO2r49t4CdG1PoMNA5Or8ilqhmm9fm
         nl1svLfNc4QBebjoBVaBq9EsAggwhXqyX3oqb8mW9VEsqdc94CKFoNlSEfxDTGL5XC8C
         m9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWhpRUq7C4//xQ5mH6+ygL71/SoCU03U7CXsfIzzRZbtef3CXAZBrptC8igMxOgi7qNxoOMWUpUarY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZBlWnNfeASuEAGgxNosczwH+ZTUflRb0I0CykrRGWzdmcbh7X
	/qWSdKtaPqI2zodxZIMxBPjGmN9JDPfwOIv1vC441ClEyqLEAX9tRBNXmj6xSQ==
X-Google-Smtp-Source: AGHT+IEvnosueUjxKJAlsjdlEaPfCYaMCfAi5TnpgUTBxz6I5VlhsOL9aiKGSJDcNxZ1Hn0P90BtnA==
X-Received: by 2002:a17:907:3fa9:b0:a86:43c0:7d2 with SMTP id a640c23a62f3a-a86e35a343emr219788566b.0.1724766261495;
        Tue, 27 Aug 2024 06:44:21 -0700 (PDT)
Message-ID: <8f01fffa-ff7e-4a08-b707-7bf5175b461e@suse.com>
Date: Tue, 27 Aug 2024 15:44:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] xen/riscv: introduce functionality to work with
 CPU info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
 <03a703996ae7300a9eda54283711b19c42a7d116.1724256027.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <03a703996ae7300a9eda54283711b19c42a7d116.1724256027.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2024 18:06, Oleksii Kurochko wrote:
> Introduce struct pcpu_info to store pCPU-related information.
> Initially, it includes only processor_id and hart id, but it
> will be extended to include guest CPU information and
> temporary variables for saving/restoring vCPU registers.
> 
> Add set_processor_id() and get_processor_id() functions to set
> and retrieve the processor_id stored in pcpu_info.
> 
> Introduce cpuid_to_hartid_map() to convert Xen logical CPUs to
> hart IDs (physical CPU IDs).

There's no function of that name anymore.

> ---
> Changes in V5:
>  - add hart_id to pcpu_info;
>  - add comments to pcpu_info members.
>  - define INVALID_HARTID as ULONG_MAX as mhart_id register has MXLEN which is
>    equal to 32 for RV-32 and 64 for RV-64.
>  - add hart_id to pcpu_info structure.
>  - drop cpuid_to_hartid_map[] and use pcpu_info[] for the same purpose.
>  - introduce new function setup_tp(cpuid).
>  - add the FIXME commit on top of pcpu_info[].

Once again "comment" here? And that despite ...

>  - setup TP register before start_xen() being called.
>  - update the commit message.
>  - change "commit message" to "comment" in "Changes in V4" in "update the comment
>    above the code of TP..."

... this?

> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -12,8 +12,33 @@
>  
>  #ifndef __ASSEMBLY__
>  
> -/* TODO: need to be implemeted */
> -#define smp_processor_id() 0
> +#include <xen/bug.h>
> +
> +register struct pcpu_info *tp asm ("tp");

Nit: Strictly speaking there need to be blanks inside the parentheses.
But maybe an exception for a register variable name declaration is okay.

> +struct pcpu_info {
> +    unsigned int processor_id; /* Xen CPU id */
> +    unsigned long hart_id; /* physical CPU id */
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

Nit: This can easily be the initializer of the variable.

> +    BUG_ON(id > NR_CPUS);

I'm pretty sure I pointed out before that this is off by 1: NR_CPUS
itself is invalid, too.

> --- a/xen/arch/riscv/include/asm/smp.h
> +++ b/xen/arch/riscv/include/asm/smp.h
> @@ -5,6 +5,10 @@
>  #include <xen/cpumask.h>
>  #include <xen/percpu.h>
>  
> +#include <asm/processor.h>
> +
> +#define INVALID_HARTID ULONG_MAX

So what if the firmware report this value for one of the harts?

> @@ -14,6 +18,13 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
>   */
>  #define park_offline_cpus false
>  
> +void smp_set_bootcpu_id(unsigned long boot_cpu_hartid);
> +
> +/*
> + * Mapping between linux logical cpu index and hartid.
> + */
> +#define cpuid_to_hartid(cpu) pcpu_info[cpu].hart_id

If I'm not mistaken Misra demands parentheses around the expression
even in cases like this one (where at the use sites you can't really
do anything [that makes at least some sense] to break what the macro
is supposed to do).

> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -55,6 +55,10 @@ FUNC(start)
>           */
>          jal     reset_stack
>  
> +        /* Xen's boot cpu id is equal to 0 so setup TP register for it */
> +        mv      a0, x0
> +        jal     setup_tp

I'm not going to insist, but for the casual reader "li a0, 0" may be
more obvious as to what it does, and if I'm not mistaken that actually
expands to the same underlying insn as the "mv" you use.

> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -8,6 +8,7 @@
>  #include <public/version.h>
>  
>  #include <asm/early_printk.h>
> +#include <asm/smp.h>
>  #include <asm/traps.h>
>  
>  void arch_get_xen_caps(xen_capabilities_info_t *info)
> @@ -40,6 +41,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  {
>      remove_identity_mapping();
>  
> +    set_processor_id(0);

This isn't really needed, is it? The pcpu_info[] initializer already
installs the necessary 0. Another thing would be if the initializer
set the field to, say, NR_CPUS.

> --- /dev/null
> +++ b/xen/arch/riscv/smp.c
> @@ -0,0 +1,21 @@
> +#include <xen/smp.h>
> +
> +/*
> + * FIXME: make pcpu_info[] dynamically allocated when necessary
> + *        functionality will be ready
> + */
> +/* tp points to one of these per cpu */
> +struct pcpu_info pcpu_info[NR_CPUS] = { { 0, INVALID_HARTID } };

As to the initializer - what about CPUs other than CPU0? Would they
better all have hart_id set to invalid?

Also, as a pretty strong suggestion to avoid excessive churn going
forward: Please consider using dedicated initializers here. IOW
perhaps

struct pcpu_info pcpu_info[NR_CPUS] = { [0 ... NR_CPUS - 1] = {
    .hart_id = INVALID_HARTID,
}};

Yet as said earlier - in addition you likely want to make sure no
two CPUs have (part of) their struct instance in the same cache line.
That won't matter right now, as you have no fields you alter at
runtime, but I expect such fields will appear.

> +void setup_tp(unsigned int cpuid)
> +{
> +    /*
> +     * tp register contains an address of physical cpu information.
> +     * So write physical CPU info of cpuid to tp register.
> +     * It will be used later by get_processor_id() ( look at
> +     * <asm/processor.h> ):
> +     *   #define get_processor_id()    (tp->processor_id)
> +     */
> +    asm volatile ( "mv tp, %0"
> +                   :: "r" ((unsigned long)&pcpu_info[cpuid]) : "memory" );
> +}

So you've opted to still do this in C. Which means there's still a
residual risk of the compiler assuming it can already to tp. What's
the problem with doing this properly in assembly?

As to the memory clobber - in an isolated, non-inline function its
significance is reduced mostly to the case of LTO (which I'm not
sure you even target). Nevertheless probably worth keeping, even if
mainly for documentation purposes. Provided of course this C function
is to remain.

> --- /dev/null
> +++ b/xen/arch/riscv/smpboot.c
> @@ -0,0 +1,8 @@
> +#include <xen/init.h>
> +#include <xen/sections.h>
> +#include <xen/smp.h>
> +
> +void __init smp_set_bootcpu_id(unsigned long boot_cpu_hartid)
> +{
> +    cpuid_to_hartid(0) = boot_cpu_hartid;
> +}

Does this really need its own function?

Jan

