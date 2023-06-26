Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CB573D686
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555076.866799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5Y-0008Mm-65; Mon, 26 Jun 2023 03:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555076.866799; Mon, 26 Jun 2023 03:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5X-00083m-4S; Mon, 26 Jun 2023 03:40:27 +0000
Received: by outflank-mailman (input) for mailman id 555076;
 Mon, 26 Jun 2023 03:40:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd0p-0007ej-9f
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:35:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8244304c-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:35:34 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33DF32F4;
 Sun, 25 Jun 2023 20:36:18 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE9583F64C;
 Sun, 25 Jun 2023 20:35:31 -0700 (PDT)
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
X-Inumbo-ID: 8244304c-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 09/52] xen/arm: use PA == VA for EARLY_UART_VIRTUAL_ADDRESS on MPU systems
Date: Mon, 26 Jun 2023 11:34:00 +0800
Message-Id: <20230626033443.2943270-10-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

There is no VMSA support on MPU systems, so we can not map early
UART to FIXMAP_CONSOLE. In stead, we can use PA == VA for early
UART on MPU systems.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2:
1. New patch
---
v3:
1. fix comment
2. change CONFIG_ARM_V8R to !CONFIG_HAS_MMU
---
 xen/arch/arm/include/asm/early_printk.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
index c5149b2976..ec5bcc343c 100644
--- a/xen/arch/arm/include/asm/early_printk.h
+++ b/xen/arch/arm/include/asm/early_printk.h
@@ -15,10 +15,22 @@
 
 #ifdef CONFIG_EARLY_PRINTK
 
+#ifndef CONFIG_HAS_MMU
+
+/*
+ * For MPU systems, there is no VMSA support in EL2, so we use VA == PA
+ * for EARLY_UART_VIRTUAL_ADDRESS.
+ */
+#define EARLY_UART_VIRTUAL_ADDRESS CONFIG_EARLY_UART_BASE_ADDRESS
+
+#else
+
 /* need to add the uart address offset in page to the fixmap address */
 #define EARLY_UART_VIRTUAL_ADDRESS \
     (FIXMAP_ADDR(FIXMAP_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
 
+#endif /* CONFIG_HAS_MMU */
+
 #endif /* !CONFIG_EARLY_PRINTK */
 
 #endif
-- 
2.25.1


