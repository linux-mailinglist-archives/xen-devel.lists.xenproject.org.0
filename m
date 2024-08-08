Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7869494BEBA
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:46:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774192.1184709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3T6-0006eM-B2; Thu, 08 Aug 2024 13:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774192.1184709; Thu, 08 Aug 2024 13:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3T6-0006bW-7O; Thu, 08 Aug 2024 13:46:16 +0000
Received: by outflank-mailman (input) for mailman id 774192;
 Thu, 08 Aug 2024 13:46:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgd2=PH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sc3Pz-0003nA-M7
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:43:03 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2184dabe-558c-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 15:43:01 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7ac469e4c4so157256866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:43:01 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ecb551sm741537166b.223.2024.08.08.06.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 06:43:00 -0700 (PDT)
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
X-Inumbo-ID: 2184dabe-558c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723124581; x=1723729381; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ch+IX6lnENH71AXJ9ytitrdkxTivN5M0WBk5MWa3vLY=;
        b=ZkHKGVlqj0wsNvVFcmRxs3Prt8FdgWl1Q37USeGO7MlEpr0wJjtu3rPaVWzEs5UR0E
         G+12UbcTOPf1TbCziN3l2Eb/WJSA7BcCIy92vjB2KSdVVPDJy+fjfHi2wxoIXRjGmax5
         jzQH3BC+BhY2UbT0WVi9mwD0B18GYsqTxDEbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124581; x=1723729381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ch+IX6lnENH71AXJ9ytitrdkxTivN5M0WBk5MWa3vLY=;
        b=VQQ+fgLgSw+4C9lxpgXtgYhV7DQ0cWbO6bQ/LRj2pmGxnDpbHD/5Ic0zr/9vTUwwOn
         Rf4djYvRfvxUQo/KTeJvzgYNB66xXz7X269M4zewRY/K2ZgFRsgkKj7ExnO5fam5Cu1y
         XXtc5pz8MT7WLmBlnNKX3UpBNF6dyknYxWi/KcYPkDrm8PdIgZ2BjYQClGzIcs/9+YdU
         mXFywwwSHYo4D4MlNU0IFoJss8w2wohL7RNahGZWO7wwl0nHlegrhJTstf1/Yfi6WCY1
         kIv19JF8s1tqQ8wCeBpa3HdLQj1Q2q814gf3ojCss4t+CowgDgLWgj4tq89shW0mlLIq
         Hinw==
X-Gm-Message-State: AOJu0YxrVIdTMCsYAsQa/700UV7fPGujsAq0ffNuNL/G5d7DBMz8KwkZ
	jeoCOuVGWmNKRSvJn51Tawh+Uu5mUIsRmgm7hb/uXXkLMUTSny08MqJKD6f0SvZozS3tDshzzkE
	4
X-Google-Smtp-Source: AGHT+IGsqgUdRiVpKMpPF6V1Lc/b5Yh4OPDiUx9kn6eaKj8jLOwWi7WVZ/+J9WMPYpAW8iDl9C2VEQ==
X-Received: by 2002:a17:907:ea2:b0:a6f:5609:954f with SMTP id a640c23a62f3a-a8091f1ebb5mr175979066b.12.1723124581075;
        Thu, 08 Aug 2024 06:43:01 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v5 05/10] tools/hvmloader: Retrieve (x2)APIC IDs from the APs themselves
Date: Thu,  8 Aug 2024 14:42:45 +0100
Message-ID: <20240808134251.29995-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
References: <20240808134251.29995-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it so the APs expose their own APIC IDs in a LUT. We can use that
LUT to
populate the MADT, decoupling the algorithm that relates CPU IDs and
APIC IDs
from hvmloader.

While at this also remove ap_callin, as writing the APIC ID may serve
the same
purpose.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v5:
  * No change
---
 tools/firmware/hvmloader/config.h       |  6 ++-
 tools/firmware/hvmloader/hvmloader.c    |  4 +-
 tools/firmware/hvmloader/smp.c          | 54 ++++++++++++++++++++-----
 tools/include/xen-tools/common-macros.h |  5 +++
 4 files changed, 56 insertions(+), 13 deletions(-)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index cd716bf39245..213ac1f28e17 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -4,6 +4,8 @@
 #include <stdint.h>
 #include <stdbool.h>
 
+#include <xen/hvm/hvm_info_table.h>
+
 enum virtual_vga { VGA_none, VGA_std, VGA_cirrus, VGA_pt };
 extern enum virtual_vga virtual_vga;
 
@@ -48,8 +50,10 @@ extern uint8_t ioapic_version;
 
 #define IOAPIC_ID           0x01
 
+extern uint32_t CPU_TO_X2APICID[HVM_MAX_VCPUS];
+
 #define LAPIC_BASE_ADDRESS  0xfee00000
-#define LAPIC_ID(vcpu_id)   ((vcpu_id) * 2)
+#define LAPIC_ID(vcpu_id)   (CPU_TO_X2APICID[(vcpu_id)])
 
 #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index f8af88fabf24..5c02e8fc226a 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
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
2.45.2


