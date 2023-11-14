Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8217EAC6B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 10:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632220.986399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pLA-0003JZ-3e; Tue, 14 Nov 2023 09:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632220.986399; Tue, 14 Nov 2023 09:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2pL9-0003GE-Vr; Tue, 14 Nov 2023 09:04:11 +0000
Received: by outflank-mailman (input) for mailman id 632220;
 Tue, 14 Nov 2023 09:04:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHxF=G3=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1r2pL8-0002m9-LQ
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 09:04:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c5849b9c-82cc-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 10:04:09 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 482C11007;
 Tue, 14 Nov 2023 01:04:54 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D65493F641;
 Tue, 14 Nov 2023 01:04:07 -0800 (PST)
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
X-Inumbo-ID: c5849b9c-82cc-11ee-98db-6d05b1d4d9a1
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 2/5] xen/arm: Add asm/domain.h include to kernel.h
Date: Tue, 14 Nov 2023 09:03:53 +0000
Message-Id: <20231114090356.875180-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114090356.875180-1-luca.fancellu@arm.com>
References: <20231114090356.875180-1-luca.fancellu@arm.com>
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


