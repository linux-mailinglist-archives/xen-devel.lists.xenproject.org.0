Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A999CC474D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:56:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188156.1509496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYL9-0001ED-EQ; Tue, 16 Dec 2025 16:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188156.1509496; Tue, 16 Dec 2025 16:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYL9-0001Aw-77; Tue, 16 Dec 2025 16:55:59 +0000
Received: by outflank-mailman (input) for mailman id 1188156;
 Tue, 16 Dec 2025 16:55:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYL7-0006gk-CD
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:55:57 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16347a73-daa0-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:55:55 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b7277324054so790173966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:55:55 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:55:53 -0800 (PST)
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
X-Inumbo-ID: 16347a73-daa0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904154; x=1766508954; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sC4ST+8s58ZroxtiJdKvQ99E8jdG/h4GfiwJOt3wiYE=;
        b=F6E6iV1oUMDTJ2hpbNw8mb+Xyj4ryAlAdNNBD5jCD9RAtverEU+R62EDtyjVXz9qEV
         ABdGM7AxPiVB0GV1BHmXbq4ovKd0jbDs8XYQOy9v5JqIXItYptlCV12UQIprH9VVFjar
         0IHYAu/YbwreDg2qYb3FKnikPfUbvn8hWXnab24vLUmzBrxwWN62t5iYJm+nv8E/cWgf
         KS2MpFPFx5PwIQuBX6lbsZVkL3qrd6RmrwrpskIEFU7tgXO5mQDvjySpeDyERq0ChhYa
         q9xgMKyxf8U/+p1rkAP9ujpCB002ewpoxaGN26qmRqfMonMSGZyIGxQiTZHP69903UI+
         OghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904154; x=1766508954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sC4ST+8s58ZroxtiJdKvQ99E8jdG/h4GfiwJOt3wiYE=;
        b=sIs/xG1XDzMUm8uO9HkPuehmxyIuirk+o8eKhFPOjJ3dk5/qKIp62NmlsnGZcbVJsy
         GRPymf0WNEjfBfLG9jyfxFKW+5ddClWaEJo4eyxT6bxMXkbnyIY+FgU99qaI72IE4gSg
         2wMbBhtqpiMB0If409etvbWN6v48bPwgIPk7L0YyKU4YmEBn6rwAk+GVISJ9ggfP10ra
         noer+GPeOS47K7/lpYj+bWNZokYklmp3sUVSb2bne+3/fAyjlAueSapWm19S5pW+FmWV
         HQJkAVh4SUK7tkmarCRaoP8vffM2lMB4GCAWfmsHtEroG/uo+cZDx+I9MCHI6M+fFqtM
         7HUA==
X-Gm-Message-State: AOJu0Yxq6ZvdakpGSBC7Yz1NzOQmeM4mt5mnJE/ZokPirZ/5bfE00YIq
	oK+ixRIPgmwe60HT7P6yhMaCCeKtw38tbFF2dMsiyAQl37Y6Hmz2jzDS4ETx2w==
X-Gm-Gg: AY/fxX6sxFYss5AMdnTyFALOQMIhPGELuTekdGSZoAsnSAtyE2eNCHk7ZgOcA2x2jkD
	lYlYuFb70H5fPrDQihmyMXtKCfJR5wMGwmFQ07QhRj516GmGTNscLWnbei32Keu6kP8+oz1MPL2
	sxqaax2H+XUZflBGcpEXftRIgNezRXoz0GamZCEQlW+40e2nmQRbBDF8fz82bUagFhgvjA1clZt
	5Hi+X7VLojyrKWs/xeskXYfKfSDhJq1/PVcpbwOLL9dCqMUJj8viOc0OvoyOJ700u7L9S4gcH7d
	c0kWGdxfYCs17H/1Q0usVqrGmKN/1p4JKBqdwBzV0i217XTcGidU/HQshaLWb5H9pKHSgU/4e93
	AWCl0G+RuPTbpB3KrHIRl0epw20R7yqBeJp5BWpiF7B4tRn6FQzoP9B14tjrKA9/njcFZuJO2oZ
	RE5rlWRJgcWWUKpffSX6kylHxQoVUU/I6D4BVFR39H0DYpm1yY6Jk=
X-Google-Smtp-Source: AGHT+IGfQ8dcTVBI2MmmqON1q+CAddZ1kZjNbCRmAj1saEJfXx3zZei/SIchoa3vWl6LQ1IXf/ZKWA==
X-Received: by 2002:a17:907:3da8:b0:b6d:2c70:4542 with SMTP id a640c23a62f3a-b7d23772c6amr1636635366b.30.1765904154264;
        Tue, 16 Dec 2025 08:55:54 -0800 (PST)
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
Subject: [PATCH v7 12/19] xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration
Date: Tue, 16 Dec 2025 17:55:22 +0100
Message-ID: <081d03f8d9d1c0b05a46611b7d2104f29ff92ecb.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch adds the initial logic for constructing PTEs from MFNs in the RISC-V
p2m subsystem. It includes:
- Implementation of p2m_pte_from_mfn(): Generates a valid PTE using the
  given MFN, p2m_type_t, including permission encoding and PBMT attribute
  setup.
