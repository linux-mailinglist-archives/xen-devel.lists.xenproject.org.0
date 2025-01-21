Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BAAA17B72
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 11:24:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875298.1285744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBR1-0005nm-3H; Tue, 21 Jan 2025 10:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875298.1285744; Tue, 21 Jan 2025 10:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBR1-0005lM-0Y; Tue, 21 Jan 2025 10:24:39 +0000
Received: by outflank-mailman (input) for mailman id 875298;
 Tue, 21 Jan 2025 10:24:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1taBR0-0005X8-8g
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 10:24:38 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9d8cd88-d7e1-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 11:24:36 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436202dd730so38986785e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 02:24:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438904625f5sm176947175e9.28.2025.01.21.02.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 02:24:35 -0800 (PST)
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
X-Inumbo-ID: e9d8cd88-d7e1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737455076; x=1738059876; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RgwUgZwX2PeWgrko2c5vyGrhzzW//75peqveWOYVkXI=;
        b=L3ZCj+yopXMmTcpSMtmQFWF5fE+/A7TDExfDXwhmNVXXHAt8Hx2eBvQymvmykc79Vn
         vy1ZBlxegEZO4S2Kc2QAY1anjbDVBAPoSNZpXKK0tilc+IQkNzh3qt8brwAivMvqGmc0
         s+p81N6YFgQRdYqJpLbLkCGWfktn3DVbPX4Oj4dDVMFljt+7y8F02ZUbT0/0rd2f/HoL
         LqcFk6FpCjoV79CUGJOl1VadOJCfsVvf5D0Y0M//Z7nVRmzqUGhm2HXrPx0kuUNYDV5L
         AQxrSqQ6OR5TJMspONUM3vbrs648RTqVHDAlueOUTo05Lz0xyTUUNt69Sqxaa8+vAygN
         H42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737455076; x=1738059876;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgwUgZwX2PeWgrko2c5vyGrhzzW//75peqveWOYVkXI=;
        b=IPvt5PL0ERCPfZwIunizTE7DoS5e9PaD2Uk59TJr7ZYQZB/dIebk5N0Y/jmY0/yKht
         zosxtGDPFGhqU8NYOrFkT/jdV3vAVkagZOdDXiaEJ3vPXqqo/c0nVMTYDvJdEEpVh4Tu
         1FEbGAZ+6aofo/6YDVMbRpgehJ3yiu6E90NjrPNTgiOlJIG/Jhsw27eF213t0rjXYA4V
         UfrqfZBqi/LYTmwoHFGrzxcYM5q8YCAj2outtCOU5irBsUztFn5E7D0CWu0m1xPsnJZI
         tLEZ+VVhGQMxYY2ad3S45dWyxfbcMIsgU0l3Ks0EylJk+ZczO0s0qPVxGVgEj0kwLvQG
         F8jA==
X-Forwarded-Encrypted: i=1; AJvYcCXY0qz0Mo/nyPClYWRftW44PSSMs1NbhPTxZ8E8pyxjNWDfUJ8kBr7rW58gzR6iprGHQhdjagAAjC8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqtyNSko2aWnWqRBJ88rMGCJXuWsrwK+K6+OESjamvz/7CHfEW
	KuX2KFr2nm5A5gfqWsUPy5EaUSRBzXWqqitC2baVA6zXe9poj6G5OskODI6y7w==
X-Gm-Gg: ASbGncvA83I1sAaCaPjIwhZrNmVCiRBWD+uEtbZaoWotSXlzApOH0ZNicMDab2P46Ag
	Wz1lvuqEPHrc3KtLeuadeqYEqu8hQ+bkDPYUWcY5Xu2P4Vt4gU4JKjJ3wcBq70Vhk3+TNjBBY94
	V2CbXrPoXkH+XmvniLCxOpGwkGMEhnNV4W+WzMzJigVDNsGEGMl2bSa357jAifAU3N0ob0CqCXa
	xaZgBXzO6YoVZtjT7G5Sc0eItifBhuYLaMuxQryvl647qBzMtuHoZjdc+Agg0cuIo8JtKx86RNq
	1IBWdPXXd+VQ7Fijd0FlqNR+J3R+BDvTeUBU34VjUlk4Flvj7fvqY+0=
