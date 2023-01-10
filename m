Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B392664741
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 18:19:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474879.736331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH6-0004do-6E; Tue, 10 Jan 2023 17:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474879.736331; Tue, 10 Jan 2023 17:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH5-0004ZF-Uq; Tue, 10 Jan 2023 17:18:59 +0000
Received: by outflank-mailman (input) for mailman id 474879;
 Tue, 10 Jan 2023 17:18:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQxz=5H=citrix.com=prvs=367c7493a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFIH4-0003S0-QI
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 17:18:58 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcb2fe24-910a-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 18:18:56 +0100 (CET)
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
X-Inumbo-ID: dcb2fe24-910a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673371135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4kWQkYSpiZBIu90gQLV1EYaENe8mysfk1fvV+p0jEtY=;
  b=Yy5cNSMLA2BR3bxYAt0zSwq51NKtyLIYeE98unOEo508TO38foAnpOGp
   tOIk6YKcKalQe75FEFbDOhDrp+Cb3/NyztHQN0AW2xSlTGIFBBpxSr4T6
   0kpwFEHhYjiCtEpvh2H1l8XKsmfQ6miYMpHX6aGZ4KCcO2D4wxnGnVRy9
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90908186
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9XpW9q/pwj6N3yVagW41DrUDk36TJUtcMsCJ2f8bNWPcYEJGY0x3n
 DRLCzuFbK2IZjH9eIoiO9nk8E5TsJLTyYM1GQI6+3g8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AdmPKkT5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklx/
 t0ZL2ASSCyIxKG0/o+cUbcvg+kKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZQNzx7I/
 zKYl4j/Kg4aKMSwwheMyVSPts3erR/yfoItPrLto5aGh3XMnzdOWXX6T2CTvv2RmkO4HdVFJ
 CQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooL2yQuEAmkPThZadccr8sQxQFQXO
 kShxo2zQ2Y16fvMFCzbpuz8QS6O1TY9EmQjZChUUi056Jqgor8OqQmRDdNOOfvg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yT4FWyzyGskTKuMDirjUWGBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YuL1XXrXkxOBPJhQgBdXTAd4llY
 f93lu71Ux4n5VlPlmLqF4/xL5d3rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRtcu5TPHu2
 48HbaOikkwPONASlwGLqeb/23hWdylkbX03wuQLHtO+zv1OQz19Wq6AnO5/IOSIXc19z4/1w
 510YWcAoHKXuJENAV7ihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:dyl0+a9aSWYSd8IC7FZuk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.96,315,1665460800"; 
   d="scan'208";a="90908186"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/8] x86/prot-key: Split PKRU infrastructure out of asm/processor.h
Date: Tue, 10 Jan 2023 17:18:40 +0000
Message-ID: <20230110171845.20542-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230110171845.20542-1-andrew.cooper3@citrix.com>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

asm/processor.h is in desperate need of splitting up, and protection key
functionality in only used in the emulator and pagewalk.  Introduce a new
asm/prot-key.h and move the relevant content over.

Rename the PKRU_* constants to drop the user part and to use the architectural
terminology.

Drop the read_pkru_{ad,wd}() helpers entirely.  The pkru infix is about to
become wrong, and the sole user is shorter and easier to follow without the
helpers.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Mask pk_ar
---
 xen/arch/x86/cpu/common.c            |  1 +
 xen/arch/x86/include/asm/processor.h | 38 ------------------------------------
 xen/arch/x86/include/asm/prot-key.h  | 31 +++++++++++++++++++++++++++++
 xen/arch/x86/mm/guest_walk.c         |  9 ++++++---
 xen/arch/x86/x86_emulate.c           |  2 ++
 5 files changed, 40 insertions(+), 41 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/prot-key.h

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index fe92f29c2dc6..2bcdd08b2fb5 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -11,6 +11,7 @@
 #include <asm/io.h>
 #include <asm/mpspec.h>
 #include <asm/apic.h>
+#include <asm/prot-key.h>
 #include <asm/random.h>
 #include <asm/setup.h>
 #include <asm/shstk.h>
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 60b902060914..b95d2483212a 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -374,44 +374,6 @@ static always_inline void set_in_cr4 (unsigned long mask)
     write_cr4(read_cr4() | mask);
 }
 
