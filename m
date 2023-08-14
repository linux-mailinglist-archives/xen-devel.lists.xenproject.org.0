Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8290F77B06A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 06:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583084.913159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVPAp-00072E-Mr; Mon, 14 Aug 2023 04:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583084.913159; Mon, 14 Aug 2023 04:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVPAp-00070P-K0; Mon, 14 Aug 2023 04:27:23 +0000
Received: by outflank-mailman (input) for mailman id 583084;
 Mon, 14 Aug 2023 04:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M3t=D7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qVPAI-0002FE-4u
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 04:26:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c87a8b20-3a5a-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 06:26:48 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33C042F4;
 Sun, 13 Aug 2023 21:27:30 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1BB4C3F64C;
 Sun, 13 Aug 2023 21:26:43 -0700 (PDT)
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
X-Inumbo-ID: c87a8b20-3a5a-11ee-b288-6b7b168915f2
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v5 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Date: Mon, 14 Aug 2023 12:25:36 +0800
Message-Id: <20230814042536.878720-14-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230814042536.878720-1-Henry.Wang@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

SMMU subsystem is only supported in MMU system, so we make it dependent
on CONFIG_HAS_MMU.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v5:
- Add Acked-by tag from Jan.
v4:
- No change
v3:
- new patch
---
 xen/drivers/passthrough/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 864fcf3b0c..ebb350bc37 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -5,6 +5,7 @@ config HAS_PASSTHROUGH
 if ARM
 config ARM_SMMU
 	bool "ARM SMMUv1 and v2 driver"
+	depends on MMU
 	default y
 	---help---
 	  Support for implementations of the ARM System MMU architecture
@@ -15,7 +16,7 @@ config ARM_SMMU
 
 config ARM_SMMU_V3
 	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if EXPERT
-	depends on ARM_64 && (!ACPI || BROKEN)
+	depends on ARM_64 && (!ACPI || BROKEN) && MMU
 	---help---
 	 Support for implementations of the ARM System MMU architecture
 	 version 3. Driver is in experimental stage and should not be used in
-- 
2.25.1