- New helper p2m_set_permission(): Encodes access rights (r, w, x) into the
  PTE based on both p2m type and access permissions.
- p2m_set_type(): Stores the p2m type in PTE's bits. The storage of types,
  which don't fit PTE bits, will be implemented separately later.
- Add detection of Svade extension to properly handle a possible page-fault
  if A and D bits aren't set.

PBMT type encoding support:
- Introduces an enum pbmt_type_t to represent the PBMT field values.
- Maps types like p2m_mmio_direct_dev to p2m_mmio_direct_io, others default
  to pbmt_pma.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V7:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V6:
 - Drop 's' in word "nesssary" in the comment.
---
Changes in V5:
 - Moved setting of p2m_mmio_direct_io inside (!is_table) case in p2m_pte_from_mfn().
 - Extend comment about the place of setting A/D bits with explanation
   why it is done in this way for now.
---
Changes in V4:
 - p2m_set_permission() updates:
   - Update permissions for p2m_ram_rw case, make it also executable.
   - Add pernissions setting for p2m_map_foreign_* types.
   - Drop setting peromissions for p2m_ext_storage.
   - Only turn off PTE_VALID bit for p2m_invalid, don't touch other bits.
 - p2m_pte_from_mfn() updates:
   - Update ASSERT(), add a check that mfn isn't INVALID_MFN (1)
     explicitly to avoid the case when PADDR_MASK isn't narrow enough to
     catch the case (1).
   - Drop unnessary check around call of p2m_set_type() as this check
     is already included inside p2m_set_type().
 - Introduce new p2m type p2m_first_external to detect that passed type
   is stored in external storage.
 - Add handling of PTE's A and D bits in pm2_set_permission. Also, set
   PTE_USER bit. For this cpufeatures.{h and c} were updated to be able
   to detect availability of Svade extension.
 - Drop grant table related code as it isn't going to be used at the moment.
---
Changes in V3:
 - s/p2m_entry_from_mfn/p2m_pte_from_mfn.
 - s/pbmt_type_t/pbmt_type.
 - s/pbmt_max/pbmt_count.
 - s/p2m_type_radix_set/p2m_set_type.
 - Rework p2m_set_type() to handle only types which are fited into PTEs bits.
   Other types will be covered separately.
   Update arguments of p2m_set_type(): there is no any reason for p2m anymore.
 - p2m_set_permissions() updates:
   - Update the code in p2m_set_permission() for cases p2m_raw_rw and
     p2m_mmio_direct_io to set proper type permissions.
   - Add cases for p2m_grant_map_rw and p2m_grant_map_ro.
   - Use ASSERT_UNEACHABLE() instead of BUG() in switch cases of
     p2m_set_permissions.
   - Add blank lines non-fall-through case blocks in switch cases.
 - Set MFN before permissions are set in p2m_pte_from_mfn().
 - Update prototype of p2m_entry_from_mfn().
---
Changes in V2:
 - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
   functionality" which was splitted to smaller.
---
 xen/arch/riscv/cpufeature.c             |   1 +
 xen/arch/riscv/include/asm/cpufeature.h |   1 +
 xen/arch/riscv/include/asm/page.h       |   8 ++
 xen/arch/riscv/p2m.c                    | 112 +++++++++++++++++++++++-
 4 files changed, 118 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index b846a106a3..02b68aeaa4 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -138,6 +138,7 @@ const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
     RISCV_ISA_EXT_DATA(zbs),
     RISCV_ISA_EXT_DATA(smaia),
     RISCV_ISA_EXT_DATA(ssaia),
+    RISCV_ISA_EXT_DATA(svade),
     RISCV_ISA_EXT_DATA(svpbmt),
 };
 
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index d42d7b294e..b696160388 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -37,6 +37,7 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_zbs,
     RISCV_ISA_EXT_smaia,
     RISCV_ISA_EXT_ssaia,
+    RISCV_ISA_EXT_svade,
     RISCV_ISA_EXT_svpbmt,
     RISCV_ISA_EXT_MAX
 };
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 1fc5998a0b..b7cd61df8d 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -73,6 +73,14 @@
 #define PTE_SMALL       BIT(10, UL)
 #define PTE_POPULATE    BIT(11, UL)
 
