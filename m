Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6322C1FFC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 09:31:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35505.67094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khTip-0003SO-8g; Tue, 24 Nov 2020 08:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35505.67094; Tue, 24 Nov 2020 08:30:47 +0000
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
	id 1khTio-0003Ra-U2; Tue, 24 Nov 2020 08:30:46 +0000
Received: by outflank-mailman (input) for mailman id 35505;
 Tue, 24 Nov 2020 08:30:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khTim-0003PM-V8
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 08:30:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khTim-0006al-8x; Tue, 24 Nov 2020 08:30:44 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208]
 helo=ip-10-0-29-170.ec2.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khTH5-0001hp-N5; Tue, 24 Nov 2020 08:02:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khTim-0003PM-V8
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 08:30:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=/AMoYjWi5H9dseAs4K+GDd7cbQWU+SnJYanWAEcg98o=; b=16qYaUG1cZYFRWuRFo0fIOqI5
	fgSidJvEJPOnjNUnMB41AcXK3Ormm8340GCfsUGTxOYqDHVVtW0dfIfz1ydiOUgwriiR4p45diZM3
	dj35qyPfIn/ftKCHqFPqY6mXaTbe2OaiVd8Mr1RayqjrQtQwHJhbmKLOxMQKUrZaoIyYc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khTim-0006al-8x; Tue, 24 Nov 2020 08:30:44 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208] helo=ip-10-0-29-170.ec2.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khTH5-0001hp-N5; Tue, 24 Nov 2020 08:02:07 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 23/23] xl / libxl: support 'xl pci-attach/detach' by name
Date: Tue, 24 Nov 2020 08:01:59 +0000
Message-Id: <20201124080159.11912-24-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201124080159.11912-1-paul@xen.org>
References: <20201124080159.11912-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

This patch adds a 'name' field into the idl for 'libxl_device_pci' and
libxlu_pci_parse_spec_string() is modified to parse the new 'name'
parameter of PCI_SPEC_STRING detailed in the updated documention in
xl-pci-configuration(5).

If the 'name' field is non-NULL then both libxl_device_pci_add() and
libxl_device_pci_remove() will use it to look up the device BDF in
the list of assignable devices.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/include/libxl.h            |  6 ++++
 tools/libs/light/libxl_pci.c     | 67 +++++++++++++++++++++++++++++++++++++---
 tools/libs/light/libxl_types.idl |  1 +
 tools/libs/util/libxlu_pci.c     |  7 ++++-
 4 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 4025d3a3d4..5b55a20155 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -485,6 +485,12 @@
 #define LIBXL_HAVE_PCI_ASSIGNABLE_NAME 1
 
 /*
+ * LIBXL_HAVE_DEVICE_PCI_NAME indicates that the 'name' field of
+ * libxl_device_pci is defined.
+ */
+#define LIBXL_HAVE_DEVICE_PCI_NAME 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 1da7fd5508..c45f4c6a40 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -60,6 +60,10 @@ static void libxl_create_pci_backend_device(libxl__gc *gc,
                                             int num,
                                             const libxl_device_pci *pci)
 {
+    if (pci->name) {
+        flexarray_append(back, GCSPRINTF("name-%d", num));
+        flexarray_append(back, GCSPRINTF("%s", pci->name));
+    }
     flexarray_append(back, GCSPRINTF("key-%d", num));
     flexarray_append(back, GCSPRINTF(PCI_BDF, pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func));
     flexarray_append(back, GCSPRINTF("dev-%d", num));
@@ -284,6 +288,7 @@ retry_transaction:
 
 retry_transaction2:
     t = xs_transaction_start(ctx->xsh);
+    xs_rm(ctx->xsh, t, GCSPRINTF("%s/name-%d", be_path, i));
     xs_rm(ctx->xsh, t, GCSPRINTF("%s/state-%d", be_path, i));
     xs_rm(ctx->xsh, t, GCSPRINTF("%s/key-%d", be_path, i));
     xs_rm(ctx->xsh, t, GCSPRINTF("%s/dev-%d", be_path, i));
@@ -322,6 +327,12 @@ retry_transaction2:
             xs_write(ctx->xsh, t, GCSPRINTF("%s/vdevfn-%d", be_path, j - 1), tmp, strlen(tmp));
             xs_rm(ctx->xsh, t, tmppath);
         }
+        tmppath = GCSPRINTF("%s/name-%d", be_path, j);
+        tmp = libxl__xs_read(gc, t, tmppath);
+        if (tmp) {
+            xs_write(ctx->xsh, t, GCSPRINTF("%s/name-%d", be_path, j - 1), tmp, strlen(tmp));
+            xs_rm(ctx->xsh, t, tmppath);
+        }
     }
     if (!xs_transaction_end(ctx->xsh, t, 0))
         if (errno == EAGAIN)
