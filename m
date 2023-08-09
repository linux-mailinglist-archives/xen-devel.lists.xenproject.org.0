Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5854C775729
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 12:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580830.909271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgVi-0006v8-D5; Wed, 09 Aug 2023 10:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580830.909271; Wed, 09 Aug 2023 10:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgVi-0006si-9d; Wed, 09 Aug 2023 10:33:50 +0000
Received: by outflank-mailman (input) for mailman id 580830;
 Wed, 09 Aug 2023 10:33:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTgVg-0006oL-Is
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 10:33:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgVg-0005Ho-6p; Wed, 09 Aug 2023 10:33:48 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgVf-0000jc-VN; Wed, 09 Aug 2023 10:33:48 +0000
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
	bh=WDE+FPlIuV/hN9LV2qapinnwY81PAynIDFvx+oUY3q0=; b=2/HvtZVAIIxaq4laM3RlmqP9u/
	KlqMLwy4JjvxKWssqvOY5gbS2KIst6EDtSw8xcXVYDlPTEL/xmqKkpjEFYiny8Z6dCEANSSkIDUnr
	D4P7cDFz0lktOvORmbw1TtcPHWUg1x8y14V4Eza4I+6sgmulDoiXTQ1gbqypVd9Yg4Yo=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/2] tools/libs: light: Remove the variable 'domainid' do_pci_remove()
Date: Wed,  9 Aug 2023 11:33:04 +0100
Message-Id: <20230809103305.30561-2-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230809103305.30561-1-julien@xen.org>
References: <20230809103305.30561-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The function do_pci_remove() has two local variables 'domid' and
'domainid' containing the same value.

Looking at the history, until 2cf3b50dcd8b ("libxl_pci: Use
libxl__ao_device with pci_remove") the two variables may have
different value when using a stubdomain.

As this is not the case now, remove 'domainid'. This will reduce
the confusion between the two variables.

Note that there are other places in libxl_pci.c which are using
the two confusing names within the same function. They are left
unchanged for now.

No functional changes intented.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/libs/light/libxl_pci.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 27d9dbff2522..7f5f170e6eb0 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1953,8 +1953,6 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
     libxl_domain_type type = libxl__domain_type(gc, domid);
     libxl_device_pci *pci = &prs->pci;
     int rc, num;
-    uint32_t domainid = domid;
-
     pcis = libxl_device_pci_list(ctx, domid, &num);
     if (!pcis) {
         rc = ERROR_FAIL;
@@ -1966,7 +1964,7 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
 
     rc = ERROR_INVAL;
     if (!attached) {
-        LOGD(ERROR, domainid, "PCI device not attached to this domain");
+        LOGD(ERROR, domid, "PCI device not attached to this domain");
         goto out_fail;
     }
 
@@ -2000,7 +1998,7 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
         int i;
 
         if (f == NULL) {
-            LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
+            LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
             goto skip1;
         }
         for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
@@ -2011,7 +2009,7 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
                 if (flags & PCI_BAR_IO) {
                     rc = xc_domain_ioport_permission(ctx->xch, domid, start, size, 0);
                     if (rc < 0)
-                        LOGED(ERROR, domainid,
+                        LOGED(ERROR, domid,
                               "xc_domain_ioport_permission error 0x%x/0x%x",
                               start,
                               size);
@@ -2019,7 +2017,7 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
                     rc = xc_domain_iomem_permission(ctx->xch, domid, start>>XC_PAGE_SHIFT,
                                                     (size+(XC_PAGE_SIZE-1))>>XC_PAGE_SHIFT, 0);
                     if (rc < 0)
-                        LOGED(ERROR, domainid,
+                        LOGED(ERROR, domid,
                               "xc_domain_iomem_permission error 0x%x/0x%x",
                               start,
                               size);
@@ -2034,17 +2032,17 @@ skip1:
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
-- 
2.40.1


