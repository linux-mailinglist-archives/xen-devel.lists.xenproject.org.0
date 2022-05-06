Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE2651D234
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 09:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322656.544105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmsLw-000108-7e; Fri, 06 May 2022 07:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322656.544105; Fri, 06 May 2022 07:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmsLw-0000xz-2w; Fri, 06 May 2022 07:26:16 +0000
Received: by outflank-mailman (input) for mailman id 322656;
 Fri, 06 May 2022 07:26:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5MfP=VO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nmsLt-00078X-PQ
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 07:26:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cd75e8c0-cd0d-11ec-a406-831a346695d4;
 Fri, 06 May 2022 09:26:10 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E7161063;
 Fri,  6 May 2022 00:26:10 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7BDE93FA27;
 Fri,  6 May 2022 00:26:07 -0700 (PDT)
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
X-Inumbo-ID: cd75e8c0-cd0d-11ec-a406-831a346695d4
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 6/9] xen/arm: add P2M type parameter in guest_physmap_add_pages
Date: Fri,  6 May 2022 15:24:59 +0800
Message-Id: <20220506072502.2177828-7-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506072502.2177828-1-Penny.Zheng@arm.com>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to cover the scenario where users intend to set up guest
p2m foreign mapping with nr_pages, this commit adds a new P2M type
parameter in guest_physmap_add_pages.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2 change:
- no change
---
 xen/arch/arm/domain_build.c    | 5 +++--
 xen/arch/arm/include/asm/p2m.h | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b3ba0c501d..089b9e99fc 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -507,7 +507,7 @@ static bool __init append_static_memory_to_bank(struct domain *d,
     else
         sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
 
-    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
+    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages, p2m_ram_rw);
     if ( res )
     {
         dprintk(XENLOG_ERR, "Failed to map pages to DOMU: %d", res);
@@ -850,7 +850,8 @@ static int __init allocate_shared_memory(struct domain *d,
     nr_pages = PFN_DOWN(psize);
     if ( d != dom_io )
     {
-        ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, PFN_DOWN(psize));
+        ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, nr_pages,
+                                      p2m_ram_rw);
         if ( ret )
         {
             printk(XENLOG_ERR
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 8cce459b67..58590145b0 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -317,9 +317,10 @@ guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
 static inline int guest_physmap_add_pages(struct domain *d,
                                           gfn_t gfn,
                                           mfn_t mfn,
-                                          unsigned int nr_pages)
+                                          unsigned int nr_pages,
+                                          p2m_type_t t)
 {
-    return p2m_insert_mapping(d, gfn, nr_pages, mfn, p2m_ram_rw);
+    return p2m_insert_mapping(d, gfn, nr_pages, mfn, t);
 }
 
 mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn);
-- 
2.25.1


