Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6601DA05C
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 21:03:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7Vy-0004eV-AL; Tue, 19 May 2020 19:02:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7Vw-0004dz-6o
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:02:56 +0000
X-Inumbo-ID: 4d3b7140-9a03-11ea-ae69-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d3b7140-9a03-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 19:02:36 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Vb-0001da-Fs; Tue, 19 May 2020 20:02:35 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 04/38] TestSupport: allow more time for apt
Date: Tue, 19 May 2020 20:01:56 +0100
Message-Id: <20200519190230.29519-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
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


