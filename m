Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0023158AD45
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 17:44:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381359.616007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJzUW-0000JX-VA; Fri, 05 Aug 2022 15:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381359.616007; Fri, 05 Aug 2022 15:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJzUW-0000GM-RZ; Fri, 05 Aug 2022 15:44:00 +0000
Received: by outflank-mailman (input) for mailman id 381359;
 Fri, 05 Aug 2022 15:43:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcVI=YJ=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oJzUV-0000GG-Kj
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 15:43:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6aafef2d-14d5-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 17:43:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 248AD106F;
 Fri,  5 Aug 2022 08:43:57 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8949C3F73B;
 Fri,  5 Aug 2022 08:43:55 -0700 (PDT)
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
X-Inumbo-ID: 6aafef2d-14d5-11ed-924f-1f966e50362f
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] [RFC] xen/vpci: modify pci_get_pdev_by_domain() & pci_get_pdev()
Date: Fri,  5 Aug 2022 16:43:43 +0100
Message-Id: <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pci_get_pdev_by_domain() and pci_get_pdev() functions find the pdev in
the pseg list. If pdev is not in the pseg list, the functions will try
to find the pdev in the next segment. It is not right to find the pdev
in the next segment as this will result in the corruption of another
device in a different segment with the same BDF.

An issue that was observed when implementing the PCI passthrough on ARM.
When we deassign the device from domU guest, the device is assigned
to dom_io and not to dom0, but the tool stack that runs in dom0 will try
to configure the device from dom0. vpci will find the device based on
conversion of GPA to SBDF and will try to find the device in dom0, but
because device is assigned to dom_io, pci_get_pdev_by_domain() will
return pdev with same BDF from next segment.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/pci.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 938821e593..29356d59a7 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -593,13 +593,10 @@ struct pci_dev *pci_get_pdev(int seg, int bus, int devfn)
             return NULL;
     }
 
-    do {
-        list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
-            if ( (pdev->bus == bus || bus == -1) &&
-                 (pdev->devfn == devfn || devfn == -1) )
-                return pdev;
-    } while ( radix_tree_gang_lookup(&pci_segments, (void **)&pseg,
-                                     pseg->nr + 1, 1) );
+    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
+        if ( (pdev->bus == bus || bus == -1) &&
+             (pdev->devfn == devfn || devfn == -1) )
+            return pdev;
 
     return NULL;
 }
@@ -642,14 +639,11 @@ struct pci_dev *pci_get_pdev_by_domain(const struct domain *d, int seg,
             return NULL;
     }
 
-    do {
-        list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
-            if ( (pdev->bus == bus || bus == -1) &&
-                 (pdev->devfn == devfn || devfn == -1) &&
-                 (pdev->domain == d) )
-                return pdev;
-    } while ( radix_tree_gang_lookup(&pci_segments, (void **)&pseg,
-                                     pseg->nr + 1, 1) );
+    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
+        if ( (pdev->bus == bus || bus == -1) &&
+             (pdev->devfn == devfn || devfn == -1) &&
+             (pdev->domain == d) )
+            return pdev;
 
     return NULL;
 }
-- 
2.25.1


