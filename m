Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0FD42C01E
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208375.364476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madSc-0001Gf-40; Wed, 13 Oct 2021 12:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208375.364476; Wed, 13 Oct 2021 12:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madSc-0001EH-0d; Wed, 13 Oct 2021 12:34:18 +0000
Received: by outflank-mailman (input) for mailman id 208375;
 Wed, 13 Oct 2021 12:34:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K823=PB=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1madSZ-0001E5-Sa
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:34:15 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id df5d87ac-2c21-11ec-816d-12813bfff9fa;
 Wed, 13 Oct 2021 12:34:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DEB61FB;
 Wed, 13 Oct 2021 05:34:13 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.25.166])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DF8A3F70D;
 Wed, 13 Oct 2021 05:34:08 -0700 (PDT)
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
X-Inumbo-ID: df5d87ac-2c21-11ec-816d-12813bfff9fa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH v7] xen: Expose the PMU to the guests
Date: Wed, 13 Oct 2021 14:33:52 +0200
Message-Id: <20211013123352.6625-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add parameter vpmu to xl domain configuration syntax
to enable the access to PMU registers by disabling
the PMU traps(currently only for ARM).

The current status is that the PMU registers are not
virtualized and the physical registers are directly
accessible when this parameter is enabled. There is no
interrupt support and Xen will not save/restore the
register values on context switches.

According to Arm Arm, section D7.1:
"The Performance Monitors Extension is common
to AArch64 operation and AArch32 operation."
That means we have an ensurance that if PMU is
present in one exception state, it must also be
present in the other.

Please note that this feature is experimental.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Signed-off-by: Julien Grall <julien@xen.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Ian Jackson <iwj@xenproject.org>
---
Changes since v6:
-fix missing "HVM" for vPMU entry in SUPPORT.md
Changes since v5:
-extracted from the series as other patches have been merged
-fold ARM vPMU feature status into existing section for x86
-fix coding style in libxl
Changes since v4:
-update SUPPORT.md
-move vpmu_is_available assignment after the secondary
CPUs have been brought up
-introduce masks for flags that need to be set and
for flags that are optional
Changes since v3:
-fail if vpmu is set but not supported
Changes since v2:
-remove redundant check from x86 code
-do not define bit position and mask separately
Changes since v1:
-modify vpmu parameter to be common rather than arch specific
---
 SUPPORT.md                           | 14 +++++++++++---
 docs/man/xl.cfg.5.pod.in             | 17 +++++++++++++++++
 tools/golang/xenlight/helpers.gen.go |  6 ++++++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                |  6 ++++++
 tools/libs/light/libxl_create.c      | 10 ++++++++++
 tools/libs/light/libxl_types.idl     |  2 ++
 tools/ocaml/libs/xc/xenctrl.ml       |  1 +
 tools/ocaml/libs/xc/xenctrl.mli      |  1 +
 tools/xl/xl_parse.c                  |  2 ++
 xen/arch/arm/domain.c                | 13 ++++++++++---
 xen/arch/arm/setup.c                 |  3 +++
 xen/common/domain.c                  | 10 +++++++++-
 xen/include/asm-arm/domain.h         |  1 +
 xen/include/public/domctl.h          |  4 +++-
 15 files changed, 83 insertions(+), 8 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 317392d8f3..3a34933c89 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -671,11 +671,19 @@ such as KVM, Hyper-V, Bromium, and so on as guests.
 
 ### vPMU
 
-Virtual Performance Management Unit for HVM guests
+Virtual Performance Management Unit
 
-    Status, x86: Supported, Not security supported
+    Status, x86 HVM: Supported, Not security supported
+    Status, ARM: Experimental
+
+On ARM, support for accessing PMU registers from the guests.
+There is no interrupt support and Xen will not save/restore
+the register values on context switches.
+
+Disabled by default.
+On ARM, enable with guest parameter.
+On x86, enable with hypervisor command line option.
 
-Disabled by default (enable with hypervisor command line option).
 This feature is not security supported: see https://xenbits.xen.org/xsa/advisory-163.html
 
 ### Argo: Inter-domain message delivery by hypercall
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 4b1e3028d2..55c4881205 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -690,6 +690,23 @@ default.
 B<NOTE>: Acceptable values are platform specific.  For Intel Processor
 Trace, this value must be a power of 2 between 4k and 16M.
 
+=item B<vpmu=BOOLEAN>
+
+Currently ARM only.
+
+Specifies whether to enable the access to PMU registers by disabling
+the PMU traps.
+
+The PMU registers are not virtualized and the physical registers are directly
+accessible when this parameter is enabled. There is no interrupt support and
+Xen will not save/restore the register values on context switches.
+
+vPMU, by design and purpose, exposes system level performance
+information to the guest. Only to be used by sufficiently privileged
+domains. This feature is currently in experimental state.
+
+If this option is not specified then it will default to B<false>.
+
 =back
 
 =head2 Devices
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index c8669837d8..2449580bad 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1119,6 +1119,9 @@ return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
 x.Altp2M = Altp2MMode(xc.altp2m)
 x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
+if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
+return fmt.Errorf("converting field Vpmu: %v", err)
+}
 
  return nil}
 
@@ -1600,6 +1603,9 @@ return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
 xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
 xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
+if err := x.Vpmu.toC(&xc.vpmu); err != nil {
+return fmt.Errorf("converting field Vpmu: %v", err)
+}
 
  return nil
  }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 45f2cba3d2..b2e8bd1a85 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -521,6 +521,7 @@ MsrRelaxed Defbool
 }
 Altp2M Altp2MMode
 VmtraceBufKb int
