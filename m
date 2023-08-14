Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF62877B061
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 06:26:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583057.913087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVP9a-0002dn-7e; Mon, 14 Aug 2023 04:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583057.913087; Mon, 14 Aug 2023 04:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVP9a-0002X4-3L; Mon, 14 Aug 2023 04:26:06 +0000
Received: by outflank-mailman (input) for mailman id 583057;
 Mon, 14 Aug 2023 04:26:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M3t=D7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qVP9Y-0002FE-Ak
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 04:26:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id adb528c3-3a5a-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 06:26:03 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F9F2106F;
 Sun, 13 Aug 2023 21:26:45 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A71CA3F64C;
 Sun, 13 Aug 2023 21:25:59 -0700 (PDT)
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
X-Inumbo-ID: adb528c3-3a5a-11ee-b288-6b7b168915f2
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
Subject: [PATCH v5 02/13] xen/arm: Introduce CONFIG_MMU Kconfig option
Date: Mon, 14 Aug 2023 12:25:25 +0800
Message-Id: <20230814042536.878720-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230814042536.878720-1-Henry.Wang@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
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

Introduce a Kconfig option CONFIG_MMU, which is currently default
set to y and unselectable because currently only VMSA is supported.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v5:
- Only introduce the unselectable CONFIG_MMU, add the 'choice' in
  future commits.
v4:
- Completely rework "[v3,06/52] xen/arm: introduce CONFIG_HAS_MMU"
---
 xen/arch/arm/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 57bd1d01d7..eb0413336b 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -59,6 +59,9 @@ config PADDR_BITS
 	default 40 if ARM_PA_BITS_40
 	default 48 if ARM_64
 
+config MMU
+	def_bool y
+
 source "arch/Kconfig"
 
 config ACPI
-- 
2.25.1


