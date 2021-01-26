Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA25303ED1
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75040.134993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OVj-0001ML-53; Tue, 26 Jan 2021 13:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75040.134993; Tue, 26 Jan 2021 13:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OVj-0001Lw-1R; Tue, 26 Jan 2021 13:35:59 +0000
Received: by outflank-mailman (input) for mailman id 75040;
 Tue, 26 Jan 2021 13:35:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4OVh-0001Lr-Ud
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:35:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed6ecff5-3917-49a7-b9db-9ef0ef7cb33e;
 Tue, 26 Jan 2021 13:35:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B735AEAC;
 Tue, 26 Jan 2021 13:35:55 +0000 (UTC)
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
X-Inumbo-ID: ed6ecff5-3917-49a7-b9db-9ef0ef7cb33e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611668155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pnFxgLdQ3RxVZOh9gjmCe+I9LPGXdQ+uEyWkGJKZ5LI=;
	b=NONovAhsCq1TO4JbrHP4EF8IghoVHuXT/9f8hwRiT8Drh51QEzHx/q0cPOtAgpj3vP6Ea0
	IzNYKvrQxl2PwTG9QPVQQvrim4sh3jc6fFknlleyjoUn9xzzSKCSFBYQGKiGCmDpLNP2Ee
	F/Z05MaY6I/08p0Si+oaoToR3T0CNng=
Subject: Re: [PATCH v7 05/10] x86/vmx: Add Intel Processor Trace support
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9fa8ff47-cd09-a09b-6d62-bb47f72c3847@suse.com>
Date: Tue, 26 Jan 2021 14:35:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121212718.2441-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.01.2021 22:27, Andrew Cooper wrote:
> From: Michał Leszczyński <michal.leszczynski@cert.pl>
> 
> Add CPUID/MSR enumeration details for Processor Trace.  For now, we will only
> support its use inside VMX operation.  Fill in the vmtrace_available boolean
> to activate the newly introduced common infrastructure for allocating trace
> buffers.
> 
> For now, Processor Trace is going to be operated in Single Output mode behind
> the guests back.  Add the MSRs to struct vcpu_msrs, and set up the buffer
> limit in vmx_init_pt() as it is fixed for the lifetime of the domain.
> 
> Context switch the most of the MSRs in and out of vCPU context switch, but the
> main control register needs to reside in the MSR load/save lists.  Explicitly
> pull the msrs pointer out into a local variable, because the optimiser cannot
> keep it live across the memory clobbers in the MSR accesses.
> 
> Signed-off-by: Michał Leszczyński <michal.leszczynski@cert.pl>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with a few things to consider and with a question to
confirm my understanding.

> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -291,6 +291,20 @@ static int vmx_init_vmcs_config(void)
>          _vmx_cpu_based_exec_control &=
>              ~(CPU_BASED_CR8_LOAD_EXITING | CPU_BASED_CR8_STORE_EXITING);
>  
> +    rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
> +
> +    /* Check whether IPT is supported in VMX operation. */
> +    if ( !smp_processor_id() )

I'm not happy to see another one of these appear. I'd prefer
if the caller passed its "bsp" boolean into here, or if this
was made use system_state.

> +        vmtrace_available = cpu_has_proc_trace &&
> +                            (_vmx_misc_cap & VMX_MISC_PROC_TRACE);
> +    else if ( vmtrace_available &&
> +              !(_vmx_misc_cap & VMX_MISC_PROC_TRACE) )
> +    {
> +        printk("VMX: IPT capabilities differ between CPU%u and CPU0\n",

As a minor follow-on, instead of "CPU0" this may then want
to say "rest of the system" or "BSP", but I can see that at
least the former is also making the message longer (which
may not be desirable).

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -428,6 +428,20 @@ static void vmx_domain_relinquish_resources(struct domain *d)
>      vmx_free_vlapic_mapping(d);
>  }
>  
> +static void vmx_init_pt(struct vcpu *v)

We use "pt" already as an acronym for pass-through. Could we
use "ipt" here, for example (following the new "ipt_active"
field)?

> --- a/xen/include/asm-x86/msr.h
> +++ b/xen/include/asm-x86/msr.h
> @@ -306,6 +306,38 @@ struct vcpu_msrs
>          };
>      } misc_features_enables;
>  
> +    /*
> +     * 0x00000560 ... 57x - MSR_RTIT_*
> +     *
> +     * "Real Time Instruction Trace", now called Processor Trace.
> +     *
> +     * These MSRs are not exposed to guests.  They are controlled by Xen
> +     * behind the scenes, when vmtrace is enabled for the domain.
> +     *
> +     * MSR_RTIT_OUTPUT_BASE not stored here.  It is fixed per vcpu, and
> +     * derived from v->vmtrace.buf.
> +     */
> +    struct {
> +        /*
> +         * Placed in the MSR load/save lists.  Only modified by hypercall in
> +         * the common case.
> +         */
> +        uint64_t ctl;

IIUC this field will be used by subsequent patches only?

Jan

