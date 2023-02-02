Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE90C687B91
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 12:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488665.756903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXSJ-0004ZP-NU; Thu, 02 Feb 2023 11:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488665.756903; Thu, 02 Feb 2023 11:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXSJ-0004Td-H9; Thu, 02 Feb 2023 11:08:39 +0000
Received: by outflank-mailman (input) for mailman id 488665;
 Thu, 02 Feb 2023 11:08:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BK1=56=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pNXSI-0002sX-Dp
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 11:08:38 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f0699365-a2e9-11ed-b63b-5f92e7d2e73a;
 Thu, 02 Feb 2023 12:08:36 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 079C4152B;
 Thu,  2 Feb 2023 03:09:18 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 615443F64C;
 Thu,  2 Feb 2023 03:08:34 -0800 (PST)
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
X-Inumbo-ID: f0699365-a2e9-11ed-b63b-5f92e7d2e73a
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 06/10] xen/arm: enable Dom0 to use SVE feature
Date: Thu,  2 Feb 2023 11:08:12 +0000
Message-Id: <20230202110816.1252419-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202110816.1252419-1-luca.fancellu@arm.com>
References: <20230202110816.1252419-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a command line parameter to allow Dom0 the use of SVE resources,
the command line parameter dom0_sve controls the feature on this
domain and sets the maximum SVE vector length for Dom0.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from RFC:
 - Changed docs to explain that the domain won't be created if the
   requested vector length is above the supported one from the
   platform.
---
 docs/misc/xen-command-line.pandoc    | 13 +++++++++++++
 xen/arch/arm/arm64/sve.c             |  5 +++++
 xen/arch/arm/domain_build.c          |  4 ++++
 xen/arch/arm/include/asm/arm64/sve.h |  4 ++++
 4 files changed, 26 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 923910f553c5..5ccda7037f5a 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -995,6 +995,19 @@ restrictions set up here. Note that the values to be specified here are
 ACPI PXM ones, not Xen internal node numbers. `relaxed` sets up vCPU
 affinities to prefer but be not limited to the specified node(s).
 
+### dom0_sve (arm)
+> `= <integer>`
+
+> Default: `0`
+
+Enable arm SVE usage for Dom0 domain and sets the maximum SVE vector length.
+Values above 0 means feature is enabled for Dom0, otherwise feature is disabled.
+Possible values are from 0 to maximum 2048, being multiple of 128, that will be
+the maximum vector length.
+Please note that the platform can supports a lower value, if the requested value
+is above the supported one, the domain creation will fail and the system will
+stop.
+
 ### dom0_vcpus_pin
 > `= <boolean>`
 
diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
index bb3229ead005..6f6bf30b5c4c 100644
--- a/xen/arch/arm/arm64/sve.c
+++ b/xen/arch/arm/arm64/sve.c
@@ -5,10 +5,15 @@
  * Copyright (C) 2022 ARM Ltd.
  */
 
+#include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/sizes.h>
 #include <asm/arm64/sve.h>
 
+/* opt_dom0_sve: allow Dom0 to use SVE and set maximum vector length. */
+unsigned int __initdata opt_dom0_sve;
+integer_param("dom0_sve", opt_dom0_sve);
+
 extern unsigned int sve_get_hw_vl(void);
 extern void sve_save_ctx(uint64_t *sve_ctx, uint64_t *pregs, int save_ffr);
 extern void sve_load_ctx(uint64_t const *sve_ctx, uint64_t const *pregs,
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c2b97fa21e20..fbfdf3417cef 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -26,6 +26,7 @@
 #include <asm/platform.h>
 #include <asm/psci.h>
 #include <asm/setup.h>
+#include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
 #include <xen/event.h>
@@ -4076,6 +4077,9 @@ void __init create_dom0(void)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
+    if ( opt_dom0_sve > 0 )
+        dom0_cfg.arch.sve_vl_bits = opt_dom0_sve;
+
     dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
     if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
         panic("Error creating domain 0\n");
diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
index 28c31b329233..dc6e747cec9e 100644
--- a/xen/arch/arm/include/asm/arm64/sve.h
+++ b/xen/arch/arm/include/asm/arm64/sve.h
@@ -21,6 +21,8 @@ static inline bool is_vl_valid(uint16_t vl)
 
 #ifdef CONFIG_ARM64_SVE
 
+extern unsigned int opt_dom0_sve;
+
 register_t compute_max_zcr(void);
 register_t vl_to_zcr(uint16_t vl);
 uint16_t get_sys_vl_len(void);
@@ -31,6 +33,8 @@ void sve_restore_state(struct vcpu *v);
 
 #else /* !CONFIG_ARM64_SVE */
 
+#define opt_dom0_sve (0)
+
 static inline register_t compute_max_zcr(void)
 {
     return 0;
-- 
2.25.1


