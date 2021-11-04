Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8D244529C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 13:04:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221460.383185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mibSu-0001lO-UP; Thu, 04 Nov 2021 12:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221460.383185; Thu, 04 Nov 2021 12:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mibSu-0001gs-Lp; Thu, 04 Nov 2021 12:03:32 +0000
Received: by outflank-mailman (input) for mailman id 221460;
 Thu, 04 Nov 2021 12:03:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=93tI=PX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mibSs-0001eM-W1
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 12:03:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38d9c73c-3d67-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 13:03:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 75F361FD47;
 Thu,  4 Nov 2021 12:03:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 51CA613C68;
 Thu,  4 Nov 2021 12:03:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AKnaEhDMg2HJfQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 04 Nov 2021 12:03:28 +0000
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
X-Inumbo-ID: 38d9c73c-3d67-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1636027408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4W8QFCSZ6YUbqfKweIjCXKAp41fzIgy106byLf3XNR4=;
	b=Wexz9RccvlB9oSkK2FMZzMLj23F8Cz9U1nkKCutgOHML5s/V/+SbznnubuTlw2L90GMBWj
	Lv3ZA46aRlhto0HZjBnlnGBhc5s4t/ALVMezuRx55AWwG8ktQ4r7wzsh+/OO+vIOUFPQaa
	0nZ5EO5BEzRNMnURbT/EMbxt0prFABM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH-for-4.16 1/2] configure: modify default of building rombios
Date: Thu,  4 Nov 2021 13:03:23 +0100
Message-Id: <20211104120324.9668-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211104120324.9668-1-jgross@suse.com>
References: <20211104120324.9668-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tools/configure script will default to build rombios if qemu
traditional is enabled. If rombios is being built, ipxe will be built
per default, too.

This results in rombios and ipxe no longer being built per default when
disabling qemu traditional.

Fix that be rearranging the dependencies:

- build ipxe per default
- build rombios per default if either ipxe or qemu traditional are
  being built

This modification prepares not building qemu traditional per default
without affecting build of rombios and ipxe.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/configure    | 116 +++++++++++++++++++++------------------------
 tools/configure.ac |  67 +++++++++++++-------------
 2 files changed, 86 insertions(+), 97 deletions(-)

diff --git a/tools/configure b/tools/configure
index 33814b24b3..7b62b3cdd8 100755
--- a/tools/configure
+++ b/tools/configure
@@ -698,7 +698,6 @@ APPEND_INCLUDES
 PREPEND_LIB
 PREPEND_INCLUDES
 EXTRA_QEMUU_CONFIGURE_ARGS
-ipxe
 qemu_xen_systemd
 qemu_xen_path
 qemu_xen
@@ -706,6 +705,7 @@ rombios
 BCC
 LD86
 AS86
+ipxe
 qemu_traditional
 LINUX_BACKEND_MODULES
 golang
@@ -815,13 +815,13 @@ enable_seabios
 enable_golang
 with_linux_backend_modules
 enable_qemu_traditional
+enable_ipxe
+with_system_ipxe
 enable_rombios
 with_system_qemu
 with_stubdom_qmp_proxy
 with_system_seabios
 with_system_ovmf
-enable_ipxe
-with_system_ipxe
 with_extra_qemuu_configure_args
 with_xenstored
 enable_systemd
@@ -1504,10 +1504,10 @@ Optional Features:
   --enable-qemu-traditional
                           Enable qemu traditional device model, (DEFAULT is on
                           for Linux or NetBSD x86, otherwise off)
+  --enable-ipxe           Enable in-tree IPXE, (DEFAULT is on for x86,
+                          otherwise off, see also --with-system-ipxe)
   --enable-rombios        Enable ROMBIOS, (DEFAULT is on if qemu-traditional
-                          is enabled, otherwise off)
-  --disable-ipxe          Enable in-tree IPXE, (DEFAULT is on if rombios is
-                          enabled, otherwise off, see also --with-system-ipxe)
+                          or ipxe is enabled, otherwise off)
   --enable-systemd        Enable systemd support (default is DISABLED)
   --enable-9pfs           Explicitly enable 9pfs support in QEMU build
                           (default is to defer to QEMU configure default)
@@ -1538,6 +1538,12 @@ Optional Packages:
   --with-linux-backend-modules="mod1 mod2"
                           List of Linux backend module or modalias names to be
                           autoloaded on startup.
