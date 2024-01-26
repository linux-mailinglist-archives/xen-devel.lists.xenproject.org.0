Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 013B983E381
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 21:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672502.1046599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTTDs-0000nw-HE; Fri, 26 Jan 2024 20:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672502.1046599; Fri, 26 Jan 2024 20:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTTDs-0000ka-Bx; Fri, 26 Jan 2024 20:54:48 +0000
Received: by outflank-mailman (input) for mailman id 672502;
 Fri, 26 Jan 2024 20:54:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gD8/=JE=citrix.com=prvs=748d50c66=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rTTDr-0000Mm-2d
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 20:54:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21b4d2bb-bc8d-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 21:54:45 +0100 (CET)
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
X-Inumbo-ID: 21b4d2bb-bc8d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1706302485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L6iDmwrCytRZMmO9gLj9faDKUhnDEiJ7sSlzL0gPy38=;
  b=B8BBHsKTiBu3pDNpsmHqKBRimhlVh1Ty78UwZbjB+k+odWfsvKKJqVae
   oisfFt9Eb+fC50fooE/L1S57fy+Kixju3A3GDRL3ECrFzwd4BjDaoL7Qo
   QT+CWx/v10jAgDglbQOlXpcuGRG32scA4KKzzcNWCpTnPcL6a+dStWYJi
   U=;
X-CSE-ConnectionGUID: RXoPqrN0Rnyls1Kns2nLxQ==
X-CSE-MsgGUID: KlNhI18TRIerFVPe4o+tdg==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 129693491
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:zuwfCK6u2E5V3Xfx163TPgxRtGHHchMFZxGqfqrLsTDasY5as4F+v
 mIfDTyGOvjcamujKY8kO9vgoR9Q75OHyNBrTAZoqCk8Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU34ZwehBtC5gZiPakR4AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 8wfECkXSEi5gfOy2+uYTPI2gOAzFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmRJUIXUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxBfG9
 zmarj2R7hcyF9i5yRvcok6Wp+LVsx3DVd4VV6G0+as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 neOm97qHj1u9r6IU3WW9rSThTy3MCkRa2QFYEc5oRAtuoe55ttp11SWE4clT/bdYsDJ9S/Y+
 QCNlDEkoe0pi98PzPyY+0udhRa8n82cJuIq3Tk7Tl5J/ysgO9b7PdP0sgGGhcusOrp1WbVog
 ZTlpyR9xLpXZX11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW4meh04bppdKGS4P
 yc/XD+9A7cKYhOXgVJfOdrtW6zGM4C+fTgaahwkRoUXOcUgHON21CpveVSRzwjQraTYqolmY
 c3zWZ/1XR4n5VFPkGLeqxE1jeV6mUjTBAr7GfjG8vhQ+ePENSHME+lcbTNjrIkRtcu5nekcy
 P4HX+Pi9vmVeLyWjvX/mWLLEW03EA==
IronPort-HdrOrdr: A9a23:2Cg2IKHYmdhFhaXfpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5r
 mTdZUgpHnJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YZT0EUMrzN5DZB4voSmDPIceod/A==
X-Talos-CUID: 9a23:aVdMXW3YtJ2rxIyzYH55T7xfIPAiSmTH6i/qJV68Ej9KTqbPT3uAwfYx
X-Talos-MUID: 9a23:+qkbLQRxexdCg3X0RXTPgBdiFZ44356PBVojr60L587HKSB/bmI=
X-IronPort-AV: E=Sophos;i="6.05,216,1701147600"; 
   d="scan'208";a="129693491"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: [PATCH 2/2] xen: Remove debugger.h
Date: Fri, 26 Jan 2024 20:54:18 +0000
Message-ID: <20240126205418.3587177-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240126205418.3587177-1-andrew.cooper3@citrix.com>
References: <20240126205418.3587177-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With x86 having dropped gdbstub, Xen's only debugger has gone.

Drop xen/debugger.h and remove the hooks spread around the codebase.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I debated splitting this up, but decided it wasn't worth the effort. There's a
lot of further cleanup that can be done, including an include tangle it seems?
---
 xen/arch/x86/include/asm/bug.h      | 20 -------------
 xen/arch/x86/include/asm/debugger.h | 30 --------------------
 xen/arch/x86/traps.c                | 30 +++-----------------
 xen/common/bug.c                    | 27 ------------------
 xen/common/keyhandler.c             | 22 +--------------
 xen/common/shutdown.c               |  2 --
 xen/drivers/char/console.c          |  3 --
 xen/include/xen/bug.h               |  4 ---
 xen/include/xen/debugger.h          | 44 -----------------------------
 9 files changed, 5 insertions(+), 177 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/debugger.h
 delete mode 100644 xen/include/xen/debugger.h

