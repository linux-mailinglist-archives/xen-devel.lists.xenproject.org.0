Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7091054C086
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 06:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349291.575774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1KHu-0008Fa-4N; Wed, 15 Jun 2022 04:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349291.575774; Wed, 15 Jun 2022 04:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1KHt-0007w5-CG; Wed, 15 Jun 2022 04:05:49 +0000
Received: by outflank-mailman (input) for mailman id 349291;
 Tue, 14 Jun 2022 16:59:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TaZI=WV=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1o19t3-00017F-Cj
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 16:59:29 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c2ad397-ec03-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 18:59:05 +0200 (CEST)
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o19s9-007ufs-GM; Tue, 14 Jun 2022 16:58:34 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 033FF300483;
 Tue, 14 Jun 2022 18:58:31 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id DD55D28B48D58; Tue, 14 Jun 2022 18:58:30 +0200 (CEST)
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
X-Inumbo-ID: 4c2ad397-ec03-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sat3Ay5cLjo4d6tU+VjO2Gj4xa+yot4RzgDwqSc2j00=; b=oTTvzdrlzuM1YciKvYSz8vYCZ+
	uwlSmBHlK5sxDBJV0dcMNalrGhrnqgMOKyXUZ+NoLLlhXJyR0fgCg0Vd7w7YR39O4rmwupvVnnt7z
	Pv2IpKHqOd9e1zUBiLabpdWMpnntVJGaogImROtBH0G7ylxF+ZmLkVrbSd96L8Hy9XgyJ+fsvwu03
	MqdSZ0j3kwhR1jLAqEDq0pTMC9nvW7cYm2jiZab7OmZmrpb4+NKhzLJEVNFsIG3fWTmbi5xOWvkSk
	63UMys0mwfZRWEzmZMP+o/065ihcNnT8/M/jWgxXAG4XceJ1zUAKP/sWTfpGygRyzdDuXmNAR06ut
	6gQsA8sw==;
Date: Tue, 14 Jun 2022 18:58:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
	vgupta@kernel.org, linux@armlinux.org.uk, ulli.kroll@googlemail.com,
	linus.walleij@linaro.org, shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, tony@atomide.com,
	khilman@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	guoren@kernel.org, bcain@quicinc.com, chenhuacai@kernel.org,
	kernel@xen0n.name, geert@linux-m68k.org, sammy@sammy.net,
	monstr@monstr.eu, tsbogend@alpha.franken.de, dinguyen@kernel.org,
	jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com, James.Bottomley@hansenpartnership.com,
	deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
	paulus@samba.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, hca@linux.ibm.com, gor@linux.ibm.com,
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
	svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
	davem@davemloft.net, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	acme@kernel.org, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, namhyung@kernel.org, jgross@suse.com,
	srivatsa@csail.mit.edu, amakhalov@vmware.com, pv-drivers@vmware.com,
	boris.ostrovsky@oracle.com, chris@zankel.net, jcmvbkbc@gmail.com,
	rafael@kernel.org, lenb@kernel.org, pavel@ucw.cz,
	gregkh@linuxfoundation.org, mturquette@baylibre.com,
	sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org,
	sudeep.holla@arm.com, agross@kernel.org, bjorn.andersson@linaro.org,
	anup@brainfault.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
	yury.norov@gmail.com, andriy.shevchenko@linux.intel.com,
	linux@rasmusvillemoes.dk, rostedt@goodmis.org, pmladek@suse.com,
	senozhatsky@chromium.org, john.ogness@linutronix.de,
	paulmck@kernel.org, frederic@kernel.org, quic_neeraju@quicinc.com,
	josh@joshtriplett.org, mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com, joel@joelfernandes.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, jpoimboe@kernel.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-perf-users@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-arch@vger.kernel.org,
	rcu@vger.kernel.org
Subject: Re: [PATCH 00/36] cpuidle,rcu: Cleanup the mess
Message-ID: <Yqi+Nqz1J8wI5GcX@hirez.programming.kicks-ass.net>
References: <20220608142723.103523089@infradead.org>
 <YqhuwQjmZyOVSiLI@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqhuwQjmZyOVSiLI@FVFF77S0Q05N>

