Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2ED5433F8
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 16:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343845.569379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nywyi-0004mO-E4; Wed, 08 Jun 2022 14:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343845.569379; Wed, 08 Jun 2022 14:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nywyi-0004iu-7q; Wed, 08 Jun 2022 14:48:12 +0000
Received: by outflank-mailman (input) for mailman id 343845;
 Wed, 08 Jun 2022 14:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OvtQ=WP=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1nywxv-0004Sj-RG
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 14:47:23 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4a60525-e739-11ec-bd2c-47488cf2e6aa;
 Wed, 08 Jun 2022 16:47:19 +0200 (CEST)
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nywx3-0066CV-M7; Wed, 08 Jun 2022 14:46:30 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C2880302F13;
 Wed,  8 Jun 2022 16:46:23 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id A2E5D20C119A0; Wed,  8 Jun 2022 16:46:18 +0200 (CEST)
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
X-Inumbo-ID: e4a60525-e739-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=o5HILV8lXWZVR34kQkfXu7ELtM3PHvDf12JWqGFz8as=; b=FdF0WwTfqAD0qSj5IztZ4sLhvT
	k5gLeMLjDAi8AiG+FPGxmqabFeIQHQCNOTIfhG/cpcbGLZPNynYxoEOkV1KR6W1cM26gk09NcMOho
	OTH5ruv6nF9XsgSF9ERM0tY+ijfUIOhLwICgBWU3v/b6jxNumek114l8uiB/Ho+YCAnkYFEEtHFA1
	yJwPilsqg79N5SwaSL+a8z3EFTRK0XJDDbWj1Ixr9OQeIT2Fab/9sy2Cr+siozN3wTiG232WtGG/1
	MiOLZNXIY/fnByd71PGk1LDgy98zbKguCtDMF+RXQCVcyn0bJrc/NWlQckEgt24lFU5RTP60t+1Fw
	I4HHiDAQ==;
Message-ID: <20220608144517.570101266@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 08 Jun 2022 16:27:49 +0200
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
Subject: [PATCH 26/36] cpuidle,sched: Remove annotations from TIF_{POLLING_NRFLAG,NEED_RESCHED}
References: <20220608142723.103523089@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

vmlinux.o: warning: objtool: mwait_idle+0x5: call to current_set_polling_and_test() leaves .noinstr.text section
vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0xc5: call to current_set_polling_and_test() leaves .noinstr.text section
vmlinux.o: warning: objtool: cpu_idle_poll.isra.0+0x73: call to test_ti_thread_flag() leaves .noinstr.text section
vmlinux.o: warning: objtool: intel_idle+0xbc: call to current_set_polling_and_test() leaves .noinstr.text section
vmlinux.o: warning: objtool: intel_idle_irq+0xea: call to current_set_polling_and_test() leaves .noinstr.text section
vmlinux.o: warning: objtool: intel_idle_s2idle+0xb4: call to current_set_polling_and_test() leaves .noinstr.text section

vmlinux.o: warning: objtool: intel_idle+0xa6: call to current_clr_polling() leaves .noinstr.text section
vmlinux.o: warning: objtool: intel_idle_irq+0xbf: call to current_clr_polling() leaves .noinstr.text section
vmlinux.o: warning: objtool: intel_idle_s2idle+0xa1: call to current_clr_polling() leaves .noinstr.text section

vmlinux.o: warning: objtool: mwait_idle+0xe: call to __current_set_polling() leaves .noinstr.text section
vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0xc5: call to __current_set_polling() leaves .noinstr.text section
vmlinux.o: warning: objtool: cpu_idle_poll.isra.0+0x73: call to test_ti_thread_flag() leaves .noinstr.text section
vmlinux.o: warning: objtool: intel_idle+0xbc: call to __current_set_polling() leaves .noinstr.text section
vmlinux.o: warning: objtool: intel_idle_irq+0xea: call to __current_set_polling() leaves .noinstr.text section
vmlinux.o: warning: objtool: intel_idle_s2idle+0xb4: call to __current_set_polling() leaves .noinstr.text section

