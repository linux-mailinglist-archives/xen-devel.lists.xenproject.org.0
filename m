Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE911FAF74
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 13:44:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl9zV-0006W9-Jl; Tue, 16 Jun 2020 11:42:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkxY=75=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jl9zU-0006W4-3J
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 11:42:56 +0000
X-Inumbo-ID: 8432974a-afc6-11ea-bb8b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8432974a-afc6-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 11:42:55 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: O2KA83HI7fUTm7TAwZ6nMx1C4u4oC9zA7xkOpFFh++cRCj61rv10i2lCjROsL+hssoDwx9bGyg
 9hpE+YOuMmvHyb35yYj9UYKwxSUaeiYhTQ4PQc6J899hrXmlGN2oo+rpeB3EjVhPv1KtbZEeHy
 +scHh57n+F/1VQjS8DNjGo3jwwnjtXwIOSu8xdfNzaDbss9ap10r/iDBIqUGcwYuMy+HrT/hTY
 RcZfSdg9fAL52QSYQznj63qbFb+rTW85UxL6dy1AnfVp0gEwxlESAeZ0xfj6LiU/Vh9wLleSev
 czs=
X-SBRS: 2.7
X-MesageID: 20164113
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20164113"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 v2] tools/xen-ucode: fix error code propagation of
 microcode load operation
Date: Tue, 16 Jun 2020 12:42:34 +0100
Message-ID: <1592307754-8844-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, ian.jackson@eu.citrix.com,
 xadimgnik@gmail.com, wl@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Otherwise it's impossible to know the reason for a fault or blob rejection
inside the automation.

While at it, also change return code of incorrect invokation to EINVAL.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
Changes in v2:
- simply call "return errno". On Linux that seems to be safe as values <=255
  are correctly propagated, on non-Linux I couldn't find error codes >127.
- return positive value on incorrect invokation
---
 tools/misc/xen-ucode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index 0c257f4..409cace 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -25,7 +25,7 @@ int main(int argc, char *argv[])
         fprintf(stderr,
                 "xen-ucode: Xen microcode updating tool\n"
                 "Usage: %s <microcode blob>\n", argv[0]);
-        return 0;
+        return EINVAL;
     }
 
     filename = argv[1];
@@ -62,8 +62,11 @@ int main(int argc, char *argv[])
 
     ret = xc_microcode_update(xch, buf, len);
     if ( ret )
+    {
         fprintf(stderr, "Failed to update microcode. (err: %s)\n",
                 strerror(errno));
+        return errno;
+    }
 
     xc_interface_close(xch);
 
-- 
2.7.4