+enum pbmt_type {
+    pbmt_pma,
+    pbmt_nc,
+    pbmt_io,
+    pbmt_rsvd,
+    pbmt_count,
+};
+
 #define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
 
 #define PTE_PBMT_MASK   (PTE_PBMT_NOCACHE | PTE_PBMT_IO)
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 9ab7262d70..48e75b1867 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -11,6 +11,7 @@
 #include <xen/sections.h>
 #include <xen/xvmalloc.h>
 
+#include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/flushtlb.h>
 #include <asm/p2m.h>
@@ -356,6 +357,18 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return rc;
 }
 
+static int p2m_set_type(pte_t *pte, p2m_type_t t)
+{
+    int rc = 0;
+
+    if ( t > p2m_first_external )
+        panic("unimplemeted\n");
+    else
+        pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
+
+    return rc;
+}
+
 static p2m_type_t p2m_get_type(const pte_t pte)
 {
     p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
@@ -386,11 +399,102 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_cache)
     p2m_write_pte(p, pte, clean_cache);
 }
 
-static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
+static void p2m_set_permission(pte_t *e, p2m_type_t t)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    e->pte &= ~PTE_ACCESS_MASK;
+
+    e->pte |= PTE_USER;
+
+    /*
+     * Two schemes to manage the A and D bits are defined:
+     *   • The Svade extension: when a virtual page is accessed and the A bit
+     *     is clear, or is written and the D bit is clear, a page-fault
+     *     exception is raised.
+     *   • When the Svade extension is not implemented, the following scheme
+     *     applies.
+     *     When a virtual page is accessed and the A bit is clear, the PTE is
+     *     updated to set the A bit. When the virtual page is written and the
+     *     D bit is clear, the PTE is updated to set the D bit. When G-stage
+     *     address translation is in use and is not Bare, the G-stage virtual
+     *     pages may be accessed or written by implicit accesses to VS-level
+     *     memory management data structures, such as page tables.
+     * Thereby to avoid a page-fault in case of Svade is available, it is
+     * necessary to set A and D bits.
+     *
+     * TODO: For now, it’s fine to simply set the A/D bits, since OpenSBI
+     *       delegates page faults to a lower privilege mode and so OpenSBI
+     *       isn't expect to handle page-faults occured in lower modes.
+     *       By setting the A/D bits here, page faults that would otherwise
+     *       be generated due to unset A/D bits will not occur in Xen.
+     *
+     *       Currently, Xen on RISC-V does not make use of the information
+     *       that could be obtained from handling such page faults, which
+     *       could otherwise be useful for several use cases such as demand
+     *       paging, cache-flushing optimizations, memory access tracking,etc.
+     *
+     *       To support the more general case and the optimizations mentioned
+     *       above, it would be better to stop setting the A/D bits here and
+     *       instead handle page faults that occur due to unset A/D bits.
+     */
+    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
+        e->pte |= PTE_ACCESSED | PTE_DIRTY;
+
+    switch ( t )
+    {
+    case p2m_map_foreign_rw:
+    case p2m_mmio_direct_io:
+        e->pte |= PTE_READABLE | PTE_WRITABLE;
+        break;
+
+    case p2m_ram_rw:
+        e->pte |= PTE_ACCESS_MASK;
+        break;
+
+    case p2m_invalid:
+        e->pte &= ~PTE_VALID;
+        break;
+
+    case p2m_map_foreign_ro:
+        e->pte |= PTE_READABLE;
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        break;
+    }
+}
+
+static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
+{
+    pte_t e = (pte_t) { PTE_VALID };
+
+    pte_set_mfn(&e, mfn);
+
+    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK) || mfn_eq(mfn, INVALID_MFN));
+
+    if ( !is_table )
+    {
+        switch ( t )
+        {
+        case p2m_mmio_direct_io:
+            e.pte |= PTE_PBMT_IO;
+            break;
+
+        default:
+            break;
+        }
+
+        p2m_set_permission(&e, t);
+        p2m_set_type(&e, t);
+    }
+    else
+        /*
+         * According to the spec and table "Encoding of PTE R/W/X fields":
+         *   X=W=R=0 -> Pointer to next level of page table.
+         */
+        e.pte &= ~PTE_ACCESS_MASK;
 
-    return (pte_t) { .pte = 0 };
+    return e;
 }
 
 #define P2M_TABLE_MAP_NONE 0
@@ -645,7 +749,7 @@ static int p2m_set_entry(struct p2m_domain *p2m,
         p2m_clean_pte(entry, p2m->clean_dcache);
     else
     {
-        pte_t pte = p2m_pte_from_mfn(mfn, t);
+        pte_t pte = p2m_pte_from_mfn(mfn, t, false);
 
         p2m_write_pte(entry, pte, p2m->clean_dcache);
 
-- 
2.52.0


