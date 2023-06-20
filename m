Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3D1737294
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551993.861859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyw-0007TP-EU; Tue, 20 Jun 2023 17:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551993.861859; Tue, 20 Jun 2023 17:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyw-0007O5-9p; Tue, 20 Jun 2023 17:17:30 +0000
Received: by outflank-mailman (input) for mailman id 551993;
 Tue, 20 Jun 2023 17:17:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBeyt-0005iB-UQ
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:17:27 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 542214f4-0f8e-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 19:17:27 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-570114e1feaso57381267b3.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:17:27 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 f81-20020a25cf54000000b00bcc0f2e4f05sm461938ybg.59.2023.06.20.10.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:17:25 -0700 (PDT)
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
X-Inumbo-ID: 542214f4-0f8e-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281446; x=1689873446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6n7UkNFBYZK+AuffqP9HBzXa1ya+3d/QBUvXRQbFCI=;
        b=r5JhHlD7JEcSljp6bqBMH7Os3GLHWYE2c3zb4auizeHvepM/3G3Xlf2oKW2nlVEHYH
         5e81JK507vpiQX0d/WdDxIwV0mceFriEJJCP0c+pQwfk3Ca0k1fbw5/oMTtIWn5mm6R5
         UVcaXE+9VELaWqgVPFwXixRbepznblrbBprO1OZxluVWBzdbJN8UKFt1osvLmy4Qa6aG
         4IU2jUes4S9CGjo2fz+GfpVkBkqQAdCHon0kRXn7XgpEBdIU+BLMUUfgT1jR/XmZpzt4
         uDyyL1Y872Qxw9Kb7n3/T9u1TIfjbZpfeA88V5yxoQMQA2A6cE5BGa8Cn6YYd6/gRYEH
         WnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281446; x=1689873446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6n7UkNFBYZK+AuffqP9HBzXa1ya+3d/QBUvXRQbFCI=;
        b=bagvDyyiCK0gmC2JSgoPvy3P0JSrwRGS6Q8xmepqw5m/J4h/edeCqfoWYd9N9sYZei
         zVkgC4FmQ73wbzaer0nx/k75GiqpKL75xZLcaZixQjbyPFGFHMIU043bnV6eKrJxU7DG
         yVHWVvUJmaiSJkzGURYj4/On4r6enDmxt3G8V6o4kVJ74Ny5CX2oGr9j506SwD29LEZE
         i87xPtZg5jY1k4A9j3xgLEt0jEVX7QoOFxYtv1vLr2Z38VCHdbKz7bvsRktBc0Gf20rY
         /Z7INp2iAFQJf9vIvuP1ngX5OEFs/WEXhsAarrcG0c2AqeVDjvOS5B7mJxSN7VvJ/HBr
         tK8Q==
X-Gm-Message-State: AC+VfDyKS/cVb2KTb1fFWSO4wq1S4LSkJgVUKLQCQEjdBgPOEDfZLgA0
	Ixv6Jk4h/R4C+2HBobewxOiW8MO+isGCrQ==
X-Google-Smtp-Source: ACHHUZ68QC9oB49thILBTGeZaENYOVn48+DUMt+IbjZtfNSwljGZxv+Qb3iD0g2PT+etPmH1FI2Wow==
X-Received: by 2002:a25:8046:0:b0:bc4:5a65:1a4f with SMTP id a6-20020a258046000000b00bc45a651a4fmr10790263ybn.5.1687281445775;
        Tue, 20 Jun 2023 10:17:25 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Joel Upham <jupham125@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 08/12] libxl: Q35 support (new option device_model_machine)
Date: Tue, 20 Jun 2023 13:15:48 -0400
Message-Id: <2aaf3c01bb1e43384fa5e5e0c4583d586f0a1bfe.1687215890.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687215890.git.jupham125@gmail.com>
References: <cover.1687215890.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a new domain config option to select the emulated machine type,
device_model_machine. It has following possible values:
- "i440" - i440 emulation (default)
- "q35" - emulate a Q35 machine. By default, the storage interface is AHCI.

