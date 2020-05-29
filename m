Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75DA1E7C0E
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:35:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedIY-0003W8-Ix; Fri, 29 May 2020 11:35:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedIW-0003Uv-UE
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:35:36 +0000
X-Inumbo-ID: 5a05be90-a1a0-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a05be90-a1a0-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 11:34:26 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3R-0003xZ-TQ; Fri, 29 May 2020 12:20:02 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 18/49] buster: Deinstall the "systemd" package
Date: Fri, 29 May 2020 12:19:14 +0100
Message-Id: <20200529111945.21394-19-ian.jackson@eu.citrix.com>
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

This installs a pam rule which causes logins to hang.  It also seems
to cause some kind of udev wedge.

We are using sysvinit so this package is not desirable.  Empirically,
removing it makes the system work.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 9b4ef967..a328160e 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -842,6 +842,7 @@ sub preseed_base ($$$;@) {
     if ( $suite !~ /squeeze|wheezy/ ) {
        preseed_hook_command($ho, 'late_command', $sfx, <<END)
 in-target apt-get install -y sysvinit-core
+in-target apt-get remove -y systemd
 END
     }
 
-- 
2.20.1


