Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8E07E7DBB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:22:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630573.983544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UHB-000619-Ik; Fri, 10 Nov 2023 16:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630573.983544; Fri, 10 Nov 2023 16:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UHB-0005xm-FN; Fri, 10 Nov 2023 16:22:33 +0000
Received: by outflank-mailman (input) for mailman id 630573;
 Fri, 10 Nov 2023 16:22:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ap16=GX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r1U4b-0004cS-0b
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:09:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87ec2cad-7fe3-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:09:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DBB4D219B4;
 Fri, 10 Nov 2023 16:09:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFCD613398;
 Fri, 10 Nov 2023 16:09:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lqqGKbpVTmUUCQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Nov 2023 16:09:30 +0000
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
X-Inumbo-ID: 87ec2cad-7fe3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699632570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AQywzv/Y34quHnZ9IPkhWdaZOnTMkCrPxK530+/Vdyk=;
	b=mu9TP7L1yI1zwGVB6+cGrFpBl5fMSyW4VRzkzPMWEvU8jAohppN7uAIYX+vOAepSS12/RL
	d9hV5kLi0/6ZfCOgH6+daraINLiwTiI0RkLwgfiJKk9VPlUatUNG6RUGzfiAHQL6ufZzRM
	AGyd4I9poESYJAS87ZAZNkAZe4pTP0g=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH v2 15/29] tools/libs/light: add backend type for 9pfs PV devices
Date: Fri, 10 Nov 2023 17:07:50 +0100
Message-Id: <20231110160804.29021-16-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231110160804.29021-1-jgross@suse.com>
References: <20231110160804.29021-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the backend type of 9pfs PV devices configurable. The default is
"qemu" with the related Xenstore backend-side directory being "9pfs".

Add another type "xen-9pfsd" with the related Xenstore backend-side
directory "xen_9pfs".

As additional security features it is possible to specify:
- "max-space" for limiting the maximum space consumed on the filesystem
  in MBs
- "max-files" for limiting the maximum number of files in the
  filesystem
- "max-open-files" for limiting the maximum number of concurrent open
  files

For convenience "auto-delete" is available to let the backend delete the
oldest file of the guest in case otherwise "max-space" or "max-files"
would be violated.

The xen-9pfsd daemon will be started by libxenlight automatically when
the first "xen_9pfs" device is being created.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_9pfs.c             | 145 +++++++++++++++++++++-
 tools/libs/light/libxl_create.c           |   4 +-
 tools/libs/light/libxl_dm.c               |   2 +-
 tools/libs/light/libxl_types.idl          |  11 ++
 tools/libs/light/libxl_types_internal.idl |   1 +
 5 files changed, 156 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_9pfs.c b/tools/libs/light/libxl_9pfs.c
index 5ab0d3aa21..87e9dda8e7 100644
--- a/tools/libs/light/libxl_9pfs.c
+++ b/tools/libs/light/libxl_9pfs.c
@@ -33,20 +33,159 @@ static int libxl__set_xenstore_p9(libxl__gc *gc, uint32_t domid,
 
     flexarray_append_pair(front, "tag", p9->tag);
 
+    if (p9->type == LIBXL_P9_TYPE_XEN_9PFSD) {
+        flexarray_append_pair(back, "max-space",
+                              GCSPRINTF("%u", p9->max_space));
+        flexarray_append_pair(back, "max-files",
+                              GCSPRINTF("%u", p9->max_files));
+        flexarray_append_pair(back, "max-open-files",
+                              GCSPRINTF("%u", p9->max_open_files));
+        flexarray_append_pair(back, "auto-delete",
+                              p9->auto_delete ? "1" : "0");
+    }
+
+    return 0;
+}
+
+static int libxl__device_from_p9(libxl__gc *gc, uint32_t domid,
+                                 libxl_device_p9 *type, libxl__device *device)
+{
+    device->backend_devid   = type->devid;
+    device->backend_domid   = type->backend_domid;
+    device->backend_kind    = type->type == LIBXL_P9_TYPE_QEMU
+                              ? LIBXL__DEVICE_KIND_9PFS
+                              : LIBXL__DEVICE_KIND_XEN_9PFS;
+    device->devid           = type->devid;
+    device->domid           = domid;
+    device->kind            = LIBXL__DEVICE_KIND_9PFS;
+
     return 0;
 }
 
