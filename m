Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BEC89D871
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 13:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702249.1097211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru9vO-0005Pl-P8; Tue, 09 Apr 2024 11:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702249.1097211; Tue, 09 Apr 2024 11:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru9vO-0005Id-H1; Tue, 09 Apr 2024 11:46:02 +0000
Received: by outflank-mailman (input) for mailman id 702249;
 Tue, 09 Apr 2024 11:46:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0lRi=LO=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1ru9vN-0004JG-1w
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 11:46:01 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id bbcc171d-f666-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 13:45:59 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51A311007;
 Tue,  9 Apr 2024 04:46:29 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E0B83F766;
 Tue,  9 Apr 2024 04:45:58 -0700 (PDT)
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
X-Inumbo-ID: bbcc171d-f666-11ee-94a3-07e782e9044d
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 05/13] xen/arm: Conditional compilation of kernel_info.shm_mem member
Date: Tue,  9 Apr 2024 12:45:35 +0100
Message-Id: <20240409114543.3332150-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409114543.3332150-1-luca.fancellu@arm.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The user of shm_mem member of the 'struct kernel_info' is only
the code managing the static shared memory feature, which can be
compiled out using CONFIG_STATIC_SHM, so in case the feature is
not requested, that member won't be used and will waste memory
space.

To address this issue, protect the member with the Kconfig parameter
and modify the signature of the only function using it to remove
any reference to the member from outside the static-shmem module.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v2:
 - add Michal R-by
 - Removed the signature modification of make_resv_memory_node from
   this patch
v1:
 - new patch
---
---
 xen/arch/arm/include/asm/kernel.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 1730854d7f3c..85e1625cc989 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -39,7 +39,9 @@ struct kernel_info {
     void *fdt; /* flat device tree */
     paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
     struct meminfo mem;
+#ifdef CONFIG_STATIC_SHM
     struct meminfo shm_mem;
+#endif
 
     /* kernel entry point */
     paddr_t entry;
@@ -89,10 +91,16 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
     return &kinfo->mem.common;
 }
 
+#ifdef CONFIG_STATIC_SHM
+#define KERNEL_INFO_SHM_MEM_INIT .shm_mem.common.max_banks = NR_MEM_BANKS,
+#else
+#define KERNEL_INFO_SHM_MEM_INIT
+#endif
+
 #define KERNEL_INFO_INIT                        \
 {                                               \
     .mem.common.max_banks = NR_MEM_BANKS,       \
-    .shm_mem.common.max_banks = NR_MEM_BANKS,   \
+    KERNEL_INFO_SHM_MEM_INIT                    \
 }
 
 /*
-- 
2.34.1


