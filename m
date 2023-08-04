Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1109E76F9C1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576832.903432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnrH-0004Hm-2J; Fri, 04 Aug 2023 06:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576832.903432; Fri, 04 Aug 2023 06:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnrG-0004FP-VW; Fri, 04 Aug 2023 06:00:18 +0000
Received: by outflank-mailman (input) for mailman id 576832;
 Fri, 04 Aug 2023 06:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qRnrF-0004DM-6L
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:00:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e52605d-328c-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 08:00:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C926E1F8A3;
 Fri,  4 Aug 2023 06:00:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A1202133B5;
 Fri,  4 Aug 2023 06:00:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lr/uJe6TzGR8MQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Aug 2023 06:00:14 +0000
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
X-Inumbo-ID: 2e52605d-328c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691128814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EzluZzjBGFWytrE7XLiRjbQBObqzhDXzMAFkA/Hykgo=;
	b=TitJxUkm236pFFRaEFGa6ewz80M0Tq1NoRvoD47zqt+1lKPnokiSyoH+DIwGo14WBlBAKr
	s9EfqNHRpgUs75VPa8WTz3mitH6K4hsP6AAxmbo9gvXq2w0vkQSAffp8ko4PFcITPmPhbc
	/NNizLNHdkrQlrCUTZW5nPJ7DLf/Y10=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 2/2] tools: add configure option for libfsimage
Date: Fri,  4 Aug 2023 08:00:00 +0200
Message-Id: <20230804060000.27710-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230804060000.27710-1-jgross@suse.com>
References: <20230804060000.27710-1-jgross@suse.com>
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
 config/Tools.mk.in |  1 +
 tools/Makefile     |  2 +-
 tools/configure    | 28 ++++++++++++++++++++++++++++
 tools/configure.ac | 13 +++++++++++++
 4 files changed, 43 insertions(+), 1 deletion(-)

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
index 130e0d9abf..60dca366ca 100755
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
@@ -4621,6 +4625,30 @@ else
 fi
 
 
+# Check whether --enable-libfsimage was given.
+if test "${enable_libfsimage+set}" = set; then :
+  enableval=$enable_libfsimage;
+else
+
+    if test "x$enable_pygrub" = "xno"; then :
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
+  libfsimage=y
+else
+  libfsimage=n
+fi
+
+
 
 # Check whether --with-system-qemu was given.
 if test "${with_system_qemu+set}" = set; then :
diff --git a/tools/configure.ac b/tools/configure.ac
index 9947bcefc6..aea24eb982 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -185,6 +185,19 @@ AS_IF([test "x$enable_rombios" = "xyes"], [
 ])
 AC_SUBST(rombios)
 
+AC_ARG_ENABLE([libfsimage],
+    AS_HELP_STRING([--enable-libfsimage],
+                   [Enable libfsimage, (DEFAULT is on if pygrub is enabled,
+                    otherwise off)]),,[
+    AS_IF([test "x$enable_pygrub" = "xno"], [
+        enable_libfsimage="no"
+    ], [
+        enable_libfsimage="yes"
+    ])
+])
+AS_IF([test "x$enable_libfsimage" = "xyes"], [libfsimage=y], [libfsimage=n])
+AC_SUBST(libfsimage)
+
 AC_ARG_WITH([system-qemu],
     AS_HELP_STRING([--with-system-qemu@<:@=PATH@:>@],
        [Use system supplied qemu PATH or qemu (taken from $PATH) as qemu-xen
-- 
2.35.3


