Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4741EA4D7
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:22:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkOQ-0006in-Fh; Mon, 01 Jun 2020 13:22:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmQg=7O=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jfkOO-0006hy-Sl
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:22:16 +0000
X-Inumbo-ID: dfe2868a-a40a-11ea-ab1b-12813bfff9fa
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfe2868a-a40a-11ea-ab1b-12813bfff9fa;
 Mon, 01 Jun 2020 13:22:00 +0000 (UTC)
IronPort-SDR: dtsesG4qtqvwgW/7QUL6kHCpoISg2oRiSj5CcYVOCaDPVN6eDl5mgR+gbDSRgnzOfrr2fiFbRh
 CuTM/oE78Ykg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 06:21:59 -0700
IronPort-SDR: s05BZVyhXR9Xjv9kvjrGZR6UjA2OEFZ7oMD1wRB96A31J2ARk1FPu3vk378eDdVja7owOMV67R
 BePbFwgEmOUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; d="scan'208";a="303887309"
Received: from alayek-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.11.99])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2020 06:21:59 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v19 for-4.14 10/13] tools/libxl: set QEMU saved_state from
 dm_restore_file
Date: Mon,  1 Jun 2020 06:21:44 -0700
Message-Id: <b6ee40e3c58db2ae82b99f2098c28a8f3d85206a.1591017086.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1591017086.git.tamas.lengyel@intel.com>
References: <cover.1591017086.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

And make sure we don't remove the file once done.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 tools/libxl/libxl_create.c | 4 ++++
 tools/libxl/libxl_dm.c     | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index ab3ac096ee..27f790cae1 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -1602,6 +1602,7 @@ static void domcreate_rebuild_done(libxl__egc *egc,
     /* convenience aliases */
     const uint32_t domid = dcs->guest_domid;
     libxl_domain_config *const d_config = dcs->guest_config;
+    libxl__domain_build_state *const state = &dcs->build_state;
 
     if (ret) {
         LOGD(ERROR, domid, "cannot (re-)build domain: %d", ret);
@@ -1609,6 +1610,9 @@ static void domcreate_rebuild_done(libxl__egc *egc,
         goto error_out;
     }
 
+    if (d_config->dm_restore_file)
+        state->saved_state = GCSPRINTF("%s", d_config->dm_restore_file);
+
     store_libxl_entry(gc, domid, &d_config->b_info);
 
     libxl__multidev_begin(ao, &dcs->multidev);
diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index f2dc5696b9..9b22836e12 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -3104,7 +3104,7 @@ static void device_model_spawn_outcome(libxl__egc *egc,
 
     libxl__domain_build_state *state = dmss->build_state;
 
-    if (state->saved_state) {
+    if (state->saved_state && !state->forked_vm) {
         ret2 = unlink(state->saved_state);
         if (ret2) {
             LOGED(ERROR, dmss->guest_domid, "%s: failed to remove device-model state %s",
-- 
2.25.1


