Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C98F649BBB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 11:10:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459355.717085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fku-00039Z-Pd; Mon, 12 Dec 2022 10:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459355.717085; Mon, 12 Dec 2022 10:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fku-00037a-LQ; Mon, 12 Dec 2022 10:09:52 +0000
Received: by outflank-mailman (input) for mailman id 459355;
 Mon, 12 Dec 2022 10:09:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Osd=4K=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p4fkt-000356-Hy
 for xen-devel@lists.xen.org; Mon, 12 Dec 2022 10:09:51 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c840e50-7a05-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 11:09:50 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id 17so4113231pll.0
 for <xen-devel@lists.xen.org>; Mon, 12 Dec 2022 02:09:49 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 gl7-20020a17090b120700b00218f9bd50c7sm5049114pjb.50.2022.12.12.02.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 02:09:47 -0800 (PST)
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
X-Inumbo-ID: 1c840e50-7a05-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1OhuQIJQwLi/mECPz3+nkOM6kZnQjkXe5DIuu8yWRM=;
        b=W7aDKYeVvC2M4iAKKuobsZuf28O+E43xK2p3AlBXXT74VY5tOJLqiweuY1Mzk9sqg+
         iEi4iJyFkwbL15Lo9ra3gxJXS51Riiy1SyLj0R7+i2I/RN6KhZDTqY/USYgJBB1wdJOx
         URcUhvL1/Zkv2D/LoyFWcG5nIy+60Z5M2DSwcyN8iCP4ECYWYL4Ie9C30f7MkvcWBXoq
         p6nagauP+p+vx+o3/w1e1yjH0hxkBBMD9GnMqPoF+WyuX8eny/6FND95BlnOqhRIZNKb
         SdzvRlyzlm8s3zPwpmZ5tqjLzMnQo3uNCXZw2JxAQpisT+QJdV/iHmn2qbwXtlbdxe7N
         no3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1OhuQIJQwLi/mECPz3+nkOM6kZnQjkXe5DIuu8yWRM=;
        b=j5etkyl5uMPCPcmWKDbHKcuHKFSFKsGawLDFoFGCWBguBuBYIguY3HwEMMJOP9Bwc6
         EAePgev9lTu7CDnoAzABUpEczaEWU36qft9yh4Is+LmFaZbCHjvBZqZgXp+Gu7emY7Dj
         C+dj0bZhRQQumEG+s7QA3QtPynJk0NrCuk4rV5VtfCmt5+wCvZKgjVF8Sf3Q8PykfLYz
         TtF9wa4n/a/U5eqblE4WasiMy9DO4qO6JiN0kXU0AAkKRdC5ao+R817xuZtL4Fr2ii72
         uZWYKsghP5FK//3sZ63tOhuawONwRk0NMPpLL6wOocJQ0Ar6n1zt8y0TwfeGiuBWFZoR
         wI/Q==
X-Gm-Message-State: ANoB5pkAWjtF/ZhX6kbRFuuV+Jss9/p2bcesdfOobo5jAhrtfeWxmmPq
	z6ICoP2Y4PNx8aSLie7AL6mEtX9kWWDR+Fa1
X-Google-Smtp-Source: AA0mqf4ePxrnTbRobA3yKw8AqMuRWfOI8Wvy2WMPLobxyEfmcNecBdjNfxZjGtKbUW/NxONZQKa/QA==
X-Received: by 2002:a17:90b:46ce:b0:219:e613:9006 with SMTP id jx14-20020a17090b46ce00b00219e6139006mr15766979pjb.41.1670839788372;
        Mon, 12 Dec 2022 02:09:48 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH V8 1/3] libxl: Add support for generic virtio device
Date: Mon, 12 Dec 2022 15:35:53 +0530
Message-Id: <0e58df1510d7d8c0186da6620882b7c4e4035ab0.1670839220.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1670839220.git.viresh.kumar@linaro.org>
References: <cover.1670839220.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds basic support for configuring and assisting generic
Virtio backends, which could run in any domain.

An example of domain configuration for mmio based Virtio I2C device is:
virtio = ["type=virtio,device22,transport=mmio"]

To make this work on Arm, allocate Virtio MMIO params (IRQ and memory
region) and pass them to the backend and update guest device-tree to
create a DT node for the Virtio devices.