-static inline unsigned int rdpkru(void)
-{
-    unsigned int pkru;
-
-    asm volatile (".byte 0x0f,0x01,0xee"
-        : "=a" (pkru) : "c" (0) : "dx");
-
-    return pkru;
-}
-
-static inline void wrpkru(unsigned int pkru)
-{
-    asm volatile ( ".byte 0x0f, 0x01, 0xef"
-                   :: "a" (pkru), "d" (0), "c" (0) );
-}
-
-/* Macros for PKRU domain */
-#define PKRU_READ  (0)
-#define PKRU_WRITE (1)
-#define PKRU_ATTRS (2)
-
-/*
- * PKRU defines 32 bits, there are 16 domains and 2 attribute bits per
- * domain in pkru, pkeys is index to a defined domain, so the value of
- * pte_pkeys * PKRU_ATTRS + R/W is offset of a defined domain attribute.
- */
-static inline bool_t read_pkru_ad(uint32_t pkru, unsigned int pkey)
-{
-    ASSERT(pkey < 16);
-    return (pkru >> (pkey * PKRU_ATTRS + PKRU_READ)) & 1;
-}
-
-static inline bool_t read_pkru_wd(uint32_t pkru, unsigned int pkey)
-{
-    ASSERT(pkey < 16);
-    return (pkru >> (pkey * PKRU_ATTRS + PKRU_WRITE)) & 1;
-}
-
 static always_inline void __monitor(const void *eax, unsigned long ecx,
                                     unsigned long edx)
 {
diff --git a/xen/arch/x86/include/asm/prot-key.h b/xen/arch/x86/include/asm/prot-key.h
new file mode 100644
index 000000000000..63a2e22f3fa0
--- /dev/null
+++ b/xen/arch/x86/include/asm/prot-key.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021-2022 Citrix Systems Ltd.
+ */
+#ifndef ASM_PROT_KEY_H
+#define ASM_PROT_KEY_H
+
+#include <xen/types.h>
+
+#define PKEY_AD 1 /* Access Disable */
+#define PKEY_WD 2 /* Write Disable */
+
+#define PKEY_WIDTH 2 /* Two bits per protection key */
+
+static inline uint32_t rdpkru(void)
+{
+    uint32_t pkru;
+
+    asm volatile ( ".byte 0x0f,0x01,0xee"
+                   : "=a" (pkru) : "c" (0) : "dx" );
+
+    return pkru;
+}
+
+static inline void wrpkru(uint32_t pkru)
+{
+    asm volatile ( ".byte 0x0f,0x01,0xef"
+                   :: "a" (pkru), "d" (0), "c" (0) );
+}
+
+#endif /* ASM_PROT_KEY_H */
diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
index 70dacc477f9a..161a61b8f5ca 100644
--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -26,7 +26,9 @@
 #include <xen/paging.h>
 #include <xen/domain_page.h>
 #include <xen/sched.h>
+
 #include <asm/page.h>
+#include <asm/prot-key.h>
 #include <asm/guest_pt.h>
 #include <asm/hvm/emulate.h>
 
@@ -413,10 +415,11 @@ guest_walk_tables(const struct vcpu *v, struct p2m_domain *p2m,
          guest_pku_enabled(v) )
     {
         unsigned int pkey = guest_l1e_get_pkey(gw->l1e);
-        unsigned int pkru = rdpkru();
+        unsigned int pkr = rdpkru();
+        unsigned int pk_ar = (pkr >> (pkey * PKEY_WIDTH)) & (PKEY_AD | PKEY_WD);
 
-        if ( read_pkru_ad(pkru, pkey) ||
-             ((walk & PFEC_write_access) && read_pkru_wd(pkru, pkey) &&
+        if ( (pk_ar & PKEY_AD) ||
+             ((walk & PFEC_write_access) && (pk_ar & PKEY_WD) &&
               ((walk & PFEC_user_mode) || guest_wp_enabled(v))) )
         {
             gw->pfec |= PFEC_prot_key;
diff --git a/xen/arch/x86/x86_emulate.c b/xen/arch/x86/x86_emulate.c
index 720740f29b84..8c7d18521807 100644
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -12,8 +12,10 @@
 #include <xen/domain_page.h>
 #include <xen/err.h>
 #include <xen/event.h>
+
 #include <asm/x86_emulate.h>
 #include <asm/processor.h> /* current_cpu_info */
+#include <asm/prot-key.h>
 #include <asm/xstate.h>
 #include <asm/amd.h> /* cpu_has_amd_erratum() */
 #include <asm/debugreg.h>
-- 
2.11.0


