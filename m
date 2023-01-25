Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E97267B765
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 17:54:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484470.751061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKj1W-00070D-Cg; Wed, 25 Jan 2023 16:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484470.751061; Wed, 25 Jan 2023 16:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKj1W-0006xg-9J; Wed, 25 Jan 2023 16:53:22 +0000
Received: by outflank-mailman (input) for mailman id 484470;
 Wed, 25 Jan 2023 16:53:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r4Sd=5W=citrix.com=prvs=382279126=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pKj1V-0006xH-Cb
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 16:53:21 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c35bb39a-9cd0-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 17:53:18 +0100 (CET)
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
X-Inumbo-ID: c35bb39a-9cd0-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674665598;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gmxuRRCOV7eQL3vdZh232abFBbe3fD6d91KmgOc1EpE=;
  b=ItoCwm8DE2tArZe8+JhVGSZUtA82R8e46qjKpqFh6qDw7LFanKzFvOqu
   JwNglL7qzeeYtPvLJHYU3uydaXH7pJq39MVHZF2pOpJlXu2YzkHG3eUsY
   D7U+YvRh9TN3sr+ruUrU19N9GVmaURGRhBL1rz6faOZPTO4kh2GOTmORQ
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93128235
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:YmWy5aowUbCIEmYbVDQ8q1uDj7BeBmIDZRIvgKrLsJaIsI4StFCzt
 garIBnVP/zeazCgf9B2aN6+90NU6sXWxtI1HABvqSkyRi4Q+JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weHzSRNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGEmNjTZiL6U+e6+RfddhOYOLtLiN4xK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jOdpj6pWEpHXDCZ4QWOqEKLlMiXpB3cZLkxN6zk06RIjHTGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvBGT1qmK2YTzSa7Lj8kN+pEXFLdylYP3ZCFFZbpYC5++nfky4jUP4yO/aR1NKpOwisx
 j+UnSocqrcIhMUEgvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAs68ecd/xok2p+
 SFdxpPAtLxm4YSlznTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 K3741s5CHx7ZiHCgUpLj2WZVawXIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8jHLJbxVy1DUfo3pNZTewv6+eZ7rh3SOEuJHcyrp/hZ+eT2iIGppUctbwLVM7FRAFKsqwTJ6
 ddPX/ZmOD0GONASlhL/qNZJRXhTdChTOHwDg5APHgJ1ClY8ST5J5j646e9JRrGJaIwOyLqYr
 yrjAR4wJZiWrSSvFDhmo0tLMNvHNauTZ1piVcDwFT5EA0QeXLs=
IronPort-HdrOrdr: A9a23:vlfuX66hT3sKcWfRAgPXwOPXdLJyesId70hD6qkRc20xTiX8ra
 rCoB1173PJYVoqN03I4OrwQZVoIkmsl6Kdg7NwAV7KZmCPhILPFu9fBODZsl7d8kPFl9K14p
 0QF5SWWOeaMbGjt7eA3OBjKadH/DBbytHOuQ4D9QYUcei1UdAb0ztE
X-IronPort-AV: E=Sophos;i="5.97,245,1669093200"; 
   d="scan'208";a="93128235"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Subject: [PATCH] x86/shadow: Fix PV32 shadowing in !HVM builds
