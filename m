Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6493379F2D2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 22:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601583.937639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTJ-0005QN-AA; Wed, 13 Sep 2023 20:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601583.937639; Wed, 13 Sep 2023 20:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTJ-0005OA-5p; Wed, 13 Sep 2023 20:28:25 +0000
Received: by outflank-mailman (input) for mailman id 601583;
 Wed, 13 Sep 2023 20:28:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4av=E5=citrix.com=prvs=613b8bbe6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qgWTH-0004dA-6k
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 20:28:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 152dfb69-5274-11ee-8787-cb3800f73035;
 Wed, 13 Sep 2023 22:28:22 +0200 (CEST)
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
X-Inumbo-ID: 152dfb69-5274-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694636902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2vjOrVTuSvMwiX/obR22m8asNoVNui9kb4bQVY0kxGo=;
  b=AsQFWJH+/qtcE17b+oYjABZWQEcbIGLs8Qw/IkeIZ3qmvmNKOzFYqDug
   kOQCwwIP4I9cTXQwvhYwbRMCcrOFFrvaynNHOif15yIhCUYT8zKuJ5igM
   dhqiVn/Kl+Xf6+Mf4Z5R2SOp30XQl9zsmXBY84uHA0TZdQcoivXR5dSZX
   o=;
X-CSE-ConnectionGUID: OTY/1Nd8T/+vvQCCeXLd1A==
X-CSE-MsgGUID: QHz6PAKDSW64SprJkqRDWA==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 121213280
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:XLSYTa79CCQz/aMlhQJNqQxRtC7HchMFZxGqfqrLsTDasY5as4F+v
 jZNCjiPOaqDazf8f9h0b9m1pE4Fv5PVx9ZhTwRlpH9hHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35pwehBtC5gZlPaES5weF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m0
 sApb2krYkC/wKGo3ouQYeRcosh6BZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xxzB/
 DudpTShav0cHOW/22S921GAvdCRwRjjQqARDYeUydc/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 Te0c8jBXGI19ufPEDTEq+nS9GnpUcQIEYMcTQg4fExcxdWznMZwkAz2Zf1uIIq51/SgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gKsFmSx28zaK7onAMFh
 2eK42tsCGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeonAyOxXIhzyzzRZ9+U3aB
 Xt8WZzwZUv29Iw9lGbmLwvj+eFDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchghJ5oVD79q
 o4FX+PTkkU3bQELSnWPmWLlBQxQfCdT6FGfg5A/S9Nv1SI6RD55VqaBketJlk4Mt/09q9okN
 0qVAidwoGcTT1WcQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:Vzs0fKw8qCl+/TdN12LmKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-Talos-CUID: 9a23:ZZ3JQ2E5i3i+gj+fqmJAyH9TQ+YpIkGaj2nOGmSTBFZNROS8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AYu9bFQzBD//SNicouwFW4FLI43qaqJ2OGh41uLY?=
 =?us-ascii?q?qgPbaaRdoIRWelQ6bfaZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,144,1688443200"; 
   d="scan'208";a="121213280"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/8] x86/spec-ctrl: Extend all SPEC_CTRL_{ENTER,EXIT}_* comments
Date: Wed, 13 Sep 2023 21:27:54 +0100
Message-ID: <20230913202758.508225-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230913202758.508225-1-andrew.cooper3@citrix.com>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... to better explain how they're used.

Doing so highlights that SPEC_CTRL_EXIT_TO_XEN is missing a VERW flush for the
corner case when e.g. an NMI hits late in an exit-to-guest path.

Leave a TODO, which will be addressed in subsequent patches which arrange for
DO_COND_VERW to be safe within SPEC_CTRL_EXIT_TO_XEN.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This was decided not to be XSA-worthy, as guests can't usefully control when
IST events occur.
---
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 35 ++++++++++++++++++++----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index ee75f2bced42..77f6c35bb9c5 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -218,7 +218,10 @@
     wrmsr
 .endm
 
-/* Use after an entry from PV context (syscall/sysenter/int80/int82/etc). */
+/*
+ * Used after a synchronous entry from PV context.  SYSCALL, SYSENTER, INT,
+ * etc.  Will always interrupt a guest speculation context.
+ */
 .macro SPEC_CTRL_ENTRY_FROM_PV
 /*
  * Requires %rsp=regs/cpuinfo, %rdx=0
@@ -233,7 +236,11 @@
         X86_FEATURE_SC_MSR_PV
 .endm
 
-/* Use in interrupt/exception context.  May interrupt Xen or PV context. */
+/*
+ * Used after a synchronous interrupt or exception.  May interrupt Xen or PV
+ * context, but will not interrupt Xen with a guest speculation context,
+ * outside of fatal error cases.
+ */
 .macro SPEC_CTRL_ENTRY_FROM_INTR
 /*
  * Requires %rsp=regs, %r14=stack_end, %rdx=0
@@ -248,7 +255,10 @@
         X86_FEATURE_SC_MSR_PV
 .endm
 
-/* Use when exiting to PV guest context. */
+/*
+ * Used when exiting from any entry context, back to PV context.  This
+ * includes from an IST entry which moved onto the primary stack.
+ */
 .macro SPEC_CTRL_EXIT_TO_PV
 /*
  * Requires %rax=spec_ctrl, %rsp=regs/info
@@ -260,7 +270,12 @@
 .endm
 
 /*
- * Use in IST interrupt/exception context.  May interrupt Xen or PV context.
+ * Used after an IST entry (i.e. needs special care, consider to be fully
+ * asynchronous with finding sane state).  May interrupt PV or Xen context,
+ * including other SPEC_CTRL_{ENTRY,EXIT}_* regions with unsanitised state.
+ *
+ * An IST entry which interrupts PV context moves onto the primary stack and
+ * leaves via SPEC_CTRL_EXIT_TO_PV, *not* SPEC_CTRL_EXIT_TO_XEN.
  */
 .macro SPEC_CTRL_ENTRY_FROM_INTR_IST
 /*
@@ -319,7 +334,14 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
     UNLIKELY_END(\@_serialise)
 .endm
 
-/* Use when exiting to Xen in IST context. */
+/*
+ * Use when exiting from any entry context, back to Xen context.  This
+ * includes returning to other SPEC_CTRL_{ENTRY,EXIT}_* regions with
+ * unsanitised state.
+ *
+ * Because we might have interrupted Xen beyond SPEC_CTRL_EXIT_TO_$GUEST, we
+ * must treat this as if it were an EXIT_TO_$GUEST case too.
+ */
 .macro SPEC_CTRL_EXIT_TO_XEN
 /*
  * Requires %rbx=stack_end
@@ -344,6 +366,9 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
     wrmsr
 
 .L\@_skip_sc_msr:
+
+    /* TODO VERW */
+
 .endm
 
 #endif /* __ASSEMBLY__ */
-- 
2.30.2


