Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB3F46A3DB
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 19:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239724.415659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIZy-0002SX-Ta; Mon, 06 Dec 2021 18:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239724.415659; Mon, 06 Dec 2021 18:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muIZy-0002HU-LA; Mon, 06 Dec 2021 18:19:10 +0000
Received: by outflank-mailman (input) for mailman id 239724;
 Mon, 06 Dec 2021 18:19:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZw-000245-Nj
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZw-00041b-N5
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:08 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1muIZw-0004Su-M9
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 18:19:08 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1muIZb-0001ab-Dt; Mon, 06 Dec 2021 18:18:47 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=tKYzhrg4LaQRu+bVlR1HwzJODJv++S9HM1BoZIlLRIs=; b=fIjBgc3PxOxTwqcpRFoCJd6/R9
	C22jX851az0qrpi0rEja0WQGME8WN4BSFbgPtarV0bBDyUuF6vrY/4yl8sCYbMkaGAzeUKcqh/lmA
	Vc1tPzqvtpDcn7/R1XLE0kdtCKVw7E1LxDHU3yX5AmKIRo7dRZX2Kx/P7wbCD9hEhAiE=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 05/13] examination: skip memdisk on non-BIOS hosts, run per-firmware on x86
Date: Mon,  6 Dec 2021 18:18:31 +0000
Message-Id: <20211206181839.23463-6-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211206181839.23463-1-iwj@xenproject.org>
References: <20211206181839.23463-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a combination of two changes:

ts-memdisk-try-append: skip memdisk test on non-BIOS hosts

make-flight: examine: Insist on -bios and -uefi tests on x86

  This will let us skip ts-memdisk-try-append on non-bios platforms
  without risking regression.  It will also definitely spot
  regressions which will occur on any uefi host.

  standalone-generate-dump-flight-runvars reveals the changes are as
  follows:

  New jobs
     test-amd64-i386-examine-bios     test-amd64-i386-examine-uefi
     test-amd64-amd64-examine-bios    test-amd64-amd64-examine-uefi
  added everywhere that has the corresponding plain job, namely
     osstest
     linux-*
     xen-unstable

  These jobs are just like the plain jobs, except that one of
     ,PropEq:Firmware:bios:bios
     ,PropEq:Firmware:bios:uefi
  has been added to the end of all_hostflags.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
 make-flight           |  9 +++++++++
 mfi-common            |  1 +
 ts-memdisk-try-append | 18 ++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/make-flight b/make-flight
index acb19b113..d7eeb4ebb 100755
--- a/make-flight
+++ b/make-flight
@@ -736,6 +736,15 @@ test_matrix_do_one () {
   do_credit12_tests
 
   do_examine_one
+  case "$dom0arch" in
+    i386|amd64)
+      # Test on BIOS, which makes sure we test one where FreeBSD should
+      # work.  See ts-memdisk-try-append, and set_freebsd_runvars in
+      # mfi-common.
+      do_examine_one bios
+      do_examine_one uefi
+      ;;
+  esac
 
   # No further arm tests at the moment
   if [ $dom0arch = armhf -o $dom0arch = arm64 ]; then
diff --git a/mfi-common b/mfi-common
index 771843f05..59e712f4e 100644
--- a/mfi-common
+++ b/mfi-common
@@ -163,6 +163,7 @@ set_freebsd_runvars () {
     if [ x$no_hostflags != xtrue ]; then
         # osstest doesn't yet know how to install FreeBSD on UEFI hosts, so
         # limit the usable hardware to boxes that boot from BIOS.
+        # See also in ts-memdisk-try-append.
         freebsd_runvars="all_hostflags,=PropEq:Firmware:bios:bios"
     fi
 
diff --git a/ts-memdisk-try-append b/ts-memdisk-try-append
index d5c12866f..18c4aaa5c 100755
--- a/ts-memdisk-try-append
+++ b/ts-memdisk-try-append
@@ -28,6 +28,20 @@ arch=`perl -I. -we '
     $whhost ||= "host";
     our $ho = selecthost($whhost);
 
+    if (get_target_property($ho,"firmware") ne "bios") {
+        # osstest does not yet know how to install FreeBSD on UEFI hosts
+	# See also in set_freebsd_runvars in mfi_common
+
+	# Skipping this test on non-BIOS does not lead to pushes
+	# where this test is broken, because make-flght test_matrix_do_one
+	# arranges to run this test on BIOS too.
+
+        broken("skipping memdisk because firmware is not bios",
+	       "skip");
+	print "SKIP\n" or die $!;
+	exit 0;
+    }
+
     print $ho->{Arch} or die $!;
     ' "$@"`
 
@@ -38,6 +52,10 @@ amd64)
     echo "Arch $arch not supported for memdisk tests"
     exit 0
     ;;
+SKIP)
+    echo "Step skipped."
+    exit 0
+    ;;
 *)
     echo >&2 'Job arch retrieval failed?'
     exit 1
-- 
2.20.1


