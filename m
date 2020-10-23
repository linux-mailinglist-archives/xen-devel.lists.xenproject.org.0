Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62561296B4A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 10:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10775.28752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVsZf-0006N7-83; Fri, 23 Oct 2020 08:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10775.28752; Fri, 23 Oct 2020 08:37:23 +0000
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
	id 1kVsZf-0006Mi-4h; Fri, 23 Oct 2020 08:37:23 +0000
Received: by outflank-mailman (input) for mailman id 10775;
 Fri, 23 Oct 2020 08:37:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVsZd-0006MV-0t
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:37:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38c031f2-f3fe-4aaa-b6b6-86093f3d0834;
 Fri, 23 Oct 2020 08:37:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 55079AC5F;
 Fri, 23 Oct 2020 08:37:19 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVsZd-0006MV-0t
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:37:21 +0000
X-Inumbo-ID: 38c031f2-f3fe-4aaa-b6b6-86093f3d0834
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 38c031f2-f3fe-4aaa-b6b6-86093f3d0834;
	Fri, 23 Oct 2020 08:37:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603442239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XH8HtTX0dx7wuPJeWsqa7xFPd/3P0ZggIToNVH+JyHk=;
	b=TSInIO7YtfG0plD8YY/Zcxqs3oXJCunhpn5Vowwo97wMdZ7Ni2QJDPtbzHQjScN1cG3JHv
	WUerZ8s7MOB0AYmv/jGiG35KuXjaDUfFT0Ty1zTOYxQMNX7OjwsV6w6WHmQUsDbGiPhLy4
	MBYUiwsXfDQst4B9wRyTdPOZlbIyyIA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 55079AC5F;
	Fri, 23 Oct 2020 08:37:19 +0000 (UTC)
Subject: [PATCH v3 4/7] x86: fold indirect_thunk_asm.h into asm-defns.h
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
Message-ID: <f7d17cfc-c9dd-1131-2034-592fd3d5ce2d@suse.com>
Date: Fri, 23 Oct 2020 10:37:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
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


