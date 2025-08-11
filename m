Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 992DDB207A0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:27:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077382.1438476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQg1-0006pb-8P; Mon, 11 Aug 2025 11:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077382.1438476; Mon, 11 Aug 2025 11:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQg1-0006oc-3R; Mon, 11 Aug 2025 11:26:53 +0000
Received: by outflank-mailman (input) for mailman id 1077382;
 Mon, 11 Aug 2025 11:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gc+J=2X=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ulQfz-0005jI-I5
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:26:51 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12bc6834-76a6-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 13:26:50 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-gDj_NH0vOTuZMzS60FoHlg-1; Mon, 11 Aug 2025 07:26:48 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-459dfbece11so21811795e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:26:48 -0700 (PDT)
Received: from localhost
 (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de.
 [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459e6214640sm259832575e9.1.2025.08.11.04.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:26:46 -0700 (PDT)
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
X-Inumbo-ID: 12bc6834-76a6-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DNeO4mnK34t1j+RunD3+GtheXBl5F9uGzS1IAgGiaS8=;
	b=EUirt2cnGsd3GncXXFwTue7LbvCqjLItstkOGbfSRPhNcVcKGphViRXUJHK3bmYQXRbvdr
	QZSmreySxgyOOqOjoh0EBzhFk62+iX/X7NbfShdTzDaAr4I7183Utf/yjW6MTUw7OTwKs/
	vEu6cMPa55m/3fAATlrns0Uf+Zyl1X4=
X-MC-Unique: gDj_NH0vOTuZMzS60FoHlg-1
X-Mimecast-MFC-AGG-ID: gDj_NH0vOTuZMzS60FoHlg_1754911607
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911607; x=1755516407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNeO4mnK34t1j+RunD3+GtheXBl5F9uGzS1IAgGiaS8=;
        b=M5tqNf6Th0XmI3FnFGCED9zIyugNGjsMvNS9fWuBsSRBs8ABAiU0EDmGA2qulxu2aq
         PGrO6qI1r/xUpWtOc1JTAJU6EAlE4tHa1opQrHmUlGVsMHMKB35RI074rYGtZRs0MfJ2
         v8S9Xy6jIbT6bI8oSWuET4/YTH36dfJasX/pS8IGBpSfjwFau1FosIDSvYK2y4xpIGxD
         /i5qOVBBXS/Z5z24ccw/i4saY6wld5R7j5ynjOZFYbkiXeWDIsXYQtkxlD2WqcCdHh49
         1uh/uazkFzsCEtKJ4he2iN0uDVV+XFe5hLuwKzNBHu+jW6njD4QHyrEMFYjMutLGyMEA
         80ow==
X-Forwarded-Encrypted: i=1; AJvYcCW7Kso6cQJQS34rdnMHytf9UqPfxCnHarxLogPXrjHEEAWs7S0Yhbtz6B0b/kCODKnarmbZOmi/k7c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxohp5e51WvxKXMtVhh5+aL1cyO57usRWpnw66EO9yTLV1+JobI
	znAsRFhUh8t5K6a9IqmKRH5BO6YgcrIXoUxJck7UFteG4oyicupM1VEKkZocg/7Q1eVLn8PfIPA
	CYs3UJE50aYpmXstdjbY+fNgSz29IEDn9yae98yRpfchgFHDerG3la9+s7/sRlnnwiXVZ
X-Gm-Gg: ASbGnctGRqhtinNjxivz08eFgQfBwzHk177ss2vzHPrs7zFoHIgLfaKyOfZiLhbu51m
	uMv6BkTMDEcsKGDRTgoyL1JkVJv2DShJH5BHknHwaPaQXQdztOelJHd474CT30qW8YhEltTgSiV
	HMPMdHg1QeIdyzbN1iJnTmc8LulCYEAFk3qhuBhkn5X8GHwUg5Lw86XkPumvTIhMA4wXrZbswHX
	hnwG5U6qqlijUfouC949UT0MHZdMgicafIhXuksJDJDoC89eRbzEhTkFAgwxn4qEuaI8wvImK+s
	ZZdFGU8Q8MC0YnrkHak9Y/urYNPrb2AN/4/tjIl32sXO9NhTLgxz+dxQ2GyarzCHQTXRFs/bjbE
	LmQeST3BCg/Uz36eDBW8Ur9E3
X-Received: by 2002:a05:600c:4746:b0:453:23fe:ca86 with SMTP id 5b1f17b1804b1-459f4ea0f2dmr115559585e9.4.1754911607430;
        Mon, 11 Aug 2025 04:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+SYBbVCDa86Al3Rw//iuzbWoSgvjLT8uLZDTY5p6isO9HqDz+nOTt8CKLJXWJJ2UJD3ft4A==
X-Received: by 2002:a05:600c:4746:b0:453:23fe:ca86 with SMTP id 5b1f17b1804b1-459f4ea0f2dmr115559215e9.4.1754911607000;
        Mon, 11 Aug 2025 04:26:47 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Hugh Dickins <hughd@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v3 05/11] mm/huge_memory: mark PMD mappings of the huge zero folio special
Date: Mon, 11 Aug 2025 13:26:25 +0200
Message-ID: <20250811112631.759341-6-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811112631.759341-1-david@redhat.com>
References: <20250811112631.759341-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nHdveVaFIoUHub9BdqKrlewaEtNZkRl7xEhjixB_pkM_1754911607
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The huge zero folio is refcounted (+mapcounted -- is that a word?)
differently than "normal" folios, similarly (but different) to the ordinary
shared zeropage.

For this reason, we special-case these pages in
vm_normal_page*/vm_normal_folio*, and only allow selected callers to
still use them (e.g., GUP can still take a reference on them).

vm_normal_page_pmd() already filters out the huge zero folio, to
indicate it a special (return NULL). However, so far we are not making
use of pmd_special() on architectures that support it
(CONFIG_ARCH_HAS_PTE_SPECIAL), like we would with the ordinary shared
zeropage.

Let's mark PMD mappings of the huge zero folio similarly as special, so we
can avoid the manual check for the huge zero folio with
CONFIG_ARCH_HAS_PTE_SPECIAL next, and only perform the check on
!CONFIG_ARCH_HAS_PTE_SPECIAL.

In copy_huge_pmd(), where we have a manual pmd_special() check to handle
PFNMAP, we have to manually rule out the huge zero folio. That code
needs a serious cleanup, but that's something for another day.

While at it, update the doc regarding the shared zero folios.

No functional change intended: vm_normal_page_pmd() still returns NULL
when it encounters the huge zero folio.

Reviewed-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c |  8 ++++++--
 mm/memory.c      | 15 ++++++++++-----
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ec89e0607424e..58bac83e7fa31 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1309,6 +1309,7 @@ static void set_huge_zero_folio(pgtable_t pgtable, struct mm_struct *mm,
 {
 	pmd_t entry;
 	entry = folio_mk_pmd(zero_folio, vma->vm_page_prot);
+	entry = pmd_mkspecial(entry);
 	pgtable_trans_huge_deposit(mm, pmd, pgtable);
 	set_pmd_at(mm, haddr, pmd, entry);
 	mm_inc_nr_ptes(mm);
@@ -1418,7 +1419,9 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 	if (fop.is_folio) {
 		entry = folio_mk_pmd(fop.folio, vma->vm_page_prot);
 
-		if (!is_huge_zero_folio(fop.folio)) {
+		if (is_huge_zero_folio(fop.folio)) {
+			entry = pmd_mkspecial(entry);
+		} else {
 			folio_get(fop.folio);
 			folio_add_file_rmap_pmd(fop.folio, &fop.folio->page, vma);
 			add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
@@ -1643,7 +1646,8 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	int ret = -ENOMEM;
 
 	pmd = pmdp_get_lockless(src_pmd);
-	if (unlikely(pmd_present(pmd) && pmd_special(pmd))) {
+	if (unlikely(pmd_present(pmd) && pmd_special(pmd) &&
+		     !is_huge_zero_pmd(pmd))) {
 		dst_ptl = pmd_lock(dst_mm, dst_pmd);
 		src_ptl = pmd_lockptr(src_mm, src_pmd);
 		spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
diff --git a/mm/memory.c b/mm/memory.c
index 0ba4f6b718471..626caedce35e0 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -555,7 +555,14 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
  *
  * "Special" mappings do not wish to be associated with a "struct page" (either
  * it doesn't exist, or it exists but they don't want to touch it). In this
- * case, NULL is returned here. "Normal" mappings do have a struct page.
+ * case, NULL is returned here. "Normal" mappings do have a struct page and
+ * are ordinarily refcounted.
+ *
+ * Page mappings of the shared zero folios are always considered "special", as
+ * they are not ordinarily refcounted: neither the refcount nor the mapcount
+ * of these folios is adjusted when mapping them into user page tables.
+ * Selected page table walkers (such as GUP) can still identify mappings of the
+ * shared zero folios and work with the underlying "struct page".
  *
  * There are 2 broad cases. Firstly, an architecture may define a pte_special()
  * pte bit, in which case this function is trivial. Secondly, an architecture
@@ -585,9 +592,8 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
  *
  * VM_MIXEDMAP mappings can likewise contain memory with or without "struct
  * page" backing, however the difference is that _all_ pages with a struct
- * page (that is, those where pfn_valid is true) are refcounted and considered
- * normal pages by the VM. The only exception are zeropages, which are
- * *never* refcounted.
+ * page (that is, those where pfn_valid is true, except the shared zero
+ * folios) are refcounted and considered normal pages by the VM.
  *
  * The disadvantage is that pages are refcounted (which can be slower and
  * simply not an option for some PFNMAP users). The advantage is that we
@@ -667,7 +673,6 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 {
 	unsigned long pfn = pmd_pfn(pmd);
 
-	/* Currently it's only used for huge pfnmaps */
 	if (unlikely(pmd_special(pmd)))
 		return NULL;
 
-- 
2.50.1


