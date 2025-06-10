Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DB4AD3810
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:06:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010797.1389103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfx-0008L8-2h; Tue, 10 Jun 2025 13:06:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010797.1389103; Tue, 10 Jun 2025 13:06:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfw-0008CX-L9; Tue, 10 Jun 2025 13:06:00 +0000
Received: by outflank-mailman (input) for mailman id 1010797;
 Tue, 10 Jun 2025 13:05:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyft-0004Sm-Qc
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:57 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4ee2047-45fb-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 15:05:55 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ade4679fba7so484721166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:55 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:54 -0700 (PDT)
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
X-Inumbo-ID: a4ee2047-45fb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560755; x=1750165555; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkn+ztvbcliHnyvY4DdG5JO4oKukWMaE/1eHKVZZcwQ=;
        b=OEBIKFzvPJhORclc8ZoqwHQENJQ/lL5gZVFXsCrdCtxIYA329GGRHT1p7nGbKkBy7E
         EZ4w+QTGjLF+Es5WD1wrJpQ2WsFwMeFKhr2j5Om/NAJKW+ZInkgciIioVa154z2zzu51
         fd+7DKcZo1QaYXDsBRH6Uus0GZw/bXTbrdlS/dxlGJI4WiuswpHdXPDCtm8nRp0cHPdH
         xUqrNnt0pq2H/f7GE9Ph/eSehOmGI9CaELTijdsQy/FHeDbaSnXMbNxuGEAah4ZaPgRE
         jRUrSVZQjl42PmTQK025Y/hG8/plIZb8yDmSGfTv7JFISiEMbArcyBioJo1s3medrdG5
         J4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560755; x=1750165555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkn+ztvbcliHnyvY4DdG5JO4oKukWMaE/1eHKVZZcwQ=;
        b=Hv9uuiYjPFh+576Cl9e6xOFE555iJfLged3SUOAnYpwd/nF5p3JD6GfY0UqywbZ/nt
         S04jf0eADKUaDsP4F4qknGHZBosHk52dOLQG6zKwkDxPuGK6AWgKl+JXlD+UsYniY7Md
         EFfMzmWXFdCZDu488hq2M1jLJSo7VG4mKpoWs8M7q5PovlpriWi4cVz5oLqDxExQuu7b
         74MFvWOogfQOFQNW0d6er4Ab64TD1p+ECYhOsrd/FQaltPXFNH2S+oQ+RQGxnn8t7b28
         3j9pMFvSS921tGfMyg/r+kWPkZ+4d0ui9N2MrPW4uFYsb1a3dYqkyzCg2a8LsC9GPi4N
         3uVQ==
X-Gm-Message-State: AOJu0YzrlqA7Odzr5pXhZXzoPf5XoeIO1LtK1KtxcZ2AZWJNCJx0tTr+
	tnFaS/UWoEbNYhLi9DAskmY3gWzHK1vqqWsYRc00J/86u3AB3Ge7H9uHADjdBQ==
X-Gm-Gg: ASbGncuHf9KhMwg0TRJb8w2Gn0U+jZyS8KbuHtTiiu7ARSnVGIHRvEkhmPLJS96pfr4
	5w2fErqdjJ+nYXYRDmOjSz+OCFdksW3EZacmP3aKdgPNwYn89A8qNdwnEk8O5ZxN8B40CpwQ7TA
	4t6bsKuGYqZ8jPP2cwcS1nOvqR0S8KGQjksQu0PgJRph7Ru4jNwZS3KugG6Uqb1js6gY3OPWB53
	2Qoi4iQgZ533aIxkCBnuDD1V30rzVCHCmpW7On1FEByjZ8EzXpZgpNFyUMBFWttfsFf02YvPzSi
	rp06hkY2H9c4DSDlG1CORi3YwiSe+0/whhiJvQTxSUcKM5deKpAKgEV5rS3y6Qzm3QBBplr2nPJ
	VU4nfW3aXBt9L4uX7W4wwiWLW9n0f
X-Google-Smtp-Source: AGHT+IFOKSIAXyNkA2Zfv91wJ8RYYuzvX7isb+GzFl8frSbbvBaTOWNsZDjJc4chk24vwzsmEl4ICg==
X-Received: by 2002:a17:907:9721:b0:ad8:af1f:938d with SMTP id a640c23a62f3a-ade1ab1fa84mr1436480066b.37.1749560754641;
        Tue, 10 Jun 2025 06:05:54 -0700 (PDT)
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
Subject: [PATCH v2 13/17] xen/riscv: Implement p2m_entry_from_mfn() and support PBMT configuration
Date: Tue, 10 Jun 2025 15:05:28 +0200
Message-ID: <994ab3dd6822c4cd02a6a576041da115abeff6ed.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds the initial logic for constructing PTEs from MFNs in the RISC-V
p2m subsystem. It includes:
- Implementation of p2m_entry_from_mfn(): Generates a valid PTE using the
  given MFN, p2m_type_t, and p2m_access_t, including permission encoding and
  PBMT attribute setup.
