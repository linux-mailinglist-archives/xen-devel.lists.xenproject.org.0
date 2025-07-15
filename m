Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AFDB05BD0
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:24:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044062.1414121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdb-0004E2-5E; Tue, 15 Jul 2025 13:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044062.1414121; Tue, 15 Jul 2025 13:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfda-0004BI-V4; Tue, 15 Jul 2025 13:24:02 +0000
Received: by outflank-mailman (input) for mailman id 1044062;
 Tue, 15 Jul 2025 13:24:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVo=Z4=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ubfdZ-0004Ab-DF
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:24:01 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6e2d6a9-617e-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 15:23:59 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-rG1iDehYM1Kxca4EnOQEDg-1; Tue, 15 Jul 2025 09:23:56 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4560f28b2b1so9632015e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 06:23:56 -0700 (PDT)
Received: from localhost
 (p200300d82f2849002c244e201f219fbd.dip0.t-ipconnect.de.
 [2003:d8:2f28:4900:2c24:4e20:1f21:9fbd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8dc23cfsm15410702f8f.37.2025.07.15.06.23.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 06:23:53 -0700 (PDT)
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
X-Inumbo-ID: f6e2d6a9-617e-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752585838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ykT8pgWXFgvGFNKHweTL3CrCV9vUidi0sNJ9Np/Hvr0=;
	b=RL/yB01hT1kOMTVUBoxq4LO/bjAcCZYhgvYpH1Mlub6HHVPyGzlWNU5edlnNmL6HcR9tzq
	hyIT3S5TgRK+vXNhlc9ISS/96yjuHRIpyEGLM/wQ2NYwWDcRfCrneqhsQs1sjb0POoUJWu
	n8c8hXMu3MPVq4Dk7gee0Syks2mL3WY=
X-MC-Unique: rG1iDehYM1Kxca4EnOQEDg-1
X-Mimecast-MFC-AGG-ID: rG1iDehYM1Kxca4EnOQEDg_1752585835
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585835; x=1753190635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykT8pgWXFgvGFNKHweTL3CrCV9vUidi0sNJ9Np/Hvr0=;
        b=KTrY2s/DB32wjxiT5lrYUrWpylv/JQF0shtZ+ruAX+fGYDJAu3rUwrmBFl7reoAzXR
         tnd0Im7Ad+MkI+BjOpcxK2RJMcCKAUmJgZ/5J5ThfRWoB8d0lf16EWVk0wfw6kFFR3cq
         TK64sn3az6omgLQh4hnoupMrGQCBkbQIvVC8iewV6/4s7yblZCz9Pyuhm3ci2NYHQxk4
         mCuSIzvYxr0vTsj7NUkW7cjdUKrvOb4Nc+z7jlCkJCiXlPesSBcqX1IROuOX/YimU4Mn
         r3b4dolqgAyePS+A/c4dbReTNO1cY6wy0hSO0FfgcYbzP4gMT1e+3vO+nqjQsKNZaImJ
         BV/g==
X-Forwarded-Encrypted: i=1; AJvYcCVlJAkyT7WY1s277saDzEx1bdDR2kYxhl24a0s9BHN2WeW5DQ56ywSAJpYQfD4TKiLoRnYMzznuji4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxd7NO7eSs6Dq7wNbvoKyZUBGlnoLavSCkri68kOzuCASAnTnvn
	wyVwi44ZcYAIbhDfHXXVFQT8cp4/IR8WVJ1eZ89iBsMcItIjF+pYEEIs3KbC0wX9dgytm2Q9due
	SplGi2cQ9woZjnu2MLturZGnoiULfyq0gKYnaBunA485dAP1EORyam890WwTHFJ7GzZDA
X-Gm-Gg: ASbGncsWVm7+SPXYFQ0bisHyR+kDBJWcHdOtcmZjfqiRrmDA3QaEWN8XVufljzvdYLk
	b4Wevx/b5AFg0ZblGldaV8i81Vmy4Fr/LZZvyyZ4a08kLh8BQnapqozaGoo+pRGWkQP+slOucAF
	pIftE2aAoN42lsQ/2kQL6TalrMJ+W7pQJ6rXgIs9PJOm3BXFZ+dex05XlpaMF7N9Wt3mz0gZSJA
	tU0eajjsw/sMFjO3zYloQ5lKXenG+1aBfbuqFgAb6FZtIc6tMtncctM5ak61NsnDhX122PS3gJl
	5Z8yo4x93gxIIZpsEAVCnC2Or5pSGPwELCMRCYfPH8Cld/qaaN96x5f01oXmJBJvZDmH72S5HEZ
	RPUU17061MW6qrvwB8nLW4hmW
X-Received: by 2002:a05:6000:144e:b0:3a4:cbc6:9db0 with SMTP id ffacd0b85a97d-3b5f3593547mr14507407f8f.51.1752585835220;
        Tue, 15 Jul 2025 06:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKDFYln2JrtTRhld2NwLX7CnQQsSirIV2K0GbAl0c8l2mNgbUwK9i9nFjMxSZj5YkY6MStUw==
X-Received: by 2002:a05:6000:144e:b0:3a4:cbc6:9db0 with SMTP id ffacd0b85a97d-3b5f3593547mr14507363f8f.51.1752585834604;
        Tue, 15 Jul 2025 06:23:54 -0700 (PDT)
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
Subject: [PATCH v1 1/9] mm/huge_memory: move more common code into insert_pmd()
Date: Tue, 15 Jul 2025 15:23:42 +0200
Message-ID: <20250715132350.2448901-2-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715132350.2448901-1-david@redhat.com>
References: <20250715132350.2448901-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V3y3TYXhDsZz-T4jPHxxbjbSjmEr83y4xrUdjhMr6LA_1752585835
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
index 31b5c4e61a574..154cafec58dcf 100644
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


