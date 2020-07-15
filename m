Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA162211DC
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 18:04:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvjtg-0000l3-Gh; Wed, 15 Jul 2020 16:04:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osgb=A2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvjte-0000kx-RZ
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 16:04:38 +0000
X-Inumbo-ID: e1e75dbc-c6b4-11ea-bca7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1e75dbc-c6b4-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 16:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594829077;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=48p4kslhnmsyZF5L086IqNPIBWykDiVgHXxxLjb+fFw=;
 b=RQW9S0EAKDCuSn/+fPpf7O3tb7ayUKnJwvMPkrQ2CjNGOgWaK3cdRoVZ
 7NQTu1UsTyDEiY10QsuMHqVI43H5SMnj78k1LEDugrBJrmb/qdV4EjG8n
 AnaEO9ysUTUPMgFlGBScBW8ytizu/nWrXDcELU0qnF7TQZn/Hq/K/cfVF U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7HpVz495a2Lzcv0+m9enR+Gy8pkxcyUrXV3iUivkFNrWDcgDwTTBerVl5NvFjLv0o8bOFBb5wy
 8DTxDDSnJRRgxCX09t3i80jt9s+h4pe/h4rKmGJiQ2eCnjQ+gMhDtbQU/b3zUE267q229xy99a
 +7jp+GDsDn7PrCY2PUagzh9dKwZ+s6AhAt1ifDKcrfOba4izeSOZ7DzZ7Ijnaf27lrAQ9Ww5F6
 fxH/AldoP6FPe+LiYFK7FIqXSqufU2M5qM6wJVFNZE8WfZ+KfE3W/KvSLm4Qzgw/J7xshNDV9v
 tV0=
X-SBRS: 2.7
X-MesageID: 22780377
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="22780377"
Date: Wed, 15 Jul 2020 18:04:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v6 07/11] x86/vmx: implement IPT in VMX
Message-ID: <20200715160430.GE7191@Air-de-Roger>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <7ddfc44d6ffde0fa307f0e074225f588c397aef0.1594150543.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ddfc44d6ffde0fa307f0e074225f588c397aef0.1594150543.git.michal.leszczynski@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On Tue, Jul 07, 2020 at 09:39:46PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Use Intel Processor Trace feature to provide vmtrace_pt_*
> interface for HVM/VMX.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/arch/x86/hvm/vmx/vmx.c         | 110 +++++++++++++++++++++++++++++
>  xen/include/asm-x86/hvm/vmx/vmcs.h |   3 +
>  xen/include/asm-x86/hvm/vmx/vmx.h  |  14 ++++
>  3 files changed, 127 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index cc6d4ece22..63a5a76e16 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -428,6 +428,56 @@ static void vmx_domain_relinquish_resources(struct domain *d)
>      vmx_free_vlapic_mapping(d);
>  }
>  
> +static int vmx_init_pt(struct vcpu *v)
> +{
> +    int rc;
> +    uint64_t size = v->domain->processor_trace_buf_kb * KB(1);

As I commented in other patches, I don't think there's a need to have
the size in bytes, and hence you could just convert to number of pages?

You might have to check that the value is rounded to a page boundary.

> +
> +    if ( !v->vmtrace.pt_buf || !size )
> +        return -EINVAL;
> +
> +    /*
> +     * We don't accept trace buffer size smaller than single page
> +     * and the upper bound is defined as 4GB in the specification.
> +     * The buffer size must be also a power of 2.
> +     */
> +    if ( size < PAGE_SIZE || size > GB(4) || (size & (size - 1)) )
> +        return -EINVAL;

IMO there should be a hook to sanitize the buffer size before you go
and allocate it. It makes no sense to allocate a buffer to come here
and realize it's not suitable.

> +
> +    v->arch.hvm.vmx.ipt_state = xzalloc(struct ipt_state);
> +

Extra newline.

> +    if ( !v->arch.hvm.vmx.ipt_state )
> +        return -ENOMEM;
> +
> +    v->arch.hvm.vmx.ipt_state->output_base =
> +        page_to_maddr(v->vmtrace.pt_buf);

The above fits on a single line now. You could also avoid having an
output_base field and just do the conversion in
vmx_restore_guest_msrs, I'm not sure there's much value in having this
cached here.

> +    v->arch.hvm.vmx.ipt_state->output_mask.raw = size - 1;
> +
> +    rc = vmx_add_host_load_msr(v, MSR_RTIT_CTL, 0);
> +
> +    if ( rc )
> +        return rc;
> +
> +    rc = vmx_add_guest_msr(v, MSR_RTIT_CTL,
> +                              RTIT_CTL_TRACE_EN | RTIT_CTL_OS |
> +                              RTIT_CTL_USR | RTIT_CTL_BRANCH_EN);
> +
> +    if ( rc )
> +        return rc;

We don't usually leave an empty line between setting and testing rc.

> +
> +    return 0;
> +}
> +
> +static int vmx_destroy_pt(struct vcpu* v)
> +{
> +    if ( v->arch.hvm.vmx.ipt_state )
> +        xfree(v->arch.hvm.vmx.ipt_state);
> +
> +    v->arch.hvm.vmx.ipt_state = NULL;
> +    return 0;
> +}
> +
> +

