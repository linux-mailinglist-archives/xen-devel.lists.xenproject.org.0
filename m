Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF1F550EA8
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 04:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352190.578969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o37PO-0006Dl-BF; Mon, 20 Jun 2022 02:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352190.578969; Mon, 20 Jun 2022 02:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o37PO-00069y-6o; Mon, 20 Jun 2022 02:44:58 +0000
Received: by outflank-mailman (input) for mailman id 352190;
 Mon, 20 Jun 2022 02:44:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dqE0=W3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o37PN-0004eN-HG
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 02:44:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id f8116d11-f042-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 04:44:56 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FCA41042;
 Sun, 19 Jun 2022 19:44:56 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 02AFD3F7D7;
 Sun, 19 Jun 2022 19:44:51 -0700 (PDT)
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
X-Inumbo-ID: f8116d11-f042-11ec-bd2d-47488cf2e6aa
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
Subject: [PATCH v7 5/9] xen: add field "flags" to cover all internal CDF_XXX
Date: Mon, 20 Jun 2022 10:44:04 +0800
Message-Id: <20220620024408.203797-6-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620024408.203797-1-Penny.Zheng@arm.com>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With more and more CDF_xxx internal flags in and to save the space, this
commit introduces a new field "flags" in struct domain to store CDF_*
internal flags directly.

Another new CDF_xxx will be introduced in the next patch.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v7 changes:
- no change
---
v6 changes:
- no change
---
v5 changes:
- no change
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
index 7570eae91a..a3ef991bd1 100644
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
index 463d41ffb6..5191853c18 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -596,6 +596,9 @@ struct domain
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


