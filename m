Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C76B71E7B93
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:20:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jed3k-0006Vh-2D; Fri, 29 May 2020 11:20:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jed3j-0006VV-Bl
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:20:19 +0000
X-Inumbo-ID: 54f13c1a-a19e-11ea-9dbe-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54f13c1a-a19e-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 11:19:59 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3O-0003xZ-Ik; Fri, 29 May 2020 12:19:58 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 04/49] TestSupport: allow more time for apt
Date: Fri, 29 May 2020 12:19:00 +0100
Message-Id: <20200529111945.21394-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
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

Empirically some of these operations can take longer than 30s,
especially with a cold cache.

Note that because of host sharing and our on-host apt lock, the
timeout needs to be the same for every apt operation: a fast operation
could be blocked behind a slow one.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 43766ee3..f4e9414c 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -637,12 +637,12 @@ sub target_install_packages_nonfree_nonconcurrent ($@) {
     my ($ho, @packages) = @_;
     my $slist= '/etc/apt/sources.list';
     my $xsuites= 'contrib non-free';
-    target_cmd_root($ho, <<END, 30);
+    target_cmd_root($ho, <<END, 300);
     perl -i~ -pe 'next unless m/^deb/; s{ main\$}{\$& $xsuites};' $slist
     apt-get update
 END
     target_run_pkgmanager_install($ho,\@packages);
-    target_cmd_root($ho, <<END, 30);
+    target_cmd_root($ho, <<END, 300);
     mv $slist~ $slist
     apt-get update
 END
-- 
2.20.1


