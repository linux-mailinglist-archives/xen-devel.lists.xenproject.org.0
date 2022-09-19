Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C965BC51F
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 11:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408576.651350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCpf-0007nu-ET; Mon, 19 Sep 2022 09:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408576.651350; Mon, 19 Sep 2022 09:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCpf-0007mQ-91; Mon, 19 Sep 2022 09:12:51 +0000
Received: by outflank-mailman (input) for mailman id 408576;
 Mon, 19 Sep 2022 09:12:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3sJ0=ZW=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oaCpd-0007Fl-Su
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 09:12:50 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e31760d-37fb-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 11:12:27 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id o2so43702278lfc.10
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 02:12:48 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 f3-20020a05651c02c300b0025fdf1af42asm4815394ljo.78.2022.09.19.02.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 02:12:46 -0700 (PDT)
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
X-Inumbo-ID: 2e31760d-37fb-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=kAMKsZJY8NuAHY6tLmixBTxvq2W8l0uN2A1EwOiyZdk=;
        b=tts75IWt0qI9nuAxiPpC6BhVuZAnWOfxgtyVqolADuj+XQu5vGDug6/ozSmI692NNp
         Q82M0Fz20aoittutCKvy+HcYY7BjOCvrUeIs/vqowgeIJ+VMZTOQWrbMN1qVi1xr9D7I
         gU4fCcbJjfLbEVgEMMGSNsxICrOCaiL3MPycTbETt3A5y9J5sXHBbL+ZdByradjQEkZK
         7loUHgIMeptLWLzaVPTaoRNXsdbfzE7MCK4Uev3sTYiq4vGWVGQr8SMrLy9jMcrnSrQI
         9GznT37KIE9Uo38JZ2/pEzAEhIHFKEV+2llO9BpT4vFCSziiNiFs1l+IUv3QhFdtHZHU
         iOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kAMKsZJY8NuAHY6tLmixBTxvq2W8l0uN2A1EwOiyZdk=;
        b=EwanK3VD2IddE46UtpX/aP34WzeYXL2FyBMdLfyGF0KlM3SVdBgnP0JgN5++ue5y12
         7YJlfL4LWj/QkQbx8HV2uvFoZaRyoPs3aXI1nHhXMtd0YJFuFMplGFnZmhrr8FR3dqpJ
         9sIQ3hCH2JyksGcMt25cLgOowjCVP+X88QhoK51R7bXZR1PZnxD1T8Mv0y9YkTgdRIph
         w1fwcxbDgOV4YACe4MZsfn1+Y0Cquu+DiuexA0Th2/4hSSgeZnezthN/yzroXfsCMm7H
         URW/kcUErWOlNtiGAjLGXfEtbGNtHRIzuVq+luvxxLFlNzKJ3h0JMnlVmggkdoz3B9OK
         52Fw==
X-Gm-Message-State: ACrzQf1m/YjlYf8rny5S0nm/dPpB/SftusmRzbJxwejibBP6VvJiqNE+
	zya4l/2XZa//DuGyARj2th444zl25doVg4qQ
X-Google-Smtp-Source: AMsMyM6vdt6qVWQzc8iEefPiMFX90fV/cdraP+8Z7ZOc88N12lvKJoPfJmwJEFSPBpALpzEfhju6Kg==
X-Received: by 2002:a05:6512:3b0b:b0:49a:d44b:428 with SMTP id f11-20020a0565123b0b00b0049ad44b0428mr6297019lfv.0.1663578767047;
        Mon, 19 Sep 2022 02:12:47 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 2/9] xen/arm: add a primitive FF-A mediator
Date: Mon, 19 Sep 2022 11:12:31 +0200
Message-Id: <20220919091238.2068052-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220919091238.2068052-1-jens.wiklander@linaro.org>
References: <20220919091238.2068052-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
Partition in secure world.

This commit brings in only the parts needed to negotiate FF-A version
number with guest and SPMC.

A guest configuration variable "ffa_enabled" is used to indicate if a guest
is trusted to use FF-A.

This is loosely based on the TEE mediator framework and the OP-TEE
mediator.

