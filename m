Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F856EC5F4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 08:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525077.816125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqpID-0003Ui-3W; Mon, 24 Apr 2023 06:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525077.816125; Mon, 24 Apr 2023 06:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqpIC-0003S4-WC; Mon, 24 Apr 2023 06:03:17 +0000
Received: by outflank-mailman (input) for mailman id 525077;
 Mon, 24 Apr 2023 06:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhGg=AP=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pqpIB-0000mg-5j
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 06:03:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id b2133e1d-e265-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 08:03:12 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1915E1691;
 Sun, 23 Apr 2023 23:03:56 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FB4F3F587;
 Sun, 23 Apr 2023 23:03:11 -0700 (PDT)
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
X-Inumbo-ID: b2133e1d-e265-11ed-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 10/12] xen/tools: add sve parameter in XL configuration
Date: Mon, 24 Apr 2023 07:02:46 +0100
Message-Id: <20230424060248.1488859-11-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424060248.1488859-1-luca.fancellu@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sve parameter in XL configuration to allow guests to use
SVE feature.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v5:
 - Update documentation
 - re-generated golang files
Changes from v4:
 - Rename sve field to sve_vl (Anthony), changed type to
   libxl_sve_type
 - Sanity check of sve field in libxl instead of xl, update docs
   (Anthony)
 - drop Ack-by from George because of the changes in the Golang bits
Changes from v3:
 - no changes
Changes from v2:
 - domain configuration field name has changed to sve_vl,
   also its value now is VL/128.
 - Add Ack-by George for the Golang bits
Changes from v1:
 - updated to use arch_capabilities field for vector length
Changes from RFC:
 - changed libxl_types.idl sve field to uint16
 - now toolstack uses info from physinfo to check against the
   sve XL value
 - Changed documentation
---
 docs/man/xl.cfg.5.pod.in             | 16 ++++++++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   | 23 +++++++++++++++++++++++
 tools/include/libxl.h                |  5 +++++
 tools/libs/light/libxl_arm.c         | 28 ++++++++++++++++++++++++++++
 tools/libs/light/libxl_types.idl     | 22 ++++++++++++++++++++++
 tools/xl/xl_parse.c                  |  8 ++++++++
 7 files changed, 104 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 10f37990be57..2ea996caa256 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2952,6 +2952,22 @@ Currently, only the "sbsa_uart" model is supported for ARM.
 
 =back
 
+=item B<sve="vl">
+
+The `sve` parameter enables Arm Scalable Vector Extension (SVE) usage for the
+guest and sets the maximum SVE vector length, the option is applicable only to
+AArch64 guests.
+A value equal to "disabled" disables the feature, this is the default value.
+Allowed values are "disabled", "128", "256", "384", "512", "640", "768", "896",
+"1024", "1152", "1280", "1408", "1536", "1664", "1792", "1920", "2048", "hw".
+Specifying "hw" means that the maximum vector length supported by the platform
+will be used.
+Please be aware that if a specific vector length is passed and its value is
+above the maximum vector length supported by the platform, an error will be
+raised.
+
+=back
+
 =head3 x86
 
 =over 4
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 35397be2f9e2..cd1a16e32eac 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1149,6 +1149,7 @@ default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
 x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
+x.ArchArm.SveVl = SveType(xc.arch_arm.sve_vl)
 if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
@@ -1653,6 +1654,7 @@ default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
 xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
+xc.arch_arm.sve_vl = C.libxl_sve_type(x.ArchArm.SveVl)
 if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 3d968a496744..b131a7eedc9d 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -490,6 +490,28 @@ TeeTypeNone TeeType = 0
 TeeTypeOptee TeeType = 1
 )
 
