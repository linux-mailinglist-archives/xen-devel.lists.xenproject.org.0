Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751F173F197
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 05:16:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555685.867641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzAk-0004dR-On; Tue, 27 Jun 2023 03:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555685.867641; Tue, 27 Jun 2023 03:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDzAk-0004al-KF; Tue, 27 Jun 2023 03:15:18 +0000
Received: by outflank-mailman (input) for mailman id 555685;
 Tue, 27 Jun 2023 03:15:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1X7u=CP=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qDzAj-0003uL-3j
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 03:15:17 +0000
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [2607:f8b0:4864:20::112c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5aac543-1498-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 05:15:15 +0200 (CEST)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-57001c0baddso32901277b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jun 2023 20:15:15 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 20:15:13 -0700 (PDT)
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
X-Inumbo-ID: d5aac543-1498-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835714; x=1690427714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g10wkISUfh+NWh/zmhT9FX+m3ZttfvdTUqPKBonJP24=;
        b=YbS6It5/jG4gj9GV1WnqlWfE48J9CdnxNvOxOEYb2jkpFBwkcijgogv5/2FTyBYSJu
         izIlhC4BKNDwS5s1e4kK9kflroiGbN+V3CM6t7L2EFgtcSkg+ReKLemBNYF5Y3oVXg4d
         FUK6TJROlYVwfl34r2gL5piZl88lZtnh5mJi4W6rFRki4guA/8D+KKFrkkfHcSu1EJOJ
         fncA5E4mKOaGZV6UHnLSf+mughQQ2/sG6vdU9OT//BnRvDPbrV7dVSZuLKiGxg9g4JB4
         L4rqAG2yhTX1HWLW8k7KKi4wHWH5luhyXPrJQJ+E2hOyRozoqBZDlMJstEk3Y4X/0/Xj
         8nVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835714; x=1690427714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g10wkISUfh+NWh/zmhT9FX+m3ZttfvdTUqPKBonJP24=;
        b=Rt3kWxtJXqPX0bXfJ0UD6mQadmlVXkFEqWq9kvvpijqC0vOM/vCGtV7pvf1Pd55h/H
         Rr8mDYsYaBx9nRgjciPwfQqaeQDtW3Slrqu+4/wiQWzy7BK6Jg6/M2aJSij3PpHtXfM6
         W0qjzldUw6OQfnba5XUDVPiHu2Z97n/WBNccptY4tQp9klKLj9SfbA3vJO9dgxRXB907
         +Au48RtJsQV4fNQJWKfPb+06DGdEnTdkE2YhKfL44G6MrnxbTW/b4/tlx2T1mB+mqOwo
         qsTqgrJpRdjuu5j6ZOk7l8etcaniPm11S8/sbRbllyTLvtWFUoao1zWTCfQ5sFlEhqqA
         XTCg==
X-Gm-Message-State: AC+VfDz3IplNLCs71JIJh63cmWjRvNh4ndLH4Z+1MaORcqUuUlhbJ06p
	VKSRaZt/Tx4ZNK832QL2fsQ=
X-Google-Smtp-Source: ACHHUZ4trddfgXzjmNYnvfIX3UyOWVfVwt64/0k1X+1Ib62f54dPN/U9UUyskS0pcHiYwtqCWDYcTQ==
X-Received: by 2002:a81:4e44:0:b0:56f:ff55:2b74 with SMTP id c65-20020a814e44000000b0056fff552b74mr21585770ywb.37.1687835714203;
        Mon, 26 Jun 2023 20:15:14 -0700 (PDT)
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
Subject: [PATCH v6 03/33] pgtable: Create struct ptdesc
Date: Mon, 26 Jun 2023 20:14:01 -0700
Message-Id: <20230627031431.29653-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, page table information is stored within struct page. As part
of simplifying struct page, create struct ptdesc for page table
information.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/pgtable.h | 68 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 5063b482e34f..d46cb709ce08 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -987,6 +987,74 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
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
+ * @_pt_s390_gaddr:   Aliases with page's mapping. Used for s390 gmap only.
+ * @pt_mm:            Used for x86 pgds.
+ * @pt_frag_refcount: For fragmented page table tracking. Powerpc and s390 only.
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
+	unsigned long _pt_s390_gaddr;
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
+TABLE_MATCH(mapping, _pt_s390_gaddr);
+TABLE_MATCH(pt_mm, pt_mm);
+TABLE_MATCH(ptl, ptl);
+TABLE_MATCH(rcu_head, pt_rcu_head);
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


