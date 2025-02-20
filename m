Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0BFA3E2D2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 18:44:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894049.1302890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAat-0004X7-Di; Thu, 20 Feb 2025 17:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894049.1302890; Thu, 20 Feb 2025 17:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAat-0004SC-AW; Thu, 20 Feb 2025 17:44:15 +0000
Received: by outflank-mailman (input) for mailman id 894049;
 Thu, 20 Feb 2025 17:44:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkM0=VL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tlAas-000469-AA
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 17:44:14 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bb81d93-efb2-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 18:44:12 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-30918c29da2so12230761fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 09:44:12 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091e04742esm24070201fa.86.2025.02.20.09.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 09:44:11 -0800 (PST)
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
X-Inumbo-ID: 4bb81d93-efb2-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740073452; x=1740678252; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByMotOx+mg/tt181nsmiVauqar57S+pEhhwOboNaaQ8=;
        b=B7gzMial04Y3mZWHLUEyiVSQ0brjWMn+tStcQ65FhxmovpQVVSDYWik+Na1wYU7kvP
         mluIYJkgmKo237E5HhyphlAxdUMKQZbfMnMt+jeXVuf9Zo+j/KrMfNdpnsDN92c77hBC
         eKGRI/uII6pXyX5k6zc7VVd90AinRkL2+uJgcjaeSKXVu0JVy7lTmpiNz+hASVFAQQMY
         6JhXNuGQOrH2Bz3G06xKGJyLzKZBcuu2uk1tagsjrrqFt1PxUletE3WB9xv3J6vI/jtM
         UgRGdWRWLkd0MwU81StfK/QCf+iai5Pa2wg2U1bj2yNyPlrvXWN2g976jvPYSSe7hz5G
         UYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740073452; x=1740678252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByMotOx+mg/tt181nsmiVauqar57S+pEhhwOboNaaQ8=;
        b=lAPfBcH/ND4dnW4mU5gvqG8cfu0ZaLhUxhxDaISL2Z+JKJXeOXy9PiTAe2oIG2Itk4
         6Nm90ez5MA8RPaQ8GCwcF0CHD8ru/fkgbJXsfRyVbPUAKa0s9vYT4mCEtxSHvsCrKFaL
         0P1n6e8THYo2HoszfY/fjBBjkuBj7LKnoooyZTTG602WqqdpMIb8Ct43PP0U0BWWzQW6
         NC4qRNgaIhOA6+bBw1IKwfth9BrPDi+12Xo6rp+VW2jGlm6QgVwG87ThZNeavrHian7g
         qfe3HTNmy9AH06UF+vc6B4XT8CM3QEf+vp/kPQWvgi16p5SGxqcygfhE5QazrDY2ei0T
         Zrqw==
X-Gm-Message-State: AOJu0YzSkYnm4O4MaW2k69yGKv5j+LUAcvOEVG+IlzpLKv/GrfPIHB7v
	fvzMuIikwvMo0BqsnrN/4el1c9l7Y9ACDDukb3N5ayovaGFKUiU4z++kiA==
X-Gm-Gg: ASbGncutz8ZOS4O1Nm81q9SkP/3R4CSmQJPXWcEaJSJ6I2WCdGyq6wicVH9NQl12Zp1
	aCwsGq+CPUg2KjZU6LALXb/zRrm+gqCrD3Mz9s59kyYc7alweiybiWGUFEg2rqwutI3zqgMVpXE
	wDK1+Ahv9P2wXUH3PDzKH36dbaxFZue/FcvGNgWjCgudGzoztWnhAmhViWp2jvK8Ed1ezHVS0Vw
	CzRg94KM1Goz/8ZKMRnB/An4tKTUvSB8/wk2FBk6eiG5FjptOnyhi/s/EB1rCb7t7g2T3cFUcUx
	IKVKlh1IWG0UoOSW
X-Google-Smtp-Source: AGHT+IGHBhVfksM9PIJKumLtUoBrV8237hM6wnR7zxTsFdVqw59TzBcgY+ltZbxJMJLvaIObOSYZsw==
X-Received: by 2002:a2e:91c4:0:b0:308:eabd:298a with SMTP id 38308e7fff4ca-30a59898251mr72641fa.15.1740073451650;
        Thu, 20 Feb 2025 09:44:11 -0800 (PST)
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
Subject: [PATCH for 4.21 v5 3/3] xen/riscv: update mfn calculation in pt_mapping_level()
Date: Thu, 20 Feb 2025 18:44:04 +0100
Message-ID: <f474bdd1393d376111559fc5b7b01f035d52dd44.1739985805.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739985805.git.oleksii.kurochko@gmail.com>
References: <cover.1739985805.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When pt_update() is called with arguments (..., INVALID_MFN, ..., 0 or 1),
it indicates that a mapping is being destroyed/modifyed.

