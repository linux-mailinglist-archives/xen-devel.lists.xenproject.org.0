Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A5854C08A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 06:06:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349503.575789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1KHw-0000G7-Ji; Wed, 15 Jun 2022 04:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349503.575789; Wed, 15 Jun 2022 04:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1KHv-0008Oe-ON; Wed, 15 Jun 2022 04:05:51 +0000
Received: by outflank-mailman (input) for mailman id 349503;
 Wed, 15 Jun 2022 00:44:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jzGX=WW=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 1o1H8q-0007mj-Dh
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 00:44:16 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 478cd092-ec44-11ec-9917-058037db3bb5;
 Wed, 15 Jun 2022 02:44:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 02329B81A43;
 Wed, 15 Jun 2022 00:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6D3C3411F;
 Wed, 15 Jun 2022 00:44:12 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 327DD5C0BCC; Tue, 14 Jun 2022 17:44:12 -0700 (PDT)
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
X-Inumbo-ID: 478cd092-ec44-11ec-9917-058037db3bb5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655253852;
	bh=rcjBHcwDa3Vvz9ae34yYid9fcwgrK1WVNSLCfZ/KP5E=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=fdhcRapfOZeMu89rXN1F9+PFgQBw1jq2TFCvdWilZKBPl7d60xoaf+Z1BoVI71oyo
	 RqJwT7IyOmWKrdq1gGthk/wr5qRLVQoB8lFuH3bhpG8v28ehqFht7ixYYEHPsMm9AB
	 B8Nl92yiOr67Th9tcRyEPi0fRLrSpOhoRzoC/T6UuHa5X12CLk5h++1bfLpyoCHqB+
	 fvK77b4d+EdbOzzr1aIJ1u6gTHC44L8QS8SaSAp9SKbflwgVl3VgsZCvB9XatY8lhL
	 9YwdPZU6iL7l0pnNRdqWmeOhCsfxrQ+i6D2NKXEGZhl5QpSSUjx5BoIk0tcHaLBiwv
	 bedv5BuhTNO6Q==
Date: Tue, 14 Jun 2022 17:44:12 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
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
	shorne@gmail.com, James.Bottomley@HansenPartnership.com,
	deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
	paulus@samba.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, hca@linux.ibm.com, gor@linux.ibm.com,
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
	svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
	davem@davemloft.net, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	acme@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	namhyung@kernel.org, jgross@suse.com, srivatsa@csail.mit.edu,
	amakhalov@vmware.com, pv-drivers@vmware.com,
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
	frederic@kernel.org, quic_neeraju@quicinc.com,
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
Subject: Re: [PATCH 16/36] rcu: Fix rcu_idle_exit()
Message-ID: <20220615004412.GA5766@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220608142723.103523089@infradead.org>
 <20220608144516.935970247@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608144516.935970247@infradead.org>

On Wed, Jun 08, 2022 at 04:27:39PM +0200, Peter Zijlstra wrote:
> Current rcu_idle_exit() is terminally broken because it uses
> local_irq_{save,restore}(), which are traced which uses RCU.
> 
> However, now that all the callers are sure to have IRQs disabled, we
> can remove these calls.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Acked-by: Paul E. McKenney <paulmck@kernel.org>

We have some fun conflicts between this series and Frederic's context-tracking
series.  But it looks like these can be resolved by:

1.	A patch on top of Frederic's series that provides the old rcu_*()
	names for the functions now prefixed with ct_*() such as
	ct_idle_exit().

2.	Another patch on top of Frederic's series that takes the
	changes remaining from this patch, shown below.  Frederic's
	series uses raw_local_irq_save() and raw_local_irq_restore(),
	which can then be removed.

Or is there a better way to do this?

							Thanx, Paul

------------------------------------------------------------------------

commit f64cee8c159e9863a74594efe3d33fb513a6a7b5
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Tue Jun 14 17:24:43 2022 -0700

    context_tracking: Interrupts always disabled for ct_idle_exit()
    
    Now that the idle-loop cleanups have ensured that rcu_idle_exit() is
    always invoked with interrupts disabled, remove the interrupt disabling
    in favor of a debug check.
    
    Signed-off-by: Peter Zijlstra <peterz@infradead.org>
    Cc: Frederic Weisbecker <frederic@kernel.org>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
index 1da44803fd319..99310cf5b0254 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -332,11 +332,8 @@ EXPORT_SYMBOL_GPL(ct_idle_enter);
  */
 void noinstr ct_idle_exit(void)
 {
-	unsigned long flags;
-
-	raw_local_irq_save(flags);
+	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !raw_irqs_disabled());
 	ct_kernel_enter(false, RCU_DYNTICKS_IDX - CONTEXT_IDLE);
-	raw_local_irq_restore(flags);
 }
 EXPORT_SYMBOL_GPL(ct_idle_exit);
 

