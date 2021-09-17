Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E91D040F348
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 09:29:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189024.338485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR8Jd-0007XP-FU; Fri, 17 Sep 2021 07:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189024.338485; Fri, 17 Sep 2021 07:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR8Jd-0007UO-CF; Fri, 17 Sep 2021 07:29:45 +0000
Received: by outflank-mailman (input) for mailman id 189024;
 Fri, 17 Sep 2021 07:29:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=82tu=OH=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1mR8Jb-0007UC-9F
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 07:29:43 +0000
Received: from desiato.infradead.org (unknown
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73375631-c64d-4f40-a014-5d4236266216;
 Fri, 17 Sep 2021 07:29:40 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR8Ig-003p42-0g; Fri, 17 Sep 2021 07:28:46 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 64E5430031A;
 Fri, 17 Sep 2021 09:28:42 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id EBC3F2B27F98D; Fri, 17 Sep 2021 09:28:41 +0200 (CEST)
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
X-Inumbo-ID: 73375631-c64d-4f40-a014-5d4236266216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=17mkqfuKdfnPg9YSAeGWHc/O4GLOFEnsaFTJ4hUb1Qc=; b=R175PzEhjMPDTuiig9T+/8FvBN
	wCwITbQjI86keC2UZcKL3oHklcXqScPxlhfsprjzgtQHXNUwlN8OYqdLQ7ztxGmPqLPGGL1HvK5TW
	8un1CwadAtDZMXP8kHm7KJ60CKQlzq6kBsXmSOCidcFaqUG49FGQ/Q91WQSCSzrudnHUpN1n/dtAK
	3oCiHTPea1eYl35kiZcqB3afHwTSqwkSRYpje8CyTQKsMtTXOUjDfhQXOeCpbGDLw3jXUuiLQwU+o
	fpmbPjE5lGD64IJe7KimQfKhdgCV7/TWkKj798HvtN0fT0soP/DzPI91f4RdvEreoDEx02Cp2qq0O
	NM1LgiIg==;
Date: Fri, 17 Sep 2021 09:28:41 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	Artem Kashkanov <artem.kashkanov@intel.com>,
	Like Xu <like.xu.linux@gmail.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH v2 00/13] perf: KVM: Fix, optimize, and clean up callbacks
Message-ID: <YURDqVZ1UXKCiKPV@hirez.programming.kicks-ass.net>
References: <20210828003558.713983-1-seanjc@google.com>
 <20210828201336.GD4353@worktop.programming.kicks-ass.net>
 <YUO5J/jTMa2KGbsq@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUO5J/jTMa2KGbsq@google.com>

On Thu, Sep 16, 2021 at 09:37:43PM +0000, Sean Christopherson wrote:
> On Sat, Aug 28, 2021, Peter Zijlstra wrote:

> Argh, sorry, I somehow managed to miss all of your replies.  I'll get back to
> this series next week.  Thanks for the quick response!
> 
> > Lets keep the whole intel_pt crud inside x86...
> 
> In theory, I like the idea of burying intel_pt inside x86 (and even in
> Intel+VMX code for the most part), but the actual implementation is a
> bit gross.  Because of the whole "KVM can be a module" thing,

ARGH!! we should really fix that. I've heard other archs have made much
better choices here.

> either
> the static call and __static_call_return0 would need to be exported,
> or a new register/unregister pair would have to be exported.

So I don't mind exporting __static_call_return0, but exporting a raw
static_call is much like exporting a function pointer :/

> The unregister path would also need its own synchronize_rcu().  In general, I
> don't love duplicating the logic, but it's not the end of the world.
> 
> Either way works for me.  Paolo or Peter, do either of you have a preference?

Can we de-feature kvm as a module and only have this PT functionality
when built-in? :-)


> > ---
> > Index: linux-2.6/arch/x86/events/core.c
> > ===================================================================
> > --- linux-2.6.orig/arch/x86/events/core.c
> > +++ linux-2.6/arch/x86/events/core.c
> > @@ -92,7 +92,7 @@ DEFINE_STATIC_CALL_RET0(x86_pmu_guest_ge
> >  
> >  DEFINE_STATIC_CALL_RET0(x86_guest_state, *(perf_guest_cbs->state));
> >  DEFINE_STATIC_CALL_RET0(x86_guest_get_ip, *(perf_guest_cbs->get_ip));
> > -DEFINE_STATIC_CALL_RET0(x86_guest_handle_intel_pt_intr, *(perf_guest_cbs->handle_intel_pt_intr));
> > +DEFINE_STATIC_CALL_RET0(x86_guest_handle_intel_pt_intr, unsigned int (*)(void));
> 
> FWIW, the param needs to be a raw function, not a function pointer. 

Yeah, I keep making that mistake.. and I wrote the bloody thing :/

I have a 'fix' for that, but I need to finish that and also flag-day
change :-(

  https://lkml.kernel.org/r/YS+0eIeAJsRRArk4@hirez.programming.kicks-ass.net

