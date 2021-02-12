Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301DC31A1DC
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 16:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84313.158113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYv-0001Dw-06; Fri, 12 Feb 2021 15:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84313.158113; Fri, 12 Feb 2021 15:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYu-0001D6-Sn; Fri, 12 Feb 2021 15:40:52 +0000
Received: by outflank-mailman (input) for mailman id 84313;
 Fri, 12 Feb 2021 15:40:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAaYs-0000ix-Of
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 15:40:50 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1986579-83f5-4a77-bdee-3db06d09e860;
 Fri, 12 Feb 2021 15:40:18 +0000 (UTC)
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
X-Inumbo-ID: a1986579-83f5-4a77-bdee-3db06d09e860
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613144418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=gxhqNkRAqt4D8bXDbOgXUWNa09LADvFwdwUf17wrXSw=;
  b=R80rtD6giKjL9kkupOQKKmhZjbkW2sQNjKwX05b5yJXbs9z/+Wh2Oh8Y
   wBCRzI1kVVIlH+GrxxTQFljGsMG7vdolxK2D/VyDk63Pi2f5hqjzjhX/D
   BhQI/1/RlqriAzW01Nxx+rlG1MMpaSoKDgbnxk4zUtE/sFQykLjeylwmX
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: RKCf/rOpegXLOR/rGRr2O17NtjZ96m2jnR3RcZHKCvoQth9eyEg3hr5TXOSDVPvgM0hU3RP9Aa
 ZVOhfKHBDiTJiOdeiIU6J5DxCSf0wNjoLhH7UBPAxE4pBz20I1moCLLE/ShGQEXpmfs+JaYhox
 12z0e8R2UXettahbW/Q5PZParO3n5jo7rd6f5wowS7uXtCZ9xn/G+nqF08eMN5LuhHyNStgQIT
 Yi08sSeTUiPiUoq9vfqO6JvSBTsNMk9XGB1JbJlu/wUEmezF15cR6TZYRsKS9L+4qlOtAEsiUh
 usQ=
X-SBRS: 5.2
X-MesageID: 37518635
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="37518635"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH 04/10] tools/libxl: Fix uninitialised variable in libxl__domain_get_device_model_uid()
Date: Fri, 12 Feb 2021 15:39:47 +0000
Message-ID: <20210212153953.4582-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210212153953.4582-1-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Various version of gcc, when compiling with -Og, complain:

  libxl_dm.c: In function 'libxl__domain_get_device_model_uid':
  libxl_dm.c:256:12: error: 'kill_by_uid' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    256 |         if (kill_by_uid)
        |            ^

The logic is sufficiently complicated I can't figure out if the complain is
legitimate or not.  There is exactly one path wanting kill_by_uid set to true,
so default it to false and drop the existing workaround for this problem at
other optimisation levels.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_dm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 291dee9b3f..1ca21e4b81 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -128,7 +128,7 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
     int rc;
     char *user;
     uid_t intended_uid = -1;
-    bool kill_by_uid;
+    bool kill_by_uid = false;
 
     /* Only qemu-upstream can run as a different uid */
     if (b_info->device_model_version != LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN)
@@ -176,7 +176,6 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
         LOGD(DEBUG, guest_domid,
              "dm_restrict disabled, starting QEMU as root");
         user = NULL; /* Should already be null, but just in case */
-        kill_by_uid = false; /* Keep older versions of gcc happy */
         rc = 0;
         goto out;
     }
@@ -227,7 +226,6 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
         LOGD(WARN, guest_domid, "Could not find user %s, falling back to %s",
              LIBXL_QEMU_USER_RANGE_BASE, LIBXL_QEMU_USER_SHARED);
         intended_uid = user_base->pw_uid;
-        kill_by_uid = false;
         rc = 0;
         goto out;
     }
-- 
2.11.0


