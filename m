Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D1389B27D
	for <lists+xen-devel@lfdr.de>; Sun,  7 Apr 2024 16:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701650.1095976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtTdb-0002ca-1L; Sun, 07 Apr 2024 14:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701650.1095976; Sun, 07 Apr 2024 14:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtTda-0002aP-UV; Sun, 07 Apr 2024 14:36:50 +0000
Received: by outflank-mailman (input) for mailman id 701650;
 Sun, 07 Apr 2024 14:36:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CRZ/=LM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rtTdZ-0002aJ-Rf
 for xen-devel@lists.xenproject.org; Sun, 07 Apr 2024 14:36:49 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42ce956b-f4ec-11ee-a1ef-f123f15fe8a2;
 Sun, 07 Apr 2024 16:36:47 +0200 (CEST)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3c5e665aa35so797639b6e.1
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2024 07:36:47 -0700 (PDT)
Received: from shine.lan
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 kc13-20020a05622a44cd00b00433002038a2sm2697099qtb.44.2024.04.07.07.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 07:36:43 -0700 (PDT)
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
X-Inumbo-ID: 42ce956b-f4ec-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712500605; x=1713105405; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFimyOtBQF9vvC+ajrQfZ0cuHWGkcVghzuzt4YzNc2A=;
        b=Xmww4zSiDra68zqkBTNAJc9kWU+tzZPuVVK92EvhOvFZrkwDXfKMatx45rKcdhUFtt
         KMUE6UttDVa7RXJHT6n2o/W4jmQoAQBlU9E+E9+LUuqn5Dut06rvxVx/lkwZgPvSypja
         je5PsNCzDo6qEwmG18xYFJwVBAa+OpT2G0sggRcdCnHD6ln42475e+QTP0rHT/ll8S69
         l7oon5xmqVYa5JX3UVXtGsYwaKWLddvHhim4DA5IRpprSDYcZ2+0iucTt+sU/szUTXfU
         77DvyQG0dszZWQOugGi095mZe9UUdQsz+LoRIyexCN/5mpHzsT9J0GVN9HHmSmawzVho
         ATjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712500605; x=1713105405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFimyOtBQF9vvC+ajrQfZ0cuHWGkcVghzuzt4YzNc2A=;
        b=qKOnxe3vNrp/IB1MKy0erliBfiCdTz7TXwCOldJkCAk9uBz6NJ7LI7reR2kmdv1K5V
         jT81pO2/COuVuM9IeS1YpqfnVr59sTmOfIbPc2ZXa2gcci3arVS/OE2BI40preSZ63wA
         8cksnB5PrxOG6tSy18KESv/h1qTc1OkBeyQVGzktD6w0afSi8GFLHxCm7yzKNhqmlD/U
         4w2pC5r9cDQiqL8IY6pYLm/lryJZ5wXpCrtN5pN+y+e00LPvbqiFshmqJCcKVPBg02t9
         zPPg2lzk/jZhftNmSvh1aiq4fIGrMpiFK+1d21YMPq9+AZ991b3le5boIXqtXkVKOgpK
         3dlQ==
X-Gm-Message-State: AOJu0YxpzQn8U2lV7jvklGr1dnaGr5dZTnB7Mu1FGPQVkVVolKR7Qvcd
	s5VpbRYFlnRhjSewCdFetuwuG/boauRg6VhKg1jtI2uxTQU03loMlC11+NAb
X-Google-Smtp-Source: AGHT+IFrY0Eua0LnKBP4e9qyUZPxqXIJeEuCTLdhlvCYexNFIn5m0XOjV7t0/xjocnu8tWYHyuDG+A==
X-Received: by 2002:a54:4606:0:b0:3c3:7ba2:1579 with SMTP id p6-20020a544606000000b003c37ba21579mr7366663oip.24.1712500604556;
        Sun, 07 Apr 2024 07:36:44 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2] libxl: Enable stubdom cdrom changing
