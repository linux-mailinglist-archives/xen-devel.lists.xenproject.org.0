Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3588462B4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 22:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674716.1049844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVenP-0005cG-Va; Thu, 01 Feb 2024 21:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674716.1049844; Thu, 01 Feb 2024 21:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVenP-0005Yx-S8; Thu, 01 Feb 2024 21:40:31 +0000
Received: by outflank-mailman (input) for mailman id 674716;
 Thu, 01 Feb 2024 21:40:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzG+=JK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rVenN-0005YC-PJ
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 21:40:29 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83c67fe8-c14a-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 22:40:28 +0100 (CET)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-783d4b3a00bso100070885a.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 13:40:28 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05620a21c700b007853eb72c49sm154978qka.46.2024.02.01.13.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 13:40:26 -0800 (PST)
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
X-Inumbo-ID: 83c67fe8-c14a-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706823627; x=1707428427; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkexTyneUo8yDBZMkq46yZq63xLJ/JfR3uJQ589GQF4=;
        b=aMbHaPRdMZxgH0MmI0cZagUUrvBf+uCDs2Li3M/7v/JjuaHESdDmjwNSkHTCyS0vu9
         U46JZzZTN8Ka0BfP0AcGJata3CNGz/UXm9OBTtNKOXj3VuRh22DYCAeA/Sch57mV2lyZ
         pvlz6vjBn/2UlmP32a8QedqyP8+i+9upuz1g6IXfTjstnmtnm9CE8ki7tm6KbNvmEw6a
         6R5oEgwnOeJlPQvZA0HFJPOsEIAnVPc0fkyZaApjR1cu2i9FiGUBWKO/IhZUgPDJw8Br
         /esNCGEtVJT+IFQHiMuAdl7WQE0gmc3H5D+m5k5LmsBNZXi6JnvlrJXHNOVntrh8qSV1
         pR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706823627; x=1707428427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkexTyneUo8yDBZMkq46yZq63xLJ/JfR3uJQ589GQF4=;
        b=qfM7BGu1yZWOloU9QFdHtCU3pktqt/la2gJPztA1AKCZGJHgQq0ez4yxYiQrIKQSZW
         H0Eku/Nd8jUackv8sNvRafuAxq2jpIslv4p61o290nQfwGvACe/bIisjXzsuU6UFfuoi
         aHzx/f6ukh8v+9Z5EzLADOnLJN8DlWG06bxDIn5gZsreup6K5ln2vKIoPViDK8XT09N3
         6kNg6mzU9wF1Fg5uLiGTtoybVhe9kK2F8KJj4GEq8+GyIbMz2vN+TFxWKid3mnc0KNR4
         1f3i+l9+97oYVYyCbsCIOVKddZ6gHuIA3t2c75nIaIqC6Yw1LcUt+GIspQsyg5qXqC/2
         LJnw==
X-Gm-Message-State: AOJu0YzueLxubb2/RA9J1UQ+6MczHB+NMSnAMa+CNPNRjINqmhylaf9g
	ho4lX/r7vrqdSjmvdRqloLw4lhMG9mXzuNbqqAi3LJ5wKgar/vLVSOVXKkBT
X-Google-Smtp-Source: AGHT+IGLBrIpsduzyOBzC7LSkPVe7PuJfrOhZUbgPczkeBMlBbhnOdd0NAToewP/ECbnKyOeZmEAYw==
X-Received: by 2002:a05:6214:dcc:b0:685:c584:6e8b with SMTP id 12-20020a0562140dcc00b00685c5846e8bmr7595618qvt.0.1706823626707;
        Thu, 01 Feb 2024 13:40:26 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX34J5GhBe54FX3RBJqs7ZIWuDZVmL3wYyHWNMhm4yVwBjP4NDDQcS4ST2AaUoq/EH7He+c6OGqS3wkKJlg5Rhh3uN4e+jlCVP/jJCzcXOuBXqDeRJMNoCkC4IN3lwXH6Vjdym+ADGppGppFifok3YOG4DAbHttMLfKsw==
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 1/3] libxl: Create empty file for Phy cdrom
Date: Thu,  1 Feb 2024 16:40:02 -0500
Message-ID: <20240201214004.238858-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201214004.238858-1-jandryuk@gmail.com>
References: <20240201214004.238858-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With a device model stubdom, dom0 exports a PV disk to the stubdom.
Inside the stubdom, QEMU emulates a cdrom to the guest with a
host_device pointing at the PV frontend (/dev/xvdc)

An empty cdrom drive causes problems booting the stubdom.  The PV disk
protocol isn't designed to support no media.  That can be partially
hacked around, but the stubdom kernel waits for all block devices to
transition to Connected.  Since the backend never connects empty media,
stubdom launch times out and it is destroyed.

Empty media and the PV disks not connecting is fine at runtime since the
stubdom keeps running irrespective of the disk state.

Empty media can be worked around my providing an empty file to the
stubdom for the PV disk source.  This works as the disk is exposed as a
zero-size disk.  Dynamically create the empty file as needed and remove
in the stubdom cleanup.

libxl__device_disk_set_backend() needs to allow through these "empty"
disks with a pdev_path.

Fixup the params writing since scripts have trouble with an empty params
field.

