Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3A24B5171
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272043.466839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEm-0002m9-WF; Mon, 14 Feb 2022 13:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272043.466839; Mon, 14 Feb 2022 13:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEm-0002hL-IC; Mon, 14 Feb 2022 13:17:52 +0000
Received: by outflank-mailman (input) for mailman id 272043;
 Mon, 14 Feb 2022 13:17:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3Q-0008IH-DZ
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de5ceaad-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:06:07 +0100 (CET)
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
X-Inumbo-ID: de5ceaad-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=skVgVxLknOxv+80SVwWA5GN8E1fXIaaRgPjclkqsHNc=;
  b=dBDRWjBxD/GZz1XwKIHDYZLG1yUVtOSvRfIDuPkLZF8IA7aau5s7Mcpg
   CPjoJxhNVN7uK4sWVijJ8qTU3iRBuDZEjlaCxYEJOIp/RKtC5arHN2XL8
   WsBosF1Uv3Xt73fY8gI15wlpHeSGfZFbznQIoTSKpe6YofyXoPsCAHfLq
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NEp8paYwyA+te02yyWc1DX2MXpcq6Tifjfqu7zoJPEbMHXhfEW7a9tUwfSOgQKyPiqnAPD3sOM
 Yooc66J92E2/d3q0uF8CWYclirm25+Q1cghSJkLll13ysMNmjZapAXPLE9oy5QT/MKvpR0n/Lw
 kuUkBT61uexAaBvJ8KUaBVFVisFCFSILQpQtbu6vBrGK4ltZ+zcZZE5LiLktUHiPcWaCeZcO0O
 mCVFtuzPkQeeSia1mpPL2b+ZPKVPLcw4IMzUelyg6wmi99LeYSmxfmMqdB/cYRcqRH6/4zR0a5
 AbyHphPXe+ld+rS4SecsIa9y
X-SBRS: 5.1
X-MesageID: 64149440
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:MmuzEqnTwao9Eb2wHeTxu5To5gy+IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfXWiBP63ZNmWjLt10PY21909T6sCAytQxHQI+/CAxECMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc02YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 M9Pp67uVTcJAqTzmsEFXjVjPwEiFoQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6qHO
 5tFNWIHgBLoOURzI00pEa4EjdyOnWWuVwJGk1XIuv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJKEf8Ith296pbd3AS8HmUodRJhNPcP4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud04WtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HygbQ4xawZRGp8crVml
 CJa8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdwPsGEjeR8waZxsldrVj
 Kj741052XOuFCHyMf8fj3yZV6zGMpQM5fy6D6uJP7Kik7B6dROd/TEGWKJj9zuFraTYqolmY
 c3zWZ/1VR4yUP07pBLrF7Z1+eJ6nUgWmDKMLa0XOjz6iNJyklbOEuxbWLZPB8hkhJ65TPL9r
 YoOaZvSk08HOAA8CwGOmbMuwZkxBSBTLfjLRwZ/L4Zv+yJqRzMsDeH/27Qkd9A3lqhZjL6Qr
 Hq8RlVZ2Bz0gniecVeGbXVqabXOW5djrC1kYXxwbAjwg3VzM5yy6Ko/docseeV1/uJU0vMpH
 eIOfN+NA6oTR22fqSgdd5T0sKdraA+v2VCVJyOgbTVmJ8xgSgXF98XKZAzq8CVSXCO7udFn+
 ++r1x/BQIpFTANnVZ6EZPWqxlK3nH4chOMtABeYfogNIB3hqdE4JTbwg/k7J9A3BS/CnjbKh
 RyLBRo4pPXWp9Nn+tf+mq3Z/ZyiFPFzHxQGEjCDv6q2LyTT4kGq3ZREDLSTZTnYWW75pPeia
 OFSw62uOfELhg8X4Y91ErItxqMi/dr/4bRdy108TnnMal2qDJJmI2WHgpYT5vEcmOcBtFvkQ
 F+L9/lbJa6NaZHsH1MmLQY4aviOiKMPkT7I4PVpeEj36UebJlZcvZm+6/VUtBFgEQ==
IronPort-HdrOrdr: A9a23:GBdeXanfJnC84FfjKRr5d5fvhcPpDfIo3DAbv31ZSRFFG/Fxl6
 iV/cjztCWE8Ar5N0tQ+uxoVJPufZqYz+8Q3WBzB8baYOCFghrLEGgK1+KLqFeMdxEWtNQtsp
 uIG5IObuEYZmIbsS+V2meF+q4bsby6zJw=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149440"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 67/70] x86/entry: Make IDT entrypoints CET-IBT compatible
Date: Mon, 14 Feb 2022 12:51:24 +0000
Message-ID: <20220214125127.17985-68-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Each IDT vector needs to land on an endbr64 instruction.  This is especially
important for the #CP handler, which will recurse indefinitely if the endbr64
is missing, eventually escalating to #DF if guard pages are active.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Extra newlines in asm
 * Reword commit message
---
 xen/arch/x86/x86_64/compat/entry.S |  1 +
 xen/arch/x86/x86_64/entry.S        | 30 ++++++++++++++++++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index c84ff7ea6476..5fd6dbbd4513 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -12,6 +12,7 @@
 #include <irq_vectors.h>
 
 ENTRY(entry_int82)
