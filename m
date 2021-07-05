Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A063BC307
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 21:11:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150636.278540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Tzr-0004Pu-HA; Mon, 05 Jul 2021 19:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150636.278540; Mon, 05 Jul 2021 19:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Tzr-0004MX-9z; Mon, 05 Jul 2021 19:11:11 +0000
Received: by outflank-mailman (input) for mailman id 150636;
 Mon, 05 Jul 2021 19:11:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0Tzp-0002tP-Rt
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 19:11:09 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdab91df-ddc4-11eb-8459-12813bfff9fa;
 Mon, 05 Jul 2021 19:11:03 +0000 (UTC)
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
X-Inumbo-ID: bdab91df-ddc4-11eb-8459-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625512263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=HyKLJg6+yF7ZQi/84e0KuLZSQO3s7SCQ3p1UsQyyXqU=;
  b=KvoYmYP7ugDGx1ef/7w3ljJ9MMAXYOaqpfB8sJ/4uN13jS20PSTqaIdv
   WtF52+GiqLFWDawhNbLAVqWWvpaUz+QlJILxNfWWMSkSGen56MhkruHq4
   4rDh7Gf1h3Wc4JJZ4s5wyzHVtshJhtm3h2ES79dJ8+gMLwvpWdVaLsWk3
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: aPmwI5Ngmk9G7uDfJWPaX/ImIZHiG9VdNeTYMatZS81V2yqpbThy24moBXhMX3QSQWw+SWYBwV
 a211VBmA3Uc2XvqnhlyOkIDhAbRCq/28T2Lw7iT/SOTQiOPYrYPrxlxr8NAqB9QJRnHOQcvb7F
 og5TnnFVVF1z/27ocbN54SdWzTsvTfugfUJFEson3vnjKwXIQEBAb8e0sL02MAL9J73dw8tX7x
 G8l0kfZf9JCQ8K4ve5KzQqkLotlY/rYoPT98gK/KxjF22IKV+f8QMVErfbf6kxraOCB/reb1Tp
 Tkw=
X-SBRS: 5.1
X-MesageID: 47973429
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:XhZIcKB7gwQjmWHlHemo55DYdb4zR+YMi2TC1yhKKCC9E/bo7/
 xG885rtiMc5Ax/ZJhko6HlBEDiewKkyXcW2/hyAV7KZmCP0wHEQL2Kr7GSpAEIcxeOkNK1vp
 0BT0ERMrPN5CBB/KPH3DU=
X-IronPort-AV: E=Sophos;i="5.83,326,1616472000"; 
   d="scan'208";a="47973429"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Olaf Hering <olaf@aepfle.de>, "Juergen
 Gross" <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 3/5] tools/migration: unify known page type checking
Date: Mon, 5 Jul 2021 20:10:25 +0100
Message-ID: <20210705191027.15107-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210705191027.15107-1-andrew.cooper3@citrix.com>
References: <20210705191027.15107-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Olaf Hering <olaf@aepfle.de>

Users of xc_get_pfn_type_batch may want to sanity check the data
returned by Xen. Add helpers for this purpose:

is_known_page_type verifies the type returned by Xen on the saving
side, or the incoming type for a page on the restoring side, is known
by the save/restore code.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 tools/libs/guest/xg_sr_common.h  | 29 +++++++++++++++++++++++++++++
 tools/libs/guest/xg_sr_restore.c |  5 ++---
 tools/libs/guest/xg_sr_save.c    |  6 ++++++
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index e2994e18acf1..e8436d1abb14 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -455,6 +455,35 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 /* Handle a STATIC_DATA_END record. */
 int handle_static_data_end(struct xc_sr_context *ctx);
 
+/* Page type known to the migration logic? */
+static inline bool is_known_page_type(uint32_t type)
+{
+    switch ( type )
+    {
+    case XEN_DOMCTL_PFINFO_NOTAB:
+
+    case XEN_DOMCTL_PFINFO_L1TAB:
+    case XEN_DOMCTL_PFINFO_L1TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+
+    case XEN_DOMCTL_PFINFO_L2TAB:
+    case XEN_DOMCTL_PFINFO_L2TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+
+    case XEN_DOMCTL_PFINFO_L3TAB:
+    case XEN_DOMCTL_PFINFO_L3TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+
+    case XEN_DOMCTL_PFINFO_L4TAB:
+    case XEN_DOMCTL_PFINFO_L4TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+
+    case XEN_DOMCTL_PFINFO_XTAB:
+    case XEN_DOMCTL_PFINFO_XALLOC: /* Synthetic type in Xen 4.2 - 4.5 */
+    case XEN_DOMCTL_PFINFO_BROKEN:
+        return true;
+
+    default:
+        return false;
+    }
+}
+
 #endif
 /*
  * Local variables:
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index b57a7875192f..508953fd3cf7 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -406,10 +406,9 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         }
 
         type = (pages->pfn[i] & PAGE_DATA_TYPE_MASK) >> 32;
-        if ( ((type >> XEN_DOMCTL_PFINFO_LTAB_SHIFT) >= 5) &&
-             ((type >> XEN_DOMCTL_PFINFO_LTAB_SHIFT) <= 8) )
+        if ( !is_known_page_type(type) )
         {
-            ERROR("Invalid type %#"PRIx32" for pfn %#"PRIpfn" (index %u)",
+            ERROR("Unknown type %#"PRIx32" for pfn %#"PRIpfn" (index %u)",
                   type, pfn, i);
             goto err;
         }
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index f0e2bd048d37..c84a073e86f4 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -147,6 +147,12 @@ static int write_batch(struct xc_sr_context *ctx)
 
     for ( i = 0; i < nr_pfns; ++i )
     {
+        if ( !is_known_page_type(types[i]) )
+        {
+            ERROR("Unknown type %#"PRIpfn" for pfn %#"PRIpfn, types[i], mfns[i]);
+            goto err;
+        }
+
         switch ( types[i] )
         {
         case XEN_DOMCTL_PFINFO_BROKEN:
-- 
2.11.0


