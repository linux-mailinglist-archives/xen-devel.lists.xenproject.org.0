Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957441E7BF7
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:34:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedHA-0001zK-SD; Fri, 29 May 2020 11:34:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedH9-0001yU-Qy
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:34:11 +0000
X-Inumbo-ID: 39b706b2-a1a0-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39b706b2-a1a0-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 11:33:32 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3Q-0003xZ-5r; Fri, 29 May 2020 12:20:00 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 11/49] ts-debian-di-install: Provide guest with more
 RAM
Date: Fri, 29 May 2020 12:19:07 +0100
Message-Id: <20200529111945.21394-12-ian.jackson@eu.citrix.com>
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

buster cannot boot in so little because its initramfs and kernel are
too large.  Bump it to 2G.

However, our armhf test nodes have very little RAM.  And the Debian
armhf does fit in them as a guest still, so use a smaller value there.

Keying this off the architecture rather than the available host memory
is better because you do need the bigger value precisely if you are
not using armhf, and this makes osstest less dependent on a completely
accurate and populated host properties database.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-debian-di-install | 2 +-
 ts-debian-fixup      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ts-debian-di-install b/ts-debian-di-install
index 9abb4956..d84407cf 100755
--- a/ts-debian-di-install
+++ b/ts-debian-di-install
@@ -64,7 +64,7 @@ $gn ||= 'debian';
 
 our $ho= selecthost($whhost);
 
-our $ram_mb=    512;
+our $ram_mb= $r{arch} =~ m/^armhf/ ? 768 : 2048;
 our $disk_mb= 10000;
 
 our $guesthost= $gn.
diff --git a/ts-debian-fixup b/ts-debian-fixup
index dfeb4d39..528fb03b 100755
--- a/ts-debian-fixup
+++ b/ts-debian-fixup
@@ -104,7 +104,7 @@ sub console () {
 
 sub randomseed () {
     my $cmd = debian_write_random_seed_command($mountpoint);
-    target_cmd_root($ho, "set -ex\n".cmd);
+    target_cmd_root($ho, "set -ex\n".$cmd);
 }
 
 sub filesystems () {
-- 
2.20.1


