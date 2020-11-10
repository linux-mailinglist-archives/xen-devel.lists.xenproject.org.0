Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B09B2ADD72
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 18:52:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23587.50491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXoY-0003XH-HW; Tue, 10 Nov 2020 17:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23587.50491; Tue, 10 Nov 2020 17:52:18 +0000
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
	id 1kcXoY-0003WK-CY; Tue, 10 Nov 2020 17:52:18 +0000
Received: by outflank-mailman (input) for mailman id 23587;
 Tue, 10 Nov 2020 17:52:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kcXoX-0002tQ-2b
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:52:17 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26e9022a-6a30-41d8-a850-79199f96f771;
 Tue, 10 Nov 2020 17:51:57 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXoC-0006ZE-U9; Tue, 10 Nov 2020 17:51:56 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXoC-0007RC-Md; Tue, 10 Nov 2020 17:51:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kcXoX-0002tQ-2b
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:52:17 +0000
X-Inumbo-ID: 26e9022a-6a30-41d8-a850-79199f96f771
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 26e9022a-6a30-41d8-a850-79199f96f771;
	Tue, 10 Nov 2020 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=LyPpHUyMe6aEgoIkauLXqbCOzMhm1Lwmubu6y3KL/nk=; b=GcwxQJwuPDlxQYv/6Jq6F+VUV8
	j0vufZHutPnK0Q2vzQ7qtPuHcsj14FZJmQsheM3tjODpyOAACeIgXnX1crLSIsP1u59uI81SsGqw6
	jogtSQvAIJnl2Jo9uZFMXOU82tdanJtuuiBXknjC10HrRYsjuvq/6clz0JDulkxTvSyI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXoC-0006ZE-U9; Tue, 10 Nov 2020 17:51:56 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXoC-0007RC-Md; Tue, 10 Nov 2020 17:51:56 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 07/24] libxl: generalise 'driver_path' xenstore access functions in libxl_pci.c
Date: Tue, 10 Nov 2020 17:51:30 +0000
Message-Id: <20201110175147.7067-8-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110175147.7067-1-paul@xen.org>
References: <20201110175147.7067-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

For the purposes of re-binding a device to its previous driver
libxl__device_pci_assignable_add() writes the driver path into xenstore.
This path is then read back in libxl__device_pci_assignable_remove().

The functions that support this writing to and reading from xenstore are
currently dedicated for this purpose and hence the node name 'driver_path'
is hard-coded. This patch generalizes these utility functions and passes
'driver_path' as an argument. Subsequent patches will invoke them to
access other nodes.

NOTE: Because functions will have a broader use (other than storing a
      driver path in lieu of pciback) the base xenstore path is also
      changed from '/libxl/pciback' to '/libxl/pci'.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 66 +++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index c9f062fc2d8b..fdafd2c9bafb 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -718,48 +718,46 @@ static int pciback_dev_unassign(libxl__gc *gc, libxl_device_pci *pci)
     return 0;
 }
 
-#define PCIBACK_INFO_PATH "/libxl/pciback"
+#define PCI_INFO_PATH "/libxl/pci"
 
-static void pci_assignable_driver_path_write(libxl__gc *gc,
-                                            libxl_device_pci *pci,
-                                            char *driver_path)
+static char *pci_info_xs_path(libxl__gc *gc, libxl_device_pci *pci,
+                              const char *node)
 {
-    char *path;
+    return node ?
+        GCSPRINTF(PCI_INFO_PATH"/"PCI_BDF_XSPATH"/%s",
+                  pci->domain, pci->bus, pci->dev, pci->func,
+                  node) :
+        GCSPRINTF(PCI_INFO_PATH"/"PCI_BDF_XSPATH,
+                  pci->domain, pci->bus, pci->dev, pci->func);
+}
 
