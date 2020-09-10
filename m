Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FA22650BD
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:26:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT9J-0005Ib-Tx; Thu, 10 Sep 2020 20:26:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT6h-0004JK-Uc
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:23:48 +0000
X-Inumbo-ID: 9ff2e4dc-e7d7-4edc-a5a4-9d89a36a96d8
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ff2e4dc-e7d7-4edc-a5a4-9d89a36a96d8;
 Thu, 10 Sep 2020 20:22:52 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id d15so4277740lfq.11
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xBnuOKaINd4y0NxCYv1+YTNfaCfRQuogaAfkjmdfVZo=;
 b=muKzij5C2n9SzH3jWfTlYB7tQuIcAUdmE9Q+hRGVbI64YBuCdxkPTCzMuNg8pdUTvf
 LTmPMnlVSM73h9jzGNb2kQ2dQlLjcq2CnS+Z3pI07GMpx7V3v5+o5RYj6sF91Xn3ib6B
 iR7z14FZ2SoaJTYf3HgG2DFvAieIncFp928wY0g2yocd7CHYHJIl8Rac4+5q6uLPeGco
 p6O4Dc0UWVUuV2cKCLD+9uZ+PGh6JWj6gTFBnhIpYXC3bUv/KSVLMVy9K9ZgV2DfF+Lz
 S2FHiXeLfrj8TqO7I+NuRoTQsKyb4rYSQuxy5l0702YQhRNvLeo2ynqCX9vOVBiDUtgg
 jnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xBnuOKaINd4y0NxCYv1+YTNfaCfRQuogaAfkjmdfVZo=;
 b=m52GsmPruTzYlC7p8StQelFyJaOd+DX72GUB3WNajlIn0S3eDE4ZKTMQFLCUUUMv/g
 k7sij1LnA9u4+pa/oYcoZPQvsAAWMI22RtF3fU7p4+t/o047CAXIISAfDj7SRe5Vj3/C
 px7VmwzCtvxYcVXSOtWFDnrHywwF+YymqzarvIRn/iPfUijuJ+0dkhkuhcyrxcV/65n5
 iqkzV9MDdMY8XWWEFC4+FFuLTmGo0ieXMYWXpDZbJN96veJzSgFZjGPWTQ48UXHab3vu
 fGkyzXvfgZ/G4cgXVj6I8OjOTEzMHHLsqNzz/+jmJQJsi3ocmqkV5YKc7bTHJe4B+MH5
 6M6Q==
X-Gm-Message-State: AOAM530HjHAi4PusHccgW+Yt1ot21r34u7v9vXmjAwfmBC3pNAz9tL16
 NLqY6K1hDTRroQ3aI0tkC7AzufXYc2WuwQ==
X-Google-Smtp-Source: ABdhPJwVr+puH1O4rySwdXPplUSUeiFJDDDHXc/lppR2uCJe2IonEVxfZhW1gSUAnVBPykiDVQTDww==
X-Received: by 2002:a19:ed13:: with SMTP id y19mr5009686lfy.187.1599769370269; 
 Thu, 10 Sep 2020 13:22:50 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:49 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH V1 16/16] [RFC] libxl: Add support for virtio-disk
 configuration
Date: Thu, 10 Sep 2020 23:22:10 +0300
Message-Id: <1599769330-17656-17-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch adds basic support for configuring and assisting virtio-disk
backend (emualator) which is intended to run out of Qemu and could be run
in any domain.

Xenstore was chosen as a communication interface for the emulator running
in non-toolstack domain to be able to get configuration either by reading
Xenstore directly or by receiving command line parameters (an updated 'xl devd'
running in the same domain would read Xenstore beforehand and call backend
executable with the required arguments).

An example of domain configuration (two disks are assigned to the guest,
the latter is in readonly mode):

vdisk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3;ro:/dev/mmcblk1p3' ]

Where per-disk Xenstore entries are:
- filename and readonly flag (configured via "vdisk" property)
- base and irq (allocated dynamically)

Besides handling 'visible' params described in configuration file,
patch also allocates virtio-mmio specific ones for each device and
writes them into Xenstore. virtio-mmio params (irq and base) are
unique per guest domain, they allocated at the domain creation time
and passed through to the emulator. Each VirtIO device has at least
one pair of these params.

