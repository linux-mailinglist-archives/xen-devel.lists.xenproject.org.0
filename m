Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB9EB17488
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:02:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065984.1431366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVjh-00040Q-V7; Thu, 31 Jul 2025 16:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065984.1431366; Thu, 31 Jul 2025 16:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVjh-0003xE-Rx; Thu, 31 Jul 2025 16:02:29 +0000
Received: by outflank-mailman (input) for mailman id 1065984;
 Thu, 31 Jul 2025 16:02:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVgG-0001FB-SC
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:56 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42c038b9-6e27-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:58:55 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-55b797ad392so1255418e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:55 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:52 -0700 (PDT)
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
X-Inumbo-ID: 42c038b9-6e27-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977534; x=1754582334; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC83dOB30X6PShO+Qx3bRZ1eAKfCHiOihl7DCHI89Rg=;
        b=DuxV2xYlMgqCAdu1QlrUMqrMaEJyw222kGBSWFdnu2kK/bBgmfJhJjKuP+9ZCtcbL4
         mjdKDFMpinZWeeAIJ3lVsdaVNvLuRqtjGMTvP2AFFd6B5BXU0dotAv4CFwap4xeP4aXH
         GCoyGUXgh90/3ICyXwd6g+EmO22ywThpdenqu5updfRHShuH4El/qlxra4a6sH+8Zirp
         /4rLA7q47Ww9hIiWROqa8sakIdaV1gDJ+hnLcpVX9EGC9rVlRCPVk10QN/TJIH5eBg17
         Wk/w9GqYld7gy755HJ9ShxCfKj2XqMNROMfV9qh5yRDJrO0KmYLfr1RhEubQv8Fz0fel
         ekFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977534; x=1754582334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jC83dOB30X6PShO+Qx3bRZ1eAKfCHiOihl7DCHI89Rg=;
        b=g0+4Q6wDDWN5nV5gWKGv+MHSpdZRDjK3frVBB9e68LfvPjNmtNKfU7bIV0OYjT5BtC
         N0Q2rgdZtphBITG2d7gl0QbbaX0PZ3AOoEquDW/iD96AKwBX/46PPuOVWqsWschZ+aeT
         zrQ0Q2sb9R4uyW8/CBlE57fzsZcUwQf7rREF4blV8uMRNqQz82n5LUhUSrbkEdDRNFkn
         7jeD/EIR80EAMkb68N67tnfrg1QUSsqesRCYDQ8FC1vadh+ws1pOKafFtSTgzADo50P/
         jdBiB6nS7d3hSD1ki4wCpFk0i/Eq323kx6D3l8EvrQHiHLYMBGlcrt4WIltaGizBA5nd
         rAgA==
X-Gm-Message-State: AOJu0YwsTIUteHSGJ/dHEeaH9h7uNLf0vEbiDGzpRcKpvL4cRtJXxjX/
	YOcuIqJHWjYELkVYszy4915s7ytMLAkpHSjGdH0wEDHECTeXKKD+bvDGifBU6w==
X-Gm-Gg: ASbGncuLNw/GH/uSoQab2sEmTEzLpL9TUye4+jx68iw1DpJkU6OdJIpCYWWvk0xynN6
	Z9E3aAIada3nyk3x5YPevyF7kjhKwRKhrTpgA5J86WSjobqjo7bTCHdoBZiiTTeKjUTh85bO09/
	PBGIeJxh6BNSeO87hL3DArvTij8zSIW8yNWIiJ1cwIwh6Mn9x5UZf80HKo+JzjQw+9BfKiY+Q67
	tMv6HQg6EfcfzseVn9tawXr4BtEi7Q5OaqftNWBtigklG1Sb7qJ41NfNyrWTpMBBe0aeVG8YZGo
	Si+lxKbeHSA26bRnrpOn2+LlZ9PEZy75HwroNqHnQO5xI5p7/Vra6emrkPQ3WM/l+m2vT44n3ND
	w9CqL/a5h3yfq06zYsCQ0VOFPDkH63eFeCeOz+DIvq/Q5u2PHxq9t3AIN+ZqkXw==
X-Google-Smtp-Source: AGHT+IHl86cJn6eEwaEmMR51hDkdErwFOdWHxda1zYGRfB7ptkNhfSwqjKkOryMIGf9vdN+g40172w==
X-Received: by 2002:a05:6512:693:b0:553:da39:37d with SMTP id 2adb3069b0e04-55b7c012815mr2352425e87.1.1753977533183;
        Thu, 31 Jul 2025 08:58:53 -0700 (PDT)
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
Subject: [PATCH v3 16/20] xen/riscv: Implement superpage splitting for p2m mappings
Date: Thu, 31 Jul 2025 17:58:15 +0200
Message-ID: <6890f77e577493194ea94834989dc0841d18eed0.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for down large memory mappings ("superpages") in the RISC-V
p2m mapping so that smaller, more precise mappings ("finer-grained entries")
can be inserted into lower levels of the page table hierarchy.

To implement that the following is done:
- Introduce p2m_split_superpage(): Recursively shatters a superpage into
  smaller page table entries down to the target level, preserving original
  permissions and attributes.
- p2m_set_entry() updated to invoke superpage splitting when inserting
  entries at lower levels within a superpage-mapped region.

