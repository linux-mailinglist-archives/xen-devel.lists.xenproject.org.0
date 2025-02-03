Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1764A25A76
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 14:12:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880590.1290681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tewFN-00041Q-4t; Mon, 03 Feb 2025 13:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880590.1290681; Mon, 03 Feb 2025 13:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tewFN-0003yS-1q; Mon, 03 Feb 2025 13:12:17 +0000
Received: by outflank-mailman (input) for mailman id 880590;
 Mon, 03 Feb 2025 13:12:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2EM=U2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tewFL-0003kT-7t
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 13:12:15 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c4cc656-e230-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 14:12:14 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so44188805e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 05:12:14 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-190-108.w90-112.abo.wanadoo.fr. [90.112.153.108])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b574fsm12737179f8f.70.2025.02.03.05.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 05:12:12 -0800 (PST)
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
X-Inumbo-ID: 7c4cc656-e230-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738588333; x=1739193133; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiBe5bsV0kJrh/WNv5u+VjlusqPfI3FOI2X11zbF91U=;
        b=f4z0X7dgU2/oEGAszkGg348UxFgWf8NKRpbVQOk0/2oUan9u7nNBy6UTYT9KOsDcm3
         SG5uj4ftlK8gI227gRF8j5NiTt93tBIRXPIHsSL7N47uqcbT1tbIzG720Tt+Y7VBVjyT
         wetx2vWINdm5wZNVxnY203Y1AStBu0Y/kCgXtf5kcPzwVrLhCDdu9r0hqFBoJ4F2szgW
         mgiB6clCYAYoJFB3i4zPW7SVr/mdNxDC7N1Cix+yBVU3lcsXzVbmLRUldzrPW5VfftXf
         8MZn4bQRzbbw6LvyBFADRpP6F0d3vuMz+ScmsN12pyHWIxYhcHY/7cE2uusyqyF1NPnG
         Mcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738588333; x=1739193133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiBe5bsV0kJrh/WNv5u+VjlusqPfI3FOI2X11zbF91U=;
        b=Mw8ACAxQ+VuQPXpomZANnR86jG0S/L1wK0nL1HiOeUSdvkFFCE/WKHMroK0yA+M/rF
         8gKy72ozrNHw3ZmRUxpD3ZVR7DsSRSybOOtX0SexjgVvS9UzdUMU7fa+M8wdXutVoEBF
         EqKFMm4pQJ+WBFcF5wkm0iaRmILR1E6ebtssE04Zbp0qPYjWeF6u8pGxVyw8Us5Xfdc3
         WpythTJYZlyi/aTcZWQib78GziYm63LrcojIsq//ZloDgNav6mfhHExVjCXgukXuhQNv
         DFSRrJs9HJMm0aTC3n12bjblHsrZYzHVyHpveLHrvNIBqlmswHkGJ3xqKbkEmZ6R/AAJ
         Q7Rg==
X-Gm-Message-State: AOJu0YyGrqKbTa8RZOMePjuhHvKl9Tb/yuAzjTYfPtLV8jY5ie87zsbn
	4a/MNz+XheVXe6GkUDGOCN1R14Yf/036/lYTbr7LZuABLdYtTWefICNMSjyr
X-Gm-Gg: ASbGncvKzC8CdtdmaMRIeGXaEm1J+EFYRsQfMoweFsro9VnQXonmhA8qKHc2QpARQ4d
	3kHHCbVpJrPKkcHwxJyFxuXIVH/o77sNcNpv3T8Z6ODmZO9zoMvK8CiTysdrS3GHl1tl2fWTK2X
	EsmrZBbbCRwYf4ORevipGkZWOvk6p9WAopmAIqcGUss7PHNrokzLwCFZxa7ONrg4aKxgMK8nnrs
	PNBO1XMODAbzd/wxj75Vd/KIzI6yVJyhge4xu5ewunP9XZcMnzX4OrdZyJ3Yu1PrlIjwAO0AXsX
	zpiBKPJR0DNgcaj9RZS0qnFgqk+E82ckK+4MRUCO5P+lbx4bn3HK7L65uTMI6MQiG1PYtoKFsc3
	6V2mDRx8V