In the case when modifying or destroying a mapping, it is necessary to
search until a leaf node is found, instead of searching for a page table
entry based on the precalculated `level` and `order`(look at pt_update()).
This is because when `mfn` == INVALID_MFN, the `mask` (in pt_mapping_level())
will take into account only `vfn`, which could accidentally return an
incorrect level, leading to the discovery of an incorrect page table entry.

For example, if `vfn` is page table level 1 aligned, but it was mapped as
page table level 0, then pt_mapping_level() will return `level` = 1, since
only `vfn` (which is page table level 1 aligned) is taken into account when
`mfn` == INVALID_MFN (look at pt_mapping_level()).

Fixes: c2f1ded524 ("xen/riscv: page table handling")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v5:
- Rename *entry to *ptep in pt_update_entry().
- Fix code style issue in the comment.
- Move NULL check of pointer to `table` inside unmap_table and then drop
  it in pt_update_entry().
---
Changes in v4:
- Move defintion of local variable table inside `else` case as it is
  used only there.
- Change unmap_table(table) to unmap_table(entry) for unifying both
  cases when _pt_walk() is used and when pte is seached on the specified
  level.
- Initialize local variable `entry` to avoid compilation error caused by
  uninitialized variable.
---
Changes in v3:
- Drop ASSERT() for order as it isn't needed anymore.
- Drop PTE_LEAF_SEARCH and use instead level=CONFIG_PAGING_LEVELS;
  refactor connected code correspondingly.
- Calculate order once.
- Drop initializer for local variable order.
- Drop BUG_ON(!pte_is_mapping(*entry)) for the case when leaf searching
  happens as there is a similar check in pt_check_entry(). Look at
  pt.c:41 and pt.c:75.
---
Changes in v2:
 - Introduce PTE_LEAF_SEARCH to tell page table update operation to
   walk down to wherever the leaf entry is.
 - Use introduced PTE_LEAF_SEARCH to not searching pte_t entry twice.
 - Update the commit message.
---
 xen/arch/riscv/pt.c | 116 +++++++++++++++++++++++++++++---------------
 1 file changed, 78 insertions(+), 38 deletions(-)

diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index 9c1f8f6b55..518939b443 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -102,6 +102,9 @@ static pte_t *map_table(mfn_t mfn)
 
 static void unmap_table(const pte_t *table)
 {
+    if ( !table )
+        return;
+
     /*
      * During early boot, map_table() will not use map_domain_page()
      * but the PMAP.
@@ -245,14 +248,21 @@ pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
     return pte;
 }
 
-/* Update an entry at the level @target. */
+/*
+ * Update an entry at the level @target.
+ *
+ * If `target` == CONFIG_PAGING_LEVELS, the search will continue until
+ * a leaf node is found.
+ * Otherwise, the page table entry will be searched at the requested
+ * `target` level.
+ * For an example of why this might be needed, see the comment in
+ * pt_update() before pt_update_entry() is called.
+ */
 static int pt_update_entry(mfn_t root, vaddr_t virt,
-                           mfn_t mfn, unsigned int target,
+                           mfn_t mfn, unsigned int *target,
                            unsigned int flags)
 {
     int rc;
-    unsigned int level = HYP_PT_ROOT_LEVEL;
-    pte_t *table;
     /*
      * The intermediate page table shouldn't be allocated when MFN isn't
      * valid and we are not populating page table.
@@ -263,43 +273,50 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
      * combinations of (mfn, flags).
     */
     bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags & PTE_POPULATE);
-    pte_t pte, *entry;
-
-    /* convenience aliases */
-    DECLARE_OFFSETS(offsets, virt);
+    pte_t pte, *ptep = NULL;
 
-    table = map_table(root);
-    for ( ; level > target; level-- )
+    if ( *target == CONFIG_PAGING_LEVELS )
+        ptep = _pt_walk(virt, target);
+    else
     {
-        rc = pt_next_level(alloc_tbl, &table, offsets[level]);
-        if ( rc == XEN_TABLE_MAP_NOMEM )
+        pte_t *table;
+        unsigned int level = HYP_PT_ROOT_LEVEL;
+        /* Convenience aliases */
+        DECLARE_OFFSETS(offsets, virt);
+
+        table = map_table(root);
+        for ( ; level > *target; level-- )
         {
-            rc = -ENOMEM;
-            goto out;
+            rc = pt_next_level(alloc_tbl, &table, offsets[level]);
+            if ( rc == XEN_TABLE_MAP_NOMEM )
+            {
+                rc = -ENOMEM;
+                goto out;
+            }
+
+            if ( rc == XEN_TABLE_MAP_NONE )
+            {
+                rc = 0;
+                goto out;
+            }
+
+            if ( rc != XEN_TABLE_NORMAL )
+                break;
         }
 
-        if ( rc == XEN_TABLE_MAP_NONE )
+        if ( level != *target )
         {
-            rc = 0;
+            dprintk(XENLOG_ERR,
+                    "%s: Shattering superpage is not supported\n", __func__);
+            rc = -EOPNOTSUPP;
             goto out;
         }
 
-        if ( rc != XEN_TABLE_NORMAL )
-            break;
-    }
-
-    if ( level != target )
-    {
-        dprintk(XENLOG_ERR,
-                "%s: Shattering superpage is not supported\n", __func__);
-        rc = -EOPNOTSUPP;
-        goto out;
+        ptep = table + offsets[level];
     }
 
-    entry = table + offsets[level];
-
     rc = -EINVAL;
-    if ( !pt_check_entry(*entry, mfn, flags) )
+    if ( !pt_check_entry(*ptep, mfn, flags) )
         goto out;
 
     /* We are removing the page */
@@ -316,7 +333,7 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
             pte = pte_from_mfn(mfn, PTE_VALID);
         else /* We are updating the permission => Copy the current pte. */
         {
-            pte = *entry;
+            pte = *ptep;
             pte.pte &= ~PTE_ACCESS_MASK;
         }
 
@@ -324,12 +341,12 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
         pte.pte |= (flags & PTE_ACCESS_MASK) | PTE_ACCESSED | PTE_DIRTY;
     }
 
-    write_pte(entry, pte);
+    write_pte(ptep, pte);
 
     rc = 0;
 
  out:
-    unmap_table(table);
+    unmap_table(ptep);
 
     return rc;
 }
@@ -422,17 +439,40 @@ static int pt_update(vaddr_t virt, mfn_t mfn,
 
     while ( left )
     {
-        unsigned int order, level;
-
-        level = pt_mapping_level(vfn, mfn, left, flags);
-        order = XEN_PT_LEVEL_ORDER(level);
+        unsigned int order, level = CONFIG_PAGING_LEVELS;
 
-        ASSERT(left >= BIT(order, UL));
+        /*
+         * In the case when modifying or destroying a mapping, it is necessary
+         * to search until a leaf node is found, instead of searching for
+         * a page table entry based on the precalculated `level` and `order`
+         * (look at pt_update()).
+         * This is because when `mfn` == INVALID_MFN, the `mask`(in
+         * pt_mapping_level()) will take into account only `vfn`, which could
+         * accidentally return an incorrect level, leading to the discovery of
+         * an incorrect page table entry.
+         *
+         * For example, if `vfn` is page table level 1 aligned, but it was
+         * mapped as page table level 0, then pt_mapping_level() will return
+         * `level` = 1, since only `vfn` (which is page table level 1 aligned)
+         * is taken into account when `mfn` == INVALID_MFN
+         * (look at pt_mapping_level()).
+         *
+         * To force searching until a leaf node is found is necessary to have
+         * `level` == CONFIG_PAGING_LEVELS which is a default value for
+         * `level`.
+         *
+         * For other cases (when a mapping is not being modified or destroyed),
+         * pt_mapping_level() should be used.
+         */
+        if ( !mfn_eq(mfn, INVALID_MFN) || (flags & PTE_POPULATE) )
+            level = pt_mapping_level(vfn, mfn, left, flags);
 
-        rc = pt_update_entry(root, vfn << PAGE_SHIFT, mfn, level, flags);
+        rc = pt_update_entry(root, vfn << PAGE_SHIFT, mfn, &level, flags);
         if ( rc )
             break;
 
+        order = XEN_PT_LEVEL_ORDER(level);
+
         vfn += 1UL << order;
         if ( !mfn_eq(mfn, INVALID_MFN) )
             mfn = mfn_add(mfn, 1UL << order);
-- 
2.48.1


