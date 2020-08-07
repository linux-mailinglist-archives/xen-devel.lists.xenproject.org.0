Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4C023EFB7
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 17:00:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k43ql-0001Lc-VT; Fri, 07 Aug 2020 15:00:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k43ql-0001CQ-2z
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 15:00:03 +0000
X-Inumbo-ID: 36320f87-9cfc-4aac-b8fd-8a0005964dfc
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36320f87-9cfc-4aac-b8fd-8a0005964dfc;
 Fri, 07 Aug 2020 15:00:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EEA75ABA2;
 Fri,  7 Aug 2020 15:00:18 +0000 (UTC)
Subject: Re: [PATCH v6 07/11] x86/vmx: implement IPT in VMX
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <7ddfc44d6ffde0fa307f0e074225f588c397aef0.1594150543.git.michal.leszczynski@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b84edbc8-d3cd-b7ea-c339-e65a989318c7@suse.com>
Date: Fri, 7 Aug 2020 17:00:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7ddfc44d6ffde0fa307f0e074225f588c397aef0.1594150543.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 luwei.kang@intel.com, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.07.2020 21:39, Michał Leszczyński wrote:
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
> +
> +    v->arch.hvm.vmx.ipt_state = xzalloc(struct ipt_state);
> +
> +    if ( !v->arch.hvm.vmx.ipt_state )
> +        return -ENOMEM;
> +
> +    v->arch.hvm.vmx.ipt_state->output_base =
> +        page_to_maddr(v->vmtrace.pt_buf);
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

Indentation is off by three here, and ...

> +    if ( rc )
> +        return rc;
> +
> +    return 0;
> +}

... this whole thing would be shorter (and hence easier to read) as

    return vmx_add_guest_msr(v, MSR_RTIT_CTL,
                             RTIT_CTL_TRACE_EN | RTIT_CTL_OS |
                             RTIT_CTL_USR | RTIT_CTL_BRANCH_EN);

> +static int vmx_destroy_pt(struct vcpu* v)
> +{
> +    if ( v->arch.hvm.vmx.ipt_state )
> +        xfree(v->arch.hvm.vmx.ipt_state);

No need for the if(). 

> +    v->arch.hvm.vmx.ipt_state = NULL;

And everything together is actually simply
"XFREE(v->arch.hvm.vmx.ipt_state);".

> @@ -471,6 +521,14 @@ static int vmx_vcpu_initialise(struct vcpu *v)
>  
>      vmx_install_vlapic_mapping(v);
>  
> +    if ( v->domain->processor_trace_buf_kb )
> +    {
> +        rc = vmx_init_pt(v);
> +
> +        if ( rc )
> +            return rc;
> +    }
> +
>      return 0;
>  }

Is there no cleanup you need to do in case of failure? The caller
will invoke vmx_vcpu_destroy() only for failures subsequent to one
coming from here.

> @@ -513,6 +572,18 @@ static void vmx_save_guest_msrs(struct vcpu *v)
>       * be updated at any time via SWAPGS, which we cannot trap.
>       */
>      v->arch.hvm.vmx.shadow_gs = rdgsshadow();
> +
> +    if ( unlikely(v->arch.hvm.vmx.ipt_state &&
> +                  v->arch.hvm.vmx.ipt_state->active) )

likely() / unlikely(), for being efficient, don't want && or ||
in their expressions. Please limit to just the left side of &&.

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

Peeking ahead into patch 9, the vCPU is paused at this point.
Please add a respective ASSERT(), if only for documentation
purposes.

> +static int vmx_get_pt_offset(struct vcpu *v, uint64_t *offset, uint64_t *size)
> +{
> +    if ( !v->arch.hvm.vmx.ipt_state )
> +        return -EINVAL;
> +
> +    *offset = v->arch.hvm.vmx.ipt_state->output_mask.offset;
> +    *size = v->arch.hvm.vmx.ipt_state->output_mask.size + 1;

Either the function parameter or the struct field is misnamed,
or else there shouldn't be an addition of 1 here.

> @@ -2295,6 +2396,8 @@ static struct hvm_function_table __initdata vmx_function_table = {
>      .altp2m_vcpu_update_vmfunc_ve = vmx_vcpu_update_vmfunc_ve,
>      .altp2m_vcpu_emulate_ve = vmx_vcpu_emulate_ve,
>      .altp2m_vcpu_emulate_vmfunc = vmx_vcpu_emulate_vmfunc,
> +    .vmtrace_control_pt = vmx_control_pt,
> +    .vmtrace_get_pt_offset = vmx_get_pt_offset,

Better install these hooks only if the underlying feature is
available (like we do for several other hooks)?

> @@ -3674,6 +3777,13 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>  
>      hvm_invalidate_regs_fields(regs);
>  
> +    if ( unlikely(v->arch.hvm.vmx.ipt_state &&
> +                  v->arch.hvm.vmx.ipt_state->active) )
> +    {
> +        rdmsrl(MSR_RTIT_OUTPUT_MASK,
> +               v->arch.hvm.vmx.ipt_state->output_mask.raw);

Don't you also need to latch RTIT_STATUS?

> --- a/xen/include/asm-x86/hvm/vmx/vmx.h
> +++ b/xen/include/asm-x86/hvm/vmx/vmx.h
> @@ -689,4 +689,18 @@ typedef union ldt_or_tr_instr_info {
>      };
>  } ldt_or_tr_instr_info_t;
>  
> +/* Processor Trace state per vCPU */
> +struct ipt_state {
> +    bool active;
> +    uint64_t status;
> +    uint64_t output_base;

maddr_t according to its use.

Jan

