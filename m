Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FF96CA1E8
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 13:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515172.797843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgka7-00019T-IY; Mon, 27 Mar 2023 11:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515172.797843; Mon, 27 Mar 2023 11:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgka7-00014C-86; Mon, 27 Mar 2023 11:00:07 +0000
Received: by outflank-mailman (input) for mailman id 515172;
 Mon, 27 Mar 2023 11:00:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K09h=7T=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pgka5-0007YG-LO
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 11:00:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 874313c1-cc8e-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 13:00:04 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E379C14;
 Mon, 27 Mar 2023 04:00:48 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 025133F663;
 Mon, 27 Mar 2023 04:00:02 -0700 (PDT)
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
X-Inumbo-ID: 874313c1-cc8e-11ed-85db-49a42c6b2330
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
Subject: [PATCH v4 07/12] xen: enable Dom0 to use SVE feature
Date: Mon, 27 Mar 2023 11:59:39 +0100
Message-Id: <20230327105944.1360856-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327105944.1360856-1-luca.fancellu@arm.com>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a command line parameter to allow Dom0 the use of SVE resources,
the command line parameter sve=<integer>, sub argument of dom0=,
controls the feature on this domain and sets the maximum SVE vector
length for Dom0.

Add a new function, parse_integer(), to parse an integer command
line argument.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v3:
 - Don't use fixed len types when not needed (Jan)
 - renamed domainconfig_encode_vl to sve_encode_vl
 - Use a sub argument of dom0= to enable the feature (Jan)
 - Add parse_integer() function
Changes from v2:
 - xen_domctl_createdomain field has changed into sve_vl and its
   value now is the VL / 128, create an helper function for that.
Changes from v1:
 - No changes
Changes from RFC:
 - Changed docs to explain that the domain won't be created if the
   requested vector length is above the supported one from the
   platform.
---
 docs/misc/xen-command-line.pandoc    | 16 ++++++++++++++--
 xen/arch/arm/arm64/sve.c             |  9 +++++++++
 xen/arch/arm/domain_build.c          | 11 ++++++++++-
 xen/arch/arm/include/asm/arm64/sve.h | 16 ++++++++++++++++
 xen/common/kernel.c                  | 24 ++++++++++++++++++++++++
 xen/include/xen/lib.h                | 10 ++++++++++
 6 files changed, 83 insertions(+), 3 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index e0b89b7d3319..06c1eb4e6d6f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -777,9 +777,9 @@ Specify the bit width of the DMA heap.
 
 ### dom0
     = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
-                cpuid-faulting=<bool>, msr-relaxed=<bool> ]
+                cpuid-faulting=<bool>, msr-relaxed=<bool> ] (x86)
 
-    Applicability: x86
+    = List of [ sve=<integer> ] (Arm)
 
 Controls for how dom0 is constructed on x86 systems.
 
@@ -838,6 +838,18 @@ Controls for how dom0 is constructed on x86 systems.
 
     If using this option is necessary to fix an issue, please report a bug.
 
+Enables features on dom0 on Arm systems.
+
+*   The `sve` integer parameter enables Arm SVE usage for Dom0 domain and sets
+    the maximum SVE vector length.
+    Values above 0 means feature is enabled for Dom0, otherwise feature is
+    disabled.
+    Possible values are from 0 to maximum 2048, being multiple of 128, that will
+    be the maximum vector length.
+    Please note that the platform can supports a lower value, if the requested
+    value is above the supported one, the domain creation will fail and the
+    system will stop.
+
 ### dom0-cpuid
     = List of comma separated booleans
 
diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
index 696a97811cac..6416403817e3 100644
--- a/xen/arch/arm/arm64/sve.c
+++ b/xen/arch/arm/arm64/sve.c
@@ -5,10 +5,14 @@
  * Copyright (C) 2022 ARM Ltd.
  */
 
+#include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/sizes.h>
 #include <asm/arm64/sve.h>
 
+/* opt_dom0_sve: allow Dom0 to use SVE and set maximum vector length. */
+unsigned int __initdata opt_dom0_sve;
+
 extern unsigned int sve_get_hw_vl(void);
 extern void sve_save_ctx(uint64_t *sve_ctx, uint64_t *pregs, int save_ffr);
 extern void sve_load_ctx(uint64_t const *sve_ctx, uint64_t const *pregs,
@@ -115,3 +119,8 @@ void sve_restore_state(struct vcpu *v)
 
     sve_load_ctx(sve_ctx_zreg_end, v->arch.vfp.fpregs, 1);
 }
