Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8B2A1A3A5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 12:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876178.1286551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tavpZ-0004Km-Bb; Thu, 23 Jan 2025 11:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876178.1286551; Thu, 23 Jan 2025 11:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tavpZ-0004Ic-7k; Thu, 23 Jan 2025 11:57:05 +0000
Received: by outflank-mailman (input) for mailman id 876178;
 Thu, 23 Jan 2025 11:57:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tavpY-0004IW-ET
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 11:57:04 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 284d4859-d981-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 12:57:02 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385deda28b3so534491f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 03:57:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf322a838sm18753848f8f.48.2025.01.23.03.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 03:57:01 -0800 (PST)
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
X-Inumbo-ID: 284d4859-d981-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737633422; x=1738238222; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/joPImFr6xW5XVBnoTNvsOMKWUJOHC3IgxYB/qzg4Wg=;
        b=J4lWypdkTLZ6rNqjuqO5OXvOmjnRI5nVLI1CA+2DpAyZdCt9C9AJMfQE8vJ+JO5dsk
         GhVxhGOGVxybIH4dcRloPQxKrVJtfzQn54u3Sxhn/Gt5tKgimp3ezMuZythHWYQjIjQz
         9di+dSkTSD6LF6Gfs6jE9uFXcxzIouiKzrnpAqi3VpvH86en+0o6ZbBzXZEm90qaW7+b
         VoCU88YPX8M6eFKo8iPJvY6+pQpq4nJTXW6vJpX/dAo4Kr9yib5uAnM7sKb1+IL5XGU4
         1nAnD9Ju4rSpiYi4uJubYADmITkePuqTAVrtdROkpp2EA2ABgxfE1yilYQObRZ99Z62w
         VjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737633422; x=1738238222;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/joPImFr6xW5XVBnoTNvsOMKWUJOHC3IgxYB/qzg4Wg=;
        b=kUXWCChdvTLNC5CnRFFHRWyqkYC+I6kpujzP66UQJab1DR5SsZxBHBWp5eWbvKI86d
         1VWp7TCZn+SkA0wY7ZK3BGhylTEYTKC4bM7GuMhHMWw2VmCgrOZ8zaZIpcXCfu1Uptmi
         T2xG1bR8lWq0QbAxFl+U5kNJ/YnK6KOHISyTSCaa6stOecwi70szRSuItStEln04oNJx
         OD1BSTqAM0KqqXrZ+UaquNMtA18fW3+M5Z9+TxZEITZVvhoKPjDP3wb6X92sBPZpEe5E
         Zfoizin3VEW54MGY2Hc3X1zmw7YmctRVe/zAFm6zsbYoidQBj466vaj2rzJAL6QyaW1+
         RlLw==
X-Forwarded-Encrypted: i=1; AJvYcCXJq9ymhICqg4jbG6Ne3L7yrt3pjPfrVg6UlTKfosgFiE92GFAly/M2fW89fcHfbEiQxsWf4RJIRIc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpkAwwz13FcqKmjbR6YKIQtHVm815FlSEEcaDdvHiZKU1eiwxi
	5bw/u71I/+6pbmC1ljSFLbTrbulmRKfclbBog74tHzZOQj5TKplrPZfOSGYrVQ==
X-Gm-Gg: ASbGncsicbqCr7Jt5XKPlAVsWE3upe6U04f6vcpuxAQxo9ZEGFfEDxZbrEKAKO8wgHB
	nUfmvoc2WzHkS4+y4pxAntrx6lye9S46N5moS3bZVExKXetJl2RKea/dlgiV8roNGwVM3Vuj8UX
	Pa+AnyITaLK1ioUj4lIdFokBnn8Qg5WNPAkWd/LyW4+uCgGnsKR+dOYB57mO+G0Yc5B/7ox50/V
	qqG+yKoO6nu2FYMZ+a1mI/RpcTeTffxwj411lC6G5r1vNZ8kcwIQQbJJLdrdKpN+kHsumTJJZv6
	TJqiegm+w+/z1gjX3C+38sON2MS0cAx0YfgUzlbpAkvIOJLidvAUM9do/N/na/qztg==
