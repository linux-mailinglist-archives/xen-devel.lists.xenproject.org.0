Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F0A622D1F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 15:04:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441020.695262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oslgu-0003qe-PM; Wed, 09 Nov 2022 14:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441020.695262; Wed, 09 Nov 2022 14:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oslgu-0003oE-MM; Wed, 09 Nov 2022 14:04:32 +0000
Received: by outflank-mailman (input) for mailman id 441020;
 Wed, 09 Nov 2022 14:04:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Upt9=3J=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1oslgt-0003o8-E4
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 14:04:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6d4f0fa9-6037-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 15:04:29 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEE4B1FB;
 Wed,  9 Nov 2022 06:04:34 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6A5A3F73D;
 Wed,  9 Nov 2022 06:04:27 -0800 (PST)
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
X-Inumbo-ID: 6d4f0fa9-6037-11ed-91b5-6bf2151ebd3b
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	henry.wang@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for 4.17] arm: fix Kconfig symbol dependency on arm features
Date: Wed,  9 Nov 2022 14:04:20 +0000
Message-Id: <20221109140420.31007-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

The commit 3c2a14ea81c7 is introducing some unsupported arm features
that by default are disabled and are used for the cpufeature.c code.

As they are disabled by default, a typo in the Kconfig symbol they
depend on has landed in the codebase unnoticed, instead of depending
on ARM64 which does not exist, fix the code to depend on ARM_64 that
is the intended symbol.

Fixes: 3c2a14ea81c7 ("arm: Define kconfig symbols used by arm64 cpufeatures")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 1fe5faf847b8..52a05f704da5 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -105,28 +105,28 @@ config HARDEN_BRANCH_PREDICTOR
 
 config ARM64_PTR_AUTH
 	def_bool n
-	depends on ARM64
+	depends on ARM_64
 	help
 	  Pointer authentication support.
 	  This feature is not supported in Xen.
 
 config ARM64_SVE
 	def_bool n
-	depends on ARM64
+	depends on ARM_64
 	help
 	  Scalar Vector Extension support.
 	  This feature is not supported in Xen.
 
 config ARM64_MTE
 	def_bool n
-	depends on ARM64
+	depends on ARM_64
 	help
 	  Memory Tagging Extension support.
 	  This feature is not supported in Xen.
 
 config ARM64_BTI
 	def_bool n
-	depends on ARM64
+	depends on ARM_64
 	help
 	  Branch Target Identification support.
 	  This feature is not supported in Xen.
-- 
2.17.1


