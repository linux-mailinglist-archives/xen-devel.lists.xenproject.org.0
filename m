Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E97E6BAB94
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 10:06:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509944.786794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcN5W-0007et-VE; Wed, 15 Mar 2023 09:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509944.786794; Wed, 15 Mar 2023 09:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcN5W-0007aV-Nz; Wed, 15 Mar 2023 09:06:26 +0000
Received: by outflank-mailman (input) for mailman id 509944;
 Wed, 15 Mar 2023 09:06:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsHm=7H=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pcN5V-0005Kr-AM
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 09:06:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a87b664b-c310-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 10:06:23 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CFE84B3;
 Wed, 15 Mar 2023 02:07:06 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE36B3F8C6;
 Wed, 15 Mar 2023 02:06:21 -0700 (PDT)
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
X-Inumbo-ID: a87b664b-c310-11ed-b464-930f4c7d94ae
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 09/10] xen/tools: add sve parameter in XL configuration
Date: Wed, 15 Mar 2023 09:05:57 +0000
Message-Id: <20230315090558.731029-10-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315090558.731029-1-luca.fancellu@arm.com>
References: <20230315090558.731029-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sve parameter in XL configuration to allow guests to use
SVE feature.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v1:
 - updated to use arch_capabilities field for vector length
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
 tools/xl/xl_parse.c                  | 25 +++++++++++++++++++++++--
 7 files changed, 45 insertions(+), 2 deletions(-)

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
index aad9645222a1..fb3b55e0cc36 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1117,6 +1117,7 @@ default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
 x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
+x.ArchArm.Sve = uint16(xc.arch_arm.sve)
 if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
@@ -1602,6 +1603,7 @@ default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
 xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
+xc.arch_arm.sve = C.uint16_t(x.ArchArm.Sve)
 if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 88ec0260404f..8fd0d9b668a7 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -537,6 +537,7 @@ TypeUnion DomainBuildInfoTypeUnion
 ArchArm struct {
 GicVersion GicVersion
 Vuart VuartType
+Sve uint16
 }
 ArchX86 struct {
 MsrRelaxed Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index d652895075a0..1057962e2e3f 100644
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
index 0e90b6b408ec..ed21d32e703c 100644
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
index 853e9f357a1a..5574a91ce5a7 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -12,6 +12,7 @@
  * GNU Lesser General Public License for more details.
  */
 
+#include <arm_arch_capabilities.h>
 #include <ctype.h>
 #include <inttypes.h>
 #include <limits.h>
@@ -1316,8 +1317,6 @@ void parse_config_data(const char *config_source,
         exit(EXIT_FAILURE);
     }
 
-    libxl_physinfo_dispose(&physinfo);
-
     config= xlu_cfg_init(stderr, config_source);
     if (!config) {
         fprintf(stderr, "Failed to allocate for configuration\n");
@@ -2828,6 +2827,28 @@ skip_usbdev:
         }
     }
 
+    if (!xlu_cfg_get_long (config, "sve", &l, 0)) {
+        unsigned int arm_sve_vl =
+            arch_capabilities_arm_sve(physinfo.arch_capabilities);
+        if (!arm_sve_vl) {
+            fprintf(stderr, "SVE is not supported by the platform\n");
+            exit(-ERROR_FAIL);
+        } else if (((l % 128) != 0) || (l > 2048)) {
+            fprintf(stderr,
+                    "Invalid sve value: %ld. Needs to be <= 2048 and multiple"
+                    " of 128\n", l);
+            exit(-ERROR_FAIL);
+        } else if (l > arm_sve_vl) {
+            fprintf(stderr,
+                    "Invalid sve value: %ld. Platform supports up to %u bits\n",
+                    l, arm_sve_vl);
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
2.34.1


