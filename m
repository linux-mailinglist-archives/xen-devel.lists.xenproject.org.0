Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9CC7A59F8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 08:31:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604373.941730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUGB-0004LY-4P; Tue, 19 Sep 2023 06:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604373.941730; Tue, 19 Sep 2023 06:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUGA-0004EW-W3; Tue, 19 Sep 2023 06:30:58 +0000
Received: by outflank-mailman (input) for mailman id 604373;
 Tue, 19 Sep 2023 06:30:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=72lO=FD=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qiUG9-000365-Ds
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 06:30:57 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16cf209c-56b6-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 08:30:56 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-403012f276dso57094985e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 23:30:56 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (cpc92302-cmbg19-2-0-cust781.5-4.cable.virginm.net. [82.1.211.14])
 by smtp.gmail.com with ESMTPSA id
 26-20020a05600c229a00b003fe17901fcdsm17068780wmf.32.2023.09.18.23.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 23:30:55 -0700 (PDT)
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
X-Inumbo-ID: 16cf209c-56b6-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695105056; x=1695709856; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvhbCNuYjHTCOHSrJQTmuxTZfNtPGxI3jc+wOT5X06U=;
        b=lWXOZVAb3RHD+IuLLUaDWM/wxVc4ppx58ZDN9zc/66UMzIP+aNw1hNqYrRcYPDSwuG
         YB5cspJFKVo3AVF7541/RF4w5aFMapyShNuJQaYEIQzPCyRdjGAN2RqeBZmNqw29lX9o
         oAl2Ue0U72g42Fy80ni9miP0MRvSIwR1BAqB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695105056; x=1695709856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvhbCNuYjHTCOHSrJQTmuxTZfNtPGxI3jc+wOT5X06U=;
        b=AkBOpfHoysw5E/n4gu+bjJ+CPGbHd7XvDDV1JCM735NApBsKcjGM8GMVABEils2vMd
         E6rbZVGvqaKu4++MvRBZU7A7fAkf3IgUA4N1RpGinqAdD4prsE0q3vlrHapFIPgiHsHl
         IugWQDSZSnD/hfn66YOZsbCWn9M8SxM+fl4ER8VL4hNmHG8UfSFnlFgoTH1sroWdKhIB
         9HI9OI4xv1ArktQYCNcg6tM+uKTQh02VK+qxehnTDEXc8Wj1NGP+560l5Ih9crZ60n1i
         kgEmc2IE0CGfBLKlK3ud8L7rSnlm3tsi2l6ReaXBEFdshwwWVOaCwPyHItE1a5XbqOXR
         c0/A==
X-Gm-Message-State: AOJu0Yw6AoyJ7zT6DErad+dzUaOx1JUrkxx2g4Pp1yEU4RURcM7pceDI
	XbM5goW+h7JsqWyTbE8AhkKodG+CFXqFoEMTHtk=
X-Google-Smtp-Source: AGHT+IFi/Nob+ea/5Pk06GDURe4HI2/PcXwQbwQcWEynA5ihJDMmtRJnRrDqm6ualnJ904MlOMAWyw==
X-Received: by 2002:adf:e181:0:b0:320:9fa:d928 with SMTP id az1-20020adfe181000000b0032009fad928mr7015652wrb.68.1695105055868;
        Mon, 18 Sep 2023 23:30:55 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Javi Merino <javi.merino@cloud.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v3 3/4] tools: don't use distutils in configure nor Makefile
Date: Tue, 19 Sep 2023 07:30:28 +0100
Message-ID: <9647bf6e5ae1f06ed95db3f9bd67920dfb6b613b.1695104399.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1695104399.git.javi.merino@cloud.com>
References: <cover.1695104399.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Python distutils is deprecated and is going to be removed in Python
3.12.  distutils.sysconfig is available as the sysconfig module in
stdlib since Python 2.7 and Python 3.2, so use that directly.

Update the README to reflect that we now depend on Python 2.7.

