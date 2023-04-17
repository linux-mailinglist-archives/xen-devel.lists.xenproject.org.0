Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE996E52AA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:53:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522326.811607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVr8-0006Iv-0j; Mon, 17 Apr 2023 20:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522326.811607; Mon, 17 Apr 2023 20:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVr7-0006De-Rz; Mon, 17 Apr 2023 20:53:45 +0000
Received: by outflank-mailman (input) for mailman id 522326;
 Mon, 17 Apr 2023 20:52:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqG-0005NG-No
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:52:52 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d095fb21-dd61-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 22:52:50 +0200 (CEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 v21-20020a17090a459500b0024776162815so6438924pjg.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:52:50 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:52:49 -0700 (PDT)
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
X-Inumbo-ID: d095fb21-dd61-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764769; x=1684356769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ds3IS9TWlY4iXOF1Vygr3Q/N2fJxO0/Dzlxnv3cq6/0=;
        b=hr7pEt7A7XcPfK4WHrNDJyXTyW/f522/QxHB9K2NM6BmG8KnIlcSk7Prak06XFsubX
         Sjsu1MPagS5Ajy0wM6nwYZFly4hHrr9DYIrVTEdELHRdfsGo64oEk7qD+41S/NMObi8y
         l8A2tz8IWZ1X+Du4Mg5V1agW+uGCUPtQdgx1HioQtiEf01hZXw902OFYpkixEmc4936W
         rbvY3hq0N/ZSHnXC+KGydT6+ZrTUjCaNrxKIoD5OlWamJ5QPi1l2Tt7uz8xTA1Fp0QB2
         97/hz5zZCcVfwzgfNZP+zBkRfPzWu3gB3ojY6/LKA9XIpl4tn1OEejbLEhRl9E9QH4p3
         YC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764769; x=1684356769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ds3IS9TWlY4iXOF1Vygr3Q/N2fJxO0/Dzlxnv3cq6/0=;
        b=h3/jIAoamGS+20z7ctBPZ1PRjHNdQoAFEtcWcYwz7kIKHNnSSCa1HObFopGVsAX0d5
         VRy3iSeDLm8u+lw5x8xiuBlBiryqXV+1zVZo2UQUgJhy4OLglRO3+0Pm/7MncNWUZ6ZD
         6bHOdLkwNIeaVD2XELFl7jwYBDjRzbBJbHXHdokf01QuDrcZuTcSx7hhQpw06Bi4Vr4J
         WaYBCKB2R9tEIiPSDEVu+Vt4OGNf8cFLXprj8J+FvuE66KfecJb9lcI6SM4u78wLoSTV
         pgd3AIffFzVe8GgzlS+NS1eV3he7rO7Y/sLu1/GgJ+HFrqQk3y6EKtD/CfXsBPbSRnRc
         qNfA==
X-Gm-Message-State: AAQBX9dds3uFFEBhOyv9rK20GoyaGFQA/DCPQe3LVeotI1BYFhylD/Cy
	26+n2MMaId07II/DP56or7Y=
X-Google-Smtp-Source: AKy350bKOtS2RU5+UPauyBEeUGcMLqfRctd5dndnPm3bZbQM5N2yHnkL/dVsnC5V83h9pYCSEFQOHw==
X-Received: by 2002:a05:6a20:6595:b0:eb:ad6a:ccf4 with SMTP id p21-20020a056a20659500b000ebad6accf4mr15296929pzh.18.1681764769281;
        Mon, 17 Apr 2023 13:52:49 -0700 (PDT)
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
Subject: [PATCH 03/33] pgtable: Create struct ptdesc
Date: Mon, 17 Apr 2023 13:50:18 -0700
Message-Id: <20230417205048.15870-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, page table information is stored within struct page. As part
of simplifying struct page, create struct ptdesc for page table
information.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/pgtable.h | 50 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 023918666dd4..7cc6ea057ee9 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -47,6 +47,56 @@
 #define pmd_pgtable(pmd) pmd_page(pmd)
 #endif
 
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
+TABLE_MATCH(mapping, _pt_s390_gaddr);
+TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
+TABLE_MATCH(pt_mm, pt_mm);
+TABLE_MATCH(ptl, ptl);
+#undef TABLE_MATCH
+static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
+
 /*
  * A page table page can be thought of an array like this: pXd_t[PTRS_PER_PxD]
  *
-- 
2.39.2


