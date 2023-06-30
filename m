Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB05743EA1
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 17:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557553.871019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFFwS-0007rQ-Pi; Fri, 30 Jun 2023 15:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557553.871019; Fri, 30 Jun 2023 15:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFFwS-0007oY-Lr; Fri, 30 Jun 2023 15:21:48 +0000
Received: by outflank-mailman (input) for mailman id 557553;
 Fri, 30 Jun 2023 15:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHd2=CS=citrix.com=prvs=53833986c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qFFwR-0007oO-RZ
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 15:21:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d21f1d6a-1759-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 17:21:45 +0200 (CEST)
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
X-Inumbo-ID: d21f1d6a-1759-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688138506;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rGV6+lCKZt5jNhJl698X1kt5ZQ7k2NBNoItr0lRmbJo=;
  b=AkeqI7K8EPaioQxUHsUGdl6xkpUpLIgtYIERuSd+3rU2Czbsp/+v7HMA
   EDs4Tygv5/nrOQWVM8wAfzAk259sDnAh4FF2i5d3mRAfLW3cnUHRpH1Wu
   e9HIZsvMqBo8E9vC7Ej8KlTWrbUoTNOiifiZOP05e0CqtelVzEODWbn4u
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 115177839
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:cVUsXaOcG9WpXJfvrR2gl8FynXyQoLVcMsEvi/4bfWQNrUor1mEHz
 msXXWCPbv3eZTakeY9xa4mwpkJT6sLWnNViQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tG5QRmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uRsUHpl3
 OwDEgEiZQGEv9/xkbyXFMA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXTGJwKwRbD9
 woq+Uz7Cz0/DM6R0QGGyXyltPP/wz39ZoMdQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBeeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwAXNj4ZTgYUVjE0zNLyp7kOyUPBYohKRfvdYsLOJd3g/
 9ybhHFg1+VK1JdTjfXTEUPv2Gz1+MWQJuIhzkCOBz/+sFskDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKMN8N7n9hV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEnM9rvUJpxk/W6SrwJs8w4ifIUO/BMmPKvpnkyNSZ8IUiz+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48gPUwDn0gDKZfobcmjlXyPiOPODEN5vJ9ZaDNimMhltvLbyOgUm
 v4DX/a3J+J3CbyhPneNq9ZJdjjn7xETXPjLliCeTcbbSiIOJY3rI66IqV/9U+SJR5hoq9o=
IronPort-HdrOrdr: A9a23:0cE93a9ow9zRPdP3hFVuk+DUI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+8jztCWE7Ar5N0tBpTntAsW9qBDnhPtICOsqTNSftWDd0QPCRuxfBOPZslvd8kbFl9K1u5
 0OT0EHMqyTMWRH
X-Talos-CUID: 9a23:ujiAY2A2k/wb+FT6Eyt8pVU/M9A+SEzyx2bXG3L/WGhFFpTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3At875WQ+oFGRkS1Q4+gVyL4mQf8Vhz4GWGk4VqpY?=
 =?us-ascii?q?9tcC2KRwuJTGjjTviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,171,1684814400"; 
   d="scan'208";a="115177839"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/asm: Introduce a tailcall pseduo-op
Date: Fri, 30 Jun 2023 16:20:57 +0100
Message-ID: <20230630152057.2944373-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It was previously noted that CALL/BUG is a weird combination, but there is
good reason to use this pattern.

Introduce an explicit tailcall macro make it clearer in context.

No functional change.

Reported-by: Jan Beulich <JBeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

It would be nicer if tailcall was shorter, but that loses clarity.  RISC-V has
'tail' as an alias for 'b', but that looses the call aspect, and tcall isn't
sufficiently recognisable as tailcall IMO.
---
 xen/arch/x86/boot/x86_64.S           |  6 ++----
 xen/arch/x86/include/asm/asm-defns.h |  9 +++++++++
 xen/arch/x86/x86_64/entry.S          | 12 ++++--------
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 5d12937a0e40..04bb62ae8680 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -74,14 +74,12 @@ ENTRY(__high_start)
 .L_ap_cet_done:
 #endif /* CONFIG_XEN_SHSTK || CONFIG_XEN_IBT */
 
-        call    start_secondary
-        BUG     /* start_secondary() shouldn't return. */
+        tailcall start_secondary
 
 .L_bsp:
         /* Pass off the Multiboot info structure to C land (if applicable). */
         mov     multiboot_ptr(%rip),%edi
-        call    __start_xen
-        BUG     /* __start_xen() shouldn't return. */
+        tailcall __start_xen
 
         .section .data.page_aligned, "aw", @progbits
         .align PAGE_SIZE, 0
diff --git a/xen/arch/x86/include/asm/asm-defns.h b/xen/arch/x86/include/asm/asm-defns.h
index 8bd9007731d5..9a7073ced5be 100644
--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -20,6 +20,15 @@
     .byte 0x0f, 0x01, 0xdd
 .endm
 
+/*
+ * Call a noreturn function.  This could be JMP, but CALL results in a more
+ * helpful backtrace.  BUG is to catch functions which do decide to return...
+ */
+.macro tailcall fn:req
+    call  \fn
+    BUG   /* Shouldn't return */
+.endm
+
 .macro INDIRECT_BRANCH insn:req arg:req
 /*
  * Create an indirect branch.  insn is one of call/jmp, arg is a single
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 8b77d7113bbf..bca1500e2b45 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -824,8 +824,7 @@ handle_exception_saved:
         DISPATCH(X86_EXC_CP, do_entry_CP)
 #undef DISPATCH
 
-        call  do_unhandled_trap
-        BUG   /* do_unhandled_trap() shouldn't return. */
+        tailcall do_unhandled_trap
 
 .L_exn_dispatch_done:
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
@@ -880,8 +879,7 @@ exception_with_ints_disabled:
 FATAL_exception_with_ints_disabled:
         xorl  %esi,%esi
         movq  %rsp,%rdi
-        call  fatal_trap
-        BUG   /* fatal_trap() shouldn't return. */
+        tailcall fatal_trap
 
 ENTRY(divide_error)
         ENDBR64
@@ -989,8 +987,7 @@ ENTRY(double_fault)
 .Ldblf_cr3_okay:
 
         movq  %rsp,%rdi
-        call  do_double_fault
-        BUG   /* do_double_fault() shouldn't return. */
+        tailcall do_double_fault
 
 ENTRY(nmi)
         ENDBR64
@@ -1085,8 +1082,7 @@ handle_ist_exception:
         DISPATCH(X86_EXC_MC,  do_machine_check)
 #undef DISPATCH
 
-        call  do_unhandled_trap
-        BUG   /* do_unhandled_trap() shouldn't return. */
+        tailcall do_unhandled_trap
 
 .L_ist_dispatch_done:
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)

base-commit: f51e5d8eae8ece77a949571f39ee49904f3129aa
-- 
2.30.2


