Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D54C841D651
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 11:28:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199659.353854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVsLN-0008CN-DN; Thu, 30 Sep 2021 09:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199659.353854; Thu, 30 Sep 2021 09:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVsLN-0008Aa-AM; Thu, 30 Sep 2021 09:27:09 +0000
Received: by outflank-mailman (input) for mailman id 199659;
 Thu, 30 Sep 2021 09:27:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mlQV=OU=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mVsLL-0008AU-QO
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 09:27:07 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b7f99fc4-1234-4d97-86ac-d9038ac64d39;
 Thu, 30 Sep 2021 09:27:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE4E5D6E;
 Thu, 30 Sep 2021 02:27:04 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.19.250])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D1DC3F793;
 Thu, 30 Sep 2021 02:27:01 -0700 (PDT)
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
X-Inumbo-ID: b7f99fc4-1234-4d97-86ac-d9038ac64d39
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH] xen/arm: Expose the PMU to the guests
Date: Thu, 30 Sep 2021 11:26:51 +0200
Message-Id: <20210930092651.1350-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add parameter vpmu to xl domain configuration syntax
to enable the access to PMU registers by disabling
the PMU traps.

This change does not expose the full PMU to the guest.
Long term, we will want to at least expose the PMU
interrupts, device-tree binding. For more use cases
we will also need to save/restore the PMU context.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 docs/man/xl.cfg.5.pod.in         | 12 ++++++++++++
 tools/include/libxl.h            |  7 +++++++
 tools/libs/light/libxl_arm.c     |  6 +++++-
 tools/libs/light/libxl_types.idl |  1 +
 tools/xl/xl_parse.c              |  2 ++
 xen/arch/arm/domain.c            | 10 ++++++++--
 xen/common/domain.c              |  2 +-
 xen/include/asm-arm/domain.h     |  1 +
 xen/include/public/domctl.h      |  5 ++++-
 9 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 4b1e3028d2..4a75203b9f 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2843,6 +2843,18 @@ Currently, only the "sbsa_uart" model is supported for ARM.
 
 =back
 
+=item B<vpmu=BOOLEAN>
+
+Specifies whether to enable the access to PMU registers by disabling
+the PMU traps.
+
+This change does not expose the full PMU to the guest.
+Currently there is no support for virtualization, interrupts, etc.
+
+Enabling this option may result in potential security holes.
+
+If this option is not specified then it will default to B<false>.
+
 =head3 x86
 
 =over 4
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b9ba16d698..c6694e977d 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -502,6 +502,13 @@
  */
 #define LIBXL_HAVE_X86_MSR_RELAXED 1
 
+/*
+ * LIBXL_HAVE_ARM_VPMU indicates the toolstack has support for enabling
+ * the access to PMU registers by disabling the PMU traps. This is done
+ * by setting the libxl_domain_build_info arch_arm.vpmu field.
+ */
+#define LIBXL_HAVE_ARM_VPMU 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index e3140a6e00..bc614dcb05 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -29,6 +29,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     uint32_t vuart_irq;
     bool vuart_enabled = false;
 
+    if (libxl_defbool_val(d_config->b_info.arch_arm.vpmu))
+        config->flags |= XEN_DOMCTL_CDF_pmu;
+
     /*
      * If pl011 vuart is enabled then increment the nr_spis to allow allocation
      * of SPI VIRQ for pl011.
@@ -1186,8 +1189,9 @@ void libxl__arch_domain_create_info_setdefault(libxl__gc *gc,
 void libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
                                               libxl_domain_build_info *b_info)
 {
-    /* ACPI is disabled by default */
+    /* ACPI and vPMU is disabled by default */
     libxl_defbool_setdefault(&b_info->acpi, false);
+    libxl_defbool_setdefault(&b_info->arch_arm.vpmu, false);
 
     if (b_info->type != LIBXL_DOMAIN_TYPE_PV)
         return;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 3f9fff653a..3524629909 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -644,6 +644,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                ("vuart", libxl_vuart_type),
+                               ("vpmu", libxl_defbool),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 17dddb4cd5..e15c2e64f5 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2750,6 +2750,8 @@ skip_usbdev:
                     "If it fixes an issue you are having please report to "
                     "xen-devel@lists.xenproject.org.\n");
 
+    xlu_cfg_get_defbool(config, "vpmu", &b_info->arch_arm.vpmu, 0);
+
     xlu_cfg_destroy(config);
 }
 
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 19c756ac3d..02120ff640 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -276,6 +276,8 @@ static void ctxt_switch_to(struct vcpu *n)
      * timer. The interrupt needs to be injected into the guest. */
     WRITE_SYSREG(n->arch.cntkctl, CNTKCTL_EL1);
     virt_timer_restore(n);
+
+    WRITE_SYSREG(n->arch.mdcr_el2, MDCR_EL2);
 }
 
 /* Update per-VCPU guest runstate shared memory area (if registered). */
@@ -586,6 +588,10 @@ int arch_vcpu_create(struct vcpu *v)
 
     v->arch.hcr_el2 = get_default_hcr_flags();
 
+    v->arch.mdcr_el2 = HDCR_TDRA | HDCR_TDOSA | HDCR_TDA;
+    if ( !(v->domain->options & XEN_DOMCTL_CDF_pmu) )
+        v->arch.mdcr_el2 |= HDCR_TPM | HDCR_TPMCR;
+
     if ( (rc = vcpu_vgic_init(v)) != 0 )
         goto fail;
 
@@ -622,8 +628,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     unsigned int max_vcpus;
 
-    /* HVM and HAP must be set. IOMMU may or may not be */
-    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=
+    /* HVM and HAP must be set. IOMMU and PMU may or may not be */
+    if ( (config->flags & ~(XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_pmu)) !=
          (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
     {
         dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6ee5d033b0..63c4db8b9f 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -483,7 +483,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt) )
+           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_pmu) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index c9277b5c6d..14e575288f 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -166,6 +166,7 @@ struct arch_vcpu
 
     /* HYP configuration */
     register_t hcr_el2;
+    register_t mdcr_el2;
 
     uint32_t teecr, teehbr; /* ThumbEE, 32-bit guests only */
 #ifdef CONFIG_ARM_32
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 96696e3842..a55ceb81db 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -70,9 +70,12 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
 #define _XEN_DOMCTL_CDF_nested_virt   6
 #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
+/* Should we expose the vPMU to the guest? */
+#define _XEN_DOMCTL_CDF_pmu           7
+#define XEN_DOMCTL_CDF_pmu            (1U << _XEN_DOMCTL_CDF_pmu)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_pmu
 
     uint32_t flags;
 
-- 
2.29.0


