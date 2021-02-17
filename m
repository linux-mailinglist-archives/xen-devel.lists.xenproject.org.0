Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC73831DD82
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 17:43:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86352.162089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPv6-0003Z7-9H; Wed, 17 Feb 2021 16:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86352.162089; Wed, 17 Feb 2021 16:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPv6-0003YQ-4X; Wed, 17 Feb 2021 16:43:20 +0000
Received: by outflank-mailman (input) for mailman id 86352;
 Wed, 17 Feb 2021 16:43:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n2sW=HT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lCPv4-0003Xs-2T
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 16:43:18 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3dac973-a7df-4fe8-9898-4f22d82209cc;
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
X-Inumbo-ID: b3dac973-a7df-4fe8-9898-4f22d82209cc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613580196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Rf44n99j0ALTC6ho3Q828btTMXx7uCUyMKUasv55xao=;
  b=Fm8Iy5htOtH/gcUefKdml5qdYcNV8k9l/qjm3MDjfUKJshHew+YRkOX+
   gedntByLm4r+IzJjy475ltCrRSRX66Jx05RcwnU/JDvbtxbY3z7kNraJO
   5X0KTvGOX2M2zv7PQDruaNsj3nJR7ppc7uN4esXJuc+AC+Slg8JNcfm79
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SiPIjv4hMhCbTbF9Li2GzodEYaWtYzebbOnjDJq1FDMG9tEThZ2R7a9YCB48cgX6uEHaBITRT4
 S1MU13tEemk7tW/ioIcGjF3UMYuDCTRiOekD4tbY4hplH0tDOpfIQGN5Z4bTP+ON3xjQ9CxNWJ
 ODJhNaW4yjyv66kmcCP2HZvWNq19LrStlzhADTAWsT/S3N9ZtcMBm6aBTGHb2M/SVhz2gxeKPm
 3hvAURFkEalFszMdzDLQXKkxRIrBj6DrabDr3wPY/AFrgYtcJAGoiiLmwrJFj0vt5GsYNMxRap
 C/w=
X-SBRS: 5.1
X-MesageID: 37627938
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,184,1610427600"; 
   d="scan'208";a="37627938"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH 3/3] tools/libxl: Rework invariants in libxl__domain_get_device_model_uid()
Date: Wed, 17 Feb 2021 16:42:51 +0000
Message-ID: <20210217164251.11005-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210217164251.11005-1-andrew.cooper3@citrix.com>
References: <20210217164251.11005-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Various version of gcc, when compiling with -Og, complain:

  libxl_dm.c: In function 'libxl__domain_get_device_model_uid':
  libxl_dm.c:256:12: error: 'kill_by_uid' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    256 |         if (kill_by_uid)
        |            ^

The logic is very tangled.

Two paths unconditionally set user before checking for associated errors.
This interferes with the expected use of uninitialised-variable heuristics to
force compile failures for ill-formed exit paths.

Use b_info->device_model_user and LIBXL_QEMU_USER_SHARED as appliable, and
only set user on the goto out paths.

All goto out paths now are comprised of the form:
  user = NULL;
  rc = 0;

or:
  user = non-NULL;
  indended_uid = ...;
  kill_by_uid = ...;
  rc = 0;

As a consequence, indended_uid can drop its default of -1, the dm_restrict can
drop its now-stale "just in case" comment and the redundant setting of
kill_by_uid to work around this issue at other optimisation levels.

Finally, rewrite the comment about invariants, indicating the split between
the out and err lables, and associated rc values.  Additionally, reword the
"is {not,} set" terminology to "is {non-,}NULL" to be more precise.

No funcational change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_dm.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 7843c283ca..8a7e084d89 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -127,7 +127,7 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
     struct passwd *user_base, user_pwbuf;
     int rc;
     char *user;
-    uid_t intended_uid = -1;
+    uid_t intended_uid;
     bool kill_by_uid;
 
     /* Only qemu-upstream can run as a different uid */
@@ -135,33 +135,34 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
         return 0;
 
     /*
-     * From this point onward, all paths should go through the `out`
-     * label.  The invariants should be:
+     * From this point onward, all paths should go through the `out` (success,
+     * rc = 0) or `err` (failure, rc != 0) labels.  The invariants should be:
      * - rc may be 0, or an error code.
-     * - if rc is an error code, user and intended_uid are ignored.
-     * - if rc is 0, user may be set or not set.
-     * - if user is set, then intended_uid must be set to a UID matching
+     * - if rc is an error code, all settings are ignored.
+     * - if rc is 0, user may be NULL or non-NULL.
+     * - if user is non-NULL, then intended_uid must be set to a UID matching
      *   the username `user`, and kill_by_uid must be set to the appropriate
      *   value.  intended_uid will be checked for root (0).
      */
-    
+
     /*
      * If device_model_user is present, set `-runas` even if
      * dm_restrict isn't in use
      */
-    user = b_info->device_model_user;
-    if (user) {
-        rc = userlookup_helper_getpwnam(gc, user, &user_pwbuf, &user_base);
+    if (b_info->device_model_user) {
+        rc = userlookup_helper_getpwnam(gc, b_info->device_model_user,
+                                        &user_pwbuf, &user_base);
         if (rc)
             goto err;
 
         if (!user_base) {
             LOGD(ERROR, guest_domid, "Couldn't find device_model_user %s",
-                 user);
+                 b_info->device_model_user);
             rc = ERROR_INVAL;
             goto err;
         }
 
+        user = b_info->device_model_user;
         intended_uid = user_base->pw_uid;
         kill_by_uid = true;
         rc = 0;
@@ -175,8 +176,7 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
     if (!libxl_defbool_val(b_info->dm_restrict)) {
         LOGD(DEBUG, guest_domid,
              "dm_restrict disabled, starting QEMU as root");
-        user = NULL; /* Should already be null, but just in case */
-        kill_by_uid = false; /* Keep older versions of gcc happy */
+        user = NULL;
         rc = 0;
         goto out;
     }
@@ -219,13 +219,14 @@ static int libxl__domain_get_device_model_uid(libxl__gc *gc,
      * QEMU_USER_SHARED.  NB for QEMU_USER_SHARED, all QEMU will run
      * as the same UID, we can't kill by uid; therefore don't set uid.
      */
-    user = LIBXL_QEMU_USER_SHARED;
-    rc = userlookup_helper_getpwnam(gc, user, &user_pwbuf, &user_base);
+    rc = userlookup_helper_getpwnam(gc, LIBXL_QEMU_USER_SHARED,
+                                    &user_pwbuf, &user_base);
     if (rc)
         goto err;
     if (user_base) {
         LOGD(WARN, guest_domid, "Could not find user %s, falling back to %s",
              LIBXL_QEMU_USER_RANGE_BASE, LIBXL_QEMU_USER_SHARED);
+        user = LIBXL_QEMU_USER_SHARED;
         intended_uid = user_base->pw_uid;
         kill_by_uid = false;
         rc = 0;
-- 
2.11.0


