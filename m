Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AFB6BAB91
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 10:06:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509939.786748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcN5P-0006Al-OJ; Wed, 15 Mar 2023 09:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509939.786748; Wed, 15 Mar 2023 09:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcN5P-000670-Bn; Wed, 15 Mar 2023 09:06:19 +0000
Received: by outflank-mailman (input) for mailman id 509939;
 Wed, 15 Mar 2023 09:06:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsHm=7H=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pcN5N-0005Kr-E5
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 09:06:17 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a23e5413-c310-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 10:06:13 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A137165C;
 Wed, 15 Mar 2023 02:06:56 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D226E3F8C6;
 Wed, 15 Mar 2023 02:06:10 -0700 (PDT)
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
X-Inumbo-ID: a23e5413-c310-11ed-b464-930f4c7d94ae
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 02/10] xen/arm: add sve_vl_bits field to domain
Date: Wed, 15 Mar 2023 09:05:50 +0000
Message-Id: <20230315090558.731029-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315090558.731029-1-luca.fancellu@arm.com>
References: <20230315090558.731029-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sve_vl_bits field to arch_domain and xen_arch_domainconfig
structure, to allow the domain to have an information about the
SVE feature and the number of SVE register bits that are allowed
for this domain.

The field is used also to allow or forbid a domain to use SVE,
because a value equal to zero means the guest is not allowed to
use the feature.

Check that the requested vector length is lower or equal to the
platform supported vector length, otherwise fail on domain
creation.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
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
 xen/arch/arm/arm64/sve.c             |  9 ++++++++
 xen/arch/arm/domain.c                | 32 ++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/sve.h | 12 +++++++++++
 xen/arch/arm/include/asm/domain.h    |  5 +++++
 xen/include/public/arch-arm.h        |  3 +++
 xen/include/public/domctl.h          |  2 +-
 6 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
index c466de61b47f..4a4ff5dbef49 100644
--- a/xen/arch/arm/arm64/sve.c
+++ b/xen/arch/arm/arm64/sve.c
@@ -6,6 +6,7 @@
  */
 
 #include <xen/types.h>
+#include <asm/cpufeature.h>
 #include <asm/arm64/sve.h>
 #include <asm/arm64/sysregs.h>
 #include <asm/processor.h>
@@ -48,3 +49,11 @@ register_t vl_to_zcr(uint16_t vl)
     ASSERT(vl > 0);
     return ((vl / SVE_VL_MULTIPLE_VAL) - 1U) & ZCR_ELx_LEN_MASK;
 }
+
+/* Get the system sanitized value for VL in bits */
+uint16_t get_sys_vl_len(void)
+{
+    /* ZCR_ELx len field is ((len+1) * 128) = vector bits length */
+    return ((system_cpuinfo.zcr64.bits[0] & ZCR_ELx_LEN_MASK) + 1U) *
+            SVE_VL_MULTIPLE_VAL;
+}
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index adb6ace2e24d..8d64e3c08edf 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -13,6 +13,7 @@
 #include <xen/wait.h>
 
 #include <asm/alternative.h>
+#include <asm/arm64/sve.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
 #include <asm/current.h>
@@ -550,6 +551,8 @@ int arch_vcpu_create(struct vcpu *v)
     v->arch.vmpidr = MPIDR_SMP | vcpuid_to_vaffinity(v->vcpu_id);
 
     v->arch.cptr_el2 = get_default_cptr_flags();
+    if ( is_sve_domain(v->domain) )
+        v->arch.cptr_el2 &= ~HCPTR_CP(8);
 
     v->arch.hcr_el2 = get_default_hcr_flags();
 
@@ -594,6 +597,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     unsigned int max_vcpus;
     unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
     unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
+    unsigned int sve_vl_bits = config->arch.sve_vl_bits;
 
     if ( (config->flags & ~flags_optional) != flags_required )
     {
@@ -602,6 +606,31 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    /* Check feature flags */
+    if ( sve_vl_bits > 0 ) {
+        unsigned int zcr_max_bits = get_sys_vl_len();
+
+        if ( !cpu_has_sve )
+        {
+            dprintk(XENLOG_INFO, "SVE is unsupported on this machine.\n");
+            return -EINVAL;
+        }
+        else if ( !is_vl_valid(sve_vl_bits) )
+        {
+            dprintk(XENLOG_INFO, "Unsupported SVE vector length (%u)\n",
+                    sve_vl_bits);
+            return -EINVAL;
+        }
+        else if ( sve_vl_bits > zcr_max_bits )
+        {
+            dprintk(XENLOG_INFO,
+                    "The requested SVE vector length (%u) must be lower or \n"
+                    "equal to the platform supported vector length (%u)\n",
+                    sve_vl_bits, zcr_max_bits);
+            return -EINVAL;
+        }
+    }
+
     /* The P2M table must always be shared between the CPU and the IOMMU */
     if ( config->iommu_opts & XEN_DOMCTL_IOMMU_no_sharept )
     {
@@ -744,6 +773,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc = domain_vpci_init(d)) != 0 )
         goto fail;
 
+    /* Copy sve_vl_bits to the domain configuration */
+    d->arch.sve_vl_bits = config->arch.sve_vl_bits;
+
     return 0;
 
 fail:
diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
index bd56e2f24230..f4a660e402ca 100644
--- a/xen/arch/arm/include/asm/arm64/sve.h
+++ b/xen/arch/arm/include/asm/arm64/sve.h
@@ -13,10 +13,17 @@
 /* Vector length must be multiple of 128 */
 #define SVE_VL_MULTIPLE_VAL (128U)
 
+static inline bool is_vl_valid(uint16_t vl)
+{
+    /* SVE vector length is multiple of 128 and maximum 2048 */
+    return ((vl % SVE_VL_MULTIPLE_VAL) == 0) && (vl <= SVE_VL_MAX_BITS);
+}
+
 #ifdef CONFIG_ARM64_SVE
 
 register_t compute_max_zcr(void);
 register_t vl_to_zcr(uint16_t vl);
+uint16_t get_sys_vl_len(void);
 
 #else /* !CONFIG_ARM64_SVE */
 
@@ -30,6 +37,11 @@ static inline register_t vl_to_zcr(uint16_t vl)
     return 0;
 }
 
+static inline uint16_t get_sys_vl_len(void)
+{
+    return 0;
+}
+
 #endif
 
 #endif /* _ARM_ARM64_SVE_H */
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 42eb5df320a7..1bd669e0a5c1 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -31,6 +31,8 @@ enum domain_type {
 
 #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 
+#define is_sve_domain(d) ((d)->arch.sve_vl_bits > 0)
+
 /*
  * Is the domain using the host memory layout?
  *
@@ -114,6 +116,9 @@ struct arch_domain
     void *tee;
 #endif
 
+    /* max SVE vector length in bits */
+    uint16_t sve_vl_bits;
+
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 1528ced5097a..3094aeb57990 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -304,6 +304,9 @@ struct xen_arch_domainconfig {
     uint16_t tee_type;
     /* IN */
     uint32_t nr_spis;
+    /* IN */
+    uint16_t sve_vl_bits;
+    uint16_t _pad1;
     /*
      * OUT
      * Based on the property clock-frequency in the DT timer node.
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 51be28c3de7c..616d7a1c070d 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -21,7 +21,7 @@
 #include "hvm/save.h"
 #include "memory.h"
 
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
-- 
2.34.1


