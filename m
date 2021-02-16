Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DF431CF57
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 18:44:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85991.161013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC4OB-0002gH-7Q; Tue, 16 Feb 2021 17:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85991.161013; Tue, 16 Feb 2021 17:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC4OB-0002fq-2V; Tue, 16 Feb 2021 17:43:55 +0000
Received: by outflank-mailman (input) for mailman id 85991;
 Tue, 16 Feb 2021 17:43:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlKa=HS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lC4O9-0002fX-Aa
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 17:43:53 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22ce567e-6be4-4656-83ed-d8dec9bf333e;
 Tue, 16 Feb 2021 17:43:51 +0000 (UTC)
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
X-Inumbo-ID: 22ce567e-6be4-4656-83ed-d8dec9bf333e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613497431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=v3W8OOM9yiuJH+VdAlk5xvI6YpLMlAEGALiJ1ZliNPE=;
  b=gH/GS3i7DU3uQJ23XbUbWCbS5hVQpu0n6J9ATpPGvnMVYY59sw855j1H
   MbuH49Hhn2VDNxT4Tdb96RhhJ+MFGmStR/XIj6w8pzQ0s5INCgZsuHfJV
   6gPcyhrh64mmxStbeSXpLiXnJN5qfHXMKdlOfPYDrBDwqD3KVXRy1oE9m
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: m0X4lj2Rk4pQoP5+5j84UjOCPRaIYdHed2aQ8zxQCYclWeKVMkjkFOD1M3UsuS8VhXcNH3fb8g
 zYFkXdwy7ITQwdg/cYmpiRTfAFCQXpsREODgeGPdZeOMES7qcD54JFVTi3OJx00I57o2Ixq+X1
 Ql9KZ/D6zmZba/B/umAXp/JVC7DhhCFlMjIw+zXH3dBdMzf868RtVPhLAWADto1TFkvmK/kprp
 60hTaBWLRAjcbQPzwIbXaKaro8iBXakTkgs0Ni52jWqTSA+hSlB+qfPDaZiftLjVhQPYMByo72
 N2A=
X-SBRS: 5.1
X-MesageID: 37349327
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,184,1610427600"; 
   d="scan'208";a="37349327"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH v2 04/10] tools/libxl: Fix uninitialised variable in libxl__domain_get_device_model_uid()
Date: Tue, 16 Feb 2021 17:43:27 +0000
Message-ID: <20210216174327.8086-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210212153953.4582-5-andrew.cooper3@citrix.com>
References: <20210212153953.4582-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Various version of gcc, when compiling with -Og, complain:

  libxl_dm.c: In function 'libxl__domain_get_device_model_uid':
  libxl_dm.c:256:12: error: 'kill_by_uid' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    256 |         if (kill_by_uid)
        |            ^

The logic is very tangled.  Split the out and err labels apart, using out for
success cases only.

assert() that rc is 0 in the success case.  This allows for the removal of the
`if (!rc)` nesting in the out path, which reduces the cyclomatic complexity,
which is the root cause of false positive maybe-uninitialised warnings.

This also allows for dropping of the two paths setting kill_by_uid to false to
work around this warning at other optimisation levels.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>

v2:
 * Split the out and err paths.
---
 tools/libs/light/libxl_dm.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 291dee9b3f..dbd2ab607d 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -135,8 +135,8 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
         return 0;
 
     /*
-     * From this point onward, all paths should go through the `out`
-     * label.  The invariants should be:
+     * From this point onward, all paths should go through the `out` (success)
+     * or `err` (failure) labels.  The invariants should be:
      * - rc may be 0, or an error code.
      * - if rc is an error code, user and intended_uid are ignored.
      * - if rc is 0, user may be set or not set.
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
@@ -176,7 +176,6 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
         LOGD(DEBUG, guest_domid,
              "dm_restrict disabled, starting QEMU as root");
         user = NULL; /* Should already be null, but just in case */
-        kill_by_uid = false; /* Keep older versions of gcc happy */
         rc = 0;
         goto out;
     }
@@ -188,7 +187,7 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
     rc = userlookup_helper_getpwnam(gc, LIBXL_QEMU_USER_RANGE_BASE,
                                          &user_pwbuf, &user_base);
     if (rc)
-        goto out;
+        goto err;
     if (user_base) {
         struct passwd *user_clash, user_clash_pwbuf;
 
@@ -196,14 +195,14 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
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
@@ -222,12 +221,11 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
     user = LIBXL_QEMU_USER_SHARED;
     rc = userlookup_helper_getpwnam(gc, user, &user_pwbuf, &user_base);
     if (rc)
-        goto out;
+        goto err;
     if (user_base) {
         LOGD(WARN, guest_domid, "Could not find user %s, falling back to %s",
              LIBXL_QEMU_USER_RANGE_BASE, LIBXL_QEMU_USER_SHARED);
         intended_uid = user_base->pw_uid;
-        kill_by_uid = false;
         rc = 0;
         goto out;
     }
@@ -240,23 +238,26 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
          "Could not find user %s or range base pseudo-user %s, cannot restrict",
          LIBXL_QEMU_USER_SHARED, LIBXL_QEMU_USER_RANGE_BASE);
     rc = ERROR_INVAL;
+    goto err;
 
 out:
+    assert(rc == 0);
+
     /* First, do a root check if appropriate */
-    if (!rc) {
-        if (user && intended_uid == 0) {
-            LOGD(ERROR, guest_domid, "intended_uid is 0 (root)!");
-            rc = ERROR_INVAL;
-        }
+    if (user && intended_uid == 0) {
+        LOGD(ERROR, guest_domid, "intended_uid is 0 (root)!");
+        rc = ERROR_INVAL;
+        goto err;
     }
 
     /* Then do the final set, if still appropriate */
-    if (!rc && user) {
+    if (user) {
         state->dm_runas = user;
         if (kill_by_uid)
             state->dm_kill_uid = GCSPRINTF("%ld", (long)intended_uid);
     }
 
+ err:
     return rc;
 }
 
-- 
2.11.0


