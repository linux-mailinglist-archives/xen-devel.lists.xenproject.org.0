Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B3D36C678
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 14:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118435.224564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNEm-0003BP-69; Tue, 27 Apr 2021 12:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118435.224564; Tue, 27 Apr 2021 12:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbNEm-0003Ay-1s; Tue, 27 Apr 2021 12:54:48 +0000
Received: by outflank-mailman (input) for mailman id 118435;
 Tue, 27 Apr 2021 12:54:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbNEk-00039o-7d
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 12:54:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0232e8a0-3c79-4da9-b604-6f2b1bf4d1cc;
 Tue, 27 Apr 2021 12:54:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A119B190;
 Tue, 27 Apr 2021 12:54:44 +0000 (UTC)
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
X-Inumbo-ID: 0232e8a0-3c79-4da9-b604-6f2b1bf4d1cc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619528084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8iVlQanP290BLy02LDzP89TcI1dKH7MaEcZKdyou000=;
	b=b0wz4jX28laKvsVX8HiLepw1mQA2W8pJiR97VNGmmr0IosgDIIiYOiuYunPlOX5e1u2Am6
	Vu6jHC2KcAxsMueg287YK4yXoJj5VQM6PD3IOfemwaEb/OEmVM+S0cNlycjnyOZfgYHO2B
	tz92XjOFrtxds7v94a+30uAFkC2h5XE=
Subject: [PATCH 4/7] x86: re-work memcpy()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
Message-ID: <58bd0a42-4700-cf02-94a5-d68a22cbec1a@suse.com>
Date: Tue, 27 Apr 2021 14:54:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Move the function to its own assembly file. Having it in C just for the
entire body to be an asm() isn't really helpful. Then have two flavors:
A "basic" version using qword steps for the bulk of the operation, and an
ERMS version for modern hardware, to be substituted in via alternatives
patching.

Alternatives patching, however, requires an extra precaution: It uses
memcpy() itself, and hence the function may patch itself. Luckily the
patched-in code only replaces the prolog of the original function. Make
sure this remains this way.

Additionally alternatives patching, while supposedly safe via enforcing
a control flow change when modifying already prefetched code, may not
really be. Afaict a request is pending to drop the first of the two
options in the SDM's "Handling Self- and Cross-Modifying Code" section.
Insert a serializing instruction there. To avoid having to introduce a
local variable, also switch text_poke() to return void: Neither of its
callers cares about the returned value.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
We may want to consider branching over the REP MOVSQ as well, if the
number of qwords turns out to be zero.
We may also want to consider using non-REP MOVS{L,W,B} for the tail.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -43,6 +43,7 @@ obj-$(CONFIG_INDIRECT_THUNK) += indirect
 obj-y += ioport_emulate.o
 obj-y += irq.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
+obj-y += memcpy.o
 obj-y += memset.o
 obj-y += mm.o x86_64/mm.o
 obj-$(CONFIG_HVM) += monitor.o
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -164,12 +164,14 @@ void init_or_livepatch add_nops(void *in
  * executing.
  *
  * "noinline" to cause control flow change and thus invalidate I$ and
- * cause refetch after modification.
+ * cause refetch after modification.  While the SDM continues to suggest this
+ * is sufficient, it may not be - issue a serializing insn afterwards as well.
  */
-static void *init_or_livepatch noinline
+static void init_or_livepatch noinline
 text_poke(void *addr, const void *opcode, size_t len)
 {
-    return memcpy(addr, opcode, len);
+    memcpy(addr, opcode, len);
+    cpuid_eax(0);
 }
 
 /*
--- /dev/null
+++ b/xen/arch/x86/memcpy.S
@@ -0,0 +1,21 @@
+#include <asm/asm_defns.h>
+
+ENTRY(memcpy)
+        mov     %rdx, %rcx
+        mov     %rdi, %rax
+        /*
+         * We need to be careful here: memcpy() is involved in alternatives
+         * patching, so the code doing the actual copying (i.e. past setting
+         * up registers) may not be subject to patching (unless further
+         * precautions were taken).
+         */
+        ALTERNATIVE "and $7, %edx; shr $3, %rcx", \
+                    "rep movsb; ret", X86_FEATURE_ERMS
+        rep movsq
+        or      %edx, %ecx
+        jz      1f
+        rep movsb
+1:
+        ret
+        .type memcpy, @function
+        .size memcpy, . - memcpy
--- a/xen/arch/x86/string.c
+++ b/xen/arch/x86/string.c
@@ -7,21 +7,6 @@
 
 #include <xen/lib.h>
 
-void *(memcpy)(void *dest, const void *src, size_t n)
-{
-    long d0, d1, d2;
-
-    asm volatile (
-        "   rep ; movs"__OS" ; "
-        "   mov %k4,%k3      ; "
-        "   rep ; movsb        "
-        : "=&c" (d0), "=&D" (d1), "=&S" (d2)
-        : "0" (n/BYTES_PER_LONG), "r" (n%BYTES_PER_LONG), "1" (dest), "2" (src)
-        : "memory" );
-
-    return dest;
-}
-
 void *(memmove)(void *dest, const void *src, size_t n)
 {
     long d0, d1, d2;


