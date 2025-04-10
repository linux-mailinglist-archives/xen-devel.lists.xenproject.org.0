Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FBFA85015
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 01:25:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946504.1344377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u31G4-0000yJ-15; Thu, 10 Apr 2025 23:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946504.1344377; Thu, 10 Apr 2025 23:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u31G3-0000wr-T5; Thu, 10 Apr 2025 23:24:31 +0000
Received: by outflank-mailman (input) for mailman id 946504;
 Thu, 10 Apr 2025 23:24:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BGYy=W4=flex--seanjc.bounces.google.com=3JFP4ZwYKCfElXTgcVZhhZeX.VhfqXg-WXoXeeblml.qXgikhcXVm.hkZ@srs-se1.protection.inumbo.net>)
 id 1u31G2-0000wj-OL
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 23:24:30 +0000
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [2607:f8b0:4864:20::449])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eed3d97f-1662-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 01:24:23 +0200 (CEST)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-736cd36189bso1663716b3a.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 16:24:22 -0700 (PDT)
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
X-Inumbo-ID: eed3d97f-1662-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744327461; x=1744932261; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+8Hj0FhxYq298MEgk+A50ezX9To9apyasGONCk8/EIY=;
        b=nRjbiHgQcTnQuFFINhx7Raz0zuWHaWfKoQPFi2fGDAHU/n2b2lhFoaSxms3aCh8J0R
         /PBzC81zxmQEqI+JIDoW7WnJs+eHm1OinfjVuWGALfd2oyKI4nX7hJPSQv+4BXai7W1S
         k7npYGDlqiybRH1lAL4ejDnI5HUo0gEPcXroex+oh5H0uhGuJMovUPi5knuqEBtUVPXh
         Hz3xNBDb4mrSYQ+C6tdhNAOzbdLhpxxonu1oGKH9crfs2at9Xp7G/tx2fXZifXRXEdhA
         1AIwEGfiaruqUrjsS8gki2tSl+cXcyXkfmFuzdOMVQhVTUMX2iWktjrwAE5SoKbFOEGz
         ODGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744327461; x=1744932261;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+8Hj0FhxYq298MEgk+A50ezX9To9apyasGONCk8/EIY=;
        b=Mh9A/koIh750A/0QWWTEEabkPSC5knrxccMOzhBb/HhM0g7J50Po6LHhz8J+h0S8bg
         FMFwOHoaJBNNsPbMonsj00Jm2UhX2Omt47c8LpUALoa6AueTjNUk15in8eExbAu1RMtA
         TI9C3xI98WYlBkTB7Q8towS3OHweLJd3cPQVjwulH46vJv9XeEXXMjT5+/oLznCiYr0j
         A44iFiQOWuTo6ccJi7FfM6v0ZuV7nQsZRgnD5HRRAlYcx+qiVQ1tYF/5d1rdVBssnGBA
         fSSDL03W6OoZoQYpKj9du37X/xz3jJd+3DgBltOwJ50JlzxusGa2cvOpGfNVtC3zfBoF
         BY2A==
X-Forwarded-Encrypted: i=1; AJvYcCXCPrfEk4KQWDoeP5z1m9faHF0RCu5hPpW+fKz97N57ngxs4YJe5LNWIERGu++Pr1MalHCuVHQf09I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrHLuQz4un56EZKVTWhllwvx6+skp2FA4dzueV4mfl4RWBUHRC
	yOgnK8bHkxLiRDD6XsNIGX6lEjDM/RzSq6SnJNna7UReoubhY4XW8GlNXdIf6IlSGwTV/RZG/l9
	gIw==