+
+int __init sve_parse_dom0_param(const char *str_begin, const char *str_end)
+{
+    return parse_integer("sve", str_begin, str_end, (int*)&opt_dom0_sve);
+}
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 35dbe964fc8b..f6019ce30149 100644
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
@@ -61,7 +62,12 @@ custom_param("dom0_mem", parse_dom0_mem);
 
 int __init parse_arch_dom0_param(const char *str_begin, const char *str_end)
 {
-    return -1;
+    int rc = 0;
+
+    if ( sve_parse_dom0_param(str_begin, str_end) < 0 )
+        rc = -EINVAL;
+
+    return rc;
 }
 
 /* Override macros from asm/page.h to make them work with mfn_t */
@@ -4089,6 +4095,9 @@ void __init create_dom0(void)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
+    if ( opt_dom0_sve > 0 )
+        dom0_cfg.arch.sve_vl = sve_encode_vl(opt_dom0_sve);
+
     dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
     if ( IS_ERR(dom0) )
         panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
index d38a37408439..69a1044c37d9 100644
--- a/xen/arch/arm/include/asm/arm64/sve.h
+++ b/xen/arch/arm/include/asm/arm64/sve.h
@@ -25,8 +25,15 @@ static inline unsigned int sve_decode_vl(unsigned int sve_vl)
     return sve_vl * SVE_VL_MULTIPLE_VAL;
 }
 
+static inline unsigned int sve_encode_vl(unsigned int sve_vl_bits)
+{
+    return sve_vl_bits / SVE_VL_MULTIPLE_VAL;
+}
+
 #ifdef CONFIG_ARM64_SVE
 
+extern unsigned int opt_dom0_sve;
+
 register_t compute_max_zcr(void);
 register_t vl_to_zcr(unsigned int vl);
 unsigned int get_sys_vl_len(void);
@@ -34,9 +41,12 @@ int sve_context_init(struct vcpu *v);
 void sve_context_free(struct vcpu *v);
 void sve_save_state(struct vcpu *v);
 void sve_restore_state(struct vcpu *v);
+int sve_parse_dom0_param(const char *str_begin, const char *str_end);
 
 #else /* !CONFIG_ARM64_SVE */
 
+#define opt_dom0_sve (0)
+
 static inline register_t compute_max_zcr(void)
 {
     return 0;
@@ -61,6 +71,12 @@ static inline void sve_context_free(struct vcpu *v) {}
 static inline void sve_save_state(struct vcpu *v) {}
 static inline void sve_restore_state(struct vcpu *v) {}
 
+static inline int sve_parse_dom0_param(const char *str_begin,
+                                       const char *str_end)
+{
+    return -1;
+}
+
 #endif
 
 #endif /* _ARM_ARM64_SVE_H */
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index f7b1f65f373c..97b460f5a5c2 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -314,6 +314,30 @@ int parse_boolean(const char *name, const char *s, const char *e)
     return -1;
 }
 
+int parse_integer(const char *name, const char *s, const char *e,
+                  int *val)
+{
+    size_t slen, nlen;
+    const char *str;
+    long long pval;
+
+    slen = e ? ({ ASSERT(e >= s); e - s; }) : strlen(s);
+    nlen = strlen(name);
+
+    /* Does s start with name or contains only the name? */
+    if ( (slen <= nlen) || strncmp(s, name, nlen) || (s[nlen] != '=') )
+        return -1;
+
+    pval = simple_strtoll(&s[nlen + 1], &str, 0);
+
+    if ( (str != e) || (pval < INT_MIN) || (pval > INT_MAX) )
+        return -2;
+
+    *val = pval;
+
+    return 0;
+}
+
 int cmdline_strcmp(const char *frag, const char *name)
 {
     for ( ; ; frag++, name++ )
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 05ee1e18af6b..900f1257acb4 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -94,6 +94,16 @@ int parse_bool(const char *s, const char *e);
  */
 int parse_boolean(const char *name, const char *s, const char *e);
 
+/**
+ * Given a specific name, parses a string of the form:
+ *   $NAME[=...]
+ * returning 0 and a value in val, for a recognised integer.
+ * Returns -1 for name not found, general errors, or -2 if name is found but
+ * not recognised/overflow/underflow value.
+ */
+int parse_integer(const char *name, const char *s, const char *e,
+                  int *val);
+
 /**
  * Very similar to strcmp(), but will declare a match if the NUL in 'name'
  * lines up with comma, colon, semicolon or equals in 'frag'.  Designed for
-- 
2.34.1


