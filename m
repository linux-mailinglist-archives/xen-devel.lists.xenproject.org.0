Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136F1B05BDD
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044079.1414200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdv-0006qU-5d; Tue, 15 Jul 2025 13:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044079.1414200; Tue, 15 Jul 2025 13:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdv-0006mI-0E; Tue, 15 Jul 2025 13:24:23 +0000
Received: by outflank-mailman (input) for mailman id 1044079;
 Tue, 15 Jul 2025 13:24:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVo=Z4=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ubfds-0004Ab-Mo
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:24:20 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 033d3d7d-617f-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 15:24:20 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-EqncoupRON-gGx7HOZaKkw-1; Tue, 15 Jul 2025 09:24:15 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4538a2f4212so31549035e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 06:24:15 -0700 (PDT)
Received: from localhost
 (p200300d82f2849002c244e201f219fbd.dip0.t-ipconnect.de.
 [2003:d8:2f28:4900:2c24:4e20:1f21:9fbd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4560c50b7b4sm100033485e9.25.2025.07.15.06.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 06:24:13 -0700 (PDT)
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
X-Inumbo-ID: 033d3d7d-617f-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752585859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQduvI7D6V1Y1gj1ZwNsH+sSV4mM47HI53S/a03rEFE=;
	b=chp7g+FePqpUSB5LSZ2hqT7UowdFtaLHuGtIWXdcD0ANVHEO2B1HAkD0In+nKcujhNPT46
	sUMJw3neq0R03Q5Lvp3PqjWAqxoJ+NmXMNxJRKgBa8Kli3IqIA7F9k/MsdAbNP572nAcg+
	tZt3Gf3jCemPmqydhcAtMJ3H3NfhDzs=
X-MC-Unique: EqncoupRON-gGx7HOZaKkw-1
X-Mimecast-MFC-AGG-ID: EqncoupRON-gGx7HOZaKkw_1752585854
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585854; x=1753190654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQduvI7D6V1Y1gj1ZwNsH+sSV4mM47HI53S/a03rEFE=;
        b=W5KoOFtk/QftSkDpZytPrcGsnRDGqBeFfJdS79gWJrXck7o4WjJjgY4NSx8FyHG74U
         26Vq7zg0q+yn3D3JgHJI6W4cSr5Eun0ICrspey9V+Vu/FFW9zX3eDLo+55DXTjDvHTee
         M3dRg2C1863l7qYFvt2R2JjdHmIKeK17WVBWNlEfCPkTgaNXWjppCASt3Wg+CfJpk7DZ
         A8dw+C9LeDgC+bRjLS2q6+MOk11k8bX+d1thlj4U6jI4V0S4qDxIAEJpHv8vEfVnSio2
         BfVdFkPSgxV7rC1Nk2YXmmkdRN7OfHRoGmwedYpgsI4/1dF2E4yHe2g76/pOfQvA2pop
         Hleg==
X-Forwarded-Encrypted: i=1; AJvYcCX0PcBEOKf486zRmPRkRZmCap4jr4wUKJiPSzOYA3DnoJYXzr0ct11PWX2vZYjyvJlyYl5Ebb/+knQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYPAho4cIEXhRQVhklM2zEMXva3zT6ECaKtIfwdJckwynTEYt3
	TAskOsqVFYBEjF545wKzkj/fCtzzfc728tpK0uZkmmuJojyhemKMR2Kbmt5fVtFYXfnM9R+Ikto
	LfyFwnkUlKNGilbww5hGk9tNyjKYic30ev48owBjpYRdoNgoi1WI9zDmAvsJhcFZuKUCZ
X-Gm-Gg: ASbGncttobr89M5jHvWa2rDXB6iKUihQuUVS3dqxAuvAF3jOSpVb4zdxlt7iSybQsFM
	ug7VYIXqugtKv76vtL12CNYQuLdizQUVph5/lvjsPJ9IlQU2Jjkf+hWbTxZ0Kdf3gOH2Jd3KKMJ
	NDKS0SyZR+cRI4MGFIZX2MxyFk8ffw7OL23TE94T95yi5f8y178JFQyt3Fkpx3g76BVBPwySNlX
	sU36ffDe0+9bBH+Av/lWOapHBzYuNR0hl+klsICh6YgJkRNE8BvH3cbcfIXvlbq5eQc4clLwPJc
	uKoUOGQFd2SpNfoL90+SKEa1ejRHxQPw8zcXPzal76wR+OmYmbNQPH7k/iPPWyQcEIHkhvRus2A
	V+2wej5uTkRpWLkV1iekXL+rd
X-Received: by 2002:a05:600c:4ed0:b0:456:1a41:f932 with SMTP id 5b1f17b1804b1-4561a41fd79mr64379175e9.22.1752585854243;
        Tue, 15 Jul 2025 06:24:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3r8lG85ntU3nBUSpLXqHodEZFoetPf2QpvNAGJr6E2EBer+0dRaC665FuVYarZxx4ibL6Dg==
X-Received: by 2002:a05:600c:4ed0:b0:456:1a41:f932 with SMTP id 5b1f17b1804b1-4561a41fd79mr64378845e9.22.1752585853644;
        Tue, 15 Jul 2025 06:24:13 -0700 (PDT)
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
Subject: [PATCH v1 9/9] mm: rename vm_ops->find_special_page() to vm_ops->find_normal_page()
Date: Tue, 15 Jul 2025 15:23:50 +0200
Message-ID: <20250715132350.2448901-10-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715132350.2448901-1-david@redhat.com>
References: <20250715132350.2448901-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gxQAWhp_il71uRxvVYyRhH-GXiBzGmFNdRYTmKBySdU_1752585854
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
index 6877c894fe526..cc3322fce62f4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -646,13 +646,21 @@ struct vm_operations_struct {
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
index f1834a19a2f1e..d09f2ff4a866e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -619,6 +619,12 @@ static void print_bad_page_map(struct vm_area_struct *vma,
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
@@ -716,8 +722,10 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
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
index 991022e9e0d3b..9eecfb1dcc13f 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -465,13 +465,21 @@ struct vm_operations_struct {
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


