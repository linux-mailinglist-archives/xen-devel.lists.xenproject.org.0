Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1611D8C7032
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 04:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722772.1127075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7QbD-0006qM-ER; Thu, 16 May 2024 02:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722772.1127075; Thu, 16 May 2024 02:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7QbD-0006nr-9U; Thu, 16 May 2024 02:12:03 +0000
Received: by outflank-mailman (input) for mailman id 722772;
 Thu, 16 May 2024 02:12:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t9d+=MT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1s7QbB-0006nk-Aj
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 02:12:01 +0000
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [2607:f8b0:4864:20::831])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac9c5aa8-1329-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 04:11:58 +0200 (CEST)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-43e1d15a46eso23178271cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 19:11:58 -0700 (PDT)
Received: from shine.lan
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df57110a9sm90701811cf.69.2024.05.15.19.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 19:11:55 -0700 (PDT)
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
X-Inumbo-ID: ac9c5aa8-1329-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715825517; x=1716430317; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0WIxuR6UQgg2tu21CpoSpp7DsryaH1MZJlm+1o+riU=;
        b=lxzqKJwwsCfPDMCXp2ezy59JeLGHNmNKWigvFL/cyvGHbN90USEKlyfk6h/5aqvVRW
         oy7P7L8gXiojGuSJBLXLwx+w7NDYX0Q5SnB9TWqvj7lYDOaUmkq/JAHKkEVdehJrBNM5
         Oxtn2mjWsBlVbP4U+vkC4QKFf2f44lEekEnsevffsMD6UcOjrWQ4pONmM1Q0RBHtCvsd
         DbNqTajdIYtNXGxCMjxEaeOaRz0p6ib11WMROP5t83Niv5hwPPitilCQUOWMpryU1+cJ
         g9soBI5jXy8VVsi+s7p8x3s2eLan+Zsxno5Jz7xmyQfBXoiNJMl3IDmXHXGZe+Vu2qI2
         xC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715825517; x=1716430317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0WIxuR6UQgg2tu21CpoSpp7DsryaH1MZJlm+1o+riU=;
        b=GPw9/eP6zn68MRzk9qmRwgY2tWbE+U0+n9lDgOI//VXESwT7huZQizif5lOpiUadxE
         NBUsnKEk444Abclm0hmaHrkyFmBETOanDF8DWJUdkpOSHUeH5WWq07hPy1iO3NI5YVWn
         nNSWEStSyOlinjPvxBTL1Z7+2levqHJ6Wq1d48mg1lyZTmIOSIqHcangZ8SIYfchpsBD
         Tfrf/hTwtCXYmXOjqY64XztujBp0BlGDwd2lSJBbu1vnEOeuTwW3Tr4BJ6FcV460wzxj
         lhrHJn5gpuFw9mU/LmTiljJ7wLyBsVZVqOI79dmK+YrC8udv1uSoPs+dam6OwxQgPKaa
         hmHg==
X-Gm-Message-State: AOJu0Yx5vFp3jKudk+0RuwhIv4tNmIcFlKVunsAAcekac133WiJ3VIJ+
	zJZUm08awL8OZnj7JRB26xeh3/YsDhgqBTv8pCe9nTQya0B3jT+PU+VfWQ==
X-Google-Smtp-Source: AGHT+IFBg8FlMwn9BilWSFWMmQLzOhU7hCJg/ZbIoQYiwnJQaQHG6Qz2Ho4hq2iXGcyt4kvM/eH5dw==
X-Received: by 2002:a05:622a:1ba8:b0:43e:3b2f:e2 with SMTP id d75a77b69052e-43e3b2f0860mr18344851cf.37.1715825516591;
        Wed, 15 May 2024 19:11:56 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v3] libxl: Enable stubdom cdrom changing
Date: Wed, 15 May 2024 22:10:10 -0400
Message-Id: <20240516021010.3783-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Andryuk <jason.andryuk@amd.com>

From: Jason Andryuk <jandryuk@gmail.com>

