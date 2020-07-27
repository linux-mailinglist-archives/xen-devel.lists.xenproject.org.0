Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B022F273
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 16:40:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k04IN-0000r2-9y; Mon, 27 Jul 2020 14:40:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM/5=BG=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1k04IL-0000dt-8s
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 14:40:01 +0000
X-Inumbo-ID: 06d6f414-d017-11ea-8ac7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06d6f414-d017-11ea-8ac7-bc764e2007e4;
 Mon, 27 Jul 2020 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W32xTjpvUmjvkngH88KQETVFnfyWGChOM6HrUWd8JKI=; b=OzLNH4tNvAMKFTottAU2hdC/tf
 aLEbyJxKp5lYQvkMXBeeLnzpSwljDA/awYuX7ZJWGW2CN+BwLhdsJmjHxfCOznkrKXWXrPb1QIZJb
 rCj0kJnKoZYjXxNgWee5JGh2lqcBWlVrWYJriGP6bXFPCyaJWfu33XHPoltRUaObrbjI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k04IA-0001kt-9C; Mon, 27 Jul 2020 14:39:50 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041P-0002w6-AP; Mon, 27 Jul 2020 14:22:31 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v8 10/15] efi: switch to new APIs in EFI code
Date: Mon, 27 Jul 2020 15:22:00 +0100
Message-Id: <9f824496cf87c1f282d774562456ba5d51ce7979.1595857947.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595857947.git.hongyxia@amazon.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
In-Reply-To: <cover.1595857947.git.hongyxia@amazon.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v7:
- add blank line after declaration.
- rename efi_l4_pgtable into efi_l4t.
- pass the mapped efi_l4t to copy_mapping() instead of map it again.
- use the alloc_map_clear_xen_pt() API.
- unmap pl3e, pl2e, l1t earlier.
---
 xen/arch/x86/efi/runtime.h | 13 ++++++++---
 xen/common/efi/boot.c      | 55 +++++++++++++++++++++++++++-------------------
 xen/common/efi/efi.h       |  3 ++-
 xen/common/efi/runtime.c   |  8 +++----
 4 files changed, 48 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/efi/runtime.h b/xen/arch/x86/efi/runtime.h
