Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C589606A0
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 12:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783747.1193026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sit32-0001BR-CG; Tue, 27 Aug 2024 10:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783747.1193026; Tue, 27 Aug 2024 10:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sit32-00018N-3p; Tue, 27 Aug 2024 10:03:36 +0000
Received: by outflank-mailman (input) for mailman id 783747;
 Tue, 27 Aug 2024 10:03:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Qjj=P2=bounce.vates.tech=bounce-md_30504962.66cda473.v1-2833161555d54724b73db1c6b0865185@srs-se1.protection.inumbo.net>)
 id 1sit31-00015r-4l
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 10:03:35 +0000
Received: from mail187-32.suw11.mandrillapp.com
 (mail187-32.suw11.mandrillapp.com [198.2.187.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d751753-645b-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 12:03:32 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-32.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4WtNR74DkRzQXg2bp
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 10:03:31 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2833161555d54724b73db1c6b0865185; Tue, 27 Aug 2024 10:03:31 +0000
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
X-Inumbo-ID: 9d751753-645b-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724753011; x=1725013511;
	bh=vchDRtHA+TPS5qyWfxue52QEMQPCyUlCs0i9CKru4ng=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=TFA8grfojzlr3qxxLXX4gwzAyudtEsXNB+EJ7DxhdMThbWtvUAUNi1gWhYjppxldd
	 TWmJ9i7S8gIjgY1paxJZPGxP0XmQ+wYUL6pOsSlrdYpXVP41nv6ahtk3Xc2yv799z3
	 iHlt+KXc2yxLBU7XbzoDhwHbGF+ZnH4lJLP713U+Z8mjzndqI3R/bNx40mM1d5E76T
	 WNaqwD+GiL3znCSqssh7Ieb5mobkjuJEj6e7kXzJdl+wkDuGFAz0BqnAsJ90R4Nf8u
	 IGwtwfUQIWuZTYe6cpF5/gZ3kp3OXsiubgsfMbO9YJ95fTNYCmT/nvbTycXLbbq4on
	 1RSGpqztTvq1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724753011; x=1725013511; i=anthony.perard@vates.tech;
	bh=vchDRtHA+TPS5qyWfxue52QEMQPCyUlCs0i9CKru4ng=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=M+xtCFbDDMU2XyuuJ8tqPHS9eR8yO1wwpyCrb9wua/R6gt8thR4SBMdbT5q2hqFkd
	 837b0eCGY5CapNWFBAoKenSERaVVlJ4Z9h+9Y6bkEDPu3y5DK7sSDwYQEMZDw4YTmu
	 UuVVXdt2BddwsKQka00va8bg784VRR0LnwmiFLLD8NE8LU8Jku3jgnGX/V8V0ag0yB
	 4PrNdWdyh4CswNPEGOhzCxZUsbyN0JGet/ai0TmW8kw7f8Z7vasIzkZQR1uxu2r/Mi
	 8Ypco0BgyebzIgo20usgILAD1W66llsMAlY53WoqDH1gR8O3SBJYwCNSbLSQ/POFnk
	 pAvss3KD/WCeg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=201/3]=20libxl:=20Implement=20QEMU=20command=20line=20probe?=
X-Mailer: git-send-email 2.39.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724753010871
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Message-Id: <20240827100328.23216-2-anthony.perard@vates.tech>
In-Reply-To: <20240827100328.23216-1-anthony.perard@vates.tech>
References: <20240827100328.23216-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2833161555d54724b73db1c6b0865185?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240827:md
Date: Tue, 27 Aug 2024 10:03:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Anthony PERARD <anthony.perard@citrix.com>

Starting with QEMU 9.0, the option "-chroot", that we use for the
"dmrestrict" feature, is removed. We need to find out which to use
between "-chroot" and "-run-with chroot=dir".

This patch implement the machinery to spawn QEMU, and to run the QMP
command "query-command-line-options" but doesn't yet look at the
actual result. Whether or not to use "-run-with chroot=dir" will be
implemented in a follow up patch.

The command line used to spawn the qemu we want to probe is mostly
similar to the one we already use for the device model, "-machine
none" comes from libvirt.

This patch implement the probing on qemu-xen, even if we probably not
going to use the result. We could check the feature wanted for the
domain been created, but this could get complicated fairly quickly.
We already need to check the options "b_info->dm_restrict" for
"-chroot" and "state->dm_runas" for "-runas" (which is deprecated).

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/libs/light/libxl_dm.c       | 207 ++++++++++++++++++++++++++++--
 tools/libs/light/libxl_internal.h |   1 +
 2 files changed, 198 insertions(+), 10 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index ff8ddeec9a..46babfed0b 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2858,6 +2858,20 @@ static void device_model_qmp_cb(libxl__egc *egc, libxl__ev_qmp *ev,
 static void device_model_spawn_outcome(libxl__egc *egc,
                                        libxl__dm_spawn_state *dmss,
                                        int rc);
+static void device_model_probe_startup_failed(libxl__egc *egc,
+    libxl__spawn_state *spawn, int rc);
+static void device_model_probe_confirm(libxl__egc *egc,
+    libxl__spawn_state *spawn, const char *xsdata);
+static void device_model_probe_detached(libxl__egc *egc,
+    libxl__spawn_state *spawn);
+static void device_model_probe_cmdline(libxl__egc *egc,
+    libxl__ev_qmp *qmp, const libxl__json_object *response, int rc);
+static void device_model_probe_quit(libxl__egc *egc,
+    libxl__ev_qmp *qmp, const libxl__json_object *response, int rc);
+static void device_model_probe_spawn_outcome(libxl__egc *egc,
+     libxl__dm_spawn_state *dmss, int rc);
+static void device_model_launch(libxl__egc *egc,
+    libxl__dm_spawn_state *dmss, int rc);
 static void device_model_postconfig_chardev(libxl__egc *egc,
     libxl__ev_qmp *qmp, const libxl__json_object *response, int rc);
 static void device_model_postconfig_vnc(libxl__egc *egc,
@@ -2873,25 +2887,18 @@ void libxl__spawn_local_dm(libxl__egc *egc, libxl__dm_spawn_state *dmss)
 {
     /* convenience aliases */
     const int domid = dmss->guest_domid;
-    libxl__domain_build_state *const state = dmss->build_state;
     libxl__spawn_state *const spawn = &dmss->spawn;
 
     STATE_AO_GC(dmss->spawn.ao);
 
-    libxl_ctx *ctx = CTX;
     libxl_domain_config *guest_config = dmss->guest_config;
     const libxl_domain_create_info *c_info = &guest_config->c_info;
     const libxl_domain_build_info *b_info = &guest_config->b_info;
-    const libxl_vnc_info *vnc = libxl__dm_vnc(guest_config);
-    char *path;
-    int logfile_w, null;
     int rc;
-    char **args, **arg, **envs;
-    xs_transaction_t t;
-    char *vm_path;
-    char **pass_stuff;
     const char *dm;
-    int dm_state_fd = -1;
+    int logfile_w = -1, null = -1;
+    int qmp_probe_fd = -1;
+    bool probe_spawned = false;
 
     dmss_init(dmss);
 
@@ -2904,6 +2911,7 @@ void libxl__spawn_local_dm(libxl__egc *egc, libxl__dm_spawn_state *dmss)
         rc = ERROR_FAIL;
         goto out;
     }
+    dmss->dm = dm;
     if (access(dm, X_OK) < 0) {
         LOGED(ERROR, domid, "device model %s is not executable", dm);
         rc = ERROR_FAIL;
@@ -2911,6 +2919,185 @@ void libxl__spawn_local_dm(libxl__egc *egc, libxl__dm_spawn_state *dmss)
     }
 
     rc = libxl__domain_get_device_model_uid(gc, dmss);
+    if (rc)
+        goto out;
+
+    /* probe QEMU's available command line options */
+    if (b_info->device_model_version
+        == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN) {
+
+        logfile_w = libxl__create_qemu_logfile(
+            gc, GCSPRINTF("qemu-probe-%s", c_info->name));
+        if (logfile_w < 0) {
+            rc = logfile_w;
+            goto out;
+        }
+        null = open("/dev/null", O_RDONLY);
+        if (null < 0) {
+            LOGED(ERROR, domid, "unable to open /dev/null");
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        rc = libxl__pre_open_qmp_socket(gc, domid, &qmp_probe_fd);
+        if (rc) goto out;
+
+        flexarray_t *dm_args = flexarray_make(gc, 16, 1);
+        flexarray_vappend(dm_args, dm,
+                          "-S",
+                          "-no-user-config",
+                          "-nodefaults",
+                          "-nographic",
+                          "-machine", "none,accel=xen",
+                          NULL);
+        flexarray_vappend(dm_args,
+                          "-chardev",
+                          GCSPRINTF("socket,id=libxl-cmd,fd=%d,server=on,wait=off",
+                                    qmp_probe_fd),
+                          "-mon", "chardev=libxl-cmd,mode=control",
+                          NULL);
+        flexarray_append(dm_args, NULL);
+        char **exec_args = (char **) flexarray_contents(dm_args);
+
+        const char *dom_path = libxl__xs_get_dompath(gc, domid);
+
+        spawn->what = GCSPRINTF("domain %d qemu command line probe", domid);
+        spawn->xspath = "/dev/null"; /* No path to watch */
+        spawn->timeout_ms = LIBXL_DEVICE_MODEL_START_TIMEOUT * 1000;
+        spawn->pidpath = GCSPRINTF("%s/image/device-model-pid", dom_path);
+        spawn->midproc_cb = libxl__spawn_record_pid;
+        spawn->confirm_cb = device_model_probe_confirm;
+        spawn->failure_cb = device_model_probe_startup_failed;
+        spawn->detached_cb = device_model_probe_detached;
+
+        dmss->qmp.ao = ao;
+        dmss->qmp.callback = device_model_probe_cmdline;
+        dmss->qmp.domid = domid;
+        dmss->qmp.payload_fd = -1;
+        rc = libxl__ev_qmp_send(egc, &dmss->qmp, "query-command-line-options", NULL);
+        if (rc) goto out;
+
+        rc = libxl__spawn_spawn(egc, spawn);
+        if (rc < 0)
+            goto out;
+        if (!rc) { /* inner child */
+            setsid();
+            libxl__exec(gc, null, logfile_w, logfile_w, dm, exec_args, NULL);
+        }
+        probe_spawned = true;
+    } else {
+        /* Continue with launching DM instead of probing it */
+        probe_spawned = false;
+    }
+    rc = 0;
+out:
+    if (qmp_probe_fd >= 0)
+        close(qmp_probe_fd);
+    if (null >= 0)
+        close(null);
+    if (logfile_w >= 0)
+        close(logfile_w);
+    if (rc || !probe_spawned)
+        device_model_launch(egc, dmss, rc);
+}
+
+static void device_model_probe_startup_failed(libxl__egc *egc,
+    libxl__spawn_state *spawn, int rc)
+{
+    libxl__dm_spawn_state *dmss = CONTAINER_OF(spawn, *dmss, spawn);
+    device_model_probe_spawn_outcome(egc, dmss, rc);
+}
+
+static void device_model_probe_confirm(libxl__egc *egc,
+    libxl__spawn_state *spawn, const char *xsdata)
+{
+    /* Nothing to do, confirmation is done via QMP instead */
+}
+
+static void device_model_probe_detached(libxl__egc *egc,
+    libxl__spawn_state *spawn)
+{
+    libxl__dm_spawn_state *dmss = CONTAINER_OF(spawn, *dmss, spawn);
+    device_model_probe_spawn_outcome(egc, dmss, 0);
+}
+
+static void device_model_probe_cmdline(libxl__egc *egc,
+    libxl__ev_qmp *qmp, const libxl__json_object *response, int rc)
+{
+    libxl__dm_spawn_state *dmss = CONTAINER_OF(qmp, *dmss, qmp);
+
+    if (rc)
+        goto out;
+
+    /*
+     * query-command-line-options response:
+     * [ { 'option': 'str', 'parameters': [{ 'name': 'str', ... }] } ]
+     */
+
+    qmp->callback = device_model_probe_quit;
+    rc = libxl__ev_qmp_send(egc, qmp, "quit", NULL);
+    if (rc) goto out;
+    return;
+
+out:
+    libxl__spawn_initiate_failure(egc, &dmss->spawn, rc);
+}
+
+static void device_model_probe_quit(libxl__egc *egc,
+    libxl__ev_qmp *qmp, const libxl__json_object *response, int rc)
+{
+    EGC_GC;
+    libxl__dm_spawn_state *dmss = CONTAINER_OF(qmp, *dmss, qmp);
+
+    libxl__ev_qmp_dispose(gc, qmp);
+    libxl__spawn_initiate_detach(gc, &dmss->spawn);
+}
+
+static void device_model_probe_spawn_outcome(libxl__egc *egc,
+    libxl__dm_spawn_state *dmss, int rc)
+{
+    EGC_GC;
+    libxl__ev_qmp_dispose(gc, &dmss->qmp);
+
+    /* Ensure our QEMU command line probe is killed. */
+    rc = libxl__kill_xs_path(gc, dmss->spawn.pidpath,
+                             "qemu command-line probe");
+    if (rc) {
+        LOGD(WARN, dmss->guest_domid,
+             "Killing qemu command-line probe pid from path %s",
+             dmss->spawn.pidpath);
+    }
+
+    /*
+     * Ignore all failure from the QEMU command line probe, start the
+     * device model in any case.
+     */
+    device_model_launch(egc, dmss, 0);
+}
+
+static void device_model_launch(libxl__egc *egc,
+    libxl__dm_spawn_state *dmss, int rc)
+{
+    STATE_AO_GC(dmss->spawn.ao);
+    libxl_ctx *ctx = CTX;
+    libxl_domain_config *guest_config = dmss->guest_config;
+    const libxl_domain_create_info *c_info = &guest_config->c_info;
+    const libxl_domain_build_info *b_info = &guest_config->b_info;
+    const libxl_vnc_info *vnc = libxl__dm_vnc(guest_config);
+    char *path;
+    int logfile_w, null;
+    char **args, **arg, **envs;
+    xs_transaction_t t;
+    char *vm_path;
+    char **pass_stuff;
+    int dm_state_fd = -1;
+
+    /* convenience aliases */
+    const int domid = dmss->guest_domid;
+    libxl__domain_build_state *const state = dmss->build_state;
+    libxl__spawn_state *const spawn = &dmss->spawn;
+    const char *const dm = dmss->dm;
+
     if (rc)
         goto out;
 
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 3b58bb2d7f..e99adc56cb 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4154,6 +4154,7 @@ struct libxl__dm_spawn_state {
     libxl__ev_qmp qmp;
     libxl__ev_time timeout;
     libxl__dm_resume_state dmrs;
+    const char *dm;
     /* filled in by user, must remain valid: */
     uint32_t guest_domid; /* domain being served */
     libxl_domain_config *guest_config;
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

