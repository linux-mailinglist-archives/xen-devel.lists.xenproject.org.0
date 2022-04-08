Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E574F9C77
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 20:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301746.515028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nctEV-0004zD-Jt; Fri, 08 Apr 2022 18:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301746.515028; Fri, 08 Apr 2022 18:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nctEV-0004xD-FQ; Fri, 08 Apr 2022 18:21:19 +0000
Received: by outflank-mailman (input) for mailman id 301746;
 Fri, 08 Apr 2022 18:21:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cJw0=US=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nctET-0004Rr-SU
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 18:21:18 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad117e5b-b768-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 20:21:15 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id d29so14080170wra.10
 for <xen-devel@lists.xenproject.org>; Fri, 08 Apr 2022 11:21:15 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm24084701wry.102.2022.04.08.11.21.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Apr 2022 11:21:12 -0700 (PDT)
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
X-Inumbo-ID: ad117e5b-b768-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eHPD+vVWIBvq/dPK+HYt2wla5Lo/yXzHhwikZqN3mrU=;
        b=hR9xp6vNsHtZ4XnLgxTHY03IyH45uSQCtIraktRqiWu6gX9BlvS7nreP7zgiwX6JZJ
         AbjBEKZ8IJ3YmP+T7pRbMx+vlPX8uXG51n1rnVtEPaGQl5aIWzKVNvz1PlAobMsOHCr0
         4YRNhqfzb0qPgvVzavMwiL9UAQ/jJnK7MSm1CmpBFTnlhDbY8+5LxJqq243M6yTopgk1
         lzqyYscHJ7JH6IUpudihUs14MMx1pkHgc5MzQ5/VS2d9SylO6T1aTIPvmTLz4VVNFZyv
         haipcKvQkHOnZUjfFRQaNLINfMetFQ8DB+45TeJNhYCqrWnCEMMQZCLFsQFPjg63+aDu
         2kCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eHPD+vVWIBvq/dPK+HYt2wla5Lo/yXzHhwikZqN3mrU=;
        b=fALugykqJmaj9NEd7Iax275RfOmDI7rBTWuf7Em1Al0j1c48Uel4PFJLQjEIeJknzx
         d6btRi3uSHh3AMfO4OoPqlSTqzhXBKr9siFIi56pEfz84UBYFNLQyTEGwOk/vneAYoc/
         b3t374ZivZeI4V+fMZVV4noWC/jVUC93wHhzqtlFebNCFf0U5F0CHtI0dYunYOtRKyWS
         zNlSSyB590sG5cIvyoXw0aWxlMnFKj8IBdTM9bwzWm1WKjeV6rCJRQjFoFaa3YOBs2ym
         ToMGHHP3Jb+D8zpz93hN8IYNLjFlKPdY7E5rqyfEuPyzq2l2hgPwDgM0VvTBRS5Mq/uT
         K+IA==
X-Gm-Message-State: AOAM530VF6o4BdOcFEIIUmTv3MAiB/BKi1d2rtBcHhdu91aXYYI3OHMJ
	+z4FBdX52SrPTYDt49PxKbfbYun5bDA=
X-Google-Smtp-Source: ABdhPJw6pRr3zkVCss7RRK0I92VEprt+Xhv81VmgWuYzVjvnpqCsfT+h9Da/DsQ3zrbz52ibfxBPWA==
X-Received: by 2002:a5d:4712:0:b0:206:120d:b038 with SMTP id y18-20020a5d4712000000b00206120db038mr16414283wrq.542.1649442073265;
        Fri, 08 Apr 2022 11:21:13 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH V7 1/2] libxl: Add support for Virtio disk configuration
Date: Fri,  8 Apr 2022 21:21:04 +0300
Message-Id: <1649442065-8332-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch adds basic support for configuring and assisting virtio-mmio
based virtio-disk backend (emualator) which is intended to run out of
Qemu and could be run in any domain.
Although the Virtio block device is quite different from traditional
Xen PV block device (vbd) from the toolstack's point of view:
 - as the frontend is virtio-blk which is not a Xenbus driver, nothing
   written to Xenstore are fetched by the frontend (the vdev is not
   passed to the frontend)
 - the ring-ref/event-channel are not used for the backend<->frontend
   communication, the proposed IPC for Virtio is IOREQ/DM
it is still a "block device" and ought to be integrated in existing
"disk" handling. So, re-use (and adapt) "disk" parsing/configuration
logic to deal with Virtio devices as well.

For the immediate purpose and an ability to extend that support for
other use-cases in future (Qemu, virtio-pci, etc) perform the following
actions:
- Add new disk backend type (LIBXL_DISK_BACKEND_OTHER) and reflect
  that in the configuration
- Introduce new disk protocol field to libxl_device_disk struct
  (with LIBXL_DISK_PROTOCOL_XEN and LIBXL_DISK_PROTOCOL_VIRTIO_MMIO
  types) and reflect that in the configuration (new "protocol" option
  with "xen" protocol being default value)
- Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
  one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model

An example of domain configuration for Virtio disk:
disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=other, protocol=virtio-mmio']

Nothing has changed for default Xen disk configuration.

Please note, this patch is not enough for virtio-disk to work
on Xen (Arm), as for every Virtio device (including disk) we need
to allocate Virtio MMIO params (IRQ and memory region) and pass
them to the backend, also update Guest device-tree. The subsequent
patch will add these missing bits. For the current patch,
the default "irq" and "base" are just written to the Xenstore.
This is not an ideal splitting, but this way we avoid breaking
the bisectability.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes RFC -> V1:
   - no changes

Changes V1 -> V2:
   - rebase according to the new location of libxl_virtio_disk.c

Changes V2 -> V3:
   - no changes

Changes V3 -> V4:
   - rebase according to the new argument for DEFINE_DEVICE_TYPE_STRUCT

Changes V4 -> V5:
   - split the changes, change the order of the patches
   - update patch description
   - don't introduce new "vdisk" configuration option with own parsing logic,
     re-use Xen PV block "disk" parsing/configuration logic for the virtio-disk
   - introduce "virtio" flag and document it's usage
   - add LIBXL_HAVE_DEVICE_DISK_VIRTIO
   - update libxlu_disk_l.[ch]
   - drop num_disks variable/MAX_VIRTIO_DISKS
   - drop Wei's T-b

Changes V5 -> V6:
   - rebase on current staging
   - use "%"PRIu64 instead of %lu for disk->base in device_disk_add()
   - update *.gen.go files

Changes V6 -> V7:
   - rebase on current staging
   - update *.gen.go files and libxlu_disk_l.[ch] files
   - update patch description
   - rework significantly to support more flexible configuration
     and have more generic basic implementation for being able to extend
     that for other use-cases (virtio-pci, qemu, etc).
---
 docs/man/xl-disk-configuration.5.pod.in   |  37 +-
 tools/golang/xenlight/helpers.gen.go      |   6 +
 tools/golang/xenlight/types.gen.go        |  11 +
 tools/include/libxl.h                     |   6 +
 tools/libs/light/libxl_device.c           |  57 +-
 tools/libs/light/libxl_disk.c             | 111 +++-
 tools/libs/light/libxl_internal.h         |   1 +
 tools/libs/light/libxl_types.idl          |  10 +
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_utils.c            |   2 +
 tools/libs/util/libxlu_disk_l.c           | 952 +++++++++++++++---------------
 tools/libs/util/libxlu_disk_l.h           |   2 +-
 tools/libs/util/libxlu_disk_l.l           |   9 +
 tools/xl/xl_block.c                       |  11 +
 14 files changed, 736 insertions(+), 480 deletions(-)

diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-configuration.5.pod.in
index 71d0e86..36c851f 100644
--- a/docs/man/xl-disk-configuration.5.pod.in
+++ b/docs/man/xl-disk-configuration.5.pod.in
@@ -232,7 +232,7 @@ Specifies the backend implementation to use
 
 =item Supported values
 
-phy, qdisk
+phy, qdisk, other
 
 =item Mandatory
 
@@ -244,11 +244,13 @@ Automatically determine which backend to use.
 
 =back
 
-This does not affect the guest's view of the device.  It controls
-which software implementation of the Xen backend driver is used.
+It controls which software implementation of the backend driver is used.
+Depending on the "protocol" option this may affect the guest's view
+of the device.
 
 Not all backend drivers support all combinations of other options.
-For example, "phy" does not support formats other than "raw".
+For example, "phy" and "other" do not support formats other than "raw" and
+"other" does not support protocols other than "virtio-mmio".
 Normally this option should not be specified, in which case libxl will
 automatically determine the most suitable backend.
 
@@ -344,8 +346,35 @@ can be used to disable "hole punching" for file based backends which
 were intentionally created non-sparse to avoid fragmentation of the
 file.
 
+=item B<protocol>=I<PROTOCOL>
+
+=over 4
+
+=item Description
+
+Specifies the communication protocol to use for the chosen "backendtype" option
+
+=item Supported values
+
+xen, virtio-mmio
+
+=item Mandatory
+
+No
+
+=item Default value
+
+xen
+
 =back
 
+Besides forcing toolstack to use specific backend implementation, this also
+affects the guest's view of the device. For example, "virtio-mmio" requires
+Virtio frontend driver (virtio-blk) to be used. Please note, the virtual
+device (vdev) is not passed to the guest in that case, but it still must be
+specified for the internal purposes.
+
+=back
 
 =head1 COLO Parameters
 
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index b746ff1..3190671 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1751,6 +1751,9 @@ x.DirectIoSafe = bool(xc.direct_io_safe)
 if err := x.DiscardEnable.fromC(&xc.discard_enable);err != nil {
 return fmt.Errorf("converting field DiscardEnable: %v", err)
 }
+x.Protocol = DiskProtocol(xc.protocol)
+x.Irq = uint32(xc.irq)
+x.Base = uint64(xc.base)
 if err := x.ColoEnable.fromC(&xc.colo_enable);err != nil {
 return fmt.Errorf("converting field ColoEnable: %v", err)
 }
@@ -1788,6 +1791,9 @@ xc.direct_io_safe = C.bool(x.DirectIoSafe)
 if err := x.DiscardEnable.toC(&xc.discard_enable); err != nil {
 return fmt.Errorf("converting field DiscardEnable: %v", err)
 }
