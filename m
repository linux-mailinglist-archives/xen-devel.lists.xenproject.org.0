Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA771DA061
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 21:03:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7W6-0004iN-Rx; Tue, 19 May 2020 19:03:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7W6-0004iD-6u
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:03:06 +0000
X-Inumbo-ID: 4d73e76e-9a03-11ea-ae69-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d73e76e-9a03-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 19:02:36 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Vb-0001da-Vh; Tue, 19 May 2020 20:02:36 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 06/38] di_installcmdline_core: Pass locale on d-i
 command line
Date: Tue, 19 May 2020 20:01:58 +0100
Message-Id: <20200519190230.29519-7-ian.jackson@eu.citrix.com>
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

In buster, d-i wants when setting up the network, ie before the
preseed is loaded.

We leave it in the preseed too because why not.

I think this change should be fine for older versions of Debian.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 6e9d2072..ba975b87 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -699,7 +699,8 @@ sub di_installcmdline_core ($$;@) {
                "hostname=$tho->{Name}",
                "$xopts{PreseedScheme}=$ps_url",
                "netcfg/dhcp_timeout=150",
-               "netcfg/choose_interface=$netcfg_interface"
+               "netcfg/choose_interface=$netcfg_interface",
+               "debian-installer/locale=en_GB",
                );
 
     my $debconf_priority= $xopts{DebconfPriority};
-- 
2.20.1


