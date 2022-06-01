Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 461BE53AC56
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 19:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340700.565824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwSbk-0006iD-H6; Wed, 01 Jun 2022 17:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340700.565824; Wed, 01 Jun 2022 17:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwSbk-0006ez-Bd; Wed, 01 Jun 2022 17:58:12 +0000
Received: by outflank-mailman (input) for mailman id 340700;
 Wed, 01 Jun 2022 17:58:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Edd5=WI=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nwSbi-0006Qx-HK
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 17:58:10 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63ef8cc4-e1d4-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 19:58:06 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id j10so3987000lfe.12
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jun 2022 10:58:06 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a2e1f01000000b002555bc8f782sm435358ljf.39.2022.06.01.10.58.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Jun 2022 10:58:04 -0700 (PDT)
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
X-Inumbo-ID: 63ef8cc4-e1d4-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=x8A1wlT3HfZQFThS6Pms3+KAZSMNs1nwi+xyFk+yUdc=;
        b=df0WXHZGwhfjvPnjAxC7/GY6xDTP+X3KXOqP2pA0FDuzwUa5U4pujRBZiiJIrgGh9y
         JvPzEfE8gwaAZl3p0d4ij+plmu+Z08v8TLZHj+KIeT7MzDjL6oppNDmsLTeH5s8GSJtE
         qHnmtvldsa97UPmxQf7g2wVxO+3bFfbOXc0+m6JiA03g/FyWmqtJBDcuKJr4DONCRmLR
         9oTSDgzWdI8SVdkpcssSrrvqBb4NacMMz9vZW65qfl2Uf6NdSAeemLyvZUiiWlpmkuxP
         2npZksrKlO6wFhaiFdGa7sfVjb2050RIkRr9R75/GdBFknovS9t4WZBQG37TWY+V29wL
         /r5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=x8A1wlT3HfZQFThS6Pms3+KAZSMNs1nwi+xyFk+yUdc=;
        b=2sOmy2FGauTzC3flqYGF+ltUCDsIbj4fUb/6F+OOjdOjlV1BJzEirPbWewSmkxXZWW
         AKit3DLRlWSF7Vs8EJXU5QnxJqfvXuR+OUCx+X3ESAIF2p21sA94HrRvJ54Z+e5IYnmz
         6ShPEQNxqDanpdIBIl7OvToF0ceXf/pB7+Pe+OZcm/3A0BOeS/czIjhEyjAnL8G0mcb8
         uYUtmqqzSXe2zWMY2tMUBT9HxzwylM0HLzFYDVijvL+XPVNHTyflW/OAibEQLkkcFfJl
         saCPcXNS5cxkBwLRBoGWtHB68m9JTbXtF07siM1QqKJFWye8wHVruZjmh6B54Tq7BRpG
         2WkA==
X-Gm-Message-State: AOAM533pqhMeT7cVxlamzBVvXoaLTlOzSvbOIBfnHhYPuFABNHxN2DKY
	IpyyfQkoG+/hGTjBDy7NTH1n/blKuRY=
X-Google-Smtp-Source: ABdhPJwZa5eQWbNcOFizwLiGov6PXztuKkCWinaACkr1K90rD3Pup3TVFdnmIDcynnE8TwC3+yh+lA==
X-Received: by 2002:a05:6512:169e:b0:470:2124:63fb with SMTP id bu30-20020a056512169e00b00470212463fbmr478280lfb.616.1654106284655;
        Wed, 01 Jun 2022 10:58:04 -0700 (PDT)
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
Subject: [PATCH V9 1/2] libxl: Add support for Virtio disk configuration
Date: Wed,  1 Jun 2022 20:57:40 +0300
Message-Id: <1654106261-28044-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654106261-28044-1-git-send-email-olekstysh@gmail.com>
References: <1654106261-28044-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch adds basic support for configuring and assisting virtio-mmio
based virtio-disk backend (emulator) which is intended to run out of
Qemu and could be run in any domain.
Although the Virtio block device is quite different from traditional
Xen PV block device (vbd) from the toolstack's point of view:
 - as the frontend is virtio-blk which is not a Xenbus driver, nothing
   written to Xenstore are fetched by the frontend currently ("vdev"
   is not passed to the frontend). But this might need to be revised
   in future, so frontend data might be written to Xenstore in order to
   support hotplugging virtio devices or passing the backend domain id
   on arch where the device-tree is not available.
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
- Introduce new disk "specification" and "transport" fields to struct
  libxl_device_disk. Both are written to the Xenstore. The transport
  field is only used for the specification "virtio" and it assumes
  only "mmio" value for now.
- Introduce new "specification" option with "xen" communication
  protocol being default value.
- Add new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
  one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model

An example of domain configuration for Virtio disk:
disk = [ 'phy:/dev/mmcblk0p3, xvda1, backendtype=other, specification=virtio']

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

Changes V7 -> V8:
   - update *.gen.go files and libxlu_disk_l.[ch] files
   - update patch description and comments in the code
   - use "specification" config option instead of "protocol"
   - update libxl_types.idl and code according to new fields
     in libxl_device_disk

Changes V8 -> V9:
   - update (and harden) checks in libxl__device_disk_setdefault(),
     return error in case of incorrect settings of specification
     and transport
   - remove both asserts in device_disk_add()
   - update virtio related code in libxl__disk_from_xenstore(),
     do not fail if specification node is absent, replace
     open-coded checks of fetched specification and transport by
     libxl_disk_specification_from_string() and libxl_disk_transport_from_string()
     respectively
   - s/libxl_device_disk_get_path/libxl__device_disk_get_path
   - add a comment for virtio-mmio parameters in struct libxl_device_disk
---
 docs/man/xl-disk-configuration.5.pod.in   |  38 +-
 tools/golang/xenlight/helpers.gen.go      |   8 +
 tools/golang/xenlight/types.gen.go        |  18 +
 tools/include/libxl.h                     |   7 +
 tools/libs/light/libxl_device.c           |  62 +-
 tools/libs/light/libxl_disk.c             | 140 ++++-
 tools/libs/light/libxl_internal.h         |   2 +
 tools/libs/light/libxl_types.idl          |  18 +
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_utils.c            |   2 +
 tools/libs/util/libxlu_disk_l.c           | 959 +++++++++++++++---------------
 tools/libs/util/libxlu_disk_l.h           |   2 +-
 tools/libs/util/libxlu_disk_l.l           |   9 +
 tools/xl/xl_block.c                       |  11 +
 14 files changed, 797 insertions(+), 480 deletions(-)

diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-configuration.5.pod.in
index 71d0e86..487ffef 100644
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
+Depending on the "specification" option this may affect the guest's view
+of the device.
 
 Not all backend drivers support all combinations of other options.
-For example, "phy" does not support formats other than "raw".
+For example, "phy" and "other" do not support formats other than "raw" and
+"other" does not support specifications other than "virtio".
 Normally this option should not be specified, in which case libxl will
 automatically determine the most suitable backend.
 
@@ -344,8 +346,36 @@ can be used to disable "hole punching" for file based backends which
 were intentionally created non-sparse to avoid fragmentation of the
 file.
 