TODO:
1. An extra "virtio" property could be removed.
2. Update documentation.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Changes RFC -> V1:
   - no changes

Please note, there is a real concern about VirtIO interrupts allocation.
Just copy here what Stefano said in RFC thread.

So, if we end up allocating let's say 6 virtio interrupts for a domain,
the chance of a clash with a physical interrupt of a passthrough device is real.

I am not entirely sure how to solve it, but these are a few ideas:
- choosing virtio interrupts that are less likely to conflict (maybe > 1000)
- make the virtio irq (optionally) configurable so that a user could
  override the default irq and specify one that doesn't conflict
- implementing support for virq != pirq (even the xl interface doesn't
  allow to specify the virq number for passthrough devices, see "irqs")
---
---
 tools/libxl/Makefile                 |   4 +-
 tools/libxl/libxl_arm.c              |  56 ++++++++++++++---
 tools/libxl/libxl_create.c           |   1 +
 tools/libxl/libxl_internal.h         |   1 +
 tools/libxl/libxl_types.idl          |  15 +++++
 tools/libxl/libxl_types_internal.idl |   1 +
 tools/libxl/libxl_virtio_disk.c      | 109 +++++++++++++++++++++++++++++++++
 tools/xl/Makefile                    |   2 +-
 tools/xl/xl.h                        |   3 +
 tools/xl/xl_cmdtable.c               |  15 +++++
 tools/xl/xl_parse.c                  | 115 +++++++++++++++++++++++++++++++++++
 tools/xl/xl_virtio_disk.c            |  46 ++++++++++++++
 12 files changed, 356 insertions(+), 12 deletions(-)
 create mode 100644 tools/libxl/libxl_virtio_disk.c
 create mode 100644 tools/xl/xl_virtio_disk.c

diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index 0e8dfc6..8ab6c41 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -141,7 +141,9 @@ LIBXL_OBJS = flexarray.o libxl.o libxl_create.o libxl_dm.o libxl_pci.o \
 			libxl_vtpm.o libxl_nic.o libxl_disk.o libxl_console.o \
 			libxl_cpupool.o libxl_mem.o libxl_sched.o libxl_tmem.o \
 			libxl_9pfs.o libxl_domain.o libxl_vdispl.o \
-			libxl_pvcalls.o libxl_vsnd.o libxl_vkb.o $(LIBXL_OBJS-y)
+			libxl_pvcalls.o libxl_vsnd.o libxl_vkb.o \
+			libxl_virtio_disk.o $(LIBXL_OBJS-y)
+
 LIBXL_OBJS += libxl_genid.o
 LIBXL_OBJS += _libxl_types.o libxl_flask.o _libxl_types_internal.o
 
diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
index 36139d9..442b3b9 100644
--- a/tools/libxl/libxl_arm.c
+++ b/tools/libxl/libxl_arm.c
@@ -9,6 +9,12 @@
 #include <assert.h>
 #include <xen/device_tree_defs.h>
 
+#ifndef container_of
+#define container_of(ptr, type, member) ({			\
+        typeof( ((type *)0)->member ) *__mptr = (ptr);	\
+        (type *)( (char *)__mptr - offsetof(type,member) );})
+#endif
+
 static const char *gicv_to_string(libxl_gic_version gic_version)
 {
     switch (gic_version) {
@@ -40,14 +46,32 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         vuart_enabled = true;
     }
 
-    /*
-     * XXX: Handle properly virtio
-     * A proper solution would be the toolstack to allocate the interrupts
-     * used by each virtio backend and let the backend now which one is used
-     */
     if (libxl_defbool_val(d_config->b_info.arch_arm.virtio)) {
-        nr_spis += (GUEST_VIRTIO_MMIO_SPI - 32) + 1;
+        uint64_t virtio_base;
+        libxl_device_virtio_disk *virtio_disk;
+
+        virtio_base = GUEST_VIRTIO_MMIO_BASE;
         virtio_irq = GUEST_VIRTIO_MMIO_SPI;
+
+        if (!d_config->num_virtio_disks) {
+            LOG(ERROR, "Virtio is enabled, but no Virtio devices present\n");
+            return ERROR_FAIL;
+        }
+        virtio_disk = &d_config->virtio_disks[0];
+
+        for (i = 0; i < virtio_disk->num_disks; i++) {
+            virtio_disk->disks[i].base = virtio_base;
+            virtio_disk->disks[i].irq = virtio_irq;
+
+            LOG(DEBUG, "Allocate Virtio MMIO params: IRQ %u BASE 0x%"PRIx64,
+                virtio_irq, virtio_base);
+
+            virtio_irq ++;
+            virtio_base += GUEST_VIRTIO_MMIO_SIZE;
+        }
+        virtio_irq --;
+
+        nr_spis += (virtio_irq - 32) + 1;
         virtio_enabled = true;
     }
 
@@ -71,8 +95,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         }
 
         /* The same check as for vpl011 */
