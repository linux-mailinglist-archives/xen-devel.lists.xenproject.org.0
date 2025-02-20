Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF72A3E2D3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 18:44:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894047.1302874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAar-0004Ab-M3; Thu, 20 Feb 2025 17:44:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894047.1302874; Thu, 20 Feb 2025 17:44:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAar-00048D-J9; Thu, 20 Feb 2025 17:44:13 +0000
Received: by outflank-mailman (input) for mailman id 894047;
 Thu, 20 Feb 2025 17:44:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkM0=VL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tlAaq-000469-Ek
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 17:44:12 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a6cd30e-efb2-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 18:44:10 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-30a28bf1baaso10450721fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 09:44:10 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091e04742esm24070201fa.86.2025.02.20.09.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 09:44:08 -0800 (PST)
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
X-Inumbo-ID: 4a6cd30e-efb2-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740073450; x=1740678250; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBJSULeS2fy8c8GgWkzT2anLuPP/suhjYJ4LNyq9Zcs=;
        b=Bopmv4Y1xdPJWZYfx8IRq9i9eOOSHF8hGm2OjJDsg/nv1DMuotF/0dblHYNrR1IHRY
         Ix4neqAs+zpvwIZfQ0zfNk9WdJQW7Mf7Dc1xBVi1EUQSXir5f/4g13w+6TwO7NHkyfqm
         Nvo1Yv59Cc7dPfUdA5pzxiElGIx+t3btOREd3u8OIfmdj2uvjPIU/u2ngYl42s6vaYkP
         1nSA04PpQG+P3/2QKkB2r+06fnIj2+n4lU+Dyhk+WDChbs/yRpcaSpswjXZlVAxpHkMr
         1HwTRGqolyhrN5cpCEJ/wwQlvL3Rg4RZ+VyrjBioyQ1o8+ua/OJ32+dVEvh2oFsSMHYv
         xr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740073450; x=1740678250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBJSULeS2fy8c8GgWkzT2anLuPP/suhjYJ4LNyq9Zcs=;
        b=p/BE6pWjQSxUto9v2/B5tmoY6iovK3Gaz6BZXwZqTJeiB7k4JzzEdxvYKjNbJHN3db
         rCP6FBa4DWkjT5OfKyzWa6BXnlr/t+ln/cwBF/MdUr3n2SsJf9RdvVrBREhuxR9lHjW9
         K3nAx6lVAy1sPf0WlGmOWkwJXpRg9lWeES5CiI1Zih7X6xGv+gjR/sABmmbVjFU1TOI9
         nxTIMu4sr+E1MTaEz12CN49qQBphKi7oCbhC29iM1kbJgogO6iuUnIy+dIXUeAWI424W
         G4lfbuUg5oCsXmN9b05PqW+iv4Dzfv9hOyACBD4i3rG6ZofT6e3JxC1k5lSegerOA6BQ
         PyeA==
X-Gm-Message-State: AOJu0YwW+qKx925SFYsEDj8vRXaWQI9nfEWjoHyKPhbyInfzBVeghTYk
	8MttiWrcrIMiBVVsGI/Iv5jEfDJoe/TEHfYEBzDptVJ3HPIsr4inpjIYBw==
X-Gm-Gg: ASbGncu/lIWa4mMt8hQnFZRomTRfF6HJ0s4w21CG6u044XhMX4Ir/3XQ9jryeeQb3IA
	f5ffoJzBEMCNAHxidtiTmJX1ts5xHFqKjhM32aV0rpzB7Z+JIgRsQFBPiJWqh8GshHhP1V5kDRR
	WeEmWgj11EjQlhBIAlD12bFacTrz5Sw0GeVYW0SiGKxAG8UvAylEGi/ZOlXdH73xOd1rAZmUCu+
	FB13mA9SCZiR0g5cC8Y2MiC8MycvDs+DL1QXErNdQy9JzIsesegOgU1/ZYqoARjWepu4mtjK9JY
	g+NebP9m8tGsOQD8
