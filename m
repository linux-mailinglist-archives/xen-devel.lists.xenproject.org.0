Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBB51EA4CE
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:22:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkOS-0006kj-PO; Mon, 01 Jun 2020 13:22:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmQg=7O=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jfkOR-0006jj-3Z
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:22:19 +0000
X-Inumbo-ID: dfe0775a-a40a-11ea-8993-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfe0775a-a40a-11ea-8993-bc764e2007e4;
 Mon, 01 Jun 2020 13:22:00 +0000 (UTC)
IronPort-SDR: eYkBbxAJMifG3uobCYKDtbUo66UTDRrtjr6rSuqfo4WRxHjrY2Wu0njUu8noRvfReD46pBDn1i
 gCp64f2LXSDQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 06:21:59 -0700
IronPort-SDR: 1cKPzYsYfgfjZpS+CJvwDNcWA1oIpmOii7uxMrS2NR4p369xdncM4O4Cb+skp6ZkpXnKytCb/w
 9KI+RA07J8JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; d="scan'208";a="303887304"
Received: from alayek-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.11.99])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2020 06:21:58 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v19 for-4.14 09/13] tools/libxl: libxl__build_hvm_fork
Date: Mon,  1 Jun 2020 06:21:43 -0700
Message-Id: <688d79b662bce099e847329426dd6fd61479f8c2.1591017086.git.tamas.lengyel@intel.com>
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

Add libxl__build_hvm_fork function that performs only the steps needed for VM
forks, skipping a large chunk of libxl__build_hvm.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 tools/libxl/libxl_dom.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/tools/libxl/libxl_dom.c b/tools/libxl/libxl_dom.c
index 52d49437cc..28117f0907 100644
--- a/tools/libxl/libxl_dom.c
+++ b/tools/libxl/libxl_dom.c
@@ -741,14 +741,15 @@ static int hvm_build_set_params(xc_interface *handle, uint32_t domid,
                                 libxl_domain_build_info *info,
                                 int store_evtchn, unsigned long *store_mfn,
                                 int console_evtchn, unsigned long *console_mfn,
-                                domid_t store_domid, domid_t console_domid)
+                                domid_t store_domid, domid_t console_domid,
+                                bool forked_vm)
 {
     struct hvm_info_table *va_hvm;
     uint8_t *va_map, sum;
     uint64_t str_mfn, cons_mfn;
     int i;
 
-    if (info->type == LIBXL_DOMAIN_TYPE_HVM) {
+    if (info->type == LIBXL_DOMAIN_TYPE_HVM && !forked_vm) {
         va_map = xc_map_foreign_range(handle, domid,
                                       XC_PAGE_SIZE, PROT_READ | PROT_WRITE,
                                       HVM_INFO_PFN);
@@ -1053,6 +1054,28 @@ out:
     return rc;
 }
 
+static int libxl__build_hvm_fork(libxl__gc *gc, uint32_t domid,
+                                 libxl_domain_config *d_config,
+                                 libxl__domain_build_state *state)
+{
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+    libxl_domain_build_info *const info = &d_config->b_info;
+
+    int rc = hvm_build_set_params(ctx->xch, domid, info, state->store_port,
+                                  &state->store_mfn, state->console_port,
+                                  &state->console_mfn, state->store_domid,
+                                  state->console_domid, state->forked_vm);
+
+    if ( rc )
+        return rc;
+
+    return xc_dom_gnttab_seed(ctx->xch, domid, true,
+                              state->console_mfn,
+                              state->store_mfn,
+                              state->console_domid,
+                              state->store_domid);
+}
+
 int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
               libxl_domain_config *d_config,
               libxl__domain_build_state *state)
@@ -1064,6 +1087,9 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
     struct xc_dom_image *dom = NULL;
     bool device_model = info->type == LIBXL_DOMAIN_TYPE_HVM ? true : false;
 
+    if (state->forked_vm)
+        return libxl__build_hvm_fork(gc, domid, d_config, state);
+
     xc_dom_loginit(ctx->xch);
 
     /*
@@ -1188,7 +1214,7 @@ int libxl__build_hvm(libxl__gc *gc, uint32_t domid,
     rc = hvm_build_set_params(ctx->xch, domid, info, state->store_port,
                                &state->store_mfn, state->console_port,
                                &state->console_mfn, state->store_domid,
-                               state->console_domid);
+                               state->console_domid, false);
     if (rc != 0) {
         LOG(ERROR, "hvm build set params failed");
         goto out;
-- 
2.25.1


