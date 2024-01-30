Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A63B842AF8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 18:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673651.1048058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUrvh-0006du-Pr; Tue, 30 Jan 2024 17:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673651.1048058; Tue, 30 Jan 2024 17:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUrvh-0006bZ-MZ; Tue, 30 Jan 2024 17:29:49 +0000
Received: by outflank-mailman (input) for mailman id 673651;
 Tue, 30 Jan 2024 17:29:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rUrvg-0006bR-0v
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 17:29:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rUrvf-0004fN-Jx; Tue, 30 Jan 2024 17:29:47 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rUrvf-0008Ft-9w; Tue, 30 Jan 2024 17:29:47 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=YUsBRa33zDNhna1IY2kSXXVWAQohLzBiuT+6OdS+yss=; b=1Qf15y
	EUEA2XgnFY4Ync8YizcwsKjNMMUZGcvOtLCGzvPVE55uqjyISYe8L04jt4qHz8fKfKDoc9EIL6gaF
	cyNRnT/yXta3IK7VLyufamHvnEbi2CQaexcRllEUzMSAZNTsUFkDWsNa1xjmeFMfejV1Ui4TXxnwf
	4Go9C6VaE0c=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH] xen/arm: Properly clean update to init_ttbr and smp_up_cpu
Date: Tue, 30 Jan 2024 17:29:42 +0000
Message-Id: <20240130172942.52175-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Recent rework to the secondary boot code modified how init_ttbr and
smp_up_cpu are accessed. Rather than directly accessing them, we
are using a pointer to them.

The helper clean_dcache() is expected to take the variable in parameter
and then clean its content. As we now pass a pointer to the variable,
we will clean the area storing the address rather than the content itself.

Switch to use clean_dcache_va_range() to avoid casting the pointer.

Fixes: a5ed59e62c6f ("arm/mmu: Move init_ttbr to a new section .data.idmap")
Fixes: 9a5114074b04 ("arm/smpboot: Move smp_up_cpu to a new section .data.idmap)

Reported-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/mmu/smpboot.c | 2 +-
 xen/arch/arm/smpboot.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index bc91fdfe3331..4ffc8254a44b 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -88,7 +88,7 @@ static void set_init_ttbr(lpae_t *root)
      * init_ttbr will be accessed with the MMU off, so ensure the update
      * is visible by cleaning the cache.
      */
-    clean_dcache(ptr);
+    clean_dcache_va_range(ptr, sizeof(uint64_t));
 
     unmap_domain_page(ptr);
 }
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 119bfa3160ad..a84e706d77da 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -449,7 +449,7 @@ static void set_smp_up_cpu(unsigned long mpidr)
      * smp_up_cpu will be accessed with the MMU off, so ensure the update
      * is visible by cleaning the cache.
      */
-    clean_dcache(ptr);
+    clean_dcache_va_range(ptr, sizeof(unsigned long));
 
     unmap_domain_page(ptr);
 
-- 
2.40.1


