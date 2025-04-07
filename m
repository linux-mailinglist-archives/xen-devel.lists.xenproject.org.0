Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BDEA7D92D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 11:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939431.1339554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1iZ6-0004wg-6s; Mon, 07 Apr 2025 09:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939431.1339554; Mon, 07 Apr 2025 09:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1iZ6-0004rl-1z; Mon, 07 Apr 2025 09:14:48 +0000
Received: by outflank-mailman (input) for mailman id 939431;
 Mon, 07 Apr 2025 09:14:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U9Ey=WZ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1u1iZ4-0003xy-N7
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 09:14:46 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id bf90f20c-1390-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 11:14:46 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8B181BF3;
 Mon,  7 Apr 2025 02:14:46 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85D1A3F59E;
 Mon,  7 Apr 2025 02:14:44 -0700 (PDT)
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
X-Inumbo-ID: bf90f20c-1390-11f0-9eaa-5ba50f476ded
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 5/7] arm/mpu: Introduce MPU memory mapping flags
Date: Mon,  7 Apr 2025 10:14:28 +0100
Message-Id: <20250407091430.2342709-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407091430.2342709-1-luca.fancellu@arm.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
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