diff --git a/xen/arch/x86/include/asm/bug.h b/xen/arch/x86/include/asm/bug.h
index 7fe879a8ccb9..a9e99786a7bb 100644
--- a/xen/arch/x86/include/asm/bug.h
+++ b/xen/arch/x86/include/asm/bug.h
@@ -1,28 +1,8 @@
 #ifndef __X86_BUG_H__
 #define __X86_BUG_H__
 
-/*
- * Please do not include in the header any header that might
- * use BUG/ASSERT/etc maros asthey will be defined later after
- * the return to <xen/bug.h> from the current header:
- * 
- * <xen/bug.h>:
- *  ...
- *   <asm/bug.h>:
- *     ...
- *     <any_header_which_uses_BUG/ASSERT/etc macros.h>
- *     ...
- *  ...
- *  #define BUG() ...
- *  ...
- *  #define ASSERT() ...
- *  ...
- */
-
 #ifndef __ASSEMBLY__
 
-#define BUG_DEBUGGER_TRAP_FATAL(regs) debugger_trap_fatal(X86_EXC_GP,regs)
-
 #define BUG_INSTR       "ud2"
 #define BUG_ASM_CONST   "c"
 
diff --git a/xen/arch/x86/include/asm/debugger.h b/xen/arch/x86/include/asm/debugger.h
deleted file mode 100644
index a5c299c6c34d..000000000000
--- a/xen/arch/x86/include/asm/debugger.h
+++ /dev/null
@@ -1,30 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- * xen/arch/x86/include/asm/debugger.h
- *
- * x86-specific debugger hooks.
- */
-#ifndef __X86_DEBUGGER_H__
-#define __X86_DEBUGGER_H__
-
-#include <xen/gdbstub.h>
-#include <xen/stdbool.h>
-
-#include <asm/x86-defns.h>
-
-/* Returns true if GDB handled the trap, or it is surviveable. */
-static inline bool debugger_trap_fatal(
-    unsigned int vector, struct cpu_user_regs *regs)
-{
-    int rc = __trap_to_gdb(regs, vector);
-
-    if ( rc == 0 )
-        return true;
-
-    return vector == X86_EXC_BP;
-}
-
-/* Int3 is a trivial way to gather cpu_user_regs context. */
-#define debugger_trap_immediate() __asm__ __volatile__ ( "int3" )
-
-#endif /* __X86_DEBUGGER_H__ */
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 7724306116e9..5f4bcc0537f7 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -25,7 +25,6 @@
 #include <xen/shutdown.h>
 #include <xen/guest_access.h>
 #include <asm/regs.h>
-#include <xen/debugger.h>
 #include <xen/delay.h>
 #include <xen/event.h>
 #include <xen/spinlock.h>
@@ -835,11 +834,6 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
 
 void asmlinkage do_unhandled_trap(struct cpu_user_regs *regs)
 {
-    unsigned int trapnr = regs->entry_vector;
-
-    if ( debugger_trap_fatal(trapnr, regs) )
-        return;
-
     fatal_trap(regs, false);
 }
 
@@ -941,9 +935,6 @@ void asmlinkage do_trap(struct cpu_user_regs *regs)
         return;
 
  hardware_trap:
-    if ( debugger_trap_fatal(trapnr, regs) )
-        return;
-
     fatal_trap(regs, false);
 }
 
@@ -1190,9 +1181,6 @@ void asmlinkage do_invalid_op(struct cpu_user_regs *regs)
     if ( likely(extable_fixup(regs, true)) )
         return;
 
-    if ( debugger_trap_fatal(X86_EXC_UD, regs) )
-        return;
-
     show_execution_state(regs);
     panic("FATAL TRAP: vector = %d (invalid opcode)\n", X86_EXC_UD);
 }
@@ -1206,9 +1194,8 @@ void asmlinkage do_int3(struct cpu_user_regs *regs)
         if ( likely(extable_fixup(regs, true)) )
             return;
 
