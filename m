Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB09B820AC
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 23:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125585.1467516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz088-0008JF-P1; Wed, 17 Sep 2025 21:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125585.1467516; Wed, 17 Sep 2025 21:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uz088-0008Ft-JQ; Wed, 17 Sep 2025 21:56:00 +0000
Received: by outflank-mailman (input) for mailman id 1125585;
 Wed, 17 Sep 2025 21:55:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C67B=34=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uz087-0007Lt-KD
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 21:55:59 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16eaf01c-9411-11f0-9809-7dc792cee155;
 Wed, 17 Sep 2025 23:55:57 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-24457f581aeso2938525ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 14:55:57 -0700 (PDT)
Received: from fedora ([149.199.65.200]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053da4sm5538095ad.20.2025.09.17.14.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 14:55:55 -0700 (PDT)
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
X-Inumbo-ID: 16eaf01c-9411-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758146156; x=1758750956; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+b7cabvx/1AnkoXHK5wCrIOJ3a++/hduz17G6Xo8SDw=;
        b=DFAnX5weIrb+sSSTbZxir36j+0izbHvqowEnRLeebulzhUG4Co4tTucjMlAiZUqRuB
         HOqg6MhpDkT56giezDuOLLf5b+hsJlu5gJrqrP4DDZRA7aXAB86xNCXryadYBbbRKr0z
         Ec2HOIOQavcL0sn2QmL9w35q4Ir/I1M++HOIdVgPHv1zNBJ4cR9s+4zHNRAzmwpQVexK
         OXLsvOWtHpNbDARrmw/+1u7XJDBnk5DPBFJFbis3isbUtgOApJ1YNsg/Zk2U6MuIfvN6
         np5NUvqYWxD2rXcFWv/eLK69xECik/ICe6ma7cEltMU6sfYE2vFgX6JgDtWVyefRAXcQ
         XFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146156; x=1758750956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+b7cabvx/1AnkoXHK5wCrIOJ3a++/hduz17G6Xo8SDw=;
        b=Q/XLHAFAdKaIvgDcOTiSX/UneNdVk7TaTisPQqkJg8+bM8zVzRD0x3xlVgGbVq9ElB
         Vi5whyAN0nbk7u4haDOdxmZ8xgxdvvHjTPWlhk/Bv7Tnc01WbQ6lrixFhLcKYfSSVVMe
         3WXfELrVfSc7lu6x0hgQ1qSsLzuKC9eO2h6m1djyxTJ1qoAwNeVWFjk+BwbC9W2KipPW
         0Sp2oPv1K04nkrqI+rGlXVa7rufNSe3Egjl5wlWfdhG+V0p8kwnHSkMAPCQdMcRNdJ1b
         rj+J1YSEi5UVEqlaiDhacS0cHtdABs0eXAKQr175Qd/DLNSYgYcfBpVNC5MZICLizrGq
         1cmA==
X-Gm-Message-State: AOJu0YyhfJAvPAzUXjKoaPIUnQEsflC6WWPm8hSPRXIOSDC+3XCjmJqB
	SFSBplcxbFY7QHTUZjowF+avE/UAXkGp9KLsAgpttxCm0WR/sJU4zFEdPS4cb19t1tk=
X-Gm-Gg: ASbGncs/mfJww+jwhhR7PlwUO6i6dMdGElA+eviZU7X1h7bQz4o3vRSCZexn7X9DQC1
	e7xZYOnmmryQVIE0b5/HUXbveTgCIuPBHatjMJseiBrKO3AVWqOpyE1u+G1lguTkzXB2IG6uunj
	gMTlfniu8tRu5S0bD68xmOUPz+YyBu3RHZSO2T8BTuWOY6Ud2uSFe8Aso4JdjPXJ3eK7T5Xcna2
	kilu59A1TqqnV8fZ4DQUY7MFpu9YVVTCqJNc1NqgrQy5jtdgyRedwWv5p5QtH/zOER8I+k8D0OB
	njrNtifQFhpsYQQkHAaevpHsnuMpVp00KDo7FYiEVlJsPCWGmARgRLg0WWSeKjVLJIB4ZiU9fMq
	hxxE1nKZ/mkGummBQ8eyUbQUKR3OOptWxMTEWWxvV7qpb
X-Google-Smtp-Source: AGHT+IHJu1nig2OR8jLnjqHuRHXgBacdsnwzzap2pCjxjjqKKAsSAkK5zoktSpM/LMyqRPYaNDAndA==
X-Received: by 2002:a17:902:e94d:b0:24c:965a:f94d with SMTP id d9443c01a7336-26813cfd846mr42361995ad.46.1758146155951;
        Wed, 17 Sep 2025 14:55:55 -0700 (PDT)
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
Subject: [PATCH v4 04/18] xen/riscv: construct the P2M pages pool for guests
Date: Wed, 17 Sep 2025 23:55:24 +0200
Message-ID: <5f678a78a8b19e0283662881c030db76abd6a2c9.1758145428.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758145428.git.oleksii.kurochko@gmail.com>
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
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
- Adding implementation of paging_freelist_adjust() and
  paging_domain_init().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
 - s/paging_freelist_init/paging_freelist_adjust.
 - Add empty line between definiton of paging_freelist_adjust()
   and paging_domain_init().
 - Update commit message.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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
 xen/arch/riscv/p2m.c                | 18 ++++++++
 xen/arch/riscv/paging.c             | 65 +++++++++++++++++++++++++++++
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
index 0000000000..98d8b06d45
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
+int paging_freelist_adjust(struct domain *d, unsigned long pages,
+                           bool *preempted);
+
+#endif /* ASM_RISCV_PAGING_H */
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 70f9e97ab6..dc0f2b2a23 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -11,6 +11,7 @@
 
 #include <asm/csr.h>
 #include <asm/flushtlb.h>
+#include <asm/paging.h>
 #include <asm/riscv_encoding.h>
 
 unsigned long __ro_after_init gstage_mode;
@@ -104,8 +105,25 @@ int p2m_init(struct domain *d)
      */
     p2m->domain = d;
 
+    paging_domain_init(d);
+
     rwlock_init(&p2m->lock);
     INIT_PAGE_LIST_HEAD(&p2m->pages);
 
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
+    if ( (rc = paging_freelist_adjust(d, pages, preempted)) )
+        return rc;
+
+    return 0;
+}
diff --git a/xen/arch/riscv/paging.c b/xen/arch/riscv/paging.c
new file mode 100644
index 0000000000..2df8de033b
--- /dev/null
+++ b/xen/arch/riscv/paging.c
@@ -0,0 +1,65 @@
+#include <xen/event.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/sched.h>
+#include <xen/spinlock.h>
+
+int paging_freelist_adjust(struct domain *d, unsigned long pages,
+                           bool *preempted)
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
+
+/* Domain paging struct initialization. */
+int paging_domain_init(struct domain *d)
+{
+    spin_lock_init(&d->arch.paging.lock);
+    INIT_PAGE_LIST_HEAD(&d->arch.paging.freelist);
+
+    return 0;
+}
-- 
2.51.0


