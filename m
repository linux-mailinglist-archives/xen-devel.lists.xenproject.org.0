Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91274538A2D
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 05:22:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339040.563884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvsSF-0001BJ-Un; Tue, 31 May 2022 03:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339040.563884; Tue, 31 May 2022 03:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvsSF-000192-Qx; Tue, 31 May 2022 03:21:59 +0000
Received: by outflank-mailman (input) for mailman id 339040;
 Tue, 31 May 2022 03:21:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Brif=WH=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nvsKI-000414-55
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 03:13:46 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ac9377a8-e08f-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 05:13:42 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B102723A;
 Mon, 30 May 2022 20:13:41 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1E4673F66F;
 Mon, 30 May 2022 20:13:37 -0700 (PDT)
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
X-Inumbo-ID: ac9377a8-e08f-11ec-bd2c-47488cf2e6aa
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
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v5 6/9] xen/arm: introduce CDF_staticmem
Date: Tue, 31 May 2022 11:12:38 +0800
Message-Id: <20220531031241.90374-7-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531031241.90374-1-Penny.Zheng@arm.com>
References: <20220531031241.90374-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to have an easy and quick way to find out whether this domain memory
is statically configured, this commit introduces a new flag CDF_staticmem and a
new helper is_domain_using_staticmem() to tell.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v5 changes:
- guard "is_domain_using_staticmem" under CONFIG_STATIC_MEMORY
- #define is_domain_using_staticmem zero if undefined
---
v4 changes:
- no changes
---
v3 changes:
- change name from "is_domain_static()" to "is_domain_using_staticmem"
---
v2 changes:
- change name from "is_domain_on_static_allocation" to "is_domain_static()"
---
 xen/arch/arm/domain_build.c       | 5 ++++-
 xen/arch/arm/include/asm/domain.h | 4 ++++
 xen/include/xen/domain.h          | 6 ++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7ddd16c26d..f6e2e44c1e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3287,9 +3287,12 @@ void __init create_domUs(void)
         if ( !dt_device_is_compatible(node, "xen,domain") )
             continue;
 
+        if ( dt_find_property(node, "xen,static-mem", NULL) )
+            flags |= CDF_staticmem;
+
         if ( dt_property_read_bool(node, "direct-map") )
         {
-            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) || !dt_find_property(node, "xen,static-mem", NULL) )
+            if ( !IS_ENABLED(CONFIG_STATIC_MEMORY) || !(flags & CDF_staticmem) )
                 panic("direct-map is not valid for domain %s without static allocation.\n",
                       dt_node_name(node));
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index fe7a029ebf..6bb999aff0 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -31,6 +31,10 @@ enum domain_type {
 
 #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 
+#ifdef CONFIG_STATIC_MEMORY
+#define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
+#endif
+
 /*
  * Is the domain using the host memory layout?
  *
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 1c3c88a14d..c613afa57e 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -34,6 +34,12 @@ void arch_get_domain_info(const struct domain *d,
 #ifdef CONFIG_ARM
 /* Should domain memory be directly mapped? */
 #define CDF_directmap            (1U << 1)
+/* Is domain memory on static allocation? */
+#define CDF_staticmem            (1U << 2)
+#endif
+
+#ifndef is_domain_using_staticmem
+#define is_domain_using_staticmem(d) ((void)(d), false)
 #endif
 
 /*
-- 
2.25.1


