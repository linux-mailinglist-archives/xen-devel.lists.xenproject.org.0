Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ACF8462B7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 22:40:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674718.1049864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVenW-00069p-Ff; Thu, 01 Feb 2024 21:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674718.1049864; Thu, 01 Feb 2024 21:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVenW-00067a-Bg; Thu, 01 Feb 2024 21:40:38 +0000
Received: by outflank-mailman (input) for mailman id 674718;
 Thu, 01 Feb 2024 21:40:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzG+=JK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rVenU-0005YC-HZ
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 21:40:36 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87c20d68-c14a-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 22:40:35 +0100 (CET)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-78407987510so70292385a.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 13:40:35 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05620a21c700b007853eb72c49sm154978qka.46.2024.02.01.13.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 13:40:33 -0800 (PST)
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
X-Inumbo-ID: 87c20d68-c14a-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706823634; x=1707428434; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wX9UDy1UxiRe7Hnzf1ly24vLwl89/WjFYev/11/D2g4=;
        b=lmwXYq9LM8MDYhc6H6NeZ9DkM9l0o/2eeS8k5YUUgL8cbHEiUOnTzoQjlFf0+IEBMq
         JmHkaiFJ7Sl8IUXmKKNwsIiLxvG5PuFLqfCPTB9TxeYEVNvtHP4ZPM8XJWh0QzwQPC6B
         /cjRhFXvv1XF3dvRUt0OvXI6XZL00NRxpJExoo1wu4YTG2CiJmdlOE6Pk5fjpMw/9JoC
         lBWbsV2ffldjX0vFS5oSjOWTFVrF62EY2f1HFI3NwOqPR9ngjH2HVEM2adjIxBRlZMyt
         IeixCdBnR3rbJyiOMas062WoHg+ixhHFZ+32g2uts4T4GhGLPcVL+0gwUHFU/Rf1C36W
         hXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706823634; x=1707428434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wX9UDy1UxiRe7Hnzf1ly24vLwl89/WjFYev/11/D2g4=;
        b=vyLGAKyXASIwaYXbeOfDpEUNJ6BbiZXRolNAZU4DThH0a1QxRDwe1Iw81WSN4vKBVC
         H6Az96ABnOC0tXWxhTIJuB6bpt0WJxw9fWC4RaqIUPnZl01JpJb/p/11IOKYP9zrZcmT
         jAKOhFFiUc6utbfJYAYND8x3r6Q+VR+GaTWR7BJ7oqEYzNnsMaQnxTi0BnIDyRDcYdvy
         cplW068nFw1BbnG169fu2Y6uuRCaCnaedZAdDbe6gyymTI65W2ueABPpRHrneawotNkh
         wzcZi5kYKVQU9eQuX6aWZ2MwIvRjEpAs7TTNC0cHqcbG5gtIScJ0hO051nxyMD9/bd8N
         pItA==
X-Gm-Message-State: AOJu0YyKwciZ/efvCYxYDgHlAeRCdR6RMQVkvv/4MRlCqlm59tBnBQAi
	UXI4I24YO3EXdx36nnx87hF6/tWRClAM/jf1Zrn7kSFyy5BHlF2vfwfXINge
X-Google-Smtp-Source: AGHT+IEX178TypQ98U+CByn1kT4kVETUvyWOs9cB5bGAMhTVzG7Y7WLPgidUFDvGOT4uGCSHRj2/1g==
X-Received: by 2002:a05:620a:248b:b0:783:9ab7:374 with SMTP id i11-20020a05620a248b00b007839ab70374mr4495234qkn.8.1706823633759;
        Thu, 01 Feb 2024 13:40:33 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXgOnxKl8woBEDI2950HAGp1QbE3WzPvs7NrYFP6KZwAFr/Z3wtM10l01aHKQCriAJNUMBtPgK9eG5IGrATujMSueXD3gSuQKWYSKR9Td5DtC6cwhkdr+2Sbg27/1XQCtiq+cfNj0sLuSjnNKQHz73oesTxlZDozfKoZX2VjWfzq+GGpGwwKRvn1QwmRWl1zqexnlcZfT652TxoPLlhutevKomA3YfcMp61fC7guhh6brcBdCKLSuMgqKdIEgj+0vjVcy/ayyIuMW1PAIW7jehMB1Qgz4WqtfXmJXHZdrrc43BiK6SX4feM7k4=
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 3/3] libxl: Enable stubdom cdrom changing
Date: Thu,  1 Feb 2024 16:40:04 -0500
Message-ID: <20240201214004.238858-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201214004.238858-1-jandryuk@gmail.com>
References: <20240201214004.238858-1-jandryuk@gmail.com>
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

For cd-eject, we still need to attach the empty vbd.  This is necessary
since xenstore is used to determine that hdc exists.  Otherwise after
eject, hdc would be gone and the cd-insert would fail to find the drive
to insert new media.

