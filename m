Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7116C54340C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 16:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343867.569484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nywyr-0007KU-KG; Wed, 08 Jun 2022 14:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343867.569484; Wed, 08 Jun 2022 14:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nywyq-00071R-Qa; Wed, 08 Jun 2022 14:48:20 +0000
Received: by outflank-mailman (input) for mailman id 343867;
 Wed, 08 Jun 2022 14:47:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OvtQ=WP=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1nywxz-0004T5-EI
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 14:47:32 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5376313-e739-11ec-b605-df0040e90b76;
 Wed, 08 Jun 2022 16:47:21 +0200 (CEST)
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nywwz-00ChW4-1y; Wed, 08 Jun 2022 14:46:25 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AC095302D9E;
 Wed,  8 Jun 2022 16:46:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id 598CC20C0FC8A; Wed,  8 Jun 2022 16:46:18 +0200 (CEST)
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
X-Inumbo-ID: e5376313-e739-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=y6I/0XZeW+SwdAeAR3t2m034incS08IQBnZfBcNKYzA=; b=pV/EkEgKRIpeKvq5HN3+CCEy73
	r8xSxfvRwX0Hp/RbmQEkGGqgtSQmt2V7wVKm/Dgh7gCxT8VN3Zd3ykv33oYJXDZhFrsOiZzgqwZwN
	mYfnoNbn4mkY4D0X7knpoC+PXyRY28u9ZWLLFNEC02wY4oKlFNPo5yScw7t5dA1Upkyps4KrRMpkG
	hdfHf70HVdGxmq1amZj2pji0fv+Uuwf5Bh2HdSJMzH66/m6rsKuia+FhR3TxjdKwxLuBcApt1D03J
	veIlHyJOTL69bf8GkRxQ0BEOGIuKD5pe0mKmy/Kj0wSR+O/rPyAwmL/tyBM+mm2nltdjhcArwd3n8
	F0v7I28w==;
Message-ID: <20220608144516.426117259@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 08 Jun 2022 16:27:31 +0200
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
Subject: [PATCH 08/36] cpuidle,psci: Push RCU-idle into driver
References: <20220608142723.103523089@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Doing RCU-idle outside the driver, only to then temporarily enable it
again, at least twice, before going idle is daft.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 drivers/cpuidle/cpuidle-psci.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -69,12 +69,12 @@ static int __psci_enter_domain_idle_stat
 		return -1;
 
 	/* Do runtime PM to manage a hierarchical CPU toplogy. */
-	rcu_irq_enter_irqson();
 	if (s2idle)
 		dev_pm_genpd_suspend(pd_dev);
 	else
 		pm_runtime_put_sync_suspend(pd_dev);
-	rcu_irq_exit_irqson();
+
+	rcu_idle_enter();
 
 	state = psci_get_domain_state();
 	if (!state)
@@ -82,12 +82,12 @@ static int __psci_enter_domain_idle_stat
 
 	ret = psci_cpu_suspend_enter(state) ? -1 : idx;
 
-	rcu_irq_enter_irqson();
+	rcu_idle_exit();
+
 	if (s2idle)
 		dev_pm_genpd_resume(pd_dev);
 	else
 		pm_runtime_get_sync(pd_dev);
-	rcu_irq_exit_irqson();
 
 	cpu_pm_exit();
 
@@ -240,6 +240,7 @@ static int psci_dt_cpu_init_topology(str
 	 * of a shared state for the domain, assumes the domain states are all
 	 * deeper states.
 	 */
+	drv->states[state_count - 1].flags |= CPUIDLE_FLAG_RCU_IDLE;
 	drv->states[state_count - 1].enter = psci_enter_domain_idle_state;
 	drv->states[state_count - 1].enter_s2idle = psci_enter_s2idle_domain_idle_state;
 	psci_cpuidle_use_cpuhp = true;



