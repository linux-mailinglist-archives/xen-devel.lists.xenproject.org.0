Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855993C9245
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 22:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156213.288271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3leD-0000gy-5T; Wed, 14 Jul 2021 20:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156213.288271; Wed, 14 Jul 2021 20:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3leC-0000eq-Vb; Wed, 14 Jul 2021 20:38:24 +0000
Received: by outflank-mailman (input) for mailman id 156213;
 Wed, 14 Jul 2021 20:38:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxbS=MG=gmail.com=bobby.eshleman@srs-us1.protection.inumbo.net>)
 id 1m3leC-0000KG-5Z
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 20:38:24 +0000
Received: from mail-pj1-x102d.google.com (unknown [2607:f8b0:4864:20::102d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8a3144c-427d-4b48-93a9-b509a296a775;
 Wed, 14 Jul 2021 20:38:21 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so4644124pju.4
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jul 2021 13:38:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4c02:4c00::1])
 by smtp.gmail.com with ESMTPSA id b17sm1785084pfm.54.2021.07.14.13.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 13:38:20 -0700 (PDT)
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
X-Inumbo-ID: b8a3144c-427d-4b48-93a9-b509a296a775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jpxytOQI7mEBkhk32tjmUuolX/Q1Yn907IdDWiELMV8=;
        b=KykIMWqip6LoIXDyfSIq1qKR+Gka1EeLBtyAXfy1PAyEX8IAy2CQqBjYs+iQijhq6E
         oBqqmHG2YYeB3U5oMTWVRcfkb4fL00GONk9XjkW2XRkzrtYfVTBR7zG6+sb1SWWUPo0d
         RLhSFnIRmEu8g/8H2D+D3qiY/UDijfXhagimglVk+VqWzOCVeOuKfLBsUPbbEsN2KMJJ
         KiYBdkJSgZqe+49Pc1s8J2bv0NW8dGkSTnYbOejvZJe042W6lOnLymZPLhzXkIQrshvp
         4cwmheN/i92dLZ/ybShqNLaI+2bKo4fmCKWh0DalRAW+MLXY23gi8R07mQij5NJfHjtJ
         GVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=jpxytOQI7mEBkhk32tjmUuolX/Q1Yn907IdDWiELMV8=;
        b=VOvJt6baTOUJyBovXq8/mPrQHDyzgOgxbjw4AhHOEsMH5n+V9dAt/PfzlfySxR4TlO
         /T73+GEP9TZxgC4EcS7sCkutDEzZAFgUT1t+JV5XIzRXpcBi0rpqtGRT5BXAtEgD2FLA
         aslPolNUSyp8RVA41tnhqu7RRnpTWyKCQZouryldwnLYTNalbF1xhUcwD3DyFNFv1wbR
         972iIeNBEi4U+zsNywghHJYqF/Djegsx+PcP+/g0GGh0ZsdPruCnD3XSqPsiOpKvoTy7
         ClvQUrVrp9mGcHnTDC4oN1jtIQletQibqBY9vexoK0TrGwPvF4lOL/wbIQhlDCpaR0h+
         /Xhw==
X-Gm-Message-State: AOAM531w8B9uKqgg9DOkPdicJZ9Z7qkb+cACqiUOQ0UpLpRUdxEsImr+
	6a0I17zHUGxjTF20kKSVHz525V8xwWXgjksC
X-Google-Smtp-Source: ABdhPJz+EAy20EOa/LMJc6vD8Yk4JeBto6hIMQMv4UVrk1D9AH1LmIfGafjTYMw04uoHk67badcmLw==
X-Received: by 2002:a17:90b:fd6:: with SMTP id gd22mr5497865pjb.37.1626295100499;
        Wed, 14 Jul 2021 13:38:20 -0700 (PDT)
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
Subject: [PATCH v2 2/4] build: use common stubs for debugger_trap_* functions if !CONFIG_CRASH_DEBUG
Date: Wed, 14 Jul 2021 13:37:45 -0700
Message-Id: <d74af998bfd8d00e57ea82ce6731ccf2afc8e95b.1626286772.git.bobby.eshleman@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1626286772.git.bobby.eshleman@gmail.com>
References: <cover.1626286772.git.bobby.eshleman@gmail.com>
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
---

