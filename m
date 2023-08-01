Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945BD76A7AB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 05:49:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573609.898481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgNi-00058C-Bc; Tue, 01 Aug 2023 03:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573609.898481; Tue, 01 Aug 2023 03:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgNi-0004x5-7T; Tue, 01 Aug 2023 03:49:10 +0000
Received: by outflank-mailman (input) for mailman id 573609;
 Tue, 01 Aug 2023 03:49:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUf/=DS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qQgK8-00076X-Bt
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 03:45:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id da11a0b3-301d-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 05:45:26 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DDD2D75;
 Mon, 31 Jul 2023 20:46:09 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3617E3F59C;
 Mon, 31 Jul 2023 20:45:22 -0700 (PDT)
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
X-Inumbo-ID: da11a0b3-301d-11ee-8613-37d641c3527e
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v4 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
Date: Tue,  1 Aug 2023 11:44:19 +0800
Message-Id: <20230801034419.2047541-14-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230801034419.2047541-1-Henry.Wang@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

SMMU subsystem is only supported in MMU system, so we make it dependent
on CONFIG_HAS_MMU.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v4:
- No change
v3:
- new patch
---
 xen/drivers/passthrough/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 864fcf3b0c..5a8d666829 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -5,6 +5,7 @@ config HAS_PASSTHROUGH
 if ARM
 config ARM_SMMU
 	bool "ARM SMMUv1 and v2 driver"
+	depends on HAS_MMU
 	default y
 	---help---
 	  Support for implementations of the ARM System MMU architecture
@@ -15,7 +16,7 @@ config ARM_SMMU
 
 config ARM_SMMU_V3
 	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if EXPERT
-	depends on ARM_64 && (!ACPI || BROKEN)
+	depends on ARM_64 && (!ACPI || BROKEN) && HAS_MMU
 	---help---
 	 Support for implementations of the ARM System MMU architecture
 	 version 3. Driver is in experimental stage and should not be used in
-- 
2.25.1


