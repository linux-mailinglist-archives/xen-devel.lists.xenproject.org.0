Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A40F1590410
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384772.620227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBCQ-0001ft-Uo; Thu, 11 Aug 2022 16:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384772.620227; Thu, 11 Aug 2022 16:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBCQ-0001de-RD; Thu, 11 Aug 2022 16:38:22 +0000
Received: by outflank-mailman (input) for mailman id 384772;
 Thu, 11 Aug 2022 16:38:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3/DV=YP=citrix.com=prvs=21511e084=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oMBCO-0001dY-Jy
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:38:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffba500d-1993-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:38:18 +0200 (CEST)
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
X-Inumbo-ID: ffba500d-1993-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660235898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kp/FFSGBrMwArRAvwpptXuvWXmao2G9uW1WtdIfd8cQ=;
  b=ZOau6wudNLUUrgGytgM3VJ7rJjCkInWHLxGk2plO9DIxv8l3SItBzPcq
   Ay7o/0b+jWT69hUNtJV87pwx98rgCV3guFhVCYG0JsWEYG4/AJIcdDe/f
   w5VZiMaUF9z4uUTBA5Cc3fbP+XLNJtLaVtlArF0r9SOfg+FiYZlM8CMiq
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80448010
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iphXnq32KEkEzBjGuPbD5b1xkn2cJEfYwER7XKvMYLTBsI5bpzAOx
 zAcDzvSb/qIMWWjL9F/PoS28kIPuZ7dn4VnGwdqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQTNNwJcaDpOsfrT8Uo35pwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6/pDIUY4GM4RwKVYBXpr/
 9seKQsQXjnW0opawJrjIgVtrsEqLc2tN4IDoHBwizreCJ7KQ7iaHf+Mv4UBmm5t2IYeRp4yZ
 OJAAdZrRD3GbwdCJRE8D5Umkf3zrnL+bydZuBSeoq9fD237nFQtjOi1aYK9ltqiTt5PxECg9
 2D/4238BE1KF9qTz2GAyyf57gPItXyiA99DfFGizdZ1hHWDy2pVDwcZPXOZi/Skjk+1W/pEN
 lcZvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpWaZF+a+JLXpAnxFiwOCGUlYy4/UDsstoyLTJ4Isv7fcjpyOPfr0IWtSG6pm
 m7iQDsW3OtK05NSv0mv1RWe2m/3+MCUJuIgzl+PNl9J+D+Vc2JMi2aAzVHApchNI4+CJrVql
 ChVwpPOhAzi4HzkqcBsfAnuNOvwjxp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGN4VsOvMYCbCbwN8ebhr5d7Ox0pZUM6Py/DqyEBjawSsEZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGfuR4YIhIf0+lFKeGrZCuYLHMwhkmgs/s7inkEn8uVdfDVbJIYo43KymMrllsP/Z+1WJq
 r6y9aKikn1ibQE3WQGPmaZ7ELzABSFT6UzewyCPStO+Hw==
IronPort-HdrOrdr: A9a23:mfZHeal/hc6NIMnLUb+74mf9olrpDfIW3DAbv31ZSRFFG/Fxl6
 iV/cjzsiWE8Ar5OUtQ4OxoV5PwIk80maQb3WBVB8bHYOCEghrPEGgB1/qB/9SIIUSXnYQxuZ
 uIMZIOb+EYZWIK9voSizPZLz9P+re6GdiT9ILj80s=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="80448010"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/msi: Switch msi_info to using pci_sbdf_t
