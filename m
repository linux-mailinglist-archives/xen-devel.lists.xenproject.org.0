Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B283D010D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jul 2021 19:56:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158935.292432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5tyz-0004ZC-3x; Tue, 20 Jul 2021 17:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158935.292432; Tue, 20 Jul 2021 17:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5tyz-0004WV-0g; Tue, 20 Jul 2021 17:56:41 +0000
Received: by outflank-mailman (input) for mailman id 158935;
 Tue, 20 Jul 2021 17:56:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IpfO=MM=gmail.com=scottwd@srs-us1.protection.inumbo.net>)
 id 1m5tyx-0004WP-Uv
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 17:56:40 +0000
Received: from mail-qt1-x82c.google.com (unknown [2607:f8b0:4864:20::82c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2ee84e7-2eb2-4d00-b63e-c21ab1d2dd4e;
 Tue, 20 Jul 2021 17:56:38 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id w26so134933qto.9
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jul 2021 10:56:38 -0700 (PDT)
Received: from lagunitas.localdomain
 (96-95-26-25-static.hfc.comcastbusiness.net. [96.95.26.25])
 by smtp.gmail.com with ESMTPSA id 6sm9902073qkv.115.2021.07.20.10.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 10:56:37 -0700 (PDT)
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
X-Inumbo-ID: a2ee84e7-2eb2-4d00-b63e-c21ab1d2dd4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tjBCl0fIf7THtbsUHhCs+2J6Sd74Inird2KIJc+MoDo=;
        b=k9OIfm71PW208nZEBSrdF+NVOM7XCT7MaAbUW+Q+k5TFFXhoi9L310Tq2IgplTms7P
         u6iDHaUoZxf0w7Qy9z7vHTGbqpclsb3EKEEYafIj01flHx90Y77QOxBy8jOA3eEAaeJX
         9zWaid1IGmUqYBL2Do8I+5B1JlY0LdkRIW+wdNYK2n3hv+7U53dSjU5qDQkHlvzxFI1P
         RR6pr27ZGHrtURzdTPdUbOV2V7K9lBP8WEgVVh10gc9B1GPO6yjskNTdIiz4T76tcHBx
         klKqW8hnuZtTfc3D6qISEbD7emPvI0acYF681UntJmFFIXGv5wqXdH3Gvc7E4CULViQO
         G2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tjBCl0fIf7THtbsUHhCs+2J6Sd74Inird2KIJc+MoDo=;
        b=kBnwwpCMJbAYIV2uA9FEKsol7L4teDoMBc4dbifGPDbavSk4nNzzDiSP9tA2UvcL58
         XcQWpuGNnrcuv5XQNVZzVKtG5uJyYeKFvyR9asctMCKP8hTmCxx7gxr5ejy1e/iCdtvS
         Q7rIIjRWxgQQE+PjqUsj7StFZlc/9CMThvztddB3NHADIwuwsVshD+8jjOGX+FI+Pjkn
         l5xUF0k1OhPdFQiIpnnCaXFUUrQy7wNfNSPCew1WqXSOqv/Q3G5cExx2w81+xH4t7Y2u
         Kn5leqbeulTSAJSMjPGs31EpOoYjczAp2wwUmhr1AW4aO1gTWgeMfLnyGMFPpyyRURNr
         Ln1Q==
X-Gm-Message-State: AOAM533NWMZ7DEoDkDPQd0prwYRZNg74SJKSoS95fQsiBkloPBThzhdX
	JF826SRqB7yidUSw0IbZw9+k4NJhRN3OeIeJ
X-Google-Smtp-Source: ABdhPJyTbp5aRPOsiQY0HrJXeJ4cA06vf9siBIQAlBJAGj8d+rZ4WnK3nsAgLuwOCdwpF/zAmO0SQQ==
X-Received: by 2002:aed:30cd:: with SMTP id 71mr27247384qtf.31.1626803798282;
        Tue, 20 Jul 2021 10:56:38 -0700 (PDT)
From: Scott Davis <scottwd@gmail.com>
X-Google-Original-From: Scott Davis <scott.davis@starlab.io>
To: xen-devel@lists.xenproject.org
Cc: Scott Davis <scott.davis@starlab.io>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xl: Add stubdomain_cmdline option to xl.cfg
Date: Tue, 20 Jul 2021 13:56:34 -0400
Message-Id: <6562806d7430431dc154af2c6e4a5232725fc136.1626800539.git.scott.davis@starlab.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds an option to the xl domain configuration file syntax for specifying
a kernel command line for device-model stubdomains. It is intended for use with
Linux-based stubdomains.

Signed-off-by: Scott Davis <scott.davis@starlab.io>
---
 docs/man/xl.cfg.5.pod.in             | 4 ++++
 tools/golang/xenlight/helpers.gen.go | 3 +++
 tools/golang/xenlight/types.gen.go   | 1 +
 tools/libs/light/libxl_dm.c          | 1 +
 tools/libs/light/libxl_types.idl     | 1 +
 tools/xl/xl_parse.c                  | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 56370a37db..6c777cad5c 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2742,6 +2742,10 @@ In case of B<qemu-xen-traditional> it is expected to be MiniOS-based stubdomain
 image, in case of B<qemu-xen> it is expected to be Linux-based stubdomain
 kernel.
 
+=item B<stubdomain_cmdline="STRING">
+
+Append B<STRING> to the device-model stubdomain kernel command line.
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


