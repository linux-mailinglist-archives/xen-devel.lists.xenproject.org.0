Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D558031FB9E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 16:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86917.163513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD7Kv-0006gn-OS; Fri, 19 Feb 2021 15:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86917.163513; Fri, 19 Feb 2021 15:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD7Kv-0006gO-LE; Fri, 19 Feb 2021 15:04:53 +0000
Received: by outflank-mailman (input) for mailman id 86917;
 Fri, 19 Feb 2021 15:04:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Nbw=HV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lD7Ku-0006gF-4T
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 15:04:52 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90bb71f3-8dd2-490f-91cd-f1e7aa094536;
 Fri, 19 Feb 2021 15:04:51 +0000 (UTC)
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
X-Inumbo-ID: 90bb71f3-8dd2-490f-91cd-f1e7aa094536
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613747091;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=qL6LlSUT3VuR8v4v64EDX2BiNYj+Drd+LyVkTuFvHc0=;
  b=RgF0x83gY6CCdtuHdGFq8wPX4aTeGh6k7CK9/ZzYEe7Pp9bYmi4Qjp0G
   70Smuh2hh59BQWnAtSuBr2HX6kVUChOMZ+ZaxOVNKfyZjo6xvqq8gLgkk
   i/+zekL99L13atta3EBFD83oO6UVnzzMUDnCm4WnIKpJKQlASar+aJTA+
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +fVDByxOsCEEDTDywyhAPN9cUTVvLBICtUXBMempAdn54fr2xw+6fAzkz3jpzxHp6iu0tYNMxy
 vLATHgJr67NzCSHuqSlHe6jrsr14S1uCRp+7oKYLTKLCQ6VMv04iB2rCJqdxek/wXRvLtKBE4k
 6Im9ix6mE5rW/tje131mo1wRPyso5eQeoLm1BCDXB+iXR6aMrBtWq5gDS4i6A0TcwwZWX7/okr
 CGnYNzgGCxTqvg29yfrDmnSUvTak53dg0B7zbNOXyTe5uuPzdWpyjSuRZZUNumlOMgHnR+5Oqf
 Xug=
X-SBRS: 5.1
X-MesageID: 37809213
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,189,1610427600"; 
   d="scan'208";a="37809213"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH v2 for-4.15] tools/libxl: Work around unintialised variable libxl__domain_get_device_model_uid()
Date: Fri, 19 Feb 2021 15:04:26 +0000
Message-ID: <20210219150426.8498-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Various version of gcc, when compiling with -Og, complain:

  libxl_dm.c: In function 'libxl__domain_get_device_model_uid':
  libxl_dm.c:256:12: error: 'kill_by_uid' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    256 |         if (kill_by_uid)
        |            ^

The logic is very tangled.  Set kill_by_uid on every path.

No funcational change.

Requested-by: Ian Jackson <iwj@xenproject.org>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Not-acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_dm.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index db4cec6a76..5309496c58 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -152,13 +152,16 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
     user = b_info->device_model_user;
     if (user) {
         rc = userlookup_helper_getpwnam(gc, user, &user_pwbuf, &user_base);
-        if (rc)
+        if (rc) {
+            kill_by_uid = false;
             goto out;
+        }
 
         if (!user_base) {
             LOGD(ERROR, guest_domid, "Couldn't find device_model_user %s",
                  user);
             rc = ERROR_INVAL;
+            kill_by_uid = false;
             goto out;
         }
 
@@ -187,22 +190,29 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
      */
     rc = userlookup_helper_getpwnam(gc, LIBXL_QEMU_USER_RANGE_BASE,
                                          &user_pwbuf, &user_base);
-    if (rc)
+    if (rc) {
+        kill_by_uid = false;
         goto out;
+    }
+
     if (user_base) {
         struct passwd *user_clash, user_clash_pwbuf;
 
         intended_uid = user_base->pw_uid + guest_domid;
         rc = userlookup_helper_getpwuid(gc, intended_uid,
                                          &user_clash_pwbuf, &user_clash);
-        if (rc)
+        if (rc) {
+            kill_by_uid = false;
             goto out;
+        }
+
         if (user_clash) {
             LOGD(ERROR, guest_domid,
                  "wanted to use uid %ld (%s + %d) but that is user %s !",
                  (long)intended_uid, LIBXL_QEMU_USER_RANGE_BASE,
                  guest_domid, user_clash->pw_name);
             rc = ERROR_INVAL;
+            kill_by_uid = false;
             goto out;
         }
 
@@ -221,8 +231,11 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
      */
     user = LIBXL_QEMU_USER_SHARED;
     rc = userlookup_helper_getpwnam(gc, user, &user_pwbuf, &user_base);
-    if (rc)
+    if (rc) {
+        kill_by_uid = false;
         goto out;
+    }
+
     if (user_base) {
         LOGD(WARN, guest_domid, "Could not find user %s, falling back to %s",
              LIBXL_QEMU_USER_RANGE_BASE, LIBXL_QEMU_USER_SHARED);
@@ -240,6 +253,7 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
          "Could not find user %s or range base pseudo-user %s, cannot restrict",
          LIBXL_QEMU_USER_SHARED, LIBXL_QEMU_USER_RANGE_BASE);
     rc = ERROR_INVAL;
+    kill_by_uid = false;
 
 out:
     /* First, do a root check if appropriate */
-- 
2.11.0


