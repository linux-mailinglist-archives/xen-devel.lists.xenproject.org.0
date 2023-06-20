Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F622737290
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:17:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551992.861850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyv-0007Ad-0o; Tue, 20 Jun 2023 17:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551992.861850; Tue, 20 Jun 2023 17:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBeyu-00077E-Sj; Tue, 20 Jun 2023 17:17:28 +0000
Received: by outflank-mailman (input) for mailman id 551992;
 Tue, 20 Jun 2023 17:17:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBeys-0005iB-Kx
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:17:26 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 534de959-0f8e-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 19:17:25 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-bf5f41a87ceso1815317276.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:17:25 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 f81-20020a25cf54000000b00bcc0f2e4f05sm461938ybg.59.2023.06.20.10.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:17:23 -0700 (PDT)
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
X-Inumbo-ID: 534de959-0f8e-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281444; x=1689873444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RM7XI3GANtEN3rKi5JobU5SJg3vOxg/6WaWdszBvqtQ=;
        b=RBZgYaRAHUdyrJqdHgfRRDvmbr/Pt4oWavppwOuem+MSRJw9IVQCa3XeKX6Tatn8UM
         cxn28siWSpZQYIrrxL6NJ5vBG2J6GZMJETQO6RuHpZJ7/9WNrbiokjq5EM8976YrVbwX
         FJK5M0sclB3l1CEwnIiEGFAmlw45h+kkxGaOlDiNQeKYwTf9zGJ+4CAHy+cnRgIHe0YI
         c2FTRIvKIRz6UBp1V7XQ4nb9kOHNWy7+eZboNej53/IOpy7LeOoT0WXH0XLBkB0XGKtP
         8fr7SJegSvgz/ST+nUWAEqSjzL4agdCLaPYCLVaGsPeMykBwdrzZHbIINZkUtN9s4cq1
         VXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281444; x=1689873444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RM7XI3GANtEN3rKi5JobU5SJg3vOxg/6WaWdszBvqtQ=;
        b=AkOb6EXyqNTdEQTqeuOeKNsv51ddhWKdhxqd/3Ny2GxaohB0p9CK++xbL6I2Ogffpc
         XIj+kjTg2Tg8Eobmuv0DEScuFIcsFuNM0obRjmreKR2zErQP3mVBB6H2dVI3m3eLi3rx
         mwxuWycUNIOEPNvcvTnRkTvwJlefWWMClDIaUFkd9/Ui7NGEM26j59S9FPvJKPhLP1we
         F6aAOXHHCb2pyhxmAiQ3D5Tt9nIYS4E3wIQimeARyw30if/69M/DY0Nzsz2/7QDzWX1I
         sMZmymcqi69PJm+eAsAAFQwnmitDcajEyHEanTNcOF0a8L3SvyI+Z/JlhxE2P6vu8TNU
         /IvA==
X-Gm-Message-State: AC+VfDwdrZSAdxDzjRa9EDKo4IFdPHo73X4JD3zZSdF9KHL1Pb0HYY2+
	6oc55EjH6GTb56Utif/EfOqBc+VffcvdFw==
X-Google-Smtp-Source: ACHHUZ6BePx58VbyOSs7xi34QCqm4HRe1+CoYMXNRqAbD0+Tvtsm02zuBAtOpUE/HsTRFpQCs2tC7A==
X-Received: by 2002:a25:9191:0:b0:b9e:7ec8:5d45 with SMTP id w17-20020a259191000000b00b9e7ec85d45mr9006708ybl.55.1687281444253;
        Tue, 20 Jun 2023 10:17:24 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Joel Upham <jupham125@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 07/12] hvmloader: allocate MMCONFIG area in the MMIO hole + minor code refactoring
Date: Tue, 20 Jun 2023 13:15:47 -0400
Message-Id: <389d2cd465f27a32f7370e976cecd2eefdf827db.1687215890.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687215890.git.jupham125@gmail.com>
References: <cover.1687215890.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Much like normal PCI BARs or other chipset-specific memory-mapped
resources, MMCONFIG area needs space in MMIO hole, so we must allocate
it manually.

The actual MMCONFIG size depends on a number of PCI buses available which
should be covered by ECAM. Possible options are 64MB, 128MB and 256MB.
As we are limited to the bus 0 currently, thus using lowest possible
setting (64MB), #defined via PCI_MAX_MCFG_BUSES in hvmloader/config.h.
When multiple PCI buses support for Xen will be implemented,
PCI_MAX_MCFG_BUSES may be changed to calculation of the number of buses
according to results of the PCI devices enumeration.

