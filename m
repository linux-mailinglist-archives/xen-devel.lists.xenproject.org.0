Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C921F1EEF
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 20:27:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiMT8-0003wV-Or; Mon, 08 Jun 2020 18:25:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iYtX=7V=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jiMT6-0003wQ-3O
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 18:25:56 +0000
X-Inumbo-ID: 7cc0dec0-a9b5-11ea-b2a6-12813bfff9fa
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.220])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7cc0dec0-a9b5-11ea-b2a6-12813bfff9fa;
 Mon, 08 Jun 2020 18:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591640753;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=uMEUQfI4irOVxh7fDZjh1Ky9H+2S+8wFBN2BwnK7us4=;
 b=LUFfxR2/XVw9sA0ze0sQMrmuXovLKGDyqdcujlQufmd3ou1bfEfu8LDbkZ0kQJVDWG
 pFREc4I4XossXGKvWcI7k2IFZSIyL/bECr16TjCELr/Hq6EUBjURhpJpZvAo9pl2V2DW
 4e4f8h99ogn+MxcoOto0JXU47baYdmkPZxKL9IpXmDbRUMj06US0qYqjKnruOBhI++bD
 LGhjY1FF7lsHb+1Lc09C6KyfO9oeFuys73LJuZMlMJWZP8rwftxXPuExQp8RCkqWuD8x
 A0V6jPj7noFQy7zRy1hR927mzU4s9GbHyhdSFdD8ZPXlnfc46/WxHTdsEyDdJ0lVDApy
 Z47A==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GpKjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.9.2 DYNA|AUTH)
 with ESMTPSA id I09bd2w58IPgHjl
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 Jun 2020 20:25:42 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2] libxl__prepare_sockaddr_un
Date: Mon,  8 Jun 2020 20:25:38 +0200
Message-Id: <20200608182539.29415-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Olaf Hering <olaf@aepfle.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

libxl: remove usage of strncpy from libxl__prepare_sockaddr_un

The runtime check for the length of path already prevents malfunction.
But gcc does not detect this runtime check and reports incorrect
usage of strncpy. Remove the usage of strncpy and work directly with
the calculated path length.

In file included from /usr/include/string.h:495,
                 from libxl_internal.h:38,
                 from libxl_utils.c:20:
In function 'strncpy',
    inlined from 'libxl__prepare_sockaddr_un' at libxl_utils.c:1262:5:
/usr/include/bits/string_fortified.h:106:10: error: '__builtin_strncpy' specified bound 108 equals destination size [-Werror=stringop-truncation]
  106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libxl/libxl_utils.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/libxl/libxl_utils.c b/tools/libxl/libxl_utils.c
index f360f5e228..40885794c9 100644
--- a/tools/libxl/libxl_utils.c
+++ b/tools/libxl/libxl_utils.c
@@ -1252,14 +1252,16 @@ int libxl__prepare_sockaddr_un(libxl__gc *gc,
                                struct sockaddr_un *un, const char *path,
                                const char *what)
 {
-    if (sizeof(un->sun_path) <= strlen(path)) {
+    size_t len = strlen(path);
+
+    if (sizeof(un->sun_path) <= len) {
         LOG(ERROR, "UNIX socket path '%s' is too long for %s", path, what);
-        LOG(DEBUG, "Path must be less than %zu bytes", sizeof(un->sun_path));
+        LOG(DEBUG, "Path of len %zu must be less than %zu bytes", len, sizeof(un->sun_path));
         return ERROR_INVAL;
     }
     memset(un, 0, sizeof(struct sockaddr_un));
     un->sun_family = AF_UNIX;
-    strncpy(un->sun_path, path, sizeof(un->sun_path));
+    memcpy(un->sun_path, path, len);
     return 0;
 }
 