Date: Sun,  7 Apr 2024 10:36:33 -0400
Message-Id: <20240407143633.24108-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
config," but it is disallowed in v2 since the guest should be acted on.
It seems fine in testing.  The missing JSON was probably from OpenXT
having disabled JSON configs in the past.

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
---
 docs/misc/stubdom.txt         |  10 +
 tools/libs/light/libxl_disk.c | 411 ++++++++++++++++++++++++++++++++--
 2 files changed, 397 insertions(+), 24 deletions(-)

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
index fa7856f28c..819d34933b 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -829,21 +829,122 @@ int libxl_device_disk_getinfo(libxl_ctx *ctx, uint32_t domid,
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
+        LOG(DEBUG, "fdset-id=%lld", libxl__json_object_get_integer(fdset_id));
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
+            LOG(DEBUG, "fd=%lld opaque='%s'",
+                libxl__json_object_get_integer(fd_num), opaque_str);
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
+    libxl__ev_time timeout_retry;
     libxl__ev_qmp qmp;
+    int retries;
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
@@ -865,6 +966,7 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
     libxl_device_disk *disks = NULL;
     int rc;
     libxl__cdrom_insert_state *cis;
+    libxl_domid stubdomid;
 
     GCNEW(cis);
     cis->ao = ao;
@@ -876,6 +978,8 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
     cis->qmp_lock.ao = ao;
     cis->qmp_lock.domid = domid;
     libxl__ev_time_init(&cis->time);
+    libxl__ev_time_init(&cis->timeout_retry);
+    cis->retries = 0;
     libxl__ev_qmp_init(&cis->qmp);
     cis->qmp.ao = ao;
     cis->qmp.domid = domid;
@@ -892,12 +996,6 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
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
@@ -905,7 +1003,22 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
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
@@ -920,7 +1033,7 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
         goto out;
     }
 
