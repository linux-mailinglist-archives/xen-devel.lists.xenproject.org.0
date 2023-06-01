Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA66271A0D8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:49:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542597.846626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jbl-0005vv-KX; Thu, 01 Jun 2023 14:48:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542597.846626; Thu, 01 Jun 2023 14:48:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jbl-0005tF-G1; Thu, 01 Jun 2023 14:48:57 +0000
Received: by outflank-mailman (input) for mailman id 542597;
 Thu, 01 Jun 2023 14:48:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFRJ=BV=citrix.com=prvs=509590c99=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q4jbj-0005t4-G4
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:48:55 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c356c00-008b-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 16:48:52 +0200 (CEST)
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
X-Inumbo-ID: 6c356c00-008b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685630932;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IcofpnS6XGYluTyt2W7nbS+cq7NfLxqLKtySG8hnQ+Y=;
  b=Vfj86GDiCMxVhqzvivBvpHPZvXDxLqK1x7wTNvjrYVDf7SFSipech996
   acS3+SmmGAL3BY5KqUnMXIv4db4/uN5Z8J+VItoKd0vbb9T3gFGA+5uzL
   CD0toHi3VtP6SWOc84uTqtFaSB862fivCvoK8IsyODlEHk+yHfRPsO+xz
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111123534
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:rgLZB6JfgrxzOSzEFE+RzZUlxSXFcZb7ZxGr2PjKsXjdYENS0WQEy
 mYXCGyPOfrZYjP2KIskPIW/pk8PvpXQzoBlQVRlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4ARnPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5QGnkW3
 /YXBQsASVeBnt+ZwLfnZNlV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJwMxB3F/
 T6uE2LRUzYhH9Hclya8rVWBpt73wiXkA7sNG+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9CnQaPQUOQiY+7v6kopgOoRLKEvhTKfvg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yfyFWyzyGskTKuMDirjUWGBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YhKVLao3EzPRbNjwgBdXTAd4llY
 /93lu71XB4n5VlPlmLqF4/xL5d2rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRtcu5TPHu2
 48HbaOikkwPONASlwGLqeb/23hWdylkbX03wuQLHtO+zv1OQzp5Va+BkO54J+SIXc19z4/1w
 510YWcAoHKXuJENAV7ihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:i/bT46xvZcdN2Lvrb5FrKrPw3L1zdoMgy1knxilNoHxuH/Bw9v
 re+8jzsCWftN9/Yh4dcLy7VpVoBEmslqKdgrNhWYtKPjOHhILAFugLgbcKgQeQeREWntQ36U
 4KSdkaNDSfNzlHZcaR2njFLz4jquP3j5xBU43lvglQpQIBUdAQ0+9gYDzrdHGf3GN9dOAE/J
 z33Ls/mxOQPU45Q+6cHXc/U+3Kt7Tw5e/biU5vPW9e1OGW5wnYk4LHLw==
X-Talos-CUID: =?us-ascii?q?9a23=3AnrwEImnAi6tmRg+LuSy9AAVXZNDXOVrG1C/6KUC?=
 =?us-ascii?q?VMmtOD7+MdHCQ/f9Ko/M7zg=3D=3D?=
X-Talos-MUID: 9a23:JXvoWAsmyXPyJfR/x82n1RZZH8orvbiXV2cgsaQ+5M+bbhVvNGLI
X-IronPort-AV: E=Sophos;i="6.00,210,1681185600"; 
   d="scan'208";a="111123534"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/3] x86/spec-ctrl: Rename retpoline_safe() to retpoline_calculations()
Date: Thu, 1 Jun 2023 15:48:43 +0100
Message-ID: <20230601144845.1554589-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
References: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is prep work, split out to simply the diff on the following change.

 * Rename to retpoline_calculations(), and call unconditionally.  It is
   shortly going to synthesise missing enumerations required for guest safety.
 * For the model check switch statement, store the result in a variable and
   break rather than returning directly.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Extend the 'safe' variable to the entire switch statement.
---
 xen/arch/x86/spec_ctrl.c | 41 +++++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index cd5ea6aa52d9..daee61900afa 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -580,9 +580,10 @@ static bool __init check_smt_enabled(void)
 }
 
 /* Calculate whether Retpoline is known-safe on this CPU. */
-static bool __init retpoline_safe(void)
+static bool __init retpoline_calculations(void)
 {
     unsigned int ucode_rev = this_cpu(cpu_sig).rev;
+    bool safe = false;
 
     if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
         return true;
@@ -620,29 +621,31 @@ static bool __init retpoline_safe(void)
     case 0x3f: /* Haswell EX/EP */
     case 0x45: /* Haswell D */
     case 0x46: /* Haswell H */
-        return true;
+        safe = true;
+        break;
 
         /*
          * Broadwell processors are retpoline-safe after specific microcode
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
-            return false;
+            safe = false;
+            break;
         }
         break;
 
@@ -656,7 +659,8 @@ static bool __init retpoline_safe(void)
     case 0x67: /* Cannonlake? */
     case 0x8e: /* Kabylake M */
     case 0x9e: /* Kabylake D */
-        return false;
+        safe = false;
+        break;
 
         /*
          * Atom processors before Goldmont Plus/Gemini Lake are retpoline-safe.
@@ -675,13 +679,17 @@ static bool __init retpoline_safe(void)
     case 0x5c: /* Goldmont */
     case 0x5f: /* Denverton */
     case 0x85: /* Knights Mill */
-        return true;
+        safe = true;
+        break;
 
     default:
         printk("Unrecognised CPU model %#x - assuming not reptpoline safe\n",
                boot_cpu_data.x86_model);
-        return false;
+        safe = false;
+        break;
     }
+
+    return safe;
 }
 
 /*
@@ -1114,7 +1122,7 @@ void __init init_speculation_mitigations(void)
 {
     enum ind_thunk thunk = THUNK_DEFAULT;
     bool has_spec_ctrl, ibrs = false, hw_smt_enabled;
-    bool cpu_has_bug_taa;
+    bool cpu_has_bug_taa, retpoline_safe;
 
     hw_smt_enabled = check_smt_enabled();
 
@@ -1140,6 +1148,9 @@ void __init init_speculation_mitigations(void)
             thunk = THUNK_JMP;
     }
 
+    /* Determine if retpoline is safe on this CPU. */
+    retpoline_safe = retpoline_calculations();
+
     /*
      * Has the user specified any custom BTI mitigations?  If so, follow their
      * instructions exactly and disable all heuristics.
@@ -1161,7 +1172,7 @@ void __init init_speculation_mitigations(void)
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


