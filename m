Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD182EB1B5
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 18:47:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62114.109814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwqQ1-0005WX-D3; Tue, 05 Jan 2021 17:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62114.109814; Tue, 05 Jan 2021 17:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwqQ1-0005V5-4Z; Tue, 05 Jan 2021 17:46:53 +0000
Received: by outflank-mailman (input) for mailman id 62114;
 Tue, 05 Jan 2021 17:46:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kwqPz-0005Rr-39
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 17:46:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kwqPy-0006Ia-Am; Tue, 05 Jan 2021 17:46:50 +0000
Received: from ec2-34-243-106-223.eu-west-1.compute.amazonaws.com
 ([34.243.106.223] helo=ip-10-0-70-185.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kwqPy-0008Uy-3L; Tue, 05 Jan 2021 17:46:50 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=cuL69JTKNTU5sfYZEI8VcKnFuX1xEw0L2aW+VMRrfNo=; b=MSDIID+qu8oMZY9IJLtYhrYPc
	ccCg3xWDOH9W2iOU9WYsh0qwSeCIJCUuanWKnE6CmqnjXLqz6zOjvBOqTiOxbSwFI49gu/aZwHH6R
	ng3BrMPBvKnQYO6/62vNddDZR3fRf2eJFI12JKJoxxlSzyGiGyzscS9S7q0F9Tq6fKT28=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v7 4/7] libxl: add 'name' field to 'libxl_device_pci' in the IDL...
Date: Tue,  5 Jan 2021 17:46:39 +0000
Message-Id: <20210105174642.2754-5-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210105174642.2754-1-paul@xen.org>
References: <20210105174642.2754-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

... and modify libxl_pci_bdf_assignable_add/remove/list() to make use of it.

libxl_pci_bdf_assignable_add() will store the name of the device in xenstore
if the field is specified (i.e. non-NULL) and libxl_pci_bdf_assignable_remove()
will remove devices specified only by name, looking up the BDF as necessary.

libxl_pci_bdf_assignable_list() will also populate the 'name' field if a name
was stored by libxl_pci_bdf_assignable_add().

NOTE: This patch also fixes whitespace in the declaration of 'libxl_device_pci'
      in the IDL.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v7:
 - New in v7
---
 tools/include/libxl.h            |  6 ++++
 tools/libs/light/libxl_pci.c     | 77 ++++++++++++++++++++++++++++++++++++++--
 tools/libs/light/libxl_types.idl | 13 +++----
 3 files changed, 87 insertions(+), 9 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 3433c950f9..3488fbf56f 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -464,6 +464,12 @@
 #define LIBXL_HAVE_DEVICE_PCI_ASSIGNABLE_LIST_FREE 1
 
 /*
+ * LIBXL_HAVE_DEVICE_PCI_NAME indicates that the libxl_device_pci type
+ * has a name field.
+ */
+#define LIBXL_HAVE_DEVICE_PCI_NAME 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 6feedadc62..9e3a90dcda 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -438,7 +438,9 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
     }
 
     while((de = readdir(dir))) {
-        unsigned dom, bus, dev, func;
+        unsigned int dom, bus, dev, func;
+        char *name;
+
         if (sscanf(de->d_name, PCI_BDF, &dom, &bus, &dev, &func) != 4)
             continue;
 
@@ -455,6 +457,9 @@ libxl_device_pci *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num)
         if (pci_info_xs_read(gc, new, "domid")) /* already assigned */
             continue;
 
+        name = pci_info_xs_read(gc, new, "name");
+        if (name) new->name = strdup(name);
+
         (*num)++;
     }
 
@@ -742,6 +747,7 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     libxl_ctx *ctx = libxl__gc_owner(gc);
     unsigned dom, bus, dev, func;
     char *spath, *driver_path = NULL;
+    const char *name;
     int rc;
     struct stat st;
 
@@ -750,6 +756,24 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     bus = pci->bus;
     dev = pci->dev;
     func = pci->func;
+    name = pci->name;
+
+    /* Sanitise any name that is set */
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
 
     /* See if the device exists */
     spath = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF, dom, bus, dev, func);
@@ -765,7 +789,7 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     }
     if ( rc ) {
         LOG(WARN, PCI_BDF" already assigned to pciback", dom, bus, dev, func);
-        goto quarantine;
+        goto name;
     }
 
     /* Check to see if there's already a driver that we need to unbind from */
@@ -796,7 +820,12 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
         return ERROR_FAIL;
     }
 
-quarantine:
+name:
+    if (name)
+        pci_info_xs_write(gc, pci, "name", name);
+    else
+        pci_info_xs_remove(gc, pci, "name");
+
     /*
      * DOMID_IO is just a sentinel domain, without any actual mappings,
      * so always pass XEN_DOMCTL_DEV_RDM_RELAXED to avoid assignment being
@@ -812,6 +841,40 @@ quarantine:
     return 0;
 }
 
+static int name2bdf(libxl__gc *gc, libxl_device_pci *pci)
+{
+    char **bdfs;
+    unsigned int i, n;
+    int rc = ERROR_NOTFOUND;
+
+    bdfs = libxl__xs_directory(gc, XBT_NULL, PCI_INFO_PATH, &n);
+    if (!n)
+        goto out;
+
+    for (i = 0; i < n; i++) {
+        unsigned dom, bus, dev, func;
+        char *name;
+
+        if (sscanf(bdfs[i], PCI_BDF_XSPATH, &dom, &bus, &dev, &func) != 4)
+            continue;
+
+        pci_struct_fill(pci, dom, bus, dev, func);
+
+        name = pci_info_xs_read(gc, pci, "name");
+        if (name && !strcmp(name, pci->name)) {
+            rc = 0;
+            break;
+        }
+    }
+
+out:
+    if (!rc)
+        LOG(DETAIL, "'%s' -> " PCI_BDF, pci->name, pci->domain,
+            pci->bus, pci->dev, pci->func);
+
+    return rc;
+}
+
 static int libxl__device_pci_assignable_remove(libxl__gc *gc,
                                                libxl_device_pci *pci,
                                                int rebind)
@@ -820,6 +883,12 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
     int rc;
     char *driver_path;
 
+    /* If the device is named then we need to look up the BDF */
+    if (pci->name) {
+        rc = name2bdf(gc, pci);
+        if (rc) return rc;
+    }
+
     /* De-quarantine */
     rc = xc_deassign_device(ctx->xch, DOMID_IO, pci_encode_bdf(pci));
     if ( rc < 0 ) {
@@ -860,6 +929,8 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
         }
     }
 
+    pci_info_xs_remove(gc, pci, "name");
+
     return 0;
 }
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 05324736b7..b4a9076b85 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -771,17 +771,18 @@ libxl_device_nic = Struct("device_nic", [
     ])
 
 libxl_device_pci = Struct("device_pci", [
-    ("func",      uint8),
-    ("dev",       uint8),
-    ("bus",       uint8),
-    ("domain",    integer),
-    ("vdevfn",    uint32),
+    ("func", uint8),
+    ("dev", uint8),
+    ("bus", uint8),
+    ("domain", integer),
+    ("vdevfn", uint32),
     ("vfunc_mask", uint32),
     ("msitranslate", bool),
     ("power_mgmt", bool),
     ("permissive", bool),
     ("seize", bool),
-    ("rdm_policy",      libxl_rdm_reserve_policy),
+    ("rdm_policy", libxl_rdm_reserve_policy),
+    ("name", string),
     ])
 
 libxl_device_rdm = Struct("device_rdm", [
-- 
2.11.0


