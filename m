Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33545EE7C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:05:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232750.403636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauJ-00041z-AY; Fri, 26 Nov 2021 13:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232750.403636; Fri, 26 Nov 2021 13:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauJ-0003vW-4C; Fri, 26 Nov 2021 13:04:51 +0000
Received: by outflank-mailman (input) for mailman id 232750;
 Fri, 26 Nov 2021 13:04:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauH-0002zD-3t
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:04:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ed9d182-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:04:48 +0100 (CET)
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
X-Inumbo-ID: 6ed9d182-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ne9sR1Af4/V67CBqU4M6NCPQOFrIw5Az3Gw7QUu3Mac=;
  b=AL0NIBVMpwvvxXsrfgyYrlV+k4CYk0MCzSCZapEBcsViVRThBLRlI/1e
   +cwSVQerhycbdNTfoTp71ivATZmQmVUGvq5I833HT/2zbNHt1JD1dlO3U
   1HkkZ362yS77rLGk8KGjXsJ/8GXLg8jdPbrPc87XBI9GC1k7RZpYira5U
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KeRx9sKZ+rVuae8W+b2HPau0rRsDaLoRSPCz/VU2HOfd97UJk91ogFSfaooAmqE/ij+HYfi+iZ
 +u3e9iMZXz71TR42oHTAKoUGJXnAslglXD574vRVlCDncYckwh0Kvyqff5xqiN/SMnRZLtB90l
 2HkkFHAkIJUgTgTGtjtShEzzzS7W80XUfOwITQOtn9Oq2MjtKjrIqu7o7ft1+RnnRw6uOr2kf4
 kPPpP9uJMUuBxEi1ssVUGoTJWOpCdlO/iSSeCDIMmco3UpINWRHjfMozGWSYNgLBM0uYBVgAsL
 Td0YH4GQl1G7MTNjI5T2fcuB
X-SBRS: 5.1
X-MesageID: 58676319
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xsW1ZqwlI6JOurp/Ay56t+f6wSrEfRIJ4+MujC+fZmUNrF6WrkVUn
 TYfWW3SPvaCYWf1eo1xPI3j8hkOsJXTn9c3TwVlqyAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRn2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8FOz
 9pVk5DocgAKfYHsqLQAQQR9IS4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25AQQqiFP
 ptxhTxHdE/Zb01SJ3AsWb0Yuuir2CjmUxRRpwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krk1WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYNZN1fC8s2sDqK6en4wzbJG3oZawxOPYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLSfbt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb5OORECnCBtJ6sybp1qHHa5
 xDofODEsYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmohdBk0bZdYJ2OyC
 KM2he+3zMQIVJdNRfUqC79d9uxwlfSwfTgbfqy8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLGkP3SMr9dMdQtiwLpSLcmelvG7v9WremJOcFzNwdeLqV/4U4A6zalTiMnS+
 XSxBh1RxFbl3CWVIgSWcHFzLrjoWM8n/348OCUtO3eu2mQiPtnzvPtOKcNvcOl17vFnwN51U
 +IBJ5eKDMNQR2mV4D8ad5T88tBvLUz5mQKUMiO5SzEjZJo8FRfR89rpc1K3pikDBya6r+Ukp
 Lik2l+JSJYPXV06Xs3XdOiu3xW6un1EwLB+WE7BI99yfkTw8dc1d3yt36Fve8xVcEfN3DqX0
 QqSECw0n+iVrt9n6sTNiICFs5ytT7l0EH1FEjSJ9r2xLyTboDaumNcSTOaScDnBf2ro46H+N
 /5NxvTxPfBbzlZHt41wT+Riwa4kvoa9orZbykJvHWnRbkTtAbRleyHU0c5Kv6xL57lYpQrpB
 R7fpogEYe2EaJH/DVocBAs5deDSh/gblw7b4ekxPEintjR8+6CKUBkKMhSB4MCHwGCZ7G/xL
 T8dhfMr
IronPort-HdrOrdr: A9a23:SCgZ06v0/TEX60kqCvjsIDGn7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58676319"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 55/65] x86/bugframe: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:36 +0000
Message-ID: <20211126123446.32324-56-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

run_in_exception_handler() managed to escape typechecking, as the compiler
can't see where function pointer gets called.  After adding some ad-hoc
typechecking, it turns out that dump_execution_state() alone differs in
const-ness from the other users of run_in_exception_handler().

Introduce a new show_execution_state_nonconst() to make the typechecking
happy.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/traps.c            |  5 +++++
 xen/common/keyhandler.c         |  4 ++--
 xen/drivers/char/ehci-dbgp.c    |  2 +-
 xen/drivers/char/ns16550.c      |  2 +-
 xen/include/asm-x86/bug.h       | 10 +++++++++-
 xen/include/asm-x86/processor.h |  4 +++-
 xen/include/xen/lib.h           |  2 +-
 7 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 76b1b779b33c..81ab96115ead 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -670,6 +670,11 @@ void show_execution_state(const struct cpu_user_regs *regs)
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
diff --git a/xen/include/asm-x86/bug.h b/xen/include/asm-x86/bug.h
index 9bb4a194202f..b7265bdfbe33 100644
--- a/xen/include/asm-x86/bug.h
+++ b/xen/include/asm-x86/bug.h
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
diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index f031a050cba0..547415ec68e1 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -497,7 +497,9 @@ void show_stack(const struct cpu_user_regs *regs);
 void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs);
 void show_registers(const struct cpu_user_regs *regs);
 void show_execution_state(const struct cpu_user_regs *regs);
-#define dump_execution_state() run_in_exception_handler(show_execution_state)
+void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs);
+#define dump_execution_state() \
+    run_in_exception_handler(show_execution_state_nonconst)
 void show_page_walk(unsigned long addr);
 void noreturn fatal_trap(const struct cpu_user_regs *regs, bool_t show_remote);
 
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


