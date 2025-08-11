Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0F7B2079E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:26:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077378.1438445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQfr-0005zc-FR; Mon, 11 Aug 2025 11:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077378.1438445; Mon, 11 Aug 2025 11:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQfr-0005xF-Bl; Mon, 11 Aug 2025 11:26:43 +0000
Received: by outflank-mailman (input) for mailman id 1077378;
 Mon, 11 Aug 2025 11:26:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gc+J=2X=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ulQfq-0005jI-AO
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:26:42 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cf58e09-76a6-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 13:26:41 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-v6WxP5U-M2i8oZ1wGWdFug-1; Mon, 11 Aug 2025 07:26:38 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-459de8f00cfso17528645e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:26:38 -0700 (PDT)
Received: from localhost
 (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de.
 [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3abf33sm40550137f8f.7.2025.08.11.04.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:26:36 -0700 (PDT)
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
X-Inumbo-ID: 0cf58e09-76a6-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Htya8lk0ohNZGoVKNkWH4Tb4G28S+mHG9GYTekXNGbw=;
	b=BSFR/Fi34tP9TYXtSKf6EKayic9rWNswzONRojFnyHfcPvfZqbKbk1pYdoZv+k5ZXanlKC
	4pj2xi/Wk1jDEb46x/FoHBY6I0DYUxjAeV1N1okm3WVuall1fJ8kl28ToTSspr0DYwffuY
	xdWkElrZ4TN6nvSt5P+AYfKKi//FXn0=
X-MC-Unique: v6WxP5U-M2i8oZ1wGWdFug-1
X-Mimecast-MFC-AGG-ID: v6WxP5U-M2i8oZ1wGWdFug_1754911598
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911597; x=1755516397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Htya8lk0ohNZGoVKNkWH4Tb4G28S+mHG9GYTekXNGbw=;
        b=PhY8M2DU7oBJw8PAaEQG1n3NG2GRgQdhZDrIEZsG16ln50iInnlmkSMyuT0C7uPhr+
         NI1NU8L8bWYrJkcduEf4LEEffaJPmYeD34QPSTD7tBadJYR0mcgsyy+PWXkP91soUMrW
         JXIO2TwOr1Agcyq40xXMHa1JRmY3unhDGNXeaQFwn4oeWQDFeoTgBFSuqU2bICLCjlrM
         v5+iXwgM1wScTLkXFHz5p1a6M0eU+6iBKToqznsPWhTgrS52Qg0Ayv63L0K4K8g9JcP0
         C1CehowoJL7MFACUMXMkwuRgKpI9i0BgkxvdQFEZlvZA5nC0i+b1ud4zW2HAUNkYRdr8
         HFdA==
X-Forwarded-Encrypted: i=1; AJvYcCUHxsPBN8pT3PwCqEKMt+UMjyZny150UExZgFBwvd8JH+A6PWlxiDjmTg7NwLsghU+jHP9yUFSrwOU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxrmbs95Gob2F9uXXZ7XB2/K7thcHfF2EIMNcz0etu2CQ9jYvOp
	dk8uv3Wp2FN6dqBeeCrtnEAZhuywL3vR7oO7dcElwniwL+HtKj+0xpeApekRjae6WbO5cfmzY6O
	5xyCFjig/Zv4X41UtFdQ80AelXsL0YXsAmfZZw1ZRUm4+QvMeZIsrZLXdp2kZTsGsOUyd
X-Gm-Gg: ASbGncvf92Yn51S2KdHj28zwMQN82v5LgFA6Gu4BE/eg1xepeHCcf/2W4xpP59DW626
	eVwDD+rU+2CnppoGYARi+WXKbgcp/ahZzQImpXh7UhJ1QeaPXguTpvFG8hGDi9tYnV5xTy0kQXK
	siZ8NyNslLJVvVXfusDMNOGTMEzSLrbKrTj+EBLJ1rvLamUyBLwAksx8tVE11mrzvzOKSIEyJvj
	RQiXPDGFE8Ibtp+qE0ZpN2tUdUop7RcWDBxC1zEPOMJcRAk5CoSnxucyG+oJQaYt9KPbVhiff2H
	JeXp5NrZGJm5bgRnnt+cfibB7ikRJ1ZEPsE/jzjuKbw8Jx8wKhAaq6cH87CcdbKG7M6AdhTEMAf
	A/WvXK893MybHuMrMHzyMMI24
X-Received: by 2002:a05:600c:458b:b0:459:e3f8:92ec with SMTP id 5b1f17b1804b1-459f4eb4176mr127957775e9.10.1754911597498;
        Mon, 11 Aug 2025 04:26:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdNxb5gc4DwQKatpkXot61uX7cGVvKpORGwTw8/tHuwPs0r2lWbt+TytrRicLCoC+zeQmPIg==
X-Received: by 2002:a05:600c:458b:b0:459:e3f8:92ec with SMTP id 5b1f17b1804b1-459f4eb4176mr127957415e9.10.1754911596965;
        Mon, 11 Aug 2025 04:26:36 -0700 (PDT)
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
	Lance Yang <lance.yang@linux.dev>,
	Alistair Popple <apopple@nvidia.com>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH v3 01/11] mm/huge_memory: move more common code into insert_pmd()
Date: Mon, 11 Aug 2025 13:26:21 +0200
Message-ID: <20250811112631.759341-2-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811112631.759341-1-david@redhat.com>
References: <20250811112631.759341-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t9iNsmv56PupQH8OZSzZdQpcJU_GvnHdIcSkoFK66Ac_1754911598
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Let's clean it all further up.

No functional change intended.

Reviewed-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 72 ++++++++++++++++--------------------------------
 1 file changed, 24 insertions(+), 48 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2b4ea5a2ce7d2..5314a89d676f1 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1379,15 +1379,25 @@ struct folio_or_pfn {
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
@@ -1395,15 +1405,14 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
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
@@ -1424,11 +1433,17 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
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
@@ -1450,9 +1465,6 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn,
 	struct folio_or_pfn fop = {
 		.pfn = pfn,
 	};
-	pgtable_t pgtable = NULL;
-	spinlock_t *ptl;
-	int error;
 
 	/*
 	 * If we had pmd_special, we could avoid all these restrictions,
@@ -1464,25 +1476,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn,
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
 
@@ -1491,35 +1487,15 @@ vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio,
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


