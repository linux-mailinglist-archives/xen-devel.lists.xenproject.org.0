Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0F08B43D0
	for <lists+xen-devel@lfdr.de>; Sat, 27 Apr 2024 04:18:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713181.1114230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Xd6-0005sL-8b; Sat, 27 Apr 2024 02:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713181.1114230; Sat, 27 Apr 2024 02:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Xd6-0005pK-51; Sat, 27 Apr 2024 02:17:32 +0000
Received: by outflank-mailman (input) for mailman id 713181;
 Sat, 27 Apr 2024 02:17:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uAk=MA=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1s0Xd3-0005oy-TU
 for xen-devel@lists.xenproject.org; Sat, 27 Apr 2024 02:17:30 +0000
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com
 [103.168.172.150]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4996c77d-043c-11ef-b4bb-af5377834399;
 Sat, 27 Apr 2024 04:17:26 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.nyi.internal (Postfix) with ESMTP id 99B2A1380221;
 Fri, 26 Apr 2024 22:17:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 26 Apr 2024 22:17:24 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 22:17:22 -0400 (EDT)
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
X-Inumbo-ID: 4996c77d-043c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm3; t=
	1714184244; x=1714270644; bh=N/aW2kOumKklC284DupiCmroQ69aHkcyRPD
	p0W/862A=; b=owZdBGgjCFRSwQhYFDMTP2Zhic2HdakBAIiEE71W9Y945gUDINK
	239qmQI92yQdejTIEt5zuR3MRU7Ct9HChqi0W0Pq3sPdia0t5uDrVkXbqM94JXZv
	6iisv8RzEm7A4lhs9cp6+49q3l58zfWnmxraADo23J1D8U/+bIqaWpvhTnLmqfr5
	CuvQerf3Qj4+YVN+j2Y98w9BuoNSmH9WAz2W6kIC5sG/uDo5+5wIedzYlKesU7Iz
	E5v2u/7+YvoUlBT81R2qAzqmehmiE1BJX0BTtJpBpIQk+RIro3lDeu3jxXE2R/HA
	nCxEVZb8qfklxvhz1mU3/JUginTX5RAqz7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714184244; x=1714270644; bh=N/aW2kOumKklC284DupiCmroQ69a
	HkcyRPDp0W/862A=; b=Z3Ys+thZuwKm1x0Xa+iOAAeuxjUsoGILBasrmjdbm3nT
	YtyP5mTA79Hs1YzV7hNInV2k+LSubvBCM3X6wFs7wX2qdnOZYzUydaLf5ZeJo28p
	SGaOnoUhPLYgP5e0dH4K7d3W2KS2SNXzQbIbjHeot2Apgar9CEbH9IRdAnf3uPfP
	rcJIe13Rc/cQqy2IdcwFShTeE/qmDKQ0zqtqdJxI59kh8dz40B62gZsQcg3YpyGS
	5n4KnIK2n30FOKfv3sK8mINiCpiV6uHcLt3MQGJAxwXFwZWCVaySmL9uzp3TJFD2
	6SvXCCQzSva6wJ5iO598WFiogAZmrbI0154JuU3mQQ==
X-ME-Sender: <xms:M2AsZkshPXiMvRdznHE348i8zAkTUhCQyLgxO6PKM1KTQa6Z18ipOw>
    <xme:M2AsZherCiGjIqOrvS-JNkhiy4fB6zZxBjlstw4TkX6JKXbs4Etto_dMu79cG6357
    wFGus_Kif5NT0M>
X-ME-Received: <xmr:M2AsZvza1UlzgJ8AJVp_SOpclvJ8ZIVKmYqtc-kxr_ks2b-rEOSBchpWe7dnfASwE63oONV7WYLETthTclW84_Qdss1vK50VXqgqiDEE-khbF_hsdzqamhlut0OKQ0GO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddttddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepvdefgeekvdekgfffgeekhfeijedtffek
    hefhleehfeejueetgfelgefgtdevieelnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:M2AsZnMRAEC3CMp46aM5LXZnDkKaJ27uIGLiJakWXnd-OAO7MgB6wg>
    <xmx:M2AsZk-E_FvtAy4lZzJvH8VB5rq9sOSFkK1Iz3-Xjc52HpKMOP4AcQ>
    <xmx:M2AsZvXrHQXWDJ_mRBV4ypRYVhD2asZKStXoHjIV9OwC55de9lwmfA>
    <xmx:M2AsZtcmNX7mL8U9UJxAhWTvnZlpnA1s0l1EVOmUUzQyEbh8m7Zlqg>
    <xmx:NGAsZoYZ_sIHQl3f7URRQtYFDA_hdYGXN55MWOgIzJeka3x5uxDUown0>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] libxl: Fix handling XenStore errors in device creation