+=item B<specification>=I<SPECIFICATION>
+
+=over 4
+
+=item Description
+
+Specifies the communication protocol (specification) to use for the chosen
+"backendtype" option
+
+=item Supported values
+
+xen, virtio
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
+affects the guest's view of the device. For example, "virtio" requires
+Virtio frontend driver (virtio-blk) to be used. Please note, the virtual
+device (vdev) is not passed to the guest in that case, but it still must be
+specified for the internal purposes.
+
+=back
 
 =head1 COLO Parameters
 
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index b746ff1..00f10b9 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1751,6 +1751,10 @@ x.DirectIoSafe = bool(xc.direct_io_safe)
 if err := x.DiscardEnable.fromC(&xc.discard_enable);err != nil {
 return fmt.Errorf("converting field DiscardEnable: %v", err)
 }
+x.Specification = DiskSpecification(xc.specification)
+x.Transport = DiskTransport(xc.transport)
+x.Irq = uint32(xc.irq)
+x.Base = uint64(xc.base)
 if err := x.ColoEnable.fromC(&xc.colo_enable);err != nil {
 return fmt.Errorf("converting field ColoEnable: %v", err)
 }
@@ -1788,6 +1792,10 @@ xc.direct_io_safe = C.bool(x.DirectIoSafe)
 if err := x.DiscardEnable.toC(&xc.discard_enable); err != nil {
 return fmt.Errorf("converting field DiscardEnable: %v", err)
 }
+xc.specification = C.libxl_disk_specification(x.Specification)
+xc.transport = C.libxl_disk_transport(x.Transport)
+xc.irq = C.uint32_t(x.Irq)
+xc.base = C.uint64_t(x.Base)
 if err := x.ColoEnable.toC(&xc.colo_enable); err != nil {
 return fmt.Errorf("converting field ColoEnable: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index b1e84d5..cc52936 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -99,6 +99,20 @@ DiskBackendUnknown DiskBackend = 0
 DiskBackendPhy DiskBackend = 1
 DiskBackendTap DiskBackend = 2
 DiskBackendQdisk DiskBackend = 3
+DiskBackendOther DiskBackend = 4
+)
+
+type DiskSpecification int
+const(
+DiskSpecificationUnknown DiskSpecification = 0
+DiskSpecificationXen DiskSpecification = 1
+DiskSpecificationVirtio DiskSpecification = 2
+)
+
+type DiskTransport int
+const(
+DiskTransportUnknown DiskTransport = 0
+DiskTransportMmio DiskTransport = 1
 )
 
 type NicType int
@@ -643,6 +657,10 @@ Readwrite int
 IsCdrom int
 DirectIoSafe bool
 DiscardEnable Defbool
+Specification DiskSpecification
+Transport DiskTransport
+Irq uint32
+Base uint64
 ColoEnable Defbool
 ColoRestoreEnable Defbool
 ColoHost string
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 51a9b6c..cd8067b 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -528,6 +528,13 @@
 #define LIBXL_HAVE_MAX_GRANT_VERSION 1
 
 /*
+ * LIBXL_HAVE_DEVICE_DISK_SPECIFICATION indicates that 'specification' and
+ * 'transport' fields (of libxl_disk_specification and libxl_disk_transport
+ * types respectively) are present in libxl_device_disk.
+ */
+#define LIBXL_HAVE_DEVICE_DISK_SPECIFICATION 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index e6025d1..a38d2e2 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -289,9 +289,16 @@ static int disk_try_backend(disk_try_backend_args *a,
                             libxl_disk_backend backend)
  {
     libxl__gc *gc = a->gc;
+    libxl_disk_specification specification = a->disk->specification;
     /* returns 0 (ie, DISK_BACKEND_UNKNOWN) on failure, or
      * backend on success */
 
+    if ((specification == LIBXL_DISK_SPECIFICATION_VIRTIO &&
+         backend != LIBXL_DISK_BACKEND_OTHER) ||
+        (specification != LIBXL_DISK_SPECIFICATION_VIRTIO &&
+         backend == LIBXL_DISK_BACKEND_OTHER))
+        goto bad_specification;
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
+ bad_specification:
+    LOG(DEBUG, "Disk vdev=%s, backend %s not compatible with specification %s",
+        a->disk->vdev, libxl_disk_backend_to_string(backend),
+        libxl_disk_specification_to_string(specification));
+    return 0;
 }
 
 int libxl__backendpath_parse_domid(libxl__gc *gc, const char *be_path,
@@ -376,8 +412,9 @@ int libxl__device_disk_set_backend(libxl__gc *gc, libxl_device_disk *disk) {
     a.gc = gc;
     a.disk = disk;
 
-    LOG(DEBUG, "Disk vdev=%s spec.backend=%s", disk->vdev,
-               libxl_disk_backend_to_string(disk->backend));
+    LOG(DEBUG, "Disk vdev=%s spec.backend=%s specification=%s", disk->vdev,
+               libxl_disk_backend_to_string(disk->backend),
+               libxl_disk_specification_to_string(disk->specification));
 
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
@@ -441,10 +480,25 @@ char *libxl__device_disk_string_of_backend(libxl_disk_backend backend)
         case LIBXL_DISK_BACKEND_QDISK: return "qdisk";
         case LIBXL_DISK_BACKEND_TAP: return "phy";
         case LIBXL_DISK_BACKEND_PHY: return "phy";
+        case LIBXL_DISK_BACKEND_OTHER: return "other";
+        default: return NULL;
+    }
+}
+
+char *libxl__device_disk_string_of_specification(libxl_disk_specification specification)
+{
+    switch (specification) {
+        case LIBXL_DISK_SPECIFICATION_XEN: return "xen";
+        case LIBXL_DISK_SPECIFICATION_VIRTIO: return "virtio";
         default: return NULL;
     }
 }
 
