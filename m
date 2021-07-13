Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61A03C6855
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 04:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154938.286165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m37jA-0001Rg-2O; Tue, 13 Jul 2021 02:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154938.286165; Tue, 13 Jul 2021 02:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m37j9-0001Od-Ux; Tue, 13 Jul 2021 02:00:51 +0000
Received: by outflank-mailman (input) for mailman id 154938;
 Tue, 13 Jul 2021 02:00:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yAHm=MF=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1m37j8-000176-2X
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 02:00:50 +0000
Received: from mail-pf1-x42b.google.com (unknown [2607:f8b0:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6e1a125-b99f-41b4-8694-e9fac392ad66;
 Tue, 13 Jul 2021 02:00:45 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id j199so18136688pfd.7
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jul 2021 19:00:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id o20sm19285728pgv.80.2021.07.12.19.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 19:00:43 -0700 (PDT)
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
X-Inumbo-ID: f6e1a125-b99f-41b4-8694-e9fac392ad66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Apyk2EsaQkKzjgWc1lHDgAWxDVjQnXEaCPOUVZyL41s=;
        b=uKLbGF8kjX0PotsoBntlRXMQ1mdfytGQNDGsTrDOnRm+itBtYwLQmZMyhenIycQL/O
         mgU77BfZmXKU2RdIvK1MScxENdi9HAyjRrIkc17I66ODOLOFiTBqHBJVhwD/jXIOil6k
         WJi6lfBgc8fEmZP0lJq0aj8lXSzMWidbbSNvqqOEWy751OHexhMKH9zk3WLukM5r8Xq+
         YNvQnU0EYMobNX9vyOoG5oP54ifoRy+XSrYfmRU7Muu2krrgossLA2V0x4ziSPhUy21S
         ZFBpPyxDr1pxJWHAYL8Z3ClmaKMbsYuqq5z5IzxjG1kW+boMIMkHoI4sWnUQ6bvo8+FF
         nm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Apyk2EsaQkKzjgWc1lHDgAWxDVjQnXEaCPOUVZyL41s=;
        b=dQBYxc4M9b4XTM9DiUznsvd+CTDCfUPYdk+nuXlnWDX8DsAwDJdzA9dXJYES00SPMh
         3tcj88zHUkNj+vduSpkLKRgffNy3BloZE5ijRCxUmqIpY0gnIDWJhmobJ7wxB1fF5J8c
         XSvZ4dW31/9IkFvXgH7H6cSaiSsgewscQp/lUZt86MKWtI4N4GS+0fwfmk08TSOgzMfR
         /7ofp96Rbgy68GpIqaMLQVMVfikULtEI7tpMrzKM2U7P7+n09FPcKO/6UUGagt4RYf1/
         S/njmnWCeCRnuHZwdZR49qF2QoDbPT5VBzTpGne0LORQpl3XnbsVQ517vd1f0FOdZt9S
         m6Gg==
X-Gm-Message-State: AOAM5323jvcXQK+la6V9x8mlnWm4CBAIdTnKv1az6nU86NN84sazdbfA
	PqqDu1wQjVA7CKBZjggMNYEDbGuuoQvQfMXJ
X-Google-Smtp-Source: ABdhPJzLUz9cHsC/W0S2fJwDKf2SCR2CfHQ9KllaO9/lns1Evj2NCJQy6ZX2mL499BP38kMCO0KaVg==
X-Received: by 2002:a63:1d41:: with SMTP id d1mr1975744pgm.199.1626141644242;
        Mon, 12 Jul 2021 19:00:44 -0700 (PDT)
Sender: Bobby Eshleman <bobbyeshleman@gmail.com>
From: Bobby Eshleman <bobby.eshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobby.eshleman@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 1/4] build: use common stubs for debugger_trap_* functions if !CONFIG_CRASH_DEBUG
Date: Mon, 12 Jul 2021 18:59:53 -0700
Message-Id: <2fc1a1416d37b5eed0ebfdeff8bb9dd61bc7acc7.1626136452.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1626136452.git.bobby.eshleman@gmail.com>
References: <cover.1626136452.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously Xen required all architectures implement the debugger_trap_*
functions whether or not it actually needs them.

This commit makes debugger_trap* functions resolve to arch-specific
function definitions if CONFIG_CRASH_DEBUG=y, but resolves to a set of
common no-op stubs if !CONFIG_CRASH_DEBUG, which avoids requiring every
arch to carry its own stubs.  This means asm/debugger.h may also be
dropped for architectures that do not need this functionality.

Inside xen/debugger.h:
    * If !CONFIG_CRASH_DEBUG, use stubs.
    * Otherwise, include arch-specific <asm/debugger.h>

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---
 xen/arch/arm/traps.c            |  2 +-
 xen/arch/x86/debug.c            |  2 +-
 xen/arch/x86/domain.c           |  5 +-
 xen/arch/x86/domctl.c           |  2 +-
 xen/arch/x86/gdbstub.c          |  4 +-
 xen/arch/x86/hvm/svm/svm.c      |  2 +-
 xen/arch/x86/hvm/vmx/realmode.c |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c      |  2 +-
 xen/arch/x86/nmi.c              |  2 +-
 xen/arch/x86/traps.c            |  2 +-
 xen/arch/x86/x86_64/gdbstub.c   |  3 +-
 xen/common/domain.c             |  2 +-
 xen/common/gdbstub.c            |  3 +-
 xen/common/keyhandler.c         |  2 +-
 xen/common/shutdown.c           |  2 +-
 xen/drivers/char/console.c      |  2 +-
 xen/include/asm-arm/debugger.h  | 15 ------
 xen/include/asm-x86/debugger.h  | 66 +++++----------------------
 xen/include/xen/debugger.h      | 81 +++++++++++++++++++++++++++++++++
 19 files changed, 115 insertions(+), 86 deletions(-)
 delete mode 100644 xen/include/asm-arm/debugger.h
 create mode 100644 xen/include/xen/debugger.h

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 4ccb6e7d18..5a0a5eff1d 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -41,7 +41,7 @@
 #include <asm/acpi.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
-#include <asm/debugger.h>
+#include <xen/debugger.h>
 #include <asm/event.h>
 #include <asm/hsr.h>
 #include <asm/mmio.h>
diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
index d90dc93056..4386e8d1b1 100644
--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/debug.c
@@ -19,7 +19,7 @@
 #include <xen/mm.h>
 #include <xen/domain_page.h>
 #include <xen/guest_access.h>
-#include <asm/debugger.h>
+#include <xen/debugger.h>
 #include <asm/p2m.h>
 
 typedef unsigned long dbgva_t;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ef1812dc14..47448f2f8c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -16,6 +16,7 @@
 #include <xen/errno.h>
 #include <xen/sched.h>
 #include <xen/domain.h>
+#include <xen/debugger.h>
 #include <xen/smp.h>
 #include <xen/delay.h>
 #include <xen/softirq.h>
@@ -2539,9 +2540,9 @@ static int __init init_vcpu_kick_softirq(void)
 }
 __initcall(init_vcpu_kick_softirq);
 
