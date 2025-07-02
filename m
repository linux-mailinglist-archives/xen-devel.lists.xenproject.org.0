Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAECAF5AC9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:14:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031210.1405004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyEM-0000mS-0J; Wed, 02 Jul 2025 14:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031210.1405004; Wed, 02 Jul 2025 14:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyEL-0000il-RM; Wed, 02 Jul 2025 14:14:33 +0000
Received: by outflank-mailman (input) for mailman id 1031210;
 Wed, 02 Jul 2025 14:14:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WqgU=ZP=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uWyEK-0007Ob-IF
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:14:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id df6aa2d3-574e-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 16:14:31 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68EA122C7;
 Wed,  2 Jul 2025 07:14:16 -0700 (PDT)
Received: from PWQ0QT7DJ1.arm.com (unknown [10.57.65.245])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC3EF3F6A8;
 Wed,  2 Jul 2025 07:14:29 -0700 (PDT)
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
X-Inumbo-ID: df6aa2d3-574e-11f0-a313-13f23c93f187
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v2 6/6] arm/mpu: Implement remove_early_mappings for MPU systems
Date: Wed,  2 Jul 2025 15:14:01 +0100
Message-ID: <540b3b9ea598a63b31ffe4165bd791d4b8151863.1751464757.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1751464757.git.hari.limaye@arm.com>
References: <cover.1751464757.git.hari.limaye@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Fancellu <luca.fancellu@arm.com>

Implement remove_early_mappings for MPU systems.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from v1:
- Add Ayan's R-b
---
 xen/arch/arm/mpu/setup.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
index ab00cb944b..5928b534d5 100644
--- a/xen/arch/arm/mpu/setup.c
+++ b/xen/arch/arm/mpu/setup.c
@@ -97,7 +97,14 @@ void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
 
 void __init remove_early_mappings(void)
 {
-    BUG_ON("unimplemented");
+    int rc;
+
+    if ( mapped_fdt_paddr == INVALID_PADDR )
+        return;
+
+    rc = destroy_xen_mappings(round_pgdown(mapped_fdt_paddr), mapped_fdt_limit);
+    if ( rc )
+        panic("Unable to unmap the device-tree.\n");
 }
 
 /*
-- 
2.34.1


