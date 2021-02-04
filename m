Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDABC30F6EF
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 16:59:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81358.150249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7h2F-0001Yn-6x; Thu, 04 Feb 2021 15:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81358.150249; Thu, 04 Feb 2021 15:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7h2F-0001Xx-3S; Thu, 04 Feb 2021 15:59:11 +0000
Received: by outflank-mailman (input) for mailman id 81358;
 Thu, 04 Feb 2021 15:59:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KAxh=HG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7h2D-0001Xs-14
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 15:59:09 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cda7f7fc-3bff-4e31-8a30-1b96c2b82cd7;
 Thu, 04 Feb 2021 15:59:08 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: cda7f7fc-3bff-4e31-8a30-1b96c2b82cd7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612454347;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=CwKJFclLx3+gmhV9TPR9itejegLsKMZkkdIpvkqQIZI=;
  b=BO8zQgH8Z/96+J6cCxiFPswgzHJ7XEpXJQV5Fiz+lThDrSDusQlFzqKf
   5jZlyf3HOfIrVkXBizg/kr0b378YKh1YYcazaXALzzX1iuKHx5zznxdoy
   icZK2esCJITvWDyrfshdL8K0VXiPxDOmlEoSwZz7jQRt9gxkQ3sdtQimV
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YIlOc9EbGCS8tIed7Mj/RvcjpP37tzVxzvotJEyUykYWXPme0aWaIvubFVKPhDByL8kAYoQ5By
 NnxQ3dBYgEVJGWz1EvdKiYZ1EVTpM/WguIJyoIVfHMZxHdqKd2q+S/QYLRs+kjck/zAabTKqOj
 qmqJDGIkD5kCI6hmk3sLyf/XtgMlbhy+r0BQ2kSSDnNIzngq/wJf12+xFpik4IX1Ie6Tosy5DO
 fp7mrp+/RF3hF4eqpJOVTi+DWqgHJdOJTwZI0KTPvD8fMlqIZxTClcpOZwU3jnTT6QRrDAv/uY
 +wI=
X-SBRS: 4.0
X-MesageID: 36517128
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,401,1602561600"; 
   d="scan'208";a="36517128"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien.grall@arm.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>
Subject: [PATCH for-4.15] libs/devicemodel: Fix ABI breakage from xendevicemodel_set_irq_level()
Date: Thu, 4 Feb 2021 15:58:50 +0000
Message-ID: <20210204155850.23649-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

It is not permitted to edit the VERS clause for a version in a release of Xen.

Revert xendevicemodel_set_irq_level()'s inclusion in .so.1.2 and bump the the
library minor version to .so.1.4 instead.

Fixes: 5d752df85f ("xen/dm: Introduce xendevicemodel_set_irq_level DM op")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien.grall@arm.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Chen <Wei.Chen@arm.com>

Critical to include in 4.15, as this is an ABI breakage.  Reverting the broken
change doesn't look to be a practical option.
---
 tools/libs/devicemodel/Makefile              | 2 +-
 tools/libs/devicemodel/libxendevicemodel.map | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/libs/devicemodel/Makefile b/tools/libs/devicemodel/Makefile
index 500de7adc5..3e50ff6d90 100644
--- a/tools/libs/devicemodel/Makefile
+++ b/tools/libs/devicemodel/Makefile
@@ -2,7 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 MAJOR    = 1
-MINOR    = 3
+MINOR    = 4
 
 SRCS-y                 += core.c
 SRCS-$(CONFIG_Linux)   += common.c
diff --git a/tools/libs/devicemodel/libxendevicemodel.map b/tools/libs/devicemodel/libxendevicemodel.map
index a0c30125de..733549327b 100644
--- a/tools/libs/devicemodel/libxendevicemodel.map
+++ b/tools/libs/devicemodel/libxendevicemodel.map
@@ -32,10 +32,14 @@ VERS_1.2 {
 	global:
 		xendevicemodel_relocate_memory;
 		xendevicemodel_pin_memory_cacheattr;
-		xendevicemodel_set_irq_level;
 } VERS_1.1;
 
 VERS_1.3 {
 	global:
 		xendevicemodel_modified_memory_bulk;
 } VERS_1.2;
+
+VERS_1.4 {
+	global:
+		xendevicemodel_set_irq_level;
+} VERS_1.3;
-- 
2.11.0


