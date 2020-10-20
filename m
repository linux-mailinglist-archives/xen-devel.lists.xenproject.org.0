Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D91293DCF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 15:53:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9639.25313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUs5H-0007hx-4y; Tue, 20 Oct 2020 13:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9639.25313; Tue, 20 Oct 2020 13:53:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUs5H-0007hW-1K; Tue, 20 Oct 2020 13:53:51 +0000
Received: by outflank-mailman (input) for mailman id 9639;
 Tue, 20 Oct 2020 13:53:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUs5F-0007hP-V8
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 13:53:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8890cbd1-8e0e-4596-9656-c4e317b1876b;
 Tue, 20 Oct 2020 13:53:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4DD88AD12;
 Tue, 20 Oct 2020 13:53:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUs5F-0007hP-V8
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 13:53:49 +0000
X-Inumbo-ID: 8890cbd1-8e0e-4596-9656-c4e317b1876b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8890cbd1-8e0e-4596-9656-c4e317b1876b;
	Tue, 20 Oct 2020 13:53:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603202028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zsOTH7fEV0oWzw80gGikZZVHCHk5yVvlPuzIis7q6zY=;
	b=OwkHY/Y+ZLh48rMgV+kXwaGMbdC+1OaQla/ALCsaf4/UJJ2+W8dsMwYEgE3X+2fo1BuWC5
	DnsSdRGqzynFqQx+87In4C5tfnbI/7cD5/dZYUbC77KwV7eMcVvmU7DTLXWeU6dGmVMT1Z
	WYQbheMWfANq9V6mhNbmtcR801u2UpE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4DD88AD12;
	Tue, 20 Oct 2020 13:53:48 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] AMD/IOMMU: correct shattering of super pages
Message-ID: <7b8ad528-b0bd-4d93-f08b-42b5af376561@suse.com>
Date: Tue, 20 Oct 2020 15:53:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Fill the new page table _before_ installing into a live page table
hierarchy, as installing a blank page first risks I/O faults on
sub-ranges of the original super page which aren't part of the range
for which mappings are being updated.

While at it also do away with mapping and unmapping the same fresh
intermediate page table page once per entry to be written.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Afaict this corrects presently dead code: I don't think there are ways
for super pages to be created in the first place, i.e. none could ever
need shattering.

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -81,19 +81,34 @@ static unsigned int set_iommu_pde_presen
     return flush_flags;
 }
 
-static unsigned int set_iommu_pte_present(unsigned long pt_mfn,
-                                          unsigned long dfn,
-                                          unsigned long next_mfn,
-                                          int pde_level,
-                                          bool iw, bool ir)
+static unsigned int set_iommu_ptes_present(unsigned long pt_mfn,
+                                           unsigned long dfn,
+                                           unsigned long next_mfn,
+                                           unsigned int nr_ptes,
+                                           unsigned int pde_level,
+                                           bool iw, bool ir)
 {
     union amd_iommu_pte *table, *pde;
-    unsigned int flush_flags;
+    unsigned int page_sz, flush_flags = 0;
 
     table = map_domain_page(_mfn(pt_mfn));
     pde = &table[pfn_to_pde_idx(dfn, pde_level)];
+    page_sz = 1U << (PTE_PER_TABLE_SHIFT * (pde_level - 1));
+
+    if ( (void *)(pde + nr_ptes) > (void *)table + PAGE_SIZE )
+    {
+        ASSERT_UNREACHABLE();
+        return 0;
+    }
+
+    while ( nr_ptes-- )
+    {
+        flush_flags |= set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
+
+        ++pde;
+        next_mfn += page_sz;
+    }
 
-    flush_flags = set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
     unmap_domain_page(table);
 
     return flush_flags;
@@ -220,11 +235,8 @@ static int iommu_pde_from_dfn(struct dom
         /* Split super page frame into smaller pieces.*/
         if ( pde->pr && !pde->next_level && next_table_mfn )
         {
-            int i;
             unsigned long mfn, pfn;
-            unsigned int page_sz;
 
-            page_sz = 1 << (PTE_PER_TABLE_SHIFT * (next_level - 1));
             pfn =  dfn & ~((1 << (PTE_PER_TABLE_SHIFT * next_level)) - 1);
             mfn = next_table_mfn;
 
@@ -238,17 +250,13 @@ static int iommu_pde_from_dfn(struct dom
             }
 
             next_table_mfn = mfn_x(page_to_mfn(table));
+
+            set_iommu_ptes_present(next_table_mfn, pfn, mfn, PTE_PER_TABLE_SIZE,
+                                   next_level, true, true);
+            smp_wmb();
             set_iommu_pde_present(pde, next_table_mfn, next_level, true,
                                   true);
 
-            for ( i = 0; i < PTE_PER_TABLE_SIZE; i++ )
-            {
-                set_iommu_pte_present(next_table_mfn, pfn, mfn, next_level,
-                                      true, true);
-                mfn += page_sz;
-                pfn += page_sz;
-             }
-
             amd_iommu_flush_all_pages(d);
         }
 
@@ -318,9 +326,9 @@ int amd_iommu_map_page(struct domain *d,
     }
 
     /* Install 4k mapping */
-    *flush_flags |= set_iommu_pte_present(pt_mfn[1], dfn_x(dfn), mfn_x(mfn),
-                                          1, (flags & IOMMUF_writable),
-                                          (flags & IOMMUF_readable));
+    *flush_flags |= set_iommu_ptes_present(pt_mfn[1], dfn_x(dfn), mfn_x(mfn),
+                                           1, 1, (flags & IOMMUF_writable),
+                                           (flags & IOMMUF_readable));
 
     spin_unlock(&hd->arch.mapping_lock);
 