Date: Thu, 11 Aug 2022 17:37:40 +0100
Message-ID: <20220811163740.31494-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
References: <5379b4bb-76c9-d7be-4bd7-2f75dde470a8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This reorders the fields in msi_info, but removes all the under-the-hood
parameter shuffling required to call pci_get_pdev().

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/vmsi.c        |  4 +---
 xen/arch/x86/include/asm/msi.h |  4 +---
 xen/arch/x86/irq.c             |  2 +-
 xen/arch/x86/msi.c             |  4 ++--
 xen/arch/x86/physdev.c         | 10 +++++-----
 xen/drivers/char/ns16550.c     |  4 ++--
 xen/xsm/flask/hooks.c          |  2 +-
 7 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 198fbd67084b..75f92885dc5e 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -750,9 +750,7 @@ static int vpci_msi_enable(const struct pci_dev *pdev, unsigned int nr,
                            paddr_t table_base)
 {
     struct msi_info msi_info = {
-        .seg = pdev->seg,
-        .bus = pdev->bus,
-        .devfn = pdev->devfn,
+        .sbdf = pdev->sbdf,
         .table_base = table_base,
         .entry_nr = nr,
     };
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 117379318f2c..fe670895eed2 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -59,9 +59,7 @@
 #define FIX_MSIX_MAX_PAGES              512
 
 struct msi_info {
-    u16 seg;
-    u8 bus;
-    u8 devfn;
+    pci_sbdf_t sbdf;
     int irq;
     int entry_nr;
     uint64_t table_base;
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index bf8b52d1114e..cd0c8a30a864 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2162,7 +2162,7 @@ int map_domain_pirq(
         if ( !cpu_has_apic )
             goto done;
 
-        pdev = pci_get_pdev(d, PCI_SBDF(msi->seg, msi->bus, msi->devfn));
+        pdev = pci_get_pdev(d, msi->sbdf);
         if ( !pdev )
             goto done;
 
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 62c4fbcfbe55..d0bf63df1def 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -1001,7 +1001,7 @@ static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
     struct msi_desc *old_desc;
 
     ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev(NULL, PCI_SBDF(msi->seg, msi->bus, msi->devfn));
+    pdev = pci_get_pdev(NULL, msi->sbdf);
     if ( !pdev )
         return -ENODEV;
 
@@ -1056,7 +1056,7 @@ static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
     struct msi_desc *old_desc;
 
     ASSERT(pcidevs_locked());
-    pdev = pci_get_pdev(NULL, PCI_SBDF(msi->seg, msi->bus, msi->devfn));
+    pdev = pci_get_pdev(NULL, msi->sbdf);
     if ( !pdev || !pdev->msix )
         return -ENODEV;
 
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 3a50d9d0c969..2f1d955a96bd 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -312,21 +312,21 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         {
         case MAP_PIRQ_TYPE_MSI_SEG:
             map.type = MAP_PIRQ_TYPE_MSI;
-            msi.seg = map.bus >> 16;
+            msi.sbdf.seg = map.bus >> 16;
             break;
 
         case MAP_PIRQ_TYPE_MULTI_MSI:
             if ( map.table_base )
                 return -EINVAL;
-            msi.seg = map.bus >> 16;
+            msi.sbdf.seg = map.bus >> 16;
             break;
 
         default:
-            msi.seg = 0;
+            msi.sbdf.seg = 0;
             break;
         }
-        msi.bus = map.bus;
-        msi.devfn = map.devfn;
+        msi.sbdf.bus = map.bus;
+        msi.sbdf.devfn = map.devfn;
         msi.entry_nr = map.entry_nr;
         msi.table_base = map.table_base;
         ret = physdev_map_pirq(map.domid, map.type, &map.index, &map.pirq,
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index cd3573e43df3..01a05c9aa859 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -435,8 +435,8 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
         if ( uart->msi )
         {
             struct msi_info msi = {
-                .bus = uart->ps_bdf[0],
-                .devfn = PCI_DEVFN(uart->ps_bdf[1], uart->ps_bdf[2]),
+                .sbdf = PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
+                                 uart->ps_bdf[2]),
                 .irq = rc = uart->irq,
                 .entry_nr = 1
             };
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 8c9cd0f2972d..8bd56644efe4 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -918,7 +918,7 @@ static int flask_map_domain_msi (
 {
 #ifdef CONFIG_HAS_PCI_MSI
     const struct msi_info *msi = data;
-    uint32_t machine_bdf = (msi->seg << 16) | (msi->bus << 8) | msi->devfn;
+    uint32_t machine_bdf = msi->sbdf.sbdf;
 
     AVC_AUDIT_DATA_INIT(ad, DEV);
     ad->device = machine_bdf;
-- 
2.11.0


