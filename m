Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A061BB4EC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:06:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHVI-0000Sn-M2; Tue, 28 Apr 2020 04:05:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHVH-0000SD-1K
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:05:51 +0000
X-Inumbo-ID: 89bbd01a-8905-11ea-ae69-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89bbd01a-8905-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 04:05:46 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id h124so3365584qke.11
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ZHa799QMBrK+LH740solrl4J2E+hLWHdCeWlcMTowY=;
 b=pGbobHFmvz0cl/Kn4uXU40BhrUeZBRnbPh4NyVZSC0ERdgcfSQShYB9ae1lcsW1kpR
 v87BSGIIWwYP3CAK/fPuo2tofFL9arLZXDWXVXmbAWj06z3MPsuqtBa6kb4wxCxwRqOp
 fcyIyKXl4jifo7b0pFkY1nwuHDJ/04f2y8KBb4i0mF1UpjEYiXJWzEfHXrvBEJqPMJbH
 clI90W8EG5yxcdCxABiy6a3ZljMZY/j6HtZpvblU+kVf7WCRMeQeCt7fX5qlsZ6v9WVv
 kvToUQBihglpQb1ShDbTQLt+wuwCU2/QhnqDuBlSMbM0COiP5KX5Fzr5CoFtbLuEunx7
 jZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ZHa799QMBrK+LH740solrl4J2E+hLWHdCeWlcMTowY=;
 b=MGdba816Lp2t64JQLLMBGd1qr5FZGVm6ShAyHkGziYcY1WoxF7Bv6AonCr6cQI9u7F
 ES+X5GzSZeVMzZq6Uz9XyiIcvCk1eILA57nVmkAO/xuwFtU/GD4ijUbIqgC8kSIRAhSG
 3s4qpmiad3ybfvzJi6pShYY90R4qdreWmxz6cfgjyh4p71dN8BbVCax7vdyaha2BnFG7
 rDNUKQEBJ6Xl2Q/J3M32EaScWCubigcRnbTyXQMi7TVsrvORUTHCsxIyV4vRnAVpOaPc
 S4kHaGjsD5QpbSuvfnFVF3seFtBF4b3LO6W1GqhQwbcG8uwSjK4l/FcLWSY5wCAgSkpY
 IDCw==
X-Gm-Message-State: AGi0PuYxumrWI09BML4XAj4y4F7O+Vn50hbiTt6/LBLc1jj/6Afe4Okf
 WdsLb3DmZnwNw2mXlzZFl7Sxs25k
X-Google-Smtp-Source: APiQypK8hBSDJawGiQcW2x0qN4Gz1UkjtRjYpUNAZaKRxT6Xw6Y8nL+dPMV+ldsp933HJaYVL5CtrQ==
X-Received: by 2002:a37:b58:: with SMTP id 85mr2554988qkl.353.1588046745597;
 Mon, 27 Apr 2020 21:05:45 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:05:44 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 05/21] libxl: Handle Linux stubdomain specific QEMU options.
Date: Tue, 28 Apr 2020 00:04:17 -0400
Message-Id: <20200428040433.23504-6-jandryuk@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200428040433.23504-1-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Simon Gaiser <simon@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Eric Shelton <eshelton@pobox.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Eric Shelton <eshelton@pobox.com>

This patch creates an appropriate command line for the QEMU instance
running in a Linux-based stubdomain.

NOTE: a number of items are not currently implemented for Linux-based
stubdomains, such as:
- save/restore
- QMP socket
- graphics output (e.g., VNC)

Signed-off-by: Eric Shelton <eshelton@pobox.com>

Simon:
 * fix disk path
 * fix cdrom path and "format"

Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
[drop Qubes-specific parts]
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Allow setting stubdomain_ramdisk independently from stubdomain_kernel
Add a qemu- prefix for qemu-stubdom-linux-{kernel,rootfs} since stubdom
doesn't convey device-model.  Use qemu- since this code is qemu specific.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Changes in v2:
 - fix serial specified with serial=[ ... ] syntax
 - error out on multiple consoles (incompatible with stubdom)
 - drop erroneous chunk about cdrom
