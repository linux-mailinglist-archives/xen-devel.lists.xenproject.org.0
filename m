Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E598B17470
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:58:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065870.1431230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVfy-00027X-VD; Thu, 31 Jul 2025 15:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065870.1431230; Thu, 31 Jul 2025 15:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVfy-00023S-Oh; Thu, 31 Jul 2025 15:58:38 +0000
Received: by outflank-mailman (input) for mailman id 1065870;
 Thu, 31 Jul 2025 15:58:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVfx-0000zK-Bw
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:37 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37c956c3-6e27-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 17:58:36 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55b7454c6b0so579788e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:36 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:35 -0700 (PDT)
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
X-Inumbo-ID: 37c956c3-6e27-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977516; x=1754582316; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SucK4GD77NILFw9saTv0jC1xXZTivx/o3TP9MUfpwV0=;
        b=hchlt1IrYvSaL3wNuzpL+mgpJ1UN3CwQPiBjHVLNLd4juiD0hJmaOSNrKljVgQCHap
         nt3LE0LftOb5UziDxhHkEHidc5wtWzLTJeM2O+0NM6ONnLbPbRBL84/RkpXdaXB2f4wA
         Ut9YIItv2p9A7dSYMtax+yrPqczVdNGQ2NXa91In4XgfRFA/SND0PmJYPEFiT9GFRmuN
         XWE8yIvLbCO36wiwKo/KfJw452gWgoXJeqLfqnwDdEkQQ0PS1yP+Dkcq7+T4MN2EZbZH
         i+V9FwctyOl6H/PaUZROXkrNSfxoH2n3IsVwqx3ljLzZe7gXr+1hcxpmYip1LZ7VbNRB
         HhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977516; x=1754582316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SucK4GD77NILFw9saTv0jC1xXZTivx/o3TP9MUfpwV0=;
        b=dNuWWN6uLHeieAGBmJGk3zaLx1CRwB+ITi4h6zYNXQ2pEDDT/eYYP6AtwirCcGLuk/
         IY1zh8p3xJ6/ohelZP9V4eHaOAbDlpeDX5KQKDnFeEYGGLMo2wHQpUIQqpQPAgI4uviN
         PfT/jlsxZAvhAK7zgnEkc4kkv5rZ8WoErEbpOpFNSoW5J0zCmM/0trivXBj1AwTuJsvU
         opg2+n13MfsGpPOf3842rjD5E5c37UNbLfhO4pQvngA5PErrdjetBO+NV3aZDxbu6fPE
         QY2gga76YKWSK203wqyV4RH39v8bxCQrcHtrb+t/C+lyHob/Ds3ZNh0Rp6oFC6IBCy7w
         bTGw==
X-Gm-Message-State: AOJu0YzyxW1sm+c/Wfm04ORPwyignPkiX3rslpZgsGj5VVe7/eJonlgi
	ZeU3wPQJ6Io4qbRUXeQeHpGTLeqmJ9r7xTQ7ITMToaXMS171+rl2e50EsA0o7w==
X-Gm-Gg: ASbGncunQ85Z/Oj23VlrnpnI5p7tXMZeF/+H/MhWscJcZVHWc5rghmpoxCgH9HPcE9L
	qorGwQ7SqoD/YaSlPNDqpIdWQg9ePb1RwdUjxu2eHarnxN+QX74csijCe2P2dq6yWZfy9OAVif6
	aBZFZLwep8342+KlauWxcsYcm6KKq7OHtryVDlAOxXvk+RnLWnt/qpxR4WiXb1t0R3uccdWiztw
	dqMnAe96tOl1RN7ibzQe1puUbDyHX0V9yPpfR8TsuyGYFJLkIB0CpdJWLBmhujCHPYBeIT6CXGx
	AFDdoBJ6xkWwm50bZKlUC4P032tbglEcCGRBig4O75dk40cYvpvETaEPBoiMiGlnDFH8GOLsfJC
	YrIARJ/6rbIjyaKlC+D7OYuKc3CpiEa06ygj5iMDNSSCYUgmowrCH9JurnCdzLg==
X-Google-Smtp-Source: AGHT+IG4YTKZOLh7LwJcLbr7QTUyE6vXkH4b9u7bZEQLBlWOEnweb49wNI2Ccau5lElsWPXq4CzGlg==
X-Received: by 2002:a05:6512:1449:20b0:553:291f:92d with SMTP id 2adb3069b0e04-55b7c0a8599mr1947600e87.57.1753977515826;
        Thu, 31 Jul 2025 08:58:35 -0700 (PDT)
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
Subject: [PATCH v3 04/20] xen/riscv: introduce things necessary for p2m initialization
Date: Thu, 31 Jul 2025 17:58:03 +0200
Message-ID: <c526512aeda09527421e2d60bac7955a8c7c7c56.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the following things:
- Update p2m_domain structure, which describe per p2m-table state, with:
  - lock to protect updates to p2m.
  - pool with pages used to construct p2m.
  - clean_pte which indicate if it is requires to clean the cache when
    writing an entry.
  - back pointer to domain structure.
- p2m_init() to initalize members introduced in p2m_domain structure.
- Call of paging_domain_init() in p2m_init() to initlize paging spinlock
  and freelist head.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/Makefile             |  1 +
 xen/arch/riscv/include/asm/domain.h |  5 +++++
 xen/arch/riscv/include/asm/p2m.h    | 34 +++++++++++++++++++++++++++++
 xen/arch/riscv/p2m.c                | 32 +++++++++++++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 xen/arch/riscv/p2m.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 745a85e116..e2499210c8 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -7,6 +7,7 @@ obj-y += intc.o
 obj-y += irq.o
 obj-y += mm.o
 obj-y += pt.o
+obj-y += p2m.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
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
index 28f57a74f2..f8051ed893 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -3,11 +3,45 @@
 #define ASM__RISCV__P2M_H
 
 #include <xen/errno.h>
+#include <xen/mm.h>
+#include <xen/rwlock.h>
+#include <xen/types.h>
 
 #include <asm/page-bits.h>
 
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
+    /* Indicate if it is required to clean the cache when writing an entry */
+    bool clean_pte;
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
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
new file mode 100644
index 0000000000..ae937e9bdd
--- /dev/null
+++ b/xen/arch/riscv/p2m.c
@@ -0,0 +1,32 @@
+#include <xen/mm.h>
+#include <xen/rwlock.h>
+#include <xen/sched.h>
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
+    /*
+     * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
+     * is not ready for RISC-V support.
+     *
+     * When CONFIG_HAS_PASSTHROUGH=y, p2m->clean_pte must be properly
+     * initialized.
+     * At the moment, it defaults to false because the p2m structure is
+     * zero-initialized.
+     */
+#ifdef CONFIG_HAS_PASSTHROUGH
+#   error "Add init of p2m->clean_pte"
+#endif
+
+    return 0;
+}
-- 
2.50.1


