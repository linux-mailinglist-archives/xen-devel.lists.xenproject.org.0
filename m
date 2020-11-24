Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C5A2C1F4C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 09:02:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35427.66960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khTH3-00089Z-SS; Tue, 24 Nov 2020 08:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35427.66960; Tue, 24 Nov 2020 08:02:05 +0000
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
	id 1khTH3-00088v-IL; Tue, 24 Nov 2020 08:02:05 +0000
Received: by outflank-mailman (input) for mailman id 35427;
 Tue, 24 Nov 2020 08:02:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khTH2-00087l-6o
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 08:02:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khTH1-000609-8v; Tue, 24 Nov 2020 08:02:03 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208]
 helo=ip-10-0-29-170.ec2.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khTH1-0001hp-4l; Tue, 24 Nov 2020 08:02:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khTH2-00087l-6o
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 08:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=yMHep/dhCDaK4WgXxVfnOxAemfKui/VNIp6TlUXURAA=; b=pkWiyjIhDqUQz3tiqjT1ponhz
	4VIRX3Tz1qeOxloN03HIlwn+aMwjIk9kOhjlxAhZnr4Q7EudsnK8xNqyqZ8or5CzidT1KJDS5r/1R
	hIBKzHF4ekPaq/nuLj8qz5H2+Pf8/tpsPYsdbe44pF7mdmTEa7YY0WOgf4NFa2iArMPhw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khTH1-000609-8v; Tue, 24 Nov 2020 08:02:03 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208] helo=ip-10-0-29-170.ec2.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khTH1-0001hp-4l; Tue, 24 Nov 2020 08:02:03 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 02/23] libxl: make libxl__device_list() work correctly for LIBXL__DEVICE_KIND_PCI...
Date: Tue, 24 Nov 2020 08:01:38 +0000
Message-Id: <20201124080159.11912-3-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201124080159.11912-1-paul@xen.org>
References: <20201124080159.11912-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

... devices.

Currently there is an assumption built into libxl__device_list() that device
backends are fully enumarated under the '/libxl' path in xenstore. This is
not the case for PCI backend devices, which are only properly enumerated
under '/local/domain/0/backend'.

This patch adds a new get_path() method to libxl__device_type to allow a
backend implementation (such as PCI) to specify the xenstore path where
devices are enumerated and modifies libxl__device_list() to use this method
if it is available. Also, if the get_num() method is defined then the
from_xenstore() method expects to be passed the backend path without the device
number concatenated, so this issue is also rectified.

Having made libxl__device_list() work correctly, this patch removes the
open-coded libxl_pci_device_pci_list() in favour of an evaluation of the
LIBXL_DEFINE_DEVICE_LIST() macro. This has the side-effect of also defining
libxl_pci_device_pci_list_free() which will be used in subsequent patches.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v3:
 - New in v3 (replacing "libxl: use LIBXL_DEFINE_DEVICE_LIST for pci devices")
---
 tools/include/libxl.h             |  7 +++++
 tools/libs/light/libxl_device.c   | 66 +++++++++++++++++++++------------------
 tools/libs/light/libxl_internal.h |  2 ++
 tools/libs/light/libxl_pci.c      | 29 +++++------------
 4 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index fbe4c81ba5..ee52d3cf7e 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -452,6 +452,12 @@
 #define LIBXL_HAVE_CONFIG_PCIS 1
 
 /*
+ * LIBXL_HAVE_DEVICE_PCI_LIST_FREE indicates that the
+ * libxl_device_pci_list_free() function is defined.
+ */
+#define LIBXL_HAVE_DEVICE_PCI_LIST_FREE 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
@@ -2321,6 +2327,7 @@ int libxl_device_pci_destroy(libxl_ctx *ctx, uint32_t domid,
 
 libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
                                         int *num);
