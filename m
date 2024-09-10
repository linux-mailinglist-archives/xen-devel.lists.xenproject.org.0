Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1972E97339F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:34:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795310.1204590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyC2-0003E5-V9; Tue, 10 Sep 2024 10:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795310.1204590; Tue, 10 Sep 2024 10:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snyC2-0003BS-RT; Tue, 10 Sep 2024 10:33:54 +0000
Received: by outflank-mailman (input) for mailman id 795310;
 Tue, 10 Sep 2024 10:33:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snyC1-0003BM-Ax
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:33:53 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c5ed18e-6f60-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 12:33:52 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so344229866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 03:33:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d259511c0sm461487466b.62.2024.09.10.03.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 03:33:51 -0700 (PDT)
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
X-Inumbo-ID: 2c5ed18e-6f60-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725964432; x=1726569232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rRQwm2gkRUJEVhv2ET2ai/JwbsXTCj8BHjC172nu22U=;
        b=LuP7keOOEMNhUXNRTEvH3jVXzCHhk4Hv+FoDEmE0h4Md9gbAFjwkHa189qrv2ef26A
         C6v104y1U3WKYscF8HfNE3FQV0L10G602OXBKLyuZOUtBQyfGcFU0Gec3ORQVUnusVSR
         OnWRL23N0XxCxKGfw0g/gPAizJMQBmi2ndJxDCYGkl7ImsNGfGbsfQgjgDwiOhWH9pK6
         Njz9MBurKmvLP0XjN0aJ8PjeGZoxh+d0klempKHXkD2SQwNj4YHfGIo0xXWoT6ooCJbf
         aGrENYanKcWdhSp79IqIEaeA1S4TJgfizagDY4TYqI96O3EUH0KRovYvlc3iaUEF1dzj
         DloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725964432; x=1726569232;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRQwm2gkRUJEVhv2ET2ai/JwbsXTCj8BHjC172nu22U=;
        b=I3dWWru5rOcIJR8hmV5NYwHTyw0Nkfgpl5QQKTcWKqeyzepG2DBn8DHcfURtnRPhhu
         BOVaAeNynsTBtrwt12Dq8FwApiWCTA51HlQPDDQNOPb4yhIodz5c1eiI1zibLJ2Lx+F5
         11D4TwnBH9wDY9yumj5sKjciRkiBuyfjYIEtKkLxyN6iZl27AHYOEdburIc/yjOwN/uC
         iiOC6vQFEd4mfmdzEsnZ1uirg9WnRN8dDlcK1s6RnV3MXygoJWY4uGUapA7gu5QA/9KU
         9sw205kOHO07RwEydzV6P7iXZqnA/M8XpWXBw1FrtYN8G/9P1BGKxwjA5AkxxOH9/jT4
         r47g==
X-Forwarded-Encrypted: i=1; AJvYcCX76YOVCPjaznE0OkXwqA3GC6NXIF9te5XgsQ3nu1aKJfudCkK2GZAm42IR/GVeTWjP18OL4ggmkAY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxlq8CqqLmYcrgdYzNvGHq5wNH/ZuXzpxtxDkTCUPcaRoUKxDrz
	9S8qiaIOqtefVXytNWbQdqSQvwxU7RUnNsjw4KG1zJ+spnSxqwSb0c27vrdP+w==
X-Google-Smtp-Source: AGHT+IFQjGi81pJiRE/elBa9fWLEMt87iU0Y8orMSjvYTdO2461n0iDcb+h7gLNPLOi3nM0Nc+G95g==
X-Received: by 2002:a17:907:6e94:b0:a8d:571a:e863 with SMTP id a640c23a62f3a-a8ffab2a219mr26383266b.25.1725964431641;
        Tue, 10 Sep 2024 03:33:51 -0700 (PDT)
Message-ID: <6c43c528-daa9-4449-a383-aade3da73160@suse.com>
Date: Tue, 10 Sep 2024 12:33:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] xen/riscv: introduce functionality to work with
 CPU info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
 <77a00222008f8b41d2454e74d1c9247252d7ccd9.1725295716.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <77a00222008f8b41d2454e74d1c9247252d7ccd9.1725295716.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2024 19:01, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -12,8 +12,31 @@
>  
>  #ifndef __ASSEMBLY__
>  
> -/* TODO: need to be implemeted */
> -#define smp_processor_id() 0
> +#include <xen/bug.h>
> +
> +register struct pcpu_info *tp asm ( "tp" );
> +
> +struct pcpu_info {
> +    unsigned int processor_id; /* Xen CPU id */
> +    unsigned long hart_id; /* physical CPU id */
> +} __cacheline_aligned;

Shouldn't you include xen/cache.h for this, to be sure the header can
be included on its own?

I'm also unconvinced of this placement: Both Arm and x86 have similar
structures (afaict), living in current.h.

> +/* tp points to one of these */
> +extern struct pcpu_info pcpu_info[NR_CPUS];
> +
> +#define get_processor_id()      (tp->processor_id)

Iirc it was in response to one of your earlier patches that we removed
get_processor_id() from the other architectures, as being fully
redundant with smp_processor_id(). Is there a particular reason you
re-introduce that now for RISC-V?

> +#define set_processor_id(id)    do { \
> +    tp->processor_id = (id);         \
> +} while (0)
> +
> +static inline unsigned int smp_processor_id(void)
> +{
> +    unsigned int id = get_processor_id();
> +
> +    BUG_ON(id > (NR_CPUS - 1));

The more conventional way of expressing this is >= NR_CPUS.

> @@ -14,6 +16,13 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
>   */
>  #define park_offline_cpus false
>  
> +/*
> + * Mapping between linux logical cpu index and hartid.
> + */
> +#define cpuid_to_hartid(cpu) (pcpu_info[cpu].hart_id)

Does this need to be a macro (rather than an inline function)?

> @@ -72,6 +77,16 @@ FUNC(reset_stack)
>          ret
>  END(reset_stack)
>  
> +/* void setup_tp(unsigned int xen_cpuid); */
> +FUNC(setup_tp)
> +        la      tp, pcpu_info
> +        li      t0, PCPU_INFO_SIZE
> +        mul     t1, a0, t0
> +        add     tp, tp, t1
> +
> +        ret
> +END(setup_tp)

I take it this is going to run (i.e. also for secondary CPUs) ahead of
Xen being able to handle any kind of exception (on the given CPU)? If
so, all is fine here. If not, transiently pointing tp at CPU0's space
is a possible problem.

Jan

