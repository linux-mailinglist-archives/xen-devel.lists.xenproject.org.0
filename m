Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637FD668B55
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:30:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476496.738708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdQ-0006Ab-Co; Fri, 13 Jan 2023 05:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476496.738708; Fri, 13 Jan 2023 05:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdQ-00067e-9X; Fri, 13 Jan 2023 05:29:48 +0000
Received: by outflank-mailman (input) for mailman id 476496;
 Fri, 13 Jan 2023 05:29:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCdP-0005sP-37
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:29:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 494582fe-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:29:44 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0128613D5;
 Thu, 12 Jan 2023 21:30:26 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 791993F587;
 Thu, 12 Jan 2023 21:29:41 -0800 (PST)
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
X-Inumbo-ID: 494582fe-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 01/40] xen/arm: remove xen_phys_start and xenheap_phys_end from config.h
Date: Fri, 13 Jan 2023 13:28:34 +0800
Message-Id: <20230113052914.3845596-2-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

These two variables are stale variables, they only have declarations
in config.h, they don't have any definition and no any code is using
these two variables. So in this patch, we remove them from config.h.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v1 -> v2:
1. Add Ab.
---
 xen/arch/arm/include/asm/config.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 0fefed1b8a..25a625ff08 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -172,8 +172,6 @@
 #define STACK_SIZE  (PAGE_SIZE << STACK_ORDER)
 
 #ifndef __ASSEMBLY__
-extern unsigned long xen_phys_start;
-extern unsigned long xenheap_phys_end;
 extern unsigned long frametable_virt_end;
 #endif
 
-- 
2.25.1


