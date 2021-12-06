Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA0B469E63
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 16:38:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239288.414755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muG3i-0002CB-B4; Mon, 06 Dec 2021 15:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239288.414755; Mon, 06 Dec 2021 15:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muG3i-0002AQ-7s; Mon, 06 Dec 2021 15:37:42 +0000
Received: by outflank-mailman (input) for mailman id 239288;
 Mon, 06 Dec 2021 15:37:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j7EA=QX=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1muG3g-0001Ov-QN
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:37:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 71f35000-56aa-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 16:37:40 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BBBF1042;
 Mon,  6 Dec 2021 07:37:39 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8691E3F5A1;
 Mon,  6 Dec 2021 07:37:38 -0800 (PST)
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
X-Inumbo-ID: 71f35000-56aa-11ec-a5e1-b9374ead2679
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Add Kconfig parameter for memory banks number
Date: Mon,  6 Dec 2021 15:37:30 +0000
Message-Id: <20211206153730.49791-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

Currently the maximum number of memory banks is fixed to
128, but on some new platforms that have a large amount
of memory, this value is not enough and prevents Xen
from booting.

Create a Kconfig parameter to set the value, by default
128.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/Kconfig        | 8 ++++++++
 xen/include/asm-arm/setup.h | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4d3..805e3c417e89 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -25,6 +25,14 @@ menu "Architecture Features"
 
 source "arch/Kconfig"
 
+config MEM_BANKS
+	int "Maximum number of memory banks."
+	default "128"
+	help
+	  Controls the build-time size memory bank array.
+	  It is the upper bound of the number of logical entities describing
+	  the memory.
+
 config ACPI
 	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
 	depends on ARM_64
diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
index 95da0b7ab9cd..785a8fe81450 100644
--- a/xen/include/asm-arm/setup.h
+++ b/xen/include/asm-arm/setup.h
@@ -6,7 +6,7 @@
 #define MIN_FDT_ALIGN 8
 #define MAX_FDT_SIZE SZ_2M
 
-#define NR_MEM_BANKS 128
+#define NR_MEM_BANKS CONFIG_MEM_BANKS
 
 #define MAX_MODULES 32 /* Current maximum useful modules */
 
-- 
2.17.1