X-Google-Smtp-Source: AGHT+IFl2kNLx1m7MWY3jGR2rzn7IL/xF8DWl0CL1yD1hQ3UQvASIepy8MlJF2V6sPF7gPybVE5q8A==
X-Received: by 2002:a5d:6d02:0:b0:385:f560:7924 with SMTP id ffacd0b85a97d-38c5194d0b6mr15342408f8f.4.1738588333047;
        Mon, 03 Feb 2025 05:12:13 -0800 (PST)
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
Subject: [PATCH v2 for 4.20? 1/3] xen/riscv: implement software page table walking
Date: Mon,  3 Feb 2025 14:12:02 +0100
Message-ID: <a4f0b312351e5f6a9e57f50ebbc3bda8a72c18bb.1738587493.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738587493.git.oleksii.kurochko@gmail.com>
References: <cover.1738587493.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V doesn't have hardware feature to ask MMU to translate
virtual address to physical address ( like Arm has, for example ),
so software page table walking is implemented.

As pte_walk() returns pte_t and it requires inclusion of <asm/page.h>
in <asm/mm.h>, the following compilation started to occur after this
inclusion:
- implicit declaration of function 'GENMASK'. To resolve this, <xen/bitops.h>
  needs to be included at the top of <asm/cmpxchg.h>.
- implicit declaration of map_domain_page() and unmap_domain_page(). This issue
  arises because, after including <asm/page.h> in <asm/mm.h>, we could have the
  following hierarchy if someone decides to include <xen/domain.h>:
    <xen/domain_page.h>
      <xen/mm.h>
        <asm/mm.h>
          <asm/page.h>
            <xen/domain_page.h>
            ...
            flush_to_ram() which uses {un}map_domain_page() <---
            ...
    Declaration of {un}map_domain_page() happens here <---

    To avoid this compilation issue, definition of flush_to_ram() is moved to
    mm.c.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Update the code of pt_walk() to return pte_t instead of paddr_t.
 - Fix typos and drop blankets inside parentheses in the comment.
 - Update the `ret` handling; there is no need for `mfn` calculation
   anymore as pt_walk() returns or pte_t of a leaf node or non-present
   pte_t.
 - Drop the comment before unmap_table().
 - Drop local variable `pa` as pt_walk() is going to return pte_t
   instead of paddr_t.
 - Add the comment above pt_walk() to explain what it does and returns.
 - Add additional explanation about possible return values of pt_next_level()
   used inside while loop in pt_walk().
 - Change `pa` to `table` in the comment before while loop in pt_walk()
   as actually this loop finds a page table where paga table entry for `va`
   is located.
 - After including <asm/page.h> in <asm/mm.h>, the following compilation
   error occurs:
    ./arch/riscv/include/asm/cmpxchg.h:56:9: error: implicit declaration of
    function 'GENMASK'
   To resolve this, <xen/bitops.h> needs to be included at the top of
   <asm/cmpxchg.h>.
 - To avoid an issue with the implicit declaration of map_domain_page() and
   unmap_domain_page() after including <asm/page.h> in <asm/mm.h>, the
   implementation of flush_page_to_ram() has been moved to mm.c. (look for
   more detailed explanation in the commit message) As a result drop
   inclusion of <xen/domain.h> in <asm/page.h>.
 - Update the commit message
---
 xen/arch/riscv/include/asm/cmpxchg.h |  1 +
 xen/arch/riscv/include/asm/mm.h      |  4 ++
 xen/arch/riscv/include/asm/page.h    | 14 +------
 xen/arch/riscv/mm.c                  | 14 +++++++
 xen/arch/riscv/pt.c                  | 55 ++++++++++++++++++++++++++++
 5 files changed, 75 insertions(+), 13 deletions(-)

diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
index 662d3fd5d4..4cfe5927b7 100644
--- a/xen/arch/riscv/include/asm/cmpxchg.h
+++ b/xen/arch/riscv/include/asm/cmpxchg.h
@@ -4,6 +4,7 @@
 #ifndef ASM__RISCV__CMPXCHG_H
 #define ASM__RISCV__CMPXCHG_H
 
+#include <xen/bitops.h>
 #include <xen/compiler.h>
 #include <xen/lib.h>
 
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 292aa48fc1..10a15a8b03 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -156,6 +156,10 @@ static inline struct page_info *virt_to_page(const void *v)
     return frametable_virt_start + PFN_DOWN(va - directmap_virt_start);
 }
 
