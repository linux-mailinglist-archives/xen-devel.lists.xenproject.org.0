Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F6EA2C353
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 14:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883670.1293620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgOAj-000072-Nk; Fri, 07 Feb 2025 13:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883670.1293620; Fri, 07 Feb 2025 13:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgOAj-0008Ul-Is; Fri, 07 Feb 2025 13:13:29 +0000
Received: by outflank-mailman (input) for mailman id 883670;
 Fri, 07 Feb 2025 13:13:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4G/=U6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tgOAi-0008Md-Um
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 13:13:28 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51c13b04-e555-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 14:13:27 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5de38c3d2acso2371624a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 05:13:27 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab794d96481sm19759666b.154.2025.02.07.05.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 05:13:25 -0800 (PST)
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
X-Inumbo-ID: 51c13b04-e555-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738934007; x=1739538807; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S94d57Wmr71Llwx4AHp+ArbUnvlYxF3SDWP4jvX1jYI=;
        b=fGhWFoG/LIvP74jugOnCuvBoiZB4WdBIQetJxcsNEJmOhPAKI6NI0VaZ8TqxwJArWQ
         vJYrDgqDMU8zrn3d3ICyguN+aD1CMuZ5cY7pjcXL7QvAwz0V0PCXtGzdT9fkhDv4ckBv
         9KIwBdXPNRQpARPMsumc0KkDcb1znyrRRKkHsCqcbHMd2LrtaESlztcDYiQTRf5YXHrF
         HNyexpYXNHU5IGZvzv8mDI9WhY0uA6ObXAl5S3GC8z7yP7wI/d5yq9+QiYbAxPLn0LD5
         95BKrowmRTmzs4f/Jp9a8kUX4DKeBd3Kam7dAbCkJNGhGl1V55YjnqYU82hN0FpbX8mM
         /WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738934007; x=1739538807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S94d57Wmr71Llwx4AHp+ArbUnvlYxF3SDWP4jvX1jYI=;
        b=nm646Fh2y2M3GosR7yojdleDTVu93sXpNXi0u5q+vql125Cm2d1/xcRKF+FR6NIZ5O
         xOR14wIMSAhXb4OvJgM7NKnZdAhlsJMBnY+P7hZm0O2aTxoFnuHEIpFHAw1QlzDp4uw1
         Qs9laHusP8QODbSagWRnEQn1z+vxxvGB66Xi4YZukULbtbUPa8pbqNJMIvqoko3qGsEm
         eR8WkBtSnnqTg5/2wMKDl+LeAtE+vOWpWuYLCz/vwWQT+Hpd/njRrRpx/mzDTy+jslJc
         JYZK+Kkc1FD4K9KWqf1H2CoGVCNgYTepEKzc6KkZtOxfGxyaGjEWKXw9vEylZZAKalDW
         J1Ng==
X-Gm-Message-State: AOJu0YygTZAt6GfEAHfw7+caolJCur3eFr6ygjE3WiZYo071F0wwxMBA
	ybgHyfbHCBjzVhqK4lLci0bZdH7/hR0uvlBB29ZF0Gu9RVk6m87lT5ZxaA==
X-Gm-Gg: ASbGncvzHh/yjPg14XnAtO9o690RuZOIHZngIw+vMSYGmhFr44DT9flnXGoFi+3/HaL
	y95Herjt3JN9sYnwS5CdcKIJBy8XAmOGt4YQskGBVU+LoYhTOdeBZpujP0tEzF4Ue1XRKoQzsgp
	TvIXygNMUvDhWKAGnYy986czlobWzm6euEBdBQPNVbfJLfeleaC/Uqfuq6ZuSqqwItN1mInKHXY
	8SFAWb4/gPdaAjMX+i2aM41dreN6ZEOquAvGkvpHfQ7ryFXp68S3WnzWt+J4vFlO4QygY0NxaFp
	KlYEhgmQVKDYCIYN
X-Google-Smtp-Source: AGHT+IF/9T0x9u+t6xzP7RNuwJ++2PxWzEYX3tEAbyO7Z+EJ7scpuGgSrIh7Ku6gtmSXOZLeDAGqFA==
X-Received: by 2002:a17:907:2d13:b0:ab7:5a5f:115 with SMTP id a640c23a62f3a-ab789c87e6amr349438066b.49.1738934006269;
        Fri, 07 Feb 2025 05:13:26 -0800 (PST)
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
Subject: [PATCH for 4.20? v3 3/3] xen/riscv: update mfn calculation in pt_mapping_level()
Date: Fri,  7 Feb 2025 14:13:20 +0100
Message-ID: <0290ae707cdd98d57714afb9bc4c3386683c1190.1738933678.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738933678.git.oleksii.kurochko@gmail.com>
References: <cover.1738933678.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/pt.c | 90 +++++++++++++++++++++++++++++----------------
 1 file changed, 59 insertions(+), 31 deletions(-)

diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index 66cb976b55..8c15a48f60 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -238,11 +238,10 @@ pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
 
 /* Update an entry at the level @target. */
 static int pt_update_entry(mfn_t root, vaddr_t virt,
-                           mfn_t mfn, unsigned int target,
+                           mfn_t mfn, unsigned int *target,
                            unsigned int flags)
 {
     int rc;
-    unsigned int level = HYP_PT_ROOT_LEVEL;
     pte_t *table;
     /*
      * The intermediate page table shouldn't be allocated when MFN isn't
@@ -256,39 +255,45 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
     bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags & PTE_POPULATE);
     pte_t pte, *entry;
 
-    /* convenience aliases */
-    DECLARE_OFFSETS(offsets, virt);
-
-    table = map_table(root);
-    for ( ; level > target; level-- )
+    if ( *target == CONFIG_PAGING_LEVELS )
+        entry = _pt_walk(virt, target);
+    else
     {
-        rc = pt_next_level(alloc_tbl, &table, offsets[level]);
-        if ( rc == XEN_TABLE_MAP_NOMEM )
+        unsigned int level = HYP_PT_ROOT_LEVEL;
+        /* convenience aliases */
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
+        entry = table + offsets[level];
     }
 
-    entry = table + offsets[level];
-
     rc = -EINVAL;
     if ( !pt_check_entry(*entry, mfn, flags) )
         goto out;
@@ -413,17 +418,40 @@ static int pt_update(vaddr_t virt, mfn_t mfn,
 
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