[1] https://developer.arm.com/documentation/den0077/latest
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 SUPPORT.md                           |   7 +
 docs/man/xl.cfg.5.pod.in             |  15 ++
 tools/golang/xenlight/helpers.gen.go |   6 +
 tools/golang/xenlight/types.gen.go   |   1 +
 tools/include/libxl.h                |   6 +
 tools/libs/light/libxl_arm.c         |   6 +
 tools/libs/light/libxl_types.idl     |   1 +
 tools/ocaml/libs/xc/xenctrl.ml       |   1 +
 tools/ocaml/libs/xc/xenctrl.mli      |   1 +
 tools/xl/xl_parse.c                  |   1 +
 xen/arch/arm/Kconfig                 |  11 +
 xen/arch/arm/Makefile                |   1 +
 xen/arch/arm/domain.c                |  11 +
 xen/arch/arm/domain_build.c          |   1 +
 xen/arch/arm/ffa.c                   | 372 +++++++++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h    |   4 +
 xen/arch/arm/include/asm/ffa.h       |  78 ++++++
 xen/arch/arm/vsmc.c                  |  17 +-
 xen/include/public/arch-arm.h        |   4 +
 19 files changed, 541 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/arm/ffa.c
 create mode 100644 xen/arch/arm/include/asm/ffa.h

diff --git a/SUPPORT.md b/SUPPORT.md
index 8ebd63ad8230..bf95e11857a1 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -806,6 +806,13 @@ that covers the DMA of the device to be passed through.
 
 No support for QEMU backends in a 16K or 64K domain.
 
+### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
+
+    Status, Arm64: Tech Preview
+
+There are still some code paths where a vCPU may hog a pCPU longer than
+necessary. The FF-A mediator is not yet implemented for Arm32.
+
 ### ARM: Guest Device Tree support
 
     Status: Supported
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index b2901e04cf6f..3391f32dffdd 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1616,6 +1616,21 @@ This feature is a B<technology preview>.
 
 =back
 
+=item B<ffa=BOOLEAN>
+
+B<Arm only.> Allow a guest to communicate via FF-A with Secure Partitions
+(SP), default false.
+
+Currently is only a small subset of the FF-A specification supported. Just
+enough to communicate with OP-TEE. In general only direct messaging and
+sharing memory with one SP. More advanced use cases where memory might be
+shared or donated to multple SPs is not supported.
+
+See L<https://developer.arm.com/documentation/den0077/latest> for more
+informantion about FF-A.
+
+This feature is a B<technology preview>.
+
 =head2 Paravirtualised (PV) Guest Specific Options
 
 The following options apply only to Paravirtual (PV) guests.
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index fa3cf2ab7658..036cf284be13 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1117,6 +1117,9 @@ default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
 x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
+if err := x.ArchArm.Ffa.fromC(&xc.arch_arm.ffa);err != nil {
+return fmt.Errorf("converting field ArchArm.Ffa: %v", err)
+}
 if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
@@ -1608,6 +1611,9 @@ default:
 return fmt.Errorf("invalid union key '%v'", x.Type)}
 xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
 xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
