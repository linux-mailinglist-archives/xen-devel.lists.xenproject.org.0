Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18734AD3808
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010787.1389032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfl-00065B-LK; Tue, 10 Jun 2025 13:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010787.1389032; Tue, 10 Jun 2025 13:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfl-00061h-Gb; Tue, 10 Jun 2025 13:05:49 +0000
Received: by outflank-mailman (input) for mailman id 1010787;
 Tue, 10 Jun 2025 13:05:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyfk-0004Sm-9I
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:48 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f62feb6-45fb-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 15:05:46 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ad572ba1347so792286266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:46 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:44 -0700 (PDT)
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
X-Inumbo-ID: 9f62feb6-45fb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560746; x=1750165546; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXarRpVA36z28lQ7RkHAs0DFKKfiVvul0XZ2J2qt7Hc=;
        b=fVYEyRUTdngjtzd2Povt507A8TYl0D8f8YxlkeceNZ2XiFNkCyKSJpdqVrE30ayccy
         m0QxdQGH8WR17XAzKeeh0FpqmSjaWsCF8KLt1t47xrCORgKR2tPwz08XjDXtos05NGKC
         +AGyvvhjqgqQpiVHXUS8/5mYpYQKXpqWRhgf/LfgoeA68APnYwrG8Z9XshcJLEj0YN8r
         npHOf0k93NbHD+oSIuPYuLJXFBtZ4Iix/fMMQvxD6ydF5suqJwQNsPQKrCh7CAVIf492
         nLjLmg+HLzadMKomUTGV1Xd15HcJGVhkS0j1SGfPpC3Wdx9T1CJ7Vd2PuHDfLbrvm4Mo
         qRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560746; x=1750165546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXarRpVA36z28lQ7RkHAs0DFKKfiVvul0XZ2J2qt7Hc=;
        b=AbGEe0Z7OR8CiDg6Rdc3Q4KBZ/vVlG8MkgLB9+LaptC2+EE00kznR+4l3ps8vxtleZ
         Ia8Wh/4m8kE9+7g/nJwP4pRtlMyfI/835FUrrosp5pFnSXdbZjq0zLH+sc5z81aa1WKW
         rGA4MAcceNKvmgx9b2U0yC6nLddMc7nbpOU0rhhocy4QBH5YcQw0k8VZqKwg17xEojf6
         cW5sHnuASaIC00+2P3Rcg21hEm1CQ/+TDl0izAge9MvwyUf0fRoCe6cOw7OGO9AUZBiA
         afKWjXQjWO8yv2XfGcW7ySxlZiihcyCrMvbu7wjzqdk4U2V265DFpfQ/ECb7ZVc8/BXH
         TCMg==
X-Gm-Message-State: AOJu0YwchGeNSS1uYFHJoSPItlTHctNStFyDX1+ttqDs/U7orKVaovoT
	32ZCj9Ka9YoV1UpzSehnl5IVGZO+c672Yi2XecYmwB5pwblH9niud3R/JfzlGg==
X-Gm-Gg: ASbGncug+w1Au9KKMryODUuRIJ6tFQ4Y3Up+owr2Vbx+2mzecl8RvVuB7UfbZciVn3m
	LuhfEfn3MjwnBEDL/P792rO5l1Y97KTUWgu3UkEZi/TrNvGpan1SAl8pYVv9cr0z0r7Ps+MQsk6
	cKTrwImCvloVNIGhAWB+WEnAvQ8edT9kqkJnXA9Tsxkih6KLH9LBn2tUu8gI9esdX/TUKYtLiy8
	o63bsxvckQL1N6bNvsYNTGio34S0V+lS3I0GXvNpWegEeAMtiE3nBNvtt28nZXgY264rRsSzYxe
	GqdaaX+hCH/obvIuUuoZHnLd8GSJ2mDaQu3OKL8JYVOXp35JszHzNJrigwI7gFetMG5/OvqBRtF
	3/QXUPQUzAIBfrU6b9Bu6nc5bL8Hy
X-Google-Smtp-Source: AGHT+IHwyPiGJS37+PX0GdCY66Zwx/DKdObjhSV3s5pHoY4KpTJ/uOq0y2ZsmygVOv78BL+hNDPXxA==
X-Received: by 2002:a17:907:7fa9:b0:ad8:9257:5733 with SMTP id a640c23a62f3a-ade1a905a8cmr1303884166b.20.1749560744967;
        Tue, 10 Jun 2025 06:05:44 -0700 (PDT)
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
Subject: [PATCH v2 05/17] xen/riscv: introduce things necessary for p2m initialization
Date: Tue, 10 Jun 2025 15:05:20 +0200
Message-ID: <443cb3566a60dcb5d5440c72410ff6d76a010a58.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the following things:
- Update p2m_domain structure, which describe per p2m-table state, with:
  - lock to protect updates to p2m.
  - pool with pages used to construct p2m.
  - clean_pte which indicate if it is requires to clean the cache when
    writing an entry.
  - radix tree to store p2m type as PTE doesn't have enough free bits to
    store type.
  - default_access to store p2m access type for each page in the domain.
  - back pointer to domain structure.
