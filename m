Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F49508A70
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 16:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309285.525398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB5I-0001ei-Kb; Wed, 20 Apr 2022 14:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309285.525398; Wed, 20 Apr 2022 14:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhB5I-0001Zd-CI; Wed, 20 Apr 2022 14:13:32 +0000
Received: by outflank-mailman (input) for mailman id 309285;
 Wed, 20 Apr 2022 14:13:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E3+=U6=citrix.com=prvs=10247635a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhB5H-0001HT-EW
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 14:13:31 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c15dbb2-c0b4-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 16:13:29 +0200 (CEST)
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
X-Inumbo-ID: 0c15dbb2-c0b4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650464008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3bpTvdBqxpC9w/lc1aSyt+uk0x3/FV7Yyt5iB0rwB6Y=;
  b=Ye6j4eWlS1RvHlAmMTEQHanJDoYHJUjQh+fIR4IQsCo+3oYgj6UgXOo7
   jRYuNxjaQJ5Umnq8BmMtrk9e+R7grWae8TpWjtbibKGF8WkemLhzQflmp
   ML9bRRPQFyhwbkJWWYsVn2h1BQSy06MWNAlkf77xZcL22cJ7DWtTg5HBM
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 69517259
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RL9cHaBDpYr7yxVW/1njw5YqxClBgxIJ4kV8jS/XYbTApGgl0mAGz
 2BJUDuFMq2PZTCjKtkjPI2xpkIF6sPRmtZnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Jj2tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhI8
 4lQp6eWcjtyN6LJh9wsUB5GMj5HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4fQK+BP
 ZdIAdZpRFPKJE1DA0oSNLQvteSmlHfkIxoGqHvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0YuEMDv8BzjqxkaPb5hmhN2sDUB9eUYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNP9D2BLwQKChRqlEGp+ZgPf1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zpib/JdoMv24kdBsB3iM4ldnBO
 R67VeR5vsE7AZdXRfUvP9LZ5zoCkcAM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBNErE3LA
 r/CKZzEJS9DUcxPlWPqL89AgORD7n1vmgvuqWXTkk3PPUy2PybFF9/o8TKmM4gE0U9ziFyMr
 Y0OZpfQlk03vS+XSnC/zLP/5GsidRATba0aYeQNHgJfCmKKwF0cNsI=
IronPort-HdrOrdr: A9a23:1vSlO6tXvfEeQotpB9Wl266T7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.90,275,1643691600"; 
   d="scan'208";a="69517259"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v5 3/6] x86/gdbsx: Move domain_pause_for_debugger() into gdbsx
Date: Wed, 20 Apr 2022 15:13:04 +0100
Message-ID: <20220420141307.24153-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220420141307.24153-1-andrew.cooper3@citrix.com>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

domain_pause_for_debugger() is guest debugging (CONFIG_GDBSX) not host
debugging (CONFIG_CRASH_DEBUG).

Move it into the new gdbsx.c to drop the (incorrect) ifdefary, and provide a
static inline in the !CONFIG_GDBSX case so callers can optimise away
everything rather than having to emit a call to an empty function.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v5:
 * Basically new.  Reworked entirely after re-considering other cleanup.
---
 xen/arch/x86/domain.c               | 14 --------------
 xen/arch/x86/gdbsx.c                | 14 ++++++++++++++
 xen/arch/x86/hvm/svm/svm.c          |  2 +-
 xen/arch/x86/hvm/vmx/realmode.c     |  3 ++-
 xen/arch/x86/hvm/vmx/vmx.c          |  2 +-
 xen/arch/x86/include/asm/debugger.h |  2 --
 xen/arch/x86/include/asm/gdbsx.h    |  6 ++++++
 xen/arch/x86/nmi.c                  |  1 -
 xen/arch/x86/traps.c                |  1 +
 9 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index a5048ed6546a..a72cc9552ad6 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2540,20 +2540,6 @@ static int __init cf_check init_vcpu_kick_softirq(void)
 }
 __initcall(init_vcpu_kick_softirq);
 
