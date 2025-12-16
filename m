Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D19CC475C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188145.1509406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYKz-0007GY-Dz; Tue, 16 Dec 2025 16:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188145.1509406; Tue, 16 Dec 2025 16:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYKz-00079M-8b; Tue, 16 Dec 2025 16:55:49 +0000
Received: by outflank-mailman (input) for mailman id 1188145;
 Tue, 16 Dec 2025 16:55:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYKx-0006gk-Lu
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:55:47 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10823d82-daa0-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:55:45 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-64198771a9bso6813009a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:55:45 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:55:44 -0800 (PST)
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
X-Inumbo-ID: 10823d82-daa0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904145; x=1766508945; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZGIljp4NNyE+7irjY7l3LzV9kUxh2j7lezf++r0RAg=;
        b=m6gfNd+TS2Owo8epdafEFMeugy1YWlMbFDO7tayX4AzV9Nu9AxLWwxkgDpdCd6BckB
         EgjYOveP6o/6fnzr/PGCR4NZKgzJf2Rgok4zMc9NwaGn4HqFA3wxFbz6p16yRNozyVnU
         5unlpxfXNYeL6ziDpWvrMJHehUHf1VKPwAdt8Lf+j7QsTdRZmi/yNRFGr1XnbVnonSEm
         I7JMf77aV2gNSogqQL660iOO3W/Leeqy3iVgmkC9Uzoql+wyZjmtMIgjMC+OQqjjOt3t
         xjGURDhRI2Gz0Nih5YoDhwC6hgPJyPfddMeVIQFjPv60ZnnkEd/O2eMaD2rnDMqnV1R+
         mkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904145; x=1766508945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tZGIljp4NNyE+7irjY7l3LzV9kUxh2j7lezf++r0RAg=;
        b=qmTYj8H5h4VhUGVuGkFESw1UZBRQd7WBoBPGABFrCesFb622wcjksupGfEQaV38Upi
         tqdcgVF4Xc0YVpP8jmbR7JvktceJQ8H0tQcqx+0sLclaDxPj3AMTUaVo2IuoaWJBGglt
         MuN+yjupO4SJ9QfdHCz8BYkJKapRdfKu7nU31DOLpENOIhpO+MJ+jFA5fBqPvQiaOOof
         HDVtjowdl8kIsJRUeR8iOnMtvuGcAnnQ+CexbBVTodFQ+2El5yhQ8qFtdKnZXMwcFopf
         EpfoUpYsmY25YwxD8KOIv4HT9hHLbRYaVqQ9tPXtMxnKRF4dMinS3JIFT/ZbJBUCmCN1
         vtLQ==
X-Gm-Message-State: AOJu0Yxmc1FQNFRfGY/1Ag8Pth68Kd9/RqzXGniHQ079lJ3Rb1jS3Wsp
	RhkiNZ6ml/md4fh4WDBNWB+LpaQxrGBkfzmyuNYv7Wr2sy9LT5mc2iIE/ipq6Q==
X-Gm-Gg: AY/fxX6s8WhltoJ3vlg8HOWfj0z9bgQjhgLBuLPBaxSzF62Xvh3ds+giPdFYwqUWWPR
	ka/jtgAlO6/8tGEsT80u14o727DtEsx2HepWCgay90tkRig/E2YVZYkHBG/vaaoq6UndoRzgtsp
	BtcI5djys0VFZej5GZvZ+rSotYHhrILKEpUgPoeJID7HsErZ7/2BM+eG3CBw1z0sQRCrkgISgdB
	36mS2PsaHxUHNjmT3XW4/uLMPl/MTY6JmDub/Rp4FSbMswXQptk94lNCOiKNfNRqS5JrWzB+Peu
	HyFEJhxK56kZqpYyIYoWw6iRpXUB/N0IvLkLJas0foI8MEt6jyF2EAYCHZvkzuGCYly+qEq2asX
	ZtxqtezHeoqcaAA8eQSH7WuyFb0I+CfyvR3K8TrFz5cunWkjLNE30NaY7aQB325FNmGSoD2U0m+
	V/Sws/eMHZiu+I30L+4SY9hiTxnCfn7VVmR0CMRWPhZYRj4qJhx+c=
X-Google-Smtp-Source: AGHT+IE9H0v/6/3gcQGvq55aH+rbLFfzKNhgLrlYXMXVGe1fUuPnIp9idn/scP4+DQ/TZZkoQaYdpg==
X-Received: by 2002:a17:906:c113:b0:b73:9be1:33ec with SMTP id a640c23a62f3a-b7d236193aamr1474539366b.9.1765904144666;
        Tue, 16 Dec 2025 08:55:44 -0800 (PST)
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
Subject: [PATCH v7 03/19] xen/riscv: introduce things necessary for p2m initialization
Date: Tue, 16 Dec 2025 17:55:13 +0100
Message-ID: <81cf2f714dc7310ad19e77b72c18cc4438f81641.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
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
Changes in V6-7:
 - Nothing changed. Only rebase.
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
index 3776b98303..239f90622e 100644
--- a/xen/arch/riscv/include/asm/p2m.h
+++ b/xen/arch/riscv/include/asm/p2m.h
@@ -3,17 +3,48 @@
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
 struct gstage_mode_desc {
     unsigned char mode;
     unsigned int paging_levels;
     char name[8];
 };
 
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
@@ -97,6 +128,8 @@ static inline bool arch_acquire_resource_check(struct domain *d)
 void guest_mm_init(void);
 unsigned char get_max_supported_mode(void);
 
+int p2m_init(struct domain *d);
+
 #endif /* ASM__RISCV__P2M_H */
 
 /*
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 4e84acaafd..a6e2456f54 100644
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
@@ -103,3 +107,19 @@ void __init guest_mm_init(void)
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
2.52.0


