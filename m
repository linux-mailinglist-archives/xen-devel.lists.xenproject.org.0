Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF58734B06
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 06:14:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550786.859979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qB6GR-0004i5-VI; Mon, 19 Jun 2023 04:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550786.859979; Mon, 19 Jun 2023 04:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qB6GR-0004ec-NQ; Mon, 19 Jun 2023 04:13:15 +0000
Received: by outflank-mailman (input) for mailman id 550786;
 Sun, 18 Jun 2023 22:23:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pw1W=CG=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qB0nu-0003MH-Pv
 for xen-devel@lists.xenproject.org; Sun, 18 Jun 2023 22:23:27 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc789caf-0e26-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 00:23:23 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-bd5f20508f2so3052118276.3
 for <xen-devel@lists.xenproject.org>; Sun, 18 Jun 2023 15:23:23 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a259ac2000000b00bcc0f2e4f05sm3389532ybo.59.2023.06.18.15.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jun 2023 15:23:20 -0700 (PDT)
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
X-Inumbo-ID: bc789caf-0e26-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687127002; x=1689719002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMWC22riCBniLySmG0Xv/G68yYJQfYqUsZlijYvxMCg=;
        b=RuJ9BcI3Oj8XoM4IJumPnP7y2EVSeRz+fc2mIMV3aMOX66gd1RPsCJtiOKQmWvQj4u
         mRtgGueMUWCt6u+m9OKgm9Pl6CGFW/6v+dlak8qG3+V5fS23dj+KbH6ZHf6CLVL3AyFs
         4CWcOtzLGjXENgfQWqpVCBAGwhmr3fzbd2Kgsn9WpMSdT5feYqgrTe1bqJ1wXz5uThdZ
         lKTVfyzmmKiNZfnzqLpzQMtZ7Gdp5EuRX8Sb7r9UvpdbH/rzEBNWaFAiJdR1RGXn0b/j
         W/z8af231hfuW7TWYan/U7VJ6PnjSD8+XLeS2ajgAxRnohSmNxDB5h5PG+fumd3oXTrm
         tlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687127002; x=1689719002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMWC22riCBniLySmG0Xv/G68yYJQfYqUsZlijYvxMCg=;
        b=b60jcxEE9vJku/ycyrnmVzhXp2GOCvmR+sVntzSTXcMhkW16fiklIejn1CeKZ/rl5P
         aGb680UQxnSI2YqD44EOCJo8fDtMLt4gFGxAbaoxovzXlJTvn+BRJd/0gc5N6euJTODw
         sOCHUg7G/5NnOFyTXHJZXGyOBGe6GhbfsEhCMkJ1NFqr7maIZkVEg61YX84k0eUwk32w
         hDNpY/2vzDTmIW4bqEBOTVIVrbOM9smKgbRaQlVQlI2hXhQEM5ipG7AYpNehAOX1Ginb
         bYh4lrNmWVh34jfSqgVLHIFTPLanAE8CM/yQ2b+p3IwIOe3q5XLIOXj1U/1Nto63uCTn
         /1PQ==
X-Gm-Message-State: AC+VfDynYFSQBdjU9KfI3pS0auVxi+o8MWoifE2fyehPUAOYzrJkrjdu
	nRIY7LcSfk37wfMg8FfbwxvIpCMKj4NDgQ==
X-Google-Smtp-Source: ACHHUZ7ItsKxZ0F7UQ04WQGsv670adJwUs5/CtqIeV7MuFOtuTjS7Mz7puSZKvCOwcOtbqDEtw14SA==
X-Received: by 2002:a25:b195:0:b0:b8e:cb88:1b69 with SMTP id h21-20020a25b195000000b00b8ecb881b69mr5268195ybj.34.1687127000471;
        Sun, 18 Jun 2023 15:23:20 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Joel Upham <jupham125@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v1 1/1] Q35 support
Date: Sun, 18 Jun 2023 18:22:02 -0400
Message-Id: <7d691abc536a393e849d4cd90ea00c96e69eeece.1687121835.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687121835.git.jupham125@gmail.com>
References: <cover.1687121835.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 docs/man/xl.cfg.5.pod.in             |  27 ++
 tools/firmware/hvmloader/Makefile    |   2 +-
 tools/firmware/hvmloader/config.h    |   6 +
 tools/firmware/hvmloader/hvmloader.c |  13 +-
 tools/firmware/hvmloader/ovmf.c      |   7 +-
 tools/firmware/hvmloader/pci.c       | 285 +++++++++----
 tools/firmware/hvmloader/pci_regs.h  |   6 +
 tools/firmware/hvmloader/seabios.c   |   5 +
 tools/firmware/hvmloader/util.c      | 130 +++++-
 tools/firmware/hvmloader/util.h      |  10 +
 tools/libacpi/Makefile               |  10 +-
 tools/libacpi/acpi2_0.h              |  21 +
 tools/libacpi/build.c                |  43 ++
 tools/libacpi/dsdt_q35.asl           | 578 +++++++++++++++++++++++++++
 tools/libacpi/libacpi.h              |   4 +
 tools/libs/light/libxl_dm.c          |  60 ++-
 tools/libs/light/libxl_types.idl     |   8 +
 tools/xl/xl_parse.c                  |  14 +
 18 files changed, 1120 insertions(+), 109 deletions(-)
 create mode 100644 tools/libacpi/dsdt_q35.asl

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 24ac927182..be61227313 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2838,6 +2838,33 @@ you have existing guests then, depending on the nature of the guest
 Operating System, you may wish to force them to use the device
 model which they were installed with.
 
+=item B<device_model_machine="STRING">
+
+Selects which chipset the device model should emulate for this
+guest.
+
+Valid options are:
+
+=over 4
+
+=item B<"i440">
+
+Use i440 emulation (a default setting)
+
+=item B<"q35">
+
+Use Q35/ICH9 emulation. This enables additional features for
+PCIe device passthrough
+
+=back
+
+Note that omitting device_model_machine parameter means i440 system
+by default, so the default behavior doesn't change for old domain
+config files.
+
+It is recommended to install the guest OS from scratch to avoid issues
+due to the emulated platform change.
+
 =item B<device_model_override="PATH">
 
 Override the path to the binary to be used as the device-model running in
diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
index e5de1ade17..e3c8eb3ca1 100644
--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -70,7 +70,7 @@ rombios.o: roms.inc
 smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
 
 ACPI_PATH = ../../libacpi
-DSDT_FILES = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c
+DSDT_FILES = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c dsdt_q35_anycpu_qemu_xen.c
 ACPI_OBJS = $(patsubst %.c,%.o,$(DSDT_FILES)) build.o static_tables.o
 $(ACPI_OBJS): CFLAGS += -iquote . -DLIBACPI_STDUTILS=\"$(CURDIR)/util.h\"
 CFLAGS += -I$(ACPI_PATH)
diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index c82adf6dc5..53a3300d6e 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -54,6 +54,12 @@ extern uint8_t ioapic_version;
 
 #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
+#define PCI_ICH9_LPC_DEVFN  0xf8    /* dev 31, fn 0 */
+#define PCI_MCH_DEVFN       0       /* bus 0, dev 0, func 0 */
+
+/* possible values are: 64, 128, 256 */
+#define PCI_MAX_MCFG_BUSES  64
+
 
 #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
 
diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index c58841e5b5..ef0e66b214 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -259,8 +259,17 @@ static const struct bios_config *detect_bios(void)
 static void acpi_enable_sci(void)
 {
     uint8_t pm1a_cnt_val;
+    uint8_t acpi_enable_val;
+
+#define SMI_CMD_IOPORT       0xb2
+#define PIIX4_ACPI_ENABLE    0xf1
+#define ICH9_ACPI_ENABLE     0x02
+
+    if (get_pc_machine_type() == MACHINE_TYPE_Q35)
+        acpi_enable_val = ICH9_ACPI_ENABLE;
+    else
+        acpi_enable_val = PIIX4_ACPI_ENABLE;
 
-#define PIIX4_SMI_CMD_IOPORT 0xb2
 #define PIIX4_ACPI_ENABLE    0xf1
 
     /*
@@ -269,7 +278,7 @@ static void acpi_enable_sci(void)
      */
     pm1a_cnt_val = inb(ACPI_PM1A_CNT_BLK_ADDRESS_V1);
     if ( !(pm1a_cnt_val & ACPI_PM1C_SCI_EN) )
-        outb(PIIX4_SMI_CMD_IOPORT, PIIX4_ACPI_ENABLE);
+        outb(SMI_CMD_IOPORT, acpi_enable_val);
 
     pm1a_cnt_val = inb(ACPI_PM1A_CNT_BLK_ADDRESS_V1);
     BUG_ON(!(pm1a_cnt_val & ACPI_PM1C_SCI_EN));
diff --git a/tools/firmware/hvmloader/ovmf.c b/tools/firmware/hvmloader/ovmf.c
index 23610a0717..3886b71431 100644
--- a/tools/firmware/hvmloader/ovmf.c
+++ b/tools/firmware/hvmloader/ovmf.c
@@ -121,10 +121,15 @@ static void ovmf_acpi_build_tables(void)
     struct acpi_config config = {
         .dsdt_anycpu = dsdt_anycpu_qemu_xen,
         .dsdt_anycpu_len = dsdt_anycpu_qemu_xen_len,
-        .dsdt_15cpu = NULL, 
+        .dsdt_15cpu = NULL,
         .dsdt_15cpu_len = 0
     };
 
+    if (get_pc_machine_type() == MACHINE_TYPE_Q35) {
+        config.dsdt_anycpu = dsdt_q35_anycpu_qemu_xen;
+        config.dsdt_anycpu_len = dsdt_q35_anycpu_qemu_xen_len;
+    }
+
     hvmloader_acpi_build_tables(&config, ACPI_PHYSICAL_ADDRESS);
 }
 
diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
index 257a6feb61..1137387c43 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -34,6 +34,7 @@ const uint32_t pci_mem_end = RESERVED_MEMBASE;
 uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
 
 enum virtual_vga virtual_vga = VGA_none;
+uint32_t vga_devfn = 256;
 unsigned long igd_opregion_pgbase = 0;
 
 /* Check if the specified range conflicts with any reserved device memory. */
@@ -75,14 +76,94 @@ static int find_next_rmrr(uint32_t base)
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
-    uint8_t is_64bar, using_64bar, bar64_relocate = 0;
+    uint8_t is_64bar, using_64bar, bar64_relocate = 0, is_mem;
     uint32_t devfn, bar_reg, cmd, bar_data, bar_data_upper;
     uint64_t base, bar_sz, bar_sz_upper, mmio_total = 0;
-    uint32_t vga_devfn = 256;
-    uint16_t class, vendor_id, device_id;
+    uint64_t addr_mask;
+    uint16_t vendor_id, device_id;
     unsigned int bar, pin, link, isa_irq;
+    int is_running_on_q35 = 0;
     uint8_t pci_devfn_decode_type[256] = {};
 
     /* Resources assignable to PCI devices via BARs. */
@@ -92,10 +173,14 @@ void pci_setup(void)
 
     /* Create a list of device BARs in descending order of size. */
     struct bars {
-        uint32_t is_64bar;
         uint32_t devfn;
         uint32_t bar_reg;
         uint64_t bar_sz;
+        uint64_t addr_mask; /* which bits of the base address can be written */
+        uint32_t bar_data;  /* initial value - BAR flags here */
+        uint8_t  is_64bar;
+        uint8_t  is_mem;
+        uint8_t  padding[2];
     } *bars = (struct bars *)scratch_start;
     unsigned int i, nr_bars = 0;
     uint64_t mmio_hole_size = 0;
@@ -137,13 +222,28 @@ void pci_setup(void)
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
 
@@ -154,66 +254,13 @@ void pci_setup(void)
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
@@ -238,13 +285,20 @@ void pci_setup(void)
                 bar_reg = PCI_ROM_ADDRESS;
 
             bar_data = pci_readl(devfn, bar_reg);
+
+            is_mem = !!(((bar_data & PCI_BASE_ADDRESS_SPACE) ==
+                       PCI_BASE_ADDRESS_SPACE_MEMORY) ||
+                       (bar_reg == PCI_ROM_ADDRESS));
+
             if ( bar_reg != PCI_ROM_ADDRESS )
             {
-                is_64bar = !!((bar_data & (PCI_BASE_ADDRESS_SPACE |
-                             PCI_BASE_ADDRESS_MEM_TYPE_MASK)) ==
-                             (PCI_BASE_ADDRESS_SPACE_MEMORY |
+                is_64bar = !!(is_mem &&
+                             ((bar_data & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
                              PCI_BASE_ADDRESS_MEM_TYPE_64));
                 pci_writel(devfn, bar_reg, ~0);
+
+                addr_mask = is_mem ? PCI_BASE_ADDRESS_MEM_MASK
+                                   : PCI_BASE_ADDRESS_IO_MASK;
             }
             else
             {
@@ -252,15 +306,15 @@ void pci_setup(void)
                 pci_writel(devfn, bar_reg,
                            (bar_data | PCI_ROM_ADDRESS_MASK) &
                            ~PCI_ROM_ADDRESS_ENABLE);
+
+                addr_mask = PCI_ROM_ADDRESS_MASK;
             }
             bar_sz = pci_readl(devfn, bar_reg);
             pci_writel(devfn, bar_reg, bar_data);
 
             if ( bar_reg != PCI_ROM_ADDRESS )
-                bar_sz &= (((bar_data & PCI_BASE_ADDRESS_SPACE) ==
-                            PCI_BASE_ADDRESS_SPACE_MEMORY) ?
-                           PCI_BASE_ADDRESS_MEM_MASK :
-                           (PCI_BASE_ADDRESS_IO_MASK & 0xffff));
+                bar_sz &= is_mem ? PCI_BASE_ADDRESS_MEM_MASK :
+                                   (PCI_BASE_ADDRESS_IO_MASK & 0xffff);
             else
                 bar_sz &= PCI_ROM_ADDRESS_MASK;
             if (is_64bar) {
@@ -274,6 +328,9 @@ void pci_setup(void)
             if ( bar_sz == 0 )
                 continue;
 
+            /* leave only memtype/enable bits etc */
+            bar_data &= ~addr_mask;
+
             for ( i = 0; i < nr_bars; i++ )
                 if ( bars[i].bar_sz < bar_sz )
                     break;
@@ -281,14 +338,15 @@ void pci_setup(void)
             if ( i != nr_bars )
                 memmove(&bars[i+1], &bars[i], (nr_bars-i) * sizeof(*bars));
 
-            bars[i].is_64bar = is_64bar;
-            bars[i].devfn   = devfn;
-            bars[i].bar_reg = bar_reg;
-            bars[i].bar_sz  = bar_sz;
+            bars[i].is_64bar  = is_64bar;
+            bars[i].is_mem    = is_mem;
+            bars[i].devfn     = devfn;
+            bars[i].bar_reg   = bar_reg;
+            bars[i].bar_sz    = bar_sz;
+            bars[i].addr_mask = addr_mask;
+            bars[i].bar_data  = bar_data;
 
-            if ( ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
-                  PCI_BASE_ADDRESS_SPACE_MEMORY) ||
-                 (bar_reg == PCI_ROM_ADDRESS) )
+            if ( is_mem )
                 mmio_total += bar_sz;
 
             nr_bars++;
@@ -304,7 +362,9 @@ void pci_setup(void)
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
@@ -314,6 +374,63 @@ void pci_setup(void)
         pci_devfn_decode_type[devfn] = PCI_COMMAND_MASTER;
     }
 
+    /*
+     *  Calculate MMCONFIG area size and squeeze it into the bars array
+     *  for assigning a slot in the MMIO hole
+     */
+    if (is_running_on_q35)
+    {
+        /* disable PCIEXBAR decoding for now */
+        pci_writel(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR, 0);
+        pci_writel(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR + 4, 0);
+
+#define PCIEXBAR_64_BUSES    (2 << 1)
+#define PCIEXBAR_128_BUSES   (1 << 1)
+#define PCIEXBAR_256_BUSES   (0 << 1)
+#define PCIEXBAR_ENABLE      (1 << 0)
+
+        switch (PCI_MAX_MCFG_BUSES)
+        {
+        case 64:
+            bar_data = PCIEXBAR_64_BUSES | PCIEXBAR_ENABLE;
+            bar_sz = MB(64);
+            break;
+
+        case 128:
+            bar_data = PCIEXBAR_128_BUSES | PCIEXBAR_ENABLE;
+            bar_sz = MB(128);
+            break;
+
+        case 256:
+            bar_data = PCIEXBAR_256_BUSES | PCIEXBAR_ENABLE;
+            bar_sz = MB(256);
+            break;
+
+        default:
+            /* unsupported number of buses specified */
+            BUG();
+        }
+
+        addr_mask = ~(bar_sz - 1);
+
+        for ( i = 0; i < nr_bars; i++ )
+            if ( bars[i].bar_sz < bar_sz )
+                break;
+
+        if ( i != nr_bars )
+            memmove(&bars[i+1], &bars[i], (nr_bars-i) * sizeof(*bars));
+
+        bars[i].is_mem    = 1;
+        bars[i].devfn     = PCI_MCH_DEVFN;
+        bars[i].bar_reg   = PCI_MCH_PCIEXBAR;
+        bars[i].bar_sz    = bar_sz;
+        bars[i].addr_mask = addr_mask;
+        bars[i].bar_data  = bar_data;
+
+        mmio_total += bar_sz;
+        nr_bars++;
+    }
+
     if ( mmio_hole_size )
     {
         uint64_t max_ram_below_4g = GB(4) - mmio_hole_size;
@@ -448,10 +565,9 @@ void pci_setup(void)
          */
         using_64bar = bars[i].is_64bar && bar64_relocate
             && (mmio_total > (mem_resource.max - mem_resource.base));
-        bar_data = pci_readl(devfn, bar_reg);
+        bar_data = bars[i].bar_data;
 
-        if ( (bar_data & PCI_BASE_ADDRESS_SPACE) ==
-             PCI_BASE_ADDRESS_SPACE_MEMORY )
+        if ( bars[i].is_mem )
         {
             /* Mapping high memory if PCI device is 64 bits bar */
             if ( using_64bar ) {
@@ -461,18 +577,15 @@ void pci_setup(void)
                 if ( !pci_hi_mem_start )
                     pci_hi_mem_start = high_mem_resource.base;
                 resource = &high_mem_resource;
-                bar_data &= ~PCI_BASE_ADDRESS_MEM_MASK;
-            } 
+            }
             else {
                 resource = &mem_resource;
-                bar_data &= ~PCI_BASE_ADDRESS_MEM_MASK;
             }
             mmio_total -= bar_sz;
         }
         else
         {
             resource = &io_resource;
-            bar_data &= ~PCI_BASE_ADDRESS_IO_MASK;
         }
 
         base = (resource->base  + bar_sz - 1) & ~(uint64_t)(bar_sz - 1);
@@ -494,7 +607,7 @@ void pci_setup(void)
             }
         }
 
