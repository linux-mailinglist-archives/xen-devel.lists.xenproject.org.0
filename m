Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0CD93D5A2
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:08:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765458.1176059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMYK-0000lr-6p; Fri, 26 Jul 2024 15:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765458.1176059; Fri, 26 Jul 2024 15:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMYK-0000j9-3N; Fri, 26 Jul 2024 15:08:16 +0000
Received: by outflank-mailman (input) for mailman id 765458;
 Fri, 26 Jul 2024 15:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aepa=O2=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1sXMYI-0000fu-9k
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:08:14 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df4411a3-4b60-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 17:08:11 +0200 (CEST)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-481-CIqENtZwNcGlPB5wTz9pqg-1; Fri,
 26 Jul 2024 11:08:04 -0400
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 336DD1955D50; Fri, 26 Jul 2024 15:08:00 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.193.153])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D50641955D45; Fri, 26 Jul 2024 15:07:50 +0000 (UTC)
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
X-Inumbo-ID: df4411a3-4b60-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722006490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gclXSPT2RuzrPlofvNqS2CiD4N2Pif5SxTyxuMydzCs=;
	b=ekoM1XeEGewFpWmvKd8XUGfCK0Fm3t2kXd2sCJxEgiWf9EwoZbDjb0vAdkqMzbTaPy8eGP
	a3YwMljDWYrajc8Yum1Uotsj6odyaJXmMFbXpzC0yA2c6A1/XS5BVflhrCNzIiEXC4eXYf
	yxw5jwGCNZRlYzBs4rv8GQMTv/C5tZA=
X-MC-Unique: CIqENtZwNcGlPB5wTz9pqg-1
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH v1 2/3] mm/hugetlb: enforce that PMD PT sharing has split PMD PT locks
Date: Fri, 26 Jul 2024 17:07:27 +0200
Message-ID: <20240726150728.3159964-3-david@redhat.com>
In-Reply-To: <20240726150728.3159964-1-david@redhat.com>
References: <20240726150728.3159964-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Sharing page tables between processes but falling back to per-MM page
table locks cannot possibly work.

So, let's make sure that we do have split PMD locks by adding a new
Kconfig option and letting that depend on CONFIG_SPLIT_PMD_PTLOCKS.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fs/Kconfig              | 4 ++++
 include/linux/hugetlb.h | 5 ++---
 mm/hugetlb.c            | 8 ++++----
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/fs/Kconfig b/fs/Kconfig
index a46b0cbc4d8f6..0e4efec1d92e6 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -288,6 +288,10 @@ config HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 	depends on ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	depends on SPARSEMEM_VMEMMAP
 
+config HUGETLB_PMD_PAGE_TABLE_SHARING
+	def_bool HUGETLB_PAGE
+	depends on ARCH_WANT_HUGE_PMD_SHARE && SPLIT_PMD_PTLOCKS
+
 config ARCH_HAS_GIGANTIC_PAGE
 	bool
 
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index da800e56fe590..4d2f3224ff027 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -1243,7 +1243,7 @@ static inline __init void hugetlb_cma_reserve(int order)
 }
 #endif
 
-#ifdef CONFIG_ARCH_WANT_HUGE_PMD_SHARE
+#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
 static inline bool hugetlb_pmd_shared(pte_t *pte)
 {
 	return page_count(virt_to_page(pte)) > 1;
@@ -1279,8 +1279,7 @@ bool __vma_private_lock(struct vm_area_struct *vma);
 static inline pte_t *
 hugetlb_walk(struct vm_area_struct *vma, unsigned long addr, unsigned long sz)
 {
-#if defined(CONFIG_HUGETLB_PAGE) && \
-	defined(CONFIG_ARCH_WANT_HUGE_PMD_SHARE) && defined(CONFIG_LOCKDEP)
+#if defined(CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING) && defined(CONFIG_LOCKDEP)
 	struct hugetlb_vma_lock *vma_lock = vma->vm_private_data;
 
 	/*
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 0858a18272073..c4d94e122c41f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -7211,7 +7211,7 @@ long hugetlb_unreserve_pages(struct inode *inode, long start, long end,
 	return 0;
 }
 
-#ifdef CONFIG_ARCH_WANT_HUGE_PMD_SHARE
+#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
 static unsigned long page_table_shareable(struct vm_area_struct *svma,
 				struct vm_area_struct *vma,
 				unsigned long addr, pgoff_t idx)
@@ -7373,7 +7373,7 @@ int huge_pmd_unshare(struct mm_struct *mm, struct vm_area_struct *vma,
 	return 1;
 }
 
-#else /* !CONFIG_ARCH_WANT_HUGE_PMD_SHARE */
+#else /* !CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING */
 
 pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
 		      unsigned long addr, pud_t *pud)
@@ -7396,7 +7396,7 @@ bool want_pmd_share(struct vm_area_struct *vma, unsigned long addr)
 {
 	return false;
 }
-#endif /* CONFIG_ARCH_WANT_HUGE_PMD_SHARE */
+#endif /* CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING */
 
 #ifdef CONFIG_ARCH_WANT_GENERAL_HUGETLB
 pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
@@ -7494,7 +7494,7 @@ unsigned long hugetlb_mask_last_page(struct hstate *h)
 /* See description above.  Architectures can provide their own version. */
 __weak unsigned long hugetlb_mask_last_page(struct hstate *h)
 {
-#ifdef CONFIG_ARCH_WANT_HUGE_PMD_SHARE
+#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
 	if (huge_page_size(h) == PMD_SIZE)
 		return PUD_SIZE - PMD_SIZE;
 #endif
-- 
2.45.2


