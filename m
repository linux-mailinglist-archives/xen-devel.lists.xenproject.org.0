Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIhhBbzqkmlSzwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:00:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 574DB1422C4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233867.1537226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvOq-0001WP-A3; Mon, 16 Feb 2026 10:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233867.1537226; Mon, 16 Feb 2026 10:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvOq-0001Tb-5p; Mon, 16 Feb 2026 10:00:16 +0000
Received: by outflank-mailman (input) for mailman id 1233867;
 Mon, 16 Feb 2026 10:00:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vrvOp-0001TT-Ei
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 10:00:15 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 484bba0a-0b1e-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 11:00:11 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso35664175e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 02:00:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dd0deeasm382771015e9.12.2026.02.16.02.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 02:00:10 -0800 (PST)
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
X-Inumbo-ID: 484bba0a-0b1e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771236011; x=1771840811; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ddyKCkBTU+alnVbXpRWzYOsHi3pLnWpdRGDAtJHQjBE=;
        b=X7doxU5QlnFlROLBXBHpypMlUbHel4srwHKLFEHFla6MaJ8qlnLeYanh18iA5XsCZ+
         HHKuG/DiURP2F7q0rppgCiobIivaTWYK4KBJ5aWUjD2fDWTh7nP3PKKbvh/xRcI+y6vT
         r87Z9CQR9zXWon5A0mYd5t4gT8kOSC0pve7mxysiOkm8InBHxFF9EISK4isNysqLxqYC
         SnsyY0dIE9iMZ87N2VL83cA6hn7pJ86RRRVsON069uf7bU9qP0ktuI5IUTtBVPwMrmSn
         DAyaIdZN+0LpCFlim7RmH5E6CPNwYLiHHS9B1jN7JGSSgXkVRy1P/NKKiqO905/+lIo/
         +RQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771236011; x=1771840811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddyKCkBTU+alnVbXpRWzYOsHi3pLnWpdRGDAtJHQjBE=;
        b=BhwcWXye6Vpp+5Dm2ANVmY4E3iMLIcjyMshmiYQRPxJt9yh7NRVRNuwoGHfQNduZvC
         QTxlep1pNWosbT+Ewjm94uVLl4ytT3nDrWBWm1xMtoF0IQuYQachbcPdblW2T5/d0PKA
         ltDtBgPGq+JTkpGKLpUyBSMRaJxyuYCAdO99Up5sPqfrFJ1uluyfj5rclim+KCI7ou9A
         t6/o7FrJA9cAoyaUYt6e53Jq412TtBxUD/33cpocaw14YAFc+bUZXR8Gwj2Uoj7iicc8
         Dq49fR+DzZnIMCzsD4oS9lEP228+kQL9+yyFLwYJkPspvNwRF/z6fFOG/Bum/XAqbXM5
         Jd9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUoEMIFZOfwHXbmu6e329R14hlUgKofnryi1Ly5F+N3oGgBtOvFOd93R0eRB48I5wN8jjBGm9HNME=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxrtduivwl3Sd9h0qPNb2O6T00jLKvCsxO4H2KIc69PspiDuQ3a
	RL14ELuYctJegjEqEQv92rvR5pltlZYilqENa/aYjHfexg8W+ZR+IvkhEEO73fb/Og==