-#define libxl__add_p9s NULL
+static int libxl_device_p9_dm_needed(void *e, unsigned domid)
+{
+    libxl_device_p9 *elem = e;
+
+    return elem->type == LIBXL_P9_TYPE_QEMU && elem->backend_domid == domid;
+}
+
+typedef struct libxl__aop9_state libxl__aop9_state;
+
+struct libxl__aop9_state {
+    libxl__spawn_state spawn;
+    libxl__ao_device *aodev;
+    libxl_device_p9 *p9;
+    uint32_t domid;
+    void (*callback)(libxl__egc *, libxl__aop9_state *, int);
+};
+
+static void xen9pfsd_spawn_outcome(libxl__egc *egc, libxl__aop9_state *aop9,
+                                   int rc)
+{
+    aop9->aodev->rc = rc;
+    if (rc)
+        aop9->aodev->callback(egc, aop9->aodev);
+    else
+        libxl__device_add_async(egc, aop9->domid, &libxl__p9_devtype,
+                                aop9->p9, aop9->aodev);
+}
+
+static void xen9pfsd_confirm(libxl__egc *egc, libxl__spawn_state *spawn,
+                             const char *xsdata)
+{
+    STATE_AO_GC(spawn->ao);
+
+    if (!xsdata)
+        return;
+
+    if (strcmp(xsdata, "running"))
+        return;
+
+    libxl__spawn_initiate_detach(gc, spawn);
+}
+
+static void xen9pfsd_failed(libxl__egc *egc, libxl__spawn_state *spawn, int rc)
+{
+    libxl__aop9_state *aop9 = CONTAINER_OF(spawn, *aop9, spawn);
+
+    xen9pfsd_spawn_outcome(egc, aop9, rc);
+}
+
+static void xen9pfsd_detached(libxl__egc *egc, libxl__spawn_state *spawn)
+{
+    libxl__aop9_state *aop9 = CONTAINER_OF(spawn, *aop9, spawn);
+
+    xen9pfsd_spawn_outcome(egc, aop9, 0);
+}
+
+static int xen9pfsd_spawn(libxl__egc *egc, uint32_t domid, libxl_device_p9 *p9,
+                         libxl__ao_device *aodev)
+{
+    STATE_AO_GC(aodev->ao);
+    struct libxl__aop9_state *aop9;
+    int rc;
+    char *args[] = { "xen-9pfsd", NULL };
+    char *path = GCSPRINTF("/local/domain/%u/libxl/xen-9pfs",
+                           p9->backend_domid);
+
+    if (p9->type != LIBXL_P9_TYPE_XEN_9PFSD ||
+        libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/state", path)))
+        return 0;
+
+    GCNEW(aop9);
+    aop9->aodev = aodev;
+    aop9->p9 = p9;
+    aop9->domid = domid;
+    aop9->callback = xen9pfsd_spawn_outcome;
+
+    aop9->spawn.ao = aodev->ao;
+    aop9->spawn.what = "xen-9pfs daemon";
+    aop9->spawn.xspath = GCSPRINTF("%s/state", path);
+    aop9->spawn.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
+    aop9->spawn.pidpath = GCSPRINTF("%s/pid", path);
+    aop9->spawn.midproc_cb = libxl__spawn_record_pid;
+    aop9->spawn.confirm_cb = xen9pfsd_confirm;
+    aop9->spawn.failure_cb = xen9pfsd_failed;
+    aop9->spawn.detached_cb = xen9pfsd_detached;
+    rc = libxl__spawn_spawn(egc, &aop9->spawn);
+    if (rc < 0)
+        return rc;
+    if (!rc) {
+        setsid();
+        libxl__exec(gc, -1, -1, -1, LIBEXEC_BIN "/xen-9pfsd", args, NULL);
+    }
+
+    return 1;
+}
+
+static void libxl__device_p9_add(libxl__egc *egc, uint32_t domid,
+                                 libxl_device_p9 *p9,
+                                 libxl__ao_device *aodev)
+{
+    int rc;
+
+    rc = xen9pfsd_spawn(egc, domid, p9, aodev);
+    if (rc == 1)
+        return;
+
+    if (rc == 0)
+        libxl__device_add_async(egc, domid, &libxl__p9_devtype, p9, aodev);
+
+    aodev->rc = rc;
+    if (rc)
+        aodev->callback(egc, aodev);
+}
+
 #define libxl_device_p9_list NULL
 #define libxl_device_p9_compare NULL
 
 static LIBXL_DEFINE_UPDATE_DEVID(p9)
-static LIBXL_DEFINE_DEVICE_FROM_TYPE(p9)
+static LIBXL_DEFINE_DEVICES_ADD(p9)
 
 LIBXL_DEFINE_DEVICE_REMOVE(p9)
 
 DEFINE_DEVICE_TYPE_STRUCT(p9, 9PFS, p9s,
-    .skip_attach = 1,
     .set_xenstore_config = (device_set_xenstore_config_fn_t)
                            libxl__set_xenstore_p9,
+    .dm_needed = libxl_device_p9_dm_needed,
 );
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index ce1d431103..b19e9379b6 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1760,9 +1760,6 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
         libxl__device_console_dispose(&console);
     }
 
