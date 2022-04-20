Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FA4508A73
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 16:13:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309289.525436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB5M-0002ee-Ux; Wed, 20 Apr 2022 14:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309289.525436; Wed, 20 Apr 2022 14:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB5M-0002UH-K7; Wed, 20 Apr 2022 14:13:36 +0000
Received: by outflank-mailman (input) for mailman id 309289;
 Wed, 20 Apr 2022 14:13:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E3+=U6=citrix.com=prvs=10247635a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhB5K-0001HT-AK
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 14:13:34 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e9d7115-c0b4-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 16:13:31 +0200 (CEST)
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
X-Inumbo-ID: 0e9d7115-c0b4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650464011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZZ4LFIyXhFA4quq56SEIYd7bIBzBk+g+i6q0EnuhZrs=;
  b=OUigjGYv7JPs0u8TPgMHaQIFwxBINxWk/03gyY7LNJLGpXNqsCbVVwbN
   cyb1QzdMyZfi73UGX9Hjq0l3F6SiTH0VSDnpFcW8g8LYBXYtSI2TlIMb5
   Wn59qCpb3PdwUPzvAPMVu4CkVm9/cX6syKU/ul88W2K3AJgu66y20nwMu
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69517262
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vjG0caOr2XIUO7/vrR2vl8FynXyQoLVcMsEvi/4bfWQNrUp2hGECz
 mQdDT2AP/eOZTGnKY9yaI3g8UNQvJ/UzoNgTwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2NYw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z8
 e4RqI6LbzwVZaTDnfslYhpfDQBhBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQTKuHO
 JBHM1KDajycPCIQFHQoJKkuhb3rvkPALT5Vgnas8P9fD2/7k1UqjemF3MDuUv6gSNhRn02Yj
 nnb5Gm/CRYfXPSAzRKV/3TqgfXA9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03A
 0YT8CA/66Up9EimS9D7dxK9qX+A+BUbXrJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEefAd2y
 02yuejVXjVgtaKteHGa6JaLlGbnUcQKFlMqaSgBRAoDxtDspoAvkx7CJupe/L6JYs7dQm+pn
 W3TxMQqr/BK1JNQif3nlbzSq2j0zqUlWDLZ8ek+soiNygpiLLCoaIWzgbQwxaYRdd3JJrVtU
 ZVtpiR/0AzsJczV/MBuaL9UdF1M2xpiGGeC6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYSP2NfUrPN3rW5hCIU3c+TLND6G8gj1mOMYZSeN61Hs2OR74M57FzCDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17FPY7ntW+I8nfriil07P+ePHPBa9EO5ZWHPTP7tRxP7V/23oH
 yN3apLiJ+N3C7WuPEE6MOc7cDg3EJTMLcmv9ZcGJ7LZf1IO9aNII6a5/I7NsrdNx8x9/tokN
 FnmMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:SYfyb6HUtKQryQkdpLqE0seALOsnbusQ8zAXP0AYc31om6uj5r
 iTdZUgpGbJYVkqKRIdcLy7V5VoBEmskaKdgrNhW4tKPjOW2ldARbsKheCJrlHd8m/Fh4lgPM
 9bAtND4bbLbWSS4/yV3ODBKadE/OW6
X-IronPort-AV: E=Sophos;i="5.90,275,1643691600"; 
   d="scan'208";a="69517262"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Bobby Eshleman <bobby.eshleman@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v5 2/6] x86/gdbsx: Rename debug.c to gdbsx.c
Date: Wed, 20 Apr 2022 15:13:03 +0100
Message-ID: <20220420141307.24153-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220420141307.24153-1-andrew.cooper3@citrix.com>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Bobby Eshleman <bobby.eshleman@gmail.com>

debug.c contains only dbg_rw_mem().  Rename it to gdbsx.c.

Move gdbsx_guest_mem_io(), and the prior setup of iop->remain, from domctl.c
to gdbsx.c, merging it with dbg_rw_mem().

Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v5:
 * Consolidate hunks from multiple v4 patches
 * Rewrite commit message

The semantics are rather broken.  XEN_DOMCTL_gdbsx_guestmemio only sets
copyback when there's nothing to copy back, and skips copying back in the
-EFAULT case when the iop->remain field is relevant.  Furthermore, it can be
asked to move up to 4GB in one go, with no continuability whatsoever.
---
 xen/arch/x86/Makefile               |  2 +-
 xen/arch/x86/domctl.c               | 14 ++------------
 xen/arch/x86/{debug.c => gdbsx.c}   | 23 ++++++++++-------------
 xen/arch/x86/include/asm/debugger.h |  6 ------
 xen/arch/x86/include/asm/gdbsx.h    | 13 +++++++++++++
 5 files changed, 26 insertions(+), 32 deletions(-)
 rename xen/arch/x86/{debug.c => gdbsx.c} (89%)
 create mode 100644 xen/arch/x86/include/asm/gdbsx.h

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 717bcbcac7a0..177a2ff74272 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -22,7 +22,6 @@ obj-y += cpuid.o
 obj-$(CONFIG_PV) += compat.o
 obj-$(CONFIG_PV32) += x86_64/compat.o
 obj-$(CONFIG_KEXEC) += crash.o