To change the cd-rom medium, libxl will:
 - QMP eject the medium from QEMU
 - block-detach the old PV disk
 - block-attach the new PV disk
 - QMP change the medium to the new PV disk by fdset-id

The QMP code is reused, and remove and attach are implemented here.

The stubdom must internally handle adding /dev/xvdc to the appropriate
fdset.  libxl in dom0 doesn't see the result of adding to the fdset as
that is internal to the stubdom, but the fdset's opaque fields will be
set to stub-devid:$devid, so libxl can identify it.  $devid is common
between the stubdom and libxl, so it can be identified on both side.
The stubdom will name the device xvdY regardless of the guest name hdY,
sdY, or xvdY, but the stubdom will be assigned the same devid
facilitating lookup.  Because the stubdom add-fd call is asynchronous,
libxl needs to poll query-fdsets to identify when add-fd has completed.

For cd-eject, we still need to attach the empty vbd.  This is necessary
since xenstore is used to determine that hdc exists.  Otherwise after
eject, hdc would be gone and the cd-insert would fail to find the drive
to insert new media.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
QEMU inside the stubdom can be sandboxed disallowing opening the devices
by path name, so QMP add-fd is used like with dom0 QEMU depriv.

v1 allowed ERROR_JSON_CONFIG_EMPTY "because a stubdom don't have a json
config," but it is re-introduced in v2 since the guest should be acted
on.  It seems fine in testing.  The missing JSON was probably from
OpenXT having disabled JSON configs in the past.

v2
Use query-fdsets for removal and addition - stub-devid:$devid
Re-use aodev instead of 2nd aodev_del
Rename some functions
Support sdX vdevs
Get stubdomid from cis->disk_domid in stubdom callbacks
Use if (rc) not if (rc != 0)
Remove comment about libxl_device_disk_remove
Use EGC_GC not STATE_AO_GC
Re-work and eliminate cdrom_insert_stubdom_query_fdset_retry
Change some messages
Allow missing removal fdset in case it wasn't added during startup.
Drop LOGD(... rc=%d)

v3:
Remove LOG DEBUGs
s/timeout_retry/retry_timer/
Init stubdom_fdset = -1 and use as flag to pase fdset-id
Drop AO_GC
Avoid non-error goto
Expect ERROR_TIMEOUT as non-error
Drop some comments
close payload_fd and set to -1
Remove limit on query-fdset retries

By removing the limit on query-fdset retries, we lose an explicity error
message for the stubdom not performing the add-fd, but we give more time
which may let more cases succeed.
---
 docs/misc/stubdom.txt         |  10 +
 tools/libs/light/libxl_disk.c | 384 ++++++++++++++++++++++++++++++++--
 2 files changed, 373 insertions(+), 21 deletions(-)

diff --git a/docs/misc/stubdom.txt b/docs/misc/stubdom.txt
index c717a95d17..64c220db20 100644
--- a/docs/misc/stubdom.txt
+++ b/docs/misc/stubdom.txt
@@ -127,6 +127,16 @@ Limitations:
  - at most 26 emulated disks are supported (more are still available as PV disks)
  - graphics output (VNC/SDL/Spice) not supported
 
+CD-ROM changing:
+
+To change the CD-ROM medium, libxl will:
+ - QMP eject the medium from QEMU
+ - block-detach the old PV disk
+ - block-attach the new PV disk
+ - QMP change the medium to the new PV disk by fdset-id
+
+The stubdom must internally add /dev/xvdc to an fdset in QEMU with opaque set
+to "stub-devid:$devid".  libxl will lookup the fdset with that string.
 
                                    PV-GRUB
                                    =======
diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index 1f1e5c6567..d76f39ea42 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -829,21 +829,118 @@ int libxl_device_disk_getinfo(libxl_ctx *ctx, uint32_t domid,
     return rc;
 }
 