-        bar_data |= (uint32_t)base;
+        bar_data |= (uint32_t) (base & bars[i].addr_mask);
         bar_data_upper = (uint32_t)(base >> 32);
         base += bar_sz;
 
@@ -515,10 +628,8 @@ void pci_setup(void)
                devfn>>3, devfn&7, bar_reg,
                PRIllx_arg(bar_sz),
                bar_data_upper, bar_data);
-			
-        if ( (bar_reg == PCI_ROM_ADDRESS) ||
-             ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
-              PCI_BASE_ADDRESS_SPACE_MEMORY) )
+
+        if ( bars[i].is_mem )
             pci_devfn_decode_type[devfn] |= PCI_COMMAND_MEMORY;
         else
             pci_devfn_decode_type[devfn] |= PCI_COMMAND_IO;
diff --git a/tools/firmware/hvmloader/pci_regs.h b/tools/firmware/hvmloader/pci_regs.h
index 7bf2d873ab..b9261ee2af 100644
--- a/tools/firmware/hvmloader/pci_regs.h
+++ b/tools/firmware/hvmloader/pci_regs.h
@@ -107,6 +107,12 @@
 
 #define PCI_INTEL_OPREGION 0xfc /* 4 bits */
 
+#define PCI_VENDOR_ID_INTEL              0x8086
+#define PCI_DEVICE_ID_INTEL_82441        0x1237
+#define PCI_DEVICE_ID_INTEL_Q35_MCH      0x29c0
+
+#define PCI_MCH_PCIEXBAR                 0x60
+
 #endif /* __HVMLOADER_PCI_REGS_H__ */
 
 /*
diff --git a/tools/firmware/hvmloader/seabios.c b/tools/firmware/hvmloader/seabios.c
index 444d118ddb..72aabea130 100644
--- a/tools/firmware/hvmloader/seabios.c
+++ b/tools/firmware/hvmloader/seabios.c
@@ -96,6 +96,11 @@ static void seabios_acpi_build_tables(void)
         .dsdt_15cpu_len = 0,
     };
 
+    if (get_pc_machine_type() == MACHINE_TYPE_Q35) {
+        config.dsdt_anycpu = dsdt_q35_anycpu_qemu_xen;
+        config.dsdt_anycpu_len = dsdt_q35_anycpu_qemu_xen_len;
+    }
+
     hvmloader_acpi_build_tables(&config, rsdp);
     add_table(rsdp);
 }
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index e82047d993..7a75c07467 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -22,6 +22,7 @@
 #include "hypercall.h"
 #include "ctype.h"
 #include "vnuma.h"
+#include "pci_regs.h"
 #include <acpi2_0.h>
 #include <libacpi.h>
 #include <stdint.h>
@@ -735,6 +736,115 @@ void __bug(const char *file, int line)
     crash();
 }
 
+
+static int machine_type = MACHINE_TYPE_UNDEFINED;
+
+int get_pc_machine_type(void)
+{
+    uint16_t vendor_id;
+    uint16_t device_id;
+
+    if (machine_type != MACHINE_TYPE_UNDEFINED)
+        return machine_type;
+
+    machine_type = MACHINE_TYPE_UNKNOWN;
+
+    vendor_id = pci_readw(0, PCI_VENDOR_ID);
+    device_id = pci_readw(0, PCI_DEVICE_ID);
+
+    /* only Intel platforms are emulated currently */
+    if (vendor_id == PCI_VENDOR_ID_INTEL)
+    {
+        switch (device_id)
+        {
+        case PCI_DEVICE_ID_INTEL_82441:
+            machine_type = MACHINE_TYPE_I440;
+            printf("Detected i440 chipset\n");
+            break;
+
+        case PCI_DEVICE_ID_INTEL_Q35_MCH:
+            machine_type = MACHINE_TYPE_Q35;
+            printf("Detected Q35 chipset\n");
+            break;
+
+        default:
+            break;
+        }
+    }
+
+    if (machine_type == MACHINE_TYPE_UNKNOWN)
+    {
+        printf("Unknown emulated chipset encountered, VID=%04Xh, DID=%04Xh\n",
+               vendor_id, device_id);
+        BUG();
+    }
+
+    return machine_type;
+}
+
+#define PCIEXBAR_ADDR_MASK_64MB     (~((1ULL << 26) - 1))
+#define PCIEXBAR_ADDR_MASK_128MB    (~((1ULL << 27) - 1))
+#define PCIEXBAR_ADDR_MASK_256MB    (~((1ULL << 28) - 1))
+#define PCIEXBAR_LENGTH_BITS(reg)   (((reg) >> 1) & 3)
+#define PCIEXBAREN                  1
+
+static uint64_t mmconfig_get_base(void)
+{
+    uint64_t base;
+    uint32_t reg = pci_readl(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR);
+
+    base = reg | (uint64_t) pci_readl(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR+4) << 32;
+
+    switch (PCIEXBAR_LENGTH_BITS(reg))
+    {
+    case 0:
+        base &= PCIEXBAR_ADDR_MASK_256MB;
+        break;
+    case 1:
+        base &= PCIEXBAR_ADDR_MASK_128MB;
+        break;
+    case 2:
+        base &= PCIEXBAR_ADDR_MASK_64MB;
+        break;
+    case 3:
+        BUG();  /* a reserved value encountered */
+    }
+
+    return base;
+}
+
+static uint32_t mmconfig_get_size(void)
+{
+    uint32_t reg = pci_readl(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR);
+
+    switch (PCIEXBAR_LENGTH_BITS(reg))
+    {
+    case 0: return MB(256);
+    case 1: return MB(128);
+    case 2: return MB(64);
+    case 3:
+        BUG();  /* a reserved value encountered */
+    }
+
+    return 0;
+}
+
+static uint32_t mmconfig_is_enabled(void)
+{
+    return pci_readl(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR) & PCIEXBAREN;
+}
+
+static int is_mmconfig_used(void)
+{
+    if (get_pc_machine_type() == MACHINE_TYPE_Q35)
+    {
+        if (mmconfig_is_enabled() && mmconfig_get_base())
+            return 1;
+    }
+
+    return 0;
+}
+
 static void validate_hvm_info(struct hvm_info_table *t)
 {
     uint8_t *ptr = (uint8_t *)t;
@@ -937,8 +1047,17 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
     }
     else if ( !strncmp(s, "qemu_xen", 9) )
     {
-        config->dsdt_anycpu = dsdt_anycpu_qemu_xen;
-        config->dsdt_anycpu_len = dsdt_anycpu_qemu_xen_len;
+        if (get_pc_machine_type() == MACHINE_TYPE_Q35)
+        {
+            config->dsdt_anycpu = dsdt_q35_anycpu_qemu_xen;
+            config->dsdt_anycpu_len = dsdt_q35_anycpu_qemu_xen_len;
+        }
+        else
+        {
+            config->dsdt_anycpu = dsdt_anycpu_qemu_xen;
+            config->dsdt_anycpu_len = dsdt_anycpu_qemu_xen_len;
+        }
+
         config->dsdt_15cpu = NULL;
         config->dsdt_15cpu_len = 0;
     }
