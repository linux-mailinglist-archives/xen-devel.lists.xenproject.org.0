Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0482254854E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 14:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348247.574571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0jZR-0002Ah-JI; Mon, 13 Jun 2022 12:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348247.574571; Mon, 13 Jun 2022 12:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0jZR-00027z-BM; Mon, 13 Jun 2022 12:53:29 +0000
Received: by outflank-mailman (input) for mailman id 348247;
 Mon, 13 Jun 2022 12:53:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E7/M=WU=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1o0jZP-0001JY-Qd
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 12:53:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d128e809-eb17-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 14:53:27 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7764A1042;
 Mon, 13 Jun 2022 05:53:26 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93EEA3F792;
 Mon, 13 Jun 2022 05:53:25 -0700 (PDT)
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
X-Inumbo-ID: d128e809-eb17-11ec-8901-93a377f238d6
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 4/4] arm: Define kconfig symbols used by arm64 cpufeatures
Date: Mon, 13 Jun 2022 13:53:14 +0100
Message-Id: <e9f3e4c520f9d78223ff89cf1d8ef14348933a7c.1655124548.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655124548.git.bertrand.marquis@arm.com>
References: <cover.1655124548.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define kconfig symbols which are used by arm64 cpufeatures to prevent
using undefined symbols and rely on IS_ENABLED returning false.
All the features related to those symbols are unsupported by Xen:
- pointer authentication
- sve
- memory tagging
- branch target identification

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in v3:
- add Julien acked by
- no changes
Changes in v2:
- patch introduced
---
 xen/arch/arm/Kconfig | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a89a67802a..5900aa2efe 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -98,6 +98,34 @@ config HARDEN_BRANCH_PREDICTOR
 
 	  If unsure, say Y.
 
+config ARM64_PTR_AUTH
+	def_bool n
+	depends on ARM64
+	help
+	  Pointer authentication support.
+	  This feature is not supported in Xen.
+
+config ARM64_SVE
+	def_bool n
+	depends on ARM64
+	help
+	  Scalar Vector Extension support.
+	  This feature is not supported in Xen.
+
+config ARM64_MTE
+	def_bool n
+	depends on ARM64
+	help
+	  Memory Tagging Extension support.
+	  This feature is not supported in Xen.
+
+config ARM64_BTI
+	def_bool n
+	depends on ARM64
+	help
+	  Branch Target Identification support.
+	  This feature is not supported in Xen.
+
 config TEE
 	bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
 	default n
-- 
2.25.1


