Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B722304002
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 15:19:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75108.135151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PAY-0006Nv-6V; Tue, 26 Jan 2021 14:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75108.135151; Tue, 26 Jan 2021 14:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PAY-0006NV-1q; Tue, 26 Jan 2021 14:18:10 +0000
Received: by outflank-mailman (input) for mailman id 75108;
 Tue, 26 Jan 2021 14:18:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4PAW-0006NQ-I9
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 14:18:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82d432e5-b5b5-4f68-bbeb-b85574650f8c;
 Tue, 26 Jan 2021 14:18:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F59BAB9F;
 Tue, 26 Jan 2021 14:18:05 +0000 (UTC)
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
X-Inumbo-ID: 82d432e5-b5b5-4f68-bbeb-b85574650f8c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611670685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ykh2ey79/Os72HuCMprNuW1Uq2ZlncCorOqgMNA0Oo=;
	b=hizmXs+mDFXZuAp0U2NQ0aCc3yJRTp1O1qEVjlmI4dPp9g1dsN1ZWKSFrdi7erzvwXnUsh
	NGxJQolE6ZBjK67zmyGkkZOddm1dz2prEUOvpgeUWpxAHdtKbWXCWe+Q1lfvY6M11r5l+d
	kDymA/b+lrMQcA4IqmeCalKyX+0K2ZE=
