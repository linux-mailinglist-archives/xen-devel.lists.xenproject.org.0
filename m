Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67CE845FEE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 19:31:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674670.1049754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVbpm-0002ZV-JK; Thu, 01 Feb 2024 18:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674670.1049754; Thu, 01 Feb 2024 18:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVbpm-0002Xm-GH; Thu, 01 Feb 2024 18:30:46 +0000
Received: by outflank-mailman (input) for mailman id 674670;
 Thu, 01 Feb 2024 18:30:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzG+=JK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rVbpl-0002Wb-2Q
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 18:30:45 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 017bb2e7-c130-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 19:30:42 +0100 (CET)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-783d8e09a1cso73034085a.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 10:30:42 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 pf8-20020a056214498800b0068c75141e73sm25824qvb.2.2024.02.01.10.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 10:30:40 -0800 (PST)
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
X-Inumbo-ID: 017bb2e7-c130-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706812241; x=1707417041; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjjeoKX1m7W13o8Y7ZaEmX1lMzcVrUhBaLtbtuWZOxs=;
        b=WIQ8by9wMw2KvMGH49gSyXd36QEqZQA622acQ002jIMFMIxVWuGZul50oDt7i5ScWX
         VGBX8r3MhGIaeVc6xObwGA/QW+RORrZD9kH2tI7O+ujnhC9wZzu1BqQMBaPV0VHWEVlb
         hF5iTcRLKum26F2Qj6HhKkqsJf0v79pPU+9V48t/KcBMy2SlGUYKCKKoPOWJbXxRmZMZ
         v77EMJtgugJ0+G9Qd4aH8H5403vFnAXf/mNE5ahd8gINEbJ42b21gq4WEkpI7nkIi3aj
         SS0y37/8HIay1vvm2sEaAWPJ4c6tzXWR+4gnta7HyJE1tLGxJjRkNJcYvACCPh8LA/74
         EF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706812241; x=1707417041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjjeoKX1m7W13o8Y7ZaEmX1lMzcVrUhBaLtbtuWZOxs=;
        b=LgMm/hph4edgBqGNgiJnXrh9mdiOpUFAJcWLUbieDmZbCsoDUKBQa/+Iu/yojkN9nw
         M2BLVh7RXypRDDoWUnTQ2dlJZFmm+gMDf20iwvfgI2BylIc/qdsAKIuYsecLMNCjjhxO
         ip+H95wwFFhgRgnEgBvP27LHzwvxAb796hfiHBWHgv06QSR+/J8HBRjOXMpOzsW7LTKr
         cafheP6xhrP5CHgJX4ek3Ysoo0/J77Mzw0Vcq6950MF83GOpl1EvbxOoYs2H/lQW5U2o
         FNR1qW24WI9ESyFaLfrLY4qubAc7ImTkCNXz4IDwEfWnPq6jf4ceJD0LNOCM8bmfOlwE
         PG8g==
X-Gm-Message-State: AOJu0YxuhG1zHXVPq4o3Dcyk3AGkGDmg3WxkRUwoGOSz04gPJvUy/FhZ
	N94oPdX7qO9Nceh/KFNazy3QbvGzhXQ4h/lZttweBuJ1U5nTVb61jVQyqDGC
X-Google-Smtp-Source: AGHT+IFHvs1BSlxFAbLomRF+WK4BCyWVl6PudvCCCdULyTh8v4FtjY//z2fGun7qgHHPllbSX1rsxg==
X-Received: by 2002:ad4:4ea4:0:b0:68c:61bd:7765 with SMTP id ed4-20020ad44ea4000000b0068c61bd7765mr6903583qvb.45.1706812240849;
        Thu, 01 Feb 2024 10:30:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUYh1WG/ROL1iDB4lPXW50gxnr9Y/V7AJ3B0CY7+Ub0PhR7RfgTo5nnJIcli8/j7t8CiihQDJFiPSft5ZniYYiK7NPm1J2tGxvtsXgRUsFt6+hfcP8Zy4Ivq4HcVhDdMpnJHprtF7g=
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/4] libxl: Add support for blktap vbd3
Date: Thu,  1 Feb 2024 13:30:22 -0500
Message-ID: <20240201183024.145424-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201183024.145424-1-jandryuk@gmail.com>
References: <20240201183024.145424-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch re-introduces blktap support to libxl.  Unlike earlier
versions, it does not link against any blktap library.  libxl changes
are needed to write to the vbd3 backend XenStore nodes.

