Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C36828E9A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 21:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664987.1035154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNJ0R-0006YR-PC; Tue, 09 Jan 2024 20:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664987.1035154; Tue, 09 Jan 2024 20:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNJ0R-0006Vw-LY; Tue, 09 Jan 2024 20:47:27 +0000
Received: by outflank-mailman (input) for mailman id 664987;
 Tue, 09 Jan 2024 20:47:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qgrd=IT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNJ0Q-00065f-IX
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 20:47:26 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b26d17a-af30-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 21:47:25 +0100 (CET)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-781048954d9so302347385a.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 12:47:25 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 fh7-20020a05622a588700b00425442a2f32sm1181628qtb.16.2024.01.09.12.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 12:47:22 -0800 (PST)
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
X-Inumbo-ID: 4b26d17a-af30-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704833243; x=1705438043; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViNYWsZ+tkGR79TRKrSivtlEeNOudvbQVyhtr8+uN/E=;
        b=MGJXkSBuQ50lxH03dyV4VZfzfhW8XZ3GPCfcm6xGBNBEwvl4WTE6lc42b5Yi0kOs7T
         /ElecddymOH+KKx/ewmx79W3CKaKxZO0VROuws6jhUaD7AGeEHA0E0Fd93igre/EkkIO
         601l4ssCnS/QyVtOFs2u4JyF4sji37C8zwVapOuaxXSP2aZ54gyuEfjukeMh1L9aGsIo
         dduC57y0dZMtv1N245d4soKzHC0yo0HuUUWXXcoDSXZDsNtsI34KzjaTPm5xN701Rty3
         zmCWqtM4f8OH63jhKT4fuCE5IKdXGH8HkjG29iaSxN/NI4rJgMtJvisYT5E1SisJprOJ
         fngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704833243; x=1705438043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViNYWsZ+tkGR79TRKrSivtlEeNOudvbQVyhtr8+uN/E=;
        b=t5baqxLxpc2JDYJqU0OAQqmp8xESQeC8/ftdWFdQqgK2nMvADLRwXvXHDxgC+k66mH
         0CUN8Id6/NAVvvcaeUzOtqfxxWy2N2jK5aeGcIEDjK9ptu7GL4MqfCO2wSbZHVxIj0+V
         PAffozTA7/MpVgWYhY2KJ8D/LLQnAGNrudxjEU5lgcwUUO8q9E76QP8byT0YSjJZT8as
         b++I7VjdBUswTIWRU9G0DlZ80Yy5xYnSYalfPgAMTMOzCjkZBgaZ/XuYZoLf6U56L547
         j9Fycd7zSejcD+hAEGO/4dl8FctRz+dLW7TfMjoc9kph0sTyeeD73qFtjw2eRt68acu2
         pR8w==
X-Gm-Message-State: AOJu0YyMtsX+3vYLrFEi7WnxAjjlTx1hgcOIS7LJdVwCrMZ6l7R54CBg
	sr6jzAoX2tYK0o/UFFi2ZGos9Kiu7n8=
X-Google-Smtp-Source: AGHT+IHscg5iZ74EIuO9kXbFetliiq7+RRpobRy4DX1CQvjnWUATw/SswYp8bq5NLbgTBn/Jb4L7eQ==
X-Received: by 2002:a05:622a:351:b0:428:3ad6:e651 with SMTP id r17-20020a05622a035100b004283ad6e651mr37004qtw.14.1704833243446;
        Tue, 09 Jan 2024 12:47:23 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] libxl: Enable stubdom cdrom changing
Date: Tue,  9 Jan 2024 15:46:55 -0500
Message-ID: <20240109204655.72063-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109204655.72063-1-jandryuk@gmail.com>
References: <20240109204655.72063-1-jandryuk@gmail.com>
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
that is internal to the stubdom, so a delay and retries are added to
around calling cdrom_insert_addfd_cb().

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 docs/misc/stubdom.txt         |  16 ++
 tools/libs/light/libxl_disk.c | 299 ++++++++++++++++++++++++++++++----
 2 files changed, 285 insertions(+), 30 deletions(-)

