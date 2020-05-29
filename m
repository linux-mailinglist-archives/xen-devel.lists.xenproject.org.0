Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5AC1E7BE8
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:33:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedGC-00013V-VR; Fri, 29 May 2020 11:33:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedGB-00012k-OE
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:33:11 +0000
X-Inumbo-ID: 2243513e-a1a0-11ea-8993-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2243513e-a1a0-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 11:32:53 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3V-0003xZ-UL; Fri, 29 May 2020 12:20:06 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 35/49] buster: setupboot_grub2: Note what files exist
 in /boot
Date: Fri, 29 May 2020 12:19:31 +0100
Message-Id: <20200529111945.21394-36-ian.jackson@eu.citrix.com>
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

Nothing uses this yet.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 9f1ce1df..0386ff7a 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -448,6 +448,11 @@ sub setupboot_grub2 ($$$$) {
         get_host_property($ho, "firmware") eq "uefi" &&
         $ho->{Suite} =~ m/jessie|stretch|buster/ && $ho->{Arch} =~ m/^arm/;
 
+    my %bootfiles =
+	map { $_ => 1 }
+	split / /,
+	target_cmd_output_root($ho, "cd /boot && echo *");
+
     my $parsemenu= sub {
         my $f= bl_getmenu_open($ho, $rmenu, "$stash/$ho->{Name}--grub.cfg.1");
     
-- 
2.20.1