-void domain_pause_for_debugger(void)
-{
-#ifdef CONFIG_CRASH_DEBUG
-    struct vcpu *curr = current;
-    struct domain *d = curr->domain;
-
-    domain_pause_by_systemcontroller_nosync(d);
-
-    /* if gdbsx active, we just need to pause the domain */
-    if ( curr->arch.gdbsx_vcpu_event == 0 )
-        send_global_virq(VIRQ_DEBUGGER);
-#endif
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/gdbsx.c b/xen/arch/x86/gdbsx.c
index 59eb31fc9a6a..6ef46e8ea77d 100644
--- a/xen/arch/x86/gdbsx.c
+++ b/xen/arch/x86/gdbsx.c
@@ -18,6 +18,8 @@
 #include <xen/mm.h>
 #include <xen/domain_page.h>
 #include <xen/guest_access.h>
+#include <xen/event.h>
+
 #include <asm/gdbsx.h>
 #include <asm/p2m.h>
 
@@ -164,6 +166,18 @@ int gdbsx_guest_mem_io(struct domain *d, struct xen_domctl_gdbsx_memio *iop)
     return iop->remain ? -EFAULT : 0;
 }
 
+void domain_pause_for_debugger(void)
+{
+    struct vcpu *curr = current;
+    struct domain *d = curr->domain;
+
+    domain_pause_by_systemcontroller_nosync(d);
+
+    /* if gdbsx active, we just need to pause the domain */
+    if ( curr->arch.gdbsx_vcpu_event == 0 )
+        send_global_virq(VIRQ_DEBUGGER);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 2455835eda62..0849a9dc5f41 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -58,7 +58,7 @@
 #include <asm/hvm/trace.h>
 #include <asm/hap.h>
 #include <asm/apic.h>
-#include <asm/debugger.h>
+#include <asm/gdbsx.h>
 #include <asm/hvm/monitor.h>
 #include <asm/monitor.h>
 #include <asm/xstate.h>
diff --git a/xen/arch/x86/hvm/vmx/realmode.c b/xen/arch/x86/hvm/vmx/realmode.c
index cc23afa788c2..4ac93e081015 100644
--- a/xen/arch/x86/hvm/vmx/realmode.c
+++ b/xen/arch/x86/hvm/vmx/realmode.c
@@ -14,7 +14,8 @@
 #include <xen/sched.h>
 #include <xen/paging.h>
 #include <xen/softirq.h>
-#include <asm/debugger.h>
+
+#include <asm/gdbsx.h>
 #include <asm/event.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index af9ee7cebbe0..cc8c4e9f044a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -51,7 +51,7 @@
 #include <asm/hvm/trace.h>
 #include <asm/hvm/monitor.h>
 #include <asm/xenoprof.h>
-#include <asm/debugger.h>
+#include <asm/gdbsx.h>
 #include <asm/apic.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/altp2m.h>
diff --git a/xen/arch/x86/include/asm/debugger.h b/xen/arch/x86/include/asm/debugger.h
index c5585752cae7..9a3132356fd6 100644
--- a/xen/arch/x86/include/asm/debugger.h
+++ b/xen/arch/x86/include/asm/debugger.h
@@ -26,8 +26,6 @@
 #include <asm/regs.h>
 #include <asm/processor.h>
 
-void domain_pause_for_debugger(void);
-
 #ifdef CONFIG_CRASH_DEBUG
 
 #include <xen/gdbstub.h>
diff --git a/xen/arch/x86/include/asm/gdbsx.h b/xen/arch/x86/include/asm/gdbsx.h
index eee746fc01d0..938eb74e2e25 100644
--- a/xen/arch/x86/include/asm/gdbsx.h
+++ b/xen/arch/x86/include/asm/gdbsx.h
@@ -9,5 +9,11 @@ struct xen_domctl_gdbsx_memio;
 
 int gdbsx_guest_mem_io(struct domain *d, struct xen_domctl_gdbsx_memio *iop);
 
+void domain_pause_for_debugger(void);
+
+#else
+
+static inline void domain_pause_for_debugger(void) {}
+
 #endif /* CONFIG_GDBSX */
 #endif /* __X86_GDBX_H__ */
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 302eaf2ff39a..765602374802 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -30,7 +30,6 @@
 #include <asm/msr.h>
 #include <asm/mpspec.h>
 #include <asm/nmi.h>
-#include <asm/debugger.h>
 #include <asm/div64.h>
 #include <asm/apic.h>
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 84cd038dc38b..d91532461189 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -58,6 +58,7 @@
 #include <xen/bitops.h>
 #include <asm/desc.h>
 #include <asm/debugreg.h>
+#include <asm/gdbsx.h>
 #include <asm/smp.h>
 #include <asm/flushtlb.h>
 #include <asm/uaccess.h>
-- 
2.11.0


