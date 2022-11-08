Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC94620EF1
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 12:24:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439975.694020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMiM-0006lJ-Mi; Tue, 08 Nov 2022 11:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439975.694020; Tue, 08 Nov 2022 11:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osMiM-0006jH-JE; Tue, 08 Nov 2022 11:24:22 +0000
Received: by outflank-mailman (input) for mailman id 439975;
 Tue, 08 Nov 2022 11:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jDgD=3I=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1osMiK-0006iF-UF
 for xen-devel@lists.xen.org; Tue, 08 Nov 2022 11:24:21 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2817fa5-5f57-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 12:24:19 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id g24so13914244plq.3
 for <xen-devel@lists.xen.org>; Tue, 08 Nov 2022 03:24:19 -0800 (PST)
Received: from localhost ([122.172.84.80]) by smtp.gmail.com with ESMTPSA id
 k26-20020aa7973a000000b0056da2ad6503sm6189458pfg.39.2022.11.08.03.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 03:24:17 -0800 (PST)
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
X-Inumbo-ID: e2817fa5-5f57-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWwLVsCfFGrMeQAxaHGExsLxmZy4kqtiAA8c8/+74wg=;
        b=dXWHyLAcc3S4YeQjOK/o9jRLk8+0FaUhy4e1P73qU9oEvps0On1zaJaLiyRhrvzJy+
         NEzOSt3ZuUSJjki+Y/kt6VAzAGSy15HTF4WdWvGu2c5WD/GmdiEzBhmng80v3VF0NzJO
         jVrdopY9He9wQiFGm1yu4N9mjtzPzlMBZ9CmRIGTgRu+E6wTSz1jaAcTs7yHYqFlUm0r
         kGuLwo+aUcur1xH2GrUvTGVvWC5ZGiuBAtObQEUcV527s1T8dSow5GyRPhWvqDp5+WH6
         Eip1xKkLxXOm93eQjniMsW8c9+H+WHCwI1gs9kWy+aVDGgp0XpgU/4PKbjmKmOqGw9ww
         YqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWwLVsCfFGrMeQAxaHGExsLxmZy4kqtiAA8c8/+74wg=;
        b=uiPQ6Gc/vNI3RCSx3hw1aZ2kyZMTrPAmd0cKVaeQ8sBMUGmrOPE8Os1E9+gVEzVAWs
         eI4zRggcIHrE24AvvBYsiuFyhKcZ3vE2w+qLcopyLiXpa0bharcKbDiK5ELsrbsAJj4W
         14Az5kTxN5oYslrMO9DlvmGNtT8E4jcA/YVt9pNj5Nnj1Eu7BqHGUEQGR+CizKoWngIf
         J1+emLTk3twi9mLduyb1b+TTQSwrcbgTV1wNUseeYiN9NSdnEc6xTmnULjMOEjpeHCkz
         IkWwgIRLz0WwimxULytD0oPBGukTkYxPTxTmCXRN5jjCqKXYzUWRtyw/tocv02TwGh97
         TmGw==
X-Gm-Message-State: ACrzQf3xHLoq4zLaR1Skal5US947ZcEo/rRd9z8SH3R/M8WkzUqYkwS+
	6Ni1PZ2WQ2ljK9mMPD8hWSgnxXOxyuo9rA==
X-Google-Smtp-Source: AMsMyM4pOZa7NXejO3RVIXXQdy76dSHf4MToE6NUCw4xUtbvccbhkrfxnzyXZhJEbNmiZ1OrXKfMlA==
X-Received: by 2002:a17:90b:38ca:b0:214:2cff:fbb5 with SMTP id nn10-20020a17090b38ca00b002142cfffbb5mr34811900pjb.79.1667906657905;
        Tue, 08 Nov 2022 03:24:17 -0800 (PST)
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
Subject: [PATCH V6 1/3] libxl: Add support for generic virtio device
Date: Tue,  8 Nov 2022 16:53:58 +0530
Message-Id: <f1dc91669df27705c25a1f3018427c2db77b32a6.1667906228.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1667906228.git.viresh.kumar@linaro.org>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds basic support for configuring and assisting generic
Virtio backend which could run in any domain.

An example of domain configuration for mmio based Virtio I2C device is:
virtio = ["type=virtio,device22,transport=mmio"]