-    rc = libxl__device_disk_setdefault(gc, domid, disk, false);
+    rc = libxl__device_disk_setdefault(gc, cis->disk_domid, disk, false);
     if (rc) goto out;
 
     if (!disk->pdev_path) {
@@ -994,7 +1107,12 @@ static void cdrom_insert_qmp_connected(libxl__egc *egc, libxl__ev_qmp *qmp,
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
@@ -1002,6 +1120,224 @@ out:
     cdrom_insert_done(egc, cis, rc); /* must be last */
 }
 
+static void cdrom_insert_stubdom_query_fdset_rm(libxl__egc *egc,
+                                                libxl__ev_qmp *qmp,
+                                                const libxl__json_object *resp,
+                                                int rc)
+{
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
+    STATE_AO_GC(cis->ao);
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
+    if (fdset >= 0) goto found;
+    if (fdset != ERROR_NOTFOUND) {
+        rc = fdset;
+        goto out;
+    }
+
+    LOGD(DEBUG, cis->domid, "No fdset found - skipping remove-fd");
+    cdrom_insert_stubdom_ejected(egc, qmp, resp, 0);
+
+    return;
+
+ found:
+    cis->stubdom_fdset = fdset;
+
+    LOGD(DEBUG, cis->domid, "Found fdset %d", cis->stubdom_fdset);
+
+    libxl__json_object *args = NULL;
+
+    libxl__qmp_param_add_integer(gc, &args, "fdset-id", cis->stubdom_fdset);
+
+    cis->qmp.callback = cdrom_insert_stubdom_ejected;
+
+    rc = libxl__ev_qmp_send(egc, &cis->qmp, "remove-fd", args);
+    if (rc) goto out;
+
+    return;
+
+ out:
+    cdrom_insert_done(egc, cis, rc); /* must be last */
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
+    cdrom_insert_stubdom_query_fdset(egc, &cis->timeout_retry, NULL, aodev->rc);
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
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(ev, *cis, timeout_retry);
+
+    /* When called as an ev_time callback, rc will be ERROR_TIMEDOUT.*/
+    if (rc && rc != ERROR_TIMEDOUT) goto out;
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
+    if (fdset >= 0) goto found;
+    if (fdset != ERROR_NOTFOUND) {
+        rc = fdset;
+        goto out;
+    }
+
+    if (cis->retries++ > 10) {
+        LOGD(DEBUG, cis->domid, "Out of query-fdsets retries");
+        rc = ERROR_TIMEDOUT;
+        goto out;
+    }
+
+    LOGD(DEBUG, cis->domid, "Scheduling query-fdsets retry %d", cis->retries);
+    rc = libxl__ev_time_register_rel(cis->ao, &cis->timeout_retry,
+                                     cdrom_insert_stubdom_query_fdset,
+                                     200);
+    if (rc) goto out;
+
+    return;
+
+ found:
+    cis->stubdom_fdset = fdset;
+
+    LOGD(DEBUG, cis->domid, "Found fdset %d", cis->stubdom_fdset);
+    cdrom_insert_ejected(egc, &cis->qmp, NULL, rc);
+    return;
+
+ out:
+    cdrom_insert_done(egc, cis, rc); /* must be last */
+}
+
 static void cdrom_insert_ejected(libxl__egc *egc,
                                  libxl__ev_qmp *qmp,
                                  const libxl__json_object *response,
@@ -1026,7 +1362,7 @@ static void cdrom_insert_ejected(libxl__egc *egc,
 
     if (rc) goto out;
 
-    rc = libxl__device_from_disk(gc, domid, disk, &device);
+    rc = libxl__device_from_disk(gc, cis->disk_domid, disk, &device);
     if (rc) goto out;
     be_path = libxl__device_backend_path(gc, &device);
     libxl_path = libxl__device_libxl_path(gc, &device);
@@ -1081,10 +1417,13 @@ static void cdrom_insert_ejected(libxl__egc *egc,
     rc = libxl__dm_check_start(gc, &d_config, domid);
     if (rc) goto out;
 
+    /* A linux stubdom will perform add-fd with calculated stubdom_fdset. */
     if (cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN &&
+        libxl_get_stubdom_id(CTX, cis->domid) == 0 &&
         disk->format != LIBXL_DISK_FORMAT_EMPTY) {
         libxl__json_object *args = NULL;
 
+        LOGD(DEBUG, cis->domid, "Doing QMP add-fd path");
         assert(qmp->payload_fd == -1);
         qmp->payload_fd = open(disk->pdev_path, O_RDONLY);
         if (qmp->payload_fd < 0) {
@@ -1094,7 +1433,11 @@ static void cdrom_insert_ejected(libxl__egc *egc,
             goto out;
         }
 
-        /* This free form parameter is not use by QEMU or libxl. */
+        /*
+         * This free form parameter is not used by QEMU or non-stubdom libxl.
+         * For a linux stubdom, opaque is set to "stub-devid:$devid" to
+         * identify the fdset.
+         */
         QMP_PARAMETERS_SPRINTF(&args, "opaque", "%s:%s",
                                libxl_disk_format_to_string(disk->format),
                                disk->pdev_path);
@@ -1103,6 +1446,7 @@ static void cdrom_insert_ejected(libxl__egc *egc,
         if (rc) goto out;
         has_callback = true;
     } else {
+        LOGD(DEBUG, cis->domid, "Skipping QMP add-fd path");
         has_callback = false;
     }
 
@@ -1115,8 +1459,16 @@ out:
     if (rc) {
         cdrom_insert_done(egc, cis, rc); /* must be last */
     } else if (!has_callback) {
-        /* Only called if no asynchronous callback are set. */
-        cdrom_insert_inserted(egc, qmp, NULL, 0); /* must be last */
+        if (libxl_get_stubdom_id(CTX, cis->domid) &&
+            disk->format != LIBXL_DISK_FORMAT_EMPTY) {
+            LOGD(DEBUG, cis->domid,
+                 "stubdom %d needs to perform add-fd internally",
+                 libxl_get_stubdom_id(CTX, cis->domid));
+            cdrom_insert_addfd_cb(egc, qmp, NULL, 0); /* must be last */
+        } else  {
+            /* Only called if no asynchronous callback are set. */
+            cdrom_insert_inserted(egc, qmp, NULL, 0); /* must be last */
+        }
     }
 }
 
@@ -1135,17 +1487,22 @@ static void cdrom_insert_addfd_cb(libxl__egc *egc,
     /* convenience aliases */
     libxl_device_disk *disk = cis->disk;
 
-    close(qmp->payload_fd);
-    qmp->payload_fd = -1;
-
     if (rc) goto out;
 
-    o = libxl__json_map_get("fdset-id", response, JSON_INTEGER);
-    if (!o) {
-        rc = ERROR_FAIL;
-        goto out;
+    /* response non-NULL only for non-stubdom */
+    if (response) {
+        close(qmp->payload_fd);
+        qmp->payload_fd = -1;
+
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
@@ -1158,8 +1515,13 @@ static void cdrom_insert_addfd_cb(libxl__egc *egc,
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
@@ -1196,7 +1558,7 @@ static void cdrom_insert_inserted(libxl__egc *egc,
 
     if (rc) goto out;
 
-    rc = libxl__device_from_disk(gc, domid, disk, &device);
+    rc = libxl__device_from_disk(gc, cis->disk_domid, disk, &device);
     if (rc) goto out;
     be_path = libxl__device_backend_path(gc, &device);
     libxl_path = libxl__device_libxl_path(gc, &device);
@@ -1281,6 +1643,7 @@ static void cdrom_insert_done(libxl__egc *egc,
     EGC_GC;
 
     libxl__ev_time_deregister(gc, &cis->time);
+    libxl__ev_time_deregister(gc, &cis->timeout_retry);
     libxl__ev_qmp_dispose(gc, &cis->qmp);
     if (cis->qmp.payload_fd >= 0) close(cis->qmp.payload_fd);
     libxl__ev_slowlock_unlock(gc, &cis->qmp_lock);
-- 
2.39.2


