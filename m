Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9010B6D275F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 19:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517014.801984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piJ0M-0008Pt-0a; Fri, 31 Mar 2023 17:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517014.801984; Fri, 31 Mar 2023 17:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1piJ0L-0008OB-TI; Fri, 31 Mar 2023 17:57:37 +0000
Received: by outflank-mailman (input) for mailman id 517014;
 Fri, 31 Mar 2023 17:57:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l1cV=7X=citrix.com=prvs=4478a6bcf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1piJ0K-0008O5-AO
 for xen-devel@lists.xenproject.org; Fri, 31 Mar 2023 17:57:36 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80c8b250-cfed-11ed-b464-930f4c7d94ae;
 Fri, 31 Mar 2023 19:57:32 +0200 (CEST)
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
X-Inumbo-ID: 80c8b250-cfed-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680285452;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fuQPshvUigDB1cxH2VT1nTmph/TYDOfPO4Nsf0h3MtY=;
  b=iZNkubVf/E1iMZBLbX4fN5QO9yaM8NdcQhkfJTGoYxWISlJXap8H69BQ
   AoWrJVZNs4mjgMKBPjCyNOZbAbLICM3mJ3IS8py7NmtY0MnDIkEldcktC
   Xeg/MqLj8WDfZWmlPnlRR+DYEp2EIWnzNWuSXkMDd7lwph37Qr2MwVKq+
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104275096
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:hkMl5a1b5dKHgQCAFvbD5a9xkn2cJEfYwER7XKvMYLTBsI5bp2YAm
 jYfCj3SOazYajT2ed51ad7g8RgOv5SDzYVqSwJupC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdlPKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfMDpq+
 O0TCAg2NC+M3NmY4538bMNOiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ0JxBnF/
 jOYl4j/KjAUBPi+8iaayWryo/OfuijrYKAIM5Tto5aGh3XMnzdOWXX6T2CTvv2RmkO4HdVFJ
 CQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooL2yQuEAmkPThZadccr8sQxQFQXO
 kShxo2zQ2Y16fvMFCzbr+3Pxd+vBcQLBV5ZQSIVRis92IPcr9oIoDHgCfBJMqHg27UZBgrML
 yC2QDkW3utD1ZRQi/XmrTgrkBr3+MGXE1ddChH/Gzv8s1gnPNPNi5mAswCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83oJrW7FF4aLJ9w43d2HDB4B3jw4UTHoe
 lTPngha+YVeOnCnBYcuPdLpUZxzlvC+SI2+PhwxUjapSskZSeN61Hs2OR74M57FyyDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17ILHMhsWnDuJLbiilkTP7FZrTCLNIVvzGAfUP79RAWLtiFm9z
 uuzwOPRl0UAAb2kP3mOmWPRRHhTRUUG6VnNg5Q/Xoa+zsBOQQnN19e5LWsdRrFY
IronPort-HdrOrdr: A9a23:24KBnKgnJqXgO3rRuHwqY/ryUHBQX1R23DAbv31ZSRFFG/FwyP
 rDoB1L73LJYWgqMk3IwerwQpVpQRvnhPxICPoqTMqftWjdySCVxeRZgrcKrAeQfREWmtQ86U
 4kSdkENDSSNykxsS+Z2njALz9I+rDum87IuQ6d9QYUcegAUdAE0+4NMHf9LqQAfngjOXNWLu
 v+2iMUnUv6RZy3A/7LWEXtCtKz/uHjpdbMTSQ9Qzg69QKJkTSkrITiGxzd5RsGVShTqI1SrV
 TtokjTyp+Y99em1xTby2jfq65OkN+k8NFEH8DksLlJFhzczi2FXr4kfaGetzYop+zq0k8jlJ
 33vh88I94b0QKPQkiF5TDA4TOl6T409mWK8y7DvZK2m72geBsKT+56wa5JeBrQ7EQt+Pl6za
 Jwxmqc87ZHEB/amyz5xt7QEzVnjFC9r3YOmfMayyU3a/pTVJZh6agkuG9FGpYJGyz3rKghDe
 lVFcnZoNpGbF+AaHjdn293hPihRG46EBuqSlUL/uaVzz9VtnZkyFZw/r1Tol4wsLYGD7VU7e
 XNNapl0JtUSNUNUK57DOAdBeOqF23kW3v3QSyvCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtFQ1Z1nlBaS1rdx2G1H2MSWAtAbWu4NjDqtCy/jBrX3QQGm+oWUV4oidSjMkc4rmsr
 iISdRr6rTYXBfT8M5yrnLDst9pWDYjuYQuy6gGckPLrcTRJoLwsOvHNP7VObr2CD4hHnjyG3
 0ZQVHIVbN9B22QKwvFaSLqKgTQU126+Yg1HLnR/uAVxoRIPopQshINgVD84s2QMzVNvqE/YU
 M7edrc4+uGjHjz+XyN43RiOxJbAEoQ6LL8U2lSrQtPN0/va74Mt9iWZGgX1nqaIR10Sd/QDW
 dk1h1K0LPyK4bVyTEpCtqhPG7fh3wPpGiSR5NZgaGH7deNQOJMMn/nYt0CKezmLW0Hpe8xkh
 YzVOYtfD6uKg/T