Changes in v2:
- #include ordering (xen/.h before asm/.h, alphabetical order)
- Other style (no double blanks in comments).
- Removed dummy TRAP_invalid_op for ARM (not needed because
  the patch to remove the calls is now prior to this patch)
- Removed common-izing of dbg_rw_mem

 xen/arch/arm/traps.c            |  2 +-
 xen/arch/x86/debug.c            |  2 +-
 xen/arch/x86/domain.c           |  5 ++-
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
 xen/include/asm-arm/debugger.h  | 15 -------
 xen/include/asm-x86/debugger.h  | 60 ++++++----------------------
 xen/include/xen/debugger.h      | 69 +++++++++++++++++++++++++++++++++
 19 files changed, 103 insertions(+), 80 deletions(-)
 delete mode 100644 xen/include/asm-arm/debugger.h
 create mode 100644 xen/include/xen/debugger.h

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index dd09d2a4a9..10db98e01a 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -16,6 +16,7 @@
  * GNU General Public License for more details.
  */
 
+#include <xen/debugger.h>
 #include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/hypercall.h>
@@ -41,7 +42,6 @@
 #include <asm/acpi.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
-#include <asm/debugger.h>
 #include <asm/event.h>
 #include <asm/hsr.h>
 #include <asm/mmio.h>
diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
index d90dc93056..583a9a042a 100644
--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/debug.c
@@ -14,12 +14,12 @@
  * License along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/debugger.h>
 #include <xen/sched.h>
 #include <xen/compile.h>
 #include <xen/mm.h>
 #include <xen/domain_page.h>
 #include <xen/guest_access.h>
-#include <asm/debugger.h>
 #include <asm/p2m.h>
 
 typedef unsigned long dbgva_t;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ef1812dc14..5b948ff270 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -15,6 +15,7 @@
 #include <xen/lib.h>
 #include <xen/errno.h>
 #include <xen/sched.h>
+#include <xen/debugger.h>
 #include <xen/domain.h>
 #include <xen/smp.h>
 #include <xen/delay.h>
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
index 26a76d2be9..24bdb86de7 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -12,6 +12,7 @@
 #include <xen/pci.h>
 #include <public/domctl.h>
 #include <xen/sched.h>
+#include <xen/debugger.h>
 #include <xen/domain.h>
 #include <xen/event.h>
 #include <xen/domain_page.h>
@@ -33,7 +34,6 @@
 #include <public/vm_event.h>
 #include <asm/mem_sharing.h>
 #include <asm/xstate.h>
-#include <asm/debugger.h>
 #include <asm/psr.h>
 #include <asm/cpuid.h>
 
diff --git a/xen/arch/x86/gdbstub.c b/xen/arch/x86/gdbstub.c
index 8f4f49fd3b..5e23d27f62 100644
--- a/xen/arch/x86/gdbstub.c
+++ b/xen/arch/x86/gdbstub.c
@@ -18,7 +18,9 @@
  * You should have received a copy of the GNU General Public License
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
-#include <asm/debugger.h>
+#include <xen/debugger.h>
+#include <xen/gdbstub.h>
+#include <asm/uaccess.h>
 
 u16
 gdb_arch_signal_num(struct cpu_user_regs *regs, unsigned long cookie)
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 642a64b747..ce1cbe7825 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -24,6 +24,7 @@
 #include <xen/irq.h>
 #include <xen/softirq.h>
 #include <xen/hypercall.h>
+#include <xen/debugger.h>
 #include <xen/domain_page.h>
 #include <xen/xenoprof.h>
 #include <asm/current.h>
@@ -58,7 +59,6 @@
 #include <asm/hvm/trace.h>
 #include <asm/hap.h>
 #include <asm/apic.h>
