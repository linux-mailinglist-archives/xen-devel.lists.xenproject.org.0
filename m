Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD12D2AD0CA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 09:04:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23074.49632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcOcy-0005Zr-0j; Tue, 10 Nov 2020 08:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23074.49632; Tue, 10 Nov 2020 08:03:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcOcx-0005ZS-T9; Tue, 10 Nov 2020 08:03:43 +0000
Received: by outflank-mailman (input) for mailman id 23074;
 Tue, 10 Nov 2020 08:03:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcOcw-0005ZN-Bi
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 08:03:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 431f4e2c-2b5a-4328-a7d8-cd09321a3592;
 Tue, 10 Nov 2020 08:03:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A5EFAB95;
 Tue, 10 Nov 2020 08:03:40 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcOcw-0005ZN-Bi
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 08:03:42 +0000
X-Inumbo-ID: 431f4e2c-2b5a-4328-a7d8-cd09321a3592
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 431f4e2c-2b5a-4328-a7d8-cd09321a3592;
	Tue, 10 Nov 2020 08:03:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604995420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sI7MSEonKur0nPgBfGqEMV2xnU2Wo991o44qzOu9Sm0=;
	b=DD4ssLPp+eqtV2KiUNXzOX/ajfpWd0yvIsd84euDfPUFbnmqRcJGz+3HJN9BWs7zc+E2JA
	558W/8KXbyrPpDgli8MCxXWTt9KHvIguIlLV7PrI/eka170ErpOWu1axf/5KZ9zerOzDq7
	IXAoFna3mVJXB/J6gPpqnBMWg8jo+vg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7A5EFAB95;
	Tue, 10 Nov 2020 08:03:40 +0000 (UTC)
Subject: Re: [PATCH v2] x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL}
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201109173819.7817-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <681e03f5-86fd-43bb-5347-c526def9ffcb@suse.com>
Date: Tue, 10 Nov 2020 09:03:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201109173819.7817-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.11.2020 18:38, Andrew Cooper wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Currently a PV hardware domain can also be given control over the CPU
> frequency, and such guest is allowed to write to MSR_IA32_PERF_CTL.
> However since commit 322ec7c89f6 the default behavior has been changed
> to reject accesses to not explicitly handled MSRs, preventing PV
> guests that manage CPU frequency from reading
> MSR_IA32_PERF_{STATUS/CTL}.
> 
> Additionally some HVM guests (Windows at least) will attempt to read
> MSR_IA32_PERF_CTL and will panic if given back a #GP fault:
> 
>   vmx.c:3035:d8v0 RDMSR 0x00000199 unimplemented
>   d8v0 VIRIDIAN CRASH: 3b c0000096 fffff806871c1651 ffffda0253683720 0
> 
> Move the handling of MSR_IA32_PERF_{STATUS/CTL} to the common MSR
> handling shared between HVM and PV guests, and add an explicit case
> for reads to MSR_IA32_PERF_{STATUS/CTL}.
> 
> Restore previous behavior and allow PV guests with the required
> permissions to read the contents of the mentioned MSRs. Non privileged
> guests will get 0 when trying to read those registers, as writes to
> MSR_IA32_PERF_CTL by such guest will already be silently dropped.
> 
> Fixes: 322ec7c89f6 ('x86/pv: disallow access to unknown MSRs')
> Fixes: 84e848fd7a1 ('x86/hvm: disallow access to unknown MSRs')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a nit, a minor adjustment request, and a question:

> @@ -448,6 +467,21 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>              goto gp_fault;
>          break;
>  
> +        /*
> +         * This MSR are not enumerated in CPUID.  It has been around since the

s/are/is/

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1069,6 +1069,23 @@ extern enum cpufreq_controller {
>      FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
>  } cpufreq_controller;
>  
> +static always_inline bool is_cpufreq_controller(const struct domain *d)
> +{
> +    /*
> +     * A PV dom0 can be nominated as the cpufreq controller, instead of using
> +     * Xen's cpufreq driver, at which point dom0 gets direct access to certain
> +     * MSRs.
> +     *
> +     * This interface only works when dom0 is identity pinned and has the same
> +     * number of vCPUs as pCPUs on the system.
> +     *
> +     * It would be far better to paravirtualise the interface.
> +     */
> +    return (IS_ENABLED(CONFIG_PV) &&
> +            (cpufreq_controller == FREQCTL_dom0_kernel) &&
> +            is_pv_domain(d) && is_hardware_domain(d));
> +}

IS_ENABLED(CONFIG_PV) is already part of is_pv_domain() and hence
imo shouldn't be used explicitly here.

Also, this being an x86 concept, is it really a good idea to put
in xen/sched.h? I guess this builds on Arm just because of DCE
from the IS_ENABLED(CONFIG_PV) (where afaict the one in
is_pv_domain() will still do). (But yes, I do realize that
cpufreq_controller itself gets declared in this file, so maybe
better to do some subsequent cleanup.)

Jan

