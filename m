Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 835F3B17474
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:58:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065871.1431245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVg2-0002gI-Hi; Thu, 31 Jul 2025 15:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065871.1431245; Thu, 31 Jul 2025 15:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVg2-0002cA-8a; Thu, 31 Jul 2025 15:58:42 +0000
Received: by outflank-mailman (input) for mailman id 1065871;
 Thu, 31 Jul 2025 15:58:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVfz-0001FB-OZ
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:39 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38975460-6e27-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:58:38 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-55b85d01b79so633216e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:38 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:36 -0700 (PDT)
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
X-Inumbo-ID: 38975460-6e27-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977517; x=1754582317; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnLE+XT1CgwuNN+vswfBBQ3lSNBiPPpb65b2kzBfA5o=;
        b=UABmbRH1Ul6ApApKh3hAK0HwL5oxa64vbbq0trqekCFggorCy5xO6yvTek+hkRO7JF
         RkC6y2BfTynZ5N9jEkC1etBjgkVseL4fiCoSVK6o7ZRU64E60dF7udSjOB637q2ZqoYH
         4/9jBUP7fYA6cRLQAUHdAVBAtdNiu1bcwEvU+bBrrv78BpnPCJXKLxJH6OfOSkjfRGVR
         CuwP+vHMq+9friXIPcR2RhD2NZLFDmTt89VEYbm77J2BtIrTSTRVKkLwUFYbPUG7vULt
         7xQfXM+iENkSjq9HxaITxY4WgNpE/zNA/14ltBN4vD/dC0LFeS0kcGch4lQuGEpqNGCk
         v2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977517; x=1754582317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnLE+XT1CgwuNN+vswfBBQ3lSNBiPPpb65b2kzBfA5o=;
        b=W+sOCr2LtRCZiwTrdzFEb+liEnbvy546D8glTWYs/AJjmk4d4OLRfz9extYlAqQsO9
         owNlKFgrWENzolOwm477O/39SHqB+92dZOYiy1+QlLGbksdINe4XVltUVIhwN7HqpdPK
         Y97XKUvy3pG/W7+OMqwhkgTaWfWfLaMbENuWzPrwHmiywxwOQMdxE0rHuWhp1xJ0x9rJ
         KyV0I/A0YynhJqVpyf/xwq88QHhwGsdCV7wJESoBICU+x+MHtyhn7g7LjeGFXbRxcAGb
         hyK1vZamMXZ0WrgTYC8FmY6bolpBgYHmhH+bqA6xKvgty+YauLo6TgxSRKMbB/5pju6B
         8YoA==
X-Gm-Message-State: AOJu0YwnW3xBMu9HMD4/kMkFjQiKEl7ixxDYJELL+9ZcFdVOkY+DcO04
	7Vo/l1mzSKGs4jmeEsLfeMeTJhaL2tQmZ9ajcWZiyK1tPD/lK0lRQmEqwdrz1Q==
X-Gm-Gg: ASbGncszlfvXTgkLdcPbQmqRnlhAenDRgOTXUG3BFEUUBgAABZhsy7aDNSTlGldoRYj
	dY26/8Z5WIlW0BP/+e7jXlp4m+Di+/izcc/McloTPoYVJ/jWxzBFOhWsjo+8hXvHysKHAib3y8W
	s1GAvHtTkifSJYvW5ZHk+SPM7l3RNkD5y3SGIoUdVpUVUAyHx9/6mHa7sybk5Jrr4JjAOScX6ju
	JmrG9GAeK73zdZF7EvILKY4woYN0+jIoG1JZDEfaXe4+dBGhgFc7AGGq0457TdKQzwD3wfLpMxw
	ggKRpaerZAbbUn9JQVjrxzxNfIhS8gSItIYxDdoMWLkBO98JOLm7EwAtXuWpGhUheXmKf57+Y6v
	a/cbTSyuDfV9HX1hzPnbBx7ARDFdjjzL/pwuS7k/zsG10cA0qpsxqseRD1cNAR5c8OMKLof2d
X-Google-Smtp-Source: AGHT+IGGNK7XkZgMa4uBl846NX9o70JMkMjakDJ0RO9QkCwOCYW1rhNAS/kaM2451mhkaXfVsPkf8A==
X-Received: by 2002:a05:6512:2313:b0:55b:880f:38b6 with SMTP id 2adb3069b0e04-55b880f3b48mr1149630e87.4.1753977517163;
        Thu, 31 Jul 2025 08:58:37 -0700 (PDT)
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
Subject: [PATCH v3 05/20] xen/riscv: construct the P2M pages pool for guests
Date: Thu, 31 Jul 2025 17:58:04 +0200
Message-ID: <4e7de8ffc929c1bdfa28b40fdd31b814acef103c.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement p2m_set_allocation() to construct p2m pages pool for guests
based on required number of pages.

This is implemented by:
- Adding a `struct paging_domain` which contains a freelist, a
  counter variable and a spinlock to `struct arch_domain` to
  indicate the free p2m pages and the number of p2m total pages in
  the p2m pages pool.
- Adding a helper `p2m_set_allocation` to set the p2m pages pool
  size. This helper should be called before allocating memory for
  a guest and is called from domain_p2m_set_allocation(), the latter
  is a part of common dom0less code.
- Adding paging_freelist_init() to struct paging_domain.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Drop usage of p2m_ prefix inside struct paging_domain().
 - Introduce paging_domain_init() to init paging struct.
---
Changes in v2:
 - Drop the comment above inclusion of <xen/event.h> in riscv/p2m.c.
 - Use ACCESS_ONCE() for lhs and rhs for the expressions in
   p2m_set_allocation().