+if err := x.ArchArm.Ffa.toC(&xc.arch_arm.ffa); err != nil {
+return fmt.Errorf("converting field ArchArm.Ffa: %v", err)
+}
 if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index a0be7ada8c63..6bc029ecb6fa 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -531,6 +531,7 @@ TypeUnion DomainBuildInfoTypeUnion
 ArchArm struct {
 GicVersion GicVersion
 Vuart VuartType
+Ffa Defbool
 }
 ArchX86 struct {
 MsrRelaxed Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 2321a648a59a..1102fe1002c5 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -278,6 +278,12 @@
  */
 #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE 1
 
+/*
+ * LIBXL_HAVE_BUILDINFO_ARM_FFA_ENABLED indicates that
+ * libxl_domain_build_info has the arm.ffa_enabled field.
+ */
+#define LIBXL_HAVE_BUILDINFO_ARM_FFA_ENABLED 1
+
 /*
  * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
  * 'soft reset' for domains and there is 'soft_reset' shutdown reason
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 1a3ac1646e94..5332a5e339c8 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -179,6 +179,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         return ERROR_FAIL;
     }
 
+    libxl_defbool_setdefault(&d_config->b_info.arch_arm.ffa, false);
+    if ( libxl_defbool_val(d_config->b_info.arch_arm.ffa) )
+        config->arch.flags |= XEN_ARM_FLAGS_FFA;
+
     return 0;
 }
 
@@ -1561,6 +1565,8 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
     b_info->type = LIBXL_DOMAIN_TYPE_INVALID;
     libxl_domain_build_info_init_type(b_info, LIBXL_DOMAIN_TYPE_PVH);
 
+    libxl_defbool_setdefault(&b_info->arch_arm.ffa, false);
+
     return 0;
 }
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index d634f304cda2..b093f115de81 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -658,6 +658,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
                                ("vuart", libxl_vuart_type),
+                               ("ffa", libxl_defbool),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                                ("assisted_xapic", libxl_defbool),
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 0c71e5eef3c7..3329c24fbb89 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -33,6 +33,7 @@ type xen_arm_arch_domainconfig =
 	gic_version: int;
 	nr_spis: int;
 	clock_frequency: int32;
+	ffa: bool;
 }
 
 type x86_arch_emulation_flags =
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index a8458e19ca4b..7474652bd06d 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -27,6 +27,7 @@ type xen_arm_arch_domainconfig = {
   gic_version: int;
   nr_spis: int;
   clock_frequency: int32;
+  ffa: bool;
 }
 
 type x86_arch_emulation_flags =
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1b5381cef033..46053b2bebbe 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2750,6 +2750,7 @@ skip_usbdev:
             exit(-ERROR_FAIL);
         }
     }
+    xlu_cfg_get_defbool(config, "ffa", &b_info->arch_arm.ffa, 0);
 
     parse_vkb_list(config, d_config);
 
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 1fe5faf847b8..09aba684bf41 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -140,6 +140,17 @@ config TEE
 
 source "arch/arm/tee/Kconfig"
 
+config FFA
+	bool "Enable FF-A mediator support" if EXPERT
+	default n
+	depends on ARM_64
+	help
+	  This option enables a minimal FF-A mediator. The mediator is
+	  generic as it follows the FF-A specification [1], but it only
+	  implements a small subset of the specification.
+
+	  [1] https://developer.arm.com/documentation/den0077/latest
+
 config STATIC_SHM
 	bool "Statically shared memory on a dom0less system" if UNSUPPORTED
 	depends on STATIC_MEMORY
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 4d076b278b10..5085e1c92aa6 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += domain_page.o
 obj-y += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += efi/
+obj-$(CONFIG_FFA) += ffa.o
 obj-y += gic.o
 obj-y += gic-v2.o
 obj-$(CONFIG_GICV3) += gic-v3.o
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2d6253181a94..2ec4d5efa5e1 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -27,6 +27,7 @@
 #include <asm/cpufeature.h>
 #include <asm/current.h>
 #include <asm/event.h>
+#include <asm/ffa.h>
 #include <asm/gic.h>
 #include <asm/guest_atomics.h>
 #include <asm/irq.h>
@@ -757,6 +758,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc = tee_domain_init(d, config->arch.tee_type)) != 0 )
         goto fail;
 
+    if ( (rc = ffa_domain_init(d, config->arch.flags)) != 0 )
+        goto fail;
+
     update_domain_wallclock_time(d);
 
     /*
@@ -799,6 +803,7 @@ void arch_domain_destroy(struct domain *d)
      */
     iommu_domain_destroy(d);
     p2m_teardown(d);
+    ffa_domain_destroy(d);
     domain_vgic_free(d);
     domain_vuart_free(d);
     free_xenheap_page(d->shared_info);
@@ -998,6 +1003,7 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
 enum {
     PROG_pci = 1,
     PROG_tee,
+    PROG_ffa,
     PROG_xen,
     PROG_page,
     PROG_mapping,
@@ -1043,6 +1049,11 @@ int domain_relinquish_resources(struct domain *d)
 
     PROGRESS(tee):
         ret = tee_relinquish_resources(d);
+        if ( ret )
+            return ret;
+
+    PROGRESS(ffa):
+        ret = ffa_relinquish_resources(d);
         if (ret )
             return ret;
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 01c2aaccd82d..ad458e4b530f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -4021,6 +4021,7 @@ void __init create_dom0(void)
     if ( gic_number_lines() > 992 )
         printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
     dom0_cfg.arch.tee_type = tee_get_type();
+    dom0_cfg.arch.flags = XEN_ARM_FLAGS_FFA;
     dom0_cfg.max_vcpus = dom0_max_vcpus();
 
     if ( iommu_enabled )
diff --git a/xen/arch/arm/ffa.c b/xen/arch/arm/ffa.c
new file mode 100644
index 000000000000..2c59c1f9b738
--- /dev/null
+++ b/xen/arch/arm/ffa.c
@@ -0,0 +1,372 @@
+/*
+ * xen/arch/arm/ffa.c
+ *
+ * Arm Firmware Framework for ARMv8-A (FF-A) mediator
+ *
+ * Copyright (C) 2022  Linaro Limited
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms and conditions of the GNU General Public
+ * License, version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public
+ * License along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/domain_page.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+#include <xen/sizes.h>
+#include <xen/bitops.h>
+
+#include <asm/smccc.h>
+#include <asm/event.h>
+#include <asm/ffa.h>
+#include <asm/regs.h>
+
+/* Error codes */
+#define FFA_RET_OK                      0
+#define FFA_RET_NOT_SUPPORTED           -1
+#define FFA_RET_INVALID_PARAMETERS      -2
+#define FFA_RET_NO_MEMORY               -3
+#define FFA_RET_BUSY                    -4
+#define FFA_RET_INTERRUPTED             -5
+#define FFA_RET_DENIED                  -6
+#define FFA_RET_RETRY                   -7
+#define FFA_RET_ABORTED                 -8
+
+/* FFA_VERSION helpers */
+#define FFA_VERSION_MAJOR_SHIFT         16U
+#define FFA_VERSION_MAJOR_MASK          0x7FFFU
+#define FFA_VERSION_MINOR_SHIFT         0U
+#define FFA_VERSION_MINOR_MASK          0xFFFFU
+#define MAKE_FFA_VERSION(major, minor)  \
+        ((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT) | \
+         ((minor) & FFA_VERSION_MINOR_MASK))
+
+#define FFA_MIN_VERSION         MAKE_FFA_VERSION(1, 0)
+#define FFA_VERSION_1_0         MAKE_FFA_VERSION(1, 0)
+#define FFA_VERSION_1_1         MAKE_FFA_VERSION(1, 1)
+
+/*
+ * This is the version we want to use in communication with guests and SPs.
+ * During negotiation with a guest or a SP we may need to lower it for
+ * that particular guest or SP.
+ */
+#define FFA_MY_VERSION_MAJOR    1U
+#define FFA_MY_VERSION_MINOR    1U
+#define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
+                                                 FFA_MY_VERSION_MINOR)
+
+#define FFA_PAGE_SIZE                   SZ_4K
+
+/*
+ * Limit for shared buffer size. Please note that this define limits
+ * number of pages. But user buffer can be not aligned to a page
+ * boundary. So it is possible that user would not be able to share
+ * exactly MAX_SHM_BUFFER_PG * PAGE_SIZE bytes.
+ *
+ * FF-A doesn't have any direct requirments on GlobalPlatform or vice
+ * versa, but an implementation can very well use FF-A in order to provide
+ * a GlobalPlatform interface on top.
+ *
+ * Global Platform specification for TEE requires that any TEE
+ * implementation should allow to share buffers with size of at least
+ * 512KB, which equals to 128 4kB pages. Due to align issue mentioned
+ * above, we need to increase this value to 129.
+ */
+#define FFA_MAX_SHM_PAGE_COUNT          129
+
+/*
+ * Limits the number of shared buffers that guest can have at once. This
+ * is to prevent case, when guests tricks XEN into exhausting its own
+ * memory by allocating many small buffers. This value has been chosen
+ * arbitrary.
+ */
+#define FFA_MAX_SHM_COUNT               32
+
+#define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
+
+/* Memory attributes: Normal memory, Write-Back cacheable, Inner shareable */
+#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
+
+/* Memory access permissions: Read-write */
+#define FFA_MEM_ACC_RW                  0x2U
+
+/* Clear memory before mapping in receiver */
+#define FFA_MEMORY_REGION_FLAG_CLEAR            BIT(0, U)
+/* Relayer may time slice this operation */
+#define FFA_MEMORY_REGION_FLAG_TIME_SLICE       BIT(1, U)
+/* Clear memory after receiver relinquishes it */
+#define FFA_MEMORY_REGION_FLAG_CLEAR_RELINQUISH BIT(2, U)
+
+/* Share memory transaction */
+#define FFA_MEMORY_REGION_TRANSACTION_TYPE_SHARE (1U << 3)
+
+#define FFA_HANDLE_INVALID              0xffffffffffffffffULL
+
+/* Framework direct request/response */
+#define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
+#define FFA_MSG_TYPE_MASK               0xFFU;
+#define FFA_MSG_PSCI                    0x0U
+#define FFA_MSG_SEND_VM_CREATED         0x4U
+#define FFA_MSG_RESP_VM_CREATED         0x5U
+#define FFA_MSG_SEND_VM_DESTROYED       0x6U
+#define FFA_MSG_RESP_VM_DESTROYED       0x7U
+
+/*
+ * Flags used for the FFA_PARTITION_INFO_GET return message:
+ * BIT(0): Supports receipt of direct requests
+ * BIT(1): Can send direct requests
+ * BIT(2): Can send and receive indirect messages
+ * BIT(3): Supports receipt of notifications
+ * BIT(4-5): Partition ID is a PE endpoint ID
+ */
+#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0, U)
+#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1, U)
+#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2, U)
+#define FFA_PART_PROP_RECV_NOTIF        BIT(3, U)
+#define FFA_PART_PROP_IS_PE_ID          (0U << 4)
+#define FFA_PART_PROP_IS_SEPID_INDEP    (1U << 4)
+#define FFA_PART_PROP_IS_SEPID_DEP      (2U << 4)
+#define FFA_PART_PROP_IS_AUX_ID         (3U << 4)
+#define FFA_PART_PROP_NOTIF_CREATED     BIT(6, U)
+#define FFA_PART_PROP_NOTIF_DESTROYED   BIT(7, U)
+#define FFA_PART_PROP_AARCH64_STATE     BIT(8, U)
+
+/*
+ * Flag used as parameter to FFA_PARTITION_INFO_GET to return partition
+ * count only.
+ */
+#define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
+
+/* Function IDs */
+#define FFA_ERROR                       0x84000060U
+#define FFA_SUCCESS_32                  0x84000061U
+#define FFA_SUCCESS_64                  0xC4000061U
+#define FFA_INTERRUPT                   0x84000062U
+#define FFA_VERSION                     0x84000063U
+#define FFA_FEATURES                    0x84000064U
+#define FFA_RX_ACQUIRE                  0x84000084U
+#define FFA_RX_RELEASE                  0x84000065U
+#define FFA_RXTX_MAP_32                 0x84000066U
+#define FFA_RXTX_MAP_64                 0xC4000066U
+#define FFA_RXTX_UNMAP                  0x84000067U
+#define FFA_PARTITION_INFO_GET          0x84000068U
+#define FFA_ID_GET                      0x84000069U
+#define FFA_SPM_ID_GET                  0x84000085U
+#define FFA_MSG_WAIT                    0x8400006BU
+#define FFA_MSG_YIELD                   0x8400006CU
+#define FFA_MSG_RUN                     0x8400006DU
+#define FFA_MSG_SEND2                   0x84000086U
+#define FFA_MSG_SEND_DIRECT_REQ_32      0x8400006FU
+#define FFA_MSG_SEND_DIRECT_REQ_64      0xC400006FU
+#define FFA_MSG_SEND_DIRECT_RESP_32     0x84000070U
+#define FFA_MSG_SEND_DIRECT_RESP_64     0xC4000070U
+#define FFA_MEM_DONATE_32               0x84000071U
+#define FFA_MEM_DONATE_64               0xC4000071U
+#define FFA_MEM_LEND_32                 0x84000072U
+#define FFA_MEM_LEND_64                 0xC4000072U
+#define FFA_MEM_SHARE_32                0x84000073U
+#define FFA_MEM_SHARE_64                0xC4000073U
+#define FFA_MEM_RETRIEVE_REQ_32         0x84000074U
+#define FFA_MEM_RETRIEVE_REQ_64         0xC4000074U
+#define FFA_MEM_RETRIEVE_RESP           0x84000075U
+#define FFA_MEM_RELINQUISH              0x84000076U
+#define FFA_MEM_RECLAIM                 0x84000077U
+#define FFA_MEM_FRAG_RX                 0x8400007AU
+#define FFA_MEM_FRAG_TX                 0x8400007BU
+#define FFA_MSG_SEND                    0x8400006EU
+#define FFA_MSG_POLL                    0x8400006AU
+
+struct ffa_ctx {
+    uint32_t guest_vers;
+};
+
+/* Negotiated FF-A version to use with the SPMC */
+static uint32_t ffa_version __ro_after_init;
+
+static bool ffa_get_version(uint32_t *vers)
+{
+    const struct arm_smccc_1_2_regs arg = {
+        .a0 = FFA_VERSION,
+        .a1 = FFA_MY_VERSION,
+    };
+    struct arm_smccc_1_2_regs resp;
+
+    arm_smccc_1_2_smc(&arg, &resp);
+    if ( resp.a0 == FFA_RET_NOT_SUPPORTED )
+    {
+        gprintk(XENLOG_ERR, "ffa: FFA_VERSION returned not supported\n");
+        return false;
+    }
+
+    *vers = resp.a0;
+
+    return true;
+}
+
+static u16 get_vm_id(const struct domain *d)
+{
+    /* +1 since 0 is reserved for the hypervisor in FF-A */
+    return d->domain_id + 1;
+}
+
+static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
+                     register_t v2, register_t v3, register_t v4, register_t v5,
+                     register_t v6, register_t v7)
+{
+        set_user_reg(regs, 0, v0);
+        set_user_reg(regs, 1, v1);
+        set_user_reg(regs, 2, v2);
+        set_user_reg(regs, 3, v3);
+        set_user_reg(regs, 4, v4);
+        set_user_reg(regs, 5, v5);
+        set_user_reg(regs, 6, v6);
+        set_user_reg(regs, 7, v7);
+}
+
+static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
+                             uint32_t w3)
+{
+    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
+}
+
+static void handle_version(struct cpu_user_regs *regs)
+{
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.ffa;
+    uint32_t vers = get_user_reg(regs, 1);
+
+    if ( vers < FFA_VERSION_1_1 )
+        vers = FFA_VERSION_1_0;
+    else
+        vers = FFA_VERSION_1_1;
+
+    ctx->guest_vers = vers;
+    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
+}
+
+bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
+{
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.ffa;
+
+    if ( !ctx )
+        return false;
+
+    switch ( fid )
+    {
+    case FFA_VERSION:
+        handle_version(regs);
+        return true;
+    case FFA_ID_GET:
+        set_regs_success(regs, get_vm_id(d), 0);
+        return true;
+
+    default:
+        gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
+        return false;
+    }
+}
+
+uint32_t ffa_get_call_count(void)
+{
+    uint32_t count = 0;
+
+    if ( IS_ENABLED(CONFIG_FFA) )
+        count += 2;
+
+    return count;
+}
+
+int ffa_domain_init(struct domain *d, uint32_t flags)
+{
+    struct ffa_ctx *ctx;
+
+    if ( !ffa_version || !(flags & XEN_ARM_FLAGS_FFA) )
+        return -ENODEV;
+
+    ctx = xzalloc(struct ffa_ctx);
+    if ( !ctx )
+        return -ENOMEM;
+
+    d->arch.ffa = ctx;
+
+    return 0;
+}
+
+/* This function is supposed to undo what ffa_domain_init() has done */
+void ffa_domain_destroy(struct domain *d)
+{
+    struct ffa_ctx *ctx = d->arch.ffa;
+
+    if ( !ctx )
+        return;
+
+    XFREE(d->arch.ffa);
+}
+
+/*
+ * This function is supposed to undo what has been done after
+ * ffa_domain_init().
+ */
+int ffa_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+
+static int __init ffa_init(void)
+{
+    uint32_t vers;
+    unsigned int major_vers;
+    unsigned int minor_vers;
+
+    /*
+     * FFA_PAGE_SIZE is defined to 4k and we're currently depending on
+     * using that page size.
+     */
+    BUILD_BUG_ON(PAGE_SIZE != FFA_PAGE_SIZE);
+
+    /*
+     * psci_init_smccc() updates this value with what's reported by EL-3
+     * or secure world.
+     */
+    if ( smccc_ver < ARM_SMCCC_VERSION_1_2 )
+    {
+        printk(XENLOG_ERR
+               "ffa: unsupported SMCCC version %#x (need at least %#x)\n",
+               smccc_ver, ARM_SMCCC_VERSION_1_2);
+        return 0;
+    }
+
+    if ( !ffa_get_version(&vers) )
+        return 0;
+
+    if ( vers < FFA_MIN_VERSION || vers > FFA_MY_VERSION )
+    {
+        printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers);
+        return 0;
+    }
+
+    major_vers = (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJOR_MASK;
+    minor_vers = vers & FFA_VERSION_MINOR_MASK;
+    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
+           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
+    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
+           major_vers, minor_vers);
+
+    ffa_version = vers;
+
+    return 0;
+}
+
+__initcall(ffa_init);
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 26a8348eed2b..e3c30fbaa99a 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -104,6 +104,10 @@ struct arch_domain
     void *tee;
 #endif
 
