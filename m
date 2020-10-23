Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACBB297381
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11163.29625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzqq-0008Gp-2P; Fri, 23 Oct 2020 16:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11163.29625; Fri, 23 Oct 2020 16:23:36 +0000
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
	id 1kVzqp-0008Fx-SL; Fri, 23 Oct 2020 16:23:35 +0000
Received: by outflank-mailman (input) for mailman id 11163;
 Fri, 23 Oct 2020 16:23:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVzqn-00081j-S5
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:23:33 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0477d06b-3336-4a5f-a8a5-3a15c8eb6455;
 Fri, 23 Oct 2020 16:23:24 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqd-0008JG-Iu; Fri, 23 Oct 2020 16:23:23 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqd-000376-B2; Fri, 23 Oct 2020 16:23:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVzqn-00081j-S5
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:23:33 +0000
X-Inumbo-ID: 0477d06b-3336-4a5f-a8a5-3a15c8eb6455
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0477d06b-3336-4a5f-a8a5-3a15c8eb6455;
	Fri, 23 Oct 2020 16:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=Uuq1zUW4SAXAEEW1C7Mx/Yysa/gBiK1oEft0ZGe17wc=; b=fpFK1KTwSmcH68N2XsSoIj34a
	T0iSmGw9/zEGiO63+ojlY18FPhklxXidcw/oty9m+CDCoD8l/nMg+cahmy19zlJwv8gIHqIdtyDnL
	TKlzN5bk8gpkvHJYZftJc7wFr1qDyMnowoYQtDVCkJwaNfQQAf8quea5dQCAZh/xhgLkE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqd-0008JG-Iu; Fri, 23 Oct 2020 16:23:23 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqd-000376-B2; Fri, 23 Oct 2020 16:23:23 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 04/25] libxl: s/domainid/domid/g in libxl_pci.c
Date: Fri, 23 Oct 2020 16:22:53 +0000
Message-Id: <20201023162314.2235-5-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

It's pointless having two stack variables to hold exactly the same value.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 43 ++++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 515e74fe5a..58242b5b94 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1326,8 +1326,7 @@ static void pci_add_dm_done(libxl__egc *egc,
     int irq, i;
     int r;
     uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
-    uint32_t domainid = domid;
-    bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
+    bool isstubdom = libxl_is_stubdom(ctx, domid, &domid);
 
     /* Convenience aliases */
     bool starting = pas->starting;
