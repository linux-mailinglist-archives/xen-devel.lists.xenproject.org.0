Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7737A74838E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 13:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559136.873848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH16h-00044u-N1; Wed, 05 Jul 2023 11:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559136.873848; Wed, 05 Jul 2023 11:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH16h-00041k-KI; Wed, 05 Jul 2023 11:55:39 +0000
Received: by outflank-mailman (input) for mailman id 559136;
 Wed, 05 Jul 2023 11:55:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qH16g-00041e-QF
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 11:55:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH16g-0006eb-3D; Wed, 05 Jul 2023 11:55:38 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH16f-0004DO-Qu; Wed, 05 Jul 2023 11:55:38 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=1NOg8Ty/xGUQ867fNNCVthaQPTx0ZAW3TR9lv7vglH0=; b=AOfokm
	TxwyT4ziekBzHE67ftDkHNIiHvy5S93fxkqLB7lbYH1L2wfSp3l3NChWNUEXG/TlprsiDSbisdpEK
	bq8/zflPhe4gjSpYWKlOG565ND9cmx5Okm/f+WD3SeKYXylyPFwLfwnaaoapijKHGCF7s9rcRXjoH
	RPbWEzQvke8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	andrew.cooper3@citrix.com,
	Penny.Zheng@arm.com,
	wei.chen@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Kconfig: ACPI should depend on UEFI
Date: Wed,  5 Jul 2023 12:55:34 +0100
Message-Id: <20230705115534.26004-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

On Arm, it is not possible to use ACPI without UEFI. In fact disabling
UEFI but not ACPI will lead to a compilation error:

ld: prelink.o: in function `acpi_os_get_root_pointer':
/builds/xen-project/people/andyhhp/xen/xen/drivers/acpi/osl.c:73:
undefined reference to `efi'
/builds/xen-project/people/andyhhp/xen/xen/drivers/acpi/osl.c:73:(.init.text+0x8ac0):
relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against
undefined symbol `efi'

So make the dependency clear in the Kconfig.

This was spotted by the randconfig build in gitlab CI.

Fixes: 12314be5749e ("xen/arm: make ARM_EFI selectable for Arm64")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index c30f32457388..439cc94f3344 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -63,11 +63,11 @@ source "arch/Kconfig"
 
 config ACPI
 	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
-	depends on ARM_64
+	depends on ARM_64 && ARM_EFI
 	---help---
 
 	  Advanced Configuration and Power Interface (ACPI) support for Xen is
-	  an alternative to device tree on ARM64.
+	  an alternative to device tree on ARM64. This requires UEFI.
 
 config ARM_EFI
 	bool "UEFI boot service support"
-- 
2.40.1


