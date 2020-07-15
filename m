Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 516FC220A7B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:49:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveyr-0002sL-Ug; Wed, 15 Jul 2020 10:49:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jveyq-0002s8-Lt
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:49:40 +0000
X-Inumbo-ID: e1d7700e-c688-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1d7700e-c688-11ea-bca7-bc764e2007e4;
 Wed, 15 Jul 2020 10:49:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6061DADC2;
 Wed, 15 Jul 2020 10:49:42 +0000 (UTC)
Subject: [PATCH 4/4] x86: fold indirect_thunk_asm.h into asm-defns.h
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
Message-ID: <af69f44a-5009-40e8-fbbc-6f78b67f7adb@suse.com>
Date: Wed, 15 Jul 2020 12:49:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There's little point in having two separate headers both getting
included by asm_defns.h. This in particular reduces the number of
instances of guarding asm(".include ...") suitably in such dual use
headers.

No change to generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -139,7 +139,7 @@ ifeq ($(TARGET_ARCH),x86)
 t1 = $(call as-insn,$(CC),".L0: .L1: .skip (.L1 - .L0)",,-no-integrated-as)
 
 # Check whether clang asm()-s support .include.
-t2 = $(call as-insn,$(CC) -I$(BASEDIR)/include,".include \"asm-x86/indirect_thunk_asm.h\"",,-no-integrated-as)
+t2 = $(call as-insn,$(CC) -I$(BASEDIR)/include,".include \"asm-x86/asm-defns.h\"",,-no-integrated-as)
 
 # Check whether clang keeps .macro-s between asm()-s:
 # https://bugs.llvm.org/show_bug.cgi?id=36110
--- a/xen/include/asm-x86/asm-defns.h
+++ b/xen/include/asm-x86/asm-defns.h
@@ -13,3 +13,40 @@
     .byte 0xf3, 0x0f, 0x01, 0xe8
 .endm
 #endif
+
+.macro INDIRECT_BRANCH insn:req arg:req
+/*
+ * Create an indirect branch.  insn is one of call/jmp, arg is a single
+ * register.
+ *
+ * With no compiler support, this degrades into a plain indirect call/jmp.
+ * With compiler support, dispatch to the correct __x86_indirect_thunk_*
+ */
+    .if CONFIG_INDIRECT_THUNK == 1
+
+        $done = 0
+        .irp reg, ax, cx, dx, bx, bp, si, di, 8, 9, 10, 11, 12, 13, 14, 15
+        .ifeqs "\arg", "%r\reg"
+            \insn __x86_indirect_thunk_r\reg
+            $done = 1
+           .exitm
+        .endif
+        .endr
+
+        .if $done != 1
+            .error "Bad register arg \arg"
+        .endif
+
+    .else
+        \insn *\arg
+    .endif
+.endm
+
+/* Convenience wrappers. */
+.macro INDIRECT_CALL arg:req
+    INDIRECT_BRANCH call \arg
+.endm
+
+.macro INDIRECT_JMP arg:req
+    INDIRECT_BRANCH jmp \arg
+.endm
--- a/xen/include/asm-x86/asm_defns.h
+++ b/xen/include/asm-x86/asm_defns.h
@@ -22,7 +22,6 @@
 asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
       __stringify(IS_ENABLED(CONFIG_INDIRECT_THUNK)) );
 #endif
-#include <asm/indirect_thunk_asm.h>
 
 #ifndef __ASSEMBLY__
 void ret_from_intr(void);
--- a/xen/include/asm-x86/indirect_thunk_asm.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/*
- * Trickery to allow this header to be included at the C level, to permit
- * proper dependency tracking in .*.o.d files, while still having it contain
- * assembler only macros.
- */
-#ifndef __ASSEMBLY__
-# if 0
-  .if 0
-# endif
-asm ( "\t.include \"asm/indirect_thunk_asm.h\"" );
-# if 0
-  .endif
-# endif
-#else
-
-.macro INDIRECT_BRANCH insn:req arg:req
-/*
- * Create an indirect branch.  insn is one of call/jmp, arg is a single
- * register.
- *
- * With no compiler support, this degrades into a plain indirect call/jmp.
- * With compiler support, dispatch to the correct __x86_indirect_thunk_*
- */
-    .if CONFIG_INDIRECT_THUNK == 1
-
-        $done = 0
-        .irp reg, ax, cx, dx, bx, bp, si, di, 8, 9, 10, 11, 12, 13, 14, 15
-        .ifeqs "\arg", "%r\reg"
-            \insn __x86_indirect_thunk_r\reg
-            $done = 1
-           .exitm
-        .endif
-        .endr
-
-        .if $done != 1
-            .error "Bad register arg \arg"
-        .endif
-
-    .else
-        \insn *\arg
-    .endif
-.endm
-
-/* Convenience wrappers. */
-.macro INDIRECT_CALL arg:req
-    INDIRECT_BRANCH call \arg
-.endm
-
-.macro INDIRECT_JMP arg:req
-    INDIRECT_BRANCH jmp \arg
-.endm
-
-#endif


