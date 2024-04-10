Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0BF89F114
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 13:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703048.1098863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruWMl-0003nh-NE; Wed, 10 Apr 2024 11:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703048.1098863; Wed, 10 Apr 2024 11:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruWMl-0003kY-HP; Wed, 10 Apr 2024 11:43:47 +0000
Received: by outflank-mailman (input) for mailman id 703048;
 Wed, 10 Apr 2024 11:43:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rpn4=LP=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1ruWMj-0003jg-UJ
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 11:43:45 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94dcd558-f72f-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 13:43:42 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-516d536f6f2so5502176e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 04:43:42 -0700 (PDT)
Received: from localhost.localdomain (adsl-125.109.242.226.tellas.gr.
 [109.242.226.125]) by smtp.gmail.com with ESMTPSA id
 a20-20020a05600c349400b00416a7313deasm1622874wmq.4.2024.04.10.04.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 04:43:41 -0700 (PDT)
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
X-Inumbo-ID: 94dcd558-f72f-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712749422; x=1713354222; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30QgisvmYFSN9sJ9N9ya959fCAYBnhZkkLkxzE/5MPo=;
        b=dNmQDbqR/u7QQuz8XOmtBiYVVo+sQBzYAsaMCslLxG06neU88pxNATocQXWndqXowz
         KwEcFTeggRSquqiHP/uIabTek85XxDLfG+HHVLCs7EjObWaqt0vhGtI6stNxxrhq5d0y
         h2S2I6RgxQifLhZkVpLsaTp3HRDP1qU+cAOUNvHHjKSxgpJSJZ+dNBaSZL4JCeYxZwj2
         q8I29wKi1SYXqN6aM5m35iQA4Ern4GOWVfYjqxRAX1qosP28n1vyCpszDcoqaawQ1Ctb
         m190ePTXN8bd2qXYvQUvz0PipqbpZF7DLGvyfuLAjcROLnsorxJQPp3SwsZnAZ2BjGvP
         5YQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712749422; x=1713354222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30QgisvmYFSN9sJ9N9ya959fCAYBnhZkkLkxzE/5MPo=;
        b=JZy5qWKY7naxRqoSvr644uIGuQY6wCsOuY4QTjMGwTVG9RcMsorQe+zncnWGRxoZkT
         8U/bCj8fKgwgei1yb8sJUGB/metIg6Bi95i1K2AJip5RSlFrKGDHAgkH99R6oXlWKAfL
         fbmmI1LXWJ8SyVbFfkemcLIOPcv28fuoiZskw2MWxeRbjtf5P/IJ5sdkeeK75TJr9e5A
         Ra9+ukRx8+aFaIBSOQdCHFHqTTQy2ShDcoJN/WyozoKFJjvhuHg4qDFAjjSnTGZMlrKJ
         SDCcxUaNpTK+IYPm7uykuR5+Qc2UBdeVHR4jkd3VHQh3ZNdiJLPt0uqoK2dEHpfPCkoj
         BgOw==
X-Gm-Message-State: AOJu0YzZ/7gGcbsVk4/CdVvBnTFWGQX/R/8U8WqzTBuxd4FnDFuZXoRe
	o7/3dAlv4/bENM7g/UEPQZmmkNE0bEaWC7BpsnOxelaGqByi6upQJYbpTNnohtt4FbaPw6NRiZW
	I
X-Google-Smtp-Source: AGHT+IE20KzbMtODb8+bNw8FvlxwWB0TqrVoVzdK6c4JfiuP/AKDBh95JYCmXDDqLRdH4oCyP4D0EA==
X-Received: by 2002:a19:f706:0:b0:513:c95c:4dc4 with SMTP id z6-20020a19f706000000b00513c95c4dc4mr1362819lfe.7.1712749422025;
        Wed, 10 Apr 2024 04:43:42 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH v1 1/2] libs/light: add device model start timeout env var
Date: Wed, 10 Apr 2024 14:43:14 +0300
Message-Id: <334b5a46e31dbf3e8114e9ea8bafd92cf060f2af.1712748711.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712748711.git.manos.pitsidianakis@linaro.org>
References: <cover.1712748711.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit

When debugging QEMU, the need to run it under Valgrind and asan meant
the compile-time define LIBXL_DEVICE_MODEL_START_TIMEOUT must be changed
to allow for `xl` to wait longer while the instrumented QEMU
initializes.

