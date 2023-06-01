Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4F371A0D9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 16:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542599.846646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jbn-0006Oz-9L; Thu, 01 Jun 2023 14:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542599.846646; Thu, 01 Jun 2023 14:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4jbn-0006NC-4o; Thu, 01 Jun 2023 14:48:59 +0000
Received: by outflank-mailman (input) for mailman id 542599;
 Thu, 01 Jun 2023 14:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFRJ=BV=citrix.com=prvs=509590c99=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q4jbl-0005t4-F7
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 14:48:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e93d0fc-008b-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 16:48:55 +0200 (CEST)
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
X-Inumbo-ID: 6e93d0fc-008b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685630935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4fvPFTN01BOhGOiMjRrOl+jDQlX0oz34/lNnkFP6f1o=;
  b=AapmWM7nj3czncNMLMTeBt/y/3VVaC5Fk24jJRX8OZMW9JMQWdwaeWTD
   5ixtnGu6brNGK7lEPUtkQkI/qUso61m/8cDjP2jw26qxxHUmEviNmVN4R
   gpcCp4wbmtRTNO7YdVVxe++RvyeETcII1cso8BEaIP+JnBLwdsdgWKdKH
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111123535
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Y+K1nKITCehldSijFE+RzZUlxSXFcZb7ZxGr2PjKsXjdYENShWAOz
 GMaDz+FP/iDYmukLdB2aIWzoBhVvMPVy9RiQARlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4ARnPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5QGnkW3
 /YXBQsASVeBnt+ZwLfnZNlV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJwMxB3F/
 T+uE2LRGEkQO9K+8ii+4HOGiu3vg3rwH6EJPejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9CnQaPQUOQiY+7v6kopgOoRLKEvhTKfvg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yfyFWyzyGskTKuMDirjUWGBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YhKVLao3EzPRbNjwgBdXTAd4llY
 /93lu71XB4n5VlPlmLqF4/xL5d2rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRtcu5TPHu2
 48HbaOikkwPONASlwGLqeb/23hWdylkbX03wuQLHtO+zv1OQzp5Va+BkO54J+SIXc19z4/1w
 510YWcAoHKXuJENAV7ihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:iueOjaMUt1U+o8BcTjGjsMiBIKoaSvp037BK7S1MoH1uA6ulfq
 WV9sjzuiWatN98Yh8dcJW7Scq9qBDnhPpICOsqXYtKNTOO0AeVxcNZnOnfKlXbcBEWndQtsJ
 uIHZIeNDXxZ2IK8foT4mODYqkdKA/sytHXuQ/cpU0dPD2Dc8tbnmFE4p7wKDwNeOFBb6BJba
 a01458iBeLX28YVci/DmltZZm/mzWa/KiWGSLvHnQcmXKzsQ8=
X-Talos-CUID: 9a23:MEpBj2zb1RQjoUzPsYl6BgUzAdh9WHfS4UzdBAi6EFtGSLjJZ2+prfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AnIQMxwx87zXHzQbFYOzgqDDv48CaqL72Ak8DsK4?=
 =?us-ascii?q?UgNuFHyByGynEh3OUWaZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,210,1681185600"; 
   d="scan'208";a="111123535"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] x86/spec-ctrl: Fix up the RSBA/RRSBA bits as appropriate
Date: Thu, 1 Jun 2023 15:48:44 +0100
Message-ID: <20230601144845.1554589-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
References: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In order to level a VM safely for migration, the toolstack needs to know the
RSBA/RRSBA properties of the CPU, whether or not they happen to be enumerated.

See the code comment for details.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Rewrite almost from scratch.
---
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/spec_ctrl.c              | 92 +++++++++++++++++++++++++--
 2 files changed, 88 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index ace31e3b1f1a..e2cb8f3cc728 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -193,6 +193,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_tsx_ctrl        boot_cpu_has(X86_FEATURE_TSX_CTRL)
 #define cpu_has_taa_no          boot_cpu_has(X86_FEATURE_TAA_NO)
 #define cpu_has_fb_clear        boot_cpu_has(X86_FEATURE_FB_CLEAR)
+#define cpu_has_rrsba           boot_cpu_has(X86_FEATURE_RRSBA)
 
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index daee61900afa..29ed410da47a 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -579,7 +579,10 @@ static bool __init check_smt_enabled(void)
     return false;
 }
 
