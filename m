Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D92A9CDD03
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 11:51:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837074.1253010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtuf-0001Ld-EO; Fri, 15 Nov 2024 10:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837074.1253010; Fri, 15 Nov 2024 10:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtuf-0001GJ-AD; Fri, 15 Nov 2024 10:50:53 +0000
Received: by outflank-mailman (input) for mailman id 837074;
 Fri, 15 Nov 2024 10:50:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ntz=SK=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tBtue-0000jy-1O
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 10:50:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 79cd26b4-a33f-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 11:50:49 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E99751A25;
 Fri, 15 Nov 2024 02:51:18 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EB213F6A8;
 Fri, 15 Nov 2024 02:50:47 -0800 (PST)
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
X-Inumbo-ID: 79cd26b4-a33f-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6Ijc5Y2QyNmI0LWEzM2YtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjY3ODQ5Ljc4MjA0Nywic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/5] xen/arm: only map the init text section RW in free_init_memory
Date: Fri, 15 Nov 2024 10:50:34 +0000
Message-Id: <20241115105036.218418-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115105036.218418-1-luca.fancellu@arm.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

In free_init_memory, we do not need to map the whole init section RW,
as only init text section is mapped RO in boot time.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
This is this one: https://patchwork.kernel.org/project/xen-devel/patch/20230626033443.2943270-19-Penny.Zheng@arm.com/
---
 xen/arch/arm/mmu/setup.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 9664e85ee6c0..1b1d302c8788 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -7,6 +7,7 @@
 
 #include <xen/init.h>
 #include <xen/libfdt/libfdt.h>
+#include <xen/pfn.h>
 #include <xen/sections.h>
 #include <xen/sizes.h>
 #include <xen/vmap.h>
@@ -309,16 +310,17 @@ void *__init arch_vmap_virt_end(void)
 void free_init_memory(void)
 {
     paddr_t pa = virt_to_maddr(__init_begin);
+    unsigned long inittext_end = round_pgup((unsigned long)_einittext);
     unsigned long len = __init_end - __init_begin;
     uint32_t insn;
     unsigned int i, nr = len / sizeof(insn);
     uint32_t *p;
     int rc;
 
-    rc = modify_xen_mappings((unsigned long)__init_begin,
-                             (unsigned long)__init_end, PAGE_HYPERVISOR_RW);
+    rc = modify_xen_mappings((unsigned long)__init_begin, inittext_end,
+                             PAGE_HYPERVISOR_RW);
     if ( rc )
-        panic("Unable to map RW the init section (rc = %d)\n", rc);
+        panic("Unable to map RW the init text section (rc = %d)\n", rc);
 
     /*
      * From now on, init will not be used for execution anymore,
-- 
2.34.1


