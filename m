Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B041D1F694
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 15:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203212.1518510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg1qp-0003sk-KR; Wed, 14 Jan 2026 14:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203212.1518510; Wed, 14 Jan 2026 14:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg1qp-0003lO-E2; Wed, 14 Jan 2026 14:27:59 +0000
Received: by outflank-mailman (input) for mailman id 1203212;
 Wed, 14 Jan 2026 14:27:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZzH=7T=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vg1qn-0002lw-NE
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 14:27:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 38598b2a-f155-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 15:27:57 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD49D1655;
 Wed, 14 Jan 2026 06:27:49 -0800 (PST)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AF2E3F632;
 Wed, 14 Jan 2026 06:27:54 -0800 (PST)
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
X-Inumbo-ID: 38598b2a-f155-11f0-b15e-2bf370ae4941
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v4 5/6] arm: Use secure hypervisor timer in MPU system
Date: Wed, 14 Jan 2026 14:27:33 +0000
Message-ID: <20260114142734.239197-6-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114142734.239197-1-harry.ramsey@arm.com>
References: <20260114142734.239197-1-harry.ramsey@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

As MPU systems only have one secure state, we have to use secure EL2
hypervisor timer for Xen in secure EL2.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>
---
v4:
- No changes
v3:
- Add Ayan R-by
- Add Michal A-by
v2:
- Remove unncessary kconfig attribute.
- Remove unncessary hypervisor timer macro.
---
 xen/arch/arm/include/asm/arm64/sysregs.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 7dfd20414d..19d409d3eb 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -462,6 +462,17 @@
 #define ZCR_ELx_LEN_SIZE             9
 #define ZCR_ELx_LEN_MASK             0x1ff
 
+#ifdef CONFIG_MPU
+/*
+ * The Armv8-R AArch64 architecture always executes code in Secure
+ * state with EL2 as the highest exception level.
+ *
+ * Hypervisor timer registers for Secure EL2.
+ */
+#define CNTHP_CTL_EL2   CNTHPS_CTL_EL2
+#define CNTHP_CVAL_EL2  CNTHPS_CVAL_EL2
+#endif
+
 #define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
 #define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
 #define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
-- 
2.43.0


