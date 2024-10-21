Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C058F9A6E98
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:46:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823736.1237820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc3-0008Ap-UJ; Mon, 21 Oct 2024 15:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823736.1237820; Mon, 21 Oct 2024 15:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uc3-00087j-OJ; Mon, 21 Oct 2024 15:46:31 +0000
Received: by outflank-mailman (input) for mailman id 823736;
 Mon, 21 Oct 2024 15:46:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlK+=RR=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t2uc1-00072f-Kw
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:46:29 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2cb0625-8fc3-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 17:46:28 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-539ee1acb86so2582166e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 08:46:28 -0700 (PDT)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91370fe5sm215688966b.112.2024.10.21.08.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 08:46:26 -0700 (PDT)
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
X-Inumbo-ID: a2cb0625-8fc3-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729525587; x=1730130387; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtunhDViKB6O/YaErMLF4cLS3+ZvtcQXDHgeo9Ij1bY=;
        b=djRRh/9z86qf/TEZU79596fEqF96wZI81c+pjR4scKPl3VFStBF/pULzIRyzNHF7MR
         H3yts0akrvmrixv8enDYClgNChFmVaTES0gDDmhpq6X272d46dNLMsj+6R8x/Iq5jCXZ
         bA/RwWrpKDlPmbiGp+/R6rtJcRTssGnqdR56s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525587; x=1730130387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtunhDViKB6O/YaErMLF4cLS3+ZvtcQXDHgeo9Ij1bY=;
        b=VDQ+Lj2fqy2C/2oHSi03klJu/jZed/one70kHtcMoteFj4LYfkDQnsQDIlJ1dsXszz
         GDGqWkmfuFYYX4MrlU7lGLYfa5EwsYmF/X1utEgVR4IwdgmRbRazUTVKQvtt0/VKwPb8
         klip1YEhKMpskAOJiNaVzJVRuJ3S7Ks/cNeX+PLxqr4MgvEv+MYboXxuGFjWeIDu0OEk
         QdY73ZSzZpV4idaseyCzKNTXL3R6XHFjDPdM7SGEBkZN9QD3fiZkevtQRKMUGzJc/pIv
         vC+Esh5kE9OKBpvySvEmOc42m4zNxT2zJrOzBVpWs0gjJXPIZLNLZeELLVXfuXs2sFBi
         pkmA==
X-Gm-Message-State: AOJu0Yyc52QyQ4FyDjlbqRPGG9h3BL6DU6Jf86bLCL9dw61iSZrgfo0m
	DA1F3RU23IBw+tDDMq8TP/bPkJ9lpJb4AouaP0Q6kTrK5YAlu8nRD0NEqdrIVwxEhDDy0RQR4Gp
	z
X-Google-Smtp-Source: AGHT+IFxh2loJHPDPgOCevVyoWp2JdQvGapLa1M3JZTi6PJ3c8ms+bUOhIryrbRzFPxi7M0HnoySFQ==
X-Received: by 2002:a05:6512:31c1:b0:535:6cde:5c4d with SMTP id 2adb3069b0e04-53a1520bfaemr7157800e87.3.1729525587370;
        Mon, 21 Oct 2024 08:46:27 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v7 04/10] tools/hvmloader: Retrieve (x2)APIC IDs from the APs themselves
Date: Mon, 21 Oct 2024 16:45:54 +0100
Message-ID: <20241021154600.11745-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it so the APs expose their own APIC IDs in a LUT. We can use that
LUT to populate the MADT, decoupling the algorithm that relates CPU IDs
and APIC IDs from hvmloader.

Moved smp_initialise() ahead of apic_setup() in order to initialise
cpu_to_x2apicid ASAP and avoid using it uninitialised. Note that
bringing up the APs doesn't need the APIC in hvmloader becasue it always
runs virtualized and uses the PV interface.

While at this, exploit the assumption that CPU0 always has APICID0 to
remove ap_callin, as writing the APIC ID may serve the same purpose.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v7:
  * CPU_TO_X2APICID to lowercase
  * Spell out the CPU0<-->APICID0 relationship in the commit message as
    the rationale to remove ap_callin.
  * Explain the motion of smp_initialise() ahead of apic_setup() in the
    commit message.
---
 tools/firmware/hvmloader/config.h       |  5 ++-
 tools/firmware/hvmloader/hvmloader.c    |  6 +--
 tools/firmware/hvmloader/mp_tables.c    |  4 +-
 tools/firmware/hvmloader/smp.c          | 57 ++++++++++++++++++++-----
 tools/firmware/hvmloader/util.c         |  2 +-
 tools/include/xen-tools/common-macros.h |  5 +++
 6 files changed, 63 insertions(+), 16 deletions(-)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index cd716bf39245..04cab1e59f08 100644
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
 
