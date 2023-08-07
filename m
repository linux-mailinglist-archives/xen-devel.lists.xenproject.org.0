Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E097773360
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578973.906737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9Hy-0001tm-RU; Mon, 07 Aug 2023 23:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578973.906737; Mon, 07 Aug 2023 23:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9Hy-0001rb-Lf; Mon, 07 Aug 2023 23:05:26 +0000
Received: by outflank-mailman (input) for mailman id 578973;
 Mon, 07 Aug 2023 23:05:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9Hx-0001NS-Be
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:05:25 +0000
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [2607:f8b0:4864:20::112c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e340c95a-3576-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 01:05:23 +0200 (CEST)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-586df08bba0so17842717b3.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:05:23 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:05:22 -0700 (PDT)
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
X-Inumbo-ID: e340c95a-3576-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449522; x=1692054322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a34f21esV50lWBersDNDqmppsx1/6ilmHOTavl/xl8o=;
        b=oFwky5a0u6RDMZneanUwrrMHlk718vp357up6yt/zwnqVYFChL1rvBLlof3lNCzIMa
         fNsEK2lTF1AVBptjZ1CNiCZUzihavKETKYN9gVvYQI6adZVOr5WVilhYnG1hRIdUadMS
         rZHYG0cY0MgC9spT/xtrGp0Z9RSAR89ub11+qTFSD/NHXR1SOhgGi5SO3dghfFZLOejg
         KputLo/y59tBrGZ+oHkk/Miwz+ltthb0+dR9j85/GLscklo1srlDZt2wotLowv37n6A5
         LO+9uJnrNQ6hj9u600MpE0S2h1+9c+75UpIga0Og5F4xShPF0bPK2EhAmwZTlcxr2oZQ
         4pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449522; x=1692054322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a34f21esV50lWBersDNDqmppsx1/6ilmHOTavl/xl8o=;
        b=BgrgicLDaP3T7IRJO5yQ3XGz1Eslst0TMqX+FocUOVyVt19R1tt/TGs06kiMZGvAOG
         HyY/0kldXMOqje3a2EhLJ5bMyp4C90UPxVqcB95l2FtQ93IWk/J/73Zf7vT53N6vqSKQ
         cs6+CdQWZWPJBAHEEWhupfg/+gq4LcTe/79ELFqb6mXO8uqvcDa02VmXnPyvwUmeymjp
         8LT8ZyTEkaxGt/hS4aSEdfsSKvbJpLLhdT2E1s9o7Q2genLC/Xf+djZheroeZALdYZv3
         Qg+KO5YecMKCjjqlkSM5a1xTEWQjEmQFoLnuUCYnMVSdxUNmAMG1zlC2sIJzxxk1tQaY
         0vHw==
X-Gm-Message-State: AOJu0Yzfzi5G6vKmolH77MpsCV0J9tkDTHD68g3iKUj1U9YQDdt+iMzG
	gOr5mCxbgTNm+xIfZkfxiL0=
X-Google-Smtp-Source: AGHT+IHp9NHIhzlo/URxP7pkQYxSTPvQNJLHOzpXCbXbudXygK+XnGEho5KZf1Qzac+pXhrvkYZIBg==
X-Received: by 2002:a25:320c:0:b0:d4b:64ac:a4f7 with SMTP id y12-20020a25320c000000b00d4b64aca4f7mr9519366yby.62.1691449522393;
        Mon, 07 Aug 2023 16:05:22 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 02/31] pgtable: create struct ptdesc
Date: Mon,  7 Aug 2023 16:04:44 -0700
Message-Id: <20230807230513.102486-3-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, page table information is stored within struct page.  As part
of simplifying struct page, create struct ptdesc for page table
information.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm_types.h | 70 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 18c8c3d793b0..cb47438ae17f 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -397,6 +397,76 @@ FOLIO_MATCH(flags, _flags_2);
 FOLIO_MATCH(compound_head, _head_2);
 #undef FOLIO_MATCH
 
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
  * Used for sizing the vmemmap region on some architectures
  */
-- 
2.40.1


