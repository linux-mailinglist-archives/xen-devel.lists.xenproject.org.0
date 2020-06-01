Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1271EA4D3
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:22:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkOK-0006f4-Sz; Mon, 01 Jun 2020 13:22:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmQg=7O=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jfkOJ-0006eX-Se
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:22:11 +0000
X-Inumbo-ID: dea7aff3-a40a-11ea-ab1b-12813bfff9fa
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dea7aff3-a40a-11ea-ab1b-12813bfff9fa;
 Mon, 01 Jun 2020 13:21:59 +0000 (UTC)
IronPort-SDR: ExGWDZMH5GWwQEkJjcFMcIanFAIhhumLpPK09RcYRo00igFeixwnxOyffCGITwYPRMc2ZfeJrJ
 VJJc76bbQ2/g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 06:21:57 -0700
IronPort-SDR: AAatOggz3HYKUTbjHTpoBX7UjXaEbcFir0FwqigBWNA8hm4nXhBOwsx5nL1oNXc1iPQidkp7gn
 YQY/Qpjej3yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; d="scan'208";a="303887289"
Received: from alayek-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.11.99])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2020 06:21:57 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v19 for-4.14 07/13] tools/libxl: Adjust libxl__build_pre
Date: Mon,  1 Jun 2020 06:21:41 -0700
Message-Id: <d03d1a6c6b50ea11e88d6e49621057deed31abfb.1591017086.git.tamas.lengyel@intel.com>
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

Skips parts not relevant for VM forks. No functional change in existing code,
only relocating some bits that don't need to be done at the very end.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 tools/libxl/libxl_dom.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
index dd1aff89a3..1b55097a1a 100644
--- a/tools/libxl/libxl_dom.c
+++ b/tools/libxl/libxl_dom.c
@@ -249,9 +249,12 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
     libxl_domain_build_info *const info = &d_config->b_info;
     libxl_ctx *ctx = libxl__gc_owner(gc);
     char *xs_domid, *con_domid;
-    int rc;
+    int rc = 0;
     uint64_t size;
 
+    if (state->forked_vm)
+        goto skip_fork;
+
     if (xc_domain_max_vcpus(ctx->xch, domid, info->max_vcpus) != 0) {
         LOG(ERROR, "Couldn't set max vcpu count");
         return ERROR_FAIL;
@@ -374,6 +377,16 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
         return ERROR_FAIL;
     }
 
+    if ( (rc = libxl__arch_domain_create(gc, d_config, domid)) )
+        return rc;
+
+    /* Construct a CPUID policy, but only for brand new domains.  Domains
+     * being migrated-in/restored have CPUID handled during the
+     * static_data_done() callback. */
+    if (!state->restore)
+        libxl__cpuid_legacy(ctx, domid, info);
+
+skip_fork:
     xs_domid = xs_read(ctx->xsh, XBT_NULL, "/tool/xenstored/domid", NULL);
     state->store_domid = xs_domid ? atoi(xs_domid) : 0;
     free(xs_domid);
@@ -385,14 +398,6 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
     state->store_port = xc_evtchn_alloc_unbound(ctx->xch, domid, state->store_domid);
     state->console_port = xc_evtchn_alloc_unbound(ctx->xch, domid, state->console_domid);
 
-    rc = libxl__arch_domain_create(gc, d_config, domid);
-
-    /* Construct a CPUID policy, but only for brand new domains.  Domains
-     * being migrated-in/restored have CPUID handled during the
-     * static_data_done() callback. */
-    if (!state->restore)
-        libxl__cpuid_legacy(ctx, domid, info);
-
     return rc;
 }
 
-- 
2.25.1


