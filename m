Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC6VNGfM2GmaiQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:09:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 265203D56F2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278638.1563413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8nr-0006wD-4X; Fri, 10 Apr 2026 10:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278638.1563413; Fri, 10 Apr 2026 10:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB8nq-0006te-Ut; Fri, 10 Apr 2026 10:09:30 +0000
Received: by outflank-mailman (input) for mailman id 1278638;
 Fri, 10 Apr 2026 10:09:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d8cc56.v1-ed78c97418584d2a93b5e2fa7768da7d@bounce.vates.tech>)
 id 1wB8no-0006gS-UL
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:09:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB8no-00BimU-A5
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:09:28 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d8cc56.v1-ed78c97418584d2a93b5e2fa7768da7d@bounce.vates.tech>)
 id 69d8cc49-e002-0a2a0a5209dd-0a2a4508d496-36
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:09:28 +0200
Received: from [198.2.187.14] (helo=mail187-14.suw11.mandrillapp.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d8cc56.v1-ed78c97418584d2a93b5e2fa7768da7d@bounce.vates.tech>)
 id 69d8cc56-fab6-0a2a45080019-c602bb0e3937-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:09:27 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fsXbB4y36z8XS1HS
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 10:09:26 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ed78c97418584d2a93b5e2fa7768da7d; Fri, 10 Apr 2026 10:09:26 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1775815766; x=1776085766;
	bh=YaD3wL81QOyOKzJ4o6EbQmXAFBu+LZDByU7J9GRr2VA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gmAdEn3QgqnWkcpSnUP2ytx4AsiU/kCcGMV3XQQtAgsmGXe9Z4qegHljCakP9Y7fp
	 2LDGgcR9q/YHFrGThJ00T53Sx3dA+fPTJqnbxRrXhwAzR8C3W1CGm9+rVG9QY1vlxC
	 H9b7SVRIasXvgaS9q2kyj0ClZu3Uvo5vXCx0uUd9DPdz8F737JgdnxLXmnBjaJ8gFK
	 1tRfTu0xQ0WdPsCGHp3e8eopLyUFuzG7xgoUjIXnTv3aj+2UKKAsPxP9I4b6Hknm0H
	 95rI7OyjoRrRg37AW0TaWfDVsltfuEokEZGl1DIeRuCMaNpbhBUUcBxNoOonN4Fb6H
	 G94fFiKle0lbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775815766; x=1776076266; i=teddy.astie@vates.tech;
	bh=YaD3wL81QOyOKzJ4o6EbQmXAFBu+LZDByU7J9GRr2VA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=C+jlkMHkhSu+DbBrBHyxpW13Q+ol+aW4tc9fELU/auog5ji8n56LLaZO5WKuFxgHz
	 LkFyjXHgdtTsfksjD+bD3mo2Fdh3qcjwvpY+UHZEfrtlij5fo4qlbYvGt7dCqbOcvW
	 hUJVX2CZkjbOdvZFZ9ZH8Rx+bZcbN+0ydLtTJgSZsqSC1gBN4sLnGFg55c61HKgatM
	 mdZiV6MUvcisw8pir1Spr0CJSJAQyIRj5cBVmibS7zsCqMSpkoR3zAlKBIivFmGEQc
	 N3WrzIluLLuXdQE8r/iCJw3VCVkfF+bjtuNK0ioEyLA+o4zyaY7sWfmPpEBSmMg4Fi
	 3buVDWtoPccBw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=202/2]=20vtd:=20Replace=20macros=20with=20bitfield?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775815765889
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <3182da144d0cb998c9ae897b55285b7e408cd972.1775814143.git.teddy.astie@vates.tech>
In-Reply-To: <815edfd0db90859a4ce270d833d9d721ff66e31c.1775814143.git.teddy.astie@vates.tech>
References: <815edfd0db90859a4ce270d833d9d721ff66e31c.1775814143.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ed78c97418584d2a93b5e2fa7768da7d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260410:md
Date: Fri, 10 Apr 2026 10:09:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1775815768-F5557497-310C376F/0/0
X-purgate-type: clean
X-purgate-size: 18951
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.882];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 265203D56F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace macros with bitfield to allow simplyfing the code and be
less error prone when manipulating PTEs.

