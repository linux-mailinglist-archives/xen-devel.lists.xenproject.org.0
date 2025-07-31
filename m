Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21154B17489
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:02:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065991.1431384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVjo-0004Zg-FO; Thu, 31 Jul 2025 16:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065991.1431384; Thu, 31 Jul 2025 16:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVjo-0004Y0-9z; Thu, 31 Jul 2025 16:02:36 +0000
Received: by outflank-mailman (input) for mailman id 1065991;
 Thu, 31 Jul 2025 16:02:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVgK-0001FB-Q3
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:59:00 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45197ecb-6e27-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:58:59 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-32f3ef6178bso7952881fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:59 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:57 -0700 (PDT)
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
X-Inumbo-ID: 45197ecb-6e27-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977538; x=1754582338; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHdZIbsvWTRsRgXgstuZ4GoswoaWyGKYiWGLJB9LKTI=;
        b=X300Aey748fyobD/lydRA1rPHmWpCLNk/cJdO9KA/v/4kUvk4CwgcBEJ3rPpB5MPiT
         oUVeChU6wiKa7bpvd3+S5BoeTJpn9ZFGgMCHEJPTus07N1mYckjXIzCz09FiCovnO4A8
         jbe05iSRvq/YWhHCmAR1rdvUzaU/mKk+wFdsbjvpD1uNTmqOVkq+wn8AFJzJiub9zUfe
         rZrgfA2rbUSW0qnbxuS4jV+jfpQwIHUI4k4Qxof3J2vsBrchuDaibkZl4aoQm8r7mQpU
         yK5erXsN0PLXArKKvgmeUSxs1Hg8ySjWLjXEis60HmRcFIg2i773oFgYDETD4dEjkKJq
         +yRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977538; x=1754582338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHdZIbsvWTRsRgXgstuZ4GoswoaWyGKYiWGLJB9LKTI=;
        b=nl528yehfktMcs4ZJjQiX5hgYqAFAsmadwAygGbPTXI2SlWpNlLsA1du7xt2tT8dqa
         OQ598nmdrW2RC65S7ATkGNLUqMM72vZ+gM4MQTSxdMP4Mu5pQ3m6lPC7V+dSG2tC3ar8
         zpq8Ge8zWeIChSfRLkzzUNlX5I1T7FGiHru1slHK3g5SF1a8d+66NRiVYGzgSaPJDD86
         jvZc0RjBArIqzUKov46SWQ/J4Yxz84/Lf7ErFnr8szP62xmaJM6ZFcVKXp5QmeVrQJlI
         seYmxme9AYihLQY2HKqub5qL7/MgQTCUr97NedBPQFs7RdGbjQcULhg35kUEhyue+DsH
         t2HQ==
X-Gm-Message-State: AOJu0YzFCjlgJAkfIYY5pnN0Y0su53hdcMfglqAOcL0JcC10dxTEgZGN
	teiYb8G4AgClgXIREGCRqFR65iqDOUAhRt4EjA+jLTXH6dkoNtTGe4e7RnKY+Q==
X-Gm-Gg: ASbGnctODV1X+MiWBKG3anrycpw1NBDfpNOsI6z6Je8MljqOBynywJE7Bx3ZvQWAmLe
	HxY4VZCZ9QodwzH94O2ArrQVWKo4gi6ZVg478V8EDeHImFSHH+ZqBT+i0AuaS5c54FA6gm9RicJ
	x+AUPupqfVHlL/29xG5YUeKNXx7l4LVUNFg++pRxEcp5CMkMbOYfxo8qQaI/OdKXVztiTSGCE+E
	bT0ClECPCEhDBNDHLpDQEpYv97huRYRetp79AIxb6IKPiWLmIxTKN6VnILA1rf7Vo8dwcVIBAtE
	sG8GFQMmvEv9Xrt/AIGIJdVvJ0ihnaiNOORvZ0ANaG0eG+sOfxM72Noy5ev/AVqCfjwBsGJCQCF
	AARWxbjoK9/NFnYLDIcJ0ijnzuiJqhKs+VIfLpafayW3JcHhQ1sAhfsKi9nFsBA==
