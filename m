Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84D689D873
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 13:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702253.1097242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru9vR-0006ID-NC; Tue, 09 Apr 2024 11:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702253.1097242; Tue, 09 Apr 2024 11:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru9vR-0006DC-IH; Tue, 09 Apr 2024 11:46:05 +0000
Received: by outflank-mailman (input) for mailman id 702253;
 Tue, 09 Apr 2024 11:46:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0lRi=LO=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1ru9vQ-0004JG-9N
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 11:46:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id bdbd7d8c-f666-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 13:46:02 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F5651007;
 Tue,  9 Apr 2024 04:46:32 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B5B23F766;
 Tue,  9 Apr 2024 04:46:01 -0700 (PDT)
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
X-Inumbo-ID: bdbd7d8c-f666-11ee-94a3-07e782e9044d
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 08/13] xen/arm: Introduce helper for static memory pages
Date: Tue,  9 Apr 2024 12:45:38 +0100
Message-Id: <20240409114543.3332150-9-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409114543.3332150-1-luca.fancellu@arm.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
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


