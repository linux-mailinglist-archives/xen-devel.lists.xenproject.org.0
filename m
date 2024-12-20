Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8590A9F9542
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 16:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861853.1273886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOenE-0003Tg-Kp; Fri, 20 Dec 2024 15:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861853.1273886; Fri, 20 Dec 2024 15:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOenE-0003Rx-H8; Fri, 20 Dec 2024 15:19:56 +0000
Received: by outflank-mailman (input) for mailman id 861853;
 Fri, 20 Dec 2024 15:19:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tgSW=TN=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tOenD-0003Rr-6V
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 15:19:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id dcb54b76-bee5-11ef-a0d9-8be0dac302b0;
 Fri, 20 Dec 2024 16:19:54 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D43231480;
 Fri, 20 Dec 2024 07:20:20 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95E123F528;
 Fri, 20 Dec 2024 07:19:51 -0800 (PST)
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
X-Inumbo-ID: dcb54b76-bee5-11ef-a0d9-8be0dac302b0
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Initialise memory type for struct kernel_info
Date: Fri, 20 Dec 2024 15:19:41 +0000
Message-Id: <20241220151941.4192864-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit a14593e3995a ("xen/device-tree: Allow region overlapping with
/memreserve/ ranges") introduced a type in the 'struct membanks_hdr'
but forgot to update the 'struct kernel_info' initialiser, while
it doesn't lead to failures because the field is not currently
used while managing kernel_info structures, it's good to have it
for completeness.

Fixes: a14593e3995a ("xen/device-tree: Allow region overlapping with /memreserve/ ranges")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/kernel.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 7e6e3c82a477..de3f945ae54c 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -92,7 +92,9 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
 }
 
 #ifdef CONFIG_STATIC_SHM
-#define KERNEL_INFO_SHM_MEM_INIT .shm_mem.common.max_banks = NR_SHMEM_BANKS,
+#define KERNEL_INFO_SHM_MEM_INIT                \
+    .shm_mem.common.max_banks = NR_SHMEM_BANKS, \
+    .shm_mem.common.type = STATIC_SHARED_MEMORY,
 #else
 #define KERNEL_INFO_SHM_MEM_INIT
 #endif
@@ -100,6 +102,7 @@ kernel_info_get_mem_const(const struct kernel_info *kinfo)
 #define KERNEL_INFO_INIT                        \
 {                                               \
     .mem.common.max_banks = NR_MEM_BANKS,       \
+    .mem.common.type = MEMORY,                  \
     KERNEL_INFO_SHM_MEM_INIT                    \
 }
 
-- 
2.34.1


