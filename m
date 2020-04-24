Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68EE1B7834
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:20:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRzBm-0005FM-PX; Fri, 24 Apr 2020 14:20:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRzBl-0005F3-PO
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:20:21 +0000
X-Inumbo-ID: b4c74f4a-8636-11ea-94b3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4c74f4a-8636-11ea-94b3-12813bfff9fa;
 Fri, 24 Apr 2020 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j6haYfYul3hln7GE8AxrUee2uyGJwIwRiYNu/Xr2Q+o=; b=LRZNLjPf6lK2q6BoGoT2L5LM2p
 345gz94VwTNpsaI178Fc1uyE+zfRnNnNxb9xCjfiIGw53UxXgM2FAhHZzfBvcfpRZkVWTOTBy0p5x
 aV16XGyd7D3JCD2zEVwBsXJxlAvFie2V/iubLiaQLlveMNLGt/RAfo70aPP6B/ZWEDHI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRzBa-0001xL-DP; Fri, 24 Apr 2020 14:20:10 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRz1J-0001fN-EK; Fri, 24 Apr 2020 14:09:33 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 10/15] efi: switch to new APIs in EFI code
Date: Fri, 24 Apr 2020 15:09:01 +0100
Message-Id: <f5fba4470f6d0a6a62e9e2139d6ef260a5c901f9.1587735799.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/efi/runtime.h | 10 +++++++--
 xen/common/efi/boot.c      | 46 ++++++++++++++++++++++++++------------
 xen/common/efi/efi.h       |  3 ++-
 xen/common/efi/runtime.c   |  8 +++----
 4 files changed, 46 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/efi/runtime.h b/xen/arch/x86/efi/runtime.h
index d9eb8f5c27..d2483645c6 100644
--- a/xen/arch/x86/efi/runtime.h
+++ b/xen/arch/x86/efi/runtime.h
@@ -1,12 +1,18 @@
+#include <xen/domain_page.h>
+#include <xen/mm.h>
 #include <asm/atomic.h>
 #include <asm/mc146818rtc.h>
 
 #ifndef COMPAT
-l4_pgentry_t *__read_mostly efi_l4_pgtable;
+mfn_t __read_mostly efi_l4_mfn = INVALID_MFN_INITIALIZER;
 
 void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e)
 {
-    if ( efi_l4_pgtable )
+    if ( !mfn_eq(efi_l4_mfn, INVALID_MFN) )
+    {
+        l4_pgentry_t *efi_l4_pgtable = map_domain_page(efi_l4_mfn);
         l4e_write(efi_l4_pgtable + l4idx, l4e);
+        unmap_domain_page(efi_l4_pgtable);
+    }
 }
 #endif
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 8e96ef8de2..715217d2a9 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -6,6 +6,7 @@
 #include <xen/compile.h>
 #include <xen/ctype.h>
 #include <xen/dmi.h>
+#include <xen/domain_page.h>
 #include <xen/init.h>
 #include <xen/keyhandler.h>
 #include <xen/lib.h>
@@ -1442,6 +1443,7 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
                                                  unsigned long emfn))
 {
     unsigned long next;
+    l4_pgentry_t *efi_l4_pgtable = map_domain_page(efi_l4_mfn);
 
     for ( ; mfn < end; mfn = next )
     {
@@ -1469,6 +1471,8 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
         unmap_domain_page(l3src);
         unmap_domain_page(l3dst);
     }
+
+    unmap_domain_page(efi_l4_pgtable);
 }
 
 static bool __init ram_range_valid(unsigned long smfn, unsigned long emfn)
@@ -1489,6 +1493,7 @@ static bool __init rt_range_valid(unsigned long smfn, unsigned long emfn)
 void __init efi_init_memory(void)
 {
     unsigned int i;
+    l4_pgentry_t *efi_l4_pgtable;
     struct rt_extra {
         struct rt_extra *next;
         unsigned long smfn, emfn;
@@ -1603,8 +1608,9 @@ void __init efi_init_memory(void)
      * Set up 1:1 page tables for runtime calls. See SetVirtualAddressMap() in
      * efi_exit_boot().
      */
-    efi_l4_pgtable = alloc_xen_pagetable();
-    BUG_ON(!efi_l4_pgtable);
+    efi_l4_mfn = alloc_xen_pagetable_new();
+    BUG_ON(mfn_eq(efi_l4_mfn, INVALID_MFN));
+    efi_l4_pgtable = map_domain_page(efi_l4_mfn);
     clear_page(efi_l4_pgtable);
 
     copy_mapping(0, max_page, ram_range_valid);
@@ -1637,39 +1643,45 @@ void __init efi_init_memory(void)
 
         if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) )
         {
-            pl3e = alloc_xen_pagetable();
-            BUG_ON(!pl3e);
+            mfn_t l3mfn = alloc_xen_pagetable_new();
+
+            BUG_ON(mfn_eq(l3mfn, INVALID_MFN));
+            pl3e = map_domain_page(l3mfn);
             clear_page(pl3e);
             efi_l4_pgtable[l4_table_offset(addr)] =
-                l4e_from_paddr(virt_to_maddr(pl3e), __PAGE_HYPERVISOR);
+                l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR);
         }
         else