+#include <asm/page.h>
+
+pte_t * pt_walk(vaddr_t va, unsigned int *pte_level);
+
 /*
  * Common code requires get_page_type and put_page_type.
  * We don't care about typecounts so we just do the minimum to make it
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 7a6174a109..b9076173f4 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -7,7 +7,6 @@
 
 #include <xen/bug.h>
 #include <xen/const.h>
-#include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/types.h>
 
@@ -177,18 +176,7 @@ static inline void invalidate_icache(void)
 #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
 #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
 
-static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
-{
-    const void *v = map_domain_page(_mfn(mfn));
-
-    if ( clean_and_invalidate_dcache_va_range(v, PAGE_SIZE) )
-        BUG();
-
-    unmap_domain_page(v);
-
-    if ( sync_icache )
-        invalidate_icache();
-}
+void flush_page_to_ram(unsigned long mfn, bool sync_icache);
 
 /* Write a pagetable entry. */
 static inline void write_pte(pte_t *p, pte_t pte)
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index f2bf279bac..32574c879b 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -3,6 +3,7 @@
 #include <xen/bootfdt.h>
 #include <xen/bug.h>
 #include <xen/compiler.h>
+#include <xen/domain_page.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
 #include <xen/libfdt/libfdt.h>
@@ -564,3 +565,16 @@ void *__init arch_vmap_virt_end(void)
 {
     return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
 }
+
+void flush_page_to_ram(unsigned long mfn, bool sync_icache)
+{
+    const void *v = map_domain_page(_mfn(mfn));
+
+    if ( clean_and_invalidate_dcache_va_range(v, PAGE_SIZE) )
+        BUG();
+
+    unmap_domain_page(v);
+
+    if ( sync_icache )
+        invalidate_icache();
+}
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index a703e0f1bd..2a5a191a70 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -274,6 +274,61 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
     return rc;
 }
 
+/*
+ * pt_walk() performs software page table walking and returns the pte_t of
+ * a leaf node or the leaf-most not-present pte_t if no leaf node is found
+ * for further analysis.
+ * Additionally, pt_walk() returns the level of the found pte.
+ */
+pte_t * pt_walk(vaddr_t va, unsigned int *pte_level)
+{
+    const mfn_t root = get_root_page();
+    /*
+     * In pt_walk() only XEN_TABLE_MAP_NONE and XEN_TABLE_SUPER_PAGE are
+     * handled (as they are only possible for page table walking), so
+     * initialize `ret` with "impossible" XEN_TABLE_MAP_NOMEM.
+     */
+    int ret = XEN_TABLE_MAP_NOMEM;
+    unsigned int level = HYP_PT_ROOT_LEVEL;
+    pte_t *table;
+
+    DECLARE_OFFSETS(offsets, va);
+
+    table = map_table(root);
+
+    /*
+     * Find `table` of an entry which corresponds to `va` by iterating for each
+     * page level and checking if the entry points to a next page table or
+     * to a page.
+     *
+     * Two cases are possible:
+     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was find;
+     *   (Despite the name) XEN_TABLE_SUPER_PAGE also covers 4K mappings. If
+     *   pt_next_level() is called for page table level 0, it results in the
+     *   entry being a pointer to a leaf node, thereby returning
+     *   XEN_TABLE_SUPER_PAGE, despite of the fact this leaf covers 4k mapping.
+     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
+     *   mapped.
+     */
+    while ( (ret != XEN_TABLE_MAP_NONE) && (ret != XEN_TABLE_SUPER_PAGE) )
+    {
+        /*
+         * This case shouldn't really occur as it will mean that for table
+         * level 0 a pointer to next page table has been written, but at
+         * level 0 it could be only a pointer to 4k page.
+         */
+        ASSERT(level <= HYP_PT_ROOT_LEVEL);
+
+        ret = pt_next_level(false, &table, offsets[level]);
+        level--;
+    }
+
+    if ( pte_level )
+        *pte_level = level + 1;
+
+    return table + offsets[level + 1];
+}
+
 /* Return the level where mapping should be done */
 static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
                             unsigned int flags)
-- 
2.48.1