Date: Fri, 26 Apr 2024 22:17:03 -0400
Message-ID: <84a6e6376ab9f5aafac8f33bf772d73fcfd0d818.1713998669.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If xenstored runs out of memory it is possible for it to fail operations
that should succeed.  libxl wasn't robust against this, and could fail
to ensure that the TTY path of a non-initial console was created and
read-only for guests.  This doesn't qualify for an XSA because guests
should not be able to run xenstored out of memory, but it still needs to
be fixed.

Add the missing error checks to ensure that all errors are properly
handled and that at no point can a guest make the TTY path of its
frontend directory writable.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 tools/libs/light/libxl_console.c | 10 ++---
 tools/libs/light/libxl_device.c  | 72 ++++++++++++++++++++------------
 tools/libs/light/libxl_xshelp.c  | 13 ++++--
 3 files changed, 59 insertions(+), 36 deletions(-)

diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
index cd7412a3272a2faf4b9dab0ef4dd077e55472546..adf82aa844a4f4989111bfc8a94af18ad8e114f1 100644
--- a/tools/libs/light/libxl_console.c
+++ b/tools/libs/light/libxl_console.c
@@ -351,11 +351,10 @@ int libxl__device_console_add(libxl__gc *gc, uint32_t domid,
         flexarray_append(front, "protocol");
         flexarray_append(front, LIBXL_XENCONSOLE_PROTOCOL);
     }
-    libxl__device_generic_add(gc, XBT_NULL, device,
-                              libxl__xs_kvs_of_flexarray(gc, back),
-                              libxl__xs_kvs_of_flexarray(gc, front),
-                              libxl__xs_kvs_of_flexarray(gc, ro_front));
-    rc = 0;
+    rc = libxl__device_generic_add(gc, XBT_NULL, device,
+                                   libxl__xs_kvs_of_flexarray(gc, back),
+                                   libxl__xs_kvs_of_flexarray(gc, front),
+                                   libxl__xs_kvs_of_flexarray(gc, ro_front));
 out:
     return rc;
 }