-obj-$(CONFIG_GDBSX) += debug.o
 obj-y += delay.o
 obj-y += desc.o
 obj-bin-y += dmi_scan.init.o
@@ -34,6 +33,7 @@ obj-y += emul-i8254.o
 obj-y += extable.o
 obj-y += flushtlb.o
 obj-$(CONFIG_CRASH_DEBUG) += gdbstub.o
+obj-$(CONFIG_GDBSX) += gdbsx.o
 obj-y += hypercall.o
 obj-y += i387.o
 obj-y += i8259.o
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index a6aae500a30b..c20ab4352715 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -20,6 +20,8 @@
 #include <xen/console.h>
 #include <xen/iocap.h>
 #include <xen/paging.h>
+
+#include <asm/gdbsx.h>
 #include <asm/irq.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
@@ -33,20 +35,9 @@
 #include <public/vm_event.h>
 #include <asm/mem_sharing.h>
 #include <asm/xstate.h>
-#include <asm/debugger.h>
 #include <asm/psr.h>
 #include <asm/cpuid.h>
 
-#ifdef CONFIG_GDBSX
-static int gdbsx_guest_mem_io(struct domain *d, struct xen_domctl_gdbsx_memio *iop)
-{
-    iop->remain = dbg_rw_mem(iop->gva, guest_handle_from_ptr(iop->uva, void),
-                             iop->len, d, iop->gwr, iop->pgd3val);
-
-    return iop->remain ? -EFAULT : 0;
-}
-#endif
-
 static int update_domain_cpu_policy(struct domain *d,
                                     xen_domctl_cpu_policy_t *xdpc)
 {
@@ -827,7 +818,6 @@ long arch_do_domctl(
 
 #ifdef CONFIG_GDBSX
     case XEN_DOMCTL_gdbsx_guestmemio:
-        domctl->u.gdbsx_guest_memio.remain = domctl->u.gdbsx_guest_memio.len;
         ret = gdbsx_guest_mem_io(d, &domctl->u.gdbsx_guest_memio);
         if ( !ret )
            copyback = true;
diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/gdbsx.c
similarity index 89%
rename from xen/arch/x86/debug.c
rename to xen/arch/x86/gdbsx.c
index 91034a852e5f..59eb31fc9a6a 100644
--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/gdbsx.c
@@ -18,7 +18,7 @@
 #include <xen/mm.h>
 #include <xen/domain_page.h>
 #include <xen/guest_access.h>
-#include <asm/debugger.h>
+#include <asm/gdbsx.h>
 #include <asm/p2m.h>
 
 typedef unsigned long dbgva_t;
@@ -150,21 +150,18 @@ static unsigned int dbg_rw_guest_mem(struct domain *dp, unsigned long addr,
     return len;
 }
 
-/*
- * addr is guest addr
- * buf is debugger buffer.
- * if toaddr, then addr = buf (write to addr), else buf = addr (rd from guest)
- * pgd3: value of init_mm.pgd[3] in guest. see above.
- * Returns: number of bytes remaining to be copied.
- */
-unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
-                        unsigned int len, struct domain *d, bool toaddr,
-                        uint64_t pgd3)
+int gdbsx_guest_mem_io(struct domain *d, struct xen_domctl_gdbsx_memio *iop)
 {
     if ( d && !d->is_dying )
-        len = dbg_rw_guest_mem(d, gva, buf, len, toaddr, pgd3);
+    {
+        iop->remain = dbg_rw_guest_mem(
+            d, iop->gva, guest_handle_from_ptr(iop->uva, void),
+            iop->len, iop->gwr, iop->pgd3val);
+    }
+    else
+        iop->remain = iop->len;
 
-    return len;
+    return iop->remain ? -EFAULT : 0;
 }
 
 /*
diff --git a/xen/arch/x86/include/asm/debugger.h b/xen/arch/x86/include/asm/debugger.h
index e83b346a21d1..c5585752cae7 100644
--- a/xen/arch/x86/include/asm/debugger.h
+++ b/xen/arch/x86/include/asm/debugger.h
@@ -54,10 +54,4 @@ static inline bool debugger_trap_fatal(
 
 #endif
 
-#ifdef CONFIG_GDBSX
-unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
-                        unsigned int len, struct domain *d, bool toaddr,
-                        uint64_t pgd3);
-#endif
-
 #endif /* __X86_DEBUGGER_H__ */
diff --git a/xen/arch/x86/include/asm/gdbsx.h b/xen/arch/x86/include/asm/gdbsx.h
new file mode 100644
index 000000000000..eee746fc01d0
--- /dev/null
+++ b/xen/arch/x86/include/asm/gdbsx.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __X86_GDBX_H__
+#define __X86_GDBX_H__
+
+#ifdef CONFIG_GDBSX
+
+struct domain;
+struct xen_domctl_gdbsx_memio;
+
+int gdbsx_guest_mem_io(struct domain *d, struct xen_domctl_gdbsx_memio *iop);
+
+#endif /* CONFIG_GDBSX */
+#endif /* __X86_GDBX_H__ */
-- 
2.11.0


