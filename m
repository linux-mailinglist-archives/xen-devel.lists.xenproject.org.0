Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF01A49E88
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 17:18:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898962.1307470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34P-00056u-Oz; Fri, 28 Feb 2025 16:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898962.1307470; Fri, 28 Feb 2025 16:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34P-00051p-L4; Fri, 28 Feb 2025 16:18:37 +0000
Received: by outflank-mailman (input) for mailman id 898962;
 Fri, 28 Feb 2025 16:18:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/q7=VT=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1to34O-0003Ub-6p
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 16:18:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a90cdb05-f5ef-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 17:18:35 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C2181515;
 Fri, 28 Feb 2025 08:18:50 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19F6B3F5A1;
 Fri, 28 Feb 2025 08:18:33 -0800 (PST)
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
X-Inumbo-ID: a90cdb05-f5ef-11ef-9aaf-95dc52dad729
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 7/9] arm/mpu: Introduce MPU memory mapping flags
Date: Fri, 28 Feb 2025 16:18:15 +0000
Message-Id: <20250228161817.3342443-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228161817.3342443-1-luca.fancellu@arm.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the MPU memory mapping flags in asm/page.h.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/page.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
index 69f817d1e68a..22f7d2c6cb30 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -62,6 +62,7 @@
 
 #define MAIRVAL (MAIR1VAL << 32 | MAIR0VAL)
 
+#ifdef CONFIG_MMU
 /*
  * Layout of the flags used for updating the hypervisor page tables
  *
@@ -90,6 +91,30 @@
 #define _PAGE_CONTIG_BIT    8
 #define _PAGE_CONTIG        (1U << _PAGE_CONTIG_BIT)
 
+#else /* !CONFIG_MMU */
+
+/*
+ * Layout of the flags used for updating MPU memory region attributes
+ * [0:2] Memory attribute Index
+ * [3:4] Execute Never
+ * [5:6] Access Permission
+ * [7]   Region Present
+ */
+#define _PAGE_AI_BIT            0
+#define _PAGE_XN_BIT            3
+#define _PAGE_AP_BIT            5
+#define _PAGE_PRESENT_BIT       7
+#define _PAGE_AI                (7U << _PAGE_AI_BIT)
+#define _PAGE_XN                (2U << _PAGE_XN_BIT)
+#define _PAGE_RO                (2U << _PAGE_AP_BIT)
+#define _PAGE_PRESENT           (1U << _PAGE_PRESENT_BIT)
+#define PAGE_AI_MASK(x)         (((x) >> _PAGE_AI_BIT) & 0x7U)
+#define PAGE_XN_MASK(x)         (((x) >> _PAGE_XN_BIT) & 0x3U)
+#define PAGE_AP_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x3U)
+#define PAGE_RO_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x2U)
+
+#endif /* CONFIG_MMU */
+
 /*
  * _PAGE_DEVICE and _PAGE_NORMAL are convenience defines. They are not
  * meant to be used outside of this header.
-- 
2.34.1


