Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D281A4B511D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271731.466441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3r-0003Yk-7x; Mon, 14 Feb 2022 13:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271731.466441; Mon, 14 Feb 2022 13:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3q-0003FZ-JL; Mon, 14 Feb 2022 13:06:34 +0000
Received: by outflank-mailman (input) for mailman id 271731;
 Mon, 14 Feb 2022 13:06:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb38-0008IH-Mh
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:50 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3c4e5f6-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:05:49 +0100 (CET)
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
X-Inumbo-ID: d3c4e5f6-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=1inRFtu44sj2FbmOrmiHpNybEEC6ccoHhKdjBehHxfA=;
  b=EQIVzqD8N8DjsM7KCw7d1bcdufAa+IKfggxH2Xf3RKSm9cwuj+FrPl6q
   6iMCWgoOElO6lcQtnMrs9Faa2StsGojcQiiVenDeIHkt+wJZLNuiVQgO1
   svGu0bEyiaks7xf7hZCNH8flborxkdkKJNfwT+pojRydwTSwOs2Rl2qL8
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8IUVSPeiRFZz83MSk0IJGHorStZHdFjdSElCrSoUa8Hl/9CwbUlVIF6FmSEIoHxfUUUD5/PVjI
 SLN86+5RLAVveE4g0QGIaglQm9kyG75cZkKAxmSJGkMWFsKm6lWfSBWgdVpZkbtcTBn1HJ/a2n
 wvsSAxuwNIulKX7b+C+j0mBB397Ih+VITXxr4CojUMVv5X5x+DMbpX/Iz00607j+fSnJphbxHL
 L/QLFX+Bfrvh8WpTE9Te09+5nKoEcfvz3+dX6cv1rPt82rwtPaMOi+JicD0m5wIBYMvVOaJhY0
 wvkHi2QCEBGMyJpZ2+DYp8U6
X-SBRS: 5.1
X-MesageID: 66374885
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KmOZM6588DpZukW6csGsAgxRtCHAchMFZxGqfqrLsTDasY5as4F+v
 jcaC2mDP/vcM2v8et8ka4jloU4Bu5Pcmt4wTQo9qywzHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj29Iw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 s9A9rb3eAcTMKjDiMYaUEhUIh1uBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQ62BO
 5pJNFKDajyZRSFiNF4QLqg9s8KtjWnteBRE9l6a8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvGtJk6TePisKQw2RvKmzJVWEZ+uUaHTeeRrFSzGPgYG
 kwu9C8hvYo19x2nf+XtZkjtyJKbhSI0V91VGuw8zQiCzKvI/gqUblQ5oi59hM8O75FvG2Fzv
 rOdt5awXGE07uXJIZ6I3urM9VuP1T4pwXjujMPuZS8M+JHdrY46lXojpf4zQffu3rUZ9dwdq
 g1mTRTSZZ1O16bnNI3hpDgrZg5AQbCTEGYICv3/BD7N0++ATNfNi3aUwVba9+1cC42SU0OMu
 nMJ8+DHsrxSUsHdyXHVGb5XdF1M2xpiGGeC6WOD4rF7r2j9k5JdVdw4DM5CyLdBbZ9fJG6Bj
 L77sgJN/p5DVEZGnocsC79d//8ClPC6ffy8D6i8RoMXPvBZKV/WlAkzNBX49z28zyARfVQXZ
 M7znTCEVi1BV8yKDVOeGo8g7FPc7n5ilD2DHcihl3xKE9O2PRaodFvMC3PWBshR0U9OiFyKm
 zqGH8fVmRhZTsPkZSzbrdwaIVwQdCBpDpHqsc1HMOWEJ1M+Sm0mDvbQx5InepBkwPsJxruZo
 CnlVx8K0kf7iF3GNR6ONiJpZoTwUMsttnk8JyEtYwqlgiBxfYa14a4DXJIrZr17pvd7xPt5Q
 qBdKcWNC/hCUBrd/DEZYcWvpYBubk3z1wmPIzCkcH40eJs5H17F/drtfw3O8igSD3Xo6Zti8
 uP4jg6CGMgNXQVvCsrSecmD9VLpsChPgv92UmvJPsJXJBfm/r91JnGjlfQwOcwNd0nOn2PIy
 waMDB4EjuDRuItposLRjKWJoor1QetzGk1WQzvS4bqsbHSI+2OixclLUfqSfCCbX2Txof3wa
 eJQxvD6EfsGgFcV7NYsT+c1lfozt4n1urtX7gV4B3GaPV2kB4RpLmSCwcQS5LZGwaVUuFfuV
 0+CkjWA1W5l5C8x/IYtGTcY
IronPort-HdrOrdr: A9a23:ou0Nl6hTl85HVVmm6S3OW8D4GXBQXt4ji2hC6mlwRA09TySZ//
 rOoB17726NtN9/YgBCpTntAsa9qDbnhPpICOoqTM6ftWvdyQmVxehZhOOIqVCNJ8S9zJ876U
 4JSdkZNDSaNzhHZKjBjjVQa+xQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="66374885"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 59/70] x86/bugframe: CFI hardening
