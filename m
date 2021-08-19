Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1443F1A0A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 15:10:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168776.308153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhnY-0000ed-DC; Thu, 19 Aug 2021 13:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168776.308153; Thu, 19 Aug 2021 13:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhnY-0000c3-9S; Thu, 19 Aug 2021 13:09:32 +0000
Received: by outflank-mailman (input) for mailman id 168776;
 Thu, 19 Aug 2021 13:09:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGhnX-0000bx-0t
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:09:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGhnX-00083i-0A
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:09:31 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGhnW-0006yk-VP
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:09:30 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGhnR-0001ke-Ot; Thu, 19 Aug 2021 14:09:25 +0100
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=PIycbnYvwYCM0ey9xO6slhM6/+th3UIqqdnnHIKPJMo=; b=BPlzm+MQ7I3usrcUnCzkmp7npu
	HFUMWeoTpYKAyLKrlyllZHBSx8o2fiqcJ+pcDhgxDL0+glPE8671B9ISNyH8R7JjC4MlS12ufLHM2
	+ctFQt24SSsBNwIOEctUqFQ+u/nXTW8WVx+MYBCuDjGlHKw4xAu5BVLvJzQFaCqxSQQA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.22533.210407.160523@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 14:09:25 +0100
To: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [xen-unstable test] 164237: regressions - FAIL
In-Reply-To: <24862.21094.866583.748384@mariner.uk.xensource.com>
References: <osstest-164237-mainreport@xen.org>
	<63c26289-4797-9ac0-af95-56b6efd64cc3@suse.com>
	<24862.21094.866583.748384@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Ian Jackson writes ("Re: [xen-unstable test] 164237: regressions - FAIL"):
> I will (1) drop this test and (2) force push staging in the meantime.

Force pushed xen-unstable staging.  osstest commit is below.

Ian.

From 8dee6e333622d830b7a9373989f63b526a85cd94 Mon Sep 17 00:00:00 2001
From: Ian Jackson <iwj@xenproject.org>
Date: Thu, 19 Aug 2021 13:46:21 +0100
Subject: [OSSTEST PATCH] make-flight: Drop pvgrub (pvgrub1) tests

This is obsolete.  In 2017 in 6abb2f113025 we wrote:

    A consequence is that this test will test jessie forever.  Eventually
    jessie will rot so badly that this test fails and then we will no
    longer be testing pvgrub1.  Hopefully by then no-one will be using it.

This has now occurred.

I have verified with
  OSSTEST_CONFIG=standalone-config-example eatmydata ./standalone-generate-dump-flight-runvars
that the only change is to drop jobs test-amd64-amd64-*-pvgrub.

CC: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 make-flight | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/make-flight b/make-flight
index fb38bc50..e0d11c80 100755
--- a/make-flight
+++ b/make-flight
@@ -598,30 +598,6 @@ do_pygrub_tests () {
       all_hostflags=$most_hostflags
 }
 
-do_pvgrub_tests () {
-  if [ $xenarch != amd64 -o $dom0arch != amd64 -o "$kern" != "" ]; then
-    return
-  fi
-
-  job_create_test test-$xenarch$kern-$dom0arch-amd64-pvgrub     \
-    test-debian-di xl $xenarch $dom0arch                        \
-      debian_arch=amd64                                         \
-      debian_suite=jessie                                       \
-      debian_di_version=`getconfig_TftpDiVersion_suite jessie`  \
-      debian_method=netboot                                     \
-      debian_bootloader=pvgrub                                  \
-      all_hostflags=$most_hostflags                             \
-
-  job_create_test test-$xenarch$kern-$dom0arch-i386-pvgrub      \
-    test-debian-di xl $xenarch $dom0arch                        \
-      debian_arch=i386                                          \
-      debian_suite=jessie                                       \
-      debian_di_version=`getconfig_TftpDiVersion_suite jessie`  \
-      debian_method=netboot                                     \
-      debian_bootloader=pvgrub                                  \
-      all_hostflags=$most_hostflags
-}
-
 do_pv_debian_test_one () {
   testname=$1; shift
   recipe_sfx=$1; shift
@@ -945,7 +921,6 @@ test_matrix_do_one () {
   #do_passthrough_tests
 
   do_pygrub_tests
-  do_pvgrub_tests
 
   do_shadow_tests
 
-- 
2.20.1