Add special support for I2C and GPIO devices, which require the
"compatible" DT property to be set, among other device specific
properties. Support for generic virtio devices is also added, which just
need a MMIO node but not any special DT properties, for such devices the
user needs to pass "virtio,device" in the "type" string.

The parsing of generic virtio device configurations will be done in a
separate commit.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/Makefile                 |   1 +
 tools/libs/light/libxl_arm.c              | 100 +++++++++++++++
 tools/libs/light/libxl_create.c           |   4 +
 tools/libs/light/libxl_internal.h         |   6 +
 tools/libs/light/libxl_types.idl          |  18 +++
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_virtio.c           | 144 ++++++++++++++++++++++
 7 files changed, 274 insertions(+)
 create mode 100644 tools/libs/light/libxl_virtio.c

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 374be1cfab25..4fddcc6f51d7 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -106,6 +106,7 @@ OBJS-y += libxl_vdispl.o
 OBJS-y += libxl_pvcalls.o
 OBJS-y += libxl_vsnd.o
 OBJS-y += libxl_vkb.o
+OBJS-y += libxl_virtio.o
 OBJS-y += libxl_genid.o
 OBJS-y += _libxl_types.o
 OBJS-y += libxl_flask.o
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index fa3d61f1e882..292b31881210 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -113,6 +113,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         }
     }
 
+    for (i = 0; i < d_config->num_virtios; i++) {
+        libxl_device_virtio *virtio = &d_config->virtios[i];
+
+        if (virtio->transport != LIBXL_VIRTIO_TRANSPORT_MMIO)
+            continue;
+
+        rc = alloc_virtio_mmio_params(gc, &virtio->base, &virtio->irq,
+                                      &virtio_mmio_base, &virtio_mmio_irq);
+
+        if (rc)
+            return rc;
+    }
+
     /*
      * Every virtio-mmio device uses one emulated SPI. If Virtio devices are
      * present, make sure that we allocate enough SPIs for them.
@@ -956,6 +969,79 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt, uint64_t base,
     return fdt_end_node(fdt);
 }
 
+/*
+ * The DT bindings for GPIO device are present here:
+ *
+ * https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml
+ */
+static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt)
+{
+    int res;
+
+    res = fdt_begin_node(fdt, "i2c");
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, VIRTIO_DEVICE_TYPE_I2C);
+    if (res) return res;
+
+    return fdt_end_node(fdt);
+}
+
+/*
+ * The DT bindings for GPIO device are present here:
+ *
+ * https://www.kernel.org/doc/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
+ */
+static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt)
+{
+    int res;
+
+    res = fdt_begin_node(fdt, "gpio");
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, VIRTIO_DEVICE_TYPE_GPIO);
+    if (res) return res;
+
+    res = fdt_property(fdt, "gpio-controller", NULL, 0);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "#gpio-cells", 2);
+    if (res) return res;
+
+    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "#interrupt-cells", 2);
+    if (res) return res;
+
+    return fdt_end_node(fdt);
+}
+
+static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
+                                        uint32_t irq, const char *type,
+                                        uint32_t backend_domid)
+{
+    int res;
+
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
+    if (res) return res;
+
+    /* Add device specific nodes */
+    if (!strcmp(type, VIRTIO_DEVICE_TYPE_I2C)) {
+        res = make_virtio_mmio_node_i2c(gc, fdt);
+        if (res) return res;
+    } else if (!strcmp(type, VIRTIO_DEVICE_TYPE_GPIO)) {
+        res = make_virtio_mmio_node_gpio(gc, fdt);
+        if (res) return res;
+    } else if (strcmp(type, VIRTIO_DEVICE_TYPE_GENERIC)) {
+        /* Doesn't match generic virtio device */
+        LOG(ERROR, "Invalid type for virtio device: %s", type);
+        return -EINVAL;
+    }
+
+    return fdt_end_node(fdt);
+}
+
 static const struct arch_info *get_arch_info(libxl__gc *gc,
                                              const struct xc_dom_image *dom)
 {
@@ -1277,6 +1363,20 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
             }
         }
 