X-Google-Smtp-Source: AGHT+IG9RxqFBr+4wuNveVskPoUugHh9j64Cfe+bFcUo5L8Xjy6VChDCcfDpn7Dv+8eYKq5HRGyd5Q==
X-Received: by 2002:a05:6000:1883:b0:386:459f:67e0 with SMTP id ffacd0b85a97d-38bf5663678mr27149519f8f.21.1737633421654;
        Thu, 23 Jan 2025 03:57:01 -0800 (PST)
Message-ID: <867b4010-29d3-475c-a17d-8c7c19edea56@suse.com>
Date: Thu, 23 Jan 2025 12:57:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 09/10] x86/vmx: Implement arch LBR
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
 <20250102084413.102-10-ngoc-tu.dinh@vates.tech>
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
In-Reply-To: <20250102084413.102-10-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2025 09:45, Tu Dinh wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2021,6 +2021,13 @@ static void __context_switch(void)
>              if ( cpu_has_xsaves && is_hvm_vcpu(n) )
>                  set_msr_xss(n->arch.msrs->xss.raw);
>          }
> +#ifdef CONFIG_HVM
> +        /* XRSTORS LBR state behavior depends on MSR_LBR_DEPTH */
> +        if ( using_vmx() &&
> +             is_hvm_vcpu(n) &&
> +             n->domain->arch.cpu_policy->feat.arch_lbr )
> +            wrmsrl(MSR_LBR_DEPTH, n->arch.msrs->lbr_depth.raw);
> +#endif
>          vcpu_restore_fpu_nonlazy(n, false);
>          nd->arch.ctxt_switch->to(n);
>      }

Why the #ifdef? That's (indirectly) included in using_vmx() already,
isn't it?

And why the is_hvm_vcpu()? Non-HVM ones shouldn't ever have
->feat.arch_lbr set. In fact using_vmx() ought to be redundant with
the CPU policy check, too.

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -48,6 +48,7 @@
>  #include <asm/monitor.h>
>  #include <asm/prot-key.h>
>  #include <asm/spec_ctrl.h>
> +#include <asm/xstate.h>
>  #include <public/arch-x86/cpuid.h>
>  
>  static bool __initdata opt_force_ept;
> @@ -773,6 +774,67 @@ void vmx_update_exception_bitmap(struct vcpu *v)
>          __vmwrite(EXCEPTION_BITMAP, bitmap);
>  }
>  
> +static void cf_check vmx_set_lbr_depth(struct vcpu *v,
> +                                       uint32_t depth)
> +{
> +    struct cpu_policy *cp = v->domain->arch.cpu_policy;
> +    bool host_lip, guest_lip;
> +    uint32_t i;

unsigned int

> +    if ( !cp->feat.arch_lbr )
> +        return;
> +
> +    ASSERT(depth != 0 &&
> +           depth <= NUM_MSR_ARCH_LBR_FROM_TO &&

See comments on the respective guest_wrmsr() additions.

> +           depth % 8 == 0);
> +    ASSERT(cp->basic.lbr_1Ca.supported_depths & ((1u << (depth / 8)) - 1));
> +
> +    host_lip = current_cpu_has_lbr_lip;
> +    guest_lip = !!cp->basic.lbr_1Ca.ip_contains_lip;

As already indicated elsewhere in the series: No need for !! in cases
like this one. I wonder though whether the local variables are actually
needed. They look to be used only ...

> +    if ( v->arch.msrs->lbr_depth.raw == depth &&
> +         v->arch.hvm.vmx.last_host_lip == host_lip )
> +        return;
> +
> +    if ( host_lip != guest_lip )

... here (the XSS_EXIT_BITMAP update could be folded into this if()
and its "else").

> +    {
> +        for ( i = 0; i < depth; i++ )
> +        {
> +            vmx_set_msr_intercept(v, MSR_LBR_FROM_IP(i), VMX_MSR_RW);
> +            vmx_set_msr_intercept(v, MSR_LBR_TO_IP(i), VMX_MSR_RW);
> +        }
> +        vmx_set_msr_intercept(v, MSR_IA32_LASTINTFROMIP, VMX_MSR_RW);
> +        vmx_set_msr_intercept(v, MSR_IA32_LASTINTTOIP, VMX_MSR_RW);
> +    }
> +    else
> +    {
> +        for ( i = 0; i < depth; i++ )
> +        {
> +            vmx_clear_msr_intercept(v, MSR_LBR_FROM_IP(i), VMX_MSR_RW);
> +            vmx_clear_msr_intercept(v, MSR_LBR_TO_IP(i), VMX_MSR_RW);
> +        }
> +        vmx_clear_msr_intercept(v, MSR_IA32_LASTINTFROMIP, VMX_MSR_RW);
> +        vmx_clear_msr_intercept(v, MSR_IA32_LASTINTTOIP, VMX_MSR_RW);
> +    }
> +
> +    /* MSR_{LBR,LER}_INFO don't need translating */
> +    for ( i = 0; i < depth; i++ )
> +        vmx_clear_msr_intercept(v, MSR_LBR_INFO(i), VMX_MSR_RW);
> +    vmx_clear_msr_intercept(v, MSR_LER_INFO, VMX_MSR_RW);
> +    /* MSRs beyond LBR_DEPTH always need #GP */
> +    for ( i = depth; i < NUM_MSR_ARCH_LBR_FROM_TO; i++ )
> +    {
> +        vmx_set_msr_intercept(v, MSR_LBR_INFO(i), VMX_MSR_RW);
> +        vmx_set_msr_intercept(v, MSR_LBR_FROM_IP(i), VMX_MSR_RW);
> +        vmx_set_msr_intercept(v, MSR_LBR_TO_IP(i), VMX_MSR_RW);
> +    }

While I agree with the comment ahead of the loop, wouldn't hardware take
care of this when the intercept is disabled?

Further, do you really need to fiddle with the entire
[0,NUM_MSR_ARCH_LBR_FROM_TO) range for all three groups? Isn't is enough
to cover
[min(depth, v->arch.msrs->lbr_depth), max(depth, v->arch.msrs->lbr_depth))
when "host_lip != guest_lip" didn't change (which, aiui, on some [many?]
systems will never be the case)?

