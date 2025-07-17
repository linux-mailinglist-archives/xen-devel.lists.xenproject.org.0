Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF976B08C09
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 13:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046611.1417004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNAA-0002XY-Kl; Thu, 17 Jul 2025 11:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046611.1417004; Thu, 17 Jul 2025 11:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNAA-0002Uq-GM; Thu, 17 Jul 2025 11:52:34 +0000
Received: by outflank-mailman (input) for mailman id 1046611;
 Thu, 17 Jul 2025 11:52:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiP3=Z6=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ucNA9-0001TV-8h
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 11:52:33 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84c4110c-6304-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 13:52:31 +0200 (CEST)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-MVqQcbgHNFWQmrKk00w84w-1; Thu, 17 Jul 2025 07:52:29 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a52bfda108so444016f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 04:52:28 -0700 (PDT)
Received: from localhost
 (p200300d82f1f36000dc826ee9aa9fdc7.dip0.t-ipconnect.de.
 [2003:d8:2f1f:3600:dc8:26ee:9aa9:fdc7])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8e25e75sm20438446f8f.87.2025.07.17.04.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 04:52:26 -0700 (PDT)
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
X-Inumbo-ID: 84c4110c-6304-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752753150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXxbBdWkSFir8qoOw7q+QMZqWjLZWA9TcFjO3xeUJH4=;
	b=dzFJrD9BXtOo90nvysQW+6hWrxvznyBjLpwndhVXoQOD3gweHcP6iZiH9RLPvnSL3YuYbe
	f+epGBITaMKXV1MAALtRUrTZx7IHoRoxSHC2//jsxCS0ZVOC3mud6OpvCoSDayI741UcTq
	XV3zGdcTOG+nZyZHh425dsySe4wwWTY=
X-MC-Unique: MVqQcbgHNFWQmrKk00w84w-1
X-Mimecast-MFC-AGG-ID: MVqQcbgHNFWQmrKk00w84w_1752753148
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753148; x=1753357948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXxbBdWkSFir8qoOw7q+QMZqWjLZWA9TcFjO3xeUJH4=;
        b=Nv0CB8V3JeFdt2XYfrdSQT3v8aKlOGrehON/h/CTGOXdBhUSK2cCBLrvRZHTV7mdPR
         9FgM5qRKOofCZkhFwODCrf5PNGrUx20kuIlQnOYJdk1dILZ0tEEKRuzGAH69xm9G/4ys
         itr7Tu9OdNqCfVVFOVNHkukN8vQ/XGeaB+ajB2RjJlWnmxfJPT8KFOjv07OIrYNF0vaj
         RUN1+fZQmHLauavivYVw1xCK5taox4QDjwRIhXW8DnkDeLEls62Jj6YtTuuzuR1bEmOA
         aKtdO9pTYnazzlngIds2ReaWt6LbDKEvEc+AYyofbj+f0jwXeJ0hqWGVyu4GTcKdIBms
         KJLg==
X-Forwarded-Encrypted: i=1; AJvYcCUl3NgHPNrFSmaEnPs1qxk3vwP9H3TrPV/PW+0eLzkoKi+6EH3n5TtNnyk6Ye5LBLAapaiyDNViYvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweSDaXGYtSvZDfaPKZHWSzg9glU2o9Nt6vXnxB/ZAHP10+QAco
	onIb3KFs+L9nV7clMKsQiZIsTsPDKzRBbcDCcNkXMi72MVh1/lMTYHiuHlKRPQsCJFjWozZ05SJ
	iGDWI1zrUJ+cCr8nsyUnGmqOqNAm78/MtwpsQ8yNinM0IAyYu0bowD4OOAHpAYjBUvoug
X-Gm-Gg: ASbGncsjpXN3G74JZPw8/9IhsJg/WQEOFsafM7YlF03i0xVkN+7/2XEUwdOWwxTlJ/w
	rsNm4vT2g370tVuFm5XtsDZA3hFHHV9L04+IyKiLTebrVilgaxPhwIv2fWA2orkEbLtmB/A5ezd
	RCCb8oSb117/spGf92V8Z28m9c/+dvDrt0LJUB2Hq9xlGtjDygP9m1NYRg6ZJ9OS+N2EoHF35/i
	ZDy2vmtldlghyQtxopW/SEepK7xNRkz4O7QB49scD1SYw0bjyCWzhKsR/DKmgeoCdyAXfm2kVMm
	1n8KzUcw0cHTW/96xu67jIw3P8OFcUnzduAOmjiHO4s2RPC+NvmRskgQ/cqaXuzmv6eGnIetzle
	abcTgi2OpnoyQMkJc187xGhs=
X-Received: by 2002:a05:6000:4b05:b0:3a4:e4ee:4ca9 with SMTP id ffacd0b85a97d-3b60dd72378mr5333948f8f.23.1752753147609;
        Thu, 17 Jul 2025 04:52:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVug96IdPAxHxRCwLhhCK8Tw1f2oOZhwD0absH2YXaDMF3tjDXL2HLEbyWszstU7d4tmbzEQ==
X-Received: by 2002:a05:6000:4b05:b0:3a4:e4ee:4ca9 with SMTP id ffacd0b85a97d-3b60dd72378mr5333908f8f.23.1752753147033;
        Thu, 17 Jul 2025 04:52:27 -0700 (PDT)
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
Subject: [PATCH v2 5/9] mm/huge_memory: mark PMD mappings of the huge zero folio special
Date: Thu, 17 Jul 2025 13:52:08 +0200
Message-ID: <20250717115212.1825089-6-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717115212.1825089-1-david@redhat.com>
References: <20250717115212.1825089-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BGHfqqQjQBNTckfb2hV6vPxv6QBdEJZRNAXTRBi-8tg_1752753148
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
index db08c37b87077..3f9a27812a590 100644
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
index 92fd18a5d8d1f..173eb6267e0ac 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -537,7 +537,13 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
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
@@ -567,9 +573,8 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
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
@@ -649,7 +654,6 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 {
 	unsigned long pfn = pmd_pfn(pmd);
 
-	/* Currently it's only used for huge pfnmaps */
 	if (unlikely(pmd_special(pmd)))
 		return NULL;
 
-- 
2.50.1


