Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27241F7BBF
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 18:44:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjmnM-0003Zr-EU; Fri, 12 Jun 2020 16:44:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CBv9=7Z=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jjmnL-0003Zl-40
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 16:44:43 +0000
X-Inumbo-ID: 0365ac9e-accc-11ea-bb8b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0365ac9e-accc-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 16:44:42 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: IjLRnD1CjhquFjV5pHyTMPb8LFKYcG/tJyvf5x9B/YHjixQABN2MIllxhs/IWFsX2JtafQ/AU3
 x3sCl6FU5DgkHJlisoZoCy5Rc/vkP58tllufSlu1jQY5XxZxqTiKKn54yGMADxptbIiiIKv/K0
 Xr1y1ZZHVNOUHwRbqFQaqwfU4RQMaP2mpac9bVZwAMm62AQx576qhVvRDA/cfCzSMfjUdygOqd
 zTeJ73HpKaclaTzDh4N+YgCSUdIj1SA5kyFkjCsUKX80fyjnftS0n7T1+21z+32gXfYMElKu0n
 bqU=
X-SBRS: 2.7
X-MesageID: 19938843
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,504,1583211600"; d="scan'208";a="19938843"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] tools/xen-ucode: fix error code propagation of microcode load
 operation
Date: Fri, 12 Jun 2020 17:44:15 +0100
Message-ID: <1591980255-18811-1-git-send-email-igor.druzhinin@citrix.com>
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
Cc: andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, wl@xen.org,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Otherwise it's impossible to know the reason for a fault or blob rejection
inside the automation.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
 tools/misc/xen-ucode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
index 0c257f4..2c907e1 100644
--- a/tools/misc/xen-ucode.c
+++ b/tools/misc/xen-ucode.c
@@ -62,8 +62,11 @@ int main(int argc, char *argv[])
 
     ret = xc_microcode_update(xch, buf, len);
     if ( ret )
+    {
+        ret = errno;
         fprintf(stderr, "Failed to update microcode. (err: %s)\n",
                 strerror(errno));
+    }
 
     xc_interface_close(xch);
 
@@ -74,5 +77,5 @@ int main(int argc, char *argv[])
     }
     close(fd);
 
-    return 0;
+    return ret;
 }
-- 
2.7.4


