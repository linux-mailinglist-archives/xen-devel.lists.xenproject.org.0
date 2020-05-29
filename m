Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F1F1E7B95
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:20:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jed3f-0006U2-PB; Fri, 29 May 2020 11:20:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jed3e-0006Tk-Cg
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:20:14 +0000
X-Inumbo-ID: 54c7a0c6-a19e-11ea-81bc-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54c7a0c6-a19e-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 11:19:59 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3O-0003xZ-CH; Fri, 29 May 2020 12:19:58 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 03/49] lvcreate argments: pass --yes -Z y -W y
Date: Fri, 29 May 2020 12:18:59 +0100
Message-Id: <20200529111945.21394-4-ian.jackson@eu.citrix.com>
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

The documentation seesm to think this is the default but empirically
it isn't.  In our environment --yes is fine.

I have reported this to Debian as #953183.  Also vaguely related (and
discovered by me at the same time) is #953185.

This came up while trying to get things work on buster.  I don't know
what has changed.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm | 2 +-
 ts-xen-build-prep      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 1e7da676..43766ee3 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -935,7 +935,7 @@ sub lv_create ($$$$) {
     my ($ho, $vg, $lv, $mb) = @_;
     my $lvdev = "/dev/$vg/$lv";
     target_cmd_root($ho, "lvremove -f $lvdev ||:");
-    target_cmd_root($ho, "lvcreate -L ${mb}M -n $lv $vg");
+    target_cmd_root($ho, "lvcreate --yes -Z y -W y -L ${mb}M -n $lv $vg");
     target_cmd_root($ho, "dd if=/dev/zero of=$lvdev count=10");
     return $lvdev;
 }
diff --git a/ts-xen-build-prep b/ts-xen-build-prep
index 8e73f763..dabb9921 100755
--- a/ts-xen-build-prep
+++ b/ts-xen-build-prep
@@ -61,7 +61,7 @@ sub determine_vg_lv () {
 sub lvextend_stage1 () {
     target_cmd_root($ho, <<END);
         set -ex; if ! test -f /root/swap_osstest_enabled; then
-            lvcreate -L 10G -n swap_osstest_build $vg ||:
+            lvcreate --yes -Z y -W y -L 10G -n swap_osstest_build $vg ||:
             mkswap /dev/$vg/swap_osstest_build ||:
             swapon /dev/$vg/swap_osstest_build
             touch /root/swap_osstest_enabled
@@ -84,7 +84,7 @@ sub vginfo () {
 
 sub lvcreate () {
     target_cmd_output_root($ho,
-			   "lvdisplay $lv || lvcreate -l 1 -n $lvleaf $vg");
+			   "lvdisplay $lv || lvcreate --yes -Z y -W y -l 1 -n $lvleaf $vg");
 }
 
 sub lvextend1 ($$$) {
-- 
2.20.1


