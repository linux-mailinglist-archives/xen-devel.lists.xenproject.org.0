Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC4C1A9631
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 10:23:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOdKZ-0006xA-LU; Wed, 15 Apr 2020 08:23:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOdKY-0006x0-JV
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 08:23:34 +0000
X-Inumbo-ID: 652b466c-7ef2-11ea-8a15-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 652b466c-7ef2-11ea-8a15-12813bfff9fa;
 Wed, 15 Apr 2020 08:23:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CE157AD78;
 Wed, 15 Apr 2020 08:23:31 +0000 (UTC)
Subject: [PATCH 1/2] x86: drop unnecessary page table walking in compat r/o
 M2P handling
From: Jan Beulich <jbeulich@suse.com>
To: xen-devel@lists.xenproject.org
References: <cover.1586352238.git.hongyxia@amazon.com>
 <91728ed9a191160e6405267f5ae05cb6d3724f22.1586352238.git.hongyxia@amazon.com>
 <fc61fd42-0e09-0f13-bccb-ba0202d936ca@suse.com>
Message-ID: <61746eff-0033-ccd7-6d77-3aabb8a426c8@suse.com>
Date: Wed, 15 Apr 2020 10:23:31 +0200
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

We have a global variable where the necessary L2 table is recorded; no
need to inspect L4 and L3 tables (and this way a few less places will
eventually need adjustment when we want to support 5-level page tables).
Also avoid setting up the L3 entry, as the address range never gets used
anyway (it'll be dropped altogether in a subsequent patch).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -219,9 +219,7 @@ static void destroy_compat_m2p_mapping(s
 {
     unsigned long i, va, rwva, pt_pfn;
     unsigned long smap = info->spfn, emap = info->spfn;
-
-    l3_pgentry_t *l3_ro_mpt;
-    l2_pgentry_t *l2_ro_mpt;
+    l2_pgentry_t *l2_ro_mpt = compat_idle_pg_table_l2;
 
     if ( smap > ((RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2) )
         return;
@@ -229,12 +227,6 @@ static void destroy_compat_m2p_mapping(s
     if ( emap > ((RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2) )
         emap = (RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) >> 2;
 
-    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(HIRO_COMPAT_MPT_VIRT_START)]);
-
-    ASSERT(l3e_get_flags(l3_ro_mpt[l3_table_offset(HIRO_COMPAT_MPT_VIRT_START)]) & _PAGE_PRESENT);
-
-    l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(HIRO_COMPAT_MPT_VIRT_START)]);
-
     for ( i = smap; i < emap; )
     {
         va = HIRO_COMPAT_MPT_VIRT_START +
@@ -323,7 +315,6 @@ static int setup_compat_m2p_table(struct
     unsigned long i, va, smap, emap, rwva, epfn = info->epfn;
     mfn_t mfn;
     unsigned int n;
-    l3_pgentry_t *l3_ro_mpt = NULL;
     l2_pgentry_t *l2_ro_mpt = NULL;
     int err = 0;
 
@@ -342,13 +333,7 @@ static int setup_compat_m2p_table(struct
     emap = ( (epfn + ((1UL << (L2_PAGETABLE_SHIFT - 2)) - 1 )) &
                 ~((1UL << (L2_PAGETABLE_SHIFT - 2)) - 1) );
 
-    va = HIRO_COMPAT_MPT_VIRT_START +
-         smap * sizeof(*compat_machine_to_phys_mapping);
-    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(va)]);
-
-    ASSERT(l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) & _PAGE_PRESENT);
-
-    l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]);
+    l2_ro_mpt = compat_idle_pg_table_l2;
 
 #define MFN(x) (((x) << L2_PAGETABLE_SHIFT) / sizeof(unsigned int))
 #define CNT ((sizeof(*frame_table) & -sizeof(*frame_table)) / \
@@ -627,16 +612,10 @@ void __init paging_init(void)
 #undef MFN
 
     /* Create user-accessible L2 directory to map the MPT for compat guests. */
-    BUILD_BUG_ON(l4_table_offset(RDWR_MPT_VIRT_START) !=
-                 l4_table_offset(HIRO_COMPAT_MPT_VIRT_START));
-    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(
-        HIRO_COMPAT_MPT_VIRT_START)]);
     if ( (l2_ro_mpt = alloc_xen_pagetable()) == NULL )
         goto nomem;
     compat_idle_pg_table_l2 = l2_ro_mpt;
     clear_page(l2_ro_mpt);
-    l3e_write(&l3_ro_mpt[l3_table_offset(HIRO_COMPAT_MPT_VIRT_START)],
-              l3e_from_paddr(__pa(l2_ro_mpt), __PAGE_HYPERVISOR_RO));
     l2_ro_mpt += l2_table_offset(HIRO_COMPAT_MPT_VIRT_START);
     /* Allocate and map the compatibility mode machine-to-phys table. */
     mpt_size = (mpt_size >> 1) + (1UL << (L2_PAGETABLE_SHIFT - 1));


