Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2912B3E602
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 15:49:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104819.1455851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4ur-00050R-Nl; Mon, 01 Sep 2025 13:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104819.1455851; Mon, 01 Sep 2025 13:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4ur-0004zZ-L9; Mon, 01 Sep 2025 13:49:49 +0000
Received: by outflank-mailman (input) for mailman id 1104819;
 Mon, 01 Sep 2025 13:49:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut4uq-0004zT-0b
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 13:49:48 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 857e38a6-873a-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 15:49:46 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61caf8fc422so7725946a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 06:49:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc52a886sm7176639a12.43.2025.09.01.06.49.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 06:49:45 -0700 (PDT)
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
X-Inumbo-ID: 857e38a6-873a-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756734586; x=1757339386; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7nzHZ8KlngdM0RWEOsenfwm0FrS/YZ7bF5tbv2VnsXg=;
        b=gax4zTBZsbtoLWrw5KVNdQ3iKjiLa6GGwQw6/bA+jm9llFOIErJMEd6DVZUhMdey9I
         g4o3UlKGjI635Geb3lX6FyFrEzrCyQAd/sXsCTMol9uB3LSR3CfcEi6aUpJ0yqGMGIAJ
         q8TN4b2/lk8Zuq4dH24z/0OAybfwEQfKEZ6Lu/8u86p0WG6W8YX4GAJqwxzgZJJ3rqQb
         e/51zJQ6yk3FshCzQXSxCQj4Yd7wVryvu5yRGQFfu9lCrfvUMOgb34TohwnTN1vvsxCf
         X3Nu34z4urx44C4V/bn7Heq+87Ptg1/X4EXcFnzja2S/lpeKMbJIYXdfog8Tz2XY+zxt
         NLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756734586; x=1757339386;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nzHZ8KlngdM0RWEOsenfwm0FrS/YZ7bF5tbv2VnsXg=;
        b=cXDhUyt/6CFjHf1FtAJenClIEQr8V+wrUEH68F9aNMU6kks/92Y1wU+EuORLjRVeqZ
         36crU1tgiF0NybO20/dlACDa6Wb+qlnEBuGjAlMIWmoVMPd1JyIvnfbUeA1tcoea+ypA
         WUJSmproDRjVQojwWnO6y/4hiurMhlhZOINh6kEtHUL/SO+yHxafL+Suxgf2/8E/M8BR
         hhH1Zz4nQWBOVJAToXGrw9BUntAffLS+nTKrQR0aCSStKUi4WdElPIFhzYUa28DzJwTj
         gtodxnu1dTxYcWAkY+ijpUsFnEMTjOqXTVSfrYG4T8wv+H1vM5MGf+2uDq9kZHcDBIhx
         sEFg==
X-Forwarded-Encrypted: i=1; AJvYcCVzy60irPq0PSaW+wGBlEJi+MlILEe1QATHvJN+bLrt4RqV+HeOtZJVlwYinENdifW6c7RbGFYFIsU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7hu56kNj5StFylB9htIHsQ5tzJOYjf319fq0nkptnZi5ZL2D3
	hp+h8IjIUdoq6fooD7ZWkwb3uxLkRPz3h3jiPukyh/ONudugZNI2f1XjcOTub9UxWg==
X-Gm-Gg: ASbGncvev61nDWANBab2eNwQFvThbm1EsNSCUCv/xBXtG/jMsXVl4TxvxZ3HRYVPlVH
	hMaJsCKoNBTM/XYOLT4sP7ZI5RIIAocLW6EhkViuPENrRl4VoMbO2vdKzxanBCPYm3S6yVAecJn
	uOh87j+DCm31UI/5vwWU+OD4JKqnyZhybwZRPfoCeaLw0fC1dcTqROr7WZ7z5qSEvAVEpUm9GGU
	rhPvq8rcjRXvY93V1h7IQ08WJEE48TAqayLSflftfLYR/MvXjCKUx1ixhHrekDEGL2beGPPIZFs
	mIFjGZlGZflxatIEe9H35LbT+QCaPuXwvf++Goa7Q5B0wg6p4JWO2cPvQKp4lPGSyBaSIWF/Ru4
	JXc0btrYZRQ/bZCE8kg4rkZUfmwASBB0wYCCUjc9fo8e6yzp8WT/jqTKWxDWBTf0yxICuNoHT3F
	Mehe5KSM4=
