Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C5944D4E6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 11:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224674.388104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml77x-0003uO-5g; Thu, 11 Nov 2021 10:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224674.388104; Thu, 11 Nov 2021 10:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml77x-0003s4-1r; Thu, 11 Nov 2021 10:16:17 +0000
Received: by outflank-mailman (input) for mailman id 224674;
 Thu, 11 Nov 2021 10:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cjuL=P6=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1ml77t-0003ry-Oq
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 10:16:14 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 602e6b1e-42d8-11ec-a9d2-d9f7a1cc8784;
 Thu, 11 Nov 2021 11:16:07 +0100 (CET)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml77c-002dpE-5J; Thu, 11 Nov 2021 10:15:56 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8CB023000D5;
 Thu, 11 Nov 2021 11:15:55 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 68AF32058B524; Thu, 11 Nov 2021 11:15:55 +0100 (CET)
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
X-Inumbo-ID: 602e6b1e-42d8-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N0BcSPFGzSCyBWMORaYXKwouKanFoncOz/nWIbFY1Bo=; b=gIOpju4qBpgWOkt2GFEPQfE4Pb
	aM85+enzcMzjR/qTkqjzYSDpRv2cnU2w6fMt+Yzu4CcleQ12VQoiG5fUVLtiO4abmlmyNWv0baLXk
	s+dQDjA1YKuqVnCwk2rlWRxGIDU9+E+MqHETXE5sZutXb1j/Wu6EchlyYAMBAANboNa43hr8RqIcK
	ZKcCOWLbk58UawqqeyhLWVmxclkQlVNQ3DBocQCOGFNy/bO0jaFSModKPZD/qhGaqdGjtfXeEy7GK
	U5lKqwUp94qK7ETYScxfCtrqyjhE3khE1j+qhL06N6luqgh7aerh8HbHqdWVIKmOkHFEgsj52wDTA
	KMwFEgTw==;
Date: Thu, 11 Nov 2021 11:15:55 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Josef Johansson <josef@oderland.se>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, jgross@suse.com
Subject: Re: [PATCH] x86/smp: Factor out parts of native_smp_prepare_cpus()
Message-ID: <YYztW7bytZdvZFbN@hirez.programming.kicks-ass.net>
References: <1635896196-18961-1-git-send-email-boris.ostrovsky@oracle.com>
 <6a7edbff-e255-661d-c68f-c07b7519e421@oderland.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a7edbff-e255-661d-c68f-c07b7519e421@oderland.se>

On Wed, Nov 10, 2021 at 10:52:09PM +0100, Josef Johansson wrote:
> On 11/3/21 00:36, Boris Ostrovsky wrote:
> > Commit 66558b730f25 ("sched: Add cluster scheduler level for x86")
> > introduced cpu_l2c_shared_map mask which is expected to be initialized
> > by smp_op.smp_prepare_cpus(). That commit only updated
> > native_smp_prepare_cpus() version but not xen_pv_smp_prepare_cpus().
> > As result Xen PV guests crash in set_cpu_sibling_map().
> >
> > While the new mask can be allocated in xen_pv_smp_prepare_cpus() one can
> > see that both versions of smp_prepare_cpus ops share a number of common
> > operations that can be factored out. So do that instead.
> >
> > Fixes: 66558b730f25 ("sched: Add cluster scheduler level for x86")
> > Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > ---
> >  arch/x86/include/asm/smp.h |  1 +
> >  arch/x86/kernel/smpboot.c  | 19 +++++++++++++------
> >  arch/x86/xen/smp_pv.c      | 11 ++---------
> >  3 files changed, 16 insertions(+), 15 deletions(-)
> >
> > diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> > index 08b0e90623ad..81a0211a372d 100644
> > --- a/arch/x86/include/asm/smp.h
> > +++ b/arch/x86/include/asm/smp.h
> > @@ -126,6 +126,7 @@ static inline void arch_send_call_function_ipi_mask(const struct cpumask *mask)
> >  
> >  void cpu_disable_common(void);
> >  void native_smp_prepare_boot_cpu(void);
> > +void smp_prepare_cpus_common(void);
> >  void native_smp_prepare_cpus(unsigned int max_cpus);
> >  void calculate_max_logical_packages(void);
> >  void native_smp_cpus_done(unsigned int max_cpus);
> > diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> > index 8241927addff..d7429198c22f 100644
> > --- a/arch/x86/kernel/smpboot.c
> > +++ b/arch/x86/kernel/smpboot.c
> > @@ -1350,12 +1350,7 @@ static void __init smp_get_logical_apicid(void)
> >  		cpu0_logical_apicid = GET_APIC_LOGICAL_ID(apic_read(APIC_LDR));
> >  }
> >  
> > -/*
> > - * Prepare for SMP bootup.
> > - * @max_cpus: configured maximum number of CPUs, It is a legacy parameter
> > - *            for common interface support.
> > - */
> > -void __init native_smp_prepare_cpus(unsigned int max_cpus)
> > +void __init smp_prepare_cpus_common(void)
> >  {
> >  	unsigned int i;
> Testing out this patch I got a warning that i is unused. Which it is,
> since for_each_possible_cpu(i) is removed.

Fixed. Can I add your Tested-by ?

