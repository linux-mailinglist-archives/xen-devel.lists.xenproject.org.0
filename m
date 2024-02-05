Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E78849835
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:57:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675842.1051476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwfZ-00046A-Av; Mon, 05 Feb 2024 10:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675842.1051476; Mon, 05 Feb 2024 10:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwfZ-00041Q-7A; Mon, 05 Feb 2024 10:57:45 +0000
Received: by outflank-mailman (input) for mailman id 675842;
 Mon, 05 Feb 2024 10:57:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4fC=JO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rWwZW-0000qL-Vy
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:51:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83f64304-c414-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 11:51:29 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 722122228B;
 Mon,  5 Feb 2024 10:51:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30D55132DD;
 Mon,  5 Feb 2024 10:51:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 00Z8CrC9wGWONgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Feb 2024 10:51:28 +0000
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
X-Inumbo-ID: 83f64304-c414-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707130288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4t9CaY2HdSuK4w688pTUcmMnQS10iOMn7pZg/fdTzSY=;
	b=FpXGNn3J0p85LBUD59mX6ixHhRtOEUaPKA5cRgtiNCkAioACVKEwKq0rd2cN25Lq+wLZsO
	WKaRiGRU+S4yv4QuNwa8F27Js0QNNWsHC5+vt+nj/iw6ttr8PHphL8gLbD4NoF5Nc929bX
	pndAAos6MwBLMzqVZCD7wDRL5vWSVFQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707130288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4t9CaY2HdSuK4w688pTUcmMnQS10iOMn7pZg/fdTzSY=;
	b=FpXGNn3J0p85LBUD59mX6ixHhRtOEUaPKA5cRgtiNCkAioACVKEwKq0rd2cN25Lq+wLZsO
	WKaRiGRU+S4yv4QuNwa8F27Js0QNNWsHC5+vt+nj/iw6ttr8PHphL8gLbD4NoF5Nc929bX
	pndAAos6MwBLMzqVZCD7wDRL5vWSVFQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH v4 15/32] tools/libs/light: add backend type for 9pfs PV devices
Date: Mon,  5 Feb 2024 11:49:44 +0100
Message-Id: <20240205105001.24171-16-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240205105001.24171-1-jgross@suse.com>
References: <20240205105001.24171-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,cloud.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.com,citrix.com,gmail.com,xen.org,cloud.com];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Make the backend type of 9pfs PV devices configurable. The default is
"qemu" with the related Xenstore backend-side directory being "9pfs".

Add another type "xen_9pfsd" with the related Xenstore backend-side
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
Acked-by: George Dunlap <george.dunlap@cloud.com> # Golang bits
---
V3:
- regenerate go bindings
V4:
- rename libxl_device_p9_dm_needed() to libxl__device_p9_dm_needed()
  (Anthony Perard)
- reorder span related functions (Anthony Perard)
- add comment for xen9pfsd_spawn() return values (Anthony Perard)
- add LIBXL_HAVE_XEN_9PFS to libxl.h (Anthony Perard)
- use a copy of 'p9' in xen9pfsd_spawn() (Anthony Perard)
---
 tools/golang/xenlight/helpers.gen.go      |  16 +++
 tools/golang/xenlight/types.gen.go        |  13 ++
 tools/include/libxl.h                     |   7 +
 tools/libs/light/libxl_9pfs.c             | 159 +++++++++++++++++++++-
 tools/libs/light/libxl_create.c           |   4 +-
 tools/libs/light/libxl_dm.c               |   2 +-
 tools/libs/light/libxl_types.idl          |  11 ++
 tools/libs/light/libxl_types_internal.idl |   1 +
 8 files changed, 206 insertions(+), 7 deletions(-)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 35e209ff1b..8f44397a4e 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1280,6 +1280,9 @@ return fmt.Errorf("converting field Rdm: %v", err)
 }
 x.RdmMemBoundaryMemkb = uint64(tmp.rdm_mem_boundary_memkb)
 x.McaCaps = uint64(tmp.mca_caps)
+if err := x.Pirq.fromC(&tmp.pirq);err != nil {
+return fmt.Errorf("converting field Pirq: %v", err)
+}
 return nil
 }
 
@@ -1613,6 +1616,9 @@ return fmt.Errorf("converting field Rdm: %v", err)
 }
 hvm.rdm_mem_boundary_memkb = C.uint64_t(tmp.RdmMemBoundaryMemkb)
 hvm.mca_caps = C.uint64_t(tmp.McaCaps)
+if err := tmp.Pirq.toC(&hvm.pirq); err != nil {
+return fmt.Errorf("converting field Pirq: %v", err)
+}
 hvmBytes := C.GoBytes(unsafe.Pointer(&hvm),C.sizeof_libxl_domain_build_info_type_union_hvm)
 copy(xc.u[:],hvmBytes)
 case DomainTypePv:
@@ -2434,6 +2440,11 @@ x.Tag = C.GoString(xc.tag)
 x.Path = C.GoString(xc.path)
 x.SecurityModel = C.GoString(xc.security_model)
 x.Devid = Devid(xc.devid)
