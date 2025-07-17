Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D0FB08C0B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 13:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046620.1417034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNAM-0003pb-Qi; Thu, 17 Jul 2025 11:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046620.1417034; Thu, 17 Jul 2025 11:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNAM-0003j6-LL; Thu, 17 Jul 2025 11:52:46 +0000
Received: by outflank-mailman (input) for mailman id 1046620;
 Thu, 17 Jul 2025 11:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiP3=Z6=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ucNAK-0001Ft-P7
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 11:52:44 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ba529f6-6304-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 13:52:43 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-AqDfPHwvMgaPFA3ksQyRBA-1; Thu, 17 Jul 2025 07:52:38 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-451d3f03b74so5321265e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 04:52:38 -0700 (PDT)
Received: from localhost
 (p200300d82f1f36000dc826ee9aa9fdc7.dip0.t-ipconnect.de.
 [2003:d8:2f1f:3600:dc8:26ee:9aa9:fdc7])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8dc22a8sm20945546f8f.34.2025.07.17.04.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 04:52:36 -0700 (PDT)
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
X-Inumbo-ID: 8ba529f6-6304-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752753162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EJnWBjNqAGa4cESjiW0EJbmUIJ/RdvXL+0h/9uaJzw=;
	b=Q8isTOVz0DV8l5g9EBIqwl0s+9IDeYs86AfRPT6L2/kJZ9d+9DtAaCx0ybrJHpDIR7rbcl
	p+mN3eZ3vDdWbHqNM0R6+q+FNiUbf329Xj3mnTumXSqqLyYOvXffEAItcHKCMfNlkxiSYu
	Ag1KHSm8YBf/ow1BisnnhVdOOr4vFbc=
X-MC-Unique: AqDfPHwvMgaPFA3ksQyRBA-1
X-Mimecast-MFC-AGG-ID: AqDfPHwvMgaPFA3ksQyRBA_1752753157
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753157; x=1753357957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EJnWBjNqAGa4cESjiW0EJbmUIJ/RdvXL+0h/9uaJzw=;
        b=dXPsTyA5Mz2tH8fGJZu7NInb2wGpZmqVRKGImzEVAMDUoKaPVDhN6Iz8LZg28hrWXO
         f0SsvV28l8k+vxcOBnwuFL7CxaVIr506x2+SwfODM9i4Q9ulYCslEVBxJYFtqL1yq3Gw
         0VE20dixWbVfSmemJTAiId7Gr4J4RlelSoCVPeNV9zTB0j0KX6ok27VR0z575mQd64cP
         3Fw2HADlMfDUB3APkgSVPVgJg1Mfl4mpmeHvZsvIIyYYeWrXah9bM0x2FTR3nNnLDXod
         WAj3HXvIgUxMkYGv2PTqZgVrsfdmh9uIp/dN3CWvBgl/MENAa4q7DJaBaBc/jlaWdE+H
         HZtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBTsyUfMRnXUw1K0xpyKlc9LwoLlQwIrioJf/zeqoCEQvwE+qzlsbpvBz9/n1nuATZ6yqY9oJeodg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoB0r2hdq9FXEarfKZ1bPSTxMgxVh9ePS54NIDShxvDzMVyr8/
	jtbPkv2M20j8sTpDL3umfJHZIMkSOc8U45hrBZBHOzRmOOB929Uyc6letTEihHDKD0dQy6UOeeS
	CilF+oDpnunwuF0yRsCWKDnOnYHl1ZkHCuQkEJMntPZWKtuQdTx9ywukTGULNEm7qdlIG
X-Gm-Gg: ASbGncv3hXYKZYc73IufjXaIzecxyl01WJVInI9s3Y5niIIR7XSpoaN8jwkkr9/MlT/
	Acvar6xEnI7TqIezucfBGnl1XdAXdRMNtOxbPrLQqKRuVE7NKnLDUUfMmTXq+cNG+8MnC75vdRq
	TEZdb5F8Odg0HzsKksagV/1APQF1T7r+Safzxnp6DcuEM1SsGVsb6fn0s0rN/e+0+eObuSx2q52
	8Xh8jrsqYwHGhocmXFDbcp8o+izfSbpwehnkb8vUJ6TtEM9XrauUdRIhVfuy1wSQ+qMY1de0GUW
	6ssY7rELwo+2TPwr73mQyyfG08ZmStWjoMEXJAv8YPhQdGsUJNgcUswtsUog7ACEQTVxR6zfKgl
	UJZIa87YCqly7qx1zW4E6IAY=