-    for (i = 0; i < d_config->num_p9s; i++)
-        libxl__device_add(gc, domid, &libxl__p9_devtype, &d_config->p9s[i]);
-
     for (i = 0; i < d_config->num_pvcallsifs; i++)
         libxl__device_add(gc, domid, &libxl__pvcallsif_devtype,
                           &d_config->pvcallsifs[i]);
@@ -1899,6 +1896,7 @@ const libxl__device_type *device_type_tbl[] = {
     &libxl__vdispl_devtype,
     &libxl__vsnd_devtype,
     &libxl__virtio_devtype,
+    &libxl__p9_devtype,
     NULL
 };
 
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 14b593110f..2aaaeb5aa7 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -3761,7 +3761,7 @@ int libxl__need_xenpv_qemu(libxl__gc *gc, libxl_domain_config *d_config)
         goto out;
     }
 
-    if (d_config->num_vfbs > 0 || d_config->num_p9s > 0) {
+    if (d_config->num_vfbs > 0) {
         ret = 1;
         goto out;
     }
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 7d8bd5d216..82565c4c10 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -150,6 +150,12 @@ libxl_nic_type = Enumeration("nic_type", [
     (2, "VIF"),
     ])
 
+libxl_p9_type = Enumeration("p9_type", [
+    (0, "unknown"),
+    (1, "qemu"),
+    (2, "xen_9pfsd"),
+    ])
+
 libxl_action_on_shutdown = Enumeration("action_on_shutdown", [
     (1, "DESTROY"),
 
@@ -942,6 +948,11 @@ libxl_device_p9 = Struct("device_p9", [
     ("path",             string),
     ("security_model",   string),
     ("devid",            libxl_devid),
+    ("type",             libxl_p9_type),
+    ("max_space",        integer),
+    ("max_files",        integer),
+    ("max_open_files",   integer),
+    ("auto_delete",      bool),
 ])
 
 libxl_device_pvcallsif = Struct("device_pvcallsif", [
diff --git a/tools/libs/light/libxl_types_internal.idl b/tools/libs/light/libxl_types_internal.idl
index e24288f1a5..39da71cef5 100644
--- a/tools/libs/light/libxl_types_internal.idl
+++ b/tools/libs/light/libxl_types_internal.idl
@@ -34,6 +34,7 @@ libxl__device_kind = Enumeration("device_kind", [
     (16, "VINPUT"),
     (17, "VIRTIO_DISK"),
     (18, "VIRTIO"),
+    (19, "XEN_9PFS"),
     ])
 
 libxl__console_backend = Enumeration("console_backend", [
-- 
2.35.3


