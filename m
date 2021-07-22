Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6176B3D288F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jul 2021 18:55:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159811.293889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6byR-0008H3-9o; Thu, 22 Jul 2021 16:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159811.293889; Thu, 22 Jul 2021 16:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6byR-0008Er-6X; Thu, 22 Jul 2021 16:55:03 +0000
Received: by outflank-mailman (input) for mailman id 159811;
 Thu, 22 Jul 2021 16:55:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mx4v=MO=gmail.com=scottwd@srs-us1.protection.inumbo.net>)
 id 1m6byP-0008Ek-G8
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 16:55:01 +0000
Received: from mail-qk1-x736.google.com (unknown [2607:f8b0:4864:20::736])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecf09604-334f-4aa6-8f22-cabbf0ae051d;
 Thu, 22 Jul 2021 16:55:00 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id q190so6049371qkd.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jul 2021 09:55:00 -0700 (PDT)
Received: from lagunitas.localdomain
 (96-95-26-25-static.hfc.comcastbusiness.net. [96.95.26.25])
 by smtp.gmail.com with ESMTPSA id m17sm9516628qtu.34.2021.07.22.09.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 09:54:58 -0700 (PDT)
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
X-Inumbo-ID: ecf09604-334f-4aa6-8f22-cabbf0ae051d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+qtGke1okL2AN40/XGbkf4rzyvqwtoLs9lmPunYPJOw=;
        b=j6j5S1fb8jIJKJayLyHo0v1bQID9Ns883Mqrsb9L/aN5FM6NrtTxwkDP+Y//GHBYpI
         jgsbgFA/y8uSy0W7uWlLzQraRz+3SPZwVhkYdssE6Ie7jpwaqzH7g+MUESbQmjBRHP5S
         IglyEsSKFCgZrUvYfyuYeD7iEMH5+2tKxnrPS8joW+v8WQDcozO7EDb7KRd6ni9H9ydD
         c3HR7TsqNNQXT//qC4Y3cHokSNrOfEj5QzzWqyZ/5CYMbtfBJGc6cvy3C1rDNHErLktQ
         xJKQUZb0FQwPAslOAtBM1LGz1Qy16lW/jKmrRM/I+bUXK89HsbyOh3IyEXHql8PPzvGF
         VQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+qtGke1okL2AN40/XGbkf4rzyvqwtoLs9lmPunYPJOw=;
        b=ClDTFIpceqInrw24zI2KsOpY/1rN0/AISnOF+lKeohtXHaneju1+Lf6M5IY8jYStRR
         5/rL8xG7nXBk8434Nb6qu1vRHhixJX3fqEAmbCM60brRdAzO4w1Ov5XRYHd2RPq2Lei2
         Uf4Qx2poal6r2D5lq8GmUyeY5wa7V6JXh1x3+XmyeArOcteQTmKo7pdC08OTI7UDrfOy
         zj0D/H78xnzm5drshvUoAZX8u5cGT/EqnOoAl5WxgP1Sj7PYHP6bi4GgTNgr+LFD0hdY
         hNj1IsUxAKo+MPgVU5z+g9zxIlFZg2/Yoln7VNh0CsbUAx+y4r5EwBdy1MaokGXHGGBq
         GJtg==
X-Gm-Message-State: AOAM531a2WwszBb/PMdKypizKr8+3sfY+nspwqOFl1E0/XyWeGnnhcXI
	aola7ndfBVBHvF6L7HdXjp4UBpPhb+nOWk3G
X-Google-Smtp-Source: ABdhPJxrnDIadPzesUIiXOaz71PDimOKJSD62kS4TL3XcEjfT4ri277Wg19Bxwl+c1rPhS8GziUdJQ==
X-Received: by 2002:a37:641:: with SMTP id 62mr602952qkg.149.1626972899550;
        Thu, 22 Jul 2021 09:54:59 -0700 (PDT)
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
	Jason Andryuk <jandryuk@gmail.com>
Subject: [XEN PATCH v2] tools/xl: Add stubdomain_cmdline option to xl.cfg
Date: Thu, 22 Jul 2021 12:54:30 -0400
Message-Id: <93dd20b91ca75b35c5886e4051659e58bceb080d.1626970707.git.scott.davis@starlab.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds an option to the xl domain configuration file syntax for specifying
a kernel command line for device-model stubdomains. It is intended for use with
Linux-based stubdomains.

