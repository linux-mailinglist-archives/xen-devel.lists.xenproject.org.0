Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F2D828AAE
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 18:06:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664811.1034956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNFYC-00014Y-DX; Tue, 09 Jan 2024 17:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664811.1034956; Tue, 09 Jan 2024 17:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNFYC-00011Y-A2; Tue, 09 Jan 2024 17:06:04 +0000
Received: by outflank-mailman (input) for mailman id 664811;
 Tue, 09 Jan 2024 17:06:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qgrd=IT=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rNFYA-0000WK-Ke
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 17:06:02 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d931243-af11-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 18:06:02 +0100 (CET)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-783148737d5so280612985a.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 09:06:02 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 dt15-20020a05620a478f00b0077f435ed844sm938738qkb.112.2024.01.09.09.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 09:05:59 -0800 (PST)
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
X-Inumbo-ID: 5d931243-af11-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704819960; x=1705424760; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIN7rMO1wIab7x2KrwJzoPsPT457jdlwAxClxkQIv+k=;
        b=GdXY+HpvpGRoEF2LH1T8znr/t0uW/XBRjJxI9e/9tF3ehmqfOL7ikN0VU7HyTVe33V
         4T45VczWkGorx76sfNhEeEd2KSlMX0h0AqRWdSrkYv0lqtsCG2jPMSyMshz6iZiJ8FzU
         gZZFZbH3K71g03cOnDdxpXF0/1lIKST0IEP3U1VkSrQ683/F2QbitwtIwdE1HvXTa4ln
         qIgdspRGenyWm74nUrRdLCuHBjR2hjkDyUq7SOoQONpU4MXwAiLk2BgG9E8GwsddHo4I
         FtDRw84vvkR6CkSYCgHwPzabaIvz99j07nQKVic0IYV2BElRi4X/hawXq8GkATNd3V41
         dozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704819960; x=1705424760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIN7rMO1wIab7x2KrwJzoPsPT457jdlwAxClxkQIv+k=;
        b=luQe10DOAgULjq3cx/bFEZhAFod1fjPf9NpCZWDE2WIfRDx21KSh+/YPhnAW2ZuMWN
         WZOBS70c4Szl9qXcYykPsZ1dvXjrbTHoWIxl0IfrCYywoHojUUpoeM7ibyaPvBop+Aaa
         hFJ+9I4jeNA1AX4PipSMW3HZ/OKPMy9NWVr7zo9SzguqWlJAngeBKfWaxecpDKlc4vjx
         +RjabrRn5mNets9O8zCFu3Ja6ex6qfHOog8xGe7NQPR8Y4P1v9uBW4H+KtSCMHxUkZ+0
         kaVcdgho1wgmgHaz3vsWKtj6Mc88OvAlPeKeUb9f0LuPJrwAubL8//1TMcmdZwgG0L/p
         E/JQ==
X-Gm-Message-State: AOJu0YwCvlwxX69wstiU+QV4hmy3AEYlsIPUg9lHvvpn7EP2CaHVSzME
	iBhAtepDzgKDDeSYh3XKZU3JEyKoDwo=
X-Google-Smtp-Source: AGHT+IFxFFzCqYIekU3jfQxBe9r4oxI7ch8Bp4XTK4ZJZM+MFX8KdB15/s4ECXqdbjYHLLqXWIfMZg==
X-Received: by 2002:a05:620a:5601:b0:783:2e71:d49d with SMTP id vu1-20020a05620a560100b007832e71d49dmr1126662qkn.93.1704819960469;
        Tue, 09 Jan 2024 09:06:00 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] libxl: devd: Spawn QEMU for 9pfs
Date: Tue,  9 Jan 2024 12:05:40 -0500
Message-ID: <20240109170540.38239-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109170540.38239-1-jandryuk@gmail.com>
References: <20240109170540.38239-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for xl devd to support 9pfs in a domU.  devd need to spawn a
pvqemu for the domain to service 9pfs as well as qdisk backends.  Rename
num_qdisks to pvqemu_refcnt to be more generic.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_device.c   | 22 ++++++++++++----------
 tools/libs/light/libxl_dm.c       | 11 ++++++-----
 tools/libs/light/libxl_internal.h |  4 ++--
 3 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index ae2b71b0bf..eb76d3a486 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -1517,12 +1517,12 @@ static void device_complete(libxl__egc *egc, libxl__ao_device *aodev)
     libxl__nested_ao_free(aodev->ao);
 }
 