X-Gm-Gg: AZuq6aJvZOBwNsYdqmSNdWbfPUWb2SNy2jFP+vdoKUTNA4mLCF2cdrlcoro6pS6AC9c
	NpQlVRFSY0/9/ulTLyRhZPXaFbz6MaTbB00A/H7gMwRmF6sirDWY8+0yR4DydKZTH7Wqt8EbzOL
	5L1q2GhIZV5rjKsKJ5gkAYaw0tCRZ/IVdF7q5+/TZPp8fe9ce909MQ6Qyvyv5WEYP5BX27sVda2
	0Zv0Gmh8pIaoT5sFbmLztOcA3gNSvsUwMn4wxkB+6QHRcQ+EKmAe5JanQSEZpAUZ8zdhPJ7uqGx
	sY9keXmfsdxE7r2TttLLSNQlf0+S2LI0zSW6a/0lCewV5WIGN+5mBsFnVPmHvHhEWMYMQjVJH1n
	yYSWzHFx+y4QRVbFqKQhQRIp0uNHdDfGyfmhL5GS0B6NQdHdMBk9kowcaGILhqEzT0FkXfvY76l
	g5GALzhliy/+5mZs0z6e7IXHu3yTPA6FyyMWFjRVt4nJ6CgjBfUo3we6MOtWWY79L36EQ2suPnl
	F2cMhycGjWtVQs=
X-Received: by 2002:a05:600c:1c19:b0:483:5310:dc67 with SMTP id 5b1f17b1804b1-48379be817cmr136545715e9.20.1771236010887;
        Mon, 16 Feb 2026 02:00:10 -0800 (PST)
Message-ID: <1c8b9400-ff2f-4ffc-bad7-9d44fa44fd81@suse.com>
Date: Mon, 16 Feb 2026 11:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Add Kconfig option to disable nested
 virtualization
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: roger.pau@citrix.com, andrew.cooper3@citrix.com, jason.andryuk@amd.com,
 alejandro.garciavallejo@amd.com, xen-devel@lists.xenproject.org
References: <20260213220205.196179-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20260213220205.196179-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stefano.stabellini@amd.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 574DB1422C4
X-Rspamd-Action: no action

On 13.02.2026 23:02, Stefano Stabellini wrote:
> Introduce CONFIG_NESTED_VIRT (default n) to allow nested virtualization
> support to be disabled at build time. This is useful for embedded or
> safety-focused deployments where nested virtualization is not needed,
> reducing code size and attack surface.
> 
> When CONFIG_NESTED_VIRT=n, the following source files are excluded:
> - arch/x86/hvm/nestedhvm.c
> - arch/x86/hvm/svm/nestedsvm.c
> - arch/x86/hvm/vmx/vvmx.c
> - arch/x86/mm/nested.c
> - arch/x86/mm/hap/nested_hap.c
> - arch/x86/mm/hap/nested_ept.c
> 
> Add inline stubs where needed in headers. Guard assembly code paths
> for nested virt with #ifdef CONFIG_NESTED_VIRT. Move exception
> injection for VMX/SVM instructions to the callers in vmx.c/svm.c to
> avoid header dependency issues in the stubs.
> 
> No functional change when CONFIG_NESTED_VIRT=y.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> ---
> Changes in v3:
> - Kconfig: Change "depends on AMD_SVM || INTEL_VMX" to "depends on HVM"
> - Kconfig: Remove redundant "default n" line
> - Kconfig: Remove "If unsure, say N." from help text
> - mm/hap/Makefile: Simplify using intermediate nested-y variable:
>     nested-y := nested_hap.o
>     nested-$(CONFIG_INTEL_VMX) += nested_ept.o
>     obj-$(CONFIG_NESTED_VIRT) += $(nested-y)
> - svm/nestedhvm.h: Remove #ifdef CONFIG_NESTED_VIRT stubs, keep only
>   function declarations (the functions are only called from code that
>   is already compiled out when nested virt is disabled)
> - svm/nestedhvm.h: Add CONFIG_NESTED_VIRT guard to nsvm_efer_svm_enabled
>   macro to return false when nested virt is disabled
> - svm/svm.c: Move #UD injection for STGI/CLGI to the caller instead of
>   stub functions, checking nestedhvm_enabled()/nsvm_efer_svm_enabled()
> - svm/svm.c: Mark svm_vmexit_do_vmrun/vmload/vmsave as __maybe_unused
> - svm/svm.c: Remove empty nsvm_vcpu_switch stub (now guarded in asm)
> - svm/entry.S: Add #ifdef CONFIG_NESTED_VIRT guards around nested virt
>   specific code paths
> - vmx/vmx.c: Remove empty nvmx_switch_guest stub (now guarded in asm)
> - vmx/vmx.c: Move nvmx_enqueue_n2_exceptions and nvmx_vmexit_event to
>   vvmx.c where they belong
> - vmx/vvmx.h: Add declarations for nvmx_vmexit_event and
>   nvmx_enqueue_n2_exceptions
> - vmx/vvmx.h: Fix nvmx_msr_read_intercept stub comment
> - vmx/vvmx.h: nvmx_handle_vmx_insn stub returns X86EMUL_EXCEPTION with
>   ASSERT_UNREACHABLE (caller handles injection)
> - vmx/vvmx.h: Convert get_vvmcs macro to inline function in stubs
> - vmx/entry.S: Add #ifdef CONFIG_NESTED_VIRT guard around nvmx_switch_guest
> - nestedhvm.h: Convert macro stubs to proper inline functions

