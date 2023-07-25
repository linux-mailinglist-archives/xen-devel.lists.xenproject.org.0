Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AD4760770
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:21:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569356.889815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Xw-0002bU-05; Tue, 25 Jul 2023 04:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569356.889815; Tue, 25 Jul 2023 04:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9Xv-0002YV-OG; Tue, 25 Jul 2023 04:21:15 +0000
Received: by outflank-mailman (input) for mailman id 569356;
 Tue, 25 Jul 2023 04:21:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9Xu-0002Iw-AT
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:21:14 +0000
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afa6f1d4-2aa2-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 06:21:12 +0200 (CEST)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-d129edb8261so1957794276.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:21:12 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:21:10 -0700 (PDT)
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
X-Inumbo-ID: afa6f1d4-2aa2-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258871; x=1690863671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z39OytypuZQhWkFCV+z6u8l5O5ZgTP/vsQXKA5JsO6g=;
        b=nfSBxZc3bItW8IdMBLL+dSGF/sScmKpt0AcwakiFztIyJApvwUouFBq2QYNw8J0rTh
         aGOyeE8+hHOVNRFF4WnJZ/JBfvYsJ6/Oqtf1pd4yYE50HlUq0kH3gRbnZoqyUUw5UiUt
         9BiNVm/Jcmu4oBRAf0Ghv+POnWAvJRL2FAU4oS0kRbRMToMj9LqJMWXwLu8fKfr8IAjj
         wOqfUiwKX3V5nYlU7QswO3bA3PxVILROT4IFFlX3tqCczMBU5TNT3JSvKElDhd9S0f0I
         IVPRDxFnKb0Q83Ir8UwSfLZr1e3Lc2Zl/QQj5qJvJK7JbaWdiWhNWfmCQ7brLh/spl2P
         pUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258871; x=1690863671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z39OytypuZQhWkFCV+z6u8l5O5ZgTP/vsQXKA5JsO6g=;
        b=UN8WEXNB8EB4nMx4YOVaTpo6NtqqCEXBenbQSzlsLpM2Rk4yo81UzLr7Xv1PDcIlaL
         Haz2faIYZ+RCAWveg+ZTrtSzQUL83XzxwDCjZlwGK4k6/6lWirQ6FyfmlV4QhJlXKTCy
         RKlCrMIOfAeKcchXp3Xj4h+ldixgovMJVNS93vk0Tm5ZWuYWApjW16NKplCsagZsrVtK
         ECHtLKU+Xb1ngmO6kjhi+JrmyM8k/P8IzJ4/vJTkboTx9GyVb3zEQzMAGGjnvPujppqM
         XNh5N9yE8GxdDZljGAIGB/oWNANCC3r8bOrHoWH8lns8EzGL9jrPGdIuGVG3iuIQM4Pj
         a+Pg==
X-Gm-Message-State: ABy/qLaTKwKEw3fXj55MD7ERYjhTC2G1Jvy+nTAXigzzXownaAzrRUNO
	6bl4G2BgJCx8fyAAa6hRtTw=
X-Google-Smtp-Source: APBJJlH3lH39robuGI5LChDr8WX6p02zic6DdoBpY//WhDEwtiPShXvAKethMDx9GI6ybtlOyIPsYw==
X-Received: by 2002:a25:b4c:0:b0:cb7:a41e:be58 with SMTP id 73-20020a250b4c000000b00cb7a41ebe58mr1296053ybl.23.1690258870978;
        Mon, 24 Jul 2023 21:21:10 -0700 (PDT)
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
Subject: [PATCH mm-unstable v7 02/31] pgtable: Create struct ptdesc
Date: Mon, 24 Jul 2023 21:20:22 -0700
Message-Id: <20230725042051.36691-3-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
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


