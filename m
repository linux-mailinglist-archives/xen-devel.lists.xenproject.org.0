Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EAAB207EB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077485.1438546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQke-0005KD-Us; Mon, 11 Aug 2025 11:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077485.1438546; Mon, 11 Aug 2025 11:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQke-0005Gp-Ru; Mon, 11 Aug 2025 11:31:40 +0000
Received: by outflank-mailman (input) for mailman id 1077485;
 Mon, 11 Aug 2025 11:31:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gc+J=2X=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ulQgC-0005jI-Nn
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:27:04 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a90028c-76a6-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 13:27:04 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-J7Bl7JtlPwejkEaYRIShJg-1; Mon, 11 Aug 2025 07:27:01 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-458c0c8d169so25192455e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:27:01 -0700 (PDT)
Received: from localhost
 (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de.
 [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458be70c5f7sm376335155e9.26.2025.08.11.04.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:26:59 -0700 (PDT)
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
X-Inumbo-ID: 1a90028c-76a6-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DfX1fQMnvUejv+2+JWwebv5CirI4aCq8/b8BncrLfY4=;
	b=M/Jia8ylEwFnEJIKIYmljTKYo6R6xqrWqn7X4qPa7gz2cUI61e6gR5b/lj8ZsoHg25RODd
	7L/Bk+QO9Vk4qZFIlTdOl5Su7iT7lyFRpqmDRGuSznrNiln0F0y1SakoWlmwOXtsRQLwKm
	Vi2RIdft5S16EXXPZ1No4hLtFCTYXQA=
X-MC-Unique: J7Bl7JtlPwejkEaYRIShJg-1
X-Mimecast-MFC-AGG-ID: J7Bl7JtlPwejkEaYRIShJg_1754911620
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911620; x=1755516420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfX1fQMnvUejv+2+JWwebv5CirI4aCq8/b8BncrLfY4=;
        b=LNd8aKz/jsxuqs8nOjmm6wIG0maLf0fCDrpIj3DkehDoTWP2ErzI7SJyfMa4GH4eqs
         jfc6tibdXLaWA4qQrVWrClxdTe/do0QRHvutycWUZwC1n/o974hLOFh2AbI2RCMpToer
         dBYIWU2R9srn8YtXYXwtXJtHmTnU4fARSnFSCGO1ODxo8WSmrSBGWjfIXyUC1Iedu4NM
         ZGY+5Z8Rxc+rg6+QaZwwn31ddTg0FYxFFxiQL9bMps71to7zvawUT7pXBWRRlwkzWtWq
         dGk+6Om8695QSjRok86Yl0/zGnoipzlC6qKDBjOnHmhvoyo1NurCiuKtNIvFfqkdsadx
         Z2HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvVEuLleVNOcUzryJODScPunEi9daJ9O7vbMdPOMn0RMaDGT66Wuo7KCgEfIudfbMyPDRV76ZTZqE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2L1MLAhT9gPhjsl/udj9qZzfpHA5wQqU2+ypsmPW617gAed2d
	p0twFKJZELKKeLHd4VMnB6WWmfdkOQKtP7kp7/R5wkGrLa7MMh0AkvpGPruQcwt+nBPzVd3FfvV
	LgcReBItbhGrm2QIbx6TDRnxdXBMbXTrED+Chs7NiB+apBueAvZrsxWux5MUazgGn9oPE
X-Gm-Gg: ASbGncvBJVA4BaQMliAN1nXDCkuUAOL2p+72K7GdWU2ZycHLml9YElFDgz0QMAstuOD
	QKCV+EaBM28NszDZ4jSuGRBt4Vxjw/FiSRMhHhcrX2jtfxaH5zk4F2Uw9magVdgsDGTglBCpwLT
	VLwtKgZF0c2KZY4XIpik6dShpeac0Q6mH2LOITCO+ro8A0sjrSZuuAFrklbsfF1duXu25NTDV93
	dI2BAQa0oq/7CnaS24RqaciUnrxgGd82o/jH19uOkeihQCO+cSnN1xO2TrwBmevZ+2E+4SKPy+N
	JOCuJsqpja2xsUV4vj3d9Slj5jGF8jd7mLMu85pKH1CDn0T2SFTvMwSgwUMaTvYus/oCdMNkRzS
	1z+IfWGalF5ofmtFIO76CUPPn
X-Received: by 2002:a05:600c:c493:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-459faf4758bmr80581265e9.11.1754911620237;
        Mon, 11 Aug 2025 04:27:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBm+6FX9Xdf6wc1nTSJlLqt7RXq7PC8peG73SnR2aY3/2U0Fhn5nWzADDyt5hVIbhoPtrtZw==
X-Received: by 2002:a05:600c:c493:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-459faf4758bmr80581015e9.11.1754911619781;
        Mon, 11 Aug 2025 04:26:59 -0700 (PDT)
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
	Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH v3 10/11] mm: introduce and use vm_normal_page_pud()
Date: Mon, 11 Aug 2025 13:26:30 +0200
Message-ID: <20250811112631.759341-11-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811112631.759341-1-david@redhat.com>
References: <20250811112631.759341-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cXmDKqwDzBOs5btzypjSt2G1Oox1iBOnaumI81hhUkw_1754911620
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Let's introduce vm_normal_page_pud(), which ends up being fairly simple
because of our new common helpers and there not being a PUD-sized zero
folio.

Use vm_normal_page_pud() in folio_walk_start() to resolve a TODO,
structuring the code like the other (pmd/pte) cases. Defer
introducing vm_normal_folio_pud() until really used.

Note that we can so far get PUDs with hugetlb, daxfs and PFNMAP entries.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h |  2 ++
 mm/memory.c        | 19 +++++++++++++++++++
 mm/pagewalk.c      | 20 ++++++++++----------
 3 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b626d1bacef52..8ca7d2fa71343 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2360,6 +2360,8 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 				  unsigned long addr, pmd_t pmd);
 struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 				pmd_t pmd);
+struct page *vm_normal_page_pud(struct vm_area_struct *vma, unsigned long addr,
+		pud_t pud);
 
 void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
 		  unsigned long size);
diff --git a/mm/memory.c b/mm/memory.c
index 78af3f243cee7..6f806bf3cc994 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -809,6 +809,25 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
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
+ * Get the "struct page" associated with a PUD. See __vm_normal_page()
+ * for details on "normal" and "special" mappings.
+ *
+ * Return: Returns the "struct page" if this is a "normal" mapping. Returns
+ *	   NULL if this is a "special" mapping.
+ */
+struct page *vm_normal_page_pud(struct vm_area_struct *vma,
+		unsigned long addr, pud_t pud)
+{
+	return __vm_normal_page(vma, addr, pud_pfn(pud), pud_special(pud),
+				pud_val(pud), PGTABLE_LEVEL_PUD);
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


