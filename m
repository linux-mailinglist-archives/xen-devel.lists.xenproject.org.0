Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A68A0C807C9
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:34:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170581.1495754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVm4-0005Sf-Ff; Mon, 24 Nov 2025 12:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170581.1495754; Mon, 24 Nov 2025 12:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVm4-0005EZ-3t; Mon, 24 Nov 2025 12:34:32 +0000
Received: by outflank-mailman (input) for mailman id 1170581;
 Mon, 24 Nov 2025 12:34:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVlz-0001zv-Rk
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:27 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e89166d3-c931-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:34:24 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b7697e8b01aso268226266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:24 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:22 -0800 (PST)
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
X-Inumbo-ID: e89166d3-c931-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987663; x=1764592463; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXqp4I0XZWh9/KhS0j7ysczQhIFrqLu1XKQnOd0ZyHw=;
        b=A9lqi8CvY/SONcAcC58I69mHOU41xTALl38UVipz7jfQsLlo4+cXcyyUH8PDpmkFvC
         UzXsO0gyupWVwBKUPSdq4QVEMsfBbo1LLpeaV39FMpJ0Q7TqsMH6JtGgCYT7mjYJBVr5
         2/Rti/O0r+M55TGCk5jcuqhVMqujjRYs/YtsOUwsCITUCsc+P/4Xv73TqaCIc/P3gniL
         KdLhcFqHdVg0plFPoROuEz9SxYYoYsny3dxtVXKZJQqGjPfTnRS3FYAukraBRrGXYuz+
         Enw1LgexuNA7h7MUWS+ivA3wnrYhcpdsCaL3gF8kc9T+WWR+DGtcvsGuH0urufuDflpr
         1jOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987663; x=1764592463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IXqp4I0XZWh9/KhS0j7ysczQhIFrqLu1XKQnOd0ZyHw=;
        b=Afr56uFvd9AoqQd0/TyRyBNHibKF0JfAQjkJrBDSQfHT1VH1EynSf6o6n42qGRy1iT
         yojZDafS9J6wInt70hSjE7TBWX/U7HCWISG+0y4rXuIIwyJV/4lLV5GYd5vpmifRrZ4p
         gjVgZ6NcMiBj4/VVA7xXuXrfRu63+ewO5jX0nfjLQjG4joR6kTobFt4TS+cPnLmYETpK
         L2N58Pq7g2k+zR051VDQ/8NnzooLlIyQazMAblPWRUYzo8z0GyNHZBRxlTd+bPqIdDUq
         +HJumC+frJ3CcQ8iZq5RQMsnKZ+mscxIOAxH2HxwT3GMQbNLfJHDDLV5NZJYgkHGJTLr
         z2kQ==
X-Gm-Message-State: AOJu0Yz66f6yKkElFvUKFkePqQ2DB80wYdjBWtoHfVn+OzeoMKk/tiGi
	zsh4t/ZW6fDC4KlpWz9Nt7cPJwdCV0tg6IJphBNtVSV+jnLjLV6nNy1Gq7Q21jbg
X-Gm-Gg: ASbGncuLn/omu52dleYZRdBfXfYlD5nd3cNXozqzW9TwDmyByLpaZXISm1ILEm//AV5
	nhBDqee83uMEZVIo65shQ4/ay3y8naWuxvpw+2YOURC3gzpHBDWftUiSbIQ9qMBQ+lWCUSme9Zw
	eklIA/ENiR3UbkLSCUtes/ijikmXd4J+A+2nrk6Op39vOqJpP1lvGZSCL5xR7hfPs66Zs6JpI1v
	XP/uf+43M2wOiJz06vbcIGtqK777PToJlyWnRcICyQ5s5jT0dSErcCnub6YlmZK8CI8lFy1AEuH
	MHeevZNsajuOpRqw4B1tfIAEcfkyEWijOUUkuWOeCJvFrWPoCXBP+I1NrQ36UFuaz1W3Gsgua5R
	zROjn0dBtiAiD4yRy1UPD9R/pamrt92MbrHH2M7Ksl6Trs4fJpmQjPpFfyoRxMliP46Vd6f1XKv
	MbS/eF5YY5mTL8ltr3IQlfBQdQwyBwCf/1iXMwrI2uUp8SjrcP6zrnhcM=
X-Google-Smtp-Source: AGHT+IHXcNKK5ta3WIfAn0m9iuUk3YzGUqiKrj+fQUgGCkq/+Lm8UJiBiX9ehHVX40fWMWJNXGn/NQ==
X-Received: by 2002:a17:907:b17:b0:b76:7e0e:4888 with SMTP id a640c23a62f3a-b767e0e64d2mr778174966b.6.1763987663154;
        Mon, 24 Nov 2025 04:34:23 -0800 (PST)
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
Subject: [PATCH v6 13/19] xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration
Date: Mon, 24 Nov 2025 13:33:46 +0100
Message-ID: <bf3b296606e932dcbd29d06b962b7ea8db392e20.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=all
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
index 66cb192316..c6b7acf1b7 100644
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
index f8af73c9d8..8761204720 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -11,6 +11,7 @@
 #include <xen/sections.h>
 #include <xen/xvmalloc.h>
 
+#include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/flushtlb.h>
 #include <asm/p2m.h>
@@ -360,6 +361,18 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
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
@@ -390,11 +403,102 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_cache)
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
@@ -649,7 +753,7 @@ static int p2m_set_entry(struct p2m_domain *p2m,
         p2m_clean_pte(entry, p2m->clean_dcache);
     else
     {
-        pte_t pte = p2m_pte_from_mfn(mfn, t);
+        pte_t pte = p2m_pte_from_mfn(mfn, t, false);
 
         p2m_write_pte(entry, pte, p2m->clean_dcache);
 
-- 
2.51.1


