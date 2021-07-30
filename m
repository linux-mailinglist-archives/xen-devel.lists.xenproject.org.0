Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7125C3DBF18
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 21:36:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162648.298217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9YHk-00087S-2m; Fri, 30 Jul 2021 19:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162648.298217; Fri, 30 Jul 2021 19:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9YHj-000856-UY; Fri, 30 Jul 2021 19:35:07 +0000
Received: by outflank-mailman (input) for mailman id 162648;
 Fri, 30 Jul 2021 19:35:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F32Y=MW=gmail.com=scottwd@srs-us1.protection.inumbo.net>)
 id 1m9YHi-000850-FO
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 19:35:06 +0000
Received: from mail-qt1-x82e.google.com (unknown [2607:f8b0:4864:20::82e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36607801-a506-44f1-b562-cfa8f5b5705d;
 Fri, 30 Jul 2021 19:35:04 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id g11so7202577qts.11
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jul 2021 12:35:04 -0700 (PDT)
Received: from lagunitas.localdomain
 (96-95-26-25-static.hfc.comcastbusiness.net. [96.95.26.25])
 by smtp.gmail.com with ESMTPSA id d28sm1404294qkj.25.2021.07.30.12.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 12:35:02 -0700 (PDT)
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
X-Inumbo-ID: 36607801-a506-44f1-b562-cfa8f5b5705d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1/GU6ELIB9q/0G07qNsLe1tQU6fN+0eUqQiM1oZsAv4=;
        b=n/8FKe/dcZ23C2xSLd6u6VVfIFEH/U7nKloAQiqQOBi2910P4OILLiS7k4f9LT+OfF
         I2YFrOSEWFHH0wWLa6202+O0iTo/dbrIkHQ0OopCciThFVNtc3JlN2prNXvOZQwHV603
         nJxi+CT6ykABMz4WK1ErIgarFZcjUatxyFYNzkXs19P+UZjbwMbzThyP9DGtgaGTQOwY
         Bzb1fVhgkvaTTu/lqsBXALnFtpC6CvyqU5Jhej2WLjG5qrLw9q4Nqti5yNW00jgyH///
         XO7/2o6iPjMcGbxz/eaikCPgRqba7SyVHlo5d88UvfI8i/Vo9ViXfe/hLoqAhX6Y/wbt
         dcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1/GU6ELIB9q/0G07qNsLe1tQU6fN+0eUqQiM1oZsAv4=;
        b=MvUad2Y7XukIdp0bO5seJcardAPSOyaq6Cqv54Nmz0vl+cdJzWSnKKDZ1BDjwYhXCj
         MFTPMK+AHanJ9FcghnNczPEkt/gUSvLCOW7xWx6gSVHfVTz3ToLj4hoPSv7OxdkWRl3L
         kCXVXCmCqS/OUw6SMbj21V6jxEmYczqPTn1rLHZHxqz9yHaZiYTpL3pEl6ZIW2mxH7Rf
         64iiClSlevG/doSXAwIIMjAGv30tXVQKYofyMqKFST4iWfeLDkkHbtLAWxtUP7rdIbQY
         XltAAANPFzSCa8kl0FLwIJFX85PU13nxz6nCJ0+0N+oFcz0ElMQ4PqkZPOAl+84yKiVJ
         mB2w==
X-Gm-Message-State: AOAM532U4Hff6/ZRH0UgTO9N0SnwUFnn+Y0e4jNn3LFWcu5agjRY9Vjp
	f0L8xblt/LJRfWzlel/mCZhUytFmF+PLUjdm
X-Google-Smtp-Source: ABdhPJz+UCmcI4QUqOhmpcfLnsSeH5Yyj0FB62CxAYeFYM1c3tggZSnE6W4S9Wkbm/wPjQ06UxXM3Q==
X-Received: by 2002:ac8:66ca:: with SMTP id m10mr3649155qtp.171.1627673703668;
        Fri, 30 Jul 2021 12:35:03 -0700 (PDT)
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
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] tools/xl: Add device_model_stubdomain_init_seclabel option to xl.cfg
Date: Fri, 30 Jul 2021 15:34:02 -0400
Message-Id: <edb72ed62c7c1154d5ed282e57e1750b6d79fa15.1627672412.git.scott.davis@starlab.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds an option to the xl domain configuration syntax for specifying
a build-time XSM security label for device-model stubdomains separate
from the run-time label specified by 'device_model_stubdomain_seclabel'.
Fields are also added to the 'libxl_domain_build_info' struct to contain
the new information, and a new call to 'xc_flask_relabel_domain'
inserted to affect the change at the appropriate time.

The device-model stubdomain is relabeled at the same time as its guest,
just before the guest is unpaused. This requires the stubdomain itself
to be unpaused and run for a short time prior to being relabeled, but
allows PCI device assignments specified in xl.cfg to be completed prior
to relabeling. This choice allows the privileges required to perform
assignments to be dropped in the relabeling.

The implementation mirrors that of the 'seclabel' and 'init_seclabel'
options for user domains. When all used in concert, this enables the
creation of security policies that minimize run-time privileges between
the toolstack domain, device-model stubdomains, and user domains.

Signed-off-by: Scott Davis <scott.davis@starlab.io>
---
Changes in v2:
- removed superfluous chanegs to libxl_dm.c
- changed all security label lookup failures due to FLASK being disabled
  from warnings to hard errors based on mailing list discussion
- added discussion of relabel point to commit message
---
 docs/man/xl.cfg.5.pod.in             | 10 +++++++
 tools/golang/xenlight/helpers.gen.go |  5 ++++
 tools/golang/xenlight/types.gen.go   |  2 ++
 tools/include/libxl.h                | 10 +++++++
 tools/libs/light/libxl_create.c      | 42 ++++++++++++++++++++--------
 tools/libs/light/libxl_types.idl     |  2 ++
 tools/xl/xl_parse.c                  | 12 +++++++-
 7 files changed, 71 insertions(+), 12 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 4b1e3028d2..7c8a696d61 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2766,6 +2766,16 @@ you have selected.
 
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
index bfc1e7f312..a70eb5eb58 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1023,6 +1023,8 @@ x.StubdomainRamdisk = C.GoString(xc.stubdomain_ramdisk)
 x.DeviceModel = C.GoString(xc.device_model)
 x.DeviceModelSsidref = uint32(xc.device_model_ssidref)
 x.DeviceModelSsidLabel = C.GoString(xc.device_model_ssid_label)
+x.DeviceModelExecSsidref = uint32(xc.device_model_exec_ssidref)
+x.DeviceModelExecSsidLabel = C.GoString(xc.device_model_exec_ssid_label)
 x.DeviceModelUser = C.GoString(xc.device_model_user)
 if err := x.Extra.fromC(&xc.extra);err != nil {
 return fmt.Errorf("converting field Extra: %v", err)
@@ -1354,6 +1356,9 @@ xc.device_model = C.CString(x.DeviceModel)}
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
index 09a3bb67e2..a76570cae7 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -488,6 +488,8 @@ StubdomainRamdisk string
 DeviceModel string
 DeviceModelSsidref uint32
 DeviceModelSsidLabel string
+DeviceModelExecSsidref uint32
+DeviceModelExecSsidLabel string
 DeviceModelUser string
 Extra StringList
 ExtraPv StringList
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b9ba16d698..ca3ec3e53d 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1081,6 +1081,16 @@ typedef struct libxl__ctx libxl_ctx;
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
index e356b2106d..892527c4b4 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1032,12 +1032,11 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
                                          &d_config->c_info.ssidref);
         if (ret) {
             if (errno == ENOSYS) {
-                LOGD(WARN, domid, "XSM Disabled: init_seclabel not supported");
-                ret = 0;
+                LOGD(ERROR, domid, "XSM Disabled: init_seclabel not supported");
             } else {
                 LOGD(ERROR, domid, "Invalid init_seclabel: %s", s);
-                goto error_out;
             }
+            goto error_out;
         }
     }
 
