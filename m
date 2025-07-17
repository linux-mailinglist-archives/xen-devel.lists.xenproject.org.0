Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633A2B08C5B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 14:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046672.1417066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNJO-00080d-9X; Thu, 17 Jul 2025 12:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046672.1417066; Thu, 17 Jul 2025 12:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNJO-0007y6-6U; Thu, 17 Jul 2025 12:02:06 +0000
Received: by outflank-mailman (input) for mailman id 1046672;
 Thu, 17 Jul 2025 12:02:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiP3=Z6=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ucNAJ-0001TV-KU
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 11:52:43 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a1f30ae-6304-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 13:52:40 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-MH9qw64dOEOi6kzd62KB8g-1; Thu, 17 Jul 2025 07:52:36 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45600d19a2aso7508495e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 04:52:36 -0700 (PDT)
Received: from localhost
 (p200300d82f1f36000dc826ee9aa9fdc7.dip0.t-ipconnect.de.
 [2003:d8:2f1f:3600:dc8:26ee:9aa9:fdc7])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8bd18ffsm20281626f8f.9.2025.07.17.04.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 04:52:33 -0700 (PDT)
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
X-Inumbo-ID: 8a1f30ae-6304-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752753159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y93PTvMkvM029q6ldi/06ftGqYZT07G8pbjSDy6T3hs=;
	b=JaBZcMdS5S9XA8IExD9jvf71ewPoJgEeTkgATan/uj7Tqn4tpll6lA5p7Llf6IuIT0PSV3
	hyEpv9YGxyqPedvRhfQ6oLoJBQtrslqi35TZY3y/Ah4fXZ9VEuqJbMwT/CyRyuumbity3U
	d1ZkrwEazsKmxfd4idHoRCnnvcBGW04=
X-MC-Unique: MH9qw64dOEOi6kzd62KB8g-1
X-Mimecast-MFC-AGG-ID: MH9qw64dOEOi6kzd62KB8g_1752753155
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753155; x=1753357955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y93PTvMkvM029q6ldi/06ftGqYZT07G8pbjSDy6T3hs=;
        b=DqUSXk+/CZaNiasHZMXwJh/8AbkEar5zHDRLLCyXKg1M7DprpN4gVyDx/H9SJoOx2W
         nNZQVp1Jt8Imn9g1mLgZjQzN3ePjxf2WiEmBOnmAKk5vQ501rk1Gksba4igY/ZhiVtq8
         N+bWx3PhrQEsQT6KdZx71FNSoDeTDDV1FBanXJ2Vv3NMLBVaAB1OJyYO9qwvSpofE/sN
         Ai01gV0uPztuuKzv3D60Pkrfeq06BvZgvK66+gSvXfP+RA58Pyt6zW+9+gl9xE1svbQG
         EcPE/I88ZowNd1BlPB61srdrkuymp1Rus/yGCzEghCEwvI8xiFtfN61D37KWXhEW+GWE
         Vbjw==
X-Forwarded-Encrypted: i=1; AJvYcCWxKnSbOfiSCUiQM4CwaL8wtK5r8yE0E34kq0L7DRYHRhCjGXuatVVfyn6vFn808HVUA7Zty06a3kk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvkTRj/yK5WP7IFLCPjzvK2lPNjt4jXREVM4ksrsvuoTCsqeAK
	j0z82jKxMjV4gYzLlSH46CVwRtRyUwRxiZSENClmqbecespsYkc30o3cSXDFBZKHJGQKp00OZsW
	PXLH6sO6obpGrS3rrhd3yZZ+7zdM1tkPLleyXdKyIzxSpqpcLky8RbdLnHd1mTf8BmaSr
X-Gm-Gg: ASbGncvLohlceULEWPnMLE42C8tqOlWLGmGbsrWPDRq0Ube9nq2cMEIDpkVth+fiCxZ
	DZBrQwR4V9m7YrIr0mLmb1dgIr9PmsDhHO5j3IgbjkKF/2eK5z7lDs/gDSlE4r0qFCiNrKIe/bR
	lry/98Ngic+i8i49tjKv7F8WOz7LWWaxiqRIbiXsEKLV9S7J6R/fjJw+TBkwTsxFeIqSBS0lQ/A
	z66sOl76KZli1Nzvak/gmiyKchk2+1WU2DaUfz1fl9bz3hyLnSIXRqiCVFyoY0RjFw8/xQV/Tw4
	Aidv+0RpP+07tXiw4qvxlF0MV7eJTGe7TakLBVaiQ5isX5FDrn6tX7eLA1BhyRn7xvXDHc9LOwI
	R6/uXys/LK/M9kLhOuPhqq6s=
X-Received: by 2002:a5d:6f14:0:b0:3a4:f661:c3e0 with SMTP id ffacd0b85a97d-3b60e510baamr4180661f8f.45.1752753154927;
        Thu, 17 Jul 2025 04:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAqQmPlaR0MqxERo3NRLrhaU4oEs8iGAGrgiheQNLTojFB3jUgPbGxNACr3plB8i5Bf9h92A==
X-Received: by 2002:a5d:6f14:0:b0:3a4:f661:c3e0 with SMTP id ffacd0b85a97d-3b60e510baamr4180643f8f.45.1752753154425;
        Thu, 17 Jul 2025 04:52:34 -0700 (PDT)
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
Subject: [PATCH v2 8/9] mm: introduce and use vm_normal_page_pud()
Date: Thu, 17 Jul 2025 13:52:11 +0200
Message-ID: <20250717115212.1825089-9-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717115212.1825089-1-david@redhat.com>
References: <20250717115212.1825089-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JFYQsCLAyl6QTWoH4jtxaa9qGADyM3fSOZxtqtjAFOY_1752753155
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Let's introduce vm_normal_page_pud(), which ends up being fairly simple
because of our new common helpers and there not being a PUD-sized zero
folio.

Use vm_normal_page_pud() in folio_walk_start() to resolve a TODO,
structuring the code like the other (pmd/pte) cases. Defer
introducing vm_normal_folio_pud() until really used.

Reviewed-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h |  2 ++
 mm/memory.c        | 27 +++++++++++++++++++++++++++
 mm/pagewalk.c      | 20 ++++++++++----------
 3 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index abc47f1f307fb..0eb991262fbbf 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2349,6 +2349,8 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 				  unsigned long addr, pmd_t pmd);
 struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 				pmd_t pmd);
+struct page *vm_normal_page_pud(struct vm_area_struct *vma, unsigned long addr,
+		pud_t pud);
 
 void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
 		  unsigned long size);
diff --git a/mm/memory.c b/mm/memory.c
index c43ae5e4d7644..00a0d7ae3ba4a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -796,6 +796,33 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
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


