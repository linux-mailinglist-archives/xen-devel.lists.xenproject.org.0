Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F014B1EB829
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 11:16:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg31t-0004eW-TG; Tue, 02 Jun 2020 09:16:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Snlw=7P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jg31s-0004eM-KX
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:16:16 +0000
X-Inumbo-ID: b5c946c0-a4b1-11ea-81bc-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5c946c0-a4b1-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 09:16:15 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ObfmshO7MUpzAWv2u8Tp58LY3B3Q9QKxgtTNAyWosXS7LDQCkbivotRG3MRGwc+YNaAvaZvWTQ
 5Sx0/JXs6y6vG60NaqS8glmGLtcyhleJSLD+//uB3jYxqM4rBfgwQPsZXyn/coQAs2X+Qs75DU
 QwaqDRnYYvMjbFBSG6Rw4YDXOlNAg0Hj9At2jCVA31Y9EApJaLXm+i6HqkrNa/6mzVHrVNzYDu
 +W3G5BpR6V/0uXSZJM3KLUYlopxLX/YmBKMOq//9QX9K/M5U9ZRt6FfL60/D56WrtVyjatdI6N
 HI8=
X-SBRS: 2.7
X-MesageID: 19254563
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,463,1583211600"; d="scan'208";a="19254563"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] compilers/clang: always use _Static_assert with clang
Date: Tue, 2 Jun 2020 11:16:02 +0200
Message-ID: <20200602091602.38422-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

All versions of clang used by Xen support _Static_assert, so use it
unconditionally when building Xen with clang.

No functional change expected.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Not sure whether this fully qualifies as a bugfix, as the current
behavior should also work fine under clang. Note that all versions of
clang from 3.5 to trunk (11) seem to return __GNUC__ == 4 and
__GNUC_MINOR__ == 2.
---
 xen/include/xen/lib.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index e5b0a007b8..076bcfb67d 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -25,7 +25,9 @@
 #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
 #define WARN_ON(p) do { if (unlikely(p)) WARN(); } while (0)
 
-#if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6)
+/* All clang versions supported by Xen have _Static_assert. */
+#if defined(__clang__) || \
+    (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6))
 /* Force a compilation error if condition is true */
 #define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); })
 
-- 
2.26.2


