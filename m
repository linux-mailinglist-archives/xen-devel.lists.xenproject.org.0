Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EFE1E7C05
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:35:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedI4-0002yG-Go; Fri, 29 May 2020 11:35:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedI2-0002xD-Si
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:35:06 +0000
X-Inumbo-ID: 4e8bf2aa-a1a0-11ea-8993-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e8bf2aa-a1a0-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 11:34:07 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3Q-0003xZ-Bz; Fri, 29 May 2020 12:20:00 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 12/49] Debian: preseed: use priority= alias
Date: Fri, 29 May 2020 12:19:08 +0100
Message-Id: <20200529111945.21394-13-ian.jackson@eu.citrix.com>
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

This marginally reduces command line clobber.  This alias has been
supported approximately forever.  (And this code is currently only
used when DebconfPriority is set, which it generally isn't.)

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 8ccacc79..345aff68 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -702,7 +702,7 @@ sub di_installcmdline_core ($$;@) {
                );
 
     my $debconf_priority= $xopts{DebconfPriority};
-    push @cl, "debconf/priority=$debconf_priority"
+    push @cl, "priority=$debconf_priority"
         if defined $debconf_priority;
     push @cl, "rescue/enable=true" if $xopts{RescueMode};
 
-- 
2.20.1


