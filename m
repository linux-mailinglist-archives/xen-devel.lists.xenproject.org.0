Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3286A1D6E7A
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:15:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUNM-0000HB-6E; Mon, 18 May 2020 01:15:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUNK-0000Ga-Sc
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:15:26 +0000
X-Inumbo-ID: 00682200-98a5-11ea-b07b-bc764e2007e4
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00682200-98a5-11ea-b07b-bc764e2007e4;
 Mon, 18 May 2020 01:15:03 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id dh1so98257qvb.13
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yf2qnzYuPc74VoW0YKV2ithZ/xphv7gmcP5v/+l3iQ4=;
 b=KOHoVa50/UtC/CAtbj0849ENHoVAFfMHEV1l42yEKy1v3NaFnlVMQq+lm29to+PbfH
 v9icKYK9XomLzwQS3JcPFh3cIzt179r3fAWsmq9IJZKbte7S9LDDnD2CYiHj+yQcvG6m
 BgDDNhy1fsPIDTZY2qE6GQURttaagMhR4reexRtYNP9kVq2cPWXUbo+uXa47JwtYIe16
 5uZrFlD2woXK9PfOA/+YtrQDGxdNHOTDY0zfwq3mpMuAbn6+IcO0onEW8rS7tNdRZm6t
 vpDl4WqDun8gKi5spPTtLrVI3efY5pKhpK8P/1mA8cgI9o7laVcNP596RlPGbxjG8yca
 452w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yf2qnzYuPc74VoW0YKV2ithZ/xphv7gmcP5v/+l3iQ4=;
 b=c71lneqMGHnoSi0k9OsNyTV0MPbajpvfg0Ix8iYkMs51R1ubtt0NIgCQcyXQe/b0QP
 WhpprUVDQwhjFu4Mz8G/jUb8bTBUi5In1bQ2AM4F4jLVy1LPcfU/KnC1T1SZNsoipRJ/
 zOkwuz3qrJ2rwutsChQmp1QmkNHUW9OkE9YPsA3J4h6jVUjYcmwVYtb2YKc10BV3LW7l
 6ZnNjvbNvpL4o3jNToUBTLLA+U0Xc0KOLDRQ2nitAwu2dM+EtRvT6wgBiFqDlB8Z65kR
 8Glqt/xtuBUmZOUx2gALIxklYa88BSIAMgLzH39qK9ffqtEXIZogAUktBw54O9vcQVkw
 cQOg==
X-Gm-Message-State: AOAM531SWBbSTQuhlSsg7EwLtRIrOIgLXp3w59V21fNOP24ZEl2NVxEU
 AGbhTVP8YriTWvIi2OWgBNscQ3TL
X-Google-Smtp-Source: ABdhPJxH9LGGKMjjgcrRHtlij2/ia7N6HrfDzZLI0FwdCEyudApg4MP186774dBIFdggW47RIC5pVg==
X-Received: by 2002:ad4:4b01:: with SMTP id r1mr13499333qvw.38.1589764502578; 
 Sun, 17 May 2020 18:15:02 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:15:01 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 09/18] libxl: add save/restore support for qemu-xen in
 stubdomain
Date: Sun, 17 May 2020 21:13:44 -0400
Message-Id: <20200518011353.326287-10-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200518011353.326287-1-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
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
---
Changes in v3:
 - adjust for qmp_ev*
 - assume specific fdset id in qemu set in stubdomain
Changes in v5:
 - Only remove savefile for non-stubdom
Chanres in v6:
 - Replace hardcoded fd:3 with placeholder $STUBDOM_RESTORE_INCOMING_ARG
---
 tools/libxl/libxl_dm.c  | 25 +++++++++++++------------
 tools/libxl/libxl_qmp.c | 27 +++++++++++++++++++++++++--
 2 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index eaed6e8ee7..a4f8866d33 100644
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
@@ -2236,14 +2245,6 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
 
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


