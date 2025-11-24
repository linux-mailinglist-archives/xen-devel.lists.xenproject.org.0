Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE2DC807B4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:34:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170566.1495650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVlq-0002Jo-Hp; Mon, 24 Nov 2025 12:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170566.1495650; Mon, 24 Nov 2025 12:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVlq-0002C8-CN; Mon, 24 Nov 2025 12:34:18 +0000
Received: by outflank-mailman (input) for mailman id 1170566;
 Mon, 24 Nov 2025 12:34:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVlp-0001Xp-3o
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:17 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e31dcf89-c931-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:34:15 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-644f90587e5so6502456a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:15 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:13 -0800 (PST)
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
X-Inumbo-ID: e31dcf89-c931-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987654; x=1764592454; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BknfGuBsUxZBL8rid9/xP+veNGSFTsAItrjcV/2heyg=;
        b=VHUHKc1pRgCoZf1PRb/GyKVD6JyISEFomMmKrec9Nwh3guddXIFaHvB5VLr1su8pVy
         aEzwZhv/EyYF887Krd7rsjRnMXoGIXuiJYb4pA2BIxV+ftkU7U1RXAB/vN38VElt3IT5
         mxxlGVRRDrceD5vyYyzXVmVK7WQM9KeoiLgpEw+F5morCRx8MULCBLH3jFKW0q8SOq+9
         cTQPotjHHtl1Cia/AG5H26uTb3b0x+Z4DcEMVIVLbjVRz0k75myHW3n881BLyH9VYgpH
         cFgltLiQTlF0M9cvIl581bVL5iztkO00XkZ3bPSw9MbA8dxLApVldoNFHL/4UXJtx/Y3
         b/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987654; x=1764592454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BknfGuBsUxZBL8rid9/xP+veNGSFTsAItrjcV/2heyg=;
        b=LNVnV4vmDDR8mT56r47+vUTO2DjtmGx5g9dguAZmPVd55tZBXOK72iR6MW8Ib5gf+u
         XNykG6rlGxCCd+kU7i8m1ixGfhBFyeD26PDzZ1gCGOkapBkD+3pElPRlZhGi3yQor9Gw
         KrziS0DpRtkAUCwAs03oaWcfCUpFdT5jFzASy9R26HM31HdCF3h8jbyuyIDuYLfeMoRv
         WwEM5BEnHKmXZ9YKyhpWQY0cOPdRvGj7y+iasKIL7A3dkf2MoMl7TFMFj7JNkrjeSzOC
         chd6Iadof24qtLb/HxVuxcbNZkde1MIo8KugJBnfTs8agCJtPGDqCc4Gok2eibposBC3
         3Wfg==
X-Gm-Message-State: AOJu0Yxx8eXfN2/XApdArYz/Q1zta3NzYS1WZlW2aIAzYU01uQiMClb5
	RwuyOTOIpA87a2oCOG68xHQcTd5aiEs1LMf8KCehMFhBLsBN3gvEq14uV/svnTks
X-Gm-Gg: ASbGncu1DpwjQhaCBFp65himDQadt8QC5qzZIMv1kzR97WkTxNH2FYEeohuod/ktkr3
	FJlL/0mk+tJ38hjpPFUzZhaXpLKb00il6VENGRmv4FqlGfWS2a/oCioEUgMtUVC0cxW9xdtgjmr
	ILKAnLDuTZQfKARn+DHIjde/2hv0TnmiB4vqPsmO7ul5cYMOKl3kQD76h9pUna8+b0NwS0kwtla
	ayKRjOua2aHSStWFSz4JdP1lxE9sHu692BYZD5TZ6QFL0cd3uSw5GHW3jw4b1kvCcnu7Nj3+odA
	K8Y1Y12bKTArw08CUywckcVX07nR9s2Y4Y6CwnApsvjBYNYRZ6weEPArEDHEHhAqsGaeBNz9q31
	93qJIpq/9OJQCIVkramkUY22K6EJcRSV1WlY3V1YlfUu+XLFKaIRnsoaxdEVosoeuUhSot0EX6V
	QJcmRbRn0IKb8FGdGLfYXkf5GVa30D0D03AQYknXnyV6A7XTM5OYHAWWo=
X-Google-Smtp-Source: AGHT+IF4oytWobCUc/F8GZV8crZr3cyAx4i92C0AmhXDe4icoRWWdJrdOSx398t5nXdkMYgIQGcNKA==
X-Received: by 2002:a17:907:a05:b0:b6d:7288:973d with SMTP id a640c23a62f3a-b7671a15caemr1295240966b.56.1763987654084;
        Mon, 24 Nov 2025 04:34:14 -0800 (PST)
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
Subject: [PATCH v6 05/19] xen/riscv: construct the P2M pages pool for guests
Date: Mon, 24 Nov 2025 13:33:38 +0100
Message-ID: <65e3337903d27f64728fe5f17b70d889be78bc73.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
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
Changes in V5-6:
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
index 1098b6d926..2d1ad7a394 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -7,6 +7,7 @@ obj-y += intc.o
 obj-y += irq.o
 obj-y += mm.o
 obj-y += p2m.o
+obj-y += paging.o
 obj-y += pt.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
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
index 3017e9a260..857517f8ee 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -12,6 +12,7 @@
 #include <asm/csr.h>
 #include <asm/flushtlb.h>
 #include <asm/p2m.h>
+#include <asm/paging.h>
 #include <asm/riscv_encoding.h>
 #include <asm/vmid.h>
 
@@ -122,8 +123,25 @@ int p2m_init(struct domain *d)
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
2.51.1


