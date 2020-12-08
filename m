Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8912D32E8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 21:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47767.84599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAK-00053P-AF; Tue, 08 Dec 2020 20:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47767.84599; Tue, 08 Dec 2020 20:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAJ-00050u-Hi; Tue, 08 Dec 2020 20:00:51 +0000
Received: by outflank-mailman (input) for mailman id 47767;
 Tue, 08 Dec 2020 20:00:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kmjAD-0004pJ-Po
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 20:00:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmjAD-00086S-0s; Tue, 08 Dec 2020 20:00:45 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=desktop.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihP-0001p0-Rf; Tue, 08 Dec 2020 19:31:00 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=7O3jPwvmGZxkm+Vdmlru8cGpzRajsK5N4k2xBh61IQ4=; b=UJuqKLFdKWw996L4WBuLN1AqaY
	vrZMak8/LpzlO6UphBo5zcFgFAtnzb9jYMYotQ6ep48EWMDBfZ3QPtu+IlYVUE47U0XpXGNy0X3T9
	R1kYCMqar5N1zBwB9hZ0yQzn6m9MgcuwhKd0DiizMY8CNWG9Hw3n5BqlesDnGreDxkPY=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v6 21/25] libxl: convert internal functions in libxl_pci.c...
Date: Tue,  8 Dec 2020 19:30:29 +0000
Message-Id: <20201208193033.11306-22-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208193033.11306-1-paul@xen.org>
References: <20201208193033.11306-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

... to use 'libx_pci_bdf' where appropriate.

No API change.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v6:
 - New in v6 (split out from "libxl: modify libxl_device_pci_assignable_add/
   remove/list/list_free()..."
---
 tools/libs/light/libxl_pci.c | 192 +++++++++++++++++++----------------
 1 file changed, 103 insertions(+), 89 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 6b14f0f29ef8..448fe969514b 100644
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
 
@@ -350,8 +357,8 @@ static bool is_pci_in_array(libxl_device_pci *pcis, int num,
 }
 
 /* Write the standard BDF into the sysfs path given by sysfs_path. */
-static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
-                           libxl_device_pci *pci)
+static int sysfs_write_bdf(libxl__gc *gc, const char *sysfs_path,
+                           libxl_pci_bdf *pcibdf)
 {
     int rc, fd;
     char *buf;
@@ -362,8 +369,8 @@ static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
         return ERROR_FAIL;
     }
 
-    buf = GCSPRINTF(PCI_BDF, pci->bdf.domain, pci->bdf.bus,
-                    pci->bdf.dev, pci->bdf.func);
+    buf = GCSPRINTF(PCI_BDF, pcibdf->domain, pcibdf->bus,
+                    pcibdf->dev, pcibdf->func);
     rc = write(fd, buf, strlen(buf));
     /* Annoying to have two if's, but we need the errno */
     if (rc < 0)
