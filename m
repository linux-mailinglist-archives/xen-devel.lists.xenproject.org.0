Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ADB7DDEB7
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:51:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626318.976493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7sm-0003g8-3q; Wed, 01 Nov 2023 09:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626318.976493; Wed, 01 Nov 2023 09:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy7sl-0003dZ-VR; Wed, 01 Nov 2023 09:51:27 +0000
Received: by outflank-mailman (input) for mailman id 626318;
 Wed, 01 Nov 2023 09:51:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qy7cj-0005E0-4t
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:34:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8b1f2cb-7899-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:34:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4815E21A34;
 Wed,  1 Nov 2023 09:34:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 224B113460;
 Wed,  1 Nov 2023 09:34:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gzoMB7wbQmUuCQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 09:34:52 +0000
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
X-Inumbo-ID: e8b1f2cb-7899-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698831292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w3PBNBB3kJ9bivxGczmEg6Y0kCgbJHQRQkdhIETfwqU=;
	b=Cna131tUSW3IdHlOx4FSuIUfpI+8J3oyqRhdPU4V/Fgfz9pxj4/+HDyNKawmLm7vg8oYQM
	xvK5gz7tGU3qsfMEf+9pUVcnY5AUzfFBGS+q+EEXK0wlHeboAGoTGiFlR2JrLFPgVBobMw
	owbCLPaZU2xc7wmJKchG7lrQ+PcA5qA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 15/29] tools/libs/light: add backend type for 9pfs PV devices
Date: Wed,  1 Nov 2023 10:33:11 +0100
Message-Id: <20231101093325.30302-16-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231101093325.30302-1-jgross@suse.com>
References: <20231101093325.30302-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the backend type of 9pfs PV devices configurable. The default is
"qemu" with the related Xenstore backend-side directory being "9pfs".

Add another type "xenlogd" with the related Xenstore backend-side
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

The xenlogd daemon will be started by libxenlight automatically when
the first "xen_9pfs" device is being created.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/light/libxl_9pfs.c             | 143 +++++++++++++++++++++-
 tools/libs/light/libxl_create.c           |   4 +-
 tools/libs/light/libxl_dm.c               |   2 +-
 tools/libs/light/libxl_types.idl          |  11 ++
 tools/libs/light/libxl_types_internal.idl |   1 +
 5 files changed, 154 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_9pfs.c b/tools/libs/light/libxl_9pfs.c
index 5ab0d3aa21..0b9d84dce9 100644
--- a/tools/libs/light/libxl_9pfs.c
+++ b/tools/libs/light/libxl_9pfs.c
@@ -33,20 +33,157 @@ static int libxl__set_xenstore_p9(libxl__gc *gc, uint32_t domid,
 
     flexarray_append_pair(front, "tag", p9->tag);
 
+    if (p9->type == LIBXL_P9_TYPE_XENLOGD) {
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
+static void xenlogd_spawn_outcome(libxl__egc *egc, libxl__aop9_state *aop9,
+                                  int rc)
+{
+    aop9->aodev->rc = rc;
+    if (rc)
+        aop9->aodev->callback(egc, aop9->aodev);
+    else
+        libxl__device_add_async(egc, aop9->domid, &libxl__p9_devtype,
+                                aop9->p9, aop9->aodev);
+}
+
+static void xenlogd_confirm(libxl__egc *egc, libxl__spawn_state *spawn,
+                            const char *xsdata)
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
+static void xenlogd_failed(libxl__egc *egc, libxl__spawn_state *spawn, int rc)
+{
+    libxl__aop9_state *aop9 = CONTAINER_OF(spawn, *aop9, spawn);
+
+    xenlogd_spawn_outcome(egc, aop9, rc);
+}
+
+static void xenlogd_detached(libxl__egc *egc, libxl__spawn_state *spawn)
+{
+    libxl__aop9_state *aop9 = CONTAINER_OF(spawn, *aop9, spawn);
+
+    xenlogd_spawn_outcome(egc, aop9, 0);
+}
+
+static int xenlogd_spawn(libxl__egc *egc, uint32_t domid, libxl_device_p9 *p9,
+                         libxl__ao_device *aodev)
+{
+    STATE_AO_GC(aodev->ao);
+    struct libxl__aop9_state *aop9;
+    int rc;
+    char *args[] = { "xenlogd", NULL };
+
+    if (p9->type != LIBXL_P9_TYPE_XENLOGD ||
+        libxl__xs_read(gc, XBT_NULL, "/tool/xenlog/state"))
+        return 0;
+
+    GCNEW(aop9);
+    aop9->aodev = aodev;
+    aop9->p9 = p9;
+    aop9->domid = domid;
+    aop9->callback = xenlogd_spawn_outcome;
+
+    aop9->spawn.ao = aodev->ao;
+    aop9->spawn.what = "xenlog daemon";
+    aop9->spawn.xspath = "/tool/xenlog/state";
+    aop9->spawn.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
+    aop9->spawn.pidpath = "/tool/xenlog/pid";
+    aop9->spawn.midproc_cb = libxl__spawn_record_pid;
+    aop9->spawn.confirm_cb = xenlogd_confirm;
+    aop9->spawn.failure_cb = xenlogd_failed;
+    aop9->spawn.detached_cb = xenlogd_detached;
+    rc = libxl__spawn_spawn(egc, &aop9->spawn);
+    if (rc < 0)
+        return rc;
+    if (!rc) {
+        setsid();
+        libxl__exec(gc, -1, -1, -1, LIBEXEC_BIN "/xenlogd", args, NULL);
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
+    rc = xenlogd_spawn(egc, domid, p9, aodev);
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
index 7d8bd5d216..e910bf1621 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -150,6 +150,12 @@ libxl_nic_type = Enumeration("nic_type", [
     (2, "VIF"),
     ])
 
+libxl_p9_type = Enumeration("p9_type", [
+    (0, "unknown"),
+    (1, "qemu"),
+    (2, "xenlogd"),
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


