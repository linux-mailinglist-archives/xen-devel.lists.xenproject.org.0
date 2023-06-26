Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9111D73D680
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555073.866780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5U-0007b7-C8; Mon, 26 Jun 2023 03:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555073.866780; Mon, 26 Jun 2023 03:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5T-0007QM-HD; Mon, 26 Jun 2023 03:40:23 +0000
Received: by outflank-mailman (input) for mailman id 555073;
 Mon, 26 Jun 2023 03:40:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd1L-0007ej-Vr
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 95a48964-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:36:07 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBB071FB;
 Sun, 25 Jun 2023 20:36:50 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F381B3F64C;
 Sun, 25 Jun 2023 20:36:03 -0700 (PDT)
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
X-Inumbo-ID: 95a48964-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 19/52] xen/arm: switch to use ioremap_xxx in common file
Date: Mon, 26 Jun 2023 11:34:10 +0800
Message-Id: <20230626033443.2943270-20-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In arm, with the introduction of MPU system, VMAP scheme, taking
advantage of virtual translation, will become a MMU-only feature.
So we want to avoid using direct access to all vmap-related functions,
like __vmap(), in common files, and switch to use more generic eoremap_xxx
instead.
Then later, we also just need to implement MPU version of ioremap_xxx.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new commit
---
 xen/arch/arm/kernel.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index d13ef0330b..30f8bc5923 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -172,7 +172,6 @@ static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
     unsigned int kernel_order_out;
     paddr_t output_size;
     struct page_info *pages;
-    mfn_t mfn;
     int i;
     paddr_t addr = mod->start;
     paddr_t size = mod->size;
@@ -209,13 +208,18 @@ static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
         iounmap(input);
         return -ENOMEM;
     }
-    mfn = page_to_mfn(pages);
-    output = __vmap(&mfn, 1 << kernel_order_out, 1, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
+    output = ioremap_cache(page_to_maddr(pages),
+                           pfn_to_paddr(1UL << kernel_order_out));
+    if ( output == NULL )
+    {
+        iounmap(output);
+        return -EFAULT;
+    }
 
     rc = perform_gunzip(output, input, size);
     clean_dcache_va_range(output, output_size);
     iounmap(input);
-    vunmap(output);
+    iounmap(output);
 
     if ( rc )
     {
-- 
2.25.1