X-Received: by 2002:a05:600c:870e:b0:456:285b:db3c with SMTP id 5b1f17b1804b1-456352d2ab1mr20378195e9.3.1752753157372;
        Thu, 17 Jul 2025 04:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3Vszf6T0cq3aQuR+QDmUBqbteOugAuzaA8OTawN8Aj0cx9bUSNlZT+0u55FTlbIHJovWeIQ==
X-Received: by 2002:a05:600c:870e:b0:456:285b:db3c with SMTP id 5b1f17b1804b1-456352d2ab1mr20377615e9.3.1752753156790;
        Thu, 17 Jul 2025 04:52:36 -0700 (PDT)
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
	David Vrabel <david.vrabel@citrix.com>
Subject: [PATCH v2 9/9] mm: rename vm_ops->find_special_page() to vm_ops->find_normal_page()
Date: Thu, 17 Jul 2025 13:52:12 +0200
Message-ID: <20250717115212.1825089-10-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717115212.1825089-1-david@redhat.com>
References: <20250717115212.1825089-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PG35J5UEZMz_9lE4puyCoRKG43VVxzoOrvdO6VmAyTw_1752753157
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
index 61faea1f06630..d1bc0dae2cdf9 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -309,6 +309,7 @@ static int find_grant_ptes(pte_t *pte, unsigned long addr, void *data)
 	BUG_ON(pgnr >= map->count);
 	pte_maddr = arbitrary_virt_to_machine(pte).maddr;
 
+	/* Note: this will perform a pte_mkspecial() through the hypercall. */
 	gnttab_set_map_op(&map->map_ops[pgnr], pte_maddr, flags,
 			  map->grants[pgnr].ref,
 			  map->grants[pgnr].domid);
@@ -516,7 +517,7 @@ static void gntdev_vma_close(struct vm_area_struct *vma)
 	gntdev_put_map(priv, map);
 }
 
-static struct page *gntdev_vma_find_special_page(struct vm_area_struct *vma,
+static struct page *gntdev_vma_find_normal_page(struct vm_area_struct *vma,
 						 unsigned long addr)
 {
 	struct gntdev_grant_map *map = vma->vm_private_data;
@@ -527,7 +528,7 @@ static struct page *gntdev_vma_find_special_page(struct vm_area_struct *vma,
 static const struct vm_operations_struct gntdev_vmops = {
 	.open = gntdev_vma_open,
 	.close = gntdev_vma_close,
-	.find_special_page = gntdev_vma_find_special_page,
+	.find_normal_page = gntdev_vma_find_normal_page,
 };
 
 /* ------------------------------------------------------------------ */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0eb991262fbbf..036800514aa90 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -648,13 +648,21 @@ struct vm_operations_struct {
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
index 0287e8d94aea7..82c281b4f6937 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1397,6 +1397,8 @@ config PT_RECLAIM
 
 	  Note: now only empty user PTE page table pages will be reclaimed.
 
+config FIND_NORMAL_PAGE
+	def_bool n
 
 source "mm/damon/Kconfig"
 
diff --git a/mm/memory.c b/mm/memory.c
index 00a0d7ae3ba4a..52804ca343261 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -613,6 +613,12 @@ static void print_bad_page_map(struct vm_area_struct *vma,
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
@@ -710,8 +716,10 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
 	unsigned long pfn = pte_pfn(pte);
 
 	if (unlikely(pte_special(pte))) {
-		if (vma->vm_ops && vma->vm_ops->find_special_page)
-			return vma->vm_ops->find_special_page(vma, addr);
+#ifdef CONFIG_FIND_NORMAL_PAGE
+		if (vma->vm_ops && vma->vm_ops->find_normal_page)
+			return vma->vm_ops->find_normal_page(vma, addr);
+#endif /* CONFIG_FIND_NORMAL_PAGE */
 		if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
 			return NULL;
 		if (is_zero_pfn(pfn))
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index 0fe52fd6782bf..8646af15a5fc0 100644
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


