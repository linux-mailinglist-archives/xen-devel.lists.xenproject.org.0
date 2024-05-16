Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110938C6FA5
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 02:51:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722739.1127014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7PKg-0003JA-Gp; Thu, 16 May 2024 00:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722739.1127014; Thu, 16 May 2024 00:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7PKg-0003Hd-Dr; Thu, 16 May 2024 00:50:54 +0000
Received: by outflank-mailman (input) for mailman id 722739;
 Thu, 16 May 2024 00:50:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7PKf-0003HX-67
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 00:50:53 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 561dac4a-131e-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 02:50:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 47117CE1777;
 Thu, 16 May 2024 00:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382ABC116B1;
 Thu, 16 May 2024 00:50:42 +0000 (UTC)
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
X-Inumbo-ID: 561dac4a-131e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715820643;
	bh=H5GDzVsLacn2FXdHs5959QxH720DDh9p9jEmKXmQ7mo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gLPRlz2oGP60zqtSTKdKpBjEmntrLnGHu7YXcGk86uvrqsAisdmsm5J3zERVd/nOt
	 hoRz0OxqHyeqrtHLG+LSLv/E9yzlMQ/P9HlhBDErrdE2cisrcq6K/3kTULjvZRIIGj
	 rSurlujMuYRiPZc17aKG8R7ZYQrabSXh6s6HsiGqdXsYFo3D74vAfHC4uCo2nPiWSc
	 TofYlp5ISa/RcdqRDwnHo2TnJ7SmQrCxUkh0nbUT+towIGwfJ+2hUVnZDjJMNKgGhX
	 BCFA48DCq4vpydawGCxSCjhbXziYuCY5yavl+LTbZ+wOm5yBd+BOZ80xQy7hGnz8hH
	 COg4dX6emQf0Q==
Date: Wed, 15 May 2024 17:50:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 12/15] x86/vmx: guard access to cpu_has_vmx_* in
 common code
In-Reply-To: <c1f40e8e9a35f7e9ba55adc44a9fe93d48749c92.1715761386.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2405151748080.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <c1f40e8e9a35f7e9ba55adc44a9fe93d48749c92.1715761386.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Sergiy Kibrik wrote:
> There're several places in common code, outside of arch/x86/hvm/vmx,
> where cpu_has_vmx_* get accessed without checking if VMX present first.
> We may want to guard these macros, as they read global variables defined
> inside vmx-specific files -- so VMX can be made optional later on.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
> Here I've tried a different approach from prev.patches [1,2] -- instead of
> modifying whole set of cpu_has_{svm/vmx}_* macros, we can:
>  1) do not touch SVM part at all, because just as Andrew pointed out they're
> used inside arch/x86/hvm/svm only.
>  2) track several places in common code where cpu_has_vmx_* features are
> checked out and guard them using cpu_has_vmx condition
>  3) two of cpu_has_vmx_* macros being used in common code are checked in a bit
> more tricky way, so instead of making complex conditionals even more complicated,
> we can instead integrate cpu_has_vmx condition inside these two macros.
> 
> This patch aims to replace [1,2] from v1 series by doing steps above.
> 
>  1. https://lore.kernel.org/xen-devel/20240416064402.3469959-1-Sergiy_Kibrik@epam.com/
>  2. https://lore.kernel.org/xen-devel/20240416064606.3470052-1-Sergiy_Kibrik@epam.com/

I am missing some of the previous discussions but why can't we just fix
all of the cpu_has_vmx_* #defines in vmcs.h to also check for
cpu_has_vmx?

That seems easier and simpler than to add add-hoc checks at the invocations?


