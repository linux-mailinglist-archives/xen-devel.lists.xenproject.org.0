Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172269F79CC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 11:47:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861062.1273056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOE2m-00013z-Uu; Thu, 19 Dec 2024 10:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861062.1273056; Thu, 19 Dec 2024 10:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOE2m-00011P-Ri; Thu, 19 Dec 2024 10:46:12 +0000
Received: by outflank-mailman (input) for mailman id 861062;
 Thu, 19 Dec 2024 10:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cp+K=TM=bounce.vates.tech=bounce-md_30504962.6763f969.v1-e156fa47f682462a99a7ede69434c242@srs-se1.protection.inumbo.net>)
 id 1tOE2l-00011F-Mu
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 10:46:11 +0000
Received: from mail179-16.suw41.mandrillapp.com
 (mail179-16.suw41.mandrillapp.com [198.2.179.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 708206bb-bdf6-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 11:46:02 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-16.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4YDRzY10nhzB5prnf
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 10:46:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e156fa47f682462a99a7ede69434c242; Thu, 19 Dec 2024 10:46:01 +0000
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
X-Inumbo-ID: 708206bb-bdf6-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1734605161; x=1734865661;
	bh=02prROR4Wfm0ZSL770XYX4j/qzAOV4DcYYIBPMP7+T8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=SwZbz1ejMMCvTNVDABLDt2RK56733EY5J/oTGZ+TbJzmaClZ29nAOm5Q65Q/u3dPX
	 yg64Vob3DoHgoFbGxinis1yvPczE3lintkFS/Tg+YrWxK8gAZE39Kx6F1zrr1LF7Rl
	 PZ+xoU0H/i/8wiOjazfjhHAbEtxGd6RPOZXa/tZR89mL/49fd1DSSuUKlrRTIksvdw
	 8UtnKcN4zw7LOsdWD9N8wa+ZY1LupYc5SVPDyjfQoHn+sF+pA5qfoX9ehAUKf1ah7D
	 Th1GGp7ZDeSAauS9toeIM5qFhfU13m4JHu4m9HlJgWLkLX6flcmGqDHHHJ5klzNu0g
	 VFuK7X3renLqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1734605161; x=1734865661; i=teddy.astie@vates.tech;
	bh=02prROR4Wfm0ZSL770XYX4j/qzAOV4DcYYIBPMP7+T8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zQYO2XFe9J71bkKdXq5UmnTL7FeGUhq77qZEqFZa0QdjRVEak1ndDOhcqLlc3rqgD
	 7AC+hHCFB63U6EWAUaKFLxJMnehf5JpryWYbUnkQSG++w/704ret2VlHFSuiKyVyqe
	 U/3lJtxNtufdDNl/EV46VhE4CDfCXOvCzl2XSShWCjV6X7zUKExFSGsuPFaxDdimG0
	 VAtdO6MOE8l3iUr+9UHBCj+AJFM0DhHBVUQRRRl2bP4C5YDAbxW0I2Ar4gi+29VHkO
	 Fvg1v5DhafmlbgsvLT1tx00+3RCClHoTIuQfU5c2/DsFxW041nQauZAhb5zIX23of7
	 TnpWPGDZUt8RA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3]=20x86/hvm:=20Use=20constants=20for=20x86=20modes?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1734605160027
Message-Id: <2d6ce1c9-dac4-4b00-9157-07ab6987232f@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <JBeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <bf7146a8ccbf05ddc74d4f451a5fa586309b9a50.1733132729.git.teddy.astie@vates.tech> <20241218170820.364253-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241218170820.364253-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e156fa47f682462a99a7ede69434c242?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241219:md
Date: Thu, 19 Dec 2024 10:46:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 18/12/2024 =C3=A0 18:08, Andrew Cooper a =C3=A9crit=C2=A0:
> From: Teddy Astie <teddy.astie@vates.tech>
> 
> In many places of x86 HVM code, constants integer are used to indicate in=
 what mode is
> running the CPU (real, vm86, 16-bits, 32-bits, 64-bits). However, these c=
onstants are
> are written directly as integer which hides the actual meaning of these m=
odes.
> 
> This patch introduces X86_MODE_* macros and replace those occurences with=
 it.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Teddy Astie <teddy.astie@vates.tech>

Thanks

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> 
> v3:
>   * Leave a comment behind explaining why these aren't all modes
>   * Fix long lines
>   * Convert more instances (svm_guest_x86_mode, hvm_latch_shinfo_size, xe=
noprof)
> ---
>   xen/arch/x86/hvm/emulate.c           | 18 ++++++++++--------
>   xen/arch/x86/hvm/hvm.c               |  4 +++-
>   xen/arch/x86/hvm/hypercall.c         | 17 +++++++++--------
>   xen/arch/x86/hvm/svm/svm.c           |  8 ++++----
>   xen/arch/x86/hvm/viridian/viridian.c |  8 ++++----
>   xen/arch/x86/hvm/vmx/vmx.c           |  9 +++++----
>   xen/arch/x86/hvm/vmx/vvmx.c          |  5 +++--
>   xen/arch/x86/include/asm/hvm/hvm.h   | 14 ++++++++++++++
>   xen/arch/x86/oprofile/xenoprof.c     |  6 +++---
>   9 files changed, 55 insertions(+), 34 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
> index d3006f094a69..76467b76c047 100644
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -2433,14 +2433,15 @@ static void cf_check hvmemul_put_fpu(
>   
>           switch ( mode )
>           {
> -        case 8:
> +        case X86_MODE_64BIT:
>               fpu_ctxt->fip.addr =3D aux->ip;
>               if ( dval )
>                   fpu_ctxt->fdp.addr =3D aux->dp;
>               fpu_ctxt->x[FPU_WORD_SIZE_OFFSET] =3D 8;
>               break;
>   
> -        case 4: case 2:
> +        case X86_MODE_32BIT:
> +        case X86_MODE_16BIT:
>               fpu_ctxt->fip.offs =3D aux->ip;
>               fpu_ctxt->fip.sel  =3D aux->cs;
>               if ( dval )
> @@ -2451,7 +2452,8 @@ static void cf_check hvmemul_put_fpu(
>               fpu_ctxt->x[FPU_WORD_SIZE_OFFSET] =3D mode;
>               break;
>   
> -        case 0: case 1:
> +        case X86_MODE_REAL:
> +        case X86_MODE_VM86:
>               fpu_ctxt->fip.addr =3D aux->ip | (aux->cs << 4);
>               if ( dval )
>                   fpu_ctxt->fdp.addr =3D aux->dp | (aux->ds << 4);
> @@ -2952,11 +2954,11 @@ static const char *guest_x86_mode_to_str(int mode=
)
>   {
>       switch ( mode )
>       {
> -    case 0:  return "Real";
> -    case 1:  return "v86";
> -    case 2:  return "16bit";
> -    case 4:  return "32bit";
> -    case 8:  return "64bit";
> +    case X86_MODE_REAL:   return "Real";
> +    case X86_MODE_VM86:   return "v86";
> +    case X86_MODE_16BIT:  return "16bit";
> +    case X86_MODE_32BIT:  return "32bit";
> +    case X86_MODE_64BIT:  return "64bit";
>       default: return "Unknown";
>       }
>   }
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 74e58c653e6f..922c9b3af64d 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3974,7 +3974,9 @@ static void hvm_latch_shinfo_size(struct domain *d)
>        */
>       if ( current->domain =3D=3D d )
>       {
> -        d->arch.has_32bit_shinfo =3D (hvm_guest_x86_mode(current) !=3D 8=
);
> +        d->arch.has_32bit_shinfo =3D
> +            hvm_guest_x86_mode(current) !=3D X86_MODE_64BIT;
> +
>           /*
>            * Make sure that the timebase in the shared info structure is =
correct.
>            *
> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> index 81883c8d4f60..6f8dfdff4ac6 100644
> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -112,23 +112,24 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>   
>       switch ( mode )
>       {
> -    case 8:
> +    case X86_MODE_64BIT:
>           eax =3D regs->rax;
>           fallthrough;
> -    case 4:
> -    case 2:
> +    case X86_MODE_32BIT:
> +    case X86_MODE_16BIT:
>           if ( currd->arch.monitor.guest_request_userspace_enabled &&
> -            eax =3D=3D __HYPERVISOR_hvm_op &&
> -            (mode =3D=3D 8 ? regs->rdi : regs->ebx) =3D=3D HVMOP_guest_r=
equest_vm_event )
> +             eax =3D=3D __HYPERVISOR_hvm_op &&
> +             (mode =3D=3D X86_MODE_64BIT ? regs->rdi : regs->ebx) =3D=3D
> +             HVMOP_guest_request_vm_event )
>               break;
>   
>           if ( likely(!hvm_get_cpl(curr)) )
>               break;
>           fallthrough;
> -    default:
> +    case X86_MODE_VM86:
>           regs->rax =3D -EPERM;
>           return HVM_HCALL_completed;
> -    case 0:
> +    case X86_MODE_REAL:
>           break;
>       }
>   
> @@ -198,7 +199,7 @@ enum mc_disposition hvm_do_multicall_call(struct mc_s=
tate *state)
>   {
>       struct vcpu *curr =3D current;
>   
> -    if ( hvm_guest_x86_mode(curr) =3D=3D 8 )
> +    if ( hvm_guest_x86_mode(curr) =3D=3D X86_MODE_64BIT )
>       {
>           struct multicall_entry *call =3D &state->call;
>   
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index b8f87aa1ed08..62905c2c7acd 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -571,12 +571,12 @@ static int cf_check svm_guest_x86_mode(struct vcpu =
*v)
>       struct vmcb_struct *vmcb =3D v->arch.hvm.svm.vmcb;
>   
>       if ( unlikely(!(v->arch.hvm.guest_cr[0] & X86_CR0_PE)) )
> -        return 0;
> +        return X86_MODE_REAL;
>       if ( unlikely(guest_cpu_user_regs()->eflags & X86_EFLAGS_VM) )
> -        return 1;
> +        return X86_MODE_VM86;
>       if ( hvm_long_mode_active(v) && likely(vmcb->cs.l) )
> -        return 8;
> -    return likely(vmcb->cs.db) ? 4 : 2;
> +        return X86_MODE_64BIT;
> +    return vmcb->cs.db ? X86_MODE_32BIT : X86_MODE_16BIT;
>   }
>   
>   static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viri=
dian/viridian.c
> index 21480d9ee700..33d54e587edf 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -933,13 +933,13 @@ int viridian_hypercall(struct cpu_user_regs *regs)
>   
>       switch ( mode )
>       {
> -    case 8:
> +    case X86_MODE_64BIT:
>           input.raw =3D regs->rcx;
>           input_params_gpa =3D regs->rdx;
>           output_params_gpa =3D regs->r8;
>           break;
>   
> -    case 4:
> +    case X86_MODE_32BIT:
>           input.raw =3D (regs->rdx << 32) | regs->eax;
>           input_params_gpa =3D (regs->rbx << 32) | regs->ecx;
>           output_params_gpa =3D (regs->rdi << 32) | regs->esi;
> @@ -1038,11 +1038,11 @@ int viridian_hypercall(struct cpu_user_regs *regs=
)
>   
>       switch ( mode )
>       {
> -    case 8:
> +    case X86_MODE_64BIT:
>           regs->rax =3D output.raw;
>           break;
>   
> -    case 4:
> +    case X86_MODE_32BIT:
>           regs->rdx =3D output.raw >> 32;
>           regs->rax =3D (uint32_t)output.raw;
>           break;
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index b6885d0e2764..eee1d4b47a13 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -886,14 +886,15 @@ int cf_check vmx_guest_x86_mode(struct vcpu *v)
>       unsigned long cs_ar_bytes;
>   
>       if ( unlikely(!(v->arch.hvm.guest_cr[0] & X86_CR0_PE)) )
> -        return 0;
> +        return X86_MODE_REAL;
>       if ( unlikely(guest_cpu_user_regs()->eflags & X86_EFLAGS_VM) )
> -        return 1;
> +        return X86_MODE_VM86;
>       __vmread(GUEST_CS_AR_BYTES, &cs_ar_bytes);
>       if ( hvm_long_mode_active(v) &&
>            likely(cs_ar_bytes & X86_SEG_AR_CS_LM_ACTIVE) )
> -        return 8;
> -    return (likely(cs_ar_bytes & X86_SEG_AR_DEF_OP_SIZE) ? 4 : 2);
> +        return X86_MODE_64BIT;
> +    return (likely(cs_ar_bytes & X86_SEG_AR_DEF_OP_SIZE)
> +            ? X86_MODE_32BIT : X86_MODE_16BIT);
>   }
>   
>   static void vmx_save_dr(struct vcpu *v)
> diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> index 78135ca23be8..cf47d61b1473 100644
> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -411,7 +411,7 @@ static int decode_vmx_inst(struct cpu_user_regs *regs=
,
>       }
>       else
>       {
> -        bool mode_64bit =3D (vmx_guest_x86_mode(v) =3D=3D 8);
> +        bool mode_64bit =3D vmx_guest_x86_mode(v) =3D=3D X86_MODE_64BIT;
>   
>           decode->type =3D VMX_INST_MEMREG_TYPE_MEMORY;
>   
> @@ -2073,7 +2073,8 @@ int nvmx_handle_vmx_insn(struct cpu_user_regs *regs=
, unsigned int exit_reason)
>   
>       if ( !(curr->arch.hvm.guest_cr[4] & X86_CR4_VMXE) ||
>            !nestedhvm_enabled(curr->domain) ||
> -         (vmx_guest_x86_mode(curr) < (hvm_long_mode_active(curr) ? 8 : 2=
)) ||
> +         (vmx_guest_x86_mode(curr) <
> +          (hvm_long_mode_active(curr) ? X86_MODE_64BIT : X86_MODE_16BIT)=
) ||
>            (exit_reason !=3D EXIT_REASON_VMXON && !nvmx_vcpu_in_vmx(curr)=
) )
>       {
>           hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/as=
m/hvm/hvm.h
> index 02de18c7d4a8..124906a548da 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -26,6 +26,20 @@ extern bool opt_hvm_fep;
>   #define opt_hvm_fep 0
>   #endif
>   
> +/*
> + * Results for hvm_guest_x86_mode().
> + *
> + * Note, some callers depend on the order of these constants.
> + *
> + * TODO: Rework this helper to avoid implying mixing the architectural
> + * concepts of mode and operand size.
> + */
> +#define X86_MODE_REAL  0
> +#define X86_MODE_VM86  1
> +#define X86_MODE_16BIT 2
> +#define X86_MODE_32BIT 4
> +#define X86_MODE_64BIT 8
> +
>   /* Interrupt acknowledgement sources. */
>   enum hvm_intsrc {
>       hvm_intsrc_none,
> diff --git a/xen/arch/x86/oprofile/xenoprof.c b/xen/arch/x86/oprofile/xen=
oprof.c
> index 247a0deca822..7f2525bfb4d6 100644
> --- a/xen/arch/x86/oprofile/xenoprof.c
> +++ b/xen/arch/x86/oprofile/xenoprof.c
> @@ -86,11 +86,11 @@ int xenoprofile_get_mode(struct vcpu *curr, const str=
uct cpu_user_regs *regs)
>   
>       switch ( hvm_guest_x86_mode(curr) )
>       {
> -    case 0: /* real mode */
> +    case X86_MODE_REAL:
>           return 1;
> -    case 1: /* vm86 mode */
> +    case X86_MODE_VM86:
>           return 0;
> -    default:
> +    default: /* 16BIT | 32BIT | 64BIT */
>           return hvm_get_cpl(curr) !=3D 3;
>       }
>   }
> 
> base-commit: 826a9eb072d449cb777d71f52923e6f5f20cefbe

Teddy


 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