+#ifdef CONFIG_FFA
+    void *ffa;
+#endif
+
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/arch/arm/include/asm/ffa.h b/xen/arch/arm/include/asm/ffa.h
new file mode 100644
index 000000000000..b2ab12496a51
--- /dev/null
+++ b/xen/arch/arm/include/asm/ffa.h
@@ -0,0 +1,78 @@
+/*
+ * xen/arch/arm/ffa.c
+ *
+ * Arm Firmware Framework for ARMv8-A(FFA) mediator
+ *
+ * Copyright (C) 2021  Linaro Limited
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without restriction,
+ * including without limitation the rights to use, copy, modify, merge,
+ * publish, distribute, sublicense, and/or sell copies of the Software,
+ * and to permit persons to whom the Software is furnished to do so,
+ * subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+ * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
+ * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
+ * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
+ * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef __ASM_ARM_FFA_H__
+#define __ASM_ARM_FFA_H__
+
+#include <xen/const.h>
+
+#include <asm/smccc.h>
+#include <asm/types.h>
+
+#define FFA_FNUM_MIN_VALUE              _AC(0x60,U)
+#define FFA_FNUM_MAX_VALUE              _AC(0x86,U)
+
+static inline bool is_ffa_fid(uint32_t fid)
+{
+    uint32_t fn = fid & ARM_SMCCC_FUNC_MASK;
+
+    return fn >= FFA_FNUM_MIN_VALUE && fn <= FFA_FNUM_MAX_VALUE;
+}
+
+#ifdef CONFIG_FFA
+bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid);
+uint32_t ffa_get_call_count(void);
+int ffa_domain_init(struct domain *d, uint32_t flags);
+void ffa_domain_destroy(struct domain *d);
+int ffa_relinquish_resources(struct domain *d);
+#else
+static inline bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
+{
+    return false;
+}
+
+static inline uint32_t ffa_get_call_count(void)
+{
+    return 0;
+}
+
+static inline int ffa_domain_init(struct domain *d, bool ffa_enabled)
+{
+    return -ENODEV;
+}
+
+static inline void ffa_domain_destroy(struct domain *d)
+{
+}
+
+static inline int ffa_relinquish_resources(struct domain *d)
+{
+    return 0;
+}
+#endif
+
+#endif /*__ASM_ARM_FFA_H__*/
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 6f90c08a6304..b1b9be36d238 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -20,6 +20,7 @@
 #include <public/arch-arm/smccc.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