This commit adds support for reading the environment variable
LIBXL_DEVICE_MODEL_START_TIMEOUT to configure the timeout value and
otherwise fall back to the default 60.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 docs/man/xl.1.pod.in                 | 11 +++++++++++
 tools/libs/light/libxl_9pfs.c        |  2 +-
 tools/libs/light/libxl_device.c      |  2 +-
 tools/libs/light/libxl_dm.c          |  6 +++---
 tools/libs/light/libxl_dom_suspend.c |  2 +-
 tools/libs/light/libxl_internal.h    |  6 ++++++
 tools/libs/light/libxl_pci.c         |  6 +++---
 7 files changed, 26 insertions(+), 9 deletions(-)

diff --git docs/man/xl.1.pod.in docs/man/xl.1.pod.in
index bed8393473..c159877094 100644
--- docs/man/xl.1.pod.in
+++ docs/man/xl.1.pod.in
@@ -1993,6 +1993,17 @@ Otherwise the build time default in LIBXL_BOOTLOADER_TIMEOUT will be used.
 If defined the value must be an unsigned integer between 0 and INT_MAX,
 otherwise behavior is undefined.  Setting to 0 disables the timeout.
 
+=item LIBXL_DEVICE_MODEL_START_TIMEOUT
+
+Timeout in seconds for starting the device model process. Useful in case the
+device model takes an unusual amount of time to start— for example in case of
+very slow I/O, in case of slow performance due to memory sanitizer usage, etc.
+
+If undefined, the default hard-coded value of 60 seconds is used.
+
+If defined, the value must be an unsigned integer between 0 and INT_MAX,
+otherwise behaviour is undefined.  Setting the value to 0 disables the timeout.
+
 =back
 
 =head1 SEE ALSO
