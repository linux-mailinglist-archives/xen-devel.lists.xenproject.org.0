Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8C9B05BDA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044072.1414169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdp-0005nD-JH; Tue, 15 Jul 2025 13:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044072.1414169; Tue, 15 Jul 2025 13:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdp-0005kW-Dw; Tue, 15 Jul 2025 13:24:17 +0000
Received: by outflank-mailman (input) for mailman id 1044072;
 Tue, 15 Jul 2025 13:24:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVo=Z4=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ubfdn-0003wf-Dr
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:24:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff762ce5-617e-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 15:24:13 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-py5HwgK0MpWXq2jJutUlLA-1; Tue, 15 Jul 2025 09:24:09 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-451d30992bcso43743805e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 06:24:08 -0700 (PDT)
Received: from localhost
 (p200300d82f2849002c244e201f219fbd.dip0.t-ipconnect.de.
 [2003:d8:2f28:4900:2c24:4e20:1f21:9fbd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8bd1784sm15006827f8f.5.2025.07.15.06.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 06:24:06 -0700 (PDT)
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
X-Inumbo-ID: ff762ce5-617e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752585852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mtQyovPa5kcBmFcu8HFFL9PcOAuE/hqSO0jegAuRWN8=;
	b=WT1TnbNcgfHjpMQyu0/lWYX7Z66qCT9SIPXr7Q+D5RNa08w92BfgqSyRm+teWz7wWvWVyy
	Yd1N/7VLnJQ6vJmxjjqQBwWf2ybcY/vW8leDaqcev38nN0Gws+UZZa0IkwYN+y1xUH6gSX
	QsIAmYIDc6sK5O+GDrKh58mNSlJTBRM=
X-MC-Unique: py5HwgK0MpWXq2jJutUlLA-1
X-Mimecast-MFC-AGG-ID: py5HwgK0MpWXq2jJutUlLA_1752585848
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585847; x=1753190647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtQyovPa5kcBmFcu8HFFL9PcOAuE/hqSO0jegAuRWN8=;
        b=GBUmoetCKMKpKfTBmfM2JA1PFfhZZDcb5T1yf3dE65QwGM+dLiKfmZBD2uLvBiAT+K
         YE2WeBiVVFo8npUBRhNNDSfhHBcHiaFCAfEgEj6bmKcOCqxFbjuwIpV57aMDBicwW3rg
         lHYbzsymuX2SsAliPyTTXWt3cUInG+mip5FvW22/kj+2fCe1oEUqsIncV+M3rV36Xi9W
         bMt6p+waes5OpyW4JTohB9m7rmTY1rj0lZhML+Te/symyHmOzem+cahrP4JaDL0PWXCq
         TAX1QwkyH2o9pQ1+VoGMXVv+33tgoZ0Uv+L88FtXCLV+K9kxD+a4amX2rISmTHRBOXgv
         wjmg==
X-Forwarded-Encrypted: i=1; AJvYcCXfZcx6etMzsyhTPeHm64nIEksGoBiAv20q/s5uN5tP1ryufiijB5HfEWGRYfR0+BCvfy4SdNogFqE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxToVwxBZBZXi6PmDODqkEzQczWDG0+SerASIF+6OTWXfowYBoz
	oVyaW2mujwp1A0g0q+c3lKjiIXw0YiI47ieVyieWQuIFOLc9/Aflrb/Cvorlp63DNFvubt/61Tb
	8MMkx0qRA/vCLUZ3xSIdmwBaP9f9iu0ZAov9D6XAmy888h36SzzBQVGIwXuzoswJtVM0P
X-Gm-Gg: ASbGncu6NgaDEaXstQFUDOqAnvHDBYfxTycbK5t6APuDkjlAMrxzK2nprhR0PrS09X6
	oaW+Yv7D/n9xwBbg2S+NSz1ubfZb9MSR8rr9AcBB4txBknHvtHPJzPzc7yF/fGlWRLyfG2xBlJk
	+H/VEL63Cj50akK4rOMVm/rsJ8Cljr8Q620HSWh0dXC65xWoMjjdsMLgqK4Dhjur4Vqzx8eyjYw
	EiILeOM3jM276wmcjQMna7Taw1LOIqjDWl6b774Fe0X418M0ZDAopFnPKtE3Vt2dObuRp7taQ6s
	YgTmhsLX329kGrErxKff2y+2C6/h/3hPx7Bq6Fk5xd+zAS2EmbCwHEbFFkiVOCLlH0ThRo72mw3
	Rov0c+A2iIsLZwoOBFnDHS84F
X-Received: by 2002:a05:600c:a03:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-454ec14d7a9mr155614885e9.6.1752585847410;
        Tue, 15 Jul 2025 06:24:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhLxz868pyKkYQ3l5UGek/RKFLaiQYjZa6zO7PGU/KyOxr3dY8d03i0aN/xQxZNdYxrPnkbQ==
X-Received: by 2002:a05:600c:a03:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-454ec14d7a9mr155614375e9.6.1752585846779;
        Tue, 15 Jul 2025 06:24:06 -0700 (PDT)
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
Subject: [PATCH v1 6/9] mm/memory: convert print_bad_pte() to print_bad_page_map()
Date: Tue, 15 Jul 2025 15:23:47 +0200
Message-ID: <20250715132350.2448901-7-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715132350.2448901-1-david@redhat.com>
References: <20250715132350.2448901-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _Ig40e_ogn45WBtNkp8q3BSJ9oGimfHWx_-WQozH970_1752585848
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

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 120 ++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 94 insertions(+), 26 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index a4f62923b961c..00ee0df020503 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -479,22 +479,8 @@ static inline void add_mm_rss_vec(struct mm_struct *mm, int *rss)
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
@@ -506,7 +492,7 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
 	if (nr_shown == 60) {
 		if (time_before(jiffies, resume)) {
 			nr_unshown++;
-			return;
+			return true;
 		}
 		if (nr_unshown) {
 			pr_alert("BUG: Bad page map: %lu messages suppressed\n",
@@ -517,15 +503,87 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
 	}
 	if (nr_shown++ == 0)
 		resume = jiffies + 60 * HZ;
+	return false;
+}
+
+static void __dump_bad_page_map_pgtable(struct mm_struct *mm, unsigned long addr)
+{
+	unsigned long long pgdv, p4dv, pudv, pmdv;
+	pgd_t pgd, *pgdp;
+	p4d_t p4d, *p4dp;
+	pud_t pud, *pudp;
+	pmd_t *pmdp;
+
+	/*
+	 * This looks like a fully lockless walk, however, the caller is
+	 * expected to hold the leaf page table lock in addition to other
+	 * rmap/mm/vma locks. So this is just a re-walk to dump page table
+	 * content while any concurrent modifications should be completely
+	 * prevented.
+	 */
+	pgdp = pgd_offset(mm, addr);
+	pgd = pgdp_get(pgdp);
+	pgdv = pgd_val(pgd);
+
+	if (!pgd_present(pgd) || pgd_leaf(pgd)) {
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
+	pmdv = pmd_val(pmdp_get(pmdp));
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
@@ -603,7 +661,7 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 		if (is_zero_pfn(pfn))
 			return NULL;
 
-		print_bad_pte(vma, addr, pte, NULL);
+		print_bad_page_map(vma, addr, pte_val(pte), NULL);
 		return NULL;
 	}
 
@@ -631,7 +689,7 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 
 check_pfn:
 	if (unlikely(pfn > highest_memmap_pfn)) {
-		print_bad_pte(vma, addr, pte, NULL);
+		print_bad_page_map(vma, addr, pte_val(pte), NULL);
 		return NULL;
 	}
 
@@ -660,8 +718,15 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
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
@@ -680,8 +745,10 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 
 	if (is_huge_zero_pfn(pfn))
 		return NULL;
-	if (unlikely(pfn > highest_memmap_pfn))
+	if (unlikely(pfn > highest_memmap_pfn)) {
+		print_bad_page_map(vma, addr, pmd_val(pmd), NULL);
 		return NULL;
+	}
 
 	/*
 	 * NOTE! We still have PageReserved() pages in the page tables.
@@ -1515,7 +1582,7 @@ static __always_inline void zap_present_folio_ptes(struct mmu_gather *tlb,
 		folio_remove_rmap_ptes(folio, page, nr, vma);
 
 		if (unlikely(folio_mapcount(folio) < 0))
-			print_bad_pte(vma, addr, ptent, page);
+			print_bad_page_map(vma, addr, pte_val(ptent), page);
 	}
 	if (unlikely(__tlb_remove_folio_pages(tlb, page, nr, delay_rmap))) {
 		*force_flush = true;
@@ -4513,7 +4580,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
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


