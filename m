Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A89B2D32EA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 21:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47766.84582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAJ-00051K-Af; Tue, 08 Dec 2020 20:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47766.84582; Tue, 08 Dec 2020 20:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmjAI-0004yQ-OK; Tue, 08 Dec 2020 20:00:50 +0000
Received: by outflank-mailman (input) for mailman id 47766;
 Tue, 08 Dec 2020 20:00:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kmjAD-0004pG-NT
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 20:00:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmjAC-00086M-TG; Tue, 08 Dec 2020 20:00:44 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=desktop.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihQ-0001p0-OP; Tue, 08 Dec 2020 19:31:00 +0000
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
	bh=Ys3y67RaqaXIN5X7X+CEx/lpFH/KIEaBqkv7RhCev3w=; b=gjhvluOV6aC2KdnKGAZACFnyMU
	nyxcR2eTaiUWLCy9OTGdiB1TD6pksTH2nvHdnHbDczzMEku+k5HEmAbt4N0ZUwiyYKMsMu3hRz3+b
	FT4FgdnK6QVnIORwlRvTvWUQVEmaSya8jMrKJmIGvZYNXwq/rWXoHYPrlnETEFn1AyrA=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v6 22/25] libxl: introduce libxl_pci_bdf_assignable_add/remove/list/list_free(), ...
Date: Tue,  8 Dec 2020 19:30:30 +0000
Message-Id: <20201208193033.11306-23-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208193033.11306-1-paul@xen.org>
References: <20201208193033.11306-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

which support naming and use 'libxl_pci_bdf' rather than 'libxl_device_pci',
as replacements for libxl_device_pci_assignable_add/remove/list/list_free().

libxl_pci_bdf_assignable_add() takes a 'name' parameter which is stored in
xenstore and facilitates two addtional functions added by this patch:
libxl_pci_bdf_assignable_name2bdf() and libxl_pci_bdf_assignable_bdf2name().
Currently there are no callers of these two functions. They will be added in
a subsequent patch.

libxl_device_pci_assignable_add/remove/list/list_free() are left in place
for compatibility but are re-implemented in terms of the newly introduced
functions.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v6:
 - New in v6 (replacing remaining code from "libxl: modify
   libxl_device_pci_assignable_add/remove/list/list_free()...")
---
 tools/include/libxl.h        |  36 ++++++--
 tools/libs/light/libxl_pci.c | 166 ++++++++++++++++++++++++++++++-----
 2 files changed, 171 insertions(+), 31 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 1fa4c5806df9..fda611f88960 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -469,6 +469,13 @@
  */
 #define LIBXL_HAVE_PCI_BDF 1
 
+/*
+ * LIBXL_HAVE_PCI_ASSIGNABLE_BDF indicates that the
+ * libxl_pci_bdf_assignable_add/remove/list/list_free() functions all
+ * exist.
+ */
+#define LIBXL_HAVE_PCI_ASSIGNABLE_BDF 1
+
 /*
  * libxl ABI compatibility
  *
@@ -2357,9 +2364,9 @@ int libxl_device_events_handler(libxl_ctx *ctx,
                                 LIBXL_EXTERNAL_CALLERS_ONLY;
 
 /*
- * Functions related to making devices assignable -- that is, bound to
- * the pciback driver, ready to be given to a guest via
- * libxl_pci_device_add.
+ * Functions related to making PCI devices with the specified BDF
+ * assignable -- that is, bound to the pciback driver, ready to be given to
+ * a guest via libxl_pci_device_add.
  *
  * - ..._add() will unbind the device from its current driver (if
  * already bound) and re-bind it to pciback; at that point it will be
@@ -2371,16 +2378,31 @@ int libxl_device_events_handler(libxl_ctx *ctx,
  * rebind is non-zero, attempt to assign it back to the driver
  * from whence it came.
  *
- * - ..._list() will return a list of the PCI devices available to be
+ * - ..._list() will return a list of the PCI BDFs available to be
  * assigned.
  *
  * add and remove are idempotent: if the device in question is already
  * added or is not bound, the functions will emit a warning but return
  * SUCCESS.
  */
-int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
-int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci, int rebind);
-libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);
+int libxl_pci_bdf_assignable_add(libxl_ctx *ctx, libxl_pci_bdf *pcibdf,
+                                 const char *name, int rebind);
+int libxl_pci_bdf_assignable_remove(libxl_ctx *ctx, libxl_pci_bdf *pcibdf,
+                                    int rebind);
+libxl_pci_bdf *libxl_pci_bdf_assignable_list(libxl_ctx *ctx, int *num);
+void libxl_pci_bdf_assignable_list_free(libxl_pci_bdf *list, int num);
+libxl_pci_bdf *libxl_pci_bdf_assignable_name2bdf(libxl_ctx *ctx,
+                                                 const char *name);
+char *libxl_pci_bdf_assignable_bdf2name(libxl_ctx *ctx,
+                                        libxl_pci_bdf *pcibdf);
+
+/* Compatibility functions - Use libxl_pci_bdf_assignable_* instead */
+int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci,
+                                    int rebind);
+int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci,
+                                       int rebind);
+libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx,
+                                                   int *num);
 void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num);
 
 /* CPUID handling */
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 448fe969514b..e11574e73f59 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -426,10 +426,10 @@ static void pci_info_xs_remove(libxl__gc *gc, libxl_pci_bdf *pcibdf,
     xs_rm(ctx->xsh, XBT_NULL, path);
 }
 
-libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
+libxl_pci_bdf *libxl_pci_bdf_assignable_list(libxl_ctx *ctx, int *num)
 {
     GC_INIT(ctx);
-    libxl_device_pci *pcis = NULL, *new;
+    libxl_pci_bdf *pcibdfs = NULL, *new;
     struct dirent *de;
     DIR *dir;
 
@@ -450,17 +450,17 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
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
-        pcibdf_struct_fill(&new->bdf, dom, bus, dev, func);
+        libxl_pci_bdf_init(new);
+        pcibdf_struct_fill(new, dom, bus, dev, func);
 
-        if (pci_info_xs_read(gc, &new->bdf, "domid")) /* already assigned */
+        if (pci_info_xs_read(gc, new, "domid")) /* already assigned */
             continue;
 
         (*num)++;
@@ -469,15 +469,15 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
     closedir(dir);
 out:
     GC_FREE;
-    return pcis;
+    return pcibdfs;
 }
 
-void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num)
+void libxl_pci_bdf_assignable_list_free(libxl_pci_bdf *list, int num)
 {
     int i;
 
     for (i = 0; i < num; i++)
-        libxl_device_pci_dispose(&list[i]);
+        libxl_pci_bdf_dispose(&list[i]);
 
     free(list);
 }
@@ -745,6 +745,7 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_pci_bdf *pcibdf)
 
 static int libxl__pci_bdf_assignable_add(libxl__gc *gc,
                                          libxl_pci_bdf *pcibdf,
+                                         const char *name,
                                          int rebind)
 {
     libxl_ctx *ctx = libxl__gc_owner(gc);
@@ -753,6 +754,23 @@ static int libxl__pci_bdf_assignable_add(libxl__gc *gc,
     int rc;
     struct stat st;
 
+    /* Sanitise any name that was passed */
+    if (name) {
+        unsigned int i, n = strlen(name);
+
+        if (n > 64) { /* Reasonable upper bound on name length */
+            LOG(ERROR, "Name too long");
+            return ERROR_FAIL;
+        }
+
+        for (i = 0; i < n; i++) {
+            if (!isgraph(name[i])) {
+                LOG(ERROR, "Names may only include printable characters");
+                return ERROR_FAIL;
+            }
+        }
+    }
+
     /* Local copy for convenience */
     dom = pcibdf->domain;
     bus = pcibdf->bus;
@@ -773,7 +791,7 @@ static int libxl__pci_bdf_assignable_add(libxl__gc *gc,
     }
     if ( rc ) {
         LOG(WARN, PCI_BDF" already assigned to pciback", dom, bus, dev, func);
-        goto quarantine;
+        goto name;
     }
 
     /* Check to see if there's already a driver that we need to unbind from */
@@ -804,7 +822,12 @@ static int libxl__pci_bdf_assignable_add(libxl__gc *gc,
         return ERROR_FAIL;
     }
 
-quarantine:
+name:
+    if (name)
+        pci_info_xs_write(gc, pcibdf, "name", name);
+    else
+        pci_info_xs_remove(gc, pcibdf, "name");
+
     /*
      * DOMID_IO is just a sentinel domain, without any actual mappings,
      * so always pass XEN_DOMCTL_DEV_RDM_RELAXED to avoid assignment being
@@ -868,34 +891,87 @@ static int libxl__pci_bdf_assignable_remove(libxl__gc *gc,
         }
     }
 
+    pci_info_xs_remove(gc, pcibdf, "name");
+
     return 0;
 }
 
-int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci,
-                                    int rebind)
+int libxl_pci_bdf_assignable_add(libxl_ctx *ctx, libxl_pci_bdf *pcibdf,
+                                 const char *name, int rebind)
 {
     GC_INIT(ctx);
     int rc;
 
-    rc = libxl__pci_bdf_assignable_add(gc, &pci->bdf, rebind);
+    rc = libxl__pci_bdf_assignable_add(gc, pcibdf, name, rebind);
 
     GC_FREE;
     return rc;
 }
 
 
-int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci,
-                                       int rebind)
+int libxl_pci_bdf_assignable_remove(libxl_ctx *ctx, libxl_pci_bdf *pcibdf,
+                                    int rebind)
 {
     GC_INIT(ctx);
     int rc;
 
-    rc = libxl__pci_bdf_assignable_remove(gc, &pci->bdf, rebind);
+    rc = libxl__pci_bdf_assignable_remove(gc, pcibdf, rebind);
 
     GC_FREE;
     return rc;
 }
 
+libxl_pci_bdf *libxl_pci_bdf_assignable_name2bdf(libxl_ctx *ctx,
+                                                 const char *name)
+{
+    GC_INIT(ctx);
+    char **bdfs;
+    libxl_pci_bdf *pcibdf = NULL;
+    unsigned int i, n;
+
+    bdfs = libxl__xs_directory(gc, XBT_NULL, PCI_INFO_PATH, &n);
+    if (!n)
+        goto out;
+
+    pcibdf = calloc(1, sizeof(*pcibdf));
+    if (!pcibdf)
+        goto out;
+
+    for (i = 0; i < n; i++) {
+        unsigned dom, bus, dev, func;
+        const char *tmp;
+
+        if (sscanf(bdfs[i], PCI_BDF_XSPATH, &dom, &bus, &dev, &func) != 4)
+            continue;
+
+        pcibdf_struct_fill(pcibdf, dom, bus, dev, func);
+
+        tmp = pci_info_xs_read(gc, pcibdf, "name");
+        if (tmp && !strcmp(tmp, name))
+            goto out;
+    }
+
+    free(pcibdf);
+    pcibdf = NULL;
+
+out:
+    GC_FREE;
+    return pcibdf;
+}
+
+char *libxl_pci_bdf_assignable_bdf2name(libxl_ctx *ctx,
+                                        libxl_pci_bdf *pcibdf)
+{
+    GC_INIT(ctx);
+    char *name = NULL, *tmp = pci_info_xs_read(gc, pcibdf, "name");
+
+    if (tmp)
+        name = strdup(tmp);
+
+    GC_FREE;
+    return name;
+}
+
 /*
  * This function checks that all functions of a device are bound to pciback
  * driver. It also initialises a bit-mask of which function numbers are present
@@ -1490,17 +1566,17 @@ int libxl_device_pci_add(libxl_ctx *ctx, uint32_t domid,
 
 static bool is_bdf_assignable(libxl_ctx *ctx, libxl_pci_bdf *pcibdf)
 {
-    libxl_device_pci *pcis;
+    libxl_pci_bdf *pcibdfs;
     int num, i;
 
-    pcis = libxl_device_pci_assignable_list(ctx, &num);
+    pcibdfs = libxl_pci_bdf_assignable_list(ctx, &num);
 
     for (i = 0; i < num; i++) {
-        if (COMPARE_BDF(pcibdf, &pcis[i].bdf))
+        if (COMPARE_BDF(pcibdf, &pcibdfs[i]))
             break;
     }
 
-    libxl_device_pci_assignable_list_free(pcis, num);
+    libxl_pci_bdf_assignable_list_free(pcibdfs, num);
 
     return i < num;
 }
@@ -1551,7 +1627,7 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     if (rc) goto out;
 
     if (pci->seize && !pciback_dev_is_assigned(gc, &pci->bdf)) {
-        rc = libxl__pci_bdf_assignable_add(gc, &pci->bdf, 1);
+        rc = libxl__pci_bdf_assignable_add(gc, &pci->bdf, NULL, 1);
         if ( rc )
             goto out;
     }
@@ -2449,6 +2525,48 @@ DEFINE_DEVICE_TYPE_STRUCT(pci, PCI, pcidevs,
     .from_xenstore = libxl__device_pci_from_xs_be,
 );
 
+int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_device_pci *pci,
+                                    int rebind)
+{
+    return libxl_pci_bdf_assignable_add(ctx, &pci->bdf, NULL, rebind);
+}
+
+int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_device_pci *pci,
+                                       int rebind)
+{
+    return libxl_pci_bdf_assignable_remove(ctx, &pci->bdf, rebind);
+}
+
+libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx,
+                                                   int *num)
+{
+    libxl_pci_bdf *pcibdfs = libxl_pci_bdf_assignable_list(ctx, num);
+    libxl_device_pci *pcis;
+    unsigned int i;
+
+    if (!pcibdfs)
+        return NULL;
+
+    pcis = calloc(*num, sizeof(*pcis));
+    if (!pcis) {
+        libxl_pci_bdf_assignable_list_free(pcibdfs, *num);
+        return NULL;
+    }
+
+    for (i = 0; i < *num; i++) {
+        libxl_device_pci_init(&pcis[i]);
+        libxl_pci_bdf_copy(ctx, &pcis[i].bdf, &pcibdfs[i]);
+    }
+
+    libxl_pci_bdf_assignable_list_free(pcibdfs, *num);
+    return pcis;
+}
+
+void libxl_device_pci_assignable_list_free(libxl_device_pci *list, int num)
+{
+    libxl_device_pci_list_free(list, num);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.20.1