The way to allocate MMCONFIG range in MMIO hole is similar to how other
PCI BARs are allocated. The patch extends 'bars' structure to make
it universal for any arbitrary BAR type -- either IO, MMIO, ROM or
a chipset-specific resource.

One important new field is addr_mask, which tells which bits of the base
address can (should) be written. Different address types (ROM, MMIO BAR,
PCIEXBAR) will have different addr_mask values.

For every assignable BAR range we store its size, PCI device BDF (devfn
actually) to which it belongs, BAR type (mem/io/mem64) and corresponding
register offset in device PCI conf space. This way we can insert MMCONFIG
entry into bars array in the same manner like for any other BARs. In this
case, the devfn field will point to MCH PCI device and bar_reg will
contain PCIEXBAR register offset. It will be assigned a slot in MMIO hole
later in a very same way like for plain PCI BARs, with respect to its size
alignment.

Also, to reduce code complexity, all long mem/mem64 BAR flags checks are
replaced by simple bars[i] field probing, eg.:
-        if ( (bar_reg == PCI_ROM_ADDRESS) ||
-             ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
-              PCI_BASE_ADDRESS_SPACE_MEMORY) )
+        if ( bars[i].is_mem )

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 tools/firmware/hvmloader/config.h   |   5 ++
 tools/firmware/hvmloader/pci.c      | 123 +++++++++++++++++++++-------
 tools/firmware/hvmloader/pci_regs.h |   2 +
 3 files changed, 102 insertions(+), 28 deletions(-)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index de3bbed609..53a3300d6e 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -55,6 +55,11 @@ extern uint8_t ioapic_version;
 #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
 #define PCI_ICH9_LPC_DEVFN  0xf8    /* dev 31, fn 0 */
+#define PCI_MCH_DEVFN       0       /* bus 0, dev 0, func 0 */
+
+/* possible values are: 64, 128, 256 */
+#define PCI_MAX_MCFG_BUSES  64
+
 
 #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
 
diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
index 8249f70806..1137387c43 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -157,9 +157,10 @@ static void class_specific_pci_device_setup(uint16_t vendor_id,
 
 void pci_setup(void)
 {
-    uint8_t is_64bar, using_64bar, bar64_relocate = 0;
+    uint8_t is_64bar, using_64bar, bar64_relocate = 0, is_mem;
     uint32_t devfn, bar_reg, cmd, bar_data, bar_data_upper;
     uint64_t base, bar_sz, bar_sz_upper, mmio_total = 0;
+    uint64_t addr_mask;
     uint16_t vendor_id, device_id;
     unsigned int bar, pin, link, isa_irq;
     int is_running_on_q35 = 0;
@@ -172,10 +173,14 @@ void pci_setup(void)
 
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
@@ -280,13 +285,20 @@ void pci_setup(void)
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
@@ -294,15 +306,15 @@ void pci_setup(void)
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
@@ -316,6 +328,9 @@ void pci_setup(void)
             if ( bar_sz == 0 )
                 continue;
 
+            /* leave only memtype/enable bits etc */
+            bar_data &= ~addr_mask;
+
             for ( i = 0; i < nr_bars; i++ )
                 if ( bars[i].bar_sz < bar_sz )
                     break;
@@ -323,14 +338,15 @@ void pci_setup(void)
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
@@ -358,6 +374,63 @@ void pci_setup(void)
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
@@ -492,10 +565,9 @@ void pci_setup(void)
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
@@ -505,18 +577,15 @@ void pci_setup(void)
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
@@ -538,7 +607,7 @@ void pci_setup(void)
             }
         }
 
-        bar_data |= (uint32_t)base;
+        bar_data |= (uint32_t) (base & bars[i].addr_mask);
         bar_data_upper = (uint32_t)(base >> 32);
         base += bar_sz;
 
@@ -559,10 +628,8 @@ void pci_setup(void)
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
index 4d4dc0cd01..b9261ee2af 100644
--- a/tools/firmware/hvmloader/pci_regs.h
+++ b/tools/firmware/hvmloader/pci_regs.h
@@ -111,6 +111,8 @@
 #define PCI_DEVICE_ID_INTEL_82441        0x1237
 #define PCI_DEVICE_ID_INTEL_Q35_MCH      0x29c0
 
+#define PCI_MCH_PCIEXBAR                 0x60
+
 #endif /* __HVMLOADER_PCI_REGS_H__ */
 
 /*
-- 
2.34.1


