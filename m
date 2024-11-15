Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FEB9CDDD6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837186.1253245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBut9-0001pI-66; Fri, 15 Nov 2024 11:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837186.1253245; Fri, 15 Nov 2024 11:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBut7-0001Su-G1; Fri, 15 Nov 2024 11:53:21 +0000
Received: by outflank-mailman (input) for mailman id 837186;
 Fri, 15 Nov 2024 11:53:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBut2-0005U9-RE
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:16 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3104a531-a348-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 12:53:12 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso254097366b.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:12 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:11 -0800 (PST)
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
X-Inumbo-ID: 3104a531-a348-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMxMDRhNTMxLWEzNDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjcxNTkyLjg4NjA3NSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671592; x=1732276392; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQe9V1AhYWf4ai4F0ROLJKgWqyUIcsqP1I8KYkQgors=;
        b=La0jPCBV/Mv1UJUKVVO0NzSMUIXfUZ3Yre25rIj3Ipb6K1tlmZTNOsMRBkaYDneS/9
         koBKQnKjqDlHgyiR6RhmtKhfSai6UxVz7JZJwO8q03D0Ztxwr5httpdMyydpsuRkPhQ1
         yRX/79bcI6GV6CqjAAYKGFRuz0lguGW49vT30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671592; x=1732276392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQe9V1AhYWf4ai4F0ROLJKgWqyUIcsqP1I8KYkQgors=;
        b=FmUSueyjK2cYzmqdWsGzEydARoai+GYgUBVW+uINy5XAMzScSDt+aaxn0Tj0BKKLqF
         ubqYmg6etNI1bQ4Ele61i0DOwYUEIhTgiwVIFiOiWKzWBlAhyv6f3bV08B4XZHJaU9/Y
         wwXyX1NxntupgzbQuCCr3f8f8xfLM89z61NOr/sZR7twnWFAJMdHns0IV4UYIwQ/sb4D
         wBVHWETB7ybYO/2Hkx/1eqerLIxhyA3GkF+N9yWO1UDPuXMgIl53UE04n6VGUFb/JDMY
         IUL99Fc9pe9GoQw/4UffdMaa2ZJIAFMPPPCyhDh/iTGOdgjnd6xxN5yJsxxoisyQydVf
         TflA==
X-Gm-Message-State: AOJu0Yx6lIFtfgTG7fB8nz65SiNm9O5ppGUXd5FT+YQl8hdb4yNM8AgP
	JWte/ihtNqhGHJhBJOBVXRPy+F8zfjWWm/hqDwjE4rCDPAuppWWHN2NJdgcJgSxhVTQHTmv20U/
	U
X-Google-Smtp-Source: AGHT+IEQ4pcTgOIxYTLd0C0XYSXTAYZbmAqR/sFKc273vUTbXWV38/T35FJDfzjxrCK0vIaUGLkDjA==
X-Received: by 2002:a17:907:868b:b0:a9a:422:ec7 with SMTP id a640c23a62f3a-aa4834827b2mr189416866b.32.1731671591958;
        Fri, 15 Nov 2024 03:53:11 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 16/25] xen/x86: Replace hand-crafted xen_arch_domainconfig with autogenerated one
Date: Fri, 15 Nov 2024 11:51:45 +0000
Message-ID: <20241115115200.2824-17-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/libs/light/libxl_x86.c                  |  4 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c           |  4 +-
 .../extra/arch-x86/domainconfig.toml          | 87 +++++++++++++++++++
 .../xenbindgen/extra/domctl/createdomain.toml |  6 ++
 xen/arch/x86/domain.c                         |  8 +-
 xen/arch/x86/include/asm/domain.h             |  4 +-
 xen/arch/x86/setup.c                          |  2 +-
 xen/include/public/arch-x86/xen.h             | 51 -----------
 xen/include/public/autogen/arch_x86.h         | 52 +++++++++++
 xen/include/public/autogen/domctl.h           | 13 +++
 10 files changed, 170 insertions(+), 61 deletions(-)
 create mode 100644 tools/rust/xenbindgen/extra/arch-x86/domainconfig.toml
 create mode 100644 xen/include/public/autogen/arch_x86.h

diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index a3164a3077fe..a3d856957b54 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -8,7 +8,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 {
     switch(d_config->c_info.type) {
     case LIBXL_DOMAIN_TYPE_HVM:
-        config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
+        config->arch.emulation_flags = (XEN_X86_EMU__ALL & ~XEN_X86_EMU_VPCI);
         if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
             config->arch.emulation_flags &= ~XEN_X86_EMU_USE_PIRQ;
         break;
@@ -24,7 +24,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
 
     config->arch.misc_flags = 0;
     if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
-        config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
+        config->arch.misc_flags |= XEN_X86_MISC_MSR_RELAXED;
 
     return 0;
 }
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 1f2cf41a9cc7..65ff4f636ea9 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -260,12 +260,12 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 
 		cfg.arch.emulation_flags = ocaml_list_to_c_bitmap
 			/* ! x86_arch_emulation_flags X86_EMU_ none */
-			/* ! XEN_X86_EMU_ XEN_X86_EMU_ALL all */
+			/* ! XEN_X86_EMU_ XEN_X86_EMU__ALL all */
 			(VAL_EMUL_FLAGS);
 
 		cfg.arch.misc_flags = ocaml_list_to_c_bitmap
 			/* ! x86_arch_misc_flags X86_ none */
-			/* ! XEN_X86_ XEN_X86_MSR_RELAXED all */
+			/* ! XEN_X86_ XEN_X86_MISC__ALL all */
 			(VAL_MISC_FLAGS);
 
 #undef VAL_MISC_FLAGS
diff --git a/tools/rust/xenbindgen/extra/arch-x86/domainconfig.toml b/tools/rust/xenbindgen/extra/arch-x86/domainconfig.toml
new file mode 100644
index 000000000000..1f85b69de4a8
--- /dev/null
+++ b/tools/rust/xenbindgen/extra/arch-x86/domainconfig.toml
@@ -0,0 +1,87 @@
+[[bitmaps]]
+name = "xen_x86_emu"
+description = "Content of the `emulation_flags` field of the domain creation hypercall."
+typ = { tag = "u32" }
+
+[[bitmaps.bits]]
+name = "lapic"
+description = "Emulate Local APICs."
+shift = 0
+
+[[bitmaps.bits]]
+name = "hpet"
+description = "Emulate a HPET timer."
+shift = 1
+
+[[bitmaps.bits]]
+name = "pm"
+description = "Emulate the ACPI PM timer."
+shift = 2
+
+[[bitmaps.bits]]
+name = "rtc"
+description = "Emulate the RTC clock."
+shift = 3
+
+[[bitmaps.bits]]
+name = "ioapic"
+description = "Emulate an IOAPIC device."
+shift = 4
+
+[[bitmaps.bits]]
+name = "pic"
+description = "Emulate PIC devices."
+shift = 5
+
+[[bitmaps.bits]]
+name = "vga"
+description = "Emulate standard VGA."
+shift = 6
+
+[[bitmaps.bits]]
+name = "iommu"
+description = "Emulate an IOMMU."
+shift = 7
+
+[[bitmaps.bits]]
+name = "pit"
+description = "Emulate a PIT timer."
+shift = 8
+
+[[bitmaps.bits]]
+name = "use_pirq"
+description = "Route physical IRQs over event channels."
+shift = 9
+
+[[bitmaps.bits]]
+name = "vpci"
+description = "Handle PCI configuration space traps from within Xen."
+shift = 10
+
+################################################################################
+
+[[bitmaps]]
+name = "xen_x86_misc"
+description = "Contents of the `misc_flags` field of the domain creation hypercall"
+typ = { tag = "u32" }
+
+[[bitmaps.bits]]
+name = "msr_relaxed"
+description = "Grants access to the real physical MSR registers of the host."
+shift = 0
+
+################################################################################
+
+[[structs]]
+name = "xen_arch_domainconfig"
+description = "x86-specific domain settings."
+
+[[structs.fields]]
+name = "emulation_flags"
+description = "IN: Bitmap of devices to emulate."
+typ = { tag = "bitmap", args = "xen_x86_emu" }
+
+[[structs.fields]]
+name = "misc_flags"
+description = "IN: Miscellaneous x86-specific toggles."
+typ = { tag = "bitmap", args = "xen_x86_misc" }
diff --git a/tools/rust/xenbindgen/extra/domctl/createdomain.toml b/tools/rust/xenbindgen/extra/domctl/createdomain.toml
index 02f65d134b55..3a6872aa325f 100644
--- a/tools/rust/xenbindgen/extra/domctl/createdomain.toml
+++ b/tools/rust/xenbindgen/extra/domctl/createdomain.toml
@@ -1,3 +1,9 @@
+[[includes]]
+from = "arch"
+imports = ["xen_arch_domainconfig"]
+
+################################################################################
+
 [[enums]]
 name = "xen_domctl_altp2m_mode"
 description = "Content of the `altp2m_mode` field of the domain creation hypercall."
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 63a52a8ae23d..3c1c8f03aa81 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -708,7 +708,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         }
     }
 
-    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
+    if ( config->arch.misc_flags & ~XEN_X86_MISC_MSR_RELAXED )
     {
         dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
                 config->arch.misc_flags);
