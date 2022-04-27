Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13330511C6B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 18:39:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315289.533765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njkh8-0001ga-8A; Wed, 27 Apr 2022 16:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315289.533765; Wed, 27 Apr 2022 16:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njkh8-0001dA-2X; Wed, 27 Apr 2022 16:39:14 +0000
Received: by outflank-mailman (input) for mailman id 315289;
 Wed, 27 Apr 2022 16:39:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZpk=VF=citrix.com=prvs=1099d913e=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1njkh6-0001cZ-9m
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 16:39:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c96bbe0-c648-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 18:39:08 +0200 (CEST)
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
X-Inumbo-ID: 8c96bbe0-c648-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651077548;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/p2UboelgEPz6mmmRfIqiNgIybPrPv35J75BEdqaQow=;
  b=PFh8CNOQUMqvixa8Xl99BYB0szltTeH68faZyxm49HX6tBcfr3MciGHn
   a3PmjSJ63dZ9+HiKFkDz6boee9E9uivHOa2yra9z6mV9taldfyS0U1s1B
   /VVwJqwCMpbnxpmOR/A6giPr5SYuswnx0Dw0XeB+RICsHzT6JZmdRDNwj
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70082323
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:z32bGKsBBhGJgcVpbdGA+BsgpOfnVEJeMUV32f8akzHdYApBsoF/q
 tZmKW6BPfzeY2WjfYhwOYrn9BhT6J7cy4IxGVM/+ygxHiJA+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1/X5
 ouryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8mHfDPwPhFcSJgLCdVILRU2Y3fPESg5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yirCS/IvTp3ZXKzO4fdT3Ssqh9AIFvHbD
 yYcQWU3NESaOEcUUrsRILAfkOurg1jaSD0G9EKIvboO+XfN5iUkhdABN/KKI4fXFK25hH2wv
 mvb+0zpDxdcM8aQoRKc/3exw+PCgy7/cIQVErK+67htmlL77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVRAakqXSJuhodXdt4EOAg7gyJjK3O7G6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJHv57ISiqBrpWvlQy0EjUMP04wfTI4Ul5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdjj9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Lz6vdWNE/qQQ2d3XEy9hK0yT+Fb28GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510kPCxToi/Dq+PNYAmjn1NmOivpn8GWKJt9zq1zBhEfV8XZ
 P93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcuT8vhT6pLHPCT9Ye5caDOmN7lphIvZ8FS92
 4sObKOilkQAONASlwGKqOb/23hRdiNlbX03wuQKHtO+zv1ORT9xVqeNke9wE2Gn9owM/tr1E
 riGchcw4DLCabfvdW1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:S4gKx6l1D04gKJCXSqLKeqzhNNnpDfIg3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7Ar5OUtQ/+xoV5PhfZqxz/JICOoqTNKftWvdyQiVxehZhOOIqVDd8kXFh4lgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.90,293,1643691600"; 
   d="scan'208";a="70082323"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	<qemu-devel@nongnu.org>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] xen/pt: Avoid initializing BARs from the host ones
Date: Wed, 27 Apr 2022 17:38:12 +0100
Message-ID: <20220427163812.2461718-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The BAR emulated register definition does not set emu_mask because it
varies depending on bar_flag.  If emu_mask is not set, then the BAR is
initialized based on the host value which causes the BAR to be initially
mapped at whatever value the host device was using. Although it does
eventually get mapped at the correct location, it causes unnecessary
mapping/unmappings.

