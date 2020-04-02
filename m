Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B44A119C641
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 17:46:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jK23D-0003pe-Kb; Thu, 02 Apr 2020 15:46:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jjwm=5S=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jK23B-0003oj-U6
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 15:46:37 +0000
X-Inumbo-ID: 1a56d96c-74f9-11ea-bc01-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a56d96c-74f9-11ea-bc01-12813bfff9fa;
 Thu, 02 Apr 2020 15:46:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5C92EAE61;
 Thu,  2 Apr 2020 15:46:21 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 10/12] tools/libxl: use libxenhypfs for setting xen runtime
 parameters
Date: Thu,  2 Apr 2020 17:46:14 +0200
Message-Id: <20200402154616.16927-11-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200402154616.16927-1-jgross@suse.com>
References: <20200402154616.16927-1-jgross@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Instead of xc_set_parameters() use xenhypfs_write() for setting
parameters of the hypervisor.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V6:
- new patch
---
 tools/Rules.mk               |  2 +-
 tools/libxl/Makefile         |  3 ++-
 tools/libxl/libxl.c          | 53 +++++++++++++++++++++++++++++++++++++++-----
 tools/libxl/libxl_internal.h |  1 +
 tools/libxl/xenlight.pc.in   |  2 +-
 tools/xl/xl_misc.c           |  1 -
 6 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 711e9598cd..ee0f130276 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -180,7 +180,7 @@ CFLAGS += -O2 -fomit-frame-pointer
 endif
 
 CFLAGS_libxenlight = -I$(XEN_XENLIGHT) $(CFLAGS_libxenctrl) $(CFLAGS_xeninclude)
-SHDEPS_libxenlight = $(SHLIB_libxenctrl) $(SHLIB_libxenstore)
+SHDEPS_libxenlight = $(SHLIB_libxenctrl) $(SHLIB_libxenstore) $(SHLIB_libxenhypfs)
 LDLIBS_libxenlight = $(SHDEPS_libxenlight) $(XEN_XENLIGHT)/libxenlight$(libextension)
 SHLIB_libxenlight  = $(SHDEPS_libxenlight) -Wl,-rpath-link=$(XEN_XENLIGHT)
 
diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index 69fcf21577..a89ebab0b4 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -20,7 +20,7 @@ LIBUUID_LIBS += -luuid
 endif
 
 LIBXL_LIBS =
-LIBXL_LIBS = $(LDLIBS_libxentoollog) $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(PTYFUNCS_LIBS) $(LIBUUID_LIBS)
+LIBXL_LIBS = $(LDLIBS_libxentoollog) $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenhypfs) $(LDLIBS_libxenstore) $(LDLIBS_libxentoolcore) $(PTYFUNCS_LIBS) $(LIBUUID_LIBS)
 ifeq ($(CONFIG_LIBNL),y)
 LIBXL_LIBS += $(LIBNL3_LIBS)
 endif
@@ -33,6 +33,7 @@ CFLAGS_LIBXL += $(CFLAGS_libxentoolcore)
 CFLAGS_LIBXL += $(CFLAGS_libxenevtchn)
 CFLAGS_LIBXL += $(CFLAGS_libxenctrl)
 CFLAGS_LIBXL += $(CFLAGS_libxenguest)
+CFLAGS_LIBXL += $(CFLAGS_libxenhypfs)
 CFLAGS_LIBXL += $(CFLAGS_libxenstore)
 ifeq ($(CONFIG_LIBNL),y)
 CFLAGS_LIBXL += $(LIBNL3_CFLAGS)
diff --git a/tools/libxl/libxl.c b/tools/libxl/libxl.c
index f60fd3e4fd..621acc88f3 100644
--- a/tools/libxl/libxl.c
+++ b/tools/libxl/libxl.c
@@ -663,15 +663,56 @@ int libxl_set_parameters(libxl_ctx *ctx, char *params)
 {
     int ret;
     GC_INIT(ctx);
+    char *par, *val, *end, *path;
+    xenhypfs_handle *hypfs;
 
-    ret = xc_set_parameters(ctx->xch, params);
-    if (ret < 0) {
-        LOGEV(ERROR, ret, "setting parameters");
-        GC_FREE;
-        return ERROR_FAIL;
+    hypfs = xenhypfs_open(ctx->lg, 0);
+    if (!hypfs) {
+        LOGE(ERROR, "opening Xen hypfs");
+        ret = ERROR_FAIL;
+        goto out;
     }
+
+    while (isblank(*params))
+        params++;
+
+    for (par = params; *par; par = end) {
+        end = strchr(par, ' ');
+        if (!end)
+            end = par + strlen(par);
+
+        val = strchr(par, '=');
+        if (val > end)
+            val = NULL;
+        if (!val && !strncmp(par, "no", 2)) {
+            path = libxl__sprintf(gc, "/params/%s", par + 2);
+            path[end - par - 2 + 8] = 0;
+            val = "no";
+            par += 2;
+        } else {
+            path = libxl__sprintf(gc, "/params/%s", par);
+            path[val - par + 8] = 0;
+            val = libxl__strndup(gc, val + 1, end - val - 1);
+        }
+
+	LOG(DEBUG, "setting node \"%s\" to value \"%s\"", path, val);
+        ret = xenhypfs_write(hypfs, path, val);
+        if (ret < 0) {
+            LOGE(ERROR, "setting parameters");
+            ret = ERROR_FAIL;
+            goto out;
+        }
+
+        while (isblank(*end))
+            end++;
+    }
+
+    ret = 0;
+
+out:
+    xenhypfs_close(hypfs);
     GC_FREE;
-    return 0;
+    return ret;
 }
 
 static int fd_set_flags(libxl_ctx *ctx, int fd,
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index 5f39e44cb9..7153beb8f8 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -56,6 +56,7 @@
 #define XC_WANT_COMPAT_MAP_FOREIGN_API
 #include <xenctrl.h>
 #include <xenguest.h>
+#include <xenhypfs.h>
 #include <xc_dom.h>
 
 #include <xen-tools/libs.h>
diff --git a/tools/libxl/xenlight.pc.in b/tools/libxl/xenlight.pc.in
index c0f769fd20..6b351ba096 100644
--- a/tools/libxl/xenlight.pc.in
+++ b/tools/libxl/xenlight.pc.in
@@ -9,4 +9,4 @@ Description: The Xenlight library for Xen hypervisor
 Version: @@version@@
 Cflags: -I${includedir}
 Libs: @@libsflag@@${libdir} -lxenlight
-Requires.private: xentoollog,xenevtchn,xencontrol,xenguest,xenstore
+Requires.private: xentoollog,xenevtchn,xencontrol,xenguest,xenstore,xenhypfs
diff --git a/tools/xl/xl_misc.c b/tools/xl/xl_misc.c
index 20ed605f4f..08f0fb6dc9 100644
--- a/tools/xl/xl_misc.c
+++ b/tools/xl/xl_misc.c
@@ -168,7 +168,6 @@ int main_set_parameters(int argc, char **argv)
 
     if (libxl_set_parameters(ctx, params)) {
         fprintf(stderr, "cannot set parameters: %s\n", params);
-        fprintf(stderr, "Use \"xl dmesg\" to look for possible reason.\n");
         return EXIT_FAILURE;
     }
 
-- 
2.16.4


