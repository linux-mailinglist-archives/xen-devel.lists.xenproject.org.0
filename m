Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E514A2864B9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 18:42:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3564.10199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQCVO-0003Jr-Ml; Wed, 07 Oct 2020 16:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3564.10199; Wed, 07 Oct 2020 16:41:30 +0000
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
	id 1kQCVO-0003JS-JM; Wed, 07 Oct 2020 16:41:30 +0000
Received: by outflank-mailman (input) for mailman id 3564;
 Wed, 07 Oct 2020 16:41:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqtN=DO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kQCVN-0003JN-5Z
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 16:41:29 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c2fa8df-57b6-4a1c-86ec-49d4922ebccf;
 Wed, 07 Oct 2020 16:41:27 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aqtN=DO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kQCVN-0003JN-5Z
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 16:41:29 +0000
X-Inumbo-ID: 9c2fa8df-57b6-4a1c-86ec-49d4922ebccf
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9c2fa8df-57b6-4a1c-86ec-49d4922ebccf;
	Wed, 07 Oct 2020 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602088887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SKwPXZtdk1ObFlhzqhu0Cw1vgsS+IcJp46R21xnariM=;
  b=b+QLcn9X32j19DVc2XtTlXf6uJM7+nFAMxujgnxumGZrU+5Odfysc/Bs
   ayp08fvI3eY9sz7L1Ma1d3O62JbkbQa1eeR9ZV/UKKaaLiajPUlsZzIo1
   /sufTHkHpubeNs+WB8dZrGPMdI4HIVm3a7wixL1jO8sXfhhda5aVAenZX
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uo32Kg+112jpcabMTHrE6EdCxeX8qLnGWbJqKBHj6pM7d5CPsclwZS9R3bB8VcxuzHlJY7i1lj
 YuNgZpvbYuRHvKuv/Rl7tQSzsazFnMvfZ0i9l7iqPfoCCs+69ucpVbgxUCqnyXxFbRhZu8XcMO
 fI6ChVdJMyVXOb5kNMdRNHtd6rO3oI+V/qTlhLiY+OQ3hk/f7nQBQXF3qtOpIrZggyiy2t7Fv5
 jyR06tiAh352BPah4BgrgUUCbhGBMS9kqIo+/+j+g/lkHq+xPCK58whYdrNfVPuwmIGGffSkJN
 4k0=
X-SBRS: None
X-MesageID: 29532617
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,347,1596513600"; 
   d="scan'208";a="29532617"
Date: Wed, 7 Oct 2020 18:41:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH] x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL}
Message-ID: <20201007164117.GH19254@Air-de-Roger>
References: <20201006162327.93055-1-roger.pau@citrix.com>
 <a98d6cb1-0b1d-8fb8-8718-c65e02e448bb@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a98d6cb1-0b1d-8fb8-8718-c65e02e448bb@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Oct 07, 2020 at 01:06:08PM +0100, Andrew Cooper wrote:
> On 06/10/2020 17:23, Roger Pau Monne wrote:
> > Currently a PV hardware domain can also be given control over the CPU
> > frequency, and such guest is allowed to write to MSR_IA32_PERF_CTL.
> 
> This might be how the current logic "works", but its straight up broken.
> 
> PERF_CTL is thread scope, so unless dom0 is identity pinned and has one
> vcpu for every pcpu, it cannot use the interface correctly.

Selecting cpufreq=dom0-kernel will force vCPU pinning. I'm not able
however to see anywhere that would force dom0 vCPUs == pCPUs.

> > However since commit 322ec7c89f6 the default behavior has been changed
> > to reject accesses to not explicitly handled MSRs, preventing PV
> > guests that manage CPU frequency from reading
> > MSR_IA32_PERF_{STATUS/CTL}.
> >
> > Additionally some HVM guests (Windows at least) will attempt to read
> > MSR_IA32_PERF_CTL and will panic if given back a #GP fault:
> >
> > vmx.c:3035:d8v0 RDMSR 0x00000199 unimplemented
> > d8v0 VIRIDIAN CRASH: 3b c0000096 fffff806871c1651 ffffda0253683720 0
> >
> > Move the handling of MSR_IA32_PERF_{STATUS/CTL} to the common MSR
> > handling shared between HVM and PV guests, and add an explicit case
> > for reads to MSR_IA32_PERF_{STATUS/CTL}.
> 
> OTOH, PERF_CTL does have a seemingly architectural "please disable turbo
> for me" bit, which is supposed to be for calibration loops.  I wonder if
> anyone uses this, and whether we ought to honour it (probably not).

If we let guests play with this we would have to save/restore the
guest value on context switch. Unless there's a strong case for this,
I would say no.

> > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> > index d8ed83f869..41baa3b7a1 100644
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -1069,6 +1069,12 @@ extern enum cpufreq_controller {
> >      FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
> >  } cpufreq_controller;
> >  
> > +static inline bool is_cpufreq_controller(const struct domain *d)
> > +{
> > +    return ((cpufreq_controller == FREQCTL_dom0_kernel) &&
> > +            is_hardware_domain(d));
> 
> This won't compile on !CONFIG_X86, due to CONFIG_HAS_CPUFREQ

It does seem to build on Arm, because this is only used in x86 code:

https://gitlab.com/xen-project/people/royger/xen/-/jobs/778207412

The extern declaration of cpufreq_controller is just above, so if you
tried to use is_cpufreq_controller on Arm you would get a link time
error, otherwise it builds fine. The compiler removes the function on
Arm as it has the inline attribute and it's not used.

Alternatively I could look into moving cpufreq_controller (and
is_cpufreq_controller) out of sched.h into somewhere else, I haven't
looked at why it needs to live there.

> Honestly - I don't see any point to this code.  Its opt-in via the
> command line only, and doesn't provide adequate checks for enablement. 
> (It's not as if we're lacking complexity or moving parts when it comes
> to power/frequency management).

Right, I could do a pre-patch to remove this, but I also don't think
we should block this fix on removing FREQCTL_dom0_kernel, so I would
rather fix the regression and then remove the feature if we agree it
can be removed.

Thanks, Roger.

