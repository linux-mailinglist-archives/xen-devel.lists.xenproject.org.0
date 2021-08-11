Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907223E915B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 14:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166030.303220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnP5-0003eg-AA; Wed, 11 Aug 2021 12:32:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166030.303220; Wed, 11 Aug 2021 12:32:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnP5-0003bQ-6S; Wed, 11 Aug 2021 12:32:15 +0000
Received: by outflank-mailman (input) for mailman id 166030;
 Wed, 11 Aug 2021 12:32:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u8Eh=NC=citrix.com=Kevin.Stefanov@srs-us1.protection.inumbo.net>)
 id 1mDnP2-0003bF-MO
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 12:32:12 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25bf3fef-faa0-11eb-a06f-12813bfff9fa;
 Wed, 11 Aug 2021 12:32:11 +0000 (UTC)
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
X-Inumbo-ID: 25bf3fef-faa0-11eb-a06f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628685131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Nx5yYUhmyEa/UaDBpvCZ3Y7OdjIpDO3h5T9oWTcQpY4=;
  b=cZ+8u4NnnlE1bUM8wL/Mwfze/UwMAjyNAIRqJT1s/OGlMcsfNJ3qG9eb
   qE9DOXlQUT8V2lSJC+dKvAvS826letQRX7k0ozUQz3vIx53CMwbA65RtC
   hAmMpmfCUkedH4eo2m+8Gr/PTbYtiuPw+tIIgnJEnIXviWKi5PoYDxWiQ
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xhOju8A7bIEUu0OD6IU9MfpoiIhyLmm3UTZ/uSLVdDYo1g82fLCcc9XDWgra/FyB2l0qXCJGOF
 b6kURIOB3j73CNEuaHXh/dl/T4buI4idaS1gP6tynG+aVTcVUOoyMll3xxFviURycvdZPKx0gI
 VidVmR8YwAyuYHEOV9aDHmKoNDgjLoukxXZ20nLju9zoym5ZW5xqaDX4CllBhNZqM/6BbGHRyG
 HKUib0sVn0yTxMJBX6M795HpW4kbTfBQK/FrTutltMBgBNi3LU4/b70vjdVnpQBEC1ExrXL2iS
 ioMIuomh30enFwhqh2PHnvze
X-SBRS: 5.1
X-MesageID: 51909380
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:TIhvFKqTrwGp4Dslikw+G7UaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.84,311,1620705600"; 
   d="scan'208";a="51909380"
From: Kevin Stefanov <kevin.stefanov@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Kevin Stefanov <kevin.stefanov@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 2/2] x86/ioapic: Remove use of TRUE/FALSE/1/0
Date: Wed, 11 Aug 2021 13:31:35 +0100
Message-ID: <20210811123135.18195-3-kevin.stefanov@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811123135.18195-1-kevin.stefanov@citrix.com>
References: <20210811123135.18195-1-kevin.stefanov@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Also fix stray usage in VT-d.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Kevin Tian <kevin.tian@intel.com>

v2:
 * Also replace literal 1/0
---
 xen/arch/x86/io_apic.c                 | 38 +++++++++++++-------------
 xen/drivers/passthrough/vtd/intremap.c |  6 ++--
 xen/drivers/passthrough/vtd/utils.c    |  2 +-
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 58b26d962c..c3ad9efac8 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -289,7 +289,7 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
     {
         /* If vector is unknown, read it from the IO-APIC */
         if ( vector == IRQ_VECTOR_UNASSIGNED )
-            vector = __ioapic_read_entry(apic, pin, TRUE).vector;
+            vector = __ioapic_read_entry(apic, pin, true).vector;
 
         *(IO_APIC_BASE(apic)+16) = vector;
     }