+#include <asm/ffa.h>
 #include <asm/monitor.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
@@ -32,7 +33,7 @@
 #define XEN_SMCCC_FUNCTION_COUNT 3
 
 /* Number of functions currently supported by Standard Service Service Calls. */
-#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS)
+#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS + ffa_get_call_count())
 
 static bool fill_uid(struct cpu_user_regs *regs, xen_uuid_t uuid)
 {
@@ -196,13 +197,23 @@ static bool handle_existing_apis(struct cpu_user_regs *regs)
     return do_vpsci_0_1_call(regs, fid);
 }
 
+static bool is_psci_fid(uint32_t fid)
+{
+    uint32_t fn = fid & ARM_SMCCC_FUNC_MASK;
+
+    return fn >= 0 && fn <= 0x1fU;
+}
+
 /* PSCI 0.2 interface and other Standard Secure Calls */
 static bool handle_sssc(struct cpu_user_regs *regs)
 {
     uint32_t fid = (uint32_t)get_user_reg(regs, 0);
 
-    if ( do_vpsci_0_2_call(regs, fid) )
-        return true;
+    if ( is_psci_fid(fid) )
+        return do_vpsci_0_2_call(regs, fid);
+
+    if ( is_ffa_fid(fid) )
+        return ffa_handle_call(regs, fid);
 
     switch ( fid )
     {
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index c8b6058d3a83..0c5381439196 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -335,6 +335,10 @@ struct xen_arch_domainconfig {
      *
      */
     uint32_t clock_frequency;
+#define _XEN_ARM_FLAGS_FFA        0
+#define XEN_ARM_FLAGS_FFA         (1U << _XEN_ARM_FLAGS_FFA)
+    /* IN */
+    uint32_t flags;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
 
-- 
2.31.1


