Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEEAA32C66
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 17:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886618.1296288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiFwL-0000KU-Eb; Wed, 12 Feb 2025 16:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886618.1296288; Wed, 12 Feb 2025 16:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiFwL-0000AY-8s; Wed, 12 Feb 2025 16:50:21 +0000
Received: by outflank-mailman (input) for mailman id 886618;
 Wed, 12 Feb 2025 16:50:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeD=VD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tiFwJ-0006SU-2R
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 16:50:19 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70c0b136-e961-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 17:50:18 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-54505c79649so3957637e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 08:50:18 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54504fc26b3sm1409118e87.44.2025.02.12.08.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 08:50:17 -0800 (PST)
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
X-Inumbo-ID: 70c0b136-e961-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739379018; x=1739983818; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZglyTF5aSK1PQF3xSDMCmREAlwhg0rWO/2AwCX9UHU=;
        b=lBgE5lDMOsZN4PTsmvYHBlj7nZplJReIlwFO23ZLYmetPEC8ENkJBrDJ06j8/vNwNr
         QbRbSfTDo/v+iTF+25ah+BmufEOpg9aqFjfSlGBnkodQ1SDU2ZnkjnslYZ+gz5X4Cnk7
         1ac8uPVV44dEjtBXeGxuGqcjG6Z1F9zDOu9iwbtRu2FFPFKFeFdDDnUhDExlqL7cGc5r
         5K/+bwvzylVNuV6sDEnJp0QW0oNXAwH5HmlS6qydsgFULlZ/QhuAESF2hsW/snbqTIKc
         Pqrxl+30hFNgbPyvCm/uqoFp6dLsYLNr+DJ/FCdJLBqHwSFsMzkmO+pbkLact/7eH4NR
         pjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739379018; x=1739983818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZglyTF5aSK1PQF3xSDMCmREAlwhg0rWO/2AwCX9UHU=;
        b=bdVN6rInoAgqNxYP9zIEtBJUn31piw3NLmTrMsgVR6DjTxy95VuRS92q1C/GJmjxaj
         UX3xqJPYJxuBESGTGw1Lqj31umFPWZr/YeOLKmYoPAkl/ls8tLRCPceEZjD7Re5H+Yid
         oRB5XtnE+lEbbq6bPgZ+ot/VV5+22kuyDyoxeSleMrC09tzaqMg7oERhClQ1Tr6q+3iM
         F1FGMsDWUw6IQp5w/LCXBFMV8jNAQBC1ZMdFIq58rEDWTn4192kc4ElA1M3PYOICrBnD
         nKo+F6XBrP/EvyDUUXwXqeNhb5A2QD4Syfgibhfn7Ho8xvzQQKbnHkpNhhdUPq3iAqBE
         QbQg==
X-Gm-Message-State: AOJu0Ywn3+nov1pDCc7Oqzg3JCAM4irpzQCF6qFa3jyC0kNeJ7+3Da52
	f5fGTvdXpuNJmv+VlAbBIzZi/f5xISO/iARGDvm9l+JNdaPr+z3CV6it4Q==
X-Gm-Gg: ASbGncvSd2wzuCjnAyaTW0zGSYPVjAxGiCzOuYVKgsHpFnqz7vUaAumvlcwogtjPNeV
	yt5jRuwSR+b8S6kCHmLMzE6BlU7NWIK8F29xTqYPg6v94nhJ7qA3TRauiQl4ovN0Hn3QjlWQD1a
	sCo0lyCcsytIotZQP7afoTTt3Xh+gDzzZiacEk9FPmErmQ1UWDTIog4gm6JNZBAS42sQmdhLnGK
	Ai8YD+zcn9p5g4Gi8S0Vv3aPbLd+uqvjdtzeayvXElwwlqRjkmlA6aWs7uqn38O/yoIeuyq1fXq
	RRTmvcUetzdLAthg
X-Google-Smtp-Source: AGHT+IFYjpJP/yAIrQ/eL69OEeqiM2eJhz9ML9Gulz7tQDtWpcrF+3nQtNWweR6KkokxAs+ptE+ehg==
X-Received: by 2002:a05:6512:124c:b0:545:353:4d46 with SMTP id 2adb3069b0e04-545181148dfmr1184237e87.25.1739379017456;
        Wed, 12 Feb 2025 08:50:17 -0800 (PST)
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
Subject: [PATCH for 4.20? v4 1/3] xen/riscv: implement software page table walking
Date: Wed, 12 Feb 2025 17:50:11 +0100
Message-ID: <9f1fbf84a82fd141f40428993106f0672d6d8c4c.1739363240.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739363240.git.oleksii.kurochko@gmail.com>
References: <cover.1739363240.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V doesn't have hardware feature to ask MMU to translate
virtual address to physical address ( like Arm has, for example ),
so software page table walking is implemented.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/page.h |  2 +
 xen/arch/riscv/pt.c               | 62 +++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

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
index a703e0f1bd..260a3a9699 100644
--- a/xen/arch/riscv/pt.c
+++ b/xen/arch/riscv/pt.c
@@ -185,6 +185,68 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
     return XEN_TABLE_NORMAL;
 }
 
+/*
+ * _pt_walk() performs software page table walking and returns the pte_t of
+ * a leaf node or the leaf-most not-present pte_t if no leaf node is found
+ * for further analysis.
+ *
+ * Additionally, _pt_walk() returns the level of the found pte by using
+ * `pte_level` argument.
+ * `pte_level` is optional, set `pte_level`=NULL if a caller doesn't need
+ * the level of the found pte.
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
+    pte_t *entry = _pt_walk(va, pte_level);
+    pte_t pte = *entry;
+
+    unmap_table(entry);
+
+    return pte;
+}
+
 /* Update an entry at the level @target. */
 static int pt_update_entry(mfn_t root, vaddr_t virt,
                            mfn_t mfn, unsigned int target,
-- 
2.48.1


