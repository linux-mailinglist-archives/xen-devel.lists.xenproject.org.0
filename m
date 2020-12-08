Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63082D32E3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 21:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47764.84560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAH-0004wQ-OB; Tue, 08 Dec 2020 20:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47764.84560; Tue, 08 Dec 2020 20:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAH-0004u8-9c; Tue, 08 Dec 2020 20:00:49 +0000
Received: by outflank-mailman (input) for mailman id 47764;
 Tue, 08 Dec 2020 20:00:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kmjAD-0004om-Jh
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 20:00:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmjAC-00086E-M8; Tue, 08 Dec 2020 20:00:44 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=desktop.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihG-0001p0-HU; Tue, 08 Dec 2020 19:30:50 +0000
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
	bh=mETAd4vIPWNeYGaK2+L7Uc2zER+2iOz4jTch2pcWZyo=; b=uSDziSntLinJRXwNiYTgCG14So
	58d/DJEnitRUouxI7dR/h1d0ifqQtZBZi5yJQjz8Zl+8f5m8kZ+r+vIsvNYbAHq4zvXyzQdwViLwg
	toDLCf2MCdKsMvMyfYvphnzWed9jwIhG/M9GtsISHPO1+FGCJCU7hUQs3mj3e7csqKx8=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v6 11/25] libxl: remove get_all_assigned_devices() from libxl_pci.c
Date: Tue,  8 Dec 2020 19:30:19 +0000
Message-Id: <20201208193033.11306-12-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208193033.11306-1-paul@xen.org>
References: <20201208193033.11306-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Use of this function is a very inefficient way to check whether a device
has already been assigned.

This patch adds code that saves the domain id in xenstore at the point of
assignment, and removes it again when the device id de-assigned (or the
domain is destroyed). It is then straightforward to check whether a device
has been assigned by checking whether a device has a saved domain id.

NOTE: To facilitate the xenstore check it is necessary to move the
      pci_info_xs_read() earlier in libxl_pci.c. To keep related functions
      together, the rest of the pci_info_xs_XXX() functions are moved too.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Wei Liu <wl@xen.org>
---
Cc: Ian Jackson <iwj@xenproject.org>
---
 tools/libs/light/libxl_pci.c | 149 +++++++++++++----------------------
 1 file changed, 55 insertions(+), 94 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 0c2ab5075d9f..37a6ec9eb443 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -336,50 +336,6 @@ retry_transaction2:
     return 0;
 }
 
-static int get_all_assigned_devices(libxl__gc *gc, libxl_device_pci **list, int *num)
-{
-    char **domlist;
-    unsigned int nd = 0, i;
-
-    *list = NULL;
-    *num = 0;
-
-    domlist = libxl__xs_directory(gc, XBT_NULL, "/local/domain", &nd);
-    for(i = 0; i < nd; i++) {
-        char *path, *num_devs;
-
-        path = GCSPRINTF("/local/domain/0/backend/%s/%s/0/num_devs",
-                         libxl__device_kind_to_string(LIBXL__DEVICE_KIND_PCI),
-                         domlist[i]);
-        num_devs = libxl__xs_read(gc, XBT_NULL, path);
-        if ( num_devs ) {
-            int ndev = atoi(num_devs), j;
-            char *devpath, *bdf;
-
-            for(j = 0; j < ndev; j++) {
-                devpath = GCSPRINTF("/local/domain/0/backend/%s/%s/0/dev-%u",
-                                    libxl__device_kind_to_string(LIBXL__DEVICE_KIND_PCI),
-                                    domlist[i], j);
-                bdf = libxl__xs_read(gc, XBT_NULL, devpath);
-                if ( bdf ) {
-                    unsigned dom, bus, dev, func;
-                    if ( sscanf(bdf, PCI_BDF, &dom, &bus, &dev, &func) != 4 )
-                        continue;
-
-                    *list = realloc(*list, sizeof(libxl_device_pci) * ((*num) + 1));
-                    if (*list == NULL)
-                        return ERROR_NOMEM;
-                    pci_struct_fill(*list + *num, dom, bus, dev, func, 0);
-                    (*num)++;
-                }
-            }
-        }
-    }
-    libxl__ptr_add(gc, *list);
-
-    return 0;
-}
-
 static int is_pci_in_array(libxl_device_pci *assigned, int num_assigned,
                            int dom, int bus, int dev, int func)
 {
@@ -427,19 +383,58 @@ static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
     return 0;
 }
 
