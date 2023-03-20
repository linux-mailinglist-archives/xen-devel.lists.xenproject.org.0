Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3FF6C06BD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 01:07:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511692.790834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pe32O-0000gf-2G; Mon, 20 Mar 2023 00:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511692.790834; Mon, 20 Mar 2023 00:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pe32N-0000e3-Vs; Mon, 20 Mar 2023 00:06:07 +0000
Received: by outflank-mailman (input) for mailman id 511692;
 Mon, 20 Mar 2023 00:06:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkzI=7M=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pe32L-0000dx-Ip
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 00:06:05 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff3bd85a-c6b2-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 01:06:01 +0100 (CET)
Received: by mail-qt1-x833.google.com with SMTP id d7so11378170qtr.12
 for <xen-devel@lists.xenproject.org>; Sun, 19 Mar 2023 17:06:01 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:80c9:20df:afaa:e9a2])
 by smtp.gmail.com with ESMTPSA id
 b6-20020ac87546000000b003d29e23e214sm5436063qtr.82.2023.03.19.17.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Mar 2023 17:05:59 -0700 (PDT)
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
X-Inumbo-ID: ff3bd85a-c6b2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679270760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5a1JyWJg/Pu62/RjBhcMGBP6W8dtaT/x8zVZREFg0Dk=;
        b=afyHVdhhB1o8XlPlFKUzbGzLZZFpEQ+X8A+V1Yyz7eQzogxmnxMM5eQoywfTfa6wGt
         oSgpSvZ6kbOIBED0D61nibQXJbm4tZCt03ivrSjq/zkFdnTOvrR8RFR8mSLSV5BmICy1
         hXSDRFLOPE/YEZGoOBLlfJjn66uceDG8kCVEv/H89cXUT+eAi961llEm7UfLKSgg8QEK
         g3K/p0UAJTl/E/bsNxPSW1pWG6tteGH23BJmhim2i1VLFti5MDSUcdoyQrtH0n/X+ibg
         HGxmg3PnXWymZCRDZ9J08iqw84XT83ab07vn48DX7KPj2njri5+R7nRNMj+V/+nQCJAx
         kDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679270760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5a1JyWJg/Pu62/RjBhcMGBP6W8dtaT/x8zVZREFg0Dk=;
        b=HbwnQ+F1BpUDrcNhDzvgT1zBezpE3cuSWENGJPzQbtxzF2FZdLKfc/rbmBfptt9kJe
         Cu23WmhFEMPxm/tZdm+RHD0YuNt16PWOAVS3tBgNiKrOpZD2ZqWlKooc0luMWDv3ftl0
         XebB+PrNxLvdZPzX8tOc8haBuwYYjawsijCp9+8AYMWa1sP4XzmYE91neDpY7rTJmB+b
         QLwRceZJEVAMFdnKutUmUSOP8+nJ6WHXgs5SPYqn9jZhQ9s3DzQ53CBkQMDERvTpQicg
         QhAo2U0zk6O+nMIRh+LJoaFKNycjjRy76dbTO5hSKGvDYHGO9ZsDxkxIXm87nDdQEsbD
         BuOA==
X-Gm-Message-State: AO0yUKUlJ4Z7moEQlUVTr262FZ0PFayvWMSZz/CObOXndct42lOBPgBv
	GPJrv+LJyXhz/0MghH+F1vo=
X-Google-Smtp-Source: AK7set+Zo684WUfcxnUtAPjO/39U3tutzblM/k8Yw/nvLEiezgMMLgrx8x0tgn+9VonzLIYHffsBPA==
X-Received: by 2002:a05:622a:118b:b0:3bf:db54:b622 with SMTP id m11-20020a05622a118b00b003bfdb54b622mr25089122qtk.30.1679270760188;
        Sun, 19 Mar 2023 17:06:00 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH] xen: Fix host pci for stubdom
Date: Sun, 19 Mar 2023 20:05:54 -0400
Message-Id: <20230320000554.8219-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PCI passthrough for an HVM with a stubdom is PV PCI passthrough from
dom0 to the stubdom, and then QEMU passthrough of the PCI device inside
the stubdom.  xen-pciback has boolean module param passthrough which
controls "how to export PCI topology to guest".  If passthrough=1, the
frontend shows a PCI SBDF matching the backend host device.  When
passthough=0, the frontend will get a sequentially allocated SBDF.

libxl passes the host SBDF over QMP to QEMU.  For non-stubdom or stubdom
with passthrough=1, this works fine.  However, it fails for
passthrough=0 when QEMU can't find the sysfs node for the host SBDF.

Handle all these cases.  Look for the xenstore frontend nodes.  If they
are missing, then default to using the QMP command provided SBDF.  This
is the non-stubdom case.  If xenstore nodes are found, then read the
local SBDF from the xenstore nodes.  This will handle either
passthrough=0/1 case.

Based on a stubdom-specific patch originally by Marek
Marczykowski-Górecki <marmarek@invisiblethingslab.com>, which is based
on earlier work by HW42 <hw42@ipsumj.de>

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 hw/xen/xen-host-pci-device.c | 96 +++++++++++++++++++++++++++++++++++-
 hw/xen/xen-host-pci-device.h |  6 +++
 2 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
