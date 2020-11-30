Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EC92C827A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40937.74059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgfc-000437-RP; Mon, 30 Nov 2020 10:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40937.74059; Mon, 30 Nov 2020 10:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgfc-00041H-Ix; Mon, 30 Nov 2020 10:44:36 +0000
Received: by outflank-mailman (input) for mailman id 40937;
 Mon, 30 Nov 2020 10:44:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgVH-0000Uu-F2
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:33:55 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f507fd0b-22b9-4436-ae24-5a8c01053eb2;
 Mon, 30 Nov 2020 10:32:27 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s27so20591630lfp.5
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:23 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.32.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:32:21 -0800 (PST)
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
X-Inumbo-ID: f507fd0b-22b9-4436-ae24-5a8c01053eb2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tgVthTyJdv0ZHP39YuffZGYtQrzTKTFcEEOILGJIBck=;
        b=QniTpPBA0dahyqbjVq3caKgybDZpvMlrZej7irZa21Z38Pv04CaPMWDlG6PNoKARXn
         UFL8SONlV7ezKqCJcAIty6MJVParEaB8Gk6sdMeHHEKrJd9HgXNQzHLTtSG8p7zyBHSX
         ILcaqgkA0f8vsZgUHluOQRjtZXZWyE21Vm6CkS6plAd71D3SgAdcdY75lVNf3mcTQxaG
         PlF3ZQLljAs7Yy/574aQiYZjRIPVtLjOKQYxdcfhg/poyUYOnRmaP+pI/NH5ehRjHpJA
         XocOC8nkoIPD0JFroevd2z+gUQmxqFblJPzls6HHt9Mm2cIJPiMaLPips0f1yZqSal57
         7cQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tgVthTyJdv0ZHP39YuffZGYtQrzTKTFcEEOILGJIBck=;
        b=DnyizD7yU6E/CQpLvMqSLHAlCIsXiUPiiR6uZMWOGNeNDteh5yGXemn8x29Zb6foj8
         BjvmuNnzWMVWJ710M9M7kJxCCHMi3Weyliyi6N2Ck6LeLorNZIG7td6qP3tutfhHQAuN
         Bl7TtR+gOAt7fDi9m/2jiuuQK1Lh9SB6nAlj7Utm5jwcRg7yIsPIAsMibMslmajJAukB
         MrigxwCYu3CPaDy8XR9Gh5dnJvYhS3d4WgQTOSJi0XAjvzW0ocbGFIKM9UVtmCpz39Fp
         h0cIawpgnzwIqMjq0O6yTcFJjh75pYxgJsuONbnwIDBEI+GGr7czcWOmqGJxmyyVwe3C
         1cdA==
X-Gm-Message-State: AOAM530mDC6G16VF9WmQd6iSnmivAYgA13Sg9/17XByTV2i6mZUTduuA
	4tb2DxJKsVMk5nqpaFsf2YimJOoBQuX9HQ==
X-Google-Smtp-Source: ABdhPJxd57Am6JNM1anvQlenRuZFLqMrHJuNwjJl3vIVER15CFMt5qCEByazdJaBKOeAiuWnWkA/RA==
X-Received: by 2002:a19:be4a:: with SMTP id o71mr8088918lff.494.1606732342315;
        Mon, 30 Nov 2020 02:32:22 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH V3 23/23] [RFC] libxl: Add support for virtio-disk configuration
Date: Mon, 30 Nov 2020 12:31:38 +0200
Message-Id: <1606732298-22107-24-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

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

Changes V1 -> V2:
   - rebase according to the new location of libxl_virtio_disk.c

Changes V2 -> V3:
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

Also there is one suggestion from Wei Chen regarding a parameter for domain
config file which I haven't addressed yet.
[Just copy here what Wei said in V2 thread]
Can we keep use the same 'disk' parameter for virtio-disk, but add an option like
"model=virtio-disk"?
For example:
disk = [ 'backend=DomD, disks=rw:/dev/mmcblk0p3,model=virtio-disk' ]
Just like what Xen has done for x86 virtio-net.