Oh, wow, that's an almost complete re-write?

> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -92,4 +92,11 @@ config MEM_SHARING
>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>  	depends on INTEL_VMX
>  
> +config NESTED_VIRT
> +	bool "Nested virtualization support"
> +	depends on HVM
> +	help
> +	  Enable nested virtualization, allowing guests to run their own
> +	  hypervisors. This requires hardware support.

What's the last sentence about? HVM itself already requires hardware
support, yet that's about it especially for VMX (where only HAP is the
other requirement), isn't it? If this is about those advanced features,
perhaps this would then want to be more specific?

> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> @@ -24,7 +24,7 @@
>  
>  /* True when l1 guest enabled SVM in EFER */
>  #define nsvm_efer_svm_enabled(v) \
> -    (!!((v)->arch.hvm.guest_efer & EFER_SVME))
> +    (IS_ENABLED(CONFIG_NESTED_VIRT) && ((v)->arch.hvm.guest_efer & EFER_SVME))

Constructs like these are on the edge: Yes, passing in an expression with a side
effect isn't very likely here. Yet still, this being a widely visible macro, I
wonder if it wouldn't better guarantee v to be evaluated exactly once.

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2165,7 +2165,7 @@ static void svm_vmexit_do_pause(struct cpu_user_regs *regs)
>      vcpu_yield();
>  }
>  
> -static void
> +static void __maybe_unused
>  svm_vmexit_do_vmrun(struct cpu_user_regs *regs,
>                      struct vcpu *v, uint64_t vmcbaddr)
>  {
> @@ -2211,7 +2211,7 @@ nsvm_get_nvmcb_page(struct vcpu *v, uint64_t vmcbaddr)
>      return  page;
>  }
>  
> -static void
> +static void __maybe_unused
>  svm_vmexit_do_vmload(struct vmcb_struct *vmcb,
>                       struct cpu_user_regs *regs,
>                       struct vcpu *v, uint64_t vmcbaddr)
> @@ -2246,7 +2246,7 @@ svm_vmexit_do_vmload(struct vmcb_struct *vmcb,
>      __update_guest_eip(regs, inst_len);
>  }
>  
> -static void
> +static void __maybe_unused
>  svm_vmexit_do_vmsave(struct vmcb_struct *vmcb,
>                       struct cpu_user_regs *regs,
>                       struct vcpu *v, uint64_t vmcbaddr)

Why are these needed? The call sites don't go away afaics.

If these are nevertheless needed, question is whether a suitable single #ifdef
might not be tidier.

> @@ -3011,10 +3013,16 @@ void asmlinkage svm_vmexit_handler(void)
>          svm_vmexit_do_vmsave(vmcb, regs, v, regs->rax);
>          break;
>      case VMEXIT_STGI:
> -        svm_vmexit_do_stgi(regs, v);
> +        if ( !nestedhvm_enabled(v->domain) )
> +            hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
> +        else
> +            svm_vmexit_do_stgi(regs, v);
>          break;
>      case VMEXIT_CLGI:
> -        svm_vmexit_do_clgi(regs, v);
> +        if ( !nsvm_efer_svm_enabled(v) )
> +            hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
> +        else
> +            svm_vmexit_do_clgi(regs, v);
>          break;

