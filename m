Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AE57A21B0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 17:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603214.940198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJd-0006Tt-1M; Fri, 15 Sep 2023 15:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603214.940198; Fri, 15 Sep 2023 15:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJc-0006HS-PN; Fri, 15 Sep 2023 15:01:04 +0000
Received: by outflank-mailman (input) for mailman id 603214;
 Fri, 15 Sep 2023 15:01:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhAJb-0005sI-87
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 15:01:03 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adc97a79-53d8-11ee-9b0d-b553b5be7939;
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
X-Inumbo-ID: adc97a79-53d8-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694790060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/GM8AdBIr2NA9MDy77t7kyfRHQ78VMf2N1XB8hJaZKs=;
  b=UiAxU11rOKC/kl1Di1c7Y6aFSWtmVjfoYJxhIzkEW5KxTUgAYIpFX4F+
   +fo7UPBNQd/Nd++LCE5p9s47jyNRVsS4qcYjnaOWXK3MDxKpWzIQOgOxX
   5Ui2/1dnzWHNGP3v9rN5WKVCJ3D6VmkC0fxVVyvIn4F1iB+ewbmhxAgct
   k=;
X-CSE-ConnectionGUID: vAIIvUM8SCaECUCG0mQOuQ==
X-CSE-MsgGUID: U1c+vOBkTMS643nOsobRsQ==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 121436365
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:fqf5paq9isA7+37WV1E8v4IhgApeBmIHZRIvgKrLsJaIsI4StFCzt
 garIBmPbKmDYzSjL4wnb9vioRwBscLVxt9hTAFk/iE3QiMUopuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GlwUmAWP6gR5wePziRNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAC4kTzGdusfm+5myZ8JRret7KfDMIbpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jucpjiiXEpEabRzzxK4q3nvmMjlnh/eY9xOT7uf7flgukaqkzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS6guA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyMbyvjCvrwW3inkR/tILYWa1tjMPizJl
 mXiQDcFu50fissC1qOe9F/Bgi6xqpWhcjPZ9jk7TUr+sFonOdfNi5iArAGCsK0edNrxokyp5
 iBspiSI0AwZ4XhhfgSpSf5FIrym7u3t3Nb00Q82RMlJG9hAFheekWFsDNNWfhcB3iUsI2WBj
 KrvVeR5vcU7AZdSRfUrC79d8uxzpUQaKfzrV+rPcv1FaYVreQmM8UlGPBDBgz+0zhN3wP5ma
 f93lPpA615AUcyLKxLsHI8gPUIDnHhilQs/u7ilp/hY7VZuTCHMEupUWLd/Rus48LmFsG3oH
 yV3bqO3J+FkeLSmOEH/qNdDRW3m2FBnXfgaXeQLLL/cSuencUl9Y8LsLUQJINA9xf4Mx72Zr
 hlQmCZwkTLCuJEOEi3SAlgLVV8ldcwXQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:LgWkGq5y6/toTLUnhgPXwOfXdLJyesId70hD6qkRc202TiX8ra
 rCoB1173PJYVoqN03I4OrwXZVoGEmskaKdgrNhXotKPjOGhILAFugLhrcKpQeQfREWndQ86U
 4PScZD4ZLLfD9HZTWR2njALz9Z+qj8zElev5ai85/UJzsaEJ2IRj0JcjqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3AyVMdVWkDsvJMbrCPdjcHyC/PDkfXOWP07VbOHmr?=
 =?us-ascii?q?oMk1gZZaoYnDI/ZpDjvM7zg=3D=3D?=
X-Talos-MUID: 9a23:laeG1AR2PZZyoLTXRXTR3TohKuBC4JiLMx5RypMhoM6ODzdJbmI=
X-IronPort-AV: E=Sophos;i="6.02,149,1688443200"; 
   d="scan'208";a="121436365"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 7/9] x86/spec-ctrl: Issue VERW during IST exit to Xen
Date: Fri, 15 Sep 2023 16:00:36 +0100
Message-ID: <20230915150038.602577-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915150038.602577-1-andrew.cooper3@citrix.com>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is a corner case where e.g. an NMI hitting an exit-to-guest path after
SPEC_CTRL_EXIT_TO_* would have run the entire NMI handler *after* the VERW
flush to scrub potentially sensitive data from uarch buffers.

In order to compensate, issue VERW when exiting to Xen from an IST entry.

SPEC_CTRL_EXIT_TO_XEN already has two reads of spec_ctrl_flags off the stack,
and we're about to add a third.  Load the field into %ebx, and list the
register as clobbered.

%r12 has been arranged to be the ist_exit signal, so add this as an input
dependency and use it to identify when to issue a VERW.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Note to reviewers:  .L\@_skip_verw and .L\@_skip_ist_exit are separate to
reduce the churn in the following patch.

v2:
 * Rename .L\@_skip_verw
---
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 20 +++++++++++++++-----
 xen/arch/x86/x86_64/entry.S              |  2 +-
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index b696033240e4..9a27e3170347 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -345,10 +345,12 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
  */
 .macro SPEC_CTRL_EXIT_TO_XEN
 /*
- * Requires %r14=stack_end
- * Clobbers %rax, %rcx, %rdx
+ * Requires %r12=ist_exit, %r14=stack_end
+ * Clobbers %rax, %rbx, %rcx, %rdx
  */
-    testb $SCF_ist_sc_msr, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%r14)
+    movzbl STACK_CPUINFO_FIELD(spec_ctrl_flags)(%r14), %ebx
+
+    testb $SCF_ist_sc_msr, %bl
     jz .L\@_skip_sc_msr
 
     /*
@@ -359,7 +361,7 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
      */
     xor %edx, %edx
 
-    testb $SCF_use_shadow, STACK_CPUINFO_FIELD(spec_ctrl_flags)(%r14)
+    testb $SCF_use_shadow, %bl
     jz .L\@_skip_sc_msr
 
     mov STACK_CPUINFO_FIELD(shadow_spec_ctrl)(%r14), %eax
@@ -368,8 +370,16 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
 
 .L\@_skip_sc_msr:
 
-    /* TODO VERW */
+    test %r12, %r12
+    jz .L\@_skip_ist_exit
+
+    /* Logically DO_SPEC_CTRL_COND_VERW but without the %rsp=cpuinfo dependency */
+    testb $SCF_verw, %bl
+    jz .L\@_skip_verw
+    verw STACK_CPUINFO_FIELD(verw_sel)(%r14)
+.L\@_skip_verw:
 
+.L\@_skip_ist_exit:
 .endm
 
 #endif /* __ASSEMBLY__ */
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index e5055e5bbf9f..988ef6cbc628 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -687,7 +687,7 @@ UNLIKELY_START(ne, exit_cr3)
 UNLIKELY_END(exit_cr3)
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        SPEC_CTRL_EXIT_TO_XEN     /* Req: %r14=end, Clob: acd */
+        SPEC_CTRL_EXIT_TO_XEN     /* Req: %r12=ist_exit %r14=end, Clob: abcd */
 
         RESTORE_ALL adj=8
         iretq
-- 
2.30.2


