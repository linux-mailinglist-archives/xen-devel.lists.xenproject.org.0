Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6E63F0CC8
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 22:30:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168323.307386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGSCf-0001em-M1; Wed, 18 Aug 2021 20:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168323.307386; Wed, 18 Aug 2021 20:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGSCf-0001c2-GR; Wed, 18 Aug 2021 20:30:25 +0000
Received: by outflank-mailman (input) for mailman id 168323;
 Wed, 18 Aug 2021 20:30:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydNC=NJ=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1mGSCe-000714-Nn
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 20:30:24 +0000
Received: from mail-pf1-x432.google.com (unknown [2607:f8b0:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 987880ea-60b2-4804-8cff-7b21d3fb1597;
 Wed, 18 Aug 2021 20:29:55 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id 7so3368494pfl.10
 for <xen-devel@lists.xenproject.org>; Wed, 18 Aug 2021 13:29:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id h25sm663775pfo.68.2021.08.18.13.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:29:53 -0700 (PDT)
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
X-Inumbo-ID: 987880ea-60b2-4804-8cff-7b21d3fb1597
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mzhpzYQx8peh1hdfIxEJjNatsuoe8FeZa6ijWCK1xjE=;
        b=h4CssbkPRxoitKam7/BAJ4YSIkbQ5wgEJmqRDamJcE7VRRfD3gKOIrhe8dba7nvdcG
         JO/OTO50Hhffn4Umpq9ojl3V03aoRR1GNGIxxFq9zvKKj4mRLIimKh6SCJk4KwbIgT67
         jg1h4NTO/yhv4RRs8TDmaogpTJx6qx8SV7ijUXV2UmX34ROA2Nvugc451XcdHP3zShf0
         gdyLMDdgCehTZ4oNytgVAXoEo3NMB2lGpGW/fRzLDhPq/V+6xHB9mzSURLPWWeAtWUMm
         Isf6PRsLvjb3cKOacE8R4KxzyqDHnrPs/r0bEs25a371/Qnw6QqLu2WH7dGOLSWfGav+
         qcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=mzhpzYQx8peh1hdfIxEJjNatsuoe8FeZa6ijWCK1xjE=;
        b=tJdtfGvHFiqW6y4EYvjPRHZY58ccai7zuQLGKBhq0A8AywChA5Q8JDiwBVc+O2KAjA
         jkb6/UswL/P48+UwrQaZfSf/6HANWbBh1RxXdlEHRgOGA0bp1DBKwtTQpMD401UljInV
         nfSvr8VB92OK85hsZN7/XqRS04litUXs7KGn9NW6cn6wa1bD8lfgU8dW29o5fwuYVGc2
         xDD5951DC+X6o3AO7BHANUVUdQyH2Nk/ZIagP9UmiJ5CbHys60xQ+IABbkaWWbl+R1kk
         UtpfnV/FzvrVBnDB2W3vzhbmT3jcQpg9BblU6HvS6xKjl5ybXHFWSrURo6I7IILVjtU+
         KhWA==
X-Gm-Message-State: AOAM532WiHJAW4BiaA48KfEBQlYalERvmtilS1/pXZ3c+mN9QBdJOuld
	cK81hqMfz/YvWP2qR+jp+76wmnwt+E1aCWnd
X-Google-Smtp-Source: ABdhPJzSC9bUuemsB4if7L49hfh2BOsBCLPEaZDrpMrX0BOd6P+1gfwEGSXAxdUsbBvPto83tIMMEQ==
X-Received: by 2002:a62:87c5:0:b029:3b5:f90f:c2eb with SMTP id i188-20020a6287c50000b02903b5f90fc2ebmr11339383pfe.28.1629318594044;
        Wed, 18 Aug 2021 13:29:54 -0700 (PDT)
Sender: Bobby Eshleman <bobbyeshleman@gmail.com>
From: Bobby Eshleman <bobby.eshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobby.eshleman@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v3 6/6] x86: change asm/debugger.h to xen/debugger.h
Date: Wed, 18 Aug 2021 13:29:07 -0700
Message-Id: <f341cf43ec2fb32a78d92265740e595f56fa76ae.1629315874.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629315873.git.bobby.eshleman@gmail.com>
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit allows non-x86 architecture to omit the file asm/debugger.h
if they do not require it.  It changes debugger.h to be a general
xen/debugger.h which, if CONFIG_CRASH_DEBUG, resolves to include
asm/debugger.h.

It also changes all asm/debugger.h includes to xen/debugger.h.

Because it is no longer required, arm/debugger.h is removed.

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
---
Changes in v3:
- No longer introduces a fake TRAP_invalid_op for arm to consume, it
  is not necessary given the removal of the arm calls now precedes
  this patch.
- Instead of defining prototypes that arch/ is expected to implement,
  this version simply #includes <arch/debugger.h> when CONFIG_CRASH_DEBUG.

 xen/arch/x86/traps.c           |  2 +-
 xen/common/domain.c            |  2 +-
 xen/common/gdbstub.c           |  2 +-
 xen/common/keyhandler.c        |  2 +-
 xen/common/shutdown.c          |  2 +-
 xen/drivers/char/console.c     |  2 +-
 xen/include/asm-arm/debugger.h | 15 ----------
 xen/include/asm-x86/debugger.h | 15 ----------
 xen/include/xen/debugger.h     | 51 ++++++++++++++++++++++++++++++++++
 9 files changed, 57 insertions(+), 36 deletions(-)
 delete mode 100644 xen/include/asm-arm/debugger.h
 create mode 100644 xen/include/xen/debugger.h

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 5947ed25d6..a540f0832e 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -35,6 +35,7 @@
 #include <xen/shutdown.h>
 #include <xen/guest_access.h>
 #include <asm/regs.h>
+#include <xen/debugger.h>
 #include <xen/delay.h>
 #include <xen/event.h>
 #include <xen/spinlock.h>
@@ -62,7 +63,6 @@
 #include <asm/uaccess.h>
 #include <asm/i387.h>
 #include <asm/xstate.h>
-#include <asm/debugger.h>
 #include <asm/domain.h>
 #include <asm/msr.h>
 #include <asm/nmi.h>
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6b71c6d6a9..a87d814b38 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -11,6 +11,7 @@
 #include <xen/err.h>
 #include <xen/param.h>
 #include <xen/sched.h>
+#include <xen/debugger.h>
 #include <xen/domain.h>
 #include <xen/mm.h>
 #include <xen/event.h>
@@ -33,7 +34,6 @@
 #include <xen/xenoprof.h>
 #include <xen/irq.h>
 #include <xen/argo.h>
-#include <asm/debugger.h>
 #include <asm/p2m.h>
 #include <asm/processor.h>
 #include <public/sched.h>
diff --git a/xen/common/gdbstub.c b/xen/common/gdbstub.c
index 848c1f4327..1d7b98cdac 100644
--- a/xen/common/gdbstub.c
+++ b/xen/common/gdbstub.c
@@ -38,12 +38,12 @@
 #include <xen/serial.h>
 #include <xen/irq.h>
 #include <xen/watchdog.h>
-#include <asm/debugger.h>
 #include <xen/init.h>
 #include <xen/param.h>
 #include <xen/smp.h>
 #include <xen/console.h>
 #include <xen/errno.h>
+#include <xen/debugger.h>
 #include <xen/delay.h>
 #include <asm/byteorder.h>
 
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 8b9f378371..1eafaef9b2 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -3,6 +3,7 @@
  */
 
 #include <asm/regs.h>
+#include <xen/debugger.h>
 #include <xen/delay.h>
 #include <xen/keyhandler.h>
 #include <xen/param.h>
@@ -20,7 +21,6 @@
 #include <xen/mm.h>
 #include <xen/watchdog.h>
 #include <xen/init.h>
-#include <asm/debugger.h>
 #include <asm/div64.h>
 
 static unsigned char keypress_key;
diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
index abde48aa4c..a933ee001e 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -2,13 +2,13 @@
 #include <xen/lib.h>
 #include <xen/param.h>
 #include <xen/sched.h>
+#include <xen/debugger.h>
 #include <xen/domain.h>
 #include <xen/delay.h>
 #include <xen/watchdog.h>
 #include <xen/shutdown.h>
 #include <xen/console.h>
 #include <xen/kexec.h>
-#include <asm/debugger.h>
 #include <public/sched.h>
 
 /* opt_noreboot: If true, machine will need manual reset on error. */
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 7d0a603d03..3d1cdde821 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -15,6 +15,7 @@
 #include <xen/init.h>
 #include <xen/event.h>
 #include <xen/console.h>
+#include <xen/debugger.h>
 #include <xen/param.h>
 #include <xen/serial.h>
 #include <xen/softirq.h>
@@ -26,7 +27,6 @@
 #include <xen/kexec.h>
 #include <xen/ctype.h>
 #include <xen/warning.h>
-#include <asm/debugger.h>
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
index 8f6222956e..b9eeed395c 100644
--- a/xen/include/asm-x86/debugger.h
+++ b/xen/include/asm-x86/debugger.h
@@ -25,9 +25,6 @@
 #include <xen/sched.h>
 #include <asm/regs.h>
 #include <asm/processor.h>
-
-#ifdef CONFIG_CRASH_DEBUG
-
 #include <xen/gdbstub.h>
 
 static inline bool debugger_trap_fatal(
@@ -40,16 +37,4 @@ static inline bool debugger_trap_fatal(
 /* Int3 is a trivial way to gather cpu_user_regs context. */
 #define debugger_trap_immediate() __asm__ __volatile__ ( "int3" );
 
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
-#endif
-
 #endif /* __X86_DEBUGGER_H__ */
diff --git a/xen/include/xen/debugger.h b/xen/include/xen/debugger.h
new file mode 100644
index 0000000000..166fad9d2e
--- /dev/null
+++ b/xen/include/xen/debugger.h
@@ -0,0 +1,51 @@
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
+ * Each debugger should define two functions here:
+ *
+ * 1. debugger_trap_fatal():
+ *  Called when Xen is about to give up and crash. Typically you will use this
+ *  hook to drop into a debug session. It can also be used to hook off
+ *  deliberately caused traps (which you then handle and return non-zero).
+ *
+ * 2. debugger_trap_immediate():
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
+#ifdef CONFIG_CRASH_DEBUG
+
+#include <asm/debugger.h>
+
+#else
+
+#include <asm/regs.h>
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
+#endif /* CONFIG_CRASH_DEBUG */
+
+#endif /* __XEN_DEBUGGER_H__ */
-- 
2.32.0


