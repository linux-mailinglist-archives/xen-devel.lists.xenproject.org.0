Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D351A712541
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 13:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540061.841543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VIN-0007jB-9S; Fri, 26 May 2023 11:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540061.841543; Fri, 26 May 2023 11:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VIN-0007gR-4z; Fri, 26 May 2023 11:07:43 +0000
Received: by outflank-mailman (input) for mailman id 540061;
 Fri, 26 May 2023 11:07:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gDTS=BP=citrix.com=prvs=5031e17c9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q2VIJ-0006sm-Tl
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 11:07:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84d6f7e6-fbb5-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 13:07:37 +0200 (CEST)
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
X-Inumbo-ID: 84d6f7e6-fbb5-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685099257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tRC3UNaCj65Aajc92g1f04RU5FXAg5eRZ78lBWu320s=;
  b=LM1gi+wmkEVqhGjUQ7uNSs8gDNE+T9yfECPD10vO/zN6lcPbZhf9wxJ0
   ArK/L+GdX8fwxvzLj6ZVNRqGGxeBvFd1vKjk5CG/KB+f8YliAIaGbqb0S
   Z05gtVJakFiqbVsZ90PJP8/dsciMpTDEr2omoWG9VdRFFQxNcqsBaKYRr
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109294592
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:cBW1faP5CyulEM/vrR21l8FynXyQoLVcMsEvi/4bfWQNrUpz0jAFz
 WMcXjiDPfeJMGL9ft4nb460oUgF78PTmtZgQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tF5AJmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0s14WE9x9
 60pESgENkGDpP2Q3r38Q/Y506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXSFJ8EwhvJ/
 Aoq+UynLT0YHvKalwOOzViV3umegTvSCawdQejQGvlC3wTImz175ActfUS/iem0jAi5Qd03A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52ml6IDZ/gKYDWgsVSNaZZots8peeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwA+IjYsWi1VfDId6oGyoKIsqAzACd98RfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zt64oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFoSbLkWN4umsWyKJV3iEsJ1fUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMgsLFTWoH03Ox/Kt4wIrKTKuftjU
 Xt8WZ/2ZUv29Iw9lGbmLwvj+eNDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGazghQCxPrc+m39q
 o8PX/ZmPj0DCIUSlAGLq99MRb3LRFBnba3LRzt/LLPbeVY+QzhwUpc8A9oJIuRYokicrc+Ql
 lnVZ6OS4Aak7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:VFnX+K3Pp0nw9MLWDklb9wqjBEIkLtp133Aq2lEZdPU0SKGlfq
 GV7ZAmPHrP4gr5N0tOpTntAse9qBDnhPtICOsqTNSftWDd0QPFEGgF1+rfKlXbcBEWndQtt5
 uIHZIfNDSKNykcsS77ijPIb+rJwrO8gd+VbTG19QYSceloAZsQnjuQEmygYytLrJEtP+tCKH
 KbjPA33gaISDAsQemQIGIKZOTHr82jruOaXfZXbyRXkDVnlFmTmcXHLyQ=
X-Talos-CUID: =?us-ascii?q?9a23=3AnFnHrmkr7iIBbMER6dP25rr6IULXOVbSlVnvIR6?=
 =?us-ascii?q?JMH5gEOyVakC25qwjmtU7zg=3D=3D?=
X-Talos-MUID: 9a23:jwmPlgkPzsQImLdwUzX6dno8G+tqyYqrVnkGrr8/48/VKTRZahmS2WE=
X-IronPort-AV: E=Sophos;i="6.00,194,1681185600"; 
   d="scan'208";a="109294592"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/4] x86/spec-ctrl: Rename retpoline_safe() to retpoline_calculations()
Date: Fri, 26 May 2023 12:06:52 +0100
Message-ID: <20230526110656.4018711-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
References: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is prep work, split out to simply the diff on the following change.

 * Rename to retpoline_calculations(), and call unconditionally.  It is
   shortly going to synthesize missing enumerations required for guest safety.
 * For Broadwell, store the ucode revision calculation in a variable and fall
   out of the bottom of the switch statement.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/spec_ctrl.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 50d467f74cf8..0774d40627dd 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -579,9 +579,10 @@ static bool __init check_smt_enabled(void)
 }
 
 /* Calculate whether Retpoline is known-safe on this CPU. */
-static bool __init retpoline_safe(void)
+static bool __init retpoline_calculations(void)
 {
     unsigned int ucode_rev = this_cpu(cpu_sig).rev;
+    bool safe = false;
 
     if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
         return true;
@@ -626,18 +627,18 @@ static bool __init retpoline_safe(void)
          * versions.
          */
     case 0x3d: /* Broadwell */
-        return ucode_rev >= 0x2a;
+        safe = ucode_rev >= 0x2a;      break;
     case 0x47: /* Broadwell H */
-        return ucode_rev >= 0x1d;
+        safe = ucode_rev >= 0x1d;      break;
     case 0x4f: /* Broadwell EP/EX */
-        return ucode_rev >= 0xb000021;
+        safe = ucode_rev >= 0xb000021; break;
     case 0x56: /* Broadwell D */
         switch ( boot_cpu_data.x86_mask )
         {
-        case 2:  return ucode_rev >= 0x15;
-        case 3:  return ucode_rev >= 0x7000012;
-        case 4:  return ucode_rev >= 0xf000011;
-        case 5:  return ucode_rev >= 0xe000009;
+        case 2:  safe = ucode_rev >= 0x15;      break;
+        case 3:  safe = ucode_rev >= 0x7000012; break;
+        case 4:  safe = ucode_rev >= 0xf000011; break;
+        case 5:  safe = ucode_rev >= 0xe000009; break;
         default:
             printk("Unrecognised CPU stepping %#x - assuming not reptpoline safe\n",
                    boot_cpu_data.x86_mask);
@@ -681,6 +682,12 @@ static bool __init retpoline_safe(void)
                boot_cpu_data.x86_model);
         return false;
     }
+
+    /* Only Broadwell gets here. */
+    if ( safe )
+        return true;
+
+    return false;
 }
 
 /*
@@ -1113,7 +1120,7 @@ void __init init_speculation_mitigations(void)
 {
     enum ind_thunk thunk = THUNK_DEFAULT;
     bool has_spec_ctrl, ibrs = false, hw_smt_enabled;
-    bool cpu_has_bug_taa;
+    bool cpu_has_bug_taa, retpoline_safe;
 
     hw_smt_enabled = check_smt_enabled();
 
@@ -1139,6 +1146,9 @@ void __init init_speculation_mitigations(void)
             thunk = THUNK_JMP;
     }
 
+    /* Determine if retpoline is safe on this CPU. */
+    retpoline_safe = retpoline_calculations();
+
     /*
      * Has the user specified any custom BTI mitigations?  If so, follow their
      * instructions exactly and disable all heuristics.
@@ -1160,7 +1170,7 @@ void __init init_speculation_mitigations(void)
              * On all hardware, we'd like to use retpoline in preference to
              * IBRS, but only if it is safe on this hardware.
              */
-            if ( retpoline_safe() )
+            if ( retpoline_safe )
                 thunk = THUNK_RETPOLINE;
             else if ( has_spec_ctrl )
                 ibrs = true;
-- 
2.30.2