+Vpmu Defbool
 }
 
 type DomainBuildInfoTypeUnion interface {
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index ec5e3badae..ee73eb06f1 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -508,6 +508,12 @@
  */
 #define LIBXL_HAVE_PHYSINFO_CAP_VPMU 1
 
+/*
+ * LIBXL_HAVE_VPMU indicates that libxl_domain_build_info has a vpmu parameter,
+ * which allows to enable the access to PMU registers.
+ */
+#define LIBXL_HAVE_VPMU 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index e356b2106d..6ebb2bfc76 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -91,6 +91,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
     }
 
     libxl_defbool_setdefault(&b_info->device_model_stubdomain, false);
+    libxl_defbool_setdefault(&b_info->vpmu, false);
 
     if (libxl_defbool_val(b_info->device_model_stubdomain) &&
         !b_info->device_model_ssidref)
@@ -622,6 +623,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
                 create.flags |= XEN_DOMCTL_CDF_nested_virt;
         }
 
+        if (libxl_defbool_val(b_info->vpmu))
+            create.flags |= XEN_DOMCTL_CDF_vpmu;
+
         assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
         LOG(DETAIL, "passthrough: %s",
             libxl_passthrough_to_string(info->passthrough));
@@ -1199,6 +1203,12 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
         goto error_out;
     }
 
+    if (libxl_defbool_val(d_config->b_info.vpmu) && !physinfo.cap_vpmu) {
+        ret = ERROR_INVAL;
+        LOGD(ERROR, domid, "vPMU not supported on this platform");
+        goto error_out;
+    }
+
     ret = 0;
  error_out:
     return ret;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 993e83acca..b96fb5c47e 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -655,6 +655,8 @@ libxl_domain_build_info = Struct("domain_build_info",[
     # Use zero value to disable this feature.
     ("vmtrace_buf_kb", integer),
 
+    ("vpmu", libxl_defbool),
+
     ], dir=DIR_IN,
        copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
 )
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 7a4030a192..86758babb3 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -70,6 +70,7 @@ type domain_create_flag =
 	| CDF_IOMMU
 	| CDF_NESTED_VIRT
 	| CDF_VPCI
+	| CDF_VPMU
 
 type domain_create_iommu_opts =
 	| IOMMU_NO_SHAREPT
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index 6900513e7f..0fdb0cc169 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -63,6 +63,7 @@ type domain_create_flag =
   | CDF_IOMMU
   | CDF_NESTED_VIRT
   | CDF_VPCI
+  | CDF_VPMU
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 17dddb4cd5..c503b9be00 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2750,6 +2750,8 @@ skip_usbdev:
                     "If it fixes an issue you are having please report to "
                     "xen-devel@lists.xenproject.org.\n");
 
+    xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
+
     xlu_cfg_destroy(config);
 }
 
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index aae4472479..ad21c9b950 100644
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
+    if ( !(v->domain->options & XEN_DOMCTL_CDF_vpmu) )
+        v->arch.mdcr_el2 |= HDCR_TPM | HDCR_TPMCR;
+
     if ( (rc = vcpu_vgic_init(v)) != 0 )
         goto fail;
 
@@ -621,10 +627,11 @@ void vcpu_switch_to_aarch64_mode(struct vcpu *v)
 int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     unsigned int max_vcpus;
+    unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
+    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpci |
+                                   XEN_DOMCTL_CDF_vpmu);
 
-    /* HVM and HAP must be set. IOMMU and VPCI may or may not be */
-    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu & ~XEN_DOMCTL_CDF_vpci) !=
-         (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
+    if ( (config->flags & ~flags_optional) != flags_required )
     {
         dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
                 config->flags);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 49dc90d198..d5d0792ed4 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -999,6 +999,9 @@ void __init start_xen(unsigned long boot_phys_offset,
     printk("Brought up %ld CPUs\n", (long)num_online_cpus());
     /* TODO: smp_cpus_done(); */
 
+    /* This should be done in a vpmu driver but we do not have one yet. */
+    vpmu_is_available = cpu_has_pmu;
+
     /*
      * The IOMMU subsystem must be initialized before P2M as we need
      * to gather requirements regarding the maximum IPA bits supported by
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 262b6c0c3c..8543fb54fd 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -480,12 +480,14 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hvm = config->flags & XEN_DOMCTL_CDF_hvm;
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool iommu = config->flags & XEN_DOMCTL_CDF_iommu;
+    bool vpmu = config->flags & XEN_DOMCTL_CDF_vpmu;
 
     if ( config->flags &
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpci) )
+           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpci |
+           XEN_DOMCTL_CDF_vpmu) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
@@ -534,6 +536,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( vpmu && !vpmu_is_available )
+    {
+        dprintk(XENLOG_INFO, "vpmu requested but cannot be enabled this way\n");
+        return -EINVAL;
+    }
+
     return arch_sanitise_domain_config(config);
 }
 
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
index 4cb3f662c2..a53cbd16f4 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -71,9 +71,11 @@ struct xen_domctl_createdomain {
 #define _XEN_DOMCTL_CDF_nested_virt   6
 #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
 #define XEN_DOMCTL_CDF_vpci           (1U << 7)
+/* Should we expose the vPMU to the guest? */
+#define XEN_DOMCTL_CDF_vpmu           (1U << 8)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpci
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
 
     uint32_t flags;
 
-- 
2.29.0


