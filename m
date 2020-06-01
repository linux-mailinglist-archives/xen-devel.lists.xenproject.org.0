Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE011EA4D6
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:22:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkO9-0006Zp-C4; Mon, 01 Jun 2020 13:22:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OmQg=7O=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jfkO7-0006Zk-93
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:21:59 +0000
X-Inumbo-ID: ddd06506-a40a-11ea-9dbe-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddd06506-a40a-11ea-9dbe-bc764e2007e4;
 Mon, 01 Jun 2020 13:21:57 +0000 (UTC)
IronPort-SDR: EKWuFPQTlQo2nXmEb57T0pwfRBTs2DWQkl+jsOS4QmLECQY9zltaVs3Ky3gGsn+XjAWdf8rwqJ
 hyjhlsy5da/Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 06:21:55 -0700
IronPort-SDR: JYYGi1Zv63q1rClSv3u55YlsaJLhwwbopbhxoOvJBRFiPlzxskqtLck516JzHjYi6Gvvxy9p0B
 AiVbe0WNDnoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; d="scan'208";a="303887264"
Received: from alayek-mobl.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.209.11.99])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2020 06:21:54 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v19 for-4.14 03/13] tools/libxl: Split libxl__domain_make
Date: Mon,  1 Jun 2020 06:21:37 -0700
Message-Id: <853ceef8391bdfb7dc43ae2d9a9cb45818f256e4.1591017086.git.tamas.lengyel@intel.com>
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

Make part of libxl__domain_make into a separate function. No functional change.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 tools/libxl/libxl_create.c   | 62 +++++++++++++++++++++++-------------
 tools/libxl/libxl_internal.h |  4 ++-
 2 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 75862dc6ed..09cf99d304 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -579,15 +579,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
                        uint32_t *domid, bool soft_reset)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
-    int ret, rc, nb_vm;
-    const char *dom_type;
-    char *uuid_string;
-    char *dom_path, *vm_path, *libxl_path;
-    struct xs_permissions roperm[2];
-    struct xs_permissions rwperm[1];
-    struct xs_permissions noperm[1];
-    xs_transaction_t t = 0;
-    libxl_vminfo *vm_list;
+    int ret, rc;
 
     /* convenience aliases */
     libxl_domain_create_info *info = &d_config->c_info;
@@ -595,12 +587,6 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
 
     assert(soft_reset || *domid == INVALID_DOMID);
 
-    uuid_string = libxl__uuid2string(gc, info->uuid);
-    if (!uuid_string) {
-        rc = ERROR_NOMEM;
-        goto out;
-    }
-
     if (!soft_reset) {
         struct xen_domctl_createdomain create = {
             .ssidref = info->ssidref,
@@ -731,7 +717,37 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
         goto out;
     }
 
-    dom_path = libxl__xs_get_dompath(gc, *domid);
+    rc = libxl__domain_make_xs_entries(gc, d_config, state, *domid);
+
+ out:
+    return rc;
+}
+
+int libxl__domain_make_xs_entries(libxl__gc *gc, libxl_domain_config *d_config,
+                                  libxl__domain_build_state *state,
+                                  uint32_t domid)
+{
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+    int rc, nb_vm;
+    const char *dom_type;
+    char *uuid_string;
+    char *dom_path, *vm_path, *libxl_path;
+    struct xs_permissions roperm[2];
+    struct xs_permissions rwperm[1];
+    struct xs_permissions noperm[1];
+    xs_transaction_t t = 0;
+    libxl_vminfo *vm_list;
+
+    /* convenience aliases */
+    libxl_domain_create_info *info = &d_config->c_info;
+
+    uuid_string = libxl__uuid2string(gc, info->uuid);
+    if (!uuid_string) {
+        rc = ERROR_NOMEM;
+        goto out;
+    }
+
+    dom_path = libxl__xs_get_dompath(gc, domid);
     if (!dom_path) {
         rc = ERROR_FAIL;
         goto out;
@@ -739,12 +755,12 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
 
     vm_path = GCSPRINTF("/vm/%s", uuid_string);
     if (!vm_path) {
-        LOGD(ERROR, *domid, "cannot allocate create paths");
+        LOGD(ERROR, domid, "cannot allocate create paths");
         rc = ERROR_FAIL;
         goto out;
     }
 
-    libxl_path = libxl__xs_libxl_path(gc, *domid);
+    libxl_path = libxl__xs_libxl_path(gc, domid);
     if (!libxl_path) {
         rc = ERROR_FAIL;
         goto out;
@@ -755,10 +771,10 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
 
     roperm[0].id = 0;
     roperm[0].perms = XS_PERM_NONE;
-    roperm[1].id = *domid;
+    roperm[1].id = domid;
     roperm[1].perms = XS_PERM_READ;
 
-    rwperm[0].id = *domid;
+    rwperm[0].id = domid;
     rwperm[0].perms = XS_PERM_NONE;
 
 retry_transaction:
@@ -776,7 +792,7 @@ retry_transaction:
                     noperm, ARRAY_SIZE(noperm));
 
     xs_write(ctx->xsh, t, GCSPRINTF("%s/vm", dom_path), vm_path, strlen(vm_path));
-    rc = libxl__domain_rename(gc, *domid, 0, info->name, t);
+    rc = libxl__domain_rename(gc, domid, 0, info->name, t);
     if (rc)
         goto out;
 
@@ -866,7 +882,7 @@ retry_transaction:
 
     vm_list = libxl_list_vm(ctx, &nb_vm);
     if (!vm_list) {
-        LOGD(ERROR, *domid, "cannot get number of running guests");
+        LOGD(ERROR, domid, "cannot get number of running guests");
         rc = ERROR_FAIL;
         goto out;
     }
@@ -890,7 +906,7 @@ retry_transaction:
             t = 0;
             goto retry_transaction;
         }
-        LOGED(ERROR, *domid, "domain creation ""xenstore transaction commit failed");
+        LOGED(ERROR, domid, "domain creation ""xenstore transaction commit failed");
         rc = ERROR_FAIL;
         goto out;
     }
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index c7ece066c4..19b367daca 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -1983,7 +1983,9 @@ _hidden int libxl__domain_make(libxl__gc *gc,
                                libxl_domain_config *d_config,
                                libxl__domain_build_state *state,
                                uint32_t *domid, bool soft_reset);
-
+_hidden int libxl__domain_make_xs_entries(libxl__gc *gc, libxl_domain_config *d_config,
+                                          libxl__domain_build_state *state,
+                                          uint32_t domid);
 _hidden int libxl__domain_build(libxl__gc *gc,
                                 libxl_domain_config *d_config,
                                 uint32_t domid,
-- 
2.25.1


