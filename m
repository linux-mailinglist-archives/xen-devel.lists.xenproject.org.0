Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1888A28BAE8
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 16:34:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5959.15540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRytX-0006Gi-7n; Mon, 12 Oct 2020 14:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5959.15540; Mon, 12 Oct 2020 14:33:47 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRytX-0006FD-4a; Mon, 12 Oct 2020 14:33:47 +0000
Received: by outflank-mailman (input) for mailman id 5959;
 Mon, 12 Oct 2020 14:33:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBf0=DT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kRytW-00068O-2J
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 14:33:46 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cba30a2-aa77-49d0-a7c5-2e98b334ad0f;
 Mon, 12 Oct 2020 14:33:24 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wBf0=DT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kRytW-00068O-2J
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 14:33:46 +0000
X-Inumbo-ID: 8cba30a2-aa77-49d0-a7c5-2e98b334ad0f
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8cba30a2-aa77-49d0-a7c5-2e98b334ad0f;
	Mon, 12 Oct 2020 14:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602513204;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yRny3O4/YPHHOTKW9ErMqTxVvo4tLH5gJNhcPjhT/yc=;
  b=Y2AQ0qCUnidteQmMzg0E1AIeDrwUiDYU0VbrakYxq7d65zIrDMF9f98o
   MoaBkwbPiu8S4ZXc2A2of0vHy7aYgn/5AUEAHKOCmLmM0XJ60+eNx+l53
   xxC8hyhnhvYPtelgx33fPvzJPYXDJooC2LQpqzBLumIk0XJy4AbZKecNz
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: MOtvIfuyBNYAxa0IYnZRnVL3H9oufYuXyT48u5q6voZiUb3r5S4Wu3c9FlRsjKlVBNtmtQM04T
 tXv1YLAAAa3TRzvDYXq2Ml/ovpquW72u0T/XoRN/xrEXO8gvyeeb8+p9PAq2NWu3z7ijeqKT5Q
 sQQBhD0yVGNjwAJ+yb55GucdcC35Sr6HWTEGheY9TN47hYY9CB113XGXuU5WajvuelCH4tEDfp
 Yv+CY2D40Z8K4q4eeLbtWg63BSRMxCcCSv5stEVPPAAfvVr8hLWIk1OJuDvWZ1+WFe4rCsLoOS
 8cc=
X-SBRS: 2.5
X-MesageID: 29838148
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,366,1596513600"; 
   d="scan'208";a="29838148"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/ucode/intel: Improve description for gathering the microcode revision
Date: Mon, 12 Oct 2020 15:25:23 +0100
Message-ID: <20201012142523.17652-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Obtaining the microcode revision on Intel CPUs is complicated for backwards
compatibility reasons.  Update apply_microcode() to use a slightly more
efficient CPUID invocation, now that the documentation has been updated to
confirm that any CPUID instruction is fine, not just CPUID.1

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/microcode/intel.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index d9bb1bc10e..72c07fcd1d 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -126,13 +126,16 @@ static void collect_cpu_info(void)
     rdmsrl(MSR_IA32_PLATFORM_ID, msr_content);
     csig->pf = 1 << ((msr_content >> 50) & 7);
 
-    wrmsrl(MSR_IA32_UCODE_REV, 0x0ULL);
-    /* As documented in the SDM: Do a CPUID 1 here */
+    /*
+     * Obtaining the microcode version involves writing 0 to the "read only"
+     * UCODE_REV MSR, executing any CPUID instruction, after which a nonzero
+     * revision should appear.
+     */
+    wrmsrl(MSR_IA32_UCODE_REV, 0);
     csig->sig = cpuid_eax(1);
-
-    /* get the current revision from MSR 0x8B */
     rdmsrl(MSR_IA32_UCODE_REV, msr_content);
-    csig->rev = (uint32_t)(msr_content >> 32);
+    csig->rev = msr_content >> 32;
+
     pr_debug("microcode: collect_cpu_info : sig=%#x, pf=%#x, rev=%#x\n",
              csig->sig, csig->pf, csig->rev);
 }
@@ -270,14 +273,15 @@ static int apply_microcode(const struct microcode_patch *patch)
 
     wbinvd();
 
-    /* write microcode via MSR 0x79 */
     wrmsrl(MSR_IA32_UCODE_WRITE, (unsigned long)patch->data);
-    wrmsrl(MSR_IA32_UCODE_REV, 0x0ULL);
 
-    /* As documented in the SDM: Do a CPUID 1 here */
-    cpuid_eax(1);
-
-    /* get the current revision from MSR 0x8B */
+    /*
+     * Obtaining the microcode version involves writing 0 to the "read only"
+     * UCODE_REV MSR, executing any CPUID instruction, after which a nonzero
+     * revision should appear.
+     */
+    wrmsrl(MSR_IA32_UCODE_REV, 0);
+    cpuid_eax(0);
     rdmsrl(MSR_IA32_UCODE_REV, msr_content);
     sig->rev = rev = msr_content >> 32;
 
-- 
2.11.0