+#ifdef CONFIG_CRASH_DEBUG
 void domain_pause_for_debugger(void)
 {
-#ifdef CONFIG_CRASH_DEBUG
     struct vcpu *curr = current;
     struct domain *d = curr->domain;
 
@@ -2550,8 +2551,8 @@ void domain_pause_for_debugger(void)
     /* if gdbsx active, we just need to pause the domain */
     if ( curr->arch.gdbsx_vcpu_event == 0 )
         send_global_virq(VIRQ_DEBUGGER);
-#endif
 }
+#endif
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 26a76d2be9..1bc8ba7251 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -33,7 +33,7 @@
 #include <public/vm_event.h>
 #include <asm/mem_sharing.h>
 #include <asm/xstate.h>
-#include <asm/debugger.h>
+#include <xen/debugger.h>
 #include <asm/psr.h>
 #include <asm/cpuid.h>
 
diff --git a/xen/arch/x86/gdbstub.c b/xen/arch/x86/gdbstub.c
index 8f4f49fd3b..f20cbf1f45 100644
--- a/xen/arch/x86/gdbstub.c
+++ b/xen/arch/x86/gdbstub.c
@@ -18,7 +18,9 @@
  * You should have received a copy of the GNU General Public License
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
-#include <asm/debugger.h>
+#include <asm/uaccess.h>
+#include <xen/debugger.h>
+#include <xen/gdbstub.h>
 
 u16
 gdb_arch_signal_num(struct cpu_user_regs *regs, unsigned long cookie)
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 642a64b747..d7ec7c15f9 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -58,7 +58,7 @@
 #include <asm/hvm/trace.h>
 #include <asm/hap.h>
 #include <asm/apic.h>
-#include <asm/debugger.h>
+#include <xen/debugger.h>
 #include <asm/hvm/monitor.h>
 #include <asm/monitor.h>
 #include <asm/xstate.h>
diff --git a/xen/arch/x86/hvm/vmx/realmode.c b/xen/arch/x86/hvm/vmx/realmode.c
index cc23afa788..1f8513c132 100644
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -14,7 +14,7 @@
 #include <xen/sched.h>
 #include <xen/paging.h>
 #include <xen/softirq.h>
-#include <asm/debugger.h>
+#include <xen/debugger.h>
 #include <asm/event.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index e09b7e3af9..1820e4be0c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -51,7 +51,7 @@
 #include <asm/hvm/trace.h>
 #include <asm/hvm/monitor.h>
 #include <asm/xenoprof.h>
