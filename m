Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9519D457653
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 19:21:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228180.394785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8Vw-0003E9-2C; Fri, 19 Nov 2021 18:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228180.394785; Fri, 19 Nov 2021 18:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8Vv-00034V-Q5; Fri, 19 Nov 2021 18:21:31 +0000
Received: by outflank-mailman (input) for mailman id 228180;
 Fri, 19 Nov 2021 18:21:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvWs=QG=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mo8Vu-0002li-GO
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 18:21:30 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83b28778-4965-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 19:21:29 +0100 (CET)
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
X-Inumbo-ID: 83b28778-4965-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637346089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oebDvExn3h5mZXwVNZR6XTnRXuwlDim+nPy+eMS01Lg=;
  b=VkzycAazMhCTwkI65PoYbauzlp5ulE/dFEQHlnrQzkkaRjy6YtmKvl00
   tb/fWQgST5OG6zzP8S3ZgBBI6fRPoJdLab8nOxWksjDkrUBRnIbvKyGUK
   88RWpFMaSdJPhnfREl+T/vVgMzklo2L4WpH6F+smUzr+Rcnft+Huoqelw
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jZf+f0pPJQRSo2c4Mz2E7Bj9mTPC3M1gwAObLxWEKg4jWn1MtQjj9rmotjgU7Frw7bXvsRvVwC
 PFLLCNQVDSokct9cvoFJxVY3q3ZIG8GSHXSBJ/+JDx1YsRZ66LCQuyQi00Qeu+VIaLlxFHNARN
 Kcs49bjDaCTLCB9R5P1bYjDS6/4eXjIDUD9jG6pN1CKLry6zCd+a/FxvWBl2paUXuMXl7wPKFy
 2kiq7Q1MUwssEIAmWfhcVA1UVxLaPBJucyFGRmsdhvOJq7XurPe/0RazBlC7tbgtt6QLa0xWmi
 LKxXrjgIk1R+KIScHwc5thst
X-SBRS: 5.1
X-MesageID: 58632251
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ohHziaNSSJUTYHrvrR1pkMFynXyQoLVcMsEvi/4bfWQNrUoq3jdRy
 GAcXmCBM/qMZjegeNwnPoywpBxQsZWHz9RmGQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Esyw7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozeYmNNWl
 85ria3zeCcrNL+LyLU7eTANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWdu3ZoUQK+2i
 8wxbR9QZhP6QEF2HloaOcwak8jxp2iuSmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaGrxkffIVLNdELqzCtyKDGpFbIIEItG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslO+ZJhKTysDA3CMqsyq7DEzFtW
 1BexaCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sPum8mdRc0b5ZYEdMMX
 KM1kVkMjHO0FCH0BZKbnqrrU5h6pUQePYqNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid940kFDbClPHCIqdV7wJJjBSFTOK0aYvd/LoarSjeK0kl4U5c9GJstJN5ombp7jODN8
 i3vU0NU0gOn13bGNR+LejZob7a2BcRzqncyPCoNO1e02id8PdbzvflHL5ZnL6M68OFDzOJvS
 6VXccu3HfkSGC/M/C4QbMehodU6Jgirnw+HIwGsfCM7I8x7XwXM99K9Jlnv+SACAzCZr8w7p
 7H8hArXTYBaH1ZpDdrMaeLpxFS05CBPlOV3VkrOA99SZESzr9Q6d32v1qc6epheJw/Cyz2W0
 xetLS0Z/eSd8ZUo9NTphLyfq9v7GeVJAUcHTXLQ6qy7NHeG8zP7k5NASuuBYRvUSHjwpPe5f
 exQwvzxbK8HkVJNv9YuGrpn1/tjtd7mprscxQV4BnTbKV+sD+o4cHWB2MBOsIxLx6NY5lTqC
 h7epIECNOXbIt7hHX4QOBEhP7aK2vwjkzXP6eg4fRfh7yht8bvbCUhfMnFgUsCGwGeZ5G/9/
 dochQ==
IronPort-HdrOrdr: A9a23:zSaxeak4hzgM4y5HUGLiCNhV9+TpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE8Qr5OUtQ/+xoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCBHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.87,248,1631592000"; 
   d="scan'208";a="58632251"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 5/5] x86/traps: Clean up diagnostics
Date: Fri, 19 Nov 2021 18:21:06 +0000
Message-ID: <20211119182106.14868-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211119182106.14868-1-andrew.cooper3@citrix.com>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

do{_reserved,}_trap() should use fatal_trap() rather than opencoding part of
it.  This lets the remote stack trace logic work in more fatal error
conditions.

