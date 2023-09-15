Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72AF7A2837
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 22:37:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603366.940385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYf-0002it-HU; Fri, 15 Sep 2023 20:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603366.940385; Fri, 15 Sep 2023 20:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYf-0002gI-CC; Fri, 15 Sep 2023 20:36:57 +0000
Received: by outflank-mailman (input) for mailman id 603366;
 Fri, 15 Sep 2023 20:36:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhFYd-0001T8-HR
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 20:36:55 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b631737-5407-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 22:36:54 +0200 (CEST)
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
X-Inumbo-ID: 9b631737-5407-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694810214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jAUwGw9qgvfbuPk5IZDn61zHenZxiG3gXnf6zq3Dydg=;
  b=XnpfeYb0pBLG4djSGrtLdBsRMfoR+CbjHYo1Lci/pwnRvt+hHhjTmvh0
   Cl+SU4Hp720pGYr/fQRcDZ/9TcnXvF52OM0SxvbHIr4jUsbUGV9WzSkhx
   9+FDqOG2lymd/n611spdHrDL4dOMLNczfWmvZHPrHqYK01QfIXIE6MddO
   c=;
X-CSE-ConnectionGUID: kAevLBhUSueOHby+POGfdA==
X-CSE-MsgGUID: TaENPtaxQH6q7WhAYBBy2w==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125539000
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:WfFxs62hjKg3R0OLivbD5eVxkn2cJEfYwER7XKvMYLTBsI5bp2FTz
 GIbXWnSM/uPZmXwKdggboqy9RkC65bQxtcxSgM5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8nuDgNyo4GlD5g1nOKgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfAkhD6
 9gyKA02cx2kp+ing4qcZedgr5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ8Iwx3J/
 jqel4j/Ki0TGfqn1TOVy1Lyn7DwnQrKcqgDTqLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQC1
 F6PmNOvBjVpv/uWU1qS876VqXW5Pi19EIMZTXZaF01fuYCl+dxtyEuVFb6PDZJZkPX2MDzu5
 xqKkRMjipIzh99I74KU81zu1mfESofyciY54QDeX2SA5wx/ZZK4a4HA1WU3/cqsP67CEADf4
 SFsd9y2qblXUMrTzHDlrPAlRunB2hqTDNHLbbeD9bEF/i/lxXOsdJs4DNpWdBYwaZZsldMEj
 SbuVeJtCH17ZivCgUxfOdjZ5yEWIU/ITI6NaxwsRoASCqWdjSfelM2UWWae3nr2jG8nmrwlN
 JGQfK6EVChLVfQ/lmXmGrdAiNfHIxzSI0uJHfgXKDz9itKjiIO9E+9ZYDNikMhmhE97nOkl2
 4kGbJbbo/mueOb/fjPW4eYuwaMidBAG6WTNg5UPLIare1M2cFzN/teNmdvNjaQ5xfUK/goJl
 1nhMnJlJK3X3iSec13XOyE/MNsCn/9X9BoGAMDlBn7ws1BLXGplxPZ3m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:rTndOqoY0r8n8hd7Oxw/ltsaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rrCMc6QxhPk3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaXN5DNB7PoSjjPWLz9Z+qjkzJyV
X-Talos-CUID: =?us-ascii?q?9a23=3ATdXoOGg8zMcPl0/PyersI6OhkTJucVTQ0lP6I3K?=
 =?us-ascii?q?DFGtOaLeECme3161oup87?=
X-Talos-MUID: =?us-ascii?q?9a23=3An4V/Aw3JQkMivFJS+6cmfGSQVzUj362DLngRmIU?=
 =?us-ascii?q?/m5edahNwEga3piXtXdpy?=
X-IronPort-AV: E=Sophos;i="6.02,150,1688443200"; 
   d="scan'208";a="125539000"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>
Subject: [PATCH 5/7] x86: Introduce x86_merge_dr6()
Date: Fri, 15 Sep 2023 21:36:26 +0100
Message-ID: <20230915203628.837732-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915203628.837732-1-andrew.cooper3@citrix.com>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The current logic used to update %dr6 when injecting #DB is buggy.

