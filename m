Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74080965D53
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 11:50:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786325.1195910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjyGI-000817-2Y; Fri, 30 Aug 2024 09:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786325.1195910; Fri, 30 Aug 2024 09:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjyGH-0007wD-VT; Fri, 30 Aug 2024 09:49:45 +0000
Received: by outflank-mailman (input) for mailman id 786325;
 Fri, 30 Aug 2024 09:49:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PfWu=P5=bounce.vates.tech=bounce-md_30504962.66d195b4.v1-1ad4937e69c44b9aa22f45a8be7d3abe@srs-se1.protection.inumbo.net>)
 id 1sjyGG-0007tp-0H
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 09:49:44 +0000
Received: from mail135-11.atl141.mandrillapp.com
 (mail135-11.atl141.mandrillapp.com [198.2.135.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d9167da-66b5-11ef-99a0-01e77a169b0f;
 Fri, 30 Aug 2024 11:49:41 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-11.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4WwCzm2YxvzLfH1Bd
 for <xen-devel@lists.xenproject.org>; Fri, 30 Aug 2024 09:49:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1ad4937e69c44b9aa22f45a8be7d3abe; Fri, 30 Aug 2024 09:49:40 +0000
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
X-Inumbo-ID: 2d9167da-66b5-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725011380; x=1725271880;
	bh=5LiO0Nd/Zy1z0sOoL8UJ1K72e8zF+8gwKPSYqigHYq0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=L6hJ8RXrjoQRQh6418pPvTvSQAiKezboT34+hYPDZ2nAVrzsUVsMgQU95o+sOUxFX
	 sznzf1qA+N0FgtWiIvmbCSgOcuP9+ueZo9azFo488c/k4xscJvx6PSJ9xgB7O2pR19
	 cFKeCJpVTsSrjqO5kqvhFoUYQ02g1okjuacxL5WfXu//DRLssIBK0Pmy04ZnzUw/Ub
	 Ti+nYkbSdML+v5REF4JvV5sXQ3dtb8o2ug6jq0f+UEN+3dZwwveLY7UPEgawYtIXml
	 FqIs9ZOXwOm5/FqANfSWV8woNvDdWlifAXL9dMxsIom8Qw2QS3LS6WM0Qm/agpijGY
	 Db92MtVrxGj9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725011380; x=1725271880; i=anthony.perard@vates.tech;
	bh=5LiO0Nd/Zy1z0sOoL8UJ1K72e8zF+8gwKPSYqigHYq0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=xJc2iJgzpHBptd5uf2deIN24kcU4WbSzLjpVYgu2QUIdapC0iVmrokSQFebh9T808
	 lVklg4UTZkCbuY4QkYm61VEvxTOpVGW1ziZcXphM8VQe6oUZaYqoX/LbyYXn+pyJWd
	 68PMRbSn6W0Ipy7MVR/O73w6jooh4ix7ZEcDK6WqeiZ+1Op6U/yXcu3MQEgSDZrElh
	 81VCFFrIIoWYJj/BGUnEKXSeoVerp9+bo68BJK5JQDkZy/4z9coKAJMRiyo0EK6Stj
	 RDp/Rpzo9aB+KqH/4SCCAHsx2KkaIir68rz69DRE9VCHOXwH0QINit6dTDjEWzjy5T
	 BQfmYzm7AJmdA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v2=201/2]=20libxl:=20Probe=20QEMU=20for=20-run-with=20chroot=3Ddir=20and=20use=20it?=
X-Mailer: git-send-email 2.39.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725011379613
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>
Message-Id: <20240830094937.40476-2-anthony.perard@vates.tech>
In-Reply-To: <20240830094937.40476-1-anthony.perard@vates.tech>
References: <20240830094937.40476-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1ad4937e69c44b9aa22f45a8be7d3abe?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240830:md
Date: Fri, 30 Aug 2024 09:49:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

QEMU 9.0 have removed "-chroot" command line option, which have been
deprecated since QEMU 8.1 in favor of "-run-with chroot=dir".

Look into the result of the QMP command "query-command-line-options"
to find out if "-run-with chroot=dir" is available. Then use it in
place of "-chroot".

Resolves: xen-project/xen#187
Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---

Notes:
    v2:
    - rename "qemu_cmdline" to "qemu_opts" in struct field and func
      parameters.
    - rename "struct libxl__qemu_available_cmd_line" to
      "struct libxl__qemu_available_opts".

 tools/libs/light/libxl_dm.c       | 78 +++++++++++++++++++++++++------
 tools/libs/light/libxl_internal.h |  5 ++
 2 files changed, 69 insertions(+), 14 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 46babfed0b..15b157060f 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1183,11 +1183,12 @@ static int libxl__pre_open_qmp_socket(libxl__gc *gc, libxl_domid domid,
 }
 
 static int libxl__build_device_model_args_new(libxl__gc *gc,
-                                        const char *dm, int guest_domid,
-                                        const libxl_domain_config *guest_config,
-                                        char ***args, char ***envs,
-                                        const libxl__domain_build_state *state,
-                                        int *dm_state_fd)
+    const char *dm, int guest_domid,
+    const libxl_domain_config *guest_config,
+    char ***args, char ***envs,
+    const libxl__domain_build_state *state,
+    const libxl__qemu_available_opts *qemu_opts,
+    int *dm_state_fd)
 {
     const libxl_domain_create_info *c_info = &guest_config->c_info;
     const libxl_domain_build_info *b_info = &guest_config->b_info;
@@ -1778,8 +1779,13 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         }
 
         /* Add "-chroot [dir]" to command-line */