+type SveType int
+const(
+SveTypeHw SveType = -1
+SveTypeDisabled SveType = 0
+SveType128 SveType = 128
+SveType256 SveType = 256
+SveType384 SveType = 384
+SveType512 SveType = 512
+SveType640 SveType = 640
+SveType768 SveType = 768
+SveType896 SveType = 896
+SveType1024 SveType = 1024
+SveType1152 SveType = 1152
+SveType1280 SveType = 1280
+SveType1408 SveType = 1408
+SveType1536 SveType = 1536
+SveType1664 SveType = 1664
+SveType1792 SveType = 1792
+SveType1920 SveType = 1920
+SveType2048 SveType = 2048
+)
+
 type RdmReserve struct {
 Strategy RdmReserveStrategy
 Policy RdmReservePolicy
@@ -564,6 +586,7 @@ TypeUnion DomainBuildInfoTypeUnion
 ArchArm struct {
 GicVersion GicVersion
 Vuart VuartType
+SveVl SveType
 }
 ArchX86 struct {
 MsrRelaxed Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 4fa09ff7635a..cac641a7eba2 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -283,6 +283,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE 1
 
+/*
+ * libxl_domain_build_info has the arch_arm.sve_vl field.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SVE_VL 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index ddc7b2a15975..1e69dac2c4fa 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -3,6 +3,8 @@
 #include "libxl_libfdt_compat.h"
 #include "libxl_arm.h"
 
+#include <xen-tools/arm-arch-capabilities.h>
+
 #include <stdbool.h>
 #include <libfdt.h>
 #include <assert.h>
@@ -211,6 +213,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         return ERROR_FAIL;
     }
 
+    /* Parameter is sanitised in libxl__arch_domain_build_info_setdefault */
+    if (d_config->b_info.arch_arm.sve_vl) {
+        /* Vector length is divided by 128 in struct xen_domctl_createdomain */
+        config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
+    }
+
     return 0;
 }
 
@@ -1681,6 +1689,26 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
     /* ACPI is disabled by default */
     libxl_defbool_setdefault(&b_info->acpi, false);
 
+    /* Sanitise SVE parameter */
+    if (b_info->arch_arm.sve_vl) {
+        unsigned int max_sve_vl =
+            arch_capabilities_arm_sve(physinfo->arch_capabilities);
+
+        if (!max_sve_vl) {
+            LOG(ERROR, "SVE is unsupported on this machine.");
+            return ERROR_FAIL;
+        }
+
+        if (LIBXL_SVE_TYPE_HW == b_info->arch_arm.sve_vl) {
+            b_info->arch_arm.sve_vl = max_sve_vl;
+        } else if (b_info->arch_arm.sve_vl > max_sve_vl) {
+            LOG(ERROR,
+                "Invalid sve value: %d. Platform supports up to %u bits",
+                b_info->arch_arm.sve_vl, max_sve_vl);
+            return ERROR_FAIL;
+        }
+    }
+
     if (b_info->type != LIBXL_DOMAIN_TYPE_PV)
         return 0;
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index fd31dacf7d5a..9e48bb772646 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -523,6 +523,27 @@ libxl_tee_type = Enumeration("tee_type", [
     (1, "optee")
     ], init_val = "LIBXL_TEE_TYPE_NONE")
 
+libxl_sve_type = Enumeration("sve_type", [
+    (-1, "hw"),
+    (0, "disabled"),
+    (128, "128"),
+    (256, "256"),
+    (384, "384"),
+    (512, "512"),
+    (640, "640"),
+    (768, "768"),
+    (896, "896"),
+    (1024, "1024"),
+    (1152, "1152"),
+    (1280, "1280"),
+    (1408, "1408"),
+    (1536, "1536"),
+    (1664, "1664"),
+    (1792, "1792"),
+    (1920, "1920"),
+    (2048, "2048")
+    ], init_val = "LIBXL_SVE_TYPE_DISABLED")
+
 libxl_rdm_reserve = Struct("rdm_reserve", [
     ("strategy",    libxl_rdm_reserve_strategy),
     ("policy",      libxl_rdm_reserve_policy),
@@ -690,6 +711,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                ("vuart", libxl_vuart_type),
+                               ("sve_vl", libxl_sve_type),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1f6f47daf4e1..f036e56fc239 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2887,6 +2887,14 @@ skip_usbdev:
         }
     }
 
+    if (!xlu_cfg_get_string (config, "sve", &buf, 1)) {
+        e = libxl_sve_type_from_string(buf, &b_info->arch_arm.sve_vl);
+        if (e) {
+            fprintf(stderr, "Unknown sve \"%s\" specified\n", buf);
+            exit(EXIT_FAILURE);
+        }
+    }
+
     parse_vkb_list(config, d_config);
 
     d_config->virtios = NULL;
-- 
2.34.1


