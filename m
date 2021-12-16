Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A707F476E5D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 10:55:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247800.427364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnTP-0006Uk-JG; Thu, 16 Dec 2021 09:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247800.427364; Thu, 16 Dec 2021 09:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxnTP-0006ML-3J; Thu, 16 Dec 2021 09:54:51 +0000
Received: by outflank-mailman (input) for mailman id 247800;
 Thu, 16 Dec 2021 09:54:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCpR=RB=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mxnTL-0004jJ-Pb
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 09:54:47 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32a17c47-5e56-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 10:54:45 +0100 (CET)
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
X-Inumbo-ID: 32a17c47-5e56-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639648485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bFNQanPdXABbQVU+6GCRr2U4dROyJOhmm2L/RcJtAp0=;
  b=Muc/dkvAcrTooGORKPmYEeFtjm+pbrIVUZQ/0vFF4pAVylnAsMIephU0
   lybFZH2XBjsD5omhX+vyggYWg+/+UJWUPc0zyxCQ9Pu/gU8MbLKabLaj3
   QNtIHxiC3KZsQSAXmxLeMptxAnqPlYjhhceO2rQVMYkLmbTKy0wHDGazC
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Vc2006kljhkzR6RljOr7vQ0+5e5qjt133yt9idvu0E8fqdSEFWKeklfakbl6z+nhDOfxFgl4Xh
 ntyDbeuCnpOwttQULoLbtqFWs9QmF7ZBeLpzmfmSIyrt//BYz3RxJwZdCgym0S2BWipE8MdTrh
 f6rs6Ael0K1Yu5o/NwXX+bnxx0Pd1P40MQxQgLCzmH5C5TOZOlDNP1XAK3XRlH6/YCLI9UtvkD
 9leoRgsWeOs70IdENbqqdNWjmh0pN1UaUw4fzjAeZ7uOmIvFpUCNwEq7TE6THhP39fhf0zBhSo
 HKv3J1Q0ETTC/M4fqKxvgnlD
X-SBRS: 5.1
X-MesageID: 62240013
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HANQWaOlgn0i+rrvrR1okMFynXyQoLVcMsEvi/4bfWQNrUp012QAy
 TEfUD+DOqqCZGemf49xPozl9UoPsZGEnNBrGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400s9w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozKD3NdJ4
 osWj6KLcD1uG67Qp98laSANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgm1q2pgWRK22i
 8wxTBZkXhqDSB52Cw0pFZgzwsT4gnnebGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaDtF0bY/AOSNcE0zi3jY/X/zmiPlI9G2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslNOZJhKTysDA3CMqsyq7DFDFtW
 1BexKCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sBvWAlexc0aJ5fEdMMX
 KM1kVkLjHO0FCH1BZKbnqrrU5h6pUQePYqNug/ogipmPcEqKV7vENBGbk+MxWH9+HXAYolkU
 ap3hf2EVC5AYYw+lWLeb75EjdcDm3BvrUuOFMuT50n2jtKjiIu9FO5t3K2mNbtisstpYWz9r
 r5iCid940kFDbClPHCIqdV7wJJjBSFTOK0aYvd/LoarSjeK0kl7YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:ijdemKyemQREHMg1p0nYKrPwFr1zdoMgy1knxilNoRw8SK2lfq
 eV7YwmPH7P+U8ssR4b6LO90cW7Lk80sKQFhbX5Xo3SOjUO2lHYTr2KhLGKq1aLdkHDH6xmpM
 BdmsBFeabN5DNB7foSjjPXLz9Z+qjjzJyV
X-IronPort-AV: E=Sophos;i="5.88,211,1635220800"; 
   d="scan'208";a="62240013"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/6] x86/prot-key: Split PKRU infrastructure out of asm/processor.h
Date: Thu, 16 Dec 2021 09:54:17 +0000
Message-ID: <20211216095421.12871-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211216095421.12871-1-andrew.cooper3@citrix.com>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
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
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/processor.h | 38 ------------------------------
 xen/arch/x86/include/asm/prot-key.h  | 45 ++++++++++++++++++++++++++++++++++++
 xen/arch/x86/mm/guest_walk.c         |  9 +++++---
 xen/arch/x86/x86_emulate.c           |  2 ++
 4 files changed, 53 insertions(+), 41 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/prot-key.h

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 400b4fac5ed4..eb1687d0795c 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -367,44 +367,6 @@ static always_inline void set_in_cr4 (unsigned long mask)
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
index 000000000000..084b248d81a5
--- /dev/null
+++ b/xen/arch/x86/include/asm/prot-key.h
@@ -0,0 +1,45 @@
+/******************************************************************************
+ * arch/x86/include/asm/spec_ctrl.h
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ *
+ * Copyright (c) 2021 Citrix Systems Ltd.
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
+    asm volatile ( ".byte 0x0f, 0x01, 0xef"
+                   :: "a" (pkru), "d" (0), "c" (0) );
+}
+
+#endif /* ASM_PROT_KEY_H */
diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
index b9f607272c39..dc8fdde0212e 100644
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
+        unsigned int pk_ar = pkr >> (pkey * PKEY_WIDTH);
 
-        if ( read_pkru_ad(pkru, pkey) ||
-             ((walk & PFEC_write_access) && read_pkru_wd(pkru, pkey) &&
+        if ( (pk_ar & PKEY_AD) ||
+             ((walk & PFEC_write_access) && (pk_ar & PKEY_WD) &&
               ((walk & PFEC_user_mode) || guest_wp_enabled(v))) )
         {
             gw->pfec |= PFEC_prot_key;
diff --git a/xen/arch/x86/x86_emulate.c b/xen/arch/x86/x86_emulate.c
index 1e082e6f3b2d..551ad0f7b303 100644
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


