Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C1A45F245
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 17:38:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233243.404608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqeEr-0001Ti-Ar; Fri, 26 Nov 2021 16:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233243.404608; Fri, 26 Nov 2021 16:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqeEr-0001RS-6V; Fri, 26 Nov 2021 16:38:17 +0000
Received: by outflank-mailman (input) for mailman id 233243;
 Fri, 26 Nov 2021 16:38:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqeEq-00016T-2v
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 16:38:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fac4119-4ed7-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 17:38:15 +0100 (CET)
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
X-Inumbo-ID: 3fac4119-4ed7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637944694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iSTdkE0nHLJGOO6QKVKdLSrlYBdgNwshsJepa2MYnPQ=;
  b=IfDEyPOHU3dWChg48nlRVD0B81D5KNSncDDVmoXjspxxEo2escZBq1b5
   pP5wIHwQ9ZH4kO1/Z7FrN0zGiZ/byne4yEERQsyULXTPAUIL493DK7TIB
   U8gcxdpxmXfS6YTj/aNkf4omc3GrG6uNbnjtRqPMIx4yenUbfQ6i/+Zcr
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: j1O0amNu4WnABxO8wR389VwN1V9tYpOLOWCKCII3ywUkhB88zBxYwgBy+zauNorvkebXMK9P5X
 M+cHOCylB+6s43BtLb9o0Q7jfP7WBvY2IPfMSdtozspCgXDZECH0yg4Bx9yZjTl9DPMw6Pl0nZ
 gLw7zk/NffR2FV8ff7yu+3zHtqYLvZtOkA4LkRmo/rI6NAFRU26sA5npgVUT9w1hhLvYfkrDX3
 340xxyKtnwOenii16QCeaZlmSMvbtUAoWZz6QhChqyCH7trnE40tdp/aD1BpIvXO2thvCt+nQ5
 YWZijXFOwBklN5MfH/X+Atd7
X-SBRS: 5.1
X-MesageID: 58206773
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:IV4r06Mw0mezgJfvrR1okMFynXyQoLVcMsEvi/4bfWQNrUorgTZSy
 WVNXz+AOa6Ia2KkLdtybo7joE0H6sSAnNJlHQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Eg9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoy20jf147
 Olzj4LuRlkZL4venectTRYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWdq3p4RQq22i
 8wxSWFpNjnPXRB0NkoSOIwC3/inoDrCfGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlacgwwxUv5sLdcktg7T+rvy8QOaNnYLG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslO+ZJhKTysDA3CMqsyq7CFTFtW
 1BexqCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sPsG8jexY1bJpfEdMMX
 KM1kVgKjHO0FCH3BZKbnqrrU5h6pUQePYiNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid940kFDbClPHCIqdV7wJJjBSFTOK0aYvd/LoarSjeK0kl7YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:nvXG/qr5H7YIu8kKJiVXDF8aV5oReYIsimQD101hICG8cqSj9v
 xG+85rrSMc6QxhIU3I9urwW5VoLUmyyXcx2/h0AV7AZniBhILLFvAB0WKK+VSJcEeSmtK1l5
 0QFJSWYOeAdmSS5vyb3ODXKbgdKaG8gcWVuds=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58206773"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1.1 61/65] x86/entry: Make syscall/sysenter entrypoints CET-IBT compatible
Date: Fri, 26 Nov 2021 16:37:47 +0000
Message-ID: <20211126163747.29517-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Each of MSR_{L,C}STAR and MSR_SYSENTER_EIP need to land on an endbr64
instruction.  For sysenter, this is easy.

Unfortunately for syscall, the stubs are already 29 byte long with a limit of
32.  endbr64 is 4 bytes.  Luckily, there is a 1 byte instruction which can
move from the stubs into the main handlers.

Move the push %rax out of the stub and into {l,c}star_entry(), allowing room
for the endbr64 instruction when appropriate.  Update the comment describing
the entry state.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Update to use endbr helpers.
---
 xen/arch/x86/x86_64/entry.S | 18 +++++++++---------
 xen/arch/x86/x86_64/traps.c | 11 +++++++----
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 8494b97a54a2..9abcf95bd010 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -241,18 +241,17 @@ iret_exit_to_guest:
  * When entering SYSCALL from user mode:
  *  Vector directly to the registered arch.syscall_addr.
  *
- * Initial work is done by per-CPU trampolines. At this point %rsp has been
- * initialised to point at the correct Xen stack, %rsp has been saved, and
- * %rax needs to be restored from the %ss save slot. All other registers are
- * still to be saved onto the stack, starting with RFLAGS, and an appropriate
- * %ss must be saved into the space left by the trampoline.
+ * Initial work is done by per-CPU trampolines.
+ *  - Guest %rax stored in the %ss slot
+ *  - Guest %rsp stored in %rax
+ *  - Xen stack loaded, pointing at the %ss slot
  */
 ENTRY(lstar_enter)
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
-        /* sti could live here when we don't switch page tables below. */
-        movq  8(%rsp),%rax /* Restore %rax. */
+        push  %rax          /* Guest %rsp */
+        movq  8(%rsp), %rax /* Restore guest %rax */
         movq  $FLAT_KERNEL_SS,8(%rsp)
         pushq %r11
         pushq $FLAT_KERNEL_CS64
@@ -288,9 +287,9 @@ ENTRY(cstar_enter)
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
-        /* sti could live here when we don't switch page tables below. */
+        push  %rax          /* Guest %rsp */
         CR4_PV32_RESTORE
-        movq  8(%rsp), %rax /* Restore %rax. */
+        movq  8(%rsp), %rax /* Restore guest %rax. */
         movq  $FLAT_USER_SS32, 8(%rsp) /* Assume a 64bit domain.  Compat handled lower. */
         pushq %r11
         pushq $FLAT_USER_CS32
@@ -323,6 +322,7 @@ ENTRY(cstar_enter)
         jmp   switch_to_kernel
 
 ENTRY(sysenter_entry)
+        ENDBR64
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index 6f3c65bedc7a..ab66515a3c75 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -16,6 +16,7 @@
 #include <asm/current.h>
 #include <asm/flushtlb.h>
 #include <asm/traps.h>
+#include <asm/endbr.h>
 #include <asm/event.h>
 #include <asm/nmi.h>
 #include <asm/msr.h>
@@ -295,6 +296,12 @@ static unsigned int write_stub_trampoline(
 {
     unsigned char *p = stub;
 
+    if ( cpu_has_xen_ibt )
+    {
+        place_endbr64(p);
+        p += 4;
+    }
+
     /* Store guest %rax into %ss slot */
     /* movabsq %rax, stack_bottom - 8 */
     *p++ = 0x48;
@@ -315,10 +322,6 @@ static unsigned int write_stub_trampoline(
     *(uint64_t *)p = stack_bottom - 8;
     p += 8;
 
-    /* Store guest %rsp into %rsp slot */
-    /* pushq %rax */
-    *p++ = 0x50;
-
     /* jmp target_va */
     *p++ = 0xe9;
     *(int32_t *)p = target_va - (stub_va + (p - stub) + 4);
-- 
2.11.0


