Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D238673D677
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555042.866673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd57-0001lU-RL; Mon, 26 Jun 2023 03:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555042.866673; Mon, 26 Jun 2023 03:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd57-0001P7-6r; Mon, 26 Jun 2023 03:40:01 +0000
Received: by outflank-mailman (input) for mailman id 555042;
 Mon, 26 Jun 2023 03:39:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd0i-0007ej-Ad
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:35:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7cebead3-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:35:25 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DF042F4;
 Sun, 25 Jun 2023 20:36:09 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C27C3F64C;
 Sun, 25 Jun 2023 20:35:22 -0700 (PDT)
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
X-Inumbo-ID: 7cebead3-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 06/52] xen/arm: introduce CONFIG_HAS_MMU
Date: Mon, 26 Jun 2023 11:33:57 +0800
Message-Id: <20230626033443.2943270-7-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit wants to introduce a new Kconfig CONFIG_HAS_MMU to guard
MMU-related codes, to tell two different memory management architecture:
VMAS and PMSA.

In a VMSA system, a Memory Management Unit (MMU) provides fine-grained
control of a memory system through a set of virtual to physical address
mappings and associated memory properties held in memory-mapped tables
known as translation tables.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new patch
---
 xen/arch/arm/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ff17345cdb..fb77392b82 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -60,6 +60,14 @@ config PADDR_BITS
 
 source "arch/Kconfig"
 
+config HAS_MMU
+	bool "Memory Management Unit support in a VMSA system"
+	default y
+	help
+	  In a VMSA system, a Memory Management Unit (MMU) provides fine-grained control of
+	  a memory system through a set of virtual to physical address mappings and associated memory
+	  properties held in memory-mapped tables known as translation tables.
+
 config ACPI
 	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
 	depends on ARM_64
-- 
2.25.1