X-Google-Smtp-Source: AGHT+IEXkK/zCXQm1sdv62CbcIrymcCZJrTBa4KzvE+AQZDbhpgSYgLRbKBdP5I07CKYRiJ9taHA8A==
X-Received: by 2002:a7b:c44d:0:b0:434:9fac:b158 with SMTP id 5b1f17b1804b1-438a2b59615mr86054555e9.1.1737455075520;
        Tue, 21 Jan 2025 02:24:35 -0800 (PST)
Message-ID: <c6f909c6-bc4d-4dd9-acce-b36c0f450601@suse.com>
Date: Tue, 21 Jan 2025 11:24:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 08/10] x86/emulate: Implement XSAVES/XRSTORS for
 arch LBR
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
 <20250102084413.102-9-ngoc-tu.dinh@vates.tech>
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
In-Reply-To: <20250102084413.102-9-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2025 09:45, Tu Dinh wrote:
> Add new set_lbr_depth HVM function and emulate ops to support LBR
> XSAVES/XRSTORS emulation.

What about any of the other state components, like BNDCSR?

> Add the appropriate instruction hooks to 0fc7.c. Translate LBR registers
> using cs.base within a large block emulator operation.
> 
> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>

I fear this needs splitting; the x86_emulate/* changes want to be separate,
and I'm having a hard time seeing why we'd gain XSAVES/XRSTORS support
there without first/also gaining XSAVE/XRSTOR/XSAVEOPT/XSAVEC support.

Various comments further down will hopefully give you an idea of why this
enabling wasn't done so far.

> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -238,6 +238,9 @@ struct hvm_function_table {
>      int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *value);
>      int (*vmtrace_reset)(struct vcpu *v);
>  
> +    /* Arch LBR */
> +    void (*set_lbr_depth)(struct vcpu *v, uint32_t depth);

I don't see why "depth" would need to be fixed-width. "unsigned int" will
surely do? See also ./CODING_STYLE.

