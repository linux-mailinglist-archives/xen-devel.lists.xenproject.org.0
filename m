Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2B68BFD56
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 14:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718780.1121308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4gaC-0003Z7-BH; Wed, 08 May 2024 12:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718780.1121308; Wed, 08 May 2024 12:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4gaC-0003SD-1h; Wed, 08 May 2024 12:39:40 +0000
Received: by outflank-mailman (input) for mailman id 718780;
 Wed, 08 May 2024 12:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nIi=ML=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s4gaA-0002b0-Jf
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 12:39:38 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0750ef9e-0d38-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 14:39:36 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a59c04839caso977235566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 05:39:36 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 uj4-20020a170907c98400b00a599f876c28sm5984439ejc.38.2024.05.08.05.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 05:39:35 -0700 (PDT)
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
X-Inumbo-ID: 0750ef9e-0d38-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715171976; x=1715776776; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tjb9wDk03eu5cy1/rNtEigMH1xNhBsbk5Mon31Q8thQ=;
        b=E3lIERaoiBhvhymIlJVY5fSiUamqJXXkB5MeK37T9+Lx48NFtdYICzQ5oaGslclVBg
         0V1hW36VSnVNJuY1Nl0q+gh6slUTMmURmdyMo9u6bEbMVyMJm6Ff56l/BTNhXf0sTJMe
         t7TUGtNZNupX5YFJF5kwurW9uUFVlv4ExCGI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715171976; x=1715776776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tjb9wDk03eu5cy1/rNtEigMH1xNhBsbk5Mon31Q8thQ=;
        b=v34JS0yPekgUZVYkb2ZJaQ3JsRs6ErcrNXdTRwUlyrBzA19wlg569afnmNxhcMwdm5
         WZ/ioguIFu8dLz/2/4CVaQGCntF6IyR7UrUG2znToYZVmAnG+90yjC69SO4qW+RqBCGJ
         KqN8yQ2Ds+IpPeswnhImumqFZe3qlffHkdBw/yz3ie6zrzTonD5xoqdAeob74k/9JkBp
         CiQRGVnfGe0WRPAr4n+3X3mCm2qHFrLZfjOVNHKifUzASV0zHkOzHp9G698Biy2nR3qO
         QlzVULXgKXJaHOd2pYQelfjGYn4hZYcoIq6vzxyvx6k857EKaSSm6ZUoMVINCoy2yPGi
         qjGA==
X-Gm-Message-State: AOJu0YzsjjURn4l0VRqukhY+zkrG/asJAZFMxKNFE5MAaoqvCgm98vBK
	jHRkkFH1637MSEVzlQt10Amj9ZMlTUrNZ2jvZWxXev1LUTHLxTBrBkdyfBhlIG6SRx1kyGnZhCs
	b
X-Google-Smtp-Source: AGHT+IF9b75aKMImWVHAuQOHLUdGMkpVk6WnMpMg8aFYo7LFMr0V61yRnpql50wsVtLQWkTMQRkUOQ==
X-Received: by 2002:a17:907:3e13:b0:a59:ca33:6845 with SMTP id a640c23a62f3a-a59fb9d2c7emr178006266b.75.1715171975798;
        Wed, 08 May 2024 05:39:35 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH v2 5/8] tools/hvmloader: Retrieve (x2)APIC IDs from the APs themselves
Date: Wed,  8 May 2024 13:39:24 +0100
Message-Id: <b2d4109cd30c82e0af153d36f8dce77c59f03695.1715102098.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715102098.git.alejandro.vallejo@cloud.com>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it so the APs expose their own APIC IDs in a LUT. We can use that LUT to
populate the MADT, decoupling the algorithm that relates CPU IDs and APIC IDs
from hvmloader.

While at this also remove ap_callin, as writing the APIC ID may serve the same
purpose.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * New patch. Replaces adding cpu policy to hvmloader in v1.
---
 tools/firmware/hvmloader/config.h    |  6 ++++-
 tools/firmware/hvmloader/hvmloader.c |  4 +--
 tools/firmware/hvmloader/smp.c       | 40 +++++++++++++++++++++++-----
 tools/firmware/hvmloader/util.h      |  5 ++++
 xen/arch/x86/include/asm/hvm/hvm.h   |  1 +
 5 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index c82adf6dc508..edf6fa9c908c 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -4,6 +4,8 @@
 #include <stdint.h>
 #include <stdbool.h>
 
