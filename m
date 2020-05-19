Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2B61DA09A
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 21:09:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7cX-0005ni-GC; Tue, 19 May 2020 19:09:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7cV-0005mc-I7
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:09:43 +0000
X-Inumbo-ID: 4106a6a0-9a04-11ea-ae69-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4106a6a0-9a04-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 19:09:25 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Vf-0001da-IG; Tue, 19 May 2020 20:02:40 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 17/38] buster: ts-host-install: Extend net.ifnames
 workaround
Date: Tue, 19 May 2020 20:02:09 +0100
Message-Id: <20200519190230.29519-18-ian.jackson@eu.citrix.com>
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

Really we should fix this by making a .deb in Debian that we could
install.  But this is a longer-term project.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-host-install | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-host-install b/ts-host-install
index 7a72a867..fe26f70f 100755
--- a/ts-host-install
+++ b/ts-host-install
@@ -282,7 +282,7 @@ END
 
     # Don't use "Predictable Network Interface Names"
     # https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/
-    push @hocmdline, "net.ifnames=0" if $ho->{Suite} =~ m/stretch/;
+    push @hocmdline, "net.ifnames=0" if $ho->{Suite} =~ m/stretch|buster/;
 
     push @hocmdline,
         get_host_property($ho, "linux-boot-append $ho->{Suite}", ''),
-- 
2.20.1