+extern uint32_t cpu_to_x2apicid[HVM_MAX_VCPUS];
+
 #define LAPIC_BASE_ADDRESS  0xfee00000
-#define LAPIC_ID(vcpu_id)   ((vcpu_id) * 2)
 
 #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index f8af88fabf24..bebdfa923880 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -224,7 +224,7 @@ static void apic_setup(void)
 
     /* 8259A ExtInts are delivered through IOAPIC pin 0 (Virtual Wire Mode). */
     ioapic_write(0x10, APIC_DM_EXTINT);
-    ioapic_write(0x11, SET_APIC_ID(LAPIC_ID(0)));
+    ioapic_write(0x11, SET_APIC_ID(cpu_to_x2apicid[0]));
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
index 77d3010406d0..539260365e1e 100644
--- a/tools/firmware/hvmloader/mp_tables.c
+++ b/tools/firmware/hvmloader/mp_tables.c
@@ -198,8 +198,10 @@ static void fill_mp_config_table(struct mp_config_table *mpct, int length)
 /* fills in an MP processor entry for VCPU 'vcpu_id' */
 static void fill_mp_proc_entry(struct mp_proc_entry *mppe, int vcpu_id)
 {
+    ASSERT(cpu_to_x2apicid[vcpu_id] < 0xFF );
+
     mppe->type = ENTRY_TYPE_PROCESSOR;
-    mppe->lapic_id = LAPIC_ID(vcpu_id);
+    mppe->lapic_id = cpu_to_x2apicid[vcpu_id];
     mppe->lapic_version = 0x11;
     mppe->cpu_flags = CPU_FLAG_ENABLED;
     if ( vcpu_id == 0 )
diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
index 1b940cefd071..d63536f14f00 100644
--- a/tools/firmware/hvmloader/smp.c
+++ b/tools/firmware/hvmloader/smp.c
@@ -29,7 +29,37 @@
 
 #include <xen/vcpu.h>
 
-static int ap_callin;
+/**
+ * Lookup table of (x2)APIC IDs.
+ *
+ * Each entry is populated its respective CPU as they come online. This is required
+ * for generating the MADT with minimal assumptions about ID relationships.
+ *
+ * While the name makes "x2" explicit, these may actually be xAPIC IDs if no
+ * x2APIC is present. "x2" merely highlights that each entry is 32 bits wide.
+ */
+uint32_t cpu_to_x2apicid[HVM_MAX_VCPUS];
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
@@ -37,13 +67,17 @@ static void cpu_setup(unsigned int cpu)
     cacheattr_init();
     printf("done.\n");
 
-    if ( !cpu ) /* Used on the BSP too */
+    /* The BSP exits early because its APIC ID is known to be zero */
+    if ( !cpu )
         return;
 
     wmb();
-    ap_callin = 1;
+    ACCESS_ONCE(cpu_to_x2apicid[cpu]) = read_apic_id();
 
-    /* After this point, the BSP will shut us down. */
+    /*
+     * After this point the BSP will shut us down. A write to
+     * cpu_to_x2apicid[cpu] signals the BSP to bring down `cpu`.
+     */
 
     for ( ;; )
         asm volatile ( "hlt" );
@@ -54,10 +88,6 @@ static void boot_cpu(unsigned int cpu)
     static uint8_t ap_stack[PAGE_SIZE] __attribute__ ((aligned (16)));
     static struct vcpu_hvm_context ap;
 
-    /* Initialise shared variables. */
-    ap_callin = 0;
-    wmb();
-
     /* Wake up the secondary processor */
     ap = (struct vcpu_hvm_context) {
         .mode = VCPU_HVM_MODE_32B,
@@ -90,10 +120,11 @@ static void boot_cpu(unsigned int cpu)
         BUG();
 
     /*
-     * Wait for the secondary processor to complete initialisation.
+     * Wait for the secondary processor to complete initialisation,
+     * which is signaled by its x2APIC ID being written to the LUT.
      * Do not touch shared resources meanwhile.
      */
-    while ( !ap_callin )
+    while ( !ACCESS_ONCE(cpu_to_x2apicid[cpu]) )
         cpu_relax();
 
     /* Take the secondary processor offline. */
@@ -104,6 +135,12 @@ static void boot_cpu(unsigned int cpu)
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
index d3b3f9038e64..821b3086a87d 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -827,7 +827,7 @@ static void acpi_mem_free(struct acpi_ctxt *ctxt,
 
 static uint32_t acpi_lapic_id(unsigned cpu)
 {
-    return LAPIC_ID(cpu);
+    return cpu_to_x2apic_id[cpu];
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
2.47.0


