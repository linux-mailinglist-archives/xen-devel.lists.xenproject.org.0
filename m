Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BC1717807
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 09:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541553.844439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4GC6-0005Sh-9J; Wed, 31 May 2023 07:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541553.844439; Wed, 31 May 2023 07:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4GC6-0005NI-5N; Wed, 31 May 2023 07:24:30 +0000
Received: by outflank-mailman (input) for mailman id 541553;
 Wed, 31 May 2023 07:24:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKzP=BU=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1q4GC4-00053N-TG
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 07:24:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2cad721d-ff84-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 09:24:27 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5FF915BF;
 Wed, 31 May 2023 00:25:11 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 752683F663;
 Wed, 31 May 2023 00:24:25 -0700 (PDT)
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
X-Inumbo-ID: 2cad721d-ff84-11ed-b231-6b7b168915f2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 02/12] xen/arm: add SVE vector length field to the domain
Date: Wed, 31 May 2023 08:24:03 +0100
Message-Id: <20230531072413.868673-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230531072413.868673-1-luca.fancellu@arm.com>
References: <20230531072413.868673-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sve_vl field to arch_domain and xen_arch_domainconfig struct,
to allow the domain to have an information about the SVE feature
and the number of SVE register bits that are allowed for this
domain.

sve_vl field is the vector length in bits divided by 128, this
allows to use less space in the structures.

The field is used also to allow or forbid a domain to use SVE,
because a value equal to zero means the guest is not allowed to
use the feature.

Check that the requested vector length is lower or equal to the
platform supported vector length, otherwise fail on domain
creation.

Check that only 64 bit domains have SVE enabled, otherwise fail.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes from v7:
 - add r-by Bertrand
 - add r-by Julien
Changes from v6:
 - Style fix, have is_sve_domain as static inline instead of macro
   (Julien)
Changes from v5:
 - Update commit message stating the interface ver. bump (Bertrand)
 - in struct arch_domain, protect sve_vl with CONFIG_ARM64_SVE,
   given the change, move also is_sve_domain() where it's protected
   inside sve.h and create a stub when the macro is not defined,
   protect the usage of sve_vl where needed.
   (Julien)
 - Add a check for 32 bit guest running on top of 64 bit host that
   have sve parameter enabled to stop the domain creation, added in
   construct_domain() of domain_build.c and subarch_do_domctl of
   domctl.c. (Julien)
Changes from v4:
 - Return 0 in get_sys_vl_len() if sve is not supported, code style fix,
   removed else if since the conditions can't fallthrough, removed not
   needed condition checking for VL bits validity because it's already
   covered, so delete is_vl_valid() function. (Jan)
Changes from v3:
 - don't use fixed types when not needed, use encoded value also in
   arch_domain so rename sve_vl_bits in sve_vl. (Jan)
 - rename domainconfig_decode_vl to sve_decode_vl because it will now
   be used also to decode from arch_domain value
 - change sve_vl from uint16_t to uint8_t and move it after "type" field
   to optimize space.
Changes from v2:
 - rename field in xen_arch_domainconfig from "sve_vl_bits" to
   "sve_vl" and use the implicit padding after gic_version to
   store it, now this field is the VL/128. (Jan)
 - Created domainconfig_decode_vl() function to decode the sve_vl
   field and use it as plain bits value inside arch_domain.
 - Changed commit message reflecting the changes
Changes from v1:
 - no changes
Changes from RFC:
 - restore zcr_el2 in sve_restore_state, that will be introduced
   later in this serie, so remove zcr_el2 related code from this
   patch and move everything to the later patch (Julien)
 - add explicit padding into struct xen_arch_domainconfig (Julien)
 - Don't lower down the vector length, just fail to create the
   domain. (Julien)
---
 xen/arch/arm/arm64/domctl.c          |  4 ++++
 xen/arch/arm/arm64/sve.c             | 12 +++++++++++
 xen/arch/arm/domain.c                | 29 ++++++++++++++++++++++++++
 xen/arch/arm/domain_build.c          |  7 +++++++
 xen/arch/arm/include/asm/arm64/sve.h | 31 ++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h    |  5 +++++
 xen/include/public/arch-arm.h        |  2 ++
 7 files changed, 90 insertions(+)

diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
index 0de89b42c448..14fc622e9956 100644
--- a/xen/arch/arm/arm64/domctl.c
+++ b/xen/arch/arm/arm64/domctl.c
@@ -10,6 +10,7 @@
 #include <xen/sched.h>
 #include <xen/hypercall.h>
 #include <public/domctl.h>
+#include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
 
 static long switch_mode(struct domain *d, enum domain_type type)
@@ -43,6 +44,9 @@ long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
         case 32:
             if ( !cpu_has_el1_32 )
                 return -EINVAL;
+            /* SVE is not supported for 32 bit domain */
+            if ( is_sve_domain(d) )
+                return -EINVAL;
             return switch_mode(d, DOMAIN_32BIT);
         case 64:
             return switch_mode(d, DOMAIN_64BIT);
diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
index e05ccc38a896..a9144e48ef6b 100644
--- a/xen/arch/arm/arm64/sve.c
+++ b/xen/arch/arm/arm64/sve.c
@@ -8,6 +8,7 @@
 #include <xen/types.h>
 #include <asm/arm64/sve.h>
 #include <asm/arm64/sysregs.h>
