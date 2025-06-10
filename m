Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24DBAD3809
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:05:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010786.1389017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfj-0005ai-BK; Tue, 10 Jun 2025 13:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010786.1389017; Tue, 10 Jun 2025 13:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfj-0005WI-6N; Tue, 10 Jun 2025 13:05:47 +0000
Received: by outflank-mailman (input) for mailman id 1010786;
 Tue, 10 Jun 2025 13:05:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyfh-0004iH-BP
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:45 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e90be84-45fb-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:05:44 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so978046866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:44 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:43 -0700 (PDT)
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
X-Inumbo-ID: 9e90be84-45fb-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560744; x=1750165544; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5cGIp6lzcilrw8ShbCVkPARsAjo5L5Ne3xaR6XcYW4=;
        b=OFSzIbgKWbtgOUiRHZyf64fFHOHxgcwdnXvLJDaxPuTXYnXkALBtg3zB2pXbuDoQx5
         rB5ImVzsiIDRnvOpWDKvTsz1pLHEvl+2/cyvsCouopsFceEj+721fiYC5bS68D7Ybq8a
         yIPRKUqDMu9LeQJPSSqWMVAzKKnRuTcQwSH/lVKqyEiXloJtK1OsBq35fKx8WZvyrhFs
         IcqOHV0GlsTSjUcgFNuoyE543dUMV33rdCyD32kV+qDILJovc+EyCyYyDuEDBvi4Tnmw
         fiNG+zApYCWoUj2sQVYz6FFA5Hg2OJ7vdsSNKaYl443WpcS/p80Px2iZdolnHS54K6Rs
         62HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560744; x=1750165544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5cGIp6lzcilrw8ShbCVkPARsAjo5L5Ne3xaR6XcYW4=;
        b=DIp35M450VG8W/4wo7osPNSBsvmcUhoAWOw9Hpn07/LsTxKUycgk92I6IqRc3gOuGQ
         pHzthnAijKh1Y43e1Hj2/xUfGkZCpFR9rgGIc27F4NhLIYoJFuJQ0KZx3tGuiqPFdkiz
         VlT4+3D92/Mw5Hl7Fzd9cW131pbr7Bm5lxcPuHgVNT75qmFRSxPs1bbWQQUokK0t6Yn2
         dK11n7/qOUB2ErD/IUZZLD+KqmDEqwKq9W5kcxg1uxonwAzyl38XbGz9Gaq6EEGCA8Se
         3x5nEW4IURQQrO4hR45Q8hkhrwVyGxrRAXtQj4SIIbQho3L2DLA+R+Z/okc8yMUV3PGj
         hICg==
X-Gm-Message-State: AOJu0YymSJtSei0x/6HSXvUS63wv0fqHj+JtKYWa2UgMSeo6rqnNeLgG
	9RQWKX3WltPgRgfFbRiBwQRNSFdGlnlcfmgyzNkNc0fuB9W/rml8KbqXFLmlWw==
X-Gm-Gg: ASbGncvA6S5nKOGDGZEEOlodGT5qF45yqlcLCdPllb1Lfoqx1d989lvMNuAOMhqQG6N
	aYmQzPY2CpUXOVE3Nvt4vvD5NYTO3WLaSNr+dRFJMGox0qSIiYVnTx0St+4gmyKeqbxzgXqwlQp
	HYGYEu8Hsw8OgRcyiMIZ75LzxREWDEHEOywDY/Ko3dVdrB+B/Pc2Ef9q/7Usl2dnLT2nc0oakx3
	T+Cz0vxOn8Gn6N7uUGfgv2F3u96wq+p2fAO1miZ37Zu5+mW8ImARsq9Cp9m8QER2GbHG4UVUSoz
	l3R7oqvIRUF8MQ5FshipndgLRMyAp5sZTHU24mHTRkq9dPagMUIGKIHA69jnAF8cMP/nYawb4pC
	kSqWHM9WCBhth+Uog7JtSPfhR1j97
X-Google-Smtp-Source: AGHT+IG+GuksJhWm+r89SaPyXR4MgjeFB20puLjU92lWbLXtuoPxVX1Hd0Ryeej0kxstXLeuped14g==
X-Received: by 2002:a17:907:c22:b0:ad8:87a0:62aa with SMTP id a640c23a62f3a-ade1aab90f1mr1740126066b.27.1749560743862;
        Tue, 10 Jun 2025 06:05:43 -0700 (PDT)
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
Subject: [PATCH v2 04/17] xen/riscv: construct the P2M pages pool for guests
Date: Tue, 10 Jun 2025 15:05:19 +0200
Message-ID: <bdde7c97df218d3ac65f9e719c5777401da80495.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
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

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Drop the comment above inclusion of <xen/event.h> in riscv/p2m.c.
 - Use ACCESS_ONCE() for lhs and rhs for the expressions in
   p2m_set_allocation().
---
 xen/arch/riscv/include/asm/domain.h | 12 ++++++
 xen/arch/riscv/p2m.c                | 59 +++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index b9a03e91c5..b818127f9f 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -2,6 +2,8 @@
 #ifndef ASM__RISCV__DOMAIN_H
 #define ASM__RISCV__DOMAIN_H
 
+#include <xen/mm.h>
+#include <xen/spinlock.h>
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
@@ -18,10 +20,20 @@ struct arch_vcpu_io {
 struct arch_vcpu {
 };
 
+struct paging_domain {
+    spinlock_t lock;
+    /* Free P2M pages from the pre-allocated P2M pool */
+    struct page_list_head p2m_freelist;
+    /* Number of pages from the pre-allocated P2M pool */
+    unsigned long p2m_total_pages;
+};
+
 struct arch_domain {
     struct hvm_domain hvm;
 
     struct p2m_domain p2m;
+
+    struct paging_domain paging;
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index 9f7fd8290a..f33c7147ff 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1,4 +1,5 @@
 #include <xen/bitops.h>
+#include <xen/event.h>
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/spinlock.h>
@@ -105,6 +106,9 @@ int p2m_init(struct domain *d)
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
 
+    spin_lock_init(&d->arch.paging.lock);
+    INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
+
     p2m->vmid = INVALID_VMID;
 
     rc = p2m_alloc_vmid(d);
@@ -113,3 +117,58 @@ int p2m_init(struct domain *d)
 
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
+    struct page_info *pg;
+
+    ASSERT(spin_is_locked(&d->arch.paging.lock));
+
+    for ( ; ; )
+    {
+        if ( d->arch.paging.p2m_total_pages < pages )
+        {
+            /* Need to allocate more memory from domheap */
+            pg = alloc_domheap_page(d, MEMF_no_owner);
+            if ( pg == NULL )
+            {
+                printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
+                return -ENOMEM;
+            }
+            ACCESS_ONCE(d->arch.paging.p2m_total_pages)++;
+            page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
+        }
+        else if ( d->arch.paging.p2m_total_pages > pages )
+        {
+            /* Need to return memory to domheap */
+            pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
+            if( pg )
+            {
+                ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
+                free_domheap_page(pg);
+            }
+            else
+            {
+                printk(XENLOG_ERR
+                       "Failed to free P2M pages, P2M freelist is empty.\n");
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
-- 
2.49.0


