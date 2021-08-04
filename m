Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE2A3E064F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 19:08:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163788.299916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBKMq-0002SY-T0; Wed, 04 Aug 2021 17:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163788.299916; Wed, 04 Aug 2021 17:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBKMq-0002QJ-Pi; Wed, 04 Aug 2021 17:07:44 +0000
Received: by outflank-mailman (input) for mailman id 163788;
 Wed, 04 Aug 2021 17:07:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9K0=M3=gmail.com=scottwd@srs-us1.protection.inumbo.net>)
 id 1mBKMp-0002QD-4y
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 17:07:43 +0000
Received: from mail-qv1-xf2f.google.com (unknown [2607:f8b0:4864:20::f2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0469b286-edc0-4a86-b3c7-74e5cbe5a837;
 Wed, 04 Aug 2021 17:07:41 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id f91so1420784qva.9
 for <xen-devel@lists.xenproject.org>; Wed, 04 Aug 2021 10:07:41 -0700 (PDT)
Received: from lagunitas.localdomain
 (96-95-26-25-static.hfc.comcastbusiness.net. [96.95.26.25])
 by smtp.gmail.com with ESMTPSA id g10sm1097008qtp.67.2021.08.04.10.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 10:07:40 -0700 (PDT)
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
X-Inumbo-ID: 0469b286-edc0-4a86-b3c7-74e5cbe5a837
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mRYF6d6NyA7ZNiE2Sjji7SK/+cjjOaRPn/vE0qLzh+8=;
        b=RU/SHoFCls9X5XnOtuAt3YDddS2s6rrekql0tMJu5ixIVcVdnCpYYybPcscZf8pcSD
         lVGxIuKqBYOcWFurVK8D1zN3wQPrp2rywzCVoTSJvNtRioJboiSB9lw4xq2DTyaTm2sB
         TpMwk/hotVf1craUFxbAAJSwRmWadJGZekmYS4WqjWkb6ZySK4xM/oB2p2ycatwpI9jB
         0153YG73nhRqBe/kYAKAReL7VOPaw/jsA9q+syAwLo+fXeY4Ximd5ULHRSXOEr9QtcMl
         voea837kLi86QkPaCArp0Ao7HUpcZav1UBZIcCRak6myM+5u7dIfcaNWpJKVSrVhIvrX
         NjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mRYF6d6NyA7ZNiE2Sjji7SK/+cjjOaRPn/vE0qLzh+8=;
        b=mASmgLEisYn4Dqff5x2D/fy3bKCn3RuYORDIMoHCpEK43AhjhnfAaFAU2BcKFkM0uM
         NsLwdVKRP6NooM/ht+xRpZaR0Il2P0Bipx/iyJC/rArkR3gALeqNP6Ww659jtppcXztl
         yRXTB2yQdzaOM7HAuqzuhw/7XwRWU0150n13p2UUi/Js36MuvacX2Fr2i+4flmX5vbQw
         VCpPzZ7rW4LpIlFe9+L6QWGaOHF6c88nNXRDgIBNCxHi0dLZ/OmwahMC0AxJXuDArMEf
         eyTugUQq7xwIZJmOSUGmHlP9hl3dVk4l68K1ska8wH83XcaUqTCqq9KgMum5KgBxrf9t
         JBcg==
X-Gm-Message-State: AOAM531fVzJ21jjnoQ3Dnty9EJ5FrBcf3FWYOtwrn1RmUrAN6s8bMGDK
	wqnJrvtvrlx47HKkkzv7q5W190dbYMVMjhep
X-Google-Smtp-Source: ABdhPJxcMBnezJ0PchopdTDB+7zSMtNJbiuvEhxpq7V2vKzvFWmmvlgWUcsgg7AQljJGee+oU1El8w==
X-Received: by 2002:a0c:cd86:: with SMTP id v6mr507413qvm.5.1628096861037;
        Wed, 04 Aug 2021 10:07:41 -0700 (PDT)
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
Subject: [PATCH] tools/xl: Add stubdomain_cpus_mirror_guest option to xl.cfg
Date: Wed,  4 Aug 2021 13:07:23 -0400
Message-Id: <4c9e39e1bcf914df4ee47211afc4157154b637d8.1628091197.git.scott.davis@starlab.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a boolean flag to the xl domain configuration syntax for
causing a guest's CPU allocations to be mirrored to its associated
device-model stubdomain. If enabled, the stubdomain will use the same
VCPU count, CPU pool, and CPU affinities as the guest. Otherwise, the
default allocations (one VCPU scheduled on pool 0) will be used. It is
intended for use with Linux-based stubdomains.

In Xen deployments that make use of static CPU allocation, enabling this
would enhance workload isolation for guests that make heavy use of
emulated devices. It would also help prevent a malicious stubdomain from
mounting side-channel attacks against a dom0 running on the same cores.

Signed-off-by: Scott Davis <scott.davis@starlab.io>
---
 docs/man/xl.cfg.5.pod.in             |  8 ++++++++
 tools/golang/xenlight/helpers.gen.go |  6 ++++++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                |  9 +++++++++
 tools/libs/light/libxl_create.c      |  2 ++
 tools/libs/light/libxl_dm.c          | 20 +++++++++++++++++++-
 tools/libs/light/libxl_types.idl     |  1 +
 tools/xl/xl_parse.c                  |  2 ++
 8 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 4b1e3028d2..03dbdb9788 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2733,6 +2733,14 @@ toolstack domain. The binary provided here MUST be consistent with the
 B<device_model_version> which you have specified. You should not normally need
 to specify this option.
 
+=item B<stubdomain_cpus_mirror_guest=BOOLEAN>
+
+Turns on or off mirroring of a guest's CPU allocations to its device-model
+stubdomain. If enabled, the stubdomain will use the same VCPU count, CPU pool,
+and CPU affinities as its associated guest. Disabled (0) by default, in which
+case the stubdomain will have one VCPU and be scheduled on pool 0. Intended for
+use with Linux-based stubdomains.
+
 =item B<stubdomain_kernel="PATH">
 
 Override the path to the kernel image used as device-model stubdomain.
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index bfc1e7f312..42a98e79bf 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1016,6 +1016,9 @@ x.DeviceModelVersion = DeviceModelVersion(xc.device_model_version)
 if err := x.DeviceModelStubdomain.fromC(&xc.device_model_stubdomain);err != nil {
 return fmt.Errorf("converting field DeviceModelStubdomain: %v", err)
 }
+if err := x.StubdomainCpusMirrorGuest.fromC(&xc.stubdomain_cpus_mirror_guest);err != nil {
+return fmt.Errorf("converting field StubdomainCpusMirrorGuest: %v", err)
+}
 x.StubdomainMemkb = uint64(xc.stubdomain_memkb)
 x.StubdomainKernel = C.GoString(xc.stubdomain_kernel)
 x.StubdomainCmdline = C.GoString(xc.stubdomain_cmdline)
@@ -1342,6 +1345,9 @@ xc.device_model_version = C.libxl_device_model_version(x.DeviceModelVersion)
 if err := x.DeviceModelStubdomain.toC(&xc.device_model_stubdomain); err != nil {
 return fmt.Errorf("converting field DeviceModelStubdomain: %v", err)
 }
+if err := x.StubdomainCpusMirrorGuest.toC(&xc.stubdomain_cpus_mirror_guest); err != nil {
+return fmt.Errorf("converting field StubdomainCpusMirrorGuest: %v", err)
+}
 xc.stubdomain_memkb = C.uint64_t(x.StubdomainMemkb)
 if x.StubdomainKernel != "" {
 xc.stubdomain_kernel = C.CString(x.StubdomainKernel)}
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 09a3bb67e2..53bd54b740 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -481,6 +481,7 @@ MaxGrantFrames uint32
 MaxMaptrackFrames uint32
 DeviceModelVersion DeviceModelVersion
 DeviceModelStubdomain Defbool
+StubdomainCpusMirrorGuest Defbool
 StubdomainMemkb uint64
 StubdomainKernel string
 StubdomainCmdline string
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b9ba16d698..d5b30d4f37 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1042,6 +1042,15 @@ typedef struct libxl__ctx libxl_ctx;
  */
 #define LIBXL_HAVE_BUILDINFO_DEVICE_MODEL_STUBDOMAIN 1
 
+/*
+ * LIBXL_HAVE_BUILDINFO_DEVICE_MODEL_STUBDOMAIN_CPU_MIRRORING
+ *
+ * If this is defined, then the libxl_domain_build_info structure will contain
+ * the 'stubdomain_cpus_mirror_guest' boolean to enable the mirroring of a
+ * guest's CPU allocations to its associated device-model stubdomain.
+ */
+#define LIBXL_HAVE_BUILDINFO_DEVICE_MODEL_STUBDOMAIN_CPU_MIRRORING 1
+
 /*
  * LIBXL_HAVE_DEVICE_CHANNEL
  *
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index e356b2106d..d1cc05a3d5 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -204,6 +204,8 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         }
     }
 
+    libxl_defbool_setdefault(&b_info->stubdomain_cpus_mirror_guest, false);
+
     if (!b_info->max_vcpus)
         b_info->max_vcpus = 1;
     if (!b_info->avail_vcpus.size) {
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 9d93056b5c..062957f093 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2312,8 +2312,26 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
     libxl_domain_build_info_init(&dm_config->b_info);
     libxl_domain_build_info_init_type(&dm_config->b_info, LIBXL_DOMAIN_TYPE_PV);
 
+    if (libxl_defbool_val(guest_config->b_info.stubdomain_cpus_mirror_guest)) {
+        /* Copy CPU config from guest */
+        dm_config->c_info.pool_name = guest_config->c_info.pool_name;
+        dm_config->b_info.max_vcpus = guest_config->b_info.max_vcpus;
+        dm_config->b_info.avail_vcpus = guest_config->b_info.avail_vcpus;
+        dm_config->b_info.nodemap = guest_config->b_info.nodemap;
+        dm_config->b_info.num_vcpu_hard_affinity =
+            guest_config->b_info.num_vcpu_hard_affinity;
+        dm_config->b_info.vcpu_hard_affinity =
+            guest_config->b_info.vcpu_hard_affinity;
+        dm_config->b_info.num_vcpu_soft_affinity =
+            guest_config->b_info.num_vcpu_soft_affinity;
+        dm_config->b_info.vcpu_soft_affinity =
+            guest_config->b_info.vcpu_soft_affinity;
+        libxl_defbool_set(&dm_config->b_info.numa_placement, false);
+    } else {
+        dm_config->b_info.max_vcpus = 1;
+    }
+
     dm_config->b_info.shadow_memkb = 0;
-    dm_config->b_info.max_vcpus = 1;
     dm_config->b_info.max_memkb = guest_config->b_info.stubdomain_memkb;
     dm_config->b_info.max_memkb += guest_config->b_info.video_memkb;
     dm_config->b_info.target_memkb = dm_config->b_info.max_memkb;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 3f9fff653a..6f18e5be07 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -521,6 +521,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     
     ("device_model_version", libxl_device_model_version),
     ("device_model_stubdomain", libxl_defbool),
+    ("stubdomain_cpus_mirror_guest", libxl_defbool),
     ("stubdomain_memkb",   MemKB),
     ("stubdomain_kernel",  string),
     ("stubdomain_cmdline", string),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 17dddb4cd5..84f67835c3 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2531,6 +2531,8 @@ skip_usbdev:
     xlu_cfg_replace_string(config, "device_model_user",
                            &b_info->device_model_user, 0);
 
+    xlu_cfg_get_defbool (config, "stubdomain_cpus_mirror_guest",
+                         &b_info->stubdomain_cpus_mirror_guest, 0);
     xlu_cfg_replace_string (config, "stubdomain_kernel",
                             &b_info->stubdomain_kernel, 0);
     xlu_cfg_replace_string (config, "stubdomain_cmdline",
-- 
2.25.1