index d9eb8f5c27..77866c5f21 100644
--- a/xen/arch/x86/efi/runtime.h
+++ b/xen/arch/x86/efi/runtime.h
@@ -1,12 +1,19 @@
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
-        l4e_write(efi_l4_pgtable + l4idx, l4e);
+    if ( !mfn_eq(efi_l4_mfn, INVALID_MFN) )
+    {
+        l4_pgentry_t *efi_l4t = map_domain_page(efi_l4_mfn);
+
+        l4e_write(efi_l4t + l4idx, l4e);
+        unmap_domain_page(efi_l4t);
+    }
 }
 #endif
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index f116759538..f2f1dbbc77 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1440,14 +1440,15 @@ custom_param("efi", parse_efi_param);
 
 static __init void copy_mapping(unsigned long mfn, unsigned long end,
                                 bool (*is_valid)(unsigned long smfn,
-                                                 unsigned long emfn))
+                                                 unsigned long emfn),
+                                l4_pgentry_t *efi_l4t)
 {
     unsigned long next;
     l3_pgentry_t *l3src = NULL, *l3dst = NULL;
 
     for ( ; mfn < end; mfn = next )
     {
-        l4_pgentry_t l4e = efi_l4_pgtable[l4_table_offset(mfn << PAGE_SHIFT)];
+        l4_pgentry_t l4e = efi_l4t[l4_table_offset(mfn << PAGE_SHIFT)];
         unsigned long va = (unsigned long)mfn_to_virt(mfn);
 
         if ( !(mfn & ((1UL << (L4_PAGETABLE_SHIFT - PAGE_SHIFT)) - 1)) )
@@ -1466,7 +1467,7 @@ static __init void copy_mapping(unsigned long mfn, unsigned long end,
 
             l3dst = alloc_map_clear_xen_pt(&l3mfn);
             BUG_ON(!l3dst);
-            efi_l4_pgtable[l4_table_offset(mfn << PAGE_SHIFT)] =
+            efi_l4t[l4_table_offset(mfn << PAGE_SHIFT)] =
                 l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR);
         }
         else
@@ -1499,6 +1500,7 @@ static bool __init rt_range_valid(unsigned long smfn, unsigned long emfn)
 void __init efi_init_memory(void)
 {
     unsigned int i;
+    l4_pgentry_t *efi_l4t;
     struct rt_extra {
         struct rt_extra *next;
         unsigned long smfn, emfn;
@@ -1613,11 +1615,10 @@ void __init efi_init_memory(void)
      * Set up 1:1 page tables for runtime calls. See SetVirtualAddressMap() in
      * efi_exit_boot().
      */
-    efi_l4_pgtable = alloc_xen_pagetable();
-    BUG_ON(!efi_l4_pgtable);
-    clear_page(efi_l4_pgtable);
+    efi_l4t = alloc_map_clear_xen_pt(&efi_l4_mfn);
+    BUG_ON(!efi_l4t);
 
-    copy_mapping(0, max_page, ram_range_valid);
+    copy_mapping(0, max_page, ram_range_valid, efi_l4t);
 
     /* Insert non-RAM runtime mappings inside the direct map. */
     for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
@@ -1633,58 +1634,64 @@ void __init efi_init_memory(void)
             copy_mapping(PFN_DOWN(desc->PhysicalStart),
                          PFN_UP(desc->PhysicalStart +
                                 (desc->NumberOfPages << EFI_PAGE_SHIFT)),
-                         rt_range_valid);
+                         rt_range_valid, efi_l4t);
     }
 
     /* Insert non-RAM runtime mappings outside of the direct map. */
     while ( (extra = extra_head) != NULL )
     {
         unsigned long addr = extra->smfn << PAGE_SHIFT;
-        l4_pgentry_t l4e = efi_l4_pgtable[l4_table_offset(addr)];
+        l4_pgentry_t l4e = efi_l4t[l4_table_offset(addr)];
         l3_pgentry_t *pl3e;
         l2_pgentry_t *pl2e;
         l1_pgentry_t *l1t;
 
         if ( !(l4e_get_flags(l4e) & _PAGE_PRESENT) )
         {
-            pl3e = alloc_xen_pagetable();
+            mfn_t l3mfn;
+
+            pl3e = alloc_map_clear_xen_pt(&l3mfn);
             BUG_ON(!pl3e);
-            clear_page(pl3e);
-            efi_l4_pgtable[l4_table_offset(addr)] =
-                l4e_from_paddr(virt_to_maddr(pl3e), __PAGE_HYPERVISOR);
+            efi_l4t[l4_table_offset(addr)] =
+                l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR);
         }
         else
-            pl3e = l4e_to_l3e(l4e);
+            pl3e = map_l3t_from_l4e(l4e);
         pl3e += l3_table_offset(addr);
         if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
         {
-            pl2e = alloc_xen_pagetable();
+            mfn_t l2mfn;
+
+            pl2e = alloc_map_clear_xen_pt(&l2mfn);
             BUG_ON(!pl2e);
-            clear_page(pl2e);
-            *pl3e = l3e_from_paddr(virt_to_maddr(pl2e), __PAGE_HYPERVISOR);
+            *pl3e = l3e_from_mfn(l2mfn, __PAGE_HYPERVISOR);
         }
         else
         {
             BUG_ON(l3e_get_flags(*pl3e) & _PAGE_PSE);
-            pl2e = l3e_to_l2e(*pl3e);
+            pl2e = map_l2t_from_l3e(*pl3e);
         }
+        UNMAP_DOMAIN_PAGE(pl3e);
         pl2e += l2_table_offset(addr);
         if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
         {
-            l1t = alloc_xen_pagetable();
+            mfn_t l1mfn;
+
+            l1t = alloc_map_clear_xen_pt(&l1mfn);
             BUG_ON(!l1t);
-            clear_page(l1t);
-            *pl2e = l2e_from_paddr(virt_to_maddr(l1t), __PAGE_HYPERVISOR);
+            *pl2e = l2e_from_mfn(l1mfn, __PAGE_HYPERVISOR);
         }
         else
         {
             BUG_ON(l2e_get_flags(*pl2e) & _PAGE_PSE);
-            l1t = l2e_to_l1e(*pl2e);
+            l1t = map_l1t_from_l2e(*pl2e);
         }
+        UNMAP_DOMAIN_PAGE(pl2e);
         for ( i = l1_table_offset(addr);
               i < L1_PAGETABLE_ENTRIES && extra->smfn < extra->emfn;
               ++i, ++extra->smfn )
             l1t[i] = l1e_from_pfn(extra->smfn, extra->prot);
+        UNMAP_DOMAIN_PAGE(l1t);
 
         if ( extra->smfn == extra->emfn )
         {
@@ -1696,6 +1703,8 @@ void __init efi_init_memory(void)
     /* Insert Xen mappings. */
     for ( i = l4_table_offset(HYPERVISOR_VIRT_START);
           i < l4_table_offset(DIRECTMAP_VIRT_END); ++i )
-        efi_l4_pgtable[i] = idle_pg_table[i];
+        efi_l4t[i] = idle_pg_table[i];
+
+    unmap_domain_page(efi_l4t);
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
2.16.6


