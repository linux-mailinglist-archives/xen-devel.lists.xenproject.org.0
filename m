Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE155AE14A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 09:40:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399536.640759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVTBR-0007uI-Qd; Tue, 06 Sep 2022 07:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399536.640759; Tue, 06 Sep 2022 07:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVTBR-0007qW-Mm; Tue, 06 Sep 2022 07:39:45 +0000
Received: by outflank-mailman (input) for mailman id 399536;
 Tue, 06 Sep 2022 07:39:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YUvx=ZJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oVTBQ-0007HG-54
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 07:39:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 128107ba-2db7-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 09:39:43 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04820139F;
 Tue,  6 Sep 2022 00:39:49 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 383BE3F73D;
 Tue,  6 Sep 2022 00:40:06 -0700 (PDT)
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
X-Inumbo-ID: 128107ba-2db7-11ed-a016-b9edf5238543
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
Subject: [PATCH v12 2/6] xen/arm: introduce CDF_staticmem
Date: Tue,  6 Sep 2022 15:39:15 +0800
Message-Id: <20220906073919.941934-3-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906073919.941934-1-Penny.Zheng@arm.com>
References: <20220906073919.941934-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to have an easy and quick way to find out whether this domain memory
is statically configured, this commit introduces a new flag CDF_staticmem and a
new helper is_domain_using_staticmem() to tell.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v12 changes:
- no change
---
v11 changes:
- no change
---
v10 changes:
- no change
---
v9 changes:
- no change
---
v8 changes:
- #ifdef-ary around is_domain_using_staticmem() is not needed anymore
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
- change name from "is_domain_on_static_allocation" to "is_domain_static()
---
 xen/arch/arm/domain_build.c | 5 ++++-
 xen/include/xen/domain.h    | 8 ++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3fd1186b53..b76a84e8f5 100644
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
index 628b14b086..2c8116afba 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -35,6 +35,14 @@ void arch_get_domain_info(const struct domain *d,
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
+#define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
 
 /*
  * Arch-specifics.
-- 
2.25.1


