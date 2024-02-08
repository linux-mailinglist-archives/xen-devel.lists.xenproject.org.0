Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABFE84DFDB
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 12:39:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678147.1055217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY2kV-00005a-1D; Thu, 08 Feb 2024 11:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678147.1055217; Thu, 08 Feb 2024 11:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY2kU-0008Tx-Th; Thu, 08 Feb 2024 11:39:22 +0000
Received: by outflank-mailman (input) for mailman id 678147;
 Thu, 08 Feb 2024 11:39:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rY2kT-0008Tr-0z
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 11:39:21 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1df0893-c676-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 12:39:18 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5114b2b3b73so2111808e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 03:39:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v12-20020a05600c470c00b0040ff7e3170asm1367838wmo.2.2024.02.08.03.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 03:39:18 -0800 (PST)
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
X-Inumbo-ID: b1df0893-c676-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707392358; x=1707997158; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sks6tmWIUqZoMfS1Ef5pE1EePh6Bv5w66w0wqO1z8U0=;
        b=NO8SkXI4ahjslOvnhNGwnb0JO23+6kSITcoNAlQFquwfzQLjaObH27iLJ8/9tfeDt4
         VhTNWjUV7j0N8x5+4ou9A6gda+ePhOWsvOZeUb/R/p8fvAwRdsVms/DSEOtTERuFAQid
         DSTlemOva1hPn/L/rEg6OlOoc8iD+8zaG0e6YYGKZ0Q2RM3qSORFEF1qL2fHK0lZdxdP
         kOXd0j94sHJx2SCYabHqxbC3pf4VOhCNfZF5NzMG38hEHf87DJF3eNs6pRzlkIWAYL3D
         TkT5rneZ3KUD2ALl5FjZTtEb9mzrKU/IpMrwqvOZ2p9FmPrrYRA/Cz0dTyR/bktTELID
         cRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707392358; x=1707997158;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sks6tmWIUqZoMfS1Ef5pE1EePh6Bv5w66w0wqO1z8U0=;
        b=A3X0fch4Xh1Zkth0D4vLC09nMBDhEv3UX9D025/pRwffbWfZKRITlaY6X34O00SU4r
         ivlYLehBAfp4zAwNRqIfBqYl3Q4br6nvSpXGmlTBPrWAtXoJ5tF0fxtyFBIpq71GGEHu
         5h6sSDI+Z9UckR2RGG+VZr+aWiZP5iF45KoyqEvQSdrEXZSh0X1Oul0qOZnhrKPenqr8
         Mc65/JxYhaktaEU2DcmMxHqHkhnNAPrgmCTidz5xJirpA0nZn0nfsrQYvY6rK1wfhT0m
         MYzJWeRAsr+/siVls91/JYVP/m5cI8Tplf8a7PPRwoffFt2mt+/k113adEIjhkILAWPU
         POHw==
X-Forwarded-Encrypted: i=1; AJvYcCU8jm70Di6pPF6H7vIM/Uespv8o+DMlJmuGNjCds/Qc0p2xt/0cMiYJIxOeMtwjzB1OhqzwiZUTc8IjPWFzSMZt+snnsOsrLYxCOUVmyeg=
X-Gm-Message-State: AOJu0YxOtzVab6wvGruhLMQbaHTXpAx08Hkdtfw593gm6iPXDglTMYaB
	B/c/lOzELaSf+lUXc1HOSd1u8Undp7J+oVzuf9Bs2o9v5Msrz1oJJjqYV7kG9A==
X-Google-Smtp-Source: AGHT+IF+acKMiFQ/xa67kZUT2IHl9yEGJ7HvyTL+MduhRmYbf1vRgPMEi3kzV/9biDUzBso5lPQGpQ==
X-Received: by 2002:a05:6512:e99:b0:511:564e:3a80 with SMTP id bi25-20020a0565120e9900b00511564e3a80mr8391615lfb.50.1707392358310;
        Thu, 08 Feb 2024 03:39:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWpk2ZQwaH3IOm+iC5H/O1Vc5YzBDuggUCPq1AWY86y3olOe1Gpv+mcRsX8A+DEa+P7bmKjTAkYEY8v3gwzUlUQnCYXOpNWEqQ7PyB7FsKALIdB9fCD2EMPVFbzQibMD/kzE+zVj3gs0TzRSVA+a9ct