> @@ -871,6 +933,16 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
>      else
>          vmx_set_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
>  
> +    if ( cp->feat.arch_lbr && v->arch.msrs->lbr_depth.raw == 0 )
> +    {
> +        uint32_t max_depth;

unsigned int

> @@ -2679,6 +2752,48 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
>          __vmread(GUEST_BNDCFGS, &val);
>          break;
>  
> +    case MSR_LBR_CTL:
> +        __vmread(GUEST_LBR_CTL, &val);
> +        break;
> +
> +    case MSR_LBR_DEPTH:
> +        val = v->arch.msrs->lbr_depth.raw;
> +        break;

This doesn't look to be VMX-specific (beyond the question whether AMD
will ever implement ARCH-LBR), and hence perhaps does't belong here.

> +    case MSR_LER_INFO:
> +    case MSR_LBR_INFO(0)...MSR_LBR_INFO(NUM_MSR_ARCH_LBR_FROM_TO - 1):
> +        if ( v != curr )
> +        {
> +            val = 0;
> +            break;
> +        }
> +        rdmsrl(reg, val);
> +        break;
> +
> +    case MSR_IA32_LASTINTFROMIP:
> +    case MSR_IA32_LASTINTTOIP:
> +    case MSR_LBR_FROM_IP(0)...MSR_LBR_FROM_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1):
> +    case MSR_LBR_TO_IP(0)...MSR_LBR_TO_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1):
> +    {
> +        struct segment_register cs;
> +        int mode_64bit;
> +        uint64_t offset;
> +
> +        if ( v != curr )
> +        {
> +            val = 0;
> +            break;
> +        }
> +
> +        mode_64bit = vmx_guest_x86_mode(v) == X86_MODE_64BIT;
> +        hvm_get_segment_register(v, x86_seg_cs, &cs);
> +        offset = x86_get_lbr_cs_offset(cp, mode_64bit, &cs, true);
> +
> +        rdmsrl(reg, val);
> +        val += offset;
> +        break;
> +    }

