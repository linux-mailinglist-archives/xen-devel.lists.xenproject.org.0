Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29F9BF2423
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146556.1479090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsHK-0000ZS-7u; Mon, 20 Oct 2025 15:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146556.1479090; Mon, 20 Oct 2025 15:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsHJ-0000Ru-GP; Mon, 20 Oct 2025 15:58:33 +0000
Received: by outflank-mailman (input) for mailman id 1146556;
 Mon, 20 Oct 2025 15:58:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsHG-0004nC-1k
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:30 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e381f51-adcd-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 17:58:28 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-63c3429bb88so5100118a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:28 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:27 -0700 (PDT)
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
X-Inumbo-ID: 9e381f51-adcd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975908; x=1761580708; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODbiJmURbFLDP/Eas229LJ7sWxc7yUWKL/v+EeBB7o4=;
        b=ilM1o0cljD3C3oQdKz83N9H1TxiJLCQAwYlZv3hwVEqYneM0FQHYqxsRh/ZsiCqFV7
         9ziA2wbtFX4w3VV9gK0FKMK6LqSnfgF1EGiFFOFNyflKJ9TAVbwe71dkedqtfryJo86n
         8oN8/bVka9ohtEn0aduuGuo/SEW1GoUCDLtdZdZGvdjfu/ycqW3Tzhs2WIDnoM2Fi8ng
         VUPA2GR5nEiIRTnHfLKa7qVWwLZWXWmriVw7CxCDwmJl17H0OIGhls4OP6ZNmsVolsDt
         ObTrvoDUVF1mSR/nTAMbazXy1gR+M65/GKb1yU5JwWB+YcnNjCvGoopdkV3JFUbrZWH5
         01Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975908; x=1761580708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODbiJmURbFLDP/Eas229LJ7sWxc7yUWKL/v+EeBB7o4=;
        b=sUx2aTFMRPGOpwjeG5+SbycLdXsHpbuqTrTsO/eeEskw5ngfFbW0y2t7PNhKYxyFBK
         BILthztA1Q1hJZKERWK5Khd1w3Cqv8jHbrv9p8YOZxoplngZkYjFthcuhLwtSsmsflE7
         6QXiDimUKqPALM/f/e+8mS7PtGzCFv0cP0bUN+uym2XLtuhjwFX8btjszveHB0Ym+Ipj
         FFgw97GzD0Isf9i/rpSSXFh4cCgE1JTJhqoZ171E205rKMRYHP40Ph7UepIYr0a8YomY
         qzUJWnHAxVD4vxepocG82buUSEQRcSWx5WYgg2a7osSGl02E9EB/HW/kdX4hWRVd7Lvd
         RzJg==
X-Gm-Message-State: AOJu0YwQJRaVpcUtLN/WUpZzXMuVwk4GRW/c/2FDaRmL5IGIDu44rCB/
	PeAWXQkunih9Mx2wmreZJ7auaBrJkJrri8HcYuGyrBtbSZ+t6Pz5iOkoLShT7Q==
X-Gm-Gg: ASbGncsqwlUNKv449WNeDaoa9NIW2Y8Z2ED9LfBi/l6YkX+Md4A5zSSa8/rRPG/hThO
	vzqBJaSKDK5u0+iPY8GeexqlCQXIV6fGL5j9Ti0vj2Cmh75bUQtWpqXgxD9/P6f1Te355J3wBLi
	7wKwrKkZasJrWdo6LcVcHiBrd3jqHBTDMHf0AQ/DEGRLk33LmAFx6O6gNMz5E67wvvIUPKZZ4wU
	sEgdShCa7nDrYBppnnYlIMHqn8OprgTGy8pjTNL5vZiFzenNpJrd+U2pHFLKnQOf8MHZueI6w5u
	3Rwf3k93QuXn+TJgmn6qejcKkiO8NoFgsVHZaCfWZdVA8i7Fjwl//pIfXLdR49XnpqvIUZsQhbx
	829e5UmpTzQKc1ZvxB95JBlOfJUwaH4zJ9vCHx84czwO1hR+nfYJO/Ji9pItJnBFSTe5jsOUTNl
	k3jSSLfrp7wee/maJnnx+Crz4JyEw0xuX0VZQwqxEBr2dVNklZP8DTlLEtQg==
