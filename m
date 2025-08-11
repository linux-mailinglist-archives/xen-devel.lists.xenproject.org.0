Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8CAB207A9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:27:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077402.1438536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQgH-0000s1-Bt; Mon, 11 Aug 2025 11:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077402.1438536; Mon, 11 Aug 2025 11:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQgH-0000pb-69; Mon, 11 Aug 2025 11:27:09 +0000
Received: by outflank-mailman (input) for mailman id 1077402;
 Mon, 11 Aug 2025 11:27:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gc+J=2X=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ulQgG-000725-AI
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:27:08 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c05911f-76a6-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 13:27:06 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-WVUObBroM6WGvBAFp4ZeRQ-1; Mon, 11 Aug 2025 07:27:04 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-451d3f03b74so24370385e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:27:03 -0700 (PDT)
Received: from localhost
 (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de.
 [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459e5862be7sm264659195e9.15.2025.08.11.04.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:27:01 -0700 (PDT)
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
X-Inumbo-ID: 1c05911f-76a6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dH19/uKoiHEMTv0r8rJb8O7lP73Me8TJFFXM58SZ7zM=;
	b=BYnqfPTN51kj9BxlD5BWsa/T+EPe2W8VlztA4ZGzQrIC1t0265HzoVMdcbWNMHKmQGuTLO
	cZUMDYwLQvveti3peNZnAQSpeDxDkdZGvmXQWT02YmkPkQf/DjztInidBdqfkdpwPVZiPv
	NxNvf6ZirjRFaUdEWfQyg9jNVnBGx6Q=
X-MC-Unique: WVUObBroM6WGvBAFp4ZeRQ-1
X-Mimecast-MFC-AGG-ID: WVUObBroM6WGvBAFp4ZeRQ_1754911623
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911623; x=1755516423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dH19/uKoiHEMTv0r8rJb8O7lP73Me8TJFFXM58SZ7zM=;
        b=btUPBuxqZlXuj1Fd0GgTnOwoa4EzXLi2HtuqX/MrHeV+dzpk6NDt8qp+2wfeLo+GOL
         SKyRN9nNfcc+sKiM9HG/XJlu/qGmStvKQVIZckCLWvXZa5Lb/unAdFoCN3grELdiJQoL
         eVSVjVUCLWTQwdWT7eRQaDkz9XpGW9OGcW/1pyvLK2rnxO5NvW1J5IYtidRDUJuheqiG
         jUjTvoojejitOiN2Wq2QktyS6YHyLqwrA/RIUcnlODt2VtjqDvo9xvYyh8QVHmL5nQtd
         0USpRLx84pJCe8y7hBA4TkcSevtMHPfVMBldYIfCE/RJiDb14ilDNJ8sUwUivociB6mo
         S6qg==
X-Forwarded-Encrypted: i=1; AJvYcCVWtB+P2xR2DD2oskFMziPrexAGTUk6VxQFB4LXubqmmpXsU4nssOtvJeOYTNv4cqHnBa92+8ioThs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPLepL3jtRLf3mFUMWhyr5rZak26mAlxxc2PteKKAZsfmcZdPU
	OyKWqYn+4QPsD3E+fTpiTmPpG3r8V8Dm6xJp1wf/f6Hlee0tAnPYDRBz52n28ii204U+o1AHKEi
	RaJNHnDbuPKOhrQeQ4zn6xVD/1ryr1PICicz7boQZgHNbhWwzEV8ZC0qsxW10uFsfN+p5
X-Gm-Gg: ASbGnctBmvuXngLy2Fu1+1/cBoMWfvWTieJA3/RlS7oEhckC2VTnlD+T2+RWoOpt2fW
	uTQiCPCrdRBqX8ZeSx6WrJK2tWTjJvMZDgjbakJG9o1uH+TnCXRUJKj+So0ptA7EeojSXCdPB/7
	h4oyCBCXImJ7DVpgFpO3KIqhdoSFpcfDBhpZD3uj6ul5LVI+jCz2JYAY9q4joEwgWWXLLJIHiht
	bfVAw93PA5vVa9peazpSr3VvZOdMElLqw9vikQnlcNo7zvFICnDmZAmQgNmRUc8SMKEXpl0zL1G
	8psu4MM2lwaeYO5ORaihHSwUZQ3vJ5kfY3dirTPKhCrPexzqt5zTaJ/JUhFFTqd3CZqDk1GhbIX
	F4gvJkrrzfrXcI1cmlAHPujpk
X-Received: by 2002:a5d:5d0a:0:b0:3a5:2653:7308 with SMTP id ffacd0b85a97d-3b900b5742bmr9602283f8f.57.1754911622728;
        Mon, 11 Aug 2025 04:27:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGXEgHnsOD9ZoHC3rozcCl2T1/SKhNFUvb83wEfWy/U4w8SmZE0De8ROcIUkzkJT6XleOZhA==
X-Received: by 2002:a5d:5d0a:0:b0:3a5:2653:7308 with SMTP id ffacd0b85a97d-3b900b5742bmr9602254f8f.57.1754911622182;
        Mon, 11 Aug 2025 04:27:02 -0700 (PDT)
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
	David Vrabel <david.vrabel@citrix.com>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH v3 11/11] mm: rename vm_ops->find_special_page() to vm_ops->find_normal_page()
Date: Mon, 11 Aug 2025 13:26:31 +0200
Message-ID: <20250811112631.759341-12-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811112631.759341-1-david@redhat.com>
References: <20250811112631.759341-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 366KhDGigQpE7Fn0odaRIeW7EKBxbwAR70ugJmENHGQ_1754911623
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

... and hide it behind a kconfig option. There is really no need for
any !xen code to perform this check.

The naming is a bit off: we want to find the "normal" page when a PTE
was marked "special". So it's really not "finding a special" page.

Improve the documentation, and add a comment in the code where XEN ends
up performing the pte_mkspecial() through a hypercall. More details can
be found in commit 923b2919e2c3 ("xen/gntdev: mark userspace PTEs as
special on x86 PV guests").

Cc: David Vrabel <david.vrabel@citrix.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/xen/Kconfig              |  1 +
 drivers/xen/gntdev.c             |  5 +++--
 include/linux/mm.h               | 18 +++++++++++++-----
 mm/Kconfig                       |  2 ++
 mm/memory.c                      | 12 ++++++++++--
 tools/testing/vma/vma_internal.h | 18 +++++++++++++-----
 6 files changed, 42 insertions(+), 14 deletions(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 24f485827e039..f9a35ed266ecf 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -138,6 +138,7 @@ config XEN_GNTDEV
 	depends on XEN
 	default m
 	select MMU_NOTIFIER
+	select FIND_NORMAL_PAGE
 	help
 	  Allows userspace processes to use grants.
 
diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 1f21607656182..26f13b37c78e6 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -321,6 +321,7 @@ static int find_grant_ptes(pte_t *pte, unsigned long addr, void *data)
 	BUG_ON(pgnr >= map->count);
 	pte_maddr = arbitrary_virt_to_machine(pte).maddr;
 
+	/* Note: this will perform a pte_mkspecial() through the hypercall. */
 	gnttab_set_map_op(&map->map_ops[pgnr], pte_maddr, flags,
 			  map->grants[pgnr].ref,
 			  map->grants[pgnr].domid);
@@ -528,7 +529,7 @@ static void gntdev_vma_close(struct vm_area_struct *vma)
 	gntdev_put_map(priv, map);
 }
 
-static struct page *gntdev_vma_find_special_page(struct vm_area_struct *vma,
+static struct page *gntdev_vma_find_normal_page(struct vm_area_struct *vma,
 						 unsigned long addr)
 {
 	struct gntdev_grant_map *map = vma->vm_private_data;
@@ -539,7 +540,7 @@ static struct page *gntdev_vma_find_special_page(struct vm_area_struct *vma,
 static const struct vm_operations_struct gntdev_vmops = {
 	.open = gntdev_vma_open,
 	.close = gntdev_vma_close,
-	.find_special_page = gntdev_vma_find_special_page,
+	.find_normal_page = gntdev_vma_find_normal_page,
 };
 
 /* ------------------------------------------------------------------ */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8ca7d2fa71343..3868ca1a25f9c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -657,13 +657,21 @@ struct vm_operations_struct {
 	struct mempolicy *(*get_policy)(struct vm_area_struct *vma,
 					unsigned long addr, pgoff_t *ilx);
 #endif
+#ifdef CONFIG_FIND_NORMAL_PAGE
 	/*
-	 * Called by vm_normal_page() for special PTEs to find the
-	 * page for @addr.  This is useful if the default behavior
-	 * (using pte_page()) would not find the correct page.
+	 * Called by vm_normal_page() for special PTEs in @vma at @addr. This
+	 * allows for returning a "normal" page from vm_normal_page() even
+	 * though the PTE indicates that the "struct page" either does not exist
+	 * or should not be touched: "special".
+	 *
+	 * Do not add new users: this really only works when a "normal" page
+	 * was mapped, but then the PTE got changed to something weird (+
+	 * marked special) that would not make pte_pfn() identify the originally
+	 * inserted page.
 	 */
-	struct page *(*find_special_page)(struct vm_area_struct *vma,
-					  unsigned long addr);
+	struct page *(*find_normal_page)(struct vm_area_struct *vma,
+					 unsigned long addr);
+#endif /* CONFIG_FIND_NORMAL_PAGE */
 };
 
 #ifdef CONFIG_NUMA_BALANCING
diff --git a/mm/Kconfig b/mm/Kconfig
index e443fe8cd6cf2..59a04d0b2e272 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1381,6 +1381,8 @@ config PT_RECLAIM
 
 	  Note: now only empty user PTE page table pages will be reclaimed.
 
+config FIND_NORMAL_PAGE
+	def_bool n
 
 source "mm/damon/Kconfig"
 
diff --git a/mm/memory.c b/mm/memory.c
index 6f806bf3cc994..002c28795d8b7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -639,6 +639,12 @@ static void print_bad_page_map(struct vm_area_struct *vma,
  * trivial. Secondly, an architecture may not have a spare page table
  * entry bit, which requires a more complicated scheme, described below.
  *
+ * With CONFIG_FIND_NORMAL_PAGE, we might have the "special" bit set on
+ * page table entries that actually map "normal" pages: however, that page
+ * cannot be looked up through the PFN stored in the page table entry, but
+ * instead will be looked up through vm_ops->find_normal_page(). So far, this
+ * only applies to PTEs.
+ *
  * A raw VM_PFNMAP mapping (ie. one that is not COWed) is always considered a
  * special mapping (even if there are underlying and valid "struct pages").
  * COWed pages of a VM_PFNMAP are always normal.
@@ -679,8 +685,10 @@ static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
 {
 	if (IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL)) {
 		if (unlikely(special)) {
-			if (vma->vm_ops && vma->vm_ops->find_special_page)
-				return vma->vm_ops->find_special_page(vma, addr);
+#ifdef CONFIG_FIND_NORMAL_PAGE
+			if (vma->vm_ops && vma->vm_ops->find_normal_page)
+				return vma->vm_ops->find_normal_page(vma, addr);
+#endif /* CONFIG_FIND_NORMAL_PAGE */
 			if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
 				return NULL;
 			if (is_zero_pfn(pfn) || is_huge_zero_pfn(pfn))
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index 3639aa8dd2b06..cb1c2a8afe265 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -467,13 +467,21 @@ struct vm_operations_struct {
 	struct mempolicy *(*get_policy)(struct vm_area_struct *vma,
 					unsigned long addr, pgoff_t *ilx);
 #endif
+#ifdef CONFIG_FIND_NORMAL_PAGE
 	/*
-	 * Called by vm_normal_page() for special PTEs to find the
-	 * page for @addr.  This is useful if the default behavior
-	 * (using pte_page()) would not find the correct page.
+	 * Called by vm_normal_page() for special PTEs in @vma at @addr. This
+	 * allows for returning a "normal" page from vm_normal_page() even
+	 * though the PTE indicates that the "struct page" either does not exist
+	 * or should not be touched: "special".
+	 *
+	 * Do not add new users: this really only works when a "normal" page
+	 * was mapped, but then the PTE got changed to something weird (+
+	 * marked special) that would not make pte_pfn() identify the originally
+	 * inserted page.
 	 */
-	struct page *(*find_special_page)(struct vm_area_struct *vma,
-					  unsigned long addr);
+	struct page *(*find_normal_page)(struct vm_area_struct *vma,
+					 unsigned long addr);
+#endif /* CONFIG_FIND_NORMAL_PAGE */
 };
 
 struct vm_unmapped_area_info {
-- 
2.50.1


