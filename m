Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBBEA5DE6A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 14:53:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910337.1317097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMWH-0007Qa-Go; Wed, 12 Mar 2025 13:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910337.1317097; Wed, 12 Mar 2025 13:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMWH-0007Nh-Cw; Wed, 12 Mar 2025 13:53:13 +0000
Received: by outflank-mailman (input) for mailman id 910337;
 Wed, 12 Mar 2025 13:53:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FzNf=V7=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tsMWF-0006ux-Uj
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 13:53:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5606bdaa-ff49-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 14:53:11 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEF0F1691;
 Wed, 12 Mar 2025 06:53:21 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EAB73F5A1;
 Wed, 12 Mar 2025 06:53:09 -0700 (PDT)
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
X-Inumbo-ID: 5606bdaa-ff49-11ef-9ab9-95dc52dad729
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 03/10] arm/mpu: Add HYPERVISOR_VIRT_START and avoid a check in xen.lds.S
Date: Wed, 12 Mar 2025 13:52:51 +0000
Message-Id: <20250312135258.1815706-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312135258.1815706-1-luca.fancellu@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
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


