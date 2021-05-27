Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2758B392E00
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 14:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133092.248165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFAf-0003CE-Kz; Thu, 27 May 2021 12:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133092.248165; Thu, 27 May 2021 12:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFAf-0003AJ-HN; Thu, 27 May 2021 12:31:29 +0000
Received: by outflank-mailman (input) for mailman id 133092;
 Thu, 27 May 2021 12:31:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmFAe-00030D-2g
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 12:31:28 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bae8eeac-2622-49e8-a362-505f87bbb378;
 Thu, 27 May 2021 12:31:26 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7BFA8218DD;
 Thu, 27 May 2021 12:31:25 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 587CF11A98;
 Thu, 27 May 2021 12:31:25 +0000 (UTC)
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
X-Inumbo-ID: bae8eeac-2622-49e8-a362-505f87bbb378
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622118685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8iVlQanP290BLy02LDzP89TcI1dKH7MaEcZKdyou000=;
	b=aOK0zKMm3VR+7w75/vqdiEKsBmWa3gLhkabEA/9yX93rxodzhVfg622fFN8c6avMoqKQG3
	MzksE9EVTGJAYdyoxdB1hhdCrZR5tFU5qjyXwcGg0pFkvVstG+jbVh9wC35S42GolIqJ7E
	matnOXfWokSWyjJDYatwFvPi36yMnyo=
Subject: [PATCH v2 03/12] x86: re-work memcpy()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Message-ID: <b715c6aa-579a-fede-fe0e-d7c170ec3bce@suse.com>
Date: Thu, 27 May 2021 14:31:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
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


