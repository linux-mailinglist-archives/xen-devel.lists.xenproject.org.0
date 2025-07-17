Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8253B08C03
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 13:52:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046609.1416994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNA8-0002Eq-BX; Thu, 17 Jul 2025 11:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046609.1416994; Thu, 17 Jul 2025 11:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNA8-0002Cs-7a; Thu, 17 Jul 2025 11:52:32 +0000
Received: by outflank-mailman (input) for mailman id 1046609;
 Thu, 17 Jul 2025 11:52:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiP3=Z6=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ucNA7-0001TV-8e
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 11:52:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83145ad0-6304-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 13:52:29 +0200 (CEST)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-kjiagve7N_6QEj5t06ikXg-1; Thu, 17 Jul 2025 07:52:26 -0400
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4f6ff23ccso739374f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 04:52:26 -0700 (PDT)
Received: from localhost
 (p200300d82f1f36000dc826ee9aa9fdc7.dip0.t-ipconnect.de.
 [2003:d8:2f1f:3600:dc8:26ee:9aa9:fdc7])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45634f9d599sm19697745e9.33.2025.07.17.04.52.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 04:52:24 -0700 (PDT)
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
X-Inumbo-ID: 83145ad0-6304-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752753147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WawR8xzOLp+WGO3JwZK8yJOVf+K8h9KX2DcE6xt9pRU=;
	b=hovra43iMTyf0y8y9ueFmfIlzTlKFSW85ZKj24pk26m2sk/zCuGwdFc1b9n+0nwL1LGXPv
	YRqpIjXYYzNu5384WCA3GLgRoiuY3IEAiPQTcJLRu0Y+C0krfTbk7RHKcjCApe9uh/Hk/a
	GbduXrK3iB9/sGKyvP/BdRv1AkNAEqU=
X-MC-Unique: kjiagve7N_6QEj5t06ikXg-1
X-Mimecast-MFC-AGG-ID: kjiagve7N_6QEj5t06ikXg_1752753145
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753145; x=1753357945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WawR8xzOLp+WGO3JwZK8yJOVf+K8h9KX2DcE6xt9pRU=;
        b=WuXmcp7kg0umeDQBlK36LSHc166ZvB2rHoG/oOkM/ktQaeE50tBIk72rWCcM6YXcPw
         DtVkwtOVt+S0cn7qVA4G19M+yc4ZGjYvfAcwWtXhkmEKZ0sBin0e+yVyu3Sm8ZVidTE3
         k1PBwHBrTzV9JJWuTmKlp5Sn1BRNX009n92KwW49V4Ig2pbfMmpbOCVPGHAUIbn/u+1A
         2C70FgwWZQKUmZHB/BKHBGh3vaKe9UvKvRxNQopOAU81oaWw786C5CorViDJ+8O67J2w
         BEL4rao77Fj2OcZ7iUUAfcoLm1fcknY4an+80wSLsxIkOsjpBO/rb57TF8IX4pfearQ+
         j5aw==
X-Forwarded-Encrypted: i=1; AJvYcCUoQOCK2GM+owTWD5DUFPim7QMTe1Yrse+nouBCzO1WxfGhGovL9E7u4RQDlV4vI0XGPDMvJAwfkVQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygUDHNqpaTATXamXmGGT2/MbedWjsnrOAJ+nscf8x9zmLH9BN5
	UKbgj1qxBqQWu07mArMpsdc023nUslG6n8uIDG7m02DkyVk4YBXreYxGDFMDXOTo99XZdpJnTFb
	LTJyORV9/EmeGRBW4poQVraQf/FjY0ZOP4y0IM13afa3fWJnQdxsIzvEDwHZhOy4j77oS
X-Gm-Gg: ASbGnct0ASP8utII9vhaFtc6pQY7A8uDVPy23qGHUyF7iVVweFIza+Rfr2GfYDdWTIC
	/2g5htGyH+DdhTHNFGkDjXweI1GHsK4WeM84cJfJtPqakohxswiuWubxsNEoe+Wm21MSIeMgGUi
	cpdsY4mOB6dOxjwLqg5CEJ7gahebP3V3WiI5YYHa5sW7RqxghqnG7veHOjtbVOc6OdS6aUa0DDU
	uRCMVQETDl0sXE0FWHzwBDIE6Z+qvQe8Mjb91i0yEzaCu15Uh1c8MBeiZ4FaRjKMOlbNycEFdIV
	mDic/sfXcmm7wEVKM4mz07CCnOdW9dzL25CVRQwUt42z2axuWoaQHJ5ieP5zOP2Ik79G3I5sc2B
	vvrLjY+fbhD+WPI92ZdAV5Pw=
X-Received: by 2002:a05:6000:4b02:b0:3a5:52d4:5b39 with SMTP id ffacd0b85a97d-3b60dd4ab27mr4713882f8f.8.1752753145080;
        Thu, 17 Jul 2025 04:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDhmg9Ls7QQA6yWIIBzDvc6abI92P/fYxcVRDFmyoxlxNBqWLFwcd4nrVInyOX88jAc9Q7DA==
X-Received: by 2002:a05:6000:4b02:b0:3a5:52d4:5b39 with SMTP id ffacd0b85a97d-3b60dd4ab27mr4713858f8f.8.1752753144606;
        Thu, 17 Jul 2025 04:52:24 -0700 (PDT)
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
Subject: [PATCH v2 4/9] fs/dax: use vmf_insert_folio_pmd() to insert the huge zero folio
Date: Thu, 17 Jul 2025 13:52:07 +0200
Message-ID: <20250717115212.1825089-5-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717115212.1825089-1-david@redhat.com>
References: <20250717115212.1825089-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: auIxs0mUXqhVbQcRUmwxmDAXCs5ylYdjA84hB6aTJH0_1752753145
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


