Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB081BB4F4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:06:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHVw-0000w2-HF; Tue, 28 Apr 2020 04:06:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHVv-0000uw-2a
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:06:31 +0000
X-Inumbo-ID: 97cf9628-8905-11ea-9887-bc764e2007e4
Received: from mail-qk1-x736.google.com (unknown [2607:f8b0:4864:20::736])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97cf9628-8905-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 04:06:10 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id 20so20510581qkl.10
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V/z9lnZ0BRCy+VnythBjJZ2hhGpF1b82Kvc/b7advnU=;
 b=q8wkYTHAKnhWREAxnGMsaBI2I5+A9JCTsJ7hKQ8+7bSR7oUX1XZiDxmLyxZKRMj0T3
 Wr3k49T9e11IeTlJkKB2xIxgSyS3RUxOhyVC9yu33t0I2FRrfXJTFZGoJuZijF9idj3r
 ZwYmIEOMI7TPjZYXF1GtRtnXGoZxXSTZK5oQnWUjif3lx+hK+UW202v6f8QmKFXIcbQ1
 5if9AuOnvbrIDibCqPSQz1UroUrvhsa7mdLuPEgDgNH2OBp1zAeLLO+E0Fv+9r8j58hY
 dkWnrN0JiFI75jnenO2ddBcCFF8SuRVR24ph053HGcTaBYJB3iK1IXNFtXfNDePebwb0
 ooaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V/z9lnZ0BRCy+VnythBjJZ2hhGpF1b82Kvc/b7advnU=;
 b=PBGK2rVTfgomm9kqQy8TeWt0kVp/lKexcxh447GLmNcU5XLe1SX6MRbkSJzia4VdR/
 wGLwPMAWe+0XckS/Ek1Ov8+3PxFCXfQ3qMqzjHcxkivb+Og9MapOm+CSkCAbD/p2FO4t
 68N3fAxo4qUGNPUnqzwTyCOX1PBN5qZwgPpuzKNt5XYJwA7drEcmnaP+0rC4pYdrqB6F
 M0JWAjkw3GJwDIimQcSSz1Gb14o8KJ4HmmIK14D22gTgIWnBS29RdZuawJ5Dhat3uGwx
 YiCwXySQ2A0x4/6X01sJYLwEo3Pa2XCmtiRASoJVDACqerKWyWwm9UIaNjfMwEIz9tPk
 51oA==
X-Gm-Message-State: AGi0PuZP5mnWNmWVK3mh+16T22OmMLaWrNFXPMAdBCkwv2eQ9yDUPecd
 0QwV4//DdB7aZsa2lFSxbx4pjIyw
X-Google-Smtp-Source: APiQypIvLkZzfSVB1plttzJ6y6qYj5X45wQJja+PvCKKj+WyiRCGg2ns9uvaHgA/oyELOz1BuY+/YA==
X-Received: by 2002:a37:387:: with SMTP id 129mr25703101qkd.147.1588046769511; 
 Mon, 27 Apr 2020 21:06:09 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:06:08 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 13/21] Regenerate autotools files
Date: Tue, 28 Apr 2020 00:04:25 -0400
Message-Id: <20200428040433.23504-14-jandryuk@gmail.com>
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
Cc: Ian Jackson <ian.jackson@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Since we have those generated files committed to the repo (why?!),
update them after changing configure.ac.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 configure         | 14 +-------------
 docs/configure    | 14 +-------------
 stubdom/configure | 14 +-------------
 tools/config.h.in |  3 +++
 tools/configure   | 46 ++++++++++++++++++++++++++++------------------
 5 files changed, 34 insertions(+), 57 deletions(-)

diff --git a/configure b/configure
index 9da3970cef..8af54e8a5a 100755
--- a/configure
+++ b/configure
@@ -644,7 +644,6 @@ infodir
 docdir
 oldincludedir
 includedir
-runstatedir
 localstatedir
 sharedstatedir
 sysconfdir