+/*
+ * Search through the query-fdsets JSON looking for a matching devid.
+ *
+ * If found, return the fdset-id integer (>=0).
+ *
+ * If not found, return ERROR_NOTFOUND.
+ *
+ * On error, return libxl ERROR_*.
+ */
+static int query_fdsets_find_fdset(libxl__gc *gc,
+                                   const libxl__json_object *response,
+                                   int devid)
+{
+    const libxl__json_object *fdset;
+    const char *needle = GCSPRINTF("stub-devid:%d", devid);
+    int i, j, rc;
+
+    /* query-fdsets returns:
+     * [
+     *   { "fds": [
+     *       { "fd": 30,
+     *         "opaque": "stub-devid:2080"
+     *       }
+     *     ],
+     *     "fdset-id": 1
+     *   }
+     * ]
+     */
+    for (i = 0; (fdset = libxl__json_array_get(response, i)); i++) {
+        const libxl__json_object *fdset_id;
+        const libxl__json_object *fds;
+        const libxl__json_object *fd;
+
+        fdset_id = libxl__json_map_get("fdset-id", fdset, JSON_INTEGER);
+        if (!fdset_id) {
+            rc = ERROR_QEMU_API;
+            goto out;
+        }
+
+        fds = libxl__json_map_get("fds", fdset, JSON_ARRAY);
+        if (!fds) {
+            rc = ERROR_QEMU_API;
+            goto out;
+        }
+        for (j = 0; (fd = libxl__json_array_get(fds, j)); j++) {
+            const libxl__json_object *fd_num;
+            const libxl__json_object *opaque;
+            const char *opaque_str;
+
+            fd_num = libxl__json_map_get("fd", fd, JSON_INTEGER);
+            if (!fd_num) {
+                rc = ERROR_QEMU_API;
+                goto out;
+            }
+            opaque = libxl__json_map_get("opaque", fd, JSON_STRING);
+            if (!opaque) {
+                continue;
+            }
+
+            opaque_str = libxl__json_object_get_string(opaque);
+            if (strcmp(opaque_str, needle) == 0) {
+                return libxl__json_object_get_integer(fdset_id);
+            }
+        }
+    }
+    rc = ERROR_NOTFOUND;
+
+ out:
+    return rc;
+}
+
 typedef struct {
     libxl__ao *ao;
+    libxl__ao_device aodev;
     libxl_domid domid;
+    libxl_domid disk_domid;
     libxl_device_disk *disk;
     libxl_device_disk disk_saved;
     libxl__ev_slowlock qmp_lock;
     int dm_ver;
     libxl__ev_time time;
+    libxl__ev_time retry_timer;
     libxl__ev_qmp qmp;
+    int stubdom_fdset;
 } libxl__cdrom_insert_state;
 
 static void cdrom_insert_lock_acquired(libxl__egc *, libxl__ev_slowlock *,
                                        int rc);
 static void cdrom_insert_qmp_connected(libxl__egc *, libxl__ev_qmp *,
                                        const libxl__json_object *, int rc);
+static void cdrom_insert_stubdom_query_fdset_rm(libxl__egc *egc,
+                                                libxl__ev_qmp *qmp,
+                                                const libxl__json_object *resp,
+                                                int rc);
+static void cdrom_insert_stubdom_parse_fdset_rm(libxl__egc *egc,
+                                                libxl__ev_qmp *qmp,
+                                                const libxl__json_object *resp,
+                                                int rc);
+static void cdrom_insert_stubdom_ejected(libxl__egc *egc, libxl__ev_qmp *,
+                                         const libxl__json_object *, int rc);
+static void cdrom_insert_stubdom_disk_remove_cb(libxl__egc *egc,
+                                                 libxl__ao_device *aodev);
+static void cdrom_insert_stubdom_disk_add_cb(libxl__egc *egc,
+                                             libxl__ao_device *aodev);
+static void cdrom_insert_stubdom_query_fdset(libxl__egc *egc,
+                                             libxl__ev_time *ev,
+                                             const struct timeval *abs,
+                                             int rc);
+static void cdrom_insert_stubdom_parse_fdset(libxl__egc *egc,
+                                             libxl__ev_qmp *qmp,
+                                             const libxl__json_object *response,
+                                             int rc);
 static void cdrom_insert_ejected(libxl__egc *egc, libxl__ev_qmp *,
                                  const libxl__json_object *, int rc);
 static void cdrom_insert_addfd_cb(libxl__egc *egc, libxl__ev_qmp *,
@@ -865,6 +962,7 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
     libxl_device_disk *disks = NULL;
     int rc;
     libxl__cdrom_insert_state *cis;
+    libxl_domid stubdomid;
 
     GCNEW(cis);
     cis->ao = ao;
@@ -876,6 +974,8 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
     cis->qmp_lock.ao = ao;
     cis->qmp_lock.domid = domid;
     libxl__ev_time_init(&cis->time);
+    libxl__ev_time_init(&cis->retry_timer);
+    cis->stubdom_fdset = -1;
     libxl__ev_qmp_init(&cis->qmp);
     cis->qmp.ao = ao;
     cis->qmp.domid = domid;
@@ -892,12 +992,6 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
         goto out;
     }
 