@@ -1619,6 +1630,23 @@ void libxl__device_pci_add(libxl__egc *egc, uint32_t domid,
     pas->starting = starting;
     pas->callback = device_pci_add_stubdom_done;
 
+    if (pci->name) {
+        libxl_pci_bdf *pcibdf =
+            libxl_device_pci_assignable_name2bdf(CTX, pci->name);
+
+        if (!pcibdf) {
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        LOGD(DETAIL, domid, "'%s' -> %04x:%02x:%02x.%u", pci->name,
+             pcibdf->domain, pcibdf->bus, pcibdf->dev, pcibdf->func);
+
+        libxl_pci_bdf_copy(CTX, &pci->bdf, pcibdf);
+        libxl_pci_bdf_dispose(pcibdf);
+        free(pcibdf);
+    }
+
     if (libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
         rc = xc_test_assign_device(ctx->xch, domid,
                                    pci_encode_bdf(&pci->bdf));
@@ -1767,11 +1795,19 @@ static void device_pci_add_done(libxl__egc *egc,
     libxl_device_pci *pci = &pas->pci;
 
     if (rc) {
-        LOGD(ERROR, domid,
-             "libxl__device_pci_add  failed for "
-             "PCI device %x:%x:%x.%x (rc %d)",
-             pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func,
-             rc);
+        if (pci->name) {
+            LOGD(ERROR, domid,
+                 "libxl__device_pci_add failed for "
+                 "PCI device '%s' (rc %d)",
+                 pci->name,
+                 rc);
+        } else {
+            LOGD(ERROR, domid,
+                 "libxl__device_pci_add failed for "
+                 "PCI device %x:%x:%x.%x (rc %d)",
+                 pci->bdf.domain, pci->bdf.bus, pci->bdf.dev, pci->bdf.func,
+                 rc);
+        }
         pci_info_xs_remove(gc, &pci->bdf, "domid");
     }
     libxl_device_pci_dispose(pci);
@@ -2288,6 +2324,23 @@ static void libxl__device_pci_remove_common(libxl__egc *egc,
     libxl__ev_time_init(&prs->timeout);
     libxl__ev_time_init(&prs->retry_timer);
 
+    if (pci->name) {
+        libxl_pci_bdf *pcibdf =
+            libxl_device_pci_assignable_name2bdf(CTX, pci->name);
+
+        if (!pcibdf) {
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        LOGD(DETAIL, domid, "'%s' -> %04x:%02x:%02x.%u", pci->name,
+             pcibdf->domain, pcibdf->bus, pcibdf->dev, pcibdf->func);
+
+        libxl_pci_bdf_copy(CTX, &prs->pci.bdf, pcibdf);
+        libxl_pci_bdf_dispose(pcibdf);
+        free(pcibdf);
+    }
+
     prs->orig_vdev = pci->vdevfn & ~7U;
 
     if ( pci->vfunc_mask == LIBXL_PCI_FUNC_ALL ) {
@@ -2422,6 +2475,10 @@ static int libxl__device_pci_from_xs_be(libxl__gc *gc,
         } while ((p = strtok_r(NULL, ",=", &saveptr)) != NULL);
     }
 
+    s = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/name-%d", be_path, nr));
+    if (s)
+        pci->name = strdup(s);
+
     return 0;
 }
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 2c441142fb..44bad36f1c 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -778,6 +778,7 @@ libxl_pci_bdf = Struct("pci_bdf", [
 
 libxl_device_pci = Struct("device_pci", [
     ("bdf", libxl_pci_bdf),
+    ("name", string),
     ("vdevfn", uint32),
     ("vfunc_mask", uint32),
     ("msitranslate", bool),
diff --git a/tools/libs/util/libxlu_pci.c b/tools/libs/util/libxlu_pci.c
index a8b6ce5427..543a1f80e9 100644
--- a/tools/libs/util/libxlu_pci.c
+++ b/tools/libs/util/libxlu_pci.c
@@ -151,6 +151,7 @@ int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pcidev,
 {
     const char *ptr = str;
     bool bdf_present = false;
+    bool name_present = false;
     int ret;
 
     /* Attempt to parse 'bdf' as positional parameter */
@@ -193,6 +194,10 @@ int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pcidev,
             pcidev->power_mgmt = atoi(val);
         } else if (!strcmp(key, "rdm_policy")) {
             ret = parse_rdm_policy(cfg, &pcidev->rdm_policy, val);
+        } else if (!strcmp(key, "name")) {
+            name_present = true;
+            pcidev->name = strdup(val);
+            if (!pcidev->name) ret = ERROR_NOMEM;
         } else {
             XLU__PCI_ERR(cfg, "Unknown PCI_SPEC_STRING option: %s", key);
             ret = ERROR_INVAL;
@@ -205,7 +210,7 @@ int xlu_pci_parse_spec_string(XLU_Config *cfg, libxl_device_pci *pcidev,
             return ret;
     }
 
-    if (!bdf_present)
+    if (!(bdf_present ^ name_present))
         return ERROR_INVAL;
 
     return 0;
-- 
2.11.0