vmlinux.o: warning: objtool: cpu_idle_poll.isra.0+0x73: call to test_ti_thread_flag() leaves .noinstr.text section
vmlinux.o: warning: objtool: intel_idle_s2idle+0x73: call to test_ti_thread_flag.constprop.0() leaves .noinstr.text section
vmlinux.o: warning: objtool: intel_idle_irq+0x91: call to test_ti_thread_flag.constprop.0() leaves .noinstr.text section
vmlinux.o: warning: objtool: intel_idle+0x78: call to test_ti_thread_flag.constprop.0() leaves .noinstr.text section
vmlinux.o: warning: objtool: acpi_safe_halt+0xf: call to test_ti_thread_flag.constprop.0() leaves .noinstr.text section

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/sched/idle.h  |   40 ++++++++++++++++++++++++++++++----------
 include/linux/thread_info.h |   18 +++++++++++++++++-
 2 files changed, 47 insertions(+), 11 deletions(-)

--- a/include/linux/sched/idle.h
+++ b/include/linux/sched/idle.h
@@ -23,12 +23,37 @@ static inline void wake_up_if_idle(int c
  */
 #ifdef TIF_POLLING_NRFLAG
 
-static inline void __current_set_polling(void)
+#ifdef _ASM_GENERIC_BITOPS_INSTRUMENTED_ATOMIC_H
+
+static __always_inline void __current_set_polling(void)
 {
-	set_thread_flag(TIF_POLLING_NRFLAG);
+	arch_set_bit(TIF_POLLING_NRFLAG,
+		     (unsigned long *)(&current_thread_info()->flags));
 }
 
-static inline bool __must_check current_set_polling_and_test(void)
+static __always_inline void __current_clr_polling(void)
+{
+	arch_clear_bit(TIF_POLLING_NRFLAG,
+		       (unsigned long *)(&current_thread_info()->flags));
+}
+
+#else
+
+static __always_inline void __current_set_polling(void)
+{
+	set_bit(TIF_POLLING_NRFLAG,
+		(unsigned long *)(&current_thread_info()->flags));
+}
+
+static __always_inline void __current_clr_polling(void)
+{
+	clear_bit(TIF_POLLING_NRFLAG,
+		  (unsigned long *)(&current_thread_info()->flags));
+}
+
+#endif /* _ASM_GENERIC_BITOPS_INSTRUMENTED_ATOMIC_H */
+
+static __always_inline bool __must_check current_set_polling_and_test(void)
 {
 	__current_set_polling();
 
@@ -41,12 +66,7 @@ static inline bool __must_check current_
 	return unlikely(tif_need_resched());
 }
 
-static inline void __current_clr_polling(void)
-{
-	clear_thread_flag(TIF_POLLING_NRFLAG);
-}
-
-static inline bool __must_check current_clr_polling_and_test(void)
+static __always_inline bool __must_check current_clr_polling_and_test(void)
 {
 	__current_clr_polling();
 
@@ -73,7 +93,7 @@ static inline bool __must_check current_
 }
 #endif
 
-static inline void current_clr_polling(void)
+static __always_inline void current_clr_polling(void)
 {
 	__current_clr_polling();
 
--- a/include/linux/thread_info.h
+++ b/include/linux/thread_info.h
@@ -177,7 +177,23 @@ static __always_inline unsigned long rea
 	clear_ti_thread_flag(task_thread_info(t), TIF_##fl)
 #endif /* !CONFIG_GENERIC_ENTRY */
 
-#define tif_need_resched() test_thread_flag(TIF_NEED_RESCHED)
+#ifdef _ASM_GENERIC_BITOPS_INSTRUMENTED_NON_ATOMIC_H
+
+static __always_inline bool tif_need_resched(void)
+{
+	return arch_test_bit(TIF_NEED_RESCHED,
+			     (unsigned long *)(&current_thread_info()->flags));
+}
+
+#else
+
+static __always_inline bool tif_need_resched(void)
+{
+	return test_bit(TIF_NEED_RESCHED,
+			(unsigned long *)(&current_thread_info()->flags));
+}
+
+#endif /* _ASM_GENERIC_BITOPS_INSTRUMENTED_NON_ATOMIC_H */
 
 #ifndef CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES
 static inline int arch_within_stack_frames(const void * const stack,



