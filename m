Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F8BA63733
	for <lists+xen-devel@lfdr.de>; Sun, 16 Mar 2025 20:26:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916069.1321251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tttc6-0004rd-I3; Sun, 16 Mar 2025 19:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916069.1321251; Sun, 16 Mar 2025 19:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tttc6-0004pu-DZ; Sun, 16 Mar 2025 19:25:34 +0000
Received: by outflank-mailman (input) for mailman id 916069;
 Sun, 16 Mar 2025 19:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=84OC=WD=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tttc4-0004Ab-IV
 for xen-devel@lists.xenproject.org; Sun, 16 Mar 2025 19:25:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6cbd3fab-029c-11f0-9aba-95dc52dad729;
 Sun, 16 Mar 2025 20:25:31 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 899C21D6F;
 Sun, 16 Mar 2025 12:25:40 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 645D53F694;
 Sun, 16 Mar 2025 12:25:30 -0700 (PDT)
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
X-Inumbo-ID: 6cbd3fab-029c-11f0-9aba-95dc52dad729
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 4/7] arm/mpu: Kconfig symbols for MPU build
Date: Sun, 16 Mar 2025 19:24:42 +0000
Message-Id: <20250316192445.2376484-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250316192445.2376484-1-luca.fancellu@arm.com>
References: <20250316192445.2376484-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MPU system requires static memory to work, select that
when building this memory management subsystem.

While there, provide a restriction for the ARM_EFI Kconfig
parameter to be built only when !MPU, the EFI stub is not
used as there are no implementation of UEFI services for
armv8-r.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v2 changes:
 - clarified commit message about static memory
 - Add R-by Michal
---
 xen/arch/arm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ffdff1f0a36c..5ac6ec0212d2 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -85,6 +85,7 @@ config MMU
 
 config MPU
 	bool "MPU" if UNSUPPORTED
+	select STATIC_MEMORY
 	help
 	  Memory Protection Unit (MPU). Select if you plan to run Xen on ARMv8-R
 	  systems supporting EL2. (UNSUPPORTED)
@@ -102,7 +103,7 @@ config ACPI
 
 config ARM_EFI
 	bool "UEFI boot service support"
-	depends on ARM_64
+	depends on ARM_64 && !MPU
 	default y
 	help
 	  This option provides support for boot services through
-- 
2.34.1


