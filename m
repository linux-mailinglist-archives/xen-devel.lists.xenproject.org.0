Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152891F7A9C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 17:19:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjlT4-0002Xh-Rj; Fri, 12 Jun 2020 15:19:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6GtF=7Z=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jjlT3-0002XL-Ms
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 15:19:41 +0000
X-Inumbo-ID: 20de7280-acc0-11ea-bb8b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20de7280-acc0-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 15:19:37 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jjlSy-0005QE-Um; Fri, 12 Jun 2020 16:19:37 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [XEN PATCH for-4.14 1/2] tools: Commit autoconf (2.69) output from
 Debian buster
Date: Fri, 12 Jun 2020 16:19:30 +0100
Message-Id: <20200612151931.1083-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <000401d640c9$7b14e760$713eb620$@xen.org>
References: <000401d640c9$7b14e760$713eb620$@xen.org>
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, ian.jackson@eu.citrix.com,
 Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

These files are in tree so that people can build (including from git)
without needing recent autotools.

We should update them periodically.  Debian buster has been Debian
stable fopr a while.  Our CI is running buster.

There should be no significant functional change; it's possible that
there are bugfixes to the configure scripts but I have not reviewed
them.

These files were last changed in
  83c845033dc8bb3a35ae245effb7832b6823174a
  libxl: use vchan for QMP access with Linux stubdomain
where a new feature was added.  However, that commit contains a lot of
extraneous noise in configure compared to its parent.

Compared to 83c845033dc8bb3a35ae245effb7832b6823174a~, this commit
restores those extraneous changes, leaving precisely the correct
changes.  So one way of looking at the changes we are making now, is
that we are undoing accidental changes to the autoconf output.

CC: Wei Liu <wl@xen.org>
CC: Nick Rosbrook <rosbrookn@gmail.com>
Reported-by: Nick Rosbrook <rosbrookn@gmail.com>
CC: Paul Durrant <paul@xen.org>
Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 configure         | 14 +++++++++++++-
 docs/configure    | 14 +++++++++++++-
 stubdom/configure | 14 +++++++++++++-
 tools/configure   | 24 ++++++++++++++++++------
 4 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/configure b/configure
index 8af54e8a5a..9da3970cef 100755
--- a/configure
+++ b/configure
@@ -644,6 +644,7 @@ infodir
 docdir
 oldincludedir
 includedir
+runstatedir
 localstatedir
 sharedstatedir
 sysconfdir
@@ -722,6 +723,7 @@ datadir='${datarootdir}'
 sysconfdir='${prefix}/etc'
 sharedstatedir='${prefix}/com'
 localstatedir='${prefix}/var'
+runstatedir='${localstatedir}/run'
 includedir='${prefix}/include'
 oldincludedir='/usr/include'
 docdir='${datarootdir}/doc/${PACKAGE_TARNAME}'
@@ -974,6 +976,15 @@ do
   | -silent | --silent | --silen | --sile | --sil)
     silent=yes ;;
 
+  -runstatedir | --runstatedir | --runstatedi | --runstated \
+  | --runstate | --runstat | --runsta | --runst | --runs \
+  | --run | --ru | --r)
+    ac_prev=runstatedir ;;
+  -runstatedir=* | --runstatedir=* | --runstatedi=* | --runstated=* \
+  | --runstate=* | --runstat=* | --runsta=* | --runst=* | --runs=* \
+  | --run=* | --ru=* | --r=*)
+    runstatedir=$ac_optarg ;;
+
   -sbindir | --sbindir | --sbindi | --sbind | --sbin | --sbi | --sb)
     ac_prev=sbindir ;;
   -sbindir=* | --sbindir=* | --sbindi=* | --sbind=* | --sbin=* \
@@ -1111,7 +1122,7 @@ fi
 for ac_var in	exec_prefix prefix bindir sbindir libexecdir datarootdir \
 		datadir sysconfdir sharedstatedir localstatedir includedir \
 		oldincludedir docdir infodir htmldir dvidir pdfdir psdir \
-		libdir localedir mandir
+		libdir localedir mandir runstatedir
 do
   eval ac_val=\$$ac_var
   # Remove trailing slashes.
@@ -1264,6 +1275,7 @@ Fine tuning of the installation directories:
   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
+  --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
   --libdir=DIR            object code libraries [EPREFIX/lib]
   --includedir=DIR        C header files [PREFIX/include]
   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
diff --git a/docs/configure b/docs/configure
index 93e9dcf404..9e3ed60462 100755
--- a/docs/configure
+++ b/docs/configure
@@ -634,6 +634,7 @@ infodir
 docdir
 oldincludedir
 includedir
+runstatedir
 localstatedir
 sharedstatedir
 sysconfdir
@@ -710,6 +711,7 @@ datadir='${datarootdir}'
 sysconfdir='${prefix}/etc'
 sharedstatedir='${prefix}/com'
 localstatedir='${prefix}/var'
+runstatedir='${localstatedir}/run'
 includedir='${prefix}/include'
 oldincludedir='/usr/include'
 docdir='${datarootdir}/doc/${PACKAGE_TARNAME}'
@@ -962,6 +964,15 @@ do
   | -silent | --silent | --silen | --sile | --sil)
     silent=yes ;;
 
+  -runstatedir | --runstatedir | --runstatedi | --runstated \
+  | --runstate | --runstat | --runsta | --runst | --runs \
+  | --run | --ru | --r)
+    ac_prev=runstatedir ;;
+  -runstatedir=* | --runstatedir=* | --runstatedi=* | --runstated=* \
+  | --runstate=* | --runstat=* | --runsta=* | --runst=* | --runs=* \
+  | --run=* | --ru=* | --r=*)
+    runstatedir=$ac_optarg ;;
+
   -sbindir | --sbindir | --sbindi | --sbind | --sbin | --sbi | --sb)
     ac_prev=sbindir ;;
   -sbindir=* | --sbindir=* | --sbindi=* | --sbind=* | --sbin=* \
