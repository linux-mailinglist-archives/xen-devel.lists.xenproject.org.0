Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907A7B08C0C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 13:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046612.1417014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNAF-0002ws-41; Thu, 17 Jul 2025 11:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046612.1417014; Thu, 17 Jul 2025 11:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNAE-0002u8-Vq; Thu, 17 Jul 2025 11:52:38 +0000
Received: by outflank-mailman (input) for mailman id 1046612;
 Thu, 17 Jul 2025 11:52:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiP3=Z6=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ucNAD-0001TV-Ji
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 11:52:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 876bfdd8-6304-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 13:52:36 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-gQ-9PncEOP2ucXOPAkRmUA-1; Thu, 17 Jul 2025 07:52:31 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45597cc95d5so4557355e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 04:52:31 -0700 (PDT)
Received: from localhost
 (p200300d82f1f36000dc826ee9aa9fdc7.dip0.t-ipconnect.de.
 [2003:d8:2f1f:3600:dc8:26ee:9aa9:fdc7])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45626c7b1a9sm45953235e9.0.2025.07.17.04.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 04:52:29 -0700 (PDT)
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
X-Inumbo-ID: 876bfdd8-6304-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752753154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GbR0phC2X7fIX30bxtjDJxvlOXqw8t3nlah85Ck4RFM=;
	b=U11oFUPwSgFforW31IQ3ERgYF9VPlP23HVKfearb2qtijLkm1Vd9BisAsKGTxvCdeCAlzX
	D2EFa0NU2IKTInvt0v3G2DTM7kF8iMpS4k8a2dwjABlYuw0kV16mwiHsj6nyVgR3UdtuN0
	3K0NwrKrMsvFx5zBjdSv+aoJ5+abxZE=
X-MC-Unique: gQ-9PncEOP2ucXOPAkRmUA-1
X-Mimecast-MFC-AGG-ID: gQ-9PncEOP2ucXOPAkRmUA_1752753150
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753150; x=1753357950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbR0phC2X7fIX30bxtjDJxvlOXqw8t3nlah85Ck4RFM=;
        b=T63m+ZuDn3HpkBDSz2hPucdZ4xa1MalhvlXaq0KUXf0xsgDlyQtwdPTNF3K6/U4C0k
         6Z400kwJX96qw6bj3bBO6gI2p446R0Oof8Zkfvg8n4T+t8htY+rncCEqo7pIQinIjC5u
         iPhmUQyHGzh/RstzpPqnfE/UV+LygsTFWsT/NYRg6KXSlzFmV5U/vMTms7sU0a6XrxNJ
         UQf/vFpY3mzF3WnakezaQMPUme/BRTdaoV5WXvYOgs7cY8rZ0rSqDWdgDNGdt4fJ0sPA
         DlpVu8B01fvhF6KBNv9NSERnxW5Iz0mc6We7I2SCnH/w5kXDBjxbZlxXWTLbbe6S+/7d
         rYjA==
X-Forwarded-Encrypted: i=1; AJvYcCWa6h5Q783eQUSwotlHMStLuPVtUBM3kZ6LTUiSFaeKL8Pqrnw9iA0rtH6pi1vcEHSDKRxZS3zPDVw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyy0OFxrMdswQN/Li9Wv6urM5iq+L4fv4aldvn8PfJGfgSAXoQx
	bdOpF33c3K08ByCAVNZ60k1Oen0pZXxBUcHyQlc4OyiRCHDjHA4ylBuHbAlvMfBs+6y0JPlHI1T
	g+m74162hsqDppKAskJzon0Um6iP6LikK7gFyCyofv+t+Fu9GELQgPnxfHYyhkHtjlH2V
X-Gm-Gg: ASbGncutk1ZVZh8q9UvpU6v5rPoBLeHIWmQXvq1AGHPxpv+4n1XqyS8q5gX3Ucf1wFa
	htkJEaDxWfcRqL+dN0NsD234zXTbmU8eaC4utWIGK4BIC3MwqIWK8tvQXUm6s2lU6/ZQVYwuAMm
	TfMyeuj3l6Ug4RrB64zccmO12tARo6eoPuz4rhNKSYTtzR9zFT/ifcXhU7YAuFSeXJx9UttDs7n
	VcXeeQx5E2wGJGjEFHvtgv76GrTd+AnX/Fo7uh7lfvucucuvTAz7nZE0atM9H1Pp9G+rATfJS0F
	wKoGFwoYSUEaSwubIPlKHEnGeyRL5ZZBSiNK1134b+6F6odAaGg9CXp3rBOQgvMsNEzwqECgp3N
	VE3rHL1P6ntJ3yQDzGTDX+2A=
X-Received: by 2002:a05:600c:4706:b0:456:19eb:2e09 with SMTP id 5b1f17b1804b1-4562edaa08cmr59716035e9.8.1752753150340;
        Thu, 17 Jul 2025 04:52:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxGF6l6GEGtw18Sa0l+0UWiR0a/WM3dG6MbtHwia3ILIrxrhuz79ecySj7OKZMvEeK7lnwGw==
