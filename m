Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31664B05BD9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044073.1414180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdq-00063a-Ui; Tue, 15 Jul 2025 13:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044073.1414180; Tue, 15 Jul 2025 13:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdq-00060q-QE; Tue, 15 Jul 2025 13:24:18 +0000
Received: by outflank-mailman (input) for mailman id 1044073;
 Tue, 15 Jul 2025 13:24:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVo=Z4=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ubfdo-0003wf-A5
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:24:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff96316b-617e-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 15:24:14 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-RWu_D_W2MmaUrqJSiBrlWQ-1; Tue, 15 Jul 2025 09:24:11 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-455e9e09afeso19701205e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 06:24:11 -0700 (PDT)
Received: from localhost
 (p200300d82f2849002c244e201f219fbd.dip0.t-ipconnect.de.
 [2003:d8:2f28:4900:2c24:4e20:1f21:9fbd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8e2710bsm15102268f8f.99.2025.07.15.06.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 06:24:08 -0700 (PDT)
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
X-Inumbo-ID: ff96316b-617e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752585852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cI2lHUCMuK2zQhlnl2y4PjQd6rkotpnK5tiH1r4owRs=;
	b=b66qwkLF/RKUaO+K2pYKUXdeLMt24iBRoY90VWUIGFc2g64h75ffkwJt9LmkbYPqmFRyh/
	AGJDpfsW+IJFz06yKqotOzQ0sDOALNcMmaMEUv6HYHtey5w9WsgTJnPma7uh/yB5twr27q
	zWITw34R5dE8nW2GY4nCEfLUX1FhUu8=
X-MC-Unique: RWu_D_W2MmaUrqJSiBrlWQ-1
X-Mimecast-MFC-AGG-ID: RWu_D_W2MmaUrqJSiBrlWQ_1752585850
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585850; x=1753190650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cI2lHUCMuK2zQhlnl2y4PjQd6rkotpnK5tiH1r4owRs=;
        b=tTZMfzVThKRIzRTfrY6K5hH3HR5Qs2Z0eBBfHKvw7sHYZqsC3H3wQCuHcKOFcLOz8n
         wxm4heLEU35RgMgiRw5Ycrqw+X/wdnm9S9sjHlihr8HWuMvpKs/4qWt8t+kRnY30I2YN
         0Rci34USXP8I+g7sJ/LF+JPGJwKy4BL0zz2rN1ip0rPawRJ0mLG3ho0VWgBllepMezEp
         U7cW/T40YWSSIxqvM+adp4+elIOucOZKYSqgEgtqSLKsM62mClAAxraGRjC15j2I3SbI
         BY8Pjv88PqiuUXXP1YaAAdkv91eZzeZTFygjb+RyzuMWswrJMlF8Ta13iL5oF4bYjcZJ
         0mIA==
X-Forwarded-Encrypted: i=1; AJvYcCUGl45IeM6xYJ81YJwcGRCGw1S0jPaGvtsMkroJg/htclq1KCNOz7AzRdjt0IbVV5h9FsJS0ynmMsE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywuo5do25p9FQ5os8HagnRubJcRdKvHxcDADm7rDtVzrMyG3HJQ
	W5zTA1QViec6DSD+AA7Wp9wqovyE666KYxBmvaiiAL9WxPFEoEPpJySruxryHchZMl5Bek1qGUY
	LJwDAJiXVAqx2Vp9avEQWxQm9iLVYEluSW7MzMtTRrllkHvt+N/ZfCbUo89uOIV5wkXpX
X-Gm-Gg: ASbGnctzdfKSnp2AXOSNBBw1iAZJGgaDvDWPW5LviWJSRUHPZla3ocUgh7k36s9v0m1
	dJ5FvGMu7Fl3tmZZqp7p8BaWRcvHEOoUgI8De04Le03yc9Q3OekBaReElb1elF8Ax3VJ4SNv+/X
	fyj4BVhnDNi55ofgk8joMfuRJcANx6EvJRurirMI80lMU8oIELGYKaJ7vS/m0BicYkAL1cQyKbM
	Xv7K+XBjRwLIMy9BEuRC9LqOIoSSsaf/DRjc+qtvsV4Ee4osafl/VK4aMspkYnjCcWnzwYRbCNp
	7zJKMjGyKsDvvt3FnROCrW913tDmRv/gJSoJ9RCckzKO8xdQP4G/AxKCP/T3sE9h0fqp3cGPvxV
	/dTyGKpK1zMi+iGHzvYBejpKd
X-Received: by 2002:a05:600c:3592:b0:456:173c:8a53 with SMTP id 5b1f17b1804b1-456173c8b27mr94728815e9.2.1752585849655;
        Tue, 15 Jul 2025 06:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkPjEhwUD11Kc7R628CsdkyUBojyPzeegGbQKL/YV/Ocaib7+IW0nyg3EFT/AEMoIuz4CMUw==
X-Received: by 2002:a05:600c:3592:b0:456:173c:8a53 with SMTP id 5b1f17b1804b1-456173c8b27mr94728115e9.2.1752585848983;
        Tue, 15 Jul 2025 06:24:08 -0700 (PDT)
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
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v1 7/9] mm/memory: factor out common code from vm_normal_page_*()
Date: Tue, 15 Jul 2025 15:23:48 +0200
Message-ID: <20250715132350.2448901-8-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715132350.2448901-1-david@redhat.com>
References: <20250715132350.2448901-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1fDsbjeqqv3298DMyApglyLWIIHEZoXIj0l9AsVzx5k_1752585850
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Let's reduce the code duplication and factor out the non-pte/pmd related
magic into vm_normal_page_pfn().

To keep it simpler, check the pfn against both zero folios. We could
optimize this, but as it's only for the !CONFIG_ARCH_HAS_PTE_SPECIAL
case, it's not a compelling micro-optimization.

With CONFIG_ARCH_HAS_PTE_SPECIAL we don't have to check anything else,
really.

It's a good question if we can even hit the !CONFIG_ARCH_HAS_PTE_SPECIAL
scenario in the PMD case in practice: but doesn't really matter, as
it's now all unified in vm_normal_page_pfn().

Add kerneldoc for all involved functions.

No functional change intended.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 183 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 109 insertions(+), 74 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 00ee0df020503..d5f80419989b9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -596,8 +596,13 @@ static void print_bad_page_map(struct vm_area_struct *vma,
 	add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
 }
 
-/*
- * vm_normal_page -- This function gets the "struct page" associated with a pte.
+/**
+ * vm_normal_page_pfn() - Get the "struct page" associated with a PFN in a
+ *			  non-special page table entry.
+ * @vma: The VMA mapping the @pfn.
+ * @addr: The address where the @pfn is mapped.
+ * @pfn: The PFN.
+ * @entry: The page table entry value for error reporting purposes.
  *
  * "Special" mappings do not wish to be associated with a "struct page" (either
  * it doesn't exist, or it exists but they don't want to touch it). In this
@@ -609,10 +614,10 @@ static void print_bad_page_map(struct vm_area_struct *vma,
  * (such as GUP) can still identify these mappings and work with the
  * underlying "struct page".
  *
- * There are 2 broad cases. Firstly, an architecture may define a pte_special()
- * pte bit, in which case this function is trivial. Secondly, an architecture
- * may not have a spare pte bit, which requires a more complicated scheme,
- * described below.
+ * There are 2 broad cases. Firstly, an architecture may define a "special"
+ * page table entry bit (e.g., pte_special()), in which case this function is
+ * trivial. Secondly, an architecture may not have a spare page table
+ * entry bit, which requires a more complicated scheme, described below.
  *
  * A raw VM_PFNMAP mapping (ie. one that is not COWed) is always considered a
  * special mapping (even if there are underlying and valid "struct pages").
@@ -645,15 +650,72 @@ static void print_bad_page_map(struct vm_area_struct *vma,
  * don't have to follow the strict linearity rule of PFNMAP mappings in
  * order to support COWable mappings.
  *
+ * This function is not expected to be called for obviously special mappings:
+ * when the page table entry has the "special" bit set.
+ *
+ * Return: Returns the "struct page" if this is a "normal" mapping. Returns
+ *	   NULL if this is a "special" mapping.
+ */
+static inline struct page *vm_normal_page_pfn(struct vm_area_struct *vma,
+		unsigned long addr, unsigned long pfn, unsigned long long entry)
+{
+	/*
+	 * With CONFIG_ARCH_HAS_PTE_SPECIAL, any special page table mappings
+	 * (incl. shared zero folios) are marked accordingly and are handled
+	 * by the caller.
+	 */
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL)) {
+		if (unlikely(vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))) {
+			if (vma->vm_flags & VM_MIXEDMAP) {
+				/* If it has a "struct page", it's "normal". */
+				if (!pfn_valid(pfn))
+					return NULL;
+			} else {
+				unsigned long off = (addr - vma->vm_start) >> PAGE_SHIFT;
+
+				/* Only CoW'ed anon folios are "normal". */
+				if (pfn == vma->vm_pgoff + off)
+					return NULL;
+				if (!is_cow_mapping(vma->vm_flags))
+					return NULL;
+			}
+		}
+
+		if (is_zero_pfn(pfn) || is_huge_zero_pfn(pfn))
+			return NULL;
+	}
+
+	/* Cheap check for corrupted page table entries. */
+	if (pfn > highest_memmap_pfn) {
+		print_bad_page_map(vma, addr, entry, NULL);
+		return NULL;
+	}
+	/*
+	 * NOTE! We still have PageReserved() pages in the page tables.
+	 * For example, VDSO mappings can cause them to exist.
+	 */
+	VM_WARN_ON_ONCE(is_zero_pfn(pfn) || is_huge_zero_pfn(pfn));
+	return pfn_to_page(pfn);
+}
+
+/**
+ * vm_normal_page() - Get the "struct page" associated with a PTE
+ * @vma: The VMA mapping the @pte.
+ * @addr: The address where the @pte is mapped.
+ * @pte: The PTE.
+ *
+ * Get the "struct page" associated with a PTE. See vm_normal_page_pfn()
+ * for details.
+ *
+ * Return: Returns the "struct page" if this is a "normal" mapping. Returns
+ *	   NULL if this is a "special" mapping.
  */
 struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 			    pte_t pte)
 {
 	unsigned long pfn = pte_pfn(pte);
 
-	if (IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL)) {
-		if (likely(!pte_special(pte)))
-			goto check_pfn;
+	if (unlikely(pte_special(pte))) {
 		if (vma->vm_ops && vma->vm_ops->find_special_page)
 			return vma->vm_ops->find_special_page(vma, addr);
 		if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
@@ -664,44 +726,21 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 		print_bad_page_map(vma, addr, pte_val(pte), NULL);
 		return NULL;
 	}
-
-	/* !CONFIG_ARCH_HAS_PTE_SPECIAL case follows: */
-
-	if (unlikely(vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP))) {
-		if (vma->vm_flags & VM_MIXEDMAP) {
-			if (!pfn_valid(pfn))
-				return NULL;
-			if (is_zero_pfn(pfn))
-				return NULL;
-			goto out;
-		} else {
-			unsigned long off;
-			off = (addr - vma->vm_start) >> PAGE_SHIFT;
-			if (pfn == vma->vm_pgoff + off)
-				return NULL;
-			if (!is_cow_mapping(vma->vm_flags))
-				return NULL;
-		}
-	}
-
-	if (is_zero_pfn(pfn))
-		return NULL;
-
-check_pfn:
-	if (unlikely(pfn > highest_memmap_pfn)) {
-		print_bad_page_map(vma, addr, pte_val(pte), NULL);
-		return NULL;
-	}
-
-	/*
-	 * NOTE! We still have PageReserved() pages in the page tables.
-	 * eg. VDSO mappings can cause them to exist.
-	 */
-out:
-	VM_WARN_ON_ONCE(is_zero_pfn(pfn));
-	return pfn_to_page(pfn);
+	return vm_normal_page_pfn(vma, addr, pfn, pte_val(pte));
 }
 
