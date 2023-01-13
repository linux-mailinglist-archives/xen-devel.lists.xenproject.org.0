Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60824668B58
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476508.738784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdi-0000NE-8n; Fri, 13 Jan 2023 05:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476508.738784; Fri, 13 Jan 2023 05:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdi-0000FT-08; Fri, 13 Jan 2023 05:30:06 +0000
Received: by outflank-mailman (input) for mailman id 476508;
 Fri, 13 Jan 2023 05:30:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCdg-0005sJ-74
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 54999a60-9303-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 06:30:03 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6A64FEC;
 Thu, 12 Jan 2023 21:30:44 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A95933F587;
 Thu, 12 Jan 2023 21:30:00 -0800 (PST)
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
X-Inumbo-ID: 54999a60-9303-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 08/40] xen/arm: use PA == VA for EARLY_UART_VIRTUAL_ADDRESS on Armv-8R
Date: Fri, 13 Jan 2023 13:28:41 +0800
Message-Id: <20230113052914.3845596-9-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

There is no VMSA support on Armv8-R AArch64, so we can not map early
UART to FIXMAP_CONSOLE. Instead, we use PA == VA to define
EARLY_UART_VIRTUAL_ADDRESS on Armv8-R AArch64.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
1. New patch
---
 xen/arch/arm/include/asm/early_printk.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
index c5149b2976..44a230853f 100644
--- a/xen/arch/arm/include/asm/early_printk.h
+++ b/xen/arch/arm/include/asm/early_printk.h
@@ -15,10 +15,22 @@
 
 #ifdef CONFIG_EARLY_PRINTK
 
+#ifdef CONFIG_ARM_V8R
+
+/*
+ * For Armv-8r, there is not VMSA support in EL2, so we use VA == PA
+ * for EARLY_UART_VIRTUAL_ADDRESS.
+ */
+#define EARLY_UART_VIRTUAL_ADDRESS CONFIG_EARLY_UART_BASE_ADDRESS
+
+#else
+
 /* need to add the uart address offset in page to the fixmap address */
 #define EARLY_UART_VIRTUAL_ADDRESS \
     (FIXMAP_ADDR(FIXMAP_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
 
+#endif /* CONFIG_ARM_V8R */
+
 #endif /* !CONFIG_EARLY_PRINTK */
 
 #endif
-- 
2.25.1


