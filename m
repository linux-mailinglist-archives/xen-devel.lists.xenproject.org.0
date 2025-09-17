Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40EFB820A8
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 23:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125583.1467496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz087-0007r4-3a; Wed, 17 Sep 2025 21:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125583.1467496; Wed, 17 Sep 2025 21:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz087-0007oH-0F; Wed, 17 Sep 2025 21:55:59 +0000
Received: by outflank-mailman (input) for mailman id 1125583;
 Wed, 17 Sep 2025 21:55:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz085-0007Lu-B5
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:55:57 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 163b661f-9411-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 23:55:56 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-25d44908648so3991235ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:55:56 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:55:54 -0700 (PDT)
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
X-Inumbo-ID: 163b661f-9411-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146155; x=1758750955; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQNGgSFWc/8UyDD0fnmeKMR4OiuAHPnjV1/CBg7F61M=;
        b=gp4Dqjx3POGVUZthjORo39D7RzCHoFbiDJHD2o4MN0hve3JJHgFxwLGpxcJnM4HEBH
         Fu6++0cxgD4ZkxCjCpX6aI4BmYlZBYbnYkfdY46c7tAAgEze4XVyx2d8QatsHLlTsPGG
         CbhoOwt4CivNp66e5IMVzdnaMNTwShCoSji9VzA2iQ1OyX34ldEG+2MEpWAfQPwdmF6E
         J9mu5z9HXcpuCX2AFCDeGJpZPmqXOnkfrB0mxhZ8LyYor5KeNKZfjyWD6kzZcXYIqBBp
         17WAYYp82vnD4iwJTWGPFjcb/Z5gKEPgzxV5Hhblx2H+RD4tbkIg23D9mDUJYPfUj+xx
         8Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146155; x=1758750955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQNGgSFWc/8UyDD0fnmeKMR4OiuAHPnjV1/CBg7F61M=;
        b=H6OrRsx4L37a2cgkSn55qr3217/qT2vc1bvsnvqvm6zIf9gKyobZsC5FseoMFnoKf6
         kDp50TNfdVYCqDvoc5v4WWSFeeYqDGhUwWk9itsbYgCB2fKXXPlS7oTcNawnqG2TGyuB
         qXdorv5g6Z6taFiukadd3Hehivk5qsCjWUAzp022zqcO7KM1eRD4RUz3qszvXREMF08t
         +bVa5s2byO0zGTfJKFuzJQzjAq5hGsj0tB+Zn+U0VObFuVMtbU/4tZuwuhqV1gsn7HIC
         ppof0gQoqlthOf7IFzbEqJBeaFR3zFINJUT2MUnQPSTnb9SLGs4Xrc+Ip3m5NDSRSfZx
         gNew==
X-Gm-Message-State: AOJu0Yy40K3A6OG0wZpVJbqOUL1815R71LbYBxsG1YJfxvlUjriHpv/X
	gOJPuqYvZLLnAwUmKwFLUcK7XC03LThJDeRcypybSRPP+VL4lmeb+CuTh6BFLFnNMig=
X-Gm-Gg: ASbGnctktlfeXfN/jlSXQlZFbJJO+AxmqJZqxCpRrw6rWhvVNf8T5xC+nAv8PsodY2c
	BcAvFriBpThe/AUALWftF8GS9RNvVDdC1IFYahJhn8056PPEp1YFCa2w8HnMvpULBKalMEAeQ3m
	sicLNlMuuR32Hoc2uqL8A5hdHvMY8CjJznbhf0S+134Evfd9r4A2l79owz82R6CPjuuBui3j3ru
	bCVHT6Z2z8ZXRf9KkjFu6BZbUuW1AOIV6++UO3BLtUY4Hl1Ong4HNf4+yoFF7u5CEBNUZ7exQT8
	mU1ESMZ+7AbUEb6tnL2q8iOL+KkQpip0RWC6YtzShjPgT8YUx2R+eJXfr8RNfie7OCqs+z1Et/s
	JlwNevkNe9AwuoX2cdPZjiRM88aNOs69QseSz2wYMVrQk
X-Google-Smtp-Source: AGHT+IFgZhg0vaqNQC7y/3ouz/dOckqk2ZCdOyyRwoD3kmfAr06a/fD78QmY82yfUqaI6dGVCWSGiQ==
X-Received: by 2002:a17:903:985:b0:252:5220:46b4 with SMTP id d9443c01a7336-268137f250dmr42602945ad.37.1758146154660;
        Wed, 17 Sep 2025 14:55:54 -0700 (PDT)
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
Subject: [PATCH v4 03/18] xen/riscv: introduce things necessary for p2m initialization
Date: Wed, 17 Sep 2025 23:55:23 +0200
Message-ID: <f4bc51f1f0c6df6774f55e85654846592f52f9ee.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the following things:
- Update p2m_domain structure, which describe per p2m-table state, with:
  - lock to protect updates to p2m.
  - pool with pages used to construct p2m.
  - back pointer to domain structure.
- p2m_init() to initalize members introduced in p2m_domain structure.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
index 9d4a5d6a2e..2672dcdecb 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -3,6 +3,9 @@
 #define ASM__RISCV__P2M_H
 
 #include <xen/errno.h>
+#include <xen/mm.h>
+#include <xen/rwlock.h>
+#include <xen/types.h>
 
 #include <asm/page-bits.h>
 
@@ -10,6 +13,34 @@ extern unsigned long gstage_mode;
 
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
 
 void gstage_mode_detect(void);
 
+int p2m_init(struct domain *d);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 56113a2f7a..70f9e97ab6 100644
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
@@ -89,3 +93,19 @@ void __init gstage_mode_detect(void)
      */
     local_hfence_gvma_all();
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


