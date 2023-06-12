Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A806172CB2C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 18:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547359.854719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8kAb-0002co-9C; Mon, 12 Jun 2023 16:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547359.854719; Mon, 12 Jun 2023 16:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8kAb-0002Z7-5v; Mon, 12 Jun 2023 16:13:29 +0000
Received: by outflank-mailman (input) for mailman id 547359;
 Mon, 12 Jun 2023 16:13:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abQ6=CA=citrix.com=prvs=520cb9a4c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q8kAZ-00021a-FG
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 16:13:27 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fa7f518-093c-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 18:13:26 +0200 (CEST)
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
X-Inumbo-ID: 0fa7f518-093c-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686586406;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JSQhePAu7wLSZxBsPLSVDbChk6MZTVUce/EtRxuN6UE=;
  b=VqKOk0WI+E2+AxOo3+931A+ulSdwxdkoOZIHtYjIWJmKwDCtnfFISALc
   aMbg1qD0Go/GM9yfAf1XS8vz+4iCmAxyUfdaT7dKF5r2j1yjDEVy9MkI0
   4JAA//ZuZcsdlW2nmLSdtkTnxT4kQqJKY9WzI1oP3vZhpSEn2ohdbSqBm
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112508909
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:JlpAsaO86SIlBKrvrR3fl8FynXyQoLVcMsEvi/4bfWQNrUp21DAGn
 GEbDDjQbPbcM2ajf9AlO4/j/UIH6pTXnYNhTgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5wZmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sBSIG1i+
 NJEFDEMYyy4gfib3q/qE+Y506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXTH5gNzhfA9
 woq+UzBWxJdJfuj4gODySKIxd7DxSbjSKE7QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBeeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwAzCE4OSSIqETcE4tTfm4cpowzSH49sRfvdYsLOJd3g/
 9ybhHFg1+tJ3ZVQhvjTEUPv2Gz1+MWQJuIhzkCOBz/+sFskDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKMN8N7n9hV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEnPd/pW5hynPC8S7wJs8w4ifIUO/BMmPKvpnkyNSZ8IUiw+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48gPUwDn0gDKZfobcmjlXyPiOPODEN5vJ9ZaDNimMhltvLbyOgUm
 v4DX/a3J+J3Cr2uO3SGrdRCcTjn7xETXPjLliCeTcbbSiIOJY3rI6a5LW8JE2C9o5loqw==
IronPort-HdrOrdr: A9a23:PYq/paoE2I3gh82nyeqAdN0aV5oReYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTn4AtjnfZq/z/5ICPgqXItKNTOO0AHEEGgI1/qA/9SPIVybysdtkY
 tmbqhiGJnRIDFB/KHHCdCDYrQdKQ+8gcWVuds=
X-Talos-CUID: 9a23:WnQU/2C9/MBkj6z6Ew9C1UI4F+55TnzcwUvrJVWVF3s4EbLAHA==
X-Talos-MUID: 9a23:vdutSgmWka0HzMGhgT4odnpabcQv8oOSI3kLqsUi+PiIbSloKxS02WE=
X-IronPort-AV: E=Sophos;i="6.00,236,1681185600"; 
   d="scan'208";a="112508909"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3 2/4] x86/spec-ctrl: Rename retpoline_safe() to retpoline_calculations()
Date: Mon, 12 Jun 2023 17:13:04 +0100
Message-ID: <20230612161306.2739572-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
References: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
index 05b86edf73d3..3892ce4d20ba 100644
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
 
@@ -1143,6 +1151,9 @@ void __init init_speculation_mitigations(void)
             thunk = THUNK_JMP;
     }
 
+    /* Determine if retpoline is safe on this CPU. */
+    retpoline_safe = retpoline_calculations();
+
     /*
      * Has the user specified any custom BTI mitigations?  If so, follow their
      * instructions exactly and disable all heuristics.
@@ -1164,7 +1175,7 @@ void __init init_speculation_mitigations(void)
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