+#include <xen/hvm/hvm_info_table.h>
+
 enum virtual_vga { VGA_none, VGA_std, VGA_cirrus, VGA_pt };
 extern enum virtual_vga virtual_vga;
 
@@ -49,8 +51,10 @@ extern uint8_t ioapic_version;
 
 #define IOAPIC_ID           0x01
 
+extern uint32_t CPU_TO_X2APICID[HVM_MAX_VCPUS];
+
 #define LAPIC_BASE_ADDRESS  0xfee00000
-#define LAPIC_ID(vcpu_id)   ((vcpu_id) * 2)
+#define LAPIC_ID(vcpu_id)   (CPU_TO_X2APICID[(vcpu_id)])
 
 #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index c58841e5b556..1eba92229925 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -342,11 +342,11 @@ int main(void)
 
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
index a668f15d7e1f..4d75f239c2f5 100644
--- a/tools/firmware/hvmloader/smp.c
+++ b/tools/firmware/hvmloader/smp.c
@@ -29,7 +29,34 @@
 
 #include <xen/vcpu.h>
 
-static int ap_callin, ap_cpuid;
+static int ap_cpuid;
+
+/**
+ * Lookup table of x2APIC IDs.
+ *
+ * Each entry is populated its respective CPU as they come online. This is required
+ * for generating the MADT with minimal assumptions about ID relationships.
+ */
+uint32_t CPU_TO_X2APICID[HVM_MAX_VCPUS];
+
+static uint32_t read_apic_id(void)
+{
+    uint32_t apic_id;
+
+    cpuid(1, NULL, &apic_id, NULL, NULL);
+    apic_id >>= 24;
+
+    /*
+     * APIC IDs over 255 are represented by 255 in leaf 1 and are meant to be
+     * read from topology leaves instead. Xen exposes x2APIC IDs in leaf 0xb,
+     * but only if the x2APIC feature is present. If there are that many CPUs
+     * it's guaranteed to be there so we can avoid checking for it specifically
+     */
+    if ( apic_id == 255 )
+        cpuid(0xb, NULL, NULL, NULL, &apic_id);
+
+    return apic_id;
+}
 
 static void ap_start(void)
 {
@@ -37,12 +64,12 @@ static void ap_start(void)
     cacheattr_init();
     printf("done.\n");
 
+    wmb();
+    ACCESS_ONCE(CPU_TO_X2APICID[ap_cpuid]) = read_apic_id();
+
     if ( !ap_cpuid )
         return;
 
-    wmb();
-    ap_callin = 1;
-
     while ( 1 )
         asm volatile ( "hlt" );
 }
@@ -86,10 +113,11 @@ static void boot_cpu(unsigned int cpu)
         BUG();
 
     /*
-     * Wait for the secondary processor to complete initialisation.
+     * Wait for the secondary processor to complete initialisation,
+     * which is signaled by its x2APIC ID being writted to the LUT.
      * Do not touch shared resources meanwhile.
      */
-    while ( !ap_callin )
+    while ( !ACCESS_ONCE(CPU_TO_X2APICID[cpu]) )
         cpu_relax();
 
     /* Take the secondary processor offline. */
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 14078bde1e30..51e9003bc615 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -23,6 +23,11 @@ enum {
 #define __STR(...) #__VA_ARGS__
 #define STR(...) __STR(__VA_ARGS__)
 
+#define __ACCESS_ONCE(x) ({                             \
+            (void)(typeof(x))0; /* Scalar typecheck. */ \
+            (volatile typeof(x) *)&(x); })
+#define ACCESS_ONCE(x) (*__ACCESS_ONCE(x))
+
 /* GDT selector values. */
 #define SEL_CODE16          0x0008
 #define SEL_DATA16          0x0010
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 84911f3ebcb4..6c005f0b0b38 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -16,6 +16,7 @@
 #include <asm/current.h>
 #include <asm/x86_emulate.h>
 #include <asm/hvm/asid.h>
+#include <asm/hvm/vlapic.h>
 
 struct pirq; /* needed by pi_update_irte */
 
-- 
2.34.1


