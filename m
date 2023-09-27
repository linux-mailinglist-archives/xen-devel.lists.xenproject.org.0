Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D147B05F7
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 16:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608949.947794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlV6q-0006xl-Hc; Wed, 27 Sep 2023 14:01:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608949.947794; Wed, 27 Sep 2023 14:01:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlV6q-0006r2-Cq; Wed, 27 Sep 2023 14:01:48 +0000
Received: by outflank-mailman (input) for mailman id 608949;
 Wed, 27 Sep 2023 14:01:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xec+=FL=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qlV6p-0006dA-0D
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 14:01:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 649554e8-5d3e-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 16:01:45 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B98BB11FB;
 Wed, 27 Sep 2023 07:02:22 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C45953F7C5;
 Wed, 27 Sep 2023 07:01:43 -0700 (PDT)
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
X-Inumbo-ID: 649554e8-5d3e-11ee-9b0d-b553b5be7939
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/5] xen/arm: Add asm/domain.h include to kernel.h
Date: Wed, 27 Sep 2023 15:01:30 +0100
Message-Id: <20230927140133.631192-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927140133.631192-1-luca.fancellu@arm.com>
References: <20230927140133.631192-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'enum domain_type' is defined by 'asm/domain.h' which is not
included (directly or indirectly) by 'asm/kernel.h'.

This currently doesn't break the compilation because asm/domain.h will
included by the user of 'kernel.h'. But it would be better to avoid
relying on it. So add the include in 'asm/domain.h'.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v1:
 - Rephrased commit message (Julien)
---
 xen/arch/arm/include/asm/kernel.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 4617cdc83bac..0a23e86c2d37 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -7,6 +7,7 @@
 #define __ARCH_ARM_KERNEL_H__
 
 #include <xen/device_tree.h>
+#include <asm/domain.h>
 #include <asm/setup.h>
 
 /*
-- 
2.34.1