diff --git a/docs/misc/stubdom.txt b/docs/misc/stubdom.txt
index c717a95d17..1b2380ae8f 100644
--- a/docs/misc/stubdom.txt
+++ b/docs/misc/stubdom.txt
@@ -127,6 +127,22 @@ Limitations:
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
+The QMP change insert uses fdset-id STUBDOM_FDSET_CD + $disk - 'a'.
+That is, hda -> 'a', so
+STUBDOM_FDSET_CD + 'a' - 'a' = STUBDOM_FDSET_CD.
+For hdc:
+STUBDOM_FDSET_CD + 'c' - 'a' = STUBDOM_FDSET_CD + 2.
+
+The stubdom must internally handle adding /dev/xvdc to the appropriate
+fdset.
 
                                    PV-GRUB
                                    =======
diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index d1f84ef404..c67da510f2 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -790,25 +790,46 @@ int libxl_device_disk_getinfo(libxl_ctx *ctx, uint32_t domid,
 
 typedef struct {
     libxl__ao *ao;
+    libxl__ao_device aodev;
+    libxl__ao_device aodev_del;
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
+static void cdrom_insert_stubdom_removefd(libxl__egc *egc, libxl__ev_qmp *qmp,
+                                          const libxl__json_object *response,
+                                          int rc);
+static void cdrom_insert_stubdom_ejected(libxl__egc *egc, libxl__ev_qmp *,
+                                         const libxl__json_object *, int rc);
+static void cdrom_insert_stubdom_disk_ejected_aocomplete(libxl__egc *egc,
+                                                         libxl__ao_device *aodev);
+static void cdrom_insert_stubdom_disk_ejected(libxl__egc *egc, libxl__ev_qmp *,
+                                              const libxl__json_object *,
+                                              int rc);
+static void cdrom_insert_ejected_aodevcb(libxl__egc *egc,
+                                         libxl__ao_device *aodev);
 static void cdrom_insert_ejected(libxl__egc *egc, libxl__ev_qmp *,
                                  const libxl__json_object *, int rc);
 static void cdrom_insert_addfd_cb(libxl__egc *egc, libxl__ev_qmp *,
                                   const libxl__json_object *, int rc);
 static void cdrom_insert_inserted(libxl__egc *egc, libxl__ev_qmp *,
                                   const libxl__json_object *, int rc);
+static void cdrom_insert_addfd_retry(libxl__egc *egc, libxl__ev_time *ev,
+                                     const struct timeval *requested_abs,
+                                     int rc);
 static void cdrom_insert_timout(libxl__egc *egc, libxl__ev_time *ev,
                                 const struct timeval *requested_abs,
                                 int rc);
@@ -824,6 +845,7 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
     libxl_device_disk *disks = NULL;
     int rc;
     libxl__cdrom_insert_state *cis;
+    libxl_domid stubdomid;
 
     GCNEW(cis);
     cis->ao = ao;
@@ -835,6 +857,8 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
     cis->qmp_lock.ao = ao;
     cis->qmp_lock.domid = domid;
     libxl__ev_time_init(&cis->time);
+    libxl__ev_time_init(&cis->timeout_retry);
+    cis->retries = 0;
     libxl__ev_qmp_init(&cis->qmp);
     cis->qmp.ao = ao;
     cis->qmp.domid = domid;
@@ -851,12 +875,6 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
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
@@ -864,7 +882,14 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
         goto out;
     }
 
-    disks = libxl__device_list(gc, &libxl__disk_devtype, domid, &num);
+    stubdomid = libxl_get_stubdom_id(CTX, cis->domid);
+    if (stubdomid == 0) {
+        cis->disk_domid = domid;
+    } else {
+        cis->disk_domid = stubdomid;
+    }
+
+    disks = libxl__device_list(gc, &libxl__disk_devtype, cis->disk_domid, &num);
     for (i = 0; i < num; i++) {
         if (disks[i].is_cdrom && !strcmp(disk->vdev, disks[i].vdev))
         {
@@ -879,7 +904,7 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
         goto out;
     }
 
-    rc = libxl__device_disk_setdefault(gc, domid, disk, false);
+    rc = libxl__device_disk_setdefault(gc, cis->disk_domid, disk, false);
     if (rc) goto out;
 
     if (!disk->pdev_path) {
@@ -887,6 +912,18 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
         disk->format = LIBXL_DISK_FORMAT_EMPTY;
     }
 
+#define STUBDOM_FDSET_CD 8000
+    if (strncmp(disk->vdev, "hd", 2) == 0) {
+	    cis->stubdom_fdset = STUBDOM_FDSET_CD + disk->vdev[2] - 'a';
+    } else if (strncmp(disk->vdev, "xvd", 3) == 0) {
+	    cis->stubdom_fdset = STUBDOM_FDSET_CD + disk->vdev[3] - 'a';
+    } else {
+        LOGD(ERROR, cis->domid, "disk->vdev \"%s\" isn't hdX or xvdY",
+             disk->vdev);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
 out:
     libxl__device_list_free(&libxl__disk_devtype, disks, num);
     if (rc) {
@@ -905,6 +942,7 @@ static void cdrom_insert_lock_acquired(libxl__egc *egc,
     libxl__cdrom_insert_state *cis = CONTAINER_OF(lock, *cis, qmp_lock);
     STATE_AO_GC(cis->ao);
 
+    LOGD(DEBUG, cis->domid, "rc=%d", rc);
     if (rc) goto out;
 
     rc = libxl__ev_time_register_rel(ao, &cis->time,
@@ -953,7 +991,12 @@ static void cdrom_insert_qmp_connected(libxl__egc *egc, libxl__ev_qmp *qmp,
         QMP_PARAMETERS_SPRINTF(&args, "id", "ide-%i", devid);
     else
         QMP_PARAMETERS_SPRINTF(&args, "device", "ide-%i", devid);
-    qmp->callback = cdrom_insert_ejected;
+
+    if (libxl_get_stubdom_id(CTX, cis->domid))
+        qmp->callback = cdrom_insert_stubdom_removefd;
+    else
+        qmp->callback = cdrom_insert_ejected;
+
     rc = libxl__ev_qmp_send(egc, qmp, "eject", args);
     if (rc) goto out;
     return;
@@ -961,6 +1004,147 @@ out:
     cdrom_insert_done(egc, cis, rc); /* must be last */
 }
 
+static void cdrom_insert_stubdom_removefd(libxl__egc *egc, libxl__ev_qmp *qmp,
+                                          const libxl__json_object *response,
+                                          int rc)
+{
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
+    STATE_AO_GC(cis->ao);
+
+    if (rc) goto out;
+
+    /* Only called for qemu-xen/linux stubdom. */
+    assert(cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN);
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
+out:
+    cdrom_insert_done(egc, cis, rc); /* must be last */
+}
+
+static void cdrom_insert_stubdom_ejected(libxl__egc *egc, libxl__ev_qmp *qmp,
+                                         const libxl__json_object *response,
+                                         int rc)
+{
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
+    libxl__device *device;
+    STATE_AO_GC(cis->ao);
+    domid_t stubdomid = libxl_get_stubdom_id(CTX, cis->domid);
+
+    LOGD(DEBUG, cis->domid, "rc=%d", rc);
+    /* cis->stubdom_fdset is initially empty, so remove-fd fails the first
+     * call with:
+     * {"error": {"class": "GenericError",
+     *            "desc": "File descriptor named 'fdset-id:8675' not found"}}
+     * Carry on in that case. */
+    if (rc && rc != ERROR_QMP_GENERIC_ERROR) goto out;
+
+    GCNEW(device);
+    rc = libxl__device_from_disk(gc, stubdomid, cis->disk, device);
+    if (rc != 0) goto out;
+
+    /* block dev eject */
+    /* Below is basically an open coding of:
+     * libxl_device_disk__remove(CTX, cis->domid, cis->disk, 0);
+     * ...since we can't call it from within libxl.
+     */
+    libxl__prepare_ao_device(ao, &cis->aodev_del);
+    cis->aodev_del.action = LIBXL__DEVICE_ACTION_REMOVE;
+    cis->aodev_del.dev = device;
+    cis->aodev_del.callback = cdrom_insert_stubdom_disk_ejected_aocomplete;
+    cis->aodev_del.force.flag = LIBXL__FORCE_OFF;
+    libxl__initiate_device_generic_remove(egc, &cis->aodev_del);
+    return;
+
+ out:
+    cdrom_insert_done(egc, cis, rc); /* must be last */
+}
+
+static void cdrom_insert_stubdom_disk_ejected_aocomplete(libxl__egc *egc,
+                                                         libxl__ao_device *aodev)
+{
+    STATE_AO_GC(aodev->ao);
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(aodev, *cis, aodev_del);
+
+    LOGD(DEBUG, cis->domid, "rc=%d", aodev->rc);
+    if (aodev->rc) {
+        if (aodev->dev) {
+            LOGD(ERROR, aodev->dev->domid, "Unable to %s %s with id %u",
+                        libxl__device_action_to_string(aodev->action),
+                        libxl__device_kind_to_string(aodev->dev->kind),
+                        aodev->dev->devid);
+        } else {
+            LOG(ERROR, "unable to %s device",
+                       libxl__device_action_to_string(aodev->action));
+        }
+        goto out;
+    }
+
+    cdrom_insert_stubdom_disk_ejected(egc, &cis->qmp, NULL, aodev->rc);
+    return;
+
+ out:
+    cdrom_insert_done(egc, cis, aodev->rc);
+}
+
+static void cdrom_insert_stubdom_disk_ejected(libxl__egc *egc,
+                                              libxl__ev_qmp *qmp,
+                                              const libxl__json_object *response,
+                                              int rc)
+{
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
+    STATE_AO_GC(cis->ao);
+    domid_t stubdomid = libxl_get_stubdom_id(CTX, cis->domid);
+
+    LOGD(DEBUG, cis->domid, "rc=%d", rc);
+    if (rc) goto out;
+
+    /* block dev insert */
+    libxl__prepare_ao_device(ao, &cis->aodev);
+    /* set an ao callback to end up in cdrom_insert_ejected */
+    cis->aodev.callback = cdrom_insert_ejected_aodevcb;
+    libxl__device_disk_add(egc, stubdomid, cis->disk, &cis->aodev);
+    return;
+
+ out:
+    cdrom_insert_done(egc, cis, rc); /* must be last */
+}
+
+static void cdrom_insert_ejected_aodevcb(libxl__egc *egc,
+                                         libxl__ao_device *aodev)
+{
+    STATE_AO_GC(aodev->ao);
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(aodev, *cis, aodev);
+
+    LOGD(DEBUG, cis->domid, "rc=%d", aodev->rc);
+    if (aodev->rc) {
+        if (aodev->dev) {
+            LOGD(ERROR, aodev->dev->domid, "Unable to %s %s with id %u",
+                        libxl__device_action_to_string(aodev->action),
+                        libxl__device_kind_to_string(aodev->dev->kind),
+                        aodev->dev->devid);
+        } else {
+            LOG(ERROR, "unable to %s device",
+                       libxl__device_action_to_string(aodev->action));
+        }
+        goto out;
+    }
+
+    cdrom_insert_ejected(egc, &cis->qmp, NULL, aodev->rc);
+    return;
+
+ out:
+    cdrom_insert_done(egc, cis, aodev->rc);
+}
+
 static void cdrom_insert_ejected(libxl__egc *egc,
                                  libxl__ev_qmp *qmp,
                                  const libxl__json_object *response,
@@ -983,9 +1167,10 @@ static void cdrom_insert_ejected(libxl__egc *egc,
 
     libxl_domain_config_init(&d_config);
 
+    LOGD(DEBUG, cis->domid, "rc=%d", rc);
     if (rc) goto out;
 
-    rc = libxl__device_from_disk(gc, domid, disk, &device);
+    rc = libxl__device_from_disk(gc, cis->disk_domid, disk, &device);
     if (rc) goto out;
     be_path = libxl__device_backend_path(gc, &device);
     libxl_path = libxl__device_libxl_path(gc, &device);
@@ -1032,7 +1217,7 @@ static void cdrom_insert_ejected(libxl__egc *egc,
      */
 
     rc = libxl__get_domain_configuration(gc, domid, &d_config);
-    if (rc) goto out;
+    if (rc && rc != ERROR_JSON_CONFIG_EMPTY) goto out;
 
     device_add_domain_config(gc, &d_config, &libxl__disk_devtype,
                              &cis->disk_saved);
@@ -1040,10 +1225,15 @@ static void cdrom_insert_ejected(libxl__egc *egc,
     rc = libxl__dm_check_start(gc, &d_config, domid);
     if (rc) goto out;
 
+    LOGD(DEBUG, cis->domid, "stubdom_id=%d",
+                libxl_get_stubdom_id(CTX, cis->domid));
+    /* A linux stubdom will perform add-fd with calculated stubdom_fdset. */
     if (cis->dm_ver == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN &&
+        libxl_get_stubdom_id(CTX, cis->domid) == 0 &&
         disk->format != LIBXL_DISK_FORMAT_EMPTY) {
         libxl__json_object *args = NULL;
 
+        LOGD(DEBUG, cis->domid, "Doing qmp add-fd path");
         assert(qmp->payload_fd == -1);
         qmp->payload_fd = open(disk->pdev_path, O_RDONLY);
         if (qmp->payload_fd < 0) {
@@ -1062,20 +1252,28 @@ static void cdrom_insert_ejected(libxl__egc *egc,
         if (rc) goto out;
         has_callback = true;
     } else {
+        LOGD(DEBUG, cis->domid, "Skipping qmp add-fd path");
         has_callback = false;
     }
 
     rc = 0;
 
 out:
+    LOGD(DEBUG, cis->domid, "out label rc=%d", rc);
     libxl__xs_transaction_abort(gc, &t);
     libxl_domain_config_dispose(&d_config);
     if (data_lock) libxl__unlock_file(data_lock);
     if (rc) {
         cdrom_insert_done(egc, cis, rc); /* must be last */
     } else if (!has_callback) {
-        /* Only called if no asynchronous callback are set. */
-        cdrom_insert_inserted(egc, qmp, NULL, 0); /* must be last */
+        LOGD(DEBUG, cis->domid, "no callback; stubdom_id=%d",
+                libxl_get_stubdom_id(CTX, cis->domid));
+        if (libxl_get_stubdom_id(CTX, cis->domid) == 0) {
+            /* Only called if no asynchronous callback are set. */
+            cdrom_insert_inserted(egc, qmp, NULL, 0); /* must be last */
+        } else {
+            cdrom_insert_addfd_cb(egc, qmp, NULL, 0);
+        }
     }
 }
 
@@ -1094,17 +1292,24 @@ static void cdrom_insert_addfd_cb(libxl__egc *egc,
     /* convenience aliases */
     libxl_device_disk *disk = cis->disk;
 
-    close(qmp->payload_fd);
-    qmp->payload_fd = -1;
+    LOGD(DEBUG, cis->domid, "rc=%d", rc);
 
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
@@ -1117,8 +1322,13 @@ static void cdrom_insert_addfd_cb(libxl__egc *egc,
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
@@ -1132,13 +1342,22 @@ out:
         cdrom_insert_done(egc, cis, rc); /* must be last */
 }
 
+static void cdrom_insert_addfd_retry(libxl__egc *egc, libxl__ev_time *ev,
+                                     const struct timeval *requested_abs,
+                                     int rc)
+{
+    libxl__cdrom_insert_state *cis = CONTAINER_OF(ev, *cis, timeout_retry);
+
+    cdrom_insert_addfd_cb(egc, &cis->qmp, NULL, 0);
+}
+
 static void cdrom_insert_inserted(libxl__egc *egc,
                                   libxl__ev_qmp *qmp,
                                   const libxl__json_object *response,
                                   int rc)
 {
-    EGC_GC;
     libxl__cdrom_insert_state *cis = CONTAINER_OF(qmp, *cis, qmp);
+    STATE_AO_GC(cis->ao);
     libxl__flock *data_lock = NULL;
     libxl_domain_config d_config;
     flexarray_t *insert = NULL;
@@ -1153,9 +1372,22 @@ static void cdrom_insert_inserted(libxl__egc *egc,
 
     libxl_domain_config_init(&d_config);
 
-    if (rc) goto out;
+    LOGD(DEBUG, cis->domid, "rc=%d", rc);
+
+    if (rc) {
+        if (cis->retries++ < 10 ) {
+            LOGD(DEBUG, qmp->domid, "Retrying QMP cdrom change\n");
+            rc = libxl__ev_time_register_rel(ao, &cis->timeout_retry,
+                                             cdrom_insert_addfd_retry, 100);
+            if (rc) goto out;
+
+            return;
+        } else {
+            goto out;
+        }
+    }
 
-    rc = libxl__device_from_disk(gc, domid, disk, &device);
+    rc = libxl__device_from_disk(gc, cis->disk_domid, disk, &device);
     if (rc) goto out;
     be_path = libxl__device_backend_path(gc, &device);
     libxl_path = libxl__device_libxl_path(gc, &device);
@@ -1167,7 +1399,7 @@ static void cdrom_insert_inserted(libxl__egc *egc,
     }
 
     rc = libxl__get_domain_configuration(gc, domid, &d_config);
-    if (rc) goto out;
+    if (rc && rc != ERROR_JSON_CONFIG_EMPTY) goto out;
 
     device_add_domain_config(gc, &d_config, &libxl__disk_devtype,
                              &cis->disk_saved);
@@ -1176,10 +1408,14 @@ static void cdrom_insert_inserted(libxl__egc *egc,
     flexarray_append_pair(insert, "type",
                       libxl__device_disk_string_of_backend(disk->backend));
     if (disk->format != LIBXL_DISK_FORMAT_EMPTY)
-        flexarray_append_pair(insert, "params",
-                    GCSPRINTF("%s:%s",
-                        libxl__device_disk_string_of_format(disk->format),
-                        disk->pdev_path));
+        if (disk->backend == LIBXL_DISK_BACKEND_QDISK) {
+            flexarray_append_pair(insert, "params",
+                        GCSPRINTF("%s:%s",
+                            libxl__device_disk_string_of_format(disk->format),
+                            disk->pdev_path));
+        } else {
+            flexarray_append_pair(insert, "params", disk->pdev_path);
+        }
     else
         flexarray_append_pair(insert, "params", "");
 
@@ -1237,7 +1473,10 @@ static void cdrom_insert_done(libxl__egc *egc,
 {
     EGC_GC;
 
+    LOGD(DEBUG, cis->domid, "rc=%d", rc);
+
     libxl__ev_time_deregister(gc, &cis->time);
+    libxl__ev_time_deregister(gc, &cis->timeout_retry);
     libxl__ev_qmp_dispose(gc, &cis->qmp);
     if (cis->qmp.payload_fd >= 0) close(cis->qmp.payload_fd);
     libxl__ev_slowlock_unlock(gc, &cis->qmp_lock);
-- 
2.43.0