With do_trap() converted, there is only one single user of trapstr()
remaining.  Tweak the formatting in pv_inject_event(), and remove trapstr()
entirely.

Take the opportunity of exporting vec_name() to improve the diagnostics in
stub_selftest().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/extable.c      |  8 +++++---
 xen/arch/x86/pv/traps.c     |  6 +++---
 xen/arch/x86/traps.c        | 25 +++----------------------
 xen/include/asm-x86/traps.h |  2 +-
 4 files changed, 12 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 109ab7da9811..3cb0352abe5f 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -124,6 +124,8 @@ search_exception_table(const struct cpu_user_regs *regs)
 }
 
 #ifndef NDEBUG
+#include <asm/traps.h>
+
 static int __init stub_selftest(void)
 {
     static const struct {
@@ -172,10 +174,10 @@ static int __init stub_selftest(void)
         if ( res.raw != tests[i].res.raw )
         {
             printk("Selftest %u failed: Opc %*ph "
-                   "expected %u[%04x], got %u[%04x]\n",
+                   "expected %s[%04x], got %s[%04x]\n",
                    i, (int)ARRAY_SIZE(tests[i].opc), tests[i].opc,
-                   tests[i].res.fields.trapnr, tests[i].res.fields.ec,
-                   res.fields.trapnr, res.fields.ec);
+                   vec_name(tests[i].res.fields.trapnr), tests[i].res.fields.ec,
+                   vec_name(res.fields.trapnr), res.fields.ec);
 
             fail = true;
         }
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 1e05a9f1cdad..1d1cb0784c98 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -89,9 +89,9 @@ void pv_inject_event(const struct x86_event *event)
 
     if ( unlikely(null_trap_bounce(curr, tb)) )
     {
-        gprintk(XENLOG_WARNING,
-                "Unhandled %s fault/trap [#%d, ec=%04x]\n",
-                trapstr(vector), vector, error_code);
+        gprintk(XENLOG_ERR,
+                "Unhandled: vec %u, %s[%04x]\n",
+                vector, vec_name(vector), error_code);
 
         if ( vector == TRAP_page_fault )
             show_page_walk(event->cr2);
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e82ab007abcf..7a178f030c73 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -759,21 +759,7 @@ static int nmi_show_execution_state(const struct cpu_user_regs *regs, int cpu)
     return 1;
 }
 
-const char *trapstr(unsigned int trapnr)
-{
-    static const char * const strings[] = {
-        "divide error", "debug", "nmi", "bkpt", "overflow", "bounds",
-        "invalid opcode", "device not available", "double fault",
-        "coprocessor segment", "invalid tss", "segment not found",
-        "stack error", "general protection fault", "page fault",
-        "spurious interrupt", "coprocessor error", "alignment check",
-        "machine check", "simd error", "virtualisation exception"
-    };
-
-    return trapnr < ARRAY_SIZE(strings) ? strings[trapnr] : "???";
-}
-
-static const char *vec_name(unsigned int vec)
+const char *vec_name(unsigned int vec)
 {
     static const char names[][4] = {
 #define P(x) [X86_EXC_ ## x] = "#" #x
@@ -858,9 +844,7 @@ void do_unhandled_trap(struct cpu_user_regs *regs)
     if ( debugger_trap_fatal(trapnr, regs) )
         return;
 
-    show_execution_state(regs);
-    panic("FATAL RESERVED TRAP: vec %u, %s[%04x]\n",
-          trapnr, vec_name(trapnr), regs->error_code);
+    fatal_trap(regs, false);
 }
 
 static void fixup_exception_return(struct cpu_user_regs *regs,
@@ -970,10 +954,7 @@ void do_trap(struct cpu_user_regs *regs)
     if ( debugger_trap_fatal(trapnr, regs) )
         return;
 
-    show_execution_state(regs);
-    panic("FATAL TRAP: vector = %d (%s)\n"
-          "[error_code=%04x]\n",
-          trapnr, trapstr(trapnr), regs->error_code);
+    fatal_trap(regs, false);
 }
 
 int guest_rdmsr_xen(const struct vcpu *v, uint32_t idx, uint64_t *val)
diff --git a/xen/include/asm-x86/traps.h b/xen/include/asm-x86/traps.h
index ec23d3a70b36..3c5feac5e4b1 100644
--- a/xen/include/asm-x86/traps.h
+++ b/xen/include/asm-x86/traps.h
@@ -19,7 +19,7 @@
 #ifndef ASM_TRAP_H
 #define ASM_TRAP_H
 
-const char *trapstr(unsigned int trapnr);
+const char *vec_name(unsigned int vec);
 
 #endif /* ASM_TRAP_H */
 
-- 
2.11.0


