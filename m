Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB7D4066F2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 07:55:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184037.332574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZVl-0003vq-24; Fri, 10 Sep 2021 05:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184037.332574; Fri, 10 Sep 2021 05:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOZVk-0003tZ-U1; Fri, 10 Sep 2021 05:55:40 +0000
Received: by outflank-mailman (input) for mailman id 184037;
 Fri, 10 Sep 2021 05:55:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dvCC=OA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mOZVj-0002mm-CV
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 05:55:39 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af7f13f5-11fb-11ec-b210-12813bfff9fa;
 Fri, 10 Sep 2021 05:55:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB71E201FF;
 Fri, 10 Sep 2021 05:55:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7069F13D0C;
 Fri, 10 Sep 2021 05:55:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cOz8GUrzOmEDEAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Sep 2021 05:55:22 +0000
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
X-Inumbo-ID: af7f13f5-11fb-11ec-b210-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631253322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aRM6wu2g4hDT9jEA3EflR4Cj2R9f8xFsffqAuZHwTXA=;
	b=AQ5PV++cXFuCWJJXpXhn+xk7e4+cMySIj4n6enI7lyYU0f50v4P2XSFX7McEG1OeENHNGF
	TZszTzWX0AonwDPN5Lo+cHdC/fQggZODSu87xhHCTa5+aDgky2Ys1t0uL6Qp3GBp3J6N1B
	Hw1gdVc+4U8WbliZgqbr4q441rTejHs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Community Manager <community.manager@xenproject.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/3] tools: disable building qemu-trad per default
Date: Fri, 10 Sep 2021 07:55:18 +0200
Message-Id: <20210910055518.562-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210910055518.562-1-jgross@suse.com>
References: <20210910055518.562-1-jgross@suse.com>
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
V2:
- new patch
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
index 33814b24b3..8bf8fe75b8 100755
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
   --enable-rombios        Enable ROMBIOS, (DEFAULT is on if qemu-traditional
                           is enabled, otherwise off)
   --disable-ipxe          Enable in-tree IPXE, (DEFAULT is on if rombios is
@@ -4287,19 +4287,6 @@ LINUX_BACKEND_MODULES="`eval echo $LINUX_BACKEND_MODULES`"
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
index 6414fcbb44..a713fd34d6 100644
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


