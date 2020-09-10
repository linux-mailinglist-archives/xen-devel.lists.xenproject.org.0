Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FDB264716
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 15:36:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGMjU-0006wN-PL; Thu, 10 Sep 2020 13:35:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vjA=CT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kGMjT-0006wI-U9
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 13:35:23 +0000
X-Inumbo-ID: 1c0c1d7f-88c2-4759-9406-9a4a5c13d924
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c0c1d7f-88c2-4759-9406-9a4a5c13d924;
 Thu, 10 Sep 2020 13:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599744922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9awEH7zfpQPKLAiq2CDGeFrVET+HpGVwUGz624ZxGZ0=;
 b=KMstXldixPmtJgiES2ZnQrOzNuLDzjib1Hkmt2qBEt2Wtch9q1JndGGo
 dBCAPx7RE65C928w5taQLRWlJpCUlDx7zNUQsfv+PxgbnIHrxOFsOo2b0
 9fUJ/P1N9V9JJLIvn7nNvhrVCsOaCysyGaGmOn/dPYX254s9JV45LETth E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PbMZBLudUnvZjwcUet/YrBJMWxjj0t8L2abuoHMAUGSY8733rtpzSS6VkGq0UiBtZIrRkofX9o
 OvN46qQkQR6KvUhKKBlHrrz569Vx7GTLZ02uuoMUrGPiTkIbBT3FTobgOuQkf4cMdOx6/eYpNk
 /02eb6hiqfoxoTlu3s6EDv5/RjURQHI+xgEua7gMudRggH3Hx0gZOLhPZAMbv0PqFU/u+YcJTg
 ZfViPUZh/T3lTJA65u+POgxPz0tljLwim+tsw/+YL7lXg1KLJ8hlkNVXec/Y3rcrncnVDi3wSI
 n4o=
X-SBRS: 2.7
X-MesageID: 27375231
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,413,1592884800"; d="scan'208";a="27375231"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
 <paul@xen.org>
Subject: [PATCH] x86/mm: do not mark IO regions as Xen heap
Date: Thu, 10 Sep 2020 15:35:14 +0200
Message-ID: <20200910133514.82155-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

arch_init_memory will treat all the gaps on the physical memory map
between RAM regions as MMIO and use share_xen_page_with_guest in order
to assign them to dom_io. This has the side effect of setting the Xen
heap flag on such pages, and thus is_special_page would then return
true which is an issue in epte_get_entry_emt because such pages will
be forced to use write-back cache attributes.

Fix this by introducing a new helper to assign the MMIO regions to
dom_io without setting the Xen heap flag on the pages, so that
is_special_page will return false and the pages won't be forced to use
write-back cache attributes.

Fixes: 81fd0d3ca4b2cd ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Paul Durrant <paul@xen.org>
---
 xen/arch/x86/mm.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 35ec0e11f6..4daf4e038a 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -271,6 +271,18 @@ static l4_pgentry_t __read_mostly split_l4e;
 #define root_pgt_pv_xen_slots ROOT_PAGETABLE_PV_XEN_SLOTS
 #endif
 
+static void __init assign_io_page(struct page_info *page)
+{
+    set_gpfn_from_mfn(mfn_x(page_to_mfn(page)), INVALID_M2P_ENTRY);
+
+    /* The incremented type count pins as writable. */
+    page->u.inuse.type_info = PGT_writable_page | PGT_validated | 1;
+
+    page_set_owner(page, dom_io);
+
+    page->count_info |= PGC_allocated | 1;
+}
+
 void __init arch_init_memory(void)
 {
     unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn;
@@ -291,7 +303,7 @@ void __init arch_init_memory(void)
      */
     BUG_ON(pvh_boot && trampoline_phys != 0x1000);
     for ( i = 0; i < 0x100; i++ )
-        share_xen_page_with_guest(mfn_to_page(_mfn(i)), dom_io, SHARE_rw);
+        assign_io_page(mfn_to_page(_mfn(i)));
 
     /* Any areas not specified as RAM by the e820 map are considered I/O. */
     for ( i = 0, pfn = 0; pfn < max_page; i++ )
@@ -332,7 +344,7 @@ void __init arch_init_memory(void)
             if ( !mfn_valid(_mfn(pfn)) )
                 continue;
 
-            share_xen_page_with_guest(mfn_to_page(_mfn(pfn)), dom_io, SHARE_rw);
+            assign_io_page(mfn_to_page(_mfn(pfn)));
         }
 
         /* Skip the RAM region. */
-- 
2.28.0


