Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCABBF23FF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:58:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146531.1478979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH4-0005Kp-19; Mon, 20 Oct 2025 15:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146531.1478979; Mon, 20 Oct 2025 15:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsH3-0005ER-RT; Mon, 20 Oct 2025 15:58:17 +0000
Received: by outflank-mailman (input) for mailman id 1146531;
 Mon, 20 Oct 2025 15:58:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsH2-0004DQ-1W
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:58:16 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96753a5a-adcd-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:58:15 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-63bf76fc9faso8302567a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:58:15 -0700 (PDT)
Received: from fedora (user-109-243-146-38.play-internet.pl. [109.243.146.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48ab560esm6966067a12.12.2025.10.20.08.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 08:58:14 -0700 (PDT)
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
X-Inumbo-ID: 96753a5a-adcd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975895; x=1761580695; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwDKzNBkEuRF0ZdPhrZFeDoixfetRhPSzH8aOqVCTKk=;
        b=Az5YSpuSkFEsODa2pwj0oG85ysGEUab0+Bd6PDkeafdv+TWBR6EzjLA7dMxGIBGj3E
         KpaAhx6odOT6Q+7/cyDGi+QQZcTaTSpiEqZjiSVwL9aQ4+pjwx5qLL02NOWBEyBChTlW
         aUlFrF2c1Y7cfnrCTpAAJ5R12A+qgDovN2CqAg19T0ZBFEKMmXPo9LIylXX6+LnEgt7v
         mNLSmwH0xPykvsKuJxKmgBeOAXOiaN2NoRA9F8itG9JsO7xfoApj6ZRBViuKOfKGvJ3g
         0pCqi8spjhJjRaHxYDC9LyRZwTkVdX1PeI4igdOaKbmKmYnSsRdbyBxhcqKMObnKY05Q
         o6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975895; x=1761580695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwDKzNBkEuRF0ZdPhrZFeDoixfetRhPSzH8aOqVCTKk=;
        b=J8c/eil00v6TUdwrRNxfpJV1/kpM0L1Gg8xtgmB9TMdvLCgxXk0gTzqvPGjPusht/K
         ePMIr/ejDrO+CgQkSpbKKGXA7Lrwk04CxezYoVWLG0CjBY6VhJUj30X2dOrNbntS6wDR
         7hS6+bMc+muCA9yTUwdCpmfsbV0+3V6AMw54EnPU4Z3hJBjhweL46ToHcWuTvei48IaT
         bRj2CQPpAQ8EBUfkXrNPB1I4/sIvOaR5QxH0+rGfNZntY87s/nxXDK/qXfiyrlIjoqqd
         KQS+9OH1/+H27XRNXdi259z5iWHIfJ2JOoexTaoCr4IIniDanSF9INiL4r4F8Dq5oJ5O
         08Qw==
X-Gm-Message-State: AOJu0Yz/6ZgNAENRq4hU2LQ0F0cDLflvysM4N8BAatRGsnBvVaF52Lr3
	IVPwmnezIzHFoqCB2F52zwsNFaWNj/X5XXQGYnKM08tk1bvF2lj32sbvCGXlmA==
X-Gm-Gg: ASbGncsW28PG4reKyhOv9MLo7g3ZfGWcECqev7HjN7C0ChwHtPJSzh3t31rLWDydAoV
	/NT5afD/ZDz37rMYQwBqvg6bFew5nXH+OYI/6sO8qGpOynukgG21vGWGctQgnVbTcdLUhxJKszd
	t/6YiXcEsVZ5rdY2ia8PABfwxnE6bEjzKj2XrkjXY70oqTDdeIbZ+nQcCHbYuESWLsTwk7wwD4p
	LXd7gG/vLROqyndz2L6c/lBN5yS0bqY9eiFL8LdAn9b7HrUqvSz3n1dNGbVo543jYTodeFa1SB6
	cZW0FyLdZrAwLchbEznj/imkZm77yBYburrk1lrGRd+6Xm8Z6EZQ/sucZ1zpbUZISZIjZx8EoPh
	9OKUyp2BtzbmLsGXY6knQhBajh41VZRq3torAk4aygtkOi/IGgfL+fbfcHrq7fQtKcnmJGC0Mo5
	QjUwHxZsDIUU+go4SgoBsFuiRyBez7Z0s0vQEYXrzl9HXNzBo=
X-Google-Smtp-Source: AGHT+IGl4ntJ2yzEV41chreIWSts04kN3vEIg0tLJQTkQG3AV3/i81AYKX2trmATKDRQtdj0FhAuHA==
X-Received: by 2002:a05:6402:3585:b0:636:240f:9ece with SMTP id 4fb4d7f45d1cf-63c1f6d90d0mr13129399a12.34.1760975894485;
        Mon, 20 Oct 2025 08:58:14 -0700 (PDT)
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
Subject: [for 4.22 v5 04/18] xen/riscv: construct the P2M pages pool for guests
Date: Mon, 20 Oct 2025 17:57:47 +0200
Message-ID: <4e0449c9c337f64df5251dd0aa089171a4847d4e.1760974017.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760974017.git.oleksii.kurochko@gmail.com>
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
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
Changes in V5:
 - Nothing changed. Only rebase.
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
index 1b5fc7ffff..d670e7612a 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -11,6 +11,7 @@
 
 #include <asm/csr.h>
 #include <asm/flushtlb.h>
+#include <asm/paging.h>
 #include <asm/riscv_encoding.h>
 #include <asm/vmid.h>
 
@@ -112,8 +113,25 @@ int p2m_init(struct domain *d)
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