---
 xen/arch/riscv/Makefile             |  1 +
 xen/arch/riscv/include/asm/Makefile |  1 -
 xen/arch/riscv/include/asm/domain.h | 12 ++++++
 xen/arch/riscv/include/asm/paging.h | 13 ++++++
 xen/arch/riscv/p2m.c                | 19 +++++++++
 xen/arch/riscv/paging.c             | 64 +++++++++++++++++++++++++++++
 6 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/include/asm/paging.h
 create mode 100644 xen/arch/riscv/paging.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index e2499210c8..6b912465b9 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -6,6 +6,7 @@ obj-y += imsic.o
 obj-y += intc.o
 obj-y += irq.o
 obj-y += mm.o
+obj-y += paging.o
 obj-y += pt.o
 obj-y += p2m.o
 obj-$(CONFIG_RISCV_64) += riscv64/
diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
index bfdf186c68..3824f31c39 100644
--- a/xen/arch/riscv/include/asm/Makefile
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -6,7 +6,6 @@ generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
 generic-y += irq-dt.h
-generic-y += paging.h
 generic-y += percpu.h
 generic-y += perfc_defn.h
 generic-y += random.h
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index e688980efa..316e7c6c84 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -2,6 +2,8 @@
 #ifndef ASM__RISCV__DOMAIN_H
 #define ASM__RISCV__DOMAIN_H
 
+#include <xen/mm.h>
+#include <xen/spinlock.h>
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
@@ -24,11 +26,21 @@ struct arch_vcpu {
     struct vcpu_vmid vmid;
 };
 
+struct paging_domain {
+    spinlock_t lock;
+    /* Free pages from the pre-allocated pool */
+    struct page_list_head freelist;
+    /* Number of pages from the pre-allocated pool */
+    unsigned long total_pages;
+};
+
 struct arch_domain {
     struct hvm_domain hvm;
 
     /* Virtual MMU */
     struct p2m_domain p2m;
+
+    struct paging_domain paging;
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/paging.h b/xen/arch/riscv/include/asm/paging.h
new file mode 100644
index 0000000000..8fdaeeb2e4
--- /dev/null
+++ b/xen/arch/riscv/include/asm/paging.h
@@ -0,0 +1,13 @@
+#ifndef ASM_RISCV_PAGING_H
+#define ASM_RISCV_PAGING_H
+
+#include <asm-generic/paging.h>
+
+struct domain;
+
+int paging_domain_init(struct domain *d);
+
+int paging_freelist_init(struct domain *d, unsigned long pages,
+                         bool *preempted);
+
+#endif /* ASM_RISCV_PAGING_H */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index ae937e9bdd..214b4861d2 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -2,6 +2,8 @@
 #include <xen/rwlock.h>
 #include <xen/sched.h>
 
+#include <asm/paging.h>
+
 int p2m_init(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
@@ -12,6 +14,8 @@ int p2m_init(struct domain *d)
      */
     p2m->domain = d;
 
+    paging_domain_init(d);
+
     rwlock_init(&p2m->lock);
     INIT_PAGE_LIST_HEAD(&p2m->pages);
 
@@ -30,3 +34,18 @@ int p2m_init(struct domain *d)
 
     return 0;
 }
+
+/*
+ * Set the pool of pages to the required number of pages.
+ * Returns 0 for success, non-zero for failure.
+ * Call with d->arch.paging.lock held.
+ */
+int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
+{
+    int rc;
+
+    if ( (rc = paging_freelist_init(d, pages, preempted)) )
+        return rc;
+
+    return 0;
+}
diff --git a/xen/arch/riscv/paging.c b/xen/arch/riscv/paging.c
new file mode 100644
index 0000000000..8882be5ac9
--- /dev/null
+++ b/xen/arch/riscv/paging.c
@@ -0,0 +1,64 @@
+#include <xen/event.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/sched.h>
+#include <xen/spinlock.h>
+
+int paging_freelist_init(struct domain *d, unsigned long pages,
+                         bool *preempted)
+{
+    struct page_info *pg;
+
+    ASSERT(spin_is_locked(&d->arch.paging.lock));
+
+    for ( ; ; )
+    {
+        if ( d->arch.paging.total_pages < pages )
+        {
+            /* Need to allocate more memory from domheap */
+            pg = alloc_domheap_page(d, MEMF_no_owner);
+            if ( pg == NULL )
+            {
+                printk(XENLOG_ERR "Failed to allocate pages.\n");
+                return -ENOMEM;
+            }
+            ACCESS_ONCE(d->arch.paging.total_pages)++;
+            page_list_add_tail(pg, &d->arch.paging.freelist);
+        }
+        else if ( d->arch.paging.total_pages > pages )
+        {
+            /* Need to return memory to domheap */
+            pg = page_list_remove_head(&d->arch.paging.freelist);
+            if ( pg )
+            {
+                ACCESS_ONCE(d->arch.paging.total_pages)--;
+                free_domheap_page(pg);
+            }
+            else
+            {
+                printk(XENLOG_ERR
+                       "Failed to free pages, freelist is empty.\n");
+                return -ENOMEM;
+            }
+        }
+        else
+            break;
+
+        /* Check to see if we need to yield and try again */
+        if ( preempted && general_preempt_check() )
+        {
+            *preempted = true;
+            return -ERESTART;
+        }
+    }
+
+    return 0;
+}
+/* Domain paging struct initialization. */
+int paging_domain_init(struct domain *d)
+{
+    spin_lock_init(&d->arch.paging.lock);
+    INIT_PAGE_LIST_HEAD(&d->arch.paging.freelist);
+
+    return 0;
+}
-- 
2.50.1