-        if (virtio_enabled && irq == virtio_irq) {
-            LOG(ERROR, "Physical IRQ %u conflicting with virtio SPI\n", irq);
+        if (virtio_enabled &&
+           (irq >= GUEST_VIRTIO_MMIO_SPI && irq <= virtio_irq)) {
+            LOG(ERROR, "Physical IRQ %u conflicting with Virtio IRQ range\n", irq);
             return ERROR_FAIL;
         }
 
@@ -1012,8 +1037,19 @@ next_resize:
         if (info->tee == LIBXL_TEE_TYPE_OPTEE)
             FDT( make_optee_node(gc, fdt) );
 
-        if (libxl_defbool_val(info->arch_arm.virtio))
-            FDT( make_virtio_mmio_node(gc, fdt, GUEST_VIRTIO_MMIO_BASE, GUEST_VIRTIO_MMIO_SPI) );
+        if (libxl_defbool_val(info->arch_arm.virtio)) {
+            libxl_domain_config *d_config =
+                container_of(info, libxl_domain_config, b_info);
+            libxl_device_virtio_disk *virtio_disk = &d_config->virtio_disks[0];
+            unsigned int i;
+
+            for (i = 0; i < virtio_disk->num_disks; i++) {
+                uint64_t base = virtio_disk->disks[i].base;
+                uint32_t irq = virtio_disk->disks[i].irq;
+
+                FDT( make_virtio_mmio_node(gc, fdt, base, irq) );
+            }
+        }
 
         if (pfdt)
             FDT( copy_partial_fdt(gc, fdt, pfdt) );
diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 2814818..8a0651e 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -1817,6 +1817,7 @@ const libxl__device_type *device_type_tbl[] = {
     &libxl__dtdev_devtype,
     &libxl__vdispl_devtype,
     &libxl__vsnd_devtype,
+    &libxl__virtio_disk_devtype,
     NULL
 };
 
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index 94a2317..4e2024d 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -3988,6 +3988,7 @@ extern const libxl__device_type libxl__vdispl_devtype;
 extern const libxl__device_type libxl__p9_devtype;
 extern const libxl__device_type libxl__pvcallsif_devtype;
 extern const libxl__device_type libxl__vsnd_devtype;
+extern const libxl__device_type libxl__virtio_disk_devtype;
 
 extern const libxl__device_type *device_type_tbl[];
 
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
index b054bf9..5f8a3ff 100644
--- a/tools/libxl/libxl_types.idl
+++ b/tools/libxl/libxl_types.idl
@@ -935,6 +935,20 @@ libxl_device_vsnd = Struct("device_vsnd", [
     ("pcms", Array(libxl_vsnd_pcm, "num_vsnd_pcms"))
     ])
 
+libxl_virtio_disk_param = Struct("virtio_disk_param", [
+    ("filename", string),
+    ("readonly", bool),
+    ("irq", uint32),
+    ("base", uint64),
+    ])
+
+libxl_device_virtio_disk = Struct("device_virtio_disk", [
+    ("backend_domid", libxl_domid),
+    ("backend_domname", string),
+    ("devid", libxl_devid),
+    ("disks", Array(libxl_virtio_disk_param, "num_disks")),
+    ])
+
 libxl_domain_config = Struct("domain_config", [
     ("c_info", libxl_domain_create_info),
     ("b_info", libxl_domain_build_info),
@@ -951,6 +965,7 @@ libxl_domain_config = Struct("domain_config", [
     ("pvcallsifs", Array(libxl_device_pvcallsif, "num_pvcallsifs")),
     ("vdispls", Array(libxl_device_vdispl, "num_vdispls")),
     ("vsnds", Array(libxl_device_vsnd, "num_vsnds")),
+    ("virtio_disks", Array(libxl_device_virtio_disk, "num_virtio_disks")),
     # a channel manifests as a console with a name,
     # see docs/misc/channels.txt
     ("channels", Array(libxl_device_channel, "num_channels")),
diff --git a/tools/libxl/libxl_types_internal.idl b/tools/libxl/libxl_types_internal.idl
index 3593e21..8f71980 100644
--- a/tools/libxl/libxl_types_internal.idl
+++ b/tools/libxl/libxl_types_internal.idl
@@ -32,6 +32,7 @@ libxl__device_kind = Enumeration("device_kind", [
     (14, "PVCALLS"),
     (15, "VSND"),
     (16, "VINPUT"),
+    (17, "VIRTIO_DISK"),
     ])
 
 libxl__console_backend = Enumeration("console_backend", [
diff --git a/tools/libxl/libxl_virtio_disk.c b/tools/libxl/libxl_virtio_disk.c
new file mode 100644
index 0000000..25e7f1a
--- /dev/null
+++ b/tools/libxl/libxl_virtio_disk.c
@@ -0,0 +1,109 @@
+/*
+ * Copyright (C) 2020 EPAM Systems Inc.
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
+static int libxl__device_virtio_disk_setdefault(libxl__gc *gc, uint32_t domid,
+                                                libxl_device_virtio_disk *virtio_disk,
+                                                bool hotplug)
+{
+    return libxl__resolve_domid(gc, virtio_disk->backend_domname,
+                                &virtio_disk->backend_domid);
+}
+
+static int libxl__virtio_disk_from_xenstore(libxl__gc *gc, const char *libxl_path,
+                                            libxl_devid devid,
+                                            libxl_device_virtio_disk *virtio_disk)
+{
+    const char *be_path;
+    int rc;
+
+    virtio_disk->devid = devid;
+    rc = libxl__xs_read_mandatory(gc, XBT_NULL,
+                                  GCSPRINTF("%s/backend", libxl_path),
+                                  &be_path);
+    if (rc) return rc;
+
+    rc = libxl__backendpath_parse_domid(gc, be_path, &virtio_disk->backend_domid);
+    if (rc) return rc;
+
+    return 0;
+}
+
+static void libxl__update_config_virtio_disk(libxl__gc *gc,
+                                             libxl_device_virtio_disk *dst,
+                                             libxl_device_virtio_disk *src)
+{
+    dst->devid = src->devid;
+}
+
+static int libxl_device_virtio_disk_compare(libxl_device_virtio_disk *d1,
+                                            libxl_device_virtio_disk *d2)
+{
+    return COMPARE_DEVID(d1, d2);
+}
+
+static void libxl__device_virtio_disk_add(libxl__egc *egc, uint32_t domid,
+                                          libxl_device_virtio_disk *virtio_disk,
+                                          libxl__ao_device *aodev)
+{
+    libxl__device_add_async(egc, domid, &libxl__virtio_disk_devtype, virtio_disk, aodev);
+}
+
+static int libxl__set_xenstore_virtio_disk(libxl__gc *gc, uint32_t domid,
+                                           libxl_device_virtio_disk *virtio_disk,
+                                           flexarray_t *back, flexarray_t *front,
+                                           flexarray_t *ro_front)
+{
+    int rc;
+    unsigned int i;
+
+    for (i = 0; i < virtio_disk->num_disks; i++) {
+        rc = flexarray_append_pair(ro_front, GCSPRINTF("%d/filename", i),
+                                   GCSPRINTF("%s", virtio_disk->disks[i].filename));
+        if (rc) return rc;
+
+        rc = flexarray_append_pair(ro_front, GCSPRINTF("%d/readonly", i),
+                                   GCSPRINTF("%d", virtio_disk->disks[i].readonly));
+        if (rc) return rc;
+
+        rc = flexarray_append_pair(ro_front, GCSPRINTF("%d/base", i),
+                                   GCSPRINTF("%lu", virtio_disk->disks[i].base));
+        if (rc) return rc;
+
+        rc = flexarray_append_pair(ro_front, GCSPRINTF("%d/irq", i),
+                                   GCSPRINTF("%u", virtio_disk->disks[i].irq));
+        if (rc) return rc;
+    }
+
+    return 0;
+}
+
+static LIBXL_DEFINE_UPDATE_DEVID(virtio_disk)
+static LIBXL_DEFINE_DEVICE_FROM_TYPE(virtio_disk)
+static LIBXL_DEFINE_DEVICES_ADD(virtio_disk)
+
+DEFINE_DEVICE_TYPE_STRUCT(virtio_disk, VIRTIO_DISK,
+    .update_config = (device_update_config_fn_t) libxl__update_config_virtio_disk,
+    .from_xenstore = (device_from_xenstore_fn_t) libxl__virtio_disk_from_xenstore,
+    .set_xenstore_config = (device_set_xenstore_config_fn_t) libxl__set_xenstore_virtio_disk
+);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index af4912e..38e4701 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -22,7 +22,7 @@ XL_OBJS += xl_vtpm.o xl_block.o xl_nic.o xl_usb.o
 XL_OBJS += xl_sched.o xl_pci.o xl_vcpu.o xl_cdrom.o xl_mem.o
 XL_OBJS += xl_info.o xl_console.o xl_misc.o
 XL_OBJS += xl_vmcontrol.o xl_saverestore.o xl_migrate.o
-XL_OBJS += xl_vdispl.o xl_vsnd.o xl_vkb.o
+XL_OBJS += xl_vdispl.o xl_vsnd.o xl_vkb.o xl_virtio_disk.o
 
 $(XL_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
 $(XL_OBJS): CFLAGS += $(CFLAGS_XL)
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 06569c6..3d26f19 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -178,6 +178,9 @@ int main_vsnddetach(int argc, char **argv);
 int main_vkbattach(int argc, char **argv);
 int main_vkblist(int argc, char **argv);
 int main_vkbdetach(int argc, char **argv);
+int main_virtio_diskattach(int argc, char **argv);
+int main_virtio_disklist(int argc, char **argv);
+int main_virtio_diskdetach(int argc, char **argv);
 int main_usbctrl_attach(int argc, char **argv);
 int main_usbctrl_detach(int argc, char **argv);
 int main_usbdev_attach(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 0833539..2bdf0b7 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -434,6 +434,21 @@ struct cmd_spec cmd_table[] = {
       "Destroy a domain's virtual sound device",
       "<Domain> <DevId>",
     },
+    { "virtio-disk-attach",
+      &main_virtio_diskattach, 1, 1,
+      "Create a new virtio block device",
+      " TBD\n"
+    },
+    { "virtio-disk-list",
+      &main_virtio_disklist, 0, 0,
+      "List virtio block devices for a domain",
+      "<Domain(s)>",
+    },
+    { "virtio-disk-detach",
+      &main_virtio_diskdetach, 0, 1,
+      "Destroy a domain's virtio block device",
+      "<Domain> <DevId>",
+    },
     { "uptime",
       &main_uptime, 0, 0,
       "Print uptime for all/some domains",
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index b8306aa..72c0a65 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1202,6 +1202,120 @@ out:
     if (rc) exit(EXIT_FAILURE);
 }
 
+#define MAX_VIRTIO_DISKS 4
+
+static int parse_virtio_disk_config(libxl_device_virtio_disk *virtio_disk, char *token)
+{
+    char *oparg;
+    libxl_string_list disks = NULL;
+    int i, rc;
+
+    if (MATCH_OPTION("backend", token, oparg)) {
+        virtio_disk->backend_domname = strdup(oparg);
+    } else if (MATCH_OPTION("disks", token, oparg)) {
+        split_string_into_string_list(oparg, ";", &disks);
+
+        virtio_disk->num_disks = libxl_string_list_length(&disks);
+        if (virtio_disk->num_disks > MAX_VIRTIO_DISKS) {
+            fprintf(stderr, "vdisk: currently only %d disks are supported",
+                    MAX_VIRTIO_DISKS);
+            return 1;
+        }
+        virtio_disk->disks = xcalloc(virtio_disk->num_disks,
+                                     sizeof(*virtio_disk->disks));
+
+        for(i = 0; i < virtio_disk->num_disks; i++) {
+            char *disk_opt;
+
+            rc = split_string_into_pair(disks[i], ":", &disk_opt,
+                                        &virtio_disk->disks[i].filename);
+            if (rc) {
+                fprintf(stderr, "vdisk: failed to split \"%s\" into pair\n",
+                        disks[i]);
+                goto out;
+            }
+
+            if (!strcmp(disk_opt, "ro"))
+                virtio_disk->disks[i].readonly = 1;
+            else if (!strcmp(disk_opt, "rw"))
+                virtio_disk->disks[i].readonly = 0;
+            else {
+                fprintf(stderr, "vdisk: failed to parse \"%s\" disk option\n",
+                        disk_opt);
+                rc = 1;
+            }
+            free(disk_opt);
+
+            if (rc) goto out;
+        }
+    } else {
+        fprintf(stderr, "Unknown string \"%s\" in vdisk spec\n", token);
+        rc = 1; goto out;
+    }
+
+    rc = 0;
+
+out:
+    libxl_string_list_dispose(&disks);
+    return rc;
+}
+
+static void parse_virtio_disk_list(const XLU_Config *config,
+                                   libxl_domain_config *d_config)
+{
+    XLU_ConfigList *virtio_disks;
+    const char *item;
+    char *buf = NULL;
+    int rc;
+
+    if (!xlu_cfg_get_list (config, "vdisk", &virtio_disks, 0, 0)) {
+        libxl_domain_build_info *b_info = &d_config->b_info;
+        int entry = 0;
+
+        /* XXX Remove an extra property */
+        libxl_defbool_setdefault(&b_info->arch_arm.virtio, false);
+        if (!libxl_defbool_val(b_info->arch_arm.virtio)) {
+            fprintf(stderr, "Virtio device requires Virtio property to be set\n");
+            exit(EXIT_FAILURE);
+        }
+
+        while ((item = xlu_cfg_get_listitem(virtio_disks, entry)) != NULL) {
+            libxl_device_virtio_disk *virtio_disk;
+            char *p;
+
+            virtio_disk = ARRAY_EXTEND_INIT(d_config->virtio_disks,
+                                            d_config->num_virtio_disks,
+                                            libxl_device_virtio_disk_init);
+
+            buf = strdup(item);
+
+            p = strtok (buf, ",");
+            while (p != NULL)
+            {
+                while (*p == ' ') p++;
+
+                rc = parse_virtio_disk_config(virtio_disk, p);
+                if (rc) goto out;
+
+                p = strtok (NULL, ",");
+            }
+
+            entry++;
+
+            if (virtio_disk->num_disks == 0) {
+                fprintf(stderr, "At least one virtio disk should be specified\n");
+                rc = 1; goto out;
+            }
+        }
+    }
+
+    rc = 0;
+
+out:
+    free(buf);
+    if (rc) exit(EXIT_FAILURE);
+}
+
 void parse_config_data(const char *config_source,
                        const char *config_data,
                        int config_len,
@@ -2732,6 +2846,7 @@ skip_usbdev:
     }
 
     parse_vkb_list(config, d_config);
+    parse_virtio_disk_list(config, d_config);
 
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
                         &c_info->xend_suspend_evtchn_compat, 0);
diff --git a/tools/xl/xl_virtio_disk.c b/tools/xl/xl_virtio_disk.c
new file mode 100644
index 0000000..808a7da
--- /dev/null
+++ b/tools/xl/xl_virtio_disk.c
@@ -0,0 +1,46 @@
+/*
+ * Copyright (C) 2020 EPAM Systems Inc.
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
+#include <stdlib.h>
+
+#include <libxl.h>
+#include <libxl_utils.h>
+#include <libxlutil.h>
+
+#include "xl.h"
+#include "xl_utils.h"
+#include "xl_parse.h"
+
+int main_virtio_diskattach(int argc, char **argv)
+{
+    return 0;
+}
+
+int main_virtio_disklist(int argc, char **argv)
+{
+   return 0;
+}
+
+int main_virtio_diskdetach(int argc, char **argv)
+{
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.7.4


