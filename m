Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 283A91BB4F3
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:06:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHVs-0000rj-3Y; Tue, 28 Apr 2020 04:06:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHVq-0000qH-2L
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:06:26 +0000
X-Inumbo-ID: 96654e22-8905-11ea-b9cf-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96654e22-8905-11ea-b9cf-bc764e2007e4;
 Tue, 28 Apr 2020 04:06:07 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id c63so20582478qke.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ROtHVehXF/HD8/78X0tTT0dK2u2H5EIad+/RrtpdTg=;
 b=P6O3nAlsgkTlkXmN+WDZpgbuwKGNNPWtCnPC3L0Hj51zAMoHm7Qn21i0IhM6nS5WOY
 RXNEZ27GuE2pkt0A8HgYn4Dmdmgnpbb/LY3HhDFAytBXp0E7mjdqc/myoL83YzxbnkFV
 yya8+Hu6eT4VZXb8fvsBb8Cfuw8nUZZyWUNJj7Nk41/gUBbFUT/ISvjrc7WLt9OsFOaj
 NUU/qubzeLQ9kazwDylwjj1dHO3dQCcolLpvGdFO8JcmwJoOxAJxpccbZXEoGmcjWNQI
 wVHToW1F5AlPqzezUkygkfSO4nl9h6x6u0FXwELLAReCrJkGhjvfK1mS2of+Tvqy1s9v
 Pb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ROtHVehXF/HD8/78X0tTT0dK2u2H5EIad+/RrtpdTg=;
 b=ch+77KcxsfkA+7HCVacSXW/YRSwbGMJAF7jwF4OgWkPplQUbipDS5q4pwF4FKTw9wP
 ZQ7HZWc8/l1reyii+Myxrp2tTgSyFvrN03VgHROGtryMXvNcMT9uwCYU375frTg0dkz9
 E3hhzo0nl0Ggtzf6nPFWyg7atY3vgw4tCx1wtF5LIi+FI0sQASJpRJOYWbXJV6KGfcU8
 5jF7tbcjl8WUoK9vPrtVymzeQL/f8fqJ88ktBKXl169ALJr6QikvfyqfYtjeAOdE060H
 7V+aKfsDXm8ntXHki3oHzMI8FR2aGMIKuOtfaFdqLVDFQDrD0wAFiens8rLgNjUS7BSl
 yzHg==
X-Gm-Message-State: AGi0PuYesVgzf/Jh4u3mix18aZeLuzfMcd20sGpiRaYiVLfOT3kBGyF+
 V6BUrg19f/V10XA7Xt9u/gVkW+8Z
X-Google-Smtp-Source: APiQypJcR19nCEvHNRTrQGfPB7p+WNgdZ1ISZps0CR6Nvzwdz9zVhohRx6RqqDgArjUAutTSgB3wMQ==
X-Received: by 2002:a37:ac18:: with SMTP id e24mr26234983qkm.234.1588046767112; 
 Mon, 27 Apr 2020 21:06:07 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:06:06 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 12/21] libxl: use vchan for QMP access with Linux stubdomain
Date: Tue, 28 Apr 2020 00:04:24 -0400
Message-Id: <20200428040433.23504-13-jandryuk@gmail.com>
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

Access to QMP of QEMU in Linux stubdomain is possible over vchan
connection. Handle the actual vchan connection in a separate process
(vchan-socket-proxy). This simplified integration with QMP (already
quite complex), but also allows preliminary filtering of (potentially
malicious) QMP input.
Since only one client can be connected to vchan server at the same time
and it is not enforced by the libxenvchan itself, additional client-side
locking is needed. It is implicitly implemented by vchan-socket-proxy,
as it handle only one connection at a time. Note that qemu supports only
one simultaneous client on a control socket anyway (but in UNIX socket
case, it enforce it server-side), so it doesn't add any extra
limitation.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Changes in v4:
 - new patch, in place of both "libxl: use vchan for QMP access ..."
Changes in v5:
 - Use device-model/%u/qmp-proxy-state xenstore path
 - Rephrase comment
---
 tools/configure.ac           |   9 ++
 tools/libxl/libxl_dm.c       | 163 +++++++++++++++++++++++++++++++++--
 tools/libxl/libxl_internal.h |   1 +
 3 files changed, 165 insertions(+), 8 deletions(-)

diff --git a/tools/configure.ac b/tools/configure.ac
index ea0272766f..1c0ed4c3b1 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -192,6 +192,15 @@ AC_SUBST(qemu_xen)
 AC_SUBST(qemu_xen_path)
 AC_SUBST(qemu_xen_systemd)
 
