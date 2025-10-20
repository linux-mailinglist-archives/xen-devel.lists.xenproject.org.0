Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 771E4BF2520
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 18:10:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146747.1479132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsSl-00011b-Jb; Mon, 20 Oct 2025 16:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146747.1479132; Mon, 20 Oct 2025 16:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsSl-0000yX-GB; Mon, 20 Oct 2025 16:10:23 +0000
Received: by outflank-mailman (input) for mailman id 1146747;
 Mon, 20 Oct 2025 16:10:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsHB-0004DQ-40
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:25 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b38b44e-adcd-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:58:23 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-63bea08a326so6228009a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:23 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:22 -0700 (PDT)
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
X-Inumbo-ID: 9b38b44e-adcd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975903; x=1761580703; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nz0v58uF65Nd3P7Kv3kK5wYJ8EXqQLEhGN0DKb0NQDM=;
        b=mZBRH9phAyu9TqNVI/kLcmzijXXbma+t+1jjVOgmcU7zc0D+A/PeqJfKslgFvq9Qtg
         /pgJyuKDij8INphjAiuJBRenLXaEWrw5AYfFLrZPUrPK/re80ssQovTwConRILyv+wVh
         QUbpqxsBmd6K8uvOXsvc1Zo8ZGNL6jlx4/QV15z2HDGwiENKbN8OUM4PTLu0KbBy8hjn
         3zKkOEM/Dn8sgInGV1s6BSL/MuM42Urhlr2Ycdy3BLDiLrlH45X86d2WIYi5IwrnUhKv
         yRYtbSFwOttoMzj+Vwuns71B9D4Y/4N4/Fh6kOuERY7qaAqzBtyDJHvZHphNR4VC4F0K
         EdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975903; x=1761580703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nz0v58uF65Nd3P7Kv3kK5wYJ8EXqQLEhGN0DKb0NQDM=;
        b=V4VHHG9X+AlfejI9Ywg3fni1hdcbjbfvOTB1fGYEAOeVwV9ehNJ387dyXPZ9RTiuPF
         PHJv4dZv5EYm+Id/SKsgjO+hZukUPrg91hJ/vfszpGkejzQaG7IsXHR3PNccsCG5e3iE
         WXpgoeLqWk0hq7mN25BkXWNrWlakUipOH/UosjKq4Y4aghgQql/pfkDXB1fZvkVDvaBU
         37UirZEhfS9g6OMPG8IsZX3Ykw7s3tpgulD7E7HTIwInYVEZ3e39RMa4gS9m/ErDszaX
         zgkidrgjTpiQ8UpSVCDqeUsb4GAXXLCWe0hKoD3VFvyxEjgRseapy8WJYdS8r9jvnfrI
         CfPg==
X-Gm-Message-State: AOJu0Yxjp9q+W9gLQS6qbVNiur122GXS3R5AUXyORmAup7X0XsElehN+
	EHR8LMR4Nv8A3ort7TXPl9gk/MDaCjnwJ4U4iVlbTK8WVIXc3fYcFajbD3cn2w==
X-Gm-Gg: ASbGncv6V24h9dBtVDO7lrimHUw8X6WUEj/2u3Z7ort1cPfKDwAF72ImXSgiy1kp9+I
	ai0QH/4ezrUVShm2kO5mTsxN2AWpmlDsan1Fwo9ESu+Jt5HTrBgK7JNLUrEpJ0OZ2vdaC4Vyfny
	buj7ISQHEVgQHjnCKQPrcCrkFRvdq0ph7nLWR1O1Oww47nJGIpIyujHGzbRLkrBdnV8V2W/hrhN
	UIitz1onTzOg3zwpXAg39SiZeXbrW+rVuJdTfs6thoVapqU3fFel7+tT3jjiJrnb92QhrNgQhUS
	XgXu4P8SK/EkZAxbhmx1PVhEtCNXjvWNJb7l+rC0U6cr/5Y5IP0vqOQhe+kheHnPlFoZCn7EBQy
	JF8xU/aZyuJxqoUlfpYiZdGyStlfuSK0vtWNvgImn4XgY8BLz3YXcwOwdLGUO3aa4Y+Rkxtcfkx
	GxMbpnXhJxeLW8wCZbyoTgtWWbjgkFlpZG3p6GzJZbZDvldiX0CqaawWZSiw==
X-Google-Smtp-Source: AGHT+IEfYFc25cCt39crucM9yAo5pb9EXJm0xsv9gKYbKcmDrTb+dHZrIkVBUdS6hkSITmcBDmUzRA==
X-Received: by 2002:a17:907:6d02:b0:b63:2000:72c8 with SMTP id a640c23a62f3a-b6474543490mr1481213666b.62.1760975902512;
        Mon, 20 Oct 2025 08:58:22 -0700 (PDT)
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
Subject: [for 4.22 v5 12/18] xen/riscv: Implement p2m_pte_from_mfn() and support PBMT configuration
Date: Mon, 20 Oct 2025 17:57:55 +0200
Message-ID: <ff69e96dbb17e38e10468454d534061388201680.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
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
index 78e53981ac..4b6baeaaf2 100644
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
index 71b211410b..f4658e2560 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -11,6 +11,7 @@
 #include <xen/sections.h>
 #include <xen/xvmalloc.h>
 
+#include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/flushtlb.h>
 #include <asm/paging.h>
@@ -349,6 +350,18 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
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
@@ -379,11 +392,102 @@ static inline void p2m_clean_pte(pte_t *p, bool clean_pte)
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
@@ -638,7 +742,7 @@ static int p2m_set_entry(struct p2m_domain *p2m,
         p2m_clean_pte(entry, p2m->clean_dcache);
     else
     {
-        pte_t pte = p2m_pte_from_mfn(mfn, t);
+        pte_t pte = p2m_pte_from_mfn(mfn, t, false);
 
         p2m_write_pte(entry, pte, p2m->clean_dcache);
 
-- 
2.51.0