@@ -300,28 +300,28 @@ static void __io_apic_eoi(unsigned int apic, unsigned int vector, unsigned int p
         struct IO_APIC_route_entry entry;
         bool need_to_unmask = false;
 
-        entry = __ioapic_read_entry(apic, pin, TRUE);
+        entry = __ioapic_read_entry(apic, pin, true);
 
         if ( ! entry.mask )
         {
             /* If entry is not currently masked, mask it and make
              * a note to unmask it later */
             entry.mask = 1;
-            __ioapic_write_entry(apic, pin, TRUE, entry);
+            __ioapic_write_entry(apic, pin, true, entry);
             need_to_unmask = true;
         }
 
         /* Flip the trigger mode to edge and back */
         entry.trigger = 0;
-        __ioapic_write_entry(apic, pin, TRUE, entry);
+        __ioapic_write_entry(apic, pin, true, entry);
         entry.trigger = 1;
-        __ioapic_write_entry(apic, pin, TRUE, entry);
+        __ioapic_write_entry(apic, pin, true, entry);
 
         if ( need_to_unmask )
         {
             /* Unmask if neccesary */
             entry.mask = 0;
-            __ioapic_write_entry(apic, pin, TRUE, entry);
+            __ioapic_write_entry(apic, pin, true, entry);
         }
     }
 }
@@ -344,7 +344,7 @@ int save_IO_APIC_setup(struct IO_APIC_route_entry **ioapic_entries)
             return -ENOMEM;
 
         for (pin = 0; pin < nr_ioapic_entries[apic]; pin++)
-	    ioapic_entries[apic][pin] = __ioapic_read_entry(apic, pin, 1);
+	    ioapic_entries[apic][pin] = __ioapic_read_entry(apic, pin, true);
     }
 
     return 0;
@@ -374,7 +374,7 @@ void mask_IO_APIC_setup(struct IO_APIC_route_entry **ioapic_entries)
             if (!entry.mask) {
                 entry.mask = 1;
 
-                ioapic_write_entry(apic, pin, 1, entry);
+                ioapic_write_entry(apic, pin, true, entry);
             }
         }
     }
@@ -1047,7 +1047,7 @@ static void __init setup_IO_APIC_irqs(void)
 
             SET_DEST(entry, logical, cpu_mask_to_apicid(TARGET_CPUS));
             spin_lock_irqsave(&ioapic_lock, flags);
-            __ioapic_write_entry(apic, pin, 0, entry);
+            __ioapic_write_entry(apic, pin, false, entry);
             spin_unlock_irqrestore(&ioapic_lock, flags);
         }
     }
@@ -1091,7 +1091,7 @@ static void __init setup_ExtINT_IRQ0_pin(unsigned int apic, unsigned int pin, in
     /*
      * Add it to the IO-APIC irq-routing table:
      */
-    ioapic_write_entry(apic, pin, 0, entry);
+    ioapic_write_entry(apic, pin, false, entry);
 
     enable_8259A_irq(irq_to_desc(0));
 }
@@ -1203,7 +1203,7 @@ static void /*__init*/ __print_IO_APIC(bool boot)
 	for (i = 0; i <= reg_01.bits.entries; i++) {
             struct IO_APIC_route_entry entry;
 
-            entry = ioapic_read_entry(apic, i, 0);
+            entry = ioapic_read_entry(apic, i, false);
 
             if ( x2apic_enabled && iommu_intremap )
                 printk(KERN_DEBUG " %02x %08x", i, entry.dest.dest32);
@@ -1290,7 +1290,7 @@ static void __init enable_IO_APIC(void)
         int pin;
         /* See if any of the pins is in ExtINT mode */
         for (pin = 0; pin < nr_ioapic_entries[apic]; pin++) {
-            struct IO_APIC_route_entry entry = ioapic_read_entry(apic, pin, 0);
+            struct IO_APIC_route_entry entry = ioapic_read_entry(apic, pin, false);
 
             /* If the interrupt line is enabled and in ExtInt mode
              * I have found the pin where the i8259 is connected.
@@ -1361,7 +1361,7 @@ void disable_IO_APIC(void)
         /*
          * Add it to the IO-APIC irq-routing table:
          */
-        ioapic_write_entry(ioapic_i8259.apic, ioapic_i8259.pin, 0, entry);
+        ioapic_write_entry(ioapic_i8259.apic, ioapic_i8259.pin, false, entry);
     }
     disconnect_bsp_APIC(ioapic_i8259.pin != -1);
 }
@@ -1841,7 +1841,7 @@ static void __init unlock_ExtINT_logic(void)
     if ( pin == -1 || apic == -1 )
         return;
 
-    entry0 = ioapic_read_entry(apic, pin, 0);
+    entry0 = ioapic_read_entry(apic, pin, false);
     clear_IO_APIC_pin(apic, pin);
 
     memset(&entry1, 0, sizeof(entry1));
