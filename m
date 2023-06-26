Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 266BF73D65B
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554955.866431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd0T-0007o9-VM; Mon, 26 Jun 2023 03:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554955.866431; Mon, 26 Jun 2023 03:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd0T-0007hI-Pf; Mon, 26 Jun 2023 03:35:13 +0000
Received: by outflank-mailman (input) for mailman id 554955;
 Mon, 26 Jun 2023 03:35:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd0R-0007ej-VA
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:35:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 744454cd-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:35:11 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9511E2F4;
 Sun, 25 Jun 2023 20:35:54 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E48BC3F64C;
 Sun, 25 Jun 2023 20:35:07 -0700 (PDT)
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
X-Inumbo-ID: 744454cd-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 01/52] xen/arm: remove xen_phys_start and xenheap_phys_end from config.h
Date: Mon, 26 Jun 2023 11:33:52 +0800
Message-Id: <20230626033443.2943270-2-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

These two variables are stale variables, they only have declarations
in config.h, they don't have any definition and no any code is using
these two variables. So in this patch, we remove them from config.h.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v1 -> v2:
1. Add Ab.
---
v3:
- no changes
---
 xen/arch/arm/include/asm/config.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index c969e6da58..30f4665ba9 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -204,8 +204,6 @@
 #define STACK_SIZE  (PAGE_SIZE << STACK_ORDER)
 
 #ifndef __ASSEMBLY__
-extern unsigned long xen_phys_start;
-extern unsigned long xenheap_phys_end;
 extern unsigned long frametable_virt_end;
 #endif
 
-- 
2.25.1