+        for (i = 0; i < d_config->num_virtios; i++) {
+            libxl_device_virtio *virtio = &d_config->virtios[i];
+
+            if (virtio->transport != LIBXL_VIRTIO_TRANSPORT_MMIO)
+                continue;
+
+            if (virtio->backend_domid != LIBXL_TOOLSTACK_DOMID)
+                iommu_needed = true;
+
+            FDT( make_virtio_mmio_node_device(gc, fdt, virtio->base,
+                                              virtio->irq, virtio->type,
+                                              virtio->backend_domid) );
+        }
+
         /*
          * The iommu node should be created only once for all virtio-mmio
          * devices.
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 612eacfc7fac..beec3f6b6fec 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1752,6 +1752,10 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
         libxl__device_add(gc, domid, &libxl__pvcallsif_devtype,
                           &d_config->pvcallsifs[i]);
 
+    for (i = 0; i < d_config->num_virtios; i++)
+        libxl__device_add(gc, domid, &libxl__virtio_devtype,
+                          &d_config->virtios[i]);
+
     switch (d_config->c_info.type) {
     case LIBXL_DOMAIN_TYPE_HVM:
     {
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index a7c447c10e5f..97e1e66d98af 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -166,6 +166,11 @@
 /* Convert pfn to physical address space. */
 #define pfn_to_paddr(x) ((uint64_t)(x) << XC_PAGE_SHIFT)
 
