Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C4F9B7D51
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 15:52:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828789.1243810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6WWq-00061v-Cd; Thu, 31 Oct 2024 14:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828789.1243810; Thu, 31 Oct 2024 14:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6WWq-0005zu-A3; Thu, 31 Oct 2024 14:52:04 +0000
Received: by outflank-mailman (input) for mailman id 828789;
 Thu, 31 Oct 2024 14:52:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=35SK=R3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t6WWp-0005zo-4H
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 14:52:03 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id addd28df-9797-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 15:51:58 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c9388a00cfso1223828a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 07:51:58 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac7c932bsm640691a12.78.2024.10.31.07.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 07:51:56 -0700 (PDT)
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
X-Inumbo-ID: addd28df-9797-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmUiLCJoZWxvIjoibWFpbC1lZDEteDUyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFkZGQyOGRmLTk3OTctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzg2MzE4LjY4Mjk0Miwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730386318; x=1730991118; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOUjSVS/HCeU559kbjgkKk5OgsooeD04DRj1g81Nl/c=;
        b=WxzK6MZfr6i0Fl7uSB2G5QXzJb6bLtq3M+RuA5CJ4bsaEz3SlqasFrI4/UqkVMdUUl
         OUu32PQRB3jk1N+vR6gjSu9weFrGYzCGBzKQFLOfWOG9mTHIGnsDH9oTKEjL9Dyp7WJz
         IXTcOp++MbrM2YYl4GUklGLc8k5q+MjK0/Ukw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386318; x=1730991118;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pOUjSVS/HCeU559kbjgkKk5OgsooeD04DRj1g81Nl/c=;
        b=YOcAb7yjbfTOEqm6UOkR7krgN1ooi4UTDIuivNPtP6UiDyqN+nLrGQHZxZB69gZsKe
         L6zhmegcoAlvrh2vNWxZHKUqn9QHLCpEGNChGkuH13xDBdFt3AsyU0LYL+bKy9ET45zR
         jeSO0Ie0cVGBNlb4Y64M1818pWsXlMgXPDJfYWf9Vxq6ZedYzbZM2m0DmtYrPleq8frs
         UjJi1vVGzLgUZRPVNk+iJrZMGVuVXJ7kdZL8hQChoScTv4PD6mSiLVVZR2qYtcEglmJO
         WZwLh1Gjf55xg4XtDxR2na8tWhqBZnkFbvbp34uWzCQc54Y8hEea7oIV5saNs8ajLhh1
         8HhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoX/OxEU0ZmUIaiIN1h1H3HxY1mzIfo53aAH1nwhoma9K2irwADyIqeUShBAI9rGQJDXIwcPIzp6c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywc6G9fzOynXh06NXIDOtaWdDVBuBqP4y7TYWOzwgdavfykZUSa
	ehRJoPDPbTzMG5t/78hTUu/NW4q2y9XGc7IIyckkVSuHuMHrYdFgl1MPBT+IvEM=
X-Google-Smtp-Source: AGHT+IH3KWdZcikgQ/hfCdfsc0D2b58c38dSDKr3MqWV3ltAuUw3rZnZsVlDY4hbyvP1iq94RjXy0Q==
X-Received: by 2002:a05:6402:2114:b0:5c9:37b5:1090 with SMTP id 4fb4d7f45d1cf-5cbbf8a2716mr14103409a12.9.1730386317420;
        Thu, 31 Oct 2024 07:51:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Oct 2024 14:51:53 +0000
Message-Id: <D5A2R6GG6WP3.15A2Z1QLB1KFJ@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Teddy Astie" <teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Paul Durrant" <paul@xen.org>
Subject: Re: [XEN PATCH] x86/hvm: Use constants for x86 modes
X-Mailer: aerc 0.18.2
References: <0ffcb0031eaa095b5864735d2f9edbe1d374e009.1730380434.git.teddy.astie@vates.tech>
In-Reply-To: <0ffcb0031eaa095b5864735d2f9edbe1d374e009.1730380434.git.teddy.astie@vates.tech>

On Thu Oct 31, 2024 at 1:27 PM GMT, Teddy Astie wrote:
> In many places of x86 HVM code, constants integer are used to indicate in=
 what mode is
> running the CPU (real, v86, 16-bits, 32-bits, 64-bits). However, these co=
nstants are
> are written directly as integer which hides the actual meaning of these m=
odes.

Ew. Good riddance. Just a couple of nits...

>
> This patch introduces X86_MODE_* macros and replace those occurences with=
 it.