X-IronPort-AV: E=Sophos;i="5.98,307,1673931600"; 
   d="scan'208";a="104275096"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/pci: Correct ECS handling with CF8/CFC emulation
Date: Fri, 31 Mar 2023 18:57:19 +0100
Message-ID: <20230331175719.500285-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This started by noticing the dubious Fam17h check in
arch_ioreq_server_get_type_addr(), and then realising that checking the host
CF8_EXT setting is utterly bogus for the guest <-> qemu emulation path.

What should be consulted here is the guest's MSR_AMD64_NB_CFG setting, but a)
there isn't one, and b) the vestigial remnants of the cross-vendor migration
logic cause MSR_AMD64_NB_CFG to be unconditionally read-as-zero, making the
CF8_EXT path unused by any suitably-written OS in the first place.

MSR_AMD64_NB_CFG really has been removed on Fam17h (it's now just a read-zero,
write-discard stub), and the ECS extension is unconditionally active, meaning
it is not correct for Xen to ignore the ExtRegNo field on newer AMD CPUs.

It turns out that Xen did even have this behaviour in 4.5 and earlier, with
this problematic CF8_EXT checking being added in 4.6.  Therefore, revert back
to Xen's older behaviour - it is objectively less wrong than the current
logic.

While fixing this, get rid of hvm_pci_decode_addr() - it is more complicated
to follow (and to call) than using the CF8* macros in the calling context.
Rename CF8_ADDR() to CF8_REG() to better describe what it does, and write a
comment explaining all about CF8/CFC accesses.

There's one rare case when CF8_EXT is visible to guests, and that is for a
pinned hwdom.  Right now, we permit such a dom0 to modify the CF8_EXT bit, but
this seems like a very unwise idea.  Leave a TODO for people to consider.

Fixes: e0fbf3bf9871 ("x86/AMD: correct certain Fam17 checks")
Fixes: 2d67a7a4d37a ("x86: synchronize PCI config space access decoding")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Whoever reviewed those two patches originally was clearly a fool...
---
 xen/arch/x86/hvm/io.c             | 24 ++++++------------------
 xen/arch/x86/hvm/ioreq.c          | 19 ++-----------------
 xen/arch/x86/include/asm/hvm/io.h |  4 ----
 xen/arch/x86/include/asm/pci.h    | 26 ++++++++++++++++++++++++--
 xen/arch/x86/pv/emul-priv-op.c    | 19 ++++++-------------
 5 files changed, 38 insertions(+), 54 deletions(-)

diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index 5ae209d3b6b3..b0d3c236e985 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -248,20 +248,6 @@ void register_g2m_portio_handler(struct domain *d)
     handler->ops = &g2m_portio_ops;
 }
 
-unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
-                                 pci_sbdf_t *sbdf)
-{
-    ASSERT(CF8_ENABLED(cf8));
-
-    sbdf->bdf = CF8_BDF(cf8);
-    sbdf->seg = 0;
-    /*
-     * NB: the lower 2 bits of the register address are fetched from the
-     * offset into the 0xcfc register when reading/writing to it.
-     */
-    return CF8_ADDR_LO(cf8) | (addr & 3);
-}
-
 /* vPCI config space IO ports handlers (0xcf8/0xcfc). */
 static bool cf_check vpci_portio_accept(
     const struct hvm_io_handler *handler, const ioreq_t *p)