@@ -735,7 +735,7 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
 {
 #ifdef CONFIG_HVM
     /* This doesn't catch !CONFIG_HVM case but it is better than nothing */
-    BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU_ALL);
+    BUILD_BUG_ON(X86_EMU_ALL != XEN_X86_EMU__ALL);
 #endif
 
     if ( is_hvm_domain(d) )
@@ -800,7 +800,7 @@ int arch_domain_create(struct domain *d,
     if ( is_hardware_domain(d) && is_pv_domain(d) )
         emflags |= XEN_X86_EMU_PIT;
 
-    if ( emflags & ~XEN_X86_EMU_ALL )
+    if ( emflags & ~XEN_X86_EMU__ALL )
     {
         printk(XENLOG_G_ERR "d%d: Invalid emulation bitmap: %#x\n",
                d->domain_id, emflags);
@@ -887,7 +887,7 @@ int arch_domain_create(struct domain *d,
 
     domain_cpu_policy_changed(d);
 
-    d->arch.msr_relaxed = config->arch.misc_flags & XEN_X86_MSR_RELAXED;
+    d->arch.msr_relaxed = config->arch.misc_flags & XEN_X86_MISC_MSR_RELAXED;
 
     return 0;
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index b79d6badd71c..119604fadb5d 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -12,6 +12,8 @@
 #include <public/vcpu.h>
 #include <public/hvm/hvm_info_table.h>
 
+#include <public/autogen/arch_x86.h>
+
 #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
 
 /*
@@ -486,7 +488,7 @@ struct arch_domain
 
 #define X86_EMU_PIT     XEN_X86_EMU_PIT
 
-/* This must match XEN_X86_EMU_ALL in xen.h */
+/* This must match XEN_X86_EMU__ALL */
 #define X86_EMU_ALL             (X86_EMU_LAPIC | X86_EMU_HPET |         \
                                  X86_EMU_PM | X86_EMU_RTC |             \
                                  X86_EMU_IOAPIC | X86_EMU_PIC |         \
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 65ea3fc86beb..d408af54d997 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -967,7 +967,7 @@ static struct domain *__init create_dom0(const module_t *image,
         .max_grant_version = opt_gnttab_max_version,
         .max_vcpus = dom0_max_vcpus(),
         .arch = {
-            .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
+            .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MISC_MSR_RELAXED : 0,
         },
     };
     struct domain *d;
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index fc2487986642..e864459cfd93 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -255,57 +255,6 @@ struct arch_shared_info {
 };
 typedef struct arch_shared_info arch_shared_info_t;
 
-#if defined(__XEN__) || defined(__XEN_TOOLS__)
-/*
- * struct xen_arch_domainconfig's ABI is covered by
- * XEN_DOMCTL_INTERFACE_VERSION.
- */
-struct xen_arch_domainconfig {
-#define _XEN_X86_EMU_LAPIC          0
-#define XEN_X86_EMU_LAPIC           (1U<<_XEN_X86_EMU_LAPIC)
-#define _XEN_X86_EMU_HPET           1
-#define XEN_X86_EMU_HPET            (1U<<_XEN_X86_EMU_HPET)
-#define _XEN_X86_EMU_PM             2
-#define XEN_X86_EMU_PM              (1U<<_XEN_X86_EMU_PM)
-#define _XEN_X86_EMU_RTC            3
-#define XEN_X86_EMU_RTC             (1U<<_XEN_X86_EMU_RTC)
-#define _XEN_X86_EMU_IOAPIC         4
-#define XEN_X86_EMU_IOAPIC          (1U<<_XEN_X86_EMU_IOAPIC)
-#define _XEN_X86_EMU_PIC            5
-#define XEN_X86_EMU_PIC             (1U<<_XEN_X86_EMU_PIC)
-#define _XEN_X86_EMU_VGA            6
-#define XEN_X86_EMU_VGA             (1U<<_XEN_X86_EMU_VGA)
-#define _XEN_X86_EMU_IOMMU          7
-#define XEN_X86_EMU_IOMMU           (1U<<_XEN_X86_EMU_IOMMU)
-#define _XEN_X86_EMU_PIT            8
-#define XEN_X86_EMU_PIT             (1U<<_XEN_X86_EMU_PIT)
-#define _XEN_X86_EMU_USE_PIRQ       9
-#define XEN_X86_EMU_USE_PIRQ        (1U<<_XEN_X86_EMU_USE_PIRQ)
-#define _XEN_X86_EMU_VPCI           10
-#define XEN_X86_EMU_VPCI            (1U<<_XEN_X86_EMU_VPCI)
-
-#define XEN_X86_EMU_ALL             (XEN_X86_EMU_LAPIC | XEN_X86_EMU_HPET |  \
-                                     XEN_X86_EMU_PM | XEN_X86_EMU_RTC |      \
-                                     XEN_X86_EMU_IOAPIC | XEN_X86_EMU_PIC |  \
-                                     XEN_X86_EMU_VGA | XEN_X86_EMU_IOMMU |   \
-                                     XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIRQ |\
-                                     XEN_X86_EMU_VPCI)
-    uint32_t emulation_flags;
-
-/*
- * Select whether to use a relaxed behavior for accesses to MSRs not explicitly
- * handled by Xen instead of injecting a #GP to the guest. Note this option
- * doesn't allow the guest to read or write to the underlying MSR.
- */
-#define XEN_X86_MSR_RELAXED (1u << 0)
-    uint32_t misc_flags;
-};
-
-/* Max  XEN_X86_* constant. Used for ABI checking. */
-#define XEN_X86_MISC_FLAGS_MAX XEN_X86_MSR_RELAXED
-
-#endif
-
 /*
  * Representations of architectural CPUID and MSR information.  Used as the
  * serialised version of Xen's internal representation.
diff --git a/xen/include/public/autogen/arch_x86.h b/xen/include/public/autogen/arch_x86.h
new file mode 100644
index 000000000000..94f35218342e
--- /dev/null
+++ b/xen/include/public/autogen/arch_x86.h
@@ -0,0 +1,52 @@
+/*
+ * arch-x86
+ *
+ * AUTOGENERATED. DO NOT MODIFY
+ */
+#ifndef __XEN_AUTOGEN_ARCH_X86_H
+#define __XEN_AUTOGEN_ARCH_X86_H
+
+/* Content of the `emulation_flags` field of the domain creation hypercall. */
+struct xen_x86_emu {}; /* GREP FODDER */
+/* Emulate Local APICs. */
+#define XEN_X86_EMU_LAPIC (1U << 0)
+/* Emulate a HPET timer. */
+#define XEN_X86_EMU_HPET (1U << 1)
+/* Emulate the ACPI PM timer. */
+#define XEN_X86_EMU_PM (1U << 2)
+/* Emulate the RTC clock. */
+#define XEN_X86_EMU_RTC (1U << 3)
+/* Emulate an IOAPIC device. */
+#define XEN_X86_EMU_IOAPIC (1U << 4)
+/* Emulate PIC devices. */
+#define XEN_X86_EMU_PIC (1U << 5)
+/* Emulate standard VGA. */
+#define XEN_X86_EMU_VGA (1U << 6)
+/* Emulate an IOMMU. */
+#define XEN_X86_EMU_IOMMU (1U << 7)
+/* Emulate a PIT timer. */
+#define XEN_X86_EMU_PIT (1U << 8)
+/* Route physical IRQs over event channels. */
+#define XEN_X86_EMU_USE_PIRQ (1U << 9)
+/* Handle PCI configuration space traps from within Xen. */
+#define XEN_X86_EMU_VPCI (1U << 10)
+/* Mask covering all defined bits */
+#define XEN_X86_EMU__ALL (0x7FFU)
+
+/* Contents of the `misc_flags` field of the domain creation hypercall */
+struct xen_x86_misc {}; /* GREP FODDER */
+/* Grants access to the real physical MSR registers of the host. */
+#define XEN_X86_MISC_MSR_RELAXED (1U << 0)
+/* Mask covering all defined bits */
+#define XEN_X86_MISC__ALL (0x1U)
+
+/* x86-specific domain settings. */
+struct xen_arch_domainconfig {
+    /* IN: Bitmap of devices to emulate. */
+    uint32_t emulation_flags /* See xen_x86_emu */;
+    /* IN: Miscellaneous x86-specific toggles. */
+    uint32_t misc_flags /* See xen_x86_misc */;
+};
+
+#endif /* __XEN_AUTOGEN_ARCH_X86_H */
+
diff --git a/xen/include/public/autogen/domctl.h b/xen/include/public/autogen/domctl.h
index bd1f4bedc727..276e05168688 100644
--- a/xen/include/public/autogen/domctl.h
+++ b/xen/include/public/autogen/domctl.h
@@ -6,6 +6,19 @@
 #ifndef __XEN_AUTOGEN_DOMCTL_H
 #define __XEN_AUTOGEN_DOMCTL_H
 
+/* for xen_arch_domainconfig */
+#if defined(__i386__) || defined(__x86_64__)
+#include "arch_x86.h"
+#elif defined(__arm__) || defined(__aarch64__)
+#include "arch_arm.h"
+#elif defined(__powerpc64__)
+#include "arch_ppc.h"
+#elif defined(__riscv)
+#include "arch_riscv.h"
+#else
+#error "Unsupported architecture"
+#endif
+
 /* Content of the `altp2m_mode` field of the domain creation hypercall. */
 enum xen_domctl_altp2m_mode {
     /* Keep altp2m disabled */
-- 
2.47.0


