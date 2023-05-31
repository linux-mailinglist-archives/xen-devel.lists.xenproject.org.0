Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118F8718BF7
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542012.845414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPc-00089n-Ds; Wed, 31 May 2023 21:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542012.845414; Wed, 31 May 2023 21:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TPc-00086H-9k; Wed, 31 May 2023 21:31:20 +0000
Received: by outflank-mailman (input) for mailman id 542012;
 Wed, 31 May 2023 21:31:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TPb-0006zB-C5
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:31:19 +0000
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a65048a-fffa-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 23:31:17 +0200 (CEST)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-565e6beb7aaso734007b3.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:31:17 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:31:17 -0700 (PDT)
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
X-Inumbo-ID: 7a65048a-fffa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568677; x=1688160677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2bE9CDG9Oxw3pEA2fSuUshC33VMwoQ2Xz6qScjQL3E=;
        b=iYqqA4KZmoroGYhynV/jiNkWzAMHN4TlFNnsupyXM0HztFgnmGpbYhflGvCI4PnTEH
         qsb+x4h+Ra/DHJZpmJ+cDpCt0WFO8DN9RsHpGbhgd8UZD1C59aXCIdDYpdL/DDlqjtME
         QAC1ynKbnXEL2BUoeiDKJEOTEmjHPJwx20Oocm0d9VYWRam4vpslVsanNLIqZtenI7il
         z8Y4AX5Qo3hIFiKRtt14OfPeMVmgXXgQiLO70vbxlL1MgUQYvu/5R1IEb6sabFTUiQkk
         WKmmoKw4Cu+qJUco9/5c4L88Blpl8Ohrj5Udd50ZlUMrgKFkg8PwQhuutxVbJdY53ahQ
         RhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568677; x=1688160677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2bE9CDG9Oxw3pEA2fSuUshC33VMwoQ2Xz6qScjQL3E=;
        b=kH3K8ygNTZQ+KVREVrArW3x8eVmSYpgBmu+pSzc6stbiryLJuvlabnxCJ+knhW/rJR
         DfIff7uziJTIGmYdJvXHG+uKU26VE0X2f/dYc22O+Ko3WdTWaaVoeO8fCdpOrJ/83QNP
         HrZmnJMcuh3tjpWo0hy683TQxxv9EjhZ/c/Uw2T8VBehNw0b7tESKXJwf+ZKS3DFLRja
         dY6Ci8IEAwFahLXMjs7Ip0hco7TFz9GsuH3GeVVJPc5mntUjXu8MfZfx8sLh6sgNOZf9
         fc6ItnCQwDyVWf+W0zer8yDD4Z7PFCyF9ivSRKZa7YxeLt/lQ40zhgLyyaV05wJVvns2
         xYGw==
X-Gm-Message-State: AC+VfDyxvml26+BSAovMc4/Pbcpq8gkCcYVr3u29bG4wqeNJcjwUlfGj
	t98LTeYlzv10ivx5d2JCXmk=
X-Google-Smtp-Source: ACHHUZ6pTbgk5oakG8rCTNTHmfkc+dDnZpqxrm9LdrARtP0jWcbiwYUD1VVJhesMtUI+Yz5eprOqiQ==
X-Received: by 2002:a0d:d816:0:b0:565:bb04:53fa with SMTP id a22-20020a0dd816000000b00565bb0453famr7385514ywe.10.1685568677391;
        Wed, 31 May 2023 14:31:17 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH v3 04/34] pgtable: Create struct ptdesc
Date: Wed, 31 May 2023 14:30:02 -0700
Message-Id: <20230531213032.25338-5-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, page table information is stored within struct page. As part
of simplifying struct page, create struct ptdesc for page table
information.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/pgtable.h | 52 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index c5a51481bbb9..c997e9878969 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -975,6 +975,58 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
 #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
 #endif /* CONFIG_MMU */
 
+
+/**
+ * struct ptdesc - Memory descriptor for page tables.
+ * @__page_flags: Same as page flags. Unused for page tables.
+ * @pt_list: List of used page tables. Used for s390 and x86.
+ * @_pt_pad_1: Padding that aliases with page's compound head.
+ * @pmd_huge_pte: Protected by ptdesc->ptl, used for THPs.
+ * @_pt_s390_gaddr: Aliases with page's mapping. Used for s390 gmap only.
+ * @pt_mm: Used for x86 pgds.
+ * @pt_frag_refcount: For fragmented page table tracking. Powerpc and s390 only.
+ * @ptl: Lock for the page table.
+ *
+ * This struct overlays struct page for now. Do not modify without a good
+ * understanding of the issues.
+ */
+struct ptdesc {
+	unsigned long __page_flags;
+
+	union {
+		struct list_head pt_list;
+		struct {
+			unsigned long _pt_pad_1;
+			pgtable_t pmd_huge_pte;
+		};
+	};
+	unsigned long _pt_s390_gaddr;
+
+	union {
+		struct mm_struct *pt_mm;
+		atomic_t pt_frag_refcount;
+		unsigned long index;
+	};
+
+#if ALLOC_SPLIT_PTLOCKS
+	spinlock_t *ptl;
+#else
+	spinlock_t ptl;
+#endif
+};
+
+#define TABLE_MATCH(pg, pt)						\
+	static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
+TABLE_MATCH(flags, __page_flags);
+TABLE_MATCH(compound_head, pt_list);
+TABLE_MATCH(compound_head, _pt_pad_1);
+TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
+TABLE_MATCH(mapping, _pt_s390_gaddr);
+TABLE_MATCH(pt_mm, pt_mm);
+TABLE_MATCH(ptl, ptl);
+#undef TABLE_MATCH
+static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
+
 /*
  * No-op macros that just return the current protection value. Defined here
  * because these macros can be used even if CONFIG_MMU is not defined.
-- 
2.40.1