+#define PCI_INFO_PATH "/libxl/pci"
+
+static char *pci_info_xs_path(libxl__gc *gc, libxl_device_pci *pci,
+                              const char *node)
+{
+    return node ?
+        GCSPRINTF(PCI_INFO_PATH"/"PCI_BDF_XSPATH"/%s",
+                  pci->domain, pci->bus, pci->dev, pci->func,
+                  node) :
+        GCSPRINTF(PCI_INFO_PATH"/"PCI_BDF_XSPATH,
+                  pci->domain, pci->bus, pci->dev, pci->func);
+}
+
+
+static int pci_info_xs_write(libxl__gc *gc, libxl_device_pci *pci,
+                              const char *node, const char *val)
+{
+    char *path = pci_info_xs_path(gc, pci, node);
+    int rc = libxl__xs_printf(gc, XBT_NULL, path, "%s", val);
+
+    if (rc) LOGE(WARN, "Write of %s to node %s failed.", val, path);
+
+    return rc;
+}
+
+static char *pci_info_xs_read(libxl__gc *gc, libxl_device_pci *pci,
+                              const char *node)
+{
+    char *path = pci_info_xs_path(gc, pci, node);
+
+    return libxl__xs_read(gc, XBT_NULL, path);
+}
+
+static void pci_info_xs_remove(libxl__gc *gc, libxl_device_pci *pci,
+                               const char *node)
+{
+    char *path = pci_info_xs_path(gc, pci, node);
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+
+    /* Remove the xenstore entry */
+    xs_rm(ctx->xsh, XBT_NULL, path);
+}
+
 libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
 {
     GC_INIT(ctx);
-    libxl_device_pci *pcis = NULL, *new, *assigned;
+    libxl_device_pci *pcis = NULL, *new;
     struct dirent *de;
     DIR *dir;
-    int r, num_assigned;
 
     *num = 0;
 
-    r = get_all_assigned_devices(gc, &assigned, &num_assigned);
-    if (r) goto out;
-
     dir = opendir(SYSFS_PCIBACK_DRIVER);
     if (NULL == dir) {
         if (errno == ENOENT) {
@@ -455,9 +450,6 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
         if (sscanf(de->d_name, PCI_BDF, &dom, &bus, &dev, &func) != 4)
             continue;
 
-        if (is_pci_in_array(assigned, num_assigned, dom, bus, dev, func))
-            continue;
-
         new = realloc(pcis, ((*num) + 1) * sizeof(*new));
         if (NULL == new)
             continue;
@@ -467,6 +459,10 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
 
         memset(new, 0, sizeof(*new));
         pci_struct_fill(new, dom, bus, dev, func, 0);
+
+        if (pci_info_xs_read(gc, new, "domid")) /* already assigned */
+            continue;
+
         (*num)++;
     }
 
@@ -737,48 +733,6 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pci)
     return 0;
 }
 
-#define PCI_INFO_PATH "/libxl/pci"
-
-static char *pci_info_xs_path(libxl__gc *gc, libxl_device_pci *pci,
-                              const char *node)
-{
-    return node ?
-        GCSPRINTF(PCI_INFO_PATH"/"PCI_BDF_XSPATH"/%s",
-                  pci->domain, pci->bus, pci->dev, pci->func,
-                  node) :
-        GCSPRINTF(PCI_INFO_PATH"/"PCI_BDF_XSPATH,
-                  pci->domain, pci->bus, pci->dev, pci->func);
-}
-
-
-static void pci_info_xs_write(libxl__gc *gc, libxl_device_pci *pci,
-                              const char *node, const char *val)
-{
-    char *path = pci_info_xs_path(gc, pci, node);
-
-    if ( libxl__xs_printf(gc, XBT_NULL, path, "%s", val) < 0 ) {
-        LOGE(WARN, "Write of %s to node %s failed.", val, path);
-    }
-}
-
-static char *pci_info_xs_read(libxl__gc *gc, libxl_device_pci *pci,
-                              const char *node)
-{
-    char *path = pci_info_xs_path(gc, pci, node);
-
-    return libxl__xs_read(gc, XBT_NULL, path);
-}
-
-static void pci_info_xs_remove(libxl__gc *gc, libxl_device_pci *pci,
-                               const char *node)
-{
-    char *path = pci_info_xs_path(gc, pci, node);
-    libxl_ctx *ctx = libxl__gc_owner(gc);
-
-    /* Remove the xenstore entry */
-    xs_rm(ctx->xsh, XBT_NULL, path);
-}
-
 static int libxl__device_pci_assignable_add(libxl__gc *gc,
                                             libxl_device_pci *pci,
                                             int rebind)
@@ -1594,6 +1548,9 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
         goto out;
     }
 
+    rc = pci_info_xs_write(gc, pci, "domid", GCSPRINTF("%u", domid));
+    if (rc) goto out;
+
     libxl__device_pci_reset(gc, pci->domain, pci->bus, pci->dev, pci->func);
 
     stubdomid = libxl_get_stubdom_id(ctx, domid);
@@ -1721,6 +1678,7 @@ static void device_pci_add_done(libxl__egc *egc,
              "PCI device %x:%x:%x.%x (rc %d)",
              pci->domain, pci->bus, pci->dev, pci->func,
              rc);
+        pci_info_xs_remove(gc, pci, "domid");
     }
     aodev->rc = rc;
     aodev->callback(egc, aodev);
@@ -2282,6 +2240,9 @@ out:
     libxl__xswait_stop(gc, &prs->xswait);
     libxl__ev_time_deregister(gc, &prs->timeout);
     libxl__ev_time_deregister(gc, &prs->retry_timer);
+
+    if (!rc) pci_info_xs_remove(gc, pci, "domid");
+
     aodev->rc = rc;
     aodev->callback(egc, aodev);
 }
-- 
2.20.1


