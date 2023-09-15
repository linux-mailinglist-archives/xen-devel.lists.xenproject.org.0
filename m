Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E6B7A1F38
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 14:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603133.940035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh8Is-00055H-2h; Fri, 15 Sep 2023 12:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603133.940035; Fri, 15 Sep 2023 12:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh8Ir-00052I-VX; Fri, 15 Sep 2023 12:52:09 +0000
Received: by outflank-mailman (input) for mailman id 603133;
 Fri, 15 Sep 2023 12:52:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qh8Iq-00052C-CB
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 12:52:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qh8Ip-0003M5-LO; Fri, 15 Sep 2023 12:52:07 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qh8Ip-0000Am-93; Fri, 15 Sep 2023 12:52:07 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=TgbWgVqJYFklDRXTfxuDdZGkTlQvmt/ixcBP2ZGtcoY=; b=TNIg38
	PztBXw1shwLa6h+aXlyOwp+L9tkMYvvo0GbRzRjZhV4vsOhErzqSP5qBPIoy0FochebSKOc/v4Tv4
	Q3ncuN+fg19az95KGIuuL4V4ZwafUx/3F51eECgCzWZXqrQ9KanI3bbYoiBSnwl0EZ+p3zMYkP31p
	QUNmO1H4riY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.18 v2] tools/light: Revoke permissions when a PCI detach for HVM domain
Date: Fri, 15 Sep 2023 13:52:04 +0100
Message-Id: <20230915125204.22719-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Currently, libxl will grant IOMEM, I/O port and IRQ permissions when
a PCI is attached (see pci_add_dm_done()) for all domain types. However,
the permissions are only revoked for non-HVM domain (see do_pci_remove()).

This means that HVM domains will be left with extra permissions. While
this look bad on the paper, the IRQ permissions should be revoked
when the Device Model call xc_physdev_unmap_pirq() and such domain
cannot directly mapped I/O port and IOMEM regions. Instead, this has to
be done by a Device Model.

The Device Model can only run in dom0 or PV stubdomain (upstream libxl
doesn't have support for HVM/PVH stubdomain).

For PV/PVH stubdomain, the permission are properly revoked, so there is
no security concern.

This leaves dom0. There are two cases:
  1) Privileged: Anyone gaining access to the Device Model would already
     have large control on the host.
  2) Deprivileged: PCI passthrough require PHYSDEV operations which
     are not accessible when the Device Model is restricted.

So overall, it is believed that the extra permissions cannot be exploited.

Rework the code so the permissions are all removed for HVM domains.
This needs to happen after the QEMU has detached the device. So
the revocation is now moved to pci_remove_detached().

Also add a comment on top of the error message when the PIRQ cannot
be unbind to explain this could be a spurious error as QEMU may have
already done it.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

    Changes since v1:
        * Move the code to revoke in pci_remove_detached()
        * Add a comment on top of the PIRQ unbind error path
        * Use goto to deal with errors.
---
 tools/libs/light/libxl_pci.c | 137 ++++++++++++++++++++---------------
 1 file changed, 77 insertions(+), 60 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 7f5f170e6eb0..96cb4da0794e 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1968,7 +1968,6 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
         goto out_fail;
     }
 