Date: Wed, 25 Jan 2023 16:53:08 +0000
Message-ID: <20230125165308.22897-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The OSSTest bisector identified an issue with c/s 1894049fa283 ("x86/shadow:
L2H shadow type is PV32-only") in !HVM builds.

The bug is ultimately caused by sh_type_to_size[] not actually being specific
to HVM guests, and it's position in shadow/hvm.c mislead the reasoning.

To fix the issue that OSSTest identified, SH_type_l2h_64_shadow must still
have the value 1 in any CONFIG_PV32 build.  But simply adjusting this leaves
us with misleading logic, and a reasonable chance of making a related error
again in the future.

In hindsight, moving sh_type_to_size[] out of common.c in the first place a
mistake.  Therefore, move sh_type_to_size[] back to living in common.c,
leaving a comment explaining why it happens to be inside an HVM conditional.

This effectively reverts the second half of 4fec945409fc ("x86/shadow: adjust
and move sh_type_to_size[]") while retaining the other improvements from the
same changeset.

While making this change, also adjust the sh_type_to_size[] declaration to
match its definition.

Fixes: 4fec945409fc ("x86/shadow: adjust and move sh_type_to_size[]")
Fixes: 1894049fa283 ("x86/shadow: L2H shadow type is PV32-only")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: George Dunlap <george.dunlap@eu.citrix.com>
CC: Tim Deegan <tim@xen.org>

I was unsure whether it was reasonable to move the table back into its old
position but it can live pretty much anywhere in common.c as far as I'm
concerned.
---
 xen/arch/x86/mm/shadow/common.c  | 38 ++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/mm/shadow/hvm.c     | 31 -------------------------------
 xen/arch/x86/mm/shadow/private.h |  2 +-
 3 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 26901b8b3bcf..a74b15e3e75b 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -39,6 +39,44 @@
 #include <public/sched.h>
 #include "private.h"
 
+/*
+ * This table shows the allocation behaviour of the different modes:
+ *
+ * Xen paging      64b  64b  64b
+ * Guest paging    32b  pae  64b
+ * PV or HVM       HVM  HVM   *
+ * Shadow paging   pae  pae  64b
+ *
+ * sl1 size         8k   4k   4k
+ * sl2 size        16k   4k   4k
+ * sl3 size         -    -    4k
+ * sl4 size         -    -    4k
+ *
+ * Note: our accessor, shadow_size(), can optimise out this table in PV-only
+ * builds.
+ */
+#ifdef CONFIG_HVM
+const uint8_t sh_type_to_size[] = {
+    [SH_type_l1_32_shadow]   = 2,
+    [SH_type_fl1_32_shadow]  = 2,
+    [SH_type_l2_32_shadow]   = 4,
+    [SH_type_l1_pae_shadow]  = 1,
+    [SH_type_fl1_pae_shadow] = 1,
+    [SH_type_l2_pae_shadow]  = 1,
+    [SH_type_l1_64_shadow]   = 1,
+    [SH_type_fl1_64_shadow]  = 1,
+    [SH_type_l2_64_shadow]   = 1,
+#ifdef CONFIG_PV32
+    [SH_type_l2h_64_shadow]  = 1,
+#endif
+    [SH_type_l3_64_shadow]   = 1,
+    [SH_type_l4_64_shadow]   = 1,
+    [SH_type_p2m_table]      = 1,
+    [SH_type_monitor_table]  = 1,
+    [SH_type_oos_snapshot]   = 1,
+};
+#endif /* CONFIG_HVM */
+
 DEFINE_PER_CPU(uint32_t,trace_shadow_path_flags);
 
 static int cf_check sh_enable_log_dirty(struct domain *, bool log_global);
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index 918865cf1b6a..88c3c16322f2 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -33,37 +33,6 @@
 
 #include "private.h"
 
-/*
- * This table shows the allocation behaviour of the different modes:
- *
- * Xen paging      64b  64b  64b
- * Guest paging    32b  pae  64b
- * PV or HVM       HVM  HVM   *
- * Shadow paging   pae  pae  64b
- *
- * sl1 size         8k   4k   4k
- * sl2 size        16k   4k   4k
- * sl3 size         -    -    4k
- * sl4 size         -    -    4k
- */
-const uint8_t sh_type_to_size[] = {
-    [SH_type_l1_32_shadow]   = 2,
-    [SH_type_fl1_32_shadow]  = 2,
-    [SH_type_l2_32_shadow]   = 4,
-    [SH_type_l1_pae_shadow]  = 1,
-    [SH_type_fl1_pae_shadow] = 1,
-    [SH_type_l2_pae_shadow]  = 1,
-    [SH_type_l1_64_shadow]   = 1,
-    [SH_type_fl1_64_shadow]  = 1,
-    [SH_type_l2_64_shadow]   = 1,
-/*  [SH_type_l2h_64_shadow]  = 1,  PV32-only */
-    [SH_type_l3_64_shadow]   = 1,
-    [SH_type_l4_64_shadow]   = 1,
-    [SH_type_p2m_table]      = 1,
-    [SH_type_monitor_table]  = 1,
-    [SH_type_oos_snapshot]   = 1,
-};
-
 /**************************************************************************/
 /* x86 emulator support for the shadow code
  */
diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index 7d6c846c8037..79d82364fc92 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -362,7 +362,7 @@ static inline int mfn_oos_may_write(mfn_t gmfn)
 #endif /* (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC) */
 
 /* Figure out the size (in pages) of a given shadow type */
-extern const u8 sh_type_to_size[SH_type_unused];
+extern const uint8_t sh_type_to_size[SH_type_unused];
 static inline unsigned int
 shadow_size(unsigned int shadow_type)
 {
-- 
2.11.0