-    if (libxl_get_stubdom_id(ctx, domid) != 0) {
-        LOGD(ERROR, domid, "cdrom-insert doesn't work for stub domains");
-        rc = ERROR_INVAL;
-        goto out;
-    }
-
     cis->dm_ver = libxl__device_model_version_running(gc, domid);
     if (cis->dm_ver == -1) {
         LOGD(ERROR, domid, "Cannot determine device model version");
@@ -905,7 +999,22 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
         goto out;
     }
 
-    disks = libxl__device_list(gc, &libxl__disk_devtype, domid, &num);
+    stubdomid = libxl_get_stubdom_id(CTX, cis->domid);
+    if (stubdomid == 0) {
+        cis->disk_domid = domid;
+    } else {
+        cis->disk_domid = stubdomid;
+        disk->backend = LIBXL_DISK_BACKEND_PHY;
+    }
+
+    if (cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL &&
+        stubdomid) {
+        LOGD(ERROR, domid, "cdrom-insert doesn't work for Mini-OS stubdoms");
+        rc = ERROR_INVAL;
+        goto out;
+    }
+
+    disks = libxl__device_list(gc, &libxl__disk_devtype, cis->disk_domid, &num);
     for (i = 0; i < num; i++) {
         if (disks[i].is_cdrom && !strcmp(disk->vdev, disks[i].vdev))
         {
@@ -920,7 +1029,7 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
         goto out;
     }
 
-    rc = libxl__device_disk_setdefault(gc, domid, disk, false);
+    rc = libxl__device_disk_setdefault(gc, cis->disk_domid, disk, false);
     if (rc) goto out;
 
     if (!disk->pdev_path) {
@@ -994,7 +1103,12 @@ static void cdrom_insert_qmp_connected(libxl__egc *egc, libxl__ev_qmp *qmp,
         QMP_PARAMETERS_SPRINTF(&args, "id", "ide-%i", devid);
     else
         QMP_PARAMETERS_SPRINTF(&args, "device", "ide-%i", devid);
-    qmp->callback = cdrom_insert_ejected;
+
+    if (libxl_get_stubdom_id(CTX, cis->domid))
+        qmp->callback = cdrom_insert_stubdom_query_fdset_rm;
+    else
+        qmp->callback = cdrom_insert_ejected;
+
     rc = libxl__ev_qmp_send(egc, qmp, "eject", args);
     if (rc) goto out;
     return;
@@ -1002,6 +1116,211 @@ out:
     cdrom_insert_done(egc, cis, rc); /* must be last */
 }
 
+static void cdrom_insert_stubdom_query_fdset_rm(libxl__egc *egc,
+                                                libxl__ev_qmp *qmp,
+                                                const libxl__json_object *resp,
+                                                int rc)
+{
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
+
+    if (rc) goto out;
+
+    /* Only called for qemu-xen/linux stubdom. */
+    assert(cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN);
+
+    cis->qmp.callback = cdrom_insert_stubdom_parse_fdset_rm;
+
+    rc = libxl__ev_qmp_send(egc, &cis->qmp, "query-fdsets", NULL);
+    if (rc) goto out;
+
+    return;
+
+ out:
+    cdrom_insert_done(egc, cis, rc); /* must be last */
+}
+
+static void cdrom_insert_stubdom_parse_fdset_rm(libxl__egc *egc,
+                                                libxl__ev_qmp *qmp,
+                                                const libxl__json_object *resp,
+                                                int rc)
+{
+    EGC_GC;
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
+    int devid;
+    int fdset;
+
+    if (rc) goto out;
+
+    /* Only called for qemu-xen/linux stubdom. */
+    assert(cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN);
+
+    devid = libxl__device_disk_dev_number(cis->disk->vdev, NULL, NULL);
+    fdset = query_fdsets_find_fdset(gc, resp, devid);
+    if (fdset < 0) {
+        rc = fdset;
+        goto out;
+    }
+
+    LOGD(DEBUG, cis->domid, "Found fdset %d", fdset);
+
+    libxl__json_object *args = NULL;
+
+    libxl__qmp_param_add_integer(gc, &args, "fdset-id", fdset);
+
+    cis->qmp.callback = cdrom_insert_stubdom_ejected;
+
+    rc = libxl__ev_qmp_send(egc, &cis->qmp, "remove-fd", args);
+    if (rc) goto out;
+
+    return;
+
+ out:
+    if (rc == ERROR_NOTFOUND) {
+        LOGD(DEBUG, cis->domid, "No fdset found - skipping remove-fd");
+        cdrom_insert_stubdom_ejected(egc, qmp, resp, 0);
+    } else {
+        cdrom_insert_done(egc, cis, rc); /* must be last */
+    }
+}
+
+
+static void cdrom_insert_stubdom_ejected(libxl__egc *egc, libxl__ev_qmp *qmp,
+                                         const libxl__json_object *response,
+                                         int rc)
+{
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
+    libxl__device *device;
+    STATE_AO_GC(cis->ao);
+    domid_t stubdomid = cis->disk_domid;
+
+    if (rc) goto out;
+
+    GCNEW(device);
+    rc = libxl__device_from_disk(gc, stubdomid, cis->disk, device);
+    if (rc) goto out;
+
+    /* stubdom PV block dev eject */
+    libxl__prepare_ao_device(ao, &cis->aodev);
+    cis->aodev.action = LIBXL__DEVICE_ACTION_REMOVE;
+    cis->aodev.dev = device;
+    cis->aodev.callback = cdrom_insert_stubdom_disk_remove_cb;
+    cis->aodev.force.flag = LIBXL__FORCE_OFF;
+    libxl__initiate_device_generic_remove(egc, &cis->aodev);
+    return;
+
+ out:
+    cdrom_insert_done(egc, cis, rc); /* must be last */
+}
+
+static void cdrom_insert_stubdom_disk_remove_cb(libxl__egc *egc,
+                                                 libxl__ao_device *aodev)
+{
+    STATE_AO_GC(aodev->ao);
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(aodev, *cis, aodev);
+    domid_t stubdomid = cis->disk_domid;
+
+    if (aodev->rc) {
+        LOGD(ERROR, aodev->dev->domid, "Unable to remove stubdom PV disk id %u",
+             aodev->dev->devid);
+        goto out;
+    }
+
+    /* block dev insert - this may be inserting an empty disk for eject. */
+    libxl__prepare_ao_device(ao, &cis->aodev);
+    /* set an ao callback to end up in cdrom_insert_ejected */
+    cis->aodev.callback = cdrom_insert_stubdom_disk_add_cb;
+    libxl__device_disk_add(egc, stubdomid, cis->disk, &cis->aodev);
+
+    return;
+
+ out:
+    cdrom_insert_done(egc, cis, aodev->rc); /* must be last */
+}
+
+static void cdrom_insert_stubdom_disk_add_cb(libxl__egc *egc,
+                                             libxl__ao_device *aodev)
+{
+    EGC_GC;
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(aodev, *cis, aodev);
+
+    if (aodev->rc) {
+        LOGD(ERROR, aodev->dev->domid, "Unable to insert stubdom PV disk id %u",
+             aodev->dev->devid);
+        goto out;
+    }
+
+    cdrom_insert_stubdom_query_fdset(egc, &cis->retry_timer, NULL,
+                                     ERROR_TIMEDOUT);
+    return;
+
+ out:
+    cdrom_insert_done(egc, cis, aodev->rc);
+}
+
+static void cdrom_insert_stubdom_query_fdset(libxl__egc *egc,
+                                             libxl__ev_time *ev,
+                                             const struct timeval *abs,
+                                             int rc)
+{
+    EGC_GC;
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(ev, *cis, retry_timer);
+
+    if (rc != ERROR_TIMEDOUT) goto out;
+
+    /* Only called for qemu-xen/linux stubdom. */
+    assert(cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN);
+
+    cis->qmp.callback = cdrom_insert_stubdom_parse_fdset;
+
+    rc = libxl__ev_qmp_send(egc, &cis->qmp, "query-fdsets", NULL);
+    if (rc) goto out;
+
+    return;
+
+ out:
+    cdrom_insert_done(egc, cis, rc); /* must be last */
+}
+
+static void cdrom_insert_stubdom_parse_fdset(libxl__egc *egc,
+                                             libxl__ev_qmp *qmp,
+                                             const libxl__json_object *response,
+                                             int rc)
+{
+    EGC_GC;
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
+    int devid;
+    int fdset;
+
+    if (rc) goto out;
+
+    /* Only called for qemu-xen/linux stubdom. */
+    assert(cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN);
+
+    devid = libxl__device_disk_dev_number(cis->disk->vdev, NULL, NULL);
+    fdset = query_fdsets_find_fdset(gc, response, devid);
+    if (fdset < 0) {
+        rc = fdset;
+        goto out;
+    }
+
+    cis->stubdom_fdset = fdset;
+
+    LOGD(DEBUG, cis->domid, "Found fdset %d", cis->stubdom_fdset);
+    cdrom_insert_ejected(egc, &cis->qmp, NULL, rc);
+    return;
+
+ out:
+    if (rc == ERROR_NOTFOUND) {
+        rc = libxl__ev_time_register_rel(cis->ao, &cis->retry_timer,
+                                         cdrom_insert_stubdom_query_fdset,
+                                         200);
+        if (rc) goto out;
+        return;
+    }
+
+    cdrom_insert_done(egc, cis, rc); /* must be last */
+}
+
 static void cdrom_insert_ejected(libxl__egc *egc,
                                  libxl__ev_qmp *qmp,
                                  const libxl__json_object *response,
@@ -1026,7 +1345,7 @@ static void cdrom_insert_ejected(libxl__egc *egc,
 
     if (rc) goto out;
 
-    rc = libxl__device_from_disk(gc, domid, disk, &device);
+    rc = libxl__device_from_disk(gc, cis->disk_domid, disk, &device);
     if (rc) goto out;
     be_path = libxl__device_backend_path(gc, &device);
     libxl_path = libxl__device_libxl_path(gc, &device);
@@ -1082,6 +1401,7 @@ static void cdrom_insert_ejected(libxl__egc *egc,
     if (rc) goto out;
 
     if (cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN &&
+        libxl_get_stubdom_id(CTX, cis->domid) == 0 &&
         disk->format != LIBXL_DISK_FORMAT_EMPTY) {
         libxl__json_object *args = NULL;
 
@@ -1094,7 +1414,7 @@ static void cdrom_insert_ejected(libxl__egc *egc,
             goto out;
         }
 
-        /* This free form parameter is not use by QEMU or libxl. */
+        /* This free form parameter is not used by QEMU or non-stubdom libxl. */
         QMP_PARAMETERS_SPRINTF(&args, "opaque", "%s:%s",
                                libxl_disk_format_to_string(disk->format),
                                disk->pdev_path);
@@ -1116,7 +1436,15 @@ out:
         cdrom_insert_done(egc, cis, rc); /* must be last */
     } else if (!has_callback) {
         /* Only called if no asynchronous callback are set. */
-        cdrom_insert_inserted(egc, qmp, NULL, 0); /* must be last */
+        if (libxl_get_stubdom_id(CTX, cis->domid) &&
+            disk->format != LIBXL_DISK_FORMAT_EMPTY) {
+            LOGD(DEBUG, cis->domid,
+                 "stubdom %d needs to perform add-fd internally",
+                 libxl_get_stubdom_id(CTX, cis->domid));
+            cdrom_insert_addfd_cb(egc, qmp, NULL, 0); /* must be last */
+        } else  {
+            cdrom_insert_inserted(egc, qmp, NULL, 0); /* must be last */
+        }
     }
 }
 
@@ -1135,17 +1463,25 @@ static void cdrom_insert_addfd_cb(libxl__egc *egc,
     /* convenience aliases */
     libxl_device_disk *disk = cis->disk;
 
-    close(qmp->payload_fd);
+    if (qmp->payload_fd >= 0)
+    {
+        close(qmp->payload_fd);
+    }
     qmp->payload_fd = -1;
 
     if (rc) goto out;
 
-    o = libxl__json_map_get("fdset-id", response, JSON_INTEGER);
-    if (!o) {
-        rc = ERROR_FAIL;
-        goto out;
+    /* response non-NULL only for non-stubdom */
+    if (cis->stubdom_fdset == -1) {
+        o = libxl__json_map_get("fdset-id", response, JSON_INTEGER);
+        if (!o) {
+            rc = ERROR_FAIL;
+            goto out;
+        }
+        fdset = libxl__json_object_get_integer(o);
+    } else {
+        fdset = cis->stubdom_fdset;
     }
-    fdset = libxl__json_object_get_integer(o);
 
     devid = libxl__device_disk_dev_number(disk->vdev, NULL, NULL);
     qmp->callback = cdrom_insert_inserted;
@@ -1158,8 +1494,13 @@ static void cdrom_insert_addfd_cb(libxl__egc *egc,
     if (libxl__qmp_ev_qemu_compare_version(qmp, 2, 8, 0) >= 0) {
         QMP_PARAMETERS_SPRINTF(&args, "id", "ide-%i", devid);
         QMP_PARAMETERS_SPRINTF(&args, "filename", "/dev/fdset/%d", fdset);
-        libxl__qmp_param_add_string(gc, &args, "format",
-            libxl__qemu_disk_format_string(disk->format));
+        if (response) {
+            libxl__qmp_param_add_string(gc, &args, "format",
+                libxl__qemu_disk_format_string(disk->format));
+        } else {
+            /* Stubdom is using blockdev /dev/xvd* */
+            libxl__qmp_param_add_string(gc, &args, "format", "host_device");
+        }
         rc = libxl__ev_qmp_send(egc, qmp, "blockdev-change-medium", args);
     } else {
         QMP_PARAMETERS_SPRINTF(&args, "device", "ide-%i", devid);
@@ -1196,7 +1537,7 @@ static void cdrom_insert_inserted(libxl__egc *egc,
 
     if (rc) goto out;
 
-    rc = libxl__device_from_disk(gc, domid, disk, &device);
+    rc = libxl__device_from_disk(gc, cis->disk_domid, disk, &device);
     if (rc) goto out;
     be_path = libxl__device_backend_path(gc, &device);
     libxl_path = libxl__device_libxl_path(gc, &device);
@@ -1281,6 +1622,7 @@ static void cdrom_insert_done(libxl__egc *egc,
     EGC_GC;
 
     libxl__ev_time_deregister(gc, &cis->time);
+    libxl__ev_time_deregister(gc, &cis->retry_timer);
     libxl__ev_qmp_dispose(gc, &cis->qmp);
     if (cis->qmp.payload_fd >= 0) close(cis->qmp.payload_fd);
     libxl__ev_slowlock_unlock(gc, &cis->qmp_lock);
-- 
2.40.1


