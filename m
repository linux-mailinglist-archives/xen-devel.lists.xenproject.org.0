Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE961B08C08
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 13:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046606.1416964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNA3-0001WH-II; Thu, 17 Jul 2025 11:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046606.1416964; Thu, 17 Jul 2025 11:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNA3-0001Tq-Ez; Thu, 17 Jul 2025 11:52:27 +0000
Received: by outflank-mailman (input) for mailman id 1046606;
 Thu, 17 Jul 2025 11:52:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiP3=Z6=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ucNA2-0001TV-62
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 11:52:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8007e854-6304-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 13:52:23 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-9EPw4LYkOxGXkgnnTsYDHQ-1; Thu, 17 Jul 2025 07:52:19 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-455eda09c57so5373275e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 04:52:19 -0700 (PDT)
Received: from localhost
 (p200300d82f1f36000dc826ee9aa9fdc7.dip0.t-ipconnect.de.
 [2003:d8:2f1f:3600:dc8:26ee:9aa9:fdc7])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45634f8cc6esm20532295e9.26.2025.07.17.04.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 04:52:16 -0700 (PDT)
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
X-Inumbo-ID: 8007e854-6304-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752753142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zIbOZw1x2GVZdwaR5iaeVsCQGMgTtSbEtHQ5YhAco0w=;
	b=Er+W8918I+6DeyQSgGRINmqVTLzcoiw0nJSNtrfqUACAYHeMQDnb35KN2n/+rl3REYZ7Bf
	KMuYjOXGYTfC3KkCCEm9+d1WLjN4Y2KOM6iQHk3+KkUB8Me3D19xvDRh3P2l8XXIHJHJle
	Lr0rzV1pGhLsY1aiUdQ54I4zWP7v1u4=
X-MC-Unique: 9EPw4LYkOxGXkgnnTsYDHQ-1
X-Mimecast-MFC-AGG-ID: 9EPw4LYkOxGXkgnnTsYDHQ_1752753138
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753138; x=1753357938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIbOZw1x2GVZdwaR5iaeVsCQGMgTtSbEtHQ5YhAco0w=;
        b=oLanVW4Ru7/EPKY7MCb4gq4/+yt4Byehx08AQ3Gy0YzEC8PHrtnKuFpaFKOZ17BXj8
         /GjQE3keO6EYgWj59t81Np4oQ0qQJ1shZNh5sYxRI49w0MRWTkAC0afpnBiX88tieyjX
         1wsntOfXORL49Tb+RxkOiEEXNQw1wppNkrfVpX+DxaM/CYjE5V5yrPwjruD/jGBslCYn
         5DZHD1Oulfx16Dn++1/kHeWIejicl6TMrI/3CG4pxbk3w+2eSvE79Uz5vG2JXPP4GWmS
         GzbtgXMQDNcwRlTJOI0o8eC/pNng4Wn80aH9VdYzLg1zVcNXAvdejmIxeCPq9ACz/WXo
         +mtw==
X-Forwarded-Encrypted: i=1; AJvYcCXotnrsPZq1UQLGYiGDV6zXy3RKR5tIXZGjP+ueJvruwgGtm0d8AHAdJSFE/gOAHBRXyyoUYaMUats=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNZhJRPljHeCL7BmorGcWCfSj8+3E6p24WGiWX7nBNuRtcvqcO
	lJ6bFR1asSXSNPIyheU9UFiO64JQwQclfCo55XtDaFvoMfE7WQthkSoDN+d4tma6jMSV8vYgdfK
	XDsBpmxylYsf5hWnLzzSBo1jl9gKwXPQv9j/GFxxrkcISoyDSxG0KBu+d3g/0PPLCimmt
X-Gm-Gg: ASbGncsDvV+mwOcG+G76NEU81yY7hURbf4aHj358pHPiByhLtGVFH3nZ2+BiJvOWD68
	JL4QM5GGmgtdCLZc2/Am+J3adkFDBv7no8u+fM92BEUjbImUbcJNQLbZamOIOj2H/ew7zpTpA60
	39n3yHrhtVJfqSF4jAoF4xtcGj18ViM5VZvOolRM6NT6MAI5Srn7CLpdY4wWG6+2AQCmKYgzx8a
	bm1rriuCA14bS9/QthxglKqypNmotm5cz0ZDOoXLbTblqXX4HDETaP37I4GTEB2xKYNTuqni9XP
	z77QlWRrpJIKwUhE7voKM69CNh9ux61sIPLiAJxU2ea5Okp1/C19cyXtVhKdXEx2XmVruKT68zR
	gau7hh/h2LwWqPYjCBO8c6CQ=
X-Received: by 2002:a05:600c:3e15:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-4562e39865dmr69602235e9.30.1752753137844;
        Thu, 17 Jul 2025 04:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExNej71yyxo4EvVsey/pvqYl543s0okqsAtiv/nbzqOk+Nei3ADHbojZnjuyE7SwluE3g0Pw==
X-Received: by 2002:a05:600c:3e15:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-4562e39865dmr69601365e9.30.1752753137339;
        Thu, 17 Jul 2025 04:52:17 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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
	Lance Yang <lance.yang@linux.dev>,
	Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v2 1/9] mm/huge_memory: move more common code into insert_pmd()