X-Google-Smtp-Source: AGHT+IFc1aPnQ7vyttwkv/h+iW0tB3JI/J7o+lr7IUSLic1+If5i4YWS9yzSqvhwpJ7kejD/g3SABw==
X-Received: by 2002:a2e:8946:0:b0:308:f01f:183b with SMTP id 38308e7fff4ca-30a5985b0c5mr79691fa.2.1740073449481;
        Thu, 20 Feb 2025 09:44:09 -0800 (PST)
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
Subject: [PATCH for 4.21 v5 1/3] xen/riscv: implement software page table walking
Date: Thu, 20 Feb 2025 18:44:02 +0100
Message-ID: <5e189ab129463cc81baac69f9e9ea6a65b2fb902.1739985805.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739985805.git.oleksii.kurochko@gmail.com>
References: <cover.1739985805.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V doesn't have hardware feature to ask MMU to translate
virtual address to physical address ( like Arm has, for example ),
so software page table walking is implemented.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Update the comment above _pt_walk() about returning of optional
   level of the found pte.
 - Rename local variable `pte_p *entry` to `ptep` in pt_walk() function.
 - Add Reviewed-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v4:
 - Update the comment message above _pt_walk(): add information that
   `pte_level` is optional and add a note that `table` should be
   unmapped by a caller.
 - Unmap `table` in pt_walk().
---
Changes in v3:
 - Remove circular dependency.
 - Move declaration of pt_walk() to asm/page.h.
 - Revert other not connected to pt_walk() changes.
 - Update the commit message.
 - Drop unnessary anymore local variables of pt_walk().
 - Refactor pt_walk() to use for() loop instead of while() loop
   as it was suggested by Jan B.
 - Introduce _pt_walk() which returns pte_t * and update prototype
   of pt_walk() to return pte_t by value.
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
 - Update the commit message.
---
 xen/arch/riscv/include/asm/page.h |  2 ++
 xen/arch/riscv/pt.c               | 60 +++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 7a6174a109..0439a1a9ee 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -208,6 +208,8 @@ static inline pte_t pte_from_mfn(mfn_t mfn, unsigned int flags)
     return (pte_t){ .pte = pte };
 }
 
+pte_t pt_walk(vaddr_t va, unsigned int *pte_level);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* ASM__RISCV__PAGE_H */
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
index a703e0f1bd..9c1f8f6b55 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -185,6 +185,66 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
     return XEN_TABLE_NORMAL;
 }
 
+/*
+ * _pt_walk() performs software page table walking and returns the pte_t of
+ * a leaf node or the leaf-most not-present pte_t if no leaf node is found
+ * for further analysis.
+ *
+ * _pt_walk() can optionally return the level of the found pte. Pass NULL
+ * for `pte_level` if this information isn't needed.
+ *
+ * Note: unmapping of final `table` should be done by a caller.
+ */
+static pte_t *_pt_walk(vaddr_t va, unsigned int *pte_level)
+{
+    const mfn_t root = get_root_page();
+    unsigned int level;
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
+     * - ret == XEN_TABLE_SUPER_PAGE means that the entry was found;
+     *   (Despite the name) XEN_TABLE_SUPER_PAGE also covers 4K mappings. If
+     *   pt_next_level() is called for page table level 0, it results in the
+     *   entry being a pointer to a leaf node, thereby returning
+     *   XEN_TABLE_SUPER_PAGE, despite of the fact this leaf covers 4k mapping.
+     * - ret == XEN_TABLE_MAP_NONE means that requested `va` wasn't actually
+     *   mapped.
+     */
+    for ( level = HYP_PT_ROOT_LEVEL; ; --level )
+    {
+        int ret = pt_next_level(false, &table, offsets[level]);
+
+        if ( ret == XEN_TABLE_MAP_NONE || ret == XEN_TABLE_SUPER_PAGE )
+            break;
+
+        ASSERT(level);
+    }
+
+    if ( pte_level )
+        *pte_level = level;
+
+    return table + offsets[level];
+}
+
+pte_t pt_walk(vaddr_t va, unsigned int *pte_level)
+{
+    pte_t *ptep = _pt_walk(va, pte_level);
+    pte_t pte = *ptep;
+
+    unmap_table(ptep);
+
+    return pte;
+}
+
 /* Update an entry at the level @target. */
 static int pt_update_entry(mfn_t root, vaddr_t virt,
                            mfn_t mfn, unsigned int target,
-- 
2.48.1