diff --git tools/libs/light/libxl_9pfs.c tools/libs/light/libxl_9pfs.c
index 48f894f070..950a464b45 100644
--- tools/libs/light/libxl_9pfs.c
+++ tools/libs/light/libxl_9pfs.c
@@ -132,7 +132,7 @@ static int xen9pfsd_spawn(libxl__egc *egc, uint32_t domid, libxl_device_p9 *p9,
     aop9->spawn.ao = aodev->ao;
     aop9->spawn.what = "xen-9pfs daemon";
     aop9->spawn.xspath = GCSPRINTF("%s/state", path);
-    aop9->spawn.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
+    aop9->spawn.timeout_ms = __libxl_device_model_start_timeout() * 1000;
     aop9->spawn.pidpath = GCSPRINTF("%s/pid", path);
     aop9->spawn.midproc_cb = libxl__spawn_record_pid;
     aop9->spawn.confirm_cb = xen9pfsd_confirm;
diff --git tools/libs/light/libxl_device.c tools/libs/light/libxl_device.c
index 6f0100d05e..452e55ba23 100644
--- tools/libs/light/libxl_device.c
+++ tools/libs/light/libxl_device.c
@@ -1436,7 +1436,7 @@ int libxl__wait_for_device_model_deprecated(libxl__gc *gc,
 
     path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
     return libxl__xenstore_child_wait_deprecated(gc, domid,
-                                     LIBXL_DEVICE_MODEL_START_TIMEOUT,
+                                     __libxl_device_model_start_timeout(),
                                      "Device Model", path, state, spawning,
                                      check_callback, check_callback_userdata);
 }
diff --git tools/libs/light/libxl_dm.c tools/libs/light/libxl_dm.c
index 0b03a7c747..4369fef161 100644
--- tools/libs/light/libxl_dm.c
+++ tools/libs/light/libxl_dm.c
@@ -2629,7 +2629,7 @@ static void spawn_qmp_proxy(libxl__egc *egc,
     sdss->qmp_proxy_spawn.pidpath = GCSPRINTF("%s/image/qmp-proxy-pid", dom_path);
     sdss->qmp_proxy_spawn.xspath = DEVICE_MODEL_XS_PATH(gc, LIBXL_TOOLSTACK_DOMID,
                                                         dm_domid, "/qmp-proxy-state");
-    sdss->qmp_proxy_spawn.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
+    sdss->qmp_proxy_spawn.timeout_ms = __libxl_device_model_start_timeout() * 1000;
     sdss->qmp_proxy_spawn.midproc_cb = libxl__spawn_record_pid;
     sdss->qmp_proxy_spawn.confirm_cb = qmp_proxy_confirm;
     sdss->qmp_proxy_spawn.failure_cb = qmp_proxy_startup_failed;
@@ -3011,7 +3011,7 @@ retry_transaction:
     spawn->what = GCSPRINTF("domain %d device model", domid);
     spawn->xspath = DEVICE_MODEL_XS_PATH(gc, LIBXL_TOOLSTACK_DOMID, domid,
                                          "/state");
-    spawn->timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
+    spawn->timeout_ms = __libxl_device_model_start_timeout() * 1000;
     spawn->pidpath = GCSPRINTF("%s/image/device-model-pid", dom_path);
     spawn->midproc_cb = libxl__spawn_record_pid;
     spawn->confirm_cb = device_model_confirm;
@@ -3435,7 +3435,7 @@ void libxl__spawn_qdisk_backend(libxl__egc *egc, libxl__dm_spawn_state *dmss)
 
     dmss->spawn.what = GCSPRINTF("domain %u Qdisk backend", domid);
     dmss->spawn.xspath = GCSPRINTF("device-model/%u/state", domid);
-    dmss->spawn.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
+    dmss->spawn.timeout_ms = __libxl_device_model_start_timeout() * 1000;
     /*
      * We cannot save Qemu pid anywhere in the xenstore guest dir,
      * because we will call this from unprivileged driver domains,
diff --git tools/libs/light/libxl_dom_suspend.c tools/libs/light/libxl_dom_suspend.c
index 6091a5f3f6..29e51f6c40 100644
--- tools/libs/light/libxl_dom_suspend.c
+++ tools/libs/light/libxl_dom_suspend.c
@@ -517,7 +517,7 @@ void libxl__dm_resume(libxl__egc *egc,
     rc = libxl__ev_time_register_rel(dmrs->ao,
                                      &dmrs->time,
                                      dm_resume_timeout,
-                                     LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000);
+                                     __libxl_device_model_start_timeout() * 1000);
     if (rc) goto out;
 
     switch (libxl__device_model_version_running(gc, domid)) {
diff --git tools/libs/light/libxl_internal.h tools/libs/light/libxl_internal.h
index 803dbc1a03..684390f822 100644
--- tools/libs/light/libxl_internal.h
+++ tools/libs/light/libxl_internal.h
@@ -97,6 +97,12 @@
 /* QEMU may be slow to load and start due to a bug in Linux where the I/O
  * subsystem sometime produce high latency under load. */
 #define LIBXL_DEVICE_MODEL_START_TIMEOUT 60
+static inline int __libxl_device_model_start_timeout(void)
+{
+  const char *timeout_env = getenv("LIBXL_DEVICE_MODEL_START_TIMEOUT");
+  return timeout_env ? atoi(timeout_env)
+    : LIBXL_DEVICE_MODEL_START_TIMEOUT;
+}
 #define LIBXL_DEVICE_MODEL_SAVE_FILE XEN_LIB_DIR "/qemu-save" /* .$domid */
 #define LIBXL_DEVICE_MODEL_RESTORE_FILE XEN_LIB_DIR "/qemu-resume" /* .$domid */
 #define LIBXL_QMP_CMD_TIMEOUT 10
diff --git tools/libs/light/libxl_pci.c tools/libs/light/libxl_pci.c
index 96cb4da079..7bdd9f6c3b 100644
--- tools/libs/light/libxl_pci.c
+++ tools/libs/light/libxl_pci.c
@@ -1157,7 +1157,7 @@ static void do_pci_add(libxl__egc *egc,
                 pas->xswait.what = "Device Model";
                 pas->xswait.path = DEVICE_MODEL_XS_PATH(gc,
                     libxl_get_stubdom_id(CTX, domid), domid, "/state");
-                pas->xswait.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
+                pas->xswait.timeout_ms = __libxl_device_model_start_timeout() * 1000;
                 pas->xswait.callback = pci_add_qemu_trad_watch_state_cb;
                 rc = libxl__xswait_start(gc, &pas->xswait);
                 if (rc) goto out;
@@ -1719,7 +1719,7 @@ static void device_pci_add_stubdom_wait(libxl__egc *egc,
     rc = libxl__ev_devstate_wait(ao, &pas->pciback_ds,
             device_pci_add_stubdom_ready,
             state_path, XenbusStateConnected,
-            LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000);
+            __libxl_device_model_start_timeout() * 1000);
     if (rc) goto out;
     return;
 out:
@@ -1976,7 +1976,7 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
             prs->xswait.what = "Device Model";
             prs->xswait.path = DEVICE_MODEL_XS_PATH(gc,
                 libxl_get_stubdom_id(CTX, domid), domid, "/state");
-            prs->xswait.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
+            prs->xswait.timeout_ms = __libxl_device_model_start_timeout() * 1000;
             prs->xswait.callback = pci_remove_qemu_trad_watch_state_cb;
             rc = libxl__xswait_start(gc, &prs->xswait);
             if (rc) goto out_fail;
-- 
γαῖα πυρί μιχθήτω


