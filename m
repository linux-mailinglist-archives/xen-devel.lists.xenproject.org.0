Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F877A21B2
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 17:01:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603213.940189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJc-0006HF-Bv; Fri, 15 Sep 2023 15:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603213.940189; Fri, 15 Sep 2023 15:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJc-0006D0-7D; Fri, 15 Sep 2023 15:01:04 +0000
Received: by outflank-mailman (input) for mailman id 603213;
 Fri, 15 Sep 2023 15:01:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhAJa-0005sI-J8
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 15:01:02 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad8409d6-53d8-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 17:01:00 +0200 (CEST)
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
X-Inumbo-ID: ad8409d6-53d8-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694790059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KznqDoscyqMnpcQNfSJy4Gab/IynVVymbTjqUVUKxtA=;
  b=aI8O9h79Gd7i8LSnwgm7YhfgnXuyQ7yr3nwOAbeFOj48kG9/5A6caX8b
   wA9uB97hCXHbZ511KKFyi2oWXg1GxVhwXPq4Uue60Q64cFCA1937jtgDC
   qmoDt05amFYIa1owMbfWkvheZbcA8q8czbgHbO65TrkBndF//gswNCuhl
   c=;
X-CSE-ConnectionGUID: T6/GhXioRSe6SFi4s144KQ==
X-CSE-MsgGUID: LsywUawbQEWBwf9B3F4Crw==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125509278
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:YIwosq3HpgvEUo08mvbD5cxxkn2cJEfYwER7XKvMYLTBsI5bpzBSx
 jdMXjvUP62INzfzeYp1PYrk9h8Fv5aGz9dlTAJopC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8nuDgNyo4GlD5g1nOKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfPT8J2
 vwoKTc3VR3dvMy3nKniFrVPv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ8Iwx7J/
 D2Wl4j/KjUBJcOiwCWPy1+TrPDBzAmgdt45DqLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQXO
 kShxo2zQ2Y16fvMFCzbr+3Pxd+vBcQLBVNcIgAEfQoC2eLu/rodj07UF4o/M5fg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb5Lei8Axkkfi+F1/ronhewO
 yfuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKl7bpXg3OR7IhDy1+KTJrU3ZE
 c3LGSpLJSxGYZmLMRLsH7tNuVPV7n9WKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vdyDg5B
 +13bpPQoz0GCb2WX8Ui2dJLRbz8BSRhVM+eRg0+XrLrHzeK70l6V6eLm+pwId0190mX/8+Rl
 kyAtoZj4AKXrRX6xc+iNxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:yBwV3amg4zxKdk+ZgZeEwzgWYW7pDfLT3DAbv31ZSRFFG/Fw9v
 re5cjzuiWE7Qr5NEtQ++xoW5PwIk80l6QFhbX5VI3KNGKN1VdAR7sSircKrQeQfREWNdQz6U
 6jScRD4RHLbGRSvILC2y+fPO8H4P67mZrY/dv2/jNVVgdtZLhn7wBlTiimMmAefng8ObMJUK
 OG4MxJvjyhfmlSSP+aKD0qY8jvzue77q4PR3Y9dmIaAc21/E6VAXfBfXil4is=
X-Talos-CUID: =?us-ascii?q?9a23=3AtK2yqWielXFeHm3gfnNSoDAFxTJuTiOa43fgIki?=
 =?us-ascii?q?CMms3c5OUFUTJpP9Hqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A4HaHKwwurkl3+uDgSWtwXaW7KAyaqIC1GV8wmIo?=
 =?us-ascii?q?MguS7HzN+ah3GomicWJByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,149,1688443200"; 
   d="scan'208";a="125509278"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 5/9] x86/entry: Adjust restore_all_xen to hold stack_end in %r14
Date: Fri, 15 Sep 2023 16:00:34 +0100
Message-ID: <20230915150038.602577-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915150038.602577-1-andrew.cooper3@citrix.com>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All other SPEC_CTRL_{ENTRY,EXIT}_* helpers hold stack_end in %r14.  Adjust it
for consistency.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 8 ++++----
 xen/arch/x86/x86_64/entry.S              | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index 8996fe3fc0ef..b696033240e4 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -345,10 +345,10 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
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
@@ -359,10 +359,10 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
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


