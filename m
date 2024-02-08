Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD65384E0CA
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 13:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678176.1055246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY3eS-0001TG-17; Thu, 08 Feb 2024 12:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678176.1055246; Thu, 08 Feb 2024 12:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY3eR-0001Rj-UT; Thu, 08 Feb 2024 12:37:11 +0000
Received: by outflank-mailman (input) for mailman id 678176;
 Thu, 08 Feb 2024 12:37:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rY3eP-0001Rd-Na
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 12:37:09 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5be4bdd-c67e-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 13:37:08 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-337d05b8942so1311711f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 04:37:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f2-20020a5d50c2000000b0033b4db744e5sm3523400wrt.12.2024.02.08.04.37.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 04:37:07 -0800 (PST)
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
X-Inumbo-ID: c5be4bdd-c67e-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707395827; x=1708000627; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+bO2YLDTgvwGVjHmGR/iqLM3C/eV82w8BM4exB2zLQ=;
        b=c/oimUwQX3cIde2F7/ZapzwLjjbvPuFsWslEmgHCA13+eqfb2xCuwYJITmWgu5pyBz
         G15sG/UOxHjUHBe6bNgzFxQc9yevuA9xFWCp2uIU2CtMiepZD2gP2eNBrxyDvPZRT3xW
         x0LQ3p+AFsR8rdbkMSWkqbDfGVnt9tZ+q8IZ1Bxl2mY2R+/aLR2uMOSMllQ+Y5zPjK2U
         zkeIpLdP07WfdyqHHNrvSFRDC+Y6G4F8jKU9IjvyFdW6iKclVOgZO6vnXZ53kbjqOLhn
         ekW1VYZYj5kmu2+1yMvPj3oiGTLrPy476Y/UHvLP5+rM2yAJ1/gPevy9uMYD39Cko8na
         o2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707395827; x=1708000627;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+bO2YLDTgvwGVjHmGR/iqLM3C/eV82w8BM4exB2zLQ=;
        b=G2ehzVRmTI2MTM0Lyq14RI3Pw6Gkit9og/3NI1DAAqwMWbGIZElXCorFl2RmbKul6H
         yzEX5ZJlwrNXiIHj5bLTCLLrPFABRGEWSZTMhf9YSWsAmess9cz2C8INHqJxQ/HmhkTJ
         GdY14lBmZ8sqdkwctddJir94d2mlMgTPE0paSI64y9nE8CBhHKiQl2GqEJJ4Vk/0bsQR
         scodJXNWGF8hgZY1iASoRwhoHsvJUNVj08SSTL9ViHP/q0ddDiEII3PsSDKI09ER5FWv
         9gPLsQ1CDk10BJKM4hf41jh8FhVLJh4xqXHuC2IdtPzEJD3mt6hPfq+dO31yBGfiO+ys
         jdWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfwXLhEKPpIaptMdxYrZCExMeIJlNh5fFnd3NoJTULVMdIG/pDTf3Shc2yminaE1n3HUw7mxiMAfQhg8QCMfAdN0tdLNiEUrahUPjuAws=
X-Gm-Message-State: AOJu0Yw8XQqX/xzg6j8pKXAXc0AVChiQGEwvpQSuQjIHulrbiFHgn0ld
	Mq8ehL8IRzCZIglhVQEc69czOr4d06ZnDx9FJC6EuK3wDKATLiERRO3mskAI/g==
X-Google-Smtp-Source: AGHT+IHtF6AS+YG5ehp1lZuKjmubSNJjlIvb3lKyA5iPGAmMxM8bvl9IOTXg/bTSBTmiV/EIQxtdcg==
X-Received: by 2002:adf:a490:0:b0:33b:50e5:8a78 with SMTP id g16-20020adfa490000000b0033b50e58a78mr3229679wrb.22.1707395827632;
        Thu, 08 Feb 2024 04:37:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0Kz8OFu1pwmM0HnfbsUMN9XxmpXSAostBsNrndDdLc7MGttviyJo+0/+1bRoGW73kZjT0e5fsS2UVBYtRTm31h31/nv/Dj5wI3egG4Q5az6EZ9ZX/mfa0C6Xg9HtyUr3etoPIpMUG2vV4nuIen9L0
Message-ID: <dad39029-d0fc-4aa0-8562-4c7a02ca8039@suse.com>
Date: Thu, 8 Feb 2024 13:37:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 9/9] x86/smp: start APs in parallel during boot
Content-Language: en-US
To: Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <77c9199eabf3a30ebcf89356b2dd35abd611a3a9.1699982111.git.krystian.hebel@3mdeb.com>
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
In-Reply-To: <77c9199eabf3a30ebcf89356b2dd35abd611a3a9.1699982111.git.krystian.hebel@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2023 18:50, Krystian Hebel wrote:
> Multiple delays are required when sending IPIs and waiting for
> responses. During boot, 4 such IPIs were sent per each AP. With this
> change, only one set of broadcast IPIs is sent. This reduces boot time,
> especially for platforms with large number of cores.

