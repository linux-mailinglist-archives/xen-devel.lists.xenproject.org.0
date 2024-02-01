Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC18B8462B5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 22:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674717.1049853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVenT-0005rY-8q; Thu, 01 Feb 2024 21:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674717.1049853; Thu, 01 Feb 2024 21:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVenT-0005ph-4Y; Thu, 01 Feb 2024 21:40:35 +0000
Received: by outflank-mailman (input) for mailman id 674717;
 Thu, 01 Feb 2024 21:40:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzG+=JK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rVenR-0005Jd-Qq
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 21:40:33 +0000
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85fb3eb9-c14a-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 22:40:32 +0100 (CET)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-6040d9e52b9so14766197b3.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 13:40:32 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05620a21c700b007853eb72c49sm154978qka.46.2024.02.01.13.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 13:40:29 -0800 (PST)
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
X-Inumbo-ID: 85fb3eb9-c14a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706823630; x=1707428430; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucbmMMAbbZ+Pz4AdE+09SKz62vvqmDMnyT9AshCA9EQ=;
        b=Qsibb857iTEPS1EEvQDMv1Wz+TmQkg/EwlPqWKozxR3UH1IYEDkQvSAIaJKCyMrJQc
         R8ZNpsoTXmjJ/zwkGZJBApYJRhgqAJEiHA6+u2s9EafRGxZQ2BwesEGeTe4FovUnbqkc
         2awQVWK59lBmHQbDj7g+TBHgc1yGOW1sbkkltym96DOqMpg25cbjevZjSu9lancgoChk
         7y4e6fkwhDt4NSm9uXFLxOMrkXD2l+Z5rVuMc0YqpDLbnKoAmpR4v8yNFhA8W87pyk08
         Pxv3kTKcSnAFd61f5C7payadPlUYWeIDrgss3DUhKY0M8CwQCajdd9z+woCsXnrPXqXa
         d5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706823630; x=1707428430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucbmMMAbbZ+Pz4AdE+09SKz62vvqmDMnyT9AshCA9EQ=;
        b=VIpoGrOzpy7g5nNLGCaMOiBrW52SYDp6wKKB2TPHkmtHTMzdiLOeDO5oNbN6NfpJJs
         aZMDiiTH3ylYltn7WOWka6SHgiRiV45fkPWE1KqNe/doLKRDObSWDlPyITgjeKHSOuBB
         FCHrvgAG7FT61GNNJi5vMA0ORLU3ET8v2W/M04//DdG1ON6ZOItGiAzuYKEox2N9Evw2
         Xb/CVflISCg1inRMGOyLAi9LwAWJbNlxQ0I3yxMCzkr6T7kUsnF850/hsQ88PUivtt2Z
         91mX44L3nR9GDuk8z/PqcS3E0RAIDbO+hPhPwfdpNrc2hji4sDFZURWODamSfrqMxCnN
         I5iw==
X-Gm-Message-State: AOJu0YxBNaTiG1IM5z8MAjpiO/9Vr1vcHkLIHFL/s9L0jKFKErgQcJGd
	Njs9Vbovx1FQGs6Tm5lCHoOc1N0yugTdK4Whm+tSU10FukK8J3AnFhjBrPit
X-Google-Smtp-Source: AGHT+IGyZ3ROrgxWgwd9VmfOUiLAllEP63hV3T4NdJde0vqe3kbDuDiHRW5UFWDUI28W5/SabNCBWw==
X-Received: by 2002:a0d:cc53:0:b0:5ff:6b9e:cdd9 with SMTP id o80-20020a0dcc53000000b005ff6b9ecdd9mr463708ywd.46.1706823630026;
        Thu, 01 Feb 2024 13:40:30 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWt/eemjeAB0YsJRR+bss0JwPO4dcbAfWs7OXwO60kt3BD3y1I2eGHOBZL3aMxPpKLx8YYVZeNUEUmAMMNLGe99eaiJiz5jrUGQwORoA/L3/EG66/nsdnT8Yd4yV+zKju6qm0LYgtGFDem4UWXV9C1+PwFIa2cW4mOc4w==
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 2/3] libxl: Allow Phy backend for CDROM devices
Date: Thu,  1 Feb 2024 16:40:03 -0500
Message-ID: <20240201214004.238858-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201214004.238858-1-jandryuk@gmail.com>
References: <20240201214004.238858-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A Linux HVM domain ignores PV block devices with type cdrom.  The
Windows PV drivers also ignore device-type != "disk".  Therefore QEMU's
emulated CD-ROM support is used.  This allows ejection and other CD-ROM
features to work.

With a stubdom, QEMU is running in the stubdom.  A PV disk is still
connected into the stubdom, and then QEMU can emulate the CD-ROM into
the guest.  Phy support has been enhanced to provide a placeholder file
forempty disks, so it is usable as a CDROM backend as well.  Allow Phy
to pass the check as well.

(Bypassing just for a linux-based stubdom doesn't work because
libxl__device_disk_setdefault() gets called early in domain creation
before xenstore is populated with relevant information for the stubdom
type.  The build information isn't readily available and won't exist in
some call trees, so it isn't usable either.)

Let disk_try_backend() allow format empty for Phy cdrom drives.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Different approach to pass QDISK requirement check.
---
 tools/libs/light/libxl_device.c | 12 ++++++++----
 tools/libs/light/libxl_disk.c   | 11 +++++++----
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index 09d85928d7..f73c6705d4 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -301,13 +301,17 @@ static int disk_try_backend(disk_try_backend_args *a,
 
     switch (backend) {
     case LIBXL_DISK_BACKEND_PHY:
-        if (a->disk->format != LIBXL_DISK_FORMAT_RAW) {
-            goto bad_format;
-        }
-
         if (libxl_defbool_val(a->disk->colo_enable))
             goto bad_colo;
 
+        if (a->disk->is_cdrom && a->disk->format == LIBXL_DISK_FORMAT_EMPTY) {
+            LOG(DEBUG, "Disk vdev=%s is an empty cdrom", a->disk->vdev);
+            return backend;
+        }
+
+        if (a->disk->format != LIBXL_DISK_FORMAT_RAW)
+            goto bad_format;
+
         if (a->disk->backend_domid != LIBXL_TOOLSTACK_DOMID) {
             LOG(DEBUG, "Disk vdev=%s, is using a storage driver domain, "
                        "skipping physical device check", a->disk->vdev);
diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index c48e1de659..09082ffb58 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -188,15 +188,18 @@ static int libxl__device_disk_setdefault(libxl__gc *gc, uint32_t domid,
         return ERROR_FAIL;
     }
 
-    /* Force Qdisk backend for CDROM devices of guests with a device model. */
+    /* Only allow Qdisk or Phy for CDROM devices. */
     if (disk->is_cdrom != 0 &&
         libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
+        if (disk->backend == LIBXL_DISK_BACKEND_UNKNOWN)
+            disk->backend = LIBXL_DISK_BACKEND_QDISK;
+
         if (!(disk->backend == LIBXL_DISK_BACKEND_QDISK ||
-              disk->backend == LIBXL_DISK_BACKEND_UNKNOWN)) {
-            LOGD(ERROR, domid, "Backend for CD devices on HVM guests must be Qdisk");
+              disk->backend == LIBXL_DISK_BACKEND_PHY)) {
+            LOGD(ERROR, domid,
+                 "Backend for CD devices on HVM guests must be Qdisk or Phy");
             return ERROR_FAIL;
         }
-        disk->backend = LIBXL_DISK_BACKEND_QDISK;
     }
 
     if (disk->is_cdrom &&
-- 
2.43.0


