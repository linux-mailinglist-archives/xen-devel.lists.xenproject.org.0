Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E6241B85A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 22:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198423.351959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJl3-0006xI-QL; Tue, 28 Sep 2021 20:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198423.351959; Tue, 28 Sep 2021 20:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVJl3-0006t8-KN; Tue, 28 Sep 2021 20:31:21 +0000
Received: by outflank-mailman (input) for mailman id 198423;
 Tue, 28 Sep 2021 20:31:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sVw8=OS=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1mVJl2-0004O5-9I
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 20:31:20 +0000
Received: from mail-pf1-x42f.google.com (unknown [2607:f8b0:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad3a4beb-484e-4986-b3e6-d1314893e9a2;
 Tue, 28 Sep 2021 20:30:57 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id w19so19832006pfn.12
 for <xen-devel@lists.xenproject.org>; Tue, 28 Sep 2021 13:30:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::5])
 by smtp.gmail.com with ESMTPSA id p15sm44201pfn.31.2021.09.28.13.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 13:30:55 -0700 (PDT)
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
X-Inumbo-ID: ad3a4beb-484e-4986-b3e6-d1314893e9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=er5faQ/st6GZye51adynMEU5HSlpMR7iwTJec4b9TtQ=;
        b=o85TT2UfMEB+cmfXfH4HpYaImrks1IEaD2YggbPCmcwkX9St2K8GM9HI9JyW2Yj0Hr
         g0p6meZ1346IppM4mS0I7rXJ+KGkorCm3594/SQAQJafbuORffI4kzanmc9pHNITfxXJ
         sLvvznt1/Qsd4TCUP/kYJJ57eigIqtg2QZEE5aNc9xzPFQPHB2aCHovOND/TMOZbV0yd
         zjM512H29H+ooNuLUMCnM3vPcv2Mxmwa4spCgR4Jnunzu6/AwzQncwF7a66b7bhrKAHz
         tt5J2vdvHVroEuJA8lnCs43rPN8LS+bV777aP3kTnxzx2OsskhcR7kS5mzQr9n1j+4Pq
         1vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=er5faQ/st6GZye51adynMEU5HSlpMR7iwTJec4b9TtQ=;
        b=YVKH3UyHBRAm+SfliQJxU6wre/HxVD2NBKxmQO/KhITvfASJ880Ng3GReD1MlI+L9j
         QSvRyLlZUP4P7/2YwRTPXQ8/ZQFbpSeugksh0KUpNSAwrPFoWAlrlzI0V2RZib1ph+k0
         zSBINFqPYrIrTGd5DqR4z4gOdklS7Br7Lb3HnoGmqua4ftLdmENv4WzJ2Fondw73xYKp
         f8xPmYEzYDRX7Sl6gD/21cNEHv13hf4cONl5fjoTDHd/FuOb/r+SmekT3VD1uKhntNOw
         hSq1M6oJcCWflelUicqmSjqk+ZwBQj/E2gWU0p7SGQo2+8DbW5EqIEodRZV3rhzcPtyw
         eGwg==
X-Gm-Message-State: AOAM533fo6CucR60qcYs8tgypfVw8VG52Al4wF0k2ZT+W+dswG0dPRCi
	DI+eu1AVs161bVLYRCLlfFVnEV/lSlqvCykI
X-Google-Smtp-Source: ABdhPJxiI0TvKS/plq0MCTX0bETK0mqEoV9I6fx4ued2x3fw34vZ90o7HgedhDr+VfoqMwzxvzdthg==
X-Received: by 2002:a63:3408:: with SMTP id b8mr6418520pga.340.1632861056227;
        Tue, 28 Sep 2021 13:30:56 -0700 (PDT)
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
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v4 6/6] x86: change asm/debugger.h to xen/debugger.h
Date: Tue, 28 Sep 2021 13:30:29 -0700
Message-Id: <8c340b24b41af349069ad55e1f0421e17fad1d6f.1632860589.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1632860589.git.bobby.eshleman@gmail.com>
References: <cover.1632860589.git.bobby.eshleman@gmail.com>
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
Changes in v4:
- Replace #include <asm/regs.h> with `struct cpu_user_regs`

 xen/arch/x86/traps.c           |  1 +
 xen/common/domain.c            |  2 +-
 xen/common/gdbstub.c           |  2 +-
 xen/common/keyhandler.c        |  2 +-
 xen/common/shutdown.c          |  2 +-
 xen/drivers/char/console.c     |  2 +-
 xen/include/asm-arm/debugger.h | 15 ----------
 xen/include/asm-x86/debugger.h | 15 ----------
 xen/include/xen/debugger.h     | 51 ++++++++++++++++++++++++++++++++++
 9 files changed, 57 insertions(+), 35 deletions(-)
 delete mode 100644 xen/include/asm-arm/debugger.h
 create mode 100644 xen/include/xen/debugger.h

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 742fa9e2ca..36d7fc6238 100644
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
index 0000000000..ddaa4a938b
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
+struct cpu_user_regs;
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


