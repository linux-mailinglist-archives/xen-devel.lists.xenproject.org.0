Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4232DA2C355
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 14:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883668.1293600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgOAi-00087U-35; Fri, 07 Feb 2025 13:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883668.1293600; Fri, 07 Feb 2025 13:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgOAh-00081n-UD; Fri, 07 Feb 2025 13:13:27 +0000
Received: by outflank-mailman (input) for mailman id 883668;
 Fri, 07 Feb 2025 13:13:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4G/=U6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tgOAg-0007zQ-S9
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 13:13:26 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 502c04e2-e555-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 14:13:25 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ab2c9b8aecaso370083966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 05:13:25 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab794d96481sm19759666b.154.2025.02.07.05.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 05:13:23 -0800 (PST)
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
X-Inumbo-ID: 502c04e2-e555-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738934004; x=1739538804; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMZYt7NxI+/5yJeLrFuGlO5FKuv+ep0nMCIPhJ0/BuE=;
        b=g8Cg+gu8NOrYu7Vrr4pY3SrwblXeb3lh/QJMISYsH1mGcMG1isgznMsKqKYOh0hzyy
         IAItgO83e+W87N1iTrVrxvC23I70XYpBJjgMIhvOgeJCGPPQyYb8S/229ht5Y4mkiQtE
         mqAWrinx4FLeh6DeU/LldkBTEUCvoGhK4nWYYO1kJbgwi7YIMo1XJdtZ0AS/958tPeXf
         lewsOd4T/OB2kBEImdHp9/gIC6JUk6/hrl4Cn/13AJjJt1A2n1B9c3J+Sif98sakvsw5
         KtTxSIyRBtL0Y2BsFyQ35IaNq6Mjt9zEPMQD+5ethSk5HHz3x91W1+taeJR/lUpnw7t8
         taBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738934004; x=1739538804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMZYt7NxI+/5yJeLrFuGlO5FKuv+ep0nMCIPhJ0/BuE=;
        b=buvnKXEb+GXfP18HeUg19kLzGM/lIPtxLYkhKk16K0G1OX3WtfdZwrEcinAhnfi6Yb
         rNQBEaRPK17+VIts9DvNAKt6g8bWjP43UmMGLRtEO3UpLdKyhJCwirjRq1MzaXVUqDgY
         4V+qA0ez/cXqfrQzy9INBEKxDC4fD0FS+UQt3CyhXV6nEn4CkcPmtcGoXqx/9aCUN6g7
         cFXSnk+UdspXN+t410WZAGGLwRGYyqvN/X9nciEtncPHN32+OvwfKXxoVW2WtjaZdZ/g
         XHujRLAd6EfYUMSZ88C+mK/KDBizAup8U1d+WaRDnldby2GX3I0is5D3wbHpscQ2+eN9
         P2Zw==
X-Gm-Message-State: AOJu0Yx994zISXTjWqN3o1NlgWiri7d+RmK4ETkotSqlmHv1dXIE91An
	+Sg15Ha3SCai0XSJb8RLG4ywKrpoucol8k+mlF89nlMQNqbUhKdbzlKzRg==
X-Gm-Gg: ASbGnct+BMY4ZPIws7EpWl3PjNrXZfIRDz21vIthVaSNzkw8fd51BR6OVZ/GslYW+/v
	AGn94fZocjTTOFvA2bwiy2NdsAijbMmxpA87BAgvTuBRzMMPFjiYPRNHChQFkkqc2qKQzMgR8QY
	pDvKqm8MELKcfmTRwUC1vm63F5KR0MSNsO11JbvS+eF6RlkzoZwI6o75BaGFoVw/vY3iGBVqASy
	JB+GQkaVU1Cl6UgiyzEVCVi4lSUG3ggC+kOPVDJfQ914EI1LhiN8FdxR6x5m+pBQF9Zw7ihWEbf
	sqr0JQyE51BtXv1+
X-Google-Smtp-Source: AGHT+IEr3ufXejCjagOaS0jaYHMn8SB/oyvtSMXkWiF7mEOtCBp9f5LTo+U7iKxWIlE+zkiNsw2JMg==
X-Received: by 2002:a17:907:1b26:b0:aa6:7737:1991 with SMTP id a640c23a62f3a-ab789a9f210mr347904666b.2.1738934004105;
        Fri, 07 Feb 2025 05:13:24 -0800 (PST)
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
Subject: [PATCH for 4.20? v3 1/3] xen/riscv: implement software page table walking
Date: Fri,  7 Feb 2025 14:13:18 +0100
Message-ID: <e78679b00df63bde40eb3a4d97e3ab9d1faf9382.1738933678.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738933678.git.oleksii.kurochko@gmail.com>
References: <cover.1738933678.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V doesn't have hardware feature to ask MMU to translate
virtual address to physical address ( like Arm has, for example ),
so software page table walking is implemented.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/pt.c               | 51 +++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

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
index a703e0f1bd..66cb976b55 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -185,6 +185,57 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
     return XEN_TABLE_NORMAL;
 }
 
+/*
+ * _pt_walk() performs software page table walking and returns the pte_t of
+ * a leaf node or the leaf-most not-present pte_t if no leaf node is found
+ * for further analysis.
+ * Additionally, _pt_walk() returns the level of the found pte.
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
+    return *_pt_walk(va, pte_level);
+}
+
 /* Update an entry at the level @target. */
 static int pt_update_entry(mfn_t root, vaddr_t virt,
                            mfn_t mfn, unsigned int target,
-- 
2.48.1


