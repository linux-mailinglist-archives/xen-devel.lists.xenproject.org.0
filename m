Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 946B41DA090
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 21:09:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7bx-0005ZU-Ia; Tue, 19 May 2020 19:09:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7bw-0005ZP-JY
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:09:08 +0000
X-Inumbo-ID: 36abac6e-9a04-11ea-b07b-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36abac6e-9a04-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 19:09:08 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Vl-0001da-2x; Tue, 19 May 2020 20:02:45 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 37/38] buster: Extend workaround for dhcpd EROFS bug
Date: Tue, 19 May 2020 20:02:29 +0100
Message-Id: <20200519190230.29519-38-ian.jackson@eu.citrix.com>
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

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 6c289cc7..e1ce757e 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -1617,7 +1617,7 @@ sub debian_dhcp_rofs_fix ($$) {
     # / is still ro.  In stretch, the isc dhcp client spins requesting
     # an address and then sending a DHCPDECLINE (and then, usually,
     # eventually works).
-    return '' unless $ho->{Suite} =~ m/stretch/;
+    return '' unless $ho->{Suite} =~ m/stretch|buster/;
     my $script = "$rootdir/lib/udev/ifupdown-hotplug";
     <<END.<<'ENDQ'.<<END
 set -ex
-- 
2.20.1


