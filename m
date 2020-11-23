Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BC52C0A82
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:44:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34330.65313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khC8e-0001kv-Jh; Mon, 23 Nov 2020 13:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34330.65313; Mon, 23 Nov 2020 13:44:16 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khC8e-0001kF-G8; Mon, 23 Nov 2020 13:44:16 +0000
Received: by outflank-mailman (input) for mailman id 34330;
 Mon, 23 Nov 2020 13:44:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khC8c-0001jS-Nt
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:44:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1be9698c-6ac1-4ab8-9de4-04ea58a5fcc4;
 Mon, 23 Nov 2020 13:44:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E3A64AC0C;
 Mon, 23 Nov 2020 13:44:12 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khC8c-0001jS-Nt
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:44:14 +0000
X-Inumbo-ID: 1be9698c-6ac1-4ab8-9de4-04ea58a5fcc4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1be9698c-6ac1-4ab8-9de4-04ea58a5fcc4;
	Mon, 23 Nov 2020 13:44:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606139053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WBhxnrqI/ea3YaLwkwfUd+kbHRlyoh/3QMt0/b0VBtU=;
	b=Hk4DtJHgoyaRgau9Umhf8UEB71yZ5+l+p6PXVzfplk0gQdnErlVbuB5QUVcwkfZ+oE2iXi
	G9/j1UwbyAPrXqQf32osNY1Co6iSS5SqVqDDNKRJ1YT1hLMtkafCdnqk1moSuLLDvt/tbG
	T8bjzhhHyF/W5zM0USlN3rOmFdomQXc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E3A64AC0C;
	Mon, 23 Nov 2020 13:44:12 +0000 (UTC)
Subject: [PATCH v3 3/7] x86: fold indirect_thunk_asm.h into asm-defns.h
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8e7d1472-dd37-8ed3-ec2f-ce954ea61dfd@suse.com>
Message-ID: <80152a45-0737-eff4-d2ee-6630ffbf34b9@suse.com>
Date: Mon, 23 Nov 2020 14:44:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <8e7d1472-dd37-8ed3-ec2f-ce954ea61dfd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

There's little point in having two separate headers both getting
included by asm_defns.h. This in particular reduces the number of
instances of guarding asm(".include ...") suitably in such dual use
headers.

No change to generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

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
@@ -7,3 +7,40 @@
     .byte 0x0f, 0x01, 0xcb
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