-        if ( !debugger_trap_fatal(X86_EXC_BP, regs) )
-            printk(XENLOG_DEBUG "Hit embedded breakpoint at %p [%ps]\n",
-                   _p(regs->rip), _p(regs->rip));
+        printk(XENLOG_DEBUG "Hit embedded breakpoint at %p [%ps]\n",
+               _p(regs->rip), _p(regs->rip));
 
         return;
     }
@@ -1294,9 +1281,6 @@ void do_general_protection(struct cpu_user_regs *regs)
         return;
 
  hardware_gp:
-    if ( debugger_trap_fatal(X86_EXC_GP, regs) )
-        return;
-
     show_execution_state(regs);
     panic("GENERAL PROTECTION FAULT\n[error_code=%04x]\n", regs->error_code);
 }
@@ -1620,9 +1604,6 @@ void asmlinkage do_page_fault(struct cpu_user_regs *regs)
         }
 
     fatal:
-        if ( debugger_trap_fatal(X86_EXC_PF, regs) )
-            return;
-
         show_execution_state(regs);
         show_page_walk(addr);
         panic("FATAL PAGE FAULT\n"
@@ -1933,11 +1914,8 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
                 return;
             }
 #endif
-            if ( !debugger_trap_fatal(X86_EXC_DB, regs) )
-            {
-                WARN();
-                regs->eflags &= ~X86_EFLAGS_TF;
-            }
+            WARN();
+            regs->eflags &= ~X86_EFLAGS_TF;
         }
 
         /*
diff --git a/xen/common/bug.c b/xen/common/bug.c
index ca166e102b4b..5fbe703a81b3 100644
--- a/xen/common/bug.c
+++ b/xen/common/bug.c
@@ -1,23 +1,4 @@
 #include <xen/bug.h>
-/*
- * Ideally <xen/debugger.h> should be included in <asm/bug.h>
- * but an issue with compilation can occur as <xen/debugger.h> uses
- * BUG/ASSERT/etc macros inside but they will be defined later in
- * <xen/bug.h> after return from inclusion of <asm/bug.h>:
- * 
- * <xen/bug.h>:
- *  ...
- *   <asm/bug.h>:
- *     ...
- *     <xen/debugger.h> -> some of included header in it uses BUG/ASSERT/etc
- *     ...
- *  ...
- *  #define BUG() ...
- *  ...
- *  #define ASSERT() ...
- *  ...
- */
-#include <xen/debugger.h>
 #include <xen/errno.h>
 #include <xen/kernel.h>
 #include <xen/livepatch.h>
@@ -96,10 +77,6 @@ int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc)
 
     case BUGFRAME_bug:
         printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
-
-        if ( BUG_DEBUGGER_TRAP_FATAL(regs) )
-            break;
-
         show_execution_state(regs);
         panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
 
@@ -111,10 +88,6 @@ int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc)
 
         printk("Assertion '%s' failed at %s%s:%d\n",
                predicate, prefix, filename, lineno);
-
-        if ( BUG_DEBUGGER_TRAP_FATAL(regs) )
-            break;
-
         show_execution_state(regs);
         panic("Assertion '%s' failed at %s%s:%d\n",
               predicate, prefix, filename, lineno);
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 99a2d72a0202..f131034d33ee 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -3,7 +3,6 @@
  */
 
 #include <asm/regs.h>
-#include <xen/debugger.h>
 #include <xen/delay.h>
 #include <xen/keyhandler.h>
 #include <xen/param.h>
@@ -29,8 +28,7 @@ static bool alt_key_handling;
 static keyhandler_fn_t cf_check show_handlers, cf_check dump_hwdom_registers,
     cf_check dump_domains, cf_check read_clocks;
 static irq_keyhandler_fn_t cf_check do_toggle_alt_key, cf_check dump_registers,
