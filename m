Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E67077572A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 12:34:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580831.909281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgVj-0007Ap-Lz; Wed, 09 Aug 2023 10:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580831.909281; Wed, 09 Aug 2023 10:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgVj-00077o-IQ; Wed, 09 Aug 2023 10:33:51 +0000
Received: by outflank-mailman (input) for mailman id 580831;
 Wed, 09 Aug 2023 10:33:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTgVi-0006sd-2B
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 10:33:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgVh-0005I9-Tn; Wed, 09 Aug 2023 10:33:49 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgVh-0000jc-Lk; Wed, 09 Aug 2023 10:33:49 +0000
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
	bh=MdXl/LIdvThA4/9huGT3jC+CrkA+9dM8EtHZn3fXDBQ=; b=0QjX//y0RAiMGmUeH+NGDbojgD
	frnXw4yz11KsytPMO53DMTb+n0idG8h5Neec06evTsgzcwrXm6QAIO3QRf4UYrTTc65xlmM9X63rl
	H80IQXc239uajd++L9zxnjag4puAEONZaY9ibGihVgtKumIzErBfFjGZwA6qbX64tJHg=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] tools/light: Revoke permissions when a PCI detach for HVM domain
Date: Wed,  9 Aug 2023 11:33:05 +0100
Message-Id: <20230809103305.30561-3-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230809103305.30561-1-julien@xen.org>
References: <20230809103305.30561-1-julien@xen.org>
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
the revocation is now moved in a separate function which is called
from pci_remove_detached().

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

TODO: I am getting a bit confused with the async work in libxl. I am
not entirely sure whether pci_remove_detached() is the correct place
to revoke.

TODO: For HVM, we are now getting the following error on detach:
libxl: error: libxl_pci.c:2009:pci_revoke_permissions: Domain 3:xc_physdev_unmap_pirq irq=23: Invalid argument

This is because the IRQ was unmapped by QEMU. It doesn't feel
right to skip the call. So maybe we can ignore the error?
---
 tools/libs/light/libxl_pci.c | 142 ++++++++++++++++++++---------------
 1 file changed, 80 insertions(+), 62 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 7f5f170e6eb0..f5a4b88eb2c0 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1943,6 +1943,79 @@ static void pci_remove_stubdom_done(libxl__egc *egc,
 static void pci_remove_done(libxl__egc *egc,
     pci_remove_state *prs, int rc);
 
+static void pci_revoke_permissions(libxl__egc *egc, pci_remove_state *prs)
+{
+    STATE_AO_GC(prs->aodev->ao);
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+    const libxl_device_pci *pci = &prs->pci;
+    const char *sysfs_path;
+    uint32_t domid = prs->domid;
+    FILE *f;
+    unsigned int start = 0, end = 0, flags = 0, size = 0;
+    int irq = 0;
+    int i, rc;
+
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
+                rc = xc_domain_ioport_permission(ctx->xch, domid, start, size, 0);
+                if (rc < 0)
+                    LOGED(ERROR, domid,
+                          "xc_domain_ioport_permission error 0x%x/0x%x",
+                          start,
+                          size);
+            } else {
+                rc = xc_domain_iomem_permission(ctx->xch, domid, start>>XC_PAGE_SHIFT,
+                                                (size+(XC_PAGE_SIZE-1))>>XC_PAGE_SHIFT, 0);
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
+        return;
+
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
+                           pci->bus, pci->dev, pci->func);
+
+    f = fopen(sysfs_path, "r");
+    if (f == NULL) {
+        LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
+        return;
+    }
+
+    if ((fscanf(f, "%u", &irq) == 1) && irq) {
+        rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
+        if (rc < 0) {
+            LOGED(ERROR, domid, "xc_physdev_unmap_pirq irq=%d", irq);
+        }
+        rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
+        if (rc < 0) {
+            LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
+        }
+    }
+
+    fclose(f);
+}
+
 static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
 {
     STATE_AO_GC(prs->aodev->ao);
@@ -1968,7 +2041,6 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
         goto out_fail;
     }
 
-    rc = ERROR_FAIL;
     if (type == LIBXL_DOMAIN_TYPE_HVM) {
         prs->hvm = true;
         switch (libxl__device_model_version_running(gc, domid)) {
@@ -1980,75 +2052,19 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
             prs->xswait.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
             prs->xswait.callback = pci_remove_qemu_trad_watch_state_cb;
             rc = libxl__xswait_start(gc, &prs->xswait);
-            if (rc) goto out_fail;
-            return;
+            if (!rc) return;
+            break;
         case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
             pci_remove_qmp_device_del(egc, prs); /* must be last */
             return;
         default:
             rc = ERROR_INVAL;
-            goto out_fail;
+            break;
         }
     } else {
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
+        rc = 0;
     }
-skip_irq:
-    rc = 0;
+
 out_fail:
     pci_remove_detached(egc, prs, rc); /* must be last */
 }
@@ -2242,6 +2258,8 @@ static void pci_remove_detached(libxl__egc *egc,
     if (rc && !prs->force)
         goto out;
 
+    pci_revoke_permissions(egc, prs);
+
     isstubdom = libxl_is_stubdom(CTX, domid, &domainid);
 
     /* don't do multiple resets while some functions are still passed through */
-- 
2.40.1