+/**
+ * vm_normal_folio() - Get the "struct folio" associated with a PTE
+ * @vma: The VMA mapping the @pte.
+ * @addr: The address where the @pte is mapped.
+ * @pte: The PTE.
+ *
+ * Get the "struct folio" associated with a PTE. See vm_normal_page_pfn()
+ * for details.
+ *
+ * Return: Returns the "struct folio" if this is a "normal" mapping. Returns
+ *	   NULL if this is a "special" mapping.
+ */
 struct folio *vm_normal_folio(struct vm_area_struct *vma, unsigned long addr,
 			    pte_t pte)
 {
@@ -713,6 +752,18 @@ struct folio *vm_normal_folio(struct vm_area_struct *vma, unsigned long addr,
 }
 
 #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
+/**
+ * vm_normal_page_pmd() - Get the "struct page" associated with a PMD
+ * @vma: The VMA mapping the @pmd.
+ * @addr: The address where the @pmd is mapped.
+ * @pmd: The PMD.
+ *
+ * Get the "struct page" associated with a PMD. See vm_normal_page_pfn()
+ * for details.
+ *
+ * Return: Returns the "struct page" if this is a "normal" mapping. Returns
+ *	   NULL if this is a "special" mapping.
+ */
 struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 				pmd_t pmd)
 {
@@ -727,37 +778,21 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 		print_bad_page_map(vma, addr, pmd_val(pmd), NULL);
 		return NULL;
 	}
