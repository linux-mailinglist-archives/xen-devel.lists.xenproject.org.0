Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0637B17483
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:01:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065923.1431309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhViA-0000Op-IG; Thu, 31 Jul 2025 16:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065923.1431309; Thu, 31 Jul 2025 16:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhViA-0000ME-DN; Thu, 31 Jul 2025 16:00:54 +0000
Received: by outflank-mailman (input) for mailman id 1065923;
 Thu, 31 Jul 2025 16:00:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVgF-0000zK-Pz
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:55 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40911406-6e27-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 17:58:51 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55b8a7a505cso806966e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:51 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:50 -0700 (PDT)
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
X-Inumbo-ID: 40911406-6e27-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977531; x=1754582331; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGuaeyIsrA+iYqDJovnTvqJCdpSjIdCxUfSdeY8yfW4=;
        b=JPQ/BupyJjw/cBjREdS4LQ0+sWRUly5ld7QzK5DueG17Au+WxEInCdYBt2qyiPM8RF
         nUs5DQVNyGPACBvBVRuDGKSE4fJXjjcr00MZD3BnSOiTLTbVz0l5FXCSuclilGGDtuON
         Kzk1MzXF/cRXEVKA4Rf+4b586ZcXboA6veW5A6j8hSUqahwDKKeJUC9kGxet6k5BJD+a
         0QFW+sdsSv8uaIL/PPk73SDsUsio/HkCjX4M1vBVtosZR4MftZqimuo9azdYAnKOAkG1
         h0WvLo/Icd/IQWfEeHP1qwsmhWSHxluSFTrQEu6jA1Hk9gheB0w+euB+tFnOe6CjIH35
         TJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977531; x=1754582331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGuaeyIsrA+iYqDJovnTvqJCdpSjIdCxUfSdeY8yfW4=;
        b=sUEBfGh5zM+//eeyWIOGwMJxQd2o7eMau+xri1mFZEpYNJjhPGW9deSIHMmcJNrRJU
         DwMwjMHUvCWs1dQ0gO18HTGHHpuJrtFnnK97sFGxQEhKzpNBiS0aNYs1FIacxJsIk80Y
         eNNYJiNfw5uJ9OVo2FH/bXNCYD+VLEQrbPNnmgrn+SSN36RP8WmyBaXxZuA0qap4fRvZ
         4eqwVG0R+wqyvHo3MW02qsEnjGxNzLUYjtSX62puIRg34qnep8RHNSivtKYmQqiYuWys
         HMm+9J3HZzWnrXYYZw46W3awNlRbKaYro8SVObfEFVPjRIMqTfrE4lZKGkovBQc429pR
         5Q1g==
X-Gm-Message-State: AOJu0YzYXzke1uY8ANeF7pG6g9eLuCxMTcGwMkWYf2DTnrepDyHFqUH6
	qXZvZVzSBZ0dDa8rXTx9QvRMk2ArIGBvzpohBQmzUsBpDSXY/A8RXBGfjUhZMw==
X-Gm-Gg: ASbGncsovFPLl1MVHMoNvJyhEJoTlet8+cD95NhEijO191GECO8nYIlt6G+7MhkGdk0
	rRfqdXcqz8XMgXBBf3TpnAMxx27FQtS1rtHMD4WE0vWabaigPA76H7fndV2HhMkMEBZr8oEJ9ic
	qsxZ+E8FuDuf8IDijPh0wXjurrlrWexqOTJL2ZOOxK8ZrBgKJoHjR+87YBk/R1fD1CJWghVCigW
	HwyqA86XRY6zeSmymwZPnHLCnLKIyP4AGoOH6GMHSlSu2KWIIE5gHZL6AslnJggWuGcfsiywJ1q
	9oGL0HsiFntfdlx3fDEfleoPJof4MNLiZwfX0+yUgiz+RWHeSVocZrMqHC652Vm/aVn94oZfgM1
	wyfpZGxLsUTr8rH6L3c+KRDIfGQSQnT8vmx5OM/v3WJYn5apMlofxhSqgKQ2OVA==
X-Google-Smtp-Source: AGHT+IEsoeeagjmyHtu3wRT1JJsdymImNNNZGlYuJEOxoAoCVJ5nrkWRU3SLoRJ4U+L/sovz48KQDg==
X-Received: by 2002:a05:6512:401f:b0:553:37a7:b217 with SMTP id 2adb3069b0e04-55b7c05ab12mr3091160e87.35.1753977530514;
        Thu, 31 Jul 2025 08:58:50 -0700 (PDT)
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
Subject: [PATCH v3 14/20] xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration
Date: Thu, 31 Jul 2025 17:58:13 +0200
Message-ID: <1370613cd6f52e90591b15ad52c95d7c81908cf6.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
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

PBMT type encoding support:
- Introduces an enum pbmt_type_t to represent the PBMT field values.
- Maps types like p2m_mmio_direct_dev to p2m_mmio_direct_io, others default
  to pbmt_pma.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/page.h |  8 +++
 xen/arch/riscv/p2m.c              | 81 +++++++++++++++++++++++++++++--
 2 files changed, 85 insertions(+), 4 deletions(-)

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
index 2467e459cc..efc7320619 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1,3 +1,4 @@
+#include <xen/bug.h>
 #include <xen/domain_page.h>
 #include <xen/mm.h>
 #include <xen/rwlock.h>
@@ -197,6 +198,18 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
     return __map_domain_page(p2m->root + root_table_indx);
 }
 
+static int p2m_set_type(pte_t *pte, p2m_type_t t)
+{
+    int rc = 0;
+
+    if ( t > p2m_ext_storage )
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
@@ -222,11 +235,71 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
     p2m_write_pte(p, pte, clean_pte);
 }
 
-static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t)
+static void p2m_set_permission(pte_t *e, p2m_type_t t)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    e->pte &= ~PTE_ACCESS_MASK;
+
+    switch ( t )
+    {
+    case p2m_grant_map_rw:
+    case p2m_ram_rw:
+        e->pte |= PTE_READABLE | PTE_WRITABLE;
+        break;
+
+    case p2m_ext_storage:
+    case p2m_mmio_direct_io:
+        e->pte |= PTE_ACCESS_MASK;
+        break;
+
+    case p2m_invalid:
+        e->pte &= ~(PTE_ACCESS_MASK | PTE_VALID);
+        break;
+
+    case p2m_grant_map_ro:
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
+    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK));
+
+    if ( !is_table )
+    {
+        p2m_set_permission(&e, t);
+
+        if ( t < p2m_ext_storage )
+            p2m_set_type(&e, t);
+        else
+            panic("unimplemeted\n");
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
@@ -469,7 +542,7 @@ static int p2m_set_entry(struct p2m_domain *p2m,
         p2m_clean_pte(entry, p2m->clean_pte);
     else
     {
-        pte_t pte = p2m_pte_from_mfn(mfn, t);
+        pte_t pte = p2m_pte_from_mfn(mfn, t, false);
 
         p2m_write_pte(entry, pte, p2m->clean_pte);
 
-- 
2.50.1