@@ -1854,7 +1854,7 @@ static void __init unlock_ExtINT_logic(void)
     entry1.trigger = 0;
     entry1.vector = 0;
 
-    ioapic_write_entry(apic, pin, 0, entry1);
+    ioapic_write_entry(apic, pin, false, entry1);
 
     save_control = CMOS_READ(RTC_CONTROL);
     save_freq_select = CMOS_READ(RTC_FREQ_SELECT);
@@ -1873,7 +1873,7 @@ static void __init unlock_ExtINT_logic(void)
     CMOS_WRITE(save_freq_select, RTC_FREQ_SELECT);
     clear_IO_APIC_pin(apic, pin);
 
-    ioapic_write_entry(apic, pin, 0, entry0);
+    ioapic_write_entry(apic, pin, false, entry0);
 }
 
 /*
@@ -2287,7 +2287,7 @@ int io_apic_set_pci_routing (int ioapic, int pin, int irq, int edge_level, int a
         disable_8259A_irq(desc);
 
     spin_lock_irqsave(&ioapic_lock, flags);
-    __ioapic_write_entry(ioapic, pin, 0, entry);
+    __ioapic_write_entry(ioapic, pin, false, entry);
     spin_unlock(&ioapic_lock);
 
     spin_lock(&desc->lock);
@@ -2476,7 +2476,7 @@ int ioapic_guest_write(unsigned long physbase, unsigned int reg, u32 val)
         rte.mask = 1;
     }
 
-    __ioapic_write_entry(apic, pin, 0, rte);
+    __ioapic_write_entry(apic, pin, false, rte);
     
     spin_unlock_irqrestore(&ioapic_lock, flags);
 
@@ -2529,7 +2529,7 @@ void dump_ioapic_irq_info(void)
 
             printk("      Apic 0x%02x, Pin %2d: ", entry->apic, pin);
 
-            rte = ioapic_read_entry(entry->apic, pin, 0);
+            rte = ioapic_read_entry(entry->apic, pin, false);
 
             printk("vec=%02x delivery=%-5s dest=%c status=%d "
                    "polarity=%d irr=%d trig=%c mask=%d dest_id:%0*x\n",
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index d0f70d90eb..12e647f05a 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -427,7 +427,7 @@ unsigned int io_apic_read_remap_rte(
         ( (index = apic_pin_2_ir_idx[apic][ioapic_pin]) < 0 ) )
         return __io_apic_read(apic, reg);
 
-    old_rte = __ioapic_read_entry(apic, ioapic_pin, 1);
+    old_rte = __ioapic_read_entry(apic, ioapic_pin, true);
 
     if ( remap_entry_to_ioapic_rte(iommu, index, &old_rte) )
         return __io_apic_read(apic, reg);
@@ -448,7 +448,7 @@ void io_apic_write_remap_rte(
     struct vtd_iommu *iommu = ioapic_to_iommu(IO_APIC_ID(apic));
     int saved_mask;
 
-    old_rte = __ioapic_read_entry(apic, ioapic_pin, 1);
+    old_rte = __ioapic_read_entry(apic, ioapic_pin, false);
 
     remap_rte = (struct IO_APIC_route_remap_entry *) &old_rte;
 
@@ -468,7 +468,7 @@ void io_apic_write_remap_rte(
             __io_apic_write(apic, reg & ~1, *(u32 *)&old_rte);
     }
     else
-        __ioapic_write_entry(apic, ioapic_pin, 1, old_rte);
+        __ioapic_write_entry(apic, ioapic_pin, true, old_rte);
 }
 
 static void set_msi_source_id(struct pci_dev *pdev, struct iremap_entry *ire)
diff --git a/xen/drivers/passthrough/vtd/utils.c b/xen/drivers/passthrough/vtd/utils.c
index 4febcf506d..70add3cc8e 100644
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -281,7 +281,7 @@ void vtd_dump_iommu_info(unsigned char key)
             for ( i = 0; i <= reg_01.bits.entries; i++ )
             {
                 struct IO_APIC_route_entry rte =
-                    __ioapic_read_entry(apic, i, TRUE);
+                    __ioapic_read_entry(apic, i, true);
 
                 remap = (struct IO_APIC_route_remap_entry *) &rte;
                 if ( !remap->format )
-- 
2.25.1