Date: Mon, 14 Feb 2022 12:51:16 +0000
Message-ID: <20220214125127.17985-60-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

run_in_exception_handler() managed to escape typechecking, as the compiler
can't see where function pointer gets called.  After adding some ad-hoc
typechecking, it turns out that dump_execution_state() alone differs in
const-ness from the other users of run_in_exception_handler().

Introduce a new show_execution_state_nonconst() to make the typechecking
happy.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/include/asm/bug.h       | 10 +++++++++-
 xen/arch/x86/include/asm/processor.h |  4 +++-
 xen/arch/x86/traps.c                 |  5 +++++
 xen/common/keyhandler.c              |  4 ++--
 xen/drivers/char/ehci-dbgp.c         |  2 +-
 xen/drivers/char/ns16550.c           |  2 +-
 xen/include/xen/lib.h                |  2 +-
 7 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/bug.h b/xen/arch/x86/include/asm/bug.h
index 9bb4a194202f..b7265bdfbe33 100644
--- a/xen/arch/x86/include/asm/bug.h
+++ b/xen/arch/x86/include/asm/bug.h
@@ -65,7 +65,15 @@ struct bug_frame {
     unreachable();                                              \
 } while (0)
 
-#define run_in_exception_handler(fn) BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL)
+/*
+ * TODO: untangle header dependences, break BUILD_BUG_ON() out of xen/lib.h,
+ * and use a real static inline here to get proper type checking of fn().
+ */
+#define run_in_exception_handler(fn)                            \
+    do {                                                        \
+        (void)((fn) == (void (*)(struct cpu_user_regs *))NULL); \
+        BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);             \
+    } while ( 0 )
 
 #define assert_failed(msg) do {                                 \
     BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 23639d5479a3..8e2816fae9b9 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -496,7 +496,9 @@ void show_code(const struct cpu_user_regs *regs);
 void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs);
 void show_registers(const struct cpu_user_regs *regs);
 void show_execution_state(const struct cpu_user_regs *regs);
-#define dump_execution_state() run_in_exception_handler(show_execution_state)
+void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs);
+#define dump_execution_state() \
+    run_in_exception_handler(show_execution_state_nonconst)
 void show_page_walk(unsigned long addr);
 void noreturn fatal_trap(const struct cpu_user_regs *regs, bool_t show_remote);
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 7b957101934e..a2278d9499d0 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -681,6 +681,11 @@ void show_execution_state(const struct cpu_user_regs *regs)
     console_unlock_recursive_irqrestore(flags);
 }
 
+void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs)
+{
+    show_execution_state(regs);
+}
+
 void vcpu_show_execution_state(struct vcpu *v)
 {
     unsigned long flags = 0;
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 5dc650a37c5c..b6e22d8120b1 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -138,7 +138,7 @@ static void cf_check show_handlers(unsigned char key)
 
 static cpumask_t dump_execstate_mask;
 
-void dump_execstate(struct cpu_user_regs *regs)
+void cf_check dump_execstate(struct cpu_user_regs *regs)
 {
     unsigned int cpu = smp_processor_id();
 
@@ -490,7 +490,7 @@ static void cf_check run_all_keyhandlers(
     tasklet_schedule(&run_all_keyhandlers_tasklet);
 }
 
-static void do_debugger_trap_fatal(struct cpu_user_regs *regs)
+static void cf_check do_debugger_trap_fatal(struct cpu_user_regs *regs)
 {
     (void)debugger_trap_fatal(0xf001, regs);
 
diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index e205c0da6a61..16c8ff394d5c 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -1247,7 +1247,7 @@ static int cf_check ehci_dbgp_getc(struct serial_port *port, char *pc)
 /* Safe: ehci_dbgp_poll() runs as timer handler, so not reentrant. */
 static struct serial_port *poll_port;
 
-static void _ehci_dbgp_poll(struct cpu_user_regs *regs)
+static void cf_check _ehci_dbgp_poll(struct cpu_user_regs *regs)
 {
     struct serial_port *port = poll_port;
     struct ehci_dbgp *dbgp = port->uart;
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 8df1ee4d5c2c..e5b4a9085516 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -206,7 +206,7 @@ static void cf_check ns16550_interrupt(
 /* Safe: ns16550_poll() runs as softirq so not reentrant on a given CPU. */
 static DEFINE_PER_CPU(struct serial_port *, poll_port);
 
-static void __ns16550_poll(struct cpu_user_regs *regs)
+static void cf_check __ns16550_poll(struct cpu_user_regs *regs)
 {
     struct serial_port *port = this_cpu(poll_port);
     struct ns16550 *uart = port->uart;
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index c6987973bf88..3a1fdaf7e35a 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -199,7 +199,7 @@ extern char *print_tainted(char *str);
 extern void add_taint(unsigned int taint);
 
 struct cpu_user_regs;
-void dump_execstate(struct cpu_user_regs *);
+void cf_check dump_execstate(struct cpu_user_regs *);
 
 void init_constructors(void);
 
-- 
2.11.0


