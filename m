Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1967BB05BD1
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:24:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044065.1414150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdf-0004yC-RQ; Tue, 15 Jul 2025 13:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044065.1414150; Tue, 15 Jul 2025 13:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdf-0004vs-Nc; Tue, 15 Jul 2025 13:24:07 +0000
Received: by outflank-mailman (input) for mailman id 1044065;
 Tue, 15 Jul 2025 13:24:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVo=Z4=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ubfde-0004Ab-SJ
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:24:06 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb00aabd-617e-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 15:24:06 +0200 (CEST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-HF9NURg9MTaqfOz4V4eo7w-1; Tue, 15 Jul 2025 09:24:03 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4f858bc5eso4181566f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 06:24:03 -0700 (PDT)
Received: from localhost
 (p200300d82f2849002c244e201f219fbd.dip0.t-ipconnect.de.
 [2003:d8:2f28:4900:2c24:4e20:1f21:9fbd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8e0d719sm15297274f8f.54.2025.07.15.06.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 06:24:01 -0700 (PDT)
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
X-Inumbo-ID: fb00aabd-617e-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752585845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=80PJLXORrw3H7rwjCmXyFxVPsu/BFZ5pBpUGrZ/8JVA=;
	b=JGqOZEo+oTLb9+6P/0Om5vIyePNysJU41M+u0s5NJxTpa4rTA4HgxgL9JjTniOWyz1yLQI
	9MApVInTIQ0r3jU1tZhn3QCL4Vkosdf7RrvBIfsx9kS+2gKGB+4sV3SlnqwMAxr04OpTmu
	uIHEKUxsCbI7ZpddttgEm+WjAiMltrI=
X-MC-Unique: HF9NURg9MTaqfOz4V4eo7w-1
X-Mimecast-MFC-AGG-ID: HF9NURg9MTaqfOz4V4eo7w_1752585843
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585842; x=1753190642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80PJLXORrw3H7rwjCmXyFxVPsu/BFZ5pBpUGrZ/8JVA=;
        b=SOZ8APh8nWDnOFjjX2JU/SM+0jzeR5Ejv6rSPOGyH1R4V/NR8mFoDjcjPcLlIWDI+K
         ghB9ff7ctXPcwi8+3T9avOXJzl14e1TlJRk4igLpAr8N0GReWCheY2RM6LrK3XMPlVbw
         mWYNx6xqOcOtqIcz9uo1GFNxvOoTfxJRaLAOBNOlLOd4zPo7uHIQlnD/FDtRL5tEljjn
         BeMN2xQ72odMt39Q4lgwgCUNR8ptoRxUYfj/CwO0ZLKebgxYukGjkWW08/C15ae2im1L
         F0Dh/G4WuGmxjIyZ5PIdLWaz/xwpxh6gjNASpBpjbWg3BC/4Ojv5b31VUBX/yZ4kc4/j
         X7ow==
X-Forwarded-Encrypted: i=1; AJvYcCUbilP6jXpPRSs0OFjuP8kHkGU3DqNxeB24GYm08sZ0F9PEzQWmn3qzv/uasQQu8bwBiXXosY6Hzvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxv4uCcFOC4/e7wvTORx5sAK48m4I9XDUyzTEvWJYJBBMjBZAM4
	zvU8W9P3mofzFckm7wxpJ3fjzf5l5Wzg1NxAo3SoTzeQsAcJEQRnlyL01b/RzR1HSs+EA2FuQ85
	rQ5TSUuQL8RmHOuARWh0Xo35LQPxyLeoAEMuRZvHuSJsr9jBpQs2RUsUOefTWI9rPqX9p
X-Gm-Gg: ASbGncvEbD5hrTYE2tugsjnqgyr8BjEX+yMVcSmvyQOZ0ch+WCDWQ2ti3xOk7cPyMKP
	0jpQEKIbSWmLEVaHJGjzztDvXkc2zud95u5IXRgGCAqI1Eqaq05Wpl6tY+QsbBKCSVjm5acyD3Z
	WxB+/iUxD8vmQwgIVmyB5Xdvj/amXTnHLNqEAWWl2sn+lEhEVFmZymaR+MXxeVSEb5B5I6yr5d4
	G0cyj14/YkamsxnfcQl9I3mCVPNsE4GQqsJoa/Pw11jLurI0zQMwerR2X6D9aOpQpL0tJfPM6PB
	UUwQXz4syFkW9dXlETthDwwYdO/9wqm8LZZSr6zAUeXzHVLpt2hV7soGbAVvEnHm4aFvwQ2gCCT
	CxFUnHApi4Mve7wRu6kSB4Nmw
X-Received: by 2002:a05:6000:230e:b0:3b5:e6f2:9117 with SMTP id ffacd0b85a97d-3b5f2e3083dmr13500633f8f.39.1752585842446;
        Tue, 15 Jul 2025 06:24:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4Mv4tTd5MMu5ncCf3BOQ9JFfOJXwaxaOdtEK+d74QRgh71f+xeQhxUGyEq6hfTSErOkM9rA==
X-Received: by 2002:a05:6000:230e:b0:3b5:e6f2:9117 with SMTP id ffacd0b85a97d-3b5f2e3083dmr13500595f8f.39.1752585841971;
        Tue, 15 Jul 2025 06:24:01 -0700 (PDT)
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
Subject: [PATCH v1 4/9] fs/dax: use vmf_insert_folio_pmd() to insert the huge zero folio
Date: Tue, 15 Jul 2025 15:23:45 +0200
Message-ID: <20250715132350.2448901-5-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715132350.2448901-1-david@redhat.com>
References: <20250715132350.2448901-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DftVzNdCgd7nbb0kHaUmfFd-FFeH73VGyvHR4J9cDGw_1752585843
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


