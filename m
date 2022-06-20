Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A004550EAF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 04:48:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352242.579014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o37Sx-0001Zf-Tq; Mon, 20 Jun 2022 02:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352242.579014; Mon, 20 Jun 2022 02:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o37Sx-0001Xe-Qk; Mon, 20 Jun 2022 02:48:39 +0000
Received: by outflank-mailman (input) for mailman id 352242;
 Mon, 20 Jun 2022 02:48:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dqE0=W3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o37PS-0004eN-Hq
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 02:45:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id fa8d538b-f042-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 04:45:00 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 328C31042;
 Sun, 19 Jun 2022 19:45:00 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 69F0E3F7D7;
 Sun, 19 Jun 2022 19:44:56 -0700 (PDT)
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
X-Inumbo-ID: fa8d538b-f042-11ec-bd2d-47488cf2e6aa
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
Subject: [PATCH v7 6/9] xen/arm: introduce CDF_staticmem
Date: Mon, 20 Jun 2022 10:44:05 +0800
Message-Id: <20220620024408.203797-7-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620024408.203797-1-Penny.Zheng@arm.com>
References: <20220620024408.203797-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to have an easy and quick way to find out whether this domain memory
is statically configured, this commit introduces a new flag CDF_staticmem and a
new helper is_domain_using_staticmem() to tell.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v7 changes:
- IS_ENABLED(CONFIG_STATIC_MEMORY) would not be needed anymore
---
v6 changes:
- move non-zero is_domain_using_staticmem() from ARM header to common
header
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
 xen/arch/arm/domain_build.c |  5 ++++-
 xen/include/xen/domain.h    | 12 ++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7ddd16c26d..17cd886be8 100644
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
+            if ( !(flags & CDF_staticmem) )
                 panic("direct-map is not valid for domain %s without static allocation.\n",
                       dt_node_name(node));
 
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 1c3c88a14d..cf34eddf6d 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -35,6 +35,18 @@ void arch_get_domain_info(const struct domain *d,
 /* Should domain memory be directly mapped? */
 #define CDF_directmap            (1U << 1)
 #endif
+/* Is domain memory on static allocation? */
+#ifdef CONFIG_STATIC_MEMORY
+#define CDF_staticmem            (1U << 2)
+#else
+#define CDF_staticmem            0
+#endif
+
+#ifdef CONFIG_STATIC_MEMORY
+#define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
+#else
+#define is_domain_using_staticmem(d) ((void)(d), false)
+#endif
 
 /*
  * Arch-specifics.
-- 
2.25.1


