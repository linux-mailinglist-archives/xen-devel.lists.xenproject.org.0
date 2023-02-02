Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F74E687B95
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 12:08:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488672.756944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXSQ-0005y1-V9; Thu, 02 Feb 2023 11:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488672.756944; Thu, 02 Feb 2023 11:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXSQ-0005ng-P1; Thu, 02 Feb 2023 11:08:46 +0000
Received: by outflank-mailman (input) for mailman id 488672;
 Thu, 02 Feb 2023 11:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BK1=56=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pNXSN-0002sX-UL
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 11:08:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f364e0bf-a2e9-11ed-b63b-5f92e7d2e73a;
 Thu, 02 Feb 2023 12:08:41 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 168111424;
 Thu,  2 Feb 2023 03:09:23 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB6483F64C;
 Thu,  2 Feb 2023 03:08:39 -0800 (PST)
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
X-Inumbo-ID: f364e0bf-a2e9-11ed-b63b-5f92e7d2e73a
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 09/10] xen/tools: add sve parameter in XL configuration
Date: Thu,  2 Feb 2023 11:08:15 +0000
Message-Id: <20230202110816.1252419-10-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202110816.1252419-1-luca.fancellu@arm.com>
References: <20230202110816.1252419-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sve parameter in XL configuration to allow guests to use
SVE feature.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from RFC:
 - changed libxl_types.idl sve field to uint16
 - now toolstack uses info from physinfo to check against the
   sve XL value
 - Changed documentation
---
 docs/man/xl.cfg.5.pod.in             | 11 +++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                |  5 +++++
 tools/libs/light/libxl_arm.c         |  2 ++
 tools/libs/light/libxl_types.idl     |  1 +
 tools/xl/xl_parse.c                  | 22 ++++++++++++++++++++--
 7 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 024bceeb61b2..bb138322e290 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2903,6 +2903,17 @@ Currently, only the "sbsa_uart" model is supported for ARM.
 
 =back
 
+=item B<sve="NUMBER">
+
+To enable SVE, user must specify a number different from zero, maximum 2048 and
+multiple of 128. That value will be the maximum number of SVE registers bits
+that the hypervisor will impose to this guest. If the platform has a lower
+supported bits value, then the domain creation will fail.
+A value equal to zero is the default and it means this guest is not allowed to
+use SVE.
+
+=back
+
 =head3 x86
 
 =over 4
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 0e2c1b3acc74..a58b5f1ea268 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1117,6 +1117,7 @@ default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
 x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
+x.ArchArm.Sve = int(xc.arch_arm.sve)
 if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
@@ -1602,6 +1603,7 @@ default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
 xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
+xc.arch_arm.sve = C.int(x.Sve)
 if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index d4b67c97bb54..f1ba391d2d3e 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -537,6 +537,7 @@ TypeUnion DomainBuildInfoTypeUnion
 ArchArm struct {
 GicVersion GicVersion
 Vuart VuartType
+Sve uint32
 }
 ArchX86 struct {
 MsrRelaxed Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index ce2997486953..6385db38bf8c 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -278,6 +278,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE 1
 
+/*
+ * libxl_domain_build_info has the arch_arm.sve field.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SVE 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index ddc7b2a15975..31f30e054bf4 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -211,6 +211,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         return ERROR_FAIL;
     }
 
+    config->arch.sve_vl_bits = d_config->b_info.arch_arm.sve;
+
     return 0;
 }
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 5bd44b37c74d..29a1c86ce3b5 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -663,6 +663,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                ("vuart", libxl_vuart_type),
+                               ("sve", uint16),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 853e9f357a1a..25af5d5dfafb 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1316,8 +1316,6 @@ void parse_config_data(const char *config_source,
         exit(EXIT_FAILURE);
     }
 
-    libxl_physinfo_dispose(&physinfo);
-
     config= xlu_cfg_init(stderr, config_source);
     if (!config) {
         fprintf(stderr, "Failed to allocate for configuration\n");
@@ -2828,6 +2826,26 @@ skip_usbdev:
         }
     }
 
+    if (!xlu_cfg_get_long (config, "sve", &l, 0)) {
+        if (!physinfo.cap_arm_sve) {
+            fprintf(stderr, "SVE is not supported by the platform\n");
+            exit(-ERROR_FAIL);
+        } else if (((l % 128) != 0) || (l > 2048)) {
+            fprintf(stderr,
+                    "Invalid sve value: %ld. Needs to be <= 2048 and multiple"
+                    " of 128\n", l);
+            exit(-ERROR_FAIL);
+        } else if (l > physinfo.arm_sve_vl_bits) {
+            fprintf(stderr,
+                    "Invalid sve value: %ld. Platform supports up to %u bits\n",
+                    l, physinfo.arm_sve_vl_bits);
+            exit(-ERROR_FAIL);
+        }
+        b_info->arch_arm.sve = l;
+    }
+
+    libxl_physinfo_dispose(&physinfo);
+
     parse_vkb_list(config, d_config);
 
     d_config->virtios = NULL;
-- 
2.25.1