-    path = GCSPRINTF(PCIBACK_INFO_PATH"/"PCI_BDF_XSPATH"/driver_path",
-                     pci->domain,
-                     pci->bus,
-                     pci->dev,
-                     pci->func);
-    if ( libxl__xs_printf(gc, XBT_NULL, path, "%s", driver_path) < 0 ) {
-        LOGE(WARN, "Write of %s to node %s failed.", driver_path, path);
+
+static void pci_info_xs_write(libxl__gc *gc, libxl_device_pci *pci,
+                              const char *node, const char *val)
+{
+    char *path = pci_info_xs_path(gc, pci, node);
+
+    if ( libxl__xs_printf(gc, XBT_NULL, path, "%s", val) < 0 ) {
+        LOGE(WARN, "Write of %s to node %s failed.", val, path);
     }
 }
 
-static char * pci_assignable_driver_path_read(libxl__gc *gc,
-                                              libxl_device_pci *pci)
+static char *pci_info_xs_read(libxl__gc *gc, libxl_device_pci *pci,
+                              const char *node)
 {
-    return libxl__xs_read(gc, XBT_NULL,
-                          GCSPRINTF(
-                           PCIBACK_INFO_PATH "/" PCI_BDF_XSPATH "/driver_path",
-                           pci->domain,
-                           pci->bus,
-                           pci->dev,
-                           pci->func));
+    char *path = pci_info_xs_path(gc, pci, node);
+
+    return libxl__xs_read(gc, XBT_NULL, path);
 }
 
-static void pci_assignable_driver_path_remove(libxl__gc *gc,
-                                              libxl_device_pci *pci)
+static void pci_info_xs_remove(libxl__gc *gc, libxl_device_pci *pci,
+                               const char *node)
 {
+    char *path = pci_info_xs_path(gc, pci, node);
     libxl_ctx *ctx = libxl__gc_owner(gc);
 
     /* Remove the xenstore entry */
-    xs_rm(ctx->xsh, XBT_NULL,
-          GCSPRINTF(PCIBACK_INFO_PATH "/" PCI_BDF_XSPATH,
-                    pci->domain,
-                    pci->bus,
-                    pci->dev,
-                    pci->func) );
+    xs_rm(ctx->xsh, XBT_NULL, path);
 }
 
 static int libxl__device_pci_assignable_add(libxl__gc *gc,
@@ -805,9 +803,9 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
     /* Store driver_path for rebinding to dom0 */
     if ( rebind ) {
         if ( driver_path ) {
-            pci_assignable_driver_path_write(gc, pci, driver_path);
+            pci_info_xs_write(gc, pci, "driver_path", driver_path);
         } else if ( (driver_path =
-                     pci_assignable_driver_path_read(gc, pci)) != NULL ) {
+                     pci_info_xs_read(gc, pci, "driver_path")) != NULL ) {
             LOG(INFO, PCI_BDF" not bound to a driver, will be rebound to %s",
                 dom, bus, dev, func, driver_path);
         } else {
@@ -815,7 +813,7 @@ static int libxl__device_pci_assignable_add(libxl__gc *gc,
                 dom, bus, dev, func);
         }
     } else {
-        pci_assignable_driver_path_remove(gc, pci);
+        pci_info_xs_remove(gc, pci, "driver_path");
     }
 
     if ( pciback_dev_assign(gc, pci) ) {
@@ -865,7 +863,7 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
     }
 
     /* Rebind if necessary */
-    driver_path = pci_assignable_driver_path_read(gc, pci);
+    driver_path = pci_info_xs_read(gc, pci, "driver_path");
 
     if ( driver_path ) {
         if ( rebind ) {
@@ -878,7 +876,7 @@ static int libxl__device_pci_assignable_remove(libxl__gc *gc,
                 return -1;
             }
 
-            pci_assignable_driver_path_remove(gc, pci);
+            pci_info_xs_remove(gc, pci, "driver_path");
         }
     } else {
         if ( rebind ) {
-- 
2.20.1