X-Google-Smtp-Source: AGHT+IFzEMxRO3/i033QEtuafE2mbILLeCKx+jGUyEtkyOcvNaL7vHXPCe5cTjNiWkKJytiD1fLVxg==
X-Received: by 2002:a05:6402:348c:b0:61d:396b:74ca with SMTP id 4fb4d7f45d1cf-61d396b79ddmr7080918a12.23.1756734586064;
        Mon, 01 Sep 2025 06:49:46 -0700 (PDT)
Message-ID: <a45ddbdf-9a93-4861-a811-317a9fafe080@suse.com>
Date: Mon, 1 Sep 2025 15:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/23] x86/pv: System call handling in FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-23-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-23-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:04, Andrew Cooper wrote:
> Under FRED, entry_from_pv() handles everything, even system calls.  This means
> more of our logic is written in C now, rather than assembly.
> 
> In order to facilitate this, introduce pv_inject_callback(), which reuses
> struct trap_bounce infrastructure to inject the syscall/sysenter callbacks.
> This in turns requires some !PV compatibility for pv_inject_callback() and
> pv_hypercall() which can both be ASSERT_UNREACHABLE().
> 
> For each of INT $N, SYSCALL and SYSENTER, FRED gives us interrupted context
> which was previously lost.  As the guest can't see FRED, Xen has to lose state
> in the same way to maintain the prior behaviour.

In principle we could expose a new capability to the guest allowing it to
request that we preserve state. Question of course is whether that would
be of any practical use.

> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -712,11 +712,16 @@ int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx);
>  
>  #ifdef CONFIG_PV
>  void pv_inject_event(const struct x86_event *event);
> +void pv_inject_callback(unsigned int type);
>  #else
>  static inline void pv_inject_event(const struct x86_event *event)
>  {
>      ASSERT_UNREACHABLE();
>  }
> +static inline void pv_inject_callback(unsigned int type)
> +{
> +    ASSERT_UNREACHABLE();
> +}
>  #endif

We don't really need this, nor ...

> --- a/xen/arch/x86/include/asm/hypercall.h
> +++ b/xen/arch/x86/include/asm/hypercall.h
> @@ -20,6 +20,11 @@
>  
>  #ifdef CONFIG_PV
>  void pv_hypercall(struct cpu_user_regs *regs);
> +#else
> +static inline void pv_hypercall(struct cpu_user_regs *regs)
> +{
> +    ASSERT_UNREACHABLE();
> +}
>  #endif

... this, do we? If you expose the decls outside of the #ifdef, I can't help
the impression that all call sites will simply be DCE-ed (thanks to the
!IS_ENABLED(CONFIG_PV) check at the top of entry_from_pv()).

> --- a/xen/arch/x86/pv/traps.c
> +++ b/xen/arch/x86/pv/traps.c
> @@ -19,6 +19,8 @@
>  #include <asm/shared.h>
>  #include <asm/traps.h>
>  
> +#include <public/callback.h>
> +
>  void pv_inject_event(const struct x86_event *event)
>  {
>      struct vcpu *curr = current;
> @@ -95,6 +97,37 @@ void pv_inject_event(const struct x86_event *event)
>      }
>  }
>  
> +void pv_inject_callback(unsigned int type)
> +{
> +    struct vcpu *curr = current;
> +    struct trap_bounce *tb = &curr->arch.pv.trap_bounce;
> +    unsigned long rip = 0;
> +    bool irq = false;

Move the latter two initializers into a default: case, after an
ASSERT_UNREACHABLE()?

> +    ASSERT(is_pv_64bit_vcpu(curr));

I was first wondering why you check this here, but yes, PV32 is disabled when
FRED is enabled. IOW if a new use for this function turned up, this could
validly be relaxed.

> @@ -2305,6 +2309,27 @@ void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
>  
>      switch ( type )
>      {
> +    case X86_ET_SW_INT:
> +        /*
> +         * INT $3/4 are indistinguishable from INT3/INTO under IDT, and are

Didn't we discuss this the other day? They are distinguishable, as long as you
set their gates' DPL to 0. Just that we use DPL 3. Hence I think this wants
wording a little differently, to make clear it's our (possibly wrong) choice.

> +         * permitted by Xen without the guest kernel having a choice.  Let

Doesn't the guest have a choice by using TI_SET_DPL() suitably?

> +         * them fall through into X86_ET_HW_EXC, as #BP in particular needs
> +         * handling by do_int3() in case an external debugger is attached.
> +         */

I don't understand this, though. An external debugger would better not place
breakpoints using CD 03, so I think we'd better wire such the normal INT nn
way. And for #OF I also don't think we need to make an exception.

Jan

