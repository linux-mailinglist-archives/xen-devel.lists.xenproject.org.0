Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C94D1D8D65
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:57:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarV4-0000l6-KM; Tue, 19 May 2020 01:56:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarV3-0000kM-MW
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:56:57 +0000
X-Inumbo-ID: ed25f18e-9973-11ea-ae69-bc764e2007e4
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed25f18e-9973-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 01:56:16 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id g20so5763931qvb.9
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aLKJExg1fkxsNY3bWeg2LgROjhysCmtqf2q3X+TB4c4=;
 b=eLtIVsO04HtNXgOxkh0x8e8blnPL2m5LxoRvrhQmeQ4l4zlhMdOU/Sq3pTKG5KCqDD
 WLFtMT+mAe4YrlyVY2ZTY8ESru/7Fc2dhAqMRG0yccRskZmz69urCLeUO/4iS36tILWK
 bx8AjOC5xO7V9BtBGx5UNiaKuDMsXCsDrUz8DiwB/QBgEqSABJdv4N61xxYy9Pi49+uG
 uKVnpG+QqoZJr6mlyAx/ZupphChI+8gupyW0X4XqI9Y0Mxoga20xcddXtHLklw2ko/5B
 s35tUtr57eYM4lI8/NhhD4JG9hnaXZD+hoZ+8qlc0hCVexihuRRCthmS2SkR4TtTi+ZK
 fzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aLKJExg1fkxsNY3bWeg2LgROjhysCmtqf2q3X+TB4c4=;
 b=TRoN450miqFoWhUHd/FqJAvlP05I4GB/rmOnWWAQMFSRboNnL/6kLN/wiNReUdr9Ko
 FtcPmFbNVSzEkt0hnV/EJjjKIPYbNJmrve+pLNAXp5gFejR4jrcNqMH4Q+vJyQEQ22jJ
 negdKMbJDb8znKmOrmjvY4JYt5gP159i7RLuEivQZr24TlxnAcJRkUbjtvMHmkmjIyqg
 LW4Oho5JYcRUL1MbjijFqPpOORdytLyVscfTPDlQQcESPxYrLf9ITolGKn8QUMIRZM72
 oNPB0iJe5VZMUOOZC2mWRjbYAVKLQ7xKVhTlDnoOvpz4NZVD3Volgh9LiK27BOjXicGe
 3nTg==
X-Gm-Message-State: AOAM531v9t+7+OaPS8t815YDOxjyc2xC/bBPfjW6U0iN6CrD0CpWP9zI
 tzCB4OFSra4uHnUtTuxiJjKXeKSc
X-Google-Smtp-Source: ABdhPJwwsglMbjyIGgB1+ORmsHFCrULrBg2QyEZbB5t50JWgaHkG3mRuih3C4aVAzvnBPIqroiOCdQ==
X-Received: by 2002:a0c:f590:: with SMTP id k16mr16653479qvm.81.1589853375426; 
 Mon, 18 May 2020 18:56:15 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:56:14 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 14/19] libxl: use vchan for QMP access with Linux stubdomain
Date: Mon, 18 May 2020 21:54:58 -0400
Message-Id: <20200519015503.115236-15-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519015503.115236-1-jandryuk@gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Access to QMP of QEMU in Linux stubdomain is possible over vchan
connection. Handle the actual vchan connection in a separate process
(vchan-socket-proxy). This simplified integration with QMP (already
quite complex), but also allows preliminary filtering of (potentially
malicious) QMP input.
Since only one client can be connected to vchan server at the same time
and it is not enforced by the libxenvchan itself, additional client-side
locking is needed. It is implicitly implemented by vchan-socket-proxy,
as it handle only one connection at a time. Note that qemu supports only
one simultaneous client on a control socket anyway (but in UNIX socket
case, it enforce it server-side), so it doesn't add any extra
limitation.

libxl qmp client code already has locking to handle concurrent access
attempts to the same qemu qmp interface.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Squash in changes of regenerated autotools files.

Kill the vchan-socket-proxy so we don't leak the daemonized processes.
libxl__stubdomain_is_linux_running() works against the guest_domid, but
the xenstore path is beneath the stubdomain.  This leads to the use of
libxl_is_stubdom in addition to libxl__stubdomain_is_linux_running() so
that the stubdomain calls kill for the qmp-proxy.

Also call libxl__qmp_cleanup() to remove the unix sockets used by
vchan-socket-proxy.  vchan-socket-proxy only creates qmp-libxl-$domid,
and libxl__qmp_cleanup removes that as well as qmp-libxenstat-$domid.
However, it tolerates ENOENT, and a stray qmp-libxenstat-$domid should
not exist.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
---

Re-run autotools after applying.

Changes in v4:
 - new patch, in place of both "libxl: use vchan for QMP access ..."
