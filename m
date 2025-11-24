Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAF2C808C8
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:46:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170786.1495848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVxF-0007MB-6r; Mon, 24 Nov 2025 12:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170786.1495848; Mon, 24 Nov 2025 12:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVxF-0007J2-2c; Mon, 24 Nov 2025 12:46:05 +0000
Received: by outflank-mailman (input) for mailman id 1170786;
 Mon, 24 Nov 2025 12:46:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVm3-0001zv-Sh
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:32 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb6e93d1-c931-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:34:29 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-64166a57f3bso6432518a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:28 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:27 -0800 (PST)
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
X-Inumbo-ID: eb6e93d1-c931-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987668; x=1764592468; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tf5y07G66yfKIys8t+ppjceci1h5NAJ62qn07uM+gc=;
        b=htyE3W/mxxG+V91RGAZfNlN+3XdbN2Mo8j7Vd5P1TQTgQaoPXzAA/B4sKDzdEJJw2a
         aM3sdONAOk9t0IMvK+9vwzFAAWIGyBYkhCiesFZy6zYgWscTUQqjkPO6o9uDogY6lkmt
         A29vxaL2ALu7WBpxoLaenpB8ECMkFAX46aj6uByw8vapl5beM5eGZodXQTqpXqEfFM30
         F0gfeEJVQdoxnj+BoQm/JujhBpJRdZrHzAp5w8KZPQmpSanIlEUyXzPzSJjJoY+/3868
         +KpLaEdnb+MD+LSvldx9yO2to5WIVvtbLdRR8B00iuVvfdzMyR/6v6P/u0IRxQlmDuH8
         D0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987668; x=1764592468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1tf5y07G66yfKIys8t+ppjceci1h5NAJ62qn07uM+gc=;
        b=f2Az7y2oVUFeLMyK2y5g+jhI5foJt23Nur7qEWCA7rA8evxbZAPwDXtN2HBPZ6IrE2
         6Brt/E81SgAWhI6uO5dufJ2jTbQf83rRm6ChoNOwXOXxY+RAEjAzmcVeKlJS7oQd0LiB
         JZtY7btb0rwohyPtGMJNEv74sexfknkPlq+4Eombs9Hu5Xhxy2nxQwRARVfZPfOJv5Bg
         EqwLToX+EdQODb7Rf0QYb4MnpzvLFekaO9BC6STTLvKjjaCxeEKAnc7CtCIgz56x/DXR
         v0LnljwS2GBderzWGjmjQnMtpQKM0ClukPNPmV8bp6caIDOiQECp7enJMCE979vACCDN
         ReRA==
X-Gm-Message-State: AOJu0Yx6IvyHL1+F5kGCAxe+FKhpi9pWtuWfjVSK7DxwHqLk7Ld2T17L
	i7ClVumkS9sON9NylURKPipzlmgNajs0HNzKyF8ZqzB7k2O0L+trC0Tq7JdMPTWa
X-Gm-Gg: ASbGncvnKGvk85Rw4H53Q+4X8xaiVz5RlIx0kebiwfs92aN5CmQiqz8m+Cu+u73roNm
	I4xBcH1YOV3JOw+LlW3BxqYHDW5vB3SsQr9tHrtqqgvRwaf7UpWlWCEWkd2g2Gs00YmyG9lVV8e
	SxyLDPjmc6ti9dDJKKSc9+wmUNGQzvOCi2zPgQM5JOuPewtlTu57M4xD9igzWacWh/fGZOjQePL
	i5QtbTP5DK10abpW5BEP57D3vCidloCVxAc9s9DwDwNY9rtIYlDDKJzF388TrjdxliPSABtQBer
	8XUnGgdGw38qoEo4G0dbjXVYkSU+c0kUt7oKlDGLf2VmMqhBrml61AzbVKxo/ZPIpMGJBCiHt8i
	cZEpd43ZwpTi//QFLIDwLPKJ2NiLLdDuAnsBrS64jZ7fpf0f+n5nGRGcKuoTYJ8lhcusi2I99Jp
	wjiRy+5/QeFCrwNW0sEZ9M4kO7Sr/2BLwAXvuwOU6wT+G502JKUUXDIsUhtzAiJJ1T8g==
X-Google-Smtp-Source: AGHT+IFf5uJB9I56FaCOR4OJFITJ+cq2dcNL5nOk1Op21qlMLVT2d/W8fMntpHHZJ+nDgZ++iGq61A==
X-Received: by 2002:a17:907:d8f:b0:b70:ac7a:2a93 with SMTP id a640c23a62f3a-b7671865badmr1272975466b.43.1763987668044;
        Mon, 24 Nov 2025 04:34:28 -0800 (PST)
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
Subject: [PATCH v6 18/19] xen/riscv: add support of page lookup by GFN
Date: Mon, 24 Nov 2025 13:33:51 +0100
Message-ID: <48a58cde3de6a459885465c6d29d00d046ae4a37.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
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
Changes in V6:
 - Move if-condition with initialization up in p2m_get_page_from_gfn().
 - Pass p2mt to the call of p2m_get_entry() inside p2m_get_page_from_gfn()
   to avoid an issue when 't' is passed NULL. With p2mt passed to p2m_get_entry()
   we will recieve a proper type and so the rest of the function will able to
   continue use a proper type.
