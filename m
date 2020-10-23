Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D4C296B4E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 10:38:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10779.28762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVsaL-0006Y3-Hf; Fri, 23 Oct 2020 08:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10779.28762; Fri, 23 Oct 2020 08:38:05 +0000
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
	id 1kVsaL-0006Xg-Dr; Fri, 23 Oct 2020 08:38:05 +0000
Received: by outflank-mailman (input) for mailman id 10779;
 Fri, 23 Oct 2020 08:38:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVsaK-0006Xa-HX
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:38:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 14dc6f66-2615-401f-8786-26a944cfd467;
 Fri, 23 Oct 2020 08:38:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E3A1ADC2;
 Fri, 23 Oct 2020 08:38:02 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVsaK-0006Xa-HX
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:38:04 +0000
X-Inumbo-ID: 14dc6f66-2615-401f-8786-26a944cfd467
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 14dc6f66-2615-401f-8786-26a944cfd467;
	Fri, 23 Oct 2020 08:38:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603442282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X5eJiPZad/Wxk2WeL4Rv91+7VfsqFeYUymX6fbe2ERc=;
	b=ISRPQlnJe203eMoqR3qOCAhHEkcd4PKSuBsQLqMx9RhltVPjfWh3GEp0RjBX1Pud8O9LRu
	UmYn02GqXGA6//LibSLjZN0uzj7pPh59juAYLdYlXjaBUHa2Um7N5PLXveuSJilqMyWkv3
	6mfwZRlqIyAX4ZDEplSXsl54jrTDUfA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0E3A1ADC2;
	Fri, 23 Oct 2020 08:38:02 +0000 (UTC)
Subject: [PATCH v3 5/7] x86: guard against straight-line speculation past RET
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
Message-ID: <80ceea17-958d-f409-5f39-9f353e780f5b@suse.com>
Date: Fri, 23 Oct 2020 10:38:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

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
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
TBD: Would be nice to avoid the additions in .init.text, but a query to
     the binutils folks regarding the ability to identify the section
     stuff is in (by Peter Zijlstra over a year ago:
     https://sourceware.org/pipermail/binutils/2019-July/107528.html)
     has been left without helpful replies.
---
v3: Use .byte 0xc[23] instead of the nested macros.
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
@@ -50,3 +50,19 @@
 .macro INDIRECT_JMP arg:req
     INDIRECT_BRANCH jmp \arg
 .endm
+
+/*
+ * To guard against speculation past RET, insert a breakpoint insn
+ * immediately after them.
+ */
+.macro ret operand:vararg
+    retq \operand
+.endm
+.macro retq operand:vararg
+    .ifb \operand
+    .byte 0xc3
+    .else
+    .byte 0xc2
+    .word \operand
+    .endif
+.endm