Changes in v3:
 - change to use libxl__stubdomain_is_linux instead of
   b_info->stubdomain_version
 - drop libxl__stubdomain_version_running, prefer
   libxl__stubdomain_is_linux_running introduced by previous patch
 - drop ifup/ifdown script - stubdomain will handle that with qemu
   events itself
 - slightly simplify -serial argument
 - add support for multiple serial consoles, do not ignore
   b_info.u.serial(_list)
 - add error checking for more than 26 emulated disks ("/dev/xvd%c"
   format string)
Changes in v5:
 - commit message fixup to match patch contents - Marek
 - file names are now qemu-stubdom-linux-{kernel,rootfs} - Jason
 - allow setting ramdisk independently of kernel - Jason
---
 tools/libxl/libxl_create.c   |  45 +++++++++
 tools/libxl/libxl_dm.c       | 190 ++++++++++++++++++++++++-----------
 tools/libxl/libxl_internal.h |   1 +
 tools/libxl/libxl_mem.c      |   6 +-
 tools/libxl/libxl_types.idl  |   3 +
 5 files changed, 184 insertions(+), 61 deletions(-)

diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 7423ee8e57..3b5535f2c8 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -171,6 +171,40 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         }
     }
 
+    if (b_info->type == LIBXL_DOMAIN_TYPE_HVM &&
+        libxl_defbool_val(b_info->device_model_stubdomain)) {
+        if (!b_info->stubdomain_kernel) {
+            switch (b_info->device_model_version) {
+                case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
+                    b_info->stubdomain_kernel =
+                        libxl__abs_path(NOGC, "ioemu-stubdom.gz", libxl__xenfirmwaredir_path());
+                    break;
+                case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
+                    b_info->stubdomain_kernel =
+                        libxl__abs_path(NOGC,
+                                "qemu-stubdom-linux-kernel",
+                                libxl__xenfirmwaredir_path());
+                    break;
+                default:
+                    abort();
+            }
+        }
+        if (!b_info->stubdomain_ramdisk) {
+            switch (b_info->device_model_version) {
+                case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
+                    break;
+                case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
+                    b_info->stubdomain_ramdisk =
+                        libxl__abs_path(NOGC,
+                                "qemu-stubdom-linux-rootfs",
+                                libxl__xenfirmwaredir_path());
+                    break;
+                default:
+                    abort();
+            }
+        }
+    }
+
     if (!b_info->max_vcpus)
         b_info->max_vcpus = 1;
     if (!b_info->avail_vcpus.size) {
@@ -206,6 +240,17 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
     if (b_info->target_memkb == LIBXL_MEMKB_DEFAULT)
         b_info->target_memkb = b_info->max_memkb;
 
+    if (b_info->stubdomain_memkb == LIBXL_MEMKB_DEFAULT) {
+        if (libxl_defbool_val(b_info->device_model_stubdomain)) {
+            if (libxl__stubdomain_is_linux(b_info))
+                b_info->stubdomain_memkb = LIBXL_LINUX_STUBDOM_MEM * 1024;
+            else
+                b_info->stubdomain_memkb = 28 * 1024; // MiniOS
+        } else {
+            b_info->stubdomain_memkb = 0; // no stubdomain
+        }
+    }
+
     libxl_defbool_setdefault(&b_info->claim_mode, false);
 
     libxl_defbool_setdefault(&b_info->localtime, false);
diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index b91e63db6f..5a7d55686f 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -1188,6 +1188,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     int i, connection, devid;
     uint64_t ram_size;
     const char *path, *chardev;
+    bool is_stubdom = libxl_defbool_val(b_info->device_model_stubdomain);
 
     dm_args = flexarray_make(gc, 16, 1);
     dm_envs = flexarray_make(gc, 16, 1);
@@ -1197,39 +1198,42 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     flexarray_vappend(dm_args, dm,
                       "-xen-domid",
                       GCSPRINTF("%d", guest_domid), NULL);
+    flexarray_append(dm_args, "-no-shutdown");
 
-    flexarray_append(dm_args, "-chardev");
-    if (state->dm_monitor_fd >= 0) {
-        flexarray_append(dm_args,
-            GCSPRINTF("socket,id=libxl-cmd,fd=%d,server,nowait",
-                      state->dm_monitor_fd));
+    /* There is currently no way to access the QMP socket in the stubdom */
+    if (!is_stubdom) {
+        flexarray_append(dm_args, "-chardev");
+        if (state->dm_monitor_fd >= 0) {
+            flexarray_append(dm_args,
+                GCSPRINTF("socket,id=libxl-cmd,fd=%d,server,nowait",
+                          state->dm_monitor_fd));
 
-        /*
-         * Start QEMU with its "CPU" paused, it will not start any emulation
-         * until the QMP command "cont" is used. This also prevent QEMU from
-         * writing "running" to the "state" xenstore node so we only use this
-         * flag when we have the QMP based startup notification.
-         * */
-        flexarray_append(dm_args, "-S");
-    } else {
-        flexarray_append(dm_args,
-                         GCSPRINTF("socket,id=libxl-cmd,"
-                                   "path=%s,server,nowait",
-                                   libxl__qemu_qmp_path(gc, guest_domid)));
-    }
+            /*
+             * Start QEMU with its "CPU" paused, it will not start any emulation
+             * until the QMP command "cont" is used. This also prevent QEMU from
+             * writing "running" to the "state" xenstore node so we only use this
+             * flag when we have the QMP based startup notification.
+             * */
+            flexarray_append(dm_args, "-S");
+        } else {
+            flexarray_append(dm_args,
+                             GCSPRINTF("socket,id=libxl-cmd,"
+                                       "path=%s,server,nowait",
+                                       libxl__qemu_qmp_path(gc, guest_domid)));
+        }
 
-    flexarray_append(dm_args, "-no-shutdown");
-    flexarray_append(dm_args, "-mon");
-    flexarray_append(dm_args, "chardev=libxl-cmd,mode=control");
+        flexarray_append(dm_args, "-mon");
+        flexarray_append(dm_args, "chardev=libxl-cmd,mode=control");
 
-    flexarray_append(dm_args, "-chardev");
-    flexarray_append(dm_args,
-                     GCSPRINTF("socket,id=libxenstat-cmd,"
-                                    "path=%s/qmp-libxenstat-%d,server,nowait",
-                                    libxl__run_dir_path(), guest_domid));
+        flexarray_append(dm_args, "-chardev");
+        flexarray_append(dm_args,
+                         GCSPRINTF("socket,id=libxenstat-cmd,"
+                                        "path=%s/qmp-libxenstat-%d,server,nowait",
+                                        libxl__run_dir_path(), guest_domid));
 
-    flexarray_append(dm_args, "-mon");
-    flexarray_append(dm_args, "chardev=libxenstat-cmd,mode=control");
+        flexarray_append(dm_args, "-mon");
+        flexarray_append(dm_args, "chardev=libxenstat-cmd,mode=control");
+    }
 
     for (i = 0; i < guest_config->num_channels; i++) {
         connection = guest_config->channels[i].connection;
@@ -1273,7 +1277,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         flexarray_vappend(dm_args, "-name", c_info->name, NULL);
     }
 
-    if (vnc) {
+    if (vnc && !is_stubdom) {
         char *vncarg = NULL;
 
         flexarray_append(dm_args, "-vnc");
@@ -1312,7 +1316,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         }
 
         flexarray_append(dm_args, vncarg);
-    } else
+    } else if (!is_stubdom)
         /*
          * Ensure that by default no vnc server is created.
          */
