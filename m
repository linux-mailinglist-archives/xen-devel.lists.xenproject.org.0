Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958508D394E
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 16:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732085.1137936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKMD-00015P-5b; Wed, 29 May 2024 14:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732085.1137936; Wed, 29 May 2024 14:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKMC-00012c-Vx; Wed, 29 May 2024 14:32:48 +0000
Received: by outflank-mailman (input) for mailman id 732085;
 Wed, 29 May 2024 14:32:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygCr=NA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sCKMB-0000Tu-FY
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 14:32:47 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50b6373a-1dc8-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 16:32:45 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5789733769dso24214a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 07:32:45 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a647b827400sm74614166b.69.2024.05.29.07.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 07:32:44 -0700 (PDT)
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
X-Inumbo-ID: 50b6373a-1dc8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716993165; x=1717597965; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ej2rPGHuJHoDIQ9G5DQv2lvCsMSRzdoop6CVxyhmmpE=;
        b=kfb3ILmihg9O58dmrYwLURACOw1LnUiC0e3/dSUNC4iGKQROEX1f9Xz9U9evB4QVHc
         7/N1Kc7Ud3xsduISzqeFRwVJsSzGfQrTuL92dyXQoPiOXTM1/Li/k+PRj+GZFmnlip2Y
         fcWRwA+jUr0opqKpRt4/foreLtCuIakE4YopY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993165; x=1717597965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ej2rPGHuJHoDIQ9G5DQv2lvCsMSRzdoop6CVxyhmmpE=;
        b=P1UYqOEOCPCLmiCU8/0mjXK20I/L1iHCOORnHBj2/itm2VzvSCUUykLdrSvzyGdqOY
         gPEZEq8laDpQPS0FwGUUD0KAjkJG8t4Pu5ZtBsdXGArKi6EDAQ80NVa/HHrc/bs7TtlC
         Lz44VaJjaTHRtQHdddFBXTHscchIAuztppqB6bfkHE/JWXsKSAq8ocqh8Io5EVeF+r9D
         qoYBYCeRLSS22xmxWnqSCI5/M7clqMiK5DzZ4mPu9inUbsnioM4TEI+7SpggXMbG0XaD
         o4bK96/WdldwMbEB5PMzL1bMFjPfJBDUrQHON821ich2L+KNJ1m8le7tYWuO/JXXPM4k
         haSA==
X-Gm-Message-State: AOJu0YyYI4QiI6BjuPm5l0HmQvu8vXgQ9hdpsaK36IKQT1C87QC5QUB7
	DWEHu9kokwlttuqdF6r1cAh5vHde4xyVthzcYMILofvPz4AwYVYCBqQ98rcSV6Vl5WatxFBRP18
	/
X-Google-Smtp-Source: AGHT+IHeS6/oDzvSmtImY2NDIfAASj8WslOmXwjKcdgQTIesJwXIWNp5FDLSzbKkBCsZx8a/GcTN4w==
X-Received: by 2002:a17:906:1555:b0:a5a:24ab:f5e with SMTP id a640c23a62f3a-a642d7d7473mr185870466b.25.1716993164998;
        Wed, 29 May 2024 07:32:44 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH v3 3/6] tools/hvmloader: Retrieve (x2)APIC IDs from the APs themselves
Date: Wed, 29 May 2024 15:32:32 +0100
Message-Id: <eb7438639cc4755d3c959029d809451ee000ccbc.1716976271.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716976271.git.alejandro.vallejo@cloud.com>
References: <cover.1716976271.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it so the APs expose their own APIC IDs in a LUT. We can use that LUT to
populate the MADT, decoupling the algorithm that relates CPU IDs and APIC IDs
from hvmloader.

While at this also remove ap_callin, as writing the APIC ID may serve the same
purpose.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v3:
  * Moved ACCESS_ONCE() to common-macros.h
  * 8bit APIC IDs clipping at 255 was a bogus assumption. Stop relying on it.
    * APIC ID taken from leaf 0xb instead when the x2apic feature is supported.
  * Assert APIC IDs read by the APs are never zero, as that's always the BSP.
  * Added comment about how CPU_TO_X2APICID serves as cross-vcpu synchronizer.
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
index 5d46eee1c5f4..f878d91898bf 100644
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
+    ASSERT(!apic_id);
+
+    return apic_id;
+}
 
 static void __attribute__((regparm(1))) cpu_setup(unsigned int cpu)
 {
@@ -37,13 +64,17 @@ static void __attribute__((regparm(1))) cpu_setup(unsigned int cpu)
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
2.34.1