+  --with-system-ipxe[=PATH]
+                          Use system supplied IPXE PATH instead of building
+                          and installing our own version, it takes precedence
+                          over --{en,dis}able-ipxe and is bound by the
+                          presence of rombios, --without-system-ipxe is an
+                          error
   --with-system-qemu[=PATH]
                           Use system supplied qemu PATH or qemu (taken from
                           $PATH) as qemu-xen device model instead of building
@@ -1551,12 +1557,6 @@ Optional Packages:
   --with-system-ovmf[=PATH]
                           Use system supplied OVMF PATH instead of building
                           and installing our own version
-  --with-system-ipxe[=PATH]
-                          Use system supplied IPXE PATH instead of building
-                          and installing our own version, it takes precedence
-                          over --{en,dis}able-ipxe and is bound by the
-                          presence of rombios, --without-system-ipxe is an
-                          error
   --with-extra-qemuu-configure-args[="--ARG1 ..."]
                           List of additional configure options for upstream
                           qemu
@@ -4314,13 +4314,54 @@ else
 
 fi
 
+if test "x$enable_ipxe" = "xno"; then :
+  ipxe=n
+else
+  ipxe=y
+fi
+
+# Check whether --enable-ipxe was given.
+if test "${enable_ipxe+set}" = set; then :
+  enableval=$enable_ipxe;
+else
+
+    case "$host_cpu" in
+        i[3456]86|x86_64)
+           enable_ipxe="yes";;
+        *) enable_ipxe="no";;
+    esac
+
+fi
+
+
+# Check whether --with-system-ipxe was given.
+if test "${with_system_ipxe+set}" = set; then :
+  withval=$with_system_ipxe;
+    case $withval in
+        no) as_fn_error $? "--without-system-ipxe has no effect" "$LINENO" 5 ;;
+        /*)  ipxe_path=$withval; ipxe=n ;;
+        *) as_fn_error $? "IPXE specified, but is not an absolute path" "$LINENO" 5 ;;
+    esac
+
+fi
+
+if test "x$ipxe" = "xy" -o -n "$ipxe_path" ; then :
+
+
+cat >>confdefs.h <<_ACEOF
+#define IPXE_PATH "${ipxe_path:-$XENFIRMWAREDIR/ipxe.bin}"
+_ACEOF
+
+
+fi
+
 
 # Check whether --enable-rombios was given.
 if test "${enable_rombios+set}" = set; then :
   enableval=$enable_rombios;
 else
 
-    if test "x$enable_qemu_traditional" = "xyes"; then :
+    if test "x$enable_qemu_traditional" = "xyes" -o "x$enable_ipxe" = "xyes"; then :
 
         enable_rombios="yes"
 
@@ -4635,55 +4676,6 @@ _ACEOF
 
 fi
 
-# Check whether --enable-ipxe was given.
-if test "${enable_ipxe+set}" = set; then :
-  enableval=$enable_ipxe;
-     if test "x$enable_ipxe" = "xno"; then :
-  ipxe=n
-else
-  ipxe=y
-fi
-
-else
-
-    if test "x$enable_rombios" = "xno"; then :
-  ipxe=n
-else
-  ipxe=y
-fi
-
-fi
-
-
-# Check whether --with-system-ipxe was given.
-if test "${with_system_ipxe+set}" = set; then :
-  withval=$with_system_ipxe;
-    case $withval in
-        no) as_fn_error $? "--without-system-ipxe has no effect" "$LINENO" 5 ;;
-        /*)  ipxe_path=$withval; ipxe=n ;;
-        *) as_fn_error $? "IPXE specified, but is not an absolute path" "$LINENO" 5 ;;
-    esac
-
-fi
-
-if test "x$ipxe" = "xy" -o -n "$ipxe_path" ; then :
-
-
-    if test "x$enable_rombios" = "xno"; then :
-
-        as_fn_error $? "Rombios is required to use IPXE" "$LINENO" 5
-
-fi
-
-
-cat >>confdefs.h <<_ACEOF
-#define IPXE_PATH "${ipxe_path:-$XENFIRMWAREDIR/ipxe.bin}"
-_ACEOF
-
-
-fi
-
-
 
 # Check whether --with-extra-qemuu-configure-args was given.
 if test "${with_extra_qemuu_configure_args+set}" = set; then :
diff --git a/tools/configure.ac b/tools/configure.ac
index 6414fcbb44..4be3138cb3 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -139,10 +139,40 @@ AC_DEFINE([HAVE_QEMU_TRADITIONAL], [1], [Qemu traditional enabled])
 ])
 AC_SUBST(qemu_traditional)
 
+AC_ARG_ENABLE([ipxe],
+    AS_HELP_STRING([--enable-ipxe],
+                   [Enable in-tree IPXE, (DEFAULT is on for x86,
+                    otherwise off, see also --with-system-ipxe)]),,[
+    case "$host_cpu" in
+        i[[3456]]86|x86_64)
+           enable_ipxe="yes";;
+        *) enable_ipxe="no";;
+    esac
+])
+AS_IF([test "x$enable_ipxe" = "xno"], [ipxe=n], [ipxe=y])
+AC_ARG_WITH([system-ipxe],
+    AS_HELP_STRING([--with-system-ipxe@<:@=PATH@:>@],
+       [Use system supplied IPXE PATH instead of building and installing
+        our own version, it takes precedence over --{en,dis}able-ipxe and is
+        bound by the presence of rombios, --without-system-ipxe is an error]),[
+    case $withval in
+        no) AC_MSG_ERROR([--without-system-ipxe has no effect]) ;;
+        /*)  ipxe_path=$withval; ipxe=n ;;
+        *) AC_MSG_ERROR([IPXE specified, but is not an absolute path]) ;;
+    esac
+],[])
+AS_IF([test "x$ipxe" = "xy" -o -n "$ipxe_path" ], [
+    AC_DEFINE_UNQUOTED([IPXE_PATH],
+                       ["${ipxe_path:-$XENFIRMWAREDIR/ipxe.bin}"],
+                       [IPXE path])
+])
+AC_SUBST(ipxe)
+
 AC_ARG_ENABLE([rombios],
     AS_HELP_STRING([--enable-rombios],
-                   [Enable ROMBIOS, (DEFAULT is on if qemu-traditional is enabled, otherwise off)]),,[
-    AS_IF([test "x$enable_qemu_traditional" = "xyes"], [
+                   [Enable ROMBIOS, (DEFAULT is on if qemu-traditional or ipxe is enabled,
+                    otherwise off)]),,[
+    AS_IF([test "x$enable_qemu_traditional" = "xyes" -o "x$enable_ipxe" = "xyes"], [
         enable_rombios="yes"
     ], [
         enable_rombios="no"
@@ -240,39 +270,6 @@ AS_IF([test "x$ovmf" = "xy" -o -n "$ovmf_path" ], [
                        [OVMF path])
 ])
 
-AC_ARG_ENABLE([ipxe],
-    AS_HELP_STRING([--disable-ipxe],
-                   [Enable in-tree IPXE, (DEFAULT is on if rombios is enabled,
-                    otherwise off, see also --with-system-ipxe)]),
-    [
-     AS_IF([test "x$enable_ipxe" = "xno"], [ipxe=n], [ipxe=y])
-    ],
-    [
-    AS_IF([test "x$enable_rombios" = "xno"], [ipxe=n], [ipxe=y])
-])
-AC_ARG_WITH([system-ipxe],
-    AS_HELP_STRING([--with-system-ipxe@<:@=PATH@:>@],
-       [Use system supplied IPXE PATH instead of building and installing
-        our own version, it takes precedence over --{en,dis}able-ipxe and is
-        bound by the presence of rombios, --without-system-ipxe is an error]),[
-    case $withval in
-        no) AC_MSG_ERROR([--without-system-ipxe has no effect]) ;;
-        /*)  ipxe_path=$withval; ipxe=n ;;
-        *) AC_MSG_ERROR([IPXE specified, but is not an absolute path]) ;;
-    esac
-],[])
-AS_IF([test "x$ipxe" = "xy" -o -n "$ipxe_path" ], [
-
-    AS_IF([test "x$enable_rombios" = "xno"], [
-        AC_MSG_ERROR([Rombios is required to use IPXE])
-    ], [])
-
-    AC_DEFINE_UNQUOTED([IPXE_PATH],
-                       ["${ipxe_path:-$XENFIRMWAREDIR/ipxe.bin}"],
-                       [IPXE path])
-])
-AC_SUBST(ipxe)
-
 AC_ARG_WITH([extra-qemuu-configure-args],
     AS_HELP_STRING([--with-extra-qemuu-configure-args@<:@="--ARG1 ..."@:>@],
        [List of additional configure options for upstream qemu]),[
-- 
2.26.2