Subject: Re: [PATCH v7 06/10] xen/domctl: Add XEN_DOMCTL_vmtrace_op
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <04f34381-92b4-7965-8c6f-76cfa2312f2a@suse.com>
Date: Tue, 26 Jan 2021 15:18:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210121212718.2441-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.01.2021 22:27, Andrew Cooper wrote:
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -155,6 +155,55 @@ void arch_get_domain_info(const struct domain *d,
>      info->arch_config.emulation_flags = d->arch.emulation_flags;
>  }
>  
> +static int do_vmtrace_op(struct domain *d, struct xen_domctl_vmtrace_op *op,
> +                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> +{
> +    struct vcpu *v;
> +    int rc;
> +
> +    if ( !d->vmtrace_frames || d == current->domain /* No vcpu_pause() */ )
> +        return -EINVAL;
> +
> +    ASSERT(is_hvm_domain(d)); /* Restricted by domain creation logic. */
> +
> +    v = domain_vcpu(d, op->vcpu);
> +    if ( !v )
> +        return -ENOENT;
> +
> +    vcpu_pause(v);
> +    switch ( op->cmd )
> +    {
> +    case XEN_DOMCTL_vmtrace_enable:
> +    case XEN_DOMCTL_vmtrace_disable:
> +    case XEN_DOMCTL_vmtrace_reset_and_enable:
> +        rc = hvm_vmtrace_control(
> +            v, op->cmd != XEN_DOMCTL_vmtrace_disable,
> +            op->cmd == XEN_DOMCTL_vmtrace_reset_and_enable);
> +        break;
> +
> +    case XEN_DOMCTL_vmtrace_output_position:
> +        rc = hvm_vmtrace_output_position(v, &op->value);
> +        if ( rc >= 0 )
> +            rc = 0;

So vmtrace_output_position() effectively returns a boolean, and
there is no other caller of it afaics. I understand the hook and
function return int to allow for error indicators. But what's
the purpose of returning ipt_active when the only caller doesn't
care?

> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2261,6 +2261,153 @@ static bool vmx_get_pending_event(struct vcpu *v, struct x86_event *info)
>      return true;
>  }
>  
> +static int vmtrace_get_option(struct vcpu *v, uint64_t key, uint64_t *output)
> +{
> +    const struct vcpu_msrs *msrs = v->arch.msrs;
> +
> +    /*
> +     * We only let vmtrace agents see and modify a subset of bits in
> +     * MSR_RTIT_CTL.  These all pertain to date emitted into the trace

s/date/data/ ?

> +     * buffer(s).  Must not include controls pertaining to the
> +     * structure/position of the trace buffer(s).
> +     */
> +#define RTIT_CTL_MASK                                                   \
> +    (RTIT_CTL_TRACE_EN | RTIT_CTL_OS | RTIT_CTL_USR | RTIT_CTL_TSC_EN | \
> +     RTIT_CTL_DIS_RETC | RTIT_CTL_BRANCH_EN)
> +
> +    /*
> +     * Status bits restricted to the first-gen subset (i.e. no further CPUID
> +     * requirements.)
> +     */
> +#define RTIT_STATUS_MASK \
> +    (RTIT_STATUS_FILTER_EN | RTIT_STATUS_CONTEXT_EN | RTIT_STATUS_TRIGGER_EN | \
> +     RTIT_STATUS_ERROR | RTIT_STATUS_STOPPED)

The placement of these two #define-s kind of suggests they're
intended for this function only, but the next one (at least)
also uses them. May I suggest to move these ahead of this
function?

> +static int vmtrace_set_option(struct vcpu *v, uint64_t key, uint64_t value)
> +{
> +    struct vcpu_msrs *msrs = v->arch.msrs;
> +    bool new_en, old_en = msrs->rtit.ctl & RTIT_CTL_TRACE_EN;
> +
> +    switch ( key )
> +    {
> +    case MSR_RTIT_OUTPUT_MASK:
> +        /*
> +         * MSR_RTIT_OUTPUT_MASK, when using Single Output mode, has a limit
> +         * field in the lower 32 bits, and an offset in the upper 32 bits.
> +         *
> +         * Limit is fixed by the vmtrace buffer size and must not be
> +         * controlled by userspace, while offset must be within the limit.
> +         *
> +         * Drop writes to the limit field to simply userspace wanting to reset
> +         * the offset by writing 0.
> +         */
> +        if ( (value >> 32) > msrs->rtit.output_limit )
> +            return -EINVAL;
> +        msrs->rtit.output_offset = value >> 32;
> +        break;
> +
> +    case MSR_RTIT_CTL:
> +        if ( value & ~RTIT_CTL_MASK )
> +            return -EINVAL;
> +
> +        msrs->rtit.ctl &= ~RTIT_CTL_MASK;
> +        msrs->rtit.ctl |= (value & RTIT_CTL_MASK);
> +        break;
> +
> +    case MSR_RTIT_STATUS:
> +        if ( value & ~RTIT_STATUS_MASK )
> +            return -EINVAL;
> +
> +        msrs->rtit.status &= ~RTIT_STATUS_MASK;
> +        msrs->rtit.status |= (value & RTIT_STATUS_MASK);
> +        break;
> +
> +    default:
> +        return -EINVAL;
> +    }
> +
> +    new_en = msrs->rtit.ctl & RTIT_CTL_TRACE_EN;
> +
> +    /* ctl.trace_en changed => update MSR load/save lists appropriately. */
> +    if ( !old_en && new_en )
> +    {
> +        if ( vmx_add_guest_msr(v, MSR_RTIT_CTL, msrs->rtit.ctl) ||
> +             vmx_add_host_load_msr(v, MSR_RTIT_CTL, 0) )
> +        {
> +            /*
> +             * The only failure cases here are failing the
> +             * singleton-per-domain memory allocation, or exceeding the space
> +             * in the allocation.  We could unwind in principle, but there is
> +             * nothing userspace can usefully do to continue using this VM.
> +             */
> +            domain_crash(v->domain);
> +            return -ENXIO;

I don't think I fully agree with the 2nd half of the last
sentence, but well, so be it then for the time being at least.
Why could userspace not decide to continue running this VM
with ipt disabled?

> +static int vmtrace_control(struct vcpu *v, bool enable, bool reset)
> +{
> +    struct vcpu_msrs *msrs = v->arch.msrs;
> +    uint64_t new_ctl;
> +    int rc;
> +
> +    if ( v->arch.hvm.vmx.ipt_active == enable )
> +        return -EINVAL;

Why is XEN_DOMCTL_vmtrace_reset_and_enable not permitted
when ipt_active is true? And, considering ...

> +    if ( reset )
> +    {
> +        msrs->rtit.status = 0;
> +        msrs->rtit.output_offset = 0;
> +    }
> +
> +    new_ctl = msrs->rtit.ctl & ~RTIT_CTL_TRACE_EN;
> +    if ( enable )
> +        new_ctl |= RTIT_CTL_TRACE_EN;
> +
> +    rc = vmtrace_set_option(v, MSR_RTIT_CTL, new_ctl);

... this is just a wrapper around a function directly
reachable via XEN_DOMCTL_vmtrace_set_option, why any
restriction at all?

> +    if ( rc )
> +        return rc;
> +
> +    v->arch.hvm.vmx.ipt_active = enable;

Shouldn't this be done in vmtrace_set_option(), to also
cover the other path leading there?

Jan

