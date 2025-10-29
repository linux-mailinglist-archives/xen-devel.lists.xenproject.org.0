Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DC3C1B84E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 16:03:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152825.1483329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE7gy-0003lq-Pm; Wed, 29 Oct 2025 15:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152825.1483329; Wed, 29 Oct 2025 15:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE7gy-0003jm-M9; Wed, 29 Oct 2025 15:02:28 +0000
Received: by outflank-mailman (input) for mailman id 1152825;
 Wed, 29 Oct 2025 15:02:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vE7gw-0003jg-JC
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 15:02:26 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47360470-b4d8-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 16:02:25 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso4670260f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 08:02:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db9c6sm27292583f8f.36.2025.10.29.08.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 08:02:23 -0700 (PDT)
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
X-Inumbo-ID: 47360470-b4d8-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761750144; x=1762354944; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R0zvKJ+0SULg4C8IWIi4sk6bbkhDONZOC2CCcmxfur4=;
        b=G/FM4gObbE1U1BhK23enEsAPivUk55s+w9alk/p680/lcAmwjwRIQAYo34HYY0guLc
         Wbazu0A1cUI5Kj6j8R48KKGBHx2liy4AhCVhlNR62W0ST6thc/GBwo/8COi5SnrmHxdK
         bNMGA7BzP6O2ZxTfY4ndoaNpYcdiTDHOwPwmUQ9y0b5V8Eaeqa/k6M1ZPQ1OhP/67cXr
         k9AyuSAljGCUiAfzwoD8TRo8TUFwi+s4ZAviBtbED/lewRGJgbxfgRul3q+8LvPCwbmy
         7Pf0HQMnWZ4dZeHbaa4WraKbcIPfq8j7Ct2JkNTbiUAH/7eVA6FsmeQ/qstQxjf4YstF
         NEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761750144; x=1762354944;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0zvKJ+0SULg4C8IWIi4sk6bbkhDONZOC2CCcmxfur4=;
        b=kpqZeyDoxeMvSLS1qA6e5QLXoLIbDpOuFUXDkRlVI6f9ay/IxBOD8dkXWGf5YfeMXh
         BGpiDcMCnbIoPQWlu9y+L8gQf7ZV9Jkxo8GCHOHueDpjDTSOWAi8ZwwW6X6ecS1vEgl2
         3MR0esK7Pg2yQ9eMdxKPxA70JZukTyONQitvAhcbEXY45kxOSLChqX2lVeqNW5/PGmW9
         eETO+2tmAe7fvhyLola/xGyTpUQN7hF7+ypjXsL/LNvVzmcd4/lWccqYpPnm5nXN56nN
         3wpNEX9XvQ0iY/1lFQbfXrHGmHqflZj/BehBxF8M+noHSkAow7j4HXsw2j0Daq/BaruZ
         5S7A==
X-Forwarded-Encrypted: i=1; AJvYcCXU+N3YT3CAeTE0Ylfw6ULyky39tsW67Jm05B17Nu8yTUMOEzhgUYAAdGYPxJW2YdI6DHm7zyzaZwU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yww7GpB2PyoMKfn1rZl6fKpStHCvvK30E3pm/S9Xg/NWXXt2jGU
	/thOSgKxb1hm5giIJu9rAMeIP0156D8D1tI1olzY5OPG1mBnZ4WaDN7a0Wb6WMC+xA==
X-Gm-Gg: ASbGncslbWVoY9Rq4fzuQv0CUlJIwrFJ9gk8bMWe1bFo6PQTwki1z/r9+a38VGqZ4KO
	UKUchvl3TcjM5rIKF0bbV1POGKVblIyKV0eRb9pt9MzlSVbwVTIp5hLJqjwxHBbumHfgWnXY5S3
	gUNhZI3Dk6+uDhfVWNy/dRLm0Rk5W/InaZNlJya7FL3SOBlS27rHtstZu9wmjtIQjWx0N2B+zrN
	5Fx5VSUHpUyPLpeY6kj7yck52cSZ0SAl9mgmBOTvP16t/XWusNoQ5Fts55MZ54n402ne1vyonq9
	whoYoE1eflbpSCJ0J3MPHsnvGl8zFN+cPmEt6IAfAvQRwAKZ9whwD8gL/qJMeqgtPF0OTbqGstW
	XHHUTVgv+HsD456fNCGveQJSfzxQOt79OOPfpTF3yL33I899CUG4SfnOMDfbJL2B/QyU/MEG8ah
	bSSmT9QqgMJrOojz3WeLcyFATJUE+8qliNehdkYUhXsp50/DmavrHEzZ5BJUJ4
X-Google-Smtp-Source: AGHT+IF5g09xsOvAZUJ6neBeDHyUqSvtEPagJhaDodxyEHROQ8CCBun12yv+MljP8YPfPa5svcFRuw==
X-Received: by 2002:a05:6000:2283:b0:425:8bd2:24de with SMTP id ffacd0b85a97d-429aef7773amr1915614f8f.9.1761750144215;
        Wed, 29 Oct 2025 08:02:24 -0700 (PDT)
