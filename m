Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A062973A1
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11205.29769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVztn-0001IN-QD; Fri, 23 Oct 2020 16:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11205.29769; Fri, 23 Oct 2020 16:26:39 +0000
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
	id 1kVztn-0001Hj-In; Fri, 23 Oct 2020 16:26:39 +0000
Received: by outflank-mailman (input) for mailman id 11205;
 Fri, 23 Oct 2020 16:26:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVztl-0000v2-GZ
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:37 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cf76f40-3f3d-4c0d-98b8-2222d69b0ccd;
 Fri, 23 Oct 2020 16:26:21 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVztU-0008NY-Pa; Fri, 23 Oct 2020 16:26:20 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzql-000376-1D; Fri, 23 Oct 2020 16:23:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVztl-0000v2-GZ
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:37 +0000
X-Inumbo-ID: 4cf76f40-3f3d-4c0d-98b8-2222d69b0ccd
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4cf76f40-3f3d-4c0d-98b8-2222d69b0ccd;
	Fri, 23 Oct 2020 16:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=fKvidaGIqKTgBLgc0mSSzScxrN0OQ+wp9Q7aYF6wsy4=; b=dxCpiIUo7fG8UlymJDufun+bR
	i+OASKtJG3Ot94E9zEZz/u7qMWtKwxWMQ6e5rZ9QBj9uuT3yyyzIQjBfryn2CQVKbbV1YAzZSPuNs
	90iWxHAWRMjJpsniUYRG6RvuV6Eb2ANGIbMjvNAP1Wnup2hq9BcLR0FWPZ3hDIhwhUXjo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVztU-0008NY-Pa; Fri, 23 Oct 2020 16:26:20 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzql-000376-1D; Fri, 23 Oct 2020 16:23:31 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 13/25] libxl: use COMPARE_PCI() macro is_pci_in_array()...
Date: Fri, 23 Oct 2020 16:23:02 +0000
Message-Id: <20201023162314.2235-14-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

... rather than an open-coded equivalent.

This patch tidies up the is_pci_in_array() function, making it take a single
'libxl_device_pci' argument rather than separate domain, bus, device and
function arguments. The already-available COMPARE_PCI() macro can then be
used and it is also modified to return 'bool' rather than 'int'.

The patch also modifies libxl_pci_assignable() to use is_pci_in_array() rather
than a separate open-coded equivalent, and also modifies it to return a
'bool' rather than an 'int'.

NOTE: The COMPARE_PCI() macro is also fixed to include the 'domain' in its
      comparison, which should always have been the case.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_internal.h |  7 ++++---
 tools/libs/light/libxl_pci.c      | 38 +++++++++++++-------------------------
 2 files changed, 17 insertions(+), 28 deletions(-)

diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 3e70ff639b..80d7988622 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4744,9 +4744,10 @@ void libxl__xcinfo2xlinfo(libxl_ctx *ctx,
  * devices have same identifier. */
 #define COMPARE_DEVID(a, b) ((a)->devid == (b)->devid)
 #define COMPARE_DISK(a, b) (!strcmp((a)->vdev, (b)->vdev))
-#define COMPARE_PCI(a, b) ((a)->func == (b)->func &&    \
-                           (a)->bus == (b)->bus &&      \
-                           (a)->dev == (b)->dev)
+#define COMPARE_PCI(a, b) ((a)->domain == (b)->domain && \
+                           (a)->bus == (b)->bus &&       \
+                           (a)->dev == (b)->dev &&       \
+                           (a)->func == (b)->func)
 #define COMPARE_USB(a, b) ((a)->ctrl == (b)->ctrl && \
                            (a)->port == (b)->port)
 #define COMPARE_USBCTRL(a, b) ((a)->devid == (b)->devid)
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index e858509609..2e8e1c50f1 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -317,24 +317,17 @@ retry_transaction2:
     return 0;
 }
 
-static int is_pci_in_array(libxl_device_pci *assigned, int num_assigned,
-                           int dom, int bus, int dev, int func)
+static int is_pci_in_array(libxl_device_pci *pcis, int num,
+                           libxl_device_pci *pci)
 {
     int i;
 
-    for(i = 0; i < num_assigned; i++) {
-        if ( assigned[i].domain != dom )
-            continue;
-        if ( assigned[i].bus != bus )
-            continue;
-        if ( assigned[i].dev != dev )
-            continue;
-        if ( assigned[i].func != func )
-            continue;
-        return 1;
+    for(i = 0; i < num; i++) {
+        if (COMPARE_PCI(pci, &pcis[i]))
+            break;
     }
 
-    return 0;
+    return i < num;
 }
 
 /* Write the standard BDF into the sysfs path given by sysfs_path. */
@@ -1467,21 +1460,17 @@ int libxl_device_pci_add(libxl_ctx *ctx, uint32_t domid,
     return AO_INPROGRESS;
 }
 
-static int libxl_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
+static bool libxl_pci_assignable(libxl_ctx *ctx, libxl_device_pci *pci)
 {
     libxl_device_pci *pcis;
-    int num, i;
+    int num;
+    bool assignable;
 
     pcis = libxl_device_pci_assignable_list(ctx, &num);
-    for (i = 0; i < num; i++) {
-        if (pcis[i].domain == pci->domain &&
-            pcis[i].bus == pci->bus &&
-            pcis[i].dev == pci->dev &&
-            pcis[i].func == pci->func)
-            break;
-    }
+    assignable = is_pci_in_array(pcis, num, pci);
     libxl_device_pci_assignable_list_free(pcis, num);
-    return i != num;
+
+    return assignable;
 }
 
 static void device_pci_add_stubdom_wait(libxl__egc *egc,
@@ -1829,8 +1818,7 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
         goto out_fail;
     }
 
-    attached = is_pci_in_array(pcis, num, pci->domain,
-                               pci->bus, pci->dev, pci->func);
+    attached = is_pci_in_array(pcis, num, pci);
     libxl_device_pci_list_free(pcis, num);
 
     rc = ERROR_INVAL;
-- 
2.11.0


