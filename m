Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019A81E3231
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 00:17:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdhsO-0007xm-Cd; Tue, 26 May 2020 22:16:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=52a6=7I=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jdhsM-0007xL-I9
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 22:16:46 +0000
X-Inumbo-ID: 929bb0d9-9f9e-11ea-a6c3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 929bb0d9-9f9e-11ea-a6c3-12813bfff9fa;
 Tue, 26 May 2020 22:16:41 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: YeKW0jUKxEquevFRXYynJNH92Ps5LOSQIwW22tVNkuVltKfq5xh4EbEVGrfkGTyrO8gAV512nt
 Wb2UTg9xXlosgsogqdUskZf5GbR3x740niaw1lMhCPZYR8TdB/6Ke9lrE8qDVQzD9inpD7aTR1
 IUTStwAAHSrLm1JZ2+rkgi6eVnpRDiMxP182HrEZWSt1RE7OdGrHnKgKMuN6+U5X38IWIPUTaX
 1ZOrTKVl5Gj+M53qgTzn5uaA+i6RQcW3DC5GGek2l82PwsS8mlVlLDggKGahQMMIOT67+UHB9k
 3QA=
X-SBRS: 2.7
X-MesageID: 19238411
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,439,1583211600"; d="scan'208";a="19238411"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 3/5] automation/archlinux: Add 32-bit glibc headers
Date: Tue, 26 May 2020 23:16:10 +0100
Message-ID: <20200526221612.900922-4-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526221612.900922-1-george.dunlap@citrix.com>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This fixes the following build error in hvmloader:

usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-32.h: No such file or directory

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
v2:
- New

CC: Doug Goldstein <cardoe@cardoe.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony Perard <anthony.perard@citrix.com>
---
 automation/build/archlinux/current.dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
index 9af5d66afc..5095de65b8 100644
--- a/automation/build/archlinux/current.dockerfile
+++ b/automation/build/archlinux/current.dockerfile
@@ -19,6 +19,7 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
         iasl \
         inetutils \
         iproute \
+        lib32-glibc \
         libaio \
         libcacard \
         libgl \
-- 
2.25.1


