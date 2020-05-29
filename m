Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E358D1E7BE9
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:33:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedGI-00017I-9J; Fri, 29 May 2020 11:33:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedGG-00016T-Pb
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:33:16 +0000
X-Inumbo-ID: 2379c542-a1a0-11ea-81bc-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2379c542-a1a0-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 11:32:55 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3X-0003xZ-P8; Fri, 29 May 2020 12:20:08 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 37/49] buster: Extend workaround for dhcpd EROFS bug
Date: Fri, 29 May 2020 12:19:33 +0100
Message-Id: <20200529111945.21394-38-ian.jackson@eu.citrix.com>
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

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 51217fb4..49d94b9b 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -1624,7 +1624,7 @@ sub debian_dhcp_rofs_fix ($$) {
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