+        ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
         movl  $HYPERCALL_VECTOR, 4(%rsp)
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 9abcf95bd010..ea6f0afbc2b4 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -386,6 +386,7 @@ UNLIKELY_END(sysenter_gpf)
         jmp   .Lbounce_exception
 
 ENTRY(int80_direct_trap)
+        ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
         movl  $0x80, 4(%rsp)
@@ -698,6 +699,7 @@ ENTRY(common_interrupt)
         jmp ret_from_intr
 
 ENTRY(page_fault)
+        ENDBR64
         movl  $TRAP_page_fault,4(%rsp)
 /* No special register assumptions. */
 GLOBAL(handle_exception)
@@ -872,75 +874,91 @@ FATAL_exception_with_ints_disabled:
         BUG   /* fatal_trap() shouldn't return. */
 
 ENTRY(divide_error)
+        ENDBR64
         pushq $0
         movl  $TRAP_divide_error,4(%rsp)
         jmp   handle_exception
 
 ENTRY(coprocessor_error)
+        ENDBR64
         pushq $0
         movl  $TRAP_copro_error,4(%rsp)
         jmp   handle_exception
 
 ENTRY(simd_coprocessor_error)
+        ENDBR64
         pushq $0
         movl  $TRAP_simd_error,4(%rsp)
         jmp   handle_exception
 
 ENTRY(device_not_available)
+        ENDBR64
         pushq $0
         movl  $TRAP_no_device,4(%rsp)
         jmp   handle_exception
 
 ENTRY(debug)
+        ENDBR64
         pushq $0
         movl  $TRAP_debug,4(%rsp)
         jmp   handle_ist_exception
 
 ENTRY(int3)
+        ENDBR64
         pushq $0
         movl  $TRAP_int3,4(%rsp)
         jmp   handle_exception
 
 ENTRY(overflow)
+        ENDBR64
         pushq $0
         movl  $TRAP_overflow,4(%rsp)
         jmp   handle_exception
 
 ENTRY(bounds)
+        ENDBR64
         pushq $0
         movl  $TRAP_bounds,4(%rsp)
         jmp   handle_exception
 
 ENTRY(invalid_op)
+        ENDBR64
         pushq $0
         movl  $TRAP_invalid_op,4(%rsp)
         jmp   handle_exception
 
 ENTRY(invalid_TSS)
+        ENDBR64
         movl  $TRAP_invalid_tss,4(%rsp)
         jmp   handle_exception
 
 ENTRY(segment_not_present)
+        ENDBR64
         movl  $TRAP_no_segment,4(%rsp)
         jmp   handle_exception
 
 ENTRY(stack_segment)
+        ENDBR64
         movl  $TRAP_stack_error,4(%rsp)
         jmp   handle_exception
 
 ENTRY(general_protection)
+        ENDBR64
         movl  $TRAP_gp_fault,4(%rsp)
         jmp   handle_exception
 
 ENTRY(alignment_check)
+        ENDBR64
         movl  $TRAP_alignment_check,4(%rsp)
         jmp   handle_exception
 
 ENTRY(entry_CP)
+        ENDBR64
         movl  $X86_EXC_CP, 4(%rsp)
         jmp   handle_exception
 
 ENTRY(double_fault)
+        ENDBR64
         movl  $TRAP_double_fault,4(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
         ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
@@ -966,6 +984,7 @@ ENTRY(double_fault)
 
         .pushsection .init.text, "ax", @progbits
 ENTRY(early_page_fault)
+        ENDBR64
         movl  $TRAP_page_fault,4(%rsp)
         SAVE_ALL
         movq  %rsp,%rdi
@@ -974,6 +993,7 @@ ENTRY(early_page_fault)
         .popsection
 
 ENTRY(nmi)
+        ENDBR64
         pushq $0
         movl  $TRAP_nmi,4(%rsp)
 handle_ist_exception:
@@ -1102,12 +1122,14 @@ handle_ist_exception:
 #endif
 
 ENTRY(machine_check)
+        ENDBR64
         pushq $0
         movl  $TRAP_machine_check,4(%rsp)
         jmp   handle_ist_exception
 
 /* No op trap handler.  Required for kexec crash path. */
 GLOBAL(trap_nop)
+        ENDBR64
         iretq
 
 /* Table of automatically generated entry points.  One per vector. */
@@ -1136,7 +1158,9 @@ autogen_stubs: /* Automatically generated stubs. */
 #endif
 
         ALIGN
-1:      pushq $0
+1:
+        ENDBR64
+        pushq $0
         movb  $vec,4(%rsp)
         jmp   common_interrupt
 
@@ -1146,7 +1170,9 @@ autogen_stubs: /* Automatically generated stubs. */
         .elseif vec == X86_EXC_CSO || vec == X86_EXC_SPV || \
                 vec == X86_EXC_VE  || (vec > X86_EXC_CP && vec < TRAP_nr)
 
-1:      test  $8,%spl        /* 64bit exception frames are 16 byte aligned, but the word */
+1:
+        ENDBR64
+        test  $8,%spl        /* 64bit exception frames are 16 byte aligned, but the word */
         jz    2f             /* size is 8 bytes.  Check whether the processor gave us an */
         pushq $0             /* error code, and insert an empty one if not.              */
 2:      movb  $vec,4(%rsp)
-- 
2.11.0


