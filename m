Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B74C403C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 09:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278839.476239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNW89-000537-7K; Fri, 25 Feb 2022 08:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278839.476239; Fri, 25 Feb 2022 08:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNW89-000518-3k; Fri, 25 Feb 2022 08:39:13 +0000
Received: by outflank-mailman (input) for mailman id 278839;
 Fri, 25 Feb 2022 08:39:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QTOj=TI=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nNW87-0004qP-AY
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 08:39:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6687ecf5-9616-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 09:39:10 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EF33106F;
 Fri, 25 Feb 2022 00:39:09 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.19.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1042A3F70D;
 Fri, 25 Feb 2022 00:39:07 -0800 (PST)
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
X-Inumbo-ID: 6687ecf5-9616-11ec-8539-5f4723681683
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Avoid integer overflow using MIDR_IMPLEMENTOR_MASK
Date: Fri, 25 Feb 2022 09:38:54 +0100
Message-Id: <20220225083854.6371-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Value of macro MIDR_IMPLEMENTOR_MASK exceeds the range of integer
and can lead to overflow. Currently there is no issue as it is used
in an expression implicitly casted to u32 in MIDR_IS_CPU_MODEL_RANGE.
To avoid possible problems, fix the macro.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 8ab2940f68..149fae0d27 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -39,7 +39,7 @@
 #define MIDR_VARIANT(midr) \
     (((midr) & MIDR_VARIANT_MASK) >> MIDR_VARIANT_SHIFT)
 #define MIDR_IMPLEMENTOR_SHIFT  24
-#define MIDR_IMPLEMENTOR_MASK   (0xff << MIDR_IMPLEMENTOR_SHIFT)
+#define MIDR_IMPLEMENTOR_MASK   (0xffu << MIDR_IMPLEMENTOR_SHIFT)
 #define MIDR_IMPLEMENTOR(midr) \
     (((midr) & MIDR_IMPLEMENTOR_MASK) >> MIDR_IMPLEMENTOR_SHIFT)
 
-- 
2.29.0


