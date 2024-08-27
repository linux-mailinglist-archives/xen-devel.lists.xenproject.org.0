Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 395CB96069F
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 12:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783749.1193049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sit33-0001oo-Rg; Tue, 27 Aug 2024 10:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783749.1193049; Tue, 27 Aug 2024 10:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sit33-0001kL-ML; Tue, 27 Aug 2024 10:03:37 +0000
Received: by outflank-mailman (input) for mailman id 783749;
 Tue, 27 Aug 2024 10:03:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBdT=P2=bounce.vates.tech=bounce-md_30504962.66cda473.v1-1b2f93cb1b2c4edb8d0fe7e4878e8374@srs-se1.protection.inumbo.net>)
 id 1sit32-00015q-4r
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 10:03:36 +0000
Received: from mail187-32.suw11.mandrillapp.com
 (mail187-32.suw11.mandrillapp.com [198.2.187.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e8b35ea-645b-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 12:03:34 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-32.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4WtNR74fkXzQXg2py
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 10:03:31 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1b2f93cb1b2c4edb8d0fe7e4878e8374; Tue, 27 Aug 2024 10:03:31 +0000
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
X-Inumbo-ID: 9e8b35ea-645b-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724753011; x=1725013511;
	bh=vvEWgBFkpI/68BpBe5Mn7aZ1DJf2R7AOv5a1MvGUyAA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=w0ve9mAV0x6jz6gRVgHuDXjyIGyXaNCA99uKIn/XC6NVvM5s4mZ28+AeKSVxmnlt+
	 EMNHe8WlocQfLl7T0TVftzmPkSEpt5Or3N4DdcEuevRIcObvmXYo5fZQwwFE9Ql0W/
	 vvDYJL1rccDRGgHWXXm0sLHoNhExmNX41SetfyHdjgdj/+pFuCzku5/mgXO69dB3sp
	 b4NDlyfxKjQB+w5gb90LdC1CTFn7CX7+idOnEk6TwC7vKClO1QnmKLx/Rblwwve7G8
	 /5AcaiLZf+GLvTZpAjrXS7dDD0McM4uOBtLw4kKZVlL0lM72cZ64Nb/IPt3jlJQXdl
	 c06/l4FI/fJSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724753011; x=1725013511; i=anthony.perard@vates.tech;
	bh=vvEWgBFkpI/68BpBe5Mn7aZ1DJf2R7AOv5a1MvGUyAA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XIFof5/mrgROYPkoIhrRSMVqLmf9KL71fv925M3LPb4y2T67KEyMz6ENGqdImWLhS
	 ooFzV+jkT5r98DV1anXVUaD7EoGeRGmdeNQUD9x6jLcFjZJc/Ryjxpb5dnoXY/Eh6w
	 iz6b4e1+UT4m1YQ59EoqgTJ1VupzvrA6EdLSgThIKkrLLdGJK25FQkZ93IF03kEPVr
	 Hz6+XATM5fJapS60fCnUZh/UWHbt3WUYwwV/VtHThu7FIWWAhiHoAuWq7cgqz0ZKqp
	 wfIXIMPYcjiZAHSHYfovfM4wvgmhWkybpWxEJF6q0yGNGf85wz5KAglYTDR0HKHq4j
	 5axScOsyJTeGQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=202/3]=20libxl:=20Probe=20QEMU=20for=20-run-with=20chroot=3Ddir=20and=20use=20it?=
X-Mailer: git-send-email 2.39.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724753011205
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Message-Id: <20240827100328.23216-3-anthony.perard@vates.tech>
In-Reply-To: <20240827100328.23216-1-anthony.perard@vates.tech>
References: <20240827100328.23216-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1b2f93cb1b2c4edb8d0fe7e4878e8374?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240827:md
Date: Tue, 27 Aug 2024 10:03:31 +0000
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
---
 tools/libs/light/libxl_dm.c       | 78 +++++++++++++++++++++++++------
 tools/libs/light/libxl_internal.h |  5 ++
 2 files changed, 69 insertions(+), 14 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 46babfed0b..298fbb84fe 100644
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
+    const libxl__qemu_available_cmd_line *qemu_cmdline,
+    int *dm_state_fd)
 {
     const libxl_domain_create_info *c_info = &guest_config->c_info;
     const libxl_domain_build_info *b_info = &guest_config->b_info;
@@ -1778,8 +1779,13 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
         }
 
         /* Add "-chroot [dir]" to command-line */
-        flexarray_append(dm_args, "-chroot");
-        flexarray_append(dm_args, chroot_dir);
+        if (qemu_cmdline->have_runwith_chroot) {
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
+    const libxl__qemu_available_cmd_line *qemu_cmdline,
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
+                                                  qemu_cmdline,
+                                                  dm_state_fd);
     default:
         LOGED(ERROR, guest_domid, "unknown device model version %d",
               guest_config->b_info.device_model_version);
@@ -2403,7 +2412,9 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
 
     ret = libxl__build_device_model_args(gc, "stubdom-dm", guest_domid,
                                          guest_config, &args, NULL,
-                                         d_state, NULL);
+                                         d_state,
+                                         &sdss->dm.qemu_cmdline,
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
+                    dmss->qemu_cmdline.have_runwith_chroot = true;
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
+                                          &dmss->qemu_cmdline,
                                           &dm_state_fd);
     if (rc)
         goto out;
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index e99adc56cb..df93d904c2 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -4142,6 +4142,10 @@ _hidden void libxl__add_nics(libxl__egc *egc, libxl__ao *ao, uint32_t domid,
 /* First layer; wraps libxl__spawn_spawn. */
 
 typedef struct libxl__dm_spawn_state libxl__dm_spawn_state;
+typedef struct libxl__qemu_available_cmd_line libxl__qemu_available_cmd_line;
+struct libxl__qemu_available_cmd_line {
+    bool have_runwith_chroot;
+};
 
 typedef void libxl__dm_spawn_cb(libxl__egc *egc, libxl__dm_spawn_state*,
                                 int rc /* if !0, error was logged */);
@@ -4154,6 +4158,7 @@ struct libxl__dm_spawn_state {
     libxl__ev_qmp qmp;
     libxl__ev_time timeout;
     libxl__dm_resume_state dmrs;
+    libxl__qemu_available_cmd_line qemu_cmdline;
     const char *dm;
     /* filled in by user, must remain valid: */
     uint32_t guest_domid; /* domain being served */
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