Changes in v5:
 - Use device-model/%u/qmp-proxy-state xenstore path
 - Rephrase comment
Changes in v6
 - Commit message mention libxl locking
 - Mention re-run autotools
 - Squashed in re-generated autotools files
 - Call libxl__qmp_cleanup() to remove unix socket.
 - Cleanup in vchan-socket-proxy is dropped.
Changes in v7
 - Add Acked-by: Ian Jackson
---
 configure                    |  14 +--
 docs/configure               |  14 +--
 stubdom/configure            |  14 +--
 tools/config.h.in            |   3 +
 tools/configure              |  46 ++++++----
 tools/configure.ac           |   9 ++
 tools/libxl/libxl_dm.c       | 163 +++++++++++++++++++++++++++++++++--
 tools/libxl/libxl_domain.c   |  10 +++
 tools/libxl/libxl_internal.h |   1 +
 9 files changed, 209 insertions(+), 65 deletions(-)

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
index 36596389b8..35036dc1db 100755
--- a/tools/configure
+++ b/tools/configure
@@ -772,7 +772,6 @@ infodir
 docdir
 oldincludedir
 includedir
-runstatedir
 localstatedir
 sharedstatedir
 sysconfdir
@@ -814,6 +813,7 @@ with_linux_backend_modules
 enable_qemu_traditional
 enable_rombios
 with_system_qemu
+with_stubdom_qmp_proxy
 with_system_seabios
 with_system_ovmf
 enable_ipxe
@@ -899,7 +899,6 @@ datadir='${datarootdir}'
 sysconfdir='${prefix}/etc'
 sharedstatedir='${prefix}/com'
 localstatedir='${prefix}/var'
-runstatedir='${localstatedir}/run'
 includedir='${prefix}/include'
 oldincludedir='/usr/include'
 docdir='${datarootdir}/doc/${PACKAGE_TARNAME}'
@@ -1152,15 +1151,6 @@ do
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
@@ -1298,7 +1288,7 @@ fi
 for ac_var in	exec_prefix prefix bindir sbindir libexecdir datarootdir \
 		datadir sysconfdir sharedstatedir localstatedir includedir \
 		oldincludedir docdir infodir htmldir dvidir pdfdir psdir \
-		libdir localedir mandir runstatedir
+		libdir localedir mandir
 do
   eval ac_val=\$$ac_var
   # Remove trailing slashes.
@@ -1451,7 +1441,6 @@ Fine tuning of the installation directories:
   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
-  --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
   --libdir=DIR            object code libraries [EPREFIX/lib]
   --includedir=DIR        C header files [PREFIX/include]
   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
@@ -1535,6 +1524,9 @@ Optional Packages:
                           Use system supplied qemu PATH or qemu (taken from
                           $PATH) as qemu-xen device model instead of building
                           and installing our own version
+  --stubdom-qmp-proxy[=PATH]
+                          Use supplied binary PATH as a QMP proxy into
+                          stubdomain
   --with-system-seabios[=PATH]
                           Use system supplied seabios PATH instead of building
                           and installing our own version
@@ -3382,7 +3374,7 @@ else
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3428,7 +3420,7 @@ else
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3452,7 +3444,7 @@ rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3497,7 +3489,7 @@ else
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -3521,7 +3513,7 @@ rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
     We can't simply define LARGE_OFF_T to be 9223372036854775807,
     since some C++ compilers masquerading as C compilers
     incorrectly reject 9223372036854775807.  */
-#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + (((off_t) 1 << 31) << 31))
+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
   int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
 		       && LARGE_OFF_T % 2147483647 == 1)
 		      ? 1 : -1];
@@ -4548,6 +4540,24 @@ _ACEOF
 
 
 
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
diff --git a/tools/configure.ac b/tools/configure.ac
index b6f8882be4..a9af0a21c6 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -194,6 +194,15 @@ AC_SUBST(qemu_xen)
 AC_SUBST(qemu_xen_path)
 AC_SUBST(qemu_xen_systemd)
 
