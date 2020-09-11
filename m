Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6052C26630C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 18:09:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGlcL-00025a-1c; Fri, 11 Sep 2020 16:09:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eh3a=CU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGlcK-00025V-9E
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 16:09:40 +0000
X-Inumbo-ID: 5e3522c6-6717-4270-87f7-aa64cdc1e3cd
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e3522c6-6717-4270-87f7-aa64cdc1e3cd;
 Fri, 11 Sep 2020 16:09:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8206AF2F;
 Fri, 11 Sep 2020 16:09:53 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: guard against straight-line speculation past RET
Message-ID: <a6d7d72b-b14c-ab7f-b250-cc74cd3c758c@suse.com>
Date: Fri, 11 Sep 2020 18:09:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Under certain conditions CPUs can speculate into the instruction stream
past a RET instruction. Guard against this just like 3b7dab93f240
("x86/spec-ctrl: Protect against CALL/JMP straight-line speculation")
did - by inserting an "INT $3" insn. It's merely the mechanics of how to
achieve this that differ: A set of macros gets introduced to post-
process RET insns issued by the compiler (or living in assembly files).

Unfortunately for clang this requires further features their built-in
assembler doesn't support: We need to be able to override insn mnemonics
produced by the compiler (which may be impossible, if internally
assembly mnemonics never get generated), and we want to use \(text)
escaping / quoting in the auxiliary macro.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: Should this depend on CONFIG_SPECULATIVE_HARDEN_BRANCH?
TBD: Would be nice to avoid the additions in .init.text, but a query to
     the binutils folks regarding the ability to identify the section
     stuff is in (by Peter Zijlstra over a year ago:
     https://sourceware.org/pipermail/binutils/2019-July/107528.html)
     has been left without helpful replies.
---
v2: Fix build with newer clang. Use int3 mnemonic. Also override retq.
---
This depends on the "x86: some assembler macro rework" series posted
well over a month ago.

--- a/xen/Makefile
+++ b/xen/Makefile
@@ -145,7 +145,15 @@ t2 = $(call as-insn,$(CC) -I$(BASEDIR)/i
 # https://bugs.llvm.org/show_bug.cgi?id=36110
 t3 = $(call as-insn,$(CC),".macro FOO;.endm"$(close); asm volatile $(open)".macro FOO;.endm",-no-integrated-as)
 
-CLANG_FLAGS += $(call or,$(t1),$(t2),$(t3))
+# Check whether \(text) escaping in macro bodies is supported.
+t4 = $(call as-insn,$(CC),".macro m ret:req; \\(ret) $$\\ret; .endm; m 8",,-no-integrated-as)
+
+# Check whether macros can override insn mnemonics in inline assembly.
+t5 = $(call as-insn,$(CC),".macro ret; .error; .endm; .macro retq; .error; .endm",-no-integrated-as)
+
+acc1 := $(call or,$(t1),$(t2),$(t3),$(t4))
+
+CLANG_FLAGS += $(call or,$(acc1),$(t5))
 endif
 
 CLANG_FLAGS += -Werror=unknown-warning-option
--- a/xen/include/asm-x86/asm-defns.h
+++ b/xen/include/asm-x86/asm-defns.h
@@ -50,3 +50,22 @@
 .macro INDIRECT_JMP arg:req
     INDIRECT_BRANCH jmp \arg
 .endm
+
+/*
+ * To guard against speculation past RET, insert a breakpoint insn
+ * immediately after them.
+ */
+.macro ret operand:vararg
+    ret$ \operand
+.endm
+.macro retq operand:vararg
+    ret$ \operand
+.endm
+.macro ret$ operand:vararg
+    .purgem ret
+    ret \operand
+    int3
+    .macro ret operand:vararg
+        ret$ \\(operand)
+    .endm
+.endm

