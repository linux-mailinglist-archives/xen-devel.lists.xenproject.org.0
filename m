Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83C0B08C07
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 13:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046607.1416974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNA4-0001ll-So; Thu, 17 Jul 2025 11:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046607.1416974; Thu, 17 Jul 2025 11:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNA4-0001iZ-Pn; Thu, 17 Jul 2025 11:52:28 +0000
Received: by outflank-mailman (input) for mailman id 1046607;
 Thu, 17 Jul 2025 11:52:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiP3=Z6=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ucNA3-0001Ft-2j
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 11:52:27 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81850709-6304-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 13:52:26 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-v7c1l8Q7NRCjjUYTXVLA7g-1; Thu, 17 Jul 2025 07:52:21 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43e9b0fd00cso5757065e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 04:52:21 -0700 (PDT)
Received: from localhost
 (p200300d82f1f36000dc826ee9aa9fdc7.dip0.t-ipconnect.de.
 [2003:d8:2f1f:3600:dc8:26ee:9aa9:fdc7])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45634f82f29sm20129705e9.23.2025.07.17.04.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 04:52:19 -0700 (PDT)
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
X-Inumbo-ID: 81850709-6304-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752753145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8U/VSSfKctO+2Q0R03xR9syW7Y0P/UCdJOxdygVgan0=;
	b=hhHUd2xh8etESKHce97p4E7wO2CJZYs60r+Y9VRw9U4fk+PgL2pR0Aq66VOKD3NuLQvji1
	KGvWlaBFCOdmMAqvQCeNxMbvh1ToEZDdnjAIp9k09gHmwtenqryeDzFpPxrjly9Z/El4M0
	Ndcmy2lb2eFXoBfUNjEKzvMptuw23DE=
X-MC-Unique: v7c1l8Q7NRCjjUYTXVLA7g-1
X-Mimecast-MFC-AGG-ID: v7c1l8Q7NRCjjUYTXVLA7g_1752753140
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753140; x=1753357940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8U/VSSfKctO+2Q0R03xR9syW7Y0P/UCdJOxdygVgan0=;
        b=SFPKy8z3Nz2js3k5ipncw680uaEiEtbTA0J2e5mnd7oA1S1hYoIUd+21JGuH17j7Ls
         mRLuMsUrqhPHCS7fDnQSc8EknItNW/hkCMKdQOlQKWWHji0GbjPKot93d0a1i4zstnB1
         ThmiU74xvvS2nUT91pIKmtmULwY38CVXPjg6O5ehenelelPYARDLqeClnvHKoFJO4vCz
         j1beNDEaq30tSNt+dWmWPcfRDwVoPS5+EnGAk0HA7t41OoTq/LWz8lM2/aJQEUVtfTK7
         RUfxZu4zVS6h1llo/zIuZxcJQRd0aLF6cOkVDD7j4VT4p+kTxImfY+BeTe4SW7we9NLG
         Ly8w==
X-Forwarded-Encrypted: i=1; AJvYcCW3gLDeO4Ap/oMrHeYwJDM0EWgtBisdZmr7rTIu+KfBRgyFMQdLHEEPcbtrJyCiAMTFa2CE57Q/f70=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5q1KfpfgDLC1kMteD0vqhK72XFdIa1vNV5F7KqBFkxgLYCxHP
	OMp+YYu0rpSt/1IRjFqJ7+xKcmbLW37oRIIQaeo+WrLo0b7mb+8x4kJQX7Xxwbvb67DMu4SRSo3
	aldIC/2LyJFm71+keo2zg6d7FFXydg6gavqogKM6al+4GOPR6EElfIyxKWx1zepokCUF+
X-Gm-Gg: ASbGncsOMPQSZ7bFDCtQ36ilhs+DkePi4/WjLt8QL0nSeXR6qRmlyCNc4Ccy245D7IL
	UHcTldglYykO+4pJoz11uym36+1YOhFd6T3IBB2D7/VgjCqLt64KVDQg+6X4gdBpTyDgNo/Z22K
	FezjvdUD7yI6Jrr7euRvmFbArreVIhCYUUBvLGR0vZzwu+TpcoxfJ5eXKpgEqj6DGRCd91O45BV
	Ne2q/KA2KOskAM/WszL0SJW3g2k9MmnMuuvtCHvekcF92j4XWSG6HoI1A1fm485RRpEnZExS0Yt
	pT1n+sTCM03Fk/UkW7pzhUs8LYV5g2cMF6Et8jykSbOLw/0+RlcgUqUi4RGgfBCA6VSxjMJLHNK
	cLoQoNVdzMbU69xy+k2Vbh8s=
X-Received: by 2002:a05:600c:c0ce:b0:450:c9e3:91fe with SMTP id 5b1f17b1804b1-456346e2767mr22597955e9.0.1752753140276;
        Thu, 17 Jul 2025 04:52:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRhI54TwDUdDBNIeRKh7AVS/hfT6FB+wtUWYU/lc2VhuDIhVT1QHk+Jezb55nN35RC/TrzYQ==
X-Received: by 2002:a05:600c:c0ce:b0:450:c9e3:91fe with SMTP id 5b1f17b1804b1-456346e2767mr22597745e9.0.1752753139781;
        Thu, 17 Jul 2025 04:52:19 -0700 (PDT)
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
Subject: [PATCH v2 2/9] mm/huge_memory: move more common code into insert_pud()
Date: Thu, 17 Jul 2025 13:52:05 +0200
Message-ID: <20250717115212.1825089-3-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717115212.1825089-1-david@redhat.com>
References: <20250717115212.1825089-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fnLFrf0_IOW8Cyiyu9eSCUjiuSTbteqUatPOmatIhfk_1752753140
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
index 1178760d2eda4..849feacaf8064 100644
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


