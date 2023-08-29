Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC7778C8E0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 17:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592373.925079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb0vT-0002fL-NH; Tue, 29 Aug 2023 15:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592373.925079; Tue, 29 Aug 2023 15:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb0vT-0002d8-Kb; Tue, 29 Aug 2023 15:46:43 +0000
Received: by outflank-mailman (input) for mailman id 592373;
 Tue, 29 Aug 2023 15:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wiqx=EO=citrix.com=prvs=598c0cf4a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qb0vR-0002d2-RZ
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 15:46:42 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c290e3b-4683-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 17:46:37 +0200 (CEST)
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
X-Inumbo-ID: 3c290e3b-4683-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693323997;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s7GwTyO/9WdNRknq28nCi92pDJQEGh2N6CpidOM6ibI=;
  b=czRmK45uPRs+N/c7TEfgJAdaVu7/nqdvfTqnrnfi//ksxMl4bhHR+JDL
   bnNk7J31/5queUulqrAdG/ycdaJWdnZeqiDqUvOt8BliellhS3aVyfiXx
   BAkg/xwMzrqLMFvGfpRV/bvEKYoFBJs088pzMjwPxdmT8D97t6a16lPGL
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 123702909
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:2r7Eras2A6sZaIeTNSE8Xi64g+fnVEdeMUV32f8akzHdYApBsoF/q
 tZmKTrVbvffYDTzcthyPYm08kwCsJWDyodhG1A+qHoyEi8b+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A+ExiFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwODYzfguYu9uK4vGgY/Y2o5h/BtbpFdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zidoDyjU0lLXDCZ4RCd/V6Owf/gpyHECaINBrST8qNRimTGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZRsD3cn4u70KsjCMVf98Sovp0vfqGxill
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3Hb5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8AhkkdC+F0e5eI1cFh
 XM/XisIv/du0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3Ox/LhTyyzxFzyv1nU
 Xt+TSpLJSxGYZmLMRLsH7tNuVPV7n1WKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vdyDg5B
 +13bpPQoz0GCb2WX8Ui2dJLRbz8BSRhVM+eRg0+XrLrHzeK70l6UKGNn+5wI9E790mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMBiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:LBC+hKBcB/RXlGTlHemX55DYdb4zR+YMi2TDtnoBKyC9F/byqy
 nAppkmPHPP5Ar5IUtQ/+xoW5PwIk80l6QV3WB5B97LNjUO3lHGEGgI1+vfKlPbdREWudQtsZ
 uIN5IOceEZMDBB/KPHCCvRKadG/OW6
X-Talos-CUID: 9a23:EaW422OoA0FQzO5DSC9Z5FUPJvkZUD7G5WiKBhPkI3lrYejA
X-Talos-MUID: =?us-ascii?q?9a23=3Ax4Jyug2FUnx7a8OtZc+zZop5uDUjybyhJGJKgbo?=
 =?us-ascii?q?8ufbVFTNiMhyZ0Q+9e9py?=
X-IronPort-AV: E=Sophos;i="6.02,210,1688443200"; 
   d="scan'208";a="123702909"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/APIC: Remove esr_disable
Date: Tue, 29 Aug 2023 16:46:21 +0100
Message-ID: <20230829154621.3565971-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It is unconditionally 0 in Xen, and was deleted in Linux somewhere between 2.5
and 2.6.

Remove it in Xen too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I got bored waiting for `git log` to tell where it was disabled in Linux...
---
 xen/arch/x86/apic.c                           | 50 ++++++-------------
 .../x86/include/asm/mach-generic/mach_apic.h  |  3 --
 2 files changed, 16 insertions(+), 37 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 41879230ec90..5c6935ba42db 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -496,14 +496,6 @@ void setup_local_APIC(bool bsp)
     unsigned long oldvalue, value, maxlvt;
     int i, j;
 
-    /* Pound the ESR really hard over the head with a big hammer - mbligh */
-    if (esr_disable) {
-        apic_write(APIC_ESR, 0);
-        apic_write(APIC_ESR, 0);
-        apic_write(APIC_ESR, 0);
-        apic_write(APIC_ESR, 0);
-    }
-
     BUILD_BUG_ON((SPURIOUS_APIC_VECTOR & 0x0f) != 0x0f);
 
     /*
@@ -628,33 +620,23 @@ void setup_local_APIC(bool bsp)
         value = APIC_DM_NMI | APIC_LVT_MASKED;
     apic_write(APIC_LVT1, value);
 
-    if (!esr_disable) {
-        maxlvt = get_maxlvt();
-        if (maxlvt > 3)     /* Due to the Pentium erratum 3AP. */
-            apic_write(APIC_ESR, 0);
-        oldvalue = apic_read(APIC_ESR);
+    maxlvt = get_maxlvt();
+    if (maxlvt > 3)     /* Due to the Pentium erratum 3AP. */
+        apic_write(APIC_ESR, 0);
+    oldvalue = apic_read(APIC_ESR);
 
-        value = ERROR_APIC_VECTOR;      // enables sending errors
-        apic_write(APIC_LVTERR, value);
-        /*
-         * spec says clear errors after enabling vector.
-         */
-        if (maxlvt > 3)
-            apic_write(APIC_ESR, 0);
-        value = apic_read(APIC_ESR);
-        if (value != oldvalue)
-            apic_printk(APIC_VERBOSE, "ESR value before enabling "
-                        "vector: %#lx  after: %#lx\n",
-                        oldvalue, value);
-    } else {
-        /*
-         * Something untraceble is creating bad interrupts on
-         * secondary quads ... for the moment, just leave the
-         * ESR disabled - we can't do anything useful with the
-         * errors anyway - mbligh
-         */
-        printk("Leaving ESR disabled.\n");
-    }
+    value = ERROR_APIC_VECTOR;      // enables sending errors
+    apic_write(APIC_LVTERR, value);
+    /*
+     * spec says clear errors after enabling vector.
+     */
+    if (maxlvt > 3)
+        apic_write(APIC_ESR, 0);
+    value = apic_read(APIC_ESR);
+    if (value != oldvalue)
+        apic_printk(APIC_VERBOSE,
+                    "ESR value before enabling vector: %#lx  after: %#lx\n",
+                    oldvalue, value);
 
     if (nmi_watchdog == NMI_LOCAL_APIC && !bsp)
         setup_apic_nmi_watchdog();
diff --git a/xen/arch/x86/include/asm/mach-generic/mach_apic.h b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
index b6f6361c6046..cf8b31b6e09e 100644
--- a/xen/arch/x86/include/asm/mach-generic/mach_apic.h
+++ b/xen/arch/x86/include/asm/mach-generic/mach_apic.h
@@ -6,9 +6,6 @@
 #include <asm/genapic.h>
 #include <asm/smp.h>
 
-/* ESR was originally disabled in Linux for NUMA-Q. Do we really need to? */
-#define esr_disable (0)
-
 /* The following are dependent on APIC delivery mode (logical vs. physical). */
 #define INT_DELIVERY_MODE (genapic.int_delivery_mode)
 #define INT_DEST_MODE (genapic.int_dest_mode)

base-commit: 067f18c3a72d8f0acccab831083b8518f0832d81
-- 
2.30.2