-    cf_check reboot_machine, cf_check run_all_keyhandlers,
-    cf_check do_debug_key;
+    cf_check reboot_machine, cf_check run_all_keyhandlers;
 
 static struct keyhandler {
     union {
@@ -57,7 +55,6 @@ static struct keyhandler {
     IRQ_KEYHANDLER('R', reboot_machine, "reboot machine", 0),
         KEYHANDLER('t', read_clocks, "display multi-cpu clock info", 1),
         KEYHANDLER('0', dump_hwdom_registers, "dump Dom0 registers", 1),
-    IRQ_KEYHANDLER('%', do_debug_key, "trap to xendbg", 0),
     IRQ_KEYHANDLER('*', run_all_keyhandlers, "print all diagnostics", 0),
 
 #ifdef CONFIG_PERF_COUNTERS
@@ -503,23 +500,6 @@ static void cf_check run_all_keyhandlers(
     tasklet_schedule(&run_all_keyhandlers_tasklet);
 }
 
-static void cf_check do_debugger_trap_fatal(struct cpu_user_regs *regs)
-{
-    (void)debugger_trap_fatal(0xf001, regs);
-
-    /* Prevent tail call optimisation, which confuses xendbg. */
-    barrier();
-}
-
-static void cf_check do_debug_key(unsigned char key, struct cpu_user_regs *regs)
-{
-    printk("'%c' pressed -> trapping into debugger\n", key);
-    if ( regs )
-        do_debugger_trap_fatal(regs);
-    else
-        run_in_exception_handler(do_debugger_trap_fatal);
-}
-
 static void cf_check do_toggle_alt_key(
     unsigned char key, struct cpu_user_regs *regs)
 {
diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
index dfd5e41097e9..5f8141edc6b2 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -2,7 +2,6 @@
 #include <xen/lib.h>
 #include <xen/param.h>
 #include <xen/sched.h>
-#include <xen/debugger.h>
 #include <xen/domain.h>
 #include <xen/delay.h>
 #include <xen/watchdog.h>
@@ -40,7 +39,6 @@ void hwdom_shutdown(u8 reason)
         machine_halt();
 
     case SHUTDOWN_crash:
-        debugger_trap_immediate();
         printk("Hardware Dom%u crashed: ", hardware_domain->domain_id);
         kexec_crash(CRASHREASON_HWDOM);
         reboot_or_halt();
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 0666564ec92e..dce0226e8711 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -15,7 +15,6 @@
 #include <xen/init.h>
 #include <xen/event.h>
 #include <xen/console.h>
-#include <xen/debugger.h>
 #include <xen/param.h>
 #include <xen/serial.h>
 #include <xen/softirq.h>
@@ -1297,8 +1296,6 @@ void panic(const char *fmt, ...)
 
     spin_unlock_irqrestore(&lock, flags);
 
-    debugger_trap_immediate();
-
     kexec_crash(CRASHREASON_PANIC);
 
     if ( opt_noreboot )
diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
index 8cca4486a477..4bd0be508825 100644
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -16,10 +16,6 @@
 
 #ifndef __ASSEMBLY__
 
-#ifndef BUG_DEBUGGER_TRAP_FATAL
-#define BUG_DEBUGGER_TRAP_FATAL(regs) 0
-#endif
-
 #include <xen/macros.h>
 #include <xen/types.h>
 
diff --git a/xen/include/xen/debugger.h b/xen/include/xen/debugger.h
deleted file mode 100644
index 72684268aff7..000000000000
--- a/xen/include/xen/debugger.h
+++ /dev/null
@@ -1,44 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- * Arch specific debuggers should implement:
- *
- * debugger_trap_fatal():
- *  Called when Xen is about to give up and crash. Typically you will use this
- *  hook to drop into a debug session. It can also be used to hook off
- *  deliberately caused traps (which you then handle and return non-zero).
- *
- * debugger_trap_immediate():
- *  Called if we want to drop into a debugger now.  This is essentially the
- *  same as debugger_trap_fatal, except that we use the current register state
- *  rather than the state which was in effect when we took the trap.
- *  For example: if we're dying because of an unhandled exception, we call
- *  debugger_trap_fatal; if we're dying because of a panic() we call
- *  debugger_trap_immediate().
- */
-
-#ifndef __XEN_DEBUGGER_H__
-#define __XEN_DEBUGGER_H__
-
-#ifdef CONFIG_CRASH_DEBUG
-
-#include <asm/debugger.h>
-
-#else
-
-#include <xen/stdbool.h>
-
-struct cpu_user_regs;
-
-static inline bool debugger_trap_fatal(
-    unsigned int vector, const struct cpu_user_regs *regs)
-{
-    return false;
-}
-
-static inline void debugger_trap_immediate(void)
-{
-}
-
-#endif /* CONFIG_CRASH_DEBUG */
-
-#endif /* __XEN_DEBUGGER_H__ */
-- 
2.30.2