-    rc = ERROR_FAIL;
     if (type == LIBXL_DOMAIN_TYPE_HVM) {
         prs->hvm = true;
         switch (libxl__device_model_version_running(gc, domid)) {
@@ -1989,65 +1988,7 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
             rc = ERROR_INVAL;
             goto out_fail;
         }
-    } else {
-        char *sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pci->domain,
-                                     pci->bus, pci->dev, pci->func);
-        FILE *f = fopen(sysfs_path, "r");
-        unsigned int start = 0, end = 0, flags = 0, size = 0;
-        int irq = 0;
-        int i;
-
-        if (f == NULL) {
-            LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
-            goto skip1;
-        }
-        for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
-            if (fscanf(f, "0x%x 0x%x 0x%x\n", &start, &end, &flags) != 3)
-                continue;
-            size = end - start + 1;
-            if (start) {
-                if (flags & PCI_BAR_IO) {
-                    rc = xc_domain_ioport_permission(ctx->xch, domid, start, size, 0);
-                    if (rc < 0)
-                        LOGED(ERROR, domid,
-                              "xc_domain_ioport_permission error 0x%x/0x%x",
-                              start,
-                              size);
-                } else {
-                    rc = xc_domain_iomem_permission(ctx->xch, domid, start>>XC_PAGE_SHIFT,
-                                                    (size+(XC_PAGE_SIZE-1))>>XC_PAGE_SHIFT, 0);
-                    if (rc < 0)
-                        LOGED(ERROR, domid,
-                              "xc_domain_iomem_permission error 0x%x/0x%x",
-                              start,
-                              size);
-                }
-            }
-        }
-        fclose(f);
-skip1:
-        if (!pci_supp_legacy_irq())
-            goto skip_irq;
-        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
-                               pci->bus, pci->dev, pci->func);
-        f = fopen(sysfs_path, "r");
-        if (f == NULL) {
-            LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
-            goto skip_irq;
-        }
-        if ((fscanf(f, "%u", &irq) == 1) && irq) {
-            rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
-            if (rc < 0) {
-                LOGED(ERROR, domid, "xc_physdev_unmap_pirq irq=%d", irq);
-            }
-            rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
-            if (rc < 0) {
-                LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
-            }
-        }
-        fclose(f);
     }
-skip_irq:
     rc = 0;
 out_fail:
     pci_remove_detached(egc, prs, rc); /* must be last */
@@ -2226,7 +2167,11 @@ static void pci_remove_detached(libxl__egc *egc,
                                 int rc)
 {
     STATE_AO_GC(prs->aodev->ao);
-    int stubdomid = 0;
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+    unsigned int start = 0, end = 0, flags = 0, size = 0;
+    int  irq = 0, i, stubdomid = 0;
+    const char *sysfs_path;
+    FILE *f;
     uint32_t domainid = prs->domid;
     bool isstubdom;
 
@@ -2242,6 +2187,78 @@ static void pci_remove_detached(libxl__egc *egc,
     if (rc && !prs->force)
         goto out;
 
+    /* Revoke the permissions */
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource",
+                           pci->domain, pci->bus, pci->dev, pci->func);
+
+    f = fopen(sysfs_path, "r");
+    if (f == NULL) {
+        LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
+        goto skip_bar;
+    }
+
+    for (i = 0; i < PROC_PCI_NUM_RESOURCES; i++) {
+        if (fscanf(f, "0x%x 0x%x 0x%x\n", &start, &end, &flags) != 3)
+            continue;
+        size = end - start + 1;
+        if (start) {
+            if (flags & PCI_BAR_IO) {
+                rc = xc_domain_ioport_permission(ctx->xch, domid, start,
+                                                 size, 0);
+                if (rc < 0)
+                    LOGED(ERROR, domid,
+                          "xc_domain_ioport_permission error 0x%x/0x%x",
+                          start,
+                          size);
+            } else {
+                rc = xc_domain_iomem_permission(ctx->xch, domid,
+                                                start >> XC_PAGE_SHIFT,
+                                                (size + (XC_PAGE_SIZE - 1)) >> XC_PAGE_SHIFT,
+                                                0);
+                if (rc < 0)
+                    LOGED(ERROR, domid,
+                          "xc_domain_iomem_permission error 0x%x/0x%x",
+                          start,
+                          size);
+            }
+        }
+    }
+    fclose(f);
+
+skip_bar:
+    if (!pci_supp_legacy_irq())
+        goto skip_legacy_irq;
+
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+                           pci->bus, pci->dev, pci->func);
+
+    f = fopen(sysfs_path, "r");
+    if (f == NULL) {
+        LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
+        goto skip_legacy_irq;
+    }
+
+    if ((fscanf(f, "%u", &irq) == 1) && irq) {
+        rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
+        if (rc < 0) {
+            /*
+             * QEMU may have already unmapped the IRQ. So the error
+             * may be spurious. For now, still print an error message as
+             * it is not easy to distinguished between valid and
+             * spurious error.
+             */
+            LOGED(ERROR, domid, "xc_physdev_unmap_pirq irq=%d", irq);
+        }
+        rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
+        if (rc < 0) {
+            LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
+        }
+    }
+
+    fclose(f);
+
+skip_legacy_irq:
+
     isstubdom = libxl_is_stubdom(CTX, domid, &domainid);
 
     /* don't do multiple resets while some functions are still passed through */
-- 
2.40.1