@@ -665,6 +664,7 @@ int libxl_device_channel_getinfo(libxl_ctx *ctx, uint32_t domid,
               */
              if (!val) val = "/NO-SUCH-PATH";
              channelinfo->u.pty.path = strdup(val);
+             if (channelinfo->u.pty.path == NULL) abort();
              break;
          default:
              break;
diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index a3d9f6f7df24b6ce1241c9cf0394a01a42c31b41..4faa5fa3bd115354af0a7ff9785acccd848a51bf 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -177,8 +177,13 @@ int libxl__device_generic_add(libxl__gc *gc, xs_transaction_t t,
     ro_frontend_perms[1].perms = backend_perms[1].perms = XS_PERM_READ;
 
 retry_transaction:
-    if (create_transaction)
+    if (create_transaction) {
         t = xs_transaction_start(ctx->xsh);
+        if (t == XBT_NULL) {
+            LOGED(ERROR, device->domid, "xs_transaction_start failed");
+            return ERROR_FAIL;
+        }
+    }
 
     /* FIXME: read frontend_path and check state before removing stuff */
 
@@ -195,42 +200,55 @@ retry_transaction:
         if (rc) goto out;
     }
 
-    /* xxx much of this function lacks error checks! */
-
     if (fents || ro_fents) {
-        xs_rm(ctx->xsh, t, frontend_path);
-        xs_mkdir(ctx->xsh, t, frontend_path);
+        if (!xs_rm(ctx->xsh, t, frontend_path) && errno != ENOENT)
+            goto out;
+        if (!xs_mkdir(ctx->xsh, t, frontend_path))
+            goto out;
         /* Console 0 is a special case. It doesn't use the regular PV
          * state machine but also the frontend directory has
          * historically contained other information, such as the
          * vnc-port, which we don't want the guest fiddling with.
          */
         if ((device->kind == LIBXL__DEVICE_KIND_CONSOLE && device->devid == 0) ||
-            (device->kind == LIBXL__DEVICE_KIND_VUART))
-            xs_set_permissions(ctx->xsh, t, frontend_path,
-                               ro_frontend_perms, ARRAY_SIZE(ro_frontend_perms));
-        else
-            xs_set_permissions(ctx->xsh, t, frontend_path,
-                               frontend_perms, ARRAY_SIZE(frontend_perms));
-        xs_write(ctx->xsh, t, GCSPRINTF("%s/backend", frontend_path),
-                 backend_path, strlen(backend_path));
-        if (fents)
-            libxl__xs_writev_perms(gc, t, frontend_path, fents,
-                                   frontend_perms, ARRAY_SIZE(frontend_perms));
-        if (ro_fents)
-            libxl__xs_writev_perms(gc, t, frontend_path, ro_fents,
-                                   ro_frontend_perms, ARRAY_SIZE(ro_frontend_perms));
+            (device->kind == LIBXL__DEVICE_KIND_VUART)) {
+            if (!xs_set_permissions(ctx->xsh, t, frontend_path,
+                                    ro_frontend_perms, ARRAY_SIZE(ro_frontend_perms)))
+                goto out;
+        } else {
+            if (!xs_set_permissions(ctx->xsh, t, frontend_path,
+                                    frontend_perms, ARRAY_SIZE(frontend_perms)))
+                goto out;
+        }
+        if (!xs_write(ctx->xsh, t, GCSPRINTF("%s/backend", frontend_path),
+                      backend_path, strlen(backend_path)))
+            goto out;
+        if (fents) {
+            rc = libxl__xs_writev_perms(gc, t, frontend_path, fents,
+                                        frontend_perms, ARRAY_SIZE(frontend_perms));
+            if (rc) goto out;
+        }
+        if (ro_fents) {
+            rc = libxl__xs_writev_perms(gc, t, frontend_path, ro_fents,
+                                        ro_frontend_perms, ARRAY_SIZE(ro_frontend_perms));
+            if (rc) goto out;
+        }
     }
 
     if (bents) {
         if (!libxl_only) {
-            xs_rm(ctx->xsh, t, backend_path);
-            xs_mkdir(ctx->xsh, t, backend_path);
-            xs_set_permissions(ctx->xsh, t, backend_path, backend_perms,
-                               ARRAY_SIZE(backend_perms));
-            xs_write(ctx->xsh, t, GCSPRINTF("%s/frontend", backend_path),
-                     frontend_path, strlen(frontend_path));
-            libxl__xs_writev(gc, t, backend_path, bents);
+            if (!xs_rm(ctx->xsh, t, backend_path) && errno != ENOENT)
+                goto out;
+            if (!xs_mkdir(ctx->xsh, t, backend_path))
+                goto out;
+            if (!xs_set_permissions(ctx->xsh, t, backend_path, backend_perms,
+                                    ARRAY_SIZE(backend_perms)))
+                goto out;
+            if (!xs_write(ctx->xsh, t, GCSPRINTF("%s/frontend", backend_path),
+                          frontend_path, strlen(frontend_path)))
+                goto out;
+            rc = libxl__xs_writev(gc, t, backend_path, bents);
+            if (rc) goto out;
         }
 
         /*
@@ -276,7 +294,7 @@ retry_transaction:
  out:
     if (create_transaction && t)
         libxl__xs_transaction_abort(gc, &t);
-    return rc;
+    return rc != 0 ? rc : ERROR_FAIL;
 }
 
 typedef struct {
diff --git a/tools/libs/light/libxl_xshelp.c b/tools/libs/light/libxl_xshelp.c
index 751cd942d95334191885ba3e8e45b77f7de82e34..a6e34ab10f23e674529d81419ec478dbad456deb 100644
--- a/tools/libs/light/libxl_xshelp.c
+++ b/tools/libs/light/libxl_xshelp.c
@@ -60,10 +60,15 @@ int libxl__xs_writev_perms(libxl__gc *gc, xs_transaction_t t,
     for (i = 0; kvs[i] != NULL; i += 2) {
         path = GCSPRINTF("%s/%s", dir, kvs[i]);
         if (path && kvs[i + 1]) {
-            int length = strlen(kvs[i + 1]);
-            xs_write(ctx->xsh, t, path, kvs[i + 1], length);
-            if (perms)
-                xs_set_permissions(ctx->xsh, t, path, perms, num_perms);
+            size_t length = strlen(kvs[i + 1]);
+            if (length > UINT_MAX)
+                return ERROR_FAIL;
+            if (!xs_write(ctx->xsh, t, path, kvs[i + 1], length))
+                return ERROR_FAIL;
+            if (perms) {
+                if (!xs_set_permissions(ctx->xsh, t, path, perms, num_perms))
+                    return ERROR_FAIL;
+            }
         }
     }
     return 0;
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