-static void qdisk_spawn_outcome(libxl__egc *egc, libxl__dm_spawn_state *dmss,
-                                int rc)
+static void qemu_xenpv_spawn_outcome(libxl__egc *egc,
+                                     libxl__dm_spawn_state *dmss, int rc)
 {
     STATE_AO_GC(dmss->spawn.ao);
 
-    LOGD(DEBUG, dmss->guest_domid, "qdisk backend spawn %s",
+    LOGD(DEBUG, dmss->guest_domid, "qemu xenpv backend spawn %s",
                 rc ? "failed" : "succeed");
 
     libxl__nested_ao_free(dmss->spawn.ao);
@@ -1545,7 +1545,7 @@ typedef struct libxl__ddomain_device {
  */
 typedef struct libxl__ddomain_guest {
     uint32_t domid;
-    int num_qdisks;
+    int pvqemu_refcnt;
     XEN_SLIST_HEAD(, struct libxl__ddomain_device) devices;
     XEN_SLIST_ENTRY(struct libxl__ddomain_guest) next;
 } libxl__ddomain_guest;
@@ -1639,15 +1639,16 @@ static int add_device(libxl__egc *egc, libxl__ao *ao,
 
     switch(dev->backend_kind) {
     case LIBXL__DEVICE_KIND_QDISK:
-        if (dguest->num_qdisks == 0) {
+    case LIBXL__DEVICE_KIND_9PFS:
+        if (dguest->pvqemu_refcnt == 0) {
             GCNEW(dmss);
             dmss->guest_domid = dev->domid;
             dmss->spawn.ao = ao;
-            dmss->callback = qdisk_spawn_outcome;
+            dmss->callback = qemu_xenpv_spawn_outcome;
 
-            libxl__spawn_qdisk_backend(egc, dmss);
+            libxl__spawn_qemu_xenpv_backend(egc, dmss);
         }
-        dguest->num_qdisks++;
+        dguest->pvqemu_refcnt++;
         break;
     default:
         GCNEW(aodev);
@@ -1678,8 +1679,9 @@ static int remove_device(libxl__egc *egc, libxl__ao *ao,
 
     switch(ddev->dev->backend_kind) {
     case LIBXL__DEVICE_KIND_QDISK:
-        if (--dguest->num_qdisks == 0) {
-            rc = libxl__destroy_qdisk_backend(gc, dev->domid);
+    case LIBXL__DEVICE_KIND_9PFS:
+        if (--dguest->pvqemu_refcnt == 0) {
+            rc = libxl__destroy_qemu_xenpv_backend(gc, dev->domid);
             if (rc)
                 goto out;
         }
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 6ef16ad2a0..5343ebd4dc 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -3370,7 +3370,8 @@ static void device_model_postconfig_done(libxl__egc *egc,
     dmss->callback(egc, dmss, rc);
 }
 
-void libxl__spawn_qdisk_backend(libxl__egc *egc, libxl__dm_spawn_state *dmss)
+void libxl__spawn_qemu_xenpv_backend(libxl__egc *egc,
+                                     libxl__dm_spawn_state *dmss)
 {
     STATE_AO_GC(dmss->spawn.ao);
     flexarray_t *dm_args, *dm_envs;
@@ -3403,7 +3404,7 @@ void libxl__spawn_qdisk_backend(libxl__egc *egc, libxl__dm_spawn_state *dmss)
     libxl__set_qemu_env_for_xsa_180(gc, dm_envs);
     envs = (char **) flexarray_contents(dm_envs);
 
-    logfile_w = libxl__create_qemu_logfile(gc, GCSPRINTF("qdisk-%u", domid));
+    logfile_w = libxl__create_qemu_logfile(gc, GCSPRINTF("qemu-xenpv-%u", domid));
     if (logfile_w < 0) {
         rc = logfile_w;
         goto out;
@@ -3430,7 +3431,7 @@ void libxl__spawn_qdisk_backend(libxl__egc *egc, libxl__dm_spawn_state *dmss)
      * because we will call this from unprivileged driver domains,
      * so save it in the current domain libxl private dir.
      */
-    dmss->spawn.pidpath = GCSPRINTF("libxl/%u/qdisk-backend-pid", domid);
+    dmss->spawn.pidpath = GCSPRINTF("libxl/%u/qemu-xenpv-backend-pid", domid);
     dmss->spawn.midproc_cb = libxl__spawn_record_pid;
     dmss->spawn.confirm_cb = device_model_confirm;
     dmss->spawn.failure_cb = device_model_startup_failed;
@@ -3460,12 +3461,12 @@ static int kill_device_model(libxl__gc *gc, const char *xs_path_pid)
 }
 
 /* Helper to destroy a Qdisk backend */
-int libxl__destroy_qdisk_backend(libxl__gc *gc, uint32_t domid)
+int libxl__destroy_qemu_xenpv_backend(libxl__gc *gc, uint32_t domid)
 {
     char *pid_path;
     int rc;
 
-    pid_path = GCSPRINTF("libxl/%u/qdisk-backend-pid", domid);
+    pid_path = GCSPRINTF("libxl/%u/qemu-xenpv-backend-pid", domid);
 
     rc = kill_device_model(gc, pid_path);
     if (rc)
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index d5732d1c37..b9e4661129 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4195,9 +4195,9 @@ _hidden char *libxl__stub_dm_name(libxl__gc *gc, const char * guest_name);
 
 /* Qdisk backend launch helpers */
 
-_hidden void libxl__spawn_qdisk_backend(libxl__egc *egc,
+_hidden void libxl__spawn_qemu_xenpv_backend(libxl__egc *egc,
                                         libxl__dm_spawn_state *dmss);
-_hidden int libxl__destroy_qdisk_backend(libxl__gc *gc, uint32_t domid);
+_hidden int libxl__destroy_qemu_xenpv_backend(libxl__gc *gc, uint32_t domid);
 
 /*----- Domain creation -----*/
 
-- 
2.43.0


