Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32C12ADDA6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 19:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23676.50671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXxF-00068G-GF; Tue, 10 Nov 2020 18:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23676.50671; Tue, 10 Nov 2020 18:01:17 +0000
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
	id 1kcXxF-000676-67; Tue, 10 Nov 2020 18:01:17 +0000
Received: by outflank-mailman (input) for mailman id 23676;
 Tue, 10 Nov 2020 18:01:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kcXxD-00059T-JR
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:01:15 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea4fa62f-4a96-41f1-825d-1f2284041132;
 Tue, 10 Nov 2020 18:00:44 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXwh-0006qV-21; Tue, 10 Nov 2020 18:00:43 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXoP-0007RC-Gp; Tue, 10 Nov 2020 17:52:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kcXxD-00059T-JR
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:01:15 +0000
X-Inumbo-ID: ea4fa62f-4a96-41f1-825d-1f2284041132
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ea4fa62f-4a96-41f1-825d-1f2284041132;
	Tue, 10 Nov 2020 18:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=nxLu3+VFZvHeARLYl8MQlR0efkG/dxOmK0XHYLg8RvM=; b=nOiZtMJT8iqRpG/1gSL2eNYbTG
	EykmOXMWPkVswa6gxJyVfydmPxH9mQt2CMLblgysHrYPK/1ot97b/RDzaOv7JMtJN+3lnvvAe0yCo
	XnC8HuhqUwx0a6OONWE4cOplzkes4woUFNvkZZjcchXEqAwRCBOGpbE8JvE19L4b7zOI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXwh-0006qV-21; Tue, 10 Nov 2020 18:00:43 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXoP-0007RC-Gp; Tue, 10 Nov 2020 17:52:09 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 20/24] libxl: modify libxl_device_pci_assignable_add/remove/list/list_free()...
Date: Tue, 10 Nov 2020 17:51:43 +0000
Message-Id: <20201110175147.7067-21-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110175147.7067-1-paul@xen.org>
References: <20201110175147.7067-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... to use 'libxl_pci_bdf' rather than 'libxl_device_pci'.

This patch modifies the API and callers accordingly. It also modifies
several internal functions in libxl_pci.c that support the API to also use
'libxl_pci_bdf'.

NOTE: The OCaml bindings are adjusted to contain the interface change. It
      should therefore not affect compatibility with OCaml-based utilities.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: David Scott <dave@recoil.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/include/libxl.h                |  15 +-
 tools/libs/light/libxl_pci.c         | 215 +++++++++++++++------------
 tools/ocaml/libs/xl/xenlight_stubs.c |  15 +-
 tools/xl/xl_pci.c                    |  32 ++--
 4 files changed, 157 insertions(+), 120 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 5edacccbd1da..5703fdf367c5 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -469,6 +469,13 @@
  */
 #define LIBXL_HAVE_PCI_BDF 1
 
+/*
+ * LIBXL_HAVE_PCI_ASSIGNABLE_BDF indicates that the
+ * libxl_device_pci_assignable_add/remove/list/list_free() functions all
+ * use the 'libxl_pci_bdf' type rather than 'libxl_device_pci' type.
+ */
+#define LIBXL_HAVE_PCI_ASSIGNABLE_BDF 1
+
 /*
  * libxl ABI compatibility
  *
@@ -2378,10 +2385,10 @@ int libxl_device_events_handler(libxl_ctx *ctx,
  * added or is not bound, the functions will emit a warning but return
  * SUCCESS.
  */
-int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
-int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
-libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);
-void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num);
+int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_pci_bdf *pcibdf, int rebind);
+int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_pci_bdf *pcibdf, int rebind);
+libxl_pci_bdf *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);
+void libxl_device_pci_assignable_list_free(libxl_pci_bdf *list, int num);
 
 /* CPUID handling */
 int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str);
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 382c10674313..d436e0a42b0c 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -25,26 +25,33 @@
 #define PCI_BDF_XSPATH         "%04x-%02x-%02x-%01x"
 #define PCI_PT_QDEV_ID         "pci-pt-%02x_%02x.%01x"
 
