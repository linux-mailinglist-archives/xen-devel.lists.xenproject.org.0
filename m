Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F35543408
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 16:48:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343844.569372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nywyi-0004iR-3L; Wed, 08 Jun 2022 14:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343844.569372; Wed, 08 Jun 2022 14:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nywyh-0004gq-Ve; Wed, 08 Jun 2022 14:48:11 +0000
Received: by outflank-mailman (input) for mailman id 343844;
 Wed, 08 Jun 2022 14:47:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OvtQ=WP=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1nywxt-0004Sj-F2
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 14:47:23 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5a1a972-e739-11ec-bd2c-47488cf2e6aa;
 Wed, 08 Jun 2022 16:47:19 +0200 (CEST)
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nywx3-0066CL-0a; Wed, 08 Jun 2022 14:46:30 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A082F302E9A;
 Wed,  8 Jun 2022 16:46:23 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id 90A2620C10ED8; Wed,  8 Jun 2022 16:46:18 +0200 (CEST)
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
X-Inumbo-ID: e5a1a972-e739-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=rveYe0whW8HL+t/HGSaazkf4IJzq2XAc7vdeRKjh+gA=; b=nT18fRjmtv8PtOHNlSRz7z7OA3
	ocSKQvQMk90e4BYQ8FG72UOd1vXBcUYk3m24zX9nucFet4rZzw6IRnvpGNzErQ7vF6gmeSoA/I3hv
	UbyXINmvnZz3foLi4MgiuIC4OlBuTtckcjJAePYfIiJ2CqwvUU5HtHdW4N26hlwOmjLBkcG7LqG8Q
	BoJE3LoXRlBBcMZ7RvdkoEP2AdgziBJ305TMSdp+BvfA1B2vsf69NthlS94vm+wkGw/Vop/LGC4Dq
	IFK+3BYDKT97pJkb9/zTHujIgColQowacfqug2BBLzHPsqX11KJsuZ63kgKCy3HEu4aklD3cuhGeV
	CF8D6kbg==;
Message-ID: <20220608144517.313931267@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 08 Jun 2022 16:27:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Cc: rth@twiddle.net,
 ink@jurassic.park.msu.ru,
 mattst88@gmail.com,
 vgupta@kernel.org,
 linux@armlinux.org.uk,
 ulli.kroll@googlemail.com,
 linus.walleij@linaro.org,
 shawnguo@kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de,
 festevam@gmail.com,
 linux-imx@nxp.com,
 tony@atomide.com,
 khilman@kernel.org,
 catalin.marinas@arm.com,
 will@kernel.org,
 guoren@kernel.org,
 bcain@quicinc.com,
 chenhuacai@kernel.org,
 kernel@xen0n.name,
 geert@linux-m68k.org,
 sammy@sammy.net,
 monstr@monstr.eu,
 tsbogend@alpha.franken.de,
 dinguyen@kernel.org,
 jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi,
 shorne@gmail.com,
 James.Bottomley@HansenPartnership.com,
 deller@gmx.de,
 mpe@ellerman.id.au,
 benh@kernel.crashing.org,
 paulus@samba.org,
 paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 hca@linux.ibm.com,
 gor@linux.ibm.com,
 agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com,
 svens@linux.ibm.com,
 ysato@users.sourceforge.jp,
 dalias@libc.org,
 davem@davemloft.net,
 richard@nod.at,
 anton.ivanov@cambridgegreys.com,
 johannes@sipsolutions.net,
 tglx@linutronix.de,
 mingo@redhat.com,
 bp@alien8.de,
 dave.hansen@linux.intel.com,
 x86@kernel.org,
 hpa@zytor.com,
 acme@kernel.org,
 mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com,
 jolsa@kernel.org,
 namhyung@kernel.org,
 jgross@suse.com,
 srivatsa@csail.mit.edu,
 amakhalov@vmware.com,
 pv-drivers@vmware.com,
 boris.ostrovsky@oracle.com,
 chris@zankel.net,
 jcmvbkbc@gmail.com,
 rafael@kernel.org,
 lenb@kernel.org,
 pavel@ucw.cz,
 gregkh@linuxfoundation.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 daniel.lezcano@linaro.org,
 lpieralisi@kernel.org,
 sudeep.holla@arm.com,
 agross@kernel.org,
 bjorn.andersson@linaro.org,
 anup@brainfault.org,
 thierry.reding@gmail.com,
 jonathanh@nvidia.com,
 jacob.jun.pan@linux.intel.com,
 Arnd Bergmann <arnd@arndb.de>,
 yury.norov@gmail.com,
 andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk,
 rostedt@goodmis.org,
 pmladek@suse.com,
 senozhatsky@chromium.org,
 john.ogness@linutronix.de,
 paulmck@kernel.org,
 frederic@kernel.org,
 quic_neeraju@quicinc.com,
 josh@joshtriplett.org,
 mathieu.desnoyers@efficios.com,
 jiangshanlai@gmail.com,
 joel@joelfernandes.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 bsegall@google.com,
 mgorman@suse.de,
 bristot@redhat.com,
 vschneid@redhat.com,
 jpoimboe@kernel.org,
 linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org,
 linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org,
 linux-perf-users@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org,
 linux-xtensa@linux-xtensa.org,
 linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org,
 linux-arch@vger.kernel.org,
 rcu@vger.kernel.org
Subject: [PATCH 22/36] arm,smp: Remove trace_.*_rcuidle() usage
References: <20220608142723.103523089@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

None of these functions should ever be ran with RCU disabled anymore.

Specifically, do_handle_IPI() is only called from handle_IPI() which
explicitly does irq_enter()/irq_exit() which ensures RCU is watching.

The problem with smp_cross_call() was, per commit 7c64cc0531fa ("arm: Use
_rcuidle for smp_cross_call() tracepoints"), that
cpuidle_enter_state_coupled() already had RCU disabled, but that's
long been fixed by commit 1098582a0f6c ("sched,idle,rcu: Push rcu_idle
deeper into the idle path").

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/arm/kernel/smp.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -639,7 +639,7 @@ static void do_handle_IPI(int ipinr)
 	unsigned int cpu = smp_processor_id();
 
 	if ((unsigned)ipinr < NR_IPI)
-		trace_ipi_entry_rcuidle(ipi_types[ipinr]);
+		trace_ipi_entry(ipi_types[ipinr]);
 
 	switch (ipinr) {
 	case IPI_WAKEUP:
@@ -686,7 +686,7 @@ static void do_handle_IPI(int ipinr)
 	}
 
 	if ((unsigned)ipinr < NR_IPI)
-		trace_ipi_exit_rcuidle(ipi_types[ipinr]);
+		trace_ipi_exit(ipi_types[ipinr]);
 }
 
 /* Legacy version, should go away once all irqchips have been converted */
@@ -709,7 +709,7 @@ static irqreturn_t ipi_handler(int irq,
 
 static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
 {
-	trace_ipi_raise_rcuidle(target, ipi_types[ipinr]);
+	trace_ipi_raise(target, ipi_types[ipinr]);
 	__ipi_send_mask(ipi_desc[ipinr], target);
 }
 



