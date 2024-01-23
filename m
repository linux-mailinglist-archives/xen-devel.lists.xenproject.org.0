Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D53839AB7
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 22:00:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670605.1043501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSNsE-0001F3-Ie; Tue, 23 Jan 2024 20:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670605.1043501; Tue, 23 Jan 2024 20:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSNsE-0001Cs-Fq; Tue, 23 Jan 2024 20:59:58 +0000
Received: by outflank-mailman (input) for mailman id 670605;
 Tue, 23 Jan 2024 20:59:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=agvZ=JB=citrix.com=prvs=745b95a7f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rSNsD-0001Cm-9i
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 20:59:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a7445ca-ba32-11ee-98f5-6d05b1d4d9a1;
 Tue, 23 Jan 2024 21:59:55 +0100 (CET)
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
X-Inumbo-ID: 5a7445ca-ba32-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1706043594;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XYENZ7mntZ4BXqj5Lh3OmMQDbH2kjvI/Djnjt3ZMeu0=;
  b=SXiJlqP6tlbIshz7Gsd0fUNKbXq1yGjOB7jdUdpQALwJNz2QUBte4ZeL
   L123C1NaTb8AZjiD9TEqQRwGelhj6xRtLCrBDxj57QVpa/GG639vNYpxt
   b6FtwW8Uv0nvX7FwwTKySVY3+LDMkO5joyxqPB/A6iTV6WXvAaFfSHkWD
   c=;
X-CSE-ConnectionGUID: A5MugA1pSxKNAiNoeJMjkg==
X-CSE-MsgGUID: PoWjPfzWQOyHw2wNCU/UvQ==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 129487174
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:FSul4a1Zmia99i6POvbD5Zdxkn2cJEfYwER7XKvMYLTBsI5bpzZRy
 DEdWTjSaPqCYjHzetEja9vgpxgD6MSGm4UwSgBtpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb9XuDgNyo4GlE5gVkPqgX1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfKDxr6
 PMxcSg2fjOlruOQx7+Zb+tviZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGc+KkuYC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTH5QJzhnB+
 T6uE2LROhYlNuSR2wW81WOMmbXQuwjGH78MLejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIGDTCrt94sA9eJwA8cEofagZdVTAVwP/Koac0gzDqTNVsRfvdYsLOJd3g/
 9ybhHFh3+tL1JJahvjTwLzRv967SnH0ou8JCub/BDvNAvtRPtLNWmBRwQGzAQx8BIiYVEKdm
 3MPhtKT6usDZbnUy3TTGL5QRujwu6jdWNE5vbKIN8B/nwlBBlb5JdwAiN2ADBkB3jk4lc/BP
 xaI5FI5CG57N3q2d65nC7+M5zAR5fG4T7zND6mEBueil7AtLGdrCgkyPx/Pt40s+WBw+ZwC1
 WCzK5n0XS9EWP06lVJbhY41iNcW+8z3/kuLLbiT8vht+eP2iKK9IVvdDGazUw==
IronPort-HdrOrdr: A9a23:oJG7qapmlFrTp3nY/1xfUjYaV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-Talos-CUID: 9a23:SgiSf2N8Al33fe5DcXRC6UE9Q9geYl775Xb2JEKaLGRqR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AIabMegyCp4g35AjVp50/b0oj9IKaqJypN0I1n4c?=
 =?us-ascii?q?5gu6VFTMqJBG2sXOKXLZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.05,215,1701147600"; 
   d="scan'208";a="129487174"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/ucode: Fix stability of the Raw CPU Policy rescan
Date: Tue, 23 Jan 2024 20:59:48 +0000
Message-ID: <20240123205948.1782556-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Always run microcode_update_helper() on the BSP, so the the updated Raw CPU
policy doesn't get non-BSP topology details included.

Have calculate_raw_cpu_policy() clear the instantanious XSTATE sizes.  The
value XCR0 | MSR_XSS had when we scanned the policy isn't terribly interesting
to report.

When CPUID Masking is active, it affects CPUID instructions issued by Xen
too.  Transiently disable masking to get a clean scan.

Fixes: 694d79ed5aac ("x86/ucode: Refresh raw CPU policy after microcode load")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I debased adding named fields for the instantious xstate sizes, but decided
not to.  There's no (other) case where I can see them reasonably being used.
---
 xen/arch/x86/cpu-policy.c         |  7 +++++++
 xen/arch/x86/cpu/microcode/core.c | 20 +++++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 76efb050edf7..82b10de03efd 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -353,6 +353,13 @@ void calculate_raw_cpu_policy(void)
     /* Nothing good will come from Xen and libx86 disagreeing on vendor. */
     ASSERT(p->x86_vendor == boot_cpu_data.x86_vendor);
 
+    /*
+     * Clear the truly dynamic fields.  These vary with the in-context XCR0
+     * and MSR_XSS, and aren't interesting fields in the raw policy.
+     */
+    p->xstate.raw[0].ebx = 0;
+    p->xstate.raw[1].ebx = 0;
+
     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
     /* Was already added by probe_cpuid_faulting() */
 }
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 120a11d5036d..6f95f7bbe223 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -680,8 +680,18 @@ static long cf_check microcode_update_helper(void *data)
         microcode_update_cache(patch);
         spin_unlock(&microcode_mutex);
 
-        /* Refresh the raw CPU policy, in case the features have changed. */
+        /*
+         * Refresh the raw CPU policy, in case the features have changed.
+         * Disable CPUID masking if in use, to avoid having current's
+         * cpu_policy affect the rescan.
+         */
+	if ( ctxt_switch_masking )
+            alternative_vcall(ctxt_switch_masking, NULL);
+
         calculate_raw_cpu_policy();
+
+	if ( ctxt_switch_masking )
+            alternative_vcall(ctxt_switch_masking, current);
     }
     else
         microcode_free_patch(patch);
@@ -721,8 +731,12 @@ int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
     }
     buffer->len = len;
 
-    return continue_hypercall_on_cpu(smp_processor_id(),
-                                     microcode_update_helper, buffer);
+    /*
+     * Always queue microcode_update_helper() on CPU0.  Most of the logic
+     * won't care, but the update of the Raw CPU policy wants to (re)run on
+     * the BSP.
+     */
+    return continue_hypercall_on_cpu(0, microcode_update_helper, buffer);
 }
 
 static int __init cf_check microcode_init(void)
-- 
2.30.2