@@ -723,7 +722,6 @@ datadir='${datarootdir}'
 sysconfdir='${prefix}/etc'
 sharedstatedir='${prefix}/com'
 localstatedir='${prefix}/var'
-runstatedir='${localstatedir}/run'
 includedir='${prefix}/include'
 oldincludedir='/usr/include'
 docdir='${datarootdir}/doc/${PACKAGE_TARNAME}'
@@ -976,15 +974,6 @@ do
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
@@ -1122,7 +1111,7 @@ fi
 for ac_var in	exec_prefix prefix bindir sbindir libexecdir datarootdir \
 		datadir sysconfdir sharedstatedir localstatedir includedir \
 		oldincludedir docdir infodir htmldir dvidir pdfdir psdir \
-		libdir localedir mandir runstatedir
+		libdir localedir mandir
 do
   eval ac_val=\$$ac_var
   # Remove trailing slashes.
@@ -1275,7 +1264,6 @@ Fine tuning of the installation directories:
   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
-  --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
   --libdir=DIR            object code libraries [EPREFIX/lib]
   --includedir=DIR        C header files [PREFIX/include]
   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
diff --git a/docs/configure b/docs/configure
index 9e3ed60462..93e9dcf404 100755
--- a/docs/configure
+++ b/docs/configure
@@ -634,7 +634,6 @@ infodir
 docdir
 oldincludedir
 includedir
-runstatedir
 localstatedir
 sharedstatedir
 sysconfdir
@@ -711,7 +710,6 @@ datadir='${datarootdir}'
 sysconfdir='${prefix}/etc'
 sharedstatedir='${prefix}/com'
 localstatedir='${prefix}/var'
-runstatedir='${localstatedir}/run'
 includedir='${prefix}/include'
 oldincludedir='/usr/include'
 docdir='${datarootdir}/doc/${PACKAGE_TARNAME}'
@@ -964,15 +962,6 @@ do
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
@@ -1110,7 +1099,7 @@ fi
 for ac_var in	exec_prefix prefix bindir sbindir libexecdir datarootdir \
 		datadir sysconfdir sharedstatedir localstatedir includedir \
 		oldincludedir docdir infodir htmldir dvidir pdfdir psdir \
-		libdir localedir mandir runstatedir
+		libdir localedir mandir
 do
   eval ac_val=\$$ac_var
   # Remove trailing slashes.
@@ -1263,7 +1252,6 @@ Fine tuning of the installation directories:
   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
-  --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
   --libdir=DIR            object code libraries [EPREFIX/lib]
   --includedir=DIR        C header files [PREFIX/include]
   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
diff --git a/stubdom/configure b/stubdom/configure
index da03da535a..f7604a37f7 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -661,7 +661,6 @@ infodir
 docdir
 oldincludedir
 includedir
-runstatedir
 localstatedir
 sharedstatedir
 sysconfdir
@@ -751,7 +750,6 @@ datadir='${datarootdir}'
 sysconfdir='${prefix}/etc'
 sharedstatedir='${prefix}/com'
 localstatedir='${prefix}/var'
-runstatedir='${localstatedir}/run'
 includedir='${prefix}/include'
 oldincludedir='/usr/include'
 docdir='${datarootdir}/doc/${PACKAGE_TARNAME}'
@@ -1004,15 +1002,6 @@ do
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
@@ -1150,7 +1139,7 @@ fi
 for ac_var in	exec_prefix prefix bindir sbindir libexecdir datarootdir \
 		datadir sysconfdir sharedstatedir localstatedir includedir \
 		oldincludedir docdir infodir htmldir dvidir pdfdir psdir \
-		libdir localedir mandir runstatedir
+		libdir localedir mandir
 do
   eval ac_val=\$$ac_var
   # Remove trailing slashes.
@@ -1303,7 +1292,6 @@ Fine tuning of the installation directories:
   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