+x.Type = P9Type(xc._type)
+x.MaxSpace = int(xc.max_space)
+x.MaxFiles = int(xc.max_files)
+x.MaxOpenFiles = int(xc.max_open_files)
+x.AutoDelete = bool(xc.auto_delete)
 
  return nil}
 
@@ -2452,6 +2463,11 @@ xc.path = C.CString(x.Path)}
 if x.SecurityModel != "" {
 xc.security_model = C.CString(x.SecurityModel)}
 xc.devid = C.libxl_devid(x.Devid)
+xc._type = C.libxl_p9_type(x.Type)
+xc.max_space = C.int(x.MaxSpace)
+xc.max_files = C.int(x.MaxFiles)
+xc.max_open_files = C.int(x.MaxOpenFiles)
+xc.auto_delete = C.bool(x.AutoDelete)
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 7907aa8999..d31722407a 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -122,6 +122,13 @@ NicTypeVifIoemu NicType = 1
 NicTypeVif NicType = 2
 )
 
+type P9Type int
+const(
+P9TypeUnknown P9Type = 0
+P9TypeQemu P9Type = 1
+P9TypeXen9Pfsd P9Type = 2
+)
+
 type ActionOnShutdown int
 const(
 ActionOnShutdownDestroy ActionOnShutdown = 1
@@ -651,6 +658,7 @@ SerialList StringList
 Rdm RdmReserve
 RdmMemBoundaryMemkb uint64
 McaCaps uint64
+Pirq Defbool
 }
 
 func (x DomainBuildInfoTypeUnionHvm) isDomainBuildInfoTypeUnion(){}
@@ -888,6 +896,11 @@ Tag string
 Path string
 SecurityModel string
 Devid Devid
+Type P9Type
+MaxSpace int
+MaxFiles int
+MaxOpenFiles int
+AutoDelete bool
 }
 
 type DevicePvcallsif struct {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index f1652b1664..a554f2ccd6 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -615,6 +615,13 @@
  */
 #define LIBXL_HAVE_HVM_PIRQ 1
 
+/*
+ * LIBXL_HAVE_XEN_9PFS indicates the presence of the xen-9pfsd related
+ * fields in libxl_device_p9: type, max_space, max_files, max_open_files and
+ * auto_delete.
+ */
+#define LIBXL_HAVE_XEN_9PFS 1
+
 /*
  * libxl memory management
  *
diff --git a/tools/libs/light/libxl_9pfs.c b/tools/libs/light/libxl_9pfs.c
index 5ab0d3aa21..68fa9947ad 100644
--- a/tools/libs/light/libxl_9pfs.c
+++ b/tools/libs/light/libxl_9pfs.c
@@ -33,20 +33,173 @@ static int libxl__set_xenstore_p9(libxl__gc *gc, uint32_t domid,
 
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
+static int libxl__device_p9_dm_needed(void *e, unsigned domid)
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
+    libxl_device_p9 p9;
+    uint32_t domid;
+    void (*callback)(libxl__egc *, libxl__aop9_state *, int);
+};
+
+static void xen9pfsd_confirm(libxl__egc *egc, libxl__spawn_state *spawn,
+                             const char *xsdata);
+static void xen9pfsd_failed(libxl__egc *egc, libxl__spawn_state *spawn, int rc);
+static void xen9pfsd_detached(libxl__egc *egc, libxl__spawn_state *spawn);
+static void xen9pfsd_spawn_outcome(libxl__egc *egc, libxl__aop9_state *aop9,
+                                   int rc);
+
+/*
+ * Spawn the xen-9pfsd daemon if needed.
+ * returns:
+ * < 0 if error
+ * 0 if no daemon needs to be spawned
+ * 1 if daemon was spawned
+ */
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
+    libxl_device_p9_copy(CTX, &aop9->p9, p9);
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
+static void xen9pfsd_spawn_outcome(libxl__egc *egc, libxl__aop9_state *aop9,
+                                   int rc)
+{
+    aop9->aodev->rc = rc;
+    if (rc)
+        aop9->aodev->callback(egc, aop9->aodev);
+    else
+        libxl__device_add_async(egc, aop9->domid, &libxl__p9_devtype,
+                                &aop9->p9, aop9->aodev);
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
+    .dm_needed = libxl__device_p9_dm_needed,
 );
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 0008fac607..5546335973 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1761,9 +1761,6 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
         libxl__device_console_dispose(&console);
     }
 
-    for (i = 0; i < d_config->num_p9s; i++)
-        libxl__device_add(gc, domid, &libxl__p9_devtype, &d_config->p9s[i]);
-
     for (i = 0; i < d_config->num_pvcallsifs; i++)
         libxl__device_add(gc, domid, &libxl__pvcallsif_devtype,
                           &d_config->pvcallsifs[i]);
@@ -1900,6 +1897,7 @@ const libxl__device_type *device_type_tbl[] = {
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
index 899ad30969..682092a058 100644
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
 
@@ -943,6 +949,11 @@ libxl_device_p9 = Struct("device_p9", [
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