Yet APs do their startup work in parallel only for a brief period of
time, if I'm not mistaken. Othwerwise I can't see why you'd still have
cpu_up() in __start_xen().

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1963,6 +1963,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>                  cpu_data[i].stack_base = cpu_alloc_stack(i);
>          }
>  
> +        smp_send_init_sipi_sipi_allbutself();
> +
>          for_each_present_cpu ( i )
>          {
>              if ( (park_offline_cpus || num_online_cpus() < max_cpus) &&

So what about constraints on the number of CPUs to use? In such a case
you shouldn't send the IPI to all of them, at least if they're not
meant to be parked.

> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -425,7 +425,7 @@ void start_secondary(unsigned int cpu)
>  
>  static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>  {
> -    unsigned long send_status = 0, accept_status = 0;
> +    unsigned long send_status = 0, accept_status = 0, sh = 0;

sh doesn't need to be 64 bits wide, does it?

>      int maxlvt, timeout, i;
>  
>      /*
> @@ -445,6 +445,12 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>      if ( tboot_in_measured_env() && !tboot_wake_ap(phys_apicid, start_eip) )
>          return 0;
>  
> +    /*
> +     * Use destination shorthand for broadcasting IPIs during boot.
> +     */

Nit (style): This is a single line comment.

> +    if ( phys_apicid == BAD_APICID )
> +        sh = APIC_DEST_ALLBUT;

I think the latest for this the function parameter wants changing to
unsigned int (in another prereq patch).

> @@ -573,21 +578,31 @@ static int do_boot_cpu(int apicid, int cpu)
>       */
>      mtrr_save_state();
>  
> -    start_eip = bootsym_phys(trampoline_realmode_entry);
> +    /* Check if AP is already up. */
> +    if ( cpu_data[cpu].cpu_state != CPU_STATE_INIT )
> +    {
> +        /* This grunge runs the startup process for the targeted processor. */
> +        unsigned long start_eip;
> +        start_eip = bootsym_phys(trampoline_realmode_entry);
>  
> -    /* start_eip needs be page aligned, and below the 1M boundary. */
> -    if ( start_eip & ~0xff000 )
> -        panic("AP trampoline %#lx not suitably positioned\n", start_eip);
> +        /* start_eip needs be page aligned, and below the 1M boundary. */
> +        if ( start_eip & ~0xff000 )
> +            panic("AP trampoline %#lx not suitably positioned\n", start_eip);

Isn't this redundant now with the panic() in
smp_send_init_sipi_sipi_allbutself(), at least as long as that runs
unconditionally.

> -    /* So we see what's up   */
> -    if ( opt_cpu_info )
> -        printk("Booting processor %d/%d eip %lx\n",
> -               cpu, apicid, start_eip);
> +        /* So we see what's up   */
> +        if ( opt_cpu_info )
> +            printk("AP trampoline at %lx\n", start_eip);

Why this change in log message? It makes messages for individual CPUs
indistinguishable. And like above it's redundant with what
smp_send_init_sipi_sipi_allbutself() logs.

> -    /* This grunge runs the startup process for the targeted processor. */
> +        /* mark "stuck" area as not stuck */
> +        bootsym(trampoline_cpu_started) = 0;
> +        smp_mb();
>  
> -    /* Starting actual IPI sequence... */
> -    boot_error = wakeup_secondary_cpu(apicid, start_eip);
> +        /* Starting actual IPI sequence... */
> +        boot_error = wakeup_secondary_cpu(apicid, start_eip);
> +    }
> +
> +    if ( opt_cpu_info )
> +        printk("Booting processor %d/%d\n", cpu, apicid);

Oh, here's the other half. Yet for above it still doesn't make sense
to issue the same message for all CPUs.

> @@ -646,10 +661,6 @@ static int do_boot_cpu(int apicid, int cpu)
>          rc = -EIO;
>      }
>  
> -    /* mark "stuck" area as not stuck */
> -    bootsym(trampoline_cpu_started) = 0;
> -    smp_mb();

While you move this up, it's not clear to me how you would now
identify individual stuck CPUs. I would have expected that this is
another global that needs converting up front, to be per-CPU.

> @@ -1155,6 +1166,23 @@ static struct notifier_block cpu_smpboot_nfb = {
>      .notifier_call = cpu_smpboot_callback
>  };
>  
> +void smp_send_init_sipi_sipi_allbutself(void)

__init?

> +{
> +    unsigned long start_eip;
> +    start_eip = bootsym_phys(trampoline_realmode_entry);

This can be the initializer of the variable, which would then save
me from complaining about the missing blank line between declaration
and statement(s). (Actually, as I notice only now - same for code you
move around in do_boot_cpu().)

Jan