-static unsigned int pci_encode_bdf(libxl_device_pci *pci)
+static unsigned int pci_encode_bdf(libxl_pci_bdf *pcibdf)
 {
     unsigned int value;
 
-    value = pci->bdf.domain << 16;
-    value |= (pci->bdf.bus & 0xff) << 8;
-    value |= (pci->bdf.dev & 0x1f) << 3;
-    value |= (pci->bdf.func & 0x7);
+    value = pcibdf->domain << 16;
+    value |= (pcibdf->bus & 0xff) << 8;
+    value |= (pcibdf->dev & 0x1f) << 3;
+    value |= (pcibdf->func & 0x7);
 
     return value;
 }
 
+static void pcibdf_struct_fill(libxl_pci_bdf *pcibdf, unsigned int domain,
+                               unsigned int bus, unsigned int dev,
+                               unsigned int func)
+{
+    pcibdf->domain = domain;
+    pcibdf->bus = bus;
+    pcibdf->dev = dev;
+    pcibdf->func = func;
+}
+
 static void pci_struct_fill(libxl_device_pci *pci, unsigned int domain,
                             unsigned int bus, unsigned int dev,
                             unsigned int func, unsigned int vdevfn)
 {
-    pci->bdf.domain = domain;
-    pci->bdf.bus = bus;
-    pci->bdf.dev = dev;
-    pci->bdf.func = func;
+    pcibdf_struct_fill(&pci->bdf, domain, bus, dev, func);
     pci->vdevfn = vdevfn;
 }
 
@@ -318,8 +325,8 @@ static bool is_pci_in_array(libxl_device_pci *pcis, int num,
 }
 
 /* Write the standard BDF into the sysfs path given by sysfs_path. */
-static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
-                           libxl_device_pci *pci)
+static int sysfs_write_bdf(libxl__gc *gc, const char *sysfs_path,
+                           libxl_pci_bdf *pcibdf)
 {
     int rc, fd;
     char *buf;
@@ -330,8 +337,8 @@ static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
         return ERROR_FAIL;
     }
 
-    buf = GCSPRINTF(PCI_BDF, pci->bdf.domain, pci->bdf.bus,
-                    pci->bdf.dev, pci->bdf.func);
+    buf = GCSPRINTF(PCI_BDF, pcibdf->domain, pcibdf->bus,
+                    pcibdf->dev, pcibdf->func);
     rc = write(fd, buf, strlen(buf));
     /* Annoying to have two if's, but we need the errno */
     if (rc < 0)
@@ -346,22 +353,22 @@ static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
 
 #define PCI_INFO_PATH "/libxl/pci"
 
