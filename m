Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A96FE437AB3
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 18:14:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215166.374212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdxBI-000854-Kq; Fri, 22 Oct 2021 16:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215166.374212; Fri, 22 Oct 2021 16:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdxBI-0007tS-DZ; Fri, 22 Oct 2021 16:14:08 +0000
Received: by outflank-mailman (input) for mailman id 215166;
 Fri, 22 Oct 2021 16:14:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mdxBF-0007MA-ND
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:14:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mdxBF-0008Ir-MW
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:14:05 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mdxBF-0005qJ-Lj
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 16:14:05 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mdxBD-00021I-Mo; Fri, 22 Oct 2021 17:14:03 +0100
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
	bh=VDS6BNOrW+LwBBI6dSIzWM00hGlwk6ensvTQtDw+lVs=; b=5cjvR1b7IbCWRUqE78BBclBFNU
	p5+pYBoDLvO1Biufula2Pg8G3uFfYWeOj0DpllwreJC/SnwpPm3NmTx4ZVDQahqgQq23JWH3LodDF
	Z1h+8hfxF6vL3/3IQuLJ48AYmUJgkLTy8WjigO8y2Q+Nl7/9wT3FU16tTHCk6sEyWBL0=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 5/5] examination: skip memdisk on non-BIOS hosts, run per-firmware on x86
Date: Fri, 22 Oct 2021 17:13:51 +0100
Message-Id: <20211022161351.23091-6-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211022161351.23091-1-iwj@xenproject.org>
References: <20211022161351.23091-1-iwj@xenproject.org>
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
---
 make-flight           |  9 +++++++++
 mfi-common            |  1 +
 ts-memdisk-try-append | 17 +++++++++++++++++
 3 files changed, 27 insertions(+)

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
index d5c12866f..8fd6540b8 100755
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
 
@@ -37,6 +51,9 @@ amd64)
 [a-z]*)
     echo "Arch $arch not supported for memdisk tests"
     exit 0
+SKIP)
+    echo "Step skipped."
+    exit 0
     ;;
 *)
     echo >&2 'Job arch retrieval failed?'
-- 
2.20.1