Note that omitting device_model_machine parameter means i440 system
by default, so the default behavior doesn't change for existing domain
config files.

Setting device_model_machine to "q35" sends '-machine q35,accel=xen'
argument to QEMU. Unlike i440, there no separate machine type
to enable/disable Xen platform device, it is controlled via a machine
property only. See 'libxl: Xen Platform device support for Q35' patch for
a detailed description.

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 tools/libs/light/libxl_dm.c      | 20 ++++++++++++++------
 tools/libs/light/libxl_types.idl |  8 ++++++++
 tools/xl/xl_parse.c              | 14 ++++++++++++++
 3 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index fc264a3a13..17bc2113e1 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1809,13 +1809,21 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             flexarray_append(dm_args, b_info->extra_pv[i]);
         break;
     case LIBXL_DOMAIN_TYPE_HVM:
-        if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
-            /* Switching here to the machine "pc" which does not add
-             * the xen-platform device instead of the default "xenfv" machine.
-             */
-            machinearg = libxl__strdup(gc, "pc,accel=xen,suppress-vmdesc=on");
+        if (b_info->device_model_machine == LIBXL_DEVICE_MODEL_MACHINE_Q35) {
+            if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
+                machinearg = libxl__sprintf(gc, "q35,accel=xen");
+            } else {
+                machinearg = libxl__sprintf(gc, "q35,accel=xen,xen-platform-dev=on");
+            }
         } else {
-            machinearg = libxl__strdup(gc, "xenfv,suppress-vmdesc=on");
+            if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
+                /* Switching here to the machine "pc" which does not add
+                 * the xen-platform device instead of the default "xenfv" machine.
+                 */
+                machinearg = libxl__strdup(gc, "pc,accel=xen,suppress-vmdesc=on");
+            } else {
+                machinearg = libxl__strdup(gc, "xenfv,suppress-vmdesc=on");
+            }
         }
         if (b_info->u.hvm.mmio_hole_memkb) {
             uint64_t max_ram_below_4g = (1ULL << 32) -
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index c10292e0d7..b1aadae877 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -108,6 +108,13 @@ libxl_device_model_version = Enumeration("device_model_version", [
     (2, "QEMU_XEN"),             # Upstream based qemu-xen device model
     ])
 
+libxl_device_model_machine = Enumeration("device_model_machine", [
+    (0, "UNKNOWN"),
+    (1, "I440"),
+    (2, "Q35"),
+    ])
+
+
 libxl_console_type = Enumeration("console_type", [
     (0, "UNKNOWN"),
     (1, "SERIAL"),
@@ -575,6 +582,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("device_model_ssidref", uint32),
     ("device_model_ssid_label", string),
     ("device_model_user", string),
+    ("device_model_machine", libxl_device_model_machine),
 
     # extra parameters pass directly to qemu, NULL terminated
     ("extra",            libxl_string_list),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1f6f47daf4..e6fb7a409a 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2689,6 +2689,20 @@ skip_usbdev:
     if (!xlu_cfg_get_long (config, "stubdomain_memory", &l, 0))
         b_info->stubdomain_memkb = l * 1024;
 
+    if (!xlu_cfg_get_string (config, "device_model_machine", &buf, 0)) {
+        if (!strcmp(buf, "i440")) {
+            b_info->device_model_machine = LIBXL_DEVICE_MODEL_MACHINE_I440;
+        } else if (!strcmp(buf, "q35")) {
+            b_info->device_model_machine = LIBXL_DEVICE_MODEL_MACHINE_Q35;
+        } else {
+            fprintf(stderr,
+                    "Unknown device_model_machine \"%s\" specified\n", buf);
+            exit(1);
+        }
+    } else {
+        b_info->device_model_machine = LIBXL_DEVICE_MODEL_MACHINE_UNKNOWN;
+    }
+
 #define parse_extra_args(type)                                            \
     e = xlu_cfg_get_list_as_string_list(config, "device_model_args"#type, \
                                     &b_info->extra##type, 0);            \
-- 
2.34.1