@@ -1099,7 +1110,7 @@ fi
 for ac_var in	exec_prefix prefix bindir sbindir libexecdir datarootdir \
 		datadir sysconfdir sharedstatedir localstatedir includedir \
 		oldincludedir docdir infodir htmldir dvidir pdfdir psdir \
-		libdir localedir mandir
+		libdir localedir mandir runstatedir
 do
   eval ac_val=\$$ac_var
   # Remove trailing slashes.
@@ -1252,6 +1263,7 @@ Fine tuning of the installation directories:
   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
+  --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
   --libdir=DIR            object code libraries [EPREFIX/lib]
   --includedir=DIR        C header files [PREFIX/include]
   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
diff --git a/stubdom/configure b/stubdom/configure
index f7604a37f7..da03da535a 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -661,6 +661,7 @@ infodir
 docdir
 oldincludedir
 includedir
+runstatedir
 localstatedir
 sharedstatedir
 sysconfdir
@@ -750,6 +751,7 @@ datadir='${datarootdir}'
 sysconfdir='${prefix}/etc'
 sharedstatedir='${prefix}/com'
 localstatedir='${prefix}/var'
+runstatedir='${localstatedir}/run'
 includedir='${prefix}/include'
 oldincludedir='/usr/include'
 docdir='${datarootdir}/doc/${PACKAGE_TARNAME}'
@@ -1002,6 +1004,15 @@ do
   | -silent | --silent | --silen | --sile | --sil)
     silent=yes ;;
 
+  -runstatedir | --runstatedir | --runstatedi | --runstated \
+  | --runstate | --runstat | --runsta | --runst | --runs \
+  | --run | --ru | --r)
+    ac_prev=runstatedir ;;
+  -runstatedir=* | --runstatedir=* | --runstatedi=* | --runstated=* \
+  | --runstate=* | --runstat=* | --runsta=* | --runst=* | --runs=* \
+  | --run=* | --ru=* | --r=*)
+    runstatedir=$ac_optarg ;;
+
   -sbindir | --sbindir | --sbindi | --sbind | --sbin | --sbi | --sb)
     ac_prev=sbindir ;;
   -sbindir=* | --sbindir=* | --sbindi=* | --sbind=* | --sbin=* \
@@ -1139,7 +1150,7 @@ fi
 for ac_var in	exec_prefix prefix bindir sbindir libexecdir datarootdir \
 		datadir sysconfdir sharedstatedir localstatedir includedir \
 		oldincludedir docdir infodir htmldir dvidir pdfdir psdir \
-		libdir localedir mandir
+		libdir localedir mandir runstatedir
 do
   eval ac_val=\$$ac_var
   # Remove trailing slashes.
@@ -1292,6 +1303,7 @@ Fine tuning of the installation directories:
   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
+  --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
   --libdir=DIR            object code libraries [EPREFIX/lib]
   --includedir=DIR        C header files [PREFIX/include]
   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
diff --git a/tools/configure b/tools/configure
index 3df1a01ff9..b3668ec98d 100755
--- a/tools/configure
+++ b/tools/configure
@@ -772,6 +772,7 @@ infodir
 docdir
 oldincludedir
 includedir
+runstatedir
 localstatedir
 sharedstatedir
 sysconfdir
@@ -899,6 +900,7 @@ datadir='${datarootdir}'
 sysconfdir='${prefix}/etc'
 sharedstatedir='${prefix}/com'
 localstatedir='${prefix}/var'
+runstatedir='${localstatedir}/run'
 includedir='${prefix}/include'
 oldincludedir='/usr/include'
 docdir='${datarootdir}/doc/${PACKAGE_TARNAME}'
@@ -1151,6 +1153,15 @@ do
   | -silent | --silent | --silen | --sile | --sil)
     silent=yes ;;
 
+  -runstatedir | --runstatedir | --runstatedi | --runstated \
+  | --runstate | --runstat | --runsta | --runst | --runs \
+  | --run | --ru | --r)
+    ac_prev=runstatedir ;;
+  -runstatedir=* | --runstatedir=* | --runstatedi=* | --runstated=* \
+  | --runstate=* | --runstat=* | --runsta=* | --runst=* | --runs=* \
+  | --run=* | --ru=* | --r=*)
+    runstatedir=$ac_optarg ;;
+
   -sbindir | --sbindir | --sbindi | --sbind | --sbin | --sbi | --sb)
     ac_prev=sbindir ;;
   -sbindir=* | --sbindir=* | --sbindi=* | --sbind=* | --sbin=* \
@@ -1288,7 +1299,7 @@ fi
 for ac_var in	exec_prefix prefix bindir sbindir libexecdir datarootdir \
 		datadir sysconfdir sharedstatedir localstatedir includedir \
 		oldincludedir docdir infodir htmldir dvidir pdfdir psdir \
-		libdir localedir mandir
+		libdir localedir mandir runstatedir
 do
   eval ac_val=\$$ac_var
   # Remove trailing slashes.
@@ -1441,6 +1452,7 @@ Fine tuning of the installation directories:
   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
+  --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
   --libdir=DIR            object code libraries [EPREFIX/lib]
   --includedir=DIR        C header files [PREFIX/include]
   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
@@ -3374,7 +3386,7 @@ else
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
+#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3420,7 +3432,7 @@ else
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
+#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3444,7 +3456,7 @@ rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
+#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3489,7 +3501,7 @@ else
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
+#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3513,7 +3525,7 @@ rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
+#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
-- 
2.20.1