X-Google-Smtp-Source: AGHT+IEkrU3AI9nfoLn2NykgKH7XRjY5rkT72M6PT3oypno/AIYPnzWYNX86BumqS209D7LLtRD12Q==
X-Received: by 2002:a05:6402:1ecd:b0:63c:6d2d:8dd0 with SMTP id 4fb4d7f45d1cf-63c6d2d8fcemr5716149a12.22.1760975907455;
        Mon, 20 Oct 2025 08:58:27 -0700 (PDT)
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
Subject: [for 4.22 v5 17/18] xen/riscv: add support of page lookup by GFN
Date: Mon, 20 Oct 2025 17:58:00 +0200
Message-ID: <3eea04894401202666ea0bb7ee1240a23ba54d8a.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce helper functions for safely querying the P2M (physical-to-machine)
mapping:
 - add p2m_read_lock(), p2m_read_unlock(), and p2m_is_locked() for managing
   P2M lock state.
 - Implement p2m_get_entry() to retrieve mapping details for a given GFN,
   including MFN, page order, and validity.
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

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - Use introduced in earlier patches P2M_DECLARE_OFFSETS() instead of
   DECLARE_OFFSETS().
 - Drop blank line before check_outside_boundary().
 - Use more readable version of if statements inside check_outside_boundary().
 - Accumulate mask in check_outside_boundary() instead of re-writing it for
   each page table level to have correct gfns for comparison.
 - Set argument `t` of p2m_get_entry() to p2m_invalid by default.
 - Drop checking of (rc == P2M_TABLE_MAP_NOMEM ) when p2m_next_level(...,false,...)
   is called.
 - Add ASSERT(mfn & (BIT(P2M_LEVEL_ORDER(level), UL) - 1)); in p2m_get_entry()
   to be sure that recieved `mfn` has cleared lowest bits.
 - Drop `valid` argument from p2m_get_entry(), it is not needed anymore.
 - Drop p2m_lookup(), use p2m_get_entry() explicitly inside p2m_get_page_from_gfn().
 - Update the commit message.
---
Changes in V4:
 - Update prototype of p2m_is_locked() to return bool and accept pointer-to-const.
 - Correct the comment above p2m_get_entry().
 - Drop the check "BUILD_BUG_ON(XEN_PT_LEVEL_MAP_MASK(0) != PAGE_MASK);" inside
   p2m_get_entry() as it is stale and it was needed to sure that 4k page(s) are
   used on L3 (in Arm terms) what is true for RISC-V. (if not special extension
   are used). It was another reason for Arm to have it (and I copied it to RISC-V),
   but it isn't true for RISC-V. (some details could be found in response to the
   patch).
 - Style fixes.
 - Add explanatory comment what the loop inside "gfn is higher then the highest
   p2m mapping" does. Move this loop to separate function check_outside_boundary()
   to cover both boundaries (lower_mapped_gfn and max_mapped_gfn).
 - There is not need to allocate a page table as it is expected that
   p2m_get_entry() normally would be called after a corresponding p2m_set_entry()
   was called. So change 'true' to 'false' in a page table walking loop inside
   p2m_get_entry().
 - Correct handling of p2m_is_foreign case inside p2m_get_page_from_gfn().
 - Introduce and use P2M_LEVEL_MASK instead of XEN_PT_LEVEL_MASK as it isn't take
   into account two extra bits for root table in case of P2M.
 - Drop stale item from "change in v3" - Add is_p2m_foreign() macro and connected stuff.
 - Add p2m_read_(un)lock().
---
Changes in V3:
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
 xen/arch/riscv/include/asm/p2m.h |  20 ++++
 xen/arch/riscv/mm.c              |  13 +++
 xen/arch/riscv/p2m.c             | 175 +++++++++++++++++++++++++++++++
 3 files changed, 208 insertions(+)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 6a17cd52fc..39cfc1fd9e 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -48,6 +48,8 @@ extern unsigned int gstage_root_level;
 
 #define P2M_LEVEL_SHIFT(lvl) (P2M_LEVEL_ORDER(lvl) + PAGE_SHIFT)
 
+#define P2M_LEVEL_MASK(lvl) (GFN_MASK(lvl) << P2M_LEVEL_SHIFT(lvl))
+
 #define paddr_bits PADDR_BITS
 
 /* Get host p2m table */
@@ -232,6 +234,24 @@ static inline bool p2m_is_write_locked(struct p2m_domain *p2m)
 
 unsigned long construct_hgatp(const struct p2m_domain *p2m, uint16_t vmid);
 
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
+static inline bool p2m_is_locked(const struct p2m_domain *p2m)
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
index e25f995b72..e9ce182d06 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -673,3 +673,16 @@ struct domain *page_get_owner_and_reference(struct page_info *page)
 
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
index 383047580a..785d11aaff 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1049,3 +1049,178 @@ int map_regions_p2mt(struct domain *d,
 
     return rc;
 }