-static char *pci_info_xs_path(libxl__gc *gc, libxl_device_pci *pci,
+static char *pci_info_xs_path(libxl__gc *gc, libxl_pci_bdf *pcibdf,
                               const char *node)
 {
     return node ?
         GCSPRINTF(PCI_INFO_PATH"/"PCI_BDF_XSPATH"/%s",
-                  pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func,
+                  pcibdf->domain, pcibdf->bus, pcibdf->dev, pcibdf->func,
                   node) :
         GCSPRINTF(PCI_INFO_PATH"/"PCI_BDF_XSPATH,
-                  pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
+                  pcibdf->domain, pcibdf->bus, pcibdf->dev, pcibdf->func);
 }
 
 
-static int pci_info_xs_write(libxl__gc *gc, libxl_device_pci *pci,
+static int pci_info_xs_write(libxl__gc *gc, libxl_pci_bdf *pcibdf,
                               const char *node, const char *val)
 {
-    char *path = pci_info_xs_path(gc, pci, node);
+    char *path = pci_info_xs_path(gc, pcibdf, node);
     int rc = libxl__xs_printf(gc, XBT_NULL, path, "%s", val);
 
     if (rc) LOGE(WARN, "Write of %s to node %s failed.", val, path);
@@ -369,28 +376,28 @@ static int pci_info_xs_write(libxl__gc *gc, libxl_device_pci *pci,
     return rc;
 }
 
-static char *pci_info_xs_read(libxl__gc *gc, libxl_device_pci *pci,
+static char *pci_info_xs_read(libxl__gc *gc, libxl_pci_bdf *pcibdf,
                               const char *node)
 {
-    char *path = pci_info_xs_path(gc, pci, node);
+    char *path = pci_info_xs_path(gc, pcibdf, node);
 
     return libxl__xs_read(gc, XBT_NULL, path);
 }
 
-static void pci_info_xs_remove(libxl__gc *gc, libxl_device_pci *pci,
+static void pci_info_xs_remove(libxl__gc *gc, libxl_pci_bdf *pcibdf,
                                const char *node)
 {
-    char *path = pci_info_xs_path(gc, pci, node);
+    char *path = pci_info_xs_path(gc, pcibdf, node);
     libxl_ctx *ctx = libxl__gc_owner(gc);
 
     /* Remove the xenstore entry */
     xs_rm(ctx->xsh, XBT_NULL, path);
 }
 
-libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
+libxl_pci_bdf *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
 {
     GC_INIT(ctx);
-    libxl_device_pci *pcis = NULL, *new;
+    libxl_pci_bdf *pcibdfs = NULL, *new;
     struct dirent *de;
     DIR *dir;
 
@@ -411,15 +418,15 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
         if (sscanf(de->d_name, PCI_BDF, &dom, &bus, &dev, &func) != 4)
             continue;
 
-        new = realloc(pcis, ((*num) + 1) * sizeof(*new));
+        new = realloc(pcibdfs, ((*num) + 1) * sizeof(*new));
         if (NULL == new)
             continue;
 
-        pcis = new;
-        new = pcis + *num;
+        pcibdfs = new;
+        new = pcibdfs + *num;
 
-        libxl_device_pci_init(new);
-        pci_struct_fill(new, dom, bus, dev, func, 0);
+        libxl_pci_bdf_init(new);
+        pcibdf_struct_fill(new, dom, bus, dev, func);
 
         if (pci_info_xs_read(gc, new, "domid")) /* already assigned */
             continue;
@@ -430,32 +437,32 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
     closedir(dir);
 out:
     GC_FREE;
-    return pcis;
+    return pcibdfs;
 }
 
-void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num)
+void libxl_device_pci_assignable_list_free(libxl_pci_bdf *list, int num)
 {
     int i;
 
     for (i = 0; i < num; i++)
-        libxl_device_pci_dispose(&list[i]);
+        libxl_pci_bdf_dispose(&list[i]);
 
     free(list);
 }
 
 /* Unbind device from its current driver, if any.  If driver_path is non-NULL,
  * store the path to the original driver in it. */
-static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pci,
+static int sysfs_dev_unbind(libxl__gc *gc, libxl_pci_bdf *pcibdf,
                             char **driver_path)
 {
     char * spath, *dp = NULL;
     struct stat st;
 
     spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/driver",
-                           pci->bdf.domain,
-                           pci->bdf.bus,
-                           pci->bdf.dev,
-                           pci->bdf.func);
+                           pcibdf->domain,
+                           pcibdf->bus,
+                           pcibdf->dev,
+                           pcibdf->func);
     if ( !lstat(spath, &st) ) {
         /* Find the canonical path to the driver. */
         dp = libxl__zalloc(gc, PATH_MAX);
@@ -469,7 +476,7 @@ static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pci,
 
         /* Unbind from the old driver */
         spath = GCSPRINTF("%s/unbind", dp);
-        if ( sysfs_write_bdf(gc, spath, pci) < 0 ) {
+        if ( sysfs_write_bdf(gc, spath, pcibdf) < 0 ) {
             LOGE(ERROR, "Couldn't unbind device");
             return -1;
         }
@@ -607,8 +614,8 @@ bool libxl__is_igd_vga_passthru(libxl__gc *gc,
  * already exist.
  */
 
-/* Scan through /sys/.../pciback/slots looking for pci's BDF */
-static int pciback_dev_has_slot(libxl__gc *gc, libxl_device_pci *pci)
+/* Scan through /sys/.../pciback/slots looking for BDF */
+static int pciback_dev_has_slot(libxl__gc *gc, libxl_pci_bdf *pcibdf)
 {
     FILE *f;
     int rc = 0;
@@ -621,11 +628,11 @@ static int pciback_dev_has_slot(libxl__gc *gc, libxl_device_pci *pci)
         return ERROR_FAIL;
     }
 
-    while (fscanf(f, "%x:%x:%x.%d\n", &dom, &bus, &dev, &func)==4) {
-        if (dom == pci->bdf.domain
-            && bus == pci->bdf.bus
-            && dev == pci->bdf.dev
-            && func == pci->bdf.func) {
+    while (fscanf(f, "%x:%x:%x.%d\n", &dom, &bus, &dev, &func) == 4) {
+        if (dom == pcibdf->domain
+           && bus == pcibdf->bus
+           && dev == pcibdf->dev
+           && func == pcibdf->func) {
             rc = 1;
             goto out;
         }
@@ -635,7 +642,7 @@ out:
     return rc;
 }
 
-static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
+static int pciback_dev_is_assigned(libxl__gc *gc, libxl_pci_bdf *pcibdf)
 {
     char * spath;
     int rc;
@@ -651,8 +658,8 @@ static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
     }
 
     spath = GCSPRINTF(SYSFS_PCIBACK_DRIVER"/"PCI_BDF,
-                      pci->bdf.domain, pci->bdf.bus,
-                      pci->bdf.dev, pci->bdf.func);
+                      pcibdf->domain, pcibdf->bus,
+                      pcibdf->dev, pcibdf->func);
     rc = lstat(spath, &st);
 
     if( rc == 0 )
@@ -663,40 +670,40 @@ static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
     return -1;
 }
 
-static int pciback_dev_assign(libxl__gc *gc, libxl_device_pci *pci)
+static int pciback_dev_assign(libxl__gc *gc, libxl_pci_bdf *pcibdf)
 {
     int rc;
 
-    if ( (rc = pciback_dev_has_slot(gc, pci)) < 0 ) {
+    if ( (rc = pciback_dev_has_slot(gc, pcibdf)) < 0 ) {
         LOGE(ERROR, "Error checking for pciback slot");
         return ERROR_FAIL;
     } else if (rc == 0) {
         if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/new_slot",
-                             pci) < 0 ) {
+                             pcibdf) < 0 ) {
             LOGE(ERROR, "Couldn't bind device to pciback!");
             return ERROR_FAIL;
         }
     }
 
-    if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/bind", pci) < 0 ) {
+    if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/bind", pcibdf) < 0 ) {
         LOGE(ERROR, "Couldn't bind device to pciback!");
         return ERROR_FAIL;
     }
     return 0;
 }
 
-static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pci)
+static int pciback_dev_unassign(libxl__gc *gc, libxl_pci_bdf *pcibdf)
 {
     /* Remove from pciback */
-    if ( sysfs_dev_unbind(gc, pci, NULL) < 0 ) {
+    if ( sysfs_dev_unbind(gc, pcibdf, NULL) < 0 ) {
         LOG(ERROR, "Couldn't unbind device!");
         return ERROR_FAIL;
     }
 
     /* Remove slot if necessary */
-    if ( pciback_dev_has_slot(gc, pci) > 0 ) {
+    if ( pciback_dev_has_slot(gc, pcibdf) > 0 ) {
         if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/remove_slot",
-                             pci) < 0 ) {
+                             pcibdf) < 0 ) {
             LOGE(ERROR, "Couldn't remove pciback slot");
             return ERROR_FAIL;
         }
@@ -705,7 +712,7 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pci)
 }
 
 static int libxl__device_pci_assignable_add(libxl__gc *gc,
-                                            libxl_device_pci *pci,
+                                            libxl_pci_bdf *pcibdf,
                                             int rebind)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
@@ -715,10 +722,10 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     struct stat st;
 
     /* Local copy for convenience */
-    dom = pci->bdf.domain;
-    bus = pci->bdf.bus;
-    dev = pci->bdf.dev;
-    func = pci->bdf.func;
+    dom = pcibdf->domain;
+    bus = pcibdf->bus;
+    dev = pcibdf->dev;
+    func = pcibdf->func;
 
     /* See if the device exists */
     spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF, dom, bus, dev, func);
