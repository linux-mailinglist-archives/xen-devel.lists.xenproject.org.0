Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F13C07005
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 17:38:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150563.1481691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCJrO-0004cW-Jv; Fri, 24 Oct 2025 15:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150563.1481691; Fri, 24 Oct 2025 15:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCJrO-0004ZJ-GI; Fri, 24 Oct 2025 15:37:46 +0000
Received: by outflank-mailman (input) for mailman id 1150563;
 Fri, 24 Oct 2025 15:37:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QEVg=5B=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vCJrN-0003nv-Iu
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 15:37:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6214e1ff-b0ef-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 17:37:44 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 789161515;
 Fri, 24 Oct 2025 08:37:35 -0700 (PDT)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21B953F63F;
 Fri, 24 Oct 2025 08:37:42 -0700 (PDT)
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
X-Inumbo-ID: 6214e1ff-b0ef-11f0-980a-7dc792cee155
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/3] arm: Implement ioremap_attr for MPU
Date: Fri, 24 Oct 2025 16:37:19 +0100
Message-ID: <20251024153719.408806-4-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251024153719.408806-1-harry.ramsey@arm.com>
References: <20251024153719.408806-1-harry.ramsey@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the function `ioremap_attr` for MPU systems.

Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
 xen/arch/arm/mpu/mm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index c5128244b7..3570ce6b27 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -475,8 +475,13 @@ void free_init_memory(void)
 
 void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)
 {
-    BUG_ON("unimplemented");
-    return NULL;
+    paddr_t start_pg = round_pgdown(start);
+    paddr_t end_pg = round_pgup(start_pg + len);
+    if ( xen_mpumap_update(start_pg, end_pg, flags) )
+        return NULL;
+
+    /* Mapped or already mapped */
+    return maddr_to_virt(start_pg);
 }
 
 /*
-- 
2.43.0


