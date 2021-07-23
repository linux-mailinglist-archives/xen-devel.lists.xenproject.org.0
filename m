Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BE63D33D6
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 06:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159956.294174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6n68-00075F-Cv; Fri, 23 Jul 2021 04:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159956.294174; Fri, 23 Jul 2021 04:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6n68-00072E-8P; Fri, 23 Jul 2021 04:47:44 +0000
Received: by outflank-mailman (input) for mailman id 159956;
 Fri, 23 Jul 2021 04:47:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+AEX=MP=gmail.com=scottwd@srs-us1.protection.inumbo.net>)
 id 1m6n66-00071s-Pl
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 04:47:42 +0000
Received: from mail-qt1-x82e.google.com (unknown [2607:f8b0:4864:20::82e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b09c96c1-7e35-4ba0-bc42-0e723b92cc1c;
 Fri, 23 Jul 2021 04:47:40 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id t18so881972qta.8
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jul 2021 21:47:40 -0700 (PDT)
Received: from lagunitas.localdomain
 (96-95-26-25-static.hfc.comcastbusiness.net. [96.95.26.25])
 by smtp.gmail.com with ESMTPSA id m80sm10944305qke.98.2021.07.22.21.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 21:47:39 -0700 (PDT)
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
X-Inumbo-ID: b09c96c1-7e35-4ba0-bc42-0e723b92cc1c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Xr145TI2CgrKyzYfPGBN4fzjFjCjp40PVLz07IZctU=;
        b=AJY9BaKhn6LyJy4sMLYVkBz8z4XeJ9rGWTlVupGmznEqi87Q1KYFCwIQc9Z1STsc/h
         LF/QfDs2msFaYq0ONX3RMIV030HP0ksquNhzZZd/8VS+ANTJKsm2IOJmyk2zLw1rzVx1
         NpawiBtdiFh+iydzMDd79Lby5+IePzQAn4gPwom0fd0IQ9c2dGZmXnp0QM9NGztk3AHi
         +fesrYURTnBk+AjDQy/5qHSKGwu9D3GCGgz8jT/2XC6YPc/EV9ob3Ky3wFsemdhrlWZZ
         C3IoOY4Y7+sQXIlCrB05kb86G+Ou0duHm4206J5oxRiSJYBy3BnFQs/1ecJ4djt3l5BJ
         K/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Xr145TI2CgrKyzYfPGBN4fzjFjCjp40PVLz07IZctU=;
        b=tmlwcNZQmGrxQdo0FEqcsJ/K/zliw7z0+EhJ1X+eMzZi5hM+zO9BuewWUvHlhajtVR
         cCV4gc1bNaS8XILKNlPw2TGaN50LaQALjPRZWu6RLthAh6bS5TDFwjR4YKBysfpUadH/
         A6su9Jmk5X5fIJg6Mce6XXB+WDxIQDEGnIyWEJ7/qVNcrhGhrHZTQ7tHH/dlF2TPMUlt
         HoWJLTeGWoORJx8Lp2MYkIiHy0saqWzlEWEXxTlxjpRwBkZGwFniXmzRf13HhkvlCsM7
         YGIeRrclVhojTTPp7Fxt/R0+mEgCVVYkuS++Cyl1o3DSD1PWcsECwtc0+xdtdm7wKQn8
         bYxQ==
X-Gm-Message-State: AOAM530PKqFgdbvor+HmSdG5al1/dJ8CxKY3S7X+VVFrAS7RHsisEcOi
	rMzjPOMqctTRqAzd6iK/YRXJbG6VCnE66ELT
X-Google-Smtp-Source: ABdhPJzaKp9KvQaPQndY2rsSv/A28qX6xb34YArCSGZ3epgpQXyp9CwARt67GUwQHip0PloQHgLoTQ==
X-Received: by 2002:a05:622a:1987:: with SMTP id u7mr2506309qtc.45.1627015660104;
        Thu, 22 Jul 2021 21:47:40 -0700 (PDT)
From: Scott Davis <scottwd@gmail.com>
X-Google-Original-From: Scott Davis <scott.davis@starlab.io>
To: xen-devel@lists.xenproject.org
Cc: Scott Davis <scott.davis@starlab.io>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH] tools/xl: Add device_model_stubdomain_init_seclabel option to xl.cfg
Date: Fri, 23 Jul 2021 00:47:31 -0400
Message-Id: <8ee22fab0731347dd7f998c5f336eac804785c28.1627014699.git.scott.davis@starlab.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds an option to the xl domain configuration syntax for specifying
a build-time XSM security label for device-model stubdomains separate from
the run-time label specified by 'device_model_stubdomain_seclabel'. Fields
are also added to the 'libxl_domain_build_info' struct to contain the new
information, and a new call to 'xc_flask_relabel_domain' inserted to
affect the change at the appropriate time.

The implementation mirrors that of the 'seclabel' and 'init_seclabel'
options for user domains. When all used in concert, this enables the
creation of security policies that minimize run-time privileges between
the toolstack domain, device-model stubdomains, and user domains.

Signed-off-by: Scott Davis <scott.davis@starlab.io>
---
 docs/man/xl.cfg.5.pod.in             | 10 ++++++++++
 tools/golang/xenlight/helpers.gen.go |  5 +++++
 tools/golang/xenlight/types.gen.go   |  2 ++
 tools/include/libxl.h                | 10 ++++++++++
 tools/libs/light/libxl_create.c      | 28 ++++++++++++++++++++++++++--
 tools/libs/light/libxl_dm.c          | 14 +++++++++-----
 tools/libs/light/libxl_types.idl     |  2 ++
 tools/xl/xl_parse.c                  | 12 +++++++++++-
 8 files changed, 75 insertions(+), 8 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 56370a37db..3458d357fc 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2762,6 +2762,16 @@ you have selected.
 
 Assign an XSM security label to the device-model stubdomain.
 
+=item B<device_model_stubdomain_init_seclabel="LABEL">
+
+Specify a temporary XSM security label for the device-model stubdomain used
+during creation of it and its associated guest. The stubdomain's XSM label will
+then be changed to the execution seclabel (as specified by
+B<device_model_stubdomain_seclabel>) once creation is complete, prior to
+unpausing the stubdomain's guest. With proper (re)labeling, a security policy
+can be constructed that minimizes run-time privileges between the toolstack
+domain, device-model stubdomains, and user domains.
+
 =item B<device_model_args=[ "ARG", "ARG", ...]>
 
 Pass additional arbitrary options on the device-model command
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index db82537b42..e961cb5f75 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1022,6 +1022,8 @@ x.StubdomainRamdisk = C.GoString(xc.stubdomain_ramdisk)
 x.DeviceModel = C.GoString(xc.device_model)
 x.DeviceModelSsidref = uint32(xc.device_model_ssidref)
 x.DeviceModelSsidLabel = C.GoString(xc.device_model_ssid_label)
+x.DeviceModelExecSsidref = uint32(xc.device_model_exec_ssidref)
+x.DeviceModelExecSsidLabel = C.GoString(xc.device_model_exec_ssid_label)
 x.DeviceModelUser = C.GoString(xc.device_model_user)
 if err := x.Extra.fromC(&xc.extra);err != nil {
 return fmt.Errorf("converting field Extra: %v", err)
@@ -1351,6 +1353,9 @@ xc.device_model = C.CString(x.DeviceModel)}
 xc.device_model_ssidref = C.uint32_t(x.DeviceModelSsidref)
 if x.DeviceModelSsidLabel != "" {
 xc.device_model_ssid_label = C.CString(x.DeviceModelSsidLabel)}
+xc.device_model_exec_ssidref = C.uint32_t(x.DeviceModelExecSsidref)
+if x.DeviceModelExecSsidLabel != "" {
+xc.device_model_exec_ssid_label = C.CString(x.DeviceModelExecSsidLabel)}
 if x.DeviceModelUser != "" {
 xc.device_model_user = C.CString(x.DeviceModelUser)}
 if err := x.Extra.toC(&xc.extra); err != nil {
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index a214dd9df6..45061d1afa 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -487,6 +487,8 @@ StubdomainRamdisk string
 DeviceModel string
 DeviceModelSsidref uint32
 DeviceModelSsidLabel string
+DeviceModelExecSsidref uint32
+DeviceModelExecSsidLabel string
 DeviceModelUser string
 Extra StringList
 ExtraPv StringList
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index ae7fe27c1f..62b69222f6 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1069,6 +1069,16 @@ typedef struct libxl__ctx libxl_ctx;
  */
 #define LIBXL_HAVE_SSID_LABEL 1
 
+/*
+ * LIBXL_HAVE_BUILDINFO_DEVICE_MODEL_STUBDOMAIN_EXEC_SSID
+ *
+ * If this is defined, then the libxl_domain_build_info structure will
+ * contain 'device_model_exec_ssidref' and 'device_model_exec_ssid_label' for
+ * specifying a run-time XSM security label separate from the build-time label
+ * specified in 'device_model_ssidref' and 'device_model_ssid_label'.
+ */
+#define LIBXL_HAVE_BUILDINFO_DEVICE_MODEL_STUBDOMAIN_EXEC_SSID 1
+
 /*
  * LIBXL_HAVE_CPUPOOL_NAME
  *
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index e356b2106d..a12da5531d 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1060,13 +1060,31 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
         char *s = d_config->b_info.device_model_ssid_label;
         ret = libxl_flask_context_to_sid(ctx, s, strlen(s),
                                          &d_config->b_info.device_model_ssidref);
+        if (ret) {
+            if (errno == ENOSYS) {
+                LOGD(WARN, domid,
+                     "XSM Disabled: device_model_stubdomain_init_seclabel not supported");
+                ret = 0;
+            } else {
+                LOGD(ERROR, domid,
+                     "Invalid device_model_stubdomain_init_seclabel: %s", s);
+                goto error_out;
+            }
+        }
+    }
+
+    if (d_config->b_info.device_model_exec_ssid_label) {
+        char *s = d_config->b_info.device_model_exec_ssid_label;
+        ret = libxl_flask_context_to_sid(ctx, s, strlen(s),
+                                         &d_config->b_info.device_model_exec_ssidref);
         if (ret) {
             if (errno == ENOSYS) {
                 LOGD(WARN, domid,
                      "XSM Disabled: device_model_stubdomain_seclabel not supported");
                 ret = 0;
             } else {
-                LOGD(ERROR, domid, "Invalid device_model_stubdomain_seclabel: %s", s);
+                LOGD(ERROR, domid,
+                     "Invalid device_model_stubdomain_seclabel: %s", s);
                 goto error_out;
             }
         }
@@ -1935,7 +1953,13 @@ static void domcreate_complete(libxl__egc *egc,
     libxl__domain_build_state_dispose(&dcs->build_state);
 
     if (!rc && d_config->b_info.exec_ssidref)
-        rc = xc_flask_relabel_domain(CTX->xch, dcs->guest_domid, d_config->b_info.exec_ssidref);
+        rc = xc_flask_relabel_domain(CTX->xch, dcs->guest_domid,
+                                     d_config->b_info.exec_ssidref);
+
+    if (!rc && dcs->sdss.pvqemu.guest_domid != INVALID_DOMID &&
+        d_config->b_info.device_model_exec_ssidref)
+        rc = xc_flask_relabel_domain(CTX->xch, dcs->sdss.pvqemu.guest_domid,
+                                     d_config->b_info.device_model_exec_ssidref);
 
     bool retain_domain = !rc || rc == ERROR_ABORTED;
 
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index dbd3c7f278..2b69b207c4 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2300,20 +2300,24 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
     sdss->pvqemu.guest_domid = INVALID_DOMID;
 
     libxl_domain_create_info_init(&dm_config->c_info);
+    libxl_domain_build_info_init(&dm_config->b_info);
+    libxl_domain_build_info_init_type(&dm_config->b_info, LIBXL_DOMAIN_TYPE_PV);
+
     dm_config->c_info.type = LIBXL_DOMAIN_TYPE_PV;
     dm_config->c_info.name = libxl__stub_dm_name(gc,
                                     libxl__domid_to_name(gc, guest_domid));
-    /* When we are here to launch stubdom, ssidref is a valid value
-     * already, no need to parse it again.
+
+    /* When we are here to launch stubdom, ssidrefs are valid values already,
+     * no need to parse them again.
      */
     dm_config->c_info.ssidref = guest_config->b_info.device_model_ssidref;
     dm_config->c_info.ssid_label = NULL;
+    dm_config->b_info.exec_ssidref =
+        guest_config->b_info.device_model_exec_ssidref;
+    dm_config->b_info.exec_ssid_label = NULL;
 
     libxl_uuid_generate(&dm_config->c_info.uuid);
 
-    libxl_domain_build_info_init(&dm_config->b_info);
-    libxl_domain_build_info_init_type(&dm_config->b_info, LIBXL_DOMAIN_TYPE_PV);
-
     dm_config->b_info.shadow_memkb = 0;
     dm_config->b_info.max_vcpus = 1;
     dm_config->b_info.max_memkb = guest_config->b_info.stubdomain_memkb;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index f45adddab0..b483729b9c 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -528,6 +528,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("device_model",     string),
     ("device_model_ssidref", uint32),
     ("device_model_ssid_label", string),
+    ("device_model_exec_ssidref",    uint32),
+    ("device_model_exec_ssid_label", string),
     ("device_model_user", string),
 
     # extra parameters pass directly to qemu, NULL terminated
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 9fb0791429..236f8b2fc0 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2523,10 +2523,20 @@ skip_usbdev:
     xlu_cfg_get_defbool (config, "device_model_stubdomain_override",
                          &b_info->device_model_stubdomain, 0);
 
-    if (!xlu_cfg_get_string (config, "device_model_stubdomain_seclabel",
+    if (!xlu_cfg_get_string (config, "device_model_stubdomain_init_seclabel",
                              &buf, 0))
+        xlu_cfg_replace_string(config, "device_model_stubdomain_init_seclabel",
+                               &b_info->device_model_ssid_label, 0);
+
+    if (!xlu_cfg_get_string (config, "device_model_stubdomain_seclabel",
+                             &buf, 0)) {
+        if (b_info->device_model_ssid_label)
+            xlu_cfg_replace_string(config, "device_model_stubdomain_seclabel",
+                                   &b_info->device_model_exec_ssid_label, 0);
+        else
             xlu_cfg_replace_string(config, "device_model_stubdomain_seclabel",
                                    &b_info->device_model_ssid_label, 0);
+    }
 
     xlu_cfg_replace_string(config, "device_model_user",
                            &b_info->device_model_user, 0);
-- 
2.25.1


