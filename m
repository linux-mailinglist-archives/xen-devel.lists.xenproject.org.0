Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C89276F9C2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:00:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576830.903412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnrB-0003jy-IV; Fri, 04 Aug 2023 06:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576830.903412; Fri, 04 Aug 2023 06:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnrB-0003iH-F9; Fri, 04 Aug 2023 06:00:13 +0000
Received: by outflank-mailman (input) for mailman id 576830;
 Fri, 04 Aug 2023 06:00:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qRnr7-0003E0-Fo
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:00:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ab71d6d-328c-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 08:00:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C5AA821870;
 Fri,  4 Aug 2023 06:00:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9CDF3133B5;
 Fri,  4 Aug 2023 06:00:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0dv3JOiTzGRwMQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Aug 2023 06:00:08 +0000
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
X-Inumbo-ID: 2ab71d6d-328c-11ee-b26a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691128808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3lY3SIuVkWF2aYitFeP1w+X45FAECaznTjuW2uDVbFM=;
	b=tWqmlujgIyMbifW6nkPJCknlhHCYxlY1bE7VXSC1Opgp+ckF2QA5RAB9//kvLkFnY1krmD
	V6eIJZj8JWchrvjfoTBMxjWQZWJh0bcVkjMubDqIFeok2KP9VAaWyM+qvbKM6Ijac943tF
	JcR8V4+dMHRz4jIu7EZSyRrF7LvNMns=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/2] tools: add configure option for disabling pygrub
Date: Fri,  4 Aug 2023 07:59:59 +0200
Message-Id: <20230804060000.27710-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230804060000.27710-1-jgross@suse.com>
References: <20230804060000.27710-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a "--disable-pygrub" option for being able to disable the build
and installation of pygrub.

There are two main reasons to do so:

- A main reason to use pygrub is to allow a PV guest to choose its
  bitness (32- or 64-bit). Pygrub allows that by looking into the boot
  image and to start the guest in the correct mode depending on the
  kernel selected. With 32-bit PV guests being deprecated and the
  possibility to even build a hypervisor without 32-bit PV support,
  this use case is gone for at least some configurations.

- Pygrub is running in dom0 with root privileges. As it is operating
  on guest controlled data (the boot image) and taking decisions based
  on this data, there is a possible security issue. Not being possible
  to use pygrub is thus a step towards more security.

Default is still to build and install pygrub.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 config/Tools.mk.in |  1 +
 tools/Makefile     |  2 +-
 tools/configure    | 26 ++++++++++++++++++++++++++
 tools/configure.ac |  1 +
 4 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index b7cc2961d8..432d7496f1 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -48,6 +48,7 @@ CONFIG_QEMU_XEN     := @qemu_xen@
 CONFIG_QEMUU_EXTRA_ARGS:= @EXTRA_QEMUU_CONFIGURE_ARGS@
 CONFIG_LIBNL        := @libnl@
 CONFIG_GOLANG       := @golang@
+CONFIG_PYGRUB       := @pygrub@
 
 CONFIG_SYSTEMD      := @systemd@
 SYSTEMD_CFLAGS      := @SYSTEMD_CFLAGS@
diff --git a/tools/Makefile b/tools/Makefile
index 1ff90ddfa0..bbd75ebc1a 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -36,7 +36,7 @@ SUBDIRS-$(CONFIG_X86) += debugger
 SUBDIRS-$(CONFIG_TESTS) += tests
 
 SUBDIRS-y += python
-SUBDIRS-y += pygrub
+SUBDIRS-$(CONFIG_PYGRUB) += pygrub
 SUBDIRS-$(OCAML_TOOLS) += ocaml
 
 ifeq ($(CONFIG_RUMP),y)
diff --git a/tools/configure b/tools/configure
index 52b4717d01..130e0d9abf 100755
--- a/tools/configure
+++ b/tools/configure
@@ -707,6 +707,7 @@ AS86
 ipxe
 qemu_traditional
 LINUX_BACKEND_MODULES
+pygrub
 golang
 seabios
 ovmf
@@ -811,6 +812,7 @@ enable_xsmpolicy
 enable_ovmf
 enable_seabios
 enable_golang
+enable_pygrub
 with_linux_backend_modules
 enable_qemu_traditional
 enable_ipxe
@@ -1498,6 +1500,7 @@ Optional Features:
   --enable-ovmf           Enable OVMF (default is DISABLED)
   --disable-seabios       Disable SeaBIOS (default is ENABLED)
   --disable-golang        Disable Go tools (default is ENABLED)
+  --disable-pygrub        Disable pygrub (default is ENABLED)
   --enable-qemu-traditional
                           Enable qemu traditional device model, (DEFAULT is
                           off)
@@ -4287,6 +4290,29 @@ golang=$ax_cv_golang
 
 
 
+# Check whether --enable-pygrub was given.
+if test "${enable_pygrub+set}" = set; then :
+  enableval=$enable_pygrub;
+fi
+
+
+if test "x$enable_pygrub" = "xno"; then :
+
+    ax_cv_pygrub="n"
+
+elif test "x$enable_pygrub" = "xyes"; then :
+
+    ax_cv_pygrub="y"
+
+elif test -z $ax_cv_pygrub; then :
+
+    ax_cv_pygrub="y"
+
+fi
+pygrub=$ax_cv_pygrub
+
+
+
 
 # Check whether --with-linux-backend-modules was given.
 if test "${with_linux_backend_modules+set}" = set; then :
diff --git a/tools/configure.ac b/tools/configure.ac
index 3cccf41960..9947bcefc6 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -89,6 +89,7 @@ AX_ARG_DEFAULT_ENABLE([xsmpolicy], [Disable XSM policy compilation])
 AX_ARG_DEFAULT_DISABLE([ovmf], [Enable OVMF])
 AX_ARG_DEFAULT_ENABLE([seabios], [Disable SeaBIOS])
 AX_ARG_DEFAULT_ENABLE([golang], [Disable Go tools])
+AX_ARG_DEFAULT_ENABLE([pygrub], [Disable pygrub])
 
 AC_ARG_WITH([linux-backend-modules],
     AS_HELP_STRING([--with-linux-backend-modules="mod1 mod2"],
-- 
2.35.3


