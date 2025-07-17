Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A42B08C06
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 13:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046617.1417024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNAJ-0003Lc-EO; Thu, 17 Jul 2025 11:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046617.1417024; Thu, 17 Jul 2025 11:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNAJ-0003JJ-9B; Thu, 17 Jul 2025 11:52:43 +0000
Received: by outflank-mailman (input) for mailman id 1046617;
 Thu, 17 Jul 2025 11:52:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiP3=Z6=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ucNAH-0001TV-KI
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 11:52:41 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88c74ac7-6304-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 13:52:38 +0200 (CEST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-zqNo8uIAM62IBwmAZEEJhQ-1; Thu, 17 Jul 2025 07:52:34 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4f7f1b932so563421f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 04:52:33 -0700 (PDT)
Received: from localhost
 (p200300d82f1f36000dc826ee9aa9fdc7.dip0.t-ipconnect.de.
 [2003:d8:2f1f:3600:dc8:26ee:9aa9:fdc7])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45634ec9162sm20451645e9.0.2025.07.17.04.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 04:52:31 -0700 (PDT)
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
X-Inumbo-ID: 88c74ac7-6304-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752753157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6ocb38IkVcnlHaJeHNVb3Jrmzmc76tJoqI7g7ZBmQA=;
	b=LwcilLDLfgeRCmoiCuwYwHVWWlIjWgNT1izgO+mMzfl/vLNUWzS63EIrZAIaoZREUl5mCm
	IpT6PMW6V/xOXGUkfmwWJU+EJI5iJoG0k3E7+eB/Xfu5SfbMr1JrcQiwTl8RKp0KYz2SFm
	tTRBzkNTGsizNHmhhtHckbCRiE7/Wlg=
X-MC-Unique: zqNo8uIAM62IBwmAZEEJhQ-1
X-Mimecast-MFC-AGG-ID: zqNo8uIAM62IBwmAZEEJhQ_1752753153
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753153; x=1753357953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6ocb38IkVcnlHaJeHNVb3Jrmzmc76tJoqI7g7ZBmQA=;
        b=uxM+6A3iHS6ZZyyAXBNJ+KMuIBgEmX9brqL8dE1KArz9FTnKz9oE1nidNnDToMIUwX
         Yx+6e04zyXmU3419kS+onfxN+DSl3ayEyfJ/Y/mTpslTWU22kvPMI7Fh3GYr25+4fNZP
         dbKCkkCQT9VAdFwYpzkEF9wR4ABzXrgLUPBxrh6M9DC29712r5jyBkWEK99SJcJl5gGK
         lvuhgsojE8ygehKkApSSLV8XTI5LPqzSIH4+2Mqz28Va60GpuKrwWB+w8bx3LA/c/j09
         qYS3ly08aXULsq4dZyy7wXWvVNgxpPA5YK5bn5+TLr047paq4KQ3J8pkKg+/x0dBD6I4
         umZA==
X-Forwarded-Encrypted: i=1; AJvYcCWqwboSJ9PIyKHMQoK9UAMuew3iFOpaK4+h6qMdePrU4T4HKn4j4slpvVlOrYcC0AeFlo8kRpXkeGU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuxApq0PsSM/oUYv3wJ/9OZ+CzAKnQSCvAxuVA+YyqjIQLfhVp
	WZaDF+fb1nBJ7apAAcM9fG4sv7g88Z62jkUCZcGRfZ6ktsq8c0qglCfT7k2jxvfTH2srFFXgX5x
	3s9TZZj3RK3KOYt7ktJuc77B+Xm2PpMwDw4F5VErw6eHBRhhiIqSUWOA6agwWiRczeufK
X-Gm-Gg: ASbGncusQAH+pTlQr2ODXRZDYmcdCiEsXmxX3YYvqr/eyUrVNycs41+QmiJGrNTaf2T
	BMM1gXrY5EI3YHq7Ia8Z4g/W+JCoDK4dSQn1MsDCEBLQRglr45B6hUv+9Tdq61g2ftWArUz86hW
	rmNlgLvi1Y5u3Jwvb6eifc7ZuO1D7QgNu0pdS7dGSL7QnMpBHhSN4k8Ul1A0PtEHQ5TnOPWq/p3
	EDOWYlKQphr/VM2kjyEs1SDJKLPZne4qKpjuVuQlRWc5RftWOInSc1FHRrzR9y+8sUUVuIq/3+V
	zOQ1cpGzjleGLFahiJ2amqNNd9cH52Wtn/TTuBiRVPL7FdICDsD6F+plJWzC/mZXIv/iUFiD4pX
	+WUpSb8JCbF6B9z5oqOUJhAQ=
X-Received: by 2002:a05:6000:43c6:10b0:3a4:f744:e01b with SMTP id ffacd0b85a97d-3b60e50fde7mr3995244f8f.39.1752753152624;
        Thu, 17 Jul 2025 04:52:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLcgp48Noardv8I0f6W2NZTd1NV9HbsxHjW8GgnbNobVHwjA5VMkKS9pv04KvpTaqXa6tubA==
X-Received: by 2002:a05:6000:43c6:10b0:3a4:f744:e01b with SMTP id ffacd0b85a97d-3b60e50fde7mr3995202f8f.39.1752753152069;
        Thu, 17 Jul 2025 04:52:32 -0700 (PDT)
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
Subject: [PATCH v2 7/9] mm/memory: factor out common code from vm_normal_page_*()
Date: Thu, 17 Jul 2025 13:52:10 +0200
Message-ID: <20250717115212.1825089-8-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717115212.1825089-1-david@redhat.com>
References: <20250717115212.1825089-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JPw4XTVDYFzyLXlRMBo8KCEGh25hQYBd-JqOrUfmCVk_1752753153
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

Reviewed-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 183 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 109 insertions(+), 74 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 08d16ed7b4cc7..c43ae5e4d7644 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -590,8 +590,13 @@ static void print_bad_page_map(struct vm_area_struct *vma,
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
@@ -603,10 +608,10 @@ static void print_bad_page_map(struct vm_area_struct *vma,
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
@@ -639,15 +644,72 @@ static void print_bad_page_map(struct vm_area_struct *vma,
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
@@ -658,44 +720,21 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
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
@@ -707,6 +746,18 @@ struct folio *vm_normal_folio(struct vm_area_struct *vma, unsigned long addr,
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
@@ -721,37 +772,21 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
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


