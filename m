Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK0DExP9jWm0+AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:17:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD0612F433
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229443.1535404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZNS-0003gS-7t; Thu, 12 Feb 2026 16:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229443.1535404; Thu, 12 Feb 2026 16:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZNS-0003dj-4x; Thu, 12 Feb 2026 16:17:14 +0000
Received: by outflank-mailman (input) for mailman id 1229443;
 Thu, 12 Feb 2026 16:17:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wwql=AQ=bounce.vates.tech=bounce-md_30504962.698dfd05.v1-61d738ca8a0c4527adf5a44c6489444c@srs-se1.protection.inumbo.net>)
 id 1vqZNQ-0002rO-Lq
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 16:17:12 +0000
Received: from mail145-20.atl61.mandrillapp.com
 (mail145-20.atl61.mandrillapp.com [198.2.145.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48b1ac74-082e-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 17:17:11 +0100 (CET)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-20.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4fBgRn51QqzCf9RlL
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 16:17:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 61d738ca8a0c4527adf5a44c6489444c; Thu, 12 Feb 2026 16:17:09 +0000
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
X-Inumbo-ID: 48b1ac74-082e-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1770913029; x=1771183029;
	bh=RvnTYXu3DgG7UhKJGem5f0CYTeaphpS9JGOHjURlsz0=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=j40j2jQjy8tvKdEuQeYFU5qDZOTdAIw/8vz9GvP3OZv7iUPg8IioLAOgPLccuHT+V
	 wP0P8hppBX5oyR8b+l6caAaazZuAkhN428Uvts247/yheZu02nP7k4tan5wSw61nNp
	 ISlJSPiC7EUjw5YWtmJHPAdKq0CVytwmssJ8vU2RhczSUHLymOtlWSJ2OgTDMpUa9W
	 Uco9XVAkj4EhQIK56pP5RIzYO+IyHo8WZ4yHRJ69nOJpFzciFnYlHVpduqFr1odg2Q
	 qWD09ajLYBC8U7G+w1J8zuXgUpKXEdpaxuC2mmXUWWmpNC8f2VX/EGZqDnH1haQ0Rs
	 JXWKtn/hveE2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1770913029; x=1771173529; i=anthony.perard@vates.tech;
	bh=RvnTYXu3DgG7UhKJGem5f0CYTeaphpS9JGOHjURlsz0=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=wzEbBRR596oEjsVnW0ldvf8Khol7NmEjd0x/aasDqOkN3ytcfmOHuH6EH0FIsqBJE
	 K64kMxLEYEtiQBpeUr151NirPHhNyEVz9t6pxdt3OOfHdIjkcpGiefVaz+JfazquBR
	 gDtvwq9/j0BbQz7UoAfd4bHOsL0Oh+qvDYSFBxPbyZ5wSNOscydPSVdzOz1IRb3yV7
	 gnBL/pzarF9MGM0bIzZIuxtLYexZp3ZgxDxPkE2DV8B69qDtLaQFMA/vE3wtGvgD+a
	 ua6aI6S3rwTI5XWx3Z+M/+VXokKK+yZbCZw3dWRFhC40255iraKGt5tMr6MEg2xlzl
	 jYpyuNnd94i/Q==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH]=20libxl:=20Use=20fdset=20to=20provide=20migration=20saved=20state=20file?=
X-Mailer: git-send-email 2.47.3
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1770913029109
To: xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>
Message-Id: <20260212161700.35472-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.61d738ca8a0c4527adf5a44c6489444c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260212:md
Date: Thu, 12 Feb 2026 16:17:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,vates.tech:mid,vates.tech:dkim,vates.tech:url,vates.tech:email];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: ACD0612F433
X-Rspamd-Action: no action

Since QEMU 11.0, `-incoming fd:` doesn't accept file descriptors of
plain file, only sockets and pipe are accepted. This has been
deprecated since QEMU 9.1

Instead, switch to use `-incoming file:` with an fdset.

`incoming file:` schema seems to have been only introduced in QEMU
8.2. And `-incoming` isn't present in `query-command-line-options` QMP
command output, so we'll use a check based on QEMU version instead.

QEMU keep the FD open when added as a fdset, so close it in
postconfig. And now we have two optional set QMP command to run after
starting QEMU, for VNC and for migration.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/libs/light/libxl_dm.c       | 98 ++++++++++++++++++++++++++++---
 tools/libs/light/libxl_internal.h |  1 +
 2 files changed, 90 insertions(+), 9 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 511ec76a65..0fdeded92b 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -24,6 +24,8 @@
 #include <pwd.h>
 #include <grp.h>
 
+#define QEMU_FDSET_SAVED_STATE 1
+
 static const char *libxl_tapif_script(libxl__gc *gc)
 {
 #if defined(__linux__) || defined(__FreeBSD__)
@@ -1546,8 +1548,21 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         } else {
             /* This file descriptor is meant to be used by QEMU */
             *dm_state_fd = open(state->saved_state, O_RDONLY);
-            flexarray_append(dm_args, "-incoming");
-            flexarray_append(dm_args, GCSPRINTF("fd:%d",*dm_state_fd));
+            if (qemu_opts->use_incoming_file) {
+                flexarray_append_pair(dm_args, "-add-fd",
+                     GCSPRINTF("fd=%d,set="STR(QEMU_FDSET_SAVED_STATE)
+                               ",opaque=\"saved_state\"",
+                               *dm_state_fd));
+                flexarray_append_pair(dm_args, "-incoming",
+                                      "file:/dev/fdset/1");
+            } else {
+                /*
+                 * Passing a file descriptor of a plain file to `fd:` has
+                 * been deprecated in QEMU 9.1.
+                 */
+                flexarray_append(dm_args, "-incoming");
+                flexarray_append(dm_args, GCSPRINTF("fd:%d", *dm_state_fd));
+            }
         }
     }
     for (i = 0; b_info->extra && b_info->extra[i] != NULL; i++)