+char *libxl__device_disk_string_of_transport(libxl_disk_transport transport)
+{
+    return (transport == LIBXL_DISK_TRANSPORT_MMIO ? "mmio" : NULL);
+}
+
 const char *libxl__qemu_disk_format_string(libxl_disk_format format)
 {
     switch (format) {
diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index a5ca778..e90bc25 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -163,6 +163,25 @@ static int libxl__device_disk_setdefault(libxl__gc *gc, uint32_t domid,
     rc = libxl__resolve_domid(gc, disk->backend_domname, &disk->backend_domid);
     if (rc < 0) return rc;
 
+    if (disk->specification == LIBXL_DISK_SPECIFICATION_UNKNOWN)
+        disk->specification = LIBXL_DISK_SPECIFICATION_XEN;
+
+    if (disk->specification == LIBXL_DISK_SPECIFICATION_XEN &&
+        disk->transport != LIBXL_DISK_TRANSPORT_UNKNOWN) {
+        LOGD(ERROR, domid, "Transport is only supported for specification virtio");
+        return ERROR_FAIL;
+    }
+
+    /* Force transport mmio for specification virtio for now */
+    if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
+        if (!(disk->transport == LIBXL_DISK_TRANSPORT_UNKNOWN ||
+              disk->transport == LIBXL_DISK_TRANSPORT_MMIO)) {
+            LOGD(ERROR, domid, "Unsupported transport for specification virtio");
+            return ERROR_FAIL;
+        }
+        disk->transport = LIBXL_DISK_TRANSPORT_MMIO;
+    }
+
     /* Force Qdisk backend for CDROM devices of guests with a device model. */
     if (disk->is_cdrom != 0 &&
         libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
@@ -204,6 +223,9 @@ static int libxl__device_from_disk(libxl__gc *gc, uint32_t domid,
         case LIBXL_DISK_BACKEND_QDISK:
             device->backend_kind = LIBXL__DEVICE_KIND_QDISK;
             break;
+        case LIBXL_DISK_BACKEND_OTHER:
+            device->backend_kind = LIBXL__DEVICE_KIND_VIRTIO_DISK;
+            break;
         default:
             LOGD(ERROR, domid, "Unrecognized disk backend type: %d",
                  disk->backend);
@@ -212,7 +234,8 @@ static int libxl__device_from_disk(libxl__gc *gc, uint32_t domid,
 
     device->domid = domid;
     device->devid = devid;
-    device->kind  = LIBXL__DEVICE_KIND_VBD;
+    device->kind = disk->backend == LIBXL_DISK_BACKEND_OTHER ?
+        LIBXL__DEVICE_KIND_VIRTIO_DISK : LIBXL__DEVICE_KIND_VBD;
 
     return 0;
 }
@@ -330,7 +353,14 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
 
                 assert(device->backend_kind == LIBXL__DEVICE_KIND_VBD);
                 break;
+            case LIBXL_DISK_BACKEND_OTHER:
+                dev = disk->pdev_path;
 
+                flexarray_append(back, "params");
+                flexarray_append(back, dev);
+
+                assert(device->backend_kind == LIBXL__DEVICE_KIND_VIRTIO_DISK);
+                break;
             case LIBXL_DISK_BACKEND_TAP:
                 LOG(ERROR, "blktap is not supported");
                 rc = ERROR_FAIL;
@@ -386,6 +416,14 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
         flexarray_append_pair(back, "discard-enable",
                               libxl_defbool_val(disk->discard_enable) ?
                               "1" : "0");
+        flexarray_append(back, "specification");
+        flexarray_append(back, libxl__device_disk_string_of_specification(disk->specification));
+        if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
+            flexarray_append(back, "transport");
+            flexarray_append(back, libxl__device_disk_string_of_transport(disk->transport));
+            flexarray_append_pair(back, "base", GCSPRINTF("%"PRIu64, disk->base));
+            flexarray_append_pair(back, "irq", GCSPRINTF("%u", disk->irq));
+        }
 
         flexarray_append(front, "backend-id");
         flexarray_append(front, GCSPRINTF("%d", disk->backend_domid));
@@ -532,6 +570,53 @@ static int libxl__disk_from_xenstore(libxl__gc *gc, const char *libxl_path,
     }
     libxl_string_to_backend(ctx, tmp, &(disk->backend));
 
+    tmp = libxl__xs_read(gc, XBT_NULL,
+                         GCSPRINTF("%s/specification", libxl_path));
+    if (!tmp) {
+        LOG(DEBUG, "Missing xenstore node %s/specification, assuming specification xen", libxl_path);
+        disk->specification = LIBXL_DISK_SPECIFICATION_XEN;
+    } else {
+        rc = libxl_disk_specification_from_string(tmp, &disk->specification);
+        if (rc) {
+            LOG(ERROR, "Unable to parse xenstore node %s/specification", libxl_path);
+            goto cleanup;
+        }
+    }
+
+    if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
+        tmp = libxl__xs_read(gc, XBT_NULL,
+                             GCSPRINTF("%s/transport", libxl_path));
+        if (!tmp) {
+            LOG(ERROR, "Missing xenstore node %s/transport", libxl_path);
+            goto cleanup;
+        }
+        rc = libxl_disk_transport_from_string(tmp, &disk->transport);
+        if (rc) {
+            LOG(ERROR, "Unable to parse xenstore node %s/transport", libxl_path);
+            goto cleanup;
+        }
+        if (disk->transport != LIBXL_DISK_TRANSPORT_MMIO) {
+            LOG(ERROR, "Only transport mmio is expected for specification virtio");
+            goto cleanup;
+        }
+
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
@@ -575,6 +660,41 @@ cleanup:
     return rc;
 }
 
+static int libxl__device_disk_get_path(libxl__gc *gc, uint32_t domid,
+                                       char **path)
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
@@ -588,10 +708,12 @@ int libxl_vdev_to_device_disk(libxl_ctx *ctx, uint32_t domid,
 
     libxl_device_disk_init(disk);
 
-    libxl_path = libxl__domain_device_libxl_path(gc, domid, devid,
-                                                 LIBXL__DEVICE_KIND_VBD);
+    rc = libxl__device_disk_get_path(gc, domid, &libxl_path);
+    if (rc)
+        return rc;
 
-    rc = libxl__disk_from_xenstore(gc, libxl_path, devid, disk);
+    rc = libxl__disk_from_xenstore(gc, GCSPRINTF("%s/%d", libxl_path, devid),
+                                   devid, disk);
 
     GC_FREE;
     return rc;
@@ -605,16 +727,19 @@ int libxl_device_disk_getinfo(libxl_ctx *ctx, uint32_t domid,
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
@@ -1418,6 +1543,7 @@ LIBXL_DEFINE_DEVICE_LIST(disk)
 #define libxl__device_disk_update_devid NULL
 
 DEFINE_DEVICE_TYPE_STRUCT(disk, VBD, disks,
+    .get_path    = libxl__device_disk_get_path,
     .merge       = libxl_device_disk_merge,
     .dm_needed   = libxl_device_disk_dm_needed,
     .from_xenstore = (device_from_xenstore_fn_t)libxl__disk_from_xenstore,
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index bdef5a6..cb9e8b3 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -1493,6 +1493,8 @@ _hidden char * libxl__domain_pvcontrol_read(libxl__gc *gc,
 
 /* from xl_device */
 _hidden char *libxl__device_disk_string_of_backend(libxl_disk_backend backend);
+_hidden char *libxl__device_disk_string_of_specification(libxl_disk_specification specification);
+_hidden char *libxl__device_disk_string_of_transport(libxl_disk_transport transport);
 _hidden char *libxl__device_disk_string_of_format(libxl_disk_format format);
 _hidden const char *libxl__qemu_disk_format_string(libxl_disk_format format);
 _hidden int libxl__device_disk_set_backend(libxl__gc*, libxl_device_disk*);
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 2a42da2..858e32b 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -130,6 +130,18 @@ libxl_disk_backend = Enumeration("disk_backend", [
     (1, "PHY"),
     (2, "TAP"),
     (3, "QDISK"),
+    (4, "OTHER"),
+    ])
+
+libxl_disk_specification = Enumeration("disk_specification", [
+    (0, "UNKNOWN"),
+    (1, "XEN"),
+    (2, "VIRTIO"),
+    ])
+
+libxl_disk_transport = Enumeration("disk_transport", [
+    (0, "UNKNOWN"),
+    (1, "MMIO"),
     ])
 
 libxl_nic_type = Enumeration("nic_type", [
@@ -704,6 +716,12 @@ libxl_device_disk = Struct("device_disk", [
     ("is_cdrom", integer),
     ("direct_io_safe", bool),
     ("discard_enable", libxl_defbool),
+    ("specification", libxl_disk_specification),
+    ("transport", libxl_disk_transport),
+    # Note that virtio-mmio parameters (irq and base) are for internal use
+    # by libxl and can't be modified.
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
index e5e6b2d..f55915e 100644
--- a/tools/libs/light/libxl_utils.c
+++ b/tools/libs/light/libxl_utils.c
@@ -297,6 +297,8 @@ int libxl_string_to_backend(libxl_ctx *ctx, char *s, libxl_disk_backend *backend
         *backend = LIBXL_DISK_BACKEND_TAP;
     } else if (!strcmp(s, "qdisk")) {
         *backend = LIBXL_DISK_BACKEND_QDISK;
+    } else if (!strcmp(s, "other")) {
+        *backend = LIBXL_DISK_BACKEND_OTHER;
     } else if (!strcmp(s, "tap")) {
         p = strchr(s, ':');
         if (!p) {
diff --git a/tools/libs/util/libxlu_disk_l.c b/tools/libs/util/libxlu_disk_l.c
index 32d4b74..bb1337c 100644
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
@@ -558,74 +558,77 @@ struct yy_trans_info
 	flex_int32_t yy_verify;
 	flex_int32_t yy_nxt;
 	};
-static const flex_int16_t yy_acclist[575] =
+static const flex_int16_t yy_acclist[594] =
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
+       34,16417,   34, 8217, 8225,   34,16409,16417,   34,   34,
+       34, 8220, 8225,   34,16412,16417,   34,   34,   34,   34,
+
+       34,   29, 8225,   34,   29, 8225,   34,   29,   34,   29,
+     8225,   34,    3,   34,   16,   34,   34,   34,   34,   34,
+       31, 8225,   34,16417,   34,   34,   34, 8218, 8225,   34,
+     8218, 8225,   34, 8218,   34, 8218, 8225,   34,   34,   32,
+     8225,   34,   32, 8225,   34,   32,   34,   32, 8225, 8217,
+     8225,   34, 8217, 8225,   34, 8217,   34, 8217, 8225,   34,
+       34, 8220, 8225,   34, 8220, 8225,   34, 8220,   34, 8220,
+     8225,   34,   34,   11,   34,   34,   29, 8225,   34,   29,
+     8225,   34,   29, 8225,   29,   34,   29,   34,    3,   34,
+       34,   34,   34,   34,   34,   34,   31, 8225,   34,   31,
+
+     8225,   34,   31,   34,   31, 8225,   34,   34,   30, 8225,
+       34,16417, 8218, 8225,   34, 8218, 8225,   34, 8218, 8225,
+     8218,   34, 8218,   34,   34,   32, 8225,   34,   32, 8225,
+       34,   32, 8225,   32,   34,   32, 8217, 8225,   34, 8217,
+     8225,   34, 8217, 8225, 8217,   34, 8217,   34,   34, 8220,
+     8225,   34, 8220, 8225,   34, 8220, 8225, 8220,   34, 8220,
+       34,   34,   11,   24,   11,    7,   34,   34,   34,   34,
+       34,   34,   34,   14,   34,   31, 8225,   34,   31, 8225,
+       34,   31, 8225,   31,   34,   31,    2,   34,   30, 8225,
+       34,   30, 8225,   34,   30,   34,   30, 8225,   17,   34,
+
+       34,   12,   34,   34,   23,   11,   11,   24,    7,   24,
+        7,   34,    8,   34,   34,   34,   34,    6,   34,   14,
+       34,    2,   24,    2,   34,   30, 8225,   34,   30, 8225,
+       34,   30, 8225,   30,   34,   30,   17,   34,   34,   12,
+       24,   12,   34,   27, 8225,   34,16417,   23,   24,   23,
+        7,    7,   24,   34,    8,   24,    8,   34,   34,   34,
+       34,    6,   24,    6,    6,   24,    6,   24,   34,    2,
+        2,   24,   34,   34,   12,   12,   24,   34,   27, 8225,
+       34,   27, 8225,   34,   27,   34,   27, 8225,   23,   24,
+       34,    8,    8,   24,   34,   34,   18,   19,    6,    6,
+
+       24,    6,    6,   34,   34,   15,   34,   34,   27, 8225,
+       34,   27, 8225,   34,   27, 8225,   27,   34,   27,   34,
+       34,   34,   18,   24,   18,   19,   24,   19,    6,    6,
+       34,   34,   15,   34,   34,   21,    9,   20,   18,   18,
+       24,   19,   19,   24,    6,    5,    6,   34,   22,   34,
+       21,   24,   21,    9,   24,    9,   20,   24,   20,    4,
+        6,    5,    6,   34,   22,   24,   22,   34,   21,   21,
+       24,    9,    9,   24,   20,   20,   24,    4,    6,   13,
+       34,   22,   22,   24,   10,   13,   34,   10,   24,   10,
+       10,   10,   24
+
     } ;
 
-static const flex_int16_t yy_accept[356] =
+static const flex_int16_t yy_accept[373] =
     {   0,
         1,    1,    1,    2,    3,    4,    7,   12,   16,   19,
        21,   24,   27,   30,   33,   36,   39,   42,   45,   48,
@@ -633,39 +636,41 @@ static const flex_int16_t yy_accept[356] =
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
+      169,  170,  171,  172,  177,  178,  179,  183,  184,  189,
+      190,  191,  192,  197,  198,  199,  200,  201,  202,  205,
+      208,  210,  212,  213,  215,  217,  218,  219,  220,  221,
+      225,  226,  227,  228,  231,  234,  236,  238,  239,  240,
+      243,  246,  248,  250,  253,  256,  258,  260,  261,  262,
+      265,  268,  270,  272,  273,  274,  275,  276,  277,  280,
+      283,  285,  287,  288,  289,  291,  292,  293,  294,  295,
+      296,  297,  300,  303,  305,  307,  308,  309,  313,  316,
+      319,  321,  323,  324,  325,  326,  329,  332,  334,  336,
+
+      337,  340,  343,  345,  347,  348,  349,  350,  353,  356,
+      358,  360,  361,  362,  363,  365,  366,  367,  368,  369,
+      370,  371,  372,  373,  374,  376,  379,  382,  384,  386,
+      387,  388,  389,  392,  395,  397,  399,  401,  402,  403,
+      404,  405,  406,  407,  409,  411,  412,  413,  414,  415,
+      416,  417,  418,  419,  420,  422,  424,  425,  426,  429,
+      432,  434,  436,  437,  439,  440,  442,  443,  444,  448,
+      450,  451,  452,  454,  455,  457,  458,  459,  460,  461,
+      462,  464,  465,  467,  469,  470,  471,  473,  474,  475,
+      476,  478,  479,  482,  485,  487,  489,  491,  492,  493,
+
+      495,  496,  497,  498,  499,  500,  502,  503,  504,  505,
+      506,  508,  509,  512,  515,  517,  519,  520,  521,  522,
+      523,  525,  526,  528,  529,  530,  531,  532,  533,  535,
+      536,  537,  538,  539,  540,  542,  543,  545,  546,  548,
+      549,  550,  551,  553,  554,  556,  557,  559,  560,  562,
+      564,  565,  567,  568,  569,  570,  572,  573,  575,  576,
+      578,  580,  582,  583,  585,  586,  588,  590,  591,  592,
+      594,  594
     } ;
 
 static const YY_CHAR yy_ec[256] =
@@ -708,216 +713,224 @@ static const YY_CHAR yy_meta[35] =
         1,    1,    1,    1
     } ;
 
-static const flex_int16_t yy_base[424] =
+static const flex_int16_t yy_base[443] =
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
+        0,    0,  936,  935,  937,  932,   33,   36,  940,  940,
+       45,   63,   31,   42,   51,   52,  925,   33,   65,   67,
+       69,   70,  924,   71,  923,   75,    0,  940,  928,  940,
+       91,   95,    0,    0,  104,  921,  113,    0,   91,   99,
+      114,   92,  115,   80,  100,   48,  119,  121,  122,   74,
+      123,  128,  131,  129,  125,  133,  135,  136,  137,  143,
+      138,  145,    0,  157,    0,    0,  168,    0,    0,  926,
+      140,  146,  165,  159,  152,  164,  155,  168,  171,  176,
+      177,  170,  180,  175,  184,  188,  212,  191,  185,  192,
+      193,  194,  219,  212,  199,  230,    0,    0,  940,  195,
+
+      200,  239,  235,  197,  246,  225,  226,  919,  244,  918,
+      243,  236,  245,  266,  248,  264,  282,  271,  291,  248,
+      270,  254,  300,  279,  296,  302,  288,  303,  311,    0,
+      315,    0,  311,  318,  940,  313,  319,  208,  313,  344,
+      321,  331,  325,  333,    0,  352,    0,  345,  347,  359,
+        0,  361,    0,  368,    0,  370,    0,  322,  366,  379,
+        0,  381,    0,  359,  357,  923,  382,  384,  392,    0,
+        0,    0,    0,  387,  940,  386,  390,  392,  329,  401,
+      397,  409,    0,  417,    0,  399,  412,  426,  429,    0,
+        0,    0,    0,  412,  427,  438,    0,    0,    0,    0,
+
+      440,    0,    0,    0,    0,  436,  405,  447,    0,    0,
+        0,    0,  438,  443,  922,  940,  921,  442,  450,  449,
+      452,  454,  459,  458,  453,  469,    0,    0,    0,    0,
+      920,  470,  481,    0,  483,    0,  484,  481,  919,  368,
+      467,  495,  918,  940,  917,  940,  488,  916,  479,  490,
+      492,  495,  505,  498,  940,  915,  940,  507,  523,    0,
+        0,    0,    0,  940,  503,  864,  940,  846,  532,  836,
+        0,  824,  940,  516,  796,  940,  513,  530,  536,  538,
+      784,  940,  542,  535,  547,  772,  940,  549,  551,  768,
+      940,  502,  562,    0,  564,    0,    0,  562,  764,  940,
+
+      544,  557,  760,  752,  744,  940,  552,  568,  571,  568,
+      581,  577,  588,    0,    0,    0,    0,  589,  580,  591,
+      736,  940,  728,  940,  601,  602,  597,  599,  940,  603,
+      720,  712,  700,  672,  940,  665,  940,  610,  656,  603,
+      648,  607,  629,  940,  627,  940,  625,  940,  624,  940,
+      607,  574,  940,  614,  572,  940,  491,  940,  433,  940,
+      940,  622,  389,  940,  303,  940,  261,  940,  204,  940,
+      940,  635,  639,  642,  646,  650,  654,  658,  662,  666,
+      670,  674,  678,  682,  686,  690,  694,  698,  702,  706,
+      710,  714,  718,  722,  726,  730,  734,  738,  742,  746,
+
+      750,  754,  758,  762,  766,  770,  774,  778,  782,  786,
+      790,  794,  798,  802,  806,  810,  814,  818,  822,  826,
+      830,  834,  838,  842,  846,  850,  854,  858,  862,  866,
+      870,  874,  878,  882,  886,  890,  894,  898,  902,  906,
+      910,  914
     } ;
 
-static const flex_int16_t yy_def[424] =
+static const flex_int16_t yy_def[443] =
     {   0,
-      354,    1,  355,  355,  354,  356,  357,  357,  354,  354,
-      358,  358,   12,   12,   12,   12,   12,   12,   12,   12,
-       12,   12,   12,   12,   12,   12,  359,  354,  356,  354,
-      360,  357,  361,  361,  362,   12,  356,  363,   12,   12,
-       12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
+      371,    1,  372,  372,  371,  373,  374,  374,  371,  371,
+      375,  375,   12,   12,   12,   12,   12,   12,   12,   12,
+       12,   12,   12,   12,   12,   12,  376,  371,  373,  371,
+      377,  374,  378,  378,  379,   12,  373,  380,   12,   12,
        12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
-       12,  359,  360,  361,  361,  364,  365,  365,  354,   12,
        12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
-       12,   12,   12,   12,   12,  362,   12,   12,   12,   12,
-       12,   12,   12,  364,  365,  365,  354,   12,   12,  366,
-
+       12,   12,  376,  377,  378,  378,  381,  382,  382,  371,
        12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
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
+       12,   12,   12,   12,   12,   12,  379,   12,   12,   12,
+       12,   12,   12,   12,   12,  381,  382,  382,  371,   12,
+
+       12,  383,   12,   12,   12,   12,   12,   12,   12,   12,
+       12,   12,   12,  384,   87,   87,  385,   12,  386,   12,
+       12,   12,  387,   12,   12,   12,   12,   12,  388,  389,
+      383,  389,   12,   12,  371,   87,   12,   12,   12,  390,
+       12,   12,   12,  391,  392,  384,  392,   87,   87,  393,
+      394,  385,  394,  395,  396,  386,  396,   12,   12,  397,
+      398,  387,  398,   12,   12,  399,   12,   12,  388,  389,
+      389,  400,  400,   12,  371,   87,   87,   87,   12,   12,
+       12,  401,  402,  390,  402,   12,   12,  403,  391,  392,
+      392,  404,  404,   87,   87,  393,  394,  394,  405,  405,
+
+      395,  396,  396,  406,  406,   12,   12,  397,  398,  398,
+      407,  407,   12,   12,  408,  371,  409,   87,   12,   87,
+       87,   87,   12,   87,   12,  401,  402,  402,  410,  410,
+      411,   87,  412,  413,  403,  413,   87,   87,  414,   12,
+       12,  415,  408,  371,  416,  371,   87,  417,   12,   87,
+       87,   87,  418,   87,  371,  419,  371,   87,  412,  413,
+      413,  420,  420,  371,   87,  421,  371,   12,  422,  423,
+      423,  416,  371,   87,  424,  371,   12,   87,   87,   87,
+      425,  371,  425,  425,   87,  419,  371,   87,   87,  421,
+      371,   12,  426,  427,  422,  427,  423,   87,  424,  371,
+
+       12,   87,  428,  429,  425,  371,  425,  425,   87,   87,
+       87,   12,  426,  427,  427,  430,  430,   87,   12,   87,
+      431,  371,  432,  371,  425,  425,   87,   87,  371,   12,
+      433,  434,  435,  431,  371,  432,  371,  425,  425,   87,
+      436,   12,  437,  371,  438,  371,  439,  371,  425,  371,
+       87,  440,  371,   12,  437,  371,  438,  371,  439,  371,
+      371,   87,  440,  371,  441,  371,  442,  371,  442,  371,
+        0,  371,  371,  371,  371,  371,  371,  371,  371,  371,
+      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
+      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
+
+      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
+      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
+      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
+      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
+      371,  371
     } ;
 
-static const flex_int16_t yy_nxt[940] =
+static const flex_int16_t yy_nxt[975] =
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
+       36,   56,   58,   36,   36,   55,   83,   61,   51,   36,
+       54,   62,   52,   29,   65,   59,   32,   32,   33,   66,
+
+       36,   36,   71,   34,   29,   29,   29,   30,   36,   36,
+       77,   29,   38,   67,   67,   67,   68,   67,   75,   72,
+       67,   69,   73,   36,   36,   74,   78,   79,   36,   53,
+       36,   36,   36,   87,   36,   76,   84,   36,   36,   85,
+       36,   81,   36,   86,   36,   36,   36,   36,   82,   36,
+       92,   95,   36,  100,   36,   36,   89,   90,   88,   29,
+       65,   36,   91,  101,   36,   66,   90,   93,   36,   94,
+       29,   97,  102,   36,   36,  104,   98,   36,  103,   36,
+       36,  107,  108,  106,   36,   36,   36,  105,   86,   36,
+      109,  110,  111,   36,   36,  114,  112,   36,  117,  119,
+
+       36,   36,   36,   36,   36,  121,   36,  368,   36,   36,
+      120,  113,   29,   29,   29,   30,  118,   36,  134,   29,
+       38,   36,  127,  115,  116,  122,  123,  125,   36,  126,
+      128,  124,   29,   97,   36,   36,  180,  138,   98,  129,
+      129,   67,  130,  129,   36,   36,  129,  132,  133,  135,
+      136,  140,   36,   36,   36,   36,  142,   36,  137,   35,
+       35,  123,   86,   36,  370,  143,  144,  144,   67,  145,
+      144,  148,  158,  144,  147,   35,   35,   90,  119,   36,
+       36,  149,  150,  150,   67,  151,  150,  159,   36,  150,
+      153,  154,  154,   67,  155,  154,  164,   36,  154,  157,
+
+      160,  160,   67,  161,  160,   36,  368,  160,  163,  165,
+      166,   36,   36,   29,  170,  167,  168,   29,  172,  171,
+       36,  175,   36,  173,   35,   35,  176,   36,   36,  177,
+       36,   36,  188,  174,   36,   29,  190,  178,   36,  181,
+       36,  191,  223,  179,  182,  182,   67,  183,  182,  186,
+      206,  182,  185,  187,   29,  192,   35,   35,   35,   35,
+      193,   29,  197,   29,  199,  194,   36,  198,   36,  200,
+       29,  202,   29,  204,  195,   36,  203,   36,  205,  268,
+      207,   29,  209,   29,  211,  214,  213,  210,  218,  212,
+      217,   36,  353,   36,   29,  170,   36,   35,   35,  219,
+
+      171,   35,   35,   35,   35,  224,   36,  231,   36,  225,
+       36,   29,  227,  221,   36,  222,  232,  228,  220,   29,
+      229,   36,  240,   35,   35,  230,  233,  233,   67,  234,
+      233,   29,  190,  233,  236,  237,  348,  191,  238,   35,
+       29,  197,   29,  202,  239,   36,  198,   36,  203,   29,
+      209,  242,   36,   35,  247,  210,  255,  241,  248,   36,
+       35,   35,   36,   35,   35,   35,   35,  253,   36,   35,
+       35,   29,  227,  250,  269,  254,   36,  228,  249,  251,
+      252,   35,  258,   29,  260,   29,  262,  264,   36,  261,
+      265,  263,   35,   35,  346,   35,   35,   70,  271,   35,
+
+       35,   35,   35,   35,   35,  274,   35,   35,  282,   35,
+       35,   36,  277,  278,   35,   35,  283,  284,   35,   35,
+      279,  285,   36,  280,  288,   29,  260,   35,   35,  289,
+      312,  261,  293,  293,   67,  294,  293,  301,  306,  293,
+      296,   35,   35,  298,  303,  306,  304,   35,   35,   35,
+       35,  309,  308,   36,  307,  282,  302,  319,   35,   35,
+       35,   35,   35,  311,   29,  314,   29,  316,   35,   35,
+      315,  282,  317,   35,   35,  344,  310,  364,  325,   35,
+       35,  318,   35,   35,  329,  320,   36,  328,  332,   36,
+       29,  314,   35,   35,  330,  326,  315,  331,  327,  333,
+
+       35,   35,   35,   35,  282,  282,  340,  341,   35,   35,
+       35,   35,   36,  282,   35,   35,   36,  351,   35,   35,
+      362,  339,  365,   36,  338,  366,  342,  361,  360,  354,
+      358,  349,  356,   35,   35,   27,   27,   27,   27,   29,
+       29,   29,   31,   31,   31,   31,   36,   36,   36,   36,
+       63,  353,   63,   63,   64,   64,   64,   64,   66,  350,
+       66,   66,   35,   35,   35,   35,   70,   70,  324,   70,
+       96,   96,   96,   96,   98,  322,   98,   98,  131,  131,
+      131,  131,  146,  146,  146,  146,  152,  152,  152,  152,
+      156,  156,  156,  156,  162,  162,  162,  162,  169,  169,
+
+      169,  169,  171,  348,  171,  171,  184,  184,  184,  184,
+      189,  189,  189,  189,  191,  346,  191,  191,  196,  196,
+      196,  196,  198,  344,  198,  198,  201,  201,  201,  201,
+      203,  337,  203,  203,  208,  208,  208,  208,  210,  335,
+      210,  210,  215,  215,  215,  215,  173,  282,  173,  173,
+      226,  226,  226,  226,  228,  324,  228,  228,  235,  235,
+      235,  235,  193,  322,  193,  193,  200,  276,  200,  200,
+      205,  267,  205,  205,  212,  257,  212,  212,  243,  243,
+      243,  243,  245,  245,  245,  245,  230,  306,  230,  230,
+      256,  256,  256,  256,  259,  259,  259,  259,  261,  300,
+
+      261,  261,  266,  266,  266,  266,  270,  270,  270,  270,
+      272,  272,  272,  272,  275,  275,  275,  275,  281,  281,
+      281,  281,  286,  286,  286,  286,  263,  246,  263,  263,
+      290,  290,  290,  290,  295,  295,  295,  295,  271,  297,
+      271,  271,  299,  299,  299,  299,  305,  305,  305,  305,
+      313,  313,  313,  313,  315,  292,  315,  315,  321,  321,
+      321,  321,  323,  323,  323,  323,  317,  291,  317,  317,
+      334,  334,  334,  334,  336,  336,  336,  336,  343,  343,
+      343,  343,  345,  345,  345,  345,  347,  347,  347,  347,
+      352,  352,  352,  352,  355,  355,  355,  355,  357,  357,
+
+      357,  357,  359,  359,  359,  359,  363,  363,  363,  363,
+      367,  367,  367,  367,  369,  369,  369,  369,  287,  276,
+      273,  216,  267,  257,  246,  244,  216,  141,  139,   99,
+       36,   30,   60,   57,   36,   30,  371,   28,   28,    5,
+      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
+      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
+      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
+      371,  371,  371,  371
     } ;
 
-static const flex_int16_t yy_chk[940] =
+static const flex_int16_t yy_chk[975] =
     {   0,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
@@ -927,101 +940,105 @@ static const flex_int16_t yy_chk[940] =
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
+       20,   26,   19,   31,   31,   24,   32,   32,   32,   31,
+
+       39,   42,   39,   32,   35,   35,   35,   35,   40,   45,
+       44,   35,   35,   37,   37,   37,   37,   37,   42,   39,
+       37,   37,   40,   41,   43,   41,   45,   45,   47,   47,
+       48,   49,   51,   54,   55,   43,   51,   52,   54,   52,
+       53,   48,   56,   53,   57,   58,   59,   61,   49,   71,
+       59,   61,   60,   71,   62,   72,   56,   62,   55,   64,
+       64,   75,   58,   72,   77,   64,   57,   60,   74,   60,
+       67,   67,   73,   76,   73,   75,   67,   78,   74,   82,
+       79,   78,   79,   77,   84,   80,   81,   76,   80,   83,
+       81,   82,   83,   85,   89,   86,   84,   86,   88,   90,
+
+       88,   90,   91,   92,  100,   92,  104,  369,   95,  101,
+       91,   85,   87,   87,   87,   87,   89,  138,  104,   87,
+       87,   94,  100,   87,   87,   93,   93,   94,   93,   95,
+      101,   93,   96,   96,  106,  107,  138,  107,   96,  102,
+      102,  102,  102,  102,  103,  112,  102,  102,  103,  105,
+      105,  109,  111,  109,  113,  105,  111,  120,  106,  115,
+      115,  122,  113,  122,  367,  112,  114,  114,  114,  114,
+      114,  115,  120,  114,  114,  116,  116,  118,  118,  121,
+      118,  116,  117,  117,  117,  117,  117,  121,  124,  117,
+      117,  119,  119,  119,  119,  119,  124,  127,  119,  119,
+
+      123,  123,  123,  123,  123,  125,  365,  123,  123,  125,
+      126,  126,  128,  129,  129,  127,  128,  131,  131,  129,
+      133,  134,  139,  131,  136,  136,  136,  134,  137,  136,
+      141,  158,  143,  133,  143,  144,  144,  136,  179,  139,
+      142,  144,  179,  137,  140,  140,  140,  140,  140,  141,
+      158,  140,  140,  142,  146,  146,  148,  148,  149,  149,
+      146,  150,  150,  152,  152,  148,  165,  150,  164,  152,
+      154,  154,  156,  156,  149,  159,  154,  240,  156,  240,
+      159,  160,  160,  162,  162,  165,  164,  160,  168,  162,
+      167,  167,  363,  168,  169,  169,  174,  176,  176,  174,
+
+      169,  177,  177,  178,  178,  180,  181,  186,  186,  181,
+      180,  182,  182,  177,  207,  178,  187,  182,  176,  184,
+      184,  187,  207,  194,  194,  184,  188,  188,  188,  188,
+      188,  189,  189,  188,  188,  194,  359,  189,  195,  195,
+      196,  196,  201,  201,  206,  206,  196,  213,  201,  208,
+      208,  214,  214,  218,  218,  208,  225,  213,  219,  219,
+      220,  220,  225,  221,  221,  222,  222,  223,  223,  224,
+      224,  226,  226,  220,  241,  224,  241,  226,  219,  221,
+      222,  232,  232,  233,  233,  235,  235,  237,  249,  233,
+      238,  235,  238,  238,  357,  237,  237,  242,  242,  247,
+
+      247,  250,  250,  251,  251,  247,  252,  252,  253,  254,
+      254,  292,  249,  250,  265,  265,  253,  253,  258,  258,
+      251,  254,  277,  252,  258,  259,  259,  274,  274,  265,
+      292,  259,  269,  269,  269,  269,  269,  277,  284,  269,
+      269,  278,  278,  274,  279,  283,  280,  279,  279,  280,
+      280,  285,  284,  301,  283,  307,  278,  301,  285,  285,
+      288,  288,  289,  289,  293,  293,  295,  295,  302,  302,
+      293,  308,  295,  298,  298,  355,  288,  352,  307,  310,
+      310,  298,  309,  309,  311,  302,  312,  310,  319,  319,
+      313,  313,  311,  311,  312,  308,  313,  318,  309,  320,
+
+      318,  318,  320,  320,  325,  326,  327,  328,  327,  327,
+      328,  328,  330,  338,  340,  340,  342,  340,  351,  351,
+      351,  326,  354,  354,  325,  362,  330,  349,  347,  342,
+      345,  338,  343,  362,  362,  372,  372,  372,  372,  373,
+      373,  373,  374,  374,  374,  374,  375,  375,  375,  375,
+      376,  341,  376,  376,  377,  377,  377,  377,  378,  339,
+      378,  378,  379,  379,  379,  379,  380,  380,  336,  380,
+      381,  381,  381,  381,  382,  334,  382,  382,  383,  383,
+      383,  383,  384,  384,  384,  384,  385,  385,  385,  385,
+      386,  386,  386,  386,  387,  387,  387,  387,  388,  388,
+
+      388,  388,  389,  333,  389,  389,  390,  390,  390,  390,
+      391,  391,  391,  391,  392,  332,  392,  392,  393,  393,
+      393,  393,  394,  331,  394,  394,  395,  395,  395,  395,
+      396,  323,  396,  396,  397,  397,  397,  397,  398,  321,
+      398,  398,  399,  399,  399,  399,  400,  305,  400,  400,
+      401,  401,  401,  401,  402,  304,  402,  402,  403,  403,
+      403,  403,  404,  303,  404,  404,  405,  299,  405,  405,
+      406,  290,  406,  406,  407,  286,  407,  407,  408,  408,
+      408,  408,  409,  409,  409,  409,  410,  281,  410,  410,
+      411,  411,  411,  411,  412,  412,  412,  412,  413,  275,
+
+      413,  413,  414,  414,  414,  414,  415,  415,  415,  415,
+      416,  416,  416,  416,  417,  417,  417,  417,  418,  418,
+      418,  418,  419,  419,  419,  419,  420,  272,  420,  420,
+      421,  421,  421,  421,  422,  422,  422,  422,  423,  270,
+      423,  423,  424,  424,  424,  424,  425,  425,  425,  425,
+      426,  426,  426,  426,  427,  268,  427,  427,  428,  428,
+      428,  428,  429,  429,  429,  429,  430,  266,  430,  430,
+      431,  431,  431,  431,  432,  432,  432,  432,  433,  433,
+      433,  433,  434,  434,  434,  434,  435,  435,  435,  435,
+      436,  436,  436,  436,  437,  437,  437,  437,  438,  438,
+
+      438,  438,  439,  439,  439,  439,  440,  440,  440,  440,
+      441,  441,  441,  441,  442,  442,  442,  442,  256,  248,
+      245,  243,  239,  231,  217,  215,  166,  110,  108,   70,
+       36,   29,   25,   23,   17,    6,    5,    4,    3,  371,
+      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
+      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
+      371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
+      371,  371,  371,  371
     } ;
 
 #define YY_TRAILING_MASK 0x2000
@@ -1160,9 +1177,17 @@ static void setbackendtype(DiskParseContext *dpc, const char *str) {
     if (     !strcmp(str,"phy"))   DSET(dpc,backend,BACKEND,str,PHY);
     else if (!strcmp(str,"tap"))   DSET(dpc,backend,BACKEND,str,TAP);
     else if (!strcmp(str,"qdisk")) DSET(dpc,backend,BACKEND,str,QDISK);
+    else if (!strcmp(str,"other")) DSET(dpc,backend,BACKEND,str,OTHER);
     else xlu__disk_err(dpc,str,"unknown value for backendtype");
 }
 
+/* Sets ->specification from the string.  IDL should provide something for this. */
+static void setspecification(DiskParseContext *dpc, const char *str) {
+    if      (!strcmp(str,"xen"))    DSET(dpc,specification,SPECIFICATION,str,XEN);
+    else if (!strcmp(str,"virtio")) DSET(dpc,specification,SPECIFICATION,str,VIRTIO);
+    else xlu__disk_err(dpc,str,"unknown value for specification");
+}
+
 /* Sets ->colo-port from the string.  COLO need this. */
 static void setcoloport(DiskParseContext *dpc, const char *str) {
     int port = atoi(str);
@@ -1199,9 +1224,9 @@ static int vdev_and_devtype(DiskParseContext *dpc, char *str) {
 #undef DPC /* needs to be defined differently the actual lexer */
 #define DPC ((DiskParseContext*)yyextra)
 
-#line 1202 "libxlu_disk_l.c"
+#line 1227 "libxlu_disk_l.c"
 
-#line 1204 "libxlu_disk_l.c"
+#line 1229 "libxlu_disk_l.c"
 
 #define INITIAL 0
 #define LEXERR 1
@@ -1477,13 +1502,13 @@ YY_DECL
 		}
 
 	{
-#line 177 "libxlu_disk_l.l"
+#line 185 "libxlu_disk_l.l"
 
 
-#line 180 "libxlu_disk_l.l"
+#line 188 "libxlu_disk_l.l"
  /*----- the scanner rules which do the parsing -----*/
 
-#line 1486 "libxlu_disk_l.c"
+#line 1511 "libxlu_disk_l.c"
 
 	while ( /*CONSTCOND*/1 )		/* loops until end-of-file is reached */
 		{
@@ -1515,14 +1540,14 @@ yy_match:
 			while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 				{
 				yy_current_state = (int) yy_def[yy_current_state];
-				if ( yy_current_state >= 355 )
+				if ( yy_current_state >= 372 )
 					yy_c = yy_meta[yy_c];
 				}
 			yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
 			*yyg->yy_state_ptr++ = yy_current_state;
 			++yy_cp;
 			}
-		while ( yy_current_state != 354 );
+		while ( yy_current_state != 371 );
 
 yy_find_action:
 		yy_current_state = *--yyg->yy_state_ptr;
@@ -1572,152 +1597,158 @@ do_action:	/* This label is used only to access EOF actions. */
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
+{ STRIP(','); setspecification(DPC,FROMEQUALS); }
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
@@ -1731,65 +1762,65 @@ YY_RULE_SETUP
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
 
@@ -1816,27 +1847,27 @@ YY_RULE_SETUP
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
+#line 1870 "libxlu_disk_l.c"
 			case YY_STATE_EOF(INITIAL):
 			case YY_STATE_EOF(LEXERR):
 				yyterminate();
@@ -2104,7 +2135,7 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 		while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 			{
 			yy_current_state = (int) yy_def[yy_current_state];
-			if ( yy_current_state >= 355 )
+			if ( yy_current_state >= 372 )
 				yy_c = yy_meta[yy_c];
 			}
 		yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
@@ -2128,11 +2159,11 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 	while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 		{
 		yy_current_state = (int) yy_def[yy_current_state];
-		if ( yy_current_state >= 355 )
+		if ( yy_current_state >= 372 )
 			yy_c = yy_meta[yy_c];
 		}
 	yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
-	yy_is_jam = (yy_current_state == 354);
+	yy_is_jam = (yy_current_state == 371);
 	if ( ! yy_is_jam )
 		*yyg->yy_state_ptr++ = yy_current_state;
 
@@ -2941,4 +2972,4 @@ void yyfree (void * ptr , yyscan_t yyscanner)
 
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
index 3bd639a..47b8ee0 100644
--- a/tools/libs/util/libxlu_disk_l.l
+++ b/tools/libs/util/libxlu_disk_l.l
@@ -122,9 +122,17 @@ static void setbackendtype(DiskParseContext *dpc, const char *str) {
     if (     !strcmp(str,"phy"))   DSET(dpc,backend,BACKEND,str,PHY);
     else if (!strcmp(str,"tap"))   DSET(dpc,backend,BACKEND,str,TAP);
     else if (!strcmp(str,"qdisk")) DSET(dpc,backend,BACKEND,str,QDISK);
+    else if (!strcmp(str,"other")) DSET(dpc,backend,BACKEND,str,OTHER);
     else xlu__disk_err(dpc,str,"unknown value for backendtype");
 }
 
+/* Sets ->specification from the string.  IDL should provide something for this. */
+static void setspecification(DiskParseContext *dpc, const char *str) {
+    if      (!strcmp(str,"xen"))    DSET(dpc,specification,SPECIFICATION,str,XEN);
+    else if (!strcmp(str,"virtio")) DSET(dpc,specification,SPECIFICATION,str,VIRTIO);
+    else xlu__disk_err(dpc,str,"unknown value for specification");
+}
+
 /* Sets ->colo-port from the string.  COLO need this. */
 static void setcoloport(DiskParseContext *dpc, const char *str) {
     int port = atoi(str);
@@ -192,6 +200,7 @@ devtype=[^,]*,?	{ xlu__disk_err(DPC,yytext,"unknown value for type"); }
 access=[^,]*,?	{ STRIP(','); setaccess(DPC, FROMEQUALS); }
 backend=[^,]*,? { STRIP(','); SAVESTRING("backend", backend_domname, FROMEQUALS); }
 backendtype=[^,]*,? { STRIP(','); setbackendtype(DPC,FROMEQUALS); }
+specification=[^,]*,? { STRIP(','); setspecification(DPC,FROMEQUALS); }
 
 vdev=[^,]*,?	{ STRIP(','); SAVESTRING("vdev", vdev, FROMEQUALS); }
 script=[^,]*,?	{ STRIP(','); SAVESTRING("script", script, FROMEQUALS); }
diff --git a/tools/xl/xl_block.c b/tools/xl/xl_block.c
index 70eed43..f2b0ff5 100644
--- a/tools/xl/xl_block.c
+++ b/tools/xl/xl_block.c
@@ -50,6 +50,11 @@ int main_blockattach(int argc, char **argv)
         return 0;
     }
 
+    if (disk.specification != LIBXL_DISK_SPECIFICATION_XEN) {
+        fprintf(stderr, "block-attach is only supported for specification xen\n");
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
+    if (disk.specification != LIBXL_DISK_SPECIFICATION_XEN) {
+        fprintf(stderr, "block-detach is only supported for specification xen\n");
+        return 1;
+    }
+
     rc = !force ? libxl_device_disk_safe_remove(ctx, domid, &disk, 0) :
         libxl_device_disk_destroy(ctx, domid, &disk, 0);
     if (rc) {
-- 
2.7.4


