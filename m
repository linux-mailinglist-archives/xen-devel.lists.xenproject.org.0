Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736131BB4EF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:06:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHVc-0000fi-1h; Tue, 28 Apr 2020 04:06:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHVb-0000fA-1x
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:06:11 +0000
X-Inumbo-ID: 913a2be8-8905-11ea-ae69-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 913a2be8-8905-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 04:05:59 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 71so16251513qtc.12
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qv1Q9DnV7+kaRXi7fO8SZeqk2BXV8QqwlY5OCm77OCE=;
 b=L4eAre5KFeI+b0nlRSuCm1sXm4alzuHrtT3B0Zeyr1sS1JAWrnwaQkU4+PXdx/h6ZA
 BiR6WDA7iQX+M9iZ+zmaz4IGNTCCpIIz4cYNzx/5sIDbnaYHzKr3Qsc5aI7wh68WyN72
 y98te83uayOpg3jKH1nqTfnYV6HOrHmWPez7jQr8U4mqVkrCtbfM8nobljR/FK7Fpr9V
 nGQTRbit091mV3Bm+OGokCvMoqGjkL2PaaJF99dWa9qF1nyAKNtapYUS2DX7B8MJmC9M
 MfsQf+gWb8hMh8PFMn7gN8smG0KLt+WwOYWTs3MF2hM16w6Ivdu3nZXSpp/mBSAy5CLR
 oDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qv1Q9DnV7+kaRXi7fO8SZeqk2BXV8QqwlY5OCm77OCE=;
 b=YGp8vaDP9D2BDhcCbyclr3PlifvQz/h5tpqvVzQv4fZlUqh9Hgy1pvs1rW6st5nuUq
 d52DFGSIDU0mtMfwN1T9XQA4RsmfzpPnK99byhQ/Sy4oZ2o9aZ6OoY6veqsK2gR1E6zi
 Ho5k2mg24et/gTLz4xHOjvszTtyk9UIgwSkEfSaENoeA1+eUE0jTUfwFwZjwjMWloug2
 F8hqkIIHJPUSlzFglsg9zYJLBsaFdP8/n7Y7RoqpcMSdZYaLPHSDVLQ1FqPEU10A8sio
 foImfmgVAolyDYkEX1O7vQoJbyGAn0EfXKB8qaLhFw59OnLcNlKCjo7qYD+ewa/hJAPE
 JUuw==
X-Gm-Message-State: AGi0PubOUnfcVdQgDB1PonECXz1Ge6vv/QsASPVGqhVXWM/KAfreoZU6
 deLnTSyXHik2ZySEKfPTWY7tL8iH
X-Google-Smtp-Source: APiQypKQwAKlZIZvCmo9Y3whpXQpmhBwZR7/XpW/aL14R/yGGmP1n+QQPTCC3GBNPRQJFnzcvzvkYQ==
X-Received: by 2002:ac8:4a06:: with SMTP id x6mr27416022qtq.163.1588046758653; 
 Mon, 27 Apr 2020 21:05:58 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:05:57 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 09/21] libxl: add save/restore support for qemu-xen in
 stubdomain
Date: Tue, 28 Apr 2020 00:04:21 -0400
Message-Id: <20200428040433.23504-10-jandryuk@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200428040433.23504-1-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Rely on a wrapper script in stubdomain to attach FD 3/4 of qemu to
relevant consoles.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Address TODO in dm_state_save_to_fdset: Only remove savefile for
non-stubdom.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Changes in v3:
 - adjust for qmp_ev*
 - assume specific fdset id in qemu set in stubdomain
Changes in v5:
 - Only remove savefile for non-stubdom
---
 tools/libxl/libxl_dm.c  | 23 +++++++++++------------
 tools/libxl/libxl_qmp.c | 27 +++++++++++++++++++++++++--
 2 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index bdc23554eb..45d0dd56f5 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -1744,10 +1744,17 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     }
 
     if (state->saved_state) {
-        /* This file descriptor is meant to be used by QEMU */
-        *dm_state_fd = open(state->saved_state, O_RDONLY);
-        flexarray_append(dm_args, "-incoming");
-        flexarray_append(dm_args, GCSPRINTF("fd:%d",*dm_state_fd));
+        if (is_stubdom) {
+            /* Linux stubdomain connects specific FD to STUBDOM_CONSOLE_RESTORE
+             */
+            flexarray_append(dm_args, "-incoming");
+            flexarray_append(dm_args, "fd:3");
+        } else {
+            /* This file descriptor is meant to be used by QEMU */
+            *dm_state_fd = open(state->saved_state, O_RDONLY);
+            flexarray_append(dm_args, "-incoming");
+            flexarray_append(dm_args, GCSPRINTF("fd:%d",*dm_state_fd));
+        }
     }
     for (i = 0; b_info->extra && b_info->extra[i] != NULL; i++)
         flexarray_append(dm_args, b_info->extra[i]);
