Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74C2B820C3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 23:56:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125595.1467596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08L-0002a2-V9; Wed, 17 Sep 2025 21:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125595.1467596; Wed, 17 Sep 2025 21:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz08L-0002PQ-BE; Wed, 17 Sep 2025 21:56:13 +0000
Received: by outflank-mailman (input) for mailman id 1125595;
 Wed, 17 Sep 2025 21:56:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz08I-0007Lt-2I
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:56:10 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d213bd6-9411-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 23:56:08 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2677a4d4ce3so3389945ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:56:08 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:56:05 -0700 (PDT)
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
X-Inumbo-ID: 1d213bd6-9411-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146166; x=1758750966; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vixp4rZSilRtfznTmIcEdZHTZIUxpbam21u9aaI4Ljs=;
        b=EI/Klr43q7NVgGkfblRBupGvdhyPP1NI7/WTxAhz3GkEIETzlPsBIrpPIGtkdDJN5i
         AKZYko9nq778uA3FKmfg7/+DnT4aXKSJsEPyFkuvsPMTxGJdlnUQFIzPGyuf7HfmSgLk
         XwKej4xFk0AdO9l/cTguqTuBTQKvU91dXiV4yZKZ99lI+EKklcaIOblBvV7J05fdBkQH
         wwlo3uzwfb5UmnCQ0pcwqLe0ktf2K202zww7wwnCJfAYrfRZhSzfpqoIE8205u4UFnxi
         jdp9YFD7hWpdAEIRteCWMgZv2MGvsgCedQgKzj3Y6iUgDXx5HF4fBPb1jkyBxSeowsr8
         V2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146166; x=1758750966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vixp4rZSilRtfznTmIcEdZHTZIUxpbam21u9aaI4Ljs=;
        b=oBjM+y5fxNirYofj9+BWDzbtMuO1hHDA4pZ6fHg6FQ9KbazOlemYDwutrW0KXzaT/p
         F1GwhvZc7aH5sxdDFgXJoD7oaOaXhneZL9EC/ClW4WXKCniCPIvuI+5PKD5T0KyAKmIm
         2+SPWDin0YW1L7WEkGnBMjvNC+vV9FWYd8gN6FwqdFeeSh+Mu0JJPhCi2ArlRLTmoVJ2
         4kG0S6LiDblRAT7Yor+GyED50gmmo98Gp4vuzj0s4zRerzVCKXajCYbESo7Aio2Y54gD
         1F5W1tk9hlks9n7M92sseomTz+vtuaxoQSKOGQmafixiKV6cdH2II8eF2VQHl+9V+wrK
         df1w==
X-Gm-Message-State: AOJu0Yxi5cgYfVNH+BENzfQGf5ltEoQ3+PqOyM7f8bSQiO/YeaIi71+V
	npl+0Z3CNCx69mlRQV89AvqaVym307/rN3TH1tGUDC+JPlelKnhGXrea6zHmwJMArsg=
X-Gm-Gg: ASbGncui01tujQBX1vJV6BspCG5la5J8lotTWcrnB9WI1vgAE7y17aK1uADA9fb27dr
	Kvqf2SLBdrArOXjkaheREo16SdU23XadCIY54hMhaQcApaSPf2obXWN8o4zQ9J9U3uzS0Z6ZQVS
	k462BLIFdMpra02c70wBlBLyPVBmvDDKbk6E7Lj4tLRv5y6zRazdFCEiYWO80vt9e949ZLyRlQE
	hNfCDRHSZCJnRx3HD6hGgyMWieYVNnxW93Bt2IRXP0XMe78uGQ/2zGd2lT06tSTaq/X0bjQjKtI
	pqu0pRViNucm76qklfPXneXAhqpwYChJRfaqdth0zqcQ5m9vmhZS6dFcIdP/ztn9wcIkOPGqd+g
	ToDVzVP9yTqcpldDvnHqiJWoiQ8mPcaefIU8YaLl8uvYX
X-Google-Smtp-Source: AGHT+IFNJ3k2Jd6YqvnePVPezggYrFvdtN2cprYFtJsXb3luDpwyEXMpH57sl8ziAFha5F2VyERQWQ==
X-Received: by 2002:a17:903:1983:b0:24c:cca1:7cfc with SMTP id d9443c01a7336-26813f01439mr46507205ad.59.1758146166263;
        Wed, 17 Sep 2025 14:56:06 -0700 (PDT)
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
Subject: [PATCH v4 12/18] xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration
Date: Wed, 17 Sep 2025 23:55:32 +0200
Message-ID: <4495c8103548447f9a11963574a4cb9e01090e7a.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/cpufeature.c             |  1 +
 xen/arch/riscv/include/asm/cpufeature.h |  1 +
 xen/arch/riscv/include/asm/page.h       |  8 ++
 xen/arch/riscv/p2m.c                    | 97 ++++++++++++++++++++++++-
 4 files changed, 103 insertions(+), 4 deletions(-)

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
index 768b84b769..5f756c76db 100644
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
index cb303af0c0..4fa0556073 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -74,6 +74,14 @@
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
index 10acfa0a9c..2d4433360d 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -10,6 +10,7 @@
 #include <xen/sched.h>
 #include <xen/sections.h>
 
+#include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/flushtlb.h>
 #include <asm/paging.h>
@@ -288,6 +289,18 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
     return __map_domain_page(p2m->root + root_table_indx);
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
@@ -318,11 +331,87 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
     p2m_write_pte(p, pte, clean_pte);
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
+     * necesssary to set A and D bits.
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
+    switch ( t )
+    {
+    case p2m_mmio_direct_io:
+        e.pte |= PTE_PBMT_IO;
+        break;
+
+    default:
+        break;
+    }
+
+    pte_set_mfn(&e, mfn);
+
+    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK) || mfn_eq(mfn, INVALID_MFN));
+
+    if ( !is_table )
+    {
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
@@ -580,7 +669,7 @@ static int p2m_set_entry(struct p2m_domain *p2m,
         p2m_clean_pte(entry, p2m->clean_dcache);
     else
     {
-        pte_t pte = p2m_pte_from_mfn(mfn, t);
+        pte_t pte = p2m_pte_from_mfn(mfn, t, false);
 
         p2m_write_pte(entry, pte, p2m->clean_dcache);
 
-- 
2.51.0


