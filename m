Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E04898BC45
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 14:39:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808071.1219910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9G-00046d-Me; Tue, 01 Oct 2024 12:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808071.1219910; Tue, 01 Oct 2024 12:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svc9G-000424-Db; Tue, 01 Oct 2024 12:38:38 +0000
Received: by outflank-mailman (input) for mailman id 808071;
 Tue, 01 Oct 2024 12:38:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qrgx=Q5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1svc9E-0002va-J8
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 12:38:36 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12f91f00-7ff2-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 14:38:35 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-539983beb19so2209963e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 05:38:34 -0700 (PDT)
Received: from mewpvdipd1023.corp.cloud.com ([52.166.251.127])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248ac03sm6132630a12.70.2024.10.01.05.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 05:38:33 -0700 (PDT)
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
X-Inumbo-ID: 12f91f00-7ff2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727786314; x=1728391114; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVd0quTcANw6t1kPQZgBl2vPnkcivNSH35qvlQWbNfA=;
        b=d1p7yQe3xHatPjEYCzn6b2xgMpJ0fz4dbYZ11N/EwPxxg0+YPYeSu/rQDyinPWgD/y
         xyfdA5Cyqxb3P1mqKagn1u0BvTV8WaIKw0zsvsEMsGta6ucHyIptU+kROKjiluRjqg2I
         hwP6TO79KTfoFhiLEw4digJ1Uh/V+HRdUQI/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786314; x=1728391114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVd0quTcANw6t1kPQZgBl2vPnkcivNSH35qvlQWbNfA=;
        b=wYoHyKABAPFzqjQ6TpAvUyKsZzhlTWfV5YE6cPrhqLF68f3n7oKULeXH7jg043ypx2
         NJAZfU6gNlrV+oPLc16CLnvL6M+QFieD7Exu2VmsAUVfgTp7FQgPKQ0AoifnKHe08ce9
         unP3UwPQistP5m4/l4Y3oUebC/nYMyqx7PunWK+6Ln+0NUkz+f9jD1lsxeweFeTIbTkZ
         bOmTKymlYQeugrzjicsaqbWuiNbzzC2/rUGAwPUxnaQSxcWfeSEC28t6lH+ITuO6eofe
         uG9roLs7mUtpGVzm3djjByU1Qtf2vhM8WYfWrrOFtkm5lBHAgH49N/E5KtBSZW8XoFzV
         uBdw==
X-Gm-Message-State: AOJu0Yxs09mBlSn2FBWOODqkpcYgud/SlF+xn8X3glJuNZuHXNuDb3KG
	RpZugWBzZpzmYPdVamTJ/Hy03J0kGygdJkoaBCQdug5sGJ7F7r3alhc4y9vqVVSwDDSVANSerwk
	k0XU=
X-Google-Smtp-Source: AGHT+IFIZdsgDe7OkBunGV418GKNfPWk9qD5xmnGo3xLqm5hKLnrUAbXKEYZofkVNRAbG8Z0A2xCSg==
X-Received: by 2002:a05:6512:401e:b0:536:a4d8:917b with SMTP id 2adb3069b0e04-5389fc3a859mr8129082e87.19.1727786313930;
        Tue, 01 Oct 2024 05:38:33 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v6 05/11] tools/hvmloader: Retrieve (x2)APIC IDs from the APs themselves
Date: Tue,  1 Oct 2024 13:38:01 +0100
Message-ID: <20241001123807.605-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241001123807.605-1-alejandro.vallejo@cloud.com>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it so the APs expose their own APIC IDs in a LUT. We can use that
LUT to populate the MADT, decoupling the algorithm that relates CPU IDs
and APIC IDs from hvmloader.

While at this also remove ap_callin, as writing the APIC ID may serve
the same purpose.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/firmware/hvmloader/config.h       |  5 ++-
 tools/firmware/hvmloader/hvmloader.c    |  6 +--
 tools/firmware/hvmloader/mp_tables.c    |  4 +-
 tools/firmware/hvmloader/smp.c          | 54 ++++++++++++++++++++-----
 tools/firmware/hvmloader/util.c         |  2 +-
 tools/include/xen-tools/common-macros.h |  5 +++
 6 files changed, 60 insertions(+), 16 deletions(-)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index cd716bf39245..17666a1fdb01 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -4,6 +4,8 @@
 #include <stdint.h>
 #include <stdbool.h>
 
+#include <xen/hvm/hvm_info_table.h>
+
 enum virtual_vga { VGA_none, VGA_std, VGA_cirrus, VGA_pt };
 extern enum virtual_vga virtual_vga;
 
@@ -48,8 +50,9 @@ extern uint8_t ioapic_version;
 
 #define IOAPIC_ID           0x01
 
+extern uint32_t CPU_TO_X2APICID[HVM_MAX_VCPUS];
+
 #define LAPIC_BASE_ADDRESS  0xfee00000
-#define LAPIC_ID(vcpu_id)   ((vcpu_id) * 2)
 
 #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index f8af88fabf24..0ff190ff4ec0 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -224,7 +224,7 @@ static void apic_setup(void)
 
     /* 8259A ExtInts are delivered through IOAPIC pin 0 (Virtual Wire Mode). */
     ioapic_write(0x10, APIC_DM_EXTINT);