+AC_ARG_WITH([stubdom-qmp-proxy],
+    AC_HELP_STRING([--stubdom-qmp-proxy@<:@=PATH@:>@],
+        [Use supplied binary PATH as a QMP proxy into stubdomain]),[
+    stubdom_qmp_proxy="$withval"
+],[
+    stubdom_qmp_proxy="$bindir/vchan-socket-proxy"
+])
+AC_DEFINE_UNQUOTED([STUBDOM_QMP_PROXY_PATH], ["$stubdom_qmp_proxy"], [QMP proxy path])
+
 AC_ARG_WITH([system-seabios],
     AS_HELP_STRING([--with-system-seabios@<:@=PATH@:>@],
        [Use system supplied seabios PATH instead of building and installing
diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index 6829b4bdb5..6a26634ef9 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -1200,7 +1200,11 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                       GCSPRINTF("%d", guest_domid), NULL);
     flexarray_append(dm_args, "-no-shutdown");
 
-    /* There is currently no way to access the QMP socket in the stubdom */
+    /*
+     * QMP access to qemu running in stubdomain is done over vchan. The
+     * stubdomain init script adds the appropriate monitor options for
+     * vchan-socket-proxy.
+     */
     if (!is_stubdom) {
         flexarray_append(dm_args, "-chardev");
         if (state->dm_monitor_fd >= 0) {
@@ -2205,6 +2209,23 @@ static void stubdom_pvqemu_unpaused(libxl__egc *egc,
 static void stubdom_xswait_cb(libxl__egc *egc, libxl__xswait_state *xswait,
                               int rc, const char *p);
 
+static void spawn_qmp_proxy(libxl__egc *egc,
+                            libxl__stub_dm_spawn_state *sdss);
+
+static void qmp_proxy_confirm(libxl__egc *egc, libxl__spawn_state *spawn,
+                              const char *xsdata);
+
+static void qmp_proxy_startup_failed(libxl__egc *egc,
+                                     libxl__spawn_state *spawn,
+                                     int rc);
+
+static void qmp_proxy_detached(libxl__egc *egc,
+                               libxl__spawn_state *spawn);
+
+static void qmp_proxy_spawn_outcome(libxl__egc *egc,
+                                    libxl__stub_dm_spawn_state *sdss,
+                                    int rc);
+
 char *libxl__stub_dm_name(libxl__gc *gc, const char *guest_name)
 {
     return GCSPRINTF("%s-dm", guest_name);
@@ -2486,24 +2507,150 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
             goto out;
     }
 
+    sdss->qmp_proxy_spawn.ao = ao;
+    if (libxl__stubdomain_is_linux(&guest_config->b_info)) {
+        spawn_qmp_proxy(egc, sdss);
+    } else {
+        qmp_proxy_spawn_outcome(egc, sdss, 0);
+    }
+
+    return;
+
+out:
+    assert(ret);
+    qmp_proxy_spawn_outcome(egc, sdss, ret);
+}
+
+static void spawn_qmp_proxy(libxl__egc *egc,
+                            libxl__stub_dm_spawn_state *sdss)
+{
+    STATE_AO_GC(sdss->qmp_proxy_spawn.ao);
+    const uint32_t guest_domid = sdss->dm.guest_domid;
+    const uint32_t dm_domid = sdss->pvqemu.guest_domid;
+    const char *dom_path = libxl__xs_get_dompath(gc, dm_domid);
+    char **args;
+    int nr = 0;
+    int rc, logfile_w, null;
+
+    if (access(STUBDOM_QMP_PROXY_PATH, X_OK) < 0) {
+        LOGED(ERROR, guest_domid, "qmp proxy %s is not executable", STUBDOM_QMP_PROXY_PATH);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    sdss->qmp_proxy_spawn.what = GCSPRINTF("domain %d device model qmp proxy", guest_domid);
+    sdss->qmp_proxy_spawn.pidpath = GCSPRINTF("%s/image/qmp-proxy-pid", dom_path);
+    sdss->qmp_proxy_spawn.xspath = DEVICE_MODEL_XS_PATH(gc, LIBXL_TOOLSTACK_DOMID,
+                                                        dm_domid, "/qmp-proxy-state");
+    sdss->qmp_proxy_spawn.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
+    sdss->qmp_proxy_spawn.midproc_cb = libxl__spawn_record_pid;
+    sdss->qmp_proxy_spawn.confirm_cb = qmp_proxy_confirm;
+    sdss->qmp_proxy_spawn.failure_cb = qmp_proxy_startup_failed;
+    sdss->qmp_proxy_spawn.detached_cb = qmp_proxy_detached;
+
+    const int arraysize = 6;
+    GCNEW_ARRAY(args, arraysize);
+    args[nr++] = STUBDOM_QMP_PROXY_PATH;
+    args[nr++] = GCSPRINTF("--state-path=%s", sdss->qmp_proxy_spawn.xspath);
+    args[nr++] = GCSPRINTF("%u", dm_domid);
+    args[nr++] = GCSPRINTF("%s/device-model/%u/qmp-vchan", dom_path, guest_domid);
+    args[nr++] = (char*)libxl__qemu_qmp_path(gc, guest_domid);
+    args[nr++] = NULL;
+    assert(nr == arraysize);
+
+    logfile_w = libxl__create_qemu_logfile(gc, GCSPRINTF("qmp-proxy-%s",
+                                                         sdss->dm_config.c_info.name));
+    if (logfile_w < 0) {
+        rc = logfile_w;
+        goto out;
+    }
+    null = open("/dev/null", O_RDWR);
+    if (null < 0) {
+        LOGED(ERROR, guest_domid, "unable to open /dev/null");
+        rc = ERROR_FAIL;
+        goto out_close;
+    }
+
+    rc = libxl__spawn_spawn(egc, &sdss->qmp_proxy_spawn);
+    if (rc < 0)
+        goto out_close;
+    if (!rc) { /* inner child */
+        setsid();
+        libxl__exec(gc, null, null, logfile_w, STUBDOM_QMP_PROXY_PATH, args, NULL);
+        /* unreachable */
+    }
+
+    rc = 0;
+
+out_close:
+    if (logfile_w >= 0)
+        close(logfile_w);
+    if (null >= 0)
+        close(null);
+out:
+    if (rc)
+        qmp_proxy_spawn_outcome(egc, sdss, rc);
+}
+
+static void qmp_proxy_confirm(libxl__egc *egc, libxl__spawn_state *spawn,
+                              const char *xsdata)
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
+static void qmp_proxy_startup_failed(libxl__egc *egc,
+                                     libxl__spawn_state *spawn,
+                                     int rc)
+{
+    libxl__stub_dm_spawn_state *sdss = CONTAINER_OF(spawn, *sdss, qmp_proxy_spawn);
+    qmp_proxy_spawn_outcome(egc, sdss, rc);
+}
+
+static void qmp_proxy_detached(libxl__egc *egc,
+                               libxl__spawn_state *spawn)
+{
+    libxl__stub_dm_spawn_state *sdss = CONTAINER_OF(spawn, *sdss, qmp_proxy_spawn);
+    qmp_proxy_spawn_outcome(egc, sdss, 0);
+}
+
+static void qmp_proxy_spawn_outcome(libxl__egc *egc,
+                                    libxl__stub_dm_spawn_state *sdss,
+                                    int rc)
+{
+    STATE_AO_GC(sdss->qmp_proxy_spawn.ao);
+    int need_pvqemu = libxl__need_xenpv_qemu(gc, &sdss->dm_config);
+
+    if (rc) goto out;
+
+    if (need_pvqemu < 0) {
+        rc = need_pvqemu;
+        goto out;
+    }
+
     sdss->pvqemu.spawn.ao = ao;
-    sdss->pvqemu.guest_domid = dm_domid;
     sdss->pvqemu.guest_config = &sdss->dm_config;
     sdss->pvqemu.build_state = &sdss->dm_state;
     sdss->pvqemu.callback = spawn_stubdom_pvqemu_cb;
-
-    if (!need_qemu) {
+    if (need_pvqemu) {
+        libxl__spawn_local_dm(egc, &sdss->pvqemu);
+    } else {
         /* If dom0 qemu not needed, do not launch it */
         spawn_stubdom_pvqemu_cb(egc, &sdss->pvqemu, 0);
-    } else {
-        libxl__spawn_local_dm(egc, &sdss->pvqemu);
     }
 
     return;
 
 out:
-    assert(ret);
-    spawn_stubdom_pvqemu_cb(egc, &sdss->pvqemu, ret);
+    assert(rc);
+    spawn_stubdom_pvqemu_cb(egc, &sdss->pvqemu, rc);
 }
 
 static void spawn_stubdom_pvqemu_cb(libxl__egc *egc,
diff --git a/tools/libxl/libxl_domain.c b/tools/libxl/libxl_domain.c
index fef2cd4e13..c08af308fa 100644
--- a/tools/libxl/libxl_domain.c
+++ b/tools/libxl/libxl_domain.c
@@ -1260,10 +1260,20 @@ static void dm_destroy_cb(libxl__egc *egc,
     libxl__destroy_domid_state *dis = CONTAINER_OF(ddms, *dis, ddms);
     STATE_AO_GC(dis->ao);
     uint32_t domid = dis->domid;
+    uint32_t target_domid;
 
     if (rc < 0)
         LOGD(ERROR, domid, "libxl__destroy_device_model failed");
 
+    if (libxl_is_stubdom(CTX, domid, &target_domid) &&
+        libxl__stubdomain_is_linux_running(gc, target_domid)) {
+        char *path = GCSPRINTF("/local/domain/%d/image/qmp-proxy-pid", domid);
+
+        libxl__kill_xs_path(gc, path, "QMP Proxy");
+        /* qmp-proxy for stubdom registers target_domid's QMP sockets. */
+        libxl__qmp_cleanup(gc, target_domid);
+    }
+
     dis->drs.ao = ao;
     dis->drs.domid = domid;
     dis->drs.callback = devices_destroy_cb;
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index c939557b2e..41b51b07cd 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -4166,6 +4166,7 @@ typedef struct {
     libxl__destroy_domid_state dis;
     libxl__multidev multidev;
     libxl__xswait_state xswait;
+    libxl__spawn_state qmp_proxy_spawn;
 } libxl__stub_dm_spawn_state;
 
 _hidden void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state*);
-- 
2.25.1


