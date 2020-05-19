Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CB41D90E5
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 09:21:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jawZF-0004wI-LM; Tue, 19 May 2020 07:21:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aMO8=7B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jawZE-0004vS-EO
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 07:21:36 +0000
X-Inumbo-ID: 5191f7ee-99a1-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5191f7ee-99a1-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 07:21:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2137FB21D;
 Tue, 19 May 2020 07:21:14 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v10 10/12] tools/libxl: use libxenhypfs for setting xen
 runtime parameters
Date: Tue, 19 May 2020 09:21:04 +0200
Message-Id: <20200519072106.26894-11-jgross@suse.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200519072106.26894-1-jgross@suse.com>
References: <20200519072106.26894-1-jgross@suse.com>
MIME-Version: 1.0
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
 tools/libxl/Makefile         |  3 +-
 tools/libxl/libxl.c          | 53 ++++++++++++++++++++++++++++++++----
 tools/libxl/libxl_internal.h |  1 +
 tools/libxl/xenlight.pc.in   |  2 +-
 tools/xl/xl_misc.c           |  1 -
 6 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index ad6073fcad..883a193f9e 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -178,7 +178,7 @@ CFLAGS += -O2 -fomit-frame-pointer
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
index e5effd2ad1..b85b771659 100644
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
2.26.1