blktap has three components.  tapdisk is a daemon implementing the disk
IO, NBD (Network Block Device), and Xen PV interfaces.  tap-ctl is a
tool to control tapdisks - creating, starting, stopping and freeing.
tapback manages the XenStore operations and instructs tapdisk to
connect.

It is notable that tapdisk performs the grant and event channel ops, but
doesn't interact with XenStore.  tapback performs XenStore operations
and notifies tapdisks of values and changes.

The flow is: libxl writes to the "vbd3" XenStore nodes and runs the
block-tap script.  The block-tap script runs tap-ctl to create a tapdisk
instance as the physical device.  tapback then sees the tapdisk and
instructs the tapdisk to connect up the PV blkif interface.

This is expected to work without the kernel blktap driver, so the
block-tap script is modified accordingly to write the UNIX NBD path.

backendtype=tap was not fully removed previously, but it would never
succeed since it would hit the hardcoded error in disk_try_backend().
It is reused now.

An example command to attach a vhd:
xl block-attach vm 'vdev=xvdf,backendtype=tap,format=vhd,target=/srv/target.vhd'

Format raw also works to run an "aio:" tapdisk.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
VHD support is important for OpenXT since there are lots of existing
VHDs which still need supporting.  tapdisk also supports encrypting VHDs
which is not available in QEMU.
---
 docs/man/xl-disk-configuration.5.pod.in   |  4 +++-
 tools/libs/light/libxl_device.c           | 14 ++++++++++----
 tools/libs/light/libxl_disk.c             | 20 +++++++++++++++-----
 tools/libs/light/libxl_linux.c            |  1 +
 tools/libs/light/libxl_types_internal.idl |  1 +
 tools/libs/light/libxl_utils.c            |  2 ++
 6 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/docs/man/xl-disk-configuration.5.pod.in b/docs/man/xl-disk-configuration.5.pod.in
index bc945cc517..cb442bd5b4 100644
--- a/docs/man/xl-disk-configuration.5.pod.in
+++ b/docs/man/xl-disk-configuration.5.pod.in
@@ -232,7 +232,7 @@ Specifies the backend implementation to use
 
 =item Supported values
 
-phy, qdisk, standalone
+phy, qdisk, standalone, tap
 
 =item Mandatory
 
@@ -254,6 +254,8 @@ and "standalone" does not support specifications other than "virtio".
 Normally this option should not be specified, in which case libxl will
 automatically determine the most suitable backend.
 
+"tap" needs blktap's tapback to be running.
+
 
 =item B<script>=I<SCRIPT>
 
diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index 13da6e0573..ae2b71b0bf 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -328,9 +328,15 @@ static int disk_try_backend(disk_try_backend_args *a,
         return 0;
 
     case LIBXL_DISK_BACKEND_TAP:
-        LOG(DEBUG, "Disk vdev=%s, backend tap unsuitable because blktap "
-                   "not available", a->disk->vdev);
-        return 0;
+        if (a->disk->format != LIBXL_DISK_FORMAT_RAW &&
+            a->disk->format != LIBXL_DISK_FORMAT_VHD)
+            goto bad_format;
+
+        if (libxl_defbool_val(a->disk->colo_enable))
+            goto bad_colo;
+
+        LOG(DEBUG, "Disk vdev=%s, returning blktap", a->disk->vdev);
+        return backend;
 
     case LIBXL_DISK_BACKEND_QDISK:
         if (a->disk->script) goto bad_script;
@@ -478,7 +484,7 @@ char *libxl__device_disk_string_of_backend(libxl_disk_backend backend)
 {
     switch (backend) {
         case LIBXL_DISK_BACKEND_QDISK: return "qdisk";
-        case LIBXL_DISK_BACKEND_TAP: return "phy";
+        case LIBXL_DISK_BACKEND_TAP: return "vbd3";
         case LIBXL_DISK_BACKEND_PHY: return "phy";
         case LIBXL_DISK_BACKEND_STANDALONE: return "standalone";
         default: return NULL;
diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index ea3623dd6f..59ff996837 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -56,7 +56,9 @@ static void disk_eject_xswatch_callback(libxl__egc *egc, libxl__ev_xswatch *w,
             "/local/domain/%d/backend/%" TOSTRING(BACKEND_STRING_SIZE)
            "[a-z]/%*d/%*d",
            &disk->backend_domid, backend_type);
-    if (!strcmp(backend_type, "tap") || !strcmp(backend_type, "vbd")) {
+    if (!strcmp(backend_type, "tap") ||
+        !strcmp(backend_type, "vbd") ||
+        !strcmp(backend_type, "vbd3")) {
         disk->backend = LIBXL_DISK_BACKEND_TAP;
     } else if (!strcmp(backend_type, "qdisk")) {
         disk->backend = LIBXL_DISK_BACKEND_QDISK;
@@ -224,7 +226,7 @@ static int libxl__device_from_disk(libxl__gc *gc, uint32_t domid,
             device->backend_kind = LIBXL__DEVICE_KIND_VBD;
             break;
         case LIBXL_DISK_BACKEND_TAP:
-            device->backend_kind = LIBXL__DEVICE_KIND_VBD;
+            device->backend_kind = LIBXL__DEVICE_KIND_VBD3;
             break;
         case LIBXL_DISK_BACKEND_QDISK:
             device->backend_kind = LIBXL__DEVICE_KIND_QDISK;
@@ -368,9 +370,17 @@ static void device_disk_add(libxl__egc *egc, uint32_t domid,
                 assert(device->backend_kind == LIBXL__DEVICE_KIND_VIRTIO_DISK);
                 break;
             case LIBXL_DISK_BACKEND_TAP:
-                LOG(ERROR, "blktap is not supported");
-                rc = ERROR_FAIL;
-                goto out;
+                flexarray_append(back, "params");
+                flexarray_append(back, GCSPRINTF("%s:%s",
+                              libxl__device_disk_string_of_format(disk->format),
+                              disk->pdev_path ? : ""));
+
+                script = libxl__abs_path(gc, disk->script?: "block-tap",
+                                         libxl__xen_script_dir_path());
+                flexarray_append_pair(back, "script", script);
+
+                assert(device->backend_kind == LIBXL__DEVICE_KIND_VBD3);
+                break;
             case LIBXL_DISK_BACKEND_QDISK:
                 flexarray_append(back, "params");
                 flexarray_append(back, GCSPRINTF("%s:%s",
diff --git a/tools/libs/light/libxl_linux.c b/tools/libs/light/libxl_linux.c
index f7c92ba562..0b4c8bd045 100644
--- a/tools/libs/light/libxl_linux.c
+++ b/tools/libs/light/libxl_linux.c
@@ -207,6 +207,7 @@ int libxl__get_hotplug_script_info(libxl__gc *gc, libxl__device *dev,
 
     switch (dev->backend_kind) {
     case LIBXL__DEVICE_KIND_VBD:
+    case LIBXL__DEVICE_KIND_VBD3:
         if (num_exec != 0) {
             LOGD(DEBUG, dev->domid,
                  "num_exec %d, not running hotplug scripts", num_exec);
diff --git a/tools/libs/light/libxl_types_internal.idl b/tools/libs/light/libxl_types_internal.idl
index e24288f1a5..56dccac153 100644
--- a/tools/libs/light/libxl_types_internal.idl
+++ b/tools/libs/light/libxl_types_internal.idl
@@ -34,6 +34,7 @@ libxl__device_kind = Enumeration("device_kind", [
     (16, "VINPUT"),
     (17, "VIRTIO_DISK"),
     (18, "VIRTIO"),
+    (19, "VBD3"),
     ])
 
 libxl__console_backend = Enumeration("console_backend", [
diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_utils.c
index e403bd9bcf..10398a6c86 100644
--- a/tools/libs/light/libxl_utils.c
+++ b/tools/libs/light/libxl_utils.c
@@ -295,6 +295,8 @@ int libxl_string_to_backend(libxl_ctx *ctx, char *s, libxl_disk_backend *backend
         *backend = LIBXL_DISK_BACKEND_PHY;
     } else if (!strcmp(s, "file")) {
         *backend = LIBXL_DISK_BACKEND_TAP;
+    } else if (!strcmp(s, "vbd3")) {
+        *backend = LIBXL_DISK_BACKEND_TAP;
     } else if (!strcmp(s, "qdisk")) {
         *backend = LIBXL_DISK_BACKEND_QDISK;
     } else if (!strcmp(s, "standalone")) {
-- 
2.43.0


