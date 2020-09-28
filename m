Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6339E27ADD3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:31:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsJs-00080L-3z; Mon, 28 Sep 2020 12:31:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMsJr-00080F-Hh
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:31:51 +0000
X-Inumbo-ID: f0a58ae2-d212-4321-b416-41b25a12746b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0a58ae2-d212-4321-b416-41b25a12746b;
 Mon, 28 Sep 2020 12:31:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601296310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZ7wUBfGidHGqOcJkL0HpmUtlQigVaaGeTq6bBjSbO0=;
 b=bl/c4EPjQTEhADoH+DtLhfJxgcCHczXg0ATa1WaWrGz6eyh2zlqddrW9l0zY4A5FGIB4gG
 1cb1hLKkIzA46njo4gXqA7gyqhZs3oGXC4Y7WbnONct33337wGkjQEnWulh/Hfv6a8nHTn
 g1NmrOSQFQA783nPoh6O+TvRSvyIiB0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7850B06A;
 Mon, 28 Sep 2020 12:31:49 +0000 (UTC)
Subject: [PATCH v2 5/6] x86: guard against straight-line speculation past RET
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
Message-ID: <fd18939c-cfc7-6de8-07f2-217f810afde1@suse.com>
Date: Mon, 28 Sep 2020 14:31:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
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