Double newline, just one newline please between functions.

>  static int vmx_vcpu_initialise(struct vcpu *v)
>  {
>      int rc;
> @@ -471,6 +521,14 @@ static int vmx_vcpu_initialise(struct vcpu *v)
>  
>      vmx_install_vlapic_mapping(v);
>  
> +    if ( v->domain->processor_trace_buf_kb )

Can you move this check inside of vmx_init_pt, so that here you just
do:

return vmx_init_pt(v);

> +    {
> +        rc = vmx_init_pt(v);
> +
> +        if ( rc )
> +            return rc;
> +    }
> +
>      return 0;
>  }
>  
> @@ -483,6 +541,7 @@ static void vmx_vcpu_destroy(struct vcpu *v)
>       * prior to vmx_domain_destroy so we need to disable PML for each vcpu
>       * separately here.
>       */
> +    vmx_destroy_pt(v);
>      vmx_vcpu_disable_pml(v);
>      vmx_destroy_vmcs(v);
>      passive_domain_destroy(v);
> @@ -513,6 +572,18 @@ static void vmx_save_guest_msrs(struct vcpu *v)
>       * be updated at any time via SWAPGS, which we cannot trap.
>       */
>      v->arch.hvm.vmx.shadow_gs = rdgsshadow();
> +
> +    if ( unlikely(v->arch.hvm.vmx.ipt_state &&
> +                  v->arch.hvm.vmx.ipt_state->active) )
> +    {
> +        uint64_t rtit_ctl;

Missing newline.

> +        rdmsrl(MSR_RTIT_CTL, rtit_ctl);
> +        BUG_ON(rtit_ctl & RTIT_CTL_TRACE_EN);
> +
> +        rdmsrl(MSR_RTIT_STATUS, v->arch.hvm.vmx.ipt_state->status);
> +        rdmsrl(MSR_RTIT_OUTPUT_MASK,
> +               v->arch.hvm.vmx.ipt_state->output_mask.raw);
> +    }
>  }
>  
>  static void vmx_restore_guest_msrs(struct vcpu *v)
> @@ -524,6 +595,17 @@ static void vmx_restore_guest_msrs(struct vcpu *v)
>  
>      if ( cpu_has_msr_tsc_aux )
>          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
> +
> +    if ( unlikely(v->arch.hvm.vmx.ipt_state &&
> +                  v->arch.hvm.vmx.ipt_state->active) )
> +    {
> +        wrmsrl(MSR_RTIT_OUTPUT_BASE,
> +               v->arch.hvm.vmx.ipt_state->output_base);
> +        wrmsrl(MSR_RTIT_OUTPUT_MASK,
> +               v->arch.hvm.vmx.ipt_state->output_mask.raw);
> +        wrmsrl(MSR_RTIT_STATUS,
> +               v->arch.hvm.vmx.ipt_state->status);
> +    }
>  }
>  
>  void vmx_update_cpu_exec_control(struct vcpu *v)
> @@ -2240,6 +2322,25 @@ static bool vmx_get_pending_event(struct vcpu *v, struct x86_event *info)
>      return true;
>  }
>  
> +static int vmx_control_pt(struct vcpu *v, bool enable)
> +{
> +    if ( !v->arch.hvm.vmx.ipt_state )
> +        return -EINVAL;
> +
> +    v->arch.hvm.vmx.ipt_state->active = enable;

I think you should assert that the vCPU is paused? As doing this on a
non-paused vCPU is not going to work reliably?

> +    return 0;
> +}
> +
> +static int vmx_get_pt_offset(struct vcpu *v, uint64_t *offset, uint64_t *size)
> +{
> +    if ( !v->arch.hvm.vmx.ipt_state )
> +        return -EINVAL;
> +
> +    *offset = v->arch.hvm.vmx.ipt_state->output_mask.offset;
> +    *size = v->arch.hvm.vmx.ipt_state->output_mask.size + 1;
> +    return 0;
> +}
> +
>  static struct hvm_function_table __initdata vmx_function_table = {
>      .name                 = "VMX",
>      .cpu_up_prepare       = vmx_cpu_up_prepare,
> @@ -2295,6 +2396,8 @@ static struct hvm_function_table __initdata vmx_function_table = {
>      .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
>      .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
>      .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
> +    .vmtrace_control_pt = vmx_control_pt,
> +    .vmtrace_get_pt_offset = vmx_get_pt_offset,
>      .tsc_scaling = {
>          .max_ratio = VMX_TSC_MULTIPLIER_MAX,
>      },
> @@ -3674,6 +3777,13 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>  
>      hvm_invalidate_regs_fields(regs);
>  
> +    if ( unlikely(v->arch.hvm.vmx.ipt_state &&
> +                  v->arch.hvm.vmx.ipt_state->active) )
> +    {
> +        rdmsrl(MSR_RTIT_OUTPUT_MASK,
> +               v->arch.hvm.vmx.ipt_state->output_mask.raw);
> +    }

Unneeded braces.

Thanks.

