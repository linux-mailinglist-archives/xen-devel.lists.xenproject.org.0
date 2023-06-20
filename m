Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFE2737292
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551991.861840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyt-0006rQ-Hi; Tue, 20 Jun 2023 17:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551991.861840; Tue, 20 Jun 2023 17:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyt-0006on-C4; Tue, 20 Jun 2023 17:17:27 +0000
Received: by outflank-mailman (input) for mailman id 551991;
 Tue, 20 Jun 2023 17:17:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBeys-0005QM-6i
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:17:26 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5264411f-0f8e-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:17:24 +0200 (CEST)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-56fff21c2ebso53685627b3.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:17:24 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 f81-20020a25cf54000000b00bcc0f2e4f05sm461938ybg.59.2023.06.20.10.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:17:22 -0700 (PDT)
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
X-Inumbo-ID: 5264411f-0f8e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281443; x=1689873443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2J1bNKwymcLCcica7VZKf11hCWokpfQzX8mE5sXyNo=;
        b=LZXZlej+K+2mi+QtRPDeuSiUGjLupvYCx2+7xRf6ywldCJs6yisa+0DNOPO1ZHPFOO
         IHtbs1VQYBms9Gp7kgBBCqadOl2zuuF5YlymFFcY0OOULvJCiLn8i7ATSf0fzUVJBeRa
         XrAJyjYmh4Ftxicni6gJMPY9D+4QTwDnbwgUB+Q9cj4Zta9ZY/yJDix+ZEbR++N8DYiw
         jJ9SjbwmVH7dLHcLv/b/OvnTetsSWDSnFufAwNri67evQigTGYiqw9zmF1gGDCdbrCiK
         qb2bWgmR/q+DTIr7aTiPvwRnaKbqRgnR8tBBiQpCnoegydkoDCYQyoYTU5A8J381KjgG
         DSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281443; x=1689873443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2J1bNKwymcLCcica7VZKf11hCWokpfQzX8mE5sXyNo=;
        b=USFYdw6moSxB36JapTZRTUQz7jMP4Nv6Lcs8JOt2FVq+ufR0qNz04HQYpFXiTSv5Ki
         o/1/KNFVve2jwAGfPjiR7j0uESp8PYicsRMhdgw1ALH8+z9x2acX+lglkLeFGSAPwBAP
         W7YpvLGHOX0yT633gBpH2qr8mfghghhh4/MuFpjqHCTQQ43ddMuK/aJJDVe3rfuW3HhY
         LauP2Lle+eENopukMi5SbVyro36+xZJrT/YNZsFosRbWt7P1BQ2EqXapbaoY6vtO+LTT
         qhJbMjrmwkW5jAGya9t1rT3GbBGLmN2+RateTdolDlmQT1FKIQ3OQ07ePV3ycXAlYdOW
         KRdQ==
X-Gm-Message-State: AC+VfDzKGFfVnaYD7aVDKRa3OTTzRIJiew9z5CVA/aQuyI2AWzM4E84p
	HQKjT1WVqfllR/FV+aiJGWhYa5f2EIEtxQ==
X-Google-Smtp-Source: ACHHUZ4XHmDRoy3fVyRInCf5TN0utBd/CpKeJ1xE1JOORcBMmo0GGOD5iOo+u5GQosrgQoRbYL56yg==
X-Received: by 2002:a05:6902:cd:b0:bd5:9d1e:7182 with SMTP id i13-20020a05690200cd00b00bd59d1e7182mr9697443ybs.8.1687281442753;
        Tue, 20 Jun 2023 10:17:22 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Joel Upham <jupham125@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 06/12] hvmloader: add basic Q35 support
Date: Tue, 20 Jun 2023 13:15:46 -0400
Message-Id: <b2109aa2c5a68ca080339462448c418600ccf20f.1687215890.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687215890.git.jupham125@gmail.com>
References: <cover.1687215890.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch does following:

1. Move PCI-device specific initialization out of pci_setup function
to the newly created class_specific_pci_device_setup function to simplify
code.

2. PCI-device specific initialization extended with LPC controller
initialization

3. Initialize PIRQA...{PIRQD, PIRQH} routing accordingly to the emulated
south bridge (either located on PCI_ISA_DEVFN or PCI_ICH9_LPC_DEVFN).

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 tools/firmware/hvmloader/config.h |   1 +
 tools/firmware/hvmloader/pci.c    | 162 +++++++++++++++++++-----------
 2 files changed, 104 insertions(+), 59 deletions(-)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index c82adf6dc5..de3bbed609 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -54,6 +54,7 @@ extern uint8_t ioapic_version;
 
 #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
+#define PCI_ICH9_LPC_DEVFN  0xf8    /* dev 31, fn 0 */
 
 #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
 
diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
index 257a6feb61..8249f70806 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -34,6 +34,7 @@ const uint32_t pci_mem_end = RESERVED_MEMBASE;
 uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
 
 enum virtual_vga virtual_vga = VGA_none;
+uint32_t vga_devfn = 256;
 unsigned long igd_opregion_pgbase = 0;
 
 /* Check if the specified range conflicts with any reserved device memory. */
@@ -75,14 +76,93 @@ static int find_next_rmrr(uint32_t base)
     return next_rmrr;
 }
 
+#define SCI_EN_IOPORT  (ACPI_PM1A_EVT_BLK_ADDRESS_V1 + 0x30)
+#define GBL_SMI_EN      (1 << 0)
+#define APMC_EN         (1 << 5)
+
+static void class_specific_pci_device_setup(uint16_t vendor_id,
+                                            uint16_t device_id,
+                                            uint8_t bus, uint8_t devfn)
+{
+    uint16_t class;
+
+    class = pci_readw(devfn, PCI_CLASS_DEVICE);
+
+    switch ( class )
+    {
+    case 0x0300:
+        /* If emulated VGA is found, preserve it as primary VGA. */
+        if ( (vendor_id == 0x1234) && (device_id == 0x1111) )
+        {
+            vga_devfn = devfn;
+            virtual_vga = VGA_std;
+        }
+        else if ( (vendor_id == 0x1013) && (device_id == 0xb8) )
+        {
+            vga_devfn = devfn;
+            virtual_vga = VGA_cirrus;
+        }
+        else if ( virtual_vga == VGA_none )
+        {
+            vga_devfn = devfn;
+            virtual_vga = VGA_pt;
+            if ( vendor_id == 0x8086 )
+            {
+                igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
+                /*
+                 * Write the the OpRegion offset to give the opregion
+                 * address to the device model. The device model will trap
+                 * and map the OpRegion at the give address.
+                 */
+                pci_writel(vga_devfn, PCI_INTEL_OPREGION,
+                           igd_opregion_pgbase << PAGE_SHIFT);
+            }
+        }
+        break;
+
+    case 0x0680:
+        /* PIIX4 ACPI PM. Special device with special PCI config space. */
+        ASSERT((vendor_id == 0x8086) && (device_id == 0x7113));
+        pci_writew(devfn, 0x20, 0x0000); /* No smb bus IO enable */
+        pci_writew(devfn, 0xd2, 0x0000); /* No smb bus IO enable */
+        pci_writew(devfn, 0x22, 0x0000);
+        pci_writew(devfn, 0x3c, 0x0009); /* Hardcoded IRQ9 */
+        pci_writew(devfn, 0x3d, 0x0001);
+        pci_writel(devfn, 0x40, ACPI_PM1A_EVT_BLK_ADDRESS_V1 | 1);
+        pci_writeb(devfn, 0x80, 0x01); /* enable PM io space */
+        break;
+
+    case 0x0601:
+        /* LPC bridge */
+        if (vendor_id == 0x8086 && device_id == 0x2918)
+        {
+            pci_writeb(devfn, 0x3c, 0x09); /* Hardcoded IRQ9 */
+            pci_writeb(devfn, 0x3d, 0x01);
+            pci_writel(devfn, 0x40, ACPI_PM1A_EVT_BLK_ADDRESS_V1 | 1);
+            pci_writeb(devfn, 0x44, 0x80); /* enable PM io space */
+            outl(SCI_EN_IOPORT, inl(SCI_EN_IOPORT) | GBL_SMI_EN | APMC_EN);
+        }
+        break;
+
+    case 0x0101:
+        if ( vendor_id == 0x8086 )
+        {
+            /* Intel ICHs since PIIX3: enable IDE legacy mode. */
+            pci_writew(devfn, 0x40, 0x8000); /* enable IDE0 */
+            pci_writew(devfn, 0x42, 0x8000); /* enable IDE1 */
+        }
+        break;
+    }
+}
+
 void pci_setup(void)
 {
     uint8_t is_64bar, using_64bar, bar64_relocate = 0;
     uint32_t devfn, bar_reg, cmd, bar_data, bar_data_upper;
     uint64_t base, bar_sz, bar_sz_upper, mmio_total = 0;
-    uint32_t vga_devfn = 256;
-    uint16_t class, vendor_id, device_id;
+    uint16_t vendor_id, device_id;
     unsigned int bar, pin, link, isa_irq;
+    int is_running_on_q35 = 0;
     uint8_t pci_devfn_decode_type[256] = {};
 
     /* Resources assignable to PCI devices via BARs. */
@@ -137,13 +217,28 @@ void pci_setup(void)
     if ( s )
         mmio_hole_size = strtoll(s, NULL, 0);
 
+    /* check if we are on Q35 and set the flag if it is the case */
+    is_running_on_q35 = get_pc_machine_type() == MACHINE_TYPE_Q35;
+
     /* Program PCI-ISA bridge with appropriate link routes. */
     isa_irq = 0;
     for ( link = 0; link < 4; link++ )
     {
         do { isa_irq = (isa_irq + 1) & 15;
         } while ( !(PCI_ISA_IRQ_MASK & (1U << isa_irq)) );
-        pci_writeb(PCI_ISA_DEVFN, 0x60 + link, isa_irq);
+
+        if (is_running_on_q35)
+        {
+            pci_writeb(PCI_ICH9_LPC_DEVFN, 0x60 + link, isa_irq);
+
+            /* PIRQE..PIRQH are unused */
+            pci_writeb(PCI_ICH9_LPC_DEVFN, 0x68 + link, 0x80);
+        }
+        else
+        {
+            pci_writeb(PCI_ISA_DEVFN, 0x60 + link, isa_irq);
+        }
+
         printf("PCI-ISA link %u routed to IRQ%u\n", link, isa_irq);
     }
 
@@ -154,66 +249,13 @@ void pci_setup(void)
     /* Scan the PCI bus and map resources. */
     for ( devfn = 0; devfn < 256; devfn++ )
     {
-        class     = pci_readw(devfn, PCI_CLASS_DEVICE);
         vendor_id = pci_readw(devfn, PCI_VENDOR_ID);
         device_id = pci_readw(devfn, PCI_DEVICE_ID);
         if ( (vendor_id == 0xffff) && (device_id == 0xffff) )
             continue;
 
-        ASSERT((devfn != PCI_ISA_DEVFN) ||
-               ((vendor_id == 0x8086) && (device_id == 0x7000)));
-
-        switch ( class )
-        {
-        case 0x0300:
-            /* If emulated VGA is found, preserve it as primary VGA. */
-            if ( (vendor_id == 0x1234) && (device_id == 0x1111) )
-            {
-                vga_devfn = devfn;
-                virtual_vga = VGA_std;
-            }
-            else if ( (vendor_id == 0x1013) && (device_id == 0xb8) )
-            {
-                vga_devfn = devfn;
-                virtual_vga = VGA_cirrus;
-            }
-            else if ( virtual_vga == VGA_none )
-            {
-                vga_devfn = devfn;
-                virtual_vga = VGA_pt;
-                if ( vendor_id == 0x8086 )
-                {
-                    igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
-                    /*
-                     * Write the the OpRegion offset to give the opregion
-                     * address to the device model. The device model will trap 
-                     * and map the OpRegion at the give address.
-                     */
-                    pci_writel(vga_devfn, PCI_INTEL_OPREGION,
-                               igd_opregion_pgbase << PAGE_SHIFT);
-                }
-            }
-            break;
-        case 0x0680:
-            /* PIIX4 ACPI PM. Special device with special PCI config space. */
-            ASSERT((vendor_id == 0x8086) && (device_id == 0x7113));
-            pci_writew(devfn, 0x20, 0x0000); /* No smb bus IO enable */
-            pci_writew(devfn, 0xd2, 0x0000); /* No smb bus IO enable */
-            pci_writew(devfn, 0x22, 0x0000);
-            pci_writew(devfn, 0x3c, 0x0009); /* Hardcoded IRQ9 */
-            pci_writew(devfn, 0x3d, 0x0001);
-            pci_writel(devfn, 0x40, ACPI_PM1A_EVT_BLK_ADDRESS_V1 | 1);
-            pci_writeb(devfn, 0x80, 0x01); /* enable PM io space */
-            break;
-        case 0x0101:
-            if ( vendor_id == 0x8086 )
-            {
-                /* Intel ICHs since PIIX3: enable IDE legacy mode. */
-                pci_writew(devfn, 0x40, 0x8000); /* enable IDE0 */
-                pci_writew(devfn, 0x42, 0x8000); /* enable IDE1 */
-            }
-            break;
-        }
+        class_specific_pci_device_setup(vendor_id, device_id,
+                                        0 /* virt_bus support TBD */, devfn);
 
         /*
          * It is recommended that BAR programming be done whilst decode
@@ -304,7 +346,9 @@ void pci_setup(void)
         {
             /* This is the barber's pole mapping used by Xen. */
             link = ((pin - 1) + (devfn >> 3)) & 3;
-            isa_irq = pci_readb(PCI_ISA_DEVFN, 0x60 + link);
+            isa_irq = pci_readb(is_running_on_q35 ?
+                                PCI_ICH9_LPC_DEVFN : PCI_ISA_DEVFN,
+                                0x60 + link);
             pci_writeb(devfn, PCI_INTERRUPT_LINE, isa_irq);
             printf("pci dev %02x:%x INT%c->IRQ%u\n",
                    devfn>>3, devfn&7, 'A'+pin-1, isa_irq);
-- 
2.34.1