X-Received: by 2002:a05:600c:4706:b0:456:19eb:2e09 with SMTP id 5b1f17b1804b1-4562edaa08cmr59715535e9.8.1752753149770;
        Thu, 17 Jul 2025 04:52:29 -0700 (PDT)
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
Subject: [PATCH v2 6/9] mm/memory: convert print_bad_pte() to print_bad_page_map()
Date: Thu, 17 Jul 2025 13:52:09 +0200
Message-ID: <20250717115212.1825089-7-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717115212.1825089-1-david@redhat.com>
References: <20250717115212.1825089-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GMMhRS21kUgNOgN3Mp_r7bU0_EavYb4nvOtTUVGE2PA_1752753150
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

print_bad_pte() looks like something that should actually be a WARN
or similar, but historically it apparently has proven to be useful to
detect corruption of page tables even on production systems -- report
the issue and keep the system running to make it easier to actually detect
what is going wrong (e.g., multiple such messages might shed a light).

As we want to unify vm_normal_page_*() handling for PTE/PMD/PUD, we'll have
to take care of print_bad_pte() as well.

Let's prepare for using print_bad_pte() also for non-PTEs by adjusting the
implementation and renaming the function -- we'll rename it to what
we actually print: bad (page) mappings. Maybe it should be called
"print_bad_table_entry()"? We'll just call it "print_bad_page_map()"
because the assumption is that we are dealing with some (previously)
present page table entry that got corrupted in weird ways.

Whether it is a PTE or something else will usually become obvious from the
page table dump or from the dumped stack. If ever required in the future,
we could pass the entry level type similar to "enum rmap_level". For now,
let's keep it simple.

To make the function a bit more readable, factor out the ratelimit check
into is_bad_page_map_ratelimited() and place the dumping of page
table content into __dump_bad_page_map_pgtable(). We'll now dump
information from each level in a single line, and just stop the table
walk once we hit something that is not a present page table.

Use print_bad_page_map() in vm_normal_page_pmd() similar to how we do it
for vm_normal_page(), now that we have a function that can handle it.

The report will now look something like (dumping pgd to pmd values):

[   77.943408] BUG: Bad page map in process XXX  entry:80000001233f5867
[   77.944077] addr:00007fd84bb1c000 vm_flags:08100071 anon_vma: ...
[   77.945186] pgd:10a89f067 p4d:10a89f067 pud:10e5a2067 pmd:105327067

Not using pgdp_get(), because that does not work properly on some arm
configs where pgd_t is an array. Note that we are dumping all levels
even when levels are folded for simplicity.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 120 ++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 94 insertions(+), 26 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 173eb6267e0ac..08d16ed7b4cc7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -473,22 +473,8 @@ static inline void add_mm_rss_vec(struct mm_struct *mm, int *rss)
 			add_mm_counter(mm, i, rss[i]);
 }
 