index 8c6e9a1716..51a72b432d 100644
--- a/hw/xen/xen-host-pci-device.c
+++ b/hw/xen/xen-host-pci-device.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/cutils.h"
+#include "hw/xen/xen-legacy-backend.h"
 #include "xen-host-pci-device.h"
 
 #define XEN_HOST_PCI_MAX_EXT_CAP \
@@ -33,13 +34,101 @@
 #define IORESOURCE_PREFETCH     0x00001000      /* No side effects */
 #define IORESOURCE_MEM_64       0x00100000
 
+/*
+ * Non-passthrough (dom0) accesses are local PCI devices and use the given BDF
+ * Passthough (stubdom) accesses are through PV frontend PCI device.  Those
+ * either have a BDF identical to the backend's BFD (xen-backend.passthrough=1)
+ * or a local virtual BDF (xen-backend.passthrough=0)
+ *
+ * We are always given the backend's BDF and need to lookup the appropriate
+ * local BDF for sysfs access.
+ */
+static void xen_host_pci_fill_local_addr(XenHostPCIDevice *d, Error **errp)
+{
+    unsigned int num_devs, len, i;
+    unsigned int domain, bus, dev, func;
+    char *be_path;
+    char path[80];
+    char *msg;
+
+    be_path = qemu_xen_xs_read(xenstore, 0, "device/pci/0/backend", &len);
+    if (!be_path) {
+        /*
+         * be_path doesn't exist, so we are dealing with a local
+         * (non-passthough) device.
+         */
+        d->local_domain = d->domain;
+        d->local_bus = d->bus;
+        d->local_dev = d->dev;
+        d->local_func = d->func;
+
+        return;
+    }
+
+    snprintf(path, sizeof(path), "%s/num_devs", be_path);
+    msg = qemu_xen_xs_read(xenstore, 0, path, &len);
+    if (!msg) {
+        goto err_out;
+    }
+
+    if (sscanf(msg, "%u", &num_devs) != 1) {
+        error_setg(errp, "Failed to parse %s (%s)", msg, path);
+        goto err_out;
+    }
+    free(msg);
+
+    for (i = 0; i < num_devs; i++) {
+        snprintf(path, sizeof(path), "%s/dev-%u", be_path, i);
+        msg = qemu_xen_xs_read(xenstore, 0, path, &len);
+        if (!msg) {
+            error_setg(errp, "Failed to read %s", path);
+            goto err_out;
+        }
+        if (sscanf(msg, "%x:%x:%x.%x", &domain, &bus, &dev, &func) != 4) {
+            error_setg(errp, "Failed to parse %s (%s)", msg, path);
+            goto err_out;
+        }
+        free(msg);
+        if (domain != d->domain ||
+            bus != d->bus ||
+            dev != d->dev ||
+            func != d->func)
+            continue;
+        snprintf(path, sizeof(path), "%s/vdev-%u", be_path, i);
+        msg = qemu_xen_xs_read(xenstore, 0, path, &len);
+        if (!msg) {
+            error_setg(errp, "Failed to read %s", path);
+            goto out;
+        }
+        if (sscanf(msg, "%x:%x:%x.%x", &domain, &bus, &dev, &func) != 4) {
+            error_setg(errp, "Failed to parse %s (%s)", msg, path);
+            goto err_out;
+        }
+        free(msg);
+        d->local_domain = domain;
+        d->local_bus = bus;
+        d->local_dev = dev;
+        d->local_func = func;
+        goto out;
+    }
+
+    error_setg(errp, "Failed to find local %x:%x:%x.%x", d->domain, d->bus,
+               d->dev, d->func);
+
+err_out:
+    free(msg);
+out:
+    free(be_path);
+}
+
 static void xen_host_pci_sysfs_path(const XenHostPCIDevice *d,
                                     const char *name, char *buf, ssize_t size)
 {
     int rc;
 
     rc = snprintf(buf, size, "/sys/bus/pci/devices/%04x:%02x:%02x.%d/%s",
-                  d->domain, d->bus, d->dev, d->func, name);
+                  d->local_domain, d->local_bus, d->local_dev, d->local_func,
+                  name);
     assert(rc >= 0 && rc < size);
 }
 
@@ -342,6 +431,11 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
     d->dev = dev;
     d->func = func;
 
+    xen_host_pci_fill_local_addr(d, errp);
+    if (*errp) {
+        goto error;
+    }
+
     xen_host_pci_config_open(d, errp);
     if (*errp) {
         goto error;
diff --git a/hw/xen/xen-host-pci-device.h b/hw/xen/xen-host-pci-device.h
index 4d8d34ecb0..270dcb27f7 100644
--- a/hw/xen/xen-host-pci-device.h
+++ b/hw/xen/xen-host-pci-device.h
@@ -23,6 +23,12 @@ typedef struct XenHostPCIDevice {
     uint8_t dev;
     uint8_t func;
 
+    /* different from the above in case of stubdomain */
+    uint16_t local_domain;
+    uint8_t local_bus;
+    uint8_t local_dev;
+    uint8_t local_func;
+
     uint16_t vendor_id;
     uint16_t device_id;
     uint32_t class_code;
-- 
2.37.2