Also to make this work on Arm, allocate Virtio MMIO params (IRQ and
memory region) and pass them to the backend. Update guest device-tree as
well to create a DT node for the Virtio devices.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/Makefile                 |   1 +
 tools/libs/light/libxl_arm.c              |  89 +++++++++++++++
 tools/libs/light/libxl_create.c           |   5 +
 tools/libs/light/libxl_internal.h         |   1 +
 tools/libs/light/libxl_types.idl          |  29 +++++
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_virtio.c           | 127 ++++++++++++++++++++++
 7 files changed, 253 insertions(+)
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
index b4928dbf673c..f33c9b273a4f 100644
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
@@ -968,6 +981,68 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt, uint64_t base,
     return fdt_end_node(fdt);
 }
 
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
@@ -1290,6 +1365,20 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
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
          * Note, this should be only called after creating all virtio-mmio
          * device nodes
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 612eacfc7fac..15a32c75c045 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1802,6 +1802,11 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
                               &d_config->vkbs[i]);
         }
 
+        for (i = 0; i < d_config->num_virtios; i++) {
+            libxl__device_add(gc, domid, &libxl__virtio_devtype,
+                              &d_config->virtios[i]);
+        }
+
         if (d_config->b_info.arch_arm.vuart == LIBXL_VUART_TYPE_SBSA_UART) {
             init_console_info(gc, &vuart, 0);
             vuart.backend_domid = state->console_domid;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index cb9e8b3b8b5a..e5716f9bef80 100644
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
index d634f304cda2..d97a0795d312 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -278,6 +278,14 @@ libxl_vkb_backend = Enumeration("vkb_backend", [
     (2, "LINUX")
     ])
 
+libxl_virtio_backend = Enumeration("virtio_backend", [
+    (1, "STANDALONE")
+    ])
+
+libxl_virtio_transport = Enumeration("virtio_transport", [
+    (1, "MMIO"),
+    ])
+
 libxl_passthrough = Enumeration("passthrough", [
     (0, "default"),
     (1, "disabled"),
@@ -705,6 +713,17 @@ libxl_device_vkb = Struct("device_vkb", [
     ("multi_touch_num_contacts", uint32)
     ])
 
+libxl_device_virtio = Struct("device_virtio", [
+    ("backend_domid", libxl_domid),
+    ("backend_domname", string),
+    ("backend", libxl_virtio_backend),
+    ("type", string),
+    ("transport", libxl_virtio_transport),
+    ("devid", libxl_devid),
+    ("irq", uint32),
+    ("base", uint64)
+    ])
+
 libxl_device_disk = Struct("device_disk", [
     ("backend_domid", libxl_domid),
     ("backend_domname", string),
@@ -982,6 +1001,7 @@ libxl_domain_config = Struct("domain_config", [
     ("dtdevs", Array(libxl_device_dtdev, "num_dtdevs")),
     ("vfbs", Array(libxl_device_vfb, "num_vfbs")),
     ("vkbs", Array(libxl_device_vkb, "num_vkbs")),
+    ("virtios", Array(libxl_device_virtio, "num_virtios")),
     ("vtpms", Array(libxl_device_vtpm, "num_vtpms")),
     ("p9s", Array(libxl_device_p9, "num_p9s")),
     ("pvcallsifs", Array(libxl_device_pvcallsif, "num_pvcallsifs")),
@@ -1145,6 +1165,15 @@ libxl_vkbinfo = Struct("vkbinfo", [
     ("rref", integer)
     ], dir=DIR_OUT)
 
+libxl_virtioinfo = Struct("virtioinfo", [
+    ("backend", string),
+    ("backend_id", uint32),
+    ("frontend", string),
+    ("frontend_id", uint32),
+    ("devid", libxl_devid),
+    ("state", integer),
+    ], dir=DIR_OUT)
+
 # NUMA node characteristics: size and free are how much memory it has, and how
 # much of it is free, respectively. dists is an array of distances from this
 # node to each other node.
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
index 000000000000..14b0c016a0a2
--- /dev/null
+++ b/tools/libs/light/libxl_virtio.c
@@ -0,0 +1,127 @@
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
+    const char *be_path, *fe_path, *tmp;
+    libxl__device dev;
+    int rc;
+
+    virtio->devid = devid;
+
+    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
+                                  GCSPRINTF("%s/backend", libxl_path),
+                                  &be_path);
+    if (rc) goto out;
+
+    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
+                                  GCSPRINTF("%s/frontend", libxl_path),
+                                  &fe_path);
+    if (rc) goto out;
+
+    rc = libxl__backendpath_parse_domid(gc, be_path, &virtio->backend_domid);
+    if (rc) goto out;
+
+    rc = libxl__parse_backend_path(gc, be_path, &dev);
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
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+				GCSPRINTF("%s/base", be_path), &tmp);
+    if (rc) goto out;
+
+    if (tmp) {
+        virtio->base = strtoul(tmp, NULL, 0);
+    }
+
+    rc = 0;
+
+out:
+
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