@@ -275,7 +261,7 @@ static int cf_check vpci_portio_read(
 {
     const struct domain *d = current->domain;
     unsigned int reg;
-    pci_sbdf_t sbdf;
+    pci_sbdf_t sbdf = {};
     uint32_t cf8;
 
     *data = ~(uint64_t)0;
@@ -292,7 +278,8 @@ static int cf_check vpci_portio_read(
     if ( !CF8_ENABLED(cf8) )
         return X86EMUL_UNHANDLEABLE;
 
-    reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
+    sbdf.bdf = CF8_BDF(cf8);
+    reg = CF8_REG(cf8) | (addr & 3);
 
     if ( !vpci_access_allowed(reg, size) )
         return X86EMUL_OKAY;
@@ -308,7 +295,7 @@ static int cf_check vpci_portio_write(
 {
     struct domain *d = current->domain;
     unsigned int reg;
-    pci_sbdf_t sbdf;
+    pci_sbdf_t sbdf = {};
     uint32_t cf8;
 
     if ( addr == 0xcf8 )
@@ -323,7 +310,8 @@ static int cf_check vpci_portio_write(
     if ( !CF8_ENABLED(cf8) )
         return X86EMUL_UNHANDLEABLE;
 
-    reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
+    sbdf.bdf = CF8_BDF(cf8);
+    reg = CF8_REG(cf8) | (addr & 3);
 
     if ( !vpci_access_allowed(reg, size) )
         return X86EMUL_OKAY;
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 0bdcca1e1a5f..325a9d118e52 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -285,27 +285,12 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d,
          (p->addr & ~3) == 0xcfc &&
          CF8_ENABLED(cf8) )
     {
-        unsigned int x86_fam, reg;
-        pci_sbdf_t sbdf;
-
-        reg = hvm_pci_decode_addr(cf8, p->addr, &sbdf);
+        pci_sbdf_t sbdf = { .bdf = CF8_BDF(cf8) };
+        unsigned int reg = CF8_REG(cf8) | (p->addr & 3);
 
         /* PCI config data cycle */
         *type = XEN_DMOP_IO_RANGE_PCI;
         *addr = ((uint64_t)sbdf.sbdf << 32) | reg;
-        /* AMD extended configuration space access? */
-        if ( CF8_ADDR_HI(cf8) &&
-             d->arch.cpuid->x86_vendor == X86_VENDOR_AMD &&
-             (x86_fam = get_cpu_family(
-                 d->arch.cpuid->basic.raw_fms, NULL, NULL)) >= 0x10 &&
-             x86_fam < 0x17 )
-        {
-            uint64_t msr_val;
-
-            if ( !rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) &&
-                 (msr_val & (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT)) )
-                *addr |= CF8_ADDR_HI(cf8);
-        }
     }
     else
     {
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index 54e0161b492c..3f3fb6403ccb 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -144,10 +144,6 @@ void stdvga_deinit(struct domain *d);
 
 extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
 
-/* Decode a PCI port IO access into a bus/slot/func/reg. */
-unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
-                                 pci_sbdf_t *sbdf);
-
 /*
  * HVM port IO handler that performs forwarding of guest IO ports into machine
  * IO ports.
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index f4a58c8acf13..3b814f4ebacf 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -3,10 +3,32 @@
 
 #include <xen/mm.h>
 
+/*
+ * PCI config space accesses with CF8/CFC:
+ *
+ * 1) Write {Enable | BDF | Reg} to CF8 to set an address
+ * 2) Read or write CF{C..F} to access the register
+ *
+ * For sub-dword register accesses, the bottom two register address bits come
+ * from the CF{C..F} address, not from CF8.
+ *
+ * AMD have extention to this protocol to access PCIe Extend Config Space by
+ * storing the 4 extra register address bits in the penultimate nibble of CF8.
+ * This extention:
+ *  - Is unconditionally active on Fam17h and later
+ *  - Has model specific enablement on Fam10h thru Fam16h
+ *  - Has reserved behaviour in all other cases, including other vendors
+ *
+ * For simplicity and because we are permitted to, given "reserved", Xen
+ * always treats ECS as active when emulating guest PCI config space accesses.
+ */
 #define CF8_BDF(cf8)     (  ((cf8) & 0x00ffff00) >> 8)
-#define CF8_ADDR_LO(cf8) (   (cf8) & 0x000000fc)
-#define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
 #define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
+#define CF8_REG(cf8)                                    \
+    ({                                                  \
+        unsigned int _c = cf8;                          \
+        ((_c & 0x0f000000) >> 16) | (_c & 0xfc);        \
+    })
 
 #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
                         || id == 0x01268086 || id == 0x01028086 \
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 5da00e24e4ff..008367195c78 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -245,19 +245,7 @@ static bool pci_cfg_ok(struct domain *currd, unsigned int start,
         if ( ro_map && test_bit(machine_bdf, ro_map) )
             return false;
     }
-    start |= CF8_ADDR_LO(currd->arch.pci_cf8);
-    /* AMD extended configuration space access? */
-    if ( CF8_ADDR_HI(currd->arch.pci_cf8) &&
-         boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
-         boot_cpu_data.x86 >= 0x10 && boot_cpu_data.x86 < 0x17 )
-    {
-        uint64_t msr_val;
-
-        if ( rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) )
-            return false;
-        if ( msr_val & (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT) )
-            start |= CF8_ADDR_HI(currd->arch.pci_cf8);
-    }
+    start |= CF8_REG(currd->arch.pci_cf8);
 
     return !write ?
            xsm_pci_config_permission(XSM_HOOK, currd, machine_bdf,
@@ -1104,6 +1092,11 @@ static int cf_check write_msr(
         if ( !is_hwdom_pinned_vcpu(curr) )
             return X86EMUL_OKAY;
         if ( (rdmsr_safe(MSR_AMD64_NB_CFG, temp) != 0) ||
+             /*
+              * TODO: this is broken.  What happens when dom0 is pinned but
+              * can't see the full system?  CF8_EXT probably ought to be a
+              * Xen-owned setting, and made symmetric across the system.
+              */
              ((val ^ temp) & ~(1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT)) )
             goto invalid;
         if ( wrmsr_safe(MSR_AMD64_NB_CFG, val) == 0 )
-- 
2.30.2


