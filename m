Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3EAB207A3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:27:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077385.1438486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQg3-0007A3-Mb; Mon, 11 Aug 2025 11:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077385.1438486; Mon, 11 Aug 2025 11:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQg3-00077n-Hh; Mon, 11 Aug 2025 11:26:55 +0000
Received: by outflank-mailman (input) for mailman id 1077385;
 Mon, 11 Aug 2025 11:26:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gc+J=2X=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ulQg2-000725-Bs
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:26:54 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1192623b-76a6-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 13:26:49 +0200 (CEST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-W1i_k4xVO1uXNMAJbHv6aA-1; Mon, 11 Aug 2025 07:26:46 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3b7806a620cso2471972f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:26:46 -0700 (PDT)
Received: from localhost
 (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de.
 [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c4696c8sm39325003f8f.55.2025.08.11.04.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:26:43 -0700 (PDT)
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
X-Inumbo-ID: 1192623b-76a6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2CQ37fr3U8Nz67n3Rs/zLbnQBIPHeKcdveRJNY/DHTc=;
	b=HF8efkpCovdeGRPT70MfYPsAaEiWTZ0y0ohE1OCjP9NFvhh3mBJAR0NzOoyN7yRZsnnMbv
	yKxXZRR0BGgjmmJxZDPiXaWdv0OP1kCchRY6xd42FcdTIX36zkbmkucopok+npSTISmJWr
	YmszCzw+ACqKcu3akQc4KqyhROT33jU=
X-MC-Unique: W1i_k4xVO1uXNMAJbHv6aA-1
X-Mimecast-MFC-AGG-ID: W1i_k4xVO1uXNMAJbHv6aA_1754911605
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911605; x=1755516405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CQ37fr3U8Nz67n3Rs/zLbnQBIPHeKcdveRJNY/DHTc=;
        b=hyJgJFIwSOPKHjD6c+HcjVXFZBJH04YOTjLR40Qxlii+79O9ha8SAiNN+fR0HV0343
         fJsekuVkeSYKjex+h+vB5Eir4bmpgBs2USCRiLM10drVWA+2t40Imx094Xm4Wp9kPq3J
         yyEt9L+wbT6RGTyNqAyMNLidYvSrbAuquG43AIh2V31pmzwOhJKahC0KjTNl8tEAY1x0
         eOndrob2tpTynLezTlZ/KW8ovu3RyUFkLd+ORk/7zBWS5ojwMc1sCQjSEBJ5hLotN8Gh
         VXf84A+XUIGWcIReTfk1G4J+WESMOUXXOglldVDy1Uqte0ncPpPfigVFxskiAYaGTcWW
         +0Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVzGVjTxc5r1HEBRZl3R2E56p4JtOTcxSwENvc+M2PsKdIfHcc2Mh5n8tmfrcVsOuSPOJ0690VX4lA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyG71EPdsEhOb2pB1DYdyONUyY3iv00GrJ0QEIpfQHLdurTRo/l
	BTYECI0VMZxmxyrMCXrymS7cef8XIRUe0vznBmlgQd8WX1ny+xPlyHSaEmHzaN8W0Cht3aUwxiw
	JtB/2+9dNlKaoqNjvpnikufLkqvf371XiHeo8rlaR/kptrIE+nLcXibdgj0QETZGxknJr
X-Gm-Gg: ASbGncvzT3ZntM/fcFm9Af8Y6tgAz+2eDQ0S4elmGQezAzhMQi8g/H1xnRkRSeMfpiK
	46Wz3y91LYxtPZEO7+vRb7lT8pLQJAga9ouBoNarv64NjJQ+uEFlhWqNE5CXBV7V2E3LFTCiH5I
	ekn40Qs9jP1cMyLLGCUty85nzyzs8LnYK+q8EXYdXnnXcQcDmgm3oYJqGMH5ar0GJTxowDpYamU
	FkvqBwOIFSVrVK44MQo7nMfJsOA5ZN2wp11FwflLcUmFQR4Dgkmzm6KZELOld7O2J8GQHtE6Kom
	tT07/MCupg2nlI5iDbw1NLf21RiHgay0AZusPEpfvPMb42sDtkDnW1cq69LkprktlGqkz8VABoV
	fybv4zZX1B8R698n0flUaKqwG
X-Received: by 2002:a05:6000:220c:b0:3b3:9c75:acc6 with SMTP id ffacd0b85a97d-3b900b579abmr8417879f8f.59.1754911604978;
        Mon, 11 Aug 2025 04:26:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhtoj1JC1TeyGzrT2XifHRNOizQnW6DZ2myFR7vrwjVvSFSoQpoWzRIG0dK3lnMunpNHs17g==
X-Received: by 2002:a05:6000:220c:b0:3b3:9c75:acc6 with SMTP id ffacd0b85a97d-3b900b579abmr8417828f8f.59.1754911604480;
        Mon, 11 Aug 2025 04:26:44 -0700 (PDT)
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
	Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v3 04/11] fs/dax: use vmf_insert_folio_pmd() to insert the huge zero folio
Date: Mon, 11 Aug 2025 13:26:24 +0200
Message-ID: <20250811112631.759341-5-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811112631.759341-1-david@redhat.com>
References: <20250811112631.759341-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YBzh-O3fn_PVBRwRWXx9nqcdbKfRJOI99aXcNNnYfpQ_1754911605
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Let's convert to vmf_insert_folio_pmd().

There is a theoretical change in behavior: in the unlikely case there is
already something mapped, we'll now still call trace_dax_pmd_load_hole()
and return VM_FAULT_NOPAGE.

Previously, we would have returned VM_FAULT_FALLBACK, and the caller
would have zapped the PMD to try a PTE fault.

However, that behavior was different to other PTE+PMD faults, when there
would already be something mapped, and it's not even clear if it could
be triggered.

Assuming the huge zero folio is already mapped, all good, no need to
fallback to PTEs.

Assuming there is already a leaf page table ... the behavior would be
just like when trying to insert a PMD mapping a folio through
dax_fault_iter()->vmf_insert_folio_pmd().

Assuming there is already something else mapped as PMD? It sounds like
a BUG, and the behavior would be just like when trying to insert a PMD
mapping a folio through dax_fault_iter()->vmf_insert_folio_pmd().

So, it sounds reasonable to not handle huge zero folios differently
to inserting PMDs mapping folios when there already is something mapped.

Reviewed-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fs/dax.c | 47 ++++++++++-------------------------------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 4229513806bea..ae90706674a3f 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1375,51 +1375,24 @@ static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
 		const struct iomap_iter *iter, void **entry)
 {
 	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
-	unsigned long pmd_addr = vmf->address & PMD_MASK;
-	struct vm_area_struct *vma = vmf->vma;
 	struct inode *inode = mapping->host;
-	pgtable_t pgtable = NULL;
 	struct folio *zero_folio;
-	spinlock_t *ptl;
-	pmd_t pmd_entry;
-	unsigned long pfn;
+	vm_fault_t ret;
 
 	zero_folio = mm_get_huge_zero_folio(vmf->vma->vm_mm);
 
-	if (unlikely(!zero_folio))
-		goto fallback;
-
-	pfn = page_to_pfn(&zero_folio->page);
-	*entry = dax_insert_entry(xas, vmf, iter, *entry, pfn,
-				  DAX_PMD | DAX_ZERO_PAGE);
-
-	if (arch_needs_pgtable_deposit()) {
-		pgtable = pte_alloc_one(vma->vm_mm);
-		if (!pgtable)
-			return VM_FAULT_OOM;
-	}
-
-	ptl = pmd_lock(vmf->vma->vm_mm, vmf->pmd);
-	if (!pmd_none(*(vmf->pmd))) {
-		spin_unlock(ptl);
-		goto fallback;
+	if (unlikely(!zero_folio)) {
+		trace_dax_pmd_load_hole_fallback(inode, vmf, zero_folio, *entry);
+		return VM_FAULT_FALLBACK;
 	}
 
-	if (pgtable) {
-		pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, pgtable);
-		mm_inc_nr_ptes(vma->vm_mm);
-	}
-	pmd_entry = folio_mk_pmd(zero_folio, vmf->vma->vm_page_prot);
-	set_pmd_at(vmf->vma->vm_mm, pmd_addr, vmf->pmd, pmd_entry);
-	spin_unlock(ptl);
-	trace_dax_pmd_load_hole(inode, vmf, zero_folio, *entry);
-	return VM_FAULT_NOPAGE;
+	*entry = dax_insert_entry(xas, vmf, iter, *entry, folio_pfn(zero_folio),
+				  DAX_PMD | DAX_ZERO_PAGE);
 
-fallback:
-	if (pgtable)
-		pte_free(vma->vm_mm, pgtable);
-	trace_dax_pmd_load_hole_fallback(inode, vmf, zero_folio, *entry);
-	return VM_FAULT_FALLBACK;
+	ret = vmf_insert_folio_pmd(vmf, zero_folio, false);
+	if (ret == VM_FAULT_NOPAGE)
+		trace_dax_pmd_load_hole(inode, vmf, zero_folio, *entry);
+	return ret;
 }
 #else
 static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
-- 
2.50.1