These render respective checks in the functions themselves dead, which in
particular means the bodies of those if()s there are then unreachable (a
Misra violation of a rule we did accept).

> @@ -2942,8 +2916,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
>      .nhvm_vcpu_vmexit_event = nvmx_vmexit_event,
>      .nhvm_intr_blocked    = nvmx_intr_blocked,
>      .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
> -    .update_vlapic_mode = vmx_vlapic_msr_changed,

I realize the = wasn't properly padded here, but ...

>      .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
> +#endif
> +    .update_vlapic_mode = vmx_vlapic_msr_changed,

... can you please to so while moving the line?

> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -2821,6 +2821,32 @@ void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int cr)
>      __vmwrite(read_shadow_field, v->arch.hvm.nvcpu.guest_cr[cr]);
>  }
>  
> +void nvmx_enqueue_n2_exceptions(struct vcpu *v,
> +            unsigned long intr_fields, int error_code, uint8_t source)

While moving, can obvious style issues please be addressed? Bad indentation
here, ...

> +{
> +    struct nestedvmx *nvmx = &vcpu_2_nvmx(v);
> +
> +    if ( !(nvmx->intr.intr_info & INTR_INFO_VALID_MASK) ) {

... misplaced brace here, and ...

> +        /* enqueue the exception till the VMCS switch back to L1 */

... malformed comment here.

> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -711,7 +711,7 @@ static inline bool hvm_altp2m_supported(void)
>  /* Returns true if we have the minimum hardware requirements for nested virt */
>  static inline bool hvm_nested_virt_supported(void)
>  {
> -    return hvm_funcs.caps.nested_virt;
> +    return IS_ENABLED(CONFIG_NESTED_VIRT) && hvm_funcs.caps.nested_virt;
>  }

Should the field itself perhaps become conditional?

> --- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
> +++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
> @@ -25,9 +25,21 @@ enum nestedhvm_vmexits {
>  /* Nested HVM on/off per domain */
>  static inline bool nestedhvm_enabled(const struct domain *d)
>  {
> -    return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested_virt);
> +    return IS_ENABLED(CONFIG_NESTED_VIRT) &&
> +           (d->options & XEN_DOMCTL_CDF_nested_virt);
>  }
>  
> +/* Nested paging */
> +#define NESTEDHVM_PAGEFAULT_DONE       0
> +#define NESTEDHVM_PAGEFAULT_INJECT     1
> +#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
> +#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
> +#define NESTEDHVM_PAGEFAULT_MMIO       4
> +#define NESTEDHVM_PAGEFAULT_RETRY      5
> +#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
> +
> +#ifdef CONFIG_NESTED_VIRT

In a reply to my comment on v1 (Or was it v2? This submission isn't tagged.),
you referred me to the stub nestedhvm_hap_nested_page_fault() using the
constant. However, why would that stub be needed when the sole call site of
the function lives in a conditional using nestedhvm_enabled() (which is
compile-time fales when NESTED_VIRT=n)? All you need to make sure is that
the decl remains available. I then wonder for how many of the other stubs
which might be the case as well.

> @@ -199,5 +201,77 @@ int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga,
>                          uint64_t *exit_qual, uint32_t *exit_reason);
>  int nvmx_cpu_up_prepare(unsigned int cpu);
>  void nvmx_cpu_dead(unsigned int cpu);
> +int cf_check nvmx_vmexit_event(struct vcpu *v, const struct x86_event *event);
> +void nvmx_enqueue_n2_exceptions(struct vcpu *v,
> +            unsigned long intr_fields, int error_code, uint8_t source);

Nit: Bad indentation even copied here.

Jan