Message-ID: <3df6b783-ff02-4ac9-ae76-843899fa2383@suse.com>
Date: Thu, 8 Feb 2024 12:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 7/9] x86/smp: drop booting_cpu variable
Content-Language: en-US
To: Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <22109ebd7edef1140cb438a6ec5fa1726cdf2c12.1699982111.git.krystian.hebel@3mdeb.com>
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
In-Reply-To: <22109ebd7edef1140cb438a6ec5fa1726cdf2c12.1699982111.git.krystian.hebel@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2023 18:50, Krystian Hebel wrote:
> CPU id is obtained as a side effect of searching for appropriate
> stack for AP. It can be used as a parameter to start_secondary().
> Coincidentally this also makes further work on making AP bring-up
> code parallel easier.

It's not just "easier", but strictly a prereq I think? Such a global
would get in the way of having multiple CPUs make it into
start_secondary() in parallel.

> --- a/xen/arch/x86/boot/x86_64.S
> +++ b/xen/arch/x86/boot/x86_64.S
> @@ -20,20 +20,24 @@ ENTRY(__high_start)
>          jz      .L_stack_set
>  
>          /* APs only: get stack base from APIC ID saved in %esp. */
> -        mov     $0, %rax
> +        mov     $0, %rbx
>          lea     cpu_data(%rip), %rcx
>          /* cpu_data[0] is BSP, skip it. */
>  1:
> -        add     $1, %rax
> +        add     $1, %rbx
>          add     $CPUINFO_X86_sizeof, %rcx
> -        cmp     $NR_CPUS, %eax
> +        cmp     $NR_CPUS, %rbx
>          jb      2f
>          hlt
>  2:
>          cmp     %esp, CPUINFO_X86_apicid(%rcx)
>          jne     1b

Once again this is code you introduced a few patches ago. Why not use
%ebx right away for that purpose? (And yes, this explains why in the
earlier patch you retained that code. Just that again suitably ordering
the series would make this look natural. Otherwise it needs at least
mentioning why dead pieces are kept around.)

> -        /* %rcx is now cpu_data[cpu], read stack base from it. */
> +        /*
> +         * At this point:
> +         * - %rcx is cpu_data[cpu], read stack base from it,
> +         * - %rbx (callee-save) is Xen cpu number, pass it to start_secondary().
> +         */
>          mov     CPUINFO_X86_stack_base(%rcx), %rsp
>  
>          test    %rsp,%rsp
> @@ -101,6 +105,7 @@ ENTRY(__high_start)
>  .L_ap_cet_done:
>  #endif /* CONFIG_XEN_SHSTK || CONFIG_XEN_IBT */
>  
> +        mov     %rbx, %rdi
>          tailcall start_secondary

As alluded to above and as mentioned before - please stick to 32-bit
operations when you deal with 32 (or less) bits of data.

> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -222,8 +222,6 @@ static void smp_callin(void)
>          cpu_relax();
>  }
>  
> -static int booting_cpu;
> -
>  /* CPUs for which sibling maps can be computed. */
>  static cpumask_t cpu_sibling_setup_map;
>  
> @@ -311,15 +309,14 @@ static void set_cpu_sibling_map(unsigned int cpu)
>      }
>  }
>  
> -void start_secondary(void *unused)
> +void start_secondary(unsigned int cpu)
>  {
>      struct cpu_info *info = get_cpu_info();
>  
>      /*
> -     * Dont put anything before smp_callin(), SMP booting is so fragile that we
> +     * Don't put anything before smp_callin(), SMP booting is so fragile that we
>       * want to limit the things done here to the most necessary things.
>       */
> -    unsigned int cpu = booting_cpu;
>  
>      /* Critical region without IDT or TSS.  Any fault is deadly! */
>  
> @@ -346,9 +343,9 @@ void start_secondary(void *unused)
>       */
>      spin_debug_disable();
>  
> -    get_cpu_info()->use_pv_cr3 = false;
> -    get_cpu_info()->xen_cr3 = 0;
> -    get_cpu_info()->pv_cr3 = 0;
> +    info->use_pv_cr3 = false;
> +    info->xen_cr3 = 0;
> +    info->pv_cr3 = 0;

This hunk looks unrelated. While tidying next to what's changed anyway
may be okay if suitably mentioned in the description, in this case I
think it needs splitting off.

Jan