+AC_ARG_WITH([stubdom-qmp-proxy],
+    AC_HELP_STRING([--stubdom-qmp-proxy@<:@=PATH@:>@],
+        [Use supplied binary PATH as a QMP proxy into stubdomain]),[
+    stubdom_qmp_proxy="$withval"
+],[
+    stubdom_qmp_proxy="$bindir/vchan-socket-proxy"
+])
+AC_DEFINE_UNQUOTED([STUBDOM_QMP_PROXY_PATH], ["$stubdom_qmp_proxy"], [QMP proxy path])
+
 AC_ARG_WITH([system-seabios],
     AS_HELP_STRING([--with-system-seabios@<:@=PATH@:>@],
        [Use system supplied seabios PATH instead of building and installing
diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index 45d0dd56f5..e420c3fc7b 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -1200,7 +1200,11 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                       GCSPRINTF("%d", guest_domid), NULL);
     flexarray_append(dm_args, "-no-shutdown");
 
-    /* There is currently no way to access the QMP socket in the stubdom */
+    /*
+     * QMP access to qemu running in stubdomain is done over vchan. The
+     * stubdomain init script adds the appropriate monitor options for
+     * vchan-socket-proxy.
+     */
     if (!is_stubdom) {
         flexarray_append(dm_args, "-chardev");
         if (state->dm_monitor_fd >= 0) {
@@ -2194,6 +2198,23 @@ static void stubdom_pvqemu_unpaused(libxl__egc *egc,
 static void stubdom_xswait_cb(libxl__egc *egc, libxl__xswait_state *xswait,
                               int rc, const char *p);
 
+static void spawn_qmp_proxy(libxl__egc *egc,
+                            libxl__stub_dm_spawn_state *sdss);
+
+static void qmp_proxy_confirm(libxl__egc *egc, libxl__spawn_state *spawn,
+                              const char *xsdata);
+
+static void qmp_proxy_startup_failed(libxl__egc *egc,
+                                     libxl__spawn_state *spawn,
+                                     int rc);
+
+static void qmp_proxy_detached(libxl__egc *egc,
+                               libxl__spawn_state *spawn);
+
+static void qmp_proxy_spawn_outcome(libxl__egc *egc,
+                                    libxl__stub_dm_spawn_state *sdss,
+                                    int rc);
+
 char *libxl__stub_dm_name(libxl__gc *gc, const char *guest_name)
 {
     return GCSPRINTF("%s-dm", guest_name);
@@ -2476,24 +2497,150 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
             goto out;
     }
 
+    sdss->qmp_proxy_spawn.ao = ao;
+    if (libxl__stubdomain_is_linux(&guest_config->b_info)) {
+        spawn_qmp_proxy(egc, sdss);
+    } else {
+        qmp_proxy_spawn_outcome(egc, sdss, 0);
+    }
+
+    return;
+
+out:
+    assert(ret);
+    qmp_proxy_spawn_outcome(egc, sdss, ret);
+}
+
+static void spawn_qmp_proxy(libxl__egc *egc,
+                            libxl__stub_dm_spawn_state *sdss)
+{
+    STATE_AO_GC(sdss->qmp_proxy_spawn.ao);
+    const uint32_t guest_domid = sdss->dm.guest_domid;
+    const uint32_t dm_domid = sdss->pvqemu.guest_domid;
+    const char *dom_path = libxl__xs_get_dompath(gc, dm_domid);
+    char **args;
+    int nr = 0;
+    int rc, logfile_w, null;
+
+    if (access(STUBDOM_QMP_PROXY_PATH, X_OK) < 0) {
+        LOGED(ERROR, guest_domid, "qmp proxy %s is not executable", STUBDOM_QMP_PROXY_PATH);
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    sdss->qmp_proxy_spawn.what = GCSPRINTF("domain %d device model qmp proxy", guest_domid);
+    sdss->qmp_proxy_spawn.pidpath = GCSPRINTF("%s/image/qmp-proxy-pid", dom_path);
+    sdss->qmp_proxy_spawn.xspath = DEVICE_MODEL_XS_PATH(gc, LIBXL_TOOLSTACK_DOMID,
+                                                        dm_domid, "/qmp-proxy-state");
+    sdss->qmp_proxy_spawn.timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
+    sdss->qmp_proxy_spawn.midproc_cb = libxl__spawn_record_pid;
+    sdss->qmp_proxy_spawn.confirm_cb = qmp_proxy_confirm;
+    sdss->qmp_proxy_spawn.failure_cb = qmp_proxy_startup_failed;
+    sdss->qmp_proxy_spawn.detached_cb = qmp_proxy_detached;
+
+    const int arraysize = 6;
+    GCNEW_ARRAY(args, arraysize);
+    args[nr++] = STUBDOM_QMP_PROXY_PATH;
+    args[nr++] = GCSPRINTF("--state-path=%s", sdss->qmp_proxy_spawn.xspath);
+    args[nr++] = GCSPRINTF("%u", dm_domid);
+    args[nr++] = GCSPRINTF("%s/device-model/%u/qmp-vchan", dom_path, guest_domid);
+    args[nr++] = (char*)libxl__qemu_qmp_path(gc, guest_domid);
+    args[nr++] = NULL;
+    assert(nr == arraysize);
+
+    logfile_w = libxl__create_qemu_logfile(gc, GCSPRINTF("qmp-proxy-%s",
+                                                         sdss->dm_config.c_info.name));
+    if (logfile_w < 0) {
+        rc = logfile_w;
+        goto out;
+    }
+    null = open("/dev/null", O_RDWR);
+    if (null < 0) {
+        LOGED(ERROR, guest_domid, "unable to open /dev/null");
+        rc = ERROR_FAIL;
+        goto out_close;
+    }
+
+    rc = libxl__spawn_spawn(egc, &sdss->qmp_proxy_spawn);
+    if (rc < 0)
+        goto out_close;
+    if (!rc) { /* inner child */
+        setsid();
+        libxl__exec(gc, null, null, logfile_w, STUBDOM_QMP_PROXY_PATH, args, NULL);
+        /* unreachable */
+    }
+
+    rc = 0;
+
+out_close:
+    if (logfile_w >= 0)
+        close(logfile_w);
+    if (null >= 0)
+        close(null);
+out:
+    if (rc)
+        qmp_proxy_spawn_outcome(egc, sdss, rc);
+}
+
+static void qmp_proxy_confirm(libxl__egc *egc, libxl__spawn_state *spawn,
+                              const char *xsdata)
+{
+    STATE_AO_GC(spawn->ao);
+
+    if (!xsdata)
+        return;
+
+    if (strcmp(xsdata, "running"))
+        return;
+
+    libxl__spawn_initiate_detach(gc, spawn);
+}
+
+static void qmp_proxy_startup_failed(libxl__egc *egc,
+                                     libxl__spawn_state *spawn,
+                                     int rc)
+{
+    libxl__stub_dm_spawn_state *sdss = CONTAINER_OF(spawn, *sdss, qmp_proxy_spawn);
+    qmp_proxy_spawn_outcome(egc, sdss, rc);
+}
+
+static void qmp_proxy_detached(libxl__egc *egc,
+                               libxl__spawn_state *spawn)
+{
+    libxl__stub_dm_spawn_state *sdss = CONTAINER_OF(spawn, *sdss, qmp_proxy_spawn);
+    qmp_proxy_spawn_outcome(egc, sdss, 0);
+}
+
+static void qmp_proxy_spawn_outcome(libxl__egc *egc,
+                                    libxl__stub_dm_spawn_state *sdss,
+                                    int rc)
+{
+    STATE_AO_GC(sdss->qmp_proxy_spawn.ao);
+    int need_pvqemu = libxl__need_xenpv_qemu(gc, &sdss->dm_config);
+
+    if (rc) goto out;
+
+    if (need_pvqemu < 0) {
+        rc = need_pvqemu;
+        goto out;
+    }
+
     sdss->pvqemu.spawn.ao = ao;
-    sdss->pvqemu.guest_domid = dm_domid;
     sdss->pvqemu.guest_config = &sdss->dm_config;
     sdss->pvqemu.build_state = &sdss->dm_state;
     sdss->pvqemu.callback = spawn_stubdom_pvqemu_cb;
-
-    if (!need_qemu) {
+    if (need_pvqemu) {
+        libxl__spawn_local_dm(egc, &sdss->pvqemu);
+    } else {
         /* If dom0 qemu not needed, do not launch it */
         spawn_stubdom_pvqemu_cb(egc, &sdss->pvqemu, 0);
-    } else {
-        libxl__spawn_local_dm(egc, &sdss->pvqemu);
     }
 
     return;
 
 out:
-    assert(ret);
-    spawn_stubdom_pvqemu_cb(egc, &sdss->pvqemu, ret);
+    assert(rc);
+    spawn_stubdom_pvqemu_cb(egc, &sdss->pvqemu, rc);
 }
 
 static void spawn_stubdom_pvqemu_cb(libxl__egc *egc,
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index a8f0eed945..00cfbe1fac 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -4159,6 +4159,7 @@ typedef struct {
     libxl__destroy_domid_state dis;
     libxl__multidev multidev;
     libxl__xswait_state xswait;
+    libxl__spawn_state qmp_proxy_spawn;
 } libxl__stub_dm_spawn_state;
 
 _hidden void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state*);
-- 
2.20.1