+#include <asm/cpufeature.h>
 #include <asm/processor.h>
 #include <asm/system.h>
 
@@ -49,6 +50,17 @@ register_t compute_max_zcr(void)
     return vl_to_zcr(hw_vl);
 }
 
+/* Get the system sanitized value for VL in bits */
+unsigned int get_sys_vl_len(void)
+{
+    if ( !cpu_has_sve )
+        return 0;
+
+    /* ZCR_ELx len field is ((len + 1) * 128) = vector bits length */
+    return ((system_cpuinfo.zcr64.bits[0] & ZCR_ELx_LEN_MASK) + 1U) *
+            SVE_VL_MULTIPLE_VAL;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index d5ab15db46c4..6c22551b0ed2 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -13,6 +13,7 @@
 #include <xen/wait.h>
 
 #include <asm/alternative.h>
+#include <asm/arm64/sve.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
 #include <asm/current.h>
@@ -555,6 +556,8 @@ int arch_vcpu_create(struct vcpu *v)
     v->arch.vmpidr = MPIDR_SMP | vcpuid_to_vaffinity(v->vcpu_id);
 
     v->arch.cptr_el2 = get_default_cptr_flags();
+    if ( is_sve_domain(v->domain) )
+        v->arch.cptr_el2 &= ~HCPTR_CP(8);
 
     v->arch.hcr_el2 = get_default_hcr_flags();
 
@@ -599,6 +602,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     unsigned int max_vcpus;
     unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
     unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
+    unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
 
     if ( (config->flags & ~flags_optional) != flags_required )
     {
@@ -607,6 +611,26 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    /* Check feature flags */
+    if ( sve_vl_bits > 0 )
+    {
+        unsigned int zcr_max_bits = get_sys_vl_len();
+
+        if ( !zcr_max_bits )
+        {
+            dprintk(XENLOG_INFO, "SVE is unsupported on this machine.\n");
+            return -EINVAL;
+        }
+
+        if ( sve_vl_bits > zcr_max_bits )
+        {
+            dprintk(XENLOG_INFO,
+                    "Requested SVE vector length (%u) > supported length (%u)\n",
+                    sve_vl_bits, zcr_max_bits);
+            return -EINVAL;
+        }
+    }
+
     /* The P2M table must always be shared between the CPU and the IOMMU */
     if ( config->iommu_opts & XEN_DOMCTL_IOMMU_no_sharept )
     {
@@ -749,6 +773,11 @@ int arch_domain_create(struct domain *d,
     if ( (rc = domain_vpci_init(d)) != 0 )
         goto fail;
 
+#ifdef CONFIG_ARM64_SVE
+    /* Copy the encoded vector length sve_vl from the domain configuration */
+    d->arch.sve_vl = config->arch.sve_vl;
+#endif
+
     return 0;
 
 fail:
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3f4558ade67f..c46f19208dcb 100644
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
@@ -3691,6 +3692,12 @@ static int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
         return -EINVAL;
     }
 
+    if ( is_sve_domain(d) && (kinfo->type == DOMAIN_32BIT) )
+    {
+        printk("SVE is not available for 32-bit domain\n");
+        return -EINVAL;
+    }
+
     if ( is_64bit_domain(d) )
         vcpu_switch_to_aarch64_mode(v);
 
diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
index c0466243c7bc..4b63412727fc 100644
--- a/xen/arch/arm/include/asm/arm64/sve.h
+++ b/xen/arch/arm/include/asm/arm64/sve.h
@@ -8,13 +8,44 @@
 #ifndef _ARM_ARM64_SVE_H
 #define _ARM_ARM64_SVE_H
 
+#include <xen/sched.h>
+
 #define SVE_VL_MAX_BITS 2048U
 
 /* Vector length must be multiple of 128 */
 #define SVE_VL_MULTIPLE_VAL 128U
 
+static inline unsigned int sve_decode_vl(unsigned int sve_vl)
+{
+    /* SVE vector length is stored as VL/128 in xen_arch_domainconfig */
+    return sve_vl * SVE_VL_MULTIPLE_VAL;
+}
+
 register_t compute_max_zcr(void);
 
+#ifdef CONFIG_ARM64_SVE
+
+static inline bool is_sve_domain(const struct domain *d)
+{
+    return d->arch.sve_vl > 0;
+}
+
+unsigned int get_sys_vl_len(void);
+
+#else /* !CONFIG_ARM64_SVE */
+
+static inline bool is_sve_domain(const struct domain *d)
+{
+    return false;
+}
+
+static inline unsigned int get_sys_vl_len(void)
+{
+    return 0;
+}
+
+#endif /* CONFIG_ARM64_SVE */
+
 #endif /* _ARM_ARM64_SVE_H */
 
 /*
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index e776ee704b7d..331da0f3bcc3 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -67,6 +67,11 @@ struct arch_domain
     enum domain_type type;
 #endif
 
+#ifdef CONFIG_ARM64_SVE
+    /* max SVE encoded vector length */
+    uint8_t sve_vl;
+#endif
+
     /* Virtual MMU */
     struct p2m_domain p2m;
 
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 1528ced5097a..38311f559581 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -300,6 +300,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
+    /* IN - Contains SVE vector length divided by 128 */
+    uint8_t sve_vl;
     /* IN */
     uint16_t tee_type;
     /* IN */
-- 
2.34.1


