Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F41F665E3B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 15:45:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475509.737274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcM0-00069D-2M; Wed, 11 Jan 2023 14:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475509.737274; Wed, 11 Jan 2023 14:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcLz-00063i-Qx; Wed, 11 Jan 2023 14:45:23 +0000
Received: by outflank-mailman (input) for mailman id 475509;
 Wed, 11 Jan 2023 14:45:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1gQc=5I=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pFcFb-0000FC-Er
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 14:38:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a760cc4e-91bd-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 15:38:46 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D45BEFEC;
 Wed, 11 Jan 2023 06:39:27 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78DB13F71A;
 Wed, 11 Jan 2023 06:38:44 -0800 (PST)
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
X-Inumbo-ID: a760cc4e-91bd-11ed-91b6-6bf2151ebd3b
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 6/8] xen/arm: enable Dom0 to use SVE feature
Date: Wed, 11 Jan 2023 14:38:24 +0000
Message-Id: <20230111143826.3224-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230111143826.3224-1-luca.fancellu@arm.com>
References: <20230111143826.3224-1-luca.fancellu@arm.com>

Add a command line parameter to allow Dom0 the use of SVE resources,
the command line parameter dom0_sve controls the feature on this
domain and sets the maximum SVE vector length for Dom0.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misc/xen-command-line.pandoc    | 12 ++++++++++++
 xen/arch/arm/arm64/sve.c             |  5 +++++
 xen/arch/arm/domain_build.c          |  4 ++++
 xen/arch/arm/include/asm/arm64/sve.h |  4 ++++
 4 files changed, 25 insertions(+)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 923910f553c5..940a96f4207c 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -995,6 +995,18 @@ restrictions set up here. Note that the values to be specified here are
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
+Please note that the specified value is a maximum allowed vector length, so if
+the platform supports only a lower value, the lower one will be chosen.
+
 ### dom0_vcpus_pin
 > `= <boolean>`
 
diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
index c7b325700fe4..9f8c5d21a59f 100644
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
index 829cea8de84f..48c3fdc28063 100644
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
@@ -4075,6 +4076,9 @@ void __init create_dom0(void)
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
2.17.1


