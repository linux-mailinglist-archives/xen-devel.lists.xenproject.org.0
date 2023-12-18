Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2174C81789E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 18:24:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656302.1024403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFHLv-0000KQ-DC; Mon, 18 Dec 2023 17:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656302.1024403; Mon, 18 Dec 2023 17:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFHLv-0000Gb-9d; Mon, 18 Dec 2023 17:24:27 +0000
Received: by outflank-mailman (input) for mailman id 656302;
 Mon, 18 Dec 2023 17:24:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5ff=H5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFHLt-0000Dw-BC
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 17:24:25 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48d30b09-9dca-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 18:24:22 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c236624edso38223795e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 09:24:22 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c4fc300b004042dbb8925sm45500510wmq.38.2023.12.18.09.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 09:24:21 -0800 (PST)
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
X-Inumbo-ID: 48d30b09-9dca-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702920262; x=1703525062; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GkUgJtSdASl14duIMyhZhdeWufbjFzlNsgB4T/z/4lY=;
        b=iQarox94eP2gIw1O4Gf020mIyEQpgQIsDMjllLY1J1GPuSYJN7BQrGyXpYWcnP3BvP
         QdMRfC3k38VoV49CgWifaLmJo0NVhhyUPBIi/I8PpRXlsZPUsvxTSH/H8+bT7BnbOJ9S
         y6KwHtoRt0SGUgvnxdyu336OK7QDnxygsyOtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702920262; x=1703525062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkUgJtSdASl14duIMyhZhdeWufbjFzlNsgB4T/z/4lY=;
        b=CD0HAPYqTt7Ts0iO1QtYEGAx18E0egaLgzZKXsLAkmIFu1t641h/FKz25RiptIY0Gm
         yAwF6hjvI7QuhFlB0AmIs/ZGsTThEvUvg8jB2JvhWAxmHq2EjhGPFWiUy3/vvOEtEHIv
         f8N4+GKru5/B8eimUPXrVcTmsrwN08P/32xrwLFAUxapG0eVxOerxNbWCJu7IJ6ZAVek
         iP6ZXdXvpyrloG9Zart9Fq3vm3VqkmEb4Og6YIRGp1ehe4/FPUydwlZuol/xR/Y9HQ4X
         Hg6OMV6POsecuBOsDn+ZaX6ZOldwyAaXl5NtxhCzB5QzmRi+62wp0bVAPHWRf6kJUFyZ
         QfxQ==
X-Gm-Message-State: AOJu0YwPsPZWlRCpWoL4PHnEm+dK/yolL3LyHbe8QsKjwN45bWahsK+J
	0bhlTL5BnMf69E/e6NxfclT83w==
X-Google-Smtp-Source: AGHT+IHrBG0LfdiuccArYGZBvQSqun2Af1Ymz9sM1besHvAoOSioKbFDxzKVStkCbeQ1JvYd91MZGQ==
X-Received: by 2002:a05:600c:4f11:b0:40b:5e21:cc29 with SMTP id l17-20020a05600c4f1100b0040b5e21cc29mr8379455wmq.84.1702920262077;
        Mon, 18 Dec 2023 09:24:22 -0800 (PST)
Date: Mon, 18 Dec 2023 18:24:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 4/4] x86/PV: issue branch prediction barrier when
 switching 64-bit guest to kernel mode
Message-ID: <ZYCARJAxH9hBD0YQ@macbook>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <2863b0a9-ca7c-3cce-104d-0b6685b0b383@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2863b0a9-ca7c-3cce-104d-0b6685b0b383@suse.com>

On Tue, Feb 14, 2023 at 05:12:08PM +0100, Jan Beulich wrote:
> Since both kernel and user mode run in ring 3, they run in the same
> "predictor mode".

That only true when IBRS is enabled, otherwise all CPU modes share the
same predictor mode?