The SDM/APM documention on %dr6 updates is far from ideal, but does at least
make clear that it's non-trivial.  The actual behaviour is to overwrite
B{0..3} and accumulate all other bits.

Introduce x86_merge_dr6() to perform the operaton properly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jinoh Kang <jinoh.kang.kr@gmail.com>

v2:
 * Extend commit message
---
 xen/arch/x86/debug.c                 | 20 ++++++++++++++++++++
 xen/arch/x86/include/asm/debugreg.h  |  7 +++++++
 xen/arch/x86/include/asm/x86-defns.h |  7 +++++++
 3 files changed, 34 insertions(+)

diff --git a/xen/arch/x86/debug.c b/xen/arch/x86/debug.c
index 127fe83021cd..bfcd83ea4d0b 100644
--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/debug.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2023 XenServer.
  */
 #include <xen/kernel.h>
+#include <xen/lib.h>
 
 #include <xen/lib/x86/cpu-policy.h>
 
@@ -28,6 +29,25 @@ unsigned int x86_adj_dr6_rsvd(const struct cpu_policy *p, unsigned int dr6)
     return dr6;
 }
 
+unsigned int x86_merge_dr6(const struct cpu_policy *p, unsigned int dr6,
+                           unsigned int new)
+{
+    /* Flip dr6 to have positive polarity. */
+    dr6 ^= X86_DR6_DEFAULT;
+
+    /* Sanity check that only known values are passed in. */
+    ASSERT(!(dr6 & ~X86_DR6_KNOWN_MASK));
+    ASSERT(!(new & ~X86_DR6_KNOWN_MASK));
+
+    /* Breakpoint matches are overridden.  All other bits accumulate. */
+    dr6 = (dr6 & ~X86_DR6_BP_MASK) | new;
+
+    /* Flip dr6 back to having default polarity. */
+    dr6 ^= X86_DR6_DEFAULT;
+
+    return x86_adj_dr6_rsvd(p, dr6);
+}
+
 unsigned int x86_adj_dr7_rsvd(const struct cpu_policy *p, unsigned int dr7)
 {
     unsigned int zeros = X86_DR7_ZEROS;
diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index 39ba312b84ee..e98a9ce977fa 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -89,4 +89,11 @@ struct cpu_policy;
 unsigned int x86_adj_dr6_rsvd(const struct cpu_policy *p, unsigned int dr6);
 unsigned int x86_adj_dr7_rsvd(const struct cpu_policy *p, unsigned int dr7);
 
+/*
+ * Merge new bits into dr6.  'new' is always given in positive polarity,
+ * matching the Intel VMCS PENDING_DBG semantics.
+ */
+unsigned int x86_merge_dr6(const struct cpu_policy *p, unsigned int dr6,
+                           unsigned int new);
+
 #endif /* _X86_DEBUGREG_H */
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 5838631ef634..edfecc89bd08 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -116,6 +116,13 @@
 #define X86_DR6_BT              (_AC(1, UL) << 15)   /* Task switch                 */
 #define X86_DR6_RTM             (_AC(1, UL) << 16)   /* #DB/#BP in RTM region (INV) */
 
+#define X86_DR6_BP_MASK                                 \
+    (X86_DR6_B0 | X86_DR6_B1 | X86_DR6_B2 | X86_DR6_B3)
+
+#define X86_DR6_KNOWN_MASK                                      \
+    (X86_DR6_BP_MASK | X86_DR6_BLD | X86_DR6_BD | X86_DR6_BS |  \
+     X86_DR6_BT | X86_DR6_RTM)
+
 #define X86_DR6_ZEROS           _AC(0x00001000, UL)  /* %dr6 bits forced to 0       */
 #define X86_DR6_DEFAULT         _AC(0xffff0ff0, UL)  /* Default %dr6 value          */
 
-- 
2.30.2


