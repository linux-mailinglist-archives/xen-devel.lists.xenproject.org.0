Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C355F1E7B92
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:20:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jed3u-0006cT-Nx; Fri, 29 May 2020 11:20:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jed3t-0006bA-Cw
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:20:29 +0000
X-Inumbo-ID: 552d69f6-a19e-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 552d69f6-a19e-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 11:19:59 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3P-0003xZ-1c; Fri, 29 May 2020 12:19:59 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 06/49] di_installcmdline_core: Pass locale on d-i
 command line
Date: Fri, 29 May 2020 12:19:02 +0100
Message-Id: <20200529111945.21394-7-ian.jackson@eu.citrix.com>
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


