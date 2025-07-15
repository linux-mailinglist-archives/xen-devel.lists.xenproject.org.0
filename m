Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B55E1B05BD4
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:24:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044068.1414160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdk-0005L5-7C; Tue, 15 Jul 2025 13:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044068.1414160; Tue, 15 Jul 2025 13:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdk-0005JC-3a; Tue, 15 Jul 2025 13:24:12 +0000
Received: by outflank-mailman (input) for mailman id 1044068;
 Tue, 15 Jul 2025 13:24:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVo=Z4=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ubfdi-0004Ab-JI
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:24:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd0d248f-617e-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 15:24:09 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-hNJ-82SGMR6W4QfYSvN2yg-1; Tue, 15 Jul 2025 09:24:06 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4561dfd07bcso10963395e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 06:24:06 -0700 (PDT)
Received: from localhost
 (p200300d82f2849002c244e201f219fbd.dip0.t-ipconnect.de.
 [2003:d8:2f28:4900:2c24:4e20:1f21:9fbd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45611a518c2sm80433825e9.31.2025.07.15.06.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 06:24:03 -0700 (PDT)
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
X-Inumbo-ID: fd0d248f-617e-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752585848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qf0T+96rABqxKpEz5mD8vzC45xOAiNOzYXCwXWS86uE=;
	b=i+bQhlMOMN73cMF+KTVkIwuv5covZlnFPO5u30HB27FrIfHVLIibJ37Ai/pXI6uPbDAn5K
	9b7Na2b/BAHKN3i9xdjxoDeN10c9xlgpj7tb4whaGtGLgyBa0weulFpjD6doPAQUp6wqVk
	tGSspKaygvwoeE6VmpeMdbiF8BhkF/g=
X-MC-Unique: hNJ-82SGMR6W4QfYSvN2yg-1
X-Mimecast-MFC-AGG-ID: hNJ-82SGMR6W4QfYSvN2yg_1752585845
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585845; x=1753190645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qf0T+96rABqxKpEz5mD8vzC45xOAiNOzYXCwXWS86uE=;
        b=RVnzhlUJSd0dPnGoWxo1aR3+OiknbSiG0wj5PLFsNu1CH5PjW6df3+i+qCnlRsNyQv
         NnXja9twknqgPUbCOvHQ9IHnAOJ7r00gZ79ppxxbfVfCvtM7Pr5x72aHg1eZXZpf42vi
         Hxn3J7J5fVcVj88s3uaeO0uzd2tIo2mvNSWyslwFDXU4CiTSnQt/Jmx47gIjhYB1HqKK
         OBfMagjSZdwmy0e5Z+OxfGWUx0bUJjFXK6IqUlX40OTWLd3yzXDWyM3E5O8gr5iM5mb7
         RHC67hqLsULtAqt8IPzFmsedpbIUSq8mulHVl+vlc6Tt2+GouztI2llgfKy5/+bt+EJw
         GtqA==
X-Forwarded-Encrypted: i=1; AJvYcCUiCNQVPzQWj/yG/gHhOtdy3iIG8iTac4AoTXh9DymzSlkfCA0WoLjB4mcDCXKlenS3XfGvgdsrbtE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzn7McoqDnUJkrJ6M2IQH9ZdhCpoUhLfWC/8U5RbWj70aHT9GB4
	Yfffma57LsJygblcjcjjxv2EdpSNJnFDuJ3c0SYkpVry+7aWPU/syOJaC7nK39NJ0niSTP7GSET
	6BuMUBzoMQ/+CsdTSsGC3d7xIs5oTq4HmxU2XXrLJrM+0CzKT+adTuO9D51OObUw78f0p
X-Gm-Gg: ASbGncvBJDXQztEZJFJonI+5qy8FKw1h0VppMH49XqXkFdT3gvH4WzyNV+Bo1mvQrPP
	Y3E0faV3SY7N3+ka95jd/dHTjvoeV7fyNh0yhDWeupccu8EkbbTUEVRO8j8EkkuQ5INEN9GYoIU
	q0gKnMR8LIAuay17fygk97uEm0sspq2+Zi/wy1arAw9JXDpgrdEo+DookgznNF/dheJB5lIKCaj
	4sjLrRlBVZlu22+fb54PgMNWPtgppFxFXeZ6t+oE93Zuimb8ws/e+pdojFyWafkEsz45lWwFWM3
	C3soiTMdTCHpIivIAInUf2s5Y50ijArHkdR4G2Hh71PxwESkzgFmbuh77gvKNSCdFkSo9kpo8ED
	q1gAE4RzMq11KHipqNudGn5Ec
X-Received: by 2002:a05:600c:1c10:b0:456:1e5a:8879 with SMTP id 5b1f17b1804b1-4561e5a903dmr64875955e9.9.1752585844763;
        Tue, 15 Jul 2025 06:24:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNkvm/o7SOv8gvxBFeHAl5ZSVtKwdA8aiblR66hArUogUqCn7BZUev9VVrmUri129a2+K3wA==
X-Received: by 2002:a05:600c:1c10:b0:456:1e5a:8879 with SMTP id 5b1f17b1804b1-4561e5a903dmr64875585e9.9.1752585844257;
        Tue, 15 Jul 2025 06:24:04 -0700 (PDT)
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
Subject: [PATCH v1 5/9] mm/huge_memory: mark PMD mappings of the huge zero folio special
Date: Tue, 15 Jul 2025 15:23:46 +0200
Message-ID: <20250715132350.2448901-6-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715132350.2448901-1-david@redhat.com>
References: <20250715132350.2448901-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hHCdm2PAytS-hG7it-0_6UUP1NVE9DYD2a07TBdedF0_1752585845
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The huge zero folio is refcounted (+mapcounted -- is that a word?)
differently than "normal" folios, similarly (but different) to the ordinary
shared zeropage.

For this reason, we special-case these pages in
vm_normal_page*/vm_normal_folio*, and only allow selected callers to
still use them (e.g., GUP can still take a reference on them).

vm_normal_page_pmd() already filters out the huge zero folio. However,
so far we are not marking it as special like we do with the ordinary
shared zeropage. Let's mark it as special, so we can further refactor
vm_normal_page_pmd() and vm_normal_page().

While at it, update the doc regarding the shared zero folios.

Reviewed-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c |  5 ++++-
 mm/memory.c      | 14 +++++++++-----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 9ec7f48efde09..24aff14d22a1e 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1320,6 +1320,7 @@ static void set_huge_zero_folio(pgtable_t pgtable, struct mm_struct *mm,
 {
 	pmd_t entry;
 	entry = folio_mk_pmd(zero_folio, vma->vm_page_prot);
+	entry = pmd_mkspecial(entry);
 	pgtable_trans_huge_deposit(mm, pmd, pgtable);
 	set_pmd_at(mm, haddr, pmd, entry);
 	mm_inc_nr_ptes(mm);
@@ -1429,7 +1430,9 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 	if (fop.is_folio) {
 		entry = folio_mk_pmd(fop.folio, vma->vm_page_prot);
 
-		if (!is_huge_zero_folio(fop.folio)) {
+		if (is_huge_zero_folio(fop.folio)) {
+			entry = pmd_mkspecial(entry);
+		} else {
 			folio_get(fop.folio);
 			folio_add_file_rmap_pmd(fop.folio, &fop.folio->page, vma);
 			add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
diff --git a/mm/memory.c b/mm/memory.c
index 3dd6c57e6511e..a4f62923b961c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -543,7 +543,13 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
  *
  * "Special" mappings do not wish to be associated with a "struct page" (either
  * it doesn't exist, or it exists but they don't want to touch it). In this
- * case, NULL is returned here. "Normal" mappings do have a struct page.
+ * case, NULL is returned here. "Normal" mappings do have a struct page and
+ * are ordinarily refcounted.
+ *
+ * Page mappings of the shared zero folios are always considered "special", as
+ * they are not ordinarily refcounted. However, selected page table walkers
+ * (such as GUP) can still identify these mappings and work with the
+ * underlying "struct page".
  *
  * There are 2 broad cases. Firstly, an architecture may define a pte_special()
  * pte bit, in which case this function is trivial. Secondly, an architecture
@@ -573,9 +579,8 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
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
@@ -655,7 +660,6 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 {
 	unsigned long pfn = pmd_pfn(pmd);
 
-	/* Currently it's only used for huge pfnmaps */
 	if (unlikely(pmd_special(pmd)))
 		return NULL;
 
-- 
2.50.1


