Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378FB59F847
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 13:00:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392407.630750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQo6u-0001ZF-AD; Wed, 24 Aug 2022 10:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392407.630750; Wed, 24 Aug 2022 10:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQo6u-0001W7-6x; Wed, 24 Aug 2022 10:59:48 +0000
Received: by outflank-mailman (input) for mailman id 392407;
 Wed, 24 Aug 2022 10:59:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ebS+=Y4=citrix.com=prvs=22883313c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oQo6s-0001Gd-Sv
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 10:59:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcc85200-239b-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 12:59:45 +0200 (CEST)
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
X-Inumbo-ID: dcc85200-239b-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1661338785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ckFon/A44dzmeOdZ3hprwgRwV7uXCMZYwDX4BIU05i0=;
  b=b4Bfkfrl/jJWUQcVUtsNW5lKO6VKNSdSxS82W41/gz+F9J7zt0ki1uzh
   j4At7B/X/xI01Mip26iWkvAZT+yQeHreoAzex7G4ABA6KLuiCh/FvrK6n
   1obx91Qms5/Ak3Oz1zVM25UcDYmL8soU3glsdU4dIuxUEZgXre5KbAl9q
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78010165
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Vwk6qa/06gsRTngByeaiDrUD436TJUtcMsCJ2f8bNWPcYEJGY0x3m
 mVJXT+CMvqIYGqheth3OoTj9EIP78OEyYdnHVA+pC48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9z8kvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0gFaYDkpOs/jZ8EM14Kyr0N8llgdWic5j7Qe2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIPM0SWuTBQpzRa70oOHKF0hXG7Kdm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVNuzLfWXcG7liX7n3XQL/pGBkhnBqI49cROM15sx
 f0lGh0jRDymvrfjqF67YrEEasULKcDqOMUUu216zCGfBvEjKXzBa/yUv5kChm52350QW6aFD
 yYaQWMHgBDoShtDIFoITrk5m/+lnCLXeDxEslOF46Ew5gA/ySQugOC0aIOLJ7RmQ+0Ot1nfp
 W773ligH0snF9mO7yeZynSz07qncSTTB9tJSezQGuRRqEKX7nweDlsRT1TTiduTh1O6WtlfA
 1cJ4Sdopq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYXiUp4y7jTyQABoqD18DWB0pYyEpxuC29enfkSnzosZf/L+d14OrQGupk
 mDW8UDSlJ1I05dVivzTEUTvxmv1+8OXFlNdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FKBva/t3MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK510IvsACbSH0Nv8nC25UNyjN5fmIKDgYfqqMMoomjmZZLmdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMEv2/Z9PlWPuL9rxJJdxmUjSM0uPGs2gp/lmuJLCDEOopUAtagLVMbtktvvd+W04M
 b93bqO39vmWa8WmCgG/zGLZBQpiwaQTbXwul/FqSw==
IronPort-HdrOrdr: A9a23:xMyW762yg68Jun+FpUPvoAqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.93,260,1654574400"; 
   d="scan'208";a="78010165"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/4] x86/hvmloader: Move various helpers to being static inlines
Date: Wed, 24 Aug 2022 11:59:15 +0100
Message-ID: <20220824105915.32127-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220824105915.32127-1-andrew.cooper3@citrix.com>
References: <20220824105915.32127-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The IO port, MSR, IO-APIC and LAPIC accessors compile typically to single or
pairs of instructions, which is less overhead than even the stack manipulation
to call the helpers.

Move the implementations from util.c to being static inlines in util.h

In addition, turn ioapic_base_address into a constant as it is never modified
from 0xfec00000 (substantially shrinks the IO-APIC logic), and make use of the
"A" constraint for WRMSR/RDMSR like we already do for RDSTC.

Bloat-o-meter reports a net:
  add/remove: 0/13 grow/shrink: 1/19 up/down: 6/-743 (-737)

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/firmware/hvmloader/config.h    |  2 +-
 tools/firmware/hvmloader/hvmloader.c |  1 -
 tools/firmware/hvmloader/mp_tables.c |  2 +-
 tools/firmware/hvmloader/util.c      | 78 +-------------------------------
 tools/firmware/hvmloader/util.h      | 88 +++++++++++++++++++++++++++++++-----
 5 files changed, 79 insertions(+), 92 deletions(-)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index c82adf6dc508..b16fad300fbc 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -44,7 +44,7 @@ extern struct bios_config ovmf_config;
 #define PAGE_SHIFT 12
 #define PAGE_SIZE  (1ul << PAGE_SHIFT)
 
