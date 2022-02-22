Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F9A4BFCC0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:35:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276946.473351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXCL-0007sW-07; Tue, 22 Feb 2022 15:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276946.473351; Tue, 22 Feb 2022 15:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXCK-0007pF-RK; Tue, 22 Feb 2022 15:35:28 +0000
Received: by outflank-mailman (input) for mailman id 276946;
 Tue, 22 Feb 2022 15:35:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMXCJ-0005NI-QX
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:35:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d5b2200-93f5-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 16:35:26 +0100 (CET)
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
X-Inumbo-ID: 0d5b2200-93f5-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645544126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K/NDm/pt+CvfTKAUMdQObuq7L64t6cohDruqfCnhYqk=;
  b=BnTfPCzuulveZJSPCwGsvMXbJZepdwyvS2JyUyhpyYtWfB+RoyyZBgwr
   2d766Tn44KbAN90pL52HS2cTWQStzdKb6ouI+yLFOhBmwd3pH35Ufym4X
   DSPQ3jQBHHyxcW8xx5CZm3tUw0iJfqep9V20LQNw75F67d8hsDjjNvLJ9
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64171036
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tQDIy6Jksh0CuJv8FE+R1JUlxSXFcZb7ZxGr2PjKsXjdYENS02EGm
 2BJWz2GPKqCYzT0ft4lPYjipEgG78Xcx4RnGgdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2NQy2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ntn5Y6LRzcyBPXJtLQlDBlYPwAhHrITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6qHO
 JNBMmQHgBLoby9QOVsVCK4EkuKFvyPTQWRptgmXnP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJeOb0o0w+90ZCM5irJPjcEThJgN/854ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud04WtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HwgbQ4xawZRGp8crVnl
 CJf8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBo1bJdZJGW1O
 Re7VeZtCHl7ZiDCgUhfOd/ZNijX5fK4SYSNug78NLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOHePqtdLdQhQRZX5bLivw/Fqmie4ClIOMAkc5zX5mtvNp6QNc3xpq9r1
IronPort-HdrOrdr: A9a23:Ubefqq2e2YVVx/emzWUmfgqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="64171036"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 64/70] x86: Introduce helpers/checks for endbr64 instructions
Date: Tue, 22 Feb 2022 15:26:45 +0000
Message-ID: <20220222152645.8844-16-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220222152645.8844-1-andrew.cooper3@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... to prevent the optimiser creating unsafe code.  See the code comment for
full details.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v3:
 * Introduce ENDBR64_LEN
v2:
 * Fix include to let the header be standalone
 * Add earlyclobber to asm
v1.1:
 * New
---
 xen/arch/x86/include/asm/endbr.h | 55 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 xen/arch/x86/include/asm/endbr.h

diff --git a/xen/arch/x86/include/asm/endbr.h b/xen/arch/x86/include/asm/endbr.h
new file mode 100644
index 000000000000..6090afeb0bd8
--- /dev/null
+++ b/xen/arch/x86/include/asm/endbr.h
@@ -0,0 +1,55 @@
+/******************************************************************************
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
+ * Copyright (c) 2021-2022 Citrix Systems Ltd.
+ */
+#ifndef XEN_ASM_ENDBR_H
+#define XEN_ASM_ENDBR_H
+
+#include <xen/types.h>
+
+#define ENDBR64_LEN 4
+
+/*
+ * In some cases we need to inspect/insert endbr64 instructions.
+ *
+ * The naive way, mem{cmp,cpy}(ptr, "\xf3\x0f\x1e\xfa", 4), optimises unsafely
+ * by placing 0xfa1e0ff3 in an imm32 operand, and marks a legal indirect
+ * branch target as far as the CPU is concerned.
+ *
+ * gen_endbr64() is written deliberately to avoid the problematic operand, and
+ * marked __const__ as it is safe for the optimiser to hoist/merge/etc.
+ */
+static inline uint32_t __attribute_const__ gen_endbr64(void)
+{
+    uint32_t res;
+
+    asm ( "mov $~0xfa1e0ff3, %[res]\n\t"
+          "not %[res]\n\t"
+          : [res] "=&r" (res) );
+
+    return res;
+}
+
+static inline bool is_endbr64(const void *ptr)
+{
+    return *(const uint32_t *)ptr == gen_endbr64();
+}
+
+static inline void place_endbr64(void *ptr)
+{
+    *(uint32_t *)ptr = gen_endbr64();
+}
+
+#endif /* XEN_ASM_ENDBR_H */
-- 
2.11.0


