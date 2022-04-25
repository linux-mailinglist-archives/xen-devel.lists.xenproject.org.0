Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA60950E796
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 19:57:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313219.530710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj2wl-0007XX-1r; Mon, 25 Apr 2022 17:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313219.530710; Mon, 25 Apr 2022 17:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj2wk-0007U2-UT; Mon, 25 Apr 2022 17:56:26 +0000
Received: by outflank-mailman (input) for mailman id 313219;
 Mon, 25 Apr 2022 17:56:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eo9G=VD=citrix.com=prvs=107e1699f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nj2wj-0007Tw-Dk
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 17:56:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03d89e87-c4c1-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 19:56:23 +0200 (CEST)
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
X-Inumbo-ID: 03d89e87-c4c1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650909383;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/tKAjkkYSMDllU9JnQF69uN0fUng2lAXH77fLoP809k=;
  b=bUSmQQ2BV6fsem5C1CANsQTWge1UeXHKJzsSeqUNwjj6TfhoTpD/LXO7
   e+wsCCVH4o8PpNop51FON/MaxspcQs1cKR52rh4qJV6mCfUkr9s4rb7lf
   lzOfbHvE1pmAkFFUBr2RK4AEB8fgyj1Ll4SETnAjus25YY6TN7QJDLyT1
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70288496
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JkWh/KlXmhG5at+vrnXN1Zjo5gz9JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYCjzUaPyMazegKt91PI2+9U5T68ODzNBrSVA/pXhhRiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlWV7V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYeAoEbrfBqOchQxhRGCJDOvFkouPAGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3k3ds1zzGS90hRojOWf7i7t5ExjYgwMtJGJ4yY
 uJGMWA/PEiRPXWjPH89J6o6n+Slm0D/YmMb+RWYiIMw4DX6mVkZPL/Fb4OOJ43iqd9utlmcj
 nLL+SL+GB5yHP61xCeB83msrvTShi69U4UXfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwDCA5/rO7jaaOngFRzVCVdt6lpVqQgV/g
 zdlgOjVLTBotbSUT1eU+bGVsS6+NEApEIMSWcMXZVBbuoe++enfmjqKF48+S/Dt0rUZDBmqm
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CGt56sz67DFzFtW
 UTofODEsYgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmwmexowapxVJGW3C
 KM2he+3zMUKVJdNRfUpC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZylkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLCgMnSPrd5PfDjn7xETXPjLliCeTcbbSiIOJY3rI6W5LW8JE2C9o5loqw==
IronPort-HdrOrdr: A9a23:Tvv1Fq8kiWOlDCp+ntNuk+DUI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+8jztCWE7Ar5N0tBpTntAsW9qBDnhPtICOsqTNSftWDd0QPCRuxfBOPZslvd8kbFl9K1u5
 0OT0EHMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.90,289,1643691600"; 
   d="scan'208";a="70288496"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/nospec: Fix evaluate_nospec() code generation under Clang
Date: Mon, 25 Apr 2022 18:56:03 +0100
Message-ID: <20220425175603.21086-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It turns out that evaluate_nospec() code generation is not safe under Clang.
Given:

  void eval_nospec_test(int x)
  {
      if ( evaluate_nospec(x) )
          asm volatile ("nop #true" ::: "memory");
      else
          asm volatile ("nop #false" ::: "memory");
  }

Clang emits:

  <eval_nospec_test>:
         0f ae e8                lfence
         85 ff                   test   %edi,%edi
         74 02                   je     <eval_nospec_test+0x9>
         90                      nop
         c3                      ret
         90                      nop
         c3                      ret

which is not safe because the lfence has been hoisted above the conditional
jump.  Clang concludes that both barrier_nospec_true()'s have identical side
effects and can safely be merged.

Clang can be persuaded that the side effects are different if there are
different comments in the asm blocks.  This is fragile, but no more fragile
that other aspects of this construct.

Introduce barrier_nospec_false() with a separate internal comment to prevent
Clang merging it with barrier_nospec_true() despite the otherwise-identical
content.  The generated code now becomes:

  <eval_nospec_test>:
         85 ff                   test   %edi,%edi
         74 05                   je     <eval_nospec_test+0x9>
         0f ae e8                lfence
         90                      nop
         c3                      ret
         0f ae e8                lfence
         90                      nop
         c3                      ret

which has the correct number of lfence's, and in the correct place.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/nospec.h | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/nospec.h b/xen/arch/x86/include/asm/nospec.h
index 5312ae4c6f31..7150e76b87fb 100644
--- a/xen/arch/x86/include/asm/nospec.h
+++ b/xen/arch/x86/include/asm/nospec.h
@@ -10,15 +10,26 @@
 static always_inline bool barrier_nospec_true(void)
 {
 #ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
-    alternative("lfence", "", X86_FEATURE_SC_NO_BRANCH_HARDEN);
+    alternative("lfence #nospec-true", "", X86_FEATURE_SC_NO_BRANCH_HARDEN);
 #endif
     return true;
 }
 
+static always_inline bool barrier_nospec_false(void)
+{
+#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
+    alternative("lfence #nospec-false", "", X86_FEATURE_SC_NO_BRANCH_HARDEN);
+#endif
+    return false;
+}
+
 /* Allow to protect evaluation of conditionals with respect to speculation */
 static always_inline bool evaluate_nospec(bool condition)
 {
-    return condition ? barrier_nospec_true() : !barrier_nospec_true();
+    if ( condition )
+        return barrier_nospec_true();
+    else
+        return barrier_nospec_false();
 }
 
 /* Allow to block speculative execution in generic code */
-- 
2.11.0