- p2m_init() to initalize members introduced in p2m_domain structure.
- Introudce p2m_write_lock() and p2m_is_write_locked().
- Introduce p2m_force_tlb_flush_sync() to flush TLBs after p2m table
  update.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Use introduced erlier sbi_remote_hfence_gvma_vmid() for proper implementation
   of p2m_force_tlb_flush_sync() as TLB flushing needs to happen for each pCPU
   which potentially has cached a mapping, what is tracked by d->dirty_cpumask.
 - Drop unnecessary blanks.
 - Fix code style for # of pre-processor directive.
 - Drop max_mapped_gfn and lowest_mapped_gfn as they aren't used now.
 - [p2m_init()] Set p2m->clean_pte=false if CONFIG_HAS_PASSTHROUGH=n.
 - [p2m_init()] Update the comment above p2m->domain = d;
 - Drop p2m->need_flush as it seems to be always true for RISC-V and as a
   consequence drop p2m_tlb_flush_sync().
 - Move to separate patch an introduction of root page table allocation.
---
 xen/arch/riscv/include/asm/p2m.h | 39 +++++++++++++++++++++
 xen/arch/riscv/p2m.c             | 58 ++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 359408e1be..9570eff014 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -3,6 +3,10 @@
 #define ASM__RISCV__P2M_H
 
 #include <xen/errno.h>
+#include <xen/mem_access.h>
+#include <xen/mm.h>
+#include <xen/radix-tree.h>
+#include <xen/rwlock.h>
 #include <xen/types.h>
 
 #include <asm/page-bits.h>
@@ -14,6 +18,29 @@
 
 /* Per-p2m-table state */
 struct p2m_domain {
+    /*
+     * Lock that protects updates to the p2m.
+     */
+    rwlock_t lock;
+
+    /* Pages used to construct the p2m */
+    struct page_list_head pages;
+
+    /* Indicate if it is required to clean the cache when writing an entry */
+    bool clean_pte;
+
+    struct radix_tree_root p2m_type;
+
+    /*
+     * Default P2M access type for each page in the the domain: new pages,
+     * swapped in pages, cleared pages, and pages that are ambiguously
+     * retyped get this access type.  See definition of p2m_access_t.
+     */
+    p2m_access_t default_access;
+
+    /* Back pointer to domain */
+    struct domain *domain;
+
     /* Current VMID in use */
     uint16_t vmid;
 };
@@ -107,6 +134,18 @@ void p2m_vmid_allocator_init(void);
 
 int p2m_init(struct domain *d);
 
+static inline void p2m_write_lock(struct p2m_domain *p2m)
+{
+    write_lock(&p2m->lock);
+}
+
+void p2m_write_unlock(struct p2m_domain *p2m);
+
+static inline int p2m_is_write_locked(struct p2m_domain *p2m)
+{
+    return rw_is_write_locked(&p2m->lock);
+}
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index f33c7147ff..e409997499 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1,13 +1,46 @@
 #include <xen/bitops.h>
+#include <xen/domain_page.h>
 #include <xen/event.h>
+#include <xen/iommu.h>
 #include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/pfn.h>
+#include <xen/rwlock.h>
 #include <xen/sched.h>
 #include <xen/spinlock.h>
 #include <xen/xvmalloc.h>
 
+#include <asm/page.h>
 #include <asm/p2m.h>
 #include <asm/sbi.h>
 
+/*
+ * Force a synchronous P2M TLB flush.
+ *
+ * Must be called with the p2m lock held.
+ */
+static void p2m_force_tlb_flush_sync(struct p2m_domain *p2m)
+{
+    struct domain *d = p2m->domain;
+
+    ASSERT(p2m_is_write_locked(p2m));
+
+    sbi_remote_hfence_gvma_vmid(d->dirty_cpumask, 0, 0, p2m->vmid);
+}
+
+/* Unlock the flush and do a P2M TLB flush if necessary */
+void p2m_write_unlock(struct p2m_domain *p2m)
+{
+    /*
+     * The final flush is done with the P2M write lock taken to avoid
+     * someone else modifying the P2M wbefore the TLB invalidation has
+     * completed.
+     */
+    p2m_force_tlb_flush_sync(p2m);
+
+    write_unlock(&p2m->lock);
+}
+
 static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
 
 /*
@@ -109,8 +142,33 @@ int p2m_init(struct domain *d)
     spin_lock_init(&d->arch.paging.lock);
     INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
 
+    rwlock_init(&p2m->lock);
+    INIT_PAGE_LIST_HEAD(&p2m->pages);
+
     p2m->vmid = INVALID_VMID;
 
+    p2m->default_access = p2m_access_rwx;
+
+    radix_tree_init(&p2m->p2m_type);
+
+#ifdef CONFIG_HAS_PASSTHROUGH
+    /*
+     * Some IOMMUs don't support coherent PT walk. When the p2m is
+     * shared with the CPU, Xen has to make sure that the PT changes have
+     * reached the memory
+     */
+    p2m->clean_pte = is_iommu_enabled(d) &&
+        !iommu_has_feature(d, IOMMU_FEAT_COHERENT_WALK);
+#else
+    p2m->clean_pte = false;
+#endif
+
+    /*
+     * "Trivial" initialisation is now complete.  Set the backpointer so the
+     * users of p2m could get an access to domain structure.
+     */
+    p2m->domain = d;
+
     rc = p2m_alloc_vmid(d);
     if ( rc )
         return rc;
-- 
2.49.0


