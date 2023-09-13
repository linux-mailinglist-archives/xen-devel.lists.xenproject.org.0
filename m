Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D925079F2D7
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 22:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601587.937665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTM-00064Y-9U; Wed, 13 Sep 2023 20:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601587.937665; Wed, 13 Sep 2023 20:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgWTM-0005yE-3Q; Wed, 13 Sep 2023 20:28:28 +0000
Received: by outflank-mailman (input) for mailman id 601587;
 Wed, 13 Sep 2023 20:28:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4av=E5=citrix.com=prvs=613b8bbe6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qgWTK-0004dA-0L
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 20:28:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1695771d-5274-11ee-8787-cb3800f73035;
 Wed, 13 Sep 2023 22:28:24 +0200 (CEST)
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
X-Inumbo-ID: 1695771d-5274-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694636904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EAYwPucKCgFfpPtFZ5OzqdU5toziSCvVykYftRRfIdA=;
  b=ZfMMRej2INx492TkPHB1KBJeDDTJuGBKZBlP1zZpcyDGpBg0MJ6BRUNJ
   Y/QfDz/HYnbSw3Z/ubB81eY5BNnAcOdAtQoifT3AqvyDUz1KMCikZc8p3
   BikipgQPTAvAgEESJ3znnIQKAMJdSKgz6eemxCX2CY6/uOcZthz3tJOb+
   Q=;
X-CSE-ConnectionGUID: hN7dthOmQouNNVMZfTFHmw==
X-CSE-MsgGUID: woHOhxVzToi4V/sI0hrRwg==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 121213283
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:7aegra46JQllLXF5vj2pDgxRtCTHchMFZxGqfqrLsTDasY5as4F+v
 jAXXTyOPPzZMGv9fNskbI+19kICusLRx9dhSgJs/iE8Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35pwehBtC5gZlPaES5weF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m9
 dpHJCwNSRW6gP+Q5oyeeOdQqOQmM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xxzB/
 DudpTSiav0cHMOY6R2F4ky+uujOwR28Q6NKFKeC6fE/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 Te0c8jBXGI19ufPEDTEq+nS9GnpUcQIEYMcTS8iEgcZ4/7mmYYuqDTxa+RtLICVi8KgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gKsFmSx28zaK7onAMFh
 2eK4mtsCGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeonAyPBfJgzC1yxR0+U3aB
 Xt9WZz8ZZr9If47pAdaus9HieN7rszA7Ty7qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ5oUy2Mm
 +uzw/Cikk0FOMWnO3m/zGLmBQxSRZTNLcys+pM/my/qClYOJVzN/NeNnex5JtU1z/w9eyWh1
 ijVZ3K0AWHX3RXvQThmoFg5AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:HUJxKa7Oz8A1nM8TKQPXwOnXdLJyesId70hD6qkRc20vTiX8ra
 qTdZsgpHvJYVoqKRQdcLO7Scq9qBHnhPhICOAqVN/IPWnbUUSTXeNfBODZskTd8kPFh5ZgPG
 RbH5SWyuecMXFKyej95ge8H5IbzN6L/LvtrfvCzh5WPGZXgm1bgDuRwzz0LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AO82ACWh9hFkAae30pIinBlfwajJucluCwGvQBEq?=
 =?us-ascii?q?BDntPboOwe1Gs1oNhjJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AXb4ANw2hs1kQgb1r2phz+h7ljjUj/KOOL0Adr4c?=
 =?us-ascii?q?6vMjYC2trGm+dlg6oTdpy?=
X-IronPort-AV: E=Sophos;i="6.02,144,1688443200"; 
   d="scan'208";a="121213283"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 5/8] x86/entry: Adjust restore_all_xen to hold stack_end in %r14
Date: Wed, 13 Sep 2023 21:27:55 +0100
Message-ID: <20230913202758.508225-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230913202758.508225-1-andrew.cooper3@citrix.com>
References: <20230913202758.508225-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All other SPEC_CTRL_{ENTRY,EXIT}_* helpers hold stack_end in %r14.  Adjust it
for consistency, freeing up %rbx to be used differently.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 8 ++++----
 xen/arch/x86/x86_64/entry.S              | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index 77f6c35bb9c5..acdb526d292d 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -344,10 +344,10 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
  */
 .macro SPEC_CTRL_EXIT_TO_XEN
 /*
- * Requires %rbx=stack_end
+ * Requires %r14=stack_end
  * Clobbers %rax, %rcx, %rdx
  */
-    testb $SCF_ist_sc_msr, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%rbx)
+    testb $SCF_ist_sc_msr, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%r14)
     jz .L\@_skip_sc_msr
 
     /*
@@ -358,10 +358,10 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
      */
     xor %edx, %edx
 
-    testb $SCF_use_shadow, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%rbx)
+    testb $SCF_use_shadow, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%r14)
     jz .L\@_skip_sc_msr
 
-    mov STACK_CPUINFO_FIELD(shadow_spec_ctrl)(%rbx), %eax
+    mov STACK_CPUINFO_FIELD(shadow_spec_ctrl)(%r14), %eax
     mov $MSR_SPEC_CTRL, %ecx
     wrmsr
 
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index a1c860f56949..525877e97330 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -665,15 +665,15 @@ restore_all_xen:
          * Check whether we need to switch to the per-CPU page tables, in
          * case we return to late PV exit code (from an NMI or #MC).
          */
-        GET_STACK_END(bx)
-        cmpb  $0, STACK_CPUINFO_FIELD(use_pv_cr3)(%rbx)
+        GET_STACK_END(14)
+        cmpb  $0, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
 UNLIKELY_START(ne, exit_cr3)
-        mov   STACK_CPUINFO_FIELD(pv_cr3)(%rbx), %rax
+        mov   STACK_CPUINFO_FIELD(pv_cr3)(%r14), %rax
         mov   %rax, %cr3
 UNLIKELY_END(exit_cr3)
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        SPEC_CTRL_EXIT_TO_XEN     /* Req: %rbx=end, Clob: acd */
+        SPEC_CTRL_EXIT_TO_XEN     /* Req: %r14=end, Clob: acd */
 
         RESTORE_ALL adj=8
         iretq
-- 
2.30.2


