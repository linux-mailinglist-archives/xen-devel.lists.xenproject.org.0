Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B8693D5A4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:08:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765461.1176070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMYQ-00016C-G8; Fri, 26 Jul 2024 15:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765461.1176070; Fri, 26 Jul 2024 15:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMYQ-000147-BS; Fri, 26 Jul 2024 15:08:22 +0000
Received: by outflank-mailman (input) for mailman id 765461;
 Fri, 26 Jul 2024 15:08:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aepa=O2=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1sXMYO-0000fu-II
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:08:20 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e36bff77-4b60-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 17:08:18 +0200 (CEST)
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-HOHS8bHhPF-HxdWbNQ7urA-1; Fri,
 26 Jul 2024 11:08:13 -0400
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1CD891955BF7; Fri, 26 Jul 2024 15:08:10 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.193.153])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BB2841955D48; Fri, 26 Jul 2024 15:08:00 +0000 (UTC)
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
X-Inumbo-ID: e36bff77-4b60-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722006497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h2hZ5iaP0GGncGDVruB29gu4r9/BL7FMsu+FThy8pbQ=;
	b=bs1/SY/1hSc8+N37SFiXxWJA7U7izclRcs2snzd9c3tRNJnydN//CAvvU9t57pGjilrJzI
	idKSdIcZPHeIJMd9RomL64ojpKbBNWxj1g9hQSU582Wmb8PwrIKL5aftO0zDjpWmc/p96Q
	vrfukLBA0Nqb2cFQm5ZN1lXiluQ6hx4=
X-MC-Unique: HOHS8bHhPF-HxdWbNQ7urA-1
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
Subject: [PATCH v1 3/3] powerpc/8xx: document and enforce that split PT locks are not used
Date: Fri, 26 Jul 2024 17:07:28 +0200
Message-ID: <20240726150728.3159964-4-david@redhat.com>
In-Reply-To: <20240726150728.3159964-1-david@redhat.com>
References: <20240726150728.3159964-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Right now, we cannot have split PT locks because 8xx does not support
SMP.

But for the sake of documentation *why* 8xx is fine regarding what
we documented in huge_pte_lockptr(), let's just add code to enforce it
at the same time as documenting it.

This should also make everybody who wants to copy from the 8xx approach of
supporting such unusual ways of mapping hugetlb folios aware that it gets
tricky once multiple page tables are involved.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/mm/pgtable.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index ab0656115424f..7316396e452d8 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -297,6 +297,12 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 }
 
 #if defined(CONFIG_PPC_8xx)
+
+#if defined(CONFIG_SPLIT_PTE_PTLOCKS) || defined(CONFIG_SPLIT_PMD_PTLOCKS)
+/* We need the same lock to protect the PMD table and the two PTE tables. */
+#error "8M hugetlb folios are incompatible with split page table locks"
+#endif
+
 static void __set_huge_pte_at(pmd_t *pmd, pte_t *ptep, pte_basic_t val)
 {
 	pte_basic_t *entry = (pte_basic_t *)ptep;
-- 
2.45.2


