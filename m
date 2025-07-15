Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 713BCB05BCF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:24:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044063.1414126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdb-0004Ja-Cp; Tue, 15 Jul 2025 13:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044063.1414126; Tue, 15 Jul 2025 13:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdb-0004Dq-8g; Tue, 15 Jul 2025 13:24:03 +0000
Received: by outflank-mailman (input) for mailman id 1044063;
 Tue, 15 Jul 2025 13:24:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVo=Z4=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ubfda-0004Ab-1s
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:24:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7e96911-617e-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 15:24:01 +0200 (CEST)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-CHdjXuz2N_uSpFBN7VHTRw-1; Tue, 15 Jul 2025 09:23:58 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4edf5bb4dso3979228f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 06:23:58 -0700 (PDT)
Received: from localhost
 (p200300d82f2849002c244e201f219fbd.dip0.t-ipconnect.de.
 [2003:d8:2f28:4900:2c24:4e20:1f21:9fbd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-454d5037fa0sm200348205e9.7.2025.07.15.06.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 06:23:56 -0700 (PDT)
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
X-Inumbo-ID: f7e96911-617e-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752585840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oD0dyDm8lg70iaRDQ2YlIByz/7M92Pfar0orAStmNLA=;
	b=Oamsumjz1KdFzKkaF2WqnUxUsk0YDoPBI4pQehS74FCjDYknRhUcgCyKlYBWZgzaYWd/Ft
	Merq/Wpx5zSJLuNSaLbDINSi8NaHt63YGwV6CeKTIXqAOcXlVUpfs+OeCkOKwXvEQ/LGj7
	xI3FNbkA+zBZH2nS+nAmZjrU7eX+lpA=
X-MC-Unique: CHdjXuz2N_uSpFBN7VHTRw-1
X-Mimecast-MFC-AGG-ID: CHdjXuz2N_uSpFBN7VHTRw_1752585837
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585837; x=1753190637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oD0dyDm8lg70iaRDQ2YlIByz/7M92Pfar0orAStmNLA=;
        b=eKX6/WerMVUnb+AD7nAx9+qUYdRs7L37LiPMZ/BdLdrS+l8aUMQiz3xrqmRUF2JKT3
         LmkduB14jbWwPMDeJczklhytZCCmRISI4Fm+kG7W07TxZ/7FUSY7gLW+iqvnAAZdWq2y
         mtEUVmiM/sNbv0NNEPJeIDfSm/6H5I92z4cTWyOUrgxFLAe7eL47Nm2dVZIhIzzbPUg0
         M01wmR/pdROLTzz3ViKZzT4i5RcgBc09QZB0RfSfKZVa5zSZRsRTFMecHDXvry82bRyk
         nxXeXO5Lg1V9N//FXwI06tWpwQfZs9/YxvHhIc6yEDdUHPhalZ3RhviApxgiZ4LHkvq3
         y5mg==
X-Forwarded-Encrypted: i=1; AJvYcCX/roEm1yiRwGzYa8UoV1phZGFoPzWyWoue0T2zXk9fHkldYdn4neL0WBrrGeldHi1BzBCHlBMJe5U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyfx0V70NwmXOf1BY0C7zHOi9xu5eMse8QIrwZsGH0j5ICphbgb
	DUTz37ygyuVYQI8reQTu183+cy3SRK1lQivI4dKDuWcwgEKR46YyPIqYWRhYM7j8IsD3xiuP1As
	9lPFYKA4XMro1uvBQsGK/01FqOdn3N8+XObdu3/8BMLCn/oFZ9jtXO/Bn1s4Sn+MkkyfJ
X-Gm-Gg: ASbGnctpT9NzBZrdAN07KVTanLCkWQcw6y56h8CKx2knQS/h7PG8vGCo/kp7UwsvIn7
	Nn3ahDMAGsAuE8jQHzKQmt1QzL0esnZp5efwcjqDLfMTqTlDFhXKimqyAwRS1UzSoYXix12nDzN
	KeXu7YLdGavoREjnq7NXnAYl8Oc/CXHb95HBtcSxS7xPeBZARCu0gzlGxhP/0riLTHNaCLqKyRR
	cZw3BV5K6E4N1MObmqv7OCu968iOChIWvUPGGAyQ/OtWOsT2Tor3IF1y/GGaX64Pmiccg52FitG
	YzetD26oWlKpstxaBddmOnwf8UgJkqEoTreFbmVRdNJ0FnIp0TSuHN3dVeQuAHzDrLHP3up0fSc
	aUXDzIG5FErfB/zracs7WmJWL
X-Received: by 2002:a5d:6f1c:0:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3b60a144d0emr2333533f8f.1.1752585837417;
        Tue, 15 Jul 2025 06:23:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp1q78RzrsyhD1CJX8BXKE4JqnpAS3jXZChO9oe8FS+N0ne3lTOJKZGuzSFKSesdJ2HD0wXw==
X-Received: by 2002:a5d:6f1c:0:b0:3a5:527b:64c6 with SMTP id ffacd0b85a97d-3b60a144d0emr2333512f8f.1.1752585836975;
        Tue, 15 Jul 2025 06:23:56 -0700 (PDT)
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
Subject: [PATCH v1 2/9] mm/huge_memory: move more common code into insert_pud()
Date: Tue, 15 Jul 2025 15:23:43 +0200
Message-ID: <20250715132350.2448901-3-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715132350.2448901-1-david@redhat.com>
References: <20250715132350.2448901-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3n9dH7PqnGXKuDhVDfch_J3sH6QV-Mu0By4lx5znesA_1752585837
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Let's clean it all further up.

No functional change intended.

Reviewed-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 154cafec58dcf..1c4a42413042a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1518,25 +1518,30 @@ static pud_t maybe_pud_mkwrite(pud_t pud, struct vm_area_struct *vma)
 	return pud;
 }
 
-static void insert_pud(struct vm_area_struct *vma, unsigned long addr,
+static vm_fault_t insert_pud(struct vm_area_struct *vma, unsigned long addr,
 		pud_t *pud, struct folio_or_pfn fop, pgprot_t prot, bool write)
 {
 	struct mm_struct *mm = vma->vm_mm;
+	spinlock_t *ptl;
 	pud_t entry;
 
+	if (addr < vma->vm_start || addr >= vma->vm_end)
+		return VM_FAULT_SIGBUS;
+
+	ptl = pud_lock(mm, pud);
 	if (!pud_none(*pud)) {
 		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
 					  fop.pfn;
 
 		if (write) {
 			if (WARN_ON_ONCE(pud_pfn(*pud) != pfn))
-				return;
+				goto out_unlock;
 			entry = pud_mkyoung(*pud);
 			entry = maybe_pud_mkwrite(pud_mkdirty(entry), vma);
 			if (pudp_set_access_flags(vma, addr, pud, entry, 1))
 				update_mmu_cache_pud(vma, addr, pud);
 		}
-		return;
+		goto out_unlock;
 	}
 
 	if (fop.is_folio) {
@@ -1555,6 +1560,9 @@ static void insert_pud(struct vm_area_struct *vma, unsigned long addr,
 	}
 	set_pud_at(mm, addr, pud, entry);
 	update_mmu_cache_pud(vma, addr, pud);
+out_unlock:
+	spin_unlock(ptl);
+	return VM_FAULT_NOPAGE;
 }
 
 /**
@@ -1576,7 +1584,6 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, unsigned long pfn,
 	struct folio_or_pfn fop = {
 		.pfn = pfn,
 	};
-	spinlock_t *ptl;
 
 	/*
 	 * If we had pud_special, we could avoid all these restrictions,
@@ -1588,16 +1595,9 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, unsigned long pfn,
 						(VM_PFNMAP|VM_MIXEDMAP));
 	BUG_ON((vma->vm_flags & VM_PFNMAP) && is_cow_mapping(vma->vm_flags));
 
-	if (addr < vma->vm_start || addr >= vma->vm_end)
-		return VM_FAULT_SIGBUS;
-
 	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
 
-	ptl = pud_lock(vma->vm_mm, vmf->pud);
-	insert_pud(vma, addr, vmf->pud, fop, pgprot, write);
-	spin_unlock(ptl);
-
-	return VM_FAULT_NOPAGE;
+	return insert_pud(vma, addr, vmf->pud, fop, pgprot, write);
 }
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pud);
 
@@ -1614,25 +1614,15 @@ vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio,
 {
 	struct vm_area_struct *vma = vmf->vma;
 	unsigned long addr = vmf->address & PUD_MASK;
-	pud_t *pud = vmf->pud;
-	struct mm_struct *mm = vma->vm_mm;
 	struct folio_or_pfn fop = {
 		.folio = folio,
 		.is_folio = true,
 	};
-	spinlock_t *ptl;
-
-	if (addr < vma->vm_start || addr >= vma->vm_end)
-		return VM_FAULT_SIGBUS;
 
 	if (WARN_ON_ONCE(folio_order(folio) != PUD_ORDER))
 		return VM_FAULT_SIGBUS;
 
-	ptl = pud_lock(mm, pud);
-	insert_pud(vma, addr, vmf->pud, fop, vma->vm_page_prot, write);
-	spin_unlock(ptl);
-
-	return VM_FAULT_NOPAGE;
+	return insert_pud(vma, addr, vmf->pud, fop, vma->vm_page_prot, write);
 }
 EXPORT_SYMBOL_GPL(vmf_insert_folio_pud);
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
-- 
2.50.1


