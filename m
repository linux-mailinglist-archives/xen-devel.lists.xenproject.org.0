Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F412668B50
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476506.738774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdh-0008NO-12; Fri, 13 Jan 2023 05:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476506.738774; Fri, 13 Jan 2023 05:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdg-0008IK-KP; Fri, 13 Jan 2023 05:30:04 +0000
Received: by outflank-mailman (input) for mailman id 476506;
 Fri, 13 Jan 2023 05:30:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCde-0005sP-Ki
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 52eff47f-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:30:00 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DA8413D5;
 Thu, 12 Jan 2023 21:30:42 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 194803F587;
 Thu, 12 Jan 2023 21:29:57 -0800 (PST)
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
X-Inumbo-ID: 52eff47f-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 07/40] xen/arm64: add .text.idmap for Xen identity map sections
Date: Fri, 13 Jan 2023 13:28:40 +0800
Message-Id: <20230113052914.3845596-8-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

Only the first 4KB of Xen image will be mapped as identity
(PA == VA). At the moment, Xen guarantees this by having
everything that needs to be used in the identity mapping
in head.S before _end_boot and checking at link time if this
fits in 4KB.

In previous patch, we have moved the MMU code outside of
head.S. Although we have added .text.header to the new file
to guarantee all identity map code still in the first 4KB.
However, the order of these two files on this 4KB depends
on the build tools. Currently, we use the build tools to
process the order of objs in the Makefile to ensure that
head.S must be at the top. But if you change to another build
tools, it may not be the same result.

In this patch we introduce .text.idmap to head_mmu.S, and
add this section after .text.header. to ensure code of
head_mmu.S after the code of header.S.

After this, we will still include some code that does not
belong to identity map before _end_boot. Because we have
moved _end_boot to head_mmu.S. That means all code in head.S
will be included before _end_boot. In this patch, we also
added .text flag in the place of original _end_boot in head.S.
All the code after .text in head.S will not be included in
identity map section.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. New patch.
---
 xen/arch/arm/arm64/head.S     | 6 ++++++
 xen/arch/arm/arm64/head_mmu.S | 2 +-
 xen/arch/arm/xen.lds.S        | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 5cfa47279b..782bd1f94c 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -466,6 +466,12 @@ fail:   PRINT("- Boot failed -\r\n")
         b     1b
 ENDPROC(fail)
 
+/*
+ * For the code that do not need in indentity map section,
+ * we put them back to normal .text section
+ */
+.section .text, "ax", %progbits
+
 #ifdef CONFIG_EARLY_PRINTK
 /*
  * Initialize the UART. Should only be called on the boot CPU.
diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
index e2c8f07140..6ff13c751c 100644
--- a/xen/arch/arm/arm64/head_mmu.S
+++ b/xen/arch/arm/arm64/head_mmu.S
@@ -105,7 +105,7 @@
         str   \tmp2, [\tmp3, \tmp1, lsl #3]
 .endm
 
-.section .text.header, "ax", %progbits
+.section .text.idmap, "ax", %progbits
 /*.aarch64*/
 
 /*
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 92c2984052..bc45ea2c65 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -33,6 +33,7 @@ SECTIONS
   .text : {
         _stext = .;            /* Text section */
        *(.text.header)
+       *(.text.idmap)
 
        *(.text.cold)
        *(.text.unlikely .text.*_unlikely .text.unlikely.*)
-- 
2.25.1


