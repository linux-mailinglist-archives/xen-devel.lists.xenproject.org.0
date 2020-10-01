Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EED72803E2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 18:25:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1461.4656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1OZ-0001r1-Lx; Thu, 01 Oct 2020 16:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461.4656; Thu, 01 Oct 2020 16:25:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1OZ-0001qG-Gf; Thu, 01 Oct 2020 16:25:27 +0000
Received: by outflank-mailman (input) for mailman id 1461;
 Thu, 01 Oct 2020 16:25:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kO1OX-0001JL-KY
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:25:25 +0000
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a44ed8a7-3c40-49e2-905e-6951fcd05921;
 Thu, 01 Oct 2020 16:24:52 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1kO1Ny-00029L-Gk; Thu, 01 Oct 2020 17:24:50 +0100
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=j0qz=DI=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kO1OX-0001JL-KY
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:25:25 +0000
X-Inumbo-ID: a44ed8a7-3c40-49e2-905e-6951fcd05921
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a44ed8a7-3c40-49e2-905e-6951fcd05921;
	Thu, 01 Oct 2020 16:24:52 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
	(return-path ijackson@chiark.greenend.org.uk)
	id 1kO1Ny-00029L-Gk; Thu, 01 Oct 2020 17:24:50 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 8/8] Tolerate lack of platform-specific hosts in old Xen branches
Date: Thu,  1 Oct 2020 17:24:39 +0100
Message-Id: <20201001162439.18160-8-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201001162439.18160-1-iwj@xenproject.org>
References: <20201001162439.18160-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now we have a situation where these can't all be made to work
because because some older Xen branches are hard to make work on
current Debian stable, and we have some hardware (which we have tagged
as specific "platforms") which doesn't work with oldstable.

This seems like a general problem, so fix it this way.

Note that we still treat these failed allocations as failures, so they
are subject to regression analysis and ought not to appear willy-nilly
on existing branches.

Runvar dump shows the addition of this runvar
   hostalloc_missing_expected=1
to
   qemu-upstream-4.6-testing
   xen-4.6-testing
   ...
   qemu-upstream-4.14-testing
   xen-4.14-testing
inclusive.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 make-flight | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/make-flight b/make-flight
index d5a3d99a..fb38bc50 100755
--- a/make-flight
+++ b/make-flight
@@ -643,13 +643,27 @@ do_pv_debian_tests () {
   for xsm in $xsms ; do
     # Basic PV Linux test with xl
     for platform in '' `getplatforms $xenarch $defsuite` ; do
+      platform_runvars=''
 
       # xsm test is not platform specific
       if [ x$xsm = xtrue -a x$platform != x ]; then
           continue
       fi
 
-      do_pv_debian_test_one xl '' xl "$platform" enable_xsm=$xsm
+      missing_expected=false
+      if [ x$platform != x ]; then
+        case "$xenbranch" in
+          xen-3.*-testing)  missing_expected=true ;;
+          xen-4.*-testing)  missing_expected=true ;;
+          *) ;;
+        esac
+      fi
+      if $missing_expected; then
+        platform_runvars+=hostalloc_missing_expected=1
+      fi
+
+      do_pv_debian_test_one xl '' xl "$platform" enable_xsm=$xsm \
+                            $platform_runvars
 
     done
   done
-- 
2.20.1