-extern uint32_t ioapic_base_address;
+#define IOAPIC_BASE_ADDRESS 0xfec00000
 extern uint8_t ioapic_version;
 
 #define IOAPIC_ID           0x01
diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index c58841e5b556..f8af88fabf24 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -113,7 +113,6 @@ asm (
 
 unsigned long scratch_start = SCRATCH_PHYSICAL_ADDRESS;
 
-uint32_t ioapic_base_address = 0xfec00000;
 uint8_t ioapic_version;
 
 bool acpi_enabled;
diff --git a/tools/firmware/hvmloader/mp_tables.c b/tools/firmware/hvmloader/mp_tables.c
index d207ecbf00c9..77d3010406d0 100644
--- a/tools/firmware/hvmloader/mp_tables.c
+++ b/tools/firmware/hvmloader/mp_tables.c
@@ -229,7 +229,7 @@ static void fill_mp_ioapic_entry(struct mp_ioapic_entry *mpie)
     mpie->ioapic_id = IOAPIC_ID;
     mpie->ioapic_version = ioapic_version;
     mpie->ioapic_flags = 1; /* enabled */
-    mpie->ioapic_addr = ioapic_base_address;
+    mpie->ioapic_addr = IOAPIC_BASE_ADDRESS;
 }
 
 
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index 581b35e5cfb5..d1dcc2844a43 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -42,60 +42,6 @@ bool check_overlap(uint64_t start, uint64_t size,
             (start < reserved_start + reserved_size);
 }
 
-void wrmsr(uint32_t idx, uint64_t v)
-{
-    asm volatile (
-        "wrmsr"
-        : : "c" (idx), "a" ((uint32_t)v), "d" ((uint32_t)(v>>32)) );
-}
-
-uint64_t rdmsr(uint32_t idx)
-{
-    uint32_t lo, hi;
-
-    asm volatile (
-        "rdmsr"
-        : "=a" (lo), "=d" (hi) : "c" (idx) );
-
-    return (lo | ((uint64_t)hi << 32));
-}
-
-void outb(uint16_t addr, uint8_t val)
-{
-    asm volatile ( "outb %%al, %%dx" : : "d" (addr), "a" (val) );
-}
-
-void outw(uint16_t addr, uint16_t val)
-{
-    asm volatile ( "outw %%ax, %%dx" : : "d" (addr), "a" (val) );
-}
-
-void outl(uint16_t addr, uint32_t val)
-{
-    asm volatile ( "outl %%eax, %%dx" : : "d" (addr), "a" (val) );
-}
-
-uint8_t inb(uint16_t addr)
-{
-    uint8_t val;
-    asm volatile ( "inb %%dx,%%al" : "=a" (val) : "d" (addr) );
-    return val;
-}
-
-uint16_t inw(uint16_t addr)
-{
-    uint16_t val;
-    asm volatile ( "inw %%dx,%%ax" : "=a" (val) : "d" (addr) );
-    return val;
-}
-
-uint32_t inl(uint16_t addr)
-{
-    uint32_t val;
-    asm volatile ( "inl %%dx,%%eax" : "=a" (val) : "d" (addr) );
-    return val;
-}
-
 uint8_t cmos_inb(uint8_t idx)
 {
     outb(0x70, idx);
@@ -493,28 +439,6 @@ void *scratch_alloc(uint32_t size, uint32_t align)
     return (void *)(unsigned long)s;
 }
 
-uint32_t ioapic_read(uint32_t reg)
-{
-    *(volatile uint32_t *)(ioapic_base_address + 0x00) = reg;
-    return *(volatile uint32_t *)(ioapic_base_address + 0x10);
-}
-
-void ioapic_write(uint32_t reg, uint32_t val)
-{
-    *(volatile uint32_t *)(ioapic_base_address + 0x00) = reg;
-    *(volatile uint32_t *)(ioapic_base_address + 0x10) = val;
-}
-
-uint32_t lapic_read(uint32_t reg)
-{
-    return *(volatile uint32_t *)(LAPIC_BASE_ADDRESS + reg);
-}
-
-void lapic_write(uint32_t reg, uint32_t val)
-{
-    *(volatile uint32_t *)(LAPIC_BASE_ADDRESS + reg) = val;
-}
-
 #define PCI_CONF1_ADDRESS(bus, devfn, reg) \
     (0x80000000 | (bus << 16) | (devfn << 8) | (reg & ~3))
 
@@ -943,7 +867,7 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
 
     config->lapic_base_address = LAPIC_BASE_ADDRESS;
     config->lapic_id = acpi_lapic_id;
