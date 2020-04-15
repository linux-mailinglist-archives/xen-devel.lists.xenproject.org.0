Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E441A1A9632
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 10:24:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOdL1-00070w-0g; Wed, 15 Apr 2020 08:24:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOdKz-00070k-Bl
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 08:24:01 +0000
X-Inumbo-ID: 752adb4a-7ef2-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 752adb4a-7ef2-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 08:24:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D606FAC12;
 Wed, 15 Apr 2020 08:23:58 +0000 (UTC)
Subject: [PATCH 2/2] x86: drop high compat r/o M2P table address range
From: Jan Beulich <jbeulich@suse.com>
To: xen-devel@lists.xenproject.org
References: <cover.1586352238.git.hongyxia@amazon.com>
 <91728ed9a191160e6405267f5ae05cb6d3724f22.1586352238.git.hongyxia@amazon.com>
 <fc61fd42-0e09-0f13-bccb-ba0202d936ca@suse.com>
Message-ID: <520c95ba-f9d0-4260-5426-b450c2310c3c@suse.com>
Date: Wed, 15 Apr 2020 10:23:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fc61fd42-0e09-0f13-bccb-ba0202d936ca@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Hongyan Xia <hx242@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 julien@xen.org, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Now that we don't properly hook things up into the page tables anymore
we also don't need to set aside an address range. Drop it, using
compat_idle_pg_table_l2[] simply (explicitly) from slot 0.