> While the kernel could take care of this itself, doing
> so would be yet another item distinguishing PV from native. Additionally
> we're in a much better position to issue the barrier command, and we can
> save a #GP (for privileged instruction emulation) this way.
> 
> To allow to recover performance, introduce a new VM assist allowing the
> guest kernel to suppress this barrier. Make availability of the assist
> dependent upon the command line control, such that kernels have a way to
> know whether their request actually took any effect.
> 
> Note that because of its use in PV64_VM_ASSIST_MASK, the declaration of
> opt_ibpb_mode_switch can't live in asm/spec_ctrl.h.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Is the placement of the clearing of opt_ibpb_ctxt_switch correct in
> parse_spec_ctrl()? Shouldn't it live ahead of the "disable_common"
> label, as being about guest protection, not Xen's?
> 
> Adding setting of the variable to the "pv" sub-case in parse_spec_ctrl()
> didn't seem quite right to me, considering that we default it to the
> opposite of opt_ibpb_entry_pv.
> ---
> v4: Correct the print_details() change. Re-base in particular over
>     changes earlier in the series.
> v3: Leverage exit-IBPB. Introduce separate command line control.
> v2: Leverage entry-IBPB. Add VM assist. Re-base.
> 
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2320,8 +2320,8 @@ By default SSBD will be mitigated at run
>  ### spec-ctrl (x86)
>  > `= List of [ <bool>, xen=<bool>, {pv,hvm}=<bool>,
>  >              {msr-sc,rsb,md-clear,ibpb-entry}=<bool>|{pv,hvm}=<bool>,
> ->              bti-thunk=retpoline|lfence|jmp, {ibrs,ibpb,ssbd,psfd,
> ->              eager-fpu,l1d-flush,branch-harden,srb-lock,
> +>              bti-thunk=retpoline|lfence|jmp, {ibrs,ibpb,ibpb-mode-switch,
> +>              ssbd,psfd,eager-fpu,l1d-flush,branch-harden,srb-lock,
>  >              unpriv-mmio}=<bool> ]`
>  
>  Controls for speculative execution sidechannel mitigations.  By default, Xen
> @@ -2403,7 +2403,10 @@ default.
>  
>  On hardware supporting IBPB (Indirect Branch Prediction Barrier), the `ibpb=`
>  option can be used to force (the default) or prevent Xen from issuing branch
> -prediction barriers on vcpu context switches.
> +prediction barriers on vcpu context switches.  On such hardware the
> +`ibpb-mode-switch` option can be used to control whether, by default, Xen
> +would issue branch prediction barriers when 64-bit PV guests switch from
> +user to kernel mode.  If enabled, guest kernels can op out of this behavior.
>  
>  On all hardware, the `eager-fpu=` option can be used to force or prevent Xen
>  from using fully eager FPU context switches.  This is currently implemented as
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -742,6 +742,8 @@ static inline void pv_inject_sw_interrup
>      pv_inject_event(&event);
>  }
>  
> +extern int8_t opt_ibpb_mode_switch;
> +
>  #define PV32_VM_ASSIST_MASK ((1UL << VMASST_TYPE_4gb_segments)        | \
>                               (1UL << VMASST_TYPE_4gb_segments_notify) | \
>                               (1UL << VMASST_TYPE_writable_pagetables) | \
> @@ -753,7 +755,9 @@ static inline void pv_inject_sw_interrup
>   * but we can't make such requests fail all of the sudden.
>   */
>  #define PV64_VM_ASSIST_MASK (PV32_VM_ASSIST_MASK                      | \
> -                             (1UL << VMASST_TYPE_m2p_strict))
> +                             (1UL << VMASST_TYPE_m2p_strict)          | \
> +                             ((opt_ibpb_mode_switch + 0UL) <<           \
> +                              VMASST_TYPE_mode_switch_no_ibpb))

