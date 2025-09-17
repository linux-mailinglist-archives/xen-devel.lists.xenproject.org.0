Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E31B82195
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 00:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125715.1467625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz0IL-0008Dm-98; Wed, 17 Sep 2025 22:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125715.1467625; Wed, 17 Sep 2025 22:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz0IL-0008C0-43; Wed, 17 Sep 2025 22:06:33 +0000
Received: by outflank-mailman (input) for mailman id 1125715;
 Wed, 17 Sep 2025 22:06:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz08U-0007Lt-4g
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:56:22 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20fb241d-9411-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 23:56:14 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-24b13313b1bso2093165ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:56:14 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:56:12 -0700 (PDT)
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
X-Inumbo-ID: 20fb241d-9411-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146173; x=1758750973; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfs2AsCBNAItTu5Fl9oEWjrrGVJNBfidRIAng3EmHkc=;
        b=G7Rk5pG/fcWwdycM+ATE8p+T/9n95vqciYYNymeKqIsCVRABUOfmr6Xdc7bizXy8fb
         QOER9zMRMHC/Q3AatFEU6gzDPQwq4dSVxX2AEETRatdTGDnavvG/aEuMkacJubWqachc
         CHk2GdGgj4PhbhDEk7jpPwcHfdxY6m710It7Rra6FVEAuZHidGZAnpWYwqsGa0ix5xO1
         WewTCUPlLt/6P4r5lI6JPZ+Hg67FlaNmAHeBqpUA06jMVwTHljMy57aEXoufwU/R8BrM
         Hj13dIsK5OxXl/LwpKfpI4YH+i5Dbz6hItucWYjYFE+i8V4NGUBU7U9y+e9A6IGTX1fX
         CvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146173; x=1758750973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfs2AsCBNAItTu5Fl9oEWjrrGVJNBfidRIAng3EmHkc=;
        b=P/2sRBQtgXzMtfI1TCwfZrMEDsMgaz3BM/i65OJBTTHFMi+ea1H7ZnQ7Y/QR3C1kbY
         PP1PV92tohkrS1gMzUP+tvsV4IaRk0kYyb9SHiMw3BxyqcSR+eBmAPbaEjnL7g4eL1Ki
         vO5YaYbO64swfs05f79GWAw6BrKA0PsB8P5LCKoyqWvgry2PuvzhVTZQEsd3sNx/TI4G
         CaTUm7zPi5k1SNy6lu7R2BA10tIQu4Q6w/E1CH9EyxohFMxRiKdqCw8Koxv3I/TSuOfR
         yMeLqVawqe/qnW6qQ4tLOXWztNk1ZWyS/Q4IRc4BvRKlIzjYmoIeiQgVE1SQUnhyYVfM
         8Ilg==
X-Gm-Message-State: AOJu0Ywp28H8KBzaAuE9ltHCFKNHyLrebzuq7dZlBCxmu6I+5qzrO4Wm
	1pg8t79edm0IMC2/k14CpBfWMlD2gpvbxzI6PJ4UQxc99YSwVG1ltzFZyiRgW3xVmMI=
X-Gm-Gg: ASbGncuDt2/5UB9wE0r3mw6Epy/hco7SI5L407SOZ0L3GghsZl01bRGCigDFKH8bCaH
	Q9T1JzVvcAbQhF4JJRWpC5ZDOwMebqmqVT/PEgK9jZVNbSMg3W0ktB8Wb1HBJpfdB69tqjgDE29
	uQQkbIwTBzzWsUqXD9bq9WAKZwmnmUDGSfa+ARk/JbnpjJeOLDS7gEkewWyZv98fwGlzmekMI2w
	Q48YvwvRsWX7hd6lCXXGlSZt/W576UVXwvJNv9kOj3ifwGF2RHup99P+DZ5L5bJci4Y3vzdSmAx
	TO1gk94w0w7MAwv7StFlc3xS4QcUp23ATr+OD4/Xyw3mudsxuAjsMUWxJ5FHvcjaGSAs7rl7no1
	ZzsGmfCDZQn0a4MOW4I9GBij1qlxt6oY1TKYGHtHPU/f7
X-Google-Smtp-Source: AGHT+IF5JNWP8YADOHVCKFGwMqryhhQhwOg2dDMlbKj2M+OKPCoLlTF0HNhA7NwXfYgS6rzQ8zcG4Q==
X-Received: by 2002:a17:902:ef0f:b0:24c:965a:f97e with SMTP id d9443c01a7336-26811ba541dmr52358885ad.2.1758146172665;
        Wed, 17 Sep 2025 14:56:12 -0700 (PDT)
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
Subject: [PATCH v4 17/18] xen/riscv: add support of page lookup by GFN
Date: Wed, 17 Sep 2025 23:55:37 +0200
Message-ID: <5065d9f1552fd940cc19087d8e00a0fa3519e66c.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/p2m.h |  24 ++++
 xen/arch/riscv/mm.c              |  13 +++
 xen/arch/riscv/p2m.c             | 186 +++++++++++++++++++++++++++++++
 3 files changed, 223 insertions(+)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 29685c7852..2d0b0375d5 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -44,6 +44,12 @@ extern unsigned int gstage_root_level;
 #define P2M_PAGETABLE_ENTRIES(lvl) \
     (BIT(PAGETABLE_ORDER + P2M_ROOT_EXTRA_BITS(lvl), UL))
 
+#define GFN_MASK(lvl) (P2M_PAGETABLE_ENTRIES(lvl) - 1UL)
+
+#define P2M_LEVEL_SHIFT(lvl) (P2M_LEVEL_ORDER(lvl) + PAGE_SHIFT)
+
+#define P2M_LEVEL_MASK(lvl) (GFN_MASK(lvl) << P2M_LEVEL_SHIFT(lvl))
+
 #define paddr_bits PADDR_BITS
 
 /* Get host p2m table */
@@ -229,6 +235,24 @@ static inline bool p2m_is_write_locked(struct p2m_domain *p2m)
 
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
index 8c6e8075f3..e34b1b674a 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -675,3 +675,16 @@ struct domain *page_get_owner_and_reference(struct page_info *page)
 
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
index 1577b09b15..a5ea61fe61 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -978,3 +978,189 @@ int map_regions_p2mt(struct domain *d,
 
     return rc;
 }
+
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
+    if ( (is_lower && gfn_x(gfn) < gfn_x(boundary)) ||
+         (!is_lower && gfn_x(gfn) > gfn_x(boundary)) )
+    {
+        for ( level = P2M_ROOT_LEVEL; level; level-- )
+        {
+            unsigned long mask = PFN_DOWN(P2M_LEVEL_MASK(level));
+
+            if ( (is_lower && ((gfn_x(gfn) & mask) < gfn_x(boundary))) ||
+                 (!is_lower && ((gfn_x(gfn) & mask) > gfn_x(boundary))) )
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
+
+    if ( valid )
+        *valid = false;
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
+                      gfn_x(gfn) & (BIT(P2M_LEVEL_ORDER(level), UL) - 1));
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
+        *page_order = P2M_LEVEL_ORDER(level);
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
+    mfn_t mfn;
+
+    p2m_read_lock(p2m);
+    mfn = p2m_lookup(p2m, gfn, t);
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


