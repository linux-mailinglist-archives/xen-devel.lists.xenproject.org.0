Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4782CD921
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 15:30:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43590.78333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpd9-0002Pn-Cp; Thu, 03 Dec 2020 14:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43590.78333; Thu, 03 Dec 2020 14:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpd9-0002P1-3t; Thu, 03 Dec 2020 14:30:47 +0000
Received: by outflank-mailman (input) for mailman id 43590;
 Thu, 03 Dec 2020 14:30:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kkpd7-0002NR-JX
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 14:30:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpd6-0006Tx-QY; Thu, 03 Dec 2020 14:30:44 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpYL-00015c-E8; Thu, 03 Dec 2020 14:25:49 +0000
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
	bh=EMfCtlWlj+oMHa2Vf4m6cYy+TLLLFhjiF/PO4Sb4syk=; b=t3/M/JAYEx+h9b/w9pWt9ns2f6
	Se6y7trFmulmjUo6/7mpGgIUdPzIFfpZXHGPZNvzJnaKRExXNEEvCU4iqjg8ktZ/hIrPIZHzLyiRM
	Qtp67+pI7x+eBhpBs2eKVoB20e1Mow+6N75kiWVfFQL8Pr/JXfXFGFrdMx4dGEVmwpv0=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 13/23] libxl: use COMPARE_PCI() macro is_pci_in_array()...
Date: Thu,  3 Dec 2020 14:25:24 +0000
Message-Id: <20201203142534.4017-14-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203142534.4017-1-paul@xen.org>
References: <20201203142534.4017-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_internal.h |  7 +++---
 tools/libs/light/libxl_pci.c      | 38 +++++++++++--------------------
 2 files changed, 17 insertions(+), 28 deletions(-)

diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index ecee61b5419c..02f8a3179c44 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4746,9 +4746,10 @@ void libxl__xcinfo2xlinfo(libxl_ctx *ctx,
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
index e42c2ba56b73..4bf4a168e032 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -336,24 +336,17 @@ retry_transaction2:
     return 0;
 }
 
-static int is_pci_in_array(libxl_device_pci *assigned, int num_assigned,
-                           int dom, int bus, int dev, int func)
+static bool is_pci_in_array(libxl_device_pci *pcis, int num,
+                            libxl_device_pci *pci)
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
+    for (i = 0; i < num; i++) {
+        if (COMPARE_PCI(pci, &pcis[i]))
+            break;
     }
 
-    return 0;
+    return i < num;
 }
 
 /* Write the standard BDF into the sysfs path given by sysfs_path. */
@@ -1487,21 +1480,17 @@ int libxl_device_pci_add(libxl_ctx *ctx, uint32_t domid,
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
@@ -1834,8 +1823,7 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
         goto out_fail;
     }
 
-    attached = is_pci_in_array(pcis, num, pci->domain,
-                               pci->bus, pci->dev, pci->func);
+    attached = is_pci_in_array(pcis, num, pci);
     libxl_device_pci_list_free(pcis, num);
 
     rc = ERROR_INVAL;
-- 
2.20.1