@@ -2631,6 +2646,12 @@ static void device_model_launch(libxl__egc *egc,
     libxl__dm_spawn_state *dmss, int rc);
 static void device_model_postconfig_chardev(libxl__egc *egc,
     libxl__ev_qmp *qmp, const libxl__json_object *response, int rc);
+static void device_model_postconfig_do_remove_fdset(libxl__egc *egc,
+    libxl__ev_qmp *qmp, int rc);
+static void device_model_postconfig_removed_fdset(libxl__egc *egc,
+    libxl__ev_qmp *qmp, const libxl__json_object *response, int rc);
+static void device_model_postconfig_do_vnc(libxl__egc *egc,
+    libxl__ev_qmp *qmp, int rc);
 static void device_model_postconfig_vnc(libxl__egc *egc,
     libxl__ev_qmp *qmp, const libxl__json_object *response, int rc);
 static void device_model_postconfig_vnc_passwd(libxl__egc *egc,
@@ -2832,6 +2853,13 @@ static void device_model_probe_cmdline(libxl__egc *egc,
         }
     }
 
+    /*
+     * Other checks based on QEMU's version
+     */
+    if (libxl__qmp_ev_qemu_compare_version(qmp, 9, 1, 0) >= 0) {
+        dmss->qemu_opts.use_incoming_file = true;
+    }
+
     qmp->callback = device_model_probe_quit;
     rc = libxl__ev_qmp_send(egc, qmp, "quit", NULL);
     if (rc) goto out;
@@ -3152,7 +3180,6 @@ static void device_model_postconfig_chardev(libxl__egc *egc,
 {
     EGC_GC;
     libxl__dm_spawn_state *dmss = CONTAINER_OF(qmp, *dmss, qmp);
-    const libxl_vnc_info *vnc = libxl__dm_vnc(dmss->guest_config);
     const libxl__json_object *item = NULL;
     const libxl__json_object *o = NULL;
     int i = 0;
@@ -3210,12 +3237,7 @@ static void device_model_postconfig_chardev(libxl__egc *egc,
         if (rc) goto out;
     }
 
-    if (!vnc)
-        goto out;
-
-    qmp->callback = device_model_postconfig_vnc;
-    rc = libxl__ev_qmp_send(egc, qmp, "query-vnc", NULL);
-    if (rc) goto out;
+    device_model_postconfig_do_remove_fdset(egc, qmp, rc); /* must be last */
     return;
 
 protocol_error:
@@ -3227,6 +3249,64 @@ static void device_model_postconfig_chardev(libxl__egc *egc,
     device_model_postconfig_done(egc, dmss, rc); /* must be last */
 }
 
+static void device_model_postconfig_do_remove_fdset(libxl__egc *egc,
+    libxl__ev_qmp *qmp, int rc)
+{
+    EGC_GC;
+    libxl__dm_spawn_state *dmss = CONTAINER_OF(qmp, *dmss, qmp);
+
+    /*
+     * If we used -add-fd for the `saved_state`, ask QEMU to close it.
+     */
+    if (dmss->qemu_opts.use_incoming_file && dmss->build_state->saved_state) {
+        libxl__json_object *args = NULL;
+        qmp->callback = device_model_postconfig_removed_fdset;
+        libxl__qmp_param_add_integer(gc, &args, "fdset-id",
+                                     QEMU_FDSET_SAVED_STATE);
+        rc = libxl__ev_qmp_send(egc, qmp, "remove-fd", args);
+        if (rc) goto out;
+        return;
+    }
+
+    device_model_postconfig_do_vnc(egc, qmp, rc); /* must be last */
+    return;
+
+out:
+    device_model_postconfig_done(egc, dmss, rc); /* must be last */
+}
+
+static void device_model_postconfig_removed_fdset(libxl__egc *egc,
+    libxl__ev_qmp *qmp, const libxl__json_object *response, int rc)
+{
+    libxl__dm_spawn_state *dmss = CONTAINER_OF(qmp, *dmss, qmp);
+
+    if (rc) goto out;
+
+    device_model_postconfig_do_vnc(egc, qmp, rc); /* must be last */
+    return;
+
+out:
+    device_model_postconfig_done(egc, dmss, rc); /* must be last */
+}
+
+static void device_model_postconfig_do_vnc(libxl__egc *egc,
+    libxl__ev_qmp *qmp, int rc)
+{
+    EGC_GC;
+    libxl__dm_spawn_state *dmss = CONTAINER_OF(qmp, *dmss, qmp);
+    const libxl_vnc_info *vnc = libxl__dm_vnc(dmss->guest_config);
+
+    if (vnc) {
+        qmp->callback = device_model_postconfig_vnc;
+        rc = libxl__ev_qmp_send(egc, qmp, "query-vnc", NULL);
+        if (rc) goto out;
+        return;
+    }
+
+out:
+    device_model_postconfig_done(egc, dmss, rc); /* must be last */
+}
+
 static void device_model_postconfig_vnc(libxl__egc *egc,
     libxl__ev_qmp *qmp, const libxl__json_object *response, int rc)
 {
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index b65e0064b9..7d916ee64a 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4094,6 +4094,7 @@ typedef struct libxl__qemu_available_opts libxl__qemu_available_opts;
 struct libxl__qemu_available_opts {
     bool have_runwith_chroot;
     bool have_runwith_user;
+    bool use_incoming_file;
 };
 
 typedef void libxl__dm_spawn_cb(libxl__egc *egc, libxl__dm_spawn_state*,
-- 
Anthony PERARD



--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