@@ -966,6 +1085,13 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
         config->pci_hi_len = pci_hi_mem_end - pci_hi_mem_start;
     }
 
+    if ( is_mmconfig_used() )
+    {
+        config->table_flags |= ACPI_HAS_MCFG;
+        config->mmconfig_addr = mmconfig_get_base();
+        config->mmconfig_len  = mmconfig_get_size();
+    }
+
     s = xenstore_read("platform/generation-id", "0:0");
     if ( s )
     {
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index 87be213dec..c6747c336d 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -90,6 +90,14 @@ void pci_write(uint32_t devfn, uint32_t reg, uint32_t len, uint32_t val);
 #define pci_writew(devfn, reg, val) pci_write(devfn, reg, 2, (uint16_t)(val))
 #define pci_writel(devfn, reg, val) pci_write(devfn, reg, 4, (uint32_t)(val))
 
+/* Emulated machine types */
+#define MACHINE_TYPE_UNDEFINED      0
+#define MACHINE_TYPE_I440           1
+#define MACHINE_TYPE_Q35            2
+#define MACHINE_TYPE_UNKNOWN        (-1)
+
+int get_pc_machine_type(void);
+
 /* Get a pointer to the shared-info page */
 struct shared_info *get_shared_info(void) __attribute__ ((const));
 
@@ -270,7 +278,9 @@ bool check_overlap(uint64_t start, uint64_t size,
                    uint64_t reserved_start, uint64_t reserved_size);
 
 extern const unsigned char dsdt_anycpu_qemu_xen[], dsdt_anycpu[], dsdt_15cpu[];
+extern const unsigned char dsdt_q35_anycpu_qemu_xen[];
 extern const int dsdt_anycpu_qemu_xen_len, dsdt_anycpu_len, dsdt_15cpu_len;
+extern const int dsdt_q35_anycpu_qemu_xen_len;
 
 unsigned long acpi_pages_allocated(void);
 
diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
index b21a64c6b4..d1ad2c6d85 100644
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -11,7 +11,7 @@ endif
 
 MK_DSDT = $(ACPI_BUILD_DIR)/mk_dsdt
 
-C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c dsdt_pvh.c
+C_SRC-$(CONFIG_X86) = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c dsdt_q35_anycpu_qemu_xen.c dsdt_pvh.c
 C_SRC-$(CONFIG_ARM_64) = dsdt_anycpu_arm.c
 DSDT_FILES ?= $(C_SRC-y)
 C_SRC = $(addprefix $(ACPI_BUILD_DIR)/, $(DSDT_FILES))
@@ -54,6 +54,14 @@ $(ACPI_BUILD_DIR)/dsdt_%cpu.asl: dsdt.asl dsdt_acpi_info.asl  $(MK_DSDT)
 	$(MK_DSDT) --debug=$(debug) --maxcpu $*  >> $@.$(TMP_SUFFIX)
 	mv -f $@.$(TMP_SUFFIX) $@
 
+$(ACPI_BUILD_DIR)/dsdt_q35_anycpu_qemu_xen.asl: dsdt_q35.asl dsdt_acpi_info.asl $(MK_DSDT)
+	# Remove last bracket
+	awk 'NR > 1 {print s} {s=$$0}' $< > $@.$(TMP_SUFFIX)
+	cat dsdt_acpi_info.asl >> $@.$(TMP_SUFFIX)
+	$(MK_DSDT) --debug=$(debug) --dm-version qemu-xen >> $@.$(TMP_SUFFIX)
+	mv -f $@.$(TMP_SUFFIX) $@
+
+
 $(ACPI_BUILD_DIR)/dsdt_pvh.asl: dsdt_acpi_info.asl $(MK_DSDT)
 	printf "DefinitionBlock (\"DSDT.aml\", \"DSDT\", 5, \"Xen\", \"HVM\", 0)\n{" > $@
 	cat dsdt_acpi_info.asl >> $@
diff --git a/tools/libacpi/acpi2_0.h b/tools/libacpi/acpi2_0.h
index 6dfa939a8c..02b0cf1098 100644
--- a/tools/libacpi/acpi2_0.h
+++ b/tools/libacpi/acpi2_0.h
@@ -442,6 +442,24 @@ struct acpi_20_slit {
     uint64_t localities;
     uint8_t entry[0];
 };
+/*
+ * PCI Express Memory Mapped Configuration Description Table
+ */
+struct mcfg_range_entry {
+    uint64_t base_address;
+    uint16_t pci_segment;
+    uint8_t  start_pci_bus_num;
+    uint8_t  end_pci_bus_num;
+    uint32_t reserved;
+};
+
+struct acpi_mcfg {
+    struct acpi_header header;
+    uint8_t reserved[8];
+    struct mcfg_range_entry entries[1];
+};
+
+#define MCFG_SIZE_TO_NUM_BUSES(size)  ((size) >> 20)
 
 /*
  * Table Signatures.
@@ -458,6 +476,8 @@ struct acpi_20_slit {
 #define ACPI_2_0_WAET_SIGNATURE ASCII32('W','A','E','T')
 #define ACPI_2_0_SRAT_SIGNATURE ASCII32('S','R','A','T')
 #define ACPI_2_0_SLIT_SIGNATURE ASCII32('S','L','I','T')
+#define ACPI_MCFG_SIGNATURE     ASCII32('M','C','F','G')
+
 
 /*
  * Table revision numbers.
@@ -473,6 +493,7 @@ struct acpi_20_slit {
 #define ACPI_1_0_FADT_REVISION 0x01
 #define ACPI_2_0_SRAT_REVISION 0x01
 #define ACPI_2_0_SLIT_REVISION 0x01
+#define ACPI_1_0_MCFG_REVISION 0x01
 
 #pragma pack ()
 
diff --git a/tools/libacpi/build.c b/tools/libacpi/build.c
index 2f29863db1..fc029d18bf 100644
--- a/tools/libacpi/build.c
+++ b/tools/libacpi/build.c
@@ -295,6 +295,37 @@ static struct acpi_20_slit *construct_slit(struct acpi_ctxt *ctxt,
     return slit;
 }
 
+static struct acpi_mcfg *construct_mcfg(struct acpi_ctxt *ctxt,
+                                        const struct acpi_config *config)
+{
+    struct acpi_mcfg *mcfg;
+
+    /* Warning: this code expects that we have only one PCI segment */
+    mcfg = ctxt->mem_ops.alloc(ctxt, sizeof(*mcfg), 16);
+    if (!mcfg)
+        return NULL;
+
+    memset(mcfg, 0, sizeof(*mcfg));
+    mcfg->header.signature    = ACPI_MCFG_SIGNATURE;
+    mcfg->header.revision     = ACPI_1_0_MCFG_REVISION;
+    fixed_strcpy(mcfg->header.oem_id, ACPI_OEM_ID);
+    fixed_strcpy(mcfg->header.oem_table_id, ACPI_OEM_TABLE_ID);
+    mcfg->header.oem_revision = ACPI_OEM_REVISION;
+    mcfg->header.creator_id   = ACPI_CREATOR_ID;
+    mcfg->header.creator_revision = ACPI_CREATOR_REVISION;
+    mcfg->header.length = sizeof(*mcfg);
+
+    mcfg->entries[0].base_address = config->mmconfig_addr;
+    mcfg->entries[0].pci_segment = 0;
+    mcfg->entries[0].start_pci_bus_num = 0;
+    mcfg->entries[0].end_pci_bus_num =
+        MCFG_SIZE_TO_NUM_BUSES(config->mmconfig_len) - 1;
+
+    set_checksum(mcfg, offsetof(struct acpi_header, checksum), sizeof(*mcfg));
+
+    return mcfg;;
+}
+
 static int construct_passthrough_tables(struct acpi_ctxt *ctxt,
                                         unsigned long *table_ptrs,
                                         int nr_tables,
@@ -342,6 +373,7 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
     struct acpi_20_hpet *hpet;
     struct acpi_20_waet *waet;
     struct acpi_20_tcpa *tcpa;
+    struct acpi_mcfg *mcfg;
     struct acpi_20_tpm2 *tpm2;
     unsigned char *ssdt;
     void *lasa;
@@ -402,6 +434,17 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
         memcpy(ssdt, ssdt_laptop_slate, sizeof(ssdt_laptop_slate));
         table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, ssdt);
     }