-        flexarray_append(dm_args, "-chroot");
-        flexarray_append(dm_args, chroot_dir);
+        if (qemu_opts->have_runwith_chroot) {
+            flexarray_append_pair(dm_args, "-run-with",
+                                  GCSPRINTF("chroot=%s", chroot_dir));
+        } else {
+            flexarray_append(dm_args, "-chroot");
+            flexarray_append(dm_args, chroot_dir);
+        }
     }
 
     if (state->saved_state) {
@@ -2059,11 +2065,12 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
 }
 
 static int libxl__build_device_model_args(libxl__gc *gc,
-                                        const char *dm, int guest_domid,
-                                        const libxl_domain_config *guest_config,
-                                        char ***args, char ***envs,
-                                        const libxl__domain_build_state *state,
-                                        int *dm_state_fd)
+    const char *dm, int guest_domid,
+    const libxl_domain_config *guest_config,
+    char ***args, char ***envs,
+    const libxl__domain_build_state *state,
+    const libxl__qemu_available_opts *qemu_opts,
+    int *dm_state_fd)
 /* dm_state_fd may be NULL iff caller knows we are using stubdom
  * and therefore will be passing a filename rather than a fd. */
 {
@@ -2081,7 +2088,9 @@ static int libxl__build_device_model_args(libxl__gc *gc,
         return libxl__build_device_model_args_new(gc, dm,
                                                   guest_domid, guest_config,
                                                   args, envs,
-                                                  state, dm_state_fd);
+                                                  state,
+                                                  qemu_opts,
+                                                  dm_state_fd);
     default:
         LOGED(ERROR, guest_domid, "unknown device model version %d",
               guest_config->b_info.device_model_version);
@@ -2403,7 +2412,9 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
 
     ret = libxl__build_device_model_args(gc, "stubdom-dm", guest_domid,
                                          guest_config, &args, NULL,
-                                         d_state, NULL);
+                                         d_state,
+                                         &sdss->dm.qemu_opts,
+                                         NULL);
     if (ret) {
         ret = ERROR_FAIL;
         goto out;
@@ -3024,6 +3035,7 @@ static void device_model_probe_detached(libxl__egc *egc,
 static void device_model_probe_cmdline(libxl__egc *egc,
     libxl__ev_qmp *qmp, const libxl__json_object *response, int rc)
 {
+    EGC_GC;
     libxl__dm_spawn_state *dmss = CONTAINER_OF(qmp, *dmss, qmp);
 
     if (rc)
@@ -3033,6 +3045,43 @@ static void device_model_probe_cmdline(libxl__egc *egc,
      * query-command-line-options response:
      * [ { 'option': 'str', 'parameters': [{ 'name': 'str', ... }] } ]
      */
+    const libxl__json_object *option;
+    for (int i_option = 0;
+         (option = libxl__json_array_get(response, i_option));
+         i_option++) {
+        const libxl__json_object *o;
+        const char *opt_str;
+
+        o = libxl__json_map_get("option", option, JSON_STRING);
+        if (!o) {
+            rc = ERROR_QEMU_API;
+            goto out;
+        }
+        opt_str = libxl__json_object_get_string(o);
+
+        if (!strcmp("run-with", opt_str)) {
+            const libxl__json_object *params;
+            const libxl__json_object *item;
+
+            params = libxl__json_map_get("parameters", option, JSON_ARRAY);
+            for (int i = 0; (item = libxl__json_array_get(params, i)); i++) {
+                o = libxl__json_map_get("name", item, JSON_STRING);
+                if (!o) {
+                    rc = ERROR_QEMU_API;
+                    goto out;
+                }
+                if (!strcmp("chroot", libxl__json_object_get_string(o))) {
+                    dmss->qemu_opts.have_runwith_chroot = true;
+                }
+            }
+
+            /*
+             * No need to parse more options, we are only interested with
+             * -run-with at the moment.
+             */
+            break;
+        }
+    }
 
     qmp->callback = device_model_probe_quit;
     rc = libxl__ev_qmp_send(egc, qmp, "quit", NULL);
@@ -3113,6 +3162,7 @@ static void device_model_launch(libxl__egc *egc,
 
     rc = libxl__build_device_model_args(gc, dm, domid, guest_config,
                                           &args, &envs, state,
+                                          &dmss->qemu_opts,
                                           &dm_state_fd);
     if (rc)
         goto out;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index e99adc56cb..0133c57e01 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4142,6 +4142,10 @@ _hidden void libxl__add_nics(libxl__egc *egc, libxl__ao *ao, uint32_t domid,
 /* First layer; wraps libxl__spawn_spawn. */
 
 typedef struct libxl__dm_spawn_state libxl__dm_spawn_state;
+typedef struct libxl__qemu_available_opts libxl__qemu_available_opts;
+struct libxl__qemu_available_opts {
+    bool have_runwith_chroot;
+};
 
 typedef void libxl__dm_spawn_cb(libxl__egc *egc, libxl__dm_spawn_state*,
                                 int rc /* if !0, error was logged */);
@@ -4154,6 +4158,7 @@ struct libxl__dm_spawn_state {
     libxl__ev_qmp qmp;
     libxl__ev_time timeout;
     libxl__dm_resume_state dmrs;
+    libxl__qemu_available_opts qemu_opts;
     const char *dm;
     /* filled in by user, must remain valid: */
     uint32_t guest_domid; /* domain being served */
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

