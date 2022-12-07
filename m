Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7C9645485
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 08:22:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455948.713604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ok7-0000cu-NP; Wed, 07 Dec 2022 07:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455948.713604; Wed, 07 Dec 2022 07:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ok7-0000aT-J9; Wed, 07 Dec 2022 07:21:23 +0000
Received: by outflank-mailman (input) for mailman id 455948;
 Wed, 07 Dec 2022 07:21:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QqWv=4F=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p2ok5-0000L8-E1
 for xen-devel@lists.xen.org; Wed, 07 Dec 2022 07:21:21 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be4f055a-75ff-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 08:21:19 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id 4so16280229pli.0
 for <xen-devel@lists.xen.org>; Tue, 06 Dec 2022 23:21:19 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 u7-20020a170902714700b00189f69c1aa0sm777536plm.270.2022.12.06.23.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 23:21:17 -0800 (PST)
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
X-Inumbo-ID: be4f055a-75ff-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tEEje84lGgl0v1NGWerkxYBkg541ag5TPJoOqd0frI=;
        b=KYHZWKozTQM9i1wrXlEcB9KSDux+pHNXKY31FkYYY2UJauTDE76ipkp29TQ0H9EQ3o
         N58pWPGrr0MZyX8suDWEfDqA9iuzZSJ/8ckgd9D2r0Jz8Vevpm+rECrfa2+CbiCcQVSc
         3uXkG8unMVsTIxD6m9EdU2lzkXXDvbnqP+gb7acaZ9bqMl7/nH3rUioLH+x8dS3F/EYC
         dNI/iS3auJ6WDFVuZcceUKMXCkBvTof6RcxLfyk3b0BHvTiFz8g1iFURlQPUgys8TOwA
         qohnv+h5wYrvtNgiWrBe7dhAc9HnjthzOqYhuiUihJUaLUQX7k3GT3xRroopaQ6At8io
         1Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tEEje84lGgl0v1NGWerkxYBkg541ag5TPJoOqd0frI=;
        b=0Pk9CNQqRHTEYPFyzLSqbAIyhet8T13t5+Au4SP+i81cttWZJuwNT9p4mEZB1sIYTn
         jvbcSRSFsCD32I3nxvTcogPH1/pm2kxlj6sGSCO2m/KMshxFcALHTRd1TSANPwPjjIpy
         Gsdnaq84lBtefVqp9g1VcfJgBQvc4Ecoj2NltmmlDbdYBrYNquPtZAOjBqh7faS5l4xp
         Stjw+GeDhXZaNhS9CTE5iDi9nBWoEO8AQHN80L+jq4gqujjSGMZG6N9W8BgEEBM21b2i
         VnLbfli5r/hqtUnRDVZ29cTjDP5Got3D+iEaiLoZ49dMSw0pm2H/wlV84YglCfOPCTu7
         3sgA==
X-Gm-Message-State: ANoB5pn3GprJvPNWdkAgFiIDlad/s/930W5aFbQu1wCJolOnLBFGHrjd
	eT226QzU9rGOkBYyIfc20OBNqQQ+DDEXW8Cb
X-Google-Smtp-Source: AA0mqf70eYM3oL0eeIQVmtICl4G1/fSFiGGqSPDK3OovThTFyxBt3t7fxM92yDno1Xga6H7H+01Jbw==
X-Received: by 2002:a17:902:a616:b0:189:46b1:fe0b with SMTP id u22-20020a170902a61600b0018946b1fe0bmr67618418plq.117.1670397678198;
        Tue, 06 Dec 2022 23:21:18 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH V7 1/3] libxl: Add support for generic virtio device
Date: Wed,  7 Dec 2022 12:50:42 +0530
Message-Id: <903506db6c7dadb2a5304e9894950c673e308f41.1670396758.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1670396758.git.viresh.kumar@linaro.org>
References: <cover.1670396758.git.viresh.kumar@linaro.org>
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
user needs to pass "virtio,devices" in the "type" string.

The parsing of generic virtio device configurations will be done in a
separate commit.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/Makefile                 |   1 +
 tools/libs/light/libxl_arm.c              | 103 ++++++++++++++++
 tools/libs/light/libxl_create.c           |   4 +
 tools/libs/light/libxl_internal.h         |   1 +
 tools/libs/light/libxl_types.idl          |  18 +++
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_virtio.c           | 144 ++++++++++++++++++++++
 7 files changed, 272 insertions(+)
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
index fa3d61f1e882..ab3668b3b8a3 100644
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
@@ -956,6 +969,82 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt, uint64_t base,
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
+    res = fdt_property_compat(gc, fdt, 1, "virtio,device22");
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
+    res = fdt_property_compat(gc, fdt, 1, "virtio,device29");
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
+    int res, len = strlen(type);
+
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
+    if (res) return res;
+
+    /* Add device specific nodes */
+    if (!strncmp(type, "virtio,device22", len)) {
+        res = make_virtio_mmio_node_i2c(gc, fdt);
+        if (res) return res;
+    } else if (!strncmp(type, "virtio,device29", len)) {
+        res = make_virtio_mmio_node_gpio(gc, fdt);
+        if (res) return res;
+    } else if (!strncmp(type, "virtio,device", len)) {
+        /* Generic Virtio Device */
+        res = fdt_end_node(fdt);
+        if (res) return res;
+    } else {
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
@@ -1277,6 +1366,20 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
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
index a7c447c10e5f..cdd155d925c1 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4003,6 +4003,7 @@ static inline int *libxl__device_type_get_num(
 
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
index 000000000000..64cec989c674
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
+        if (!strncmp(tmp, "mmio", strlen(tmp))) {
+            virtio->transport = LIBXL_VIRTIO_TRANSPORT_MMIO;
+        } else if (!strncmp(tmp, "unknown", strlen(tmp))) {
+            virtio->transport = LIBXL_VIRTIO_TRANSPORT_UNKNOWN;
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
+        if (!strncmp(tmp, "virtio,device", strlen("virtio,device"))) {
+            virtio->type = strdup(tmp);
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