To fix this, initialize a per-register emu_mask in XenPTReg from the
initial value in XenPTRegInfo and then let the register's init() function
set/modify the emu_mask if necessary. Update the code to use emu_mask
in XenPTReg consistently and rename the existing emu_mask in
XenPTRegInfo to emu_mask_init to help with refactoring.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 hw/xen/xen_pt.c             |   2 +-
 hw/xen/xen_pt.h             |   5 +-
 hw/xen/xen_pt_config_init.c | 221 ++++++++++++++++++------------------
 3 files changed, 115 insertions(+), 113 deletions(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 027190fa44..f0af1cfcec 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -327,7 +327,7 @@ static void xen_pt_pci_write_config(PCIDevice *d, uint32_t addr,
             uint32_t real_offset = reg_grp_entry->base_offset + reg->offset;
             uint32_t valid_mask = 0xFFFFFFFF >> ((4 - emul_len) << 3);
             uint8_t *ptr_val = NULL;
-            uint32_t wp_mask = reg->emu_mask | reg->ro_mask;
+            uint32_t wp_mask = reg_entry->emu_mask | reg->ro_mask;
 
             valid_mask <<= (find_addr - real_offset) << 3;
             ptr_val = (uint8_t *)&val + (real_offset & 3);
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 6b8e13cdee..dbb917a46c 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -46,7 +46,7 @@ void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
 
 /* function type for config reg */
 typedef int (*xen_pt_conf_reg_init)
-    (XenPCIPassthroughState *, XenPTRegInfo *, uint32_t real_offset,
+    (XenPCIPassthroughState *, XenPTReg *, uint32_t real_offset,
      uint32_t *data);
 typedef int (*xen_pt_conf_dword_write)
     (XenPCIPassthroughState *, XenPTReg *cfg_entry,
@@ -117,7 +117,7 @@ struct XenPTRegInfo {
     /* reg read/write-1-clear field mask (ON:RW1C/RW1CS, OFF:other) */
     uint32_t rw1c_mask;
     /* reg emulate field mask (ON:emu, OFF:passthrough) */
-    uint32_t emu_mask;
+    uint32_t emu_mask_init;
     xen_pt_conf_reg_init init;
     /* read/write function pointer
      * for double_word/word/byte size */
@@ -146,6 +146,7 @@ struct XenPTReg {
         uint16_t *half_word;
         uint32_t *word;
     } ptr; /* pointer to dev.config. */
+    uint32_t emu_mask;
 };
 
 typedef const struct XenPTRegGroupInfo XenPTRegGroupInfo;
diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index c5c4e943a8..2a934494ed 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -25,7 +25,7 @@
 
 /* prototype */
 
-static int xen_pt_ptr_reg_init(XenPCIPassthroughState *s, XenPTRegInfo *reg,
+static int xen_pt_ptr_reg_init(XenPCIPassthroughState *s, XenPTReg *reg_entry,
                                uint32_t real_offset, uint32_t *data);
 
 
@@ -98,9 +98,10 @@ XenPTReg *xen_pt_find_reg(XenPTRegGroup *reg_grp, uint32_t address)
 }
 
 static uint32_t get_throughable_mask(const XenPCIPassthroughState *s,
-                                     XenPTRegInfo *reg, uint32_t valid_mask)
+                                     XenPTReg *reg_entry, uint32_t valid_mask)
 {
-    uint32_t throughable_mask = ~(reg->emu_mask | reg->ro_mask);
+    XenPTRegInfo *reg = reg_entry->reg;
+    uint32_t throughable_mask = ~(reg_entry->emu_mask | reg->ro_mask);
 
     if (!s->permissive) {
         throughable_mask &= ~reg->res_mask;
@@ -116,10 +117,10 @@ static uint32_t get_throughable_mask(const XenPCIPassthroughState *s,
 /* register initialization function */
 
 static int xen_pt_common_reg_init(XenPCIPassthroughState *s,
-                                  XenPTRegInfo *reg, uint32_t real_offset,
+                                  XenPTReg *reg_entry, uint32_t real_offset,
                                   uint32_t *data)
 {
-    *data = reg->init_val;
+    *data = reg_entry->reg->init_val;
     return 0;
 }
 
@@ -128,12 +129,11 @@ static int xen_pt_common_reg_init(XenPCIPassthroughState *s,
 static int xen_pt_byte_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
                                 uint8_t *value, uint8_t valid_mask)
 {
-    XenPTRegInfo *reg = cfg_entry->reg;
     uint8_t valid_emu_mask = 0;
     uint8_t *data = cfg_entry->ptr.byte;
 
     /* emulate byte register */
-    valid_emu_mask = reg->emu_mask & valid_mask;
+    valid_emu_mask = cfg_entry->emu_mask & valid_mask;
     *value = XEN_PT_MERGE_VALUE(*value, *data, ~valid_emu_mask);
 
     return 0;
@@ -141,12 +141,11 @@ static int xen_pt_byte_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
 static int xen_pt_word_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
                                 uint16_t *value, uint16_t valid_mask)
 {
-    XenPTRegInfo *reg = cfg_entry->reg;
     uint16_t valid_emu_mask = 0;
     uint16_t *data = cfg_entry->ptr.half_word;
 
     /* emulate word register */
-    valid_emu_mask = reg->emu_mask & valid_mask;
+    valid_emu_mask = cfg_entry->emu_mask & valid_mask;
     *value = XEN_PT_MERGE_VALUE(*value, *data, ~valid_emu_mask);
 
     return 0;
@@ -154,12 +153,11 @@ static int xen_pt_word_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
 static int xen_pt_long_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
                                 uint32_t *value, uint32_t valid_mask)
 {
-    XenPTRegInfo *reg = cfg_entry->reg;
     uint32_t valid_emu_mask = 0;
     uint32_t *data = cfg_entry->ptr.word;
 
     /* emulate long register */
-    valid_emu_mask = reg->emu_mask & valid_mask;
+    valid_emu_mask = cfg_entry->emu_mask & valid_mask;
     *value = XEN_PT_MERGE_VALUE(*value, *data, ~valid_emu_mask);
 
     return 0;
@@ -173,11 +171,11 @@ static int xen_pt_byte_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
 {
     XenPTRegInfo *reg = cfg_entry->reg;
     uint8_t writable_mask = 0;
-    uint8_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
+    uint8_t throughable_mask = get_throughable_mask(s, cfg_entry, valid_mask);
     uint8_t *data = cfg_entry->ptr.byte;
 
     /* modify emulate register */
-    writable_mask = reg->emu_mask & ~reg->ro_mask & valid_mask;
+    writable_mask = cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;
     *data = XEN_PT_MERGE_VALUE(*val, *data, writable_mask);
 
     /* create value for writing to I/O device register */
@@ -192,11 +190,11 @@ static int xen_pt_word_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
 {
     XenPTRegInfo *reg = cfg_entry->reg;
     uint16_t writable_mask = 0;
-    uint16_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
+    uint16_t throughable_mask = get_throughable_mask(s, cfg_entry, valid_mask);
     uint16_t *data = cfg_entry->ptr.half_word;
 
     /* modify emulate register */
-    writable_mask = reg->emu_mask & ~reg->ro_mask & valid_mask;
+    writable_mask = cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;
     *data = XEN_PT_MERGE_VALUE(*val, *data, writable_mask);
 
     /* create value for writing to I/O device register */
@@ -211,11 +209,11 @@ static int xen_pt_long_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
 {
     XenPTRegInfo *reg = cfg_entry->reg;
     uint32_t writable_mask = 0;
-    uint32_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
+    uint32_t throughable_mask = get_throughable_mask(s, cfg_entry, valid_mask);
     uint32_t *data = cfg_entry->ptr.word;
 
     /* modify emulate register */
-    writable_mask = reg->emu_mask & ~reg->ro_mask & valid_mask;
+    writable_mask = cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;
     *data = XEN_PT_MERGE_VALUE(*val, *data, writable_mask);
 
     /* create value for writing to I/O device register */
@@ -229,7 +227,7 @@ static int xen_pt_long_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
 /* XenPTRegInfo declaration
  * - only for emulated register (either a part or whole bit).
  * - for passthrough register that need special behavior (like interacting with
- *   other component), set emu_mask to all 0 and specify r/w func properly.
+ *   other component), set emu_mask_init to all 0 and specify r/w func properly.
  * - do NOT use ALL F for init_val, otherwise the tbl will not be registered.
  */
 
@@ -238,21 +236,21 @@ static int xen_pt_long_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
  */
 
 static int xen_pt_vendor_reg_init(XenPCIPassthroughState *s,
-                                  XenPTRegInfo *reg, uint32_t real_offset,
+                                  XenPTReg *reg_entry, uint32_t real_offset,
                                   uint32_t *data)
 {
     *data = s->real_device.vendor_id;
     return 0;
 }
 static int xen_pt_device_reg_init(XenPCIPassthroughState *s,
-                                  XenPTRegInfo *reg, uint32_t real_offset,
+                                  XenPTReg *reg_entry, uint32_t real_offset,
                                   uint32_t *data)
 {
     *data = s->real_device.device_id;
     return 0;
 }
 static int xen_pt_status_reg_init(XenPCIPassthroughState *s,
-                                  XenPTRegInfo *reg, uint32_t real_offset,
+                                  XenPTReg *unused, uint32_t real_offset,
                                   uint32_t *data)
 {
     XenPTRegGroup *reg_grp_entry = NULL;
@@ -287,17 +285,17 @@ static int xen_pt_status_reg_init(XenPCIPassthroughState *s,
     return 0;
 }
 static int xen_pt_header_type_reg_init(XenPCIPassthroughState *s,
-                                       XenPTRegInfo *reg, uint32_t real_offset,
-                                       uint32_t *data)
+                                       XenPTReg *reg_entry,
+                                       uint32_t real_offset, uint32_t *data)
 {
     /* read PCI_HEADER_TYPE */
-    *data = reg->init_val | 0x80;
+    *data = reg_entry->reg->init_val | 0x80;
     return 0;
 }
 
 /* initialize Interrupt Pin register */
 static int xen_pt_irqpin_reg_init(XenPCIPassthroughState *s,
-                                  XenPTRegInfo *reg, uint32_t real_offset,
+                                  XenPTReg *reg_entry, uint32_t real_offset,
                                   uint32_t *data)
 {
     if (s->real_device.irq) {
@@ -313,7 +311,7 @@ static int xen_pt_cmd_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
 {
     XenPTRegInfo *reg = cfg_entry->reg;
     uint16_t writable_mask = 0;
-    uint16_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
+    uint16_t throughable_mask = get_throughable_mask(s, cfg_entry, valid_mask);
     uint16_t *data = cfg_entry->ptr.half_word;
 
     /* modify emulate register */
@@ -405,13 +403,13 @@ static inline uint32_t base_address_with_flags(XenHostPCIIORegion *hr)
     }
 }
 
-static int xen_pt_bar_reg_init(XenPCIPassthroughState *s, XenPTRegInfo *reg,
+static int xen_pt_bar_reg_init(XenPCIPassthroughState *s, XenPTReg *reg_entry,
                                uint32_t real_offset, uint32_t *data)
 {
     uint32_t reg_field = 0;
     int index;
 
-    index = xen_pt_bar_offset_to_index(reg->offset);
+    index = xen_pt_bar_offset_to_index(reg_entry->reg->offset);
     if (index < 0 || index >= PCI_NUM_REGIONS) {
         XEN_PT_ERR(&s->dev, "Internal error: Invalid BAR index [%d].\n", index);
         return -1;
@@ -423,6 +421,21 @@ static int xen_pt_bar_reg_init(XenPCIPassthroughState *s, XenPTRegInfo *reg,
         reg_field = XEN_PT_INVALID_REG;
     }
 
+     /* set emulate mask depend on BAR flag */
+     switch (s->bases[index].bar_flag) {
+     case XEN_PT_BAR_FLAG_MEM:
+         reg_entry->emu_mask = XEN_PT_BAR_MEM_EMU_MASK;
+         break;
+     case XEN_PT_BAR_FLAG_IO:
+         reg_entry->emu_mask = XEN_PT_BAR_IO_EMU_MASK;
+         break;
+     case XEN_PT_BAR_FLAG_UPPER:
+         reg_entry->emu_mask = XEN_PT_BAR_ALLF;
+         break;
+     default:
+         break;
+    }
+
     *data = reg_field;
     return 0;
 }
@@ -431,7 +444,6 @@ static int xen_pt_bar_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
 {
     XenPTRegInfo *reg = cfg_entry->reg;
     uint32_t valid_emu_mask = 0;
-    uint32_t bar_emu_mask = 0;
     int index;
 
     /* get BAR index */
@@ -444,23 +456,8 @@ static int xen_pt_bar_reg_read(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
     /* use fixed-up value from kernel sysfs */
     *value = base_address_with_flags(&s->real_device.io_regions[index]);
 
-    /* set emulate mask depend on BAR flag */
-    switch (s->bases[index].bar_flag) {
-    case XEN_PT_BAR_FLAG_MEM:
-        bar_emu_mask = XEN_PT_BAR_MEM_EMU_MASK;
-        break;
-    case XEN_PT_BAR_FLAG_IO:
-        bar_emu_mask = XEN_PT_BAR_IO_EMU_MASK;
-        break;
-    case XEN_PT_BAR_FLAG_UPPER:
-        bar_emu_mask = XEN_PT_BAR_ALLF;
-        break;
-    default:
-        break;
-    }
-
     /* emulate BAR */
-    valid_emu_mask = bar_emu_mask & valid_mask;
+    valid_emu_mask = cfg_entry->emu_mask & valid_mask;
     *value = XEN_PT_MERGE_VALUE(*value, *cfg_entry->ptr.word, ~valid_emu_mask);
 
     return 0;
@@ -474,7 +471,6 @@ static int xen_pt_bar_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
     PCIDevice *d = PCI_DEVICE(s);
     const PCIIORegion *r;
     uint32_t writable_mask = 0;
-    uint32_t bar_emu_mask = 0;
     uint32_t bar_ro_mask = 0;
     uint32_t r_size = 0;
     int index = 0;
@@ -493,7 +489,6 @@ static int xen_pt_bar_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
     /* set emulate mask and read-only mask values depend on the BAR flag */
     switch (s->bases[index].bar_flag) {
     case XEN_PT_BAR_FLAG_MEM:
-        bar_emu_mask = XEN_PT_BAR_MEM_EMU_MASK;
         if (!r_size) {
             /* low 32 bits mask for 64 bit bars */
             bar_ro_mask = XEN_PT_BAR_ALLF;
@@ -502,13 +497,11 @@ static int xen_pt_bar_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
         }
         break;
     case XEN_PT_BAR_FLAG_IO:
-        bar_emu_mask = XEN_PT_BAR_IO_EMU_MASK;
         bar_ro_mask = XEN_PT_BAR_IO_RO_MASK | (r_size - 1);
         break;
     case XEN_PT_BAR_FLAG_UPPER:
         assert(index > 0);
         r_size = d->io_regions[index - 1].size >> 32;
-        bar_emu_mask = XEN_PT_BAR_ALLF;
         bar_ro_mask = r_size ? r_size - 1 : 0;
         break;
     default:
@@ -516,7 +509,7 @@ static int xen_pt_bar_reg_write(XenPCIPassthroughState *s, XenPTReg *cfg_entry,
     }
 
     /* modify emulate register */
-    writable_mask = bar_emu_mask & ~bar_ro_mask & valid_mask;
+    writable_mask = cfg_entry->emu_mask & ~bar_ro_mask & valid_mask;
     *data = XEN_PT_MERGE_VALUE(*val, *data, writable_mask);
 
     /* check whether we need to update the virtual region address or not */
@@ -547,7 +540,7 @@ static int xen_pt_exp_rom_bar_reg_write(XenPCIPassthroughState *s,
     XenPTRegion *base = NULL;
     PCIDevice *d = PCI_DEVICE(s);
     uint32_t writable_mask = 0;
-    uint32_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
+    uint32_t throughable_mask = get_throughable_mask(s, cfg_entry, valid_mask);
     pcibus_t r_size = 0;
     uint32_t bar_ro_mask = 0;
     uint32_t *data = cfg_entry->ptr.word;
@@ -594,7 +587,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] = {
         .size       = 2,
         .init_val   = 0x0000,
         .ro_mask    = 0xFFFF,
-        .emu_mask   = 0xFFFF,
+        .emu_mask_init = 0xFFFF,
         .init       = xen_pt_vendor_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_word_reg_write,
@@ -605,7 +598,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] = {
         .size       = 2,
         .init_val   = 0x0000,
         .ro_mask    = 0xFFFF,
-        .emu_mask   = 0xFFFF,
+        .emu_mask_init = 0xFFFF,
         .init       = xen_pt_device_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_word_reg_write,
@@ -616,7 +609,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] = {
         .size       = 2,
         .init_val   = 0x0000,
         .res_mask   = 0xF880,
-        .emu_mask   = 0x0743,
+        .emu_mask_init = 0x0743,
         .init       = xen_pt_common_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_cmd_reg_write,
@@ -627,7 +620,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] = {
         .size       = 1,
         .init_val   = 0x00,
         .ro_mask    = 0xFF,
-        .emu_mask   = 0xFF,
+        .emu_mask_init = 0xFF,
         .init       = xen_pt_ptr_reg_init,
         .u.b.read   = xen_pt_byte_reg_read,
         .u.b.write  = xen_pt_byte_reg_write,
@@ -643,7 +636,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] = {
         .res_mask   = 0x0007,
         .ro_mask    = 0x06F8,
         .rw1c_mask  = 0xF900,
-        .emu_mask   = 0x0010,
+        .emu_mask_init = 0x0010,
         .init       = xen_pt_status_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_word_reg_write,
@@ -654,7 +647,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] = {
         .size       = 1,
         .init_val   = 0x00,
         .ro_mask    = 0x00,
-        .emu_mask   = 0xFF,
+        .emu_mask_init = 0xFF,
         .init       = xen_pt_common_reg_init,
         .u.b.read   = xen_pt_byte_reg_read,
         .u.b.write  = xen_pt_byte_reg_write,
@@ -665,7 +658,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] = {
         .size       = 1,
         .init_val   = 0x00,
         .ro_mask    = 0x00,
-        .emu_mask   = 0xFF,
+        .emu_mask_init = 0xFF,
         .init       = xen_pt_common_reg_init,
         .u.b.read   = xen_pt_byte_reg_read,
         .u.b.write  = xen_pt_byte_reg_write,
@@ -676,7 +669,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] = {
         .size       = 1,
         .init_val   = 0x00,
         .ro_mask    = 0xFF,
-        .emu_mask   = 0x00,
+        .emu_mask_init = 0x00,
         .init       = xen_pt_header_type_reg_init,
         .u.b.read   = xen_pt_byte_reg_read,
         .u.b.write  = xen_pt_byte_reg_write,
@@ -687,7 +680,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] = {
         .size       = 1,
         .init_val   = 0x00,
         .ro_mask    = 0x00,
-        .emu_mask   = 0xFF,
+        .emu_mask_init = 0xFF,
         .init       = xen_pt_common_reg_init,
         .u.b.read   = xen_pt_byte_reg_read,
         .u.b.write  = xen_pt_byte_reg_write,
@@ -698,7 +691,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] = {
         .size       = 1,
         .init_val   = 0x00,
         .ro_mask    = 0xFF,
-        .emu_mask   = 0xFF,
+        .emu_mask_init = 0xFF,
         .init       = xen_pt_irqpin_reg_init,
         .u.b.read   = xen_pt_byte_reg_read,
         .u.b.write  = xen_pt_byte_reg_write,
@@ -764,7 +757,7 @@ static XenPTRegInfo xen_pt_emu_reg_header0[] = {
         .size       = 4,
         .init_val   = 0x00000000,
         .ro_mask    = ~PCI_ROM_ADDRESS_MASK & ~PCI_ROM_ADDRESS_ENABLE,
-        .emu_mask   = (uint32_t)PCI_ROM_ADDRESS_MASK,
+        .emu_mask_init = (uint32_t)PCI_ROM_ADDRESS_MASK,
         .init       = xen_pt_bar_reg_init,
         .u.dw.read  = xen_pt_long_reg_read,
         .u.dw.write = xen_pt_exp_rom_bar_reg_write,
@@ -786,7 +779,7 @@ static XenPTRegInfo xen_pt_emu_reg_vpd[] = {
         .size       = 1,
         .init_val   = 0x00,
         .ro_mask    = 0xFF,
-        .emu_mask   = 0xFF,
+        .emu_mask_init = 0xFF,
         .init       = xen_pt_ptr_reg_init,
         .u.b.read   = xen_pt_byte_reg_read,
         .u.b.write  = xen_pt_byte_reg_write,
@@ -795,7 +788,7 @@ static XenPTRegInfo xen_pt_emu_reg_vpd[] = {
         .offset     = PCI_VPD_ADDR,
         .size       = 2,
         .ro_mask    = 0x0003,
-        .emu_mask   = 0x0003,
+        .emu_mask_init = 0x0003,
         .init       = xen_pt_common_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_word_reg_write,
@@ -817,7 +810,7 @@ static XenPTRegInfo xen_pt_emu_reg_vendor[] = {
         .size       = 1,
         .init_val   = 0x00,
         .ro_mask    = 0xFF,
-        .emu_mask   = 0xFF,
+        .emu_mask_init = 0xFF,
         .init       = xen_pt_ptr_reg_init,
         .u.b.read   = xen_pt_byte_reg_read,
         .u.b.write  = xen_pt_byte_reg_write,
@@ -854,9 +847,10 @@ static inline uint8_t get_device_type(XenPCIPassthroughState *s,
 
 /* initialize Link Control register */
 static int xen_pt_linkctrl_reg_init(XenPCIPassthroughState *s,
-                                    XenPTRegInfo *reg, uint32_t real_offset,
+                                    XenPTReg *reg_entry, uint32_t real_offset,
                                     uint32_t *data)
 {
+    XenPTRegInfo *reg = reg_entry->reg;
     uint8_t cap_ver = get_capability_version(s, real_offset - reg->offset);
     uint8_t dev_type = get_device_type(s, real_offset - reg->offset);
 
@@ -872,9 +866,10 @@ static int xen_pt_linkctrl_reg_init(XenPCIPassthroughState *s,
 }
 /* initialize Device Control 2 register */
 static int xen_pt_devctrl2_reg_init(XenPCIPassthroughState *s,
-                                    XenPTRegInfo *reg, uint32_t real_offset,
+                                    XenPTReg *reg_entry, uint32_t real_offset,
                                     uint32_t *data)
 {
+    XenPTRegInfo *reg = reg_entry->reg;
     uint8_t cap_ver = get_capability_version(s, real_offset - reg->offset);
 
     /* no need to initialize in case of cap_ver 1.x */
@@ -887,9 +882,10 @@ static int xen_pt_devctrl2_reg_init(XenPCIPassthroughState *s,
 }
 /* initialize Link Control 2 register */
 static int xen_pt_linkctrl2_reg_init(XenPCIPassthroughState *s,
-                                     XenPTRegInfo *reg, uint32_t real_offset,
+                                     XenPTReg *reg_entry, uint32_t real_offset,
                                      uint32_t *data)
 {
+    XenPTRegInfo *reg = reg_entry->reg;
     uint8_t cap_ver = get_capability_version(s, real_offset - reg->offset);
     uint32_t reg_field = 0;
 
@@ -921,7 +917,7 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
         .size       = 1,
         .init_val   = 0x00,
         .ro_mask    = 0xFF,
-        .emu_mask   = 0xFF,
+        .emu_mask_init = 0xFF,
         .init       = xen_pt_ptr_reg_init,
         .u.b.read   = xen_pt_byte_reg_read,
         .u.b.write  = xen_pt_byte_reg_write,
@@ -932,7 +928,7 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
         .size       = 4,
         .init_val   = 0x00000000,
         .ro_mask    = 0xFFFFFFFF,
-        .emu_mask   = 0x10000000,
+        .emu_mask_init = 0x10000000,
         .init       = xen_pt_common_reg_init,
         .u.dw.read  = xen_pt_long_reg_read,
         .u.dw.write = xen_pt_long_reg_write,
@@ -943,7 +939,7 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
         .size       = 2,
         .init_val   = 0x2810,
         .ro_mask    = 0x8400,
-        .emu_mask   = 0xFFFF,
+        .emu_mask_init = 0xFFFF,
         .init       = xen_pt_common_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_word_reg_write,
@@ -965,7 +961,7 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
         .size       = 2,
         .init_val   = 0x0000,
         .ro_mask    = 0xFC34,
-        .emu_mask   = 0xFFFF,
+        .emu_mask_init = 0xFFFF,
         .init       = xen_pt_linkctrl_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_word_reg_write,
@@ -986,7 +982,7 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
         .size       = 2,
         .init_val   = 0x0000,
         .ro_mask    = 0xFFE0,
-        .emu_mask   = 0xFFFF,
+        .emu_mask_init = 0xFFFF,
         .init       = xen_pt_devctrl2_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_word_reg_write,
@@ -997,7 +993,7 @@ static XenPTRegInfo xen_pt_emu_reg_pcie[] = {
         .size       = 2,
         .init_val   = 0x0000,
         .ro_mask    = 0xE040,
-        .emu_mask   = 0xFFFF,
+        .emu_mask_init = 0xFFFF,
         .init       = xen_pt_linkctrl2_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_word_reg_write,
@@ -1020,7 +1016,7 @@ static XenPTRegInfo xen_pt_emu_reg_pm[] = {
         .size       = 1,
         .init_val   = 0x00,
         .ro_mask    = 0xFF,
-        .emu_mask   = 0xFF,
+        .emu_mask_init = 0xFF,
         .init       = xen_pt_ptr_reg_init,
         .u.b.read   = xen_pt_byte_reg_read,
         .u.b.write  = xen_pt_byte_reg_write,
@@ -1031,7 +1027,7 @@ static XenPTRegInfo xen_pt_emu_reg_pm[] = {
         .size       = 2,
         .init_val   = 0x0000,
         .ro_mask    = 0xFFFF,
-        .emu_mask   = 0xF9C8,
+        .emu_mask_init = 0xF9C8,
         .init       = xen_pt_common_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_word_reg_write,
@@ -1044,7 +1040,7 @@ static XenPTRegInfo xen_pt_emu_reg_pm[] = {
         .res_mask   = 0x00F0,
         .ro_mask    = 0x610C,
         .rw1c_mask  = 0x8000,
-        .emu_mask   = 0x810B,
+        .emu_mask_init = 0x810B,
         .init       = xen_pt_common_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_word_reg_write,
@@ -1066,7 +1062,7 @@ static XenPTRegInfo xen_pt_emu_reg_pm[] = {
 
 /* Message Control register */
 static int xen_pt_msgctrl_reg_init(XenPCIPassthroughState *s,
-                                   XenPTRegInfo *reg, uint32_t real_offset,
+                                   XenPTReg *reg_entry, uint32_t real_offset,
                                    uint32_t *data)
 {
     XenPTMSI *msi = s->msi;
@@ -1088,7 +1084,7 @@ static int xen_pt_msgctrl_reg_init(XenPCIPassthroughState *s,
     msi->initialized = false;
     msi->mapped = false;
 
-    *data = reg->init_val;
+    *data = reg_entry->reg->init_val;
     return 0;
 }
 static int xen_pt_msgctrl_reg_write(XenPCIPassthroughState *s,
@@ -1098,7 +1094,7 @@ static int xen_pt_msgctrl_reg_write(XenPCIPassthroughState *s,
     XenPTRegInfo *reg = cfg_entry->reg;
     XenPTMSI *msi = s->msi;
     uint16_t writable_mask = 0;
-    uint16_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
+    uint16_t throughable_mask = get_throughable_mask(s, cfg_entry, valid_mask);
     uint16_t *data = cfg_entry->ptr.half_word;
 
     /* Currently no support for multi-vector */
@@ -1107,7 +1103,7 @@ static int xen_pt_msgctrl_reg_write(XenPCIPassthroughState *s,
     }
 
     /* modify emulate register */
-    writable_mask = reg->emu_mask & ~reg->ro_mask & valid_mask;
+    writable_mask = cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;
     *data = XEN_PT_MERGE_VALUE(*val, *data, writable_mask);
     msi->flags |= *data & ~PCI_MSI_FLAGS_ENABLE;
 
@@ -1148,14 +1144,14 @@ static int xen_pt_msgctrl_reg_write(XenPCIPassthroughState *s,
 
 /* initialize Message Upper Address register */
 static int xen_pt_msgaddr64_reg_init(XenPCIPassthroughState *s,
-                                     XenPTRegInfo *reg, uint32_t real_offset,
+                                     XenPTReg *reg_entry, uint32_t real_offset,
                                      uint32_t *data)
 {
     /* no need to initialize in case of 32 bit type */
     if (!(s->msi->flags & PCI_MSI_FLAGS_64BIT)) {
         *data = XEN_PT_INVALID_REG;
     } else {
-        *data = reg->init_val;
+        *data = reg_entry->reg->init_val;
     }
 
     return 0;
@@ -1163,15 +1159,16 @@ static int xen_pt_msgaddr64_reg_init(XenPCIPassthroughState *s,
 /* this function will be called twice (for 32 bit and 64 bit type) */
 /* initialize Message Data register */
 static int xen_pt_msgdata_reg_init(XenPCIPassthroughState *s,
-                                   XenPTRegInfo *reg, uint32_t real_offset,
+                                   XenPTReg *reg_entry, uint32_t real_offset,
                                    uint32_t *data)
 {
+    XenPTRegInfo *reg = reg_entry->reg;
     uint32_t flags = s->msi->flags;
     uint32_t offset = reg->offset;
 
     /* check the offset whether matches the type or not */
     if (xen_pt_msi_check_type(offset, flags, DATA)) {
-        *data = reg->init_val;
+        *data = reg_entry->reg->init_val;
     } else {
         *data = XEN_PT_INVALID_REG;
     }
@@ -1181,9 +1178,10 @@ static int xen_pt_msgdata_reg_init(XenPCIPassthroughState *s,
 /* this function will be called twice (for 32 bit and 64 bit type) */
 /* initialize Mask register */
 static int xen_pt_mask_reg_init(XenPCIPassthroughState *s,
-                                XenPTRegInfo *reg, uint32_t real_offset,
+                                XenPTReg *reg_entry, uint32_t real_offset,
                                 uint32_t *data)
 {
+    XenPTRegInfo *reg = reg_entry->reg;
     uint32_t flags = s->msi->flags;
 
     /* check the offset whether matches the type or not */
@@ -1200,9 +1198,10 @@ static int xen_pt_mask_reg_init(XenPCIPassthroughState *s,
 /* this function will be called twice (for 32 bit and 64 bit type) */
 /* initialize Pending register */
 static int xen_pt_pending_reg_init(XenPCIPassthroughState *s,
-                                   XenPTRegInfo *reg, uint32_t real_offset,
+                                   XenPTReg *reg_entry, uint32_t real_offset,
                                    uint32_t *data)
 {
+    XenPTRegInfo *reg = reg_entry->reg;
     uint32_t flags = s->msi->flags;
 
     /* check the offset whether matches the type or not */
@@ -1227,7 +1226,7 @@ static int xen_pt_msgaddr32_reg_write(XenPCIPassthroughState *s,
     uint32_t *data = cfg_entry->ptr.word;
 
     /* modify emulate register */
-    writable_mask = reg->emu_mask & ~reg->ro_mask & valid_mask;
+    writable_mask = cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;
     *data = XEN_PT_MERGE_VALUE(*val, *data, writable_mask);
     s->msi->addr_lo = *data;
 
@@ -1261,7 +1260,7 @@ static int xen_pt_msgaddr64_reg_write(XenPCIPassthroughState *s,
     }
 
     /* modify emulate register */
-    writable_mask = reg->emu_mask & ~reg->ro_mask & valid_mask;
+    writable_mask = cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;
     *data = XEN_PT_MERGE_VALUE(*val, *data, writable_mask);
     /* update the msi_info too */
     s->msi->addr_hi = *data;
@@ -1301,7 +1300,7 @@ static int xen_pt_msgdata_reg_write(XenPCIPassthroughState *s,
     }
 
     /* modify emulate register */
-    writable_mask = reg->emu_mask & ~reg->ro_mask & valid_mask;
+    writable_mask = cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;
     *data = XEN_PT_MERGE_VALUE(*val, *data, writable_mask);
     /* update the msi_info too */
     msi->data = *data;
@@ -1343,7 +1342,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
         .size       = 1,
         .init_val   = 0x00,
         .ro_mask    = 0xFF,
-        .emu_mask   = 0xFF,
+        .emu_mask_init = 0xFF,
         .init       = xen_pt_ptr_reg_init,
         .u.b.read   = xen_pt_byte_reg_read,
         .u.b.write  = xen_pt_byte_reg_write,
@@ -1355,7 +1354,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
         .init_val   = 0x0000,
         .res_mask   = 0xFE00,
         .ro_mask    = 0x018E,
-        .emu_mask   = 0x017E,
+        .emu_mask_init = 0x017E,
         .init       = xen_pt_msgctrl_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_msgctrl_reg_write,
@@ -1366,7 +1365,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
         .size       = 4,
         .init_val   = 0x00000000,
         .ro_mask    = 0x00000003,
-        .emu_mask   = 0xFFFFFFFF,
+        .emu_mask_init = 0xFFFFFFFF,
         .init       = xen_pt_common_reg_init,
         .u.dw.read  = xen_pt_long_reg_read,
         .u.dw.write = xen_pt_msgaddr32_reg_write,
@@ -1377,7 +1376,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
         .size       = 4,
         .init_val   = 0x00000000,
         .ro_mask    = 0x00000000,
-        .emu_mask   = 0xFFFFFFFF,
+        .emu_mask_init = 0xFFFFFFFF,
         .init       = xen_pt_msgaddr64_reg_init,
         .u.dw.read  = xen_pt_long_reg_read,
         .u.dw.write = xen_pt_msgaddr64_reg_write,
@@ -1388,7 +1387,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
         .size       = 2,
         .init_val   = 0x0000,
         .ro_mask    = 0x0000,
-        .emu_mask   = 0xFFFF,
+        .emu_mask_init = 0xFFFF,
         .init       = xen_pt_msgdata_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_msgdata_reg_write,
@@ -1399,7 +1398,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
         .size       = 2,
         .init_val   = 0x0000,
         .ro_mask    = 0x0000,
-        .emu_mask   = 0xFFFF,
+        .emu_mask_init = 0xFFFF,
         .init       = xen_pt_msgdata_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_msgdata_reg_write,
@@ -1410,7 +1409,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
         .size       = 4,
         .init_val   = 0x00000000,
         .ro_mask    = 0xFFFFFFFF,
-        .emu_mask   = 0xFFFFFFFF,
+        .emu_mask_init = 0xFFFFFFFF,
         .init       = xen_pt_mask_reg_init,
         .u.dw.read  = xen_pt_long_reg_read,
         .u.dw.write = xen_pt_mask_reg_write,
@@ -1421,7 +1420,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
         .size       = 4,
         .init_val   = 0x00000000,
         .ro_mask    = 0xFFFFFFFF,
-        .emu_mask   = 0xFFFFFFFF,
+        .emu_mask_init = 0xFFFFFFFF,
         .init       = xen_pt_mask_reg_init,
         .u.dw.read  = xen_pt_long_reg_read,
         .u.dw.write = xen_pt_mask_reg_write,
@@ -1432,7 +1431,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
         .size       = 4,
         .init_val   = 0x00000000,
         .ro_mask    = 0xFFFFFFFF,
-        .emu_mask   = 0x00000000,
+        .emu_mask_init = 0x00000000,
         .init       = xen_pt_pending_reg_init,
         .u.dw.read  = xen_pt_long_reg_read,
         .u.dw.write = xen_pt_long_reg_write,
@@ -1443,7 +1442,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
         .size       = 4,
         .init_val   = 0x00000000,
         .ro_mask    = 0xFFFFFFFF,
-        .emu_mask   = 0x00000000,
+        .emu_mask_init = 0x00000000,
         .init       = xen_pt_pending_reg_init,
         .u.dw.read  = xen_pt_long_reg_read,
         .u.dw.write = xen_pt_long_reg_write,
@@ -1460,7 +1459,7 @@ static XenPTRegInfo xen_pt_emu_reg_msi[] = {
 
 /* Message Control register for MSI-X */
 static int xen_pt_msixctrl_reg_init(XenPCIPassthroughState *s,
-                                    XenPTRegInfo *reg, uint32_t real_offset,
+                                    XenPTReg *reg_entry, uint32_t real_offset,
                                     uint32_t *data)
 {
     uint16_t reg_field;
@@ -1479,7 +1478,7 @@ static int xen_pt_msixctrl_reg_init(XenPCIPassthroughState *s,
 
     s->msix->ctrl_offset = real_offset;
 
-    *data = reg->init_val;
+    *data = reg_entry->reg->init_val;
     return 0;
 }
 static int xen_pt_msixctrl_reg_write(XenPCIPassthroughState *s,
@@ -1488,12 +1487,12 @@ static int xen_pt_msixctrl_reg_write(XenPCIPassthroughState *s,
 {
     XenPTRegInfo *reg = cfg_entry->reg;
     uint16_t writable_mask = 0;
-    uint16_t throughable_mask = get_throughable_mask(s, reg, valid_mask);
+    uint16_t throughable_mask = get_throughable_mask(s, cfg_entry, valid_mask);
     int debug_msix_enabled_old;
     uint16_t *data = cfg_entry->ptr.half_word;
 
     /* modify emulate register */
-    writable_mask = reg->emu_mask & ~reg->ro_mask & valid_mask;
+    writable_mask = cfg_entry->emu_mask & ~reg->ro_mask & valid_mask;
     *data = XEN_PT_MERGE_VALUE(*val, *data, writable_mask);
 
     /* create value for writing to I/O device register */
@@ -1527,7 +1526,7 @@ static XenPTRegInfo xen_pt_emu_reg_msix[] = {
         .size       = 1,
         .init_val   = 0x00,
         .ro_mask    = 0xFF,
-        .emu_mask   = 0xFF,
+        .emu_mask_init = 0xFF,
         .init       = xen_pt_ptr_reg_init,
         .u.b.read   = xen_pt_byte_reg_read,
         .u.b.write  = xen_pt_byte_reg_write,
@@ -1539,7 +1538,7 @@ static XenPTRegInfo xen_pt_emu_reg_msix[] = {
         .init_val   = 0x0000,
         .res_mask   = 0x3800,
         .ro_mask    = 0x07FF,
-        .emu_mask   = 0x0000,
+        .emu_mask_init = 0x0000,
         .init       = xen_pt_msixctrl_reg_init,
         .u.w.read   = xen_pt_word_reg_read,
         .u.w.write  = xen_pt_msixctrl_reg_write,
@@ -1555,7 +1554,7 @@ static XenPTRegInfo xen_pt_emu_reg_igd_opregion[] = {
         .offset     = 0x0,
         .size       = 4,
         .init_val   = 0,
-        .emu_mask   = 0xFFFFFFFF,
+        .emu_mask_init = 0xFFFFFFFF,
         .u.dw.read   = xen_pt_intel_opregion_read,
         .u.dw.write  = xen_pt_intel_opregion_write,
     },
@@ -1817,7 +1816,7 @@ static const XenPTRegGroupInfo xen_pt_emu_reg_grps[] = {
 
 /* initialize Capabilities Pointer or Next Pointer register */
 static int xen_pt_ptr_reg_init(XenPCIPassthroughState *s,
-                               XenPTRegInfo *reg, uint32_t real_offset,
+                               XenPTReg *reg_entry, uint32_t real_offset,
                                uint32_t *data)
 {
     int i, rc;
@@ -1926,8 +1925,10 @@ static void xen_pt_config_reg_init(XenPCIPassthroughState *s,
         unsigned int offset;
         uint32_t val;
 
+        reg_entry->emu_mask = reg->emu_mask_init;
+
         /* initialize emulate register */
-        rc = reg->init(s, reg_entry->reg,
+        rc = reg->init(s, reg_entry,
                        reg_grp->base_offset + reg->offset, &data);
         if (rc < 0) {
             g_free(reg_entry);
@@ -1961,7 +1962,7 @@ static void xen_pt_config_reg_init(XenPCIPassthroughState *s,
         /* Set bits in emu_mask are the ones we emulate. The dev.config shall
          * contain the emulated view of the guest - therefore we flip the mask
          * to mask out the host values (which dev.config initially has) . */
-        host_mask = size_mask & ~reg->emu_mask;
+        host_mask = size_mask & ~reg_entry->emu_mask;
 
         if ((data & host_mask) != (val & host_mask)) {
             uint32_t new_val;
-- 
2.31.1


