Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3413C1DA0A4
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 21:10:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7d6-0006vZ-PF; Tue, 19 May 2020 19:10:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7d4-0006ts-J7
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:10:18 +0000
X-Inumbo-ID: 4b4a7d26-9a04-11ea-b9cf-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b4a7d26-9a04-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 19:09:42 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Vd-0001da-W2; Tue, 19 May 2020 20:02:38 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 14/38] Honour 'LinuxSerialConsole <suite>' host
 property
Date: Tue, 19 May 2020 20:02:06 +0100
Message-Id: <20200519190230.29519-15-ian.jackson@eu.citrix.com>
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

This works like LinuxSerialConsole.

I originally wrote this to try to work around #940028, where multiple
d-i autoinstalls run in parallel leading to hard-to-debug lossage!
Explicitly specing the console causes it to run only on that one.

However, it turns out that explicitly specifying the console does not
always work and a better fix is needed.  Nevertheless, having added
this feature it seems foolish to throw it away.

Currently there are no hosts with this property so no functiaonal
change.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/TestSupport.pm | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index ff8103f2..7eeac49f 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -1447,7 +1447,10 @@ sub get_target_property ($$;$) {
 sub get_host_native_linux_console ($) {
     my ($ho) = @_;
 
-    my $console = get_host_property($ho, "LinuxSerialConsole", "ttyS0");
+    my $console;
+    $console //= get_host_property($ho, "LinuxSerialConsole $ho->{Suite}")
+	if $ho->{Suite};
+    $console //= get_host_property($ho, "LinuxSerialConsole", "ttyS0");
     return $console if $console eq 'NONE';
 
     return "$console,$c{Baud}n8";
-- 
2.20.1


