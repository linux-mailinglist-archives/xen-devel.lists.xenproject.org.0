Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAF81DA0B5
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 21:10:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb7dU-0007Op-M0; Tue, 19 May 2020 19:10:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+xc8=7B=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jb7dT-0007Nk-KH
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 19:10:43 +0000
X-Inumbo-ID: 58a87a5e-9a04-11ea-b9cf-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::3])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58a87a5e-9a04-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 19:10:05 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jb7Vd-0001da-4l; Tue, 19 May 2020 20:02:37 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 11/38] ts-debian-di-install: Provide guest with more
 RAM
Date: Tue, 19 May 2020 20:02:03 +0100
Message-Id: <20200519190230.29519-12-ian.jackson@eu.citrix.com>
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

buster cannot boot in so little because its initramfs and kernel are
too large.  Bump it to 2G.

However, our armhf test nodes have very little RAM.  And the Debian
armhf does fit in them as a guest still, so use a smaller value there.

Keying this off the architecture rather than the available host memory
is better because you do need the bigger value precisely if you are
not using armhf, and this makes osstest less dependent on a completely
accurate and populated host properties database.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-debian-di-install | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-debian-di-install b/ts-debian-di-install
index 9abb4956..d84407cf 100755
--- a/ts-debian-di-install
+++ b/ts-debian-di-install
@@ -64,7 +64,7 @@ $gn ||= 'debian';
 
 our $ho= selecthost($whhost);
 
-our $ram_mb=    512;
+our $ram_mb= $r{arch} =~ m/^armhf/ ? 768 : 2048;
 our $disk_mb= 10000;
 
 our $guesthost= $gn.
-- 
2.20.1


