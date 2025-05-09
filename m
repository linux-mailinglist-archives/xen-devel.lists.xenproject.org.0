Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7800AAB1981
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 17:58:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980132.1366620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQ6p-0006fR-S1; Fri, 09 May 2025 15:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980132.1366620; Fri, 09 May 2025 15:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQ6p-0006bR-NZ; Fri, 09 May 2025 15:57:59 +0000
Received: by outflank-mailman (input) for mailman id 980132;
 Fri, 09 May 2025 15:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZIRI=XZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uDQ6o-0006Ks-I8
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 15:57:58 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 606da725-2cee-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 17:57:58 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ac2bdea5a38so319445966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 08:57:58 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21947a88fsm168723766b.81.2025.05.09.08.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 08:57:56 -0700 (PDT)
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
X-Inumbo-ID: 606da725-2cee-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746806277; x=1747411077; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkyJj8JMdl89i28EMMlSrA84WkLEbjMJQGptj7C/v9o=;
        b=ROHZY7iD6eLB1YvJsSjN1FlPp+i+GAifBDunrKkxZwkLQzbObNnGryBSHNNyf9JQYg
         7N+fUyCumBrcF/YQDKxJXTbf2osNLlFCrgYSbGsXjiPJ2o1G+3golQBoNp2sjZP5/v7Z
         K9lWaV1lwhji+XwALmMwz/03Mz3hFx1CWX39FMUwtnGVf7sA0LBKRmBp5f8vFTlf7Jq7
         lQ2s23GsUVwNsxZJK548vQO0Y+9DF6aqrZxaVGkKHdpRbsjr+vDWgazhzcf/Id90awAf
         gl4RmeqbUmL8c4+iidmiQxmQQjWYkxs7PuwwCfPlVoYEwb6tj2mZzH1HCNqYXdHLD7ub
         PtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806277; x=1747411077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkyJj8JMdl89i28EMMlSrA84WkLEbjMJQGptj7C/v9o=;
        b=wPya54FSZheyJqxoNBlogLtzLXh8BAXb9KrbKAMHbFDQMTY8suo4RBUpG5bqjMFrv8
         PDTo54iI5Py0yrCZZrh0BE54Px/pmNhTvvLpaj+buXNrfK+4KBeMRXEMq072ZaI+Bxdl
         cmh0acAueQZ8UUjQAbvRHY6IfjhwtLlePdEYAO4bRmd5iz1mLuYcz9fD5VIdgkCCq8Wg
         8uFEO3UCw6avz2otLklBegxAa9sxvpsrLmXVMDauhXncJ+ZhNKC/5ys1Mz525fOSVM9K
         /2TcG1UvOp3AhqAOg7HuaE9RoZLSRzjaJmu1UucSnwfKuLLBxrQqrXz8LlSiVySXsqKW
         dymQ==
X-Gm-Message-State: AOJu0Yxa4MSWl+NGM7opo6E9x4X908L8Ce7r/fIpM6jaMbhXdknk7S0g
	Cgih7dnQ87+aSneGeDyNY9hZXyRxDxZkd3ZnMeHWhBFNxtayCLljW1DOWw==
X-Gm-Gg: ASbGncuOC0/mVdOtGUeVU/Ms3LmXvjPUHuvhmadzL1UyHdocumLZ1VjoilhTK37LZww
	piU/4eoZORE+KhKy6PeomGj6u9sO1ltA22wC7qdITNjB9FbMo6YjRDF++Wx6bJ2Lea8Twv0tB8a
	VPBHUCmsF0AnmV3ObBmGCoGJfpIEFqdzo36xqVO0kXQqchnR8LBZoOPww8qyX1aLOflJsFuSUqZ
	9elhn22qbzMD6aGkomq46oSD2HjM15FpxoJuk3LZg+VTpkWzyDOcJGciwNE1uaOhyqaqf50jDM2
	dOwImgKymAHc4Ee9u1khSdVD5g3Mmjp7Y9VREVUJ3znPpl8ZuykaHpC+AgIktHiI++7+Xuu5Y6I
	e0PpT8xSv5w==
X-Google-Smtp-Source: AGHT+IH2KDBjkqrz5qKTDnd4fSpMppBunhRIHx5Oe0d2MojyO8oAXPs58wrRDSzFPOPEVmcPgMQKbw==
X-Received: by 2002:a17:907:8749:b0:acb:b900:2bca with SMTP id a640c23a62f3a-ad218810026mr399148566b.0.1746806277166;
        Fri, 09 May 2025 08:57:57 -0700 (PDT)
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
Subject: [PATCH v1 3/6] xen/riscv: construct the P2M pages pool for guests
Date: Fri,  9 May 2025 17:57:48 +0200
Message-ID: <c9c60bb73fcae0b72d3bc18c10f5ca6cccc5a676.1746805907.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746805907.git.oleksii.kurochko@gmail.com>
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/domain.h | 10 +++++
 xen/arch/riscv/p2m.c                | 67 +++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 48be90a395..b818127f9f 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -2,6 +2,8 @@
 #ifndef ASM__RISCV__DOMAIN_H
 #define ASM__RISCV__DOMAIN_H
 
+#include <xen/mm.h>
+#include <xen/spinlock.h>
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
 
@@ -18,12 +20,20 @@ struct arch_vcpu_io {
 struct arch_vcpu {
 };
 
+struct paging_domain {
+    spinlock_t lock;
+    /* Free P2M pages from the pre-allocated P2M pool */
+    struct page_list_head p2m_freelist;
+    /* Number of pages from the pre-allocated P2M pool */
+    unsigned long p2m_total_pages;
+};
 
 struct arch_domain {
     struct hvm_domain hvm;
 
     struct p2m_domain p2m;
 
+    struct paging_domain paging;
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/p2m.c b/xen/arch/riscv/p2m.c
index ad4beef8f9..a890870391 100644
--- a/xen/arch/riscv/p2m.c
+++ b/xen/arch/riscv/p2m.c
@@ -1,4 +1,12 @@
 #include <xen/domain_page.h>
+/*
+ * Because of general_preempt_check() from xen/sched.h which uses
+ * local_events_need_delivery() but latter is declared in <asm/event.h>.
+ * Thereby it is needed to icnlude <xen/event.h> here before xen/sched.h.
+ *
+ * Shouldn't be xen/event.h be included in <xen/sched.h>?
+ */
+#include <xen/event.h>
 #include <xen/iommu.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
@@ -133,7 +141,9 @@ int p2m_init(struct domain *d)
     int rc;
 
     rwlock_init(&p2m->lock);
+    spin_lock_init(&d->arch.paging.lock);
     INIT_PAGE_LIST_HEAD(&p2m->pages);
+    INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
 
     p2m->max_mapped_gfn = _gfn(0);
     p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
@@ -166,3 +176,60 @@ int p2m_init(struct domain *d)
 
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
+            ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
+                d->arch.paging.p2m_total_pages + 1;
+            page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
+        }
+        else if ( d->arch.paging.p2m_total_pages > pages )
+        {
+            /* Need to return memory to domheap */
+            pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
+            if( pg )
+            {
+                ACCESS_ONCE(d->arch.paging.p2m_total_pages) =
+                    d->arch.paging.p2m_total_pages - 1;
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


