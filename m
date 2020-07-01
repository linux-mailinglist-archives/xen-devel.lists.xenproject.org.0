Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5AB21094C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 12:31:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqa16-0002zn-Na; Wed, 01 Jul 2020 10:31:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4aC=AM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jqa15-0002zh-8p
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 10:30:59 +0000
X-Inumbo-ID: f3319edc-bb85-11ea-8496-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3319edc-bb85-11ea-8496-bc764e2007e4;
 Wed, 01 Jul 2020 10:30:57 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EG+C/FWo608QGe69kQsgOI93i17mm/+xN8MSm1J0oeAJj3Hp2EKxsdUIyB0V0REJYcxfEd3MWK
 gACVE4tHFJd6T33ud/dcqaQ84ZtSlZnEmfCa1OEtDtVTCBFMLW6y4KIWhW9FXoIhuILzyzOzIi
 HqaLyX94amQwUbnHZGt41H73lZsgQMAj/zdZFFp3qehTZSUNFSCmIbpT8ho6R7nxj2GXtcIf3/
 Nc/BXGz9cZ0SbYEHYdaCoU4yf5VIByAoiXTK5TiwOoA5QVQdLu/7NBBPv6gkhTdvvUPeXqZ2sh
 9MA=
X-SBRS: 2.7
X-MesageID: 21691752
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,299,1589256000"; d="scan'208";a="21691752"
Date: Wed, 1 Jul 2020 12:30:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v4 04/10] x86/vmx: implement processor tracing for VMX
Message-ID: <20200701103050.GQ735@Air-de-Roger>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <70df90dad7e759f4bb3dba405dc45e372a57fab7.1593519420.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70df90dad7e759f4bb3dba405dc45e372a57fab7.1593519420.git.michal.leszczynski@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, tamas.lengyel@intel.com,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, luwei.kang@intel.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 30, 2020 at 02:33:47PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Use Intel Processor Trace feature in order to
> provision vmtrace_pt_* features.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/arch/x86/hvm/vmx/vmx.c         | 89 ++++++++++++++++++++++++++++++
>  xen/include/asm-x86/hvm/hvm.h      | 38 +++++++++++++
>  xen/include/asm-x86/hvm/vmx/vmcs.h |  3 +
>  xen/include/asm-x86/hvm/vmx/vmx.h  | 14 +++++
>  4 files changed, 144 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index ab19d9424e..db3f051b40 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -508,11 +508,24 @@ static void vmx_restore_host_msrs(void)
>  
>  static void vmx_save_guest_msrs(struct vcpu *v)
>  {
> +    uint64_t rtit_ctl;
> +
>      /*
>       * We cannot cache SHADOW_GS_BASE while the VCPU runs, as it can
>       * be updated at any time via SWAPGS, which we cannot trap.
>       */
>      v->arch.hvm.vmx.shadow_gs = rdgsshadow();
> +
> +    if ( unlikely(v->arch.hvm.vmx.pt_state &&
> +                  v->arch.hvm.vmx.pt_state->active) )
> +    {

Nit: define rtit_ctl here to reduce the scope.

> +        rdmsrl(MSR_RTIT_CTL, rtit_ctl);
> +        BUG_ON(rtit_ctl & RTIT_CTL_TRACEEN);
> +
> +        rdmsrl(MSR_RTIT_STATUS, v->arch.hvm.vmx.pt_state->status);
> +        rdmsrl(MSR_RTIT_OUTPUT_MASK,
> +               v->arch.hvm.vmx.pt_state->output_mask.raw);
> +    }
>  }
>  
>  static void vmx_restore_guest_msrs(struct vcpu *v)
> @@ -524,6 +537,17 @@ static void vmx_restore_guest_msrs(struct vcpu *v)
>  
>      if ( cpu_has_msr_tsc_aux )
>          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
> +
> +    if ( unlikely(v->arch.hvm.vmx.pt_state &&
> +                  v->arch.hvm.vmx.pt_state->active) )
> +    {
> +        wrmsrl(MSR_RTIT_OUTPUT_BASE,
> +               v->arch.hvm.vmx.pt_state->output_base);
> +        wrmsrl(MSR_RTIT_OUTPUT_MASK,
> +               v->arch.hvm.vmx.pt_state->output_mask.raw);
> +        wrmsrl(MSR_RTIT_STATUS,
> +               v->arch.hvm.vmx.pt_state->status);
> +    }
>  }
>  
>  void vmx_update_cpu_exec_control(struct vcpu *v)
> @@ -2240,6 +2264,60 @@ static bool vmx_get_pending_event(struct vcpu *v, struct x86_event *info)
>      return true;
>  }
>  
> +static int vmx_init_pt(struct vcpu *v)
> +{
> +    v->arch.hvm.vmx.pt_state = xzalloc(struct pt_state);
> +
> +    if ( !v->arch.hvm.vmx.pt_state )
> +        return -EFAULT;

-ENOMEM

> +
> +    if ( !v->arch.vmtrace.pt_buf )

Agian, I'm quite sure this doesn't build, since pt_buf is introduced
in patch 5.

I will try to continue to review, but it's quite hard when fields not
yet introduced are used in the code, as I have no idea what that is.

> +        return -EINVAL;
> +
> +    if ( !v->domain->vmtrace_pt_size )
> +	return -EINVAL;

Indentation (hard tab), and could be joined with the previous check,
since both return -EINVAL.

> +
> +    v->arch.hvm.vmx.pt_state->output_base = page_to_maddr(v->arch.vmtrace.pt_buf);
> +    v->arch.hvm.vmx.pt_state->output_mask.raw = v->domain->vmtrace_pt_size - 1;
> +
> +    if ( vmx_add_host_load_msr(v, MSR_RTIT_CTL, 0) )
> +        return -EFAULT;
> +
> +    if ( vmx_add_guest_msr(v, MSR_RTIT_CTL,
> +                              RTIT_CTL_TRACEEN | RTIT_CTL_OS |
> +                              RTIT_CTL_USR | RTIT_CTL_BRANCH_EN) )
> +        return -EFAULT;

I think I've already pointed this out before (in v2), but please don't
drop the returned error codes from vmx_add_host_load_msr and
vmx_add_guest_msr. Please store them in a local variable and return
those if != 0.

> +
> +    return 0;
> +}
> +
> +static int vmx_destroy_pt(struct vcpu* v)
> +{
> +    if ( v->arch.hvm.vmx.pt_state )
> +        xfree(v->arch.hvm.vmx.pt_state);
> +
> +    v->arch.hvm.vmx.pt_state = NULL;
> +    return 0;
> +}