-  --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
   --libdir=DIR            object code libraries [EPREFIX/lib]
   --includedir=DIR        C header files [PREFIX/include]
   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
diff --git a/tools/config.h.in b/tools/config.h.in
index 5a5944ebe1..5abf6092de 100644
--- a/tools/config.h.in
+++ b/tools/config.h.in
@@ -123,6 +123,9 @@
 /* Define to 1 if you have the ANSI C header files. */
 #undef STDC_HEADERS
 
+/* QMP proxy path */
+#undef STUBDOM_QMP_PROXY_PATH
+
 /* Enable large inode numbers on Mac OS X 10.5.  */
 #ifndef _DARWIN_USE_64_BIT_INODE
 # define _DARWIN_USE_64_BIT_INODE 1
diff --git a/tools/configure b/tools/configure
index 4fa5f7b937..fef684f0be 100755
--- a/tools/configure
+++ b/tools/configure
@@ -770,7 +770,6 @@ infodir
 docdir
 oldincludedir
 includedir
-runstatedir
 localstatedir
 sharedstatedir
 sysconfdir
@@ -811,6 +810,7 @@ with_linux_backend_modules
 enable_qemu_traditional
 enable_rombios
 with_system_qemu
+with_stubdom_qmp_proxy
 with_system_seabios
 with_system_ovmf
 enable_ipxe
@@ -896,7 +896,6 @@ datadir='${datarootdir}'
 sysconfdir='${prefix}/etc'
 sharedstatedir='${prefix}/com'
 localstatedir='${prefix}/var'
-runstatedir='${localstatedir}/run'
 includedir='${prefix}/include'
 oldincludedir='/usr/include'
 docdir='${datarootdir}/doc/${PACKAGE_TARNAME}'
@@ -1149,15 +1148,6 @@ do
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
@@ -1295,7 +1285,7 @@ fi
 for ac_var in	exec_prefix prefix bindir sbindir libexecdir datarootdir \
 		datadir sysconfdir sharedstatedir localstatedir includedir \
 		oldincludedir docdir infodir htmldir dvidir pdfdir psdir \
-		libdir localedir mandir runstatedir
+		libdir localedir mandir
 do
   eval ac_val=\$$ac_var
   # Remove trailing slashes.
@@ -1448,7 +1438,6 @@ Fine tuning of the installation directories:
   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
-  --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
   --libdir=DIR            object code libraries [EPREFIX/lib]
   --includedir=DIR        C header files [PREFIX/include]
   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
@@ -1531,6 +1520,9 @@ Optional Packages:
                           Use system supplied qemu PATH or qemu (taken from
                           $PATH) as qemu-xen device model instead of building
                           and installing our own version
+  --stubdom-qmp-proxy[=PATH]
+                          Use supplied binary PATH as a QMP proxy into
+                          stubdomain
   --with-system-seabios[=PATH]
                           Use system supplied seabios PATH instead of building
                           and installing our own version
@@ -3378,7 +3370,7 @@ else
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3424,7 +3416,7 @@ else
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3448,7 +3440,7 @@ rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3493,7 +3485,7 @@ else
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3517,7 +3509,7 @@ rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -4519,6 +4511,24 @@ _ACEOF
 
 
 
+# Check whether --with-stubdom-qmp-proxy was given.
+if test "${with_stubdom_qmp_proxy+set}" = set; then :
+  withval=$with_stubdom_qmp_proxy;
+    stubdom_qmp_proxy="$withval"
+
+else
+
+    stubdom_qmp_proxy="$bindir/vchan-socket-proxy"
+
+fi
+
+
+cat >>confdefs.h <<_ACEOF
+#define STUBDOM_QMP_PROXY_PATH "$stubdom_qmp_proxy"
+_ACEOF
+
+
+
 # Check whether --with-system-seabios was given.
 if test "${with_system_seabios+set}" = set; then :
   withval=$with_system_seabios;
-- 
2.20.1


