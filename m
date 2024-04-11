Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507BB8A149D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 14:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703893.1099838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rutY3-0006KL-V1; Thu, 11 Apr 2024 12:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703893.1099838; Thu, 11 Apr 2024 12:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rutY3-0006Il-SG; Thu, 11 Apr 2024 12:28:59 +0000
Received: by outflank-mailman (input) for mailman id 703893;
 Thu, 11 Apr 2024 12:28:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVMu=LQ=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1rutY2-0005wZ-DP
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 12:28:58 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10985f41-f7ff-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 14:28:56 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-417d42dd5a4so4418575e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 05:28:56 -0700 (PDT)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 k9-20020a05600c1c8900b00416c1e7c9e7sm2212992wms.2.2024.04.11.05.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 05:28:55 -0700 (PDT)
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
X-Inumbo-ID: 10985f41-f7ff-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712838535; x=1713443335; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5R8+TAttLnmvCBoXL/OpLvWYXKsyqMK3wsyQqa2P/E=;
        b=S503Zfb0b4FbwtULMO9mHj4e84XoueimoRvk9WJPTdJZwZtcQSdQjdOO9oEPb8NfrB
         VVWVWw52OWfqYSeX2JTJU8LJ2I0WKHNaO7iZlGVKx/6nhPKVEvPxkfLsK/uDLRLEWDiH
         vX+y8K1O6BAIjNdPOUVIHOMLIRMMaZWuDSJhmoJnH9LTGYI0oQmUZmDfdWQq6omENKrf
         +XYDE/Oyv7djN82Y/zvbUeqt9OPudmSKqBzKS/o/NhVoJPDg6wBqHKKt/4xOspw6R1c+
         HUW1ivKXwhyIBlKGxelBejiz5flhrbC/064nF8WrQPGdP9Ks2yQ4Vs0gQDVYmUXExJvI
         0WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712838535; x=1713443335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5R8+TAttLnmvCBoXL/OpLvWYXKsyqMK3wsyQqa2P/E=;
        b=NWuA4L7GW+yTng4akd9Wf4Fqh3q04Vctjz50Z7l971aHqypnxyHCrQWruAaJxbH4VR
         XbJTwOOlSoRnKy3AfFS06Cs9j1/Zx2jPL57DlsW870CZs0u0aZhTUcQyOtxE+exNdFzD
         LRT+n56dNvQ20GzC/S6qjGOgahLYnu6pPhGTPCwUu+L3AXOUeXsfAlFtJD/wk8VLSePz
         PCF1aDOYbIHTy5d5jDI1DhtGPYXNslDIop3Ddo29BBfz0bRrSv8HAAqtJWd5YdcR1ATl
         aHoeKknU418lXI/VBlGsvZXwwgENLfyOKPe5wmlgNpJC5WUwOOZDkFNfeXQmU/juKkqz
         Ncrw==
X-Gm-Message-State: AOJu0YzZXSd1pdzIVUmKm9LnzwhEoTbnBwfGM3uowva94utR0+pp0Qk5
	orGBfV2hAJct+6rVkn4d7uwiX+w0BX5+UptSEr4sHAN4qX8jdLhdPS4gn/PQlXqsYoY/HeECjsT
	L
X-Google-Smtp-Source: AGHT+IF4STdq4T8yRpLdKvkWjUp9nGZmWWvtct3mo56/QYhy5llx/4/QTB7ilqAF6L9cOKCergTsow==
X-Received: by 2002:a05:600c:3585:b0:416:bbf7:f18a with SMTP id p5-20020a05600c358500b00416bbf7f18amr4151152wmq.28.1712838535605;
        Thu, 11 Apr 2024 05:28:55 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH v2 1/2] libs/light: add device model start timeout env var
Date: Thu, 11 Apr 2024 15:28:19 +0300
Message-ID: <334b5a46e31dbf3e8114e9ea8bafd92cf060f2af.1712837961.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1712837961.git.manos.pitsidianakis@linaro.org>
References: <cover.1712837961.git.manos.pitsidianakis@linaro.org>
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

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index bed8393473..c159877094 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
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
diff --git a/tools/libs/light/libxl_9pfs.c b/tools/libs/light/libxl_9pfs.c
index 48f894f070..950a464b45 100644
--- a/tools/libs/light/libxl_9pfs.c
+++ b/tools/libs/light/libxl_9pfs.c
@@ -132,7 +132,7 @@ static int xen9pfsd_spawn(libxl__egc *egc, uint32_t domid, libxl_device_p9 *p9,
     aop9->spawn.ao = aodev->ao;
     aop9->spawn.what = "xen-9pfs daemon";
     aop9->spawn.xspath = GCSPRINTF("%s/state", path);
-    aop9->spawn.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
+    aop9->spawn.timeout_ms = __libxl_device_model_start_timeout() * 1000;
     aop9->spawn.pidpath = GCSPRINTF("%s/pid", path);
     aop9->spawn.midproc_cb = libxl__spawn_record_pid;
     aop9->spawn.confirm_cb = xen9pfsd_confirm;
diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index 6f0100d05e..452e55ba23 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -1436,7 +1436,7 @@ int libxl__wait_for_device_model_deprecated(libxl__gc *gc,
 
     path = DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, "/state");
     return libxl__xenstore_child_wait_deprecated(gc, domid,
-                                     LIBXL_DEVICE_MODEL_START_TIMEOUT,
+                                     __libxl_device_model_start_timeout(),
                                      "Device Model", path, state, spawning,
                                      check_callback, check_callback_userdata);
 }
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 0b03a7c747..4369fef161 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
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
diff --git a/tools/libs/light/libxl_dom_suspend.c b/tools/libs/light/libxl_dom_suspend.c
index 6091a5f3f6..29e51f6c40 100644
--- a/tools/libs/light/libxl_dom_suspend.c
+++ b/tools/libs/light/libxl_dom_suspend.c
@@ -517,7 +517,7 @@ void libxl__dm_resume(libxl__egc *egc,
     rc = libxl__ev_time_register_rel(dmrs->ao,
                                      &dmrs->time,
                                      dm_resume_timeout,
-                                     LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000);
+                                     __libxl_device_model_start_timeout() * 1000);
     if (rc) goto out;
 
     switch (libxl__device_model_version_running(gc, domid)) {
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 803dbc1a03..684390f822 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
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
diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 96cb4da079..7bdd9f6c3b 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
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


