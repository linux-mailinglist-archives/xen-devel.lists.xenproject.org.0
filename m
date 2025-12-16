Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12033CC4763
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188146.1509421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYL0-0007bR-SE; Tue, 16 Dec 2025 16:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188146.1509421; Tue, 16 Dec 2025 16:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYL0-0007Zs-Lq; Tue, 16 Dec 2025 16:55:50 +0000
Received: by outflank-mailman (input) for mailman id 1188146;
 Tue, 16 Dec 2025 16:55:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYKy-0006gk-HY
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:55:48 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 111b0e2f-daa0-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:55:46 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6418738efa0so9619625a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:55:46 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:55:45 -0800 (PST)
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
X-Inumbo-ID: 111b0e2f-daa0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904146; x=1766508946; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cc3HXZPlPB/gccG/CezolOSjWVEDuZPosWEfUeOasnw=;
        b=Sc9+AlFxvLfjOakec93bga3+XQh2/o0b/LqctjT9RrOcGxJuZ/0WoxQrezS05PZav6
         XsZVhTa/K5rBHObZDqd47Pithn2tBBuLD56O3P5wG7b/lwBvJnbfefvrcfhgaDKZpnQp
         lCfDg6P8FI1551SkXevKsYf2qk877i9iQtOKL6qZGzgfsL8VaxuLXpmyMmyNcm9+mGYV
         0vgR3FVdcjYKrVM93ruTyXKk5/wljB1LvUqXCrkzD10uyaUU4n/3Qarue2e7rDoiANBq
         r3Y8GcHMlturHJKQNWtWtDQzIhH0SfzrrzcsPmAy5BrrbSYSXk8nqxNDVS/TITtnT1Ue
         dJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904146; x=1766508946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cc3HXZPlPB/gccG/CezolOSjWVEDuZPosWEfUeOasnw=;
        b=t1hjl8EGcBepUr5LwrYzOi9UkCflwcrKgslVWXE3ybJvHFXt+oRGo4FqIBQ+i6Ckjr
         orFgTggURBbucG1B1JgGJGseGcO88YHifFw8l6Yrrz61zrufZLP+xmMpMAAgzBTNDhDJ
         vw7/UmCAJU7iGO7D3/PkbC8eq6LgIWB2226KZpeVc7u/TfM/VHzqo6lDQg1cz6q4Pcoa
         UJYh651uwM48Uv/pSnUPA1EZhGW1K5xHli2MRw3iw0nKgXXA0F+n6fHqRdnxoiJPs37J
         N86757MD/7Rwfvx9t/S7myziyKK3V/fULSIjKrqsC6iJ9B6wUg+UmEsRYglIw1MSJDeu
         Am4w==
X-Gm-Message-State: AOJu0YyuYUjbiqB7Gc2IGC48DfhDRbhdsP/5+wghanFR2oBsX1RR2Tdm
	0n1jEYDUUizRNLAKmjIMYn0s+IeAuwibEyRLRj8sarEo9w8FUAP8YoSaLAZgkQ==
X-Gm-Gg: AY/fxX6cxfnF9N1Gx0PvA23hmKWPX4B8GPleMl3jiZ9PJrCGbDSp33oaLju6YVnuV91
	9D4nw+9jZGgyiGwsN51EZfTbV6cJUtJ2LiByxvUTdBAvE/tpWVZNIi3gp73F/HY8ZUqS/+0D7j+
	IrhJmVU9Jvq0Ldr3P1cU6uf7IukPh2+5cbMPpVonJFz6qC6viid/RUASVsJsaibIvGqxWCVA+8H
	brwKPqQt5hWv0hU8tayUjKqcYTtYMZw4e/J3dSoy/PZq0oF6XeJqC12LaThIBESojk94XDi9Giu
	5CWuSKdl8XV85wIK7a3TijNGW4K+9qI+vh2y+QzlZE/3falZqOPPn1ATPwu/u6QRQQAtGAylGI4
	ze6LMBQUhCn6ZQPHpe2iShoVWNE60ok9S+amJ4wbKVaBzndh0Ym/J+sUvES5pekodaf3K+fSjf6
	DHKRB4FHtUJvayIs6jLOCObZPahL95k97Z2lgaABxWQ4nvEcl9EW1H0bk=
X-Google-Smtp-Source: AGHT+IFD5kt79BKZYSLc7CDp2O5EY9oTWFy7gFhz9nNEv5BhIsuQ+5wibcyus2cZYZopIQKBHcdYqA==
X-Received: by 2002:a17:907:3f88:b0:b73:1baa:6424 with SMTP id a640c23a62f3a-b7d23d002eamr1538155266b.55.1765904145704;
        Tue, 16 Dec 2025 08:55:45 -0800 (PST)
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
Subject: [PATCH v7 04/19] xen/riscv: construct the P2M pages pool for guests
Date: Tue, 16 Dec 2025 17:55:14 +0100
Message-ID: <684f846bb9b05a37b9650b2e1ccc3ba1b2cc9b10.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
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
Changes in V5-7:
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
index c93c837aac..9dde693db4 100644
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
index a6e2456f54..39c84f1a3b 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -12,6 +12,7 @@
 #include <asm/csr.h>
 #include <asm/flushtlb.h>
 #include <asm/p2m.h>
+#include <asm/paging.h>
 #include <asm/riscv_encoding.h>
 #include <asm/vmid.h>
 
@@ -118,8 +119,25 @@ int p2m_init(struct domain *d)
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
2.52.0