-    ioapic_write(0x11, SET_APIC_ID(LAPIC_ID(0)));
+    ioapic_write(0x11, SET_APIC_ID(CPU_TO_X2APICID[0]));
 }
 
 struct bios_info {
@@ -341,11 +341,11 @@ int main(void)
 
     printf("CPU speed is %u MHz\n", get_cpu_mhz());
 
+    smp_initialise();
+
     apic_setup();
     pci_setup();
 
-    smp_initialise();
-
     perform_tests();
 
     if ( bios->bios_info_setup )
diff --git a/tools/firmware/hvmloader/mp_tables.c b/tools/firmware/hvmloader/mp_tables.c
index 77d3010406d0..494f5bb3d813 100644
--- a/tools/firmware/hvmloader/mp_tables.c
+++ b/tools/firmware/hvmloader/mp_tables.c
@@ -198,8 +198,10 @@ static void fill_mp_config_table(struct mp_config_table *mpct, int length)
 /* fills in an MP processor entry for VCPU 'vcpu_id' */
 static void fill_mp_proc_entry(struct mp_proc_entry *mppe, int vcpu_id)
 {
+    ASSERT(CPU_TO_X2APICID[vcpu_id] < 0xFF );
+
     mppe->type = ENTRY_TYPE_PROCESSOR;
-    mppe->lapic_id = LAPIC_ID(vcpu_id);
+    mppe->lapic_id = CPU_TO_X2APICID[vcpu_id];
     mppe->lapic_version = 0x11;
     mppe->cpu_flags = CPU_FLAG_ENABLED;
     if ( vcpu_id == 0 )
diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
index 1b940cefd071..b0d4da111904 100644
--- a/tools/firmware/hvmloader/smp.c
+++ b/tools/firmware/hvmloader/smp.c
@@ -29,7 +29,34 @@
 
 #include <xen/vcpu.h>
 
-static int ap_callin;
+/**
+ * Lookup table of x2APIC IDs.
+ *
+ * Each entry is populated its respective CPU as they come online. This is required
+ * for generating the MADT with minimal assumptions about ID relationships.
+ */
+uint32_t CPU_TO_X2APICID[HVM_MAX_VCPUS];
+
+/** Tristate about x2apic being supported. -1=unknown */
+static int has_x2apic = -1;
+
+static uint32_t read_apic_id(void)
+{
+    uint32_t apic_id;
+
+    if ( has_x2apic )
+        cpuid(0xb, NULL, NULL, NULL, &apic_id);
+    else
+    {
+        cpuid(1, NULL, &apic_id, NULL, NULL);
+        apic_id >>= 24;
+    }
+
+    /* Never called by cpu0, so should never return 0 */
+    ASSERT(apic_id);
+
+    return apic_id;
+}
 
 static void cpu_setup(unsigned int cpu)
 {
@@ -37,13 +64,17 @@ static void cpu_setup(unsigned int cpu)
     cacheattr_init();
     printf("done.\n");
 
-    if ( !cpu ) /* Used on the BSP too */
+    /* The BSP exits early because its APIC ID is known to be zero */
+    if ( !cpu )
         return;
 
     wmb();
-    ap_callin = 1;
+    ACCESS_ONCE(CPU_TO_X2APICID[cpu]) = read_apic_id();
 
-    /* After this point, the BSP will shut us down. */
+    /*
+     * After this point the BSP will shut us down. A write to
+     * CPU_TO_X2APICID[cpu] signals the BSP to bring down `cpu`.
+     */
 
     for ( ;; )
         asm volatile ( "hlt" );
@@ -54,10 +85,6 @@ static void boot_cpu(unsigned int cpu)
     static uint8_t ap_stack[PAGE_SIZE] __attribute__ ((aligned (16)));
     static struct vcpu_hvm_context ap;
 
-    /* Initialise shared variables. */
-    ap_callin = 0;
-    wmb();
-
     /* Wake up the secondary processor */
     ap = (struct vcpu_hvm_context) {
         .mode = VCPU_HVM_MODE_32B,
@@ -90,10 +117,11 @@ static void boot_cpu(unsigned int cpu)
         BUG();
 
     /*
-     * Wait for the secondary processor to complete initialisation.
+     * Wait for the secondary processor to complete initialisation,
+     * which is signaled by its x2APIC ID being written to the LUT.
      * Do not touch shared resources meanwhile.
      */
-    while ( !ap_callin )
+    while ( !ACCESS_ONCE(CPU_TO_X2APICID[cpu]) )
         cpu_relax();
 
     /* Take the secondary processor offline. */
@@ -104,6 +132,12 @@ static void boot_cpu(unsigned int cpu)
 void smp_initialise(void)
 {
     unsigned int i, nr_cpus = hvm_info->nr_vcpus;
+    uint32_t ecx;
+
+    cpuid(1, NULL, NULL, &ecx, NULL);
+    has_x2apic = (ecx >> 21) & 1;
+    if ( has_x2apic )
+        printf("x2APIC supported\n");
 
     printf("Multiprocessor initialisation:\n");
     cpu_setup(0);
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index d3b3f9038e64..7e1e105d79dd 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -827,7 +827,7 @@ static void acpi_mem_free(struct acpi_ctxt *ctxt,
 
 static uint32_t acpi_lapic_id(unsigned cpu)
 {
-    return LAPIC_ID(cpu);
+    return CPU_TO_X2APIC_ID[cpu];
 }
 
 void hvmloader_acpi_build_tables(struct acpi_config *config,
diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 60912225cb7a..336c6309d96e 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -108,4 +108,9 @@
 #define get_unaligned(ptr)      get_unaligned_t(typeof(*(ptr)), ptr)
 #define put_unaligned(val, ptr) put_unaligned_t(typeof(*(ptr)), val, ptr)
 
+#define __ACCESS_ONCE(x) ({                             \
+            (void)(typeof(x))0; /* Scalar typecheck. */ \
+            (volatile typeof(x) *)&(x); })
+#define ACCESS_ONCE(x) (*__ACCESS_ONCE(x))
+
 #endif	/* __XEN_TOOLS_COMMON_MACROS__ */
-- 
2.46.0


