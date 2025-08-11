Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4656AB2079B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:26:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077379.1438455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQft-0006ES-No; Mon, 11 Aug 2025 11:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077379.1438455; Mon, 11 Aug 2025 11:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQft-0006Bt-Kf; Mon, 11 Aug 2025 11:26:45 +0000
Received: by outflank-mailman (input) for mailman id 1077379;
 Mon, 11 Aug 2025 11:26:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gc+J=2X=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ulQfs-0005jI-AV
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:26:44 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e5f98b8-76a6-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 13:26:43 +0200 (CEST)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-sBgO6IejNDue9xi0LMjSkg-1; Mon, 11 Aug 2025 07:26:41 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3b604541741so2205048f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:26:41 -0700 (PDT)
Received: from localhost
 (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de.
 [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3ac158sm41049329f8f.4.2025.08.11.04.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:26:38 -0700 (PDT)
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
X-Inumbo-ID: 0e5f98b8-76a6-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1yyyzSa9KFCInkfs6rUjYFvQXjYygLyaHB4l27+lC7g=;
	b=auck456mTdU7YHdrANxIHldIkTQsFdlVSdzEmQr7AP5S3leBdk18h5JkTPz5naqoBAi1uk
	8C250HfjHjsPBmTUhdp4TsYt2lEkbX+NWh+f7Oqn3l4n4XOzPfg5fZ+osqWk4NOZIlKOuE
	xjC1Gpix8ZNZFhYBlaPrChGdlErFk4Y=
X-MC-Unique: sBgO6IejNDue9xi0LMjSkg-1
X-Mimecast-MFC-AGG-ID: sBgO6IejNDue9xi0LMjSkg_1754911600
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911600; x=1755516400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yyyzSa9KFCInkfs6rUjYFvQXjYygLyaHB4l27+lC7g=;
        b=agbBBy4fPEe3LdiL39lVpkJbS/nCT5zVDtaI1XoxBkWFqwQi/eb62qDEbQ2O/XdRqC
         WgZT+iANb++UJTwzAalVH0MkWWnzkPZHnwO7j41zB81gULXqOoG+nj+/7MbsaJLTvMfO
         4dCceFVjMLsCRr0QcX0kCq6PY5/OzqtlTGk+qG3cWeGuPLGB9CorRIMpMpH6NZQe+MxG
         xgW7L9hx9pxjApgaIPdKHwdwcKFr+rrMfZsUSnJlvoMe+eMkRpXuFrUMv+Bc38sgDJCV
         bWau6Nl9DwuDf+bGb4Fqbr1WoVYfc8+YunkvHPwK4kTnJjzvUXJkQlDAEMRHFGNJtgJK
         J4dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG9VqoNyIZZ4jUhE/Mgl8sNY8GahyNbmOuvUyX60+Ofb6Es3vKtSNHXGL9WCnbPZ0Vk8Ub4VVSb5s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZXLkyoaQ4RE/XA5DrEg1dSh+1xnZfJ/wMDSOThsQiy70YIEbA
	Dw+s5Eph7Tst/BhhhAD2EvUdlxarsMOSGAkEXCpTPaw7brqkiNubPctdKmmDXuABo7hNZK6EB2U
	h8xB0+Qc9Atn+aNbFsoGjdHdoaq89FSuhFxWqPPNUTEEaj3wq6zJ3bry1YXFaFyPVZ7p4
X-Gm-Gg: ASbGncuMUF3oeCpQAPFPI0IsOUNfyCRTIDI3x+0v+fW7pPgTijV0D4bAUPRgAxrP8QC
	K1iT33T2tPtlrEzoLbCtCZXW48b3hE3fP1VGcppOdytHL+zYEhfJAV6hJFlAoY1K2dnldz3oJhn
	s0nQsUaJFsW8FgTyxVBVCVCSpbqQ/prr/79U6hKf8D0222gYu7NNYuZCvgCL2oWtVuUrD/4VOzx
	czK9rUwfz62WgBFpyooSG3j2vrDxEC8Fo6l3Wf8oLVpbFDGF0RQ4gkpMZKjNWKt8doQAglRXSAw
	88+xC3UmXyewW00udw4NWIyjTuscDbrJEYWiNaKTLrBdl96TT0paVM/R+YZZpjsBN1RcdLwqoVu
	jLroiQZsE2Lj5rAbAfvQokpos
X-Received: by 2002:a05:6000:420f:b0:3b7:8c98:2f4c with SMTP id ffacd0b85a97d-3b900b750bfmr10920299f8f.33.1754911599891;
        Mon, 11 Aug 2025 04:26:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6Mu1XA5qq3G00OwHlXO/yqxgcBzsacx06Jz+W5A1O+vqwNvOeLKy9GaCA2AZU3zaKT01H6g==
X-Received: by 2002:a05:6000:420f:b0:3b7:8c98:2f4c with SMTP id ffacd0b85a97d-3b900b750bfmr10920251f8f.33.1754911599405;
        Mon, 11 Aug 2025 04:26:39 -0700 (PDT)
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
Subject: [PATCH v3 02/11] mm/huge_memory: move more common code into insert_pud()
Date: Mon, 11 Aug 2025 13:26:22 +0200
Message-ID: <20250811112631.759341-3-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811112631.759341-1-david@redhat.com>
References: <20250811112631.759341-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2zV0Bc21GohKuoi5U4zDBF3S50vqwpmwGFZf3gWoiCA_1754911600
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
 mm/huge_memory.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 5314a89d676f1..7933791b75f4d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1507,25 +1507,30 @@ static pud_t maybe_pud_mkwrite(pud_t pud, struct vm_area_struct *vma)
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
@@ -1544,6 +1549,9 @@ static void insert_pud(struct vm_area_struct *vma, unsigned long addr,
 	}
 	set_pud_at(mm, addr, pud, entry);
 	update_mmu_cache_pud(vma, addr, pud);
+out_unlock:
+	spin_unlock(ptl);
+	return VM_FAULT_NOPAGE;
 }
 
 /**
@@ -1565,7 +1573,6 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, unsigned long pfn,
 	struct folio_or_pfn fop = {
 		.pfn = pfn,
 	};
-	spinlock_t *ptl;
 
 	/*
 	 * If we had pud_special, we could avoid all these restrictions,
@@ -1577,16 +1584,9 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, unsigned long pfn,
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
 
@@ -1603,25 +1603,15 @@ vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio,
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