@@ -2218,14 +2225,6 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
 
     assert(libxl_defbool_val(guest_config->b_info.device_model_stubdomain));
 
-    if (libxl__stubdomain_is_linux(&guest_config->b_info)) {
-        if (d_state->saved_state) {
-            LOG(ERROR, "Save/Restore not supported yet with Linux Stubdom.");
-            ret = -1;
-            goto out;
-        }
-    }
-
     sdss->pvqemu.guest_domid = INVALID_DOMID;
 
     libxl_domain_create_info_init(&dm_config->c_info);
diff --git a/tools/libxl/libxl_qmp.c b/tools/libxl/libxl_qmp.c
index efaba91086..c394000ea9 100644
--- a/tools/libxl/libxl_qmp.c
+++ b/tools/libxl/libxl_qmp.c
@@ -962,6 +962,7 @@ static void dm_stopped(libxl__egc *egc, libxl__ev_qmp *ev,
                        const libxl__json_object *response, int rc);
 static void dm_state_fd_ready(libxl__egc *egc, libxl__ev_qmp *ev,
                               const libxl__json_object *response, int rc);
+static void dm_state_save_to_fdset(libxl__egc *egc, libxl__ev_qmp *ev, int fdset);
 static void dm_state_saved(libxl__egc *egc, libxl__ev_qmp *ev,
                            const libxl__json_object *response, int rc);
 
@@ -994,10 +995,17 @@ static void dm_stopped(libxl__egc *egc, libxl__ev_qmp *ev,
     EGC_GC;
     libxl__domain_suspend_state *dsps = CONTAINER_OF(ev, *dsps, qmp);
     const char *const filename = dsps->dm_savefile;
+    uint32_t dm_domid = libxl_get_stubdom_id(CTX, dsps->domid);
 
     if (rc)
         goto error;
 
+    if (dm_domid) {
+        /* see Linux stubdom interface in docs/stubdom.txt */
+        dm_state_save_to_fdset(egc, ev, 1);
+        return;
+    }
+
     ev->payload_fd = open(filename, O_WRONLY | O_CREAT, 0600);
     if (ev->payload_fd < 0) {
         LOGED(ERROR, ev->domid,
@@ -1028,7 +1036,6 @@ static void dm_state_fd_ready(libxl__egc *egc, libxl__ev_qmp *ev,
     EGC_GC;
     int fdset;
     const libxl__json_object *o;
-    libxl__json_object *args = NULL;
     libxl__domain_suspend_state *dsps = CONTAINER_OF(ev, *dsps, qmp);
 
     close(ev->payload_fd);
@@ -1043,6 +1050,21 @@ static void dm_state_fd_ready(libxl__egc *egc, libxl__ev_qmp *ev,
         goto error;
     }
     fdset = libxl__json_object_get_integer(o);
+    dm_state_save_to_fdset(egc, ev, fdset);
+    return;
+
+error:
+    assert(rc);
+    libxl__remove_file(gc, dsps->dm_savefile);
+    dsps->callback_device_model_done(egc, dsps, rc);
+}
+
+static void dm_state_save_to_fdset(libxl__egc *egc, libxl__ev_qmp *ev, int fdset)
+{
+    EGC_GC;
+    int rc;
+    libxl__json_object *args = NULL;
+    libxl__domain_suspend_state *dsps = CONTAINER_OF(ev, *dsps, qmp);
 
     ev->callback = dm_state_saved;
 
@@ -1060,7 +1082,8 @@ static void dm_state_fd_ready(libxl__egc *egc, libxl__ev_qmp *ev,
 
 error:
     assert(rc);
-    libxl__remove_file(gc, dsps->dm_savefile);
+    if (!libxl_get_stubdom_id(CTX, dsps->domid))
+        libxl__remove_file(gc, dsps->dm_savefile);
     dsps->callback_device_model_done(egc, dsps, rc);
 }
 
-- 
2.20.1