This works for non-stubdom HVMs as well.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
New to support "empty" cdroms
---
 tools/libs/light/libxl_device.c   |  5 ++++-
 tools/libs/light/libxl_disk.c     | 36 +++++++++++++++++++++++++++----
 tools/libs/light/libxl_domain.c   |  4 ++++
 tools/libs/light/libxl_internal.h |  1 +
 4 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index 13da6e0573..09d85928d7 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -421,7 +421,10 @@ int libxl__device_disk_set_backend(libxl__gc *gc, libxl_device_disk *disk) {
             LOG(ERROR, "Disk vdev=%s is empty but not cdrom", disk->vdev);
             return ERROR_INVAL;
         }
-        if (disk->pdev_path != NULL && strcmp(disk->pdev_path, "")) {
+        if (disk->pdev_path != NULL &&
+            (strcmp(disk->pdev_path, "") &&
+             strncmp(disk->pdev_path, LIBXL_STUBDOM_EMPTY_CDROM,
+                     strlen(LIBXL_STUBDOM_EMPTY_CDROM)))) {
             LOG(ERROR,
                 "Disk vdev=%s is empty but an image has been provided: %s",
                 disk->vdev, disk->pdev_path);
diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
index ea3623dd6f..c48e1de659 100644
--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -199,6 +199,32 @@ static int libxl__device_disk_setdefault(libxl__gc *gc, uint32_t domid,
         disk->backend = LIBXL_DISK_BACKEND_QDISK;
     }
 
+    if (disk->is_cdrom &&
+        disk->format == LIBXL_DISK_FORMAT_EMPTY &&
+        disk->backend == LIBXL_DISK_BACKEND_PHY &&
+        disk->backend_domid == LIBXL_TOOLSTACK_DOMID) {
+        uint32_t target_domid;
+        int fd;
+
+        if (libxl_is_stubdom(CTX, domid, &target_domid)) {
+            LOGED(DEBUG, domid, "Using target_domid %u", target_domid);
+        } else {
+            target_domid = domid;
+        }
+        free(disk->pdev_path);
+        disk->pdev_path =
+            libxl__sprintf(NOGC, LIBXL_STUBDOM_EMPTY_CDROM ".%u",
+                           target_domid);
+        fd = creat(disk->pdev_path, 0400);
+        if (fd < 0) {
+            LOGED(ERROR, domid, "Failed to create empty cdrom \"%s\"",
+                  disk->pdev_path);
+            return ERROR_FAIL;
+        }
+
+        close(fd);
+    }
+
     rc = libxl__device_disk_set_backend(gc, disk);
     return rc;
 }
@@ -988,7 +1014,7 @@ static void cdrom_insert_ejected(libxl__egc *egc,
     empty = flexarray_make(gc, 4, 1);
     flexarray_append_pair(empty, "type",
                           libxl__device_disk_string_of_backend(disk->backend));
-    flexarray_append_pair(empty, "params", "");
+    flexarray_append_pair(empty, "params", disk->pdev_path ?: "");
 
     for (;;) {
         rc = libxl__xs_transaction_start(gc, &t);
@@ -1164,13 +1190,15 @@ static void cdrom_insert_inserted(libxl__egc *egc,
     insert = flexarray_make(gc, 4, 1);
     flexarray_append_pair(insert, "type",
                       libxl__device_disk_string_of_backend(disk->backend));
-    if (disk->format != LIBXL_DISK_FORMAT_EMPTY)
+    if (disk->backend == LIBXL_DISK_BACKEND_QDISK &&
+        disk->format != LIBXL_DISK_FORMAT_EMPTY) {
         flexarray_append_pair(insert, "params",
                     GCSPRINTF("%s:%s",
                         libxl__device_disk_string_of_format(disk->format),
                         disk->pdev_path));
-    else
-        flexarray_append_pair(insert, "params", "");
+    } else {
+        flexarray_append_pair(insert, "params", disk->pdev_path ?: "");
+    }
 
     for (;;) {
         rc = libxl__xs_transaction_start(gc, &t);
diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
index 5ee1544d9c..6751fc785f 100644
--- a/tools/libs/light/libxl_domain.c
+++ b/tools/libs/light/libxl_domain.c
@@ -1525,6 +1525,10 @@ static void devices_destroy_cb(libxl__egc *egc,
     if (rc < 0)
         LOGD(ERROR, domid, "libxl__devices_destroy failed");
 
+    /* Remove the file after the hotplug scripts have run.  The scripts won't
+     * run if the file doesn't exist when they are run.  */
+    libxl__remove_file(gc, GCSPRINTF(LIBXL_STUBDOM_EMPTY_CDROM ".%u", domid));
+
     vm_path = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/vm", dom_path));
     if (vm_path)
         if (!xs_rm(ctx->xsh, XBT_NULL, vm_path))
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index d5732d1c37..094d0df9b1 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -120,6 +120,7 @@
 #define STUBDOM_CONSOLE_SERIAL 3
 #define STUBDOM_SPECIAL_CONSOLES 3
 #define LIBXL_LINUX_STUBDOM_MEM 128
+#define LIBXL_STUBDOM_EMPTY_CDROM XEN_RUN_DIR "/empty-cdrom" /* .$domid */
 #define TAP_DEVICE_SUFFIX "-emu"
 #define DOMID_XS_PATH "domid"
 #define PVSHIM_BASENAME "xen-shim"
-- 
2.43.0