> ---
> changes in v2:
>  - do not touch SVM code and macros
>  - drop vmx_ctrl_has_feature()
>  - guard cpu_has_vmx_* macros in common code instead
> changes in v1:
>  - introduced helper routine vmx_ctrl_has_feature() and used it for all
>    cpu_has_vmx_* macros
> ---
>  xen/arch/x86/hvm/hvm.c                  | 2 +-
>  xen/arch/x86/hvm/viridian/viridian.c    | 4 ++--
>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h | 4 ++--
>  xen/arch/x86/traps.c                    | 5 +++--
>  4 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 9594e0a5c5..ab75de9779 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -5180,7 +5180,7 @@ int hvm_debug_op(struct vcpu *v, int32_t op)
>      {
>          case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_ON:
>          case XEN_DOMCTL_DEBUG_OP_SINGLE_STEP_OFF:
> -            if ( !cpu_has_monitor_trap_flag )
> +            if ( !cpu_has_vmx || !cpu_has_monitor_trap_flag )
>                  return -EOPNOTSUPP;
>              break;
>          default:
> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
> index 0496c52ed5..657c6a3ea7 100644
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -196,7 +196,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>          res->a = CPUID4A_RELAX_TIMER_INT;
>          if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
>              res->a |= CPUID4A_HCALL_REMOTE_TLB_FLUSH;
> -        if ( !cpu_has_vmx_apic_reg_virt )
> +        if ( !cpu_has_vmx || !cpu_has_vmx_apic_reg_virt )
>              res->a |= CPUID4A_MSR_BASED_APIC;
>          if ( viridian_feature_mask(d) & HVMPV_hcall_ipi )
>              res->a |= CPUID4A_SYNTHETIC_CLUSTER_IPI;
> @@ -236,7 +236,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>  
>      case 6:
>          /* Detected and in use hardware features. */
> -        if ( cpu_has_vmx_virtualize_apic_accesses )
> +        if ( cpu_has_vmx && cpu_has_vmx_virtualize_apic_accesses )
>              res->a |= CPUID6A_APIC_OVERLAY;
>          if ( cpu_has_vmx_msr_bitmap || (read_efer() & EFER_SVME) )
>              res->a |= CPUID6A_MSR_BITMAPS;
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> index 58140af691..aa05f9cf6e 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -306,7 +306,7 @@ extern u64 vmx_ept_vpid_cap;
>  #define cpu_has_vmx_vnmi \
>      (vmx_pin_based_exec_control & PIN_BASED_VIRTUAL_NMIS)
>  #define cpu_has_vmx_msr_bitmap \
> -    (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
> +    (cpu_has_vmx && vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_MSR_BITMAP)
>  #define cpu_has_vmx_secondary_exec_control \
>      (vmx_cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CONTROLS)
>  #define cpu_has_vmx_tertiary_exec_control \
> @@ -347,7 +347,7 @@ extern u64 vmx_ept_vpid_cap;
>  #define cpu_has_vmx_vmfunc \
>      (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VM_FUNCTIONS)
>  #define cpu_has_vmx_virt_exceptions \
> -    (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS)
> +    (cpu_has_vmx && vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_VIRT_EXCEPTIONS)
>  #define cpu_has_vmx_pml \
>      (vmx_secondary_exec_control & SECONDARY_EXEC_ENABLE_PML)
>  #define cpu_has_vmx_mpx \
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 7b8ee45edf..3595bb379a 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1130,7 +1130,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>          if ( !is_hvm_domain(d) || subleaf != 0 )
>              break;
>  
> -        if ( cpu_has_vmx_apic_reg_virt )
> +        if ( cpu_has_vmx && cpu_has_vmx_apic_reg_virt )
>              res->a |= XEN_HVM_CPUID_APIC_ACCESS_VIRT;
>  
>          /*
> @@ -1139,7 +1139,8 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
>           * and wrmsr in the guest will run without VMEXITs (see
>           * vmx_vlapic_msr_changed()).
>           */
> -        if ( cpu_has_vmx_virtualize_x2apic_mode &&
> +        if ( cpu_has_vmx &&
> +             cpu_has_vmx_virtualize_x2apic_mode &&
>               cpu_has_vmx_apic_reg_virt &&
>               cpu_has_vmx_virtual_intr_delivery )
>              res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
> -- 
> 2.25.1
> 