-/*
- * This function is called to print an error when a bad pte
- * is found. For example, we might have a PFN-mapped pte in
- * a region that doesn't allow it.
- *
- * The calling function must still handle the error.
- */
-static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
-			  pte_t pte, struct page *page)
+static bool is_bad_page_map_ratelimited(void)
 {
-	pgd_t *pgd = pgd_offset(vma->vm_mm, addr);
-	p4d_t *p4d = p4d_offset(pgd, addr);
-	pud_t *pud = pud_offset(p4d, addr);
-	pmd_t *pmd = pmd_offset(pud, addr);
-	struct address_space *mapping;
-	pgoff_t index;
 	static unsigned long resume;
 	static unsigned long nr_shown;
 	static unsigned long nr_unshown;
@@ -500,7 +486,7 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
 	if (nr_shown == 60) {
 		if (time_before(jiffies, resume)) {
 			nr_unshown++;
-			return;
+			return true;
 		}
 		if (nr_unshown) {
 			pr_alert("BUG: Bad page map: %lu messages suppressed\n",
@@ -511,15 +497,87 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
 	}
 	if (nr_shown++ == 0)
 		resume = jiffies + 60 * HZ;
+	return false;
+}
+
+static void __dump_bad_page_map_pgtable(struct mm_struct *mm, unsigned long addr)
+{
+	unsigned long long pgdv, p4dv, pudv, pmdv;
+	p4d_t p4d, *p4dp;
+	pud_t pud, *pudp;
+	pmd_t pmd, *pmdp;
+	pgd_t *pgdp;
+
+	/*
+	 * This looks like a fully lockless walk, however, the caller is
+	 * expected to hold the leaf page table lock in addition to other
+	 * rmap/mm/vma locks. So this is just a re-walk to dump page table
+	 * content while any concurrent modifications should be completely
+	 * prevented.
+	 */
+	pgdp = pgd_offset(mm, addr);
+	pgdv = pgd_val(*pgdp);
+
+	if (!pgd_present(*pgdp) || pgd_leaf(*pgdp)) {
+		pr_alert("pgd:%08llx\n", pgdv);
+		return;
+	}
+
+	p4dp = p4d_offset(pgdp, addr);
+	p4d = p4dp_get(p4dp);
+	p4dv = p4d_val(p4d);
+
+	if (!p4d_present(p4d) || p4d_leaf(p4d)) {
+		pr_alert("pgd:%08llx p4d:%08llx\n", pgdv, p4dv);
+		return;
+	}
+
+	pudp = pud_offset(p4dp, addr);
+	pud = pudp_get(pudp);
+	pudv = pud_val(pud);
+
+	if (!pud_present(pud) || pud_leaf(pud)) {
+		pr_alert("pgd:%08llx p4d:%08llx pud:%08llx\n", pgdv, p4dv, pudv);
+		return;
+	}
+
+	pmdp = pmd_offset(pudp, addr);
+	pmd = pmdp_get(pmdp);
+	pmdv = pmd_val(pmd);
+
+	/*
+	 * Dumping the PTE would be nice, but it's tricky with CONFIG_HIGHPTE,
+	 * because the table should already be mapped by the caller and
+	 * doing another map would be bad. print_bad_page_map() should
+	 * already take care of printing the PTE.
+	 */
+	pr_alert("pgd:%08llx p4d:%08llx pud:%08llx pmd:%08llx\n", pgdv,
+		 p4dv, pudv, pmdv);
+}
+
+/*
+ * This function is called to print an error when a bad page table entry (e.g.,
+ * corrupted page table entry) is found. For example, we might have a
+ * PFN-mapped pte in a region that doesn't allow it.
+ *
+ * The calling function must still handle the error.
+ */
+static void print_bad_page_map(struct vm_area_struct *vma,
+		unsigned long addr, unsigned long long entry, struct page *page)
+{
+	struct address_space *mapping;
+	pgoff_t index;
+
+	if (is_bad_page_map_ratelimited())
+		return;
 
 	mapping = vma->vm_file ? vma->vm_file->f_mapping : NULL;
 	index = linear_page_index(vma, addr);
 
-	pr_alert("BUG: Bad page map in process %s  pte:%08llx pmd:%08llx\n",
-		 current->comm,
-		 (long long)pte_val(pte), (long long)pmd_val(*pmd));
+	pr_alert("BUG: Bad page map in process %s  entry:%08llx", current->comm, entry);
+	__dump_bad_page_map_pgtable(vma->vm_mm, addr);
 	if (page)
-		dump_page(page, "bad pte");
+		dump_page(page, "bad page map");
 	pr_alert("addr:%px vm_flags:%08lx anon_vma:%px mapping:%px index:%lx\n",
 		 (void *)addr, vma->vm_flags, vma->anon_vma, mapping, index);
 	pr_alert("file:%pD fault:%ps mmap:%ps mmap_prepare: %ps read_folio:%ps\n",
@@ -597,7 +655,7 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 		if (is_zero_pfn(pfn))
 			return NULL;
 
-		print_bad_pte(vma, addr, pte, NULL);
+		print_bad_page_map(vma, addr, pte_val(pte), NULL);
 		return NULL;
 	}
 
@@ -625,7 +683,7 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 
 check_pfn:
 	if (unlikely(pfn > highest_memmap_pfn)) {
-		print_bad_pte(vma, addr, pte, NULL);
+		print_bad_page_map(vma, addr, pte_val(pte), NULL);
 		return NULL;
 	}
 
@@ -654,8 +712,15 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 {
 	unsigned long pfn = pmd_pfn(pmd);
 
-	if (unlikely(pmd_special(pmd)))
+	if (unlikely(pmd_special(pmd))) {
+		if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
+			return NULL;
+		if (is_huge_zero_pfn(pfn))
+			return NULL;
+
+		print_bad_page_map(vma, addr, pmd_val(pmd), NULL);
 		return NULL;
+	}
 
 	if (unlikely(vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP))) {
 		if (vma->vm_flags & VM_MIXEDMAP) {
@@ -674,8 +739,10 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 
 	if (is_huge_zero_pfn(pfn))
 		return NULL;
-	if (unlikely(pfn > highest_memmap_pfn))
+	if (unlikely(pfn > highest_memmap_pfn)) {
+		print_bad_page_map(vma, addr, pmd_val(pmd), NULL);
 		return NULL;
+	}
 
 	/*
 	 * NOTE! We still have PageReserved() pages in the page tables.
@@ -1509,7 +1576,7 @@ static __always_inline void zap_present_folio_ptes(struct mmu_gather *tlb,
 		folio_remove_rmap_ptes(folio, page, nr, vma);
 
 		if (unlikely(folio_mapcount(folio) < 0))
-			print_bad_pte(vma, addr, ptent, page);
+			print_bad_page_map(vma, addr, pte_val(ptent), page);
 	}
 	if (unlikely(__tlb_remove_folio_pages(tlb, page, nr, delay_rmap))) {
 		*force_flush = true;
@@ -4507,7 +4574,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		} else if (is_pte_marker_entry(entry)) {
 			ret = handle_pte_marker(vmf);
 		} else {
-			print_bad_pte(vma, vmf->address, vmf->orig_pte, NULL);
+			print_bad_page_map(vma, vmf->address,
+					   pte_val(vmf->orig_pte), NULL);
 			ret = VM_FAULT_SIGBUS;
 		}
 		goto out;
-- 
2.50.1


