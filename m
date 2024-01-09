Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EF8828920
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 16:38:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664703.1034835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEBj-0000h5-Eg; Tue, 09 Jan 2024 15:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664703.1034835; Tue, 09 Jan 2024 15:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNEBj-0000eo-7t; Tue, 09 Jan 2024 15:38:47 +0000
Received: by outflank-mailman (input) for mailman id 664703;
 Tue, 09 Jan 2024 15:38:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4Q/=IT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1rNEBh-00081N-Lk
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 15:38:45 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2acaf547-af05-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 16:38:42 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a28fb463a28so308664166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 07:38:42 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 fi3-20020a170906da0300b00a2adb417051sm1153685ejb.216.2024.01.09.07.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 07:38:41 -0800 (PST)
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
X-Inumbo-ID: 2acaf547-af05-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1704814722; x=1705419522; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/Mi6cC8uykb3/316Hk1+e5LTrJjSyfEFqMapLdzQzU=;
        b=IViI4yhHSDRuJkL+lOsd1cVKkAE1AiJJxXX1mvB0SF0ZHxqTzMT3XCo+wCL5FXgiP+
         z937tQVBooFQ5UI75JONWqqmYlaEWH57u01vVn+K197x+/17/3CPsBFMAZ0MchWUvrgb
         ulHVKTAHkqimtUIKP8Gm4UrqRCB0MGvQfNbiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704814722; x=1705419522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/Mi6cC8uykb3/316Hk1+e5LTrJjSyfEFqMapLdzQzU=;
        b=lZ+RPMS6WMXRPVjvFd9GGLiAhy5ESC6pwPg1XA0zFaYKjZ+0S8wZGcL2OyNHvpNAoy
         Bs2JkM1CSFzvJgZphlz8/+ukM/96XV3wHMCdfPjQtSRc3q+wMk0vvLrxwxZX012QkqHj
         6UowgVXfJYbjvuglQgzOHk7texyPMXX91ytVClO0niTVQp2CiejOfQDfFewU4ShZGceK
         LPzTvDmzBWcT+6HoHHQE+XCMXHeXy81LeMB1EQqhRSr0wGAaUccUgyiWYCE1wrlo8wTS
         hcF23Mo93+qCvcMy3kFGn43KWD4lDA8TeHw0hHPj+k90yWy84AGZeQTDKY2Sg90bJ8iM
         Gqlg==
X-Gm-Message-State: AOJu0Yze1J3HQaMziTid7pLvJK7RDLF7chEV1Hi/lwvMW/XCw/ot+rrx
	2oaLbnNSLRGpvcO6o+9NM07xERqrxhxQZoNgv7FeservqIc=
X-Google-Smtp-Source: AGHT+IElL8SkPzR8ym/erEuOW/j52nGuVC8Q0DK5O9UwVPma0sgsQsnjC06cIgEky0KZlZPvm9yPVA==
X-Received: by 2002:a17:906:a895:b0:a28:fdac:95e8 with SMTP id ha21-20020a170906a89500b00a28fdac95e8mr626937ejb.17.1704814721793;
        Tue, 09 Jan 2024 07:38:41 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 4/6] tools/hvmloader: Use cpu_policy to determine APIC IDs
Date: Tue,  9 Jan 2024 15:38:32 +0000
Message-Id: <20240109153834.4192-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of topology correction efforts, APIC IDs can no longer be derived
strictly through the vCPU ID alone. Bring in the machinery for policy
retrieval and parsing in order to generate the proper MADT table and wake
the appropriate CPUs.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/firmware/hvmloader/Makefile    |  7 +++++++
 tools/firmware/hvmloader/config.h    |  5 ++++-
 tools/firmware/hvmloader/hvmloader.c |  6 ++++++
 tools/firmware/hvmloader/util.c      |  3 ++-
 tools/libacpi/build.c                | 27 +++++++++++++++++++++------
 tools/libacpi/libacpi.h              |  5 ++++-
 tools/libs/light/libxl_x86_acpi.c    | 21 +++++++++++++++++++--
 7 files changed, 63 insertions(+), 11 deletions(-)

diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
index e5de1ade17..503ef2e219 100644
--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -37,6 +37,13 @@ ifeq ($(debug),y)
 OBJS += tests.o
 endif
 
+CFLAGS += -I../../../xen/arch/x86/include/
+
+vpath cpuid.c ../../../xen/lib/x86/
+OBJS += cpuid.o
+vpath policy.c ../../../xen/lib/x86/
+OBJS += policy.o
+
 CIRRUSVGA_DEBUG ?= n
 
 ROMBIOS_DIR := ../rombios
diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index c82adf6dc5..3304b63cd8 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -3,10 +3,13 @@
 
 #include <stdint.h>
 #include <stdbool.h>
+#include <xen/lib/x86/cpu-policy.h>
 
 enum virtual_vga { VGA_none, VGA_std, VGA_cirrus, VGA_pt };
 extern enum virtual_vga virtual_vga;
 
+extern struct cpu_policy cpu_policy;
+
 extern unsigned long igd_opregion_pgbase;
 #define IGD_OPREGION_PAGES 3
 
@@ -50,7 +53,7 @@ extern uint8_t ioapic_version;
 #define IOAPIC_ID           0x01
 
 #define LAPIC_BASE_ADDRESS  0xfee00000
-#define LAPIC_ID(vcpu_id)   ((vcpu_id) * 2)
+#define LAPIC_ID(vcpu_id) x86_x2apic_id_from_vcpu_id(&cpu_policy, vcpu_id)
 
 #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index c58841e5b5..8874165c66 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -28,6 +28,7 @@
 #include <acpi2_0.h>
 #include <xen/version.h>
 #include <xen/hvm/params.h>
+#include <xen/lib/x86/cpu-policy.h>
 #include <xen/arch-x86/hvm/start_info.h>
 
 const struct hvm_start_info *hvm_start_info;
@@ -118,6 +119,9 @@ uint8_t ioapic_version;
 
 bool acpi_enabled;
 
+/* TODO: Remove after HVM ACPI building makes it to libxl */
+struct cpu_policy cpu_policy;
+
 static void init_hypercalls(void)
 {
     uint32_t eax, ebx, ecx, edx;
@@ -331,6 +335,8 @@ int main(void)
     printf("HVM Loader\n");
     BUG_ON(hvm_start_info->magic != XEN_HVM_START_MAGIC_VALUE);
 
+    x86_cpu_policy_fill_native(&cpu_policy);
+
     init_hypercalls();
 
     memory_map_setup();
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index e82047d993..25a0245c5c 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -30,6 +30,7 @@
 #include <xen/sched.h>
 #include <xen/hvm/hvm_xs_strings.h>
 #include <xen/hvm/params.h>
+#include <xen/lib/x86/cpu-policy.h>
 
 /*
  * Check whether there exists overlap in the specified memory range.
@@ -1041,7 +1042,7 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
     ctxt.mem_ops.free = acpi_mem_free;
     ctxt.mem_ops.v2p = acpi_v2p;
 
-    acpi_build_tables(&ctxt, config);
+    acpi_build_tables(&ctxt, config, &cpu_policy);
 
     hvm_param_set(HVM_PARAM_VM_GENERATION_ID_ADDR, config->vm_gid_addr);
 }
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index 2f29863db1..ab05e54c96 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -17,6 +17,7 @@
 #include <xen/hvm/hvm_xs_strings.h>
 #include <xen/hvm/params.h>
 #include <xen/memory.h>
+#include <xen/lib/x86/cpu-policy.h>
 
 #define ACPI_MAX_SECONDARY_TABLES 16
 
@@ -65,7 +66,8 @@ static void set_checksum(
 
 static struct acpi_20_madt *construct_madt(struct acpi_ctxt *ctxt,
                                            const struct acpi_config *config,
-                                           struct acpi_info *info)
+                                           struct acpi_info *info,
+                                           const struct cpu_policy *policy)
 {
     struct acpi_20_madt           *madt;
     struct acpi_20_madt_intsrcovr *intsrcovr;
@@ -143,14 +145,25 @@ static struct acpi_20_madt *construct_madt(struct acpi_ctxt *ctxt,
     info->madt_lapic0_addr = ctxt->mem_ops.v2p(ctxt, lapic);
     for ( i = 0; i < hvminfo->nr_vcpus; i++ )
     {
+        uint32_t x2apic_id = x86_x2apic_id_from_vcpu_id(policy, i);
+
         memset(lapic, 0, sizeof(*lapic));
         lapic->type    = ACPI_PROCESSOR_LOCAL_APIC;
         lapic->length  = sizeof(*lapic);
         /* Processor ID must match processor-object IDs in the DSDT. */
         lapic->acpi_processor_id = i;
-        lapic->apic_id = config->lapic_id(i);
+        lapic->apic_id = x2apic_id;
         lapic->flags = (test_bit(i, hvminfo->vcpu_online)
                         ? ACPI_LOCAL_APIC_ENABLED : 0);
+
+        /*
+         * Error-out if the x2APIC ID doesn't fit in the entry
+         *
+         * TODO: Use "x2apic" entries if biggest x2apic_id > 254
+         */
+        if ( lapic->apic_id != x2apic_id )
+            return NULL;
+
         lapic++;
     }
 
