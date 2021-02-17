Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54CC31DD83
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 17:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86351.162081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPv5-0003YS-VJ; Wed, 17 Feb 2021 16:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86351.162081; Wed, 17 Feb 2021 16:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPv5-0003Y4-Ri; Wed, 17 Feb 2021 16:43:19 +0000
Received: by outflank-mailman (input) for mailman id 86351;
 Wed, 17 Feb 2021 16:43:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n2sW=HT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lCPv3-0003Xr-UC
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 16:43:18 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eef189c4-32ee-4253-a924-6e49a546f455;
 Wed, 17 Feb 2021 16:43:16 +0000 (UTC)
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
X-Inumbo-ID: eef189c4-32ee-4253-a924-6e49a546f455
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613580196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=rw2lC3aWi2/OP/LKqhOTIZxiMs1Fg5QFKgrBJsMDhWI=;
  b=QWNKOOhfcWdcWfp4KbNerctvGYLiriqnX4UdCd12FnJ7lVgdK2oYX1KV
   9gCv8y7irlEYPsGGnYm3wp62MQ4SAOXHgZdVvvKqczucfYCrwlJLY0kPD
   yYe/KHWsgHqz0/IXxYrsNcprK2uQCp5eRllMJbmlUGYT1QH58Vg9+/NKP
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NN3IXByZhZFFMdUNirgUZMv0TMLHOrJW8YpwFEgpp6NxIfTDTNzdOqrjyAm6tdbJnAZnCS6Kn5
 BJaRUD0EAqcCU4G88fS++B+hcjQ4G2xQj/YIpXn+/tT75CStlemscJ1D1nR4HeW0j7hfwZhISE
 2+OfOyKv/x3EwUrKV4X3fyB/W0TjQdwecFg29K7Q+Vrko4NnNIODCWzq+mtyXoDS86msbVP7mf
 lzQNvSAHSDu90OwJW+zIPG+FdFx0SfA0n0oblYaJOGt6Hi+k10S/u4xIhkgdp0fH0gKfPdjstF
 LrI=
X-SBRS: 5.1
X-MesageID: 37456607
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,184,1610427600"; 
   d="scan'208";a="37456607"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH 1/3] tools/libxl: Split out and err paths in libxl__domain_get_device_model_uid()
Date: Wed, 17 Feb 2021 16:42:49 +0000
Message-ID: <20210217164251.11005-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210217164251.11005-1-andrew.cooper3@citrix.com>
References: <20210217164251.11005-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

All paths with nonzero rc head to err.  All paths with a zero rc stay heading
towards out.

The comment discussing invariants is now arguably stale - it will be fixed in
one coherent manner when further fixes are in place.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_dm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index db4cec6a76..30b3242e57 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -153,13 +153,13 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
     if (user) {
         rc = userlookup_helper_getpwnam(gc, user, &user_pwbuf, &user_base);
         if (rc)
-            goto out;
+            goto err;
 
         if (!user_base) {
             LOGD(ERROR, guest_domid, "Couldn't find device_model_user %s",
                  user);
             rc = ERROR_INVAL;
-            goto out;
+            goto err;
         }
 
         intended_uid = user_base->pw_uid;
@@ -188,7 +188,7 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
     rc = userlookup_helper_getpwnam(gc, LIBXL_QEMU_USER_RANGE_BASE,
                                          &user_pwbuf, &user_base);
     if (rc)
-        goto out;
+        goto err;
     if (user_base) {
         struct passwd *user_clash, user_clash_pwbuf;
 
@@ -196,14 +196,14 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
         rc = userlookup_helper_getpwuid(gc, intended_uid,
                                          &user_clash_pwbuf, &user_clash);
         if (rc)
-            goto out;
+            goto err;
         if (user_clash) {
             LOGD(ERROR, guest_domid,
                  "wanted to use uid %ld (%s + %d) but that is user %s !",
                  (long)intended_uid, LIBXL_QEMU_USER_RANGE_BASE,
                  guest_domid, user_clash->pw_name);
             rc = ERROR_INVAL;
-            goto out;
+            goto err;
         }
 
         LOGD(DEBUG, guest_domid, "using uid %ld", (long)intended_uid);
@@ -222,7 +222,7 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
     user = LIBXL_QEMU_USER_SHARED;
     rc = userlookup_helper_getpwnam(gc, user, &user_pwbuf, &user_base);
     if (rc)
-        goto out;
+        goto err;
     if (user_base) {
         LOGD(WARN, guest_domid, "Could not find user %s, falling back to %s",
              LIBXL_QEMU_USER_RANGE_BASE, LIBXL_QEMU_USER_SHARED);
@@ -240,6 +240,7 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
          "Could not find user %s or range base pseudo-user %s, cannot restrict",
          LIBXL_QEMU_USER_SHARED, LIBXL_QEMU_USER_RANGE_BASE);
     rc = ERROR_INVAL;
+    goto err;
 
 out:
     /* First, do a root check if appropriate */
@@ -257,6 +258,7 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
             state->dm_kill_uid = GCSPRINTF("%ld", (long)intended_uid);
     }
 
+ err:
     return rc;
 }
 
-- 
2.11.0