@@ -728,7 +735,7 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     }
 
     /* Check to see if it's already assigned to pciback */
-    rc = pciback_dev_is_assigned(gc, pci);
+    rc = pciback_dev_is_assigned(gc, pcibdf);
     if ( rc < 0 ) {
         return ERROR_FAIL;
     }
@@ -738,7 +745,7 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     }
 
     /* Check to see if there's already a driver that we need to unbind from */
-    if ( sysfs_dev_unbind(gc, pci, &driver_path ) ) {
+    if ( sysfs_dev_unbind(gc, pcibdf, &driver_path ) ) {
         LOG(ERROR, "Couldn't unbind "PCI_BDF" from driver",
             dom, bus, dev, func);
         return ERROR_FAIL;
@@ -747,9 +754,9 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     /* Store driver_path for rebinding to dom0 */
     if ( rebind ) {
         if ( driver_path ) {
-            pci_info_xs_write(gc, pci, "driver_path", driver_path);
+            pci_info_xs_write(gc, pcibdf, "driver_path", driver_path);
         } else if ( (driver_path =
-                     pci_info_xs_read(gc, pci, "driver_path")) != NULL ) {
+                     pci_info_xs_read(gc, pcibdf, "driver_path")) != NULL ) {
             LOG(INFO, PCI_BDF" not bound to a driver, will be rebound to %s",
                 dom, bus, dev, func, driver_path);
         } else {
@@ -757,10 +764,10 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
                 dom, bus, dev, func);
         }
     } else {
-        pci_info_xs_remove(gc, pci, "driver_path");
+        pci_info_xs_remove(gc, pcibdf, "driver_path");
     }
 
