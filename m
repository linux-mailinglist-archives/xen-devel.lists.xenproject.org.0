Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EA8B05BD8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:24:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044075.1414187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdr-0006IP-Ss; Tue, 15 Jul 2025 13:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044075.1414187; Tue, 15 Jul 2025 13:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdr-0006B1-LJ; Tue, 15 Jul 2025 13:24:19 +0000
Received: by outflank-mailman (input) for mailman id 1044075;
 Tue, 15 Jul 2025 13:24:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVo=Z4=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ubfdp-0003wf-Cw
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:24:17 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00afcd6f-617f-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 15:24:15 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-aURPM_nvNumdoamKKCBiDA-1; Tue, 15 Jul 2025 09:24:13 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4560b81ff9eso19992355e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 06:24:12 -0700 (PDT)
Received: from localhost
 (p200300d82f2849002c244e201f219fbd.dip0.t-ipconnect.de.
 [2003:d8:2f28:4900:2c24:4e20:1f21:9fbd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-454dd537c6fsm163863975e9.21.2025.07.15.06.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 06:24:10 -0700 (PDT)
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
X-Inumbo-ID: 00afcd6f-617f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752585854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipu1K94ir7ZDGEwTFYIjfG52vTt/Yk6xgTkmlb9d9g0=;
	b=EmFMHeivJULGpdt/+xqA4bWYX6oRvmQ+ZqFHJV/ZIz3Jq5kgxIo8gwjYx1/z59t/LBOXtI
	Jc+Co2sCG2g0vleDIQik+oI60L8iwYH8Xu1FAzRnRL86erbI1ooLy7HHVR0MFgrte/xiDw
	VS8E28JvBNuIpD8xeuIxPuzVbLyDJ0w=
X-MC-Unique: aURPM_nvNumdoamKKCBiDA-1
X-Mimecast-MFC-AGG-ID: aURPM_nvNumdoamKKCBiDA_1752585852
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585852; x=1753190652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipu1K94ir7ZDGEwTFYIjfG52vTt/Yk6xgTkmlb9d9g0=;
        b=VuzqkuM+pfpev9qHMCHyn+Ji9pVVfV/gYW7/6PVMcG8ttBmMJ3GhWoddT4fa1fJop0
         7IIcP9RMhmER58qgO4+KJYj3OhrcS/Gka+UUhbTw/3NfoA4QzAWKPsDYVETMg9quQ7yU
         evwJQKLqyTyZsm5t1ANQotUiPHLsqDmvGNqGxrFzA3qoh86ZxDXbe1GoqiqbIP//E/pG
         JRH0QMt+67EqF51lTVrJ48sxsYcjMLbiyoozdUS2AHeFj1q4HQcC6QpSdFZUy4K+Un2Z
         KWdLFrwL0B5IKeUNE6izGigBhoRxGTiHrq5c3xvdoG7lD4/bieEH5QdgGLvCrMvn5QNl
         rAHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr5RobulMEqFx708vlzG6i63QeGM1J36fI5k/oROcznwGmSKDyBADKZpehjRzpl1pJGn4nKlxzmYY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxra42hRChgiGGiKAT+K19KVDj4v1qfdNozwR2rwJRFumpSWDH4
	2rT/mWh7old4mN/OW9aZPxSYvnU/7bSRplL9BWuOafXWWEGlsqgchvK2qtWZ1nbEtEen+4ysQ2t
	siW2fanOSX3O8Kh0gDYd554JSFg/a+24DS6xi30MonpZvfB3UZmvLny1Zrc6QTcjE3bxs
X-Gm-Gg: ASbGnctrmfQIEbiTU5uUGYeqHaRsSBNy6D2zDLWS8bu1Ba887+/C3s2r1rQWPUV8Dcg
	4cDUkpQwvqIm64beEUiO85A818o6oI8BlaRUTtwQceu6T7OixgOD0GSsEgDeVABORipxXuni/wz
	yGAuXu7aTRbW2HCymfHF8L6dPt/9FoWBTdJfQetqQquGjtXeIRQnlU733/yuZV6SAYdlU/+VPrc
	G2UuZ/4pXa70TALIEnk0EccsGlFZxhTGgZZ7MbPA/OLUqfGIQzSrvTMNObA6AU2Y5WtkRGziROt
	iyPK7xJxbEvHI0Rt18KmJnTh59cqAgi4b2Nnp3CY4dfG9deBLKQsRqm/OSvELXjv6XX7361VdnG
	LtIL94ffgF81EDdCKC5kuMsEN
X-Received: by 2002:a05:600c:8b21:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-454f427c7a3mr171862345e9.8.1752585851887;
        Tue, 15 Jul 2025 06:24:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaYqvO7Z17qzgP+gQiOIR1ioSQdxI9NA77sZCIReClJxyu/a9rC4GbIDSj1kdPYM9bqwFuHQ==
X-Received: by 2002:a05:600c:8b21:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-454f427c7a3mr171861965e9.8.1752585851440;
        Tue, 15 Jul 2025 06:24:11 -0700 (PDT)
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
Subject: [PATCH v1 8/9] mm: introduce and use vm_normal_page_pud()
Date: Tue, 15 Jul 2025 15:23:49 +0200
Message-ID: <20250715132350.2448901-9-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715132350.2448901-1-david@redhat.com>
References: <20250715132350.2448901-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -MCPm5OJX9awxkXO8KCobCn8z6VX-UHO-9M_8xr18PQ_1752585852
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Let's introduce vm_normal_page_pud(), which ends up being fairly simple
because of our new common helpers and there not being a PUD-sized zero
folio.

Use vm_normal_page_pud() in folio_walk_start() to resolve a TODO,
structuring the code like the other (pmd/pte) cases. Defer
introducing vm_normal_folio_pud() until really used.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h |  2 ++
 mm/memory.c        | 27 +++++++++++++++++++++++++++
 mm/pagewalk.c      | 20 ++++++++++----------
 3 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 611f337cc36c9..6877c894fe526 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2347,6 +2347,8 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 				  unsigned long addr, pmd_t pmd);
 struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 				pmd_t pmd);