- In check_outside_boundary() in the case when is_lower == true fill the bottom
  bits of masked_gfn with all 1s.
- Update code of check_outside_boundary() to return proper level in the case when
  `level` is equal to 0.
- Add ASSERT(p2m) in check_outside_boundary() to be sure that p2m isn't NULL as
  P2M_LEVEL_MASK() depends on p2m value.
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

 xen/arch/riscv/include/asm/p2m.h |  21 ++++
 xen/arch/riscv/mm.c              |  13 +++
 xen/arch/riscv/p2m.c             | 183 +++++++++++++++++++++++++++++++
 3 files changed, 217 insertions(+)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index b48693a2b4..f63b5dec99 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -41,6 +41,9 @@
 
 #define P2M_GFN_LEVEL_SHIFT(lvl) (P2M_LEVEL_ORDER(lvl) + PAGE_SHIFT)
 
+#define P2M_LEVEL_MASK(p2m, lvl) \
+    (P2M_TABLE_OFFSET(p2m, lvl) << P2M_GFN_LEVEL_SHIFT(lvl))
+
 #define paddr_bits PADDR_BITS
 
 /* Get host p2m table */
@@ -234,6 +237,24 @@ static inline bool p2m_is_write_locked(struct p2m_domain *p2m)
 
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
index b29c0a220a..c356200fc6 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1061,3 +1061,186 @@ int map_regions_p2mt(struct domain *d,
 
     return rc;
 }
+
+/*
+ * p2m_get_entry() should always return the correct order value, even if an
+ * entry is not present (i.e. the GFN is outside the range):
+ *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]    (1)
+ *
+ * This ensures that callers of p2m_get_entry() can determine what range of
+ * address space would be altered by a corresponding p2m_set_entry().
+ * Also, it would help to avoid costly page walks for GFNs outside range (1).
+ *
+ * Therefore, this function returns true for GFNs outside range (1), and in
+ * that case the corresponding level is returned via the level_out argument.
+ * Otherwise, it returns false and p2m_get_entry() performs a page walk to
+ * find the proper entry.
+ */
+static bool check_outside_boundary(const struct p2m_domain *p2m, gfn_t gfn,
+                                   gfn_t boundary, bool is_lower,
+                                   unsigned int *level_out)
+{
+    unsigned int level = P2M_ROOT_LEVEL(p2m);
+    bool ret = false;
+
+    ASSERT(p2m);
+
+    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
+                  : gfn_x(gfn) > gfn_x(boundary) )
+    {
+        unsigned long mask = 0;
+
+        for ( ; level; level-- )
+        {
+            unsigned long masked_gfn;
+
+            mask |= PFN_DOWN(P2M_LEVEL_MASK(p2m, level));
+            masked_gfn = gfn_x(gfn) & mask;
+            masked_gfn |= (is_lower * (BIT(P2M_LEVEL_ORDER(level), UL) - 1));
+
+            if ( is_lower ? masked_gfn < gfn_x(boundary)
+                          : masked_gfn > gfn_x(boundary) )
+                break;
+        }
+
+        ret = true;
+    }
+
+    if ( level_out )
+        *level_out = level;
+
+    return ret;
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
+    P2M_BUILD_LEVEL_OFFSETS(p2m, offsets, gfn_to_gaddr(gfn));
+
+    ASSERT(p2m_is_locked(p2m));
+
+    if ( t )
+        *t = p2m_invalid;
+
+    if ( check_outside_boundary(p2m, gfn, p2m->lowest_mapped_gfn, true,
+                                &level) )
+        goto out;
+
+    if ( check_outside_boundary(p2m, gfn, p2m->max_mapped_gfn, false, &level) )
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
+        level = P2M_ROOT_LEVEL(p2m);
+        goto out;
+    }
+
+    for ( level = P2M_ROOT_LEVEL(p2m); level; level-- )
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
+    p2m_type_t p2mt;
+    mfn_t mfn;
+
+    p2m_read_lock(p2m);
+    mfn = p2m_get_entry(p2m, gfn, &p2mt, NULL);
+
+    if ( t )
+        *t = p2mt;
+
+    if ( !mfn_valid(mfn) )
+    {
+        p2m_read_unlock(p2m);
+        return NULL;
+    }
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
2.51.1