-    if ( pciback_dev_assign(gc, pci) ) {
+    if ( pciback_dev_assign(gc, pcibdf) ) {
         LOG(ERROR, "Couldn't bind device to pciback!");
         return ERROR_FAIL;
     }
@@ -771,7 +778,7 @@ quarantine:
      * so always pass XEN_DOMCTL_DEV_RDM_RELAXED to avoid assignment being
      * unnecessarily denied.
      */
-    rc = xc_assign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pci),
+    rc = xc_assign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pcibdf),
                           XEN_DOMCTL_DEV_RDM_RELAXED);
     if ( rc < 0 ) {
         LOG(ERROR, "failed to quarantine "PCI_BDF, dom, bus, dev, func);
@@ -782,7 +789,7 @@ quarantine:
 }
 
 static int libxl__device_pci_assignable_remove(libxl__gc *gc,
-                                               libxl_device_pci *pci,
+                                               libxl_pci_bdf *pcibdf,
                                                int rebind)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
@@ -790,24 +797,24 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
     char *driver_path;
 
     /* De-quarantine */
-    rc = xc_deassign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pci));
+    rc = xc_deassign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pcibdf));
     if ( rc < 0 ) {
-        LOG(ERROR, "failed to de-quarantine "PCI_BDF, pci->bdf.domain, pci->bdf.bus,
-            pci->bdf.dev, pci->bdf.func);
+        LOG(ERROR, "failed to de-quarantine "PCI_BDF, pcibdf->domain,
+            pcibdf->bus, pcibdf->dev, pcibdf->func);
         return ERROR_FAIL;
     }
 
     /* Unbind from pciback */
-    if ( (rc = pciback_dev_is_assigned(gc, pci)) < 0 ) {
+    if ( (rc = pciback_dev_is_assigned(gc, pcibdf)) < 0 ) {
         return ERROR_FAIL;
     } else if ( rc ) {
-        pciback_dev_unassign(gc, pci);
+        pciback_dev_unassign(gc, pcibdf);
     } else {
         LOG(WARN, "Not bound to pciback");
     }
 
     /* Rebind if necessary */
-    driver_path = pci_info_xs_read(gc, pci, "driver_path");
+    driver_path = pci_info_xs_read(gc, pcibdf, "driver_path");
 
     if ( driver_path ) {
         if ( rebind ) {
@@ -815,12 +822,12 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
 
             if ( sysfs_write_bdf(gc,
                                  GCSPRINTF("%s/bind", driver_path),
-                                 pci) < 0 ) {
+                                 pcibdf) < 0 ) {
                 LOGE(ERROR, "Couldn't bind device to %s", driver_path);
                 return -1;
             }
 
-            pci_info_xs_remove(gc, pci, "driver_path");
+            pci_info_xs_remove(gc, pcibdf, "driver_path");
         }
     } else {
         if ( rebind ) {
@@ -832,26 +839,26 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
     return 0;
 }
 
-int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci,
+int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_pci_bdf *pcibdf,
                                     int rebind)
 {
     GC_INIT(ctx);
     int rc;
 
-    rc = libxl__device_pci_assignable_add(gc, pci, rebind);
+    rc = libxl__device_pci_assignable_add(gc, pcibdf, rebind);
 
     GC_FREE;
     return rc;
 }
 
 