-
-	if (unlikely(vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP))) {
-		if (vma->vm_flags & VM_MIXEDMAP) {
-			if (!pfn_valid(pfn))
-				return NULL;
-			goto out;
-		} else {
-			unsigned long off;
-			off = (addr - vma->vm_start) >> PAGE_SHIFT;
-			if (pfn == vma->vm_pgoff + off)
-				return NULL;
-			if (!is_cow_mapping(vma->vm_flags))
-				return NULL;
-		}
-	}
-
-	if (is_huge_zero_pfn(pfn))
-		return NULL;
-	if (unlikely(pfn > highest_memmap_pfn)) {
-		print_bad_page_map(vma, addr, pmd_val(pmd), NULL);
-		return NULL;
-	}
-
-	/*
-	 * NOTE! We still have PageReserved() pages in the page tables.
-	 * eg. VDSO mappings can cause them to exist.
-	 */
-out:
-	return pfn_to_page(pfn);
+	return vm_normal_page_pfn(vma, addr, pfn, pmd_val(pmd));
 }
 
+/**
+ * vm_normal_folio_pmd() - Get the "struct folio" associated with a PMD
+ * @vma: The VMA mapping the @pmd.
+ * @addr: The address where the @pmd is mapped.
+ * @pmd: The PMD.
+ *
+ * Get the "struct folio" associated with a PMD. See vm_normal_page_pfn()
+ * for details.
+ *
+ * Return: Returns the "struct folio" if this is a "normal" mapping. Returns
+ *	   NULL if this is a "special" mapping.
+ */
 struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 				  unsigned long addr, pmd_t pmd)
 {
-- 
2.50.1


