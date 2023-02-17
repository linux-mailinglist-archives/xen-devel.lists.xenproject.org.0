Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D16F69A2E7
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 01:20:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496828.767741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSoTR-0008Fd-9y; Fri, 17 Feb 2023 00:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496828.767741; Fri, 17 Feb 2023 00:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSoTR-0008D6-6y; Fri, 17 Feb 2023 00:19:37 +0000
Received: by outflank-mailman (input) for mailman id 496828;
 Fri, 17 Feb 2023 00:19:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZJw=6N=citrix.com=prvs=405a65846=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSoTP-0008Af-Dx
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 00:19:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf611a63-ae58-11ed-933c-83870f6b2ba8;
 Fri, 17 Feb 2023 01:19:33 +0100 (CET)
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
X-Inumbo-ID: bf611a63-ae58-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676593173;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c1MpPmImsROOv47GTA2v+z6JFWIRXg8PJdk+O+CI6mo=;
  b=hO/gH5Fp+hkeOLWmj93slUE4GwHlVEzsH0SE0CcPTcrwB72kx7PScMeC
   cqwUTtwKbDT4NPS6fHVnyS6XwysZFYXHCIZrW4Pv46SZtCc2+si7JSd1h
   C3fTD+ReWr8yF3y0o30xSvNFa3Fk/DM8GGzBGD169VHa48cwWTy9OJ2EL
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97307914
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Xc43UKqzZS3SLF/eYWbwpdE6a25eBmIOZRIvgKrLsJaIsI4StFCzt
 garIBmDOv3fZTP8LtkjO9+19x8B6JSEzNJiGldlqXxhRiwX9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzidNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAA9TQRWku7Pu+oCYQ/VmgOlgJ+r7AbpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jOZpDymU0hGXDCZ4TC9yyLvh87Tpw7YRNoTJuOJp6VRumTGkwT/DzVJDADm8JFVkHWWRNZ3O
 0ESvC00osAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAmZDNcbN0ttOctWCcnk
 FSOmrvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZTRbzNzEnNBrtCDsR8ppFoP2hf7lJAill
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3Hb5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8AhkkeC+F0e5eI1cFh
 XM/XisIvfdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3OxHOgj+3zBB8yvpvU
 Xt+TSpLJSxHYZmLMRLsH7tNuVPV7n5WKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vdyDg5B
 +13bpPQoz0GCb2WX8Ui2dJLRbz8BSRhVM+eRg0+XrLrHzeK70l6W6SBnOl4K9ENcmY8vr6gw
 0xRk3RwkDLX7UAr4y3TMBiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:pHxEva413kcCFQcwvwPXwMbXdLJyesId70hD6qhwISY1TiX+rb
 HJoB17726StN9/YgBCpTntAsa9qBDnhPpICOsqTNWftWDd0QPCRuwP0WKL+UyYJ8SUzI5gPM
 lbHZSWcOeAaGRHsQ==
X-IronPort-AV: E=Sophos;i="5.97,304,1669093200"; 
   d="scan'208";a="97307914"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH RFC] xen: Work around Clang-IAS macro expansion bug.
Date: Fri, 17 Feb 2023 00:19:14 +0000
Message-ID: <20230217001914.762929-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

https://github.com/llvm/llvm-project/issues/60792

RFC.  I very much dislike this patch, but it does work for me.

Why the parameter name of foo?  Turns out I found a different Clang-IAS
bug/misfeature when trying to name the parameter uniq.

  In file included from arch/x86/asm-macros.c:3:
  ./arch/x86/include/asm/spec_ctrl_asm.h:139:5: error: \u used with no following hex digits; treating as '\' followed by identifier [-Werror,-Wunicode]
  .L\@\uniq\()fill_rsb_loop:
      ^

It appears you can't have any macro parameters beginning with a u.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/spec_ctrl.h     |  4 ++--
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 3cf8a7d304d4..cd727be7c689 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -83,7 +83,7 @@ static always_inline void spec_ctrl_new_guest_context(void)
     wrmsrl(MSR_PRED_CMD, PRED_CMD_IBPB);
 
     /* (ab)use alternative_input() to specify clobbers. */
-    alternative_input("", "DO_OVERWRITE_RSB", X86_BUG_IBPB_NO_RET,
+    alternative_input("", "DO_OVERWRITE_RSB foo=%=", X86_BUG_IBPB_NO_RET,
                       : "rax", "rcx");
 }
 
@@ -172,7 +172,7 @@ static always_inline void spec_ctrl_enter_idle(struct cpu_info *info)
      *
      * (ab)use alternative_input() to specify clobbers.
      */
-    alternative_input("", "DO_OVERWRITE_RSB", X86_FEATURE_SC_RSB_IDLE,
+    alternative_input("", "DO_OVERWRITE_RSB foo=%=", X86_FEATURE_SC_RSB_IDLE,
                       : "rax", "rcx");
 }
 
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index fab27ff5532b..06455c5663bb 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -117,7 +117,7 @@
 .L\@_done:
 .endm
 
-.macro DO_OVERWRITE_RSB tmp=rax
+.macro DO_OVERWRITE_RSB tmp=rax foo=
 /*
  * Requires nothing
  * Clobbers \tmp (%rax by default), %rcx
@@ -136,27 +136,27 @@
     mov $16, %ecx                   /* 16 iterations, two calls per loop */
     mov %rsp, %\tmp                 /* Store the current %rsp */
 
-.L\@_fill_rsb_loop:
+.L\@\foo\()fill_rsb_loop:
 
     .irp n, 1, 2                    /* Unrolled twice. */
-    call .L\@_insert_rsb_entry_\n   /* Create an RSB entry. */
+    call .L\@\foo\()insert_rsb_entry_\n   /* Create an RSB entry. */
     int3                            /* Halt rogue speculation. */
 
-.L\@_insert_rsb_entry_\n:
+.L\@\foo\()insert_rsb_entry_\n:
     .endr
 
     sub $1, %ecx
-    jnz .L\@_fill_rsb_loop
+    jnz .L\@\foo\()fill_rsb_loop
     mov %\tmp, %rsp                 /* Restore old %rsp */
 
 #ifdef CONFIG_XEN_SHSTK
     mov $1, %ecx
     rdsspd %ecx
     cmp $1, %ecx
-    je .L\@_shstk_done
+    je .L\@\foo\()shstk_done
     mov $64, %ecx                   /* 64 * 4 bytes, given incsspd */
     incsspd %ecx                    /* Restore old SSP */
-.L\@_shstk_done:
+.L\@\foo\()shstk_done:
 #endif
 .endm
 
-- 
2.30.2


