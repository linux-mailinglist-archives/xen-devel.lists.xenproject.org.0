Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7055E8A9437
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708018.1106607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMKa-0006J5-E9; Thu, 18 Apr 2024 07:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708018.1106607; Thu, 18 Apr 2024 07:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMKa-0006At-A0; Thu, 18 Apr 2024 07:37:16 +0000
Received: by outflank-mailman (input) for mailman id 708018;
 Thu, 18 Apr 2024 07:37:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EyP4=LX=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rxMKY-00046V-Li
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:37:14 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 78549005-fd56-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 09:37:12 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50D75DA7;
 Thu, 18 Apr 2024 00:37:40 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A260A3F64C;
 Thu, 18 Apr 2024 00:37:11 -0700 (PDT)
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
X-Inumbo-ID: 78549005-fd56-11ee-94a3-07e782e9044d
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 08/12] xen/arm: Introduce helper for static memory pages
Date: Thu, 18 Apr 2024 08:36:48 +0100
Message-Id: <20240418073652.3622828-9-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418073652.3622828-1-luca.fancellu@arm.com>
References: <20240418073652.3622828-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new helper function in the static-memory module
that can be called to manage static memory banks, this is
done to reuse the code when other modules would like to
manage static memory banks that are not part of the
reserved_mem structure, this is done because the static
shared memory banks will be removed from reserved_mem.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v2:
 - Add Michal R-by
 - Changed commit msg
v1:
 - new patch
---
---
 xen/arch/arm/include/asm/static-memory.h | 13 +++++++++++++
 xen/arch/arm/static-memory.c             | 12 +-----------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/include/asm/static-memory.h b/xen/arch/arm/include/asm/static-memory.h
index 3e3efd70c38d..804166e541ef 100644
--- a/xen/arch/arm/include/asm/static-memory.h
+++ b/xen/arch/arm/include/asm/static-memory.h
@@ -3,10 +3,23 @@
 #ifndef __ASM_STATIC_MEMORY_H_
 #define __ASM_STATIC_MEMORY_H_
 
+#include <xen/pfn.h>
 #include <asm/kernel.h>
 
 #ifdef CONFIG_STATIC_MEMORY
 
+static inline void init_staticmem_bank(const struct membank *bank)
+{
+    mfn_t bank_start = _mfn(PFN_UP(bank->start));
+    unsigned long bank_pages = PFN_DOWN(bank->size);
+    mfn_t bank_end = mfn_add(bank_start, bank_pages);
+
+    if ( mfn_x(bank_end) <= mfn_x(bank_start) )
+        return;
+
+    unprepare_staticmem_pages(mfn_to_page(bank_start), bank_pages, false);
+}
+
 void allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
                             const struct dt_device_node *node);
 void assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
diff --git a/xen/arch/arm/static-memory.c b/xen/arch/arm/static-memory.c
index 34bd12696a53..d4585c5a0633 100644
--- a/xen/arch/arm/static-memory.c
+++ b/xen/arch/arm/static-memory.c
@@ -265,17 +265,7 @@ void __init init_staticmem_pages(void)
     for ( bank = 0 ; bank < reserved_mem->nr_banks; bank++ )
     {
         if ( reserved_mem->bank[bank].type == MEMBANK_STATIC_DOMAIN )
-        {
-            mfn_t bank_start = _mfn(PFN_UP(reserved_mem->bank[bank].start));
-            unsigned long bank_pages = PFN_DOWN(reserved_mem->bank[bank].size);
-            mfn_t bank_end = mfn_add(bank_start, bank_pages);
-
-            if ( mfn_x(bank_end) <= mfn_x(bank_start) )
-                return;
-
-            unprepare_staticmem_pages(mfn_to_page(bank_start),
-                                      bank_pages, false);
-        }
+            init_staticmem_bank(&reserved_mem->bank[bank]);
     }
 }
 
-- 
2.34.1