-int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci,
+int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_pci_bdf *pcibdf,
                                        int rebind)
 {
     GC_INIT(ctx);
     int rc;
 
-    rc = libxl__device_pci_assignable_remove(gc, pci, rebind);
+    rc = libxl__device_pci_assignable_remove(gc, pcibdf, rebind);
 
     GC_FREE;
     return rc;
@@ -1353,7 +1360,7 @@ static void pci_add_dm_done(libxl__egc *egc,
     /* Don't restrict writes to the PCI config space from this VM */
     if (pci->permissive) {
         if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/permissive",
-                             pci) < 0 ) {
+                             &pci->bdf) < 0 ) {
             LOGD(ERROR, domainid, "Setting permissive for device");
             rc = ERROR_FAIL;
             goto out;
@@ -1369,7 +1376,8 @@ out_no_irq:
             rc = ERROR_FAIL;
             goto out;
         }
-        r = xc_assign_device(ctx->xch, domid, pci_encode_bdf(pci), flag);
+        r = xc_assign_device(ctx->xch, domid, pci_encode_bdf(&pci->bdf),
+                             flag);
         if (r < 0 && (hvm || errno != ENOSYS)) {
             LOGED(ERROR, domainid, "xc_assign_device failed");
             rc = ERROR_FAIL;
@@ -1448,15 +1456,28 @@ int libxl_device_pci_add(libxl_ctx *ctx, uint32_t domid,
     return AO_INPROGRESS;
 }
 
-static bool libxl_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
+static int is_bdf_in_array(libxl_pci_bdf *pcibdfs, int num,
+                           libxl_pci_bdf *pcibdf)
 {
-    libxl_device_pci *pcis;
+    int i;
+
+    for(i = 0; i < num; i++) {
+        if (COMPARE_BDF(pcibdf, &pcibdfs[i]))
+            break;
+    }
+
+    return i < num;
+}
+
+static bool is_bdf_assignable(libxl_ctx *ctx, libxl_pci_bdf *pcibdf)
+{
+    libxl_pci_bdf *pcibdfs;
     int num;
     bool assignable;
 
-    pcis = libxl_device_pci_assignable_list(ctx, &num);
-    assignable = is_pci_in_array(pcis, num, pci);
-    libxl_device_pci_assignable_list_free(pcis, num);
+    pcibdfs = libxl_device_pci_assignable_list(ctx, &num);
+    assignable = is_bdf_in_array(pcibdfs, num, pcibdf);
+    libxl_device_pci_assignable_list_free(pcibdfs, num);
 
     return assignable;
 }
@@ -1491,7 +1512,8 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     pas->callback = device_pci_add_stubdom_done;
 
     if (libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
-        rc = xc_test_assign_device(ctx->xch, domid, pci_encode_bdf(pci));
+        rc = xc_test_assign_device(ctx->xch, domid,
+                                   pci_encode_bdf(&pci->bdf));
         if (rc) {
             LOGD(ERROR, domid,
                  "PCI device %04x:%02x:%02x.%u %s?",
@@ -1505,20 +1527,20 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     rc = libxl__device_pci_setdefault(gc, domid, pci, !starting);
     if (rc) goto out;
 
-    if (pci->seize && !pciback_dev_is_assigned(gc, pci)) {
-        rc = libxl__device_pci_assignable_add(gc, pci, 1);
+    if (pci->seize && !pciback_dev_is_assigned(gc, &pci->bdf)) {
+        rc = libxl__device_pci_assignable_add(gc, &pci->bdf, 1);
         if ( rc )
             goto out;
     }
 
-    if (!libxl_pci_assignable(ctx, pci)) {
+    if (!is_bdf_assignable(ctx, &pci->bdf)) {
         LOGD(ERROR, domid, "PCI device %x:%x:%x.%x is not assignable",
              pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
         rc = ERROR_FAIL;
         goto out;
     }
 
-    rc = pci_info_xs_write(gc, pci, "domid", GCSPRINTF("%u", domid));
+    rc = pci_info_xs_write(gc, &pci->bdf, "domid", GCSPRINTF("%u", domid));
     if (rc) goto out;
 
     libxl__device_pci_reset(gc, pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func);
@@ -1642,7 +1664,7 @@ static void device_pci_add_done(libxl__egc *egc,
              "PCI device %x:%x:%x.%x (rc %d)",
              pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func,
              rc);
-        pci_info_xs_remove(gc, pci, "domid");
+        pci_info_xs_remove(gc, &pci->bdf, "domid");
     }
     libxl_device_pci_dispose(pci);
     aodev->rc = rc;
@@ -2082,7 +2104,8 @@ static void pci_remove_detached(libxl__egc *egc,
     }
 
     if (!isstubdom) {
-        rc = xc_deassign_device(CTX->xch, domid, pci_encode_bdf(pci));
+        rc = xc_deassign_device(CTX->xch, domid,
+                                pci_encode_bdf(&pci->bdf));
         if (rc < 0 && (prs->hvm || errno != ENOSYS))
             LOGED(ERROR, domainid, "xc_deassign_device failed");
     }
@@ -2211,7 +2234,7 @@ out:
     libxl__ev_time_deregister(gc, &prs->timeout);
     libxl__ev_time_deregister(gc, &prs->retry_timer);
 
-    if (!rc) pci_info_xs_remove(gc, pci, "domid");
+    if (!rc) pci_info_xs_remove(gc, &pci->bdf, "domid");
 
     libxl_device_pci_dispose(pci);
     aodev->rc = rc;
diff --git a/tools/ocaml/libs/xl/xenlight_stubs.c b/tools/ocaml/libs/xl/xenlight_stubs.c
index 352a00134d70..2388f238697c 100644
--- a/tools/ocaml/libs/xl/xenlight_stubs.c
+++ b/tools/ocaml/libs/xl/xenlight_stubs.c
@@ -840,7 +840,7 @@ value stub_xl_device_pci_assignable_add(value ctx, value info, value rebind)
 	device_pci_val(CTX, &c_info, info);
 
 	caml_enter_blocking_section();
-	ret = libxl_device_pci_assignable_add(CTX, &c_info, c_rebind);
+	ret = libxl_device_pci_assignable_add(CTX, &c_info.bdf, c_rebind);
 	caml_leave_blocking_section();
 
 	libxl_device_pci_dispose(&c_info);
@@ -861,7 +861,7 @@ value stub_xl_device_pci_assignable_remove(value ctx, value info, value rebind)
 	device_pci_val(CTX, &c_info, info);
 
 	caml_enter_blocking_section();
-	ret = libxl_device_pci_assignable_remove(CTX, &c_info, c_rebind);
+	ret = libxl_device_pci_assignable_remove(CTX, &c_info.bdf, c_rebind);
 	caml_leave_blocking_section();
 
 	libxl_device_pci_dispose(&c_info);
@@ -876,7 +876,7 @@ value stub_xl_device_pci_assignable_list(value ctx)
 {
 	CAMLparam1(ctx);
 	CAMLlocal2(list, temp);
-	libxl_device_pci *c_list;
+	libxl_pci_bdf *c_list;
 	int i, nb;
 	uint32_t c_domid;
 
@@ -889,11 +889,18 @@ value stub_xl_device_pci_assignable_list(value ctx)
 
 	list = temp = Val_emptylist;
 	for (i = 0; i < nb; i++) {
+		libxl_device_pci pci;
+
+		libxl_device_pci_init(&pci);
+		libxl_pci_bdf_copy(CTX, &pci.bdf, &c_list[i]);
+
 		list = caml_alloc_small(2, Tag_cons);
 		Field(list, 0) = Val_int(0);
 		Field(list, 1) = temp;
 		temp = list;
-		Store_field(list, 0, Val_device_pci(&c_list[i]));
+		Store_field(list, 0, Val_device_pci(&pci));
+
+		libxl_device_pci_dispose(&pci);
 	}
 	libxl_device_pci_assignable_list_free(c_list, nb);
 
diff --git a/tools/xl/xl_pci.c b/tools/xl/xl_pci.c
index 9c24496cb2dd..37708b4eb14d 100644
--- a/tools/xl/xl_pci.c
+++ b/tools/xl/xl_pci.c
@@ -154,19 +154,19 @@ int main_pciattach(int argc, char **argv)
 
 static void pciassignable_list(void)
 {
-    libxl_device_pci *pcis;
+    libxl_pci_bdf *pcibdfs;
     int num, i;
 
-    pcis = libxl_device_pci_assignable_list(ctx, &num);
+    pcibdfs = libxl_device_pci_assignable_list(ctx, &num);
 
-    if ( pcis == NULL )
+    if ( pcibdfs == NULL )
         return;
     for (i = 0; i < num; i++) {
         printf("%04x:%02x:%02x.%01x\n",
-               pcis[i].bdf.domain, pcis[i].bdf.bus, pcis[i].bdf.dev,
-               pcis[i].bdf.func);
+               pcibdfs[i].domain, pcibdfs[i].bus, pcibdfs[i].dev,
+               pcibdfs[i].func);
     }
-    libxl_device_pci_assignable_list_free(pcis, num);
+    libxl_device_pci_assignable_list_free(pcibdfs, num);
 }
 
 int main_pciassignable_list(int argc, char **argv)
@@ -183,24 +183,24 @@ int main_pciassignable_list(int argc, char **argv)
 
 static int pciassignable_add(const char *bdf, int rebind)
 {
-    libxl_device_pci pci;
+    libxl_pci_bdf pcibdf;
     XLU_Config *config;
     int r = 0;
 
-    libxl_device_pci_init(&pci);
+    libxl_pci_bdf_init(&pcibdf);
 
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_init"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pci.bdf, bdf)) {
+    if (xlu_pci_parse_bdf(config, &pcibdf, bdf)) {
         fprintf(stderr, "pci-assignable-add: malformed BDF \"%s\"\n", bdf);
         exit(2);
     }
 
-    if (libxl_device_pci_assignable_add(ctx, &pci, rebind))
+    if (libxl_device_pci_assignable_add(ctx, &pcibdf, rebind))
         r = 1;
 
-    libxl_device_pci_dispose(&pci);
+    libxl_pci_bdf_dispose(&pcibdf);
     xlu_cfg_destroy(config);
 
     return r;
@@ -225,24 +225,24 @@ int main_pciassignable_add(int argc, char **argv)
 
 static int pciassignable_remove(const char *bdf, int rebind)
 {
-    libxl_device_pci pci;
+    libxl_pci_bdf pcibdf;
     XLU_Config *config;
     int r = 0;
 
-    libxl_device_pci_init(&pci);
+    libxl_pci_bdf_init(&pcibdf);
 
     config = xlu_cfg_init(stderr, "command line");
     if (!config) { perror("xlu_cfg_init"); exit(-1); }
 
-    if (xlu_pci_parse_bdf(config, &pci.bdf, bdf)) {
+    if (xlu_pci_parse_bdf(config, &pcibdf, bdf)) {
         fprintf(stderr, "pci-assignable-remove: malformed BDF \"%s\"\n", bdf);
         exit(2);
     }
 
-    if (libxl_device_pci_assignable_remove(ctx, &pci, rebind))
+    if (libxl_device_pci_assignable_remove(ctx, &pcibdf, rebind))
         r = 1;
 
-    libxl_device_pci_dispose(&pci);
+    libxl_pci_bdf_dispose(&pcibdf);
     xlu_cfg_destroy(config);
 
     return r;
-- 
2.20.1


