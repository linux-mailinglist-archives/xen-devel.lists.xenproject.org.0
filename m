Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC0F769DA5
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 19:04:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573243.897774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJ8-0000U1-EO; Mon, 31 Jul 2023 17:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573243.897774; Mon, 31 Jul 2023 17:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQWJ8-0000S6-BU; Mon, 31 Jul 2023 17:03:46 +0000
Received: by outflank-mailman (input) for mailman id 573243;
 Mon, 31 Jul 2023 17:03:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d7tO=DR=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qQWJ6-0000C0-M4
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 17:03:44 +0000
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [2607:f8b0:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33c9461c-2fc4-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 19:03:43 +0200 (CEST)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3a3df1ee4a3so2725200b6e.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 10:03:43 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 10:03:41 -0700 (PDT)
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
X-Inumbo-ID: 33c9461c-2fc4-11ee-b255-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823022; x=1691427822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z39OytypuZQhWkFCV+z6u8l5O5ZgTP/vsQXKA5JsO6g=;
        b=U7jETlvh8mqc3055+tBC6M+9Gy8R7REEMm1ZwKGc87m0rGDIJvgZcQ22vsmsinFtgt
         YTQlnuPzwi5zjdD+hLDWvxB/bmYZ8keXNmrVzrv6YRz6eCv0CI9nx19KksxH7KprzagR
         irj90f/wH/tTIxD8sQn1Ka9sOZ4dPOYQtK8h3N0b0riSaIJ2B+2YXCtlZtVEkrPg3Bbm
         Ojw5AwhfC3mD3DUjG5dFAv5YKIY2ngXsFAsSD6uydkdJ8uV+q2q9uUnnFZIrFIqfANGz
         oTPiE5dBvTDG/Pv3tzLP875t1DoqUqRhJ+2aPTfRbOK8xixubum5W0ZiIgU8cUKgztEJ
         6Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823022; x=1691427822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z39OytypuZQhWkFCV+z6u8l5O5ZgTP/vsQXKA5JsO6g=;
        b=M08wsSiA7S08haqwwjHugfPNS2TFfOfk5YHGsgLlrtpxM8y2kqj9v9DmUGnJtbQaqH
         tn+5c2Kk9BNyBXls9kBoZOGAcBJWyfOihpLONiXolzgM2n+2bvw7NdEPcji43cob3CDa
         3IHtCTaWwyps4wcbCoIf8fth1cyOphviU2qRi59z0PvpyDFDQv4U1JVffqOD1epchgIq
         3FVcCqDaSwHxrMLvN7aOY6cYcSJzamYH5V0v+kQWlJSO8tsT8wAZhGVsHrkKiDqTXiqM
         57kEyC003kZJQwweV5ddPY3ijdw0u7pIMPIgrN0Ho5+8g1sqGsKx9dVMVdV9qbB8vPxs
         gsvQ==
X-Gm-Message-State: ABy/qLauHg3qyVIDtbeb08/UsTEKkdisHB75U0hw7XuX6eB4mcyASUns
	RDZWhSK39Kk+k3G8ihFu/YA=
X-Google-Smtp-Source: APBJJlHO94ah80UzwDXxBX9kkXsVAL3mPuWGcSVwu/SHGxcgeWhtI+EazxMnc09xov2z5IkvLaxhhA==
X-Received: by 2002:a05:6808:13c1:b0:3a3:7612:28cd with SMTP id d1-20020a05680813c100b003a3761228cdmr11096736oiw.28.1690823021788;
        Mon, 31 Jul 2023 10:03:41 -0700 (PDT)
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
	Hugh Dickins <hughd@google.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v8 02/31] pgtable: Create struct ptdesc
Date: Mon, 31 Jul 2023 10:03:03 -0700
Message-Id: <20230731170332.69404-3-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, page table information is stored within struct page. As part
of simplifying struct page, create struct ptdesc for page table
information.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/pgtable.h | 71 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 5f36c055794b..1f92514d54b0 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -993,6 +993,77 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
 #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
 #endif /* CONFIG_MMU */
 
+
+/**
+ * struct ptdesc -    Memory descriptor for page tables.
+ * @__page_flags:     Same as page flags. Unused for page tables.
+ * @pt_rcu_head:      For freeing page table pages.
+ * @pt_list:          List of used page tables. Used for s390 and x86.
+ * @_pt_pad_1:        Padding that aliases with page's compound head.
+ * @pmd_huge_pte:     Protected by ptdesc->ptl, used for THPs.
+ * @__page_mapping:   Aliases with page->mapping. Unused for page tables.
+ * @pt_mm:            Used for x86 pgds.
+ * @pt_frag_refcount: For fragmented page table tracking. Powerpc and s390 only.
+ * @_pt_pad_2:        Padding to ensure proper alignment.
+ * @ptl:              Lock for the page table.
+ * @__page_type:      Same as page->page_type. Unused for page tables.
+ * @_refcount:        Same as page refcount. Used for s390 page tables.
+ * @pt_memcg_data:    Memcg data. Tracked for page tables here.
+ *
+ * This struct overlays struct page for now. Do not modify without a good
+ * understanding of the issues.
+ */
+struct ptdesc {
+	unsigned long __page_flags;
+
+	union {
+		struct rcu_head pt_rcu_head;
+		struct list_head pt_list;
+		struct {
+			unsigned long _pt_pad_1;
+			pgtable_t pmd_huge_pte;
+		};
+	};
+	unsigned long __page_mapping;
+
+	union {
+		struct mm_struct *pt_mm;
+		atomic_t pt_frag_refcount;
+	};
+
+	union {
+		unsigned long _pt_pad_2;
+#if ALLOC_SPLIT_PTLOCKS
+		spinlock_t *ptl;
+#else
+		spinlock_t ptl;
+#endif
+	};
+	unsigned int __page_type;
+	atomic_t _refcount;
+#ifdef CONFIG_MEMCG
+	unsigned long pt_memcg_data;
+#endif
+};
+
+#define TABLE_MATCH(pg, pt)						\
+	static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
+TABLE_MATCH(flags, __page_flags);
+TABLE_MATCH(compound_head, pt_list);
+TABLE_MATCH(compound_head, _pt_pad_1);
+TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
+TABLE_MATCH(mapping, __page_mapping);
+TABLE_MATCH(pt_mm, pt_mm);
+TABLE_MATCH(ptl, ptl);
+TABLE_MATCH(rcu_head, pt_rcu_head);
+TABLE_MATCH(page_type, __page_type);
+TABLE_MATCH(_refcount, _refcount);
+#ifdef CONFIG_MEMCG
+TABLE_MATCH(memcg_data, pt_memcg_data);
+#endif
+#undef TABLE_MATCH
+static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
+
 /*
  * No-op macros that just return the current protection value. Defined here
  * because these macros can be used even if CONFIG_MMU is not defined.
-- 
2.40.1


