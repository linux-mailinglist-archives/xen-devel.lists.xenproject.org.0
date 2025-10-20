Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778EFBF2405
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:58:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146534.1478992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH5-0005fs-Fy; Mon, 20 Oct 2025 15:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146534.1478992; Mon, 20 Oct 2025 15:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH5-0005bV-6Q; Mon, 20 Oct 2025 15:58:19 +0000
Received: by outflank-mailman (input) for mailman id 1146534;
 Mon, 20 Oct 2025 15:58:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsH3-0004nC-7n
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:17 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95ea76c2-adcd-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 17:58:14 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b3ee18913c0so870538066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:14 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:13 -0700 (PDT)
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
X-Inumbo-ID: 95ea76c2-adcd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975894; x=1761580694; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wecPnZFJv0wnMS4ig6zr3MGm5VBHMau7nZwYYP2IRvA=;
        b=J+JGg8e06sxdtJoZZzHvJnio8X767UEvYyWTUF4K7gmGH6QLbGrM4YP59/3dmYNzMe
         V/l3djYvKtYO6c2fP8iHFaWrhPMCcQ+BpGlM1NWH9GoAbVSL9fd2PBHpzAOTmCHMlXt9
         9YaQ9b5a2EOt0qo6pxbLRlolX/eumHJ7rKn2Lj/jgMosrsxVo0QV01L4iC3LwdMfXLTX
         DM5tf+qL1f/22IxOhrDr6Zn0f965YPJYwV90JPjr1yUgXWElfs8oUz4Qsow6z+j0cqyc
         wKnxuTQRUzT+bHSifRIQhkNywPNboQcgOfszAi8coG8ORYhlN+yEjciQiqgh+ZhFKrSM
         14sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975894; x=1761580694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wecPnZFJv0wnMS4ig6zr3MGm5VBHMau7nZwYYP2IRvA=;
        b=evr2GY/xZFn6TYwu6kKtQ63efRWiA4YZ5lejsENiRT6l8tSyOtWM2i78ZARmBqn8gE
         /OxBxiEPB5/T3je7CZmprjYuN/pZWUXxvPt4j96zMWLTswvyC/u6BLD/hVLF/VKye8dr
         DqBnPhjf5Hm52nnIDVbXYZJUpOWHBqnWuDRuh0qWoRKCnr7f1grnwDzBB5ji9xQiOy1F
         UQZigjvEqjWzzeozJmdzBlIObUD50Mj7PDAKh0Rxvs/m27fhO1v3RWmAJ2qWbsHGTgeX
         oks8hG7YATb2P71wtn3xeHSTR/LJAGZ7jf9UDJm5qRNzk61E5PojwV/QQSkHnnqw5jIo
         2I1Q==
X-Gm-Message-State: AOJu0YxYi2paf94Bv12wj20mr5vdEUJPobqt5J2a1jw8sdtr+8jZh+PP
	NemvTVm8Iq7QQCAW6yYdHGvSX8BudLX+DvQbZXz44LKxXYf3zl4WTDmU3zPy+A==
X-Gm-Gg: ASbGncs16fbepDdCZ6V78oTOpcgSNreuPIBtJCz/4r7wSsOYhFFgdPiTy48bxn+re5x
	5DR1NOK1pG/YBcEyja8DY+mA2Kge7oEmPRHAaY7rJ31cRcc9fSgjhecinu9+hOetOHOBqGQk+k9
	uGxK64e7rqNPtcl/9UpKZZyXZUlwhlFpsITVVMsqd2m9CEN4aYVJsuMxlgIiUgGVa5/bqxzUgWQ
	w8B6D8//onW0+dXQssFlWZbyLwgMogz+RHtgEbcZDCdE3H2cLYYBJPLskZhXpoVT6bjhQO4Pvqf
	ziNCEIeFlLbuHKGa7R1lhlJImtbiViB6e8M9p8MBDRW89bjM7Q3uFMjthRg/hpzJkI7+fvJpGld
	SF7B5YNpjSwTMTynJbnsiNRknkvUSwYY8mgI4dYvQrOdRDD9vxFTZWxUtdTBCteEHG6rCIeDlpE
	OaH/Doq5ldW4TvPYnSn4pwhzDqw6kqAI89ght+a8BFSybC9Y4bRpMaCl4cpA==
X-Google-Smtp-Source: AGHT+IG1rAVrZN6lyAO+M3rLhzh4FyxcVFnr6yzjtfxJw4qj0QErTQbCo7BJhuzhFlm7zXj9egTUew==
X-Received: by 2002:a17:907:6d02:b0:b4a:d0cf:8748 with SMTP id a640c23a62f3a-b647254f6a7mr1485479566b.13.1760975893464;
        Mon, 20 Oct 2025 08:58:13 -0700 (PDT)
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
Subject: [for 4.22 v5 03/18] xen/riscv: introduce things necessary for p2m initialization
Date: Mon, 20 Oct 2025 17:57:46 +0200
Message-ID: <661ae486683d1ea9846c9a2ade39037f220c2ee0.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the following things:
- Update p2m_domain structure, which describe per p2m-table state, with:
  - lock to protect updates to p2m.
  - pool with pages used to construct p2m.
  - back pointer to domain structure.
