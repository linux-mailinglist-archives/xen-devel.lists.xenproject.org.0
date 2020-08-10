Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE862240531
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 13:21:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k55rN-0008Fo-DS; Mon, 10 Aug 2020 11:20:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5wo=BU=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1k55rL-0008Fj-57
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 11:20:55 +0000
X-Inumbo-ID: d6fc8dc5-26af-483d-9627-9eef76f38bca
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6fc8dc5-26af-483d-9627-9eef76f38bca;
 Mon, 10 Aug 2020 11:20:53 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1k55rI-0003aJ-U4; Mon, 10 Aug 2020 12:20:53 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 1/6] cr-publish-flight-logs: Make a proper option
 parser
Date: Mon, 10 Aug 2020 12:20:42 +0100
Message-Id: <20200810112047.30285-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I was going to add another option but changed my mind.  But, let's
keep this patch anyway.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 cr-publish-flight-logs | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/cr-publish-flight-logs b/cr-publish-flight-logs
index faae7e0e..717cb957 100755
--- a/cr-publish-flight-logs
+++ b/cr-publish-flight-logs
@@ -28,9 +28,14 @@ our %c;
 readglobalconfig();
 
 my $push_harness = 0;
-if (@ARGV && $ARGV[0] =~ m{^--push-harness(?:-try)?$}) {
-    $push_harness = $&;
-    shift @ARGV;
+while (@ARGV && $ARGV[0] =~ m{^-}) {
+    $_ = shift @ARGV;
+    last if $_ eq '--';
+    if (m{^--push-harness(?:-try)?$}) {
+	$push_harness = $&;
+    } else {
+	die "unknown option \`$_' ?";
+    }
 }
 
 my $flight= shift @ARGV // '';
-- 
2.20.1