Signed-off-by: Scott Davis <scott.davis@starlab.io>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
Changes in v2:
- add #define LIBXL_HAVE_BUILDINFO_DEVICE_MODEL_STUBDOMAIN
- correct wording in xl.cfg documentation from "Append" to "Set"
---
 docs/man/xl.cfg.5.pod.in             |  4 ++++
 tools/golang/xenlight/helpers.gen.go |  3 +++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                | 12 ++++++++++++
 tools/libs/light/libxl_dm.c          |  1 +
 tools/libs/light/libxl_types.idl     |  1 +
 tools/xl/xl_parse.c                  |  2 ++
 7 files changed, 24 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 56370a37db..d6f96e5310 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2742,6 +2742,10 @@ In case of B<qemu-xen-traditional> it is expected to be MiniOS-based stubdomain
 image, in case of B<qemu-xen> it is expected to be Linux-based stubdomain
 kernel.
 
+=item B<stubdomain_cmdline="STRING">
+
+Set the device-model stubdomain kernel command line to B<STRING>.
+
 =item B<stubdomain_ramdisk="PATH">
 
 Override the path to the ramdisk image used as device-model stubdomain.
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index db82537b42..bfc1e7f312 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1018,6 +1018,7 @@ return fmt.Errorf("converting field DeviceModelStubdomain: %v", err)
 }
 x.StubdomainMemkb = uint64(xc.stubdomain_memkb)
 x.StubdomainKernel = C.GoString(xc.stubdomain_kernel)
+x.StubdomainCmdline = C.GoString(xc.stubdomain_cmdline)
 x.StubdomainRamdisk = C.GoString(xc.stubdomain_ramdisk)
 x.DeviceModel = C.GoString(xc.device_model)
 x.DeviceModelSsidref = uint32(xc.device_model_ssidref)
@@ -1344,6 +1345,8 @@ return fmt.Errorf("converting field DeviceModelStubdomain: %v", err)
 xc.stubdomain_memkb = C.uint64_t(x.StubdomainMemkb)
 if x.StubdomainKernel != "" {
 xc.stubdomain_kernel = C.CString(x.StubdomainKernel)}
+if x.StubdomainCmdline != "" {
+xc.stubdomain_cmdline = C.CString(x.StubdomainCmdline)}
 if x.StubdomainRamdisk != "" {
 xc.stubdomain_ramdisk = C.CString(x.StubdomainRamdisk)}
 if x.DeviceModel != "" {
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index a214dd9df6..09a3bb67e2 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -483,6 +483,7 @@ DeviceModelVersion DeviceModelVersion
 DeviceModelStubdomain Defbool
 StubdomainMemkb uint64
 StubdomainKernel string
+StubdomainCmdline string
 StubdomainRamdisk string
 DeviceModel string
 DeviceModelSsidref uint32
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index ae7fe27c1f..b9ba16d698 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1030,6 +1030,18 @@ typedef struct libxl__ctx libxl_ctx;
  */
 #define LIBXL_HAVE_BUILDINFO_KERNEL 1
 
+/*
+ * LIBXL_HAVE_BUILDINFO_DEVICE_MODEL_STUBDOMAIN
+ *
+ * If this is defined, then the libxl_domain_build_info structure will contain
+ * the following fields that specify options for device model stubdomains:
+ *  - stubdomain_memkb:   integer indicating stubdomain RAM size
+ *  - stubdomain_kernel:  string indicating stubdomain kernel image location
+ *  - stubdomain_cmdline: string of parameters to pass to the stubdomain kernel
+ *  - stubdomain_ramdisk: string indicating stubdomain ramdisk location
+ */
+#define LIBXL_HAVE_BUILDINFO_DEVICE_MODEL_STUBDOMAIN 1
+
 /*
  * LIBXL_HAVE_DEVICE_CHANNEL
  *
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index dbd3c7f278..2d54596834 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2373,6 +2373,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
     }
 
     stubdom_state->pv_kernel.path = guest_config->b_info.stubdomain_kernel;
+    stubdom_state->pv_cmdline = guest_config->b_info.stubdomain_cmdline;
     stubdom_state->pv_ramdisk.path = guest_config->b_info.stubdomain_ramdisk;
 
     /* fixme: this function can leak the stubdom if it fails */
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index f45adddab0..e782e15cf2 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -523,6 +523,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("device_model_stubdomain", libxl_defbool),
     ("stubdomain_memkb",   MemKB),
     ("stubdomain_kernel",  string),
+    ("stubdomain_cmdline", string),
     ("stubdomain_ramdisk", string),
     # if you set device_model you must set device_model_version too
     ("device_model",     string),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 9fb0791429..17dddb4cd5 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2533,6 +2533,8 @@ skip_usbdev:
 
     xlu_cfg_replace_string (config, "stubdomain_kernel",
                             &b_info->stubdomain_kernel, 0);
+    xlu_cfg_replace_string (config, "stubdomain_cmdline",
+                            &b_info->stubdomain_cmdline, 0);
     xlu_cfg_replace_string (config, "stubdomain_ramdisk",
                             &b_info->stubdomain_ramdisk, 0);
     if (!xlu_cfg_get_long (config, "stubdomain_memory", &l, 0))
-- 
2.25.1


