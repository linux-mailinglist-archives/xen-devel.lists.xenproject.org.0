Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901D824FE0F
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 14:50:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kABw0-0007FQ-BG; Mon, 24 Aug 2020 12:50:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kABvy-0007FC-JH
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 12:50:46 +0000
X-Inumbo-ID: 81cf0826-5770-472f-96f1-e0600b6ee109
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81cf0826-5770-472f-96f1-e0600b6ee109;
 Mon, 24 Aug 2020 12:50:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C160BAFCF;
 Mon, 24 Aug 2020 12:51:14 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: guard against straight-line speculation past RET
Message-ID: <deb41469-37b1-f2da-cc76-70720fe85dbe@suse.com>
Date: Mon, 24 Aug 2020 14:50:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
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
achieve this that differ: A pair of macros gets introduced to post-
process RET insns issued by the compiler (or living in assembly files).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Should this depend on CONFIG_SPECULATIVE_HARDEN_BRANCH?
---
This depends on the "x86: some assembler macro rework" series posted
over a month ago.

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
+    ret$ \operand
+.endm
+.macro ret$ operand:vararg
+    .purgem ret
+    ret \operand
+    int $3
+    .macro ret operand:vararg
+        ret$ \\(operand)
+    .endm
+.endm