@@ -1349,7 +1348,7 @@ static void pci_add_dm_done(libxl__egc *egc,
     irq = 0;
 
     if (f == NULL) {
-        LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
+        LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
         rc = ERROR_FAIL;
         goto out;
     }
@@ -1361,7 +1360,7 @@ static void pci_add_dm_done(libxl__egc *egc,
             if (flags & PCI_BAR_IO) {
                 r = xc_domain_ioport_permission(ctx->xch, domid, start, size, 1);
                 if (r < 0) {
-                    LOGED(ERROR, domainid,
+                    LOGED(ERROR, domid,
                           "xc_domain_ioport_permission 0x%llx/0x%llx (error %d)",
                           start, size, r);
                     fclose(f);
@@ -1372,7 +1371,7 @@ static void pci_add_dm_done(libxl__egc *egc,
                 r = xc_domain_iomem_permission(ctx->xch, domid, start>>XC_PAGE_SHIFT,
                                                 (size+(XC_PAGE_SIZE-1))>>XC_PAGE_SHIFT, 1);
                 if (r < 0) {
-                    LOGED(ERROR, domainid,
+                    LOGED(ERROR, domid,
                           "xc_domain_iomem_permission 0x%llx/0x%llx (error %d)",
                           start, size, r);
                     fclose(f);
@@ -1387,13 +1386,13 @@ static void pci_add_dm_done(libxl__egc *egc,
                                 pci->bus, pci->dev, pci->func);
     f = fopen(sysfs_path, "r");
     if (f == NULL) {
-        LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
+        LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
         goto out_no_irq;
     }
     if ((fscanf(f, "%u", &irq) == 1) && irq) {
         r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
         if (r < 0) {
-            LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
+            LOGED(ERROR, domid, "xc_physdev_map_pirq irq=%d (error=%d)",
                   irq, r);
             fclose(f);
             rc = ERROR_FAIL;
@@ -1401,7 +1400,7 @@ static void pci_add_dm_done(libxl__egc *egc,
         }
         r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
         if (r < 0) {
-            LOGED(ERROR, domainid,
+            LOGED(ERROR, domid,
                   "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
             fclose(f);
             rc = ERROR_FAIL;
@@ -1414,7 +1413,7 @@ static void pci_add_dm_done(libxl__egc *egc,
     if (pci->permissive) {
         if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/permissive",
                              pci) < 0 ) {
-            LOGD(ERROR, domainid, "Setting permissive for device");
+            LOGD(ERROR, domid, "Setting permissive for device");
             rc = ERROR_FAIL;
             goto out;
         }
@@ -1425,13 +1424,13 @@ out_no_irq:
         if (pci->rdm_policy == LIBXL_RDM_RESERVE_POLICY_STRICT) {
             flag &= ~XEN_DOMCTL_DEV_RDM_RELAXED;
         } else if (pci->rdm_policy != LIBXL_RDM_RESERVE_POLICY_RELAXED) {
-            LOGED(ERROR, domainid, "unknown rdm check flag.");
+            LOGED(ERROR, domid, "unknown rdm check flag.");
             rc = ERROR_FAIL;
             goto out;
         }
         r = xc_assign_device(ctx->xch, domid, pci_encode_bdf(pci), flag);
         if (r < 0 && (hvm || errno != ENOSYS)) {
-            LOGED(ERROR, domainid, "xc_assign_device failed");
+            LOGED(ERROR, domid, "xc_assign_device failed");
             rc = ERROR_FAIL;
             goto out;
         }
@@ -1877,7 +1876,6 @@ static void do_pci_remove(libxl__egc *egc, uint32_t domid,
     libxl_device_pci *assigned;
     libxl_domain_type type = libxl__domain_type(gc, domid);
     int rc, num;
-    uint32_t domainid = domid;
 
     assigned = libxl_device_pci_list(ctx, domid, &num);
     if (assigned == NULL) {
@@ -1889,7 +1887,7 @@ static void do_pci_remove(libxl__egc *egc, uint32_t domid,
     rc = ERROR_INVAL;
     if ( !is_pci_in_array(assigned, num, pci->domain,
                           pci->bus, pci->dev, pci->func) ) {
-        LOGD(ERROR, domainid, "PCI device not attached to this domain");
+        LOGD(ERROR, domid, "PCI device not attached to this domain");
         goto out_fail;
     }
 
@@ -1925,7 +1923,7 @@ static void do_pci_remove(libxl__egc *egc, uint32_t domid,
         int i;
 
         if (f == NULL) {
-            LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
+            LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
             goto skip1;
         }
         for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
@@ -1936,7 +1934,7 @@ static void do_pci_remove(libxl__egc *egc, uint32_t domid,
                 if (flags & PCI_BAR_IO) {
                     rc = xc_domain_ioport_permission(ctx->xch, domid, start, size, 0);
                     if (rc < 0)
-                        LOGED(ERROR, domainid,
+                        LOGED(ERROR, domid,
                               "xc_domain_ioport_permission error 0x%x/0x%x",
                               start,
                               size);
@@ -1944,7 +1942,7 @@ static void do_pci_remove(libxl__egc *egc, uint32_t domid,
                     rc = xc_domain_iomem_permission(ctx->xch, domid, start>>XC_PAGE_SHIFT,
                                                     (size+(XC_PAGE_SIZE-1))>>XC_PAGE_SHIFT, 0);
                     if (rc < 0)
-                        LOGED(ERROR, domainid,
+                        LOGED(ERROR, domid,
                               "xc_domain_iomem_permission error 0x%x/0x%x",
                               start,
                               size);
@@ -1957,17 +1955,17 @@ skip1:
                                pci->bus, pci->dev, pci->func);
         f = fopen(sysfs_path, "r");
         if (f == NULL) {
-            LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
+            LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
             goto skip_irq;
         }
         if ((fscanf(f, "%u", &irq) == 1) && irq) {
             rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
             if (rc < 0) {
-                LOGED(ERROR, domainid, "xc_physdev_unmap_pirq irq=%d", irq);
+                LOGED(ERROR, domid, "xc_physdev_unmap_pirq irq=%d", irq);
             }
             rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
             if (rc < 0) {
-                LOGED(ERROR, domainid, "xc_domain_irq_permission irq=%d", irq);
+                LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
             }
         }
         fclose(f);
@@ -2152,12 +2150,11 @@ static void pci_remove_detatched(libxl__egc *egc,
 {
     STATE_AO_GC(prs->aodev->ao);
     int stubdomid = 0;
-    uint32_t domainid = prs->domid;
+    uint32_t domid = prs->domid;
     bool isstubdom;
 
     /* Convenience aliases */
     libxl_device_pci *const pci = prs->pci;
-    libxl_domid domid = prs->domid;
 
     /* Cleaning QMP states ASAP */
     libxl__ev_qmp_dispose(gc, &prs->qmp);
@@ -2167,7 +2164,7 @@ static void pci_remove_detatched(libxl__egc *egc,
     if (rc && !prs->force)
         goto out;
 
-    isstubdom = libxl_is_stubdom(CTX, domid, &domainid);
+    isstubdom = libxl_is_stubdom(CTX, domid, &domid);
 
     /* don't do multiple resets while some functions are still passed through */
     if ((pci->vdevfn & 0x7) == 0) {
@@ -2177,7 +2174,7 @@ static void pci_remove_detatched(libxl__egc *egc,
     if (!isstubdom) {
         rc = xc_deassign_device(CTX->xch, domid, pci_encode_bdf(pci));
         if (rc < 0 && (prs->hvm || errno != ENOSYS))
-            LOGED(ERROR, domainid, "xc_deassign_device failed");
+            LOGED(ERROR, domid, "xc_deassign_device failed");
     }
 
     stubdomid = libxl_get_stubdom_id(CTX, domid);
-- 
2.11.0