+xc.protocol = C.libxl_disk_protocol(x.Protocol)
+xc.irq = C.uint32_t(x.Irq)
+xc.base = C.uint64_t(x.Base)
 if err := x.ColoEnable.toC(&xc.colo_enable); err != nil {
 return fmt.Errorf("converting field ColoEnable: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index b1e84d5..4ff14c2 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -99,6 +99,14 @@ DiskBackendUnknown DiskBackend = 0
 DiskBackendPhy DiskBackend = 1
 DiskBackendTap DiskBackend = 2
 DiskBackendQdisk DiskBackend = 3
+DiskBackendOther DiskBackend = 4
+)
+
+type DiskProtocol int
+const(
+DiskProtocolUnknown DiskProtocol = 0
+DiskProtocolXen DiskProtocol = 1
+DiskProtocolVirtioMmio DiskProtocol = 2
 )
 
 type NicType int
@@ -643,6 +651,9 @@ Readwrite int
 IsCdrom int
 DirectIoSafe bool
 DiscardEnable Defbool
+Protocol DiskProtocol
+Irq uint32
+Base uint64
 ColoEnable Defbool
 ColoRestoreEnable Defbool
 ColoHost string
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 51a9b6c..66dbf63 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -528,6 +528,12 @@
 #define LIBXL_HAVE_MAX_GRANT_VERSION 1
 
 /*
+ * LIBXL_HAVE_DEVICE_DISK_PROTOCOL indicates that a 'protocol' field
+ * (of libxl_disk_protocol type) is present in libxl_device_disk.
+ */
+#define LIBXL_HAVE_DEVICE_DISK_PROTOCOL 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index e6025d1..846e8c4 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -289,9 +289,16 @@ static int disk_try_backend(disk_try_backend_args *a,
                             libxl_disk_backend backend)
  {
     libxl__gc *gc = a->gc;
+    libxl_disk_protocol protocol = a->disk->protocol;
     /* returns 0 (ie, DISK_BACKEND_UNKNOWN) on failure, or
      * backend on success */
 
+    if ((protocol == LIBXL_DISK_PROTOCOL_VIRTIO_MMIO &&
+         backend != LIBXL_DISK_BACKEND_OTHER) ||
+        (protocol != LIBXL_DISK_PROTOCOL_VIRTIO_MMIO &&
+         backend == LIBXL_DISK_BACKEND_OTHER))
+        goto bad_protocol;
+
     switch (backend) {
     case LIBXL_DISK_BACKEND_PHY:
         if (a->disk->format != LIBXL_DISK_FORMAT_RAW) {
@@ -329,6 +336,29 @@ static int disk_try_backend(disk_try_backend_args *a,
         if (a->disk->script) goto bad_script;
         return backend;
 
+    case LIBXL_DISK_BACKEND_OTHER:
+        if (a->disk->format != LIBXL_DISK_FORMAT_RAW)
+            goto bad_format;
+
+        if (a->disk->script)
+            goto bad_script;
+
+        if (libxl_defbool_val(a->disk->colo_enable))
+            goto bad_colo;
+
+        if (a->disk->backend_domid != LIBXL_TOOLSTACK_DOMID) {
+            LOG(DEBUG, "Disk vdev=%s, is using a storage driver domain, "
+                       "skipping physical device check", a->disk->vdev);
+            return backend;
+        }
+
+        if (libxl__try_phy_backend(a->stab.st_mode))
+            return backend;
+
+        LOG(DEBUG, "Disk vdev=%s, backend other unsuitable as phys path not a "
+                   "block device", a->disk->vdev);
+        return 0;
+
     default:
         LOG(DEBUG, "Disk vdev=%s, backend %d unknown", a->disk->vdev, backend);
         return 0;
@@ -352,6 +382,12 @@ static int disk_try_backend(disk_try_backend_args *a,
     LOG(DEBUG, "Disk vdev=%s, backend %s not compatible with colo",
         a->disk->vdev, libxl_disk_backend_to_string(backend));
     return 0;
+
+ bad_protocol:
+    LOG(DEBUG, "Disk vdev=%s, backend %s not compatible with protocol %s",
+        a->disk->vdev, libxl_disk_backend_to_string(backend),
+        libxl_disk_protocol_to_string(protocol));
+    return 0;
 }
 
 int libxl__backendpath_parse_domid(libxl__gc *gc, const char *be_path,
@@ -376,8 +412,9 @@ int libxl__device_disk_set_backend(libxl__gc *gc, libxl_device_disk *disk) {
     a.gc = gc;
     a.disk = disk;
 
-    LOG(DEBUG, "Disk vdev=%s spec.backend=%s", disk->vdev,
-               libxl_disk_backend_to_string(disk->backend));
+    LOG(DEBUG, "Disk vdev=%s spec.backend=%s spec.protocol=%s", disk->vdev,
+               libxl_disk_backend_to_string(disk->backend),
+               libxl_disk_protocol_to_string(disk->protocol));
 
     if (disk->format == LIBXL_DISK_FORMAT_EMPTY) {
         if (!disk->is_cdrom) {
@@ -392,7 +429,8 @@ int libxl__device_disk_set_backend(libxl__gc *gc, libxl_device_disk *disk) {
         }
         memset(&a.stab, 0, sizeof(a.stab));
     } else if ((disk->backend == LIBXL_DISK_BACKEND_UNKNOWN ||
-                disk->backend == LIBXL_DISK_BACKEND_PHY) &&
+                disk->backend == LIBXL_DISK_BACKEND_PHY ||
+                disk->backend == LIBXL_DISK_BACKEND_OTHER) &&
                disk->backend_domid == LIBXL_TOOLSTACK_DOMID &&
                !disk->script) {
         if (stat(disk->pdev_path, &a.stab)) {
@@ -408,7 +446,8 @@ int libxl__device_disk_set_backend(libxl__gc *gc, libxl_device_disk *disk) {
         ok=
             disk_try_backend(&a, LIBXL_DISK_BACKEND_PHY) ?:
             disk_try_backend(&a, LIBXL_DISK_BACKEND_QDISK) ?:
-            disk_try_backend(&a, LIBXL_DISK_BACKEND_TAP);
+            disk_try_backend(&a, LIBXL_DISK_BACKEND_TAP) ?:
+            disk_try_backend(&a, LIBXL_DISK_BACKEND_OTHER);
         if (ok)
             LOG(DEBUG, "Disk vdev=%s, using backend %s",
                        disk->vdev,
@@ -441,6 +480,16 @@ char *libxl__device_disk_string_of_backend(libxl_disk_backend backend)
         case LIBXL_DISK_BACKEND_QDISK: return "qdisk";
         case LIBXL_DISK_BACKEND_TAP: return "phy";
         case LIBXL_DISK_BACKEND_PHY: return "phy";
+        case LIBXL_DISK_BACKEND_OTHER: return "other";
+        default: return NULL;
+    }
+}
+
+char *libxl__device_disk_string_of_protocol(libxl_disk_protocol protocol)
+{
+    switch (protocol) {
+        case LIBXL_DISK_PROTOCOL_XEN: return "xen";
+        case LIBXL_DISK_PROTOCOL_VIRTIO_MMIO: return "virtio-mmio";
         default: return NULL;
     }
 }
diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index a5ca778..9bb5098 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -163,6 +163,9 @@ static int libxl__device_disk_setdefault(libxl__gc *gc, uint32_t domid,
     rc = libxl__resolve_domid(gc, disk->backend_domname, &disk->backend_domid);
     if (rc < 0) return rc;
 
+    if (disk->protocol == LIBXL_DISK_PROTOCOL_UNKNOWN)
+        disk->protocol = LIBXL_DISK_PROTOCOL_XEN;
+
     /* Force Qdisk backend for CDROM devices of guests with a device model. */
     if (disk->is_cdrom != 0 &&
         libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
@@ -204,6 +207,9 @@ static int libxl__device_from_disk(libxl__gc *gc, uint32_t domid,
         case LIBXL_DISK_BACKEND_QDISK:
             device->backend_kind = LIBXL__DEVICE_KIND_QDISK;
             break;
+        case LIBXL_DISK_BACKEND_OTHER:
+            device->backend_kind = LIBXL__DEVICE_KIND_VIRTIO_DISK;
+            break;
         default:
             LOGD(ERROR, domid, "Unrecognized disk backend type: %d",
                  disk->backend);
@@ -212,7 +218,8 @@ static int libxl__device_from_disk(libxl__gc *gc, uint32_t domid,
 
     device->domid = domid;
     device->devid = devid;
-    device->kind  = LIBXL__DEVICE_KIND_VBD;
+    device->kind = disk->backend == LIBXL_DISK_BACKEND_OTHER ?
+        LIBXL__DEVICE_KIND_VIRTIO_DISK : LIBXL__DEVICE_KIND_VBD;
 
     return 0;
 }
@@ -317,6 +324,11 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
             goto out;
         }
 
+        assert((disk->protocol == LIBXL_DISK_PROTOCOL_VIRTIO_MMIO &&
+                disk->backend == LIBXL_DISK_BACKEND_OTHER) ||
+               (disk->protocol != LIBXL_DISK_PROTOCOL_VIRTIO_MMIO &&
+                disk->backend != LIBXL_DISK_BACKEND_OTHER));
+
         switch (disk->backend) {
             case LIBXL_DISK_BACKEND_PHY:
                 dev = disk->pdev_path;
@@ -330,7 +342,14 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
 
                 assert(device->backend_kind == LIBXL__DEVICE_KIND_VBD);
                 break;
+            case LIBXL_DISK_BACKEND_OTHER:
+                dev = disk->pdev_path;
+
+                flexarray_append(back, "params");
+                flexarray_append(back, dev);
 
+                assert(device->backend_kind == LIBXL__DEVICE_KIND_VIRTIO_DISK);
+                break;
             case LIBXL_DISK_BACKEND_TAP:
                 LOG(ERROR, "blktap is not supported");
                 rc = ERROR_FAIL;
@@ -386,6 +405,12 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
         flexarray_append_pair(back, "discard-enable",
                               libxl_defbool_val(disk->discard_enable) ?
                               "1" : "0");
+        flexarray_append(back, "protocol");
+        flexarray_append(back, libxl__device_disk_string_of_protocol(disk->protocol));
+        if (disk->protocol == LIBXL_DISK_PROTOCOL_VIRTIO_MMIO) {
+            flexarray_append_pair(back, "base", GCSPRINTF("%"PRIu64, disk->base));
+            flexarray_append_pair(back, "irq", GCSPRINTF("%u", disk->irq));
+        }
 
         flexarray_append(front, "backend-id");
         flexarray_append(front, GCSPRINTF("%d", disk->backend_domid));
@@ -532,6 +557,37 @@ static int libxl__disk_from_xenstore(libxl__gc *gc, const char *libxl_path,
     }
     libxl_string_to_backend(ctx, tmp, &(disk->backend));
 
+    tmp = libxl__xs_read(gc, XBT_NULL,
+                         GCSPRINTF("%s/protocol", libxl_path));
+    if (!tmp) {
+        LOG(ERROR, "Missing xenstore node %s/protocol", libxl_path);
+        goto cleanup;
+    }
+    if (!strcmp(tmp, "xen"))
+        disk->protocol = LIBXL_DISK_PROTOCOL_XEN;
+    else if (!strcmp(tmp, "virtio-mmio"))
+        disk->protocol = LIBXL_DISK_PROTOCOL_VIRTIO_MMIO;
+    else
+        disk->protocol = LIBXL_DISK_PROTOCOL_UNKNOWN;
+
+    if (disk->protocol == LIBXL_DISK_PROTOCOL_VIRTIO_MMIO) {
+        tmp = libxl__xs_read(gc, XBT_NULL,
+                             GCSPRINTF("%s/base", libxl_path));
+        if (!tmp) {
+            LOG(ERROR, "Missing xenstore node %s/base", libxl_path);
+            goto cleanup;
+        }
+        disk->base = strtoul(tmp, NULL, 10);
+
+        tmp = libxl__xs_read(gc, XBT_NULL,
+                             GCSPRINTF("%s/irq", libxl_path));
+        if (!tmp) {
+            LOG(ERROR, "Missing xenstore node %s/irq", libxl_path);
+            goto cleanup;
+        }
+        disk->irq = strtoul(tmp, NULL, 10);
+    }
+
     disk->vdev = xs_read(ctx->xsh, XBT_NULL,
                          GCSPRINTF("%s/dev", libxl_path), &len);
     if (!disk->vdev) {
@@ -575,6 +631,41 @@ cleanup:
     return rc;
 }
 
+static int libxl_device_disk_get_path(libxl__gc *gc, uint32_t domid,
+                                      char **path)
+{
+    const char *dir;
+    int rc;
+
+    /*
+     * As we don't know exactly what device kind to be used here, guess it
+     * by checking the presence of the corresponding path in Xenstore.
+     * First, try to read path for vbd device (default) and if not exists
+     * read path for virtio_disk device. This will work as long as both Xen PV
+     * and Virtio disk devices are not assigned to the same guest.
+     */
+    *path = GCSPRINTF("%s/device/%s",
+                      libxl__xs_libxl_path(gc, domid),
+                      libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VBD));
+
+    rc = libxl__xs_read_checked(gc, XBT_NULL, *path, &dir);
+    if (rc)
+        return rc;
+
+    if (dir)
+        return 0;
+
+    *path = GCSPRINTF("%s/device/%s",
+                      libxl__xs_libxl_path(gc, domid),
+                      libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VIRTIO_DISK));
+
+    rc = libxl__xs_read_checked(gc, XBT_NULL, *path, &dir);
+    if (rc)
+        return rc;
+
+    return 0;
+}
+
 int libxl_vdev_to_device_disk(libxl_ctx *ctx, uint32_t domid,
                               const char *vdev, libxl_device_disk *disk)
 {
@@ -588,10 +679,12 @@ int libxl_vdev_to_device_disk(libxl_ctx *ctx, uint32_t domid,
 
     libxl_device_disk_init(disk);
 
-    libxl_path = libxl__domain_device_libxl_path(gc, domid, devid,
-                                                 LIBXL__DEVICE_KIND_VBD);
+    rc = libxl_device_disk_get_path(gc, domid, &libxl_path);
+    if (rc)
+        return rc;
 
-    rc = libxl__disk_from_xenstore(gc, libxl_path, devid, disk);
+    rc = libxl__disk_from_xenstore(gc, GCSPRINTF("%s/%d", libxl_path, devid),
+                                   devid, disk);
 
     GC_FREE;
     return rc;
@@ -605,16 +698,19 @@ int libxl_device_disk_getinfo(libxl_ctx *ctx, uint32_t domid,
     char *fe_path, *libxl_path;
     char *val;
     int rc;
+    libxl__device_kind kind;
 
     diskinfo->backend = NULL;
 
     diskinfo->devid = libxl__device_disk_dev_number(disk->vdev, NULL, NULL);
 
-    /* tap devices entries in xenstore are written as vbd devices. */
+    /* tap devices entries in xenstore are written as vbd/virtio_disk devices. */
+    kind = disk->backend == LIBXL_DISK_BACKEND_OTHER ?
+        LIBXL__DEVICE_KIND_VIRTIO_DISK : LIBXL__DEVICE_KIND_VBD;
     fe_path = libxl__domain_device_frontend_path(gc, domid, diskinfo->devid,
-                                                 LIBXL__DEVICE_KIND_VBD);
+                                                 kind);
     libxl_path = libxl__domain_device_libxl_path(gc, domid, diskinfo->devid,
-                                                 LIBXL__DEVICE_KIND_VBD);
+                                                 kind);
     diskinfo->backend = xs_read(ctx->xsh, XBT_NULL,
                                 GCSPRINTF("%s/backend", libxl_path), NULL);
     if (!diskinfo->backend) {
@@ -1418,6 +1514,7 @@ LIBXL_DEFINE_DEVICE_LIST(disk)
 #define libxl__device_disk_update_devid NULL
 
 DEFINE_DEVICE_TYPE_STRUCT(disk, VBD, disks,
+    .get_path    = libxl_device_disk_get_path,
     .merge       = libxl_device_disk_merge,
     .dm_needed   = libxl_device_disk_dm_needed,
     .from_xenstore = (device_from_xenstore_fn_t)libxl__disk_from_xenstore,
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index a26daec..f4eb75d 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -1493,6 +1493,7 @@ _hidden char * libxl__domain_pvcontrol_read(libxl__gc *gc,
 
 /* from xl_device */
 _hidden char *libxl__device_disk_string_of_backend(libxl_disk_backend backend);
+_hidden char *libxl__device_disk_string_of_protocol(libxl_disk_protocol protocol);
 _hidden char *libxl__device_disk_string_of_format(libxl_disk_format format);
 _hidden const char *libxl__qemu_disk_format_string(libxl_disk_format format);
 _hidden int libxl__device_disk_set_backend(libxl__gc*, libxl_device_disk*);
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 2a42da2..5d57e3a 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -130,6 +130,13 @@ libxl_disk_backend = Enumeration("disk_backend", [
     (1, "PHY"),
     (2, "TAP"),
     (3, "QDISK"),
+    (4, "OTHER"),
+    ])
+
+libxl_disk_protocol = Enumeration("disk_protocol", [
+    (0, "UNKNOWN"),
+    (1, "XEN"),
+    (2, "VIRTIO_MMIO"),
     ])
 
 libxl_nic_type = Enumeration("nic_type", [
@@ -704,6 +711,9 @@ libxl_device_disk = Struct("device_disk", [
     ("is_cdrom", integer),
     ("direct_io_safe", bool),
     ("discard_enable", libxl_defbool),
+    ("protocol", libxl_disk_protocol),
+    ("irq", uint32),
+    ("base", uint64),
     # Note that the COLO configuration settings should be considered unstable.
     # They may change incompatibly in future versions of Xen.
     ("colo_enable", libxl_defbool),
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
diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_utils.c
index b91c2ca..eb816dd 100644
--- a/tools/libs/light/libxl_utils.c
+++ b/tools/libs/light/libxl_utils.c
@@ -303,6 +303,8 @@ int libxl_string_to_backend(libxl_ctx *ctx, char *s, libxl_disk_backend *backend
         *backend = LIBXL_DISK_BACKEND_TAP;
     } else if (!strcmp(s, "qdisk")) {
         *backend = LIBXL_DISK_BACKEND_QDISK;
+    } else if (!strcmp(s, "other")) {
+        *backend = LIBXL_DISK_BACKEND_OTHER;
     } else if (!strcmp(s, "tap")) {
         p = strchr(s, ':');
         if (!p) {
diff --git a/tools/libs/util/libxlu_disk_l.c b/tools/libs/util/libxlu_disk_l.c
index 32d4b74..af22055 100644
--- a/tools/libs/util/libxlu_disk_l.c
+++ b/tools/libs/util/libxlu_disk_l.c
@@ -549,8 +549,8 @@ static void yynoreturn yy_fatal_error ( const char* msg , yyscan_t yyscanner );
 	yyg->yy_hold_char = *yy_cp; \
 	*yy_cp = '\0'; \
 	yyg->yy_c_buf_p = yy_cp;
-#define YY_NUM_RULES 36
-#define YY_END_OF_BUFFER 37
+#define YY_NUM_RULES 37
+#define YY_END_OF_BUFFER 38
 /* This struct is not used in this scanner,
    but its presence is necessary. */
 struct yy_trans_info
@@ -558,74 +558,75 @@ struct yy_trans_info
 	flex_int32_t yy_verify;
 	flex_int32_t yy_nxt;
 	};
-static const flex_int16_t yy_acclist[575] =
+static const flex_int16_t yy_acclist[589] =
     {   0,
-       35,   35,   37,   33,   34,   36, 8193,   33,   34,   36,
-    16385, 8193,   33,   36,16385,   33,   34,   36,   34,   36,
-       33,   34,   36,   33,   34,   36,   33,   34,   36,   33,
-       34,   36,   33,   34,   36,   33,   34,   36,   33,   34,
-       36,   33,   34,   36,   33,   34,   36,   33,   34,   36,
-       33,   34,   36,   33,   34,   36,   33,   34,   36,   33,
-       34,   36,   33,   34,   36,   33,   34,   36,   35,   36,
-       36,   33,   33, 8193,   33, 8193,   33,16385, 8193,   33,
-     8193,   33,   33, 8224,   33,16416,   33,   33,   33,   33,
-       33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
-
-       33,   33,   33,   33,   33,   33,   33,   33,   33,   35,
-     8193,   33, 8193,   33, 8193, 8224,   33, 8224,   33, 8224,
-       23,   33,   33,   33,   33,   33,   33,   33,   33,   33,
-       33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
-       33,   33,   33,   33,   33, 8224,   33, 8224,   33, 8224,
-       23,   33,   33,   28, 8224,   33,16416,   33,   33,   15,
-       33,   33,   33,   33,   33,   33,   33,   33,   33, 8217,
-     8224,   33,16409,16416,   33,   33,   31, 8224,   33,16416,
-       33, 8216, 8224,   33,16408,16416,   33,   33, 8219, 8224,
-       33,16411,16416,   33,   33,   33,   33,   33,   28, 8224,
-
-       33,   28, 8224,   33,   28,   33,   28, 8224,   33,    3,
-       33,   15,   33,   33,   33,   33,   33,   30, 8224,   33,
-    16416,   33,   33,   33, 8217, 8224,   33, 8217, 8224,   33,
-     8217,   33, 8217, 8224,   33,   33,   31, 8224,   33,   31,
-     8224,   33,   31,   33,   31, 8224, 8216, 8224,   33, 8216,
-     8224,   33, 8216,   33, 8216, 8224,   33, 8219, 8224,   33,
-     8219, 8224,   33, 8219,   33, 8219, 8224,   33,   33,   10,
-       33,   33,   28, 8224,   33,   28, 8224,   33,   28, 8224,
-       28,   33,   28,   33,    3,   33,   33,   33,   33,   33,
-       33,   33,   30, 8224,   33,   30, 8224,   33,   30,   33,
-
-       30, 8224,   33,   33,   29, 8224,   33,16416, 8217, 8224,
-       33, 8217, 8224,   33, 8217, 8224, 8217,   33, 8217,   33,
-       33,   31, 8224,   33,   31, 8224,   33,   31, 8224,   31,
-       33,   31, 8216, 8224,   33, 8216, 8224,   33, 8216, 8224,
-     8216,   33, 8216,   33, 8219, 8224,   33, 8219, 8224,   33,
-     8219, 8224, 8219,   33, 8219,   33,   33,   10,   23,   10,
-        7,   33,   33,   33,   33,   33,   33,   33,   13,   33,
-       30, 8224,   33,   30, 8224,   33,   30, 8224,   30,   33,
-       30,    2,   33,   29, 8224,   33,   29, 8224,   33,   29,
-       33,   29, 8224,   16,   33,   33,   11,   33,   22,   10,
-
-       10,   23,    7,   23,    7,   33,    8,   33,   33,   33,
-       33,    6,   33,   13,   33,    2,   23,    2,   33,   29,
-     8224,   33,   29, 8224,   33,   29, 8224,   29,   33,   29,
-       16,   33,   33,   11,   23,   11,   26, 8224,   33,16416,
-       22,   23,   22,    7,    7,   23,   33,    8,   23,    8,
-       33,   33,   33,   33,    6,   23,    6,    6,   23,    6,
-       23,   33,    2,    2,   23,   33,   33,   11,   11,   23,
-       26, 8224,   33,   26, 8224,   33,   26,   33,   26, 8224,
-       22,   23,   33,    8,    8,   23,   33,   33,   17,   18,
-        6,    6,   23,    6,    6,   33,   33,   14,   33,   26,
-
-     8224,   33,   26, 8224,   33,   26, 8224,   26,   33,   26,
-       33,   33,   33,   17,   23,   17,   18,   23,   18,    6,
-        6,   33,   33,   14,   33,   20,    9,   19,   17,   17,
-       23,   18,   18,   23,    6,    5,    6,   33,   21,   20,
-       23,   20,    9,   23,    9,   19,   23,   19,    4,    6,
-        5,    6,   33,   21,   23,   21,   20,   20,   23,    9,
-        9,   23,   19,   19,   23,    4,    6,   12,   33,   21,
-       21,   23,   12,   33
+       36,   36,   38,   34,   35,   37, 8193,   34,   35,   37,
+    16385, 8193,   34,   37,16385,   34,   35,   37,   35,   37,
+       34,   35,   37,   34,   35,   37,   34,   35,   37,   34,
+       35,   37,   34,   35,   37,   34,   35,   37,   34,   35,
+       37,   34,   35,   37,   34,   35,   37,   34,   35,   37,
+       34,   35,   37,   34,   35,   37,   34,   35,   37,   34,
+       35,   37,   34,   35,   37,   34,   35,   37,   36,   37,
+       37,   34,   34, 8193,   34, 8193,   34,16385, 8193,   34,
+     8193,   34,   34, 8225,   34,16417,   34,   34,   34,   34,
+       34,   34,   34,   34,   34,   34,   34,   34,   34,   34,
+
+       34,   34,   34,   34,   34,   34,   34,   34,   34,   34,
+       36, 8193,   34, 8193,   34, 8193, 8225,   34, 8225,   34,
+     8225,   24,   34,   34,   34,   34,   34,   34,   34,   34,
+       34,   34,   34,   34,   34,   34,   34,   34,   34,   34,
+       34,   34,   34,   34,   34,   34,   34, 8225,   34, 8225,
+       34, 8225,   24,   34,   34,   29, 8225,   34,16417,   34,
+       34,   16,   34,   34,   34,   34,   34,   34,   34,   34,
+       34, 8218, 8225,   34,16410,16417,   34,   34,   32, 8225,
+       34,16417,   34,   34, 8217, 8225,   34,16409,16417,   34,
+       34, 8220, 8225,   34,16412,16417,   34,   34,   34,   34,
+
+       34,   29, 8225,   34,   29, 8225,   34,   29,   34,   29,
+     8225,   34,    3,   34,   16,   34,   34,   34,   34,   34,
+       31, 8225,   34,16417,   34,   34,   34, 8218, 8225,   34,
+     8218, 8225,   34, 8218,   34, 8218, 8225,   34,   34,   32,
+     8225,   34,   32, 8225,   34,   32,   34,   32, 8225,   34,
+     8217, 8225,   34, 8217, 8225,   34, 8217,   34, 8217, 8225,
+       34, 8220, 8225,   34, 8220, 8225,   34, 8220,   34, 8220,
+     8225,   34,   34,   11,   34,   34,   29, 8225,   34,   29,
+     8225,   34,   29, 8225,   29,   34,   29,   34,    3,   34,
+       34,   34,   34,   34,   34,   34,   31, 8225,   34,   31,
+
+     8225,   34,   31,   34,   31, 8225,   34,   34,   30, 8225,
+       34,16417, 8218, 8225,   34, 8218, 8225,   34, 8218, 8225,
+     8218,   34, 8218,   34,   34,   32, 8225,   34,   32, 8225,
+       34,   32, 8225,   32,   34,   32,   34, 8217, 8225,   34,
+     8217, 8225,   34, 8217, 8225, 8217,   34, 8217,   34, 8220,
+     8225,   34, 8220, 8225,   34, 8220, 8225, 8220,   34, 8220,
+       34,   34,   11,   24,   11,    7,   34,   34,   34,   34,
+       34,   34,   34,   14,   34,   31, 8225,   34,   31, 8225,
+       34,   31, 8225,   31,   34,   31,    2,   34,   30, 8225,
+       34,   30, 8225,   34,   30,   34,   30, 8225,   17,   34,
+
+       34,   34,   12,   34,   23,   11,   11,   24,    7,   24,
+        7,   34,    8,   34,   34,   34,   34,    6,   34,   14,
+       34,    2,   24,    2,   34,   30, 8225,   34,   30, 8225,
+       34,   30, 8225,   30,   34,   30,   17,   34,   34,   34,
+       12,   24,   12,   27, 8225,   34,16417,   23,   24,   23,
+        7,    7,   24,   34,    8,   24,    8,   34,   34,   34,
+       34,    6,   24,    6,    6,   24,    6,   24,   34,    2,
+        2,   24,   34,   34,   10,   12,   12,   24,   27, 8225,
+       34,   27, 8225,   34,   27,   34,   27, 8225,   23,   24,
+       34,    8,    8,   24,   34,   34,   18,   19,    6,    6,
+
+       24,    6,    6,   34,   34,   15,   34,   10,   24,   10,
+       27, 8225,   34,   27, 8225,   34,   27, 8225,   27,   34,
+       27,   34,   34,   34,   18,   24,   18,   19,   24,   19,
+        6,    6,   34,   34,   15,   34,   10,   10,   24,   21,
+        9,   20,   18,   18,   24,   19,   19,   24,    6,    5,
+        6,   34,   22,   21,   24,   21,    9,   24,    9,   20,
+       24,   20,    4,    6,    5,    6,   34,   22,   24,   22,
+       21,   21,   24,    9,    9,   24,   20,   20,   24,    4,
+        6,   13,   34,   22,   22,   24,   13,   34
     } ;
 
-static const flex_int16_t yy_accept[356] =
+static const flex_int16_t yy_accept[368] =
     {   0,
         1,    1,    1,    2,    3,    4,    7,   12,   16,   19,
        21,   24,   27,   30,   33,   36,   39,   42,   45,   48,
@@ -633,39 +634,40 @@ static const flex_int16_t yy_accept[356] =
        74,   76,   79,   81,   82,   83,   84,   87,   87,   88,
        89,   90,   91,   92,   93,   94,   95,   96,   97,   98,
        99,  100,  101,  102,  103,  104,  105,  106,  107,  108,
-      109,  110,  111,  113,  115,  116,  118,  120,  121,  122,
+      109,  110,  111,  112,  114,  116,  117,  119,  121,  122,
       123,  124,  125,  126,  127,  128,  129,  130,  131,  132,
       133,  134,  135,  136,  137,  138,  139,  140,  141,  142,
-      143,  144,  145,  146,  148,  150,  151,  152,  153,  154,
-
-      158,  159,  160,  162,  163,  164,  165,  166,  167,  168,
-      169,  170,  175,  176,  177,  181,  182,  187,  188,  189,
-      194,  195,  196,  197,  198,  199,  202,  205,  207,  209,
-      210,  212,  214,  215,  216,  217,  218,  222,  223,  224,
-      225,  228,  231,  233,  235,  236,  237,  240,  243,  245,
-      247,  250,  253,  255,  257,  258,  261,  264,  266,  268,
-      269,  270,  271,  272,  273,  276,  279,  281,  283,  284,
-      285,  287,  288,  289,  290,  291,  292,  293,  296,  299,
-      301,  303,  304,  305,  309,  312,  315,  317,  319,  320,
-      321,  322,  325,  328,  330,  332,  333,  336,  339,  341,
-
-      343,  344,  345,  348,  351,  353,  355,  356,  357,  358,
-      360,  361,  362,  363,  364,  365,  366,  367,  368,  369,
-      371,  374,  377,  379,  381,  382,  383,  384,  387,  390,
-      392,  394,  396,  397,  398,  399,  400,  401,  403,  405,
-      406,  407,  408,  409,  410,  411,  412,  413,  414,  416,
-      418,  419,  420,  423,  426,  428,  430,  431,  433,  434,
-      436,  437,  441,  443,  444,  445,  447,  448,  450,  451,
-      452,  453,  454,  455,  457,  458,  460,  462,  463,  464,
-      466,  467,  468,  469,  471,  474,  477,  479,  481,  483,
-      484,  485,  487,  488,  489,  490,  491,  492,  494,  495,
-
-      496,  497,  498,  500,  503,  506,  508,  510,  511,  512,
-      513,  514,  516,  517,  519,  520,  521,  522,  523,  524,
-      526,  527,  528,  529,  530,  532,  533,  535,  536,  538,
-      539,  540,  542,  543,  545,  546,  548,  549,  551,  553,
-      554,  556,  557,  558,  560,  561,  563,  564,  566,  568,
-      570,  571,  573,  575,  575
+      143,  144,  145,  146,  147,  148,  150,  152,  153,  154,
+
+      155,  156,  160,  161,  162,  164,  165,  166,  167,  168,
+      169,  170,  171,  172,  177,  178,  179,  183,  184,  185,
+      190,  191,  192,  197,  198,  199,  200,  201,  202,  205,
+      208,  210,  212,  213,  215,  217,  218,  219,  220,  221,
+      225,  226,  227,  228,  231,  234,  236,  238,  239,  240,
+      243,  246,  248,  250,  251,  254,  257,  259,  261,  262,
+      265,  268,  270,  272,  273,  274,  275,  276,  277,  280,
+      283,  285,  287,  288,  289,  291,  292,  293,  294,  295,
+      296,  297,  300,  303,  305,  307,  308,  309,  313,  316,
+      319,  321,  323,  324,  325,  326,  329,  332,  334,  336,
+
+      337,  338,  341,  344,  346,  348,  349,  350,  353,  356,
+      358,  360,  361,  362,  363,  365,  366,  367,  368,  369,
+      370,  371,  372,  373,  374,  376,  379,  382,  384,  386,
+      387,  388,  389,  392,  395,  397,  399,  401,  402,  403,
+      404,  405,  406,  407,  409,  411,  412,  413,  414,  415,
+      416,  417,  418,  419,  420,  422,  424,  425,  426,  429,
+      432,  434,  436,  437,  439,  440,  441,  443,  444,  448,
+      450,  451,  452,  454,  455,  457,  458,  459,  460,  461,
+      462,  464,  465,  467,  469,  470,  471,  473,  474,  475,
+      476,  477,  479,  482,  485,  487,  489,  491,  492,  493,
+
+      495,  496,  497,  498,  499,  500,  502,  503,  504,  505,
+      506,  508,  510,  511,  514,  517,  519,  521,  522,  523,
+      524,  525,  527,  528,  530,  531,  532,  533,  534,  535,
+      537,  538,  540,  541,  542,  543,  544,  546,  547,  549,
+      550,  552,  553,  554,  556,  557,  559,  560,  562,  563,
+      565,  567,  568,  570,  571,  572,  574,  575,  577,  578,
+      580,  582,  584,  585,  587,  589,  589
     } ;
 
 static const YY_CHAR yy_ec[256] =
@@ -708,216 +710,221 @@ static const YY_CHAR yy_meta[35] =
         1,    1,    1,    1
     } ;
 
-static const flex_int16_t yy_base[424] =
+static const flex_int16_t yy_base[438] =
     {   0,
-        0,    0,  901,  900,  902,  897,   33,   36,  905,  905,
-       45,   63,   31,   42,   51,   52,  890,   33,   65,   67,
-       69,   70,  889,   71,  888,   75,    0,  905,  893,  905,
-       91,   94,    0,    0,  103,  886,  112,    0,   89,   98,
-      113,   92,  114,   99,  100,   48,  121,  116,  119,   74,
-      124,  129,  123,  135,  132,  133,  137,  134,  138,  139,
-      141,    0,  155,    0,    0,  164,    0,    0,  849,  142,
-      152,  164,  140,  161,  165,  166,  167,  168,  169,  173,
-      174,  178,  176,  180,  184,  208,  189,  183,  192,  195,
-      215,  191,  193,  223,    0,    0,  905,  208,  204,  236,
-
-      219,  209,  238,  196,  237,  831,  242,  815,  241,  224,
-      243,  261,  244,  259,  277,  266,  286,  250,  288,  298,
-      249,  283,  274,  282,  294,  308,    0,  310,    0,  295,
-      305,  905,  308,  306,  313,  314,  342,  319,  316,  320,
-      331,    0,  349,    0,  342,  344,  356,    0,  358,    0,
-      365,    0,  367,    0,  354,  375,    0,  377,    0,  363,
-      356,  809,  327,  322,  384,    0,    0,    0,    0,  379,
-      905,  382,  384,  386,  390,  372,  392,  403,    0,  410,
-        0,  407,  413,  423,  426,    0,    0,    0,    0,  409,
-      424,  435,    0,    0,    0,    0,  437,    0,    0,    0,
-
-        0,  433,  444,    0,    0,    0,    0,  391,  440,  781,
-      905,  769,  439,  445,  444,  447,  449,  454,  453,  399,
-      464,    0,    0,    0,    0,  757,  465,  476,    0,  478,
-        0,  479,  476,  753,  462,  490,  749,  905,  745,  905,
-      483,  737,  424,  485,  487,  490,  500,  493,  905,  729,
-      905,  502,  518,    0,    0,    0,    0,  905,  498,  721,
-      905,  527,  713,    0,  705,  905,  495,  697,  905,  365,
-      521,  528,  530,  685,  905,  534,  540,  540,  657,  905,
-      537,  542,  650,  905,  553,    0,  557,    0,    0,  551,
-      641,  905,  558,  557,  633,  614,  613,  905,  547,  555,
-
-      563,  565,  569,  584,    0,    0,    0,    0,  583,  570,
-      585,  612,  905,  601,  905,  522,  580,  589,  594,  905,
-      600,  585,  563,  520,  905,  514,  905,  586,  486,  597,
-      480,  441,  905,  416,  905,  345,  905,  334,  905,  601,
-      254,  905,  242,  905,  200,  905,  151,  905,  905,  607,
-       86,  905,  905,  905,  620,  624,  627,  631,  635,  639,
-      643,  647,  651,  655,  659,  663,  667,  671,  675,  679,
-      683,  687,  691,  695,  699,  703,  707,  711,  715,  719,
-      723,  727,  731,  735,  739,  743,  747,  751,  755,  759,
-      763,  767,  771,  775,  779,  783,  787,  791,  795,  799,
-
-      803,  807,  811,  815,  819,  823,  827,  831,  835,  839,
-      843,  847,  851,  855,  859,  863,  867,  871,  875,  879,
-      883,  887,  891
+        0,    0,  927,  926,  928,  923,   33,   36,  931,  931,
+       45,   63,   31,   42,   51,   52,  916,   33,   65,   67,
+       69,   70,  915,   71,  914,   75,    0,  931,  919,  931,
+       91,   95,    0,    0,  104,  912,  113,    0,   91,   99,
+      114,   92,  115,   80,  100,   48,  119,  121,  122,   74,
+      123,  128,  131,  129,  125,  133,  136,  135,  137,  138,
+      140,  142,    0,  165,    0,    0,  167,    0,    0,  917,
+      148,  143,  165,  146,  162,  167,  168,  169,  170,  171,
+      175,  177,  180,  178,  182,  186,  210,  193,  188,  192,
+      196,  197,  218,  211,  185,  226,    0,    0,  931,  210,
+
+      222,  253,  195,  223,  232,  229,  231,  910,  236,  909,
+      237,  230,  249,  267,  253,  261,  279,  224,  242,  288,
+      275,  291,  301,  268,  284,  298,  285,  301,  313,    0,
+      315,    0,  302,  310,  931,  314,  311,  313,  319,  346,
+      323,  320,  324,  353,    0,  355,    0,  332,  348,  362,
+        0,  364,    0,  325,  366,    0,  374,    0,  353,  376,
+        0,  383,    0,  362,  364,  914,  331,  379,  391,    0,
+        0,    0,    0,  378,  931,  384,  386,  389,  393,  399,
+      395,  411,    0,  415,    0,  402,  411,  424,  427,    0,
+        0,    0,    0,  410,  425,  436,    0,    0,    0,    0,
+
+      425,  438,    0,    0,    0,    0,  434,  447,    0,    0,
+        0,    0,  438,  443,  871,  931,  855,  442,  450,  449,
+      452,  454,  459,  458,  453,  469,    0,    0,    0,    0,
+      835,  470,  481,    0,  483,    0,  484,  481,  479,  823,
+      467,  495,  795,  931,  783,  931,  489,  771,  485,  491,
+      493,  496,  508,  504,  931,  767,  931,  511,  523,    0,
+        0,    0,    0,  931,  518,  501,  763,  931,  545,  759,
+        0,  751,  931,  523,  743,  931,  508,  525,  530,  546,
+      735,  931,  552,  553,  555,  727,  931,  549,  501,  719,
+      711,  931,  560,    0,  569,    0,    0,  562,  699,  931,
+
+      530,  567,  671,  664,  655,  931,  562,  566,  571,  573,
+      588,  647,  931,  594,    0,    0,    0,    0,  578,  595,
+      597,  628,  931,  627,  931,  584,  591,  602,  604,  931,
+      626,  931,  625,  624,  623,  622,  931,  603,  931,  598,
+      577,  606,  572,  537,  931,  530,  931,  442,  931,  402,
+      931,  610,  377,  931,  334,  931,  260,  931,  204,  931,
+      931,  621,  147,  931,  931,  931,  634,  638,  641,  645,
+      649,  653,  657,  661,  665,  669,  673,  677,  681,  685,
+      689,  693,  697,  701,  705,  709,  713,  717,  721,  725,
+      729,  733,  737,  741,  745,  749,  753,  757,  761,  765,
+
+      769,  773,  777,  781,  785,  789,  793,  797,  801,  805,
+      809,  813,  817,  821,  825,  829,  833,  837,  841,  845,
+      849,  853,  857,  861,  865,  869,  873,  877,  881,  885,
+      889,  893,  897,  901,  905,  909,  913
     } ;
 
-static const flex_int16_t yy_def[424] =
+static const flex_int16_t yy_def[438] =
     {   0,
-      354,    1,  355,  355,  354,  356,  357,  357,  354,  354,
-      358,  358,   12,   12,   12,   12,   12,   12,   12,   12,
-       12,   12,   12,   12,   12,   12,  359,  354,  356,  354,
-      360,  357,  361,  361,  362,   12,  356,  363,   12,   12,
+      366,    1,  367,  367,  366,  368,  369,  369,  366,  366,
+      370,  370,   12,   12,   12,   12,   12,   12,   12,   12,
+       12,   12,   12,   12,   12,   12,  371,  366,  368,  366,
+      372,  369,  373,  373,  374,   12,  368,  375,   12,   12,
        12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
        12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
-       12,  359,  360,  361,  361,  364,  365,  365,  354,   12,
+       12,   12,  371,  372,  373,  373,  376,  377,  377,  366,
        12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
-       12,   12,   12,   12,   12,  362,   12,   12,   12,   12,
-       12,   12,   12,  364,  365,  365,  354,   12,   12,  366,
-
-       12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
-       12,  367,   86,   86,  368,   12,  369,   12,   12,  370,
-       12,   12,   12,   12,   12,  371,  372,  366,  372,   12,
-       12,  354,   86,   12,   12,   12,  373,   12,   12,   12,
-      374,  375,  367,  375,   86,   86,  376,  377,  368,  377,
-      378,  379,  369,  379,   12,  380,  381,  370,  381,   12,
-       12,  382,   12,   12,  371,  372,  372,  383,  383,   12,
-      354,   86,   86,   86,   12,   12,   12,  384,  385,  373,
-      385,   12,   12,  386,  374,  375,  375,  387,  387,   86,
-       86,  376,  377,  377,  388,  388,  378,  379,  379,  389,
-
-      389,   12,  380,  381,  381,  390,  390,   12,   12,  391,
-      354,  392,   86,   12,   86,   86,   86,   12,   86,   12,
-      384,  385,  385,  393,  393,  394,   86,  395,  396,  386,
-      396,   86,   86,  397,   12,  398,  391,  354,  399,  354,
-       86,  400,   12,   86,   86,   86,  401,   86,  354,  402,
-      354,   86,  395,  396,  396,  403,  403,  354,   86,  404,
-      354,  405,  406,  406,  399,  354,   86,  407,  354,   12,
-       86,   86,   86,  408,  354,  408,  408,   86,  402,  354,
-       86,   86,  404,  354,  409,  410,  405,  410,  406,   86,
-      407,  354,   12,   86,  411,  412,  408,  354,  408,  408,
-
-       86,   86,   86,  409,  410,  410,  413,  413,   86,   12,
-       86,  414,  354,  415,  354,  408,  408,   86,   86,  354,
-      416,  417,  418,  414,  354,  415,  354,  408,  408,   86,
-      419,  420,  354,  421,  354,  422,  354,  408,  354,   86,
-      423,  354,  420,  354,  421,  354,  422,  354,  354,   86,
-      423,  354,  354,    0,  354,  354,  354,  354,  354,  354,
-      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
-      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
-      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
-      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
-
-      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
-      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
-      354,  354,  354
+       12,   12,   12,   12,   12,   12,  374,   12,   12,   12,
+       12,   12,   12,   12,   12,  376,  377,  377,  366,   12,
+
+       12,  378,   12,   12,   12,   12,   12,   12,   12,   12,
+       12,   12,   12,  379,   87,   87,  380,   12,   12,  381,
+       12,   12,  382,   12,   12,   12,   12,   12,  383,  384,
+      378,  384,   12,   12,  366,   87,   12,   12,   12,  385,
+       12,   12,   12,  386,  387,  379,  387,   87,   87,  388,
+      389,  380,  389,   12,  390,  391,  381,  391,   12,  392,
+      393,  382,  393,   12,   12,  394,   12,   12,  383,  384,
+      384,  395,  395,   12,  366,   87,   87,   87,   12,   12,
+       12,  396,  397,  385,  397,   12,   12,  398,  386,  387,
+      387,  399,  399,   87,   87,  388,  389,  389,  400,  400,
+
+       12,  390,  391,  391,  401,  401,   12,  392,  393,  393,
+      402,  402,   12,   12,  403,  366,  404,   87,   12,   87,
+       87,   87,   12,   87,   12,  396,  397,  397,  405,  405,
+      406,   87,  407,  408,  398,  408,   87,   87,   12,  409,
+       12,  410,  403,  366,  411,  366,   87,  412,   12,   87,
+       87,   87,  413,   87,  366,  414,  366,   87,  407,  408,
+      408,  415,  415,  366,   87,   12,  416,  366,  417,  418,
+      418,  411,  366,   87,  419,  366,   12,   87,   87,   87,
+      420,  366,  420,  420,   87,  414,  366,   87,   87,  421,
+      416,  366,  422,  423,  417,  423,  418,   87,  419,  366,
+
+       12,   87,  424,  425,  420,  366,  420,  420,   87,   87,
+       87,  426,  366,  422,  423,  423,  427,  427,   87,   12,
+       87,  428,  366,  429,  366,  420,  420,   87,   87,  366,
+      426,  366,  430,  431,  432,  428,  366,  429,  366,  420,
+      420,   87,  433,  434,  366,  435,  366,  436,  366,  420,
+      366,   87,  437,  366,  434,  366,  435,  366,  436,  366,
+      366,   87,  437,  366,  366,    0,  366,  366,  366,  366,
+      366,  366,  366,  366,  366,  366,  366,  366,  366,  366,
+      366,  366,  366,  366,  366,  366,  366,  366,  366,  366,
+      366,  366,  366,  366,  366,  366,  366,  366,  366,  366,
+
+      366,  366,  366,  366,  366,  366,  366,  366,  366,  366,
+      366,  366,  366,  366,  366,  366,  366,  366,  366,  366,
+      366,  366,  366,  366,  366,  366,  366,  366,  366,  366,
+      366,  366,  366,  366,  366,  366,  366
     } ;
 
-static const flex_int16_t yy_nxt[940] =
+static const flex_int16_t yy_nxt[966] =
     {   0,
         6,    7,    8,    9,    6,    6,    6,    6,   10,   11,
        12,   13,   14,   15,   16,   17,   18,   19,   17,   17,
        17,   17,   20,   17,   21,   22,   23,   24,   25,   17,
        26,   17,   17,   17,   32,   32,   33,   32,   32,   33,
        36,   34,   36,   42,   34,   29,   29,   29,   30,   35,
-       50,   36,   37,   38,   43,   44,   39,   36,   79,   45,
+       50,   36,   37,   38,   43,   44,   39,   36,   80,   45,
        36,   36,   40,   29,   29,   29,   30,   35,   46,   48,
        37,   38,   41,   47,   36,   49,   36,   53,   36,   36,
-       36,   56,   58,   36,   36,   55,   82,   60,   51,  342,
-       54,   61,   52,   29,   64,   32,   32,   33,   36,   65,
-
-       70,   36,   34,   29,   29,   29,   30,   36,   36,   36,
-       29,   38,   66,   66,   66,   67,   66,   71,   74,   66,
-       68,   72,   36,   36,   73,   36,   77,   78,   36,   76,
-       36,   53,   36,   36,   75,   85,   80,   83,   36,   86,
-       84,   36,   36,   36,   36,   81,   36,   36,   36,   36,
-       36,   36,   93,   89,  337,   98,   88,   29,   64,  101,
-       90,   36,   91,   65,   92,   87,   29,   95,   89,   99,
-       36,  100,   96,   36,   36,   36,   36,   36,   36,  106,
-      105,   85,   36,   36,  102,   36,  107,   36,  103,   36,
-      109,  112,   36,   36,  104,  108,  115,  110,   36,  117,
-
-       36,   36,   36,  335,   36,   36,  122,  111,   29,   29,
-       29,   30,  118,   36,  116,   29,   38,   36,   36,  113,
-      114,  119,  120,  123,   36,   29,   95,  121,   36,  134,
-      131,   96,  130,   36,  125,  124,  126,  126,   66,  127,
-      126,  132,  133,  126,  129,  333,   36,   36,  135,  137,
-       36,   36,   36,  140,  139,   35,   35,  352,   36,   36,
-       85,  141,  141,   66,  142,  141,  160,  145,  141,  144,
-       35,   35,   89,  117,  155,   36,  146,  147,  147,   66,
-      148,  147,  162,   36,  147,  150,  151,  151,   66,  152,
-      151,   36,   36,  151,  154,  120,  161,   36,  156,  156,
-
-       66,  157,  156,   36,   36,  156,  159,  164,  171,  163,
-       29,  166,   29,  168,   36,   36,  167,  170,  169,   35,
-       35,  172,   36,   36,  173,   36,  213,  184,   36,   36,
-      175,   36,  174,   29,  186,  212,   36,  349,  183,  187,
-      177,  176,  178,  178,   66,  179,  178,  182,  348,  178,
-      181,   29,  188,   35,   35,   35,   35,  189,   29,  193,
-       29,  195,  190,   36,  194,   36,  196,   29,  198,   29,
-      200,  191,   36,  199,   36,  201,  219,   29,  204,   29,
-      206,   36,  202,  205,  209,  207,   29,  166,   36,  293,
-      208,  214,  167,   35,   35,   35,   35,   35,   35,   36,
-
-       36,   36,  249,  218,  220,   29,  222,  216,   36,  217,
-      235,  223,   29,  224,  215,  226,   36,  227,  225,  346,
-       35,   35,   36,  228,  228,   66,  229,  228,   29,  186,
-      228,  231,  232,   36,  187,  233,   35,   29,  193,   29,
-      198,  234,   36,  194,  344,  199,   29,  204,  236,   36,
-       35,  241,  205,  242,   36,   35,   35,  270,   35,   35,
-       35,   35,  247,   36,   35,   35,   29,  222,  244,  262,
-      248,   36,  223,  243,  245,  246,   35,  252,   29,  254,
-       29,  256,  258,  342,  255,  259,  257,   35,   35,  339,
-       35,   35,   69,  264,   35,   35,   35,   35,   35,   35,
-
-      267,   35,   35,  275,   35,   35,   35,   35,  271,   35,
-       35,  276,  277,   35,   35,  272,  278,  315,  273,  281,
-       29,  254,  290,  313,  282,  275,  255,  285,  285,   66,
-      286,  285,   35,   35,  285,  288,  295,  298,  296,   35,
-       35,   35,   35,  298,  301,  328,  299,  294,   35,   35,
-      275,   35,   35,   35,  303,   29,  305,  300,  275,   29,
-      307,  306,   35,   35,  302,  308,  337,   36,   35,   35,
-      309,  310,  320,  316,   35,   35,   35,   35,  322,   36,
-       35,   35,  317,  275,  319,  311,   29,  305,  335,  275,
-      318,  321,  306,  323,   35,   35,   35,   35,  330,  329,
-
-       35,   35,  331,  333,  327,   35,   35,  338,   35,   35,
-      353,  340,   35,   35,  350,  325,  275,  315,   35,   35,
-       27,   27,   27,   27,   29,   29,   29,   31,   31,   31,
-       31,   36,   36,   36,   36,   62,  313,   62,   62,   63,
-       63,   63,   63,   65,  269,   65,   65,   35,   35,   35,
-       35,   69,   69,  261,   69,   94,   94,   94,   94,   96,
-      251,   96,   96,  128,  128,  128,  128,  143,  143,  143,
-      143,  149,  149,  149,  149,  153,  153,  153,  153,  158,
-      158,  158,  158,  165,  165,  165,  165,  167,  298,  167,
-      167,  180,  180,  180,  180,  185,  185,  185,  185,  187,
-
-      292,  187,  187,  192,  192,  192,  192,  194,  240,  194,
-      194,  197,  197,  197,  197,  199,  289,  199,  199,  203,
-      203,  203,  203,  205,  284,  205,  205,  210,  210,  210,
-      210,  169,  280,  169,  169,  221,  221,  221,  221,  223,
-      269,  223,  223,  230,  230,  230,  230,  189,  266,  189,
-      189,  196,  211,  196,  196,  201,  261,  201,  201,  207,
-      251,  207,  207,  237,  237,  237,  237,  239,  239,  239,
-      239,  225,  240,  225,  225,  250,  250,  250,  250,  253,
-      253,  253,  253,  255,  238,  255,  255,  260,  260,  260,
-      260,  263,  263,  263,  263,  265,  265,  265,  265,  268,
-
-      268,  268,  268,  274,  274,  274,  274,  279,  279,  279,
-      279,  257,  211,  257,  257,  283,  283,  283,  283,  287,
-      287,  287,  287,  264,  138,  264,  264,  291,  291,  291,
-      291,  297,  297,  297,  297,  304,  304,  304,  304,  306,
-      136,  306,  306,  312,  312,  312,  312,  314,  314,  314,
-      314,  308,   97,  308,  308,  324,  324,  324,  324,  326,
-      326,  326,  326,  332,  332,  332,  332,  334,  334,  334,
-      334,  336,  336,  336,  336,  341,  341,  341,  341,  343,
-      343,  343,  343,  345,  345,  345,  345,  347,  347,  347,
-      347,  351,  351,  351,  351,   36,   30,   59,   57,   36,
-
-       30,  354,   28,   28,    5,  354,  354,  354,  354,  354,
-      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
-      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
-      354,  354,  354,  354,  354,  354,  354,  354,  354
+       36,   57,   59,   36,   36,   55,   83,   61,   51,   36,
+       54,   62,   52,   29,   65,   56,   32,   32,   33,   66,
+
+       36,   36,   71,   34,   29,   29,   29,   30,   36,   36,
+       77,   29,   38,   67,   67,   67,   68,   67,   75,   72,
+       67,   69,   73,   36,   36,   74,   78,   79,   36,   53,
+       36,   36,   36,   87,   36,   76,   84,   36,   36,   85,
+       36,   81,   36,   86,   36,   36,   36,   36,   82,   36,
+      354,   36,   36,   95,   91,   36,   89,   36,   88,   90,
+      101,  100,   93,   92,   94,  103,   91,   29,   65,   29,
+       97,   36,  102,   66,   36,   98,   36,   36,   36,   36,
+       36,  108,  107,   86,   36,  104,   36,   36,  109,   36,
+      105,   36,  111,  114,   36,   36,  106,   36,  110,  112,
+
+      117,   36,   36,  120,   36,   36,   36,  349,  133,  113,
+       29,   29,   29,   30,  121,  126,  118,   29,   38,   36,
+       36,  115,  116,  119,  122,  123,  125,   36,   29,   97,
+      124,   36,   36,   36,   98,  135,  136,  127,   36,   36,
+       36,   36,  138,  140,  134,   36,   36,  154,   91,  120,
+      142,   36,  128,  129,  129,   67,  130,  129,   36,  143,
+      129,  132,  137,  347,   35,   35,   86,  144,  144,   67,
+      145,  144,   35,   35,  144,  147,  148,   36,  149,  150,
+      150,   67,  151,  150,   36,  164,  150,  153,  155,  155,
+       67,  156,  155,   36,   36,  155,  158,  165,  123,  159,
+
+       36,  160,  160,   67,  161,  160,  166,   36,  160,  163,
+       36,   36,  167,  175,  168,   29,  170,   29,  172,   36,
+       36,  171,   36,  173,  174,   35,   35,  176,   36,   36,
+      177,  188,   36,   36,   36,  179,  201,  345,  178,  217,
+       36,  180,  187,   35,   35,  181,  182,  182,   67,  183,
+      182,  186,  194,  182,  185,   29,  190,   29,  192,   35,
+       35,  191,   36,  193,   29,  197,   29,  199,   29,  203,
+      198,   36,  200,   36,  204,  195,   29,  205,   29,  209,
+      364,  207,  206,  218,  210,   29,  211,   36,   36,  213,
+      219,  212,  214,   29,  170,   35,   35,   35,   35,  171,
+
+       35,   35,   36,  224,   36,  361,  223,  225,   36,  221,
+      231,   36,  222,   29,  227,  232,  220,   29,  229,  228,
+       36,   35,   35,  230,  233,  233,   67,  234,  233,   29,
+      190,  233,  236,  237,   36,  191,  238,   35,   29,  197,
+       29,  203,  240,   36,  198,  360,  204,   36,  239,   29,
+      209,  242,   36,   35,  247,  210,  255,  241,  248,   36,
+       35,   35,   36,   35,   35,   35,   35,  253,   36,   35,
+       35,   29,  227,  250,  269,  254,   36,  228,  249,  251,
+      252,   35,  258,   29,  260,   29,  262,  264,   36,  261,
+      265,  263,   35,   35,   36,   35,   35,   70,  271,  266,
+
+       35,   35,   35,   35,   35,   35,  274,   35,   35,  290,
+       36,  282,   35,  311,  278,   35,   35,   36,  277,  283,
+      284,  279,   35,   35,  280,   29,  260,  285,  288,   35,
+       35,  261,  301,  358,   35,   35,   35,   35,  303,   36,
+      356,   35,   35,  320,  289,  293,  293,   67,  294,  293,
+      298,  302,  293,  296,  304,  306,  306,   35,   35,  309,
+       35,   35,   29,  315,  307,  282,   35,   35,  316,  282,
+      308,   29,  317,   35,   35,  354,  310,  318,   35,   35,
+      351,  319,   35,   35,   35,   35,  333,  282,  326,   35,
+       35,  330,  329,  327,  282,  321,   29,  315,  328,   35,
+
+       35,  282,  316,  334,   36,  335,  325,  340,   35,   35,
+      341,  342,  343,   35,   35,   35,   35,   35,   35,  350,
+      352,   35,   35,  362,  365,  323,  349,  347,  345,  313,
+      339,  337,   35,   35,   27,   27,   27,   27,   29,   29,
+       29,   31,   31,   31,   31,   36,   36,   36,   36,   63,
+      332,   63,   63,   64,   64,   64,   64,   66,  282,   66,
+       66,   35,   35,   35,   35,   70,   70,  325,   70,   96,
+       96,   96,   96,   98,  323,   98,   98,  131,  131,  131,
+      131,  146,  146,  146,  146,  152,  152,  152,  152,  157,
+      157,  157,  157,  162,  162,  162,  162,  169,  169,  169,
+
+      169,  171,  276,  171,  171,  184,  184,  184,  184,  189,
+      189,  189,  189,  191,  268,  191,  191,  196,  196,  196,
+      196,  198,  313,  198,  198,  202,  202,  202,  202,  204,
+      257,  204,  204,  208,  208,  208,  208,  210,  306,  210,
+      210,  215,  215,  215,  215,  173,  300,  173,  173,  226,
+      226,  226,  226,  228,  246,  228,  228,  235,  235,  235,
+      235,  193,  297,  193,  193,  200,  292,  200,  200,  206,
+      287,  206,  206,  212,  276,  212,  212,  243,  243,  243,
+      243,  245,  245,  245,  245,  230,  273,  230,  230,  256,
+      256,  256,  256,  259,  259,  259,  259,  261,  216,  261,
+
+      261,  267,  267,  267,  267,  270,  270,  270,  270,  272,
+      272,  272,  272,  275,  275,  275,  275,  281,  281,  281,
+      281,  286,  286,  286,  286,  263,  268,  263,  263,  291,
+      291,  291,  291,  295,  295,  295,  295,  271,  257,  271,
+      271,  299,  299,  299,  299,  305,  305,  305,  305,  312,
+      312,  312,  312,  314,  314,  314,  314,  316,  246,  316,
+      316,  322,  322,  322,  322,  324,  324,  324,  324,  331,
+      331,  331,  331,  318,  244,  318,  318,  336,  336,  336,
+      336,  338,  338,  338,  338,  344,  344,  344,  344,  346,
+      346,  346,  346,  348,  348,  348,  348,  353,  353,  353,
+
+      353,  355,  355,  355,  355,  357,  357,  357,  357,  359,
+      359,  359,  359,  363,  363,  363,  363,  216,  141,  139,
+       99,   36,   30,   60,   58,   36,   30,  366,   28,   28,
+        5,  366,  366,  366,  366,  366,  366,  366,  366,  366,
+      366,  366,  366,  366,  366,  366,  366,  366,  366,  366,
+      366,  366,  366,  366,  366,  366,  366,  366,  366,  366,
+      366,  366,  366,  366,  366
     } ;
 
-static const flex_int16_t yy_chk[940] =
+static const flex_int16_t yy_chk[966] =
     {   0,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
@@ -927,101 +934,104 @@ static const flex_int16_t yy_chk[940] =
        18,   14,   11,   11,   13,   14,   11,   46,   46,   14,
        15,   16,   11,   12,   12,   12,   12,   12,   14,   16,
        12,   12,   12,   15,   19,   16,   20,   20,   21,   22,
-       24,   22,   24,   50,   26,   21,   50,   26,   19,  351,
-       20,   26,   19,   31,   31,   32,   32,   32,   39,   31,
-
-       39,   42,   32,   35,   35,   35,   35,   40,   44,   45,
-       35,   35,   37,   37,   37,   37,   37,   39,   42,   37,
-       37,   40,   41,   43,   41,   48,   45,   45,   49,   44,
-       47,   47,   53,   51,   43,   53,   48,   51,   52,   54,
-       52,   55,   56,   58,   54,   49,   57,   59,   60,   73,
-       61,   70,   60,   61,  347,   70,   56,   63,   63,   73,
-       58,   71,   59,   63,   59,   55,   66,   66,   57,   71,
-       74,   72,   66,   72,   75,   76,   77,   78,   79,   78,
-       77,   79,   80,   81,   74,   83,   80,   82,   75,   84,
-       82,   85,   88,   85,   76,   81,   87,   83,   87,   89,
-
-       92,   89,   93,  345,   90,  104,   92,   84,   86,   86,
-       86,   86,   90,   99,   88,   86,   86,   98,  102,   86,
-       86,   91,   91,   93,   91,   94,   94,   91,  101,  104,
-      102,   94,  101,  110,   99,   98,  100,  100,  100,  100,
-      100,  103,  103,  100,  100,  343,  105,  103,  105,  107,
-      109,  107,  111,  110,  109,  113,  113,  341,  121,  118,
-      111,  112,  112,  112,  112,  112,  121,  113,  112,  112,
-      114,  114,  116,  116,  118,  116,  114,  115,  115,  115,
-      115,  115,  123,  123,  115,  115,  117,  117,  117,  117,
-      117,  124,  122,  117,  117,  119,  122,  119,  120,  120,
-
-      120,  120,  120,  125,  130,  120,  120,  125,  131,  124,
-      126,  126,  128,  128,  131,  134,  126,  130,  128,  133,
-      133,  133,  135,  136,  133,  139,  164,  140,  138,  140,
-      134,  164,  133,  141,  141,  163,  163,  338,  139,  141,
-      136,  135,  137,  137,  137,  137,  137,  138,  336,  137,
-      137,  143,  143,  145,  145,  146,  146,  143,  147,  147,
-      149,  149,  145,  155,  147,  161,  149,  151,  151,  153,
-      153,  146,  160,  151,  270,  153,  176,  156,  156,  158,
-      158,  176,  155,  156,  161,  158,  165,  165,  170,  270,
-      160,  170,  165,  172,  172,  173,  173,  174,  174,  175,
-
-      208,  177,  220,  175,  177,  178,  178,  173,  220,  174,
-      208,  178,  180,  180,  172,  182,  182,  183,  180,  334,
-      190,  190,  183,  184,  184,  184,  184,  184,  185,  185,
-      184,  184,  190,  243,  185,  191,  191,  192,  192,  197,
-      197,  202,  202,  192,  332,  197,  203,  203,  209,  209,
-      213,  213,  203,  214,  214,  215,  215,  243,  216,  216,
-      217,  217,  218,  218,  219,  219,  221,  221,  215,  235,
-      219,  235,  221,  214,  216,  217,  227,  227,  228,  228,
-      230,  230,  232,  331,  228,  233,  230,  233,  233,  329,
-      232,  232,  236,  236,  241,  241,  244,  244,  245,  245,
-
-      241,  246,  246,  247,  248,  248,  267,  267,  244,  259,
-      259,  247,  247,  252,  252,  245,  248,  326,  246,  252,
-      253,  253,  267,  324,  259,  316,  253,  262,  262,  262,
-      262,  262,  271,  271,  262,  262,  272,  276,  273,  272,
-      272,  273,  273,  277,  278,  316,  276,  271,  281,  281,
-      299,  278,  278,  282,  282,  285,  285,  277,  300,  287,
-      287,  285,  290,  290,  281,  287,  323,  293,  294,  294,
-      290,  293,  303,  299,  301,  301,  302,  302,  310,  310,
-      303,  303,  300,  317,  302,  294,  304,  304,  322,  328,
-      301,  309,  304,  311,  309,  309,  311,  311,  318,  317,
-
-      318,  318,  319,  321,  314,  319,  319,  328,  330,  330,
-      350,  330,  340,  340,  340,  312,  297,  296,  350,  350,
-      355,  355,  355,  355,  356,  356,  356,  357,  357,  357,
-      357,  358,  358,  358,  358,  359,  295,  359,  359,  360,
-      360,  360,  360,  361,  291,  361,  361,  362,  362,  362,
-      362,  363,  363,  283,  363,  364,  364,  364,  364,  365,
-      279,  365,  365,  366,  366,  366,  366,  367,  367,  367,
-      367,  368,  368,  368,  368,  369,  369,  369,  369,  370,
-      370,  370,  370,  371,  371,  371,  371,  372,  274,  372,
-      372,  373,  373,  373,  373,  374,  374,  374,  374,  375,
-
-      268,  375,  375,  376,  376,  376,  376,  377,  265,  377,
-      377,  378,  378,  378,  378,  379,  263,  379,  379,  380,
-      380,  380,  380,  381,  260,  381,  381,  382,  382,  382,
-      382,  383,  250,  383,  383,  384,  384,  384,  384,  385,
-      242,  385,  385,  386,  386,  386,  386,  387,  239,  387,
-      387,  388,  237,  388,  388,  389,  234,  389,  389,  390,
-      226,  390,  390,  391,  391,  391,  391,  392,  392,  392,
-      392,  393,  212,  393,  393,  394,  394,  394,  394,  395,
-      395,  395,  395,  396,  210,  396,  396,  397,  397,  397,
-      397,  398,  398,  398,  398,  399,  399,  399,  399,  400,
-
-      400,  400,  400,  401,  401,  401,  401,  402,  402,  402,
-      402,  403,  162,  403,  403,  404,  404,  404,  404,  405,
-      405,  405,  405,  406,  108,  406,  406,  407,  407,  407,
-      407,  408,  408,  408,  408,  409,  409,  409,  409,  410,
-      106,  410,  410,  411,  411,  411,  411,  412,  412,  412,
-      412,  413,   69,  413,  413,  414,  414,  414,  414,  415,
-      415,  415,  415,  416,  416,  416,  416,  417,  417,  417,
-      417,  418,  418,  418,  418,  419,  419,  419,  419,  420,
-      420,  420,  420,  421,  421,  421,  421,  422,  422,  422,
-      422,  423,  423,  423,  423,   36,   29,   25,   23,   17,
-
-        6,    5,    4,    3,  354,  354,  354,  354,  354,  354,
-      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
-      354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
-      354,  354,  354,  354,  354,  354,  354,  354,  354
+       24,   22,   24,   50,   26,   21,   50,   26,   19,   44,
+       20,   26,   19,   31,   31,   21,   32,   32,   32,   31,
+
+       39,   42,   39,   32,   35,   35,   35,   35,   40,   45,
+       44,   35,   35,   37,   37,   37,   37,   37,   42,   39,
+       37,   37,   40,   41,   43,   41,   45,   45,   47,   47,
+       48,   49,   51,   54,   55,   43,   51,   52,   54,   52,
+       53,   48,   56,   53,   58,   57,   59,   60,   49,   61,
+      363,   62,   72,   61,   62,   74,   56,   71,   55,   57,
+       72,   71,   60,   59,   60,   74,   58,   64,   64,   67,
+       67,   75,   73,   64,   73,   67,   76,   77,   78,   79,
+       80,   79,   78,   80,   81,   75,   82,   84,   81,   83,
+       76,   85,   83,   86,   95,   86,   77,   89,   82,   84,
+
+       88,   90,   88,   91,  103,   91,   92,  359,  103,   85,
+       87,   87,   87,   87,   92,   95,   89,   87,   87,  100,
+       94,   87,   87,   90,   93,   93,   94,   93,   96,   96,
+       93,  101,  104,  118,   96,  105,  105,  100,  106,  112,
+      107,  105,  107,  109,  104,  109,  111,  118,  119,  119,
+      111,  119,  101,  102,  102,  102,  102,  102,  113,  112,
+      102,  102,  106,  357,  115,  115,  113,  114,  114,  114,
+      114,  114,  116,  116,  114,  114,  115,  124,  116,  117,
+      117,  117,  117,  117,  121,  124,  117,  117,  120,  120,
+      120,  120,  120,  125,  127,  120,  120,  125,  122,  121,
+
+      122,  123,  123,  123,  123,  123,  126,  126,  123,  123,
+      128,  133,  127,  134,  128,  129,  129,  131,  131,  134,
+      137,  129,  138,  131,  133,  136,  136,  136,  139,  142,
+      136,  143,  141,  143,  154,  137,  154,  355,  136,  167,
+      167,  138,  142,  148,  148,  139,  140,  140,  140,  140,
+      140,  141,  148,  140,  140,  144,  144,  146,  146,  149,
+      149,  144,  159,  146,  150,  150,  152,  152,  155,  155,
+      150,  164,  152,  165,  155,  149,  157,  157,  160,  160,
+      353,  159,  157,  168,  160,  162,  162,  174,  168,  164,
+      174,  162,  165,  169,  169,  176,  176,  177,  177,  169,
+
+      178,  178,  179,  180,  181,  350,  179,  181,  180,  177,
+      186,  186,  178,  182,  182,  187,  176,  184,  184,  182,
+      187,  194,  194,  184,  188,  188,  188,  188,  188,  189,
+      189,  188,  188,  194,  201,  189,  195,  195,  196,  196,
+      202,  202,  207,  207,  196,  348,  202,  213,  201,  208,
+      208,  214,  214,  218,  218,  208,  225,  213,  219,  219,
+      220,  220,  225,  221,  221,  222,  222,  223,  223,  224,
+      224,  226,  226,  220,  241,  224,  241,  226,  219,  221,
+      222,  232,  232,  233,  233,  235,  235,  237,  239,  233,
+      238,  235,  238,  238,  249,  237,  237,  242,  242,  239,
+
+      247,  247,  250,  250,  251,  251,  247,  252,  252,  266,
+      266,  253,  289,  289,  250,  254,  254,  277,  249,  253,
+      253,  251,  258,  258,  252,  259,  259,  254,  258,  265,
+      265,  259,  277,  346,  274,  274,  278,  278,  279,  301,
+      344,  279,  279,  301,  265,  269,  269,  269,  269,  269,
+      274,  278,  269,  269,  280,  283,  284,  280,  280,  285,
+      288,  288,  293,  293,  283,  307,  285,  285,  293,  308,
+      284,  295,  295,  298,  298,  343,  288,  295,  302,  302,
+      341,  298,  309,  309,  310,  310,  319,  326,  307,  319,
+      319,  311,  310,  308,  327,  302,  314,  314,  309,  311,
+
+      311,  340,  314,  320,  320,  321,  338,  326,  321,  321,
+      327,  328,  329,  328,  328,  329,  329,  342,  342,  340,
+      342,  352,  352,  352,  362,  336,  335,  334,  333,  331,
+      324,  322,  362,  362,  367,  367,  367,  367,  368,  368,
+      368,  369,  369,  369,  369,  370,  370,  370,  370,  371,
+      312,  371,  371,  372,  372,  372,  372,  373,  305,  373,
+      373,  374,  374,  374,  374,  375,  375,  304,  375,  376,
+      376,  376,  376,  377,  303,  377,  377,  378,  378,  378,
+      378,  379,  379,  379,  379,  380,  380,  380,  380,  381,
+      381,  381,  381,  382,  382,  382,  382,  383,  383,  383,
+
+      383,  384,  299,  384,  384,  385,  385,  385,  385,  386,
+      386,  386,  386,  387,  291,  387,  387,  388,  388,  388,
+      388,  389,  290,  389,  389,  390,  390,  390,  390,  391,
+      286,  391,  391,  392,  392,  392,  392,  393,  281,  393,
+      393,  394,  394,  394,  394,  395,  275,  395,  395,  396,
+      396,  396,  396,  397,  272,  397,  397,  398,  398,  398,
+      398,  399,  270,  399,  399,  400,  267,  400,  400,  401,
+      256,  401,  401,  402,  248,  402,  402,  403,  403,  403,
+      403,  404,  404,  404,  404,  405,  245,  405,  405,  406,
+      406,  406,  406,  407,  407,  407,  407,  408,  243,  408,
+
+      408,  409,  409,  409,  409,  410,  410,  410,  410,  411,
+      411,  411,  411,  412,  412,  412,  412,  413,  413,  413,
+      413,  414,  414,  414,  414,  415,  240,  415,  415,  416,
+      416,  416,  416,  417,  417,  417,  417,  418,  231,  418,
+      418,  419,  419,  419,  419,  420,  420,  420,  420,  421,
+      421,  421,  421,  422,  422,  422,  422,  423,  217,  423,
+      423,  424,  424,  424,  424,  425,  425,  425,  425,  426,
+      426,  426,  426,  427,  215,  427,  427,  428,  428,  428,
+      428,  429,  429,  429,  429,  430,  430,  430,  430,  431,
+      431,  431,  431,  432,  432,  432,  432,  433,  433,  433,
+
+      433,  434,  434,  434,  434,  435,  435,  435,  435,  436,
+      436,  436,  436,  437,  437,  437,  437,  166,  110,  108,
+       70,   36,   29,   25,   23,   17,    6,    5,    4,    3,
+      366,  366,  366,  366,  366,  366,  366,  366,  366,  366,
+      366,  366,  366,  366,  366,  366,  366,  366,  366,  366,
+      366,  366,  366,  366,  366,  366,  366,  366,  366,  366,
+      366,  366,  366,  366,  366
     } ;
 
 #define YY_TRAILING_MASK 0x2000
@@ -1160,9 +1170,17 @@ static void setbackendtype(DiskParseContext *dpc, const char *str) {
     if (     !strcmp(str,"phy"))   DSET(dpc,backend,BACKEND,str,PHY);
     else if (!strcmp(str,"tap"))   DSET(dpc,backend,BACKEND,str,TAP);
     else if (!strcmp(str,"qdisk")) DSET(dpc,backend,BACKEND,str,QDISK);
+    else if (!strcmp(str,"other")) DSET(dpc,backend,BACKEND,str,OTHER);
     else xlu__disk_err(dpc,str,"unknown value for backendtype");
 }
 
+/* Sets ->protocol from the string.  IDL should provide something for this. */
+static void setprotocol(DiskParseContext *dpc, const char *str) {
+    if      (!strcmp(str,"xen"))         DSET(dpc,protocol,PROTOCOL,str,XEN);
+    else if (!strcmp(str,"virtio-mmio")) DSET(dpc,protocol,PROTOCOL,str,VIRTIO_MMIO);
+    else xlu__disk_err(dpc,str,"unknown value for protocol");
+}
+
 /* Sets ->colo-port from the string.  COLO need this. */
 static void setcoloport(DiskParseContext *dpc, const char *str) {
     int port = atoi(str);
@@ -1199,9 +1217,9 @@ static int vdev_and_devtype(DiskParseContext *dpc, char *str) {
 #undef DPC /* needs to be defined differently the actual lexer */
 #define DPC ((DiskParseContext*)yyextra)
 
-#line 1202 "libxlu_disk_l.c"
+#line 1220 "libxlu_disk_l.c"
 
-#line 1204 "libxlu_disk_l.c"
+#line 1222 "libxlu_disk_l.c"
 
 #define INITIAL 0
 #define LEXERR 1
@@ -1477,13 +1495,13 @@ YY_DECL
 		}
 
 	{
-#line 177 "libxlu_disk_l.l"
+#line 185 "libxlu_disk_l.l"
 
 
-#line 180 "libxlu_disk_l.l"
+#line 188 "libxlu_disk_l.l"
  /*----- the scanner rules which do the parsing -----*/
 
-#line 1486 "libxlu_disk_l.c"
+#line 1504 "libxlu_disk_l.c"
 
 	while ( /*CONSTCOND*/1 )		/* loops until end-of-file is reached */
 		{
@@ -1515,14 +1533,14 @@ yy_match:
 			while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 				{
 				yy_current_state = (int) yy_def[yy_current_state];
-				if ( yy_current_state >= 355 )
+				if ( yy_current_state >= 367 )
 					yy_c = yy_meta[yy_c];
 				}
 			yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
 			*yyg->yy_state_ptr++ = yy_current_state;
 			++yy_cp;
 			}
-		while ( yy_current_state != 354 );
+		while ( yy_current_state != 366 );
 
 yy_find_action:
 		yy_current_state = *--yyg->yy_state_ptr;
@@ -1572,152 +1590,158 @@ do_action:	/* This label is used only to access EOF actions. */
 case 1:
 /* rule 1 can match eol */
 YY_RULE_SETUP
-#line 182 "libxlu_disk_l.l"
+#line 190 "libxlu_disk_l.l"
 { /* ignore whitespace before parameters */ }
 	YY_BREAK
 /* ordinary parameters setting enums or strings */
 case 2:
 /* rule 2 can match eol */
 YY_RULE_SETUP
-#line 186 "libxlu_disk_l.l"
+#line 194 "libxlu_disk_l.l"
 { STRIP(','); setformat(DPC, FROMEQUALS); }
 	YY_BREAK
 case 3:
 YY_RULE_SETUP
-#line 188 "libxlu_disk_l.l"
+#line 196 "libxlu_disk_l.l"
 { DPC->disk->is_cdrom = 1; }
 	YY_BREAK
 case 4:
 YY_RULE_SETUP
-#line 189 "libxlu_disk_l.l"
+#line 197 "libxlu_disk_l.l"
 { DPC->disk->is_cdrom = 1; }
 	YY_BREAK
 case 5:
 YY_RULE_SETUP
-#line 190 "libxlu_disk_l.l"
+#line 198 "libxlu_disk_l.l"
 { DPC->disk->is_cdrom = 0; }
 	YY_BREAK
 case 6:
 /* rule 6 can match eol */
 YY_RULE_SETUP
-#line 191 "libxlu_disk_l.l"
+#line 199 "libxlu_disk_l.l"
 { xlu__disk_err(DPC,yytext,"unknown value for type"); }
 	YY_BREAK
 case 7:
 /* rule 7 can match eol */
 YY_RULE_SETUP
-#line 193 "libxlu_disk_l.l"
+#line 201 "libxlu_disk_l.l"
 { STRIP(','); setaccess(DPC, FROMEQUALS); }
 	YY_BREAK
 case 8:
 /* rule 8 can match eol */
 YY_RULE_SETUP
-#line 194 "libxlu_disk_l.l"
+#line 202 "libxlu_disk_l.l"
 { STRIP(','); SAVESTRING("backend", backend_domname, FROMEQUALS); }
 	YY_BREAK
 case 9:
 /* rule 9 can match eol */
 YY_RULE_SETUP
-#line 195 "libxlu_disk_l.l"
+#line 203 "libxlu_disk_l.l"
 { STRIP(','); setbackendtype(DPC,FROMEQUALS); }
 	YY_BREAK
 case 10:
 /* rule 10 can match eol */
 YY_RULE_SETUP
-#line 197 "libxlu_disk_l.l"
-{ STRIP(','); SAVESTRING("vdev", vdev, FROMEQUALS); }
+#line 204 "libxlu_disk_l.l"
+{ STRIP(','); setprotocol(DPC,FROMEQUALS); }
 	YY_BREAK
 case 11:
 /* rule 11 can match eol */
 YY_RULE_SETUP
-#line 198 "libxlu_disk_l.l"
-{ STRIP(','); SAVESTRING("script", script, FROMEQUALS); }
+#line 206 "libxlu_disk_l.l"
+{ STRIP(','); SAVESTRING("vdev", vdev, FROMEQUALS); }
 	YY_BREAK
 case 12:
+/* rule 12 can match eol */
 YY_RULE_SETUP
-#line 199 "libxlu_disk_l.l"
-{ DPC->disk->direct_io_safe = 1; }
+#line 207 "libxlu_disk_l.l"
+{ STRIP(','); SAVESTRING("script", script, FROMEQUALS); }
 	YY_BREAK
 case 13:
 YY_RULE_SETUP
-#line 200 "libxlu_disk_l.l"
-{ libxl_defbool_set(&DPC->disk->discard_enable, true); }
+#line 208 "libxlu_disk_l.l"
+{ DPC->disk->direct_io_safe = 1; }
 	YY_BREAK
 case 14:
 YY_RULE_SETUP
-#line 201 "libxlu_disk_l.l"
-{ libxl_defbool_set(&DPC->disk->discard_enable, false); }
+#line 209 "libxlu_disk_l.l"
+{ libxl_defbool_set(&DPC->disk->discard_enable, true); }
 	YY_BREAK
-/* Note that the COLO configuration settings should be considered unstable.
-  * They may change incompatibly in future versions of Xen. */
 case 15:
 YY_RULE_SETUP
-#line 204 "libxlu_disk_l.l"
-{ libxl_defbool_set(&DPC->disk->colo_enable, true); }
+#line 210 "libxlu_disk_l.l"
+{ libxl_defbool_set(&DPC->disk->discard_enable, false); }
 	YY_BREAK
+/* Note that the COLO configuration settings should be considered unstable.
+  * They may change incompatibly in future versions of Xen. */
 case 16:
 YY_RULE_SETUP
-#line 205 "libxlu_disk_l.l"
-{ libxl_defbool_set(&DPC->disk->colo_enable, false); }
+#line 213 "libxlu_disk_l.l"
+{ libxl_defbool_set(&DPC->disk->colo_enable, true); }
 	YY_BREAK
 case 17:
-/* rule 17 can match eol */
 YY_RULE_SETUP
-#line 206 "libxlu_disk_l.l"
-{ STRIP(','); SAVESTRING("colo-host", colo_host, FROMEQUALS); }
+#line 214 "libxlu_disk_l.l"
+{ libxl_defbool_set(&DPC->disk->colo_enable, false); }
 	YY_BREAK
 case 18:
 /* rule 18 can match eol */
 YY_RULE_SETUP
-#line 207 "libxlu_disk_l.l"
-{ STRIP(','); setcoloport(DPC, FROMEQUALS); }
+#line 215 "libxlu_disk_l.l"
+{ STRIP(','); SAVESTRING("colo-host", colo_host, FROMEQUALS); }
 	YY_BREAK
 case 19:
 /* rule 19 can match eol */
 YY_RULE_SETUP
-#line 208 "libxlu_disk_l.l"
-{ STRIP(','); SAVESTRING("colo-export", colo_export, FROMEQUALS); }
+#line 216 "libxlu_disk_l.l"
+{ STRIP(','); setcoloport(DPC, FROMEQUALS); }
 	YY_BREAK
 case 20:
 /* rule 20 can match eol */
 YY_RULE_SETUP
-#line 209 "libxlu_disk_l.l"
-{ STRIP(','); SAVESTRING("active-disk", active_disk, FROMEQUALS); }
+#line 217 "libxlu_disk_l.l"
+{ STRIP(','); SAVESTRING("colo-export", colo_export, FROMEQUALS); }
 	YY_BREAK
 case 21:
 /* rule 21 can match eol */
 YY_RULE_SETUP
-#line 210 "libxlu_disk_l.l"
+#line 218 "libxlu_disk_l.l"
+{ STRIP(','); SAVESTRING("active-disk", active_disk, FROMEQUALS); }
+	YY_BREAK
+case 22:
+/* rule 22 can match eol */
+YY_RULE_SETUP
+#line 219 "libxlu_disk_l.l"
 { STRIP(','); SAVESTRING("hidden-disk", hidden_disk, FROMEQUALS); }
 	YY_BREAK
 /* the target magic parameter, eats the rest of the string */
-case 22:
+case 23:
 YY_RULE_SETUP
-#line 214 "libxlu_disk_l.l"
+#line 223 "libxlu_disk_l.l"
 { STRIP(','); SAVESTRING("target", pdev_path, FROMEQUALS); }
 	YY_BREAK
 /* unknown parameters */
-case 23:
-/* rule 23 can match eol */
+case 24:
+/* rule 24 can match eol */
 YY_RULE_SETUP
-#line 218 "libxlu_disk_l.l"
+#line 227 "libxlu_disk_l.l"
 { xlu__disk_err(DPC,yytext,"unknown parameter"); }
 	YY_BREAK
 /* deprecated prefixes */
 /* the "/.*" in these patterns ensures that they count as if they
    * matched the whole string, so these patterns take precedence */
-case 24:
+case 25:
 YY_RULE_SETUP
-#line 225 "libxlu_disk_l.l"
+#line 234 "libxlu_disk_l.l"
 {
                     STRIP(':');
                     DPC->had_depr_prefix=1; DEPRECATE("use `[format=]...,'");
                     setformat(DPC, yytext);
                  }
 	YY_BREAK
-case 25:
+case 26:
 YY_RULE_SETUP
-#line 231 "libxlu_disk_l.l"
+#line 240 "libxlu_disk_l.l"
 {
                     char *newscript;
                     STRIP(':');
@@ -1731,65 +1755,65 @@ YY_RULE_SETUP
                     free(newscript);
                 }
 	YY_BREAK
-case 26:
+case 27:
 *yy_cp = yyg->yy_hold_char; /* undo effects of setting up yytext */
 yyg->yy_c_buf_p = yy_cp = yy_bp + 8;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
-#line 244 "libxlu_disk_l.l"
+#line 253 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
-case 27:
+case 28:
 YY_RULE_SETUP
-#line 245 "libxlu_disk_l.l"
+#line 254 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
-case 28:
+case 29:
 *yy_cp = yyg->yy_hold_char; /* undo effects of setting up yytext */
 yyg->yy_c_buf_p = yy_cp = yy_bp + 4;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
-#line 246 "libxlu_disk_l.l"
+#line 255 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
-case 29:
+case 30:
 *yy_cp = yyg->yy_hold_char; /* undo effects of setting up yytext */
 yyg->yy_c_buf_p = yy_cp = yy_bp + 6;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
-#line 247 "libxlu_disk_l.l"
+#line 256 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
-case 30:
+case 31:
 *yy_cp = yyg->yy_hold_char; /* undo effects of setting up yytext */
 yyg->yy_c_buf_p = yy_cp = yy_bp + 5;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
-#line 248 "libxlu_disk_l.l"
+#line 257 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
-case 31:
+case 32:
 *yy_cp = yyg->yy_hold_char; /* undo effects of setting up yytext */
 yyg->yy_c_buf_p = yy_cp = yy_bp + 4;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
-#line 249 "libxlu_disk_l.l"
+#line 258 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
-case 32:
-/* rule 32 can match eol */
+case 33:
+/* rule 33 can match eol */
 YY_RULE_SETUP
-#line 251 "libxlu_disk_l.l"
+#line 260 "libxlu_disk_l.l"
 {
 		  xlu__disk_err(DPC,yytext,"unknown deprecated disk prefix");
 		  return 0;
 		}
 	YY_BREAK
 /* positional parameters */
-case 33:
-/* rule 33 can match eol */
+case 34:
+/* rule 34 can match eol */
 YY_RULE_SETUP
-#line 258 "libxlu_disk_l.l"
+#line 267 "libxlu_disk_l.l"
 {
     STRIP(',');
 
@@ -1816,27 +1840,27 @@ YY_RULE_SETUP
     }
 }
 	YY_BREAK
-case 34:
+case 35:
 YY_RULE_SETUP
-#line 284 "libxlu_disk_l.l"
+#line 293 "libxlu_disk_l.l"
 {
     BEGIN(LEXERR);
     yymore();
 }
 	YY_BREAK
-case 35:
+case 36:
 YY_RULE_SETUP
-#line 288 "libxlu_disk_l.l"
+#line 297 "libxlu_disk_l.l"
 {
     xlu__disk_err(DPC,yytext,"bad disk syntax"); return 0;
 }
 	YY_BREAK
-case 36:
+case 37:
 YY_RULE_SETUP
-#line 291 "libxlu_disk_l.l"
+#line 300 "libxlu_disk_l.l"
 YY_FATAL_ERROR( "flex scanner jammed" );
 	YY_BREAK
-#line 1839 "libxlu_disk_l.c"
+#line 1863 "libxlu_disk_l.c"
 			case YY_STATE_EOF(INITIAL):
 			case YY_STATE_EOF(LEXERR):
 				yyterminate();
@@ -2104,7 +2128,7 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 		while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 			{
 			yy_current_state = (int) yy_def[yy_current_state];
-			if ( yy_current_state >= 355 )
+			if ( yy_current_state >= 367 )
 				yy_c = yy_meta[yy_c];
 			}
 		yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
@@ -2128,11 +2152,11 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 	while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 		{
 		yy_current_state = (int) yy_def[yy_current_state];
-		if ( yy_current_state >= 355 )
+		if ( yy_current_state >= 367 )
 			yy_c = yy_meta[yy_c];
 		}
 	yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
-	yy_is_jam = (yy_current_state == 354);
+	yy_is_jam = (yy_current_state == 366);
 	if ( ! yy_is_jam )
 		*yyg->yy_state_ptr++ = yy_current_state;
 
@@ -2941,4 +2965,4 @@ void yyfree (void * ptr , yyscan_t yyscanner)
 
 #define YYTABLES_NAME "yytables"
 
-#line 291 "libxlu_disk_l.l"
+#line 300 "libxlu_disk_l.l"
diff --git a/tools/libs/util/libxlu_disk_l.h b/tools/libs/util/libxlu_disk_l.h
index 6abeecf..509aad6 100644
--- a/tools/libs/util/libxlu_disk_l.h
+++ b/tools/libs/util/libxlu_disk_l.h
@@ -694,7 +694,7 @@ extern int yylex (yyscan_t yyscanner);
 #undef yyTABLES_NAME
 #endif
 
-#line 291 "libxlu_disk_l.l"
+#line 300 "libxlu_disk_l.l"
 
 #line 699 "libxlu_disk_l.h"
 #undef xlu__disk_yyIN_HEADER
diff --git a/tools/libs/util/libxlu_disk_l.l b/tools/libs/util/libxlu_disk_l.l
index 3bd639a..bfd90ae 100644
--- a/tools/libs/util/libxlu_disk_l.l
+++ b/tools/libs/util/libxlu_disk_l.l
@@ -122,9 +122,17 @@ static void setbackendtype(DiskParseContext *dpc, const char *str) {
     if (     !strcmp(str,"phy"))   DSET(dpc,backend,BACKEND,str,PHY);
     else if (!strcmp(str,"tap"))   DSET(dpc,backend,BACKEND,str,TAP);
     else if (!strcmp(str,"qdisk")) DSET(dpc,backend,BACKEND,str,QDISK);
+    else if (!strcmp(str,"other")) DSET(dpc,backend,BACKEND,str,OTHER);
     else xlu__disk_err(dpc,str,"unknown value for backendtype");
 }
 
+/* Sets ->protocol from the string.  IDL should provide something for this. */
+static void setprotocol(DiskParseContext *dpc, const char *str) {
+    if      (!strcmp(str,"xen"))         DSET(dpc,protocol,PROTOCOL,str,XEN);
+    else if (!strcmp(str,"virtio-mmio")) DSET(dpc,protocol,PROTOCOL,str,VIRTIO_MMIO);
+    else xlu__disk_err(dpc,str,"unknown value for protocol");
+}
+
 /* Sets ->colo-port from the string.  COLO need this. */
 static void setcoloport(DiskParseContext *dpc, const char *str) {
     int port = atoi(str);
@@ -192,6 +200,7 @@ devtype=[^,]*,?	{ xlu__disk_err(DPC,yytext,"unknown value for type"); }
 access=[^,]*,?	{ STRIP(','); setaccess(DPC, FROMEQUALS); }
 backend=[^,]*,? { STRIP(','); SAVESTRING("backend", backend_domname, FROMEQUALS); }
 backendtype=[^,]*,? { STRIP(','); setbackendtype(DPC,FROMEQUALS); }
+protocol=[^,]*,? { STRIP(','); setprotocol(DPC,FROMEQUALS); }
 
 vdev=[^,]*,?	{ STRIP(','); SAVESTRING("vdev", vdev, FROMEQUALS); }
 script=[^,]*,?	{ STRIP(','); SAVESTRING("script", script, FROMEQUALS); }
diff --git a/tools/xl/xl_block.c b/tools/xl/xl_block.c
index 70eed43..7990035 100644
--- a/tools/xl/xl_block.c
+++ b/tools/xl/xl_block.c
@@ -50,6 +50,11 @@ int main_blockattach(int argc, char **argv)
         return 0;
     }
 
+    if (disk.protocol != LIBXL_DISK_PROTOCOL_XEN) {
+        fprintf(stderr, "block-attach is only supported for protocol xen\n");
+        return 1;
+    }
+
     if (libxl_device_disk_add(ctx, fe_domid, &disk, 0)) {
         fprintf(stderr, "libxl_device_disk_add failed.\n");
         return 1;
@@ -119,6 +124,12 @@ int main_blockdetach(int argc, char **argv)
         fprintf(stderr, "Error: Device %s not connected.\n", argv[optind+1]);
         return 1;
     }
+
+    if (disk.protocol != LIBXL_DISK_PROTOCOL_XEN) {
+        fprintf(stderr, "block-detach is only supported for protocol xen\n");
+        return 1;
+    }
+
     rc = !force ? libxl_device_disk_safe_remove(ctx, domid, &disk, 0) :
         libxl_device_disk_destroy(ctx, domid, &disk, 0);
     if (rc) {
-- 
2.7.4