On Tue, Jun 14, 2022 at 12:19:29PM +0100, Mark Rutland wrote:
> On Wed, Jun 08, 2022 at 04:27:23PM +0200, Peter Zijlstra wrote:
> > Hi All! (omg so many)
> 
> Hi Peter,
> 
> Sorry for the delay; my plate has also been rather full recently. I'm beginning
> to page this in now.

No worries; we all have too much to do ;-)

> > These here few patches mostly clear out the utter mess that is cpuidle vs rcuidle.
> > 
> > At the end of the ride there's only 2 real RCU_NONIDLE() users left
> > 
> >   arch/arm64/kernel/suspend.c:            RCU_NONIDLE(__cpu_suspend_exit());
> >   drivers/perf/arm_pmu.c:                 RCU_NONIDLE(armpmu_start(event, PERF_EF_RELOAD));
> 
> The latter of these is necessary because apparently PM notifiers are called
> with RCU not watching. Is that still the case today (or at the end of this
> series)? If so, that feels like fertile land for more issues (yaey...). If not,
> we should be able to drop this.

That should be fixed; fingers crossed :-)

> >   kernel/cfi.c:   RCU_NONIDLE({
> > 
> > (the CFI one is likely dead in the kCFI rewrite) and there's only a hand full
> > of trace_.*_rcuidle() left:
> > 
> >   kernel/trace/trace_preemptirq.c:                        trace_irq_enable_rcuidle(CALLER_ADDR0, CALLER_ADDR1);
> >   kernel/trace/trace_preemptirq.c:                        trace_irq_disable_rcuidle(CALLER_ADDR0, CALLER_ADDR1);
> >   kernel/trace/trace_preemptirq.c:                        trace_irq_enable_rcuidle(CALLER_ADDR0, caller_addr);
> >   kernel/trace/trace_preemptirq.c:                        trace_irq_disable_rcuidle(CALLER_ADDR0, caller_addr);
> >   kernel/trace/trace_preemptirq.c:                trace_preempt_enable_rcuidle(a0, a1);
> >   kernel/trace/trace_preemptirq.c:                trace_preempt_disable_rcuidle(a0, a1);
> > 
> > All of them are in 'deprecated' code that is unused for GENERIC_ENTRY.
> 
> I think those are also unused on arm64 too?
> 
> If not, I can go attack that.

My grep spots:

arch/arm64/kernel/entry-common.c:               trace_hardirqs_on();
arch/arm64/include/asm/daifflags.h:     trace_hardirqs_off();
arch/arm64/include/asm/daifflags.h:             trace_hardirqs_off();

The _on thing should be replaced with something like:

	trace_hardirqs_on_prepare();
	lockdep_hardirqs_on_prepare();
	instrumentation_end();
	rcu_irq_exit();
	lockdep_hardirqs_on(CALLER_ADDR0);

(as I think you know, since you have some of that already). And
something similar for the _off thing, but with _off_finish().

> > I've touched a _lot_ of code that I can't test and likely broken some of it :/
> > In particular, the whole ARM cpuidle stuff was quite involved with OMAP being
> > the absolute 'winner'.
> > 
> > I'm hoping Mark can help me sort the remaining ARM64 bits as he moves that to
> > GENERIC_ENTRY.
> 
> Moving to GENERIC_ENTRY as a whole is going to take a tonne of work
> (refactoring both arm64 and the generic portion to be more amenable to each
> other), but we can certainly move closer to that for the bits that matter here.

I know ... been there etc.. :-)

> Maybe we want a STRICT_ENTRY option to get rid of all the deprecated stuff that
> we can select regardless of GENERIC_ENTRY to make that easier.

Possible yeah.

> > I've also got a note that says ARM64 can probably do a WFE based
> > idle state and employ TIF_POLLING_NRFLAG to avoid some IPIs.
> 
> Possibly; I'm not sure how much of a win that'll be given that by default we'll
> have a ~10KHz WFE wakeup from the timer, but we could take a peek.

Ohh.. I didn't know it woke up *that* often. I just know Will made use
of it in things like smp_cond_load_relaxed() which would be somewhat
similar to a very shallow idle state that looks at the TIF word.

