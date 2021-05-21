Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B99DE38CE5B
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 21:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131364.245579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkB6I-0004II-2q; Fri, 21 May 2021 19:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131364.245579; Fri, 21 May 2021 19:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lkB6H-0004G7-Uz; Fri, 21 May 2021 19:46:25 +0000
Received: by outflank-mailman (input) for mailman id 131364;
 Fri, 21 May 2021 19:46:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08+4=KQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1lkB6G-0003wW-1r
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 19:46:24 +0000
Received: from mail-lj1-x235.google.com (unknown [2a00:1450:4864:20::235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b02ae27-e08b-4dfa-ba9c-fc82f431d312;
 Fri, 21 May 2021 19:46:14 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id e2so18974636ljk.4
 for <xen-devel@lists.xenproject.org>; Fri, 21 May 2021 12:46:14 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y15sm737337lje.74.2021.05.21.12.46.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 May 2021 12:46:11 -0700 (PDT)
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
X-Inumbo-ID: 9b02ae27-e08b-4dfa-ba9c-fc82f431d312
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sLzorQewo0N9P2yCwHLr70sAQFdfDtLleH6gHzW+iyU=;
        b=jkZjrxFO4WZ0HPjy+Otbsw14pHrQ3btnUlwq+XA7V2QJ/sgeBQB3OUJjZl5vYRNhXl
         hlvPCMkPNmLYH1Vlo0UR6xhIiLNqz3mAvUH5ux5PqHhSK235CS2aOg0vdPfcaG5C5kNZ
         R2F49/LMBeW+VvQQLwNiNgJYuQDOCY96yReUYWmkAvOrpyxfZwbzOEiXc6KrgvbiU8KN
         CHNGGAR5LtidBGzh2rBP4pEL/5bDNVCodvx6XWmoQk56MkmIoZQyRF980Lnb7XVoNJcR
         iIYxfZU9AK8XloPMZyuQt3yOIBmiqN5CVpywukS/41Yf1U3fchoQxdYdf7pACre412CB
         b0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sLzorQewo0N9P2yCwHLr70sAQFdfDtLleH6gHzW+iyU=;
        b=b2KjXRbmJZr3KxcT/DGG3NAkYnpZF8K3i1qw70orxs+5UncjstfIv9ssB+LWEpf+fQ
         VFXcXoTpOiHPz5D85LBTJU4oDt6/GhYiuJ38DIjC9ZWGmFKYpuyebpcmrnvx+G3oW3XU
         j4sqOWZknefimYVcCgkxMcFRupqlfwISmcTaAm0OJG+nC1ZR9I87mQUGLL90vLyFhOx5
         engtorc4F1zdLaqNzX4Rl64EQTJ2ksejf/2vvArGW2oh7DC5f4dTAu2ilMpLjcjzBw1c
         z2yUuV624IEvFuiJJIl9qYlZf9Vo9arKAWkCEzBZtkvKdIEDzlswQypPQy7xAR7bmBs3
         1IjQ==
X-Gm-Message-State: AOAM533oL5lpjQ61jUqzAELOkQ8rRsZnN0EjAHfNU1bUE+44Vw9zLbtv
	PjqUVCvBfaxcOtGgPMJuNA5EotFIxo7kdg==
X-Google-Smtp-Source: ABdhPJxCB1p3O2tD3jiPVfo1H0nqyfIYFgkEfZU8+fkNM9CTnSapxZjIPnVyXiw2nhTiVt4+9rhZoA==
X-Received: by 2002:a2e:1405:: with SMTP id u5mr7797367ljd.137.1621626371954;
        Fri, 21 May 2021 12:46:11 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RESEND PATCH V5 1/2] libxl: Add support for Virtio disk configuration
Date: Fri, 21 May 2021 22:46:00 +0300
Message-Id: <1621626361-29076-2-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621626361-29076-1-git-send-email-olekstysh@gmail.com>
References: <1621626361-29076-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch adds basic support for configuring and assisting virtio-disk
backend (emualator) which is intended to run out of Qemu and could be
run in any domain.
Although the Virtio block device is quite different from traditional
Xen PV block device (vbd) from the toolstack point of view:
 - the frontend is virtio-blk which is not a Xenbus driver, so nothing
   written to Xenstore are fetched by the frontend (the vdev is not
   passed to the frontend, etc)
 - the ring-ref/event-channel are not used for the backend<->frontend
   communication, the proposed IPC for Virtio is IOREQ/DM
it is still a "block device" and ought to be integrated in existing
"disk" handling. So, re-use (and adapt) "disk" parsing/configuration
logic to deal with Virtio devices as well.

Besides introducing new disk backend type (LIBXL_DISK_BACKEND_VIRTIO)
introduce new device kind (LIBXL__DEVICE_KIND_VIRTIO_DISK) as current
one (LIBXL__DEVICE_KIND_VBD) doesn't fit into Virtio disk model.

In order to inform the toolstack that Virtio disk needs to be used
extend "disk" configuration by introducing new "virtio" flag.
An example of domain configuration:
disk = [ 'backend=DomD, phy:/dev/mmcblk1p3, xvda1, rw, virtio' ]

Please note, this patch is not enough for virtio-disk to work
on Xen (Arm), as for every Virtio device (including disk) we need
to allocate Virtio MMIO params (IRQ and memory region) and pass
them to the backend, also update Guest device-tree with the allocated
params. The subsequent patch will add these missing bits.
For the current patch, the default "irq" and "base" are just written
to the Xenstore.

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
---
---
 docs/man/xl-disk-configuration.5.pod.in   |  27 +
 tools/include/libxl.h                     |   6 +
 tools/libs/light/libxl_device.c           |  38 +-
 tools/libs/light/libxl_disk.c             |  99 +++-
 tools/libs/light/libxl_types.idl          |   4 +
 tools/libs/light/libxl_types_internal.idl |   1 +
 tools/libs/light/libxl_utils.c            |   2 +
 tools/libs/util/libxlu_disk_l.c           | 881 +++++++++++++++---------------
 tools/libs/util/libxlu_disk_l.h           |   2 +-
 tools/libs/util/libxlu_disk_l.l           |   1 +
 tools/xl/xl_block.c                       |  11 +
 11 files changed, 626 insertions(+), 446 deletions(-)

diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-configuration.5.pod.in
index 71d0e86..9cc189f 100644
--- a/docs/man/xl-disk-configuration.5.pod.in
+++ b/docs/man/xl-disk-configuration.5.pod.in
@@ -344,8 +344,35 @@ can be used to disable "hole punching" for file based backends which
 were intentionally created non-sparse to avoid fragmentation of the
 file.
 
+=item B<virtio>
+
+=over 4
+
+=item Description
+
+Enables experimental Virtio support for disk
+
+=item Supported values
+
+absent, present
+
+=item Mandatory
+
+No
+
+=item Default value
+
+absent
+
 =back
 
+Besides forcing toolstack to use specific Xen Virtio backend implementation
+(for example, virtio-disk), this also affects the guest's view of the device
+and requires virtio-blk driver to be used.
+Please note, the virtual device (vdev) is not passed to the guest in that case,
+but it still must be specified for the internal purposes.
+
+=back
 
 =head1 COLO Parameters
 
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index ae7fe27..58e14e6 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -503,6 +503,12 @@
 #define LIBXL_HAVE_X86_MSR_RELAXED 1
 
 /*
+ * LIBXL_HAVE_DEVICE_DISK_VIRTIO indicates that a 'virtio' field
+ * (of boolean type) is present in libxl_device_disk.
+ */
+#define LIBXL_HAVE_DEVICE_DISK_VIRTIO 1
+
+/*
  * libxl ABI compatibility
  *
  * The only guarantee which libxl makes regarding ABI compatibility
diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index 36c4e41..7c8cb53 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -292,6 +292,9 @@ static int disk_try_backend(disk_try_backend_args *a,
     /* returns 0 (ie, DISK_BACKEND_UNKNOWN) on failure, or
      * backend on success */
 
+    if (a->disk->virtio && backend != LIBXL_DISK_BACKEND_VIRTIO)
+        goto bad_virtio;
+
     switch (backend) {
     case LIBXL_DISK_BACKEND_PHY:
         if (a->disk->format != LIBXL_DISK_FORMAT_RAW) {
@@ -329,6 +332,29 @@ static int disk_try_backend(disk_try_backend_args *a,
         if (a->disk->script) goto bad_script;
         return backend;
 
+    case LIBXL_DISK_BACKEND_VIRTIO:
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
+        LOG(DEBUG, "Disk vdev=%s, backend virtio unsuitable as phys path not a "
+                   "block device", a->disk->vdev);
+        return 0;
+
     default:
         LOG(DEBUG, "Disk vdev=%s, backend %d unknown", a->disk->vdev, backend);
         return 0;
@@ -352,6 +378,11 @@ static int disk_try_backend(disk_try_backend_args *a,
     LOG(DEBUG, "Disk vdev=%s, backend %s not compatible with colo",
         a->disk->vdev, libxl_disk_backend_to_string(backend));
     return 0;
+
+ bad_virtio:
+    LOG(DEBUG, "Disk vdev=%s, backend %s not compatible with virtio",
+        a->disk->vdev, libxl_disk_backend_to_string(backend));
+    return 0;
 }
 
 int libxl__backendpath_parse_domid(libxl__gc *gc, const char *be_path,
@@ -392,7 +423,8 @@ int libxl__device_disk_set_backend(libxl__gc *gc, libxl_device_disk *disk) {
         }
         memset(&a.stab, 0, sizeof(a.stab));
     } else if ((disk->backend == LIBXL_DISK_BACKEND_UNKNOWN ||
-                disk->backend == LIBXL_DISK_BACKEND_PHY) &&
+                disk->backend == LIBXL_DISK_BACKEND_PHY ||
+                disk->backend == LIBXL_DISK_BACKEND_VIRTIO) &&
                disk->backend_domid == LIBXL_TOOLSTACK_DOMID &&
                !disk->script) {
         if (stat(disk->pdev_path, &a.stab)) {
@@ -408,7 +440,8 @@ int libxl__device_disk_set_backend(libxl__gc *gc, libxl_device_disk *disk) {
         ok=
             disk_try_backend(&a, LIBXL_DISK_BACKEND_PHY) ?:
             disk_try_backend(&a, LIBXL_DISK_BACKEND_QDISK) ?:
-            disk_try_backend(&a, LIBXL_DISK_BACKEND_TAP);
+            disk_try_backend(&a, LIBXL_DISK_BACKEND_TAP) ?:
+            disk_try_backend(&a, LIBXL_DISK_BACKEND_VIRTIO);
         if (ok)
             LOG(DEBUG, "Disk vdev=%s, using backend %s",
                        disk->vdev,
@@ -441,6 +474,7 @@ char *libxl__device_disk_string_of_backend(libxl_disk_backend backend)
         case LIBXL_DISK_BACKEND_QDISK: return "qdisk";
         case LIBXL_DISK_BACKEND_TAP: return "phy";
         case LIBXL_DISK_BACKEND_PHY: return "phy";
+        case LIBXL_DISK_BACKEND_VIRTIO: return "virtio_disk";
         default: return NULL;
     }
 }
diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index 411ffea..4332dab 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -174,6 +174,16 @@ static int libxl__device_disk_setdefault(libxl__gc *gc, uint32_t domid,
         disk->backend = LIBXL_DISK_BACKEND_QDISK;
     }
 
+    /* Force virtio_disk backend for Virtio devices */
+    if (disk->virtio) {
+        if (!(disk->backend == LIBXL_DISK_BACKEND_VIRTIO ||
+              disk->backend == LIBXL_DISK_BACKEND_UNKNOWN)) {
+            LOGD(ERROR, domid, "Backend for Virtio devices on must be virtio_disk");
+            return ERROR_FAIL;
+        }
+        disk->backend = LIBXL_DISK_BACKEND_VIRTIO;
+    }
+
     rc = libxl__device_disk_set_backend(gc, disk);
     return rc;
 }
@@ -204,6 +214,9 @@ static int libxl__device_from_disk(libxl__gc *gc, uint32_t domid,
         case LIBXL_DISK_BACKEND_QDISK:
             device->backend_kind = LIBXL__DEVICE_KIND_QDISK;
             break;
+        case LIBXL_DISK_BACKEND_VIRTIO:
+            device->backend_kind = LIBXL__DEVICE_KIND_VIRTIO_DISK;
+            break;
         default:
             LOGD(ERROR, domid, "Unrecognized disk backend type: %d",
                  disk->backend);
@@ -212,7 +225,8 @@ static int libxl__device_from_disk(libxl__gc *gc, uint32_t domid,
 
     device->domid = domid;
     device->devid = devid;
-    device->kind  = LIBXL__DEVICE_KIND_VBD;
+    device->kind = disk->backend == LIBXL_DISK_BACKEND_VIRTIO ?
+        LIBXL__DEVICE_KIND_VIRTIO_DISK : LIBXL__DEVICE_KIND_VBD;
 
     return 0;
 }
@@ -330,7 +344,17 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
 
                 assert(device->backend_kind == LIBXL__DEVICE_KIND_VBD);
                 break;
+            case LIBXL_DISK_BACKEND_VIRTIO:
+                dev = disk->pdev_path;
+
+                flexarray_append(back, "params");
+                flexarray_append(back, dev);
 
+                flexarray_append_pair(back, "base", GCSPRINTF("%lu", disk->base));
+                flexarray_append_pair(back, "irq", GCSPRINTF("%u", disk->irq));
+
+                assert(device->backend_kind == LIBXL__DEVICE_KIND_VIRTIO_DISK);
+                break;
             case LIBXL_DISK_BACKEND_TAP:
                 LOG(ERROR, "blktap is not supported");
                 rc = ERROR_FAIL;
@@ -532,6 +556,26 @@ static int libxl__disk_from_xenstore(libxl__gc *gc, const char *libxl_path,
     }
     libxl_string_to_backend(ctx, tmp, &(disk->backend));
 
+    if (disk->backend == LIBXL_DISK_BACKEND_VIRTIO) {
+        disk->virtio = true;
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
@@ -575,6 +619,41 @@ cleanup:
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
@@ -588,10 +667,12 @@ int libxl_vdev_to_device_disk(libxl_ctx *ctx, uint32_t domid,
 
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
@@ -605,16 +686,19 @@ int libxl_device_disk_getinfo(libxl_ctx *ctx, uint32_t domid,
     char *fe_path, *libxl_path;
     char *val;
     int rc;
+    libxl__device_kind kind;
 
     diskinfo->backend = NULL;
 
     diskinfo->devid = libxl__device_disk_dev_number(disk->vdev, NULL, NULL);
 
-    /* tap devices entries in xenstore are written as vbd devices. */
+    /* tap devices entries in xenstore are written as vbd/virtio_disk devices. */
+    kind = disk->backend == LIBXL_DISK_BACKEND_VIRTIO ?
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
@@ -1375,6 +1459,7 @@ LIBXL_DEFINE_DEVICE_LIST(disk)
 #define libxl__device_disk_update_devid NULL
 
 DEFINE_DEVICE_TYPE_STRUCT(disk, VBD, disks,
+    .get_path    = libxl_device_disk_get_path,
     .merge       = libxl_device_disk_merge,
     .dm_needed   = libxl_device_disk_dm_needed,
     .from_xenstore = (device_from_xenstore_fn_t)libxl__disk_from_xenstore,
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index f45addd..d513dde 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -130,6 +130,7 @@ libxl_disk_backend = Enumeration("disk_backend", [
     (1, "PHY"),
     (2, "TAP"),
     (3, "QDISK"),
+    (4, "VIRTIO"),
     ])
 
 libxl_nic_type = Enumeration("nic_type", [
@@ -699,6 +700,9 @@ libxl_device_disk = Struct("device_disk", [
     ("is_cdrom", integer),
     ("direct_io_safe", bool),
     ("discard_enable", libxl_defbool),
+    ("virtio", bool),
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
index 4699c4a..fa406de 100644
--- a/tools/libs/light/libxl_utils.c
+++ b/tools/libs/light/libxl_utils.c
@@ -304,6 +304,8 @@ int libxl_string_to_backend(libxl_ctx *ctx, char *s, libxl_disk_backend *backend
         *backend = LIBXL_DISK_BACKEND_TAP;
     } else if (!strcmp(s, "qdisk")) {
         *backend = LIBXL_DISK_BACKEND_QDISK;
+    } else if (!strcmp(s, "virtio_disk")) {
+        *backend = LIBXL_DISK_BACKEND_VIRTIO;
     } else if (!strcmp(s, "tap")) {
         p = strchr(s, ':');
         if (!p) {
diff --git a/tools/libs/util/libxlu_disk_l.c b/tools/libs/util/libxlu_disk_l.c
index 32d4b74..7abc699 100644
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
+static const flex_int16_t yy_acclist[583] =
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
+     8220, 8225,   34,16412,16417,   34,   34,   34,   34,   34,
+
+       34,   29, 8225,   34,   29, 8225,   34,   29,   34,   29,
+     8225,   34,    3,   34,   16,   34,   34,   34,   34,   34,
+       31, 8225,   34,16417,   34,   34,   34, 8218, 8225,   34,
+     8218, 8225,   34, 8218,   34, 8218, 8225,   34,   34,   32,
+     8225,   34,   32, 8225,   34,   32,   34,   32, 8225, 8217,
+     8225,   34, 8217, 8225,   34, 8217,   34, 8217, 8225,   34,
+     8220, 8225,   34, 8220, 8225,   34, 8220,   34, 8220, 8225,
+       34,   34,   10,   34,   34,   34,   29, 8225,   34,   29,
+     8225,   34,   29, 8225,   29,   34,   29,   34,    3,   34,
+       34,   34,   34,   34,   34,   34,   31, 8225,   34,   31,
+
+     8225,   34,   31,   34,   31, 8225,   34,   34,   30, 8225,
+       34,16417, 8218, 8225,   34, 8218, 8225,   34, 8218, 8225,
+     8218,   34, 8218,   34,   34,   32, 8225,   34,   32, 8225,
+       34,   32, 8225,   32,   34,   32, 8217, 8225,   34, 8217,
+     8225,   34, 8217, 8225, 8217,   34, 8217,   34, 8220, 8225,
+       34, 8220, 8225,   34, 8220, 8225, 8220,   34, 8220,   34,
+       34,   10,   24,   10,   15,   34,    7,   34,   34,   34,
+       34,   34,   34,   34,   13,   34,   31, 8225,   34,   31,
+     8225,   34,   31, 8225,   31,   34,   31,    2,   34,   30,
+     8225,   34,   30, 8225,   34,   30,   34,   30, 8225,   17,
+
+       34,   34,   11,   34,   23,   10,   10,   24,   15,   34,
+        7,   24,    7,   34,    8,   34,   34,   34,   34,    6,
+       34,   13,   34,    2,   24,    2,   34,   30, 8225,   34,
+       30, 8225,   34,   30, 8225,   30,   34,   30,   17,   34,
+       34,   11,   24,   11,   27, 8225,   34,16417,   23,   24,
+       23,    7,    7,   24,   34,    8,   24,    8,   34,   34,
+       34,   34,    6,   24,    6,    6,   24,    6,   24,   34,
+        2,    2,   24,   34,   34,   11,   11,   24,   27, 8225,
+       34,   27, 8225,   34,   27,   34,   27, 8225,   23,   24,
+       34,    8,    8,   24,   34,   34,   18,   19,    6,    6,
+
+       24,    6,    6,   34,   34,   14,   34,   27, 8225,   34,
+       27, 8225,   34,   27, 8225,   27,   34,   27,   34,   34,
+       34,   18,   24,   18,   19,   24,   19,    6,    6,   34,
+       34,   14,   34,   21,    9,   20,   18,   18,   24,   19,
+       19,   24,    6,    5,    6,   34,   22,   21,   24,   21,
+        9,   24,    9,   20,   24,   20,    4,    6,    5,    6,
+       34,   22,   24,   22,   21,   21,   24,    9,    9,   24,
+       20,   20,   24,    4,    6,   12,   34,   22,   22,   24,
+       12,   34
     } ;
 
-static const flex_int16_t yy_accept[356] =
+static const flex_int16_t yy_accept[362] =
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
+      169,  170,  171,  172,  177,  178,  179,  183,  184,  189,
+      190,  191,  196,  197,  198,  199,  200,  201,  202,  205,
+      208,  210,  212,  213,  215,  217,  218,  219,  220,  221,
+      225,  226,  227,  228,  231,  234,  236,  238,  239,  240,
+      243,  246,  248,  250,  253,  256,  258,  260,  261,  264,
+      267,  269,  271,  272,  273,  274,  275,  276,  277,  280,
+      283,  285,  287,  288,  289,  291,  292,  293,  294,  295,
+      296,  297,  300,  303,  305,  307,  308,  309,  313,  316,
+      319,  321,  323,  324,  325,  326,  329,  332,  334,  336,
+
+      337,  340,  343,  345,  347,  348,  349,  352,  355,  357,
+      359,  360,  361,  362,  364,  365,  367,  368,  369,  370,
+      371,  372,  373,  374,  375,  377,  380,  383,  385,  387,
+      388,  389,  390,  393,  396,  398,  400,  402,  403,  404,
+      405,  406,  407,  409,  411,  413,  414,  415,  416,  417,
+      418,  419,  420,  421,  422,  424,  426,  427,  428,  431,
+      434,  436,  438,  439,  441,  442,  444,  445,  449,  451,
+      452,  453,  455,  456,  458,  459,  460,  461,  462,  463,
+      465,  466,  468,  470,  471,  472,  474,  475,  476,  477,
+      479,  482,  485,  487,  489,  491,  492,  493,  495,  496,
+
+      497,  498,  499,  500,  502,  503,  504,  505,  506,  508,
+      511,  514,  516,  518,  519,  520,  521,  522,  524,  525,
+      527,  528,  529,  530,  531,  532,  534,  535,  536,  537,
+      538,  540,  541,  543,  544,  546,  547,  548,  550,  551,
+      553,  554,  556,  557,  559,  561,  562,  564,  565,  566,
+      568,  569,  571,  572,  574,  576,  578,  579,  581,  583,
+      583
     } ;
 
 static const YY_CHAR yy_ec[256] =
@@ -708,216 +710,217 @@ static const YY_CHAR yy_meta[35] =
         1,    1,    1,    1
     } ;
 
-static const flex_int16_t yy_base[424] =
+static const flex_int16_t yy_base[430] =
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
+        0,    0,  912,  911,  913,  908,   33,   36,  916,  916,
+       45,   63,   31,   42,   51,   52,  901,   33,   65,   67,
+       69,   70,  900,   71,  899,   77,    0,  916,  904,  916,
+       93,   96,    0,    0,  105,  897,  114,    0,   91,  100,
+      115,   94,  116,  101,  102,   48,   74,  118,  121,  123,
+       78,  128,  131,  137,  124,  125,  133,  135,  136,  140,
+      142,  141,    0,  163,    0,    0,  166,    0,    0,  902,
+      143,  146,  163,  164,  166,  167,  149,  169,  170,  175,
+      179,  176,  182,  177,  184,  192,  212,  193,  186,  196,
+      187,  219,  201,  150,  199,  227,    0,    0,  916,  209,
+
+      212,  243,  224,  213,  245,  223,  198,  895,  231,  894,
+      244,  230,  243,  261,  255,  259,  279,  266,  288,  275,
+      291,  301,  268,  284,  298,  301,  285,  302,  311,    0,
+      314,    0,  311,  318,  916,  312,  317,  246,  232,  342,
+      320,  325,  323,  349,    0,  351,    0,  344,  349,  360,
+        0,  363,    0,  367,    0,  370,    0,  330,  377,    0,
+      379,    0,  365,  358,  899,  368,  329,  331,  381,    0,
+        0,    0,    0,  381,  916,  383,  385,  387,  391,  397,
+      393,  409,    0,  411,    0,  412,  414,  424,  427,    0,
+        0,    0,    0,  422,  425,  436,    0,    0,    0,    0,
+
+      438,    0,    0,    0,    0,  434,  445,    0,    0,    0,
+        0,  440,  442,  898,  916,  400,  897,  443,  448,  449,
+      451,  453,  458,  457,  413,  469,    0,    0,    0,    0,
+      896,  469,  480,    0,  482,    0,  483,  480,  895,  489,
+      497,  894,  916,  916,  851,  916,  490,  839,  478,  492,
+      494,  497,  507,  501,  916,  823,  916,  509,  525,    0,
+        0,    0,    0,  916,  505,  811,  916,  534,  783,    0,
+      771,  916,  518,  759,  916,  523,  528,  538,  540,  755,
+      916,  511,  540,  549,  751,  916,  544,  547,  747,  916,
+      560,    0,  562,    0,    0,  555,  739,  916,  484,  561,
+
+      731,  723,  715,  916,  449,  566,  564,  566,  576,  578,
+        0,    0,    0,    0,  584,  574,  586,  707,  916,  699,
+      916,  581,  587,  590,  597,  916,  687,  659,  652,  643,
+      916,  635,  916,  597,  616,  599,  614,  604,  916,  600,
+      916,  541,  916,  467,  916,  603,  455,  916,  404,  916,
+      385,  916,  328,  916,  916,  609,  203,  916,  916,  916,
+      622,  626,  629,  633,  637,  641,  645,  649,  653,  657,
+      661,  665,  669,  673,  677,  681,  685,  689,  693,  697,
+      701,  705,  709,  713,  717,  721,  725,  729,  733,  737,
+      741,  745,  749,  753,  757,  761,  765,  769,  773,  777,
+
+      781,  785,  789,  793,  797,  801,  805,  809,  813,  817,
+      821,  825,  829,  833,  837,  841,  845,  849,  853,  857,
+      861,  865,  869,  873,  877,  881,  885,  889,  893
     } ;
 
-static const flex_int16_t yy_def[424] =
+static const flex_int16_t yy_def[430] =
     {   0,
-      354,    1,  355,  355,  354,  356,  357,  357,  354,  354,
-      358,  358,   12,   12,   12,   12,   12,   12,   12,   12,
-       12,   12,   12,   12,   12,   12,  359,  354,  356,  354,
-      360,  357,  361,  361,  362,   12,  356,  363,   12,   12,
+      360,    1,  361,  361,  360,  362,  363,  363,  360,  360,
+      364,  364,   12,   12,   12,   12,   12,   12,   12,   12,
+       12,   12,   12,   12,   12,   12,  365,  360,  362,  360,
+      366,  363,  367,  367,  368,   12,  362,  369,   12,   12,
        12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
        12,   12,   12,   12,   12,   12,   12,   12,   12,   12,
-       12,  359,  360,  361,  361,  364,  365,  365,  354,   12,
+       12,   12,  365,  366,  367,  367,  370,  371,  371,  360,
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
+       12,   12,   12,   12,   12,   12,  368,   12,   12,   12,
+       12,   12,   12,   12,   12,  370,  371,  371,  360,   12,
+
+       12,  372,   12,   12,   12,   12,   12,   12,   12,   12,
+       12,   12,   12,  373,   87,   87,  374,   12,  375,   12,
+       12,  376,   12,   12,   12,   12,   12,   12,  377,  378,
+      372,  378,   12,   12,  360,   87,   12,   12,   12,  379,
+       12,   12,   12,  380,  381,  373,  381,   87,   87,  382,
+      383,  374,  383,  384,  385,  375,  385,   12,  386,  387,
+      376,  387,   12,   12,  388,   12,   12,   12,  377,  378,
+      378,  389,  389,   12,  360,   87,   87,   87,   12,   12,
+       12,  390,  391,  379,  391,   12,   12,  392,  380,  381,
+      381,  393,  393,   87,   87,  382,  383,  383,  394,  394,
+
+      384,  385,  385,  395,  395,   12,  386,  387,  387,  396,
+      396,   12,   12,  397,  360,   12,  398,   87,   12,   87,
+       87,   87,   12,   87,   12,  390,  391,  391,  399,  399,
+      400,   87,  401,  402,  392,  402,   87,   87,  403,   12,
+      404,  397,  360,  360,  405,  360,   87,  406,   12,   87,
+       87,   87,  407,   87,  360,  408,  360,   87,  401,  402,
+      402,  409,  409,  360,   87,  410,  360,  411,  412,  412,
+      405,  360,   87,  413,  360,   12,   87,   87,   87,  414,
+      360,  414,  414,   87,  408,  360,   87,   87,  410,  360,
+      415,  416,  411,  416,  412,   87,  413,  360,   12,   87,
+
+      417,  418,  414,  360,  414,  414,   87,   87,   87,  415,
+      416,  416,  419,  419,   87,   12,   87,  420,  360,  421,
+      360,  414,  414,   87,   87,  360,  422,  423,  424,  420,
+      360,  421,  360,  414,  414,   87,  425,  426,  360,  427,
+      360,  428,  360,  414,  360,   87,  429,  360,  426,  360,
+      427,  360,  428,  360,  360,   87,  429,  360,  360,    0,
+      360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
+      360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
+      360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
+      360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
+
+      360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
+      360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
+      360,  360,  360,  360,  360,  360,  360,  360,  360
     } ;
 
-static const flex_int16_t yy_nxt[940] =
+static const flex_int16_t yy_nxt[951] =
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
+       36,   56,   58,   36,   53,   55,   36,   36,   51,   60,
+       54,   84,   52,   61,   62,   29,   65,   32,   32,   33,
+
+       36,   66,   71,   36,   34,   29,   29,   29,   30,   36,
+       36,   36,   29,   38,   67,   67,   67,   68,   67,   72,
+       75,   67,   69,   73,   36,   36,   74,   36,   78,   79,
+       36,   77,   36,   36,   36,   83,   76,   36,   81,   85,
+       36,   87,   36,   86,   36,   36,   36,   82,   89,   36,
+       36,   36,   36,   94,   90,   36,  100,   88,   36,   36,
+       92,   91,   93,  101,   90,   29,   65,   95,   29,   97,
+      102,   66,   36,   36,   98,   36,   36,  106,   36,   36,
+      125,  108,  107,  103,   36,   36,   36,   86,   36,  104,
+      105,   36,  109,   36,  111,   36,   36,  110,  112,  114,
+
+      117,   36,   36,  119,  120,   36,  348,   36,   36,  138,
+       36,  113,   29,   29,   29,   30,  124,  118,   36,   29,
+       38,   36,   36,  115,  116,  121,  122,  126,   36,   29,
+       97,  123,   36,   36,  134,   98,  127,  133,  140,   36,
+       36,   36,  128,  129,  129,   67,  130,  129,  135,  136,
+      129,  132,   36,   36,   36,   36,  137,  142,  181,  143,
+       86,  144,  144,   67,  145,  144,   35,   35,  144,  147,
+       35,   35,   90,  119,  180,   36,  149,   36,  148,  150,
+      150,   67,  151,  150,   36,  163,  150,  153,  154,  154,
+       67,  155,  154,   36,   36,  154,  157,  164,  122,  158,
+
+       36,  159,  159,   67,  160,  159,  165,   36,  159,  162,
+       36,   36,  167,   29,  170,  168,   29,  172,  166,  171,
+       36,  175,  173,   35,   35,  176,   36,   36,  177,   36,
+      188,  343,   36,  174,   36,  218,  178,  217,   36,   36,
+       36,  179,  182,  182,   67,  183,  182,  187,  186,  182,
+      185,   29,  190,   29,  192,   35,   35,  191,  206,  193,
+       35,   35,   29,  197,  194,   29,  199,   36,  198,   29,
+      202,  200,   29,  204,   36,  203,  195,   36,  205,   29,
+      208,   29,  210,   29,  170,  209,  213,  211,  341,  171,
+       36,  216,  212,  219,   35,   35,   35,   35,   35,   35,
+
+       36,  224,   36,  244,  223,  225,   36,  339,  221,   36,
+      222,   29,  227,   29,  229,  220,  255,  228,  232,  230,
+      231,   36,   36,   36,  233,  233,   67,  234,  233,   29,
+      190,  233,  236,   35,   35,  191,  238,   35,   29,  197,
+       29,  202,  239,   36,  198,  237,  203,   29,  208,   36,
+      241,   36,  281,  209,   35,  247,  248,   36,  358,  240,
+       35,   35,   35,   35,   35,   35,  253,   36,   35,   35,
+      355,   29,  227,  250,  254,  322,  249,  228,  251,  252,
+       35,  258,   29,  260,   29,  262,  264,   36,  261,  265,
+      263,   35,   35,   36,   35,   35,  268,  316,   36,   70,
+
+      270,   35,   35,   35,   35,   35,   35,  273,   35,   35,
+      281,  276,   35,   35,  304,  277,   35,   35,  282,  283,
+       35,   35,  278,  305,  284,  279,  287,   29,  260,   35,
+       35,  288,   36,  261,  291,  291,   67,  292,  291,   35,
+       35,  291,  294,  304,  354,  296,  301,  299,  302,   35,
+       35,   35,   35,  307,  300,   35,   35,  306,   35,  309,
+       35,   35,   29,  311,   29,  313,   35,   35,  312,  281,
+      314,  308,   35,   35,  315,   35,   35,   35,   35,  326,
+       29,  311,  328,   36,  281,  325,  312,   35,   35,  317,
+      281,  324,  327,  323,  329,   35,   35,   35,   35,  336,
+
+      281,   35,   35,  352,  334,  337,  335,  350,   35,   35,
+       35,   35,  359,  346,   35,   35,  356,  348,  344,  345,
+       35,   35,   27,   27,   27,   27,   29,   29,   29,   31,
+       31,   31,   31,   36,   36,   36,   36,   63,  321,   63,
+       63,   64,   64,   64,   64,   66,  319,   66,   66,   35,
+       35,   35,   35,   70,   70,  343,   70,   96,   96,   96,
+       96,   98,  341,   98,   98,  131,  131,  131,  131,  146,
+      146,  146,  146,  152,  152,  152,  152,  156,  156,  156,
+      156,  161,  161,  161,  161,  169,  169,  169,  169,  171,
+      339,  171,  171,  184,  184,  184,  184,  189,  189,  189,
+
+      189,  191,  333,  191,  191,  196,  196,  196,  196,  198,
+      331,  198,  198,  201,  201,  201,  201,  203,  281,  203,
+      203,  207,  207,  207,  207,  209,  321,  209,  209,  214,
+      214,  214,  214,  173,  319,  173,  173,  226,  226,  226,
+      226,  228,  275,  228,  228,  235,  235,  235,  235,  193,
+      267,  193,  193,  200,  257,  200,  200,  205,  304,  205,
+      205,  211,  298,  211,  211,  242,  242,  242,  242,  245,
+      245,  245,  245,  230,  246,  230,  230,  256,  256,  256,
+      256,  259,  259,  259,  259,  261,  295,  261,  261,  266,
+      266,  266,  266,  269,  269,  269,  269,  271,  271,  271,
+
+      271,  274,  274,  274,  274,  280,  280,  280,  280,  285,
+      285,  285,  285,  263,  290,  263,  263,  289,  289,  289,
+      289,  293,  293,  293,  293,  270,  286,  270,  270,  297,
+      297,  297,  297,  303,  303,  303,  303,  310,  310,  310,
+      310,  312,  275,  312,  312,  318,  318,  318,  318,  320,
+      320,  320,  320,  314,  272,  314,  314,  330,  330,  330,
+      330,  332,  332,  332,  332,  338,  338,  338,  338,  340,
+      340,  340,  340,  342,  342,  342,  342,  347,  347,  347,
+      347,  349,  349,  349,  349,  351,  351,  351,  351,  353,
+      353,  353,  353,  357,  357,  357,  357,  215,  267,  257,
+
+      246,  243,  215,  141,  139,   99,   36,   30,   59,   57,
+       36,   30,  360,   28,   28,    5,  360,  360,  360,  360,
+      360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
+      360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
+      360,  360,  360,  360,  360,  360,  360,  360,  360,  360
     } ;
 
-static const flex_int16_t yy_chk[940] =
+static const flex_int16_t yy_chk[951] =
     {   0,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
@@ -927,101 +930,102 @@ static const flex_int16_t yy_chk[940] =
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
+       24,   22,   24,   47,   47,   21,   26,   51,   19,   26,
+       20,   51,   19,   26,   26,   31,   31,   32,   32,   32,
+
+       39,   31,   39,   42,   32,   35,   35,   35,   35,   40,
+       44,   45,   35,   35,   37,   37,   37,   37,   37,   39,
+       42,   37,   37,   40,   41,   43,   41,   48,   45,   45,
+       49,   44,   50,   55,   56,   50,   43,   52,   48,   52,
+       53,   54,   57,   53,   58,   59,   54,   49,   56,   60,
+       62,   61,   71,   60,   61,   72,   71,   55,   77,   94,
+       59,   58,   59,   72,   57,   64,   64,   62,   67,   67,
+       73,   64,   73,   74,   67,   75,   76,   77,   78,   79,
+       94,   79,   78,   74,   80,   82,   84,   80,   81,   75,
+       76,   83,   81,   85,   83,   89,   91,   82,   84,   86,
+
+       88,   86,   88,   90,   91,   90,  357,  107,   95,  107,
+       93,   85,   87,   87,   87,   87,   93,   89,  100,   87,
+       87,  101,  104,   87,   87,   92,   92,   95,   92,   96,
+       96,   92,  106,  103,  104,   96,  100,  103,  109,  112,
+      109,  139,  101,  102,  102,  102,  102,  102,  105,  105,
+      102,  102,  113,  111,  105,  138,  106,  111,  139,  112,
+      113,  114,  114,  114,  114,  114,  115,  115,  114,  114,
+      116,  116,  118,  118,  138,  118,  116,  123,  115,  117,
+      117,  117,  117,  117,  120,  123,  117,  117,  119,  119,
+      119,  119,  119,  124,  127,  119,  119,  124,  121,  120,
+
+      121,  122,  122,  122,  122,  122,  125,  125,  122,  122,
+      126,  128,  127,  129,  129,  128,  131,  131,  126,  129,
+      133,  134,  131,  136,  136,  136,  137,  134,  136,  141,
+      143,  353,  143,  133,  142,  168,  136,  167,  167,  158,
+      168,  137,  140,  140,  140,  140,  140,  142,  141,  140,
+      140,  144,  144,  146,  146,  148,  148,  144,  158,  146,
+      149,  149,  150,  150,  148,  152,  152,  164,  150,  154,
+      154,  152,  156,  156,  163,  154,  149,  166,  156,  159,
+      159,  161,  161,  169,  169,  159,  164,  161,  351,  169,
+      174,  166,  163,  174,  176,  176,  177,  177,  178,  178,
+
+      179,  180,  181,  216,  179,  181,  180,  349,  177,  216,
+      178,  182,  182,  184,  184,  176,  225,  182,  187,  184,
+      186,  186,  225,  187,  188,  188,  188,  188,  188,  189,
+      189,  188,  188,  194,  194,  189,  195,  195,  196,  196,
+      201,  201,  206,  206,  196,  194,  201,  207,  207,  212,
+      213,  213,  305,  207,  218,  218,  219,  219,  347,  212,
+      220,  220,  221,  221,  222,  222,  223,  223,  224,  224,
+      344,  226,  226,  220,  224,  305,  219,  226,  221,  222,
+      232,  232,  233,  233,  235,  235,  237,  249,  233,  238,
+      235,  238,  238,  299,  237,  237,  240,  299,  240,  241,
+
+      241,  247,  247,  250,  250,  251,  251,  247,  252,  252,
+      253,  249,  254,  254,  282,  250,  265,  265,  253,  253,
+      258,  258,  251,  282,  254,  252,  258,  259,  259,  273,
+      273,  265,  276,  259,  268,  268,  268,  268,  268,  277,
+      277,  268,  268,  283,  342,  273,  278,  276,  279,  278,
+      278,  279,  279,  284,  277,  287,  287,  283,  288,  288,
+      284,  284,  291,  291,  293,  293,  296,  296,  291,  306,
+      293,  287,  300,  300,  296,  307,  307,  308,  308,  309,
+      310,  310,  316,  316,  322,  308,  310,  309,  309,  300,
+      323,  307,  315,  306,  317,  315,  315,  317,  317,  324,
+
+      334,  324,  324,  340,  322,  325,  323,  338,  325,  325,
+      336,  336,  356,  336,  346,  346,  346,  337,  334,  335,
+      356,  356,  361,  361,  361,  361,  362,  362,  362,  363,
+      363,  363,  363,  364,  364,  364,  364,  365,  332,  365,
+      365,  366,  366,  366,  366,  367,  330,  367,  367,  368,
+      368,  368,  368,  369,  369,  329,  369,  370,  370,  370,
+      370,  371,  328,  371,  371,  372,  372,  372,  372,  373,
+      373,  373,  373,  374,  374,  374,  374,  375,  375,  375,
+      375,  376,  376,  376,  376,  377,  377,  377,  377,  378,
+      327,  378,  378,  379,  379,  379,  379,  380,  380,  380,
+
+      380,  381,  320,  381,  381,  382,  382,  382,  382,  383,
+      318,  383,  383,  384,  384,  384,  384,  385,  303,  385,
+      385,  386,  386,  386,  386,  387,  302,  387,  387,  388,
+      388,  388,  388,  389,  301,  389,  389,  390,  390,  390,
+      390,  391,  297,  391,  391,  392,  392,  392,  392,  393,
+      289,  393,  393,  394,  285,  394,  394,  395,  280,  395,
+      395,  396,  274,  396,  396,  397,  397,  397,  397,  398,
+      398,  398,  398,  399,  271,  399,  399,  400,  400,  400,
+      400,  401,  401,  401,  401,  402,  269,  402,  402,  403,
+      403,  403,  403,  404,  404,  404,  404,  405,  405,  405,
+
+      405,  406,  406,  406,  406,  407,  407,  407,  407,  408,
+      408,  408,  408,  409,  266,  409,  409,  410,  410,  410,
+      410,  411,  411,  411,  411,  412,  256,  412,  412,  413,
+      413,  413,  413,  414,  414,  414,  414,  415,  415,  415,
+      415,  416,  248,  416,  416,  417,  417,  417,  417,  418,
+      418,  418,  418,  419,  245,  419,  419,  420,  420,  420,
+      420,  421,  421,  421,  421,  422,  422,  422,  422,  423,
+      423,  423,  423,  424,  424,  424,  424,  425,  425,  425,
+      425,  426,  426,  426,  426,  427,  427,  427,  427,  428,
+      428,  428,  428,  429,  429,  429,  429,  242,  239,  231,
+
+      217,  214,  165,  110,  108,   70,   36,   29,   25,   23,
+       17,    6,    5,    4,    3,  360,  360,  360,  360,  360,
+      360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
+      360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
+      360,  360,  360,  360,  360,  360,  360,  360,  360,  360
     } ;
 
 #define YY_TRAILING_MASK 0x2000
@@ -1199,9 +1203,9 @@ static int vdev_and_devtype(DiskParseContext *dpc, char *str) {
 #undef DPC /* needs to be defined differently the actual lexer */
 #define DPC ((DiskParseContext*)yyextra)
 
-#line 1202 "libxlu_disk_l.c"
+#line 1206 "libxlu_disk_l.c"
 
-#line 1204 "libxlu_disk_l.c"
+#line 1208 "libxlu_disk_l.c"
 
 #define INITIAL 0
 #define LEXERR 1
@@ -1483,7 +1487,7 @@ YY_DECL
 #line 180 "libxlu_disk_l.l"
  /*----- the scanner rules which do the parsing -----*/
 
-#line 1486 "libxlu_disk_l.c"
+#line 1490 "libxlu_disk_l.c"
 
 	while ( /*CONSTCOND*/1 )		/* loops until end-of-file is reached */
 		{
@@ -1515,14 +1519,14 @@ yy_match:
 			while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 				{
 				yy_current_state = (int) yy_def[yy_current_state];
-				if ( yy_current_state >= 355 )
+				if ( yy_current_state >= 361 )
 					yy_c = yy_meta[yy_c];
 				}
 			yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
 			*yyg->yy_state_ptr++ = yy_current_state;
 			++yy_cp;
 			}
-		while ( yy_current_state != 354 );
+		while ( yy_current_state != 360 );
 
 yy_find_action:
 		yy_current_state = *--yyg->yy_state_ptr;
@@ -1648,76 +1652,81 @@ YY_RULE_SETUP
 #line 201 "libxlu_disk_l.l"
 { libxl_defbool_set(&DPC->disk->discard_enable, false); }
 	YY_BREAK
-/* Note that the COLO configuration settings should be considered unstable.
-  * They may change incompatibly in future versions of Xen. */
 case 15:
 YY_RULE_SETUP
-#line 204 "libxlu_disk_l.l"
-{ libxl_defbool_set(&DPC->disk->colo_enable, true); }
+#line 202 "libxlu_disk_l.l"
+{ DPC->disk->virtio = 1; }
 	YY_BREAK
+/* Note that the COLO configuration settings should be considered unstable.
+  * They may change incompatibly in future versions of Xen. */
 case 16:
 YY_RULE_SETUP
 #line 205 "libxlu_disk_l.l"
-{ libxl_defbool_set(&DPC->disk->colo_enable, false); }
+{ libxl_defbool_set(&DPC->disk->colo_enable, true); }
 	YY_BREAK
 case 17:
-/* rule 17 can match eol */
 YY_RULE_SETUP
 #line 206 "libxlu_disk_l.l"
-{ STRIP(','); SAVESTRING("colo-host", colo_host, FROMEQUALS); }
+{ libxl_defbool_set(&DPC->disk->colo_enable, false); }
 	YY_BREAK
 case 18:
 /* rule 18 can match eol */
 YY_RULE_SETUP
 #line 207 "libxlu_disk_l.l"
-{ STRIP(','); setcoloport(DPC, FROMEQUALS); }
+{ STRIP(','); SAVESTRING("colo-host", colo_host, FROMEQUALS); }
 	YY_BREAK
 case 19:
 /* rule 19 can match eol */
 YY_RULE_SETUP
 #line 208 "libxlu_disk_l.l"
-{ STRIP(','); SAVESTRING("colo-export", colo_export, FROMEQUALS); }
+{ STRIP(','); setcoloport(DPC, FROMEQUALS); }
 	YY_BREAK
 case 20:
 /* rule 20 can match eol */
 YY_RULE_SETUP
 #line 209 "libxlu_disk_l.l"
-{ STRIP(','); SAVESTRING("active-disk", active_disk, FROMEQUALS); }
+{ STRIP(','); SAVESTRING("colo-export", colo_export, FROMEQUALS); }
 	YY_BREAK
 case 21:
 /* rule 21 can match eol */
 YY_RULE_SETUP
 #line 210 "libxlu_disk_l.l"
+{ STRIP(','); SAVESTRING("active-disk", active_disk, FROMEQUALS); }
+	YY_BREAK
+case 22:
+/* rule 22 can match eol */
+YY_RULE_SETUP
+#line 211 "libxlu_disk_l.l"
 { STRIP(','); SAVESTRING("hidden-disk", hidden_disk, FROMEQUALS); }
 	YY_BREAK
 /* the target magic parameter, eats the rest of the string */
-case 22:
+case 23:
 YY_RULE_SETUP
-#line 214 "libxlu_disk_l.l"
+#line 215 "libxlu_disk_l.l"
 { STRIP(','); SAVESTRING("target", pdev_path, FROMEQUALS); }
 	YY_BREAK
 /* unknown parameters */
-case 23:
-/* rule 23 can match eol */
+case 24:
+/* rule 24 can match eol */
 YY_RULE_SETUP
-#line 218 "libxlu_disk_l.l"
+#line 219 "libxlu_disk_l.l"
 { xlu__disk_err(DPC,yytext,"unknown parameter"); }
 	YY_BREAK
 /* deprecated prefixes */
 /* the "/.*" in these patterns ensures that they count as if they
    * matched the whole string, so these patterns take precedence */
-case 24:
+case 25:
 YY_RULE_SETUP
-#line 225 "libxlu_disk_l.l"
+#line 226 "libxlu_disk_l.l"
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
+#line 232 "libxlu_disk_l.l"
 {
                     char *newscript;
                     STRIP(':');
@@ -1731,30 +1740,22 @@ YY_RULE_SETUP
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
-{ DPC->had_depr_prefix=1; DEPRECATE(0); }
-	YY_BREAK
-case 27:
-YY_RULE_SETUP
 #line 245 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
 case 28:
-*yy_cp = yyg->yy_hold_char; /* undo effects of setting up yytext */
-yyg->yy_c_buf_p = yy_cp = yy_bp + 4;
-YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
 #line 246 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
 case 29:
 *yy_cp = yyg->yy_hold_char; /* undo effects of setting up yytext */
-yyg->yy_c_buf_p = yy_cp = yy_bp + 6;
+yyg->yy_c_buf_p = yy_cp = yy_bp + 4;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
 #line 247 "libxlu_disk_l.l"
@@ -1762,7 +1763,7 @@ YY_RULE_SETUP
 	YY_BREAK
 case 30:
 *yy_cp = yyg->yy_hold_char; /* undo effects of setting up yytext */
-yyg->yy_c_buf_p = yy_cp = yy_bp + 5;
+yyg->yy_c_buf_p = yy_cp = yy_bp + 6;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
 #line 248 "libxlu_disk_l.l"
@@ -1770,26 +1771,34 @@ YY_RULE_SETUP
 	YY_BREAK
 case 31:
 *yy_cp = yyg->yy_hold_char; /* undo effects of setting up yytext */
-yyg->yy_c_buf_p = yy_cp = yy_bp + 4;
+yyg->yy_c_buf_p = yy_cp = yy_bp + 5;
 YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
 #line 249 "libxlu_disk_l.l"
 { DPC->had_depr_prefix=1; DEPRECATE(0); }
 	YY_BREAK
 case 32:
-/* rule 32 can match eol */
+*yy_cp = yyg->yy_hold_char; /* undo effects of setting up yytext */
+yyg->yy_c_buf_p = yy_cp = yy_bp + 4;
+YY_DO_BEFORE_ACTION; /* set up yytext again */
+YY_RULE_SETUP
+#line 250 "libxlu_disk_l.l"
+{ DPC->had_depr_prefix=1; DEPRECATE(0); }
+	YY_BREAK
+case 33:
+/* rule 33 can match eol */
 YY_RULE_SETUP
-#line 251 "libxlu_disk_l.l"
+#line 252 "libxlu_disk_l.l"
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
+#line 259 "libxlu_disk_l.l"
 {
     STRIP(',');
 
@@ -1816,27 +1825,27 @@ YY_RULE_SETUP
     }
 }
 	YY_BREAK
-case 34:
+case 35:
 YY_RULE_SETUP
-#line 284 "libxlu_disk_l.l"
+#line 285 "libxlu_disk_l.l"
 {
     BEGIN(LEXERR);
     yymore();
 }
 	YY_BREAK
-case 35:
+case 36:
 YY_RULE_SETUP
-#line 288 "libxlu_disk_l.l"
+#line 289 "libxlu_disk_l.l"
 {
     xlu__disk_err(DPC,yytext,"bad disk syntax"); return 0;
 }
 	YY_BREAK
-case 36:
+case 37:
 YY_RULE_SETUP
-#line 291 "libxlu_disk_l.l"
+#line 292 "libxlu_disk_l.l"
 YY_FATAL_ERROR( "flex scanner jammed" );
 	YY_BREAK
-#line 1839 "libxlu_disk_l.c"
+#line 1848 "libxlu_disk_l.c"
 			case YY_STATE_EOF(INITIAL):
 			case YY_STATE_EOF(LEXERR):
 				yyterminate();
@@ -2104,7 +2113,7 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 		while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 			{
 			yy_current_state = (int) yy_def[yy_current_state];
-			if ( yy_current_state >= 355 )
+			if ( yy_current_state >= 361 )
 				yy_c = yy_meta[yy_c];
 			}
 		yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
@@ -2128,11 +2137,11 @@ static int yy_get_next_buffer (yyscan_t yyscanner)
 	while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
 		{
 		yy_current_state = (int) yy_def[yy_current_state];
-		if ( yy_current_state >= 355 )
+		if ( yy_current_state >= 361 )
 			yy_c = yy_meta[yy_c];
 		}
 	yy_current_state = yy_nxt[yy_base[yy_current_state] + yy_c];
-	yy_is_jam = (yy_current_state == 354);
+	yy_is_jam = (yy_current_state == 360);
 	if ( ! yy_is_jam )
 		*yyg->yy_state_ptr++ = yy_current_state;
 
@@ -2941,4 +2950,4 @@ void yyfree (void * ptr , yyscan_t yyscanner)
 
 #define YYTABLES_NAME "yytables"
 
-#line 291 "libxlu_disk_l.l"
+#line 292 "libxlu_disk_l.l"
diff --git a/tools/libs/util/libxlu_disk_l.h b/tools/libs/util/libxlu_disk_l.h
index 6abeecf..df20fcc 100644
--- a/tools/libs/util/libxlu_disk_l.h
+++ b/tools/libs/util/libxlu_disk_l.h
@@ -694,7 +694,7 @@ extern int yylex (yyscan_t yyscanner);
 #undef yyTABLES_NAME
 #endif
 
-#line 291 "libxlu_disk_l.l"
+#line 292 "libxlu_disk_l.l"
 
 #line 699 "libxlu_disk_l.h"
 #undef xlu__disk_yyIN_HEADER
diff --git a/tools/libs/util/libxlu_disk_l.l b/tools/libs/util/libxlu_disk_l.l
index 3bd639a..d68a59c 100644
--- a/tools/libs/util/libxlu_disk_l.l
+++ b/tools/libs/util/libxlu_disk_l.l
@@ -198,6 +198,7 @@ script=[^,]*,?	{ STRIP(','); SAVESTRING("script", script, FROMEQUALS); }
 direct-io-safe,? { DPC->disk->direct_io_safe = 1; }
 discard,?	{ libxl_defbool_set(&DPC->disk->discard_enable, true); }
 no-discard,?	{ libxl_defbool_set(&DPC->disk->discard_enable, false); }
+virtio,?	{ DPC->disk->virtio = 1; }
  /* Note that the COLO configuration settings should be considered unstable.
   * They may change incompatibly in future versions of Xen. */
 colo,?		{ libxl_defbool_set(&DPC->disk->colo_enable, true); }
diff --git a/tools/xl/xl_block.c b/tools/xl/xl_block.c
index 70eed43..50a4d45 100644
--- a/tools/xl/xl_block.c
+++ b/tools/xl/xl_block.c
@@ -50,6 +50,11 @@ int main_blockattach(int argc, char **argv)
         return 0;
     }
 
+    if (disk.virtio) {
+        fprintf(stderr, "block-attach is not supported for Virtio device\n");
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
+    if (disk.virtio) {
+        fprintf(stderr, "block-detach is not supported for Virtio device\n");
+        return 1;
+    }
+
     rc = !force ? libxl_device_disk_safe_remove(ctx, domid, &disk, 0) :
         libxl_device_disk_destroy(ctx, domid, &disk, 0);
     if (rc) {
-- 
2.7.4