+void libxl_device_pci_list_free(libxl_device_pci* list, int num);
 
 /*
  * Turns the current process into a backend device service daemon
diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index e081faf9a9..ac173a043d 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -2011,7 +2011,7 @@ void *libxl__device_list(libxl__gc *gc, const libxl__device_type *dt,
     void *r = NULL;
     void *list = NULL;
     void *item = NULL;
-    char *libxl_path;
+    char *path;
     char **dir = NULL;
     unsigned int ndirs = 0;
     unsigned int ndevs = 0;
@@ -2019,42 +2019,46 @@ void *libxl__device_list(libxl__gc *gc, const libxl__device_type *dt,
 
     *num = 0;
 
-    libxl_path = GCSPRINTF("%s/device/%s",
-                           libxl__xs_libxl_path(gc, domid),
-                           libxl__device_kind_to_string(dt->type));
-
-    dir = libxl__xs_directory(gc, XBT_NULL, libxl_path, &ndirs);
+    if (dt->get_path) {
+        rc = dt->get_path(gc, domid, &path);
+        if (rc) goto out;
+    } else {
+        path = GCSPRINTF("%s/device/%s",
+                         libxl__xs_libxl_path(gc, domid),
+                         libxl__device_kind_to_string(dt->type));
+    }
 
-    if (dir && ndirs) {
-        if (dt->get_num) {
-            if (ndirs != 1) {
-                LOGD(ERROR, domid, "multiple entries in %s\n", libxl_path);
-                rc = ERROR_FAIL;
-                goto out;
-            }
-            rc = dt->get_num(gc, GCSPRINTF("%s/%s", libxl_path, *dir), &ndevs);
-            if (rc) goto out;
-        } else {
+    if (dt->get_num) {
+        rc = dt->get_num(gc, path, &ndevs);
+        if (rc) goto out;
+    } else {
+        dir = libxl__xs_directory(gc, XBT_NULL, path, &ndirs);
+        if (dir && ndirs)
             ndevs = ndirs;
-        }
-        list = libxl__malloc(NOGC, dt->dev_elem_size * ndevs);
-        item = list;
+    }
 
-        while (*num < ndevs) {
-            dt->init(item);
+    if (!ndevs)
+        return NULL;
 
-            if (dt->from_xenstore) {
-                int nr = dt->get_num ? *num : atoi(*dir);
-                char *device_libxl_path = GCSPRINTF("%s/%s", libxl_path, *dir);
-                rc = dt->from_xenstore(gc, device_libxl_path, nr, item);
-                if (rc) goto out;
-            }
+    list = libxl__malloc(NOGC, dt->dev_elem_size * ndevs);
+    item = list;
 
-            item = (uint8_t *)item + dt->dev_elem_size;
-            ++(*num);
-            if (!dt->get_num)
-                ++dir;
+    while (*num < ndevs) {
+        dt->init(item);
+
+        if (dt->from_xenstore) {
+            int nr = dt->get_num ? *num : atoi(*dir);
+            char *device_path = dt->get_num ? path :
+                GCSPRINTF("%s/%d", path, nr);
+
+            rc = dt->from_xenstore(gc, device_path, nr, item);
+            if (rc) goto out;
         }
+
+        item = (uint8_t *)item + dt->dev_elem_size;
+        ++(*num);
+        if (!dt->get_num)
+            ++dir;
     }
 
     r = list;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 3e70ff639b..ecee61b541 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -3917,6 +3917,7 @@ typedef int (*device_dm_needed_fn_t)(void *, unsigned);
 typedef void (*device_update_config_fn_t)(libxl__gc *, void *, void *);
 typedef int (*device_update_devid_fn_t)(libxl__gc *, uint32_t, void *);
 typedef int (*device_get_num_fn_t)(libxl__gc *, const char *, unsigned int *);
+typedef int (*device_get_path_fn_t)(libxl__gc *, uint32_t, char **);
 typedef int (*device_from_xenstore_fn_t)(libxl__gc *, const char *,
                                          libxl_devid, void *);
 typedef int (*device_set_xenstore_config_fn_t)(libxl__gc *, uint32_t, void *,
@@ -3941,6 +3942,7 @@ struct libxl__device_type {
     device_update_config_fn_t       update_config;
     device_update_devid_fn_t        update_devid;
     device_get_num_fn_t             get_num;
+    device_get_path_fn_t            get_path;
     device_from_xenstore_fn_t       from_xenstore;
     device_set_xenstore_config_fn_t set_xenstore_config;
 };
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 2ff1c64a31..9d44b28f0a 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -2393,29 +2393,13 @@ static int libxl__device_pci_get_num(libxl__gc *gc, const char *be_path,
     return rc;
 }
 
-libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid, int *num)
+static int libxl__device_pci_get_path(libxl__gc *gc, uint32_t domid,
+                                      char **path)
 {
-    GC_INIT(ctx);
-    char *be_path;
-    unsigned int n, i;
-    libxl_device_pci *pcis = NULL;
-
-    *num = 0;
-
-    be_path = libxl__domain_device_backend_path(gc, 0, domid, 0,
-                                                LIBXL__DEVICE_KIND_PCI);
-    if (libxl__device_pci_get_num(gc, be_path, &n))
-        goto out;
+    *path = libxl__domain_device_backend_path(gc, 0, domid, 0,
+                                              LIBXL__DEVICE_KIND_PCI);
 
-    pcis = calloc(n, sizeof(libxl_device_pci));
-
-    for (i = 0; i < n; i++)
-        libxl__device_pci_from_xs_be(gc, be_path, i, pcis + i);
-
-    *num = n;
-out:
-    GC_FREE;
-    return pcis;
+    return 0;
 }
 
 void libxl__device_pci_destroy_all(libxl__egc *egc, uint32_t domid,
@@ -2492,10 +2476,13 @@ static int libxl_device_pci_compare(const libxl_device_pci *d1,
     return COMPARE_PCI(d1, d2);
 }
 
+LIBXL_DEFINE_DEVICE_LIST(pci)
+
 #define libxl__device_pci_update_devid NULL
 
 DEFINE_DEVICE_TYPE_STRUCT(pci, PCI,
     .get_num = libxl__device_pci_get_num,
+    .get_path = libxl__device_pci_get_path,
     .from_xenstore = libxl__device_pci_from_xs_be,
 );
 
-- 
2.11.0


