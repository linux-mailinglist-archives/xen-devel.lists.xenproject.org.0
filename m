Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2CB4456EB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 17:11:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221686.383517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifKp-0007iO-HO; Thu, 04 Nov 2021 16:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221686.383517; Thu, 04 Nov 2021 16:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mifKp-0007fE-Cr; Thu, 04 Nov 2021 16:11:27 +0000
Received: by outflank-mailman (input) for mailman id 221686;
 Thu, 04 Nov 2021 16:11:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=93tI=PX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mifKo-0007c6-5M
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 16:11:26 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbc9262b-3d89-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 17:11:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C946E1FD5B;
 Thu,  4 Nov 2021 16:11:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9948B13DA2;
 Thu,  4 Nov 2021 16:11:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SKwtJCwGhGEABgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 04 Nov 2021 16:11:24 +0000
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
X-Inumbo-ID: dbc9262b-3d89-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1636042284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uT7wIMCexC5sOksHtDS/6G5hw1BD1mbW59xbOMQ15QY=;
	b=XmQ1nttShV9z6E3QHHsrq0TS/8vUYESiP9Kcp73wVN71spyRY+a0B6bvZ6LrVu3n8f3Igr
	P5+Y/dW6LT969xS0yZnYPIETkK2cFUlncNv2+1JuZKMhSOI8gX8DNkXGC8jCaLC73CROTK
	6OFyhm8kRGmc3clj2OvSsPyMQsJT53g=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Community Manager <community.manager@xenproject.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH-for-4.16 v2 2/2] tools: disable building qemu-trad per default
Date: Thu,  4 Nov 2021 17:11:21 +0100
Message-Id: <20211104161121.18995-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211104161121.18995-1-jgross@suse.com>
References: <20211104161121.18995-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using qemu-traditional as device model is deprecated for some time now.

So change the default for building it to "disable". This will affect
ioemu-stubdom, too, as there is a direct dependency between the two.

Today it is possible to use a PVH/HVM Linux-based stubdom as device
model. Additionally using ioemu-stubdom isn't really helping for
security, as it requires to run a very old and potentially buggy qemu
version in a PV domain. This is adding probably more security problems
than it is removing by using a stubdom.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Acked-by: Ian Jackson <iwj@xenproject.org>
---
This is a resend of my original patch after that has been reverted due
to dependencies to ipxe and rombios. Those have been dealt with in the
first patch of this series.
---
 CHANGELOG.md         |  3 +++
 stubdom/configure    |  8 --------
 stubdom/configure.ac |  8 +-------
 tools/configure      | 17 ++---------------
 tools/configure.ac   | 13 +------------
 5 files changed, 7 insertions(+), 42 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index e7107ac3de..e5ab49e779 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,6 +18,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    or by passing "iommu=quarantine=scratch-page" on the hypervisor command line.
  - pv-grub stubdoms will no longer be built per default. In order to be able to use pv-grub
    configure needs to be called with "--enable-pv-grub" as parameter.
+ - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
+   no longer be built per default. In order to be able to use those, configure needs to
+   be called with "--enable-qemu-traditional" as parameter.
 
 ## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
 
diff --git a/stubdom/configure b/stubdom/configure
index df31532abb..07b709f998 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -2286,14 +2286,6 @@ fi
 # Check whether --enable-qemu-traditional was given.
 if test "${enable_qemu_traditional+set}" = set; then :
   enableval=$enable_qemu_traditional;
-else
-
-    case "$host_cpu" in
-        i[3456]86|x86_64)
-           enable_qemu_traditional="yes";;
-        *) enable_qemu_traditional="no";;
-    esac
-
 fi
 
 if test "x$enable_qemu_traditional" = "xyes"; then :
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index a07a1edae5..e20d99edac 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -27,13 +27,7 @@ AX_STUBDOM_DEFAULT_ENABLE([xenstorepvh-stubdom], [xenstorepvh])
 AX_STUBDOM_CONDITIONAL([vtpm-stubdom], [vtpm])
 AX_STUBDOM_CONDITIONAL([vtpmmgr-stubdom], [vtpmmgr])
 
-AC_ARG_ENABLE([qemu-traditional],,,[
-    case "$host_cpu" in
-        i[[3456]]86|x86_64)
-           enable_qemu_traditional="yes";;
-        *) enable_qemu_traditional="no";;
-    esac
-])
+AC_ARG_ENABLE([qemu-traditional])
 AS_IF([test "x$enable_qemu_traditional" = "xyes"], [
     qemu_traditional=y],[
     qemu_traditional=n
diff --git a/tools/configure b/tools/configure
index d980b3ffc9..a3d33eb907 100755
--- a/tools/configure
+++ b/tools/configure
@@ -1502,8 +1502,8 @@ Optional Features:
   --disable-seabios       Disable SeaBIOS (default is ENABLED)
   --disable-golang        Disable Go tools (default is ENABLED)
   --enable-qemu-traditional
-                          Enable qemu traditional device model, (DEFAULT is on
-                          for Linux or NetBSD x86, otherwise off)
+                          Enable qemu traditional device model, (DEFAULT is
+                          off)
   --enable-ipxe           Enable in-tree IPXE, (DEFAULT is on for x86,
                           otherwise off, see also --with-system-ipxe)
   --enable-rombios        Enable ROMBIOS, (DEFAULT is on if qemu-traditional
@@ -4286,19 +4286,6 @@ LINUX_BACKEND_MODULES="`eval echo $LINUX_BACKEND_MODULES`"
 # Check whether --enable-qemu-traditional was given.
 if test "${enable_qemu_traditional+set}" = set; then :
   enableval=$enable_qemu_traditional;
-else
-
-    case "$host_cpu" in
-        i[3456]86|x86_64)
-           enable_qemu_traditional="yes";;
-        *) enable_qemu_traditional="no";;
-    esac
-    case "$host_os" in
-        freebsd*)
-           enable_qemu_traditional="no";;
-    esac
-
-
 fi
 
 if test "x$enable_qemu_traditional" = "xyes"; then :
diff --git a/tools/configure.ac b/tools/configure.ac
index 97582951c8..03eb7cf146 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -120,18 +120,7 @@ AC_SUBST(LINUX_BACKEND_MODULES)
 
 AC_ARG_ENABLE([qemu-traditional],
     AS_HELP_STRING([--enable-qemu-traditional],
-                   [Enable qemu traditional device model, (DEFAULT is on for Linux or NetBSD x86, otherwise off)]),,[
-    case "$host_cpu" in
-        i[[3456]]86|x86_64)
-           enable_qemu_traditional="yes";;
-        *) enable_qemu_traditional="no";;
-    esac
-    case "$host_os" in
-        freebsd*)
-           enable_qemu_traditional="no";;
-    esac
-
-])
+                   [Enable qemu traditional device model, (DEFAULT is off)]))
 AS_IF([test "x$enable_qemu_traditional" = "xyes"], [
 AC_DEFINE([HAVE_QEMU_TRADITIONAL], [1], [Qemu traditional enabled])
     qemu_traditional=y],[
-- 
2.26.2