Regenerate configure after the m4/python_devel.m4 change.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 README                   |  4 ++--
 m4/python_devel.m4       | 28 +++++++++++-----------
 tools/configure          | 52 ++++++++++++++++------------------------
 tools/libs/stat/Makefile |  4 ++--
 4 files changed, 38 insertions(+), 50 deletions(-)

diff --git a/README b/README
index f8cc426f78..f75fa536d9 100644
--- a/README
+++ b/README
@@ -50,7 +50,7 @@ provided by your OS distributor:
         - GNU Binutils 2.24 or later
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
-    * Development install of Python 2.6 or later (e.g., python-dev)
+    * Development install of Python 2.7 or later (e.g., python-dev)
     * Development install of curses (e.g., libncurses-dev)
     * Development install of openssl (e.g., openssl-dev)
     * Development install of x11 (e.g. xorg-x11-dev)
@@ -180,7 +180,7 @@ Python Runtime Libraries
 
 Various tools, such as pygrub, have the following runtime dependencies:
 
-    * Python 2.6 or later.
+    * Python 2.7 or later.
           URL:    https://www.python.org/
           Debian: python
 
diff --git a/m4/python_devel.m4 b/m4/python_devel.m4
index bbf1e0354b..bb60857b03 100644
--- a/m4/python_devel.m4
+++ b/m4/python_devel.m4
@@ -5,21 +5,21 @@ ac_previous_libs=$LIBS
 AC_PATH_PROG([pyconfig], [$PYTHON-config], [no])
 AS_IF([test x"$pyconfig" = x"no"], [
     dnl For those that don't have python-config
-    CPPFLAGS="$CFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print("-I" + distutils.sysconfig.get_config_var("INCLUDEPY"))'`"
-    CPPFLAGS="$CPPFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("CFLAGS"))'`"
-    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print("-L" + distutils.sysconfig.get_python_lib(plat_specific=1,\
+    CPPFLAGS="$CFLAGS `$PYTHON -c 'import sysconfig; \
+        print("-I" + sysconfig.get_config_var("INCLUDEPY"))'`"
+    CPPFLAGS="$CPPFLAGS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("CFLAGS"))'`"
+    LDFLAGS="$LDFLAGS `$PYTHON -c 'import sysconfig; \
+        print("-L" + sysconfig.get_python_lib(plat_specific=1,\
         standard_lib=1) + "/config")'`"
-    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("LINKFORSHARED"))'`"
-    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("LDFLAGS"))'`"
-    LIBS="$LIBS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("LIBS"))'`"
-    LIBS="$LIBS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("SYSLIBS"))'`"
+    LDFLAGS="$LDFLAGS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("LINKFORSHARED"))'`"
+    LDFLAGS="$LDFLAGS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("LDFLAGS"))'`"
+    LIBS="$LIBS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("LIBS"))'`"
+    LIBS="$LIBS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("SYSLIBS"))'`"
 ], [
     dnl If python-config is found use it
     CPPFLAGS="$CFLAGS `$PYTHON-config --cflags`"
diff --git a/tools/configure b/tools/configure
index 96218cadc4..ae10f6cecd 100755
--- a/tools/configure
+++ b/tools/configure
@@ -774,7 +774,6 @@ infodir
 docdir
 oldincludedir
 includedir
-runstatedir
 localstatedir
 sharedstatedir
 sysconfdir
@@ -905,7 +904,6 @@ datadir='${datarootdir}'
 sysconfdir='${prefix}/etc'
 sharedstatedir='${prefix}/com'
 localstatedir='${prefix}/var'
-runstatedir='${localstatedir}/run'
 includedir='${prefix}/include'
 oldincludedir='/usr/include'
 docdir='${datarootdir}/doc/${PACKAGE_TARNAME}'
@@ -1158,15 +1156,6 @@ do
   | -silent | --silent | --silen | --sile | --sil)
     silent=yes ;;
 
-  -runstatedir | --runstatedir | --runstatedi | --runstated \
-  | --runstate | --runstat | --runsta | --runst | --runs \
-  | --run | --ru | --r)
-    ac_prev=runstatedir ;;
-  -runstatedir=* | --runstatedir=* | --runstatedi=* | --runstated=* \
-  | --runstate=* | --runstat=* | --runsta=* | --runst=* | --runs=* \
-  | --run=* | --ru=* | --r=*)
-    runstatedir=$ac_optarg ;;
-
   -sbindir | --sbindir | --sbindi | --sbind | --sbin | --sbi | --sb)
     ac_prev=sbindir ;;
   -sbindir=* | --sbindir=* | --sbindi=* | --sbind=* | --sbin=* \
