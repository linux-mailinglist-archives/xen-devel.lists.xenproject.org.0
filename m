Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63376A25A75
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 14:12:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880592.1290701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tewFP-0004Sc-JV; Mon, 03 Feb 2025 13:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880592.1290701; Mon, 03 Feb 2025 13:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tewFP-0004R1-En; Mon, 03 Feb 2025 13:12:19 +0000
Received: by outflank-mailman (input) for mailman id 880592;
 Mon, 03 Feb 2025 13:12:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2EM=U2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tewFO-00041c-Bx
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 13:12:18 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d8cde81-e230-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 14:12:16 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso29922515e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 05:12:16 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-190-108.w90-112.abo.wanadoo.fr. [90.112.153.108])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b574fsm12737179f8f.70.2025.02.03.05.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 05:12:14 -0800 (PST)
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
X-Inumbo-ID: 7d8cde81-e230-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738588336; x=1739193136; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kum80qMHQ1iOJY0jxjVV18JPJf4BZ7CxJk4FbacXJnQ=;
        b=jzOBKm3gk5gc/tPzyqGxjggKP0KQhWHAo/KXEQzr/Nw8rvDBXERW8+asNvtPQP5WRg
         baynUxYS1nLZzzr0acNdCgXKGbv4TPPNF5Rz9o1dsQgSVnjSfP6AVR8l9cs6Nj5c1MYq
         ZhkDEdoYirNdj7TqlynpwsaEkkyYgqm0IAk4Nni/ErpKHuEfSw9PNcUMNf9JbkTzqaQd
         r028cOnGSesIHnDee0RJBu706TxdtaL6y9xaXdDO4rzWyxw5iSwneFfdiAB9TXfCbFyj
         2GeIl4GNa7CLmDNTWAAo/1SCAWRdKXfMLhvbqJdqIGFFpB2jjUUb6C2/EtdYDJBwjI6Z
         Mnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738588336; x=1739193136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kum80qMHQ1iOJY0jxjVV18JPJf4BZ7CxJk4FbacXJnQ=;
        b=CnH3mZ9AX87nsHy0sBbVV5FxkDR8QKfqU1LJiARAVp41G4KC+u0cvPb6q5h5S3qosd
         uyLzq7cVfGfyRkUBox6T4a5zNx0jc2uwS4s7cYmYaXTEp4wizMHy2ngQ4uWJGlF9n2mg
         fC69BMF4SYFm3WN1lWZH44AXw0sBj6BNCTrJAbiJ6/Zp8xo3IaIkLBGgk02nb9ouyu3f
         LNfe3L7t6ciF+o8qNulbWXP1eB1Zw4nS4SK7ZuOA71WeYBeXAnqUtbV6KC3xIiDkk2zz
         CsNwqdR0hUGMJJh0UsBJ/2zeasteQMtYjUWkdwjO0o/NAymgebA0fJb9v/tZmKbScQSx
         l4kg==
X-Gm-Message-State: AOJu0YwwI2zl/fSaorX06BCdQ4wV1u2vzVxYmAZ4UayKuRJgoseXbT7m
	WC+YugPs6ukZFJTj+bZFgKdb+7oQDRDzvLXvr2Nj6x5fPhhGr0YslX8tsMoF
X-Gm-Gg: ASbGnctkenN0fcJXT8wj0mXvd8i+WNhBoQEcg6IXoSslX+Te7KnVTArPUKmYAIsGqOW
	Q9/MM/X/9WG1jQjGuLMN6m3GChGejo3R3GknXS4fU8jbz3bsCjwxtR4rYp1VrkdB+POV1Z2DfJo
	w+MEokYrsSe9c7N+h7+hjJM8N+tGr+gzytmr7s2Yjgq8Dcoj1PE0tD1FPMaKq/oRYEfSLmGj28I
	6RWc5+AcMvzDKvPeq+JkWRfVY6c5mkECAkqZN+0Xu/fxf3meHqDV6SfLKX0mUP/ghMSuXsSy+NR
	U0Kf6SZzbiXexYUI6rdf1JNp3FhTKCKwG5+MKNcJAbHUlVhyA9cnWbV0hYDxuquEjPviatkqSx9
	YKRyW61D4
X-Google-Smtp-Source: AGHT+IGaUTMQCpS492+z1yD9Tv4b5bylcmDTm9uBymDlKr/uELuEEYiNpvVdpokGLKeJLx7zK2kRbQ==
X-Received: by 2002:a05:6000:18a5:b0:385:ee59:44f1 with SMTP id ffacd0b85a97d-38c5195e77emr18551620f8f.20.1738588335328;
        Mon, 03 Feb 2025 05:12:15 -0800 (PST)
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
Subject: [PATCH v2 3/3] xen/riscv: update mfn calculation in pt_mapping_level()
Date: Mon,  3 Feb 2025 14:12:04 +0100
Message-ID: <133526ddccc22ab39dd6841038157d48bd35da81.1738587493.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738587493.git.oleksii.kurochko@gmail.com>
References: <cover.1738587493.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When pt_update() is called with arguments (..., INVALID_MFN, ..., 0 or 1),
it indicates that a mapping is being destroyed/modifyed.

