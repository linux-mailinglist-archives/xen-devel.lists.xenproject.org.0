Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 518411E7B90
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:20:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jed3p-0006YA-Ex; Fri, 29 May 2020 11:20:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jed3o-0006Xq-CZ
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:20:24 +0000
X-Inumbo-ID: 550ce9f6-a19e-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 550ce9f6-a19e-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 11:19:59 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3O-0003xZ-R1; Fri, 29 May 2020 12:19:58 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 05/49] Booting: Use `--' rather than `---' to
 introduce host cmdline
Date: Fri, 29 May 2020 12:19:01 +0100
Message-Id: <20200529111945.21394-6-ian.jackson@eu.citrix.com>
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

Because systemd did something obnoxious, the kernel retaliated in the
game of Core Wars by hiding all arguments before `--' from userspace.
So use `---' instead so that all the arguments remain visible.

This in some sense now applies to host installs a change we had
already made to Debian HVM guests.  See osstest#493b7395
  ts-debian-hvm-install: Use ---, and no longer duplicate $gconsole
and https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=762007
  Kernel command line handling change breaks d-i user-params functionality

This change is fine for all non-ancient versions of Debian, so I have
not made it conditional.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index f4e9414c..ff8103f2 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -2909,7 +2909,7 @@ label overwrite
 	menu label ^Overwrite
 	menu default
 	kernel $kern
-	append $dicmd initrd=$initrd -- $hocmd
+	append $dicmd initrd=$initrd --- $hocmd
 	ipappend $xopts{ipappend}
 	$dtbs
 default overwrite
@@ -2956,7 +2956,7 @@ sub setup_netboot_di_uefi ($$$$$;%) {
 set default=0
 set timeout=5
 menuentry 'overwrite' {
-  linux $kern $dicmd -- $hocmd
+  linux $kern $dicmd --- $hocmd
   initrd $initrd
 }
 END
-- 
2.20.1