>
> Signed-off-by Teddy Astie <teddy.astie@vates.tech>
> ---
> I am not sure of other places that uses these integer constants.
> ---
>  xen/arch/x86/hvm/emulate.c           | 16 ++++++++--------
>  xen/arch/x86/hvm/hypercall.c         | 13 +++++++------
>  xen/arch/x86/hvm/viridian/viridian.c |  9 +++++----
>  xen/arch/x86/hvm/vmx/vmx.c           |  9 +++++----
>  xen/arch/x86/hvm/vmx/vvmx.c          |  5 +++--
>  xen/arch/x86/include/asm/hvm/hvm.h   |  6 ++++++
>  6 files changed, 34 insertions(+), 24 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
> index ecf83795fa..60a7c15bdc 100644
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2433,14 +2433,14 @@ static void cf_check hvmemul_put_fpu(
>
>          switch ( mode )
>          {
> -        case 8:
> +        case X86_MODE_64BIT:
>              fpu_ctxt->fip.addr =3D aux->ip;
>              if ( dval )
>                  fpu_ctxt->fdp.addr =3D aux->dp;
>              fpu_ctxt->x[FPU_WORD_SIZE_OFFSET] =3D 8;
>              break;
>
> -        case 4: case 2:
> +        case X86_MODE_32BIT: case X86_MODE_16BIT:
                               ^
                               |
nit: Good time to add newline here...

>              fpu_ctxt->fip.offs =3D aux->ip;
>              fpu_ctxt->fip.sel  =3D aux->cs;
>              if ( dval )
> @@ -2451,7 +2451,7 @@ static void cf_check hvmemul_put_fpu(
>              fpu_ctxt->x[FPU_WORD_SIZE_OFFSET] =3D mode;
>              break;
>
> -        case 0: case 1:
> +        case X86_MODE_REAL: case X86_MODE_V86:
                              ^
                              |
          +-------------------+
          |
... and here.

>              fpu_ctxt->fip.addr =3D aux->ip | (aux->cs << 4);
>              if ( dval )
>                  fpu_ctxt->fdp.addr =3D aux->dp | (aux->ds << 4);
> @@ -2952,11 +2952,11 @@ static const char *guest_x86_mode_to_str(int mode=
)
>  {
>      switch ( mode )
>      {
> -    case 0:  return "Real";
> -    case 1:  return "v86";
> -    case 2:  return "16bit";
> -    case 4:  return "32bit";
> -    case 8:  return "64bit";
> +    case X86_MODE_REAL:  return "Real";
> +    case X86_MODE_V86:  return "v86";
> +    case X86_MODE_16BIT:  return "16bit";
> +    case X86_MODE_32BIT:  return "32bit";
> +    case X86_MODE_64BIT:  return "64bit";
>      default: return "Unknown";
>      }
>  }
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index 81883c8d4f..e0e9bcd22d 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -11,6 +11,7 @@
>  #include <xen/ioreq.h>
>  #include <xen/nospec.h>
>
> +#include <asm/hvm/hvm.h>
>  #include <asm/hvm/emulate.h>
>  #include <asm/hvm/support.h>
>  #include <asm/hvm/viridian.h>
> @@ -112,23 +113,23 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>
>      switch ( mode )
>      {
> -    case 8:
> +    case X86_MODE_64BIT:
>          eax =3D regs->rax;
>          fallthrough;
> -    case 4:
> -    case 2:
> +    case X86_MODE_32BIT:
> +    case X86_MODE_16BIT:
>          if ( currd->arch.monitor.guest_request_userspace_enabled &&
>              eax =3D=3D __HYPERVISOR_hvm_op &&
> -            (mode =3D=3D 8 ? regs->rdi : regs->ebx) =3D=3D HVMOP_guest_r=
equest_vm_event )
> +            (mode =3D=3D X86_MODE_64BIT ? regs->rdi : regs->ebx) =3D=3D =
HVMOP_guest_request_vm_event )
>              break;
>
>          if ( likely(!hvm_get_cpl(curr)) )
>              break;
>          fallthrough;
> -    default:
> +    case X86_MODE_V86:
>          regs->rax =3D -EPERM;
>          return HVM_HCALL_completed;
> -    case 0:
> +    case X86_MODE_REAL:
>          break;
>      }
>
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viri=
dian/viridian.c
> index 21480d9ee7..0e3b824bf0 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -16,6 +16,7 @@
>  #include <asm/paging.h>
>  #include <asm/p2m.h>
>  #include <asm/apic.h>
> +#include <asm/hvm/hvm.h>
>  #include <public/sched.h>
>  #include <public/hvm/hvm_op.h>
>
> @@ -933,13 +934,13 @@ int viridian_hypercall(struct cpu_user_regs *regs)
>
>      switch ( mode )
>      {
> -    case 8:
> +    case X86_MODE_64BIT:
>          input.raw =3D regs->rcx;
>          input_params_gpa =3D regs->rdx;
>          output_params_gpa =3D regs->r8;
>          break;
>
> -    case 4:
> +    case X86_MODE_32BIT:
>          input.raw =3D (regs->rdx << 32) | regs->eax;
>          input_params_gpa =3D (regs->rbx << 32) | regs->ecx;
>          output_params_gpa =3D (regs->rdi << 32) | regs->esi;
> @@ -1038,11 +1039,11 @@ int viridian_hypercall(struct cpu_user_regs *regs=
)
>
>      switch ( mode )
>      {
> -    case 8:
> +    case X86_MODE_64BIT:
>          regs->rax =3D output.raw;
>          break;
>
> -    case 4:
> +    case X86_MODE_32BIT:
>          regs->rdx =3D output.raw >> 32;
>          regs->rax =3D (uint32_t)output.raw;
>          break;
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 12f8a66458..b77f135a2d 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -886,14 +886,15 @@ int cf_check vmx_guest_x86_mode(struct vcpu *v)
>      unsigned long cs_ar_bytes;
>
>      if ( unlikely(!(v->arch.hvm.guest_cr[0] & X86_CR0_PE)) )
> -        return 0;
> +        return X86_MODE_REAL;
>      if ( unlikely(guest_cpu_user_regs()->eflags & X86_EFLAGS_VM) )
> -        return 1;
> +        return X86_MODE_V86;
>      __vmread(GUEST_CS_AR_BYTES, &cs_ar_bytes);
>      if ( hvm_long_mode_active(v) &&
>           likely(cs_ar_bytes & X86_SEG_AR_CS_LM_ACTIVE) )
> -        return 8;
> -    return (likely(cs_ar_bytes & X86_SEG_AR_DEF_OP_SIZE) ? 4 : 2);
> +        return X86_MODE_64BIT;
> +    return (likely(cs_ar_bytes & X86_SEG_AR_DEF_OP_SIZE)
> +            ? X86_MODE_32BIT : X86_MODE_16BIT);
>  }
>
>  static void vmx_save_dr(struct vcpu *v)
> diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> index c05e0e9326..5032fc3a45 100644
> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -411,7 +411,7 @@ static int decode_vmx_inst(struct cpu_user_regs *regs=
,
>      }
>      else
>      {
> -        bool mode_64bit =3D (vmx_guest_x86_mode(v) =3D=3D 8);
> +        bool mode_64bit =3D (vmx_guest_x86_mode(v) =3D=3D X86_MODE_64BIT=
);
>
>          decode->type =3D VMX_INST_MEMREG_TYPE_MEMORY;
>
> @@ -2073,7 +2073,8 @@ int nvmx_handle_vmx_insn(struct cpu_user_regs *regs=
, unsigned int exit_reason)
>
>      if ( !(curr->arch.hvm.guest_cr[4] & X86_CR4_VMXE) ||
>           !nestedhvm_enabled(curr->domain) ||
> -         (vmx_guest_x86_mode(curr) < (hvm_long_mode_active(curr) ? 8 : 2=
)) ||
> +         (vmx_guest_x86_mode(curr) < (hvm_long_mode_active(curr) ? X86_M=
ODE_64BIT
> +                                                                 : X86_M=
ODE_16BIT)) ||
>           (exit_reason !=3D EXIT_REASON_VMXON && !nvmx_vcpu_in_vmx(curr))=
 )
>      {
>          hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/as=
m/hvm/hvm.h
> index dd7d4872b5..29ae23617e 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -26,6 +26,12 @@ extern bool opt_hvm_fep;
>  #define opt_hvm_fep 0
>  #endif
>
> +#define X86_MODE_REAL  0
> +#define X86_MODE_V86   1
> +#define X86_MODE_16BIT 2
> +#define X86_MODE_32BIT 4
> +#define X86_MODE_64BIT 8
> +
>  /* Interrupt acknowledgement sources. */
>  enum hvm_intsrc {
>      hvm_intsrc_none,
> --
> 2.45.2
>
>
>
> Teddy Astie | Vates XCP-ng Intern
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech

Cheers,
Alejandro


