Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 158182973A3
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11207.29792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzts-0001SE-R8; Fri, 23 Oct 2020 16:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11207.29792; Fri, 23 Oct 2020 16:26:44 +0000
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
	id 1kVzts-0001RQ-Lx; Fri, 23 Oct 2020 16:26:44 +0000
Received: by outflank-mailman (input) for mailman id 11207;
 Fri, 23 Oct 2020 16:26:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVztq-0000v2-Ga
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:42 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc70f8b5-957c-4ba3-b316-955b4dff14c3;
 Fri, 23 Oct 2020 16:26:21 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVztU-0008Ne-SQ; Fri, 23 Oct 2020 16:26:20 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqi-000376-6X; Fri, 23 Oct 2020 16:23:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVztq-0000v2-Ga
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:42 +0000
X-Inumbo-ID: cc70f8b5-957c-4ba3-b316-955b4dff14c3
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cc70f8b5-957c-4ba3-b316-955b4dff14c3;
	Fri, 23 Oct 2020 16:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=M7KyfdRowcfz1Dkb4pOwz/I/UqTxNMMmQHabJ9z5yGE=; b=xJIIzblZXaqib5gGfqsFtCb8j
	7ciGpN8ViuR2DuGP1RRs8bEgfobxQ/q9m908lKlHUEYZY3DzbVEz4nhvqgVElLENk5fm7A9/+TLTB
	4Q+/whXZtSVhTIe+4/Pe3V+opXc6pdyN1DJ7YAmZW0C03NW00gSTseKrB3MiLNnSiBamU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVztU-0008Ne-SQ; Fri, 23 Oct 2020 16:26:20 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqi-000376-6X; Fri, 23 Oct 2020 16:23:28 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 10/25] libxl: remove get_all_assigned_devices() from libxl_pci.c
Date: Fri, 23 Oct 2020 16:22:59 +0000
Message-Id: <20201023162314.2235-11-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

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
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 149 ++++++++++++++++---------------------------
 1 file changed, 55 insertions(+), 94 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 0be1b21185..879b1b24a0 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -317,50 +317,6 @@ retry_transaction2:
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
@@ -408,19 +364,58 @@ static int sysfs_write_bdf(libxl__gc *gc, const char * sysfs_path,
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
@@ -436,9 +431,6 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
         if (sscanf(de->d_name, PCI_BDF, &dom, &bus, &dev, &func) != 4)
             continue;
 
-        if (is_pci_in_array(assigned, num_assigned, dom, bus, dev, func))
-            continue;
-
         new = realloc(pcis, ((*num) + 1) * sizeof(*new));
         if (NULL == new)
             continue;
@@ -448,6 +440,10 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
 
         memset(new, 0, sizeof(*new));
         pci_struct_fill(new, dom, bus, dev, func, 0);
+
+        if (pci_info_xs_read(gc, new, "domid")) /* already assigned */
+            continue;
+
         (*num)++;
     }
 
@@ -718,48 +714,6 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pci)
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
@@ -1574,6 +1528,9 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
         goto out;
     }
 
+    rc = pci_info_xs_write(gc, pci, "domid", GCSPRINTF("%u", domid));
+    if (rc) goto out;
+
     libxl__device_pci_reset(gc, pci->domain, pci->bus, pci->dev, pci->func);
 
     stubdomid = libxl_get_stubdom_id(ctx, domid);
@@ -1701,6 +1658,7 @@ static void device_pci_add_done(libxl__egc *egc,
              "PCI device %x:%x:%x.%x (rc %d)",
              pci->domain, pci->bus, pci->dev, pci->func,
              rc);
+        pci_info_xs_remove(gc, pci, "domid");
     }
     aodev->rc = rc;
     aodev->callback(egc, aodev);
@@ -2276,6 +2234,9 @@ out:
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
2.11.0