-#include <asm/debugger.h>
 #include <asm/hvm/monitor.h>
 #include <asm/monitor.h>
 #include <asm/xstate.h>
diff --git a/xen/arch/x86/hvm/vmx/realmode.c b/xen/arch/x86/hvm/vmx/realmode.c
index cc23afa788..57d230c4fe 100644
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -9,12 +9,12 @@
  *    Keir Fraser <keir@xen.org>
  */
 
+#include <xen/debugger.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/paging.h>
 #include <xen/softirq.h>
-#include <asm/debugger.h>
 #include <asm/event.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index e09b7e3af9..00107e8a3b 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -23,6 +23,7 @@
 #include <xen/sched.h>
 #include <xen/irq.h>
 #include <xen/softirq.h>
+#include <xen/debugger.h>
 #include <xen/domain_page.h>
 #include <xen/hypercall.h>
 #include <xen/perfc.h>
@@ -51,7 +52,6 @@
 #include <asm/hvm/trace.h>
 #include <asm/hvm/monitor.h>
 #include <asm/xenoprof.h>
-#include <asm/debugger.h>
 #include <asm/apic.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/altp2m.h>
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index ab94a96c4d..505358b656 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -18,6 +18,7 @@
 #include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/irq.h>
+#include <xen/debugger.h>
 #include <xen/delay.h>
 #include <xen/time.h>
 #include <xen/sched.h>
@@ -30,7 +31,6 @@
 #include <asm/msr.h>
 #include <asm/mpspec.h>
 #include <asm/nmi.h>
-#include <asm/debugger.h>
 #include <asm/div64.h>
 #include <asm/apic.h>
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e60af16ddd..8561ffe3fe 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -27,6 +27,7 @@
 #include <xen/init.h>
 #include <xen/sched.h>
 #include <xen/lib.h>
+#include <xen/debugger.h>
 #include <xen/err.h>
 #include <xen/errno.h>
 #include <xen/mm.h>
@@ -62,7 +63,6 @@
 #include <asm/uaccess.h>
 #include <asm/i387.h>
 #include <asm/xstate.h>
-#include <asm/debugger.h>
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
index 848c1f4327..c233eb2b49 100644
--- a/xen/common/gdbstub.c
+++ b/xen/common/gdbstub.c
@@ -38,12 +38,13 @@
 #include <xen/serial.h>
 #include <xen/irq.h>
 #include <xen/watchdog.h>
-#include <asm/debugger.h>
 #include <xen/init.h>
 #include <xen/param.h>
 #include <xen/smp.h>
 #include <xen/console.h>
 #include <xen/errno.h>
+#include <xen/gdbstub.h>
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
index abde48aa4c..f51d44fdc4 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -1,3 +1,4 @@
+#include <xen/debugger.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/param.h>
@@ -8,7 +9,6 @@
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
index 99803bfd0c..c856c1b795 100644
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
 
+#include <xen/domain.h>
+#include <xen/event.h>
+#include <xen/gdbstub.h>
 #include <xen/sched.h>
 #include <asm/regs.h>
 #include <asm/processor.h>
 
 void domain_pause_for_debugger(void);
 
-#ifdef CONFIG_CRASH_DEBUG
-
-#include <xen/gdbstub.h>
-
 static inline bool debugger_trap_fatal(
     unsigned int vector, struct cpu_user_regs *regs)
 {
@@ -74,28 +56,10 @@ static inline bool debugger_trap_entry(
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
 #ifdef CONFIG_GDBSX
 unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
                         unsigned int len, domid_t domid, bool toaddr,
                         uint64_t pgd3);
-#endif
+#endif /* CONFIG_GDBSX */
 
 #endif /* __X86_DEBUGGER_H__ */
diff --git a/xen/include/xen/debugger.h b/xen/include/xen/debugger.h
new file mode 100644
index 0000000000..64745fbe8f
--- /dev/null
+++ b/xen/include/xen/debugger.h
@@ -0,0 +1,69 @@
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
+#endif /* __XEN_DEBUGGER_H__ */
-- 
2.30.0


