Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CF32C1F52
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 09:02:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35429.66983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khTH4-0008BE-Ml; Tue, 24 Nov 2020 08:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35429.66983; Tue, 24 Nov 2020 08:02:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khTH4-0008AI-DJ; Tue, 24 Nov 2020 08:02:06 +0000
Received: by outflank-mailman (input) for mailman id 35429;
 Tue, 24 Nov 2020 08:02:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khTH2-00087t-8T
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 08:02:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khTH1-00060B-FI; Tue, 24 Nov 2020 08:02:03 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208]
 helo=ip-10-0-29-170.ec2.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khTH1-0001hp-Bz; Tue, 24 Nov 2020 08:02:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khTH2-00087t-8T
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 08:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=zmhShPhhJnaAiA904102UbZsZbkJVaSxT/H2EVj5rXI=; b=3pwtvMITVGSpW4tV3gXEliFEH
	EwakXBXpEvc7ETiGo7BYbQhN9qt8ht8sxc2IfOm9rdgq/7uCoRHj+9ZoWLjGwTAy8rI3jJzCyp2z7
	4cqdCWcYO6FLTDofoGXKtG9Dt9YUo3fQYlqe9GbngGpjy5Dk+5GDT0rEdHFvKRgigO7b8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khTH1-00060B-FI; Tue, 24 Nov 2020 08:02:03 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208] helo=ip-10-0-29-170.ec2.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khTH1-0001hp-Bz; Tue, 24 Nov 2020 08:02:03 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 03/23] libxl: Make sure devices added by pci-attach are reflected in the config
Date: Tue, 24 Nov 2020 08:01:39 +0000
Message-Id: <20201124080159.11912-4-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201124080159.11912-1-paul@xen.org>
References: <20201124080159.11912-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

Currently libxl__device_pci_add_xenstore() is broken in that does not
update the domain's configuration for the first device added (which causes
creation of the overall backend area in xenstore). This can be easily observed
by running 'xl list -l' after adding a single device: the device will be
missing.

This patch fixes the problem and adds a DEBUG log line to allow easy
verification that the domain configuration is being modified. Also, the use
of libxl__device_generic_add() is dropped as it leads to a confusing situation
where only partial backend information is written under the xenstore
'/libxl' path. For LIBXL__DEVICE_KIND_PCI devices the only definitive
information in xenstore is under '/local/domain/0/backend' (the '0' being
hard-coded).

NOTE: This patch includes a whitespace in add_pcis_done().

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v2:
 - Avoid having two completely different ways of adding devices into xenstore

v3:
 - Revert some changes form v2 as there is confusion over use of the libxl
   and backend xenstore paths which needs to be fixed
---
 tools/libs/light/libxl_pci.c | 87 +++++++++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 42 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 9d44b28f0a..da01c77ba2 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -79,39 +79,55 @@ static void libxl__device_from_pci(libxl__gc *gc, uint32_t domid,
     device->kind = LIBXL__DEVICE_KIND_PCI;
 }
 