+/* Virtio device types */
+#define VIRTIO_DEVICE_TYPE_GENERIC   "virtio,device"
+#define VIRTIO_DEVICE_TYPE_GPIO      "virtio,device22"
+#define VIRTIO_DEVICE_TYPE_I2C       "virtio,device29"
+
 /* logging */
 _hidden void libxl__logv(libxl_ctx *ctx, xentoollog_level msglevel, int errnoval,
              const char *file /* may be 0 */, int line /* ignored if !file */,
@@ -4003,6 +4008,7 @@ static inline int *libxl__device_type_get_num(
 
 extern const libxl__device_type libxl__vfb_devtype;
 extern const libxl__device_type libxl__vkb_devtype;
+extern const libxl__device_type libxl__virtio_devtype;
 extern const libxl__device_type libxl__disk_devtype;
 extern const libxl__device_type libxl__nic_devtype;
 extern const libxl__device_type libxl__vtpm_devtype;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9e3d33cb5a59..0cfad8508dbd 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -278,6 +278,11 @@ libxl_vkb_backend = Enumeration("vkb_backend", [
     (2, "LINUX")
     ])
 
+libxl_virtio_transport = Enumeration("virtio_transport", [
+    (0, "UNKNOWN"),
+    (1, "MMIO"),
+    ])
+
 libxl_passthrough = Enumeration("passthrough", [
     (0, "default"),
     (1, "disabled"),
@@ -703,6 +708,18 @@ libxl_device_vkb = Struct("device_vkb", [
     ("multi_touch_num_contacts", uint32)
     ])
 
+libxl_device_virtio = Struct("device_virtio", [
+    ("backend_domid", libxl_domid),
+    ("backend_domname", string),
+    ("type", string),
+    ("transport", libxl_virtio_transport),
+    ("devid", libxl_devid),
+    # Note that virtio-mmio parameters (irq and base) are for internal
+    # use by libxl and can't be modified.
+    ("irq", uint32),
+    ("base", uint64)
+    ])
+
 libxl_device_disk = Struct("device_disk", [
     ("backend_domid", libxl_domid),
     ("backend_domname", string),
@@ -980,6 +997,7 @@ libxl_domain_config = Struct("domain_config", [
     ("dtdevs", Array(libxl_device_dtdev, "num_dtdevs")),
     ("vfbs", Array(libxl_device_vfb, "num_vfbs")),
     ("vkbs", Array(libxl_device_vkb, "num_vkbs")),
+    ("virtios", Array(libxl_device_virtio, "num_virtios")),
     ("vtpms", Array(libxl_device_vtpm, "num_vtpms")),
     ("p9s", Array(libxl_device_p9, "num_p9s")),
     ("pvcallsifs", Array(libxl_device_pvcallsif, "num_pvcallsifs")),
diff --git a/tools/libs/light/libxl_types_internal.idl b/tools/libs/light/libxl_types_internal.idl
index fb0f4f23d7c2..e24288f1a59e 100644
--- a/tools/libs/light/libxl_types_internal.idl
+++ b/tools/libs/light/libxl_types_internal.idl
@@ -33,6 +33,7 @@ libxl__device_kind = Enumeration("device_kind", [
     (15, "VSND"),
     (16, "VINPUT"),
     (17, "VIRTIO_DISK"),
+    (18, "VIRTIO"),
     ])
 
 libxl__console_backend = Enumeration("console_backend", [
diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
new file mode 100644
index 000000000000..6a38def2faf5
--- /dev/null
+++ b/tools/libs/light/libxl_virtio.c
@@ -0,0 +1,144 @@
+/*
+ * Copyright (C) 2022 Linaro Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+
+#include "libxl_internal.h"
+
+static int libxl__device_virtio_setdefault(libxl__gc *gc, uint32_t domid,
+                                           libxl_device_virtio *virtio,
+                                           bool hotplug)
+{
+    return libxl__resolve_domid(gc, virtio->backend_domname,
+                                &virtio->backend_domid);
+}
+
+static int libxl__device_from_virtio(libxl__gc *gc, uint32_t domid,
+                                     libxl_device_virtio *virtio,
+                                     libxl__device *device)
+{
+    device->backend_devid   = virtio->devid;
+    device->backend_domid   = virtio->backend_domid;
+    device->devid           = virtio->devid;
+    device->domid           = domid;
+
+    device->backend_kind    = LIBXL__DEVICE_KIND_VIRTIO;
+    device->kind            = LIBXL__DEVICE_KIND_VIRTIO;
+
+    return 0;
+}
+
+static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
+                                      libxl_device_virtio *virtio,
+                                      flexarray_t *back, flexarray_t *front,
+                                      flexarray_t *ro_front)
+{
+    const char *transport = libxl_virtio_transport_to_string(virtio->transport);
+
+    flexarray_append_pair(back, "irq", GCSPRINTF("%u", virtio->irq));
+    flexarray_append_pair(back, "base", GCSPRINTF("%lu", virtio->base));
+    flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
+    flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport));
+
+    flexarray_append_pair(front, "irq", GCSPRINTF("%u", virtio->irq));
+    flexarray_append_pair(front, "base", GCSPRINTF("%lu", virtio->base));
+    flexarray_append_pair(front, "type", GCSPRINTF("%s", virtio->type));
+    flexarray_append_pair(front, "transport", GCSPRINTF("%s", transport));
+
+    return 0;
+}
+
+static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
+                                       libxl_devid devid,
+                                       libxl_device_virtio *virtio)
+{
+    const char *be_path, *tmp = NULL;
+    int rc;
+
+    virtio->devid = devid;
+
+    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
+                                  GCSPRINTF("%s/backend", libxl_path),
+                                  &be_path);
+    if (rc) goto out;
+
+    rc = libxl__backendpath_parse_domid(gc, be_path, &virtio->backend_domid);
+    if (rc) goto out;
+
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+				GCSPRINTF("%s/irq", be_path), &tmp);
+    if (rc) goto out;
+
+    if (tmp) {
+        virtio->irq = strtoul(tmp, NULL, 0);
+    }
+
+    tmp = NULL;
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+				GCSPRINTF("%s/base", be_path), &tmp);
+    if (rc) goto out;
+
+    if (tmp) {
+        virtio->base = strtoul(tmp, NULL, 0);
+    }
+
+    tmp = NULL;
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+				GCSPRINTF("%s/transport", be_path), &tmp);
+    if (rc) goto out;
+
+    if (tmp) {
+        if (!strcmp(tmp, "mmio")) {
+            virtio->transport = LIBXL_VIRTIO_TRANSPORT_MMIO;
+        } else {
+            return ERROR_INVAL;
+        }
+    }
+
+    tmp = NULL;
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+				GCSPRINTF("%s/type", be_path), &tmp);
+    if (rc) goto out;
+
+    if (tmp) {
+        int len = sizeof(VIRTIO_DEVICE_TYPE_GENERIC) - 1;
+
+        if (!strncmp(tmp, VIRTIO_DEVICE_TYPE_GENERIC, len)) {
+            virtio->type = libxl__strdup(NOGC, tmp);
+        } else {
+            return ERROR_INVAL;
+        }
+    }
+
+out:
+    return rc;
+}
+
+static LIBXL_DEFINE_UPDATE_DEVID(virtio)
+
+#define libxl__add_virtios NULL
+#define libxl_device_virtio_compare NULL
+
+DEFINE_DEVICE_TYPE_STRUCT(virtio, VIRTIO, virtios,
+    .set_xenstore_config = (device_set_xenstore_config_fn_t)
+                           libxl__set_xenstore_virtio,
+    .from_xenstore = (device_from_xenstore_fn_t)libxl__virtio_from_xenstore,
+    .skip_attach = 1
+);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.31.1.272.g89b43f80a514


