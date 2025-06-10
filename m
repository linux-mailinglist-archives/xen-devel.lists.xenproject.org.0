Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92593AD3887
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:14:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010902.1389161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyo4-0007wg-5u; Tue, 10 Jun 2025 13:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010902.1389161; Tue, 10 Jun 2025 13:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyo4-0007uG-2S; Tue, 10 Jun 2025 13:14:24 +0000
Received: by outflank-mailman (input) for mailman id 1010902;
 Tue, 10 Jun 2025 13:14:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyfx-0004Sm-S1
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:06:01 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a79c32ec-45fb-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 15:06:00 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-adb2e9fd208so1005453066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:06:00 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:58 -0700 (PDT)
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
X-Inumbo-ID: a79c32ec-45fb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560759; x=1750165559; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxKP9f8ngOMBgx9560upayt7lSd7zzCQxJwGN9s2GJk=;
        b=m1ovLthoevvFCTP+/FCbMSh7wbea1ENmx1tXO32LyFI/RlpTLezvYSCGmN6ZnTFRhn
         iqoa3mlawgCHTENDdO66G6BITW53nAMxvbtd2BsbvUFSiTV7pcFGTzy3UofVxfFo0hqS
         M4NuFkkENFhtpOlLergJltgqjTEAdwQbQlWEMbmlisdtO59DMLphH7ZHBtOMGlDjpWvn
         eTVH8Fl/pUuZPNzVy4aADgvTJYV6DJM9HiRs4vdiDPXWZSHqPL0dApBtPpXmoRdGixVM
         Q6MbUTl82/7ezeQpaZlOM6eTyCWp3BH5mK+o6cHtvi5MWbE6r3XpUV1gyR4M0J20DLtO
         qpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560759; x=1750165559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxKP9f8ngOMBgx9560upayt7lSd7zzCQxJwGN9s2GJk=;
        b=iFOKX4zrUZwqiwLB3PdS33UxRr6moIipwqiMt6lgYgEDi7LOAsNqhJREXF40rSEYxR
         iNUdopvJhOTgWC2InEM/6h06iAK3M9EYbCUrYsLdRhy1nIIqD50ztjnivMWCbWocyZCC
         h62xNs4XaOwnEzn0uYz/WNjJ0WLqae3AvjEWDx6WHCK8wN3Pr3DKgF9lDoYR08QSpLvh
         j+BRMOlvPKpyXwesCpdiIeH4Zi0sxhKXH28e1wl1GznhNQkgRhxoZkXgxtyTmA7PlYLy
         sfr+Q0X/CmzwbHb3XO7vzDIuswmJ2d7oCdv0Iuewc5H8yowIbwm1LGKDfMhp1XM5oL/j
         9P/g==
X-Gm-Message-State: AOJu0YzVW+dkGP/jMUnUI7b9Oz+oSBOuPnNI6utTIkcblF85iBQW6ajb
	6RSrIRRc/e2ccKS+VEu7XpUuqr3Cr3J7UxIB+2cX/IfP/BDXrQen39KCH3C8Gg==
X-Gm-Gg: ASbGncviwSBNZPIT1gJfprb0kRJDuAvGV7ZBBJWidvnuu/sPn6+RnoKw/jGmRzPQT+3
	pp4oe2bfGZKCq4YMHTMuNXizPBC/xcM6SRoocRcOM46wySjBD+rsu6jPRJih62mELfoERCsEDKw
	W79J9Df/5xhhwwdphp3zzqM6HoiexM1WkMMXzxyQpJFa4Eeskte92VLTOUeywfJsQ3Or/naB8m5
	WZB0vyO+rm86We1lB/b+ZMUb6FMMASEVBHbX7Vv71Pqv575rT+QsCRvDvzut1Nzla5OY9iYxlax
	Yd0CLrcpHbLDqhdPalYWNH0GXZu4CAIV03Yn2hgn4uAZ2ZKSnz5oNbgXK4mVnNl0mAFA6FzssFW
	vT/lvJZM95mZJMV9Bt4aUL19AnBI7mkYUPDgJt2Y=
X-Google-Smtp-Source: AGHT+IHWl8myTiCOtSxMJB1ph23F+y6qfnmNmU/sbGUTwauxrcWLbzCTqhwYVY34jrYRSFX6Z5wKoA==
X-Received: by 2002:a17:907:7248:b0:ad8:9257:5735 with SMTP id a640c23a62f3a-ade1aa0fc41mr1574508766b.3.1749560759079;
        Tue, 10 Jun 2025 06:05:59 -0700 (PDT)
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
Subject: [PATCH v2 17/17] xen/riscv: add support of page lookup by GFN
Date: Tue, 10 Jun 2025 15:05:32 +0200
Message-ID: <6281efb0dc9b0a9ab4dd8cee7952bff2a7745963.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
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