+
+    /* MCFG */
+    if ( config->table_flags & ACPI_HAS_MCFG )
+    {
+        mcfg = construct_mcfg(ctxt, config);
+        if (!mcfg)
+            return -1;
+
+        table_ptrs[nr_tables++] = ctxt->mem_ops.v2p(ctxt, mcfg);
+    }
+
     /* TPM and its SSDT. */
     if ( config->table_flags & ACPI_HAS_TPM )
     {
diff --git a/tools/libacpi/dsdt_q35.asl b/tools/libacpi/dsdt_q35.asl
new file mode 100644
index 0000000000..1ec32a8010
--- /dev/null
+++ b/tools/libacpi/dsdt_q35.asl
@@ -0,0 +1,578 @@
+/******************************************************************************
+ * DSDT for Xen with Qemu device model (for Q35 machine)
+ *
+ * Copyright (c) 2004, Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU Lesser General Public License as published
+ * by the Free Software Foundation; version 2.1 only. with the special
+ * exception on linking described in file LICENSE.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU Lesser General Public License for more details.
+ */
+
+DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
+{
+    Name (\PMBS, 0x0C00)
+    Name (\PMLN, 0x08)
+    Name (\IOB1, 0x00)
+    Name (\IOL1, 0x00)
+    Name (\APCB, 0xFEC00000)
+    Name (\APCL, 0x00010000)
+    Name (\PUID, 0x00)
+
+
+    Scope (\_SB)
+    {
+
+        /* Fix HCT test for 0x400 pci memory:
+         * - need to report low 640 MB mem as motherboard resource
+         */
+       Device(MEM0)
+       {
+           Name(_HID, EISAID("PNP0C02"))
+           Name(_CRS, ResourceTemplate() {
+               QWordMemory(
+                    ResourceConsumer, PosDecode, MinFixed,
+                    MaxFixed, Cacheable, ReadWrite,
+                    0x00000000,
+                    0x00000000,
+                    0x0009ffff,
+                    0x00000000,
+                    0x000a0000)
+           })
+       }
+
+       Device (PCI0)
+       {
+           Name (_HID, EisaId ("PNP0A08"))
+           Name(_CID, EisaId("PNP0A03"))
+           Name (_UID, 0x00)
+           Name (_ADR, 0x00)
+           Name (_BBN, 0x00)
+
+           /* _OSC, modified from ASL sample in ACPI spec */
+           Name(SUPP, 0) /* PCI _OSC Support Field value */
+           Name(CTRL, 0) /* PCI _OSC Control Field value */
+           Method(_OSC, 4) {
+               /* Create DWORD-addressable fields from the Capabilities Buffer */
+               CreateDWordField(Arg3, 0, CDW1)
+
+               /* Switch by UUID.
+                * Only PCI Host Bridge Device capabilities UUID used for now
+                */
+               If (LEqual(Arg0, ToUUID("33DB4D5B-1FF7-401C-9657-7441C03DD766"))) {
+                   /* Create DWORD-addressable fields from the Capabilities Buffer */
+                   CreateDWordField(Arg3, 4, CDW2)
+                   CreateDWordField(Arg3, 8, CDW3)
+
+                   /* Save Capabilities DWORD2 & 3 */
+                   Store(CDW2, SUPP)
+                   Store(CDW3, CTRL)
+
+                   /* Validate Revision DWORD */
+                   If (LNotEqual(Arg1, One)) {
+                       /* Unknown revision */
+                       /* Support and Control DWORDs will be returned anyway */
+                       Or(CDW1, 0x08, CDW1)
+                   }
+
+                   /* Control field bits are:
+                    * bit 0    PCI Express Native Hot Plug control
+                    * bit 1    SHPC Native Hot Plug control
+                    * bit 2    PCI Express Native Power Management Events control
+                    * bit 3    PCI Express Advanced Error Reporting control
+                    * bit 4    PCI Express Capability Structure control
+                    */
+
+                   /* Always allow native PME, AER (no dependencies)
+                    * Never allow SHPC (no SHPC controller in this system)
+                    * Do not allow PCIe Capability Structure control for now
+                    * Also, ACPI hotplug is used for now instead of PCIe
+                    * Native Hot Plug
+                    */
+                   And(CTRL, 0x0C, CTRL)
+
+                   If (LNotEqual(CDW3, CTRL)) {
+                       /* Some of Capabilities bits were masked */
+                       Or(CDW1, 0x10, CDW1)
+                   }
+                   /* Update DWORD3 in the buffer */
+                   Store(CTRL, CDW3)
+               } Else {
+                   Or(CDW1, 4, CDW1) /* Unrecognized UUID */
+               }
+               Return (Arg3)
+           }
+           /* end of _OSC */
+
+
+           /* Make cirrues VGA S3 suspend/resume work in Windows XP/2003 */
+           Device (VGA)
+           {
+               Name (_ADR, 0x00020000)
+
+               Method (_S1D, 0, NotSerialized)
+               {
+                   Return (0x00)
+               }
+               Method (_S2D, 0, NotSerialized)
+               {
+                   Return (0x00)
+               }
+               Method (_S3D, 0, NotSerialized)
+               {
+                   Return (0x00)
+               }
+           }
+
+           Method (_CRS, 0, NotSerialized)
+           {
+               Store (ResourceTemplate ()
+               {
+                   /* bus number is from 0 - 255*/
+                   WordBusNumber(
+                        ResourceProducer, MinFixed, MaxFixed, SubDecode,
+                        0x0000,
+                        0x0000,
+                        0x00FF,
+                        0x0000,
+                        0x0100)
+                    IO (Decode16, 0x0CF8, 0x0CF8, 0x01, 0x08)
+                    WordIO(
+                        ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                        EntireRange,
+                        0x0000,
+                        0x0000,
+                        0x0CF7,
+                        0x0000,
+                        0x0CF8)
+                    WordIO(
+                        ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                        EntireRange,
+                        0x0000,
+                        0x0D00,
+                        0xFFFF,
+                        0x0000,
+                        0xF300)
+
+                    /* reserve memory for pci devices */
+                    DWordMemory(
+                        ResourceProducer, PosDecode, MinFixed, MaxFixed,
+                        WriteCombining, ReadWrite,
+                        0x00000000,
+                        0x000A0000,
+                        0x000BFFFF,
+                        0x00000000,
+                        0x00020000)
+
+                    DWordMemory(
+                        ResourceProducer, PosDecode, MinFixed, MaxFixed,
+                        NonCacheable, ReadWrite,
+                        0x00000000,
+                        0xF0000000,
+                        0xF4FFFFFF,
+                        0x00000000,
+                        0x05000000,
+                        ,, _Y01)
+
+                    QWordMemory (
+                        ResourceProducer, PosDecode, MinFixed, MaxFixed,
+                        NonCacheable, ReadWrite,
+                        0x0000000000000000,
+                        0x0000000FFFFFFFF0,
+                        0x0000000FFFFFFFFF,
+                        0x0000000000000000,
+                        0x0000000000000010,
+                        ,, _Y02)
+
+                }, Local1)
+
+                CreateDWordField(Local1, \_SB.PCI0._CRS._Y01._MIN, MMIN)
+                CreateDWordField(Local1, \_SB.PCI0._CRS._Y01._MAX, MMAX)
+                CreateDWordField(Local1, \_SB.PCI0._CRS._Y01._LEN, MLEN)
+
+                Store(\_SB.PMIN, MMIN)
+                Store(\_SB.PLEN, MLEN)
+                Add(MMIN, MLEN, MMAX)
+                Subtract(MMAX, One, MMAX)
+
+                /*
+                 * WinXP / Win2K3 blue-screen for operations on 64-bit values.
+                 * Therefore we need to split the 64-bit calculations needed
+                 * here, but different iasl versions evaluate name references
+                 * to integers differently:
+                 * Year (approximate)          2006    2008    2012
+                 * \_SB.PCI0._CRS._Y02         zero   valid   valid
+                 * \_SB.PCI0._CRS._Y02._MIN   valid   valid    huge
+                 */
+                If(LEqual(Zero, \_SB.PCI0._CRS._Y02)) {
+                    Subtract(\_SB.PCI0._CRS._Y02._MIN, 14, Local0)
+                } Else {
+                    Store(\_SB.PCI0._CRS._Y02, Local0)
+                }
+                CreateDWordField(Local1, Add(Local0, 14), MINL)
+                CreateDWordField(Local1, Add(Local0, 18), MINH)
+                CreateDWordField(Local1, Add(Local0, 22), MAXL)
+                CreateDWordField(Local1, Add(Local0, 26), MAXH)
+                CreateDWordField(Local1, Add(Local0, 38), LENL)
+                CreateDWordField(Local1, Add(Local0, 42), LENH)
+
+                Store(\_SB.LMIN, MINL)
+                Store(\_SB.HMIN, MINH)
+                Store(\_SB.LLEN, LENL)
+                Store(\_SB.HLEN, LENH)
+                Add(MINL, LENL, MAXL)
+                Add(MINH, LENH, MAXH)
+                If(LLess(MAXL, MINL)) {
+                    Add(MAXH, One, MAXH)
+                }
+                If(LOr(MINH, LENL)) {
+                    If(LEqual(MAXL, 0)) {
+                        Subtract(MAXH, One, MAXH)
+                    }
+                    Subtract(MAXL, One, MAXL)
+                }
+
+                Return (Local1)
+            }
+
+            Device(HPET) {
+                Name(_HID,  EISAID("PNP0103"))
+                Name(_UID, 0)
+                Method (_STA, 0, NotSerialized) {
+                    If(LEqual(\_SB.HPET, 0)) {
+                        Return(0x00)
+                    } Else {
+                        Return(0x0F)
+                    }
+                }
+                Name(_CRS, ResourceTemplate() {
+                    DWordMemory(
+                        ResourceConsumer, PosDecode, MinFixed, MaxFixed,
+                        NonCacheable, ReadWrite,
+                        0x00000000,
+                        0xFED00000,
+                        0xFED003FF,
+                        0x00000000,
+                        0x00000400 /* 1K memory: FED00000 - FED003FF */
+                    )
+                })
+            }
+
+
+            /****************************************************************
+             * LPC ISA bridge
+             ****************************************************************/
+
+            Device (ISA)
+            {
+                Name (_ADR, 0x001f0000) /* device 31, fn 0 */
+
+                /* PCI Interrupt Routing Register 1 - PIRQA..PIRQD */
+                OperationRegion(PIRQ, PCI_Config, 0x60, 0x4)
+                Scope(\) {
+                    Field (\_SB.PCI0.ISA.PIRQ, ByteAcc, NoLock, Preserve) {
+                        PIRA, 8,
+                        PIRB, 8,
+                        PIRC, 8,
+                        PIRD, 8
+                    }
+                }
+                /*
+                   PCI Interrupt Routing Register 2 (PIRQE..PIRQH) cannot be
+                   used because of existing Xen IRQ limitations (4 PCI links
+                   only)
+                */
+
+                /* LPC_I/O: I/O Decode Ranges Register */
+                OperationRegion(LPCD, PCI_Config, 0x80, 0x2)
+                Field(LPCD, AnyAcc, NoLock, Preserve) {
+                    COMA,   3,
+                        ,   1,
+                    COMB,   3,
+
+                    Offset(0x01),
+                    LPTD,   2,
+                        ,   2,
+                    FDCD,   2
+                }
+
+                /* LPC_EN: LPC I/F Enables Register */
+                OperationRegion(LPCE, PCI_Config, 0x82, 0x2)
+                Field(LPCE, AnyAcc, NoLock, Preserve) {
+                    CAEN,   1,
+                    CBEN,   1,
+                    LPEN,   1,
+                    FDEN,   1
+                }
+
+                Device (SYSR)
+                {
+                    Name (_HID, EisaId ("PNP0C02"))
+                    Name (_UID, 0x01)
+                    Name (CRS, ResourceTemplate ()
+                    {
+                        /* TODO: list hidden resources */
+                        IO (Decode16, 0x0010, 0x0010, 0x00, 0x10)
+                        IO (Decode16, 0x0022, 0x0022, 0x00, 0x0C)
+                        IO (Decode16, 0x0030, 0x0030, 0x00, 0x10)
+                        IO (Decode16, 0x0044, 0x0044, 0x00, 0x1C)
+                        IO (Decode16, 0x0062, 0x0062, 0x00, 0x02)
+                        IO (Decode16, 0x0065, 0x0065, 0x00, 0x0B)
+                        IO (Decode16, 0x0072, 0x0072, 0x00, 0x0E)
+                        IO (Decode16, 0x0080, 0x0080, 0x00, 0x01)
+                        IO (Decode16, 0x0084, 0x0084, 0x00, 0x03)
+                        IO (Decode16, 0x0088, 0x0088, 0x00, 0x01)
+                        IO (Decode16, 0x008C, 0x008C, 0x00, 0x03)
+                        IO (Decode16, 0x0090, 0x0090, 0x00, 0x10)
+                        IO (Decode16, 0x00A2, 0x00A2, 0x00, 0x1C)
+                        IO (Decode16, 0x00E0, 0x00E0, 0x00, 0x10)
+                        IO (Decode16, 0x08A0, 0x08A0, 0x00, 0x04)
+                        IO (Decode16, 0x0CC0, 0x0CC0, 0x00, 0x10)
+                        IO (Decode16, 0x04D0, 0x04D0, 0x00, 0x02)
+                    })
+                    Method (_CRS, 0, NotSerialized)
+                    {
+                        Return (CRS)
+                    }
+                }
+
+                Device (PIC)
+                {
+                    Name (_HID, EisaId ("PNP0000"))
+                    Name (_CRS, ResourceTemplate ()
+                    {
+                        IO (Decode16, 0x0020, 0x0020, 0x01, 0x02)
+                        IO (Decode16, 0x00A0, 0x00A0, 0x01, 0x02)
+                        IRQNoFlags () {2}
+                    })
+                }
+
+                Device (DMA0)
+                {
+                    Name (_HID, EisaId ("PNP0200"))
+                    Name (_CRS, ResourceTemplate ()
+                    {
+                        DMA (Compatibility, BusMaster, Transfer8) {4}
+                        IO (Decode16, 0x0000, 0x0000, 0x00, 0x10)
+                        IO (Decode16, 0x0081, 0x0081, 0x00, 0x03)
+                        IO (Decode16, 0x0087, 0x0087, 0x00, 0x01)
+                        IO (Decode16, 0x0089, 0x0089, 0x00, 0x03)
+                        IO (Decode16, 0x008F, 0x008F, 0x00, 0x01)
+                        IO (Decode16, 0x00C0, 0x00C0, 0x00, 0x20)
+                        IO (Decode16, 0x0480, 0x0480, 0x00, 0x10)
+                    })
+                }
+
+                Device (TMR)
+                {
+                    Name (_HID, EisaId ("PNP0100"))
+                    Name (_CRS, ResourceTemplate ()
+                    {
+                        IO (Decode16, 0x0040, 0x0040, 0x00, 0x04)
+                        IRQNoFlags () {0}
+                    })
+                }
+
+                Device (RTC)
+                {
+                    Name (_HID, EisaId ("PNP0B00"))
+                    Name (_CRS, ResourceTemplate ()
+                    {
+                        IO (Decode16, 0x0070, 0x0070, 0x00, 0x02)
+                        IRQNoFlags () {8}
+                    })
+                }
+
+                Device (SPKR)
+                {
+                    Name (_HID, EisaId ("PNP0800"))
+                    Name (_CRS, ResourceTemplate ()
+                    {
+                        IO (Decode16, 0x0061, 0x0061, 0x00, 0x01)
+                    })
+                }
+
+                Device (PS2M)
+                {
+                    Name (_HID, EisaId ("PNP0F13"))
+                    Name (_CID, 0x130FD041)
+                    Method (_STA, 0, NotSerialized)
+                    {
+                        Return (0x0F)
+                    }
+
+                    Name (_CRS, ResourceTemplate ()
+                    {
+                        IRQNoFlags () {12}
+                    })
+                }
+
+                Device (PS2K)
+                {
+                    Name (_HID, EisaId ("PNP0303"))
+                    Name (_CID, 0x0B03D041)
+                    Method (_STA, 0, NotSerialized)
+                    {
+                        Return (0x0F)
+                    }
+
+                    Name (_CRS, ResourceTemplate ()
+                    {
+                        IO (Decode16, 0x0060, 0x0060, 0x00, 0x01)
+                        IO (Decode16, 0x0064, 0x0064, 0x00, 0x01)
+                        IRQNoFlags () {1}
+                    })
+                }
+
+                Device(FDC0)
+                {
+                    Name(_HID, EisaId("PNP0700"))
+                    Method(_STA, 0, NotSerialized)
+                    {
+                        Store(FDEN, Local0)
+                        If (LEqual(Local0, 0)) {
+                            Return (0x00)
+                        } Else {
+                            Return (0x0F)
+                        }
+                   }
+
+                   Name(_CRS, ResourceTemplate()
+                   {
+                       IO(Decode16, 0x03F2, 0x03F2, 0x00, 0x04)
+                       IO(Decode16, 0x03F7, 0x03F7, 0x00, 0x01)
+                       IRQNoFlags() { 6 }
+                       DMA(Compatibility, NotBusMaster, Transfer8) { 2 }
+                   })
+                }
+
+                Device (UAR1)
+                {
+                    Name (_HID, EisaId ("PNP0501"))
+                    Name (_UID, 0x01)
+                    Method (_STA, 0, NotSerialized)
+                    {
+                        If(LEqual(\_SB.UAR1, 0)) {
+                            Return(0x00)
+                        } Else {
+                            Return(0x0F)
+                        }
+                    }
+
+                    Name (_CRS, ResourceTemplate()
+                    {
+                        IO (Decode16, 0x03F8, 0x03F8, 8, 8)
+                        IRQNoFlags () {4}
+                    })
+                }
+
+                Device (UAR2)
+                {
+                    Name (_HID, EisaId ("PNP0501"))
+                    Name (_UID, 0x02)
+                    Method (_STA, 0, NotSerialized)
+                    {
+                        If(LEqual(\_SB.UAR2, 0)) {
+                            Return(0x00)
+                        } Else {
+                            Return(0x0F)
+                        }
+                    }
+
+                    Name (_CRS, ResourceTemplate()
+                    {
+                        IO (Decode16, 0x02F8, 0x02F8, 8, 8)
+                        IRQNoFlags () {3}
+                    })
+                }
+
+                Device (LTP1)
+                {
+                    Name (_HID, EisaId ("PNP0400"))
+                    Name (_UID, 0x02)
+                    Method (_STA, 0, NotSerialized)
+                    {
+                        If(LEqual(\_SB.LTP1, 0)) {
+                            Return(0x00)
+                        } Else {
+                            Return(0x0F)
+                        }
+                    }
+
+                    Name (_CRS, ResourceTemplate()
+                    {
+                        IO (Decode16, 0x0378, 0x0378, 0x08, 0x08)
+                        IRQNoFlags () {7}
+                    })
+                }
+
+                Device(VGID) {
+                    Name(_HID, EisaId ("XEN0000"))
+                    Name(_UID, 0x00)
+                    Name(_CID, "VM_Gen_Counter")
+                    Name(_DDN, "VM_Gen_Counter")
+                    Method(_STA, 0, NotSerialized)
+                    {
+                        If(LEqual(\_SB.VGIA, 0x00000000)) {
+                            Return(0x00)
+                        } Else {
+                            Return(0x0F)
+                        }
+                    }
+                    Name(PKG, Package ()
+                    {
+                        0x00000000,
+                        0x00000000
+                    })
+                    Method(ADDR, 0, NotSerialized)
+                    {
+                        Store(\_SB.VGIA, Index(PKG, 0))
+                        Return(PKG)
+                    }
+                }
+
+                /* EHCI Controller 0:1d.0 */
+
+                Device (EHC1)
+                {
+	            Name(_ADR, 0x001d0000)
+
+	            /* Power Resources for Wake */
+	            Name(_PRW, Package() { 13, 4 })
+
+	            /* Highest D state in S3 state */
+	            Name(_S3D, 2)
+
+	            /* Highest D state in S4 state */
+	            Name(_S4D, 2)
+
+	            Device (HUB7)
+	            {
+		        Name(_ADR, 0x00000000)
+
+		        Device(PRT1) { Name(_ADR, 1) }	/* USB Port 0 */
+		        Device(PRT2) { Name(_ADR, 2) }	/* USB Port 1 */
+		        Device(PRT3) { Name(_ADR, 3) }	/* USB Port 2 */
+		        Device(PRT4) { Name(_ADR, 4) }	/* USB Port 3 */
+	            }
+                }
+            }
+        }
+    }
+    /* _S3 and _S4 are in separate SSDTs */
+    Name (\_S5, Package (0x04) {
+        0x00,  /* PM1a_CNT.SLP_TYP */
+        0x00,  /* PM1b_CNT.SLP_TYP */
+        0x00,  /* reserved */
+        0x00   /* reserved */
+    })
+    Name(PICD, 0)
+    Method(_PIC, 1) {
+        Store(Arg0, PICD)
+    }
+}
diff --git a/tools/libacpi/libacpi.h b/tools/libacpi/libacpi.h
index deda39e5db..b4d3116ca5 100644
--- a/tools/libacpi/libacpi.h
+++ b/tools/libacpi/libacpi.h
@@ -27,6 +27,7 @@
 #define ACPI_HAS_8042              (1<<13)
 #define ACPI_HAS_CMOS_RTC          (1<<14)
 #define ACPI_HAS_SSDT_LAPTOP_SLATE (1<<15)
+#define ACPI_HAS_MCFG              (1<<16)
 
 struct xen_vmemrange;
 struct acpi_numa {
@@ -89,6 +90,9 @@ struct acpi_config {
     uint32_t ioapic_base_address;
     uint16_t pci_isa_irq_mask;
     uint8_t ioapic_id;
+
+    uint64_t mmconfig_addr;
+    uint32_t mmconfig_len;
 };
 
 int acpi_build_tables(struct acpi_ctxt *ctxt, struct acpi_config *config);
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index fc264a3a13..792dbc4383 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -1809,13 +1809,21 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             flexarray_append(dm_args, b_info->extra_pv[i]);
         break;
     case LIBXL_DOMAIN_TYPE_HVM:
-        if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
-            /* Switching here to the machine "pc" which does not add
-             * the xen-platform device instead of the default "xenfv" machine.
-             */
-            machinearg = libxl__strdup(gc, "pc,accel=xen,suppress-vmdesc=on");
+        if (b_info->device_model_machine == LIBXL_DEVICE_MODEL_MACHINE_Q35) {
+            if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
+                machinearg = libxl__sprintf(gc, "q35,accel=xen");
+            } else {
+                machinearg = libxl__sprintf(gc, "q35,accel=xen,xen-platform-dev=on");
+            }
         } else {
-            machinearg = libxl__strdup(gc, "xenfv,suppress-vmdesc=on");
+            if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
+                /* Switching here to the machine "pc" which does not add
+                 * the xen-platform device instead of the default "xenfv" machine.
+                 */
+                machinearg = libxl__strdup(gc, "pc,accel=xen,suppress-vmdesc=on");
+            } else {
+                machinearg = libxl__strdup(gc, "xenfv,suppress-vmdesc=on");
+            }
         }
         if (b_info->u.hvm.mmio_hole_memkb) {
             uint64_t max_ram_below_4g = (1ULL << 32) -
@@ -1929,29 +1937,51 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
 
             if (disks[i].is_cdrom) {
                 const char *drive_id;
-                if (disk > 4) {
+                if (disk > 4 && b_info->device_model_machine == LIBXL_DEVICE_MODEL_MACHINE_I440) {
                     LOGD(WARN, guest_domid, "Emulated CDROM can be only one of the first 4 disks.\n"
                          "Disk %s will be available via PV drivers but not as an "
                          "emulated disk.",
                          disks[i].vdev);
                     continue;
+                } else if (disk > 6 && 
+                           b_info->device_model_machine == LIBXL_DEVICE_MODEL_MACHINE_Q35) {
+                    LOGD(WARN, guest_domid, "Emulated CDROM can be only one of the first 6 disks.\n"
+                         "Disk %s will be available via PV drivers but not as an "
+                         "emulated disk.",
+                         disks[i].vdev);
+                    continue;
                 }
+		if (b_info->device_model_machine == LIBXL_DEVICE_MODEL_MACHINE_I440) {
+                     drive_id = GCSPRINTF("ide-%i", dev_number);
+                     drive = GCSPRINTF("if=none,readonly=on,id=%s", drive_id);
 
-                drive_id = GCSPRINTF("ide-%i", dev_number);
-                drive = GCSPRINTF("if=none,readonly=on,id=%s", drive_id);
-
-                if (target_path)
-                    drive = libxl__sprintf(gc, "%s,file=%s,format=%s",
-                                           drive, target_path, format);
+                    if (target_path)
+                        drive = libxl__sprintf(gc, "%s,file=%s,format=%s",
+                                               drive, target_path, format);
 
-                flexarray_vappend(dm_args,
+                    flexarray_vappend(dm_args,
                     "-drive", drive,
                     "-device",
                     GCSPRINTF("ide-cd,id=%s,drive=%s,bus=ide.%u,unit=%u",
                               drive_id, drive_id,
                               disk / 2, disk % 2),
                     NULL);
-                continue;
+                   continue;
+                } else {
+                    drive_id = GCSPRINTF("sata-0-%i", dev_number);
+                    drive = GCSPRINTF("if=none,readonly=on,id=%s", drive_id);
+                        if (target_path)
+                            drive = libxl__sprintf(gc, "%s,file=%s,format=%s",
+                                                   drive, target_path, format);
+
+                        flexarray_vappend(dm_args,
+                            "-drive", drive,
+                            "-device",
+                            GCSPRINTF("ide-cd,id=%s,drive=%s,bus=ide.0",
+                                      drive_id, drive_id),
+                            NULL);
+                        continue;
+                }
             } else {
                 /*
                  * Explicit sd disks are passed through as is.
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index c10292e0d7..b1aadae877 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -108,6 +108,13 @@ libxl_device_model_version = Enumeration("device_model_version", [
     (2, "QEMU_XEN"),             # Upstream based qemu-xen device model
     ])
 
+libxl_device_model_machine = Enumeration("device_model_machine", [
+    (0, "UNKNOWN"),
+    (1, "I440"),
+    (2, "Q35"),
+    ])
+
+
 libxl_console_type = Enumeration("console_type", [
     (0, "UNKNOWN"),
     (1, "SERIAL"),
@@ -575,6 +582,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("device_model_ssidref", uint32),
     ("device_model_ssid_label", string),
     ("device_model_user", string),
+    ("device_model_machine", libxl_device_model_machine),
 
     # extra parameters pass directly to qemu, NULL terminated
     ("extra",            libxl_string_list),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 1f6f47daf4..e6fb7a409a 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2689,6 +2689,20 @@ skip_usbdev:
     if (!xlu_cfg_get_long (config, "stubdomain_memory", &l, 0))
         b_info->stubdomain_memkb = l * 1024;
 
+    if (!xlu_cfg_get_string (config, "device_model_machine", &buf, 0)) {
+        if (!strcmp(buf, "i440")) {
+            b_info->device_model_machine = LIBXL_DEVICE_MODEL_MACHINE_I440;
+        } else if (!strcmp(buf, "q35")) {
+            b_info->device_model_machine = LIBXL_DEVICE_MODEL_MACHINE_Q35;
+        } else {
+            fprintf(stderr,
+                    "Unknown device_model_machine \"%s\" specified\n", buf);
+            exit(1);
+        }
+    } else {
+        b_info->device_model_machine = LIBXL_DEVICE_MODEL_MACHINE_UNKNOWN;
+    }
+
 #define parse_extra_args(type)                                            \
     e = xlu_cfg_get_list_as_string_list(config, "device_model_args"#type, \
                                     &b_info->extra##type, 0);            \
-- 
2.34.1


