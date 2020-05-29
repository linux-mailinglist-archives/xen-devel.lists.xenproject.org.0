Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F551E7BDE
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:32:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedFZ-0000jE-9a; Fri, 29 May 2020 11:32:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedFX-0000iy-Q0
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:32:31 +0000
X-Inumbo-ID: 15034272-a1a0-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15034272-a1a0-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 11:32:31 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3W-0003xZ-UT; Fri, 29 May 2020 12:20:07 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 36/49] buster: setupboot_grub2: Handle missing policy
 file bug
Date: Fri, 29 May 2020 12:19:32 +0100
Message-Id: <20200529111945.21394-37-ian.jackson@eu.citrix.com>
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

This is a complex interaction between update-grub and the Xen build
system on ARM64.  Not sure exactly who to blame but since we have our
own 20_linux_xen bodge, let's wait until we don't.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 0386ff7a..51217fb4 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -496,7 +496,17 @@ sub setupboot_grub2 ($$$$) {
 			 " kernel $entry->{KernVer}, not $want_kernver)");
 		} elsif ($want_xsm && !defined $entry->{Xenpolicy}) {
 		    logm("(skipping entry at $entry->{StartLine}..$.;".
-			 " XSM policy file not present)");
+			 " XSM policy file not mentioned)");
+		} elsif ($ho->{Suite} =~ m/buster/ &&
+			 defined $entry->{Xenpolicy} &&
+			 !$bootfiles{
+                             $entry->{Xenpolicy} =~ m{^/?} ? $' : die
+						 }) {
+		    # Our 20_linux_xen bodge with buster's update-grub
+		    # generates entries which mention /boot/xenpolicy-xen
+		    # even though that file doesn't exist on ARM64.
+		    logm("(skipping entry at $entry->{StartLine}..$.;".
+			 " XSM policy file not on disk!)");
 		} else {
 		    # yes!
 		    last;
-- 
2.20.1