X-Google-Smtp-Source: AGHT+IGlySXEHdEtSz8EaRKHSDBj85/VOFUIC/a5zK7apwJQgwQockzR3cbVXadBWIaLBzaJ6tlNkQ==
X-Received: by 2002:a05:6512:4025:b0:553:2357:288c with SMTP id 2adb3069b0e04-55b7c025681mr3128805e87.17.1753977538163;
        Thu, 31 Jul 2025 08:58:58 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 19/20] xen/riscv: add support of page lookup by GFN
Date: Thu, 31 Jul 2025 17:58:18 +0200
Message-ID: <24bb8ca6ad9d325f48d0c64b0fa461db5f0d0cc5.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce helper functions for safely querying the P2M (physical-to-machine)
mapping:
 - add p2m_read_lock(), p2m_read_unlock(), and p2m_is_locked() for managing
   P2M lock state.
 - Implement p2m_get_entry() to retrieve mapping details for a given GFN,
   including MFN, page order, and validity.
 - Add p2m_lookup() to encapsulate read-locked MFN retrieval.
 - Introduce p2m_get_page_from_gfn() to convert a GFN into a page_info
   pointer, acquiring a reference to the page if valid.
 - Introduce get_page().

Implementations are based on Arm's functions with some minor modifications:
- p2m_get_entry():
  - Reverse traversal of page tables, as RISC-V uses the opposite level
    numbering compared to Arm.
  - Removed the return of p2m_access_t from p2m_get_entry() since
    mem_access_settings is not introduced for RISC-V.
  - Updated BUILD_BUG_ON() to check using the level 0 mask, which corresponds
    to Arm's THIRD_MASK.
  - Replaced open-coded bit shifts with the BIT() macro.
  - Other minor changes, such as using RISC-V-specific functions to validate
    P2M PTEs, and replacing Arm-specific GUEST_* macros with their RISC-V
    equivalents.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Add is_p2m_foreign() macro and connected stuff.
 - Change struct domain *d argument of p2m_get_page_from_gfn() to
   struct p2m_domain.
 - Update the comment above p2m_get_entry().
 - s/_t/p2mt for local variable in p2m_get_entry().
 - Drop local variable addr in p2m_get_entry() and use gfn_to_gaddr(gfn)
   to define offsets array.
 - Code style fixes.
 - Update a check of rc code from p2m_next_level() in p2m_get_entry()
   and drop "else" case.
 - Do not call p2m_get_type() if p2m_get_entry()'s t argument is NULL.
 - Use struct p2m_domain instead of struct domain for p2m_lookup() and
   p2m_get_page_from_gfn().
 - Move defintion of get_page() from "xen/riscv: implement mfn_valid() and page reference, ownership handling helpers"
---
Changes in V2:
 - New patch.
---
 xen/arch/riscv/include/asm/p2m.h |  18 ++++
 xen/arch/riscv/mm.c              |  13 +++
 xen/arch/riscv/p2m.c             | 136 +++++++++++++++++++++++++++++++
 3 files changed, 167 insertions(+)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index fbc73448a7..dc3a77cc15 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -202,6 +202,24 @@ static inline int p2m_is_write_locked(struct p2m_domain *p2m)
 
 unsigned long construct_hgatp(struct p2m_domain *p2m, uint16_t vmid);
 
+static inline void p2m_read_lock(struct p2m_domain *p2m)
+{
+    read_lock(&p2m->lock);
+}
+
+static inline void p2m_read_unlock(struct p2m_domain *p2m)
+{
+    read_unlock(&p2m->lock);
+}
+
+static inline int p2m_is_locked(struct p2m_domain *p2m)
+{
+    return rw_is_locked(&p2m->lock);
+}
+
+struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
+                                        p2m_type_t *t);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 3ad2b9cf93..5e09d46a75 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -677,3 +677,16 @@ struct domain *page_get_owner_and_reference(struct page_info *page)
 
     return owner;
 }