-#include <asm/debugger.h>
+#include <xen/debugger.h>
 #include <asm/apic.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/altp2m.h>
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index ab94a96c4d..eaf404402d 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -30,7 +30,7 @@
 #include <asm/msr.h>
 #include <asm/mpspec.h>
 #include <asm/nmi.h>
-#include <asm/debugger.h>
+#include <xen/debugger.h>
 #include <asm/div64.h>
 #include <asm/apic.h>
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e60af16ddd..44811c9599 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -62,7 +62,7 @@
 #include <asm/uaccess.h>
 #include <asm/i387.h>
 #include <asm/xstate.h>
-#include <asm/debugger.h>
+#include <xen/debugger.h>
 #include <asm/msr.h>
 #include <asm/nmi.h>
 #include <asm/xenoprof.h>
diff --git a/xen/arch/x86/x86_64/gdbstub.c b/xen/arch/x86/x86_64/gdbstub.c
index 2626519c89..126af03f50 100644
--- a/xen/arch/x86/x86_64/gdbstub.c
+++ b/xen/arch/x86/x86_64/gdbstub.c
@@ -17,7 +17,8 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <asm/debugger.h>
+#include <xen/debugger.h>
+#include <xen/gdbstub.h>
 
 #define GDB_REG64(r) gdb_write_to_packet_hex(r, sizeof(u64), ctx)
 #define GDB_REG32(r)  gdb_write_to_packet_hex(r, sizeof(u32), ctx)
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6b71c6d6a9..88ba680fe7 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -33,7 +33,7 @@
 #include <xen/xenoprof.h>
 #include <xen/irq.h>
 #include <xen/argo.h>
-#include <asm/debugger.h>
+#include <xen/debugger.h>
 #include <asm/p2m.h>
 #include <asm/processor.h>
 #include <public/sched.h>
diff --git a/xen/common/gdbstub.c b/xen/common/gdbstub.c
index 848c1f4327..6f3d7ca72f 100644
--- a/xen/common/gdbstub.c
+++ b/xen/common/gdbstub.c
@@ -38,7 +38,8 @@
 #include <xen/serial.h>
 #include <xen/irq.h>
 #include <xen/watchdog.h>
-#include <asm/debugger.h>
+#include <xen/debugger.h>
+#include <xen/gdbstub.h>
 #include <xen/init.h>
 #include <xen/param.h>
 #include <xen/smp.h>
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 8b9f378371..5c66ca0056 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -20,7 +20,7 @@
 #include <xen/mm.h>
 #include <xen/watchdog.h>
 #include <xen/init.h>
-#include <asm/debugger.h>
+#include <xen/debugger.h>
 #include <asm/div64.h>
 
 static unsigned char keypress_key;
diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
index abde48aa4c..c82a4999d9 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -8,7 +8,7 @@
 #include <xen/shutdown.h>
 #include <xen/console.h>
 #include <xen/kexec.h>
-#include <asm/debugger.h>
+#include <xen/debugger.h>
 #include <public/sched.h>
 
 /* opt_noreboot: If true, machine will need manual reset on error. */
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 7d0a603d03..060d32757f 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -26,7 +26,7 @@
 #include <xen/kexec.h>
 #include <xen/ctype.h>
 #include <xen/warning.h>
-#include <asm/debugger.h>
+#include <xen/debugger.h>
 #include <asm/div64.h>
 #include <xen/hypercall.h> /* for do_console_io */
 #include <xen/early_printk.h>
