Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C566CA1E9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 13:00:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515166.797787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgka0-0007pD-FH; Mon, 27 Mar 2023 11:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515166.797787; Mon, 27 Mar 2023 11:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgka0-0007nE-Ar; Mon, 27 Mar 2023 11:00:00 +0000
Received: by outflank-mailman (input) for mailman id 515166;
 Mon, 27 Mar 2023 10:59:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K09h=7T=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pgkZz-0007YG-99
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 10:59:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8367d623-cc8e-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 12:59:58 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E12DBFEC;
 Mon, 27 Mar 2023 04:00:41 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66BB63F663;
 Mon, 27 Mar 2023 03:59:56 -0700 (PDT)
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
X-Inumbo-ID: 8367d623-cc8e-11ed-85db-49a42c6b2330
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
Subject: [PATCH v4 02/12] xen/arm: add SVE vector length field to the domain
Date: Mon, 27 Mar 2023 11:59:34 +0100
Message-Id: <20230327105944.1360856-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327105944.1360856-1-luca.fancellu@arm.com>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
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

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
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
 xen/arch/arm/arm64/sve.c             | 11 +++++++++-
 xen/arch/arm/domain.c                | 32 ++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/sve.h | 22 +++++++++++++++++--
 xen/arch/arm/include/asm/domain.h    |  5 +++++
 xen/include/public/arch-arm.h        |  2 ++
 xen/include/public/domctl.h          |  2 +-
 6 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
index c466de61b47f..3c3adfb5c6bd 100644
--- a/xen/arch/arm/arm64/sve.c
+++ b/xen/arch/arm/arm64/sve.c
@@ -6,6 +6,7 @@
  */
 
 #include <xen/types.h>
+#include <asm/cpufeature.h>
 #include <asm/arm64/sve.h>
 #include <asm/arm64/sysregs.h>
 #include <asm/processor.h>
@@ -43,8 +44,16 @@ register_t compute_max_zcr(void)
 }
 
 /* Takes a vector length in bits and returns the ZCR_ELx encoding */
-register_t vl_to_zcr(uint16_t vl)
+register_t vl_to_zcr(unsigned int vl)
 {
     ASSERT(vl > 0);
     return ((vl / SVE_VL_MULTIPLE_VAL) - 1U) & ZCR_ELx_LEN_MASK;
 }
+
+/* Get the system sanitized value for VL in bits */
+unsigned int get_sys_vl_len(void)
+{
+    /* ZCR_ELx len field is ((len+1) * 128) = vector bits length */
+    return ((system_cpuinfo.zcr64.bits[0] & ZCR_ELx_LEN_MASK) + 1U) *
+            SVE_VL_MULTIPLE_VAL;
+}
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index adb6ace2e24d..7182d4567bf0 100644
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
+    unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
 
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
 
+    /* Copy the encoded vector length sve_vl from the domain configuration */
+    d->arch.sve_vl = config->arch.sve_vl;
+
     return 0;
 
 fail:
diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
index bd56e2f24230..8037f09b5b0a 100644
--- a/xen/arch/arm/include/asm/arm64/sve.h
+++ b/xen/arch/arm/include/asm/arm64/sve.h
@@ -13,10 +13,23 @@
 /* Vector length must be multiple of 128 */
 #define SVE_VL_MULTIPLE_VAL (128U)
 
+static inline bool is_vl_valid(unsigned int vl)
+{
+    /* SVE vector length is multiple of 128 and maximum 2048 */
+    return ((vl % SVE_VL_MULTIPLE_VAL) == 0) && (vl <= SVE_VL_MAX_BITS);
+}
+
+static inline unsigned int sve_decode_vl(unsigned int sve_vl)
+{
+    /* SVE vector length is stored as VL/128 in xen_arch_domainconfig */
+    return sve_vl * SVE_VL_MULTIPLE_VAL;
+}
+
 #ifdef CONFIG_ARM64_SVE
 
 register_t compute_max_zcr(void);
-register_t vl_to_zcr(uint16_t vl);
+register_t vl_to_zcr(unsigned int vl);
+unsigned int get_sys_vl_len(void);
 
 #else /* !CONFIG_ARM64_SVE */
 
@@ -25,7 +38,12 @@ static inline register_t compute_max_zcr(void)
     return 0;
 }
 
-static inline register_t vl_to_zcr(uint16_t vl)
+static inline register_t vl_to_zcr(unsigned int vl)
+{
+    return 0;
+}
+
+static inline unsigned int get_sys_vl_len(void)
 {
     return 0;
 }
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index e776ee704b7d..78cc2da3d4e5 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -31,6 +31,8 @@ enum domain_type {
 
 #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 
+#define is_sve_domain(d) ((d)->arch.sve_vl > 0)
+
 /*
  * Is the domain using the host memory layout?
  *
@@ -67,6 +69,9 @@ struct arch_domain
     enum domain_type type;
 #endif
 
+    /* max SVE encoded vector length */
+    uint8_t sve_vl;
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