Message-ID: <23426fe7-533a-4ffc-9ad5-a620f2ac0cfc@suse.com>
Date: Wed, 29 Oct 2025 16:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/28] xen/vm_event: introduce vm_event_is_enabled()
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-9-Penny.Zheng@amd.com>
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
In-Reply-To: <20251013101540.3502842-9-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 12:15, Penny Zheng wrote:
> @@ -2340,6 +2341,7 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
>           (value & (X86_CR0_PE | X86_CR0_PG)) == X86_CR0_PG )
>          return X86EMUL_EXCEPTION;
>  
> +    may_defer &= vm_event_is_enabled(v);

I think this wants to move to the very top of the function, so that it's clear
that all uses (current and future) in the function are covered. Same for the
sibling functions, of course.

> @@ -3544,6 +3548,7 @@ int hvm_vmexit_cpuid(struct cpu_user_regs *regs, unsigned int inst_len)
>      struct vcpu *curr = current;
>      unsigned int leaf = regs->eax, subleaf = regs->ecx;
>      struct cpuid_leaf res;
> +    int ret = 0;
>  
>      if ( curr->arch.msrs->misc_features_enables.cpuid_faulting &&
>           hvm_get_cpl(curr) > 0 )
> @@ -3560,7 +3565,10 @@ int hvm_vmexit_cpuid(struct cpu_user_regs *regs, unsigned int inst_len)
>      regs->rcx = res.c;
>      regs->rdx = res.d;
>  
> -    return hvm_monitor_cpuid(inst_len, leaf, subleaf);
> +    if ( vm_event_is_enabled(curr) )
> +        ret = hvm_monitor_cpuid(inst_len, leaf, subleaf);
> +
> +    return ret;

Just to mention, could also do without a new local variable:

    return vm_event_is_enabled(curr)
           ? hvm_monitor_cpuid(inst_len, leaf, subleaf)
           : 0;

> @@ -3860,9 +3869,11 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
>      struct vcpu *curr = current;
>      struct domain *currd = curr->domain;
>  
> -    if ( currd->arch.monitor.descriptor_access_enabled )
> +    if ( currd->arch.monitor.descriptor_access_enabled &&
> +         vm_event_is_enabled(curr) )

While functionally it won't matter, logically this looks the wrong way round.
In principle I'd expect the "monitor" field to also disappear when VM_EVENT=n,
at which point the order will need to be the other way around anyway (as the
explicit CONFIG_VM_EVENT then needs to come first).

>      {
>          ASSERT(curr->arch.vm_event);
> +
>          hvm_monitor_descriptor_access(exit_info, vmx_exit_qualification,
>                                        descriptor, is_write);
>      }

Stray change (especially in an already big patch)?

> @@ -2551,7 +2552,7 @@ void asmlinkage svm_vmexit_handler(void)
>      uint64_t exit_reason;
>      struct vcpu *v = current;
>      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
> -    int insn_len, rc;
> +    int insn_len, rc = 0;

This is almost 200 lines apart from ...

> @@ -2720,11 +2721,14 @@ void asmlinkage svm_vmexit_handler(void)
>                      break;
>              }
>  
> -            rc = hvm_monitor_debug(regs->rip,
> -                                   HVM_MONITOR_DEBUG_EXCEPTION,
> -                                   trap_type, insn_len, 0);
> -            if ( rc < 0 )
> -                goto unexpected_exit_type;
> +            if ( vm_event_is_enabled(v) )
> +            {
> +                rc = hvm_monitor_debug(regs->rip,
> +                                       HVM_MONITOR_DEBUG_EXCEPTION,
> +                                       trap_type, insn_len, 0);
> +                if ( rc < 0 )
> +                    goto unexpected_exit_type;
> +            }
>              if ( !rc )
>                  hvm_inject_exception(X86_EXC_DB,
>                                       trap_type, insn_len, X86_EVENT_NO_EC);

... where it first comes into play. I wonder whether the initialization
wouldn't better move closer, also for the code to be less fragile going
forward (where a new earlier use of rc might easily appear). Or, like VMX
code has it, limit the scope of "rc" (requiring several instances then in
relatively narrow scopes).

> --- a/xen/arch/x86/include/asm/vm_event.h
> +++ b/xen/arch/x86/include/asm/vm_event.h
> @@ -45,4 +45,13 @@ void vm_event_sync_event(struct vcpu *v, bool value);
>  
>  void vm_event_reset_vmtrace(struct vcpu *v);
>  
> +static inline bool vm_event_is_enabled(struct vcpu *v)

Pointer-to-const please for (almost?) all predicate-like functions.

> +{
> +#ifdef CONFIG_VM_EVENT
> +    return v->arch.vm_event != NULL;
> +#else
> +    return false;
> +#endif
> +}

As long a vm_event is always a member of struct arch_vcpu, IS_ENABLED() should
be sufficient here? Or did you merely forget to add an #ifdef around the field
as well? Albeit I realize that would break with e.g. the use in
hvmemul_rep_outs_set_context(). Otoh that function (and likely others there)
should be compiled out when VM_EVENT=n. Maybe that's the subject of the next
patch ...

Jan