diff --git a/xen/include/asm-arm/debugger.h b/xen/include/asm-arm/debugger.h
deleted file mode 100644
index ac776efa78..0000000000
--- a/xen/include/asm-arm/debugger.h
+++ /dev/null
@@ -1,15 +0,0 @@
-#ifndef __ARM_DEBUGGER_H__
-#define __ARM_DEBUGGER_H__
-
-#define debugger_trap_fatal(v, r) (0)
-#define debugger_trap_immediate() ((void) 0)
-
-#endif /* __ARM_DEBUGGER_H__ */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/include/asm-x86/debugger.h b/xen/include/asm-x86/debugger.h
index 99803bfd0c..38359da0a1 100644
--- a/xen/include/asm-x86/debugger.h
+++ b/xen/include/asm-x86/debugger.h
@@ -1,44 +1,26 @@
 /******************************************************************************
- * asm/debugger.h
- * 
- * Generic hooks into arch-dependent Xen.
- * 
- * Each debugger should define two functions here:
- * 
- * 1. debugger_trap_entry(): 
- *  Called at start of any synchronous fault or trap, before any other work
- *  is done. The idea is that if your debugger deliberately caused the trap
- *  (e.g. to implement breakpoints or data watchpoints) then you can take
- *  appropriate action and return a non-zero value to cause early exit from
- *  the trap function.
- * 
- * 2. debugger_trap_fatal():
- *  Called when Xen is about to give up and crash. Typically you will use this
- *  hook to drop into a debug session. It can also be used to hook off
- *  deliberately caused traps (which you then handle and return non-zero).
+ * x86 Debugger Hooks
  *
- * 3. debugger_trap_immediate():
- *  Called if we want to drop into a debugger now.  This is essentially the
- *  same as debugger_trap_fatal, except that we use the current register state
- *  rather than the state which was in effect when we took the trap.
- *  For example: if we're dying because of an unhandled exception, we call
- *  debugger_trap_fatal; if we're dying because of a panic() we call
- *  debugger_trap_immediate().
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
-
 #ifndef __X86_DEBUGGER_H__
 #define __X86_DEBUGGER_H__
 
-#include <xen/sched.h>
 #include <asm/regs.h>
 #include <asm/processor.h>
+#include <xen/gdbstub.h>
+#include <xen/domain.h>
+#include <xen/event.h>
+#include <xen/sched.h>
 
 void domain_pause_for_debugger(void);
 
-#ifdef CONFIG_CRASH_DEBUG
-
-#include <xen/gdbstub.h>
-
 static inline bool debugger_trap_fatal(
     unsigned int vector, struct cpu_user_regs *regs)
 {
@@ -74,28 +56,4 @@ static inline bool debugger_trap_entry(
     return false;
 }
 
-#else
-
-static inline bool debugger_trap_fatal(
-    unsigned int vector, struct cpu_user_regs *regs)
-{
-    return false;
-}
-
-#define debugger_trap_immediate() ((void)0)
-
-static inline bool debugger_trap_entry(
-    unsigned int vector, struct cpu_user_regs *regs)
-{
-    return false;
-}
-
-#endif
-
-#ifdef CONFIG_GDBSX
-unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
-                        unsigned int len, domid_t domid, bool toaddr,
-                        uint64_t pgd3);
-#endif
-
 #endif /* __X86_DEBUGGER_H__ */
diff --git a/xen/include/xen/debugger.h b/xen/include/xen/debugger.h
new file mode 100644
index 0000000000..d6d820f4e5
--- /dev/null
+++ b/xen/include/xen/debugger.h
@@ -0,0 +1,81 @@
+/******************************************************************************
+ * Generic hooks into arch-dependent Xen.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *
+ *
+ * Each debugger should define three functions here:
+ *
+ * 1. debugger_trap_entry():
+ *  Called at start of any synchronous fault or trap, before any other work
+ *  is done. The idea is that if your debugger deliberately caused the trap
+ *  (e.g. to implement breakpoints or data watchpoints) then you can take
+ *  appropriate action and return a non-zero value to cause early exit from
+ *  the trap function.
+ *
+ * 2. debugger_trap_fatal():
+ *  Called when Xen is about to give up and crash. Typically you will use this
+ *  hook to drop into a debug session. It can also be used to hook off
+ *  deliberately caused traps (which you then handle and return non-zero).
+ *
+ * 3. debugger_trap_immediate():
+ *  Called if we want to drop into a debugger now.  This is essentially the
+ *  same as debugger_trap_fatal, except that we use the current register state
+ *  rather than the state which was in effect when we took the trap.
+ *  For example: if we're dying because of an unhandled exception, we call
+ *  debugger_trap_fatal; if we're dying because of a panic() we call
+ *  debugger_trap_immediate().
+ */
+
+#ifndef __XEN_DEBUGGER_H__
+#define __XEN_DEBUGGER_H__
+
+/* Dummy value used by ARM stubs. */
+#ifndef TRAP_invalid_op
+# define TRAP_invalid_op 6
+#endif
+
+#ifdef CONFIG_CRASH_DEBUG
+
+#include <asm/debugger.h>
+
+#else
+
+#include <asm/regs.h>
+#include <asm/processor.h>
+
+static inline void domain_pause_for_debugger(void)
+{
+}
+
+static inline bool debugger_trap_fatal(
+    unsigned int vector, const struct cpu_user_regs *regs)
+{
+    return false;
+}
+
+static inline void debugger_trap_immediate(void)
+{
+}
+
+static inline bool debugger_trap_entry(
+    unsigned int vector, const struct cpu_user_regs *regs)
+{
+    return false;
+}
+
+#endif /* CONFIG_CRASH_DEBUG */
+
+#ifdef CONFIG_GDBSX
+unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
+                        unsigned int len, domid_t domid, bool toaddr,
+                        uint64_t pgd3);
+#endif /* CONFIG_GDBSX */
+
+#endif /* __XEN_DEBUGGER_H__ */
-- 
2.30.0


