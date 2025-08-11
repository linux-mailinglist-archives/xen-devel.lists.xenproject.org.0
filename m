Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94351B207A5
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:27:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077389.1438515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQg9-0008BJ-MX; Mon, 11 Aug 2025 11:27:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077389.1438515; Mon, 11 Aug 2025 11:27:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQg9-00087F-He; Mon, 11 Aug 2025 11:27:01 +0000
Received: by outflank-mailman (input) for mailman id 1077389;
 Mon, 11 Aug 2025 11:26:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gc+J=2X=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ulQg7-0005jI-PO
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:26:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17885278-76a6-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 13:26:59 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-NsEbjSgrMgSL9TmYbqp4vQ-1; Mon, 11 Aug 2025 07:26:56 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-451d30992bcso40949665e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:26:56 -0700 (PDT)
Received: from localhost
 (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de.
 [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c4530b3sm41080102f8f.34.2025.08.11.04.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:26:54 -0700 (PDT)
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
X-Inumbo-ID: 17885278-76a6-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cAxz8wtEYwnzSbLFT0UZ22FzefKNNzcleMeX5Ma3lWM=;
	b=iR1WrxDNbGUaAIjQeyLPXO0TEnwD5+xxqMDcuc7O+LhPclkuMwNCMJUr5DLu23HcfKk6+I
	T3N36B3f73fwPbaQWASTnvAhDwAMOdzgJu/TgvtBLhKjmGILGXnjlfj/WWT2oDt8Y/xj0H
	iwyCyXPSyo+hJpjJx/NaB3J2xXRESoE=
X-MC-Unique: NsEbjSgrMgSL9TmYbqp4vQ-1
X-Mimecast-MFC-AGG-ID: NsEbjSgrMgSL9TmYbqp4vQ_1754911615
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911615; x=1755516415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAxz8wtEYwnzSbLFT0UZ22FzefKNNzcleMeX5Ma3lWM=;
        b=Uz+9jiyJ4Qi1/qP3l8fRQdY7aOZ7AmcLDCIJU8SjYwJowFGrBV6B0r9Nn2s1uTDu7j
         4WcQgi7nXbVLECgbm1MyAGKik806ufuWbbSbXvu7vDYTXAfRklkm+cccMeXi7RzyPtfj
         odx1rZqcfDLPDHIwEFSjdmLrr+/PLCLino2qJukcEr9UbANbYt0mghy/2Cw8qeE/Ht2I
         obqgmBh1Z2/89IkG7+vTCdlb0hDTXLqZ3JSi8u97KEd7h+kIaTJJhaH2+nRFQicCqaVN
         yh2OpmeRdHoo5Xla3CJQKOrjDUyb0HlyCOSJfiGWOUfSBKbg1voZs1+OWfiAFM8FwHjw
         gP7g==
X-Forwarded-Encrypted: i=1; AJvYcCWAevMYpY4Sda8k1BzIZj6XAZexcnAHIc7zwYak9O3K+3DogjUhwDZEVXW3uoW9V+5nvqlB9vkm940=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwH5wg25iFZ7rT40qoC7ppFsU8UmqroZtZLDvcvJRfc6g4T7eRq
	UXzauvH/3IpLfm+7oQFBhoNsfgmG1rJKxt5Nkv7RmbANKVfz5n2SfZqjKWmwUdttnjlrlSzsyOa
	8y5mQdlrwf2saugDCL0ry5W/tBhDks1AhhAnbCYFq/f3DDyIds0/m7AUfqeoiP1ZNLpZ+
X-Gm-Gg: ASbGncuU4OugYHl6+x9pr04Xw4dFaCpJ2yjoevIk7oEn1e3QUa0BFC714X1yPknegal
	0mLtOR96GW4cpIiczmUWfeAwI2HiquceN6dguhcDwh+BWjfSy0DOQc+5HNpLB6++MiuS+E7Kk/C
	G4ubxc6YlnURlnAqBc/mNXcW4vF6mZwq/0FUEzET4gYu14+MEV2NFJJ2bWpS8tgXZKV7dVnK74g
	PoKmgSQSvodCpV2lREFizxMNNLj2YHAW4gwpn+ICYjWmjcI5pQT9sK7IAk6fvgHUwg3nS/s8tU+
	4jxYb2NG1BF8MWtAZibSYK033obeZtlHq6PoddpYG56b3wdS0vH+YCiVImlwB7ekc6oirD6PU+Q
	Sp2pmVcMbDT1VRcWK2+0852g1
X-Received: by 2002:a05:600c:350f:b0:456:1560:7c63 with SMTP id 5b1f17b1804b1-459f4f3dde5mr124071065e9.3.1754911615200;
        Mon, 11 Aug 2025 04:26:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKs8kYesKmGWPRfo05vS75I0Yn/yE7Pq2L/J4XRbC28zXbi7Rocgkv1+OCyQd3aXR+1J2h1Q==
X-Received: by 2002:a05:600c:350f:b0:456:1560:7c63 with SMTP id 5b1f17b1804b1-459f4f3dde5mr124070425e9.3.1754911614678;
        Mon, 11 Aug 2025 04:26:54 -0700 (PDT)
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
Subject: [PATCH v3 08/11] mm/memory: convert print_bad_pte() to print_bad_page_map()
Date: Mon, 11 Aug 2025 13:26:28 +0200
Message-ID: <20250811112631.759341-9-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811112631.759341-1-david@redhat.com>
References: <20250811112631.759341-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1v7BmQgpxPNvKRzGkXypQ5jUwCR6YCDHTDRpB1rcqzI_1754911615
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
implementation and renaming the function to print_bad_page_map().
Provide print_bad_pte() as a simple wrapper.

Document the implicit locking requirements for the page table re-walk.

To make the function a bit more readable, factor out the ratelimit check
into is_bad_page_map_ratelimited() and place the printing of page
table content into __print_bad_page_map_pgtable(). We'll now dump
information from each level in a single line, and just stop the table
walk once we hit something that is not a present page table.

The report will now look something like (dumping pgd to pmd values):

[   77.943408] BUG: Bad page map in process XXX  pte:80000001233f5867
[   77.944077] addr:00007fd84bb1c000 vm_flags:08100071 anon_vma: ...
[   77.945186] pgd:10a89f067 p4d:10a89f067 pud:10e5a2067 pmd:105327067

Not using pgdp_get(), because that does not work properly on some arm
configs where pgd_t is an array. Note that we are dumping all levels
even when levels are folded for simplicity.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/pgtable.h |  19 ++++++++
 mm/memory.c             | 104 ++++++++++++++++++++++++++++++++--------
 2 files changed, 103 insertions(+), 20 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index bff5c4241bf2e..33c84b38b7ec6 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1966,6 +1966,25 @@ enum pgtable_level {
 	PGTABLE_LEVEL_PGD,
 };
 
+static inline const char *pgtable_level_to_str(enum pgtable_level level)
+{
+	switch (level) {
+	case PGTABLE_LEVEL_PTE:
+		return "pte";
+	case PGTABLE_LEVEL_PMD:
+		return "pmd";
+	case PGTABLE_LEVEL_PUD:
+		return "pud";
+	case PGTABLE_LEVEL_P4D:
+		return "p4d";
+	case PGTABLE_LEVEL_PGD:
+		return "pgd";
+	default:
+		VM_WARN_ON_ONCE(1);
+		return "unknown";
+	}
+}
+
 #endif /* !__ASSEMBLY__ */
 
 #if !defined(MAX_POSSIBLE_PHYSMEM_BITS) && !defined(CONFIG_64BIT)
diff --git a/mm/memory.c b/mm/memory.c
index 626caedce35e0..dc0107354d37b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -491,22 +491,8 @@ static inline void add_mm_rss_vec(struct mm_struct *mm, int *rss)
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
@@ -518,7 +504,7 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
 	if (nr_shown == 60) {
 		if (time_before(jiffies, resume)) {
 			nr_unshown++;
-			return;
+			return true;
 		}
 		if (nr_unshown) {
 			pr_alert("BUG: Bad page map: %lu messages suppressed\n",
@@ -529,15 +515,91 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
 	}
 	if (nr_shown++ == 0)
 		resume = jiffies + 60 * HZ;
+	return false;
+}
+
+static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long addr)
+{
+	unsigned long long pgdv, p4dv, pudv, pmdv;
+	p4d_t p4d, *p4dp;
+	pud_t pud, *pudp;
+	pmd_t pmd, *pmdp;
+	pgd_t *pgdp;
+
+	/*
+	 * Although this looks like a fully lockless pgtable walk, it is not:
+	 * see locking requirements for print_bad_page_map().
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
+ *
+ * This function must be called during a proper page table walk, as it will
+ * re-walk the page table to dump information: the caller MUST prevent page
+ * table teardown (by holding mmap, vma or rmap lock) and MUST hold the leaf
+ * page table lock.
+ */
+static void print_bad_page_map(struct vm_area_struct *vma,
+		unsigned long addr, unsigned long long entry, struct page *page,
+		enum pgtable_level level)
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
+	pr_alert("BUG: Bad page map in process %s  %s:%08llx", current->comm,
+		 pgtable_level_to_str(level), entry);
+	__print_bad_page_map_pgtable(vma->vm_mm, addr);
 	if (page)
-		dump_page(page, "bad pte");
+		dump_page(page, "bad page map");
 	pr_alert("addr:%px vm_flags:%08lx anon_vma:%px mapping:%px index:%lx\n",
 		 (void *)addr, vma->vm_flags, vma->anon_vma, mapping, index);
 	pr_alert("file:%pD fault:%ps mmap:%ps mmap_prepare: %ps read_folio:%ps\n",
@@ -549,6 +611,8 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
 	dump_stack();
 	add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
 }
+#define print_bad_pte(vma, addr, pte, page) \
+	print_bad_page_map(vma, addr, pte_val(pte), page, PGTABLE_LEVEL_PTE)
 
 /*
  * vm_normal_page -- This function gets the "struct page" associated with a pte.
-- 
2.50.1