-/* Calculate whether Retpoline is known-safe on this CPU. */
+/*
+ * Calculate whether Retpoline is known-safe on this CPU.  Fix up the
+ * RSBA/RRSBA bits as necessary.
+ */
 static bool __init retpoline_calculations(void)
 {
     unsigned int ucode_rev = this_cpu(cpu_sig).rev;
@@ -593,15 +596,85 @@ static bool __init retpoline_calculations(void)
         return false;
 
     /*
-     * RSBA may be set by a hypervisor to indicate that we may move to a
-     * processor which isn't retpoline-safe.
+     * The meaning of the RSBA and RRSBA bits have evolved over time.  The
+     * agreed upon meaning at the time of writing (May 2023) is thus:
+     *
+     * - RSBA (RSB Alternative) means that an RSB may fall back to an
+     *   alternative predictor on underflow.  Skylake uarch and later all have
+     *   this property.  Broadwell too, when running microcode versions prior
+     *   to Jan 2018.
+     *
+     * - All eIBRS-capable processors suffer RSBA, but eIBRS also introduces
+     *   tagging of predictions with the mode in which they were learned.  So
+     *   when eIBRS is active, RSBA becomes RRSBA (Restricted RSBA).
+     *
+     * - CPUs are not expected to enumerate both RSBA and RRSBA.
+     *
+     * Some parts (Broadwell) are not expected to ever enumerate this
+     * behaviour directly.  Other parts have differing enumeration with
+     * microcode version.  Fix up Xen's idea, so we can advertise them safely
+     * to guests, and so toolstacks can level a VM safety for migration.
+     *
+     * The following states exist:
+     *
+     * |   | RSBA | EIBRS | RRSBA | Notes              | Action        |
+     * |---+------+-------+-------+--------------------+---------------|
+     * | 1 |    0 |     0 |     0 | OK (older parts)   | Maybe +RSBA   |
+     * | 2 |    0 |     0 |     1 | Broken             | +RSBA, -RRSBA |
+     * | 3 |    0 |     1 |     0 | OK (pre-Aug ucode) | +RRSBA        |
+     * | 4 |    0 |     1 |     1 | OK                 |               |
+     * | 5 |    1 |     0 |     0 | OK                 |               |
+     * | 6 |    1 |     0 |     1 | Broken             | -RRSBA        |
+     * | 7 |    1 |     1 |     0 | Broken             | -RSBA, +RRSBA |
+     * | 8 |    1 |     1 |     1 | Broken             | -RSBA         |
      *
+     * However, we doesn't need perfect adherence to the spec.  Identify the
+     * broken cases (so we stand a chance of spotting violated assumptions),
+     * and fix up Rows 1 and 3 so Xen can use RSBA || RRSBA to identify
+     * "alternative predictors potentially in use".
+     */
+    if ( cpu_has_eibrs ? cpu_has_rsba  /* Rows 7, 8 */
+                       : cpu_has_rrsba /* Rows 2, 6 */ )
+        printk(XENLOG_ERR
+               "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: RSBA %u, EIBRS %u, RRSBA %u\n",
+               boot_cpu_data.x86, boot_cpu_data.x86_model,
+               boot_cpu_data.x86_mask, ucode_rev,
+               cpu_has_rsba, cpu_has_eibrs, cpu_has_rrsba);
+
+    /*
      * Processors offering Enhanced IBRS are not guarenteed to be
      * repoline-safe.
      */
-    if ( cpu_has_rsba || cpu_has_eibrs )
+    if ( cpu_has_eibrs )
+    {
+        /*
+         * Prior to the August 2023 microcode, many eIBRS-capable parts did
+         * not enumerate RRSBA.
+         */
+        if ( !cpu_has_rrsba )
+            setup_force_cpu_cap(X86_FEATURE_RRSBA);
+
+        return false;
+    }
+
+    /*
+     * RSBA is explicitly enumerated in some cases, but may also be set by a
+     * hypervisor to indicate that we may move to a processor which isn't
+     * retpoline-safe.
+     */
+    if ( cpu_has_rsba )
         return false;
 
+    /*
+     * At this point, we've filtered all the legal RSBA || RRSBA cases (or the
+     * known non-ideal cases).  If ARCH_CAPS is visible, trust the absence of
+     * RSBA || RRSBA.  There's no known microcode which advertises ARCH_CAPS
+     * without RSBA or EIBRS, and if we're virtualised we can't rely the model
+     * check anyway.
+     */
+    if ( cpu_has_arch_caps )
+        return true;
+
     switch ( boot_cpu_data.x86_model )
     {
     case 0x17: /* Penryn */
@@ -689,6 +762,15 @@ static bool __init retpoline_calculations(void)
         break;
     }
 
+    if ( !safe )
+    {
+        /*
+         * Note: the eIBRS-capable parts are filtered out earlier, so the
+         * remainder here are the ones which suffer only RSBA behaviour.
+         */
+        setup_force_cpu_cap(X86_FEATURE_RSBA);
+    }
+
     return safe;
 }
 
@@ -1148,7 +1230,7 @@ void __init init_speculation_mitigations(void)
             thunk = THUNK_JMP;
     }
 
-    /* Determine if retpoline is safe on this CPU. */
+    /* Determine if retpoline is safe on this CPU.  Fix up RSBA/RRSBA enumerations. */
     retpoline_safe = retpoline_calculations();
 
     /*
-- 
2.30.2