X-Google-Smtp-Source: AGHT+IHWYnK2BwFW7Mr5VmhaaxwX1jXjykj9i9MFxC3vV2mlnL+NePMyv0dJBUjVtFSac3MvKiuBJyLqfxA=
X-Received: from pfbfj37.prod.google.com ([2002:a05:6a00:3a25:b0:730:8b4c:546c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:21c7:b0:736:5c8e:baaa
 with SMTP id d2e1a72fcca58-73bd119427emr706022b3a.2.1744327460939; Thu, 10
 Apr 2025 16:24:20 -0700 (PDT)
Date: Thu, 10 Apr 2025 16:24:19 -0700
In-Reply-To: <20250331082251.3171276-11-xin@zytor.com>
Mime-Version: 1.0
References: <20250331082251.3171276-1-xin@zytor.com> <20250331082251.3171276-11-xin@zytor.com>
Message-ID: <Z_hTI8ywa3rTxFaz@google.com>
Subject: Re: [RFC PATCH v1 10/15] KVM: VMX: Use WRMSRNS or its immediate form
 when available
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-edac@vger.kernel.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-ide@vger.kernel.org, 
	linux-pm@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, jgross@suse.com, 
	andrew.cooper3@citrix.com, peterz@infradead.org, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, wei.liu@kernel.org, ajay.kaher@broadcom.com, 
	alexey.amakhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com, 
	luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com, 
	haiyangz@microsoft.com, decui@microsoft.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Mar 31, 2025, Xin Li (Intel) wrote:
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> ---
>  arch/x86/include/asm/msr-index.h |  6 ++++++
>  arch/x86/kvm/vmx/vmenter.S       | 28 ++++++++++++++++++++++++----
>  2 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index e6134ef2263d..04244c3ba374 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -1226,4 +1226,10 @@
>  						* a #GP
>  						*/
>  
> +/* Instruction opcode for WRMSRNS supported in binutils >= 2.40 */
> +#define ASM_WRMSRNS		_ASM_BYTES(0x0f,0x01,0xc6)
> +
> +/* Instruction opcode for the immediate form RDMSR/WRMSRNS */
> +#define ASM_WRMSRNS_RAX		_ASM_BYTES(0xc4,0xe7,0x7a,0xf6,0xc0)
> +
>  #endif /* _ASM_X86_MSR_INDEX_H */
> diff --git a/arch/x86/kvm/vmx/vmenter.S b/arch/x86/kvm/vmx/vmenter.S
> index f6986dee6f8c..9fae43723c44 100644
> --- a/arch/x86/kvm/vmx/vmenter.S
> +++ b/arch/x86/kvm/vmx/vmenter.S
> @@ -64,6 +64,29 @@
>  	RET
>  .endm
>  
> +/*
> + * Write EAX to MSR_IA32_SPEC_CTRL.
> + *
> + * Choose the best WRMSR instruction based on availability.
> + *
> + * Replace with 'wrmsrns' and 'wrmsrns %rax, $MSR_IA32_SPEC_CTRL' once binutils support them.
> + */
> +.macro WRITE_EAX_TO_MSR_IA32_SPEC_CTRL
> +	ALTERNATIVE_2 __stringify(mov $MSR_IA32_SPEC_CTRL, %ecx;		\
> +				  xor %edx, %edx;				\
> +				  mov %edi, %eax;				\
> +				  ds wrmsr),					\
> +		      __stringify(mov $MSR_IA32_SPEC_CTRL, %ecx;		\
> +				  xor %edx, %edx;				\
> +				  mov %edi, %eax;				\
> +				  ASM_WRMSRNS),					\
> +		      X86_FEATURE_WRMSRNS,					\
> +		      __stringify(xor %_ASM_AX, %_ASM_AX;			\
> +				  mov %edi, %eax;				\
> +				  ASM_WRMSRNS_RAX; .long MSR_IA32_SPEC_CTRL),	\
> +		      X86_FEATURE_MSR_IMM
> +.endm

This is quite hideous.  I have no objection to optimizing __vmx_vcpu_run(), but
I would much prefer that a macro like this live in generic code, and that it be
generic.  It should be easy enough to provide an assembly friendly equivalent to
__native_wrmsr_constant().


> +
>  .section .noinstr.text, "ax"
>  
>  /**
> @@ -123,10 +146,7 @@ SYM_FUNC_START(__vmx_vcpu_run)
>  	movl PER_CPU_VAR(x86_spec_ctrl_current), %esi
>  	cmp %edi, %esi
>  	je .Lspec_ctrl_done
> -	mov $MSR_IA32_SPEC_CTRL, %ecx
> -	xor %edx, %edx
> -	mov %edi, %eax
> -	wrmsr
> +	WRITE_EAX_TO_MSR_IA32_SPEC_CTRL
>  
>  .Lspec_ctrl_done:
>  
> -- 
> 2.49.0
> 

