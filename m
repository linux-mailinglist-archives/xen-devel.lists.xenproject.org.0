Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FBF51BEB7
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 13:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322047.543243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nma8f-0000EH-VX; Thu, 05 May 2022 11:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322047.543243; Thu, 05 May 2022 11:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nma8f-0000AZ-Rj; Thu, 05 May 2022 11:59:21 +0000
Received: by outflank-mailman (input) for mailman id 322047;
 Thu, 05 May 2022 11:59:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pu9C=VN=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nma8e-0000AS-G4
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 11:59:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cb03a216-cc6a-11ec-a406-831a346695d4;
 Thu, 05 May 2022 13:59:18 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FACE106F;
 Thu,  5 May 2022 04:59:18 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.3.137])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CE4F3F885;
 Thu,  5 May 2022 04:59:16 -0700 (PDT)
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
X-Inumbo-ID: cb03a216-cc6a-11ec-a406-831a346695d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2] xen/arm: Avoid overflow using MIDR_IMPLEMENTOR_MASK
Date: Thu,  5 May 2022 13:59:06 +0200
Message-Id: <20220505115906.380416-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Value of macro MIDR_IMPLEMENTOR_MASK exceeds the range of integer
and can lead to overflow. Currently there is no issue as it is used
in an expression implicitly casted to u32 in MIDR_IS_CPU_MODEL_RANGE.
To avoid possible problems, fix the macro.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Link: https://lore.kernel.org/r/20220426070603.56031-1-michal.orzel@arm.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Origin: git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git (48e6f22e25a4)
---
Changes since v1:
- add Origin tag as the patch was merged in upstream arm64 linux tree
---
 xen/arch/arm/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 852b5f3c24..7a1c4c4410 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -39,7 +39,7 @@
 #define MIDR_VARIANT(midr) \
     (((midr) & MIDR_VARIANT_MASK) >> MIDR_VARIANT_SHIFT)
 #define MIDR_IMPLEMENTOR_SHIFT  24
-#define MIDR_IMPLEMENTOR_MASK   (0xff << MIDR_IMPLEMENTOR_SHIFT)
+#define MIDR_IMPLEMENTOR_MASK   (0xffU << MIDR_IMPLEMENTOR_SHIFT)
 #define MIDR_IMPLEMENTOR(midr) \
     (((midr) & MIDR_IMPLEMENTOR_MASK) >> MIDR_IMPLEMENTOR_SHIFT)
 
-- 
2.25.1


