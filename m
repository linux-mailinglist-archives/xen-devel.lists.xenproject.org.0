Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C22276A792
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 05:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573553.898373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgJN-0007If-R8; Tue, 01 Aug 2023 03:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573553.898373; Tue, 01 Aug 2023 03:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgJN-0007AU-LX; Tue, 01 Aug 2023 03:44:41 +0000
Received: by outflank-mailman (input) for mailman id 573553;
 Tue, 01 Aug 2023 03:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUf/=DS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qQgJM-0006rJ-G5
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 03:44:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id be19a5f9-301d-11ee-b258-6b7b168915f2;
 Tue, 01 Aug 2023 05:44:39 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D9F9D75;
 Mon, 31 Jul 2023 20:45:22 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 064103F59C;
 Mon, 31 Jul 2023 20:44:35 -0700 (PDT)
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
X-Inumbo-ID: be19a5f9-301d-11ee-b258-6b7b168915f2
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 02/13] xen/arm: Introduce 'choice' for memory system architecture
Date: Tue,  1 Aug 2023 11:44:08 +0800
Message-Id: <20230801034419.2047541-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230801034419.2047541-1-Henry.Wang@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two types of memory system architectures available for
Arm-based systems, namely the Virtual Memory System Architecture (VMSA)
and the Protected Memory System Architecture (PMSA). According to
ARM DDI 0487G.a, A VMSA provides a Memory Management Unit (MMU) that
controls address translation, access permissions, and memory attribute
determination and checking, for memory accesses made by the PE. And
refer to ARM DDI 0600A.c, the PMSA supports a unified memory protection
scheme where an Memory Protection Unit (MPU) manages instruction and
data access. Currently, Xen only suuports VMSA.

As a preparation of the Xen MPU (PMSA) support. Introduce a Kconfig
choice under the "Architecture Features" menu for user to choose the
memory system architecture for the system. Since currently only VMSA
is supported, only add the bool CONFIG_HAS_MMU to keep consistent with
the default behavior. User can choose either VMSA or PMSA but not both
in the future after PMSA/MPU is supported in Xen.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v4:
- Completely rework "[v3,06/52] xen/arm: introduce CONFIG_HAS_MMU"
---
 xen/arch/arm/Kconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index fd57a82dd2..0e38e9ba17 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -59,6 +59,20 @@ config PADDR_BITS
 	default 40 if ARM_PA_BITS_40
 	default 48 if ARM_64
 
+choice
+	prompt "Memory system architecture"
+	default HAS_MMU
+	help
+	  User can choose the memory system architecture.
+	  A Virtual Memory System Architecture (VMSA) provides a Memory Management
+	  Unit (MMU) that controls address translation, access permissions, and
+	  memory attribute determination and checking, for memory accesses made by
+	  the PE.
+
+config HAS_MMU
+	bool "MMU for a VMSA system"
+endchoice
+
 source "arch/Kconfig"
 
 config ACPI
-- 
2.25.1


