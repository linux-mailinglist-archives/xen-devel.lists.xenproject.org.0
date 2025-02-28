Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67137A49E8B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 17:18:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898956.1307416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34I-0003l9-QD; Fri, 28 Feb 2025 16:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898956.1307416; Fri, 28 Feb 2025 16:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34I-0003iX-Mc; Fri, 28 Feb 2025 16:18:30 +0000
Received: by outflank-mailman (input) for mailman id 898956;
 Fri, 28 Feb 2025 16:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/q7=VT=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1to34H-0003Uh-H6
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 16:18:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a40d06af-f5ef-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 17:18:27 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CACEA1515;
 Fri, 28 Feb 2025 08:18:41 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8D893F5A1;
 Fri, 28 Feb 2025 08:18:25 -0800 (PST)
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
X-Inumbo-ID: a40d06af-f5ef-11ef-9898-31a8f345e629
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/9] arm/mpu: Add HYPERVISOR_VIRT_START and avoid a check in xen.lds.S
Date: Fri, 28 Feb 2025 16:18:09 +0000
Message-Id: <20250228161817.3342443-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228161817.3342443-1-luca.fancellu@arm.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The define HYPERVISOR_VIRT_START is required by the common code,
even if MPU system doesn't use virtual memory, define it in
mpu/layout.h in order to reuse existing code.

Disable a check in the linker script for arm for !MMU systems.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/mpu/layout.h | 2 ++
 xen/arch/arm/xen.lds.S                | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/arm/include/asm/mpu/layout.h b/xen/arch/arm/include/asm/mpu/layout.h
index d6d397f4c2ac..248e55f8882d 100644
--- a/xen/arch/arm/include/asm/mpu/layout.h
+++ b/xen/arch/arm/include/asm/mpu/layout.h
@@ -22,6 +22,8 @@
  */
 #define XEN_VIRT_START         _AT(paddr_t, XEN_START_ADDRESS)
 
+#define HYPERVISOR_VIRT_START  XEN_VIRT_START
+
 #endif /* __ARM_MPU_LAYOUT_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index bbccff1a0350..4342e54422a7 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -239,4 +239,6 @@ ASSERT(IS_ALIGNED(__bss_start,      POINTER_ALIGN), "__bss_start is misaligned")
 ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
 /* To simplify the logic in head.S, we want to _end to be page aligned */
 ASSERT(IS_ALIGNED(_end,             PAGE_SIZE), "_end is not page aligned")
+#ifdef CONFIG_MMU
 ASSERT((_end - _start) <= XEN_VIRT_SIZE, "Xen is too big")
+#endif
-- 
2.34.1