It also has the effect of directly exposing the mfn in the pte struct
instead of derivating it from the raw pte value using dma_pte_addr().

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
It allows nicer constructs like

  new.snp = iommu_snoop;

instead of

  if ( iommu_snoop )
    dma_set_pte_snp(new);

A lot of simplifications could be done afterward when switching the
logic from maddrs to mfns i.e remove many maddr-mfn conversions.

bloat-o-meter (along with the previous change)

add/remove: 0/0 grow/shrink: 7/3 up/down: 227/-45 (182)
Function                                     old     new   delta
addr_to_dma_page_maddr                       949    1058    +109
vtd_dump_page_table_level                    197     233     +36
fill_qpt                                    1151    1178     +27
print_vtd_entries                            486     504     +18
domain_context_mapping_one                  2098    2114     +16
intel_iommu_map_page                         909     921     +12
intel_iommu_unmap_page                       731     740      +9
intel_iommu_lookup_page                      185     176      -9
queue_free_pt                                442     425     -17
vtd_dump_page_table_level.cold                86      67     -19
Total: Before=18446744073715636162, After=18446744073715636344, chg +0.00%

I guess using mfns 'everywhere' would improve the bloat-o-meter picture.

 xen/drivers/passthrough/vtd/iommu.c | 120 +++++++++++++---------------
 xen/drivers/passthrough/vtd/iommu.h |  44 +++++-----
 xen/drivers/passthrough/vtd/utils.c |  16 ++--
 3 files changed, 85 insertions(+), 95 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index cf97469957..eeebc73d26 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -321,7 +321,7 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
 {
     struct domain_iommu *hd = dom_iommu(domain);
     int addr_width = agaw_to_width(hd->arch.vtd.agaw);
-    struct dma_pte *parent, *pte = NULL;
+    union dma_pte *parent, *pte = NULL;
     unsigned int level = agaw_to_level(hd->arch.vtd.agaw), offset;
     u64 pte_maddr = 0;
 
@@ -350,15 +350,15 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
         offset = address_level_offset(addr, level);
         pte = &parent[offset];
 
-        pte_maddr = dma_pte_addr(*pte);
-        if ( !dma_pte_present(*pte) || (level > 1 && dma_pte_superpage(*pte)) )
+        pte_maddr = mfn_to_maddr(pte->mfn);
+        if ( !dma_pte_present(*pte) || (level > 1 && pte->sp) )
         {
             struct page_info *pg;
             /*
              * Higher level tables always set r/w, last level page table
              * controls read/write.
              */
-            struct dma_pte new_pte = { DMA_PTE_PROT };
+            union dma_pte new_pte = { .r = true, .w = true };
 
             if ( !alloc )
             {
@@ -371,9 +371,8 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
                  * with the address adjusted to account for the residual of
                  * the walk.
                  */
-                pte_maddr = (pte->val & PADDR_MASK) +
-                    (addr & ((1UL << level_to_offset_bits(level)) - 1) &
-                     PAGE_MASK);
+                pte_maddr = mfn_to_maddr(pte->mfn) +
+                            (addr & ((1UL << level_to_offset_bits(level)) - 1) & PAGE_MASK);
                 if ( !target )
                     break;
             }
@@ -384,20 +383,20 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
                 break;
 
             pte_maddr = page_to_maddr(pg);
-            dma_set_pte_addr(new_pte, pte_maddr);
+            new_pte.mfn = maddr_to_mfn(pte_maddr);
 
             if ( dma_pte_present(*pte) )
             {
-                struct dma_pte *split = map_vtd_domain_page(pte_maddr);
+                union dma_pte *split = map_vtd_domain_page(pte_maddr);
                 unsigned long inc = 1UL << level_to_offset_bits(level - 1);
 
-                split[0].val |= pte->val & ~DMA_PTE_CONTIG_MASK;
+                split[0].raw |= pte->raw & ~DMA_PTE_CONTIG_MASK;
                 if ( inc == PAGE_SIZE )
-                    split[0].val &= ~DMA_PTE_SP;
+                    split[0].sp = false;
 
                 for ( offset = 1; offset < PTE_NUM; ++offset )
-                    split[offset].val |=
-                        (split[offset - 1].val & ~DMA_PTE_CONTIG_MASK) + inc;
+                    split[offset].raw |=
+                        (split[offset - 1].raw & ~DMA_PTE_CONTIG_MASK) + inc;
 
                 iommu_sync_cache(split, PAGE_SIZE);
                 unmap_vtd_domain_page(split);
@@ -408,9 +407,9 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
                 perfc_incr(iommu_pt_shatters);
             }
 
-            write_atomic(&pte->val, new_pte.val);
-            iommu_sync_cache(pte, sizeof(struct dma_pte));
-            pt_update_contig_markers(&parent->val,
+            write_atomic(&pte->raw, new_pte.raw);
+            iommu_sync_cache(pte, sizeof(union dma_pte));
+            pt_update_contig_markers(&parent->raw,
                                      address_level_offset(addr, level),
                                      level, PTE_kind_table);
         }
@@ -418,7 +417,7 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
         if ( --level == target )
         {
             if ( !target )
-                pte_maddr = pte->val & PADDR_MASK;
+                pte_maddr = mfn_to_maddr(pte->mfn);
             break;
         }
 
@@ -469,9 +468,9 @@ static paddr_t domain_pgd_maddr(struct domain *d, paddr_t pgd_maddr,
           agaw != level_to_agaw(nr_pt_levels);
           agaw-- )
     {
-        const struct dma_pte *p = map_vtd_domain_page(pgd_maddr);
+        const union dma_pte *p = map_vtd_domain_page(pgd_maddr);
 
-        pgd_maddr = dma_pte_addr(*p);
+        pgd_maddr = mfn_to_maddr(p->mfn);
         unmap_vtd_domain_page(p);
         if ( !pgd_maddr )
             return 0;
@@ -783,13 +782,12 @@ static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int level
 {
     if ( level > 1 )
     {
-        struct dma_pte *pt = map_domain_page(mfn);
+        union dma_pte *pt = map_domain_page(mfn);
         unsigned int i;
 
         for ( i = 0; i < PTE_NUM; ++i )
-            if ( dma_pte_present(pt[i]) && !dma_pte_superpage(pt[i]) )
-                queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(pt[i])),
-                              level - 1);
+            if ( dma_pte_present(pt[i]) && !pt[i].sp )
+                queue_free_pt(hd, pt[i].mfn, level - 1);
 
         unmap_domain_page(pt);
     }
@@ -2074,7 +2072,7 @@ static int __must_check cf_check intel_iommu_map_page(
     unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
-    struct dma_pte *page, *pte, old, new = {};
+    union dma_pte *page, *pte, old, new = {};
     u64 pg_maddr;
     unsigned int level = (IOMMUF_order(flags) / LEVEL_STRIDE) + 1;
     int rc = 0;
@@ -2112,22 +2110,18 @@ static int __must_check cf_check intel_iommu_map_page(
         return -ENOMEM;
     }
 
-    page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
+    page = (union dma_pte *)map_vtd_domain_page(pg_maddr);
     pte = &page[address_level_offset(dfn_to_daddr(dfn), level)];
     old = *pte;
 
-    dma_set_pte_addr(new, mfn_to_maddr(mfn));
-    dma_set_pte_prot(new,
-                     ((flags & IOMMUF_readable) ? DMA_PTE_READ  : 0) |
-                     ((flags & IOMMUF_writable) ? DMA_PTE_WRITE : 0));
-    if ( IOMMUF_order(flags) )
-        dma_set_pte_superpage(new);
-
+    new.mfn = mfn;
+    new.r = flags & IOMMUF_readable;
+    new.w = flags & IOMMUF_writable;
+    new.sp = IOMMUF_order(flags) > 0;
     /* Set the SNP on leaf page table if Snoop Control available */
-    if ( iommu_snoop )
-        dma_set_pte_snp(new);
+    new.snp = iommu_snoop;
 
-    if ( !((old.val ^ new.val) & ~DMA_PTE_CONTIG_MASK) )
+    if ( !((old.raw ^ new.raw) & ~DMA_PTE_CONTIG_MASK) )
     {
         spin_unlock(&hd->arch.mapping_lock);
         unmap_vtd_domain_page(page);
@@ -2135,7 +2129,7 @@ static int __must_check cf_check intel_iommu_map_page(
     }
 
     *pte = new;
-    iommu_sync_cache(pte, sizeof(struct dma_pte));
+    iommu_sync_cache(pte, sizeof(union dma_pte));
 
     /*
      * While the (ab)use of PTE_kind_table here allows to save some work in
@@ -2144,7 +2138,7 @@ static int __must_check cf_check intel_iommu_map_page(
      * based laptop.  This also has the intended effect of terminating the
      * loop when super pages aren't supported anymore at the next level.
      */
-    while ( pt_update_contig_markers(&page->val,
+    while ( pt_update_contig_markers(&page->raw,
                                      address_level_offset(dfn_to_daddr(dfn), level),
                                      level,
                                      (hd->platform_ops->page_sizes &
@@ -2155,8 +2149,8 @@ static int __must_check cf_check intel_iommu_map_page(
 
         unmap_vtd_domain_page(page);
 
-        new.val &= ~(LEVEL_MASK << level_to_offset_bits(level));
-        dma_set_pte_superpage(new);
+        new.raw &= ~(LEVEL_MASK << level_to_offset_bits(level));
+        new.sp = true;
 
         pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), ++level,
                                           flush_flags, false);
@@ -2180,9 +2174,8 @@ static int __must_check cf_check intel_iommu_map_page(
     {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
-        if ( IOMMUF_order(flags) && !dma_pte_superpage(old) )
-            queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
-                          IOMMUF_order(flags) / LEVEL_STRIDE);
+        if ( IOMMUF_order(flags) && !old.sp )
+            queue_free_pt(hd, old.mfn, IOMMUF_order(flags) / LEVEL_STRIDE);
     }
 
     return rc;
@@ -2193,7 +2186,7 @@ static int __must_check cf_check intel_iommu_unmap_page(
 {
     struct domain_iommu *hd = dom_iommu(d);
     daddr_t addr = dfn_to_daddr(dfn);
-    struct dma_pte *page = NULL, *pte = NULL, old;
+    union dma_pte *page = NULL, *pte = NULL, old;
     uint64_t pg_maddr;
     unsigned int level = (order / LEVEL_STRIDE) + 1;
 
@@ -2231,10 +2224,10 @@ static int __must_check cf_check intel_iommu_unmap_page(
     }
 
     old = *pte;
-    dma_clear_pte(*pte);
+    pte->raw = 0;
     iommu_sync_cache(pte, sizeof(*pte));
 
-    while ( pt_update_contig_markers(&page->val,
+    while ( pt_update_contig_markers(&page->raw,
                                      address_level_offset(addr, level),
                                      level, PTE_kind_null) &&
             ++level < min_pt_levels )
@@ -2248,7 +2241,7 @@ static int __must_check cf_check intel_iommu_unmap_page(
 
         page = map_vtd_domain_page(pg_maddr);
         pte = &page[address_level_offset(addr, level)];
-        dma_clear_pte(*pte);
+        pte->raw = 0;
         iommu_sync_cache(pte, sizeof(*pte));
 
         *flush_flags |= IOMMU_FLUSHF_all;
@@ -2262,9 +2255,8 @@ static int __must_check cf_check intel_iommu_unmap_page(
 
     *flush_flags |= IOMMU_FLUSHF_modified;
 
-    if ( order && !dma_pte_superpage(old) )
-        queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
-                      order / LEVEL_STRIDE);
+    if ( order && !old.sp )
+        queue_free_pt(hd, old.mfn, order / LEVEL_STRIDE);
 
     return 0;
 }
@@ -3055,9 +3047,9 @@ static void cf_check vtd_resume(void)
 static void vtd_dump_page_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
                                       int indent)
 {
-    paddr_t address;
+    daddr_t address;
     int i;
-    struct dma_pte *pt_vaddr, *pte;
+    union dma_pte *pt_vaddr, *pte;
     int next_level;
 
     if ( level < 1 )
@@ -3076,16 +3068,16 @@ static void vtd_dump_page_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
             continue;
 
         address = gpa + offset_level_address(i, level);
-        if ( next_level && !dma_pte_superpage(*pte) )
-            vtd_dump_page_table_level(dma_pte_addr(*pte), next_level,
+        if ( next_level && !pte->sp )
+            vtd_dump_page_table_level(mfn_to_maddr(pte->mfn), next_level,
                                       address, indent + 1);
         else
             printk("%*sdfn: %08lx mfn: %08lx %c%c\n",
                    indent, "",
                    (unsigned long)(address >> PAGE_SHIFT_4K),
-                   (unsigned long)(dma_pte_addr(*pte) >> PAGE_SHIFT_4K),
-                   dma_pte_read(*pte) ? 'r' : '-',
-                   dma_pte_write(*pte) ? 'w' : '-');
+                   (unsigned long)(pte->mfn),
+                   pte->r ? 'r' : '-',
+                   pte->w ? 'w' : '-');
     }
 
     unmap_vtd_domain_page(pt_vaddr);
@@ -3101,7 +3093,7 @@ static void cf_check vtd_dump_page_tables(struct domain *d)
                               agaw_to_level(hd->arch.vtd.agaw), 0, 0);
 }
 
-static int fill_qpt(struct dma_pte *this, unsigned int level,
+static int fill_qpt(union dma_pte *this, unsigned int level,
                     struct page_info *pgs[6])
 {
     struct domain_iommu *hd = dom_iommu(dom_io);
@@ -3110,7 +3102,7 @@ static int fill_qpt(struct dma_pte *this, unsigned int level,
 
     for ( i = 0; !rc && i < PTE_NUM; ++i )
     {
-        struct dma_pte *pte = &this[i], *next;
+        union dma_pte *pte = &this[i], *next;
 
         if ( !dma_pte_present(*pte) )
         {
@@ -3136,13 +3128,13 @@ static int fill_qpt(struct dma_pte *this, unsigned int level,
                 }
             }
 
-            dma_set_pte_addr(*pte, page_to_maddr(pgs[level]));
-            dma_set_pte_readable(*pte);
-            dma_set_pte_writable(*pte);
+            pte->mfn = page_to_mfn(pgs[level]);
+            pte->r = true;
+            pte->w = true;
         }
-        else if ( level && !dma_pte_superpage(*pte) )
+        else if ( level && !pte->sp )
         {
-            next = map_vtd_domain_page(dma_pte_addr(*pte));
+            next = map_vtd_domain_page(mfn_to_maddr(pte->mfn));
             rc = fill_qpt(next, level - 1, pgs);
             unmap_vtd_domain_page(next);
         }
@@ -3212,7 +3204,7 @@ static int cf_check intel_iommu_quarantine_init(struct pci_dev *pdev,
 
     if ( !rc && scratch_page )
     {
-        struct dma_pte *root;
+        union dma_pte *root;
         struct page_info *pgs[6] = {};
 
         root = map_vtd_domain_page(pdev->arch.vtd.pgd_maddr);
diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/vtd/iommu.h
index ccb00889d7..7a4534b7fd 100644
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -258,31 +258,29 @@ struct context_entry {
  * 62: reserved
  * 63: available
  */
-struct dma_pte {
-    u64 val;
+union dma_pte {
+    uint64_t raw;
+    struct {
+        bool r:1;
+        bool w:1;
+        bool :1; /* Ignored */
+        unsigned int emt:3;
+        bool ipat:1;
+        bool sp:1;
+        bool a:1;
+        bool d:1;
+        bool :1; /* Ignored */
+        bool snp:1;
+        unsigned long mfn:40;
+        unsigned int pt_contig_mask:4; /* Available */
+        unsigned int :6;               /* Available */
+        bool :1;                       /* Reserved */
+        bool :1;                       /* Available */
+    };
 };
-#define DMA_PTE_READ (1)
-#define DMA_PTE_WRITE (2)
-#define DMA_PTE_PROT (DMA_PTE_READ | DMA_PTE_WRITE)
-#define DMA_PTE_SP   (1 << 7)
-#define DMA_PTE_SNP  (1 << 11)
+
 #define DMA_PTE_CONTIG_MASK  (0xfULL << PADDR_BITS)
-#define dma_clear_pte(p)    do {(p).val = 0;} while(0)
-#define dma_set_pte_readable(p) do {(p).val |= DMA_PTE_READ;} while(0)
-#define dma_set_pte_writable(p) do {(p).val |= DMA_PTE_WRITE;} while(0)
-#define dma_set_pte_superpage(p) do {(p).val |= DMA_PTE_SP;} while(0)
-#define dma_set_pte_snp(p)  do {(p).val |= DMA_PTE_SNP;} while(0)
-#define dma_set_pte_prot(p, prot) do { \
-        (p).val = ((p).val & ~DMA_PTE_PROT) | ((prot) & DMA_PTE_PROT); \
-    } while (0)
-#define dma_pte_prot(p) ((p).val & DMA_PTE_PROT)
-#define dma_pte_read(p) (dma_pte_prot(p) & DMA_PTE_READ)
-#define dma_pte_write(p) (dma_pte_prot(p) & DMA_PTE_WRITE)
-#define dma_pte_addr(p) ((p).val & PADDR_MASK & PAGE_MASK_4K)
-#define dma_set_pte_addr(p, addr) do {\
-            (p).val |= ((addr) & PADDR_MASK & PAGE_MASK_4K); } while (0)
-#define dma_pte_present(p) (((p).val & DMA_PTE_PROT) != 0)
-#define dma_pte_superpage(p) (((p).val & DMA_PTE_SP) != 0)
+#define dma_pte_present(p) ((p).r || (p).w)
 
 /* interrupt remap entry */
 struct iremap_entry {
diff --git a/xen/drivers/passthrough/vtd/utils.c b/xen/drivers/passthrough/vtd/utils.c
index 7c4d032f4f..ac26a1f52d 100644
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -91,8 +91,8 @@ void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn)
 {
     struct context_entry *ctxt_entry;
     struct root_entry *root_entry;
-    struct dma_pte pte;
-    u64 *l, val;
+    union dma_pte pte, *l;
+    u64 val;
     u32 l_index, level;
 
     printk("print_vtd_entries: iommu #%u dev %pp gmfn %"PRI_gfn"\n",
@@ -142,15 +142,15 @@ void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn)
     {
         l = map_vtd_domain_page(val);
         l_index = get_level_index(gmfn, level);
-        pte.val = l[l_index];
+        pte = l[l_index];
         unmap_vtd_domain_page(l);
-        printk("    l%u[%03x] = %"PRIx64" %c%c\n", level, l_index, pte.val,
-               dma_pte_read(pte) ? 'r' : '-',
-               dma_pte_write(pte) ? 'w' : '-');
+        printk("    l%u[%03x] = %"PRIx64" %c%c\n", level, l_index, pte.raw,
+               pte.r ? 'r' : '-',
+               pte.w ? 'w' : '-');
 
-        if ( !dma_pte_present(pte) || dma_pte_superpage(pte) )
+        if ( !dma_pte_present(pte) || pte.sp )
             break;
-        val = dma_pte_addr(pte);
+        val = mfn_to_maddr(pte.mfn);
     } while ( --level );
 }
 
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


