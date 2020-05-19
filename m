Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 025811D8D60
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:56:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarUl-0000Ut-3N; Tue, 19 May 2020 01:56:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarUj-0000U6-Mf
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:56:37 +0000
X-Inumbo-ID: e8bc7762-9973-11ea-b9cf-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8bc7762-9973-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 01:56:09 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id ee19so5764152qvb.11
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DwiumbG1d5HPUMbypCrL3Y7aDy+PWG/BBSK4eFZuL7c=;
 b=HP50HwP5r9rPIbd3fqfL3tTThoVI/3hE8NBtNP1oUlu9aflUHXGpge2DVqiibaFKWY
 PAKCUtOmAiOx7Oyr0ni4tcYHlhmGUrfZ3h3JDCMH7/pRVT/1bBHQlmc2q+NtPQw/vWZw
 W+TjANEOrODFwC8Ty8aKslnz3Yt/2zDl+Wp4mUhje0M+zxpRMD27PodPG8S4ewgKYnu3
 vp5B2t2pBpVM88iC37oLAtOUGZ0PsU9i+xsqnbEs9X6ewakdGa8rj8/SjA3y+itZBSO6
 pxQzDFdd7LoZpwuybt3xNfaQK0LsR2Ff3+rtCU1PjRSfMFAOIWxPDr4UrkVD/vtE5mUH
 CM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DwiumbG1d5HPUMbypCrL3Y7aDy+PWG/BBSK4eFZuL7c=;
 b=li/wTvxNTaQwC/09qaykXKVTOn1ZAjJEc0pw5v9VNy/uti0qz/xujE0SgPRm3tuhmd
 e1uFI98XAPtVgelRQ0W/iuAVWR6P0vRxcRQ8CQGc8VR3iLtBIT4M5eusW5Wl9HbSmiJF
 Ec//14oOgrM/yFL9RPWnxj1fhWeXVMqeB4xmuSZwgm94iiBpK4OLVvlIgHM4lViqFbOT
 CENjJLDNUari/kqL+X6kv4py60ROCwAh4mqt92druz8a83X84AjbaB2W2V52Ag8sc42R
 J0YPKIdHsx+tgAnsmwSQX3IgwvY6Qi7gUB6IjtPvcXWq38skLtSwTgleYAxwfmjo8v39
 Vmpw==
X-Gm-Message-State: AOAM530Wz7jX191vnzORfu5/xZwL+deJ4oqBBKOcjQW6268JSbjNRCLI
 L0y160BR0RlvWhD7lFvHQ8SDj1DQ
X-Google-Smtp-Source: ABdhPJyGiSspDHrCA+s+ebMsuUXIQo8PhwHiSDhkYeC6N9s5pn5WX8CTsITCm8K3oroBjBUfaU3LsA==
X-Received: by 2002:a0c:e403:: with SMTP id o3mr17895876qvl.24.1589853368702; 
 Mon, 18 May 2020 18:56:08 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:56:07 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 10/19] libxl: add save/restore support for qemu-xen in
 stubdomain
Date: Mon, 18 May 2020 21:54:54 -0400
Message-Id: <20200519015503.115236-11-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519015503.115236-1-jandryuk@gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
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
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Rely on a wrapper script in stubdomain to attach relevant consoles to
qemu.  The save console (1) must be attached to fdset/1.  When
performing a restore, $STUBDOM_RESTORE_INCOMING_ARG must be replaced on
the qemu command line by "fd:$FD", where $FD is an open file descriptor
number to the restore console (2).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Address TODO in dm_state_save_to_fdset: Only remove savefile for
non-stubdom.
Use $STUBDOM_RESTORE_INCOMING_ARG instead of fd:3 and update commit
message.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
Changes in v3:
 - adjust for qmp_ev*
 - assume specific fdset id in qemu set in stubdomain
Changes in v5:
 - Only remove savefile for non-stubdom
Changes in v6:
 - Replace hardcoded fd:3 with placeholder $STUBDOM_RESTORE_INCOMING_ARG
Changes in v7
 - Added Acked-by: Ian Jackson
---
 tools/libxl/libxl_dm.c  | 25 +++++++++++++------------
 tools/libxl/libxl_qmp.c | 27 +++++++++++++++++++++++++--
 2 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index 23b13f84d2..62d0d46c98 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -1745,10 +1745,19 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     }
 
     if (state->saved_state) {
-        /* This file descriptor is meant to be used by QEMU */
-        *dm_state_fd = open(state->saved_state, O_RDONLY);
-        flexarray_append(dm_args, "-incoming");
-        flexarray_append(dm_args, GCSPRINTF("fd:%d",*dm_state_fd));
+        if (is_stubdom) {
+            /* Linux stubdomain must replace $STUBDOM_RESTORE_INCOMING_ARG
+             * with the approriate fd:$num argument for the
+             * STUBDOM_CONSOLE_RESTORE console 2.
+             */
+            flexarray_append(dm_args, "-incoming");
+            flexarray_append(dm_args, "$STUBDOM_RESTORE_INCOMING_ARG");
+        } else {
+            /* This file descriptor is meant to be used by QEMU */
+            *dm_state_fd = open(state->saved_state, O_RDONLY);
+            flexarray_append(dm_args, "-incoming");
+            flexarray_append(dm_args, GCSPRINTF("fd:%d",*dm_state_fd));
+        }
     }
     for (i = 0; b_info->extra && b_info->extra[i] != NULL; i++)
         flexarray_append(dm_args, b_info->extra[i]);
@@ -2227,14 +2236,6 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
 
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
2.25.1