@@ -335,7 +348,8 @@ static int construct_passthrough_tables(struct acpi_ctxt *ctxt,
 static int construct_secondary_tables(struct acpi_ctxt *ctxt,
                                       unsigned long *table_ptrs,
                                       struct acpi_config *config,
-                                      struct acpi_info *info)
+                                      struct acpi_info *info,
+                                      const struct cpu_policy *policy)
 {
     int nr_tables = 0;
     struct acpi_20_madt *madt;
@@ -349,7 +363,7 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
     /* MADT. */
     if ( (config->hvminfo->nr_vcpus > 1) || config->hvminfo->apic_mode )
     {
-        madt = construct_madt(ctxt, config, info);
+        madt = construct_madt(ctxt, config, info, policy);
         if (!madt) return -1;
         table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, madt);
     }
@@ -539,7 +553,8 @@ static int new_vm_gid(struct acpi_ctxt *ctxt,
     return 1;
 }
 
-int acpi_build_tables(struct acpi_ctxt *ctxt, struct acpi_config *config)
+int acpi_build_tables(struct acpi_ctxt *ctxt, struct acpi_config *config,
+                      struct cpu_policy *policy)
 {
     struct acpi_info *acpi_info;
     struct acpi_20_rsdp *rsdp;
@@ -667,7 +682,7 @@ int acpi_build_tables(struct acpi_ctxt *ctxt, struct acpi_config *config)
     set_checksum(fadt, offsetof(struct acpi_header, checksum), fadt_size);
 
     nr_secondaries = construct_secondary_tables(ctxt, secondary_tables,
-                 config, acpi_info);
+                 config, acpi_info, policy);
     if ( nr_secondaries < 0 )
         goto oom;
 
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
index deda39e5db..24f62aa5d4 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -28,6 +28,8 @@
 #define ACPI_HAS_CMOS_RTC          (1<<14)
 #define ACPI_HAS_SSDT_LAPTOP_SLATE (1<<15)
 
+struct cpu_policy;
+
 struct xen_vmemrange;
 struct acpi_numa {
     uint32_t nr_vmemranges;
@@ -91,7 +93,8 @@ struct acpi_config {
     uint8_t ioapic_id;
 };
 
-int acpi_build_tables(struct acpi_ctxt *ctxt, struct acpi_config *config);
+int acpi_build_tables(struct acpi_ctxt *ctxt, struct acpi_config *config,
+                      struct cpu_policy *policy);
 
 #endif /* __LIBACPI_H__ */
 
diff --git a/tools/libs/light/libxl_x86_acpi.c b/tools/libs/light/libxl_x86_acpi.c
index 620f3c700c..a5bd42683e 100644
--- a/tools/libs/light/libxl_x86_acpi.c
+++ b/tools/libs/light/libxl_x86_acpi.c
@@ -158,11 +158,27 @@ int libxl__dom_load_acpi(libxl__gc *gc,
 {
     struct acpi_config config = {0};
     struct libxl_acpi_ctxt libxl_ctxt;
-    int rc = 0, acpi_pages_num;
+    uint16_t domid = dom->guest_domid;
+    int rc = 0, r, acpi_pages_num;
+    xc_cpu_policy_t *policy = NULL;
 
     if (b_info->type != LIBXL_DOMAIN_TYPE_PVH)
         goto out;
 
+    policy = xc_cpu_policy_init();
+    if (!policy) {
+        LOGED(ERROR, domid, "xc_cpu_policy_init failed");
+        rc = ERROR_NOMEM;
+        goto out;
+    }
+
+    r = xc_cpu_policy_get_domain(dom->xch, domid, policy);
+    if (r < 0) {
+        LOGED(ERROR, domid, "get_cpu_policy failed");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
     libxl_ctxt.page_size = XC_DOM_PAGE_SIZE(dom);
     libxl_ctxt.page_shift =  XC_DOM_PAGE_SHIFT(dom);
 
@@ -192,7 +208,7 @@ int libxl__dom_load_acpi(libxl__gc *gc,
     libxl_ctxt.guest_end += NUM_ACPI_PAGES * libxl_ctxt.page_size;
 
     /* Build the tables. */
-    rc = acpi_build_tables(&libxl_ctxt.c, &config);
+    rc = acpi_build_tables(&libxl_ctxt.c, &config, &policy->policy);
     if (rc) {
         LOG(ERROR, "acpi_build_tables failed with %d", rc);
         goto out;
@@ -226,6 +242,7 @@ int libxl__dom_load_acpi(libxl__gc *gc,
         libxl_ctxt.page_size;
 
 out:
+    xc_cpu_policy_destroy(policy);
     return rc;
 }
 
-- 
2.34.1