Date: Thu, 17 Jul 2025 13:52:04 +0200
Message-ID: <20250717115212.1825089-2-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717115212.1825089-1-david@redhat.com>
References: <20250717115212.1825089-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EIvvH-GUHdxIYUW9xo6Zu1aCKZtg_UHT9g1S034au28_1752753138
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Let's clean it all further up.

No functional change intended.

Reviewed-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 72 ++++++++++++++++--------------------------------
 1 file changed, 24 insertions(+), 48 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index fe17b0a157cda..1178760d2eda4 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1390,15 +1390,25 @@ struct folio_or_pfn {
 	bool is_folio;
 };
 
-static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
+static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 		pmd_t *pmd, struct folio_or_pfn fop, pgprot_t prot,
-		bool write, pgtable_t pgtable)
+		bool write)
 {
 	struct mm_struct *mm = vma->vm_mm;
+	pgtable_t pgtable = NULL;
+	spinlock_t *ptl;
 	pmd_t entry;
 
-	lockdep_assert_held(pmd_lockptr(mm, pmd));
+	if (addr < vma->vm_start || addr >= vma->vm_end)
+		return VM_FAULT_SIGBUS;
 
+	if (arch_needs_pgtable_deposit()) {
+		pgtable = pte_alloc_one(vma->vm_mm);
+		if (!pgtable)
+			return VM_FAULT_OOM;
+	}
+
+	ptl = pmd_lock(mm, pmd);
 	if (!pmd_none(*pmd)) {
 		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
 					  fop.pfn;
@@ -1406,15 +1416,14 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 		if (write) {
 			if (pmd_pfn(*pmd) != pfn) {
 				WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
-				return -EEXIST;
+				goto out_unlock;
 			}
 			entry = pmd_mkyoung(*pmd);
 			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
 			if (pmdp_set_access_flags(vma, addr, pmd, entry, 1))
 				update_mmu_cache_pmd(vma, addr, pmd);
 		}
-
-		return -EEXIST;
+		goto out_unlock;
 	}
 
 	if (fop.is_folio) {
@@ -1435,11 +1444,17 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 	if (pgtable) {
 		pgtable_trans_huge_deposit(mm, pmd, pgtable);
 		mm_inc_nr_ptes(mm);
+		pgtable = NULL;
 	}
 
 	set_pmd_at(mm, addr, pmd, entry);
 	update_mmu_cache_pmd(vma, addr, pmd);
-	return 0;
+
+out_unlock:
+	spin_unlock(ptl);
+	if (pgtable)
+		pte_free(mm, pgtable);
+	return VM_FAULT_NOPAGE;
 }
 
 /**
@@ -1461,9 +1476,6 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn,
 	struct folio_or_pfn fop = {
 		.pfn = pfn,
 	};
-	pgtable_t pgtable = NULL;
-	spinlock_t *ptl;
-	int error;
 
 	/*
 	 * If we had pmd_special, we could avoid all these restrictions,
@@ -1475,25 +1487,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn,
 						(VM_PFNMAP|VM_MIXEDMAP));
 	BUG_ON((vma->vm_flags & VM_PFNMAP) && is_cow_mapping(vma->vm_flags));
 
-	if (addr < vma->vm_start || addr >= vma->vm_end)
-		return VM_FAULT_SIGBUS;
-
-	if (arch_needs_pgtable_deposit()) {
-		pgtable = pte_alloc_one(vma->vm_mm);
-		if (!pgtable)
-			return VM_FAULT_OOM;
-	}
-
 	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
 
-	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
-	error = insert_pmd(vma, addr, vmf->pmd, fop, pgprot, write,
-			   pgtable);
-	spin_unlock(ptl);
-	if (error && pgtable)
-		pte_free(vma->vm_mm, pgtable);
-
-	return VM_FAULT_NOPAGE;
+	return insert_pmd(vma, addr, vmf->pmd, fop, pgprot, write);
 }
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pmd);
 
@@ -1502,35 +1498,15 @@ vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio,
 {
 	struct vm_area_struct *vma = vmf->vma;
 	unsigned long addr = vmf->address & PMD_MASK;
-	struct mm_struct *mm = vma->vm_mm;
 	struct folio_or_pfn fop = {
 		.folio = folio,
 		.is_folio = true,
 	};
-	spinlock_t *ptl;
-	pgtable_t pgtable = NULL;
-	int error;
-
-	if (addr < vma->vm_start || addr >= vma->vm_end)
-		return VM_FAULT_SIGBUS;
 
 	if (WARN_ON_ONCE(folio_order(folio) != PMD_ORDER))
 		return VM_FAULT_SIGBUS;
 
-	if (arch_needs_pgtable_deposit()) {
-		pgtable = pte_alloc_one(vma->vm_mm);
-		if (!pgtable)
-			return VM_FAULT_OOM;
-	}
-
-	ptl = pmd_lock(mm, vmf->pmd);
-	error = insert_pmd(vma, addr, vmf->pmd, fop, vma->vm_page_prot,
-			   write, pgtable);
-	spin_unlock(ptl);
-	if (error && pgtable)
-		pte_free(mm, pgtable);
-
-	return VM_FAULT_NOPAGE;
+	return insert_pmd(vma, addr, vmf->pmd, fop, vma->vm_page_prot, write);
 }
 EXPORT_SYMBOL_GPL(vmf_insert_folio_pmd);
 
-- 
2.50.1