+
+bool get_page(struct page_info *page, const struct domain *domain)
+{
+    const struct domain *owner = page_get_owner_and_reference(page);
+
+    if ( likely(owner == domain) )
+        return true;
+
+    if ( owner != NULL )
+        put_page(page);
+
+    return false;
+}
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index e9e6818da2..24a09d4537 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -852,3 +852,139 @@ int map_regions_p2mt(struct domain *d,
 {
     return p2m_insert_mapping(p2m_get_hostp2m(d), gfn, nr, mfn, p2mt);
 }
+
+/*
+ * Get the details of a given gfn.
+ *
+ * If the entry is present, the associated MFN will be returned type filled up.
+ * The page_order will correspond to the order of the mapping in the page
+ * table (i.e it could be a superpage).
+ *
+ * If the entry is not present, INVALID_MFN will be returned and the
+ * page_order will be set according to the order of the invalid range.
+ *
+ * valid will contain the value of bit[0] (e.g valid bit) of the
+ * entry.
+ */
+static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
+                           p2m_type_t *t,
+                           unsigned int *page_order,
+                           bool *valid)
+{
+    unsigned int level = 0;
+    pte_t entry, *table;
+    int rc;
+    mfn_t mfn = INVALID_MFN;
+    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
+
+    ASSERT(p2m_is_locked(p2m));
+    BUILD_BUG_ON(XEN_PT_LEVEL_MAP_MASK(0) != PAGE_MASK);
+
+    if ( valid )
+        *valid = false;
+
+    /* XXX: Check if the mapping is lower than the mapped gfn */
+
+    /* This gfn is higher than the highest the p2m map currently holds */
+    if ( gfn_x(gfn) > gfn_x(p2m->max_mapped_gfn) )
+    {
+        for ( level = P2M_ROOT_LEVEL; level; level-- )
+            if ( (gfn_x(gfn) & (XEN_PT_LEVEL_MASK(level) >> PAGE_SHIFT)) >
+                 gfn_x(p2m->max_mapped_gfn) )
+                break;
+
+        goto out;
+    }
+
+    table = p2m_get_root_pointer(p2m, gfn);
+
+    /*
+     * the table should always be non-NULL because the gfn is below
+     * p2m->max_mapped_gfn and the root table pages are always present.
+     */
+    if ( !table )
+    {
+        ASSERT_UNREACHABLE();
+        level = P2M_ROOT_LEVEL;
+        goto out;
+    }
+
+    for ( level = P2M_ROOT_LEVEL; level; level-- )
+    {
+        rc = p2m_next_level(p2m, true, level, &table, offsets[level]);
+        if ( (rc == P2M_TABLE_MAP_NONE) || (rc == P2M_TABLE_MAP_NOMEM) )
+            goto out_unmap;
+
+        if ( rc != P2M_TABLE_NORMAL )
+            break;
+    }
+
+    entry = table[offsets[level]];
+
+    if ( pte_is_valid(entry) )
+    {
+        if ( t )
+            *t = p2m_get_type(entry);
+
+        mfn = pte_get_mfn(entry);
+        /*
+         * The entry may point to a superpage. Find the MFN associated
+         * to the GFN.
+         */
+        mfn = mfn_add(mfn,
+                      gfn_x(gfn) & (BIT(XEN_PT_LEVEL_ORDER(level), UL) - 1));
+
+        if ( valid )
+            *valid = pte_is_valid(entry);
+    }
+
+ out_unmap:
+    unmap_domain_page(table);
+
+ out:
+    if ( page_order )
+        *page_order = XEN_PT_LEVEL_ORDER(level);
+
+    return mfn;
+}
+
+static mfn_t p2m_lookup(struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t)
+{
+    mfn_t mfn;
+
+    p2m_read_lock(p2m);
+    mfn = p2m_get_entry(p2m, gfn, t, NULL, NULL);
+    p2m_read_unlock(p2m);
+
+    return mfn;
+}
+
+struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
+                                        p2m_type_t *t)
+{
+    struct page_info *page;
+    p2m_type_t p2mt = p2m_invalid;
+    mfn_t mfn = p2m_lookup(p2m, gfn, t);
+
+    if ( !mfn_valid(mfn) )
+        return NULL;
+
+    if ( t )
+        p2mt = *t;
+
+    page = mfn_to_page(mfn);
+
+    /*
+     * get_page won't work on foreign mapping because the page doesn't
+     * belong to the current domain.
+     */
+    if ( p2m_is_foreign(p2mt) )
+    {
+        struct domain *fdom = page_get_owner_and_reference(page);
+        ASSERT(fdom != NULL);
+        ASSERT(fdom != p2m->domain);
+        return page;
+    }
+
+    return get_page(page, p2m->domain) ? page : NULL;
+}
-- 
2.50.1


