Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BAC63F4C8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450942.708487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m5c-0003rJ-Qv; Thu, 01 Dec 2022 16:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450942.708487; Thu, 01 Dec 2022 16:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m5c-0003pW-O1; Thu, 01 Dec 2022 16:07:08 +0000
Received: by outflank-mailman (input) for mailman id 450942;
 Thu, 01 Dec 2022 16:07:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0m5b-0003mC-Lv
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:07:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 3397a7d0-7192-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 17:07:06 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EC0DED1;
 Thu,  1 Dec 2022 08:07:12 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 214B03F73B;
 Thu,  1 Dec 2022 08:07:05 -0800 (PST)
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
X-Inumbo-ID: 3397a7d0-7192-11ed-91b6-6bf2151ebd3b
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH 06/21] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and viommu config param
Date: Thu,  1 Dec 2022 16:02:30 +0000
Message-Id: <fc259a3c780aeb312ea1043703add9e9bca1a7e1.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new viommu_type field and field values XEN_DOMCTL_CONFIG_VIOMMU_NONE
XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3 in xen_arch_domainconfig to
enable/disable vIOMMU support for domains.

Also add viommu="N" parameter to xl domain configuration to enable the
vIOMMU for the domains. Currently, only the "smmuv3" type is supported
for ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 docs/man/xl.cfg.5.pod.in             | 11 +++++++++++
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                |  5 +++++
 tools/libs/light/libxl_arm.c         | 13 +++++++++++++
 tools/libs/light/libxl_types.idl     |  6 ++++++
 tools/xl/xl_parse.c                  |  9 +++++++++
 7 files changed, 47 insertions(+)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index ec444fb2ba..5854d777ed 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2870,6 +2870,17 @@ Currently, only the "sbsa_uart" model is supported for ARM.
 
 =back
 
+=item B<viommu="N">
+
+To enable viommu, user must specify the following option in the VM
+config file:
+
+viommu = "smmuv3"
+
+Currently, only the "smmuv3" type is supported for ARM.
+
+=back
+
 =head3 x86
 
 =over 4
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index cb1bdf9bdf..8b6d771fc7 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1117,6 +1117,7 @@ default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
 x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
+x.ArchArm.Viommu = ViommuType(xc.arch_arm.viommu)
 if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
@@ -1602,6 +1603,7 @@ default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
 xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
+xc.arch_arm.viommu = C.libxl_viommu_type(x.ArchArm.Viommu)
 if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 871576fb0e..16c835ebeb 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -531,6 +531,7 @@ TypeUnion DomainBuildInfoTypeUnion
 ArchArm struct {
 GicVersion GicVersion
 Vuart VuartType
+Viommu ViommuType
 }
 ArchX86 struct {
 MsrRelaxed Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index d652895075..49563f57bd 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -278,6 +278,11 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE 1
 
+/*
+ * libxl_domain_build_info has the arch_arm.viommu_type field.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARM_VIOMMU 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index cd84a7c66e..b8eff10a41 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -179,6 +179,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         return ERROR_FAIL;
     }
 
+    switch (d_config->b_info.arch_arm.viommu_type) {
+    case LIBXL_VIOMMU_TYPE_NONE:
+        config->arch.viommu_type = XEN_DOMCTL_CONFIG_VIOMMU_NONE;
+        break;
+    case LIBXL_VIOMMU_TYPE_SMMUV3:
+        config->arch.viommu_type = XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3;
+        break;
+    default:
+        LOG(ERROR, "Unknown vIOMMU type %d",
+            d_config->b_info.arch_arm.viommu_type);
+        return ERROR_FAIL;
+    }
+
     return 0;
 }
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9e3d33cb5a..06ee5ac6ba 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -492,6 +492,11 @@ libxl_tee_type = Enumeration("tee_type", [
     (1, "optee")
     ], init_val = "LIBXL_TEE_TYPE_NONE")
 
+libxl_viommu_type = Enumeration("viommu_type", [
+    (0, "none"),
+    (1, "smmuv3")
+    ], init_val = "LIBXL_VIOMMU_TYPE_NONE")
+
 libxl_rdm_reserve = Struct("rdm_reserve", [
     ("strategy",    libxl_rdm_reserve_strategy),
     ("policy",      libxl_rdm_reserve_policy),
@@ -658,6 +663,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                ("vuart", libxl_vuart_type),
+                               ("viommu_type", libxl_viommu_type),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 644ab8f8fd..ef6d8bb3f7 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2751,6 +2751,15 @@ skip_usbdev:
         }
     }
 
+    if (!xlu_cfg_get_string (config, "viommu", &buf, 1)) {
+        e = libxl_viommu_type_from_string(buf, &b_info->arch_arm.viommu_type);
+        if (e) {
+            fprintf(stderr,
+                    "Unknown vIOMMU type \"%s\" specified\n", buf);
+            exit(-ERROR_FAIL);
+        }
+    }
+
     parse_vkb_list(config, d_config);
 
     xlu_cfg_get_defbool(config, "xend_suspend_evtchn_compat",
-- 
2.25.1