In the case when modifying or destroying a mapping, it is necessary to
search until a leaf node is found, instead of searching for a page table
entry based on the precalculated `level` and `order` returned from pt_update().
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
Changes in v2:
 - Introduce PTE_LEAF_SEARCH to tell page table update operation to
   walk down to wherever the leaf entry is.
 - Use introduced PTE_LEAF_SEARCH to not searching pte_t entry twice.
 - Update the commit message.
---
 xen/arch/riscv/include/asm/page.h | 16 ++++++
 xen/arch/riscv/pt.c               | 87 +++++++++++++++++++------------
 2 files changed, 69 insertions(+), 34 deletions(-)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index b9076173f4..72d29376bc 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -55,6 +55,22 @@
 #define PTE_SMALL       BIT(10, UL)
 #define PTE_POPULATE    BIT(11, UL)
 
+/*
+ * In the case when modifying or destroying a mapping, it is necessary to
+ * search until a leaf node is found, instead of searching for a page table
+ * entry based on the precalculated `level` and `order` (look at pt_update()).
+ * This is because when `mfn` == INVALID_MFN, the `mask`(in pt_mapping_level())
+ * will take into account only `vfn`, which could accidentally return an
+ * incorrect level, leading to the discovery of an incorrect page table entry.
+ *
+ * For example, if `vfn` is page table level 1 aligned, but it was mapped as
+ * page table level 0, then pt_mapping_level() will return `level` = 1,
+ * since only `vfn` (which is page table level 1 aligned) is taken into account
+ * when `mfn` == INVALID_MFN (look at pt_mapping_level()).
+ */
+
+#define PTE_LEAF_SEARCH BIT(12, UL)
+
 #define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
 
 /* Calculate the offsets into the pagetables for a given VA */
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index 2a5a191a70..9db41eac53 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -187,11 +187,10 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
 
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
@@ -205,39 +204,48 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
     bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags & PTE_POPULATE);
     pte_t pte, *entry;
 
-    /* convenience aliases */
-    DECLARE_OFFSETS(offsets, virt);
-
-    table = map_table(root);
-    for ( ; level > target; level-- )
+    if ( flags & PTE_LEAF_SEARCH )
     {
-        rc = pt_next_level(alloc_tbl, &table, offsets[level]);
-        if ( rc == XEN_TABLE_MAP_NOMEM )
+        entry = pt_walk(virt, target);
+        BUG_ON(!pte_is_mapping(*entry));
+    }
+    else
+    {
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
+        entry = table + offsets[level];
     }
 
-    if ( level != target )
-    {
-        dprintk(XENLOG_ERR,
-                "%s: Shattering superpage is not supported\n", __func__);
-        rc = -EOPNOTSUPP;
-        goto out;
-    }
-
-    entry = table + offsets[level];
-
     rc = -EINVAL;
     if ( !pt_check_entry(*entry, mfn, flags) )
         goto out;
@@ -345,9 +353,6 @@ static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
         return level;
 
     /*
-     * Don't take into account the MFN when removing mapping (i.e
-     * MFN_INVALID) to calculate the correct target order.
-     *
      * `vfn` and `mfn` must be both superpage aligned.
      * They are or-ed together and then checked against the size of
      * each level.
@@ -415,19 +420,33 @@ static int pt_update(vaddr_t virt, mfn_t mfn,
 
     spin_lock(&pt_lock);
 
-    while ( left )
+    /* look at the comment above the definition of PTE_LEAF_SEARCH */
+    if ( mfn_eq(mfn, INVALID_MFN) && !(flags & PTE_POPULATE) )
     {
-        unsigned int order, level;
+        flags |= PTE_LEAF_SEARCH;
+    }
 
-        level = pt_mapping_level(vfn, mfn, left, flags);
-        order = XEN_PT_LEVEL_ORDER(level);
+    while ( left )
+    {
+        unsigned int order = 0, level;
 
-        ASSERT(left >= BIT(order, UL));
+        if ( !(flags & PTE_LEAF_SEARCH) )
+        {
+            level = pt_mapping_level(vfn, mfn, left, flags);
+            order = XEN_PT_LEVEL_ORDER(level);
+            ASSERT(left >= BIT(order, UL));
+        }
 
-        rc = pt_update_entry(root, vfn << PAGE_SHIFT, mfn, level, flags);
+        rc = pt_update_entry(root, vfn << PAGE_SHIFT, mfn, &level, flags);
         if ( rc )
             break;
 
+        if ( flags & PTE_LEAF_SEARCH )
+        {
+            order = XEN_PT_LEVEL_ORDER(level);
+            ASSERT(left >= BIT(order, UL));
+        }
+
         vfn += 1UL << order;
         if ( !mfn_eq(mfn, INVALID_MFN) )
             mfn = mfn_add(mfn, 1UL << order);
-- 
2.48.1