---
---
 tools/libs/light/Makefile                 |   1 +
 tools/libs/light/libxl_arm.c              |  56 ++++++++++++---
 tools/libs/light/libxl_create.c           |   1 +
 tools/libs/light/libxl_internal.h         |   1 +
 tools/libs/light/libxl_types.idl          |  15 ++++
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_virtio_disk.c      | 109 ++++++++++++++++++++++++++++
 tools/xl/Makefile                         |   2 +-
 tools/xl/xl.h                             |   3 +
 tools/xl/xl_cmdtable.c                    |  15 ++++
 tools/xl/xl_parse.c                       | 115 ++++++++++++++++++++++++++++++
 tools/xl/xl_virtio_disk.c                 |  46 ++++++++++++
 12 files changed, 354 insertions(+), 11 deletions(-)
 create mode 100644 tools/libs/light/libxl_virtio_disk.c
 create mode 100644 tools/xl/xl_virtio_disk.c

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 68f6fa3..ccc91b9 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -115,6 +115,7 @@ SRCS-y += libxl_genid.c
 SRCS-y += _libxl_types.c
 SRCS-y += libxl_flask.c
 SRCS-y += _libxl_types_internal.c
+SRCS-y += libxl_virtio_disk.c
 
 ifeq ($(CONFIG_LIBNL),y)
 CFLAGS_LIBXL += $(LIBNL3_CFLAGS)
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 588ee5a..9eb3022 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -8,6 +8,12 @@
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
@@ -39,14 +45,32 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
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
 
@@ -70,8 +94,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         }
 
         /* The same check as for vpl011 */
-        if (virtio_enabled && irq == virtio_irq) {
-            LOG(ERROR, "Physical IRQ %u conflicting with virtio SPI\n", irq);
+        if (virtio_enabled &&
+           (irq >= GUEST_VIRTIO_MMIO_SPI && irq <= virtio_irq)) {
+            LOG(ERROR, "Physical IRQ %u conflicting with Virtio IRQ range\n", irq);
             return ERROR_FAIL;
         }
 
@@ -1011,8 +1036,19 @@ next_resize:
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
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 321a13e..8da328d 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1821,6 +1821,7 @@ const libxl__device_type *device_type_tbl[] = {
     &libxl__dtdev_devtype,
     &libxl__vdispl_devtype,
     &libxl__vsnd_devtype,
+    &libxl__virtio_disk_devtype,
     NULL
 };
 
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index e26cda9..ea497bb 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4000,6 +4000,7 @@ extern const libxl__device_type libxl__vdispl_devtype;
 extern const libxl__device_type libxl__p9_devtype;
 extern const libxl__device_type libxl__pvcallsif_devtype;
 extern const libxl__device_type libxl__vsnd_devtype;
+extern const libxl__device_type libxl__virtio_disk_devtype;
 
 extern const libxl__device_type *device_type_tbl[];
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index b054bf9..5f8a3ff 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
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
diff --git a/tools/libs/light/libxl_types_internal.idl b/tools/libs/light/libxl_types_internal.idl
index 3593e21..8f71980 100644
--- a/tools/libs/light/libxl_types_internal.idl
+++ b/tools/libs/light/libxl_types_internal.idl
@@ -32,6 +32,7 @@ libxl__device_kind = Enumeration("device_kind", [
     (14, "PVCALLS"),
     (15, "VSND"),
     (16, "VINPUT"),
+    (17, "VIRTIO_DISK"),
     ])
 
 libxl__console_backend = Enumeration("console_backend", [
diff --git a/tools/libs/light/libxl_virtio_disk.c b/tools/libs/light/libxl_virtio_disk.c
new file mode 100644
index 0000000..25e7f1a
--- /dev/null
+++ b/tools/libs/light/libxl_virtio_disk.c
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
index bdf67c8..9d8f2aa 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -23,7 +23,7 @@ XL_OBJS += xl_vtpm.o xl_block.o xl_nic.o xl_usb.o
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
index 7da6c1b..745afab 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -435,6 +435,21 @@ struct cmd_spec cmd_table[] = {
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
index 10acf22..6cf3524 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1204,6 +1204,120 @@ out:
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
+                            libxl_domain_config *d_config)
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
@@ -2734,6 +2848,7 @@ skip_usbdev:
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