@@ -1047,12 +1046,11 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
                                          &d_config->b_info.exec_ssidref);
         if (ret) {
             if (errno == ENOSYS) {
-                LOGD(WARN, domid, "XSM Disabled: seclabel not supported");
-                ret = 0;
+                LOGD(ERROR, domid, "XSM Disabled: seclabel not supported");
             } else {
                 LOGD(ERROR, domid, "Invalid seclabel: %s", s);
-                goto error_out;
             }
+            goto error_out;
         }
     }
 
@@ -1062,14 +1060,30 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
                                          &d_config->b_info.device_model_ssidref);
         if (ret) {
             if (errno == ENOSYS) {
-                LOGD(WARN, domid,
-                     "XSM Disabled: device_model_stubdomain_seclabel not supported");
-                ret = 0;
+                LOGD(ERROR, domid,
+                     "XSM Disabled: device_model_stubdomain_init_seclabel not supported");
             } else {
-                LOGD(ERROR, domid, "Invalid device_model_stubdomain_seclabel: %s", s);
+                LOGD(ERROR, domid,
+                     "Invalid device_model_stubdomain_init_seclabel: %s", s);
+            }
             goto error_out;
         }
     }
+
+    if (d_config->b_info.device_model_exec_ssid_label) {
+        char *s = d_config->b_info.device_model_exec_ssid_label;
+        ret = libxl_flask_context_to_sid(ctx, s, strlen(s),
+                                         &d_config->b_info.device_model_exec_ssidref);
+        if (ret) {
+            if (errno == ENOSYS) {
+                LOGD(ERROR, domid,
+                     "XSM Disabled: device_model_stubdomain_seclabel not supported");
+            } else {
+                LOGD(ERROR, domid,
+                     "Invalid device_model_stubdomain_seclabel: %s", s);
+            }
+            goto error_out;
+        }
     }
 
     if (d_config->c_info.pool_name) {
@@ -1935,7 +1949,13 @@ static void domcreate_complete(libxl__egc *egc,
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
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 3f9fff653a..490d0fa059 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -529,6 +529,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("device_model",     string),
     ("device_model_ssidref", uint32),
     ("device_model_ssid_label", string),
+    ("device_model_exec_ssidref",    uint32),
+    ("device_model_exec_ssid_label", string),
     ("device_model_user", string),
 
     # extra parameters pass directly to qemu, NULL terminated
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 17dddb4cd5..211fcdc0c8 100644
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