- New helper p2m_set_permission(): Encodes access rights (r, w, x) into the
  PTE based on both p2m type and access permissions.
- p2m_type_radix_set(): Stores the p2m type in a radix tree keyed by the PTE
  for later retrieval.

PBMT type encoding support:
- Introduces an enum pbmt_type_t to represent the PBMT field values.
- Maps types like p2m_mmio_direct_dev to pbmt_io, others default to pbmt_pma.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - New patch. It was a part of a big patch "xen/riscv: implement p2m mapping
   functionality" which was splitted to smaller.
---
 xen/arch/riscv/include/asm/page.h |   8 +++
 xen/arch/riscv/p2m.c              | 103 ++++++++++++++++++++++++++++--
 2 files changed, 107 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index c67b9578c9..1d1054fa5c 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -76,6 +76,14 @@
 #define PTE_SMALL       BIT(10, UL)
 #define PTE_POPULATE    BIT(11, UL)
 
+enum pbmt_type_t {
+    pbmt_pma,
+    pbmt_nc,
+    pbmt_io,
+    pbmt_rsvd,
+    pbmt_max,
+};
+
 #define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
 
 #define PTE_PBMT_MASK   (PTE_PBMT_NOCACHE | PTE_PBMT_IO)
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 6b11e87b22..cba04acf38 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -345,6 +345,26 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
     return __map_domain_page(p2m->root + root_table_indx);
 }
 
+static int p2m_type_radix_set(struct p2m_domain *p2m, pte_t pte, p2m_type_t t)
+{
+    int rc;
+    gfn_t gfn = mfn_to_gfn(p2m->domain, mfn_from_pte(pte));
+
+    rc = radix_tree_insert(&p2m->p2m_type, gfn_x(gfn),
+                           radix_tree_int_to_ptr(t));
+    if ( rc == -EEXIST )
+    {
+        /* If a setting already exists, change it to the new one */
+        radix_tree_replace_slot(
+            radix_tree_lookup_slot(
+                &p2m->p2m_type, gfn_x(gfn)),
+            radix_tree_int_to_ptr(t));
+        rc = 0;
+    }
+
+    return rc;
+}
+
 static p2m_type_t p2m_type_radix_get(struct p2m_domain *p2m, pte_t pte)
 {
     void *ptr;
@@ -389,12 +409,87 @@ static inline void p2m_remove_pte(pte_t *p, bool clean_pte)
     p2m_write_pte(p, pte, clean_pte);
 }
 
-static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn,
-                                p2m_type_t t, p2m_access_t a)
+static void p2m_set_permission(pte_t *e, p2m_type_t t, p2m_access_t a)
 {
-    panic("%s: hasn't been implemented yet\n", __func__);
+    /* First apply type permissions */
+    switch ( t )
+    {
+    case p2m_ram_rw:
+        e->pte |= PTE_ACCESS_MASK;
+        break;
+
+    case p2m_mmio_direct_dev:
+        e->pte |= (PTE_READABLE | PTE_WRITABLE);
+        e->pte &= ~PTE_EXECUTABLE;
+        break;
+
+    case p2m_invalid:
+        e->pte &= ~PTE_ACCESS_MASK;
+        break;
+
+    default:
+        BUG();
+        break;
+    }
+
+    /* Then restrict with access permissions */
+    switch ( a )
+    {
+    case p2m_access_rwx:
+        break;
+    case p2m_access_wx:
+        e->pte &= ~PTE_READABLE;
+        break;
+    case p2m_access_rw:
+        e->pte &= ~PTE_EXECUTABLE;
+        break;
+    case p2m_access_w:
+        e->pte &= ~(PTE_READABLE | PTE_EXECUTABLE);
+        e->pte &= ~PTE_EXECUTABLE;
+        break;
+    case p2m_access_rx:
+    case p2m_access_rx2rw:
+        e->pte &= ~PTE_WRITABLE;
+        break;
+    case p2m_access_x:
+        e->pte &= ~(PTE_READABLE | PTE_WRITABLE);
+        break;
+    case p2m_access_r:
+        e->pte &= ~(PTE_WRITABLE | PTE_EXECUTABLE);
+        break;
+    case p2m_access_n:
+    case p2m_access_n2rwx:
+        e->pte &= ~PTE_ACCESS_MASK;
+        break;
+    default:
+        BUG();
+        break;
+    }
+}
+
+static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t, p2m_access_t a)
+{
+    pte_t e = (pte_t) { 1 };
+
+    switch ( t )
+    {
+    case p2m_mmio_direct_dev:
+        e.pte |= PTE_PBMT_IO;
+        break;
+
+    default:
+        break;
+    }
+
+    p2m_set_permission(&e, t, a);
+
+    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK));
+
+    pte_set_mfn(&e, mfn);
+
+    BUG_ON(p2m_type_radix_set(p2m, e, t));
 
-    return (pte_t) { .pte = 0 };
+    return e;
 }
 
 #define GUEST_TABLE_MAP_NONE 0
-- 
2.49.0