- p2m_init() to initalize members introduced in p2m_domain structure.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5:
 - Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V4:
 - Move an introduction of clean_pte member of p2m_domain structure to the
   patch where it is started to be used:
     xen/riscv: add root page table allocation
 - Add prototype of p2m_init() to asm/p2m.h.
---
Changes in V3:
 - s/p2m_type/p2m_types.
 - Drop init. of p2m->clean_pte in p2m_init() as CONFIG_HAS_PASSTHROUGH is
   going to be selected unconditionaly. Plus CONFIG_HAS_PASSTHROUGH isn't
   ready to be used for RISC-V.
   Add compilation error to not forget to init p2m->clean_pte.
 - Move defintion of p2m->domain up in p2m_init().
 - Add iommu_use_hap_pt() when p2m->clean_pte is initialized.
 - Add the comment above p2m_types member of p2m_domain struct.
 - Add need_flush member to p2m_domain structure.
 - Move introduction of p2m_write_(un)lock() and p2m_tlb_flush_sync()
   to the patch where they are really used:
     xen/riscv: implement guest_physmap_add_entry() for mapping GFNs to MFN
 - Add p2m member to arch_domain structure.
 - Drop p2m_types from struct p2m_domain as P2M type for PTE will be stored
   differently.
 - Drop default_access as it isn't going to be used for now.
 - Move defintion of p2m_is_write_locked() to "implement function to map memory
   in guest p2m"  where it is really used.
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
 xen/arch/riscv/include/asm/domain.h |  5 +++++
 xen/arch/riscv/include/asm/p2m.h    | 33 +++++++++++++++++++++++++++++
 xen/arch/riscv/p2m.c                | 20 +++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index aac1040658..e688980efa 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -5,6 +5,8 @@
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
+#include <asm/p2m.h>
+
 struct vcpu_vmid {
     uint64_t generation;
     uint16_t vmid;
@@ -24,6 +26,9 @@ struct arch_vcpu {
 
 struct arch_domain {
     struct hvm_domain hvm;
+
+    /* Virtual MMU */
+    struct p2m_domain p2m;
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/p2m.h b/xen/arch/riscv/include/asm/p2m.h
index 3a5066f360..a129ed8392 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -3,6 +3,9 @@
 #define ASM__RISCV__P2M_H
 
 #include <xen/errno.h>
+#include <xen/mm.h>
+#include <xen/rwlock.h>
+#include <xen/types.h>
 
 #include <asm/page-bits.h>
 
@@ -10,6 +13,34 @@ extern unsigned char gstage_mode;
 
 #define paddr_bits PADDR_BITS
 
+/* Get host p2m table */
+#define p2m_get_hostp2m(d) (&(d)->arch.p2m)
+
+/* Per-p2m-table state */
+struct p2m_domain {
+    /*
+     * Lock that protects updates to the p2m.
+     */
+    rwlock_t lock;
+
+    /* Pages used to construct the p2m */
+    struct page_list_head pages;
+
+    /* Back pointer to domain */
+    struct domain *domain;
+
+    /*
+     * P2M updates may required TLBs to be flushed (invalidated).
+     *
+     * Flushes may be deferred by setting 'need_flush' and then flushing
+     * when the p2m write lock is released.
+     *
+     * If an immediate flush is required (e.g, if a super page is
+     * shattered), call p2m_tlb_flush_sync().
+     */
+    bool need_flush;
+};
+
 /*
  * List of possible type for each page in the p2m entry.
  * The number of available bit per page in the pte for this purpose is 2 bits.
@@ -92,6 +123,8 @@ static inline bool arch_acquire_resource_check(struct domain *d)
 
 void pre_gstage_init(void);
 
+int p2m_init(struct domain *d);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index d8027a270f..1b5fc7ffff 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -3,6 +3,10 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/macros.h>
+#include <xen/mm.h>
+#include <xen/paging.h>
+#include <xen/rwlock.h>
+#include <xen/sched.h>
 #include <xen/sections.h>
 
 #include <asm/csr.h>
@@ -97,3 +101,19 @@ void __init pre_gstage_init(void)
 
     vmid_init();
 }
+
+int p2m_init(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    /*
+     * "Trivial" initialisation is now complete.  Set the backpointer so the
+     * users of p2m could get an access to domain structure.
+     */
+    p2m->domain = d;
+
+    rwlock_init(&p2m->lock);
+    INIT_PAGE_LIST_HEAD(&p2m->pages);
+
+    return 0;
+}
-- 
2.51.0