> --- a/xen/arch/x86/x86_emulate/0fc7.c
> +++ b/xen/arch/x86/x86_emulate/0fc7.c
> @@ -10,6 +10,10 @@
>  
>  #include "private.h"
>  
> +#if defined(__XEN__) && !defined(X86EMUL_NO_FPU)
> +# include <asm/xstate.h>
> +#endif
> +
>  /* Avoid namespace pollution. */
>  #undef cmpxchg
>  
> @@ -107,87 +111,203 @@ int x86emul_0fc7(struct x86_emulate_state *s,
>      }
>      else
>      {
> -        union {
> -            uint32_t u32[2];
> -            uint64_t u64[2];
> -        } *old, *aux;
> -
> -        /* cmpxchg8b/cmpxchg16b */
> -        generate_exception_if((s->modrm_reg & 7) != 1, X86_EXC_UD);
> -        fail_if(!ops->cmpxchg);
> -        if ( s->rex_prefix & REX_W )
> -        {
> -            host_and_vcpu_must_have(cx16);
> -            generate_exception_if(!is_aligned(s->ea.mem.seg, s->ea.mem.off, 16,
> -                                              ctxt, ops),
> -                                  X86_EXC_GP, 0);
> -            s->op_bytes = 16;
> -        }
> -        else
> +        switch ( s->modrm_reg & 7 )
>          {
> -            vcpu_must_have(cx8);
> -            s->op_bytes = 8;
> -        }
> +            default:
> +                return X86EMUL_UNRECOGNIZED;
>  
> -        old = container_of(&mmvalp->ymm[0], typeof(*old), u64[0]);
> -        aux = container_of(&mmvalp->ymm[2], typeof(*aux), u64[0]);
> +            case 1: /* cmpxchg8b/cmpxchg16b */
> +            {
> +                union {
> +                    uint32_t u32[2];
> +                    uint64_t u64[2];
> +                } *old, *aux;
>  
> -        /* Get actual old value. */
> -        if ( (rc = ops->read(s->ea.mem.seg, s->ea.mem.off, old, s->op_bytes,
> -                             ctxt)) != X86EMUL_OKAY )
> -            goto done;
> +                fail_if(!ops->cmpxchg);
> +                if ( s->rex_prefix & REX_W )
> +                {
> +                    host_and_vcpu_must_have(cx16);
> +                    generate_exception_if(!is_aligned(s->ea.mem.seg, s->ea.mem.off, 16,
> +                                                      ctxt, ops),
> +                                          X86_EXC_GP, 0);
> +                    s->op_bytes = 16;
> +                }
> +                else
> +                {
> +                    vcpu_must_have(cx8);
> +                    s->op_bytes = 8;
> +                }
>  
> -        /* Get expected value. */
> -        if ( s->op_bytes == 8 )
> -        {
> -            aux->u32[0] = regs->eax;
> -            aux->u32[1] = regs->edx;
> -        }
> -        else
> -        {
> -            aux->u64[0] = regs->r(ax);
> -            aux->u64[1] = regs->r(dx);
> -        }
> +                old = container_of(&mmvalp->ymm[0], typeof(*old), u64[0]);
> +                aux = container_of(&mmvalp->ymm[2], typeof(*aux), u64[0]);
>  
> -        if ( memcmp(old, aux, s->op_bytes) )
> -        {
> -        cmpxchgNb_failed:
> -            /* Expected != actual: store actual to rDX:rAX and clear ZF. */
> -            regs->r(ax) = s->op_bytes == 8 ? old->u32[0] : old->u64[0];
> -            regs->r(dx) = s->op_bytes == 8 ? old->u32[1] : old->u64[1];
> -            regs->eflags &= ~X86_EFLAGS_ZF;
> -        }
> -        else
> -        {
> -            /*
> -             * Expected == actual: Get proposed value, attempt atomic cmpxchg
> -             * and set ZF if successful.
> -             */
> -            if ( s->op_bytes == 8 )
> -            {
> -                aux->u32[0] = regs->ebx;
> -                aux->u32[1] = regs->ecx;
> -            }
> -            else
> -            {
> -                aux->u64[0] = regs->r(bx);
> -                aux->u64[1] = regs->r(cx);
> +                /* Get actual old value. */
> +                if ( (rc = ops->read(s->ea.mem.seg, s->ea.mem.off, old, s->op_bytes,
> +                                     ctxt)) != X86EMUL_OKAY )
> +                    goto done;
> +
> +                /* Get expected value. */
> +                if ( s->op_bytes == 8 )
> +                {
> +                    aux->u32[0] = regs->eax;
> +                    aux->u32[1] = regs->edx;
> +                }
> +                else
> +                {
> +                    aux->u64[0] = regs->r(ax);
> +                    aux->u64[1] = regs->r(dx);
> +                }
> +
> +                if ( memcmp(old, aux, s->op_bytes) )
> +                {
> +                cmpxchgNb_failed:
> +                    /* Expected != actual: store actual to rDX:rAX and clear ZF. */
> +                    regs->r(ax) = s->op_bytes == 8 ? old->u32[0] : old->u64[0];
> +                    regs->r(dx) = s->op_bytes == 8 ? old->u32[1] : old->u64[1];
> +                    regs->eflags &= ~X86_EFLAGS_ZF;
> +                }
> +                else
> +                {
> +                    /*
> +                    * Expected == actual: Get proposed value, attempt atomic cmpxchg
> +                    * and set ZF if successful.
> +                    */
> +                    if ( s->op_bytes == 8 )
> +                    {
> +                        aux->u32[0] = regs->ebx;
> +                        aux->u32[1] = regs->ecx;
> +                    }
> +                    else
> +                    {
> +                        aux->u64[0] = regs->r(bx);
> +                        aux->u64[1] = regs->r(cx);
> +                    }
> +
> +                    switch ( rc = ops->cmpxchg(s->ea.mem.seg, s->ea.mem.off, old, aux,
> +                                               s->op_bytes, s->lock_prefix, ctxt) )
> +                    {
> +                    case X86EMUL_OKAY:
> +                        regs->eflags |= X86_EFLAGS_ZF;
> +                        break;
> +
> +                    case X86EMUL_CMPXCHG_FAILED:
> +                        rc = X86EMUL_OKAY;
> +                        goto cmpxchgNb_failed;
> +
> +                    default:
> +                        goto done;
> +                    }
> +                }
> +                break;
>              }
>  
> -            switch ( rc = ops->cmpxchg(s->ea.mem.seg, s->ea.mem.off, old, aux,
> -                                       s->op_bytes, s->lock_prefix, ctxt) )

Since it's a significant chunk of diff, this re-arrangement (mostly re-
indentation) likely would better be split out to a separate patch, too.
This will then also help readability of the diff for the actual addition
you're making.

> +#if defined(__XEN__) && !defined(X86EMUL_NO_FPU)

I'm sorry, but no, it is not an option to confine this to __XEN__. This
very certainly needs wiring up in the testharness as well, just like we
have it for FXSAVE/FXRSTOR.

I'm further unconvinced that X86EMUL_NO_FPU is appropriate to use here.
This is different from FXSAVE/FXRSTOR, the more that you likely have
seen that NO_SIMD and NO_MMX are checked there as well (only FSAVE/FRSTOR
have solely NO_FPU as a check). XSAVE etc are about more than just FPU /
SIMD state, after all (arch LBR being one of them), expressed by the lack
of an F prefix on their mnemonics.

> +            case 3: /* xrstors */
> +            case 5: /* xsaves */
>              {
> -            case X86EMUL_OKAY:
> -                regs->eflags |= X86_EFLAGS_ZF;
> -                break;
> +                unsigned long cr0, cr4;
> +                unsigned long xcr0, xss;
> +                struct segment_register cs;
>  
> -            case X86EMUL_CMPXCHG_FAILED:
> -                rc = X86EMUL_OKAY;
> -                goto cmpxchgNb_failed;
> +                generate_exception_if(s->vex.pfx, X86_EXC_UD);
> +                host_and_vcpu_must_have(xsaves);
> +                generate_exception_if(s->ea.type != OP_MEM, X86_EXC_UD);
> +                generate_exception_if(!is_aligned(s->ea.mem.seg, s->ea.mem.off,
> +                                                  64, ctxt, ops),
> +                                      X86_EXC_GP, 0);
> +                fail_if(!ops->blk || !ops->read_cr || !ops->read_xcr ||
> +                        !ops->read_msr || !ops->write_msr ||
> +                        !ops->read_segment);
> +                fail_if(vcpu_has_arch_lbr() && !ops->set_lbr_depth);
>  
> -            default:
> -                goto done;
> +                if ( ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY ||
> +                     ops->read_cr(0, &cr0, ctxt) != X86EMUL_OKAY )
> +                     cr0 = cr4 = 0;
> +                generate_exception_if(!(cr4 & X86_CR4_OSXSAVE), X86_EXC_UD);
> +                generate_exception_if(cr0 & X86_CR0_TS, X86_EXC_NM);
> +                generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
> +
> +                if ( (rc = ops->read_segment(x86_seg_cs,
> +                                             &cs, ctxt)) != X86EMUL_OKAY ||
> +                     (rc = ops->read_xcr(0, &xcr0, ctxt)) != X86EMUL_OKAY ||
> +                     (rc = ops->read_msr(MSR_IA32_XSS,
> +                                         &xss, ctxt)) != X86EMUL_OKAY )
> +                    goto done;
> +
> +                if ( vcpu_has_arch_lbr() &&
> +                     ((rc = ops->read_msr(MSR_LBR_CTL, &ctxt->xsaves.lbr_ctl,
> +                                          ctxt)) != X86EMUL_OKAY ||
> +                      (rc = ops->read_msr(MSR_LBR_DEPTH, &ctxt->xsaves.lbr_depth,
> +                                          ctxt)) != X86EMUL_OKAY) )
> +                    goto done;
> +
> +                s->blk = (s->modrm_reg & 7) == 3 ? blk_xrstors : blk_xsaves;
> +                ctxt->xsaves.rfbm = ((uint64_t)regs->edx << 32) | regs->eax;
> +                ctxt->xsaves.rfbm &= xcr0 | xss;

I'm unconvinced that this is a field that needs recording / passing. The
callee has all necessary pieces available afaic (the hookm after all,
should know what its sibling hook functions are).

> +                if ( s->blk == blk_xrstors )
> +                {
> +                    struct xsave_struct hdr;
> +                    int i;

Please don't ever use plain int for variables only ever holding non-
negative values.

> +                    if ( (rc = ops->read(s->ea.mem.seg, s->ea.mem.off, &hdr,
> +                                         sizeof(hdr), ctxt)) != X86EMUL_OKAY )
> +                        goto done;
> +                    /*
> +                     * We must validate xcomp_bv at this stage to get a
> +                     * stable XSAVE area size.
> +                     */
> +                    generate_exception_if(!xsave_area_compressed(&hdr),
> +                                          X86_EXC_GP, 0);
> +                    generate_exception_if(hdr.xsave_hdr.xcomp_bv &
> +                                          ~XSTATE_COMPACTION_ENABLED &
> +                                          ~(xcr0 | xss),
> +                                          X86_EXC_GP, 0);
> +                    generate_exception_if(hdr.xsave_hdr.xstate_bv &
> +                                          ~hdr.xsave_hdr.xcomp_bv,
> +                                          X86_EXC_GP, 0);
> +                    for ( i = 0; i < ARRAY_SIZE(hdr.xsave_hdr.reserved); i++ )
> +                        generate_exception_if(hdr.xsave_hdr.reserved[i],
> +                                              X86_EXC_GP, 0);
> +                    ctxt->xsaves.size = xstate_compressed_size(
> +                            hdr.xsave_hdr.xcomp_bv &
> +                            ~XSTATE_COMPACTION_ENABLED);
> +                }
> +                else
> +                {
> +                    ctxt->xsaves.size =
> +                            xstate_compressed_size(ctxt->xsaves.rfbm);
> +                }
> +
> +                if ( (rc = ops->blk(s->ea.mem.seg, s->ea.mem.off, NULL,
> +                                    ctxt->xsaves.size, &regs->eflags,
> +                                    s, ctxt)) != X86EMUL_OKAY )
> +                    goto done;
> +
> +                if ( s->blk == blk_xrstors && vcpu_has_arch_lbr() )
> +                {
> +                    if ( (rc = ops->write_msr(MSR_LBR_CTL,
> +                                              ctxt->xsaves.lbr_ctl,
> +                                              ctxt)) != X86EMUL_OKAY ||
> +                         (rc = ops->set_lbr_depth(ctxt->xsaves.lbr_depth,
> +                                                  ctxt)) != X86EMUL_OKAY )

This is the sole place where this new emulator hook is used. Why is the
hook necessary? IOW why isn't this ->write_msr(MSR_LBR_DEPTH, ...)?

> +                        goto done;
> +                    /*
> +                     * Even if xstate_bv[LBR]=0, XRSTORS will still clear
> +                     * LBR/LER MSRs.
> +                     */
> +                    if ( !(ctxt->xsaves.xstate_bv & X86_XSS_LBR) &&

Comment and code aren't quite correct, are they? The clearing won't happen
if the bit wasn't set in %eax. Plus I'd expect this to happen by way of
calling ->blk() (through the XSTRORS insn there) anyway.

> +                         ((rc = ops->write_msr(MSR_IA32_LASTINTFROMIP, 0,
> +                                               ctxt)) != X86EMUL_OKAY ||
> +                          (rc = ops->write_msr(MSR_IA32_LASTINTTOIP, 0,
> +                                               ctxt)) != X86EMUL_OKAY ||
> +                          (rc = ops->write_msr(MSR_LER_INFO, 0,
> +                                               ctxt)) != X86EMUL_OKAY) )
> +                        goto done;

If one of the later operations fails, in principle we'd need to roll back
earlier operations. As that's hard, at least a comment is needed to clarify
that not doing so is intentional.

> --- a/xen/arch/x86/x86_emulate/blk.c
> +++ b/xen/arch/x86/x86_emulate/blk.c
> @@ -17,6 +17,29 @@
>  # endif
>  #endif
>  
> +#if defined(__XEN__) && !defined(X86EMUL_NO_FPU)
> +static struct xstate_lbr *
> +x86_translate_lbr(struct x86_emulate_state *s,
> +                  struct x86_emulate_ctxt *ctxt,
> +                  const struct segment_register *cs,
> +                  bool saving,
> +                  struct xstate_lbr *lbr)
> +{
> +    uint64_t cs_offset;
> +    uint32_t i;

As per the earlier comment: While for cs_offset a fixed width type may be
justifiable (I would expect it to be a signed type, though), for i it
pretty certainly isn't.

> +    

Nit: No trailing blanks anywhere, please.

> +    cs_offset = x86_get_lbr_cs_offset(ctxt->cpuid, mode_64bit(), cs, saving);

Both callers avoid calling here when mode_64bit() is true. Why would you
nevertheless invoke that function here again? (See also the other, related
comment.)

> +    lbr->ler_from_ip += cs_offset;
> +    lbr->ler_to_ip += cs_offset;
> +    for ( i = 0; i < ctxt->xsaves.lbr_depth; i++ )
> +    {
> +        lbr->entries[i].lbr_from_ip += cs_offset;
> +        lbr->entries[i].lbr_to_ip += cs_offset;
> +    }
> +    return lbr;
> +}
> +#endif
> +
>  int x86_emul_blk(
>      void *ptr,
>      void *data,
> @@ -373,6 +396,125 @@ int x86_emul_blk(
>          }
>          break;
>  
> +/*
> + * XSAVES/XRSTORS emulation uses the host's XSS instructions and therefore
> + * can't be used in an usermode emulator.
> + */
> +#if defined(__XEN__) && !defined(X86EMUL_NO_FPU)

Seeing the comment here, to add to my related comment elsewhere: While you
can't invoke XSAVES/XRSTORS in usermode code, you can still mimic enough
of them using XSAVEC/XRSTOR to facilitate a reasonable level of testing. If
need be you can even (partly) deal with the new enumerators in
test_x86_emulator.c's blk() directly, rather than leaving (all of) it to
x86_emul_blk(). This may (see my comments on the commit message) even end
up easier if you have proper support for XSAVEC/XRSTOR first.

> +#define _xrstors(pfx, mem, eax, edx, faulted) \
> +        asm volatile ( "1: .byte " pfx "0x0f,0xc7,0x1f\n" \
> +                       "3:\n" \
> +                       "   .section .fixup,\"ax\"\n" \
> +                       "2: incl %[faulted]\n" \
> +                       "   jmp 3b\n" \
> +                       "   .previous\n" \
> +                       _ASM_EXTABLE(1b, 2b) \
> +                       : "+m" (*mem), [faulted] "+g" (faulted) \
> +                       : "a" (eax), "d" (edx), "D" (mem) )
> +#define _xsaves(pfx, mem, eax, edx, faulted) \
> +        asm volatile ( "1: .byte " pfx "0x0f,0xc7,0x2f\n" \
> +                       "3:\n" \
> +                       "   .section .fixup,\"ax\"\n" \
> +                       "2: incl %[faulted]\n" \
> +                       "   jmp 3b\n" \
> +                       "   .previous\n" \
> +                       _ASM_EXTABLE(1b, 2b) \
> +                       : "+m" (*mem), [faulted] "+g" (faulted) \
> +                       : "a" (eax), "d" (edx), "D" (mem) )
> +
> +    case blk_xrstors:
> +    {
> +        struct xsave_struct *xstate = ptr;
> +        unsigned int faulted;

bool?

> +        ASSERT(!data);
> +
> +        if ( ctxt->xsaves.rfbm & xstate->xsave_hdr.xcomp_bv & X86_XSS_LBR )
> +        {
> +            struct xstate_lbr *lbr;
> +
> +            lbr = get_xstate_component_comp(xstate, bytes, X86_XSS_LBR);
> +            generate_exception_if(!lbr, X86_EXC_GP, 0);
> +            if ( xstate->xsave_hdr.xstate_bv & X86_XSS_LBR )
> +            {
> +                generate_exception_if(lbr->lbr_ctl & ~LBR_CTL_VALID,
> +                                      X86_EXC_GP, 0);
> +                generate_exception_if(lbr->lbr_depth == 0 ||
> +                                      lbr->lbr_depth >
> +                                       NUM_MSR_ARCH_LBR_FROM_TO ||
> +                                      lbr->lbr_depth % 8 != 0,
> +                                      X86_EXC_GP, 0);
> +
> +                if ( !mode_64bit() )
> +                    x86_translate_lbr(s, ctxt, data, false, lbr);
> +                ctxt->xsaves.lbr_ctl = lbr->lbr_ctl;
> +                ctxt->xsaves.lbr_depth = lbr->lbr_depth;
> +                lbr->lbr_ctl = 0;
> +            }
> +            else
> +            {
> +                ctxt->xsaves.lbr_ctl = 0;
> +                /* Don't touch the previous LBR depth */
> +            }
> +        }
> +
> +        faulted = 0;
> +        if ( s->rex_prefix & REX_W )
> +            _xrstors("0x48,", xstate, ctxt->xsaves.rfbm & UINT32_MAX,
> +                     ctxt->xsaves.rfbm >> 32, faulted);
> +        else
> +            _xrstors("", xstate, ctxt->xsaves.rfbm & UINT32_MAX,
> +                     ctxt->xsaves.rfbm >> 32, faulted);

Personally I don't think UINT32_MAX is suitable for use as a mask. Imo
this wants to be a cast to uint32_t, which will also permit the
compiler to generate marginally better code.

> +        generate_exception_if(faulted, X86_EXC_GP, 0);

This ought to be only a safety net; you want to check _all_ fault
conditions (for all enabled components) in software.

> --- a/xen/arch/x86/x86_emulate/private.h
> +++ b/xen/arch/x86/x86_emulate/private.h
> @@ -295,6 +295,10 @@ struct x86_emulate_state {
>          blk_fxsave,
>  #endif
>          blk_movdir,
> +#ifndef X86EMUL_NO_FPU
> +        blk_xrstors,
> +        blk_xsaves,
> +#endif
>      } blk;
>      uint8_t modrm, modrm_mod, modrm_reg, modrm_rm;
>      uint8_t sib_index, sib_scale;
> @@ -537,6 +541,7 @@ amd_like(const struct x86_emulate_ctxt *ctxt)
>  #define vcpu_has_avx()         (ctxt->cpuid->basic.avx)
>  #define vcpu_has_f16c()        (ctxt->cpuid->basic.f16c)
>  #define vcpu_has_rdrand()      (ctxt->cpuid->basic.rdrand)
> +#define vcpu_has_lbr_lip()     (ctxt->cpuid->basic.lbr_1Ca.ip_contains_lip)

This reads odd, likely indicating a problem earlier in the series (I may
even have commented there): With leaf 1c being the LBR leaf, the above
ought to read

#define vcpu_has_lbr_lip()     (ctxt->cpuid->lbr.ip_contains_lip)

imo.

> --- a/xen/arch/x86/x86_emulate/util-xen.c
> +++ b/xen/arch/x86/x86_emulate/util-xen.c
> @@ -96,6 +96,20 @@ bool cf_check x86_insn_is_cr_access(const struct x86_emulate_state *s,
>      return false;
>  }
>  
> +bool cf_check x86_insn_is_xsaves(const struct x86_emulate_state *s,
> +                                 const struct x86_emulate_ctxt *ctxt)
> +{
> +    return ctxt->opcode == X86EMUL_OPC(0x0f, 0xc7) && s->ea.type == OP_MEM &&
> +           (s->modrm_reg & 7) == 5;
> +}
> +
> +bool cf_check x86_insn_is_xrstors(const struct x86_emulate_state *s,
> +                                  const struct x86_emulate_ctxt *ctxt)
> +{
> +    return ctxt->opcode == X86EMUL_OPC(0x0f, 0xc7) && s->ea.type == OP_MEM &&
> +           (s->modrm_reg & 7) == 3;
> +}

I can't spot any use of these two functions. Why are they being added here?
(Recall that unused functions constitute Misra violations. Plus we surely
don't want cf_check functions - i.e. more ENDBR instances - when they aren't
used.)

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -8592,6 +8592,25 @@ int x86_emul_rmw(
>  }
>  #undef stub_exn
>  
> +uint64_t x86_get_lbr_cs_offset(const struct cpu_policy *cp,
> +                               bool is_long_mode,
> +                               const struct segment_register *cs,
> +                               bool saving)
> +{
> +    bool host_lip, guest_lip;
> +    
> +    host_lip = current_cpu_has_lbr_lip;
> +    guest_lip = !!cp->basic.lbr_1Ca.ip_contains_lip;
> +
> +    if ( host_lip == guest_lip || is_long_mode )
> +        return 0;
> +    else if ( (host_lip && !guest_lip && saving) ||
> +              (!host_lip && guest_lip && !saving) )
> +        return -cs->base;
> +    else
> +        return cs->base;
> +}

This function is pretty certainly misplaced here. In fact I don't see
why it would need living under x86_emulate/ at all.

Also can you please avoid the use of "else" in cases like these (where
the earlier if() ends in a control flow statement)?

And then I question the is_long_mode parameter: Wouldn't it make sense
to have callers simply avoid the call for long mode environments? Yet
then the doc says nothing about long mode being special. Calls here may
be avoided for 64-bit mode environments, but afaict not for compat mode
ones.

Finally - no need for !! when the lhs is of type bool.

> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> @@ -534,6 +534,10 @@ struct x86_emulate_ops
>      /* vmfunc: Emulate VMFUNC via given set of EAX ECX inputs */
>      int (*vmfunc)(
>          struct x86_emulate_ctxt *ctxt);
> +
> +    int (*set_lbr_depth)(
> +        uint32_t depth,
> +        struct x86_emulate_ctxt *ctxt);
>  };
>  
>  struct cpu_user_regs;
> @@ -572,6 +576,22 @@ struct x86_emulate_ctxt
>      /* Long mode active? */
>      bool lma;
>  
> +    struct {
> +        /* In */
> +        uint64_t rfbm;
> +        unsigned int size;
> +        /* Inout */
> +        /*
> +         * MSR_LBR_{CTL,DEPTH} don't match guest state, so we need to pass
> +         * them to the emulator.
> +         */
> +        uint64_t lbr_ctl;
> +        uint64_t lbr_depth;
> +        /* Out */
> +        /* XRSTORS */
> +        uint64_t xstate_bv;
> +    } xsaves;

If any of this is really needed (see at least one comment further up),
this is the wrong structure to put the data in. Anything here is input /
output for callers of x86_emulate(). The interface to the ->blk() hook,
otoh, is internal to the emulator, and hence any associated data wants to
go into struct x86_emulate_state.

Yet even then a question would be whether adding to that structure is
actually necessary. There is the "data" parameter of the hook, after all,
which right now is unused for the two new enumerators.

All of the criticism aside, let me say that I'm impressed that you dared
to touch the emulator code, even more so for a rather complicated area.

Jan

