Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035F7773A6C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579859.908048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMfW-0004lB-Mf; Tue, 08 Aug 2023 13:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579859.908048; Tue, 08 Aug 2023 13:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMfW-0004hR-JK; Tue, 08 Aug 2023 13:22:38 +0000
Received: by outflank-mailman (input) for mailman id 579859;
 Tue, 08 Aug 2023 13:22:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw+Y=DZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qTMfU-0004aK-Kk
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:22:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1c3ee17-35ee-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 15:22:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A63EA21A5E;
 Tue,  8 Aug 2023 13:22:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 779E9139D1;
 Tue,  8 Aug 2023 13:22:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ggiOG5hB0mSfFAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Aug 2023 13:22:32 +0000
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
X-Inumbo-ID: a1c3ee17-35ee-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691500952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ILsXfNsar6elu7aqIAUAvhq1elG/GdFUcYJ19l5rS0=;
	b=AaCQvnaiM3b2x6iwqJnm4VweB8u7YWAeBB0v4sssntQQZZlOaRbp3c/BijWSZtH6Bfpxyt
	sMX6KtAefjUEUQC9U8RCboCDtfOJp1eMdJhU2d8yN+WEYAnL4YN9QGNYl07k34OV8qkXtR
	gHN7qfkIjyER/HwmP7KDpokgG5cbok4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 2/3] tools: add configure option for libfsimage
Date: Tue,  8 Aug 2023 15:22:18 +0200
Message-Id: <20230808132219.6422-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230808132219.6422-1-jgross@suse.com>
References: <20230808132219.6422-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only in-tree user of libfsimage is pygrub. Now that it is possible
to disable the build of pygrub, the same should be possible for
libfsimage.

Add an option for controlling the build of libfsimage. The default is
on if pygrub is being built, and off if it isn't. Without pygrub the
build of libfsimage can be enabled via --enable-libfsimage.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add check for pygrub enabled and libfsimage disabled (Andrew Cooper)
---
 config/Tools.mk.in |  1 +
 tools/Makefile     |  2 +-
 tools/configure    | 40 ++++++++++++++++++++++++++++++++++++++++
 tools/configure.ac | 21 +++++++++++++++++++++
 4 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index 432d7496f1..b54ab21f96 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -49,6 +49,7 @@ CONFIG_QEMUU_EXTRA_ARGS:= @EXTRA_QEMUU_CONFIGURE_ARGS@
 CONFIG_LIBNL        := @libnl@
 CONFIG_GOLANG       := @golang@
 CONFIG_PYGRUB       := @pygrub@
+CONFIG_LIBFSIMAGE   := @libfsimage@
 
 CONFIG_SYSTEMD      := @systemd@
 SYSTEMD_CFLAGS      := @SYSTEMD_CFLAGS@
diff --git a/tools/Makefile b/tools/Makefile
index bbd75ebc1a..311a9098d7 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -18,7 +18,7 @@ SUBDIRS-$(CONFIG_X86) += firmware
 SUBDIRS-y += console
 SUBDIRS-y += xenmon
 SUBDIRS-$(XENSTAT_XENTOP) += xentop
-SUBDIRS-y += libfsimage
+SUBDIRS-$(CONFIG_LIBFSIMAGE) += libfsimage
 SUBDIRS-$(CONFIG_Linux) += vchan
 
 # do not recurse in to a dir we are about to delete
diff --git a/tools/configure b/tools/configure
index 44ec7a6477..ed4eb64568 100755
--- a/tools/configure
+++ b/tools/configure
@@ -700,6 +700,7 @@ EXTRA_QEMUU_CONFIGURE_ARGS
 qemu_xen_systemd
 qemu_xen_path
 qemu_xen
+libfsimage
 rombios
 BCC
 LD86
@@ -818,6 +819,7 @@ enable_qemu_traditional
 enable_ipxe
 with_system_ipxe
 enable_rombios
+enable_libfsimage
 with_system_qemu
 with_stubdom_qmp_proxy
 with_system_seabios
@@ -1508,6 +1510,8 @@ Optional Features:
                           --with-system-ipxe)
   --enable-rombios        Enable ROMBIOS, (DEFAULT is on if qemu-traditional
                           or ipxe is enabled, otherwise off)
+  --enable-libfsimage     Enable libfsimage, (DEFAULT is on if pygrub is
+                          enabled, otherwise off)
   --enable-systemd        Enable systemd support (default is DISABLED)
   --enable-9pfs           Explicitly enable 9pfs support in QEMU build
                           (default is to defer to QEMU configure default)
@@ -4629,6 +4633,42 @@ $as_echo "#define HAVE_PYGRUB 1" >>confdefs.h
 
 fi
 
+# Check whether --enable-libfsimage was given.
+if test "${enable_libfsimage+set}" = set; then :
+  enableval=$enable_libfsimage;
+else
+
+    if test "x$pygrub" = "xn"; then :
+
+        enable_libfsimage="no"
+
+else
+
+        enable_libfsimage="yes"
+
+fi
+
+fi
+
+if test "x$enable_libfsimage" = "xyes"; then :
+
+    libfsimage=y
+
+else
+
+    if test "x$pygrub" = "xy"; then :
+
+        as_fn_error $? "pygrub needs libfsimage" "$LINENO" 5
+
+else
+
+        libfsimage=n
+
+fi
+
+fi
+
+
 
 # Check whether --with-system-qemu was given.
 if test "${with_system_qemu+set}" = set; then :
diff --git a/tools/configure.ac b/tools/configure.ac
index 0d1c8f9fa3..618ef8c63f 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -189,6 +189,27 @@ AS_IF([test "x$pygrub" = "xy"], [
     AC_DEFINE([HAVE_PYGRUB], [1], [pygrub enabled])
 ])
 
+AC_ARG_ENABLE([libfsimage],
+    AS_HELP_STRING([--enable-libfsimage],
+                   [Enable libfsimage, (DEFAULT is on if pygrub is enabled,
+                    otherwise off)]),,[
+    AS_IF([test "x$pygrub" = "xn"], [
+        enable_libfsimage="no"
+    ], [
+        enable_libfsimage="yes"
+    ])
+])
+AS_IF([test "x$enable_libfsimage" = "xyes"], [
+    libfsimage=y
+], [
+    AS_IF([test "x$pygrub" = "xy"], [
+        AC_MSG_ERROR([pygrub needs libfsimage])
+    ], [
+        libfsimage=n
+    ])
+])
+AC_SUBST(libfsimage)
+
 AC_ARG_WITH([system-qemu],
     AS_HELP_STRING([--with-system-qemu@<:@=PATH@:>@],
        [Use system supplied qemu PATH or qemu (taken from $PATH) as qemu-xen
-- 
2.35.3


