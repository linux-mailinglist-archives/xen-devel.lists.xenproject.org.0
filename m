Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709A11EA4D8
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:22:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkOG-0006bd-AB; Mon, 01 Jun 2020 13:22:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmQg=7O=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jfkOE-0006bE-SS
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:22:06 +0000
X-Inumbo-ID: dea7aff2-a40a-11ea-ab1b-12813bfff9fa
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dea7aff2-a40a-11ea-ab1b-12813bfff9fa;
 Mon, 01 Jun 2020 13:21:58 +0000 (UTC)
IronPort-SDR: 7eWO+wTg+OD+E2zkbkm3GRWBTgtNS6aCZmQicZunUHASRlRfGwdwer19Xq2lPrBNTranExw6Qj
 hnDOMTq4QIjg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 06:21:56 -0700
IronPort-SDR: LEuwBODCIKLx545PJycekkq8RxaL8o3E7DHJvs7J4Cqfhf+06K1UkXYWFFeuEr9vUCpsVW90uC
 VxmKNAsxFN9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; d="scan'208";a="303887271"
Received: from alayek-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.11.99])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2020 06:21:55 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v19 for-4.14 04/13] tools/libxl: populate xenstore entries
 when launching dm for VM fork
Date: Mon,  1 Jun 2020 06:21:38 -0700
Message-Id: <52246b2d22313368a063902a868cc2c66fefaf82.1591017086.git.tamas.lengyel@intel.com>
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

No need to call libxl__domain_make since the domain already exists, only need
to populate the xenstore entries via libxl__domain_make_xs_entries.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 tools/libxl/libxl_create.c  | 11 ++++++++++-
 tools/libxl/libxl_types.idl |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 09cf99d304..c3614e5a30 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -1244,7 +1244,13 @@ static void initiate_domain_create(libxl__egc *egc,
     ret = libxl__domain_config_setdefault(gc,d_config,domid);
     if (ret) goto error_out;
 
-    ret = libxl__domain_make(gc, d_config, dbs, &domid, dcs->soft_reset);
+    /* If no dm_restore_file is specified we are in the normal path */
+    if (!d_config->dm_restore_file)
+        ret = libxl__domain_make(gc, d_config, dbs, &domid, dcs->soft_reset);
+    else
+        ret = libxl__domain_make_xs_entries(gc, d_config, &dcs->build_state,
+                                            domid);
+
     if (ret) {
         LOGD(ERROR, domid, "cannot make domain: %d", ret);
         dcs->guest_domid = domid;
@@ -2052,6 +2058,9 @@ static int do_domain_create(libxl_ctx *ctx, libxl_domain_config *d_config,
     cdcs->dcs.domid = INVALID_DOMID;
     cdcs->dcs.soft_reset = false;
 
+    if (d_config->dm_restore_file)
+        cdcs->dcs.domid = *domid;
+
     if (cdcs->dcs.restore_params.checkpointed_stream ==
         LIBXL_CHECKPOINTED_STREAM_COLO) {
         cdcs->dcs.colo_proxy_script =
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
index 9d3f05f399..b9cc139b0a 100644
--- a/tools/libxl/libxl_types.idl
+++ b/tools/libxl/libxl_types.idl
@@ -961,6 +961,7 @@ libxl_domain_config = Struct("domain_config", [
     ("on_watchdog", libxl_action_on_shutdown),
     ("on_crash", libxl_action_on_shutdown),
     ("on_soft_reset", libxl_action_on_shutdown),
+    ("dm_restore_file", string, {'const': True}),
     ], dir=DIR_IN)
 
 libxl_diskinfo = Struct("diskinfo", [
-- 
2.25.1


