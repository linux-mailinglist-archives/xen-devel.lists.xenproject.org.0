Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E5E1F1395
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 09:30:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiCDd-0002Ab-Sg; Mon, 08 Jun 2020 07:29:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iYtX=7V=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1jiCDa-0002AW-Et
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 07:29:16 +0000
X-Inumbo-ID: be0f3126-a959-11ea-b24e-12813bfff9fa
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.217])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be0f3126-a959-11ea-b24e-12813bfff9fa;
 Mon, 08 Jun 2020 07:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591601349;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=UT9GKALVD7ZZpy+lYWU1wdLLFXK8X0l/a8iN3useVsg=;
 b=eE1VpybZlOKtF/ZL5fxalTwHCzDkVjg8a7/OSzIR83ctEFrjlMawGJg7Faq71E9ZO0
 yUbbTuUoaK+zFU3lFKrhjvl+xdWbC0lFLN+5pxmYLDXrHRcMZoUomcnaUb3cc4VmiJ3w
 Xmh6aSzm13GeUoZ2hx/t5TG4ATI7AOq3De5JzOmkJtm7Fug/jqOIg6IsTdaWTg0nuQSb
 mS82qhttRrXNAefdMbZ4tsuOiD/dSOr8OalkViBVXdEteoLYbax76hmDcmuYpOZ2KLC6
 8QUp2+ENetME2jJqiagCWMUPpNOth3zbd3J9Skv4BfEHlqPIKiEefRfR6GE7EXVKElj5
 n2hw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GpKjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.9.2 DYNA|AUTH)
 with ESMTPSA id I09bd2w587SwEk4
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 8 Jun 2020 09:28:58 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v1] tools: fix usage of strncpy
Date: Mon,  8 Jun 2020 09:28:54 +0200
Message-Id: <20200608072855.26589-1-olaf@aepfle.de>
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

In case of truncation no trailing zero will be added to the target
string. Reduce the amount of bytes to copy by one to make sure a
trailing zero always exists.

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

gcc may not detect the off-by-one error in libxl__prepare_sockaddr_un, fix the strncpy usage anyway.

 tools/libvchan/vchan-socket-proxy.c | 8 ++++----
 tools/libxl/libxl_utils.c           | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index 13700c5d67..b312f05ca7 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -140,7 +140,7 @@ static int set_nonblocking(int fd, int nonblocking) {
 static int connect_socket(const char *path_or_fd) {
     int fd;
     char *endptr;
-    struct sockaddr_un addr;
+    struct sockaddr_un addr = {};
 
     fd = strtoll(path_or_fd, &endptr, 0);
     if (*endptr == '\0') {
@@ -153,7 +153,7 @@ static int connect_socket(const char *path_or_fd) {
         return -1;
 
     addr.sun_family = AF_UNIX;
-    strncpy(addr.sun_path, path_or_fd, sizeof(addr.sun_path));
+    strncpy(addr.sun_path, path_or_fd, sizeof(addr.sun_path) - 1);
     if (connect(fd, (const struct sockaddr *)&addr, sizeof(addr)) == -1) {
         close(fd);
         return -1;
@@ -167,7 +167,7 @@ static int connect_socket(const char *path_or_fd) {
 static int listen_socket(const char *path_or_fd) {
     int fd;
     char *endptr;
-    struct sockaddr_un addr;
+    struct sockaddr_un addr = {};
 
     fd = strtoll(path_or_fd, &endptr, 0);
     if (*endptr == '\0') {
@@ -180,7 +180,7 @@ static int listen_socket(const char *path_or_fd) {
         return -1;
 
     addr.sun_family = AF_UNIX;
-    strncpy(addr.sun_path, path_or_fd, sizeof(addr.sun_path));
+    strncpy(addr.sun_path, path_or_fd, sizeof(addr.sun_path) - 1);
     if (bind(fd, (const struct sockaddr *)&addr, sizeof(addr)) == -1) {
         close(fd);
         return -1;
diff --git a/tools/libxl/libxl_utils.c b/tools/libxl/libxl_utils.c
index f360f5e228..83592e829d 100644
--- a/tools/libxl/libxl_utils.c
+++ b/tools/libxl/libxl_utils.c
@@ -1259,7 +1259,7 @@ int libxl__prepare_sockaddr_un(libxl__gc *gc,
     }
     memset(un, 0, sizeof(struct sockaddr_un));
     un->sun_family = AF_UNIX;
-    strncpy(un->sun_path, path, sizeof(un->sun_path));
+    strncpy(un->sun_path, path, sizeof(un->sun_path) - 1);
     return 0;
 }
 