@@ -1304,7 +1293,7 @@ fi
 for ac_var in	exec_prefix prefix bindir sbindir libexecdir datarootdir \
 		datadir sysconfdir sharedstatedir localstatedir includedir \
 		oldincludedir docdir infodir htmldir dvidir pdfdir psdir \
-		libdir localedir mandir runstatedir
+		libdir localedir mandir
 do
   eval ac_val=\$$ac_var
   # Remove trailing slashes.
@@ -1457,7 +1446,6 @@ Fine tuning of the installation directories:
   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
-  --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
   --libdir=DIR            object code libraries [EPREFIX/lib]
   --includedir=DIR        C header files [PREFIX/include]
   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
@@ -3397,7 +3385,7 @@ else
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3443,7 +3431,7 @@ else
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3467,7 +3455,7 @@ rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3512,7 +3500,7 @@ else
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3536,7 +3524,7 @@ rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -7852,21 +7840,21 @@ fi
 
 if test x"$pyconfig" = x"no"; then :
 
-        CPPFLAGS="$CFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print("-I" + distutils.sysconfig.get_config_var("INCLUDEPY"))'`"
-    CPPFLAGS="$CPPFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("CFLAGS"))'`"
-    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print("-L" + distutils.sysconfig.get_python_lib(plat_specific=1,\
+        CPPFLAGS="$CFLAGS `$PYTHON -c 'import sysconfig; \
+        print("-I" + sysconfig.get_config_var("INCLUDEPY"))'`"
+    CPPFLAGS="$CPPFLAGS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("CFLAGS"))'`"
+    LDFLAGS="$LDFLAGS `$PYTHON -c 'import sysconfig; \
+        print("-L" + sysconfig.get_python_lib(plat_specific=1,\
         standard_lib=1) + "/config")'`"
-    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("LINKFORSHARED"))'`"
-    LDFLAGS="$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("LDFLAGS"))'`"
-    LIBS="$LIBS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("LIBS"))'`"
-    LIBS="$LIBS `$PYTHON -c 'import distutils.sysconfig; \
-        print(distutils.sysconfig.get_config_var("SYSLIBS"))'`"
+    LDFLAGS="$LDFLAGS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("LINKFORSHARED"))'`"
+    LDFLAGS="$LDFLAGS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("LDFLAGS"))'`"
+    LIBS="$LIBS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("LIBS"))'`"
+    LIBS="$LIBS `$PYTHON -c 'import sysconfig; \
+        print(sysconfig.get_config_var("SYSLIBS"))'`"
 
 else
 
diff --git a/tools/libs/stat/Makefile b/tools/libs/stat/Makefile
index ee5c42bf7b..a968eaff48 100644
--- a/tools/libs/stat/Makefile
+++ b/tools/libs/stat/Makefile
@@ -73,8 +73,8 @@ $(PYLIB): $(PYSRC)
 python-bindings: $(PYLIB) $(PYMOD)
 
 pythonlibdir = $(shell $(PYTHON) -c \
-	       'import distutils.sysconfig as cfg; \
-	        print(cfg.get_python_lib(False, False, prefix="$(prefix)"))')
+	       'import sysconfig; \
+	        print(sysconfig.get_python_lib("platlib", vars={"platbase": "$(prefix)"}))')
 
 .PHONY: install-python-bindings
 install-python-bindings: $(PYLIB) $(PYMOD)
-- 
2.42.0


