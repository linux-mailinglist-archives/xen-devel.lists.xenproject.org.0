Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 668DD520B2C
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 04:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325095.547563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noFbg-0004D4-63; Tue, 10 May 2022 02:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325095.547563; Tue, 10 May 2022 02:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noFbg-0004As-03; Tue, 10 May 2022 02:28:12 +0000
Received: by outflank-mailman (input) for mailman id 325095;
 Tue, 10 May 2022 02:28:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0KWj=VS=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1noFbe-0003k7-7I
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 02:28:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d40deea3-d008-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 04:28:08 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73DE512FC;
 Mon,  9 May 2022 19:28:07 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 458EE3F66F;
 Mon,  9 May 2022 19:28:03 -0700 (PDT)
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
X-Inumbo-ID: d40deea3-d008-11ec-8fc4-03012f2f19d4
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Penny Zheng <penny.zheng@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 3/6] xen: add field "flags" to cover all internal CDF_XXX
Date: Tue, 10 May 2022 10:27:30 +0800
Message-Id: <20220510022733.2422581-4-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510022733.2422581-1-Penny.Zheng@arm.com>
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With more and more CDF_xxx internal flags in and to save the space, this
commit introduces a new field "flags" in struct domain to store CDF_*
internal flags directly.

Another new CDF_xxx will be introduced in the next patch.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v4 changes:
- no change
---
v3 changes:
- change fixed width type uint32_t to unsigned int
- change "flags" to a more descriptive name "cdf"
---
v2 changes:
- let "flags" live in the struct domain. So other arch can take
advantage of it in the future
- fix coding style
---
 xen/arch/arm/domain.c             | 2 --
 xen/arch/arm/include/asm/domain.h | 3 +--
 xen/common/domain.c               | 3 +++
 xen/include/xen/sched.h           | 3 +++
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 8110c1df86..74189d9878 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -709,8 +709,6 @@ int arch_domain_create(struct domain *d,
     ioreq_domain_init(d);
 #endif
 
-    d->arch.directmap = flags & CDF_directmap;
-
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
         goto fail;
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index ed63c2b6f9..fe7a029ebf 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -29,7 +29,7 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
-#define is_domain_direct_mapped(d) (d)->arch.directmap
+#define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 
 /*
  * Is the domain using the host memory layout?
@@ -103,7 +103,6 @@ struct arch_domain
     void *tee;
 #endif
 
-    bool directmap;
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8d2c2a9897..6373407047 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -567,6 +567,9 @@ struct domain *domain_create(domid_t domid,
     /* Sort out our idea of is_system_domain(). */
     d->domain_id = domid;
 
+    /* Holding CDF_* internal flags. */
+    d->cdf = flags;
+
     /* Debug sanity. */
     ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ed8539f6d2..49415a113a 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -591,6 +591,9 @@ struct domain
         struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
     } ioreq_server;
 #endif
+
+    /* Holding CDF_* constant. Internal flags for domain creation. */
+    unsigned int cdf;
 };
 
 static inline struct page_list_head *page_to_list(
-- 
2.25.1


