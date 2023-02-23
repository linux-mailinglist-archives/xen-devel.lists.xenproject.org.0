Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4738D6A114E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 21:37:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500699.772176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVIL5-0006YP-Er; Thu, 23 Feb 2023 20:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500699.772176; Thu, 23 Feb 2023 20:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVIL5-0006VQ-Bv; Thu, 23 Feb 2023 20:37:15 +0000
Received: by outflank-mailman (input) for mailman id 500699;
 Thu, 23 Feb 2023 20:37:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fv/5=6T=citrix.com=prvs=411d40f12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVIL3-0006VK-Ri
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 20:37:13 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7dce218-b3b9-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 21:37:11 +0100 (CET)
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
X-Inumbo-ID: d7dce218-b3b9-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677184631;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q6UZ99LvwJkoKLVI80Z7y1EwDxwbCunhqiU3rS8JEDc=;
  b=e/FUPq2zxJNabROp0isYNOzQI3/AaLfI0h7BFeDhfP2TJea+t/5c8O0W
   SsBO8Bp1vm6h8SxaEWcTxkMAONbWUtPTBPsDMVFRSMtEkSPCDZiutAe3k
   3aPGrN4yt3XT7EbAKJ+MYyJPLTOiG0xCFsCVvLPpbusmaHIjeNR0WltB9
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98290416
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:5F2iMa7dFYs9KnUgg25OlwxRtC/HchMFZxGqfqrLsTDasY5as4F+v
 moeCm+FMv2PZWbxL9skbd+08R4PuseGx4VmSgRv/yw8Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoR5weF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 /I3GC0/fhW5qfu7wo6Resxunc5yI5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9zxbC9
 zqapjqR7hcyFNqfijSirVSVn9CUsBuheY4dH4Tm36s/6LGU7jNKU0BHPbehmtGmjmauVtQZL
 FYbkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8yySzC3UATzVBQMc7r8JwTjsvv
 mJlhPuwW2Yp6ufMDyvAqPHN92ja1TUpwXEqWyErfRY389zZjpg+jC7lfvNhC6TkgYigcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVdoNiN2dDB0zWirhRdMOS
 B67hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHYo3gxOhTPgjG9wSDAdJ3T3
 r/BLK6R4YsyU/w7nFJauc9AuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimN4gEAFe/iFyNq
 b53bpLaoyizpcWiOkE7B6ZPdwFVRZX6bLiqw/FqmhmrflM8RDl/VqSLn9vMueVNxsxoqwsBx
 VnlMmcw9bY1rSSvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:2s4EsaE2uWKQVc1BpLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-IronPort-AV: E=Sophos;i="5.97,322,1669093200"; 
   d="scan'208";a="98290416"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] xen: Work around Clang-IAS macro \@ expansion bug
Date: Thu, 23 Feb 2023 20:36:59 +0000
Message-ID: <20230223203659.2594851-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

https://github.com/llvm/llvm-project/issues/60792

It turns out that Clang-IAS does not expand \@ uniquely in a translaition
unit, and the XSA-426 change tickles this bug:

  <instantiation>:4:1: error: invalid symbol redefinition
  .L1_fill_rsb_loop:
  ^
  make[3]: *** [Rules.mk:247: arch/x86/acpi/cpu_idle.o] Error 1

Extend DO_OVERWRITE_RSB with an optional parameter so C callers can mix %= in
too, which Clang does seem to expand properly.

Fixes: 63305e5392ec ("x86/spec-ctrl: Mitigate Cross-Thread Return Address Predictions")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Drop trailing = from parameter declaration.  Rename to xu and adjust comment
 * Move \xu to the end of labels, to avoid directly concatinating with \@

I originally tried a parameter named uniq but this found a different Clang-IAS
bug:

  In file included from arch/x86/asm-macros.c:3:
  ./arch/x86/include/asm/spec_ctrl_asm.h:139:5: error: \u used with no following hex digits; treating as '\' followed by identifier [-Werror,-Wunicode]
  .L\@\uniq\()fill_rsb_loop:
      ^

It appears that Clang is looking for unicode escapes before completing
parameter substitution.  But the macro didn't originate from a context where a
unicode escape was even applicable to begin with.

The consequence is that you can't use macro prameters beginning with a u.
---
 xen/arch/x86/include/asm/spec_ctrl.h     |  4 ++--
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 19 ++++++++++++-------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 3cf8a7d304d4..f718f94088a1 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -83,7 +83,7 @@ static always_inline void spec_ctrl_new_guest_context(void)
     wrmsrl(MSR_PRED_CMD, PRED_CMD_IBPB);
 
     /* (ab)use alternative_input() to specify clobbers. */
-    alternative_input("", "DO_OVERWRITE_RSB", X86_BUG_IBPB_NO_RET,
+    alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_BUG_IBPB_NO_RET,
                       : "rax", "rcx");
 }
 
@@ -172,7 +172,7 @@ static always_inline void spec_ctrl_enter_idle(struct cpu_info *info)
      *
      * (ab)use alternative_input() to specify clobbers.
      */
-    alternative_input("", "DO_OVERWRITE_RSB", X86_FEATURE_SC_RSB_IDLE,
+    alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_FEATURE_SC_RSB_IDLE,
                       : "rax", "rcx");
 }
 
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index fab27ff5532b..f23bb105c51e 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -117,11 +117,16 @@
 .L\@_done:
 .endm
 
-.macro DO_OVERWRITE_RSB tmp=rax
+.macro DO_OVERWRITE_RSB tmp=rax xu
 /*
  * Requires nothing
  * Clobbers \tmp (%rax by default), %rcx
  *
+ * xu is an optional parameter to add eXtra Uniqueness.  It is intended for
+ * passing %= in from an asm() block, in order to work around
+ * https://github.com/llvm/llvm-project/issues/60792 where Clang-IAS doesn't
+ * expand \@ uniquely.
+ *
  * Requires 256 bytes of {,shadow}stack space, but %rsp/SSP has no net
  * change. Based on Google's performance numbers, the loop is unrolled to 16
  * iterations and two calls per iteration.
@@ -136,27 +141,27 @@
     mov $16, %ecx                   /* 16 iterations, two calls per loop */
     mov %rsp, %\tmp                 /* Store the current %rsp */
 
-.L\@_fill_rsb_loop:
+.L\@_fill_rsb_loop\xu:
 
     .irp n, 1, 2                    /* Unrolled twice. */
-    call .L\@_insert_rsb_entry_\n   /* Create an RSB entry. */
+    call .L\@_insert_rsb_entry\xu\n /* Create an RSB entry. */
     int3                            /* Halt rogue speculation. */
 
-.L\@_insert_rsb_entry_\n:
+.L\@_insert_rsb_entry\xu\n:
     .endr
 
     sub $1, %ecx
-    jnz .L\@_fill_rsb_loop
+    jnz .L\@_fill_rsb_loop\xu
     mov %\tmp, %rsp                 /* Restore old %rsp */
 
 #ifdef CONFIG_XEN_SHSTK
     mov $1, %ecx
     rdsspd %ecx
     cmp $1, %ecx
-    je .L\@_shstk_done
+    je .L\@_shstk_done\xu
     mov $64, %ecx                   /* 64 * 4 bytes, given incsspd */
     incsspd %ecx                    /* Restore old SSP */
-.L\@_shstk_done:
+.L\@_shstk_done\xu:
 #endif
 .endm
 
-- 
2.30.2