-static int libxl__create_pci_backend(libxl__gc *gc, uint32_t domid,
-                                     const libxl_device_pci *pci,
-                                     int num)
+static void libxl__create_pci_backend(libxl__gc *gc, xs_transaction_t t,
+                                      uint32_t domid, const libxl_device_pci *pci)
 {
-    flexarray_t *front = NULL;
-    flexarray_t *back = NULL;
-    libxl__device device;
-    int i;
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+    flexarray_t *front, *back;
+    char *fe_path, *be_path;
+    struct xs_permissions fe_perms[2], be_perms[2];
+
+    LOGD(DEBUG, domid, "Creating pci backend");
 
     front = flexarray_make(gc, 16, 1);
     back = flexarray_make(gc, 16, 1);
 
-    LOGD(DEBUG, domid, "Creating pci backend");
-
-    /* add pci device */
-    libxl__device_from_pci(gc, domid, pci, &device);
+    fe_path = libxl__domain_device_frontend_path(gc, domid, 0,
+                                                 LIBXL__DEVICE_KIND_PCI);
+    be_path = libxl__domain_device_backend_path(gc, 0, domid, 0,
+                                                LIBXL__DEVICE_KIND_PCI);
 
+    flexarray_append_pair(back, "frontend", fe_path);
     flexarray_append_pair(back, "frontend-id", GCSPRINTF("%d", domid));
-    flexarray_append_pair(back, "online", "1");
+    flexarray_append_pair(back, "online", GCSPRINTF("%d", 1));
     flexarray_append_pair(back, "state", GCSPRINTF("%d", XenbusStateInitialising));
     flexarray_append_pair(back, "domain", libxl__domid_to_name(gc, domid));
 
-    for (i = 0; i < num; i++, pci++)
-        libxl_create_pci_backend_device(gc, back, i, pci);
+    be_perms[0].id = 0;
+    be_perms[0].perms = XS_PERM_NONE;
+    be_perms[1].id = domid;
+    be_perms[1].perms = XS_PERM_READ;
+
+    xs_rm(ctx->xsh, t, be_path);
+    xs_mkdir(ctx->xsh, t, be_path);
+    xs_set_permissions(ctx->xsh, t, be_path, be_perms,
+                       ARRAY_SIZE(be_perms));
+    libxl__xs_writev(gc, t, be_path, libxl__xs_kvs_of_flexarray(gc, back));
 
-    flexarray_append_pair(back, "num_devs", GCSPRINTF("%d", num));
+    flexarray_append_pair(front, "backend", be_path);
     flexarray_append_pair(front, "backend-id", GCSPRINTF("%d", 0));
     flexarray_append_pair(front, "state", GCSPRINTF("%d", XenbusStateInitialising));
 
-    return libxl__device_generic_add(gc, XBT_NULL, &device,
-                                     libxl__xs_kvs_of_flexarray(gc, back),
-                                     libxl__xs_kvs_of_flexarray(gc, front),
-                                     NULL);
+    fe_perms[0].id = domid;
+    fe_perms[0].perms = XS_PERM_NONE;
+    fe_perms[1].id = 0;
+    fe_perms[1].perms = XS_PERM_READ;
+
+    xs_rm(ctx->xsh, t, fe_path);
+    xs_mkdir(ctx->xsh, t, fe_path);
+    xs_set_permissions(ctx->xsh, t, fe_path,
+                       fe_perms, ARRAY_SIZE(fe_perms));
+    libxl__xs_writev(gc, t, fe_path, libxl__xs_kvs_of_flexarray(gc, front));
 }
 
 static int libxl__device_pci_add_xenstore(libxl__gc *gc,
@@ -135,8 +151,6 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
     be_path = libxl__domain_device_backend_path(gc, 0, domid, 0,
                                                 LIBXL__DEVICE_KIND_PCI);
     num_devs = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/num_devs", be_path));
-    if (!num_devs)
-        return libxl__create_pci_backend(gc, domid, pci, 1);
 
     libxl_domain_type domtype = libxl__domain_type(gc, domid);
     if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
@@ -150,17 +164,17 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
     back = flexarray_make(gc, 16, 1);
 
     LOGD(DEBUG, domid, "Adding new pci device to xenstore");
-    num = atoi(num_devs);
+    num = num_devs ? atoi(num_devs) : 0;
     libxl_create_pci_backend_device(gc, back, num, pci);
     flexarray_append_pair(back, "num_devs", GCSPRINTF("%d", num + 1));
-    if (!starting)
+    if (num && !starting)
         flexarray_append_pair(back, "state", GCSPRINTF("%d", XenbusStateReconfiguring));
 
     /*
      * Stubdomin config is derived from its target domain, it doesn't have
      * its own file.
      */
-    if (!is_stubdomain) {
+    if (!is_stubdomain && !starting) {
         lock = libxl__lock_domain_userdata(gc, domid);
         if (!lock) {
             rc = ERROR_LOCK_FAIL;
@@ -170,6 +184,7 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
         rc = libxl__get_domain_configuration(gc, domid, &d_config);
         if (rc) goto out;
 
+        LOGD(DEBUG, domid, "Adding new pci device to config");
         device_add_domain_config(gc, &d_config, &libxl__pci_devtype,
                                  pci);
 
@@ -186,6 +201,10 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
             if (rc) goto out;
         }
 
+        /* This is the first device, so create the backend */
+        if (!num_devs)
+            libxl__create_pci_backend(gc, t, domid, pci);
+
         libxl__xs_writev(gc, t, be_path, libxl__xs_kvs_of_flexarray(gc, back));
 
         rc = libxl__xs_transaction_commit(gc, &t);
@@ -1437,7 +1456,7 @@ out_no_irq:
         }
     }
 
-    if (!starting && !libxl_get_stubdom_id(CTX, domid))
+    if (!libxl_get_stubdom_id(CTX, domid))
         rc = libxl__device_pci_add_xenstore(gc, domid, pci, starting);
     else
         rc = 0;
@@ -1765,28 +1784,12 @@ static void libxl__add_pcis(libxl__egc *egc, libxl__ao *ao, uint32_t domid,
 }
 
 static void add_pcis_done(libxl__egc *egc, libxl__multidev *multidev,
-                             int rc)
+                          int rc)
 {
     EGC_GC;
     add_pcis_state *apds = CONTAINER_OF(multidev, *apds, multidev);
-
-    /* Convenience aliases */
-    libxl_domain_config *d_config = apds->d_config;
-    libxl_domid domid = apds->domid;
     libxl__ao_device *aodev = apds->outer_aodev;
 
-    if (rc) goto out;
-
-    if (d_config->num_pcis > 0 && !libxl_get_stubdom_id(CTX, domid)) {
-        rc = libxl__create_pci_backend(gc, domid, d_config->pcis,
-                                       d_config->num_pcis);
-        if (rc < 0) {
-            LOGD(ERROR, domid, "libxl_create_pci_backend failed: %d", rc);
-            goto out;
-        }
-    }
-
-out:
     aodev->rc = rc;
     aodev->callback(egc, aodev);
 }
-- 
2.11.0