The ERROR_JSON_CONFIG_EMPTY check in cdrom_insert_inserted() is because
a stubdom don't have a json config.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Only allow for Linux stubdoms (Marek)
Fix cd-eject
Fix errant hard tabs
Move the debug print and into the special case.
---
 docs/misc/stubdom.txt         |  16 ++
 tools/libs/light/libxl_disk.c | 298 +++++++++++++++++++++++++++++++---
 2 files changed, 288 insertions(+), 26 deletions(-)

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
index 09082ffb58..6354982c05 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -808,25 +808,46 @@ int libxl_device_disk_getinfo(libxl_ctx *ctx, uint32_t domid,
 
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
@@ -842,6 +863,7 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
     libxl_device_disk *disks = NULL;
     int rc;
     libxl__cdrom_insert_state *cis;
+    libxl_domid stubdomid;
 
     GCNEW(cis);
     cis->ao = ao;
@@ -853,6 +875,8 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
     cis->qmp_lock.ao = ao;
     cis->qmp_lock.domid = domid;
     libxl__ev_time_init(&cis->time);
+    libxl__ev_time_init(&cis->timeout_retry);
+    cis->retries = 0;
     libxl__ev_qmp_init(&cis->qmp);
     cis->qmp.ao = ao;
     cis->qmp.domid = domid;
@@ -869,12 +893,6 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
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
@@ -882,7 +900,22 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
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
@@ -897,7 +930,7 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
         goto out;
     }
 
-    rc = libxl__device_disk_setdefault(gc, domid, disk, false);
+    rc = libxl__device_disk_setdefault(gc, cis->disk_domid, disk, false);
     if (rc) goto out;
 
     if (!disk->pdev_path) {
@@ -905,6 +938,18 @@ int libxl_cdrom_insert(libxl_ctx *ctx, uint32_t domid, libxl_device_disk *disk,
         disk->format = LIBXL_DISK_FORMAT_EMPTY;
     }
 
+#define STUBDOM_FDSET_CD 8000
+    if (strncmp(disk->vdev, "hd", 2) == 0) {
+        cis->stubdom_fdset = STUBDOM_FDSET_CD + disk->vdev[2] - 'a';
+    } else if (strncmp(disk->vdev, "xvd", 3) == 0) {
+        cis->stubdom_fdset = STUBDOM_FDSET_CD + disk->vdev[3] - 'a';
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
@@ -923,6 +968,7 @@ static void cdrom_insert_lock_acquired(libxl__egc *egc,
     libxl__cdrom_insert_state *cis = CONTAINER_OF(lock, *cis, qmp_lock);
     STATE_AO_GC(cis->ao);
 
+    LOGD(DEBUG, cis->domid, "rc=%d", rc);
     if (rc) goto out;
 
     rc = libxl__ev_time_register_rel(ao, &cis->time,
@@ -971,7 +1017,12 @@ static void cdrom_insert_qmp_connected(libxl__egc *egc, libxl__ev_qmp *qmp,
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
@@ -979,6 +1030,148 @@ out:
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
+    /* block dev insert - this may be inserting an empty disk for eject. */
+    libxl__prepare_ao_device(ao, &cis->aodev);
+    /* set an ao callback to end up in cdrom_insert_ejected */
+    cis->aodev.callback = cdrom_insert_ejected_aodevcb;
+    libxl__device_disk_add(egc, stubdomid, cis->disk, &cis->aodev);
+
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
@@ -1001,9 +1194,10 @@ static void cdrom_insert_ejected(libxl__egc *egc,
 
     libxl_domain_config_init(&d_config);
 
+    LOGD(DEBUG, cis->domid, "rc=%d", rc);
     if (rc) goto out;
 
-    rc = libxl__device_from_disk(gc, domid, disk, &device);
+    rc = libxl__device_from_disk(gc, cis->disk_domid, disk, &device);
     if (rc) goto out;
     be_path = libxl__device_backend_path(gc, &device);
     libxl_path = libxl__device_libxl_path(gc, &device);
@@ -1050,7 +1244,7 @@ static void cdrom_insert_ejected(libxl__egc *egc,
      */
 
     rc = libxl__get_domain_configuration(gc, domid, &d_config);
-    if (rc) goto out;
+    if (rc && rc != ERROR_JSON_CONFIG_EMPTY) goto out;
 
     device_add_domain_config(gc, &d_config, &libxl__disk_devtype,
                              &cis->disk_saved);
@@ -1058,10 +1252,15 @@ static void cdrom_insert_ejected(libxl__egc *egc,
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
@@ -1080,20 +1279,30 @@ static void cdrom_insert_ejected(libxl__egc *egc,
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
 
@@ -1112,17 +1321,24 @@ static void cdrom_insert_addfd_cb(libxl__egc *egc,
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
@@ -1135,8 +1351,13 @@ static void cdrom_insert_addfd_cb(libxl__egc *egc,
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
@@ -1150,13 +1371,22 @@ out:
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
@@ -1171,9 +1401,22 @@ static void cdrom_insert_inserted(libxl__egc *egc,
 
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
 
-    rc = libxl__device_from_disk(gc, domid, disk, &device);
+            return;
+        } else {
+            goto out;
+        }
+    }
+
+    rc = libxl__device_from_disk(gc, cis->disk_domid, disk, &device);
     if (rc) goto out;
     be_path = libxl__device_backend_path(gc, &device);
     libxl_path = libxl__device_libxl_path(gc, &device);
@@ -1185,7 +1428,7 @@ static void cdrom_insert_inserted(libxl__egc *egc,
     }
 
     rc = libxl__get_domain_configuration(gc, domid, &d_config);
-    if (rc) goto out;
+    if (rc && rc != ERROR_JSON_CONFIG_EMPTY) goto out;
 
     device_add_domain_config(gc, &d_config, &libxl__disk_devtype,
                              &cis->disk_saved);
@@ -1257,7 +1500,10 @@ static void cdrom_insert_done(libxl__egc *egc,
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


