Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 076161DC93A
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 11:05:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbh8O-0002J7-S3; Thu, 21 May 2020 09:05:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6/I=7D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jbh8N-0002J2-Uq
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 09:04:59 +0000
X-Inumbo-ID: 25005354-9b42-11ea-9887-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25005354-9b42-11ea-9887-bc764e2007e4;
 Thu, 21 May 2020 09:04:58 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ZxisDAJGiEEQi+wn7XLXo4t7iJDISE4CYylorTX8S37foyF5JiulHCVRVgMB4ZmwIqM+w2vYsl
 0jM6loOkmIbvYZFK/CpsQzUhCCAElw9TojHcuBLAcGhAUi50y08+zvCPzu4eF2WFlagt2DaUdv
 fjuTgBXnAUN+romk8ZsHS8vf/7sP7a5q9KHeWvN0Przo+0Cfe6yEc3hDo4+DFlKR33WkalJ7mL
 thw31QDtDcQuorTBVUHycblNk3FIxsB3WlpzlsZTWiVQc7UGtHA3JToHuL/VZTViGGbfSrx3Oa
 TBA=
X-SBRS: 2.7
X-MesageID: 18780728
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,417,1583211600"; d="scan'208";a="18780728"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/shadow: Reposition sh_remove_write_access_from_sl1p()
Date: Thu, 21 May 2020 10:04:28 +0100
Message-ID: <20200521090428.11425-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When compiling with SHOPT_OUT_OF_SYNC disabled, the build fails with:

  common.c:41:12: error: ‘sh_remove_write_access_from_sl1p’ declared ‘static’ but never defined [-Werror=unused-function]
   static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

due to an unguarded forward declaration.

It turns out there is no need to forward declare
sh_remove_write_access_from_sl1p() to begin with, so move it to just ahead of
its first users, which is within a larger #ifdef'd SHOPT_OUT_OF_SYNC block.

Fix up for style while moving it.  No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Tim Deegan <tim@xen.org>
---
 xen/arch/x86/mm/shadow/common.c | 56 ++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index 0ac3f880e1..6dff240e97 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -38,9 +38,6 @@
 #include <xen/numa.h>
 #include "private.h"
 
-static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
-                                            mfn_t smfn, unsigned long offset);
-
 DEFINE_PER_CPU(uint32_t,trace_shadow_path_flags);
 
 static int sh_enable_log_dirty(struct domain *, bool log_global);
@@ -252,6 +249,31 @@ static inline void _sh_resync_l1(struct vcpu *v, mfn_t gmfn, mfn_t snpmfn)
         SHADOW_INTERNAL_NAME(sh_resync_l1, 4)(v, gmfn, snpmfn);
 }
 
+static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
+                                            mfn_t smfn, unsigned long off)
+{
+    struct page_info *sp = mfn_to_page(smfn);
+
+    ASSERT(mfn_valid(smfn));
+    ASSERT(mfn_valid(gmfn));
+
+    if ( sp->u.sh.type == SH_type_l1_32_shadow ||
+         sp->u.sh.type == SH_type_fl1_32_shadow )
+        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 2)
+            (d, gmfn, smfn, off);
+
+    if ( sp->u.sh.type == SH_type_l1_pae_shadow ||
+         sp->u.sh.type == SH_type_fl1_pae_shadow )
+        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 3)
+            (d, gmfn, smfn, off);
+
+    if ( sp->u.sh.type == SH_type_l1_64_shadow ||
+         sp->u.sh.type == SH_type_fl1_64_shadow )
+        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p, 4)
+            (d, gmfn, smfn, off);
+
+    return 0;
+}
 
 /*
  * Fixup arrays: We limit the maximum number of writable mappings to
@@ -2001,34 +2023,6 @@ int sh_remove_write_access(struct domain *d, mfn_t gmfn,
 }
 #endif /* CONFIG_HVM */
 
-#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
-static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
-                                            mfn_t smfn, unsigned long off)
-{
-    struct page_info *sp = mfn_to_page(smfn);
-
-    ASSERT(mfn_valid(smfn));
-    ASSERT(mfn_valid(gmfn));
-
-    if ( sp->u.sh.type == SH_type_l1_32_shadow
-         || sp->u.sh.type == SH_type_fl1_32_shadow )
-    {
-        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p,2)
-            (d, gmfn, smfn, off);
-    }
-    else if ( sp->u.sh.type == SH_type_l1_pae_shadow
-              || sp->u.sh.type == SH_type_fl1_pae_shadow )
-        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p,3)
-            (d, gmfn, smfn, off);
-    else if ( sp->u.sh.type == SH_type_l1_64_shadow
-              || sp->u.sh.type == SH_type_fl1_64_shadow )
-        return SHADOW_INTERNAL_NAME(sh_rm_write_access_from_sl1p,4)
-            (d, gmfn, smfn, off);
-
-    return 0;
-}
-#endif
-
 /**************************************************************************/
 /* Remove all mappings of a guest frame from the shadow tables.
  * Returns non-zero if we need to flush TLBs. */
-- 
2.11.0