@@ -1324,7 +1328,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
      */
     flexarray_append_pair(dm_args, "-display", "none");
 
-    if (sdl) {
+    if (sdl && !is_stubdom) {
         flexarray_append(dm_args, "-sdl");
         if (sdl->display)
             flexarray_append_pair(dm_envs, "DISPLAY", sdl->display);
@@ -1366,18 +1370,34 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             {
                 LOGD(ERROR, guest_domid, "Both serial and serial_list set");
                 return ERROR_INVAL;
-            }
-            if (b_info->u.hvm.serial) {
-                flexarray_vappend(dm_args,
-                                  "-serial", b_info->u.hvm.serial, NULL);
-            } else if (b_info->u.hvm.serial_list) {
-                char **p;
-                for (p = b_info->u.hvm.serial_list;
-                     *p;
-                     p++) {
-                    flexarray_vappend(dm_args,
-                                      "-serial",
-                                      *p, NULL);
+            } else {
+                if (b_info->u.hvm.serial) {
+                    if (is_stubdom) {
+                        /* see spawn_stub_launch_dm() for connecting STUBDOM_CONSOLE_SERIAL */
+                        flexarray_vappend(dm_args,
+                                          "-serial",
+                                          GCSPRINTF("/dev/hvc%d", STUBDOM_CONSOLE_SERIAL),
+                                          NULL);
+                    } else {
+                        flexarray_vappend(dm_args,
+                                          "-serial", b_info->u.hvm.serial, NULL);
+                    }
+                } else if (b_info->u.hvm.serial_list) {
+                    char **p;
+                    /* see spawn_stub_launch_dm() for connecting STUBDOM_CONSOLE_SERIAL */
+                    for (p = b_info->u.hvm.serial_list, i = 0;
+                         *p;
+                         p++, i++) {
+                        if (is_stubdom)
+                            flexarray_vappend(dm_args,
+                                              "-serial",
+                                              GCSPRINTF("/dev/hvc%d", STUBDOM_CONSOLE_SERIAL + i),
+                                              NULL);
+                        else
+                            flexarray_vappend(dm_args,
+                                              "-serial",
+                                              *p, NULL);
+                    }
                 }
             }
         }
@@ -1386,7 +1406,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             flexarray_append(dm_args, "-nographic");
         }
 
-        if (libxl_defbool_val(b_info->u.hvm.spice.enable)) {
+        if (libxl_defbool_val(b_info->u.hvm.spice.enable) && !is_stubdom) {
             const libxl_spice_info *spice = &b_info->u.hvm.spice;
             char *spiceoptions = dm_spice_options(gc, spice);
             if (!spiceoptions)
@@ -1813,7 +1833,9 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
              * If qemu isn't doing the interpreting, the parameter is
              * always raw
              */
-            if (disks[i].backend == LIBXL_DISK_BACKEND_QDISK)
+            if (libxl_defbool_val(b_info->device_model_stubdomain))
+                format = "host_device";
+            else if (disks[i].backend == LIBXL_DISK_BACKEND_QDISK)
                 format = libxl__qemu_disk_format_string(disks[i].format);
             else
                 format = libxl__qemu_disk_format_string(LIBXL_DISK_FORMAT_RAW);
@@ -1824,6 +1846,16 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                          disks[i].vdev);
                     continue;
                 }
+            } else if (libxl_defbool_val(b_info->device_model_stubdomain)) {
+                if (disk > 'z' - 'a') {
+                    LOGD(WARN, guest_domid,
+                            "Emulation of only first %d disks is supported with qemu-xen in stubdomain.\n"
+                            "Disk %d will be available via PV drivers but not as an emulated disk.",
+                            'z' - 'a',
+                            disk);
+                    continue;
+                }
+                target_path = GCSPRINTF("/dev/xvd%c", 'a' + disk);
             } else {
                 if (format == NULL) {
                     LOGD(WARN, guest_domid,
@@ -1964,7 +1996,7 @@ static int libxl__build_device_model_args(libxl__gc *gc,
                                         char ***args, char ***envs,
                                         const libxl__domain_build_state *state,
                                         int *dm_state_fd)
-/* dm_state_fd may be NULL iff caller knows we are using old stubdom
+/* dm_state_fd may be NULL iff caller knows we are using stubdom
  * and therefore will be passing a filename rather than a fd. */
 {
     switch (guest_config->b_info.device_model_version) {
@@ -1974,8 +2006,10 @@ static int libxl__build_device_model_args(libxl__gc *gc,
                                                   args, envs,
                                                   state);
     case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
-        assert(dm_state_fd != NULL);
-        assert(*dm_state_fd < 0);
+        if (!libxl_defbool_val(guest_config->b_info.device_model_stubdomain)) {
+            assert(dm_state_fd != NULL);
+            assert(*dm_state_fd < 0);
+	}
         return libxl__build_device_model_args_new(gc, dm,
                                                   guest_domid, guest_config,
                                                   args, envs,
@@ -2080,6 +2114,16 @@ retry_transaction:
     return 0;
 }
 
+static int libxl__store_libxl_entry(libxl__gc *gc, uint32_t domid,
+                                    const char *name, const char *value)
+{
+    char *path = NULL;
+
+    path = libxl__xs_libxl_path(gc, domid);
+    path = libxl__sprintf(gc, "%s/%s", path, name);
+    return libxl__xs_printf(gc, XBT_NULL, path, "%s", value);
+}
+
 static void dmss_init(libxl__dm_spawn_state *dmss)
 {
     libxl__ev_qmp_init(&dmss->qmp);
@@ -2138,10 +2182,14 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
     dmss_init(&sdss->pvqemu);
     libxl__xswait_init(&sdss->xswait);
 
-    if (guest_config->b_info.device_model_version !=
-        LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL) {
-        ret = ERROR_INVAL;
-        goto out;
+    assert(libxl_defbool_val(guest_config->b_info.device_model_stubdomain));
+
+    if (libxl__stubdomain_is_linux(&guest_config->b_info)) {
+        if (d_state->saved_state) {
+            LOG(ERROR, "Save/Restore not supported yet with Linux Stubdom.");
+            ret = -1;
+            goto out;
+        }
     }
 
     sdss->pvqemu.guest_domid = INVALID_DOMID;
@@ -2163,8 +2211,8 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
 
     dm_config->b_info.shadow_memkb = 0;
     dm_config->b_info.max_vcpus = 1;
-    dm_config->b_info.max_memkb = 28 * 1024 +
-        guest_config->b_info.video_memkb;
+    dm_config->b_info.max_memkb = guest_config->b_info.stubdomain_memkb;
+    dm_config->b_info.max_memkb += guest_config->b_info.video_memkb;
     dm_config->b_info.target_memkb = dm_config->b_info.max_memkb;
 
     dm_config->b_info.max_grant_frames = guest_config->b_info.max_grant_frames;
@@ -2203,10 +2251,8 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
         dm_config->num_vkbs = 1;
     }
 
-    stubdom_state->pv_kernel.path
-        = libxl__abs_path(gc, "ioemu-stubdom.gz", libxl__xenfirmwaredir_path());
-    stubdom_state->pv_cmdline = GCSPRINTF(" -d %d", guest_domid);
-    stubdom_state->pv_ramdisk.path = "";
+    stubdom_state->pv_kernel.path = guest_config->b_info.stubdomain_kernel;
+    stubdom_state->pv_ramdisk.path = guest_config->b_info.stubdomain_ramdisk;
 
     /* fixme: this function can leak the stubdom if it fails */
     ret = libxl__domain_make(gc, dm_config, stubdom_state,
@@ -2226,6 +2272,8 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
         goto out;
     }
 
+    libxl__store_libxl_entry(gc, guest_domid, "dm-version",
+        libxl_device_model_version_to_string(dm_config->b_info.device_model_version));
     libxl__write_stub_dmargs(gc, dm_domid, guest_domid, args);
     libxl__xs_printf(gc, XBT_NULL,
                      GCSPRINTF("%s/image/device-model-domid",
@@ -2235,6 +2283,15 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
                      GCSPRINTF("%s/target",
                                libxl__xs_get_dompath(gc, dm_domid)),
                      "%d", guest_domid);
+    if (guest_config->b_info.device_model_version == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {
+        /* qemu-xen is used as a dm in the stubdomain, so we set the bios
+         * accroding to this */
+        libxl__xs_printf(gc, XBT_NULL,
+                        libxl__sprintf(gc, "%s/hvmloader/bios",
+                                       libxl__xs_get_dompath(gc, guest_domid)),
+                        "%s",
+                        libxl_bios_type_to_string(guest_config->b_info.u.hvm.bios));
+    }
     ret = xc_domain_set_target(ctx->xch, dm_domid, guest_domid);
     if (ret<0) {
         LOGED(ERROR, guest_domid, "setting target domain %d -> %d",
@@ -2316,6 +2373,11 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
 
     if (guest_config->b_info.u.hvm.serial)
         num_console++;
+    else if (guest_config->b_info.u.hvm.serial_list) {
+        char **serial = guest_config->b_info.u.hvm.serial_list;
+        while (*(serial++))
+            num_console++;
+    }
 
     console = libxl__calloc(gc, num_console, sizeof(libxl__device_console));
 
@@ -2349,8 +2411,18 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
                     console[i].output =
                         GCSPRINTF("pipe:%s", d_state->saved_state);
                 break;
+            case STUBDOM_CONSOLE_SERIAL:
+                if (guest_config->b_info.u.hvm.serial) {
+                    console[i].output = guest_config->b_info.u.hvm.serial;
+                    break;
+                }
+                /* fall-through */
             default:
-                console[i].output = "pty";
+                /* Serial_list is set, as otherwise num_consoles would be
+                 * smaller and consoles 0-2 are handled above. */
+                assert(guest_config->b_info.u.hvm.serial_list);
+                console[i].output = guest_config->b_info.u.hvm.serial_list[
+                    i-STUBDOM_CONSOLE_SERIAL];
                 break;
         }
     }
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index ebbf926897..a8f0eed945 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -119,6 +119,7 @@
 #define STUBDOM_CONSOLE_RESTORE 2
 #define STUBDOM_CONSOLE_SERIAL 3
 #define STUBDOM_SPECIAL_CONSOLES 3
+#define LIBXL_LINUX_STUBDOM_MEM 128
 #define TAP_DEVICE_SUFFIX "-emu"
 #define DOMID_XS_PATH "domid"
 #define PVSHIM_BASENAME "xen-shim"
diff --git a/tools/libxl/libxl_mem.c b/tools/libxl/libxl_mem.c
index bc7b95aa74..e52a9624ea 100644
--- a/tools/libxl/libxl_mem.c
+++ b/tools/libxl/libxl_mem.c
@@ -459,8 +459,10 @@ int libxl__domain_need_memory_calculate(libxl__gc *gc,
     case LIBXL_DOMAIN_TYPE_PVH:
     case LIBXL_DOMAIN_TYPE_HVM:
         *need_memkb += LIBXL_HVM_EXTRA_MEMORY;
-        if (libxl_defbool_val(b_info->device_model_stubdomain))
-            *need_memkb += 32 * 1024;
+        if (libxl_defbool_val(b_info->device_model_stubdomain)) {
+            *need_memkb += b_info->stubdomain_memkb;
+            *need_memkb += b_info->video_memkb;
+        }
         break;
     case LIBXL_DOMAIN_TYPE_PV:
         *need_memkb += LIBXL_PV_EXTRA_MEMORY;
diff --git a/tools/libxl/libxl_types.idl b/tools/libxl/libxl_types.idl
index f7c473be74..9d3f05f399 100644
--- a/tools/libxl/libxl_types.idl
+++ b/tools/libxl/libxl_types.idl
@@ -518,6 +518,9 @@ libxl_domain_build_info = Struct("domain_build_info",[
     
     ("device_model_version", libxl_device_model_version),
     ("device_model_stubdomain", libxl_defbool),
+    ("stubdomain_memkb",   MemKB),
+    ("stubdomain_kernel",  string),
+    ("stubdomain_ramdisk", string),
     # if you set device_model you must set device_model_version too
     ("device_model",     string),
     ("device_model_ssidref", uint32),
-- 
2.20.1