I think those should be port of vmx_vcpu_{initialise/destroy}, there's
no need to introduce new hooks for it? As the allocation size will be
known at domain creation already.

> +static int vmx_control_pt(struct vcpu *v, bool_t enable)

Plain bool.

> +{
> +    if ( !v->arch.hvm.vmx.pt_state )
> +        return -EINVAL;
> +
> +    v->arch.hvm.vmx.pt_state->active = enable;
> +    return 0;
> +}
> +
> +static int vmx_get_pt_offset(struct vcpu *v, uint64_t *offset)
> +{
> +    if ( !v->arch.hvm.vmx.pt_state )
> +        return -EINVAL;
> +
> +    *offset = v->arch.hvm.vmx.pt_state->output_mask.offset;
> +    return 0;
> +}
> +
>  static struct hvm_function_table __initdata vmx_function_table = {
>      .name                 = "VMX",
>      .cpu_up_prepare       = vmx_cpu_up_prepare,
> @@ -2295,6 +2373,10 @@ static struct hvm_function_table __initdata vmx_function_table = {
>      .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
>      .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
>      .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
> +    .vmtrace_init_pt = vmx_init_pt,
> +    .vmtrace_destroy_pt = vmx_destroy_pt,
> +    .vmtrace_control_pt = vmx_control_pt,
> +    .vmtrace_get_pt_offset = vmx_get_pt_offset,

As pointed out above, vmtrace_init_pt and vmtrace_destroy_pt should
IMO be dropped and instead done in vmx_vcpu_{initialise/destroy}.

>      .tsc_scaling = {
>          .max_ratio = VMX_TSC_MULTIPLIER_MAX,
>      },
> @@ -3674,6 +3756,13 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>  
>      hvm_invalidate_regs_fields(regs);
>  
> +    if ( unlikely(v->arch.hvm.vmx.pt_state &&
> +                  v->arch.hvm.vmx.pt_state->active) )
> +    {
> +        rdmsrl(MSR_RTIT_OUTPUT_MASK,
> +               v->arch.hvm.vmx.pt_state->output_mask.raw);
> +    }
> +
>      if ( paging_mode_hap(v->domain) )
>      {
>          /*
> diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
> index 1eb377dd82..8f194889e5 100644
> --- a/xen/include/asm-x86/hvm/hvm.h
> +++ b/xen/include/asm-x86/hvm/hvm.h
> @@ -214,6 +214,12 @@ struct hvm_function_table {
>      bool_t (*altp2m_vcpu_emulate_ve)(struct vcpu *v);
>      int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs);
>  
> +    /* vmtrace */
> +    int (*vmtrace_init_pt)(struct vcpu *v);
> +    int (*vmtrace_destroy_pt)(struct vcpu *v);
> +    int (*vmtrace_control_pt)(struct vcpu *v, bool_t enable);
> +    int (*vmtrace_get_pt_offset)(struct vcpu *v, uint64_t *offset);
> +
>      /*
>       * Parameters and callbacks for hardware-assisted TSC scaling,
>       * which are valid only when the hardware feature is available.
> @@ -655,6 +661,38 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
>      return false;
>  }
>  
> +static inline int vmtrace_init_pt(struct vcpu *v)
> +{
> +    if ( hvm_funcs.vmtrace_init_pt )
> +        return hvm_funcs.vmtrace_init_pt(v);
> +
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline int vmtrace_destroy_pt(struct vcpu *v)
> +{
> +    if ( hvm_funcs.vmtrace_destroy_pt )
> +        return hvm_funcs.vmtrace_destroy_pt(v);
> +
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline int vmtrace_control_pt(struct vcpu *v, bool_t enable)
> +{
> +    if ( hvm_funcs.vmtrace_control_pt )
> +        return hvm_funcs.vmtrace_control_pt(v, enable);
> +
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline int vmtrace_get_pt_offset(struct vcpu *v, uint64_t *offset)
> +{
> +    if ( hvm_funcs.vmtrace_get_pt_offset )
> +        return hvm_funcs.vmtrace_get_pt_offset(v, offset);
> +
> +    return -EOPNOTSUPP;
> +}
> +
>  /*
>   * This must be defined as a macro instead of an inline function,
>   * because it uses 'struct vcpu' and 'struct domain' which have
> diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-x86/hvm/vmx/vmcs.h
> index 0e9a0b8de6..64c0d82614 100644
> --- a/xen/include/asm-x86/hvm/vmx/vmcs.h
> +++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
> @@ -186,6 +186,9 @@ struct vmx_vcpu {
>       * pCPU and wakeup the related vCPU.
>       */
>      struct pi_blocking_vcpu pi_blocking;
> +
> +    /* State of processor trace feature */
> +    struct pt_state      *pt_state;

I think it's fine to add this here for now, but we might also consider
putting it outside of a HVM specific structure if it's to be used by
PV guests. Since all this is HVM specific I'm fine with adding it
here.

>  };
>  
>  int vmx_create_vmcs(struct vcpu *v);
> diff --git a/xen/include/asm-x86/hvm/vmx/vmx.h b/xen/include/asm-x86/hvm/vmx/vmx.h
> index 111ccd7e61..be7213d3c0 100644
> --- a/xen/include/asm-x86/hvm/vmx/vmx.h
> +++ b/xen/include/asm-x86/hvm/vmx/vmx.h
> @@ -689,4 +689,18 @@ typedef union ldt_or_tr_instr_info {
>      };
>  } ldt_or_tr_instr_info_t;
>  
> +/* Processor Trace state per vCPU */
> +struct pt_state {

Please use ipt_state here, since this is an Intel specific structure.

> +    bool_t active;

Plain bool.

Thanks, Roger.