@@ -378,22 +385,22 @@ static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
 
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
@@ -401,18 +408,18 @@ static int pci_info_xs_write(libxl__gc *gc, libxl_device_pci *pci,
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
@@ -451,9 +458,9 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
         new = pcis + *num;
 
         libxl_device_pci_init(new);
-        pci_struct_fill(new, dom, bus, dev, func, 0);
+        pcibdf_struct_fill(&new->bdf, dom, bus, dev, func);
 
-        if (pci_info_xs_read(gc, new, "domid")) /* already assigned */
+        if (pci_info_xs_read(gc, &new->bdf, "domid")) /* already assigned */
             continue;
 
         (*num)++;
@@ -477,17 +484,17 @@ void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num)
 
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
@@ -501,7 +508,7 @@ static int sysfs_dev_unbind(libxl__gc *gc, libxl_device_pci *pci,
 
         /* Unbind from the old driver */
         spath = GCSPRINTF("%s/unbind", dp);
-        if ( sysfs_write_bdf(gc, spath, pci) < 0 ) {
+        if ( sysfs_write_bdf(gc, spath, pcibdf) < 0 ) {
             LOGE(ERROR, "Couldn't unbind device");
             return -1;
         }
@@ -639,8 +646,8 @@ bool libxl__is_igd_vga_passthru(libxl__gc *gc,
  * already exist.
  */
 
-/* Scan through /sys/.../pciback/slots looking for pci's BDF */
-static int pciback_dev_has_slot(libxl__gc *gc, libxl_device_pci *pci)
+/* Scan through /sys/.../pciback/slots looking for BDF */
+static int pciback_dev_has_slot(libxl__gc *gc, libxl_pci_bdf *pcibdf)
 {
     FILE *f;
     int rc = 0;
@@ -654,10 +661,10 @@ static int pciback_dev_has_slot(libxl__gc *gc, libxl_device_pci *pci)
     }
 
     while (fscanf(f, "%x:%x:%x.%d\n", &dom, &bus, &dev, &func) == 4) {
-        if (dom == pci->bdf.domain
-            && bus == pci->bdf.bus
-            && dev == pci->bdf.dev
-            && func == pci->bdf.func) {
+        if (dom == pcibdf->domain
+            && bus == pcibdf->bus
+            && dev == pcibdf->dev
+            && func == pcibdf->func) {
             rc = 1;
             goto out;
         }
@@ -667,7 +674,7 @@ out:
     return rc;
 }
 
-static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
+static int pciback_dev_is_assigned(libxl__gc *gc, libxl_pci_bdf *pcibdf)
 {
     char * spath;
     int rc;
@@ -683,8 +690,8 @@ static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
     }
 
     spath = GCSPRINTF(SYSFS_PCIBACK_DRIVER"/"PCI_BDF,
-                      pci->bdf.domain, pci->bdf.bus,
-                      pci->bdf.dev, pci->bdf.func);
+                      pcibdf->domain, pcibdf->bus,
+                      pcibdf->dev, pcibdf->func);
     rc = lstat(spath, &st);
 
     if( rc == 0 )
@@ -695,40 +702,40 @@ static int pciback_dev_is_assigned(libxl__gc *gc, libxl_device_pci *pci)
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
@@ -736,9 +743,9 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pci)
     return 0;
 }
 
-static int libxl__device_pci_assignable_add(libxl__gc *gc,
-                                            libxl_device_pci *pci,
-                                            int rebind)
+static int libxl__pci_bdf_assignable_add(libxl__gc *gc,
+                                         libxl_pci_bdf *pcibdf,
+                                         int rebind)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
     unsigned dom, bus, dev, func;
@@ -747,10 +754,10 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
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
@@ -760,7 +767,7 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     }
 
     /* Check to see if it's already assigned to pciback */
-    rc = pciback_dev_is_assigned(gc, pci);
+    rc = pciback_dev_is_assigned(gc, pcibdf);
     if ( rc < 0 ) {
         return ERROR_FAIL;
     }
@@ -770,7 +777,7 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     }
 
     /* Check to see if there's already a driver that we need to unbind from */
-    if ( sysfs_dev_unbind(gc, pci, &driver_path ) ) {
+    if ( sysfs_dev_unbind(gc, pcibdf, &driver_path ) ) {
         LOG(ERROR, "Couldn't unbind "PCI_BDF" from driver",
             dom, bus, dev, func);
         return ERROR_FAIL;
@@ -779,9 +786,9 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
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
@@ -789,10 +796,10 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
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
@@ -803,7 +810,7 @@ quarantine:
      * so always pass XEN_DOMCTL_DEV_RDM_RELAXED to avoid assignment being
      * unnecessarily denied.
      */
-    rc = xc_assign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pci),
+    rc = xc_assign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pcibdf),
                           XEN_DOMCTL_DEV_RDM_RELAXED);
     if ( rc < 0 ) {
         LOG(ERROR, "failed to quarantine "PCI_BDF, dom, bus, dev, func);
@@ -813,33 +820,33 @@ quarantine:
     return 0;
 }
 
-static int libxl__device_pci_assignable_remove(libxl__gc *gc,
-                                               libxl_device_pci *pci,
-                                               int rebind)
+static int libxl__pci_bdf_assignable_remove(libxl__gc *gc,
+                                            libxl_pci_bdf *pcibdf,
+                                            int rebind)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
     int rc;
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
@@ -847,12 +854,12 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
 
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
@@ -870,7 +877,7 @@ int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci,
     GC_INIT(ctx);
     int rc;
 
-    rc = libxl__device_pci_assignable_add(gc, pci, rebind);
+    rc = libxl__pci_bdf_assignable_add(gc, &pci->bdf, rebind);
 
     GC_FREE;
     return rc;
@@ -883,7 +890,7 @@ int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci,
     GC_INIT(ctx);
     int rc;
 