Same for all of these as it seems. And then similarly for set-reg.

> @@ -4055,6 +4197,36 @@ static void undo_nmis_unblocked_by_iret(void)
>                guest_info | VMX_INTR_SHADOW_NMI);
>  }
>  
> +static void vmx_handle_xsaves_xrstors(bool saving)
> +{
> +    struct hvm_emulate_ctxt ctxt;
> +    int rc;
> +
> +    if ( saving )
> +        hvm_emulate_init_once(&ctxt, x86_insn_is_xsaves, guest_cpu_user_regs());
> +    else
> +        hvm_emulate_init_once(&ctxt, x86_insn_is_xrstors, guest_cpu_user_regs());
> +
> +    switch ( rc = hvm_emulate_one(&ctxt, VIO_no_completion) )
> +    {
> +    case X86EMUL_UNHANDLEABLE:
> +        hvm_dump_emulation_state(XENLOG_G_WARNING, "XSAVES/XRSTORS", &ctxt, rc);

Can the strings passed here and ...

> +        hvm_inject_hw_exception(X86_EXC_UD, 0);
> +        return;
> +
> +    case X86EMUL_UNRECOGNIZED:
> +        hvm_dump_emulation_state(XENLOG_G_WARNING, "XSAVES/XRSTORS", &ctxt, rc);

... here please properly reflect "saving"?

> +        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);

You correctly have X86_EVENT_NO_EC here, but not in the earlier invocation
of the function.

> +        break;
> +
> +    case X86EMUL_EXCEPTION:
> +        hvm_inject_event(&ctxt.ctxt.event);
> +        break;
> +    }

This switch lacks the handling of other X86EMUL_* cases (I realize you may
have found this pattern elsewhere). Actually, why aren't you using
hvm_emulate_one_insn() in the first place? After all this code isn't VMX-
specific at all.

> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -154,6 +154,9 @@ struct vmx_vcpu {
>      /* Are we emulating rather than VMENTERing? */
>      uint8_t              vmx_emulate;
>  
> +    /* If the vCPU last ran on a host CPU with XEN_X86_FEATURE_LBR_LIP */
> +    bool                 last_host_lip;

I assume this is for asymmetric configurations (e.g. E-cores vs P-cores)?
Yet then - doesn't this field also need migrating (which I first thought
it's for, considering the "host" in its name)?

> @@ -229,6 +232,7 @@ extern u32 vmx_pin_based_exec_control;
>  #define VM_EXIT_LOAD_HOST_EFER          0x00200000
>  #define VM_EXIT_SAVE_PREEMPT_TIMER      0x00400000
>  #define VM_EXIT_CLEAR_BNDCFGS           0x00800000
> +#define VM_EXIT_CLEAR_GUEST_LBR_CTL     0x04000000
>  extern u32 vmx_vmexit_control;
>  
>  #define VM_ENTRY_IA32E_MODE             0x00000200
> @@ -238,6 +242,7 @@ extern u32 vmx_vmexit_control;
>  #define VM_ENTRY_LOAD_GUEST_PAT         0x00004000
>  #define VM_ENTRY_LOAD_GUEST_EFER        0x00008000
>  #define VM_ENTRY_LOAD_BNDCFGS           0x00010000
> +#define VM_ENTRY_LOAD_GUEST_LBR_CTL     0x00200000
>  extern u32 vmx_vmentry_control;

As you can see from context (BNDCFGS) we don't use a _GUEST_ infix for
these. It's technically wrong in the former case (as it's the real MSR
that's to be cleared, not the guest view thereof).

> @@ -480,6 +489,8 @@ enum vmcs_field {
>      GUEST_PDPTE0                    = 0x0000280a,
>  #define GUEST_PDPTE(n) (GUEST_PDPTE0 + (n) * 2) /* n = 0...3 */
>      GUEST_BNDCFGS                   = 0x00002812,
> +    GUEST_RTIT_CTL                  = 0x00002814,
> +    GUEST_LBR_CTL                   = 0x00002816,
>      HOST_PAT                        = 0x00002c00,
>      HOST_EFER                       = 0x00002c02,
>      HOST_PERF_GLOBAL_CTRL           = 0x00002c04,

While I don't mind the GUEST_RTIT_CTL addition here, it's unrelated. Such
things, even if minor, are normally mentioned in the patch description
(if nothing else, then to indicate they're actually deliberate).

> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -389,6 +389,11 @@ struct vcpu_msrs
>          uint64_t raw;
>      } xss;
>  
> +    /* 0x000014cf - MSR_LBR_DEPTH */
> +    struct {
> +        uint64_t raw;
> +    } lbr_depth;

Why is this needed? The value is part of xstate, and hence saved/restored
that way, and also accessible there. You may of course have chosen to put
it here for other reasons, but then please comment this entry accordingly.
The comment would presumably also want to clarify that this is a HVM-only
field (alternatively this could be expressed by enclosing in #ifdef
CONFIG_HVM, provided the result actually builds okay).

I'm also uncertain about this wanting to be a struct. There are no fields
within the MSR (except for the partitioning between valid and reserved
bits).

> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -193,6 +193,38 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>              goto gp_fault;
>          goto get_reg;
>  
> +    case MSR_LBR_CTL:
> +    case MSR_LBR_DEPTH:
> +    case MSR_LER_INFO:
> +        if ( !cp->feat.arch_lbr )
> +            goto gp_fault;
> +
> +        goto get_reg;
> +
> +    case MSR_LBR_INFO(0)...MSR_LBR_INFO(NUM_MSR_ARCH_LBR_FROM_TO - 1):
> +        if ( !cp->feat.arch_lbr )
> +            goto gp_fault;
> +
> +        if ( msr - MSR_LBR_INFO(0) >= msrs->lbr_depth.raw )
> +            goto gp_fault;
> +
> +        goto get_reg;
> +
> +    case MSR_IA32_LASTINTFROMIP:
> +    case MSR_IA32_LASTINTTOIP:

I don't think you can wire these two ...

> +    case MSR_LBR_FROM_IP(0)...MSR_LBR_FROM_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1):
> +    case MSR_LBR_TO_IP(0)...MSR_LBR_TO_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1):
> +        if ( !cp->feat.arch_lbr )
> +            goto gp_fault;

... this way. When called from hvm_msr_read_intercept() they need to be
permitted through to vmx_msr_read_intercept() in the !ARCH_LBR case.

> +        if ( (msr >= MSR_LBR_FROM_IP(msrs->lbr_depth.raw) &&
> +              msr <= MSR_LBR_FROM_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1)) ||
> +             (msr >= MSR_LBR_TO_IP(msrs->lbr_depth.raw) &&
> +              msr <= MSR_LBR_TO_IP(NUM_MSR_ARCH_LBR_FROM_TO - 1)) )
> +            goto gp_fault;

Much like you did for INFO, having the two ranges separately will simplify
the conditional(s) here.

Both comments obviously apply to the write path, too.

> @@ -516,6 +548,60 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>          }
>  
>          goto set_reg;
> +
> +    case MSR_LBR_CTL:
> +        if ( !cp->feat.arch_lbr )
> +            goto gp_fault;
> +
> +        if ( val & ~LBR_CTL_VALID )
> +            goto gp_fault;
> +
> +        goto set_reg;
> +
> +    case MSR_LBR_DEPTH:
> +        if ( !cp->feat.arch_lbr )
> +            goto gp_fault;
> +
> +        if ( val == 0 ||

I wasn't able to find an indication that 0 is an illegal value here. It
looks as if this simply means "no LBRs other than the LER ones".

> +             val > NUM_MSR_ARCH_LBR_FROM_TO ||

Isn't this redundant with ...

> +             val % 8 != 0 )
> +            goto gp_fault;
> +
> +        if ( !(cp->basic.lbr_1Ca.supported_depths &
> +               ((1u << (val / 8)) - 1)) )
> +            goto gp_fault;

... this?

Jan