-            pl3e = l4e_to_l3e(l4e);
+            pl3e = map_l3t_from_l4e(l4e);
         pl3e += l3_table_offset(addr);
         if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
         {
-            pl2e = alloc_xen_pagetable();
-            BUG_ON(!pl2e);
+            mfn_t l2mfn = alloc_xen_pagetable_new();
+
+            BUG_ON(mfn_eq(l2mfn, INVALID_MFN));
+            pl2e = map_domain_page(l2mfn);
             clear_page(pl2e);
-            *pl3e = l3e_from_paddr(virt_to_maddr(pl2e), __PAGE_HYPERVISOR);
+            *pl3e = l3e_from_mfn(l2mfn, __PAGE_HYPERVISOR);
         }
         else
         {
             BUG_ON(l3e_get_flags(*pl3e) & _PAGE_PSE);
-            pl2e = l3e_to_l2e(*pl3e);
+            pl2e = map_l2t_from_l3e(*pl3e);
         }
         pl2e += l2_table_offset(addr);
         if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
         {
-            l1t = alloc_xen_pagetable();
-            BUG_ON(!l1t);
+            mfn_t l1mfn = alloc_xen_pagetable_new();
+
+            BUG_ON(mfn_eq(l1mfn, INVALID_MFN));
+            l1t = map_domain_page(l1mfn);
             clear_page(l1t);
-            *pl2e = l2e_from_paddr(virt_to_maddr(l1t), __PAGE_HYPERVISOR);
+            *pl2e = l2e_from_mfn(l1mfn, __PAGE_HYPERVISOR);
         }
         else
         {
             BUG_ON(l2e_get_flags(*pl2e) & _PAGE_PSE);
-            l1t = l2e_to_l1e(*pl2e);
+            l1t = map_l1t_from_l2e(*pl2e);
         }
         for ( i = l1_table_offset(addr);
               i < L1_PAGETABLE_ENTRIES && extra->smfn < extra->emfn;
@@ -1681,11 +1693,17 @@ void __init efi_init_memory(void)
             extra_head = extra->next;
             xfree(extra);
         }
+
+        unmap_domain_page(l1t);
+        unmap_domain_page(pl2e);
+        unmap_domain_page(pl3e);
     }
 
     /* Insert Xen mappings. */
     for ( i = l4_table_offset(HYPERVISOR_VIRT_START);
           i < l4_table_offset(DIRECTMAP_VIRT_END); ++i )
         efi_l4_pgtable[i] = idle_pg_table[i];
+
+    unmap_domain_page(efi_l4_pgtable);
 }
 #endif
diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
index 2e38d05f3d..e364bae3e0 100644
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -6,6 +6,7 @@
 #include <efi/eficapsule.h>
 #include <efi/efiapi.h>
 #include <xen/efi.h>
+#include <xen/mm.h>
 #include <xen/spinlock.h>
 #include <asm/page.h>
 
@@ -29,7 +30,7 @@ extern UINTN efi_memmap_size, efi_mdesc_size;
 extern void *efi_memmap;
 
 #ifdef CONFIG_X86
-extern l4_pgentry_t *efi_l4_pgtable;
+extern mfn_t efi_l4_mfn;
 #endif
 
 extern const struct efi_pci_rom *efi_pci_roms;
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 95367694b5..375b94229e 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -85,7 +85,7 @@ struct efi_rs_state efi_rs_enter(void)
     static const u32 mxcsr = MXCSR_DEFAULT;
     struct efi_rs_state state = { .cr3 = 0 };
 
-    if ( !efi_l4_pgtable )
+    if ( mfn_eq(efi_l4_mfn, INVALID_MFN) )
         return state;
 
     state.cr3 = read_cr3();
@@ -111,7 +111,7 @@ struct efi_rs_state efi_rs_enter(void)
         lgdt(&gdt_desc);
     }
 
-    switch_cr3_cr4(virt_to_maddr(efi_l4_pgtable), read_cr4());
+    switch_cr3_cr4(mfn_to_maddr(efi_l4_mfn), read_cr4());
 
     return state;
 }
@@ -140,9 +140,9 @@ void efi_rs_leave(struct efi_rs_state *state)
 
 bool efi_rs_using_pgtables(void)
 {
-    return efi_l4_pgtable &&
+    return !mfn_eq(efi_l4_mfn, INVALID_MFN) &&
            (smp_processor_id() == efi_rs_on_cpu) &&
-           (read_cr3() == virt_to_maddr(efi_l4_pgtable));
+           (read_cr3() == mfn_to_maddr(efi_l4_mfn));
 }
 
 unsigned long efi_get_time(void)
-- 
2.24.1.AMZN


