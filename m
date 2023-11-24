Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6A47F7065
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 10:49:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640332.998345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Snv-0008W9-VJ; Fri, 24 Nov 2023 09:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640332.998345; Fri, 24 Nov 2023 09:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Snv-0008TU-Sf; Fri, 24 Nov 2023 09:48:55 +0000
Received: by outflank-mailman (input) for mailman id 640332;
 Fri, 24 Nov 2023 09:48:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vqky=HF=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1r6Snu-0007zs-2z
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 09:48:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id aca10602-8aae-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 10:48:52 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10A3A1424;
 Fri, 24 Nov 2023 01:49:38 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B0973F7A6;
 Fri, 24 Nov 2023 01:48:51 -0800 (PST)
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
X-Inumbo-ID: aca10602-8aae-11ee-9b0e-b553b5be7939
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 2/5] xen/arm: Add asm/domain.h include to kernel.h
Date: Fri, 24 Nov 2023 09:48:38 +0000
Message-Id: <20231124094841.1475381-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124094841.1475381-1-luca.fancellu@arm.com>
References: <20231124094841.1475381-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'enum domain_type' is defined by 'asm/domain.h' which is not
included (directly or indirectly) by 'asm/kernel.h'.

This currently doesn't break the compilation because asm/domain.h will
included by the user of 'kernel.h'. But it would be better to avoid
relying on it. So add the include in 'asm/domain.h'.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes from v2:
 - add Ack-by Julien
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


