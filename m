Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E949388A89A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 17:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697812.1088947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1romwU-0007Hz-4s; Mon, 25 Mar 2024 16:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697812.1088947; Mon, 25 Mar 2024 16:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1romwU-0007Em-1Y; Mon, 25 Mar 2024 16:12:58 +0000
Received: by outflank-mailman (input) for mailman id 697812;
 Mon, 25 Mar 2024 16:12:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1romwS-0007Eg-SW
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 16:12:56 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 883f332f-eac2-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 17:12:52 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so5840133a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 09:12:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t25-20020a056402241900b0056bd13ce50esm3088408eda.44.2024.03.25.09.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 09:12:51 -0700 (PDT)
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
X-Inumbo-ID: 883f332f-eac2-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711383172; x=1711987972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cSdtkagSlMJYslTrdnlqUwgM847MIlDlTf6vMwIncT8=;
        b=giz7NdDIoPxoH2DIpFsrvuF8Ii70n7WQ9KlAoHhORB3EuxuKffESXsHqvefkz4Hfw7
         VN/IeaGKJw/oUyBRd/Gc3YwN4tH029kSFGBNeEr4lrEX5TZgybg8ZioFcbR9JpBVOjNe
         BSJtYC1w91tO9MvzHYz/HTIZXQYjC8tYZ663YCQDBeqhDtV9ko7CbN8Xwui1d7Ii9O1B
         BMPIIiNV4Kbie+vDm4hRMFBKH2aEN3+rFxlT6zPLdkMqpAjY1V9+SbL6gqcpfEhh1Y34
         5jpjTU6JwnxsirCK6dLXuvbjw9jKNzyGL+mNN1kDitGb9jtWCnIN7SeWVovWHQJOeXhn
         QEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711383172; x=1711987972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cSdtkagSlMJYslTrdnlqUwgM847MIlDlTf6vMwIncT8=;
        b=FG4ksGGWh496U5QphDoacwP3lkUP1mm/MKHZljuk/EDIt9PZKyWEu0ANcdtgYJtX4I
         M7Al1tO7HumnuJT6HzEvaWB1NqX3DXXwrQpH9hchxjFKMx0FDNmA8L0QyfeS32fx0pVj
         qUOSGAxNCEAVqv0LjGcszENjyMZQMhbhCUXX7BO18BKw/jTmiz50hIfEm9UVgWDlOM8j
         uL5RudSZR+p6fmAM5XqMlOV8zd5oUZ3LbDVS2dCamLuHe0W7vlyvzgKhYGannaGJs6Qt
         0BFfHE+8QFPUZ6nYbM90CSFshZvCLZOUtk1ne8kzX2uDpDBck1ZAjsy/eRGcuYkTj2Ze
         nQcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIMx/wnPMHKQboS0TkaHletpuG61AevQh5X2OXve69z5tdmTcuy0OGgkM5i3u00igaebgaGxlxakLeQf3aPcRCWSoAzl2p+VzcHq9VBz4=
X-Gm-Message-State: AOJu0YxRQqvz5iYjKJyYrRdoCLaUoAXUvw0x2fV+qWTc14KS0pOwcJm8
	CaKXYCgnccjNVuvbBBilYEuJJe0TUbNDWI5UlAHSWdhz6/9NoRQeazsutxRp2g==
X-Google-Smtp-Source: AGHT+IHd94nFOT4l4bMrpReZ+8UQUA0RJdv7ZUbWCySOTRYBxPNj3bcvhWhMmuGIC2Sj7aX8eqzShw==
X-Received: by 2002:a50:9e2d:0:b0:565:6c72:40a9 with SMTP id z42-20020a509e2d000000b005656c7240a9mr5472035ede.28.1711383171989;
        Mon, 25 Mar 2024 09:12:51 -0700 (PDT)
Message-ID: <9d665a86-3867-4347-9e17-839cf4762f20@suse.com>
Date: Mon, 25 Mar 2024 17:12:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/2] x86: Enable BLD and handle #DB traps
Content-Language: en-US
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1710524011.git.matthew.barnes@cloud.com>
 <5c0c2fd252f425a397981546496438ebac439db2.1710524011.git.matthew.barnes@cloud.com>
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
In-Reply-To: <5c0c2fd252f425a397981546496438ebac439db2.1710524011.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 18:52, Matthew Barnes wrote:
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -623,6 +623,11 @@ void identify_cpu(struct cpuinfo_x86 *c)
>  	}
>  
>  	setup_doitm();
> +
> +	if (cpu_has(c, X86_FEATURE_BLD)) {
> +		host_msr_debugctl |= IA32_DEBUGCTLMSR_BLD;
> +		wrmsrl(MSR_IA32_DEBUGCTLMSR, host_msr_debugctl);
> +	}

With the exception only occurring for CPL > 0, is this of any use in !PV
builds?

I'm also unconvinced of the use of cpu_has() here: We expect symmetry
(as can also be seen by you not using a per-CPU variable to hold the
designated register value). Perhaps boot_cpu_has() would be better here.

Together with the change to percpu_traps_init(), perhaps worth introducing
something like set_in_debugctl()?

> --- a/xen/arch/x86/hvm/vmx/entry.S
> +++ b/xen/arch/x86/hvm/vmx/entry.S
> @@ -46,8 +46,8 @@ ENTRY(vmx_asm_vmexit_handler)
>          /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
>  
>          /* Hardware clears MSR_DEBUGCTL on VMExit.  Reinstate it if debugging Xen. */
> +        mov host_msr_debugctl(%rip), %eax
>          .macro restore_lbr
> -            mov $IA32_DEBUGCTLMSR_LBR, %eax
>              mov $MSR_IA32_DEBUGCTLMSR, %ecx
>              xor %edx, %edx
>              wrmsr

The alternative just out of context is

        ALTERNATIVE "", restore_lbr, X86_FEATURE_XEN_LBR

i.e. the restore won't happen if XEN_LBR isn't active.

Together with the !PV question above I'd then like to ask whether playing
with the BLD bit is necessary at all while running a HVM vCPU. The bit
could be turned back on from the PV context-switch-in path instead. Which
would in turn remove the need for e.g. the wrmsrl() in identify_cpu(), I
believe.

In fact with us not using the "load debug controls" VM entry control I'm
having a hard time seeing how the carefully established VMCS field would
ever make it into the MSR. Instead we look to be running the guest with
the value we put there last. That wouldn't be quite right with the BLD
bit set in there unconditionally (the LBR one at least would only be set
when the respective command line option was used).

> --- a/xen/arch/x86/include/asm/debugreg.h
> +++ b/xen/arch/x86/include/asm/debugreg.h
> @@ -19,6 +19,7 @@
>  #define DR_TRAP1        (0x2)           /* db1 */
>  #define DR_TRAP2        (0x4)           /* db2 */
>  #define DR_TRAP3        (0x8)           /* db3 */
> +#define DR_TRAP11       (0x800)         /* db11 */

This isn't the flag for %dr11, so wants naming differently. Perhaps simply
DR_BLD.

> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -24,6 +24,8 @@
>  
>  #include <public/hvm/params.h>
>  
> +uint32_t host_msr_debugctl;

This wants to be __ro_after_init, with appropriate care applied in
identify_cpu().

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1936,9 +1936,12 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
>       */
>      write_debugreg(6, X86_DR6_DEFAULT);
>  
> +    if ( !( dr6 & DR_TRAP11 ) )
> +        return;

Nit: Stray blanks immediately inside the inner parentheses.

Jan

