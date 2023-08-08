Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF5A7738C8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 10:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579367.907316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTHdi-00083W-Jz; Tue, 08 Aug 2023 08:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579367.907316; Tue, 08 Aug 2023 08:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTHdi-0007yc-CI; Tue, 08 Aug 2023 08:00:26 +0000
Received: by outflank-mailman (input) for mailman id 579367;
 Tue, 08 Aug 2023 08:00:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/Vr=DZ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qTHdh-0007xV-FJ
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 08:00:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a10e1a25-35c1-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 10:00:24 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E38D143D;
 Tue,  8 Aug 2023 01:01:06 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B195F3F6C4;
 Tue,  8 Aug 2023 01:00:22 -0700 (PDT)
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
X-Inumbo-ID: a10e1a25-35c1-11ee-b280-6b7b168915f2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/5] xen/arm: Add asm/domain.h include to kernel.h
Date: Tue,  8 Aug 2023 09:00:07 +0100
Message-Id: <20230808080010.3858575-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808080010.3858575-1-luca.fancellu@arm.com>
References: <20230808080010.3858575-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add asm/domain.h that is defining the type 'enum domain_type', it
is needed on arm64 build where this type is used for a member of
the structure kernel_info.

Fixes: 66e994a5e74f ("xen: arm64: add guest type to domain field.")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
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