This implementation is based on the ARM code, with modifications to the part
that follows the BBM (break-before-make) approach, some parts are simplified
as according to RISC-V spec:
  It is permitted for multiple address-translation cache entries to co-exist
  for the same address. This represents the fact that in a conventional
  TLB hierarchy, it is possible for multiple entries to match a single
  address if, for example, a page is upgraded to a superpage without first
  clearing the original non-leaf PTE’s valid bit and executing an SFENCE.VMA
  with rs1=x0, or if multiple TLBs exist in parallel at a given level of the
  hierarchy. In this case, just as if an SFENCE.VMA is not executed between
  a write to the memory-management tables and subsequent implicit read of the
  same address: it is unpredictable whether the old non-leaf PTE or the new
  leaf PTE is used, but the behavior is otherwise well defined.
In contrast to the Arm architecture, where BBM is mandatory and failing to
use it in some cases can lead to CPU instability, RISC-V guarantees
stability, and the behavior remains safe — though unpredictable in terms of
which translation will be used.

Additionally, the page table walk logic has been adjusted, as ARM uses the
opposite number of levels compared to RISC-V.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Move     page_list_add(page, &p2m->pages) inside p2m_alloc_page().
 - Use 'unsigned long' for local vairiable 'i' in p2m_split_superpage().
 - Update the comment above if ( next_level != target ) in p2m_split_superpage().
 - Reverse cycle to iterate through page table levels in p2m_set_entry().
 - Update p2m_split_superpage() with the same changes which are done in the
   patch "P2M: Don't try to free the existing PTE if we can't allocate a new table".
---
Changes in V2:
 - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
   functionality" which was splitted to smaller.
 - Update the commit above the cycle which creates new page table as
   RISC-V travserse page tables in an opposite to ARM order.
 - RISC-V doesn't require BBM so there is no needed for invalidating
   and TLB flushing before updating PTE.
---
 xen/arch/riscv/p2m.c | 118 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index e04cfde8c7..e9e6818da2 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -539,6 +539,91 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
     p2m_free_page(p2m, pg);
 }
 
+static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
+                                unsigned int level, unsigned int target,
+                                const unsigned int *offsets)
+{
+    struct page_info *page;
+    unsigned long i;
+    pte_t pte, *table;
+    bool rv = true;
+
+    /* Convenience aliases */
+    mfn_t mfn = pte_get_mfn(*entry);
+    unsigned int next_level = level - 1;
+    unsigned int level_order = XEN_PT_LEVEL_ORDER(next_level);
+
+    /*
+     * This should only be called with target != level and the entry is
+     * a superpage.
+     */
+    ASSERT(level > target);
+    ASSERT(pte_is_superpage(*entry, level));
+
+    page = p2m_alloc_page(p2m->domain);
+    if ( !page )
+    {
+        /*
+         * The caller is in charge to free the sub-tree.
+         * As we didn't manage to allocate anything, just tell the
+         * caller there is nothing to free by invalidating the PTE.
+         */
+        memset(entry, 0, sizeof(*entry));
+        return false;
+    }
+
+    table = __map_domain_page(page);
+
+    /*
+     * We are either splitting a second level 1G page into 512 first level
+     * 2M pages, or a first level 2M page into 512 zero level 4K pages.
+     */
+    for ( i = 0; i < XEN_PT_ENTRIES; i++ )
+    {
+        pte_t *new_entry = table + i;
+
+        /*
+         * Use the content of the superpage entry and override
+         * the necessary fields. So the correct permission are kept.
+         */
+        pte = *entry;
+        pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
+
+        write_pte(new_entry, pte);
+    }
+
+    /*
+     * Shatter superpage in the page to the level we want to make the
+     * changes.
+     * This is done outside the loop to avoid checking the offset
+     * for every entry to know whether the entry should be shattered.
+     */
+    if ( next_level != target )
+        rv = p2m_split_superpage(p2m, table + offsets[next_level],
+                                 level - 1, target, offsets);
+
+    if ( p2m->clean_pte )
+        clean_dcache_va_range(table, PAGE_SIZE);
+
+    /*
+     * TODO: an inefficiency here: the caller almost certainly wants to map
+     *       the same page again, to update the one entry that caused the
+     *       request to shatter the page.
+     */
+    unmap_domain_page(table);
+
+    /*
+     * Even if we failed, we should (according to the current implemetation
+     * of a way how sub-tree is freed if p2m_split_superpage hasn't been
+     * finished fully) install the newly allocated PTE
+     * entry.
+     * The caller will be in charge to free the sub-tree.
+     */
+    p2m_write_pte(entry, page_to_p2m_table(page), p2m->clean_pte);
+
+    return rv;
+}
+
 /*
  * Insert an entry in the p2m. This should be called with a mapping
  * equal to a page/superpage.
@@ -603,7 +688,38 @@ static int p2m_set_entry(struct p2m_domain *p2m,
      */
     if ( level > target )
     {
-        panic("Shattering isn't implemented\n");
+        /* We need to split the original page. */
+        pte_t split_pte = *entry;
+
+        ASSERT(pte_is_superpage(*entry, level));
+
+        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets) )
+        {
+            /* Free the allocated sub-tree */
+            p2m_free_subtree(p2m, split_pte, level);
+
+            rc = -ENOMEM;
+            goto out;
+        }
+
+        p2m_write_pte(entry, split_pte, p2m->clean_pte);
+
+        p2m->need_flush = true;
+
+        /* Then move to the level we want to make real changes */
+        for ( ; level > target; level-- )
+        {
+            rc = p2m_next_level(p2m, true, level, &table, offsets[level]);
+
+            /*
+             * The entry should be found and either be a table
+             * or a superpage if level 0 is not targeted
+             */
+            ASSERT(rc == P2M_TABLE_NORMAL ||
+                   (rc == P2M_TABLE_SUPER_PAGE && target > 0));
+        }
+
+        entry = table + offsets[level];
     }
 
     /*
-- 
2.50.1