Implementations are based on Arm's functions with some minor modifications:
- p2m_get_entry():
  - Reverse traversal of page tables, as RISC-V uses the opposite order
    compared to Arm.
  - Removed the return of p2m_access_t from p2m_get_entry() since
    mem_access_settings is not introduced for RISC-V.
  - Updated BUILD_BUG_ON() to check using the level 0 mask, which corresponds
    to Arm's THIRD_MASK.
  - Replaced open-coded bit shifts with the BIT() macro.
  - Other minor changes, such as using RISC-V-specific functions to validate
    P2M PTEs, and replacing Arm-specific GUEST_* macros with their RISC-V
    equivalents.
- p2m_get_page_from_gfn():
  - Removed p2m_is_foreign() and related logic, as this functionality is not
    implemented for RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - New patch.
---
 xen/arch/riscv/include/asm/p2m.h |  18 +++++
 xen/arch/riscv/p2m.c             | 131 +++++++++++++++++++++++++++++++
 2 files changed, 149 insertions(+)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index fdebd18356..96e0790dbc 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -184,6 +184,24 @@ static inline int p2m_is_write_locked(struct p2m_domain *p2m)
     return rw_is_write_locked(&p2m->lock);
 }
 
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
+struct page_info *p2m_get_page_from_gfn(struct domain *d, gfn_t gfn,
+                                        p2m_type_t *t);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 79c4473f1f..034b1888c5 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1055,3 +1055,134 @@ int guest_physmap_add_entry(struct domain *d,
 {
     return p2m_insert_mapping(d, gfn, (1 << page_order), mfn, t);
 }
+
+/*
+ * Get the details of a given gfn.
+ *
+ * If the entry is present, the associated MFN will be returned and the
+ * access and type filled up. The page_order will correspond to the
+ * order of the mapping in the page table (i.e it could be a superpage).
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
+    paddr_t addr = gfn_to_gaddr(gfn);
+    unsigned int level = 0;
+    pte_t entry, *table;
+    int rc;
+    mfn_t mfn = INVALID_MFN;
+    p2m_type_t _t;
+    DECLARE_OFFSETS(offsets, addr);
+
+    ASSERT(p2m_is_locked(p2m));
+    BUILD_BUG_ON(XEN_PT_LEVEL_MAP_MASK(0) != PAGE_MASK);
+
+    /* Allow t to be NULL */
+    t = t ?: &_t;
+
+    *t = p2m_invalid;
+
+    if ( valid )
+        *valid = false;
+
+    /* XXX: Check if the mapping is lower than the mapped gfn */
+
+    /* This gfn is higher than the highest the p2m map currently holds */
+    if ( gfn_x(gfn) > gfn_x(p2m->max_mapped_gfn) )
+    {
+        for ( level = P2M_ROOT_LEVEL; level ; level-- )
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
+    for ( level = P2M_ROOT_LEVEL; level ; level-- )
+    {
+        rc = p2m_next_level(p2m, true, level, &table, offsets[level]);
+        if ( (rc == GUEST_TABLE_MAP_NONE) && (rc != GUEST_TABLE_MAP_NOMEM) )
+            goto out_unmap;
+        else if ( rc != GUEST_TABLE_NORMAL )
+            break;
+    }
+
+    entry = table[offsets[level]];
+
+    if ( p2me_is_valid(p2m, entry) )
+    {
+        *t = p2m_type_radix_get(p2m, entry);
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
+out_unmap:
+    unmap_domain_page(table);
+
+out:
+    if ( page_order )
+        *page_order = XEN_PT_LEVEL_ORDER(level);
+
+    return mfn;
+}
+
+static mfn_t p2m_lookup(struct domain *d, gfn_t gfn, p2m_type_t *t)
+{
+    mfn_t mfn;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    p2m_read_lock(p2m);
+    mfn = p2m_get_entry(p2m, gfn, t, NULL, NULL);
+    p2m_read_unlock(p2m);
+
+    return mfn;
+}
+
+struct page_info *p2m_get_page_from_gfn(struct domain *d, gfn_t gfn,
+                                        p2m_type_t *t)
+{
+    p2m_type_t p2mt = {0};
+    struct page_info *page;
+
+    mfn_t mfn = p2m_lookup(d, gfn, &p2mt);
+
+    if ( t )
+        *t = p2mt;
+
+    if ( !mfn_valid(mfn) )
+        return NULL;
+
+    page = mfn_to_page(mfn);
+
+    return get_page(page, d) ? page : NULL;
+}
-- 
2.49.0