-    rc = libxl__device_pci_assignable_remove(gc, pci, rebind);
+    rc = libxl__pci_bdf_assignable_remove(gc, &pci->bdf, rebind);
 
     GC_FREE;
     return rc;
@@ -1385,7 +1392,7 @@ static void pci_add_dm_done(libxl__egc *egc,
     /* Don't restrict writes to the PCI config space from this VM */
     if (pci->permissive) {
         if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/permissive",
-                             pci) < 0 ) {
+                             &pci->bdf) < 0 ) {
             LOGD(ERROR, domainid, "Setting permissive for device");
             rc = ERROR_FAIL;
             goto out;
@@ -1401,7 +1408,8 @@ out_no_irq:
             rc = ERROR_FAIL;
             goto out;
         }
-        r = xc_assign_device(ctx->xch, domid, pci_encode_bdf(pci), flag);
+        r = xc_assign_device(ctx->xch, domid, pci_encode_bdf(&pci->bdf),
+                             flag);
         if (r < 0 && (hvm || errno != ENOSYS)) {
             LOGED(ERROR, domainid, "xc_assign_device failed");
             rc = ERROR_FAIL;
@@ -1480,17 +1488,21 @@ int libxl_device_pci_add(libxl_ctx *ctx, uint32_t domid,
     return AO_INPROGRESS;
 }
 
-static bool libxl_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
+static bool is_bdf_assignable(libxl_ctx *ctx, libxl_pci_bdf *pcibdf)
 {
     libxl_device_pci *pcis;
-    int num;
-    bool assignable;
+    int num, i;
 
     pcis = libxl_device_pci_assignable_list(ctx, &num);
-    assignable = is_pci_in_array(pcis, num, pci);
+
+    for (i = 0; i < num; i++) {
+        if (COMPARE_BDF(pcibdf, &pcis[i].bdf))
+            break;
+    }
+
     libxl_device_pci_assignable_list_free(pcis, num);
 
-    return assignable;
+    return i < num;
 }
 
 static void device_pci_add_stubdom_wait(libxl__egc *egc,
@@ -1523,7 +1535,8 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     pas->callback = device_pci_add_stubdom_done;
 
     if (libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
-        rc = xc_test_assign_device(ctx->xch, domid, pci_encode_bdf(pci));
+        rc = xc_test_assign_device(ctx->xch, domid,
+                                   pci_encode_bdf(&pci->bdf));
         if (rc) {
             LOGD(ERROR, domid,
                  "PCI device %04x:%02x:%02x.%u %s?",
@@ -1537,20 +1550,20 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     rc = libxl__device_pci_setdefault(gc, domid, pci, !starting);
     if (rc) goto out;
 
-    if (pci->seize && !pciback_dev_is_assigned(gc, pci)) {
-        rc = libxl__device_pci_assignable_add(gc, pci, 1);
+    if (pci->seize && !pciback_dev_is_assigned(gc, &pci->bdf)) {
+        rc = libxl__pci_bdf_assignable_add(gc, &pci->bdf, 1);
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
@@ -1674,7 +1687,7 @@ static void device_pci_add_done(libxl__egc *egc,
              "PCI device %x:%x:%x.%x (rc %d)",
              pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func,
              rc);
-        pci_info_xs_remove(gc, pci, "domid");
+        pci_info_xs_remove(gc, &pci->bdf, "domid");
     }
     libxl_device_pci_dispose(pci);
     aodev->rc = rc;
@@ -2114,7 +2127,8 @@ static void pci_remove_detached(libxl__egc *egc,
     }
 
     if (!isstubdom) {
-        rc = xc_deassign_device(CTX->xch, domid, pci_encode_bdf(pci));
+        rc = xc_deassign_device(CTX->xch, domid,
+                                pci_encode_bdf(&pci->bdf));
         if (rc < 0 && (prs->hvm || errno != ENOSYS))
             LOGED(ERROR, domainid, "xc_deassign_device failed");
     }
@@ -2243,7 +2257,7 @@ out:
     libxl__ev_time_deregister(gc, &prs->timeout);
     libxl__ev_time_deregister(gc, &prs->retry_timer);
 
-    if (!rc) pci_info_xs_remove(gc, pci, "domid");
+    if (!rc) pci_info_xs_remove(gc, &pci->bdf, "domid");
 
     libxl_device_pci_dispose(pci);
     aodev->rc = rc;
-- 
2.20.1