While doing the re-arrangement, which is accompanied by the dropping or
replacing of some local variables, restrict the scopes of some further
ones at the same time.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: With the changed usage perhaps we want to also rename
     compat_idle_pg_table_l2[] (to e.g. compat_idle_l2_entries[])?

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -1454,8 +1454,7 @@ static bool pae_xen_mappings_check(const
 void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d)
 {
     memcpy(&l2t[COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(d)],
-           &compat_idle_pg_table_l2[
-               l2_table_offset(HIRO_COMPAT_MPT_VIRT_START)],
+           compat_idle_pg_table_l2,
            COMPAT_L2_PAGETABLE_XEN_SLOTS(d) * sizeof(*l2t));
 }
 
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -217,9 +217,7 @@ static int share_hotadd_m2p_table(struct
 
 static void destroy_compat_m2p_mapping(struct mem_hotadd_info *info)
 {
-    unsigned long i, va, rwva, pt_pfn;
-    unsigned long smap = info->spfn, emap = info->spfn;
-    l2_pgentry_t *l2_ro_mpt = compat_idle_pg_table_l2;
+    unsigned long i, smap = info->spfn, emap = info->spfn;
 
     if ( smap > ((RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2) )
         return;
@@ -229,18 +227,19 @@ static void destroy_compat_m2p_mapping(s
 
     for ( i = smap; i < emap; )
     {
-        va = HIRO_COMPAT_MPT_VIRT_START +
-              i * sizeof(*compat_machine_to_phys_mapping);
-        rwva = RDWR_COMPAT_MPT_VIRT_START +
-             i * sizeof(*compat_machine_to_phys_mapping);
-        if ( l2e_get_flags(l2_ro_mpt[l2_table_offset(va)]) & _PAGE_PRESENT )
+        unsigned int off = i * sizeof(*compat_machine_to_phys_mapping);
+        l2_pgentry_t *pl2e = compat_idle_pg_table_l2 + l2_table_offset(off);
+
+        if ( l2e_get_flags(*pl2e) & _PAGE_PRESENT )
         {
-            pt_pfn = l2e_get_pfn(l2_ro_mpt[l2_table_offset(va)]);
+            unsigned long pt_pfn = l2e_get_pfn(*pl2e);
+
             if ( hotadd_mem_valid(pt_pfn, info) )
             {
-                destroy_xen_mappings(rwva, rwva +
-                        (1UL << L2_PAGETABLE_SHIFT));
-                l2e_write(&l2_ro_mpt[l2_table_offset(va)], l2e_empty());
+                unsigned long rwva = RDWR_COMPAT_MPT_VIRT_START + off;
+
+                destroy_xen_mappings(rwva, rwva + (1UL << L2_PAGETABLE_SHIFT));
+                l2e_write(pl2e, l2e_empty());
             }
         }
 
@@ -312,10 +311,9 @@ static void destroy_m2p_mapping(struct m
  */
 static int setup_compat_m2p_table(struct mem_hotadd_info *info)
 {
-    unsigned long i, va, smap, emap, rwva, epfn = info->epfn;
+    unsigned long i, smap, emap, epfn = info->epfn;
     mfn_t mfn;
     unsigned int n;
-    l2_pgentry_t *l2_ro_mpt = NULL;
     int err = 0;
 
     smap = info->spfn & (~((1UL << (L2_PAGETABLE_SHIFT - 2)) -1));
@@ -333,8 +331,6 @@ static int setup_compat_m2p_table(struct
     emap = ( (epfn + ((1UL << (L2_PAGETABLE_SHIFT - 2)) - 1 )) &
                 ~((1UL << (L2_PAGETABLE_SHIFT - 2)) - 1) );
 
-    l2_ro_mpt = compat_idle_pg_table_l2;
-
 #define MFN(x) (((x) << L2_PAGETABLE_SHIFT) / sizeof(unsigned int))
 #define CNT ((sizeof(*frame_table) & -sizeof(*frame_table)) / \
              sizeof(*compat_machine_to_phys_mapping))
@@ -343,13 +339,11 @@ static int setup_compat_m2p_table(struct
 
     for ( i = smap; i < emap; i += (1UL << (L2_PAGETABLE_SHIFT - 2)) )
     {
-        va = HIRO_COMPAT_MPT_VIRT_START +
-              i * sizeof(*compat_machine_to_phys_mapping);
-
-        rwva = RDWR_COMPAT_MPT_VIRT_START +
-                i * sizeof(*compat_machine_to_phys_mapping);
+        unsigned int off = i * sizeof(*compat_machine_to_phys_mapping);
+        l2_pgentry_t *pl2e = compat_idle_pg_table_l2 + l2_table_offset(off);
+        unsigned long rwva = RDWR_COMPAT_MPT_VIRT_START + off;
 
-        if (l2e_get_flags(l2_ro_mpt[l2_table_offset(va)]) & _PAGE_PRESENT)
+        if ( l2e_get_flags(*pl2e) & _PAGE_PRESENT )
             continue;
 
         for ( n = 0; n < CNT; ++n)
@@ -366,8 +360,7 @@ static int setup_compat_m2p_table(struct
         /* Fill with INVALID_M2P_ENTRY. */
         memset((void *)rwva, 0xFF, 1UL << L2_PAGETABLE_SHIFT);
         /* NB. Cannot be GLOBAL as the ptes get copied into per-VM space. */
-        l2e_write(&l2_ro_mpt[l2_table_offset(va)],
-                  l2e_from_mfn(mfn, _PAGE_PSE|_PAGE_PRESENT));
+        l2e_write(pl2e, l2e_from_mfn(mfn, _PAGE_PSE|_PAGE_PRESENT));
     }
 #undef CNT
 #undef MFN
@@ -616,7 +609,6 @@ void __init paging_init(void)
         goto nomem;
     compat_idle_pg_table_l2 = l2_ro_mpt;
     clear_page(l2_ro_mpt);
-    l2_ro_mpt += l2_table_offset(HIRO_COMPAT_MPT_VIRT_START);
     /* Allocate and map the compatibility mode machine-to-phys table. */
     mpt_size = (mpt_size >> 1) + (1UL << (L2_PAGETABLE_SHIFT - 1));
     if ( mpt_size > RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START )
--- a/xen/include/asm-x86/config.h
+++ b/xen/include/asm-x86/config.h
@@ -215,11 +215,8 @@ extern unsigned char boot_edid_info[128]
 /* Slot 261: compatibility machine-to-phys conversion table (1GB). */
 #define RDWR_COMPAT_MPT_VIRT_START VMAP_VIRT_END
 #define RDWR_COMPAT_MPT_VIRT_END (RDWR_COMPAT_MPT_VIRT_START + GB(1))
-/* Slot 261: high read-only compat machine-to-phys conversion table (1GB). */
-#define HIRO_COMPAT_MPT_VIRT_START RDWR_COMPAT_MPT_VIRT_END
-#define HIRO_COMPAT_MPT_VIRT_END (HIRO_COMPAT_MPT_VIRT_START + GB(1))
 /* Slot 261: xen text, static data, bss, per-cpu stubs and executable fixmap (1GB). */
-#define XEN_VIRT_START          (HIRO_COMPAT_MPT_VIRT_END)
+#define XEN_VIRT_START          RDWR_COMPAT_MPT_VIRT_END
 #define XEN_VIRT_END            (XEN_VIRT_START + GB(1))
 
 #ifndef CONFIG_BIGMEM