I'm wondering that it's kind of weird to offer the option to PV domUs
if opt_ibpb_entry_pv is set, as then the guest mode switch will always
(implicitly) do a IBPB as requiring an hypercall and thus take an
entry point into Xen.

I guess it's worth having it just as a way to signal to Xen that the
hypervisor does perform an IBPB, even if the guest cannot disable it.

>  #define HVM_VM_ASSIST_MASK  (1UL << VMASST_TYPE_runstate_update_flag)
>  
>  #define arch_vm_assist_valid_mask(d) \
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -455,6 +455,7 @@ static void _toggle_guest_pt(struct vcpu
>  void toggle_guest_mode(struct vcpu *v)
>  {
>      const struct domain *d = v->domain;
> +    struct cpu_info *cpu_info = get_cpu_info();
>      unsigned long gs_base;
>  
>      ASSERT(!is_pv_32bit_vcpu(v));
> @@ -467,15 +468,21 @@ void toggle_guest_mode(struct vcpu *v)
>      if ( v->arch.flags & TF_kernel_mode )
>          v->arch.pv.gs_base_kernel = gs_base;
>      else
> +    {
>          v->arch.pv.gs_base_user = gs_base;
> +
> +        if ( opt_ibpb_mode_switch &&
> +             !(d->arch.spec_ctrl_flags & SCF_entry_ibpb) &&
> +             !VM_ASSIST(d, mode_switch_no_ibpb) )
> +            cpu_info->spec_ctrl_flags |= SCF_new_pred_ctxt;

Likewise similar to the remarks I've made before, if doing an IBPB on
entry is enough to cover for the case here, it must also be fine to
issue the IBPB right here, instead of deferring to return to guest
context?

The only concern would be (as you mentioned before) to avoid clearing
valid Xen predictions, but I would rather see some figures about what
effect the delaying to return to guest has vs issuing it right here.

> +    }
> +
>      asm volatile ( "swapgs" );
>  
>      _toggle_guest_pt(v);
>  
>      if ( d->arch.pv.xpti )
>      {
> -        struct cpu_info *cpu_info = get_cpu_info();
> -
>          cpu_info->root_pgt_changed = true;
>          cpu_info->pv_cr3 = __pa(this_cpu(root_pgt)) |
>                             (d->arch.pv.pcid ? get_pcid_bits(v, true) : 0);
> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -60,6 +60,7 @@ bool __ro_after_init opt_ssbd;
>  int8_t __initdata opt_psfd = -1;
>  
>  int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
> +int8_t __ro_after_init opt_ibpb_mode_switch = -1;
>  int8_t __read_mostly opt_eager_fpu = -1;
>  int8_t __read_mostly opt_l1d_flush = -1;
>  static bool __initdata opt_branch_harden = true;
> @@ -111,6 +112,8 @@ static int __init cf_check parse_spec_ct
>              if ( opt_pv_l1tf_domu < 0 )
>                  opt_pv_l1tf_domu = 0;
>  
> +            opt_ibpb_mode_switch = 0;
> +
>              if ( opt_tsx == -1 )
>                  opt_tsx = -3;
>  
> @@ -271,6 +274,8 @@ static int __init cf_check parse_spec_ct
>          /* Misc settings. */
>          else if ( (val = parse_boolean("ibpb", s, ss)) >= 0 )
>              opt_ibpb_ctxt_switch = val;
> +        else if ( (val = parse_boolean("ibpb-mode-switch", s, ss)) >= 0 )
> +            opt_ibpb_mode_switch = val;
>          else if ( (val = parse_boolean("eager-fpu", s, ss)) >= 0 )
>              opt_eager_fpu = val;
>          else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
> @@ -527,16 +532,18 @@ static void __init print_details(enum in
>  
>  #endif
>  #ifdef CONFIG_PV
> -    printk("  Support for PV VMs:%s%s%s%s%s%s\n",
> +    printk("  Support for PV VMs:%s%s%s%s%s%s%s\n",
>             (boot_cpu_has(X86_FEATURE_SC_MSR_PV) ||
>              boot_cpu_has(X86_FEATURE_SC_RSB_PV) ||
>              boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV) ||
> -            opt_eager_fpu || opt_md_clear_pv)        ? ""               : " None",
> +            opt_eager_fpu || opt_md_clear_pv ||
> +            opt_ibpb_mode_switch)                    ? ""               : " None",
>             boot_cpu_has(X86_FEATURE_SC_MSR_PV)       ? " MSR_SPEC_CTRL" : "",
>             boot_cpu_has(X86_FEATURE_SC_RSB_PV)       ? " RSB"           : "",
>             opt_eager_fpu                             ? " EAGER_FPU"     : "",
>             opt_md_clear_pv                           ? " MD_CLEAR"      : "",
> -           boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "");
> +           boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "",
> +           opt_ibpb_mode_switch                      ? " IBPB-mode-switch" : "");
>  
>      printk("  XPTI (64-bit PV only): Dom0 %s, DomU %s (with%s PCID)\n",
>             opt_xpti_hwdom ? "enabled" : "disabled",
> @@ -804,7 +811,8 @@ static void __init ibpb_calculations(voi
>      /* Check we have hardware IBPB support before using it... */
>      if ( !boot_cpu_has(X86_FEATURE_IBRSB) && !boot_cpu_has(X86_FEATURE_IBPB) )
>      {
> -        opt_ibpb_entry_hvm = opt_ibpb_entry_pv = opt_ibpb_ctxt_switch = 0;
> +        opt_ibpb_entry_hvm = opt_ibpb_entry_pv = 0;
> +        opt_ibpb_mode_switch = opt_ibpb_ctxt_switch = 0;
>          opt_ibpb_entry_dom0 = false;
>          return;
>      }
> @@ -859,6 +867,18 @@ static void __init ibpb_calculations(voi
>          setup_force_cpu_cap(X86_FEATURE_NEW_PRED_CTXT_PV);
>          setup_force_cpu_cap(X86_FEATURE_NEW_PRED_CTXT_HVM);
>      }
> +
> +#ifdef CONFIG_PV
> +    /*
> +     * If we're using IBPB-on-entry to protect against PV guests, then
> +     * there's no need to also issue IBPB on a guest user->kernel switch.
> +     */
> +    if ( opt_ibpb_mode_switch == -1 )
> +        opt_ibpb_mode_switch = !opt_ibpb_entry_pv ||
> +                               (!opt_ibpb_entry_dom0 && !opt_dom0_pvh);
> +    if ( opt_ibpb_mode_switch )
> +        setup_force_cpu_cap(X86_FEATURE_NEW_PRED_CTXT_PV);
> +#endif
>  }
>  
>  /* Calculate whether this CPU is vulnerable to L1TF. */
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -554,6 +554,16 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
>   */
>  #define VMASST_TYPE_m2p_strict           32
>  
> +/*
> + * x86-64 guests: Suppress IBPB on guest-user to guest-kernel mode switch.

I think this needs to be more vague, as it's not true that the IBPB
will be suppressed if Xen is unconditionally issuing one on all guest
entry points.

Maybe adding:

"Setting the assist signals Xen that the IBPB can be avoided from a
guest perspective, however Xen might still issue one for other
reasons."

> + *
> + * By default (on affected and capable hardware) as a safety measure Xen,
> + * to cover for the fact that guest-kernel and guest-user modes are both
> + * running in ring 3 (and hence share prediction context), would issue a
> + * barrier for user->kernel mode switches of PV guests.
> + */
> +#define VMASST_TYPE_mode_switch_no_ibpb  33

Would it be possible to define the assist as
VMASST_TYPE_mode_switch_ibpb and have it on when enabled?  So that the
guest would disable it if unneeded?  IMO negated options are in
general harder to understand.

Thanks, Roger.