-    config->ioapic_base_address = ioapic_base_address;
+    config->ioapic_base_address = IOAPIC_BASE_ADDRESS;
     config->ioapic_id = IOAPIC_ID;
     config->pci_isa_irq_mask = PCI_ISA_IRQ_MASK; 
 
diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
index ac7ff264e247..b6108a705eab 100644
--- a/tools/firmware/hvmloader/util.h
+++ b/tools/firmware/hvmloader/util.h
@@ -7,6 +7,7 @@
 #include <stdbool.h>
 #include <xen/xen.h>
 #include <xen/hvm/hvm_info_table.h>
+#include "config.h"
 #include "e820.h"
 
 /* Request un-prefixed values from errno.h. */
@@ -61,28 +62,91 @@ static inline int test_and_clear_bit(int nr, volatile void *addr)
 }
 
 /* MSR access */
-void wrmsr(uint32_t idx, uint64_t v);
-uint64_t rdmsr(uint32_t idx);
+static inline void wrmsr(uint32_t idx, uint64_t v)
+{
+    asm volatile ( "wrmsr" :: "c" (idx), "A" (v) : "memory" );
+}
+
+static inline uint64_t rdmsr(uint32_t idx)
+{
+    uint64_t res;
+
+    asm volatile ( "rdmsr" : "=A" (res) : "c" (idx) );
+
+    return res;
+}
 
 /* I/O output */
-void outb(uint16_t addr, uint8_t  val);
-void outw(uint16_t addr, uint16_t val);
-void outl(uint16_t addr, uint32_t val);
+static inline void outb(uint16_t addr, uint8_t val)
+{
+    asm volatile ( "outb %%al, %%dx" :: "d" (addr), "a" (val) );
+}
+
+static inline void outw(uint16_t addr, uint16_t val)
+{
+    asm volatile ( "outw %%ax, %%dx" :: "d" (addr), "a" (val) );
+}
+
+static inline void outl(uint16_t addr, uint32_t val)
+{
+    asm volatile ( "outl %%eax, %%dx" :: "d" (addr), "a" (val) );
+}
 
 /* I/O input */
-uint8_t  inb(uint16_t addr);
-uint16_t inw(uint16_t addr);
-uint32_t inl(uint16_t addr);
+static inline uint8_t inb(uint16_t addr)
+{
+    uint8_t val;
+
+    asm volatile ( "inb %%dx,%%al" : "=a" (val) : "d" (addr) );
+
+    return val;
+}
+
+static inline uint16_t inw(uint16_t addr)
+{
+    uint16_t val;
+
+    asm volatile ( "inw %%dx,%%ax" : "=a" (val) : "d" (addr) );
+
+    return val;
+}
+
+static inline uint32_t inl(uint16_t addr)
+{
+    uint32_t val;
+
+    asm volatile ( "inl %%dx,%%eax" : "=a" (val) : "d" (addr) );
+
+    return val;
+}
 
 /* CMOS access */
 uint8_t cmos_inb(uint8_t idx);
 void cmos_outb(uint8_t idx, uint8_t val);
 
 /* APIC access */
-uint32_t ioapic_read(uint32_t reg);
-void ioapic_write(uint32_t reg, uint32_t val);
-uint32_t lapic_read(uint32_t reg);
-void lapic_write(uint32_t reg, uint32_t val);
+static inline uint32_t ioapic_read(uint32_t reg)
+{
+    *(volatile uint32_t *)(IOAPIC_BASE_ADDRESS + 0x00) = reg;
+    return *(volatile uint32_t *)(IOAPIC_BASE_ADDRESS + 0x10);
+}
+
+static inline void ioapic_write(uint32_t reg, uint32_t val)
+{
+    *(volatile uint32_t *)(IOAPIC_BASE_ADDRESS + 0x00) = reg;
+    *(volatile uint32_t *)(IOAPIC_BASE_ADDRESS + 0x10) = val;
+}
+
+#define LAPIC_BASE_ADDRESS  0xfee00000
+static inline uint32_t lapic_read(uint32_t reg)
+{
+    return *(volatile uint32_t *)(LAPIC_BASE_ADDRESS + reg);
+}
+
+static inline void lapic_write(uint32_t reg, uint32_t val)
+{
+    *(volatile uint32_t *)(LAPIC_BASE_ADDRESS + reg) = val;
+}
 
 /* PCI access */
 uint32_t pci_read(uint32_t devfn, uint32_t reg, uint32_t len);
-- 
2.11.0


