Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC8339DD38
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 15:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137949.255477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqErT-0004Rm-JB; Mon, 07 Jun 2021 13:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137949.255477; Mon, 07 Jun 2021 13:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqErT-0004Pc-Fu; Mon, 07 Jun 2021 13:00:11 +0000
Received: by outflank-mailman (input) for mailman id 137949;
 Mon, 07 Jun 2021 13:00:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcEO=LB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lqErR-0004PW-Ru
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 13:00:09 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7e6ad82-02b1-432a-9e63-a77c1d5abfdc;
 Mon, 07 Jun 2021 13:00:08 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E009321A8A;
 Mon,  7 Jun 2021 13:00:07 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B1BE7118DD;
 Mon,  7 Jun 2021 13:00:07 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 6qUzKlcYvmBAEAAALh3uQQ
 (envelope-from <jgross@suse.com>); Mon, 07 Jun 2021 13:00:07 +0000
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
X-Inumbo-ID: f7e6ad82-02b1-432a-9e63-a77c1d5abfdc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623070807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bjaYWxACxRGpqsDAVvv6IZjzEWNKF4fA46tBnzk+epw=;
	b=Msb4pOfV22zWWq5RK3WRR7MzSYe2mV9mDNliSiTu5O5TSLuw+mgnAOFa+PQs7+Xps3uiVB
	m2+H2k7+eG0aPS/vPHOdYQrBIT3UOHJmlr7h3xTEhRK24MzA/sfEdmc+7mR+AEwg7z3VMg
	BTqb06g6dC+cinEmGvNDA5TooFiAsWI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623070807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=bjaYWxACxRGpqsDAVvv6IZjzEWNKF4fA46tBnzk+epw=;
	b=Msb4pOfV22zWWq5RK3WRR7MzSYe2mV9mDNliSiTu5O5TSLuw+mgnAOFa+PQs7+Xps3uiVB
	m2+H2k7+eG0aPS/vPHOdYQrBIT3UOHJmlr7h3xTEhRK24MzA/sfEdmc+7mR+AEwg7z3VMg
	BTqb06g6dC+cinEmGvNDA5TooFiAsWI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] tools/libs/guest: fix save and restore of pv domains after 32-bit de-support
Date: Mon,  7 Jun 2021 15:00:05 +0200
Message-Id: <20210607130005.5475-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After 32-bit PV-guests have been security de-supported when not running
under PV-shim, the hypervisor will no longer be configured to support
those domains per default when not being built as PV-shim.

Unfortunately libxenguest will fail saving or restoring a PV domain
due to this restriction, as it is trying to get the compat MFN list
even for 64 bit guests.

Fix that by obtaining the compat MFN list only for 32-bit PV guests.

Fixes: 1a0f2fe2297d122a08fe ("SUPPORT.md: Un-shimmed 32-bit PV guests are no longer supported")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- set compat MFN to "invalid" instead of net setting it at all (Jan Beulich)
- don't set compat MFN for 64-bit guests even if running as 32-bit
  domain (Andrew Cooper)
---
 tools/libs/guest/xg_sr_common.h        |  2 +-
 tools/libs/guest/xg_sr_common_x86_pv.c | 37 +++++++++++++++-----------
 2 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index cc3ad1c394..e2994e18ac 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -325,7 +325,7 @@ struct xc_sr_context
                 xen_pfn_t max_mfn;
                 /* Read-only machine to phys map */
                 xen_pfn_t *m2p;
-                /* first mfn of the compat m2p (Only needed for 32bit PV guests) */
+                /* first mfn of the compat m2p (Only set for 32bit PV guests) */
                 xen_pfn_t compat_m2p_mfn0;
                 /* Number of m2p frames mapped */
                 unsigned long nr_m2p_frames;
diff --git a/tools/libs/guest/xg_sr_common_x86_pv.c b/tools/libs/guest/xg_sr_common_x86_pv.c
index cd33406aab..f339ea4a79 100644
--- a/tools/libs/guest/xg_sr_common_x86_pv.c
+++ b/tools/libs/guest/xg_sr_common_x86_pv.c
@@ -149,27 +149,32 @@ int x86_pv_map_m2p(struct xc_sr_context *ctx)
 
     ctx->x86.pv.nr_m2p_frames = (M2P_CHUNK_SIZE >> PAGE_SHIFT) * m2p_chunks;
 
+    if ( ctx->x86.pv.levels == 3 )
+    {
 #ifdef __i386__
-    /* 32 bit toolstacks automatically get the compat m2p */
-    ctx->x86.pv.compat_m2p_mfn0 = entries[0].mfn;
+        /* 32 bit toolstacks automatically get the compat m2p */
+        ctx->x86.pv.compat_m2p_mfn0 = entries[0].mfn;
 #else
-    /* 64 bit toolstacks need to ask Xen specially for it */
-    {
-        struct xen_machphys_mfn_list xmml = {
-            .max_extents = 1,
-            .extent_start = { &ctx->x86.pv.compat_m2p_mfn0 },
-        };
-
-        rc = do_memory_op(xch, XENMEM_machphys_compat_mfn_list,
-                          &xmml, sizeof(xmml));
-        if ( rc || xmml.nr_extents != 1 )
+        /* 64 bit toolstacks need to ask Xen specially for it */
         {
-            PERROR("Failed to get compat mfn list from Xen");
-            rc = -1;
-            goto err;
+            struct xen_machphys_mfn_list xmml = {
+                .max_extents = 1,
+                .extent_start = { &ctx->x86.pv.compat_m2p_mfn0 },
+            };
+
+            rc = do_memory_op(xch, XENMEM_machphys_compat_mfn_list,
+                              &xmml, sizeof(xmml));
+            if ( rc || xmml.nr_extents != 1 )
+            {
+                PERROR("Failed to get compat mfn list from Xen");
+                rc = -1;
+                goto err;
+            }
         }
-    }
 #endif
+    }
+    else
+        ctx->x86.pv.compat_m2p_mfn0 = INVALID_MFN;
 
     /* All Done */
     rc = 0;
-- 
2.26.2