+
+/*
+ * p2m_get_entry() should always return the correct order value, even if an
+ * entry is not present (i.e. the GFN is outside the range):
+ *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]).    (1)
+ *
+ * This ensures that callers of p2m_get_entry() can determine what range of
+ * address space would be altered by a corresponding p2m_set_entry().
+ * Also, it would help to avoid cost page walks for GFNs outside range (1).
+ *
+ * Therefore, this function returns true for GFNs outside range (1), and in
+ * that case the corresponding level is returned via the level_out argument.
+ * Otherwise, it returns false and p2m_get_entry() performs a page walk to
+ * find the proper entry.
+ */
+static bool check_outside_boundary(gfn_t gfn, gfn_t boundary, bool is_lower,
+                                   unsigned int *level_out)
+{
+    unsigned int level;
+
+    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
+                  : gfn_x(gfn) > gfn_x(boundary) )
+    {
+        unsigned long mask = 0;
+
+        for ( level = P2M_ROOT_LEVEL; level; level-- )
+        {
+            unsigned long masked_gfn;
+
+            mask |= PFN_DOWN(P2M_LEVEL_MASK(level));
+            masked_gfn = gfn_x(gfn) & mask;
+
+            if ( is_lower ? masked_gfn < gfn_x(boundary)
+                          : masked_gfn > gfn_x(boundary) )
+            {
+                *level_out = level;
+                return true;
+            }
+        }
+    }
+
+    return false;
+}
+
+/*
+ * Get the details of a given gfn.
+ *
+ * If the entry is present, the associated MFN will be returned and the
+ * p2m type of the mapping.
+ * The page_order will correspond to the order of the mapping in the page
+ * table (i.e it could be a superpage).
+ *
+ * If the entry is not present, INVALID_MFN will be returned and the
+ * page_order will be set according to the order of the invalid range.
+ */
+static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
+                           p2m_type_t *t,
+                           unsigned int *page_order)
+{
+    unsigned int level = 0;
+    pte_t entry, *table;
+    int rc;
+    mfn_t mfn = INVALID_MFN;
+    P2M_DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
+
+    ASSERT(p2m_is_locked(p2m));
+
+    if ( t )
+        *t = p2m_invalid;
+
+    if ( check_outside_boundary(gfn, p2m->lowest_mapped_gfn, true, &level) )
+        goto out;
+
+    if ( check_outside_boundary(gfn, p2m->max_mapped_gfn, false, &level) )
+        goto out;
+
+    table = p2m_get_root_pointer(p2m, gfn);
+
+    /*
+     * The table should always be non-NULL because the gfn is below
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
+        rc = p2m_next_level(p2m, false, level, &table, offsets[level]);
+        if ( rc == P2M_TABLE_MAP_NONE )
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
+
+        ASSERT(!(mfn_x(mfn) & (BIT(P2M_LEVEL_ORDER(level), UL) - 1)));
+
+        /*
+         * The entry may point to a superpage. Find the MFN associated
+         * to the GFN.
+         */
+        mfn = mfn_add(mfn,
+                      gfn_x(gfn) & (BIT(P2M_LEVEL_ORDER(level), UL) - 1));
+    }
+
+ out_unmap:
+    unmap_domain_page(table);
+
+ out:
+    if ( page_order )
+        *page_order = P2M_LEVEL_ORDER(level);
+
+    return mfn;
+}
+
+struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
+                                        p2m_type_t *t)
+{
+    struct page_info *page;
+    p2m_type_t p2mt = p2m_invalid;
+    mfn_t mfn;
+
+    p2m_read_lock(p2m);
+    mfn = p2m_get_entry(p2m, gfn, t, NULL);
+
+    if ( !mfn_valid(mfn) )
+    {
+        p2m_read_unlock(p2m);
+        return NULL;
+    }
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
+    if ( unlikely(p2m_is_foreign(p2mt)) )
+    {
+        const struct domain *fdom = page_get_owner_and_reference(page);
+
+        p2m_read_unlock(p2m);
+
+        if ( fdom )
+        {
+            if ( likely(fdom != p2m->domain) )
+                return page;
+
+            ASSERT_UNREACHABLE();
+            put_page(page);
+        }
+
+        return NULL;
+    }
+
+    p2m_read_unlock(p2m);
+
+    return get_page(page, p2m->domain) ? page : NULL;
+}
-- 
2.51.0


