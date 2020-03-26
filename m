Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAFD193BD4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:28:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHOmF-0007LY-HJ; Thu, 26 Mar 2020 09:26:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RX0V=5L=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1jHOmD-0007L8-MN
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:26:13 +0000
X-Inumbo-ID: d28a29c6-6f43-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d28a29c6-6f43-11ea-b34e-bc764e2007e4;
 Thu, 26 Mar 2020 09:26:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 17520AF2C;
 Thu, 26 Mar 2020 09:26:07 +0000 (UTC)
From: Miroslav Benes <mbenes@suse.cz>
To: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 jpoimboe@redhat.com
Date: Thu, 26 Mar 2020 10:26:03 +0100
Message-Id: <20200326092603.7230-3-mbenes@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200326092603.7230-1-mbenes@suse.cz>
References: <20200326092603.7230-1-mbenes@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH v3 2/2] x86/xen: Make the secondary CPU idle
 tasks reliable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: andrew.cooper3@citrix.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 jbeulich@suse.com, live-patching@vger.kernel.org,
 xen-devel@lists.xenproject.org, Miroslav Benes <mbenes@suse.cz>,
 jslaby@suse.cz
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The unwinder reports the secondary CPU idle tasks' stack on XEN PV as
unreliable, which affects at least live patching.
cpu_initialize_context() sets up the context of the CPU through
VCPUOP_initialise hypercall. After it is woken up, the idle task starts
in cpu_bringup_and_idle() function and its stack starts at the offset
right below pt_regs. The unwinder correctly detects the end of stack
there but it is confused by NULL return address in the last frame.

Introduce a wrapper in assembly, which just calls
cpu_bringup_and_idle(). The return address is thus pushed on the stack
and the wrapper contains the annotation hint for the unwinder regarding
the stack state.

Signed-off-by: Miroslav Benes <mbenes@suse.cz>
---
 arch/x86/xen/smp_pv.c   |  3 ++-
 arch/x86/xen/xen-head.S | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index 802ee5bba66c..8fb8a50a28b4 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -53,6 +53,7 @@ static DEFINE_PER_CPU(struct xen_common_irq, xen_irq_work) = { .irq = -1 };
 static DEFINE_PER_CPU(struct xen_common_irq, xen_pmu_irq) = { .irq = -1 };
 
 static irqreturn_t xen_irq_work_interrupt(int irq, void *dev_id);
+void asm_cpu_bringup_and_idle(void);
 
 static void cpu_bringup(void)
 {
@@ -309,7 +310,7 @@ cpu_initialize_context(unsigned int cpu, struct task_struct *idle)
 	 * pointing just below where pt_regs would be if it were a normal
 	 * kernel entry.
 	 */
-	ctxt->user_regs.eip = (unsigned long)cpu_bringup_and_idle;
+	ctxt->user_regs.eip = (unsigned long)asm_cpu_bringup_and_idle;
 	ctxt->flags = VGCF_IN_KERNEL;
 	ctxt->user_regs.eflags = 0x1000; /* IOPL_RING1 */
 	ctxt->user_regs.ds = __USER_DS;
diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
index d63806e1ff7a..7d1c4fcbe8f7 100644
--- a/arch/x86/xen/xen-head.S
+++ b/arch/x86/xen/xen-head.S
@@ -58,6 +58,16 @@ SYM_CODE_START(startup_xen)
 	call xen_start_kernel
 SYM_CODE_END(startup_xen)
 	__FINIT
+
+#ifdef CONFIG_XEN_PV_SMP
+.pushsection .text
+SYM_CODE_START(asm_cpu_bringup_and_idle)
+	UNWIND_HINT_EMPTY
+
+	call cpu_bringup_and_idle
+SYM_CODE_END(asm_cpu_bringup_and_idle)
+.popsection
+#endif
 #endif
 
 .pushsection .text
-- 
2.25.1


