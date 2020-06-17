Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC321FC40E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 04:20:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlNg0-0002xD-BH; Wed, 17 Jun 2020 02:19:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zn23=76=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jlNfy-0002x8-SB
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 02:19:42 +0000
X-Inumbo-ID: ff829024-b040-11ea-b977-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff829024-b040-11ea-b977-12813bfff9fa;
 Wed, 17 Jun 2020 02:19:40 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: cJhDtZTtaIATMqqZXba+kRqLsnVGcgf+mPNLAGvGqPsXmLy3m+f1W2mplsNXiTllp1+COJrGK7
 rtlxJi5lrlJVZMLWJsqL3LlP/0vJW/LGeBNDkdNe9xu+aWTSX/Y0Ps+Nyl5Scxggn49GVkN/26
 lWiqURkZvgwxvspdcL0vSEdziRrREysxEW78JzcMkyIVc5wsXG9AzhfV5yZP05wKYmbutAsObK
 l1JnghYtCblVCJMS6Ahlqw1McjrfB111jv6njoX03JSCCL6VHLS7nyB8tg0CLJA+v2jGt7ct5H
 F38=
X-SBRS: 2.7
X-MesageID: 20529371
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,520,1583211600"; d="scan'208";a="20529371"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 v3] tools/xen-ucode: return correct exit code on
 failed microcode update
Date: Wed, 17 Jun 2020 03:19:13 +0100
Message-ID: <1592360353-31231-1-git-send-email-igor.druzhinin@citrix.com>
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

Otherwise it's difficult to know if operation failed inside the automation.

While at it, also switch to returning 1 and 2 instead of errno to avoid
incompatibilies between errno and special exit code numbers.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
Changes in v3:
- conventionally return 1 and 2 instead of errno as exit code
---
 tools/misc/xen-ucode.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index 0c257f4..ad32fac 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -25,7 +25,7 @@ int main(int argc, char *argv[])
         fprintf(stderr,
                 "xen-ucode: Xen microcode updating tool\n"
                 "Usage: %s <microcode blob>\n", argv[0]);
-        return 0;
+        exit(2);
     }
 
     filename = argv[1];
@@ -34,14 +34,14 @@ int main(int argc, char *argv[])
     {
         fprintf(stderr, "Could not open %s. (err: %s)\n",
                 filename, strerror(errno));
-        return errno;
+        exit(1);
     }
 
     if ( fstat(fd, &st) != 0 )
     {
         fprintf(stderr, "Could not get the size of %s. (err: %s)\n",
                 filename, strerror(errno));
-        return errno;
+        exit(1);
     }
 
     len = st.st_size;
@@ -49,7 +49,7 @@ int main(int argc, char *argv[])
     if ( buf == MAP_FAILED )
     {
         fprintf(stderr, "mmap failed. (error: %s)\n", strerror(errno));
-        return errno;
+        exit(1);
     }
 
     xch = xc_interface_open(NULL, NULL, 0);
@@ -57,20 +57,23 @@ int main(int argc, char *argv[])
     {
         fprintf(stderr, "Error opening xc interface. (err: %s)\n",
                 strerror(errno));
-        return errno;
+        exit(1);
     }
 
     ret = xc_microcode_update(xch, buf, len);
     if ( ret )
+    {
         fprintf(stderr, "Failed to update microcode. (err: %s)\n",
                 strerror(errno));
+        exit(1);
+    }
 
     xc_interface_close(xch);
 
     if ( munmap(buf, len) )
     {
         printf("Could not unmap: %d(%s)\n", errno, strerror(errno));
-        return errno;
+        exit(1);
     }
     close(fd);
 
-- 
2.7.4