+struct page *vm_normal_page_pud(struct vm_area_struct *vma, unsigned long addr,
+		pud_t pud);
 
 void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
 		  unsigned long size);
diff --git a/mm/memory.c b/mm/memory.c
index d5f80419989b9..f1834a19a2f1e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -802,6 +802,33 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 		return page_folio(page);
 	return NULL;
 }
+
+/**
+ * vm_normal_page_pud() - Get the "struct page" associated with a PUD
+ * @vma: The VMA mapping the @pud.
+ * @addr: The address where the @pud is mapped.
+ * @pud: The PUD.
+ *
+ * Get the "struct page" associated with a PUD. See vm_normal_page_pfn()
+ * for details.
+ *
+ * Return: Returns the "struct page" if this is a "normal" mapping. Returns
+ *	   NULL if this is a "special" mapping.
+ */
+struct page *vm_normal_page_pud(struct vm_area_struct *vma,
+		unsigned long addr, pud_t pud)
+{
+	unsigned long pfn = pud_pfn(pud);
+
+	if (unlikely(pud_special(pud))) {
+		if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
+			return NULL;
+
+		print_bad_page_map(vma, addr, pud_val(pud), NULL);
+		return NULL;
+	}
+	return vm_normal_page_pfn(vma, addr, pfn, pud_val(pud));
+}
 #endif
 
 /**
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 648038247a8d2..c6753d370ff4e 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -902,23 +902,23 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 		fw->pudp = pudp;
 		fw->pud = pud;
 
-		/*
-		 * TODO: FW_MIGRATION support for PUD migration entries
-		 * once there are relevant users.
-		 */
-		if (!pud_present(pud) || pud_special(pud)) {
+		if (pud_none(pud)) {
 			spin_unlock(ptl);
 			goto not_found;
-		} else if (!pud_leaf(pud)) {
+		} else if (pud_present(pud) && !pud_leaf(pud)) {
 			spin_unlock(ptl);
 			goto pmd_table;
+		} else if (pud_present(pud)) {
+			page = vm_normal_page_pud(vma, addr, pud);
+			if (page)
+				goto found;
 		}
 		/*
-		 * TODO: vm_normal_page_pud() will be handy once we want to
-		 * support PUD mappings in VM_PFNMAP|VM_MIXEDMAP VMAs.
+		 * TODO: FW_MIGRATION support for PUD migration entries
+		 * once there are relevant users.
 		 */
-		page = pud_page(pud);
-		goto found;
+		spin_unlock(ptl);
+		goto not_found;
 	}
 
 pmd_table:
-- 
2.50.1


