Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8097779CC38
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:46:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600169.935805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzyL-0004yc-2C; Tue, 12 Sep 2023 09:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600169.935805; Tue, 12 Sep 2023 09:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzyK-0004vt-Uq; Tue, 12 Sep 2023 09:46:16 +0000
Received: by outflank-mailman (input) for mailman id 600169;
 Tue, 12 Sep 2023 09:46:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qfzr9-0008Jk-An
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:38:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bf45b43-5150-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 11:38:47 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id C44A24EE0743;
 Tue, 12 Sep 2023 11:38:46 +0200 (CEST)
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
X-Inumbo-ID: 2bf45b43-5150-11ee-9b0d-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2 04/10] xen/arm: address violations of MISRA C:2012 Directive 4.10
Date: Tue, 12 Sep 2023 11:36:50 +0200
Message-Id: <e58d82c2a2c77c7451ae9bc70b093f2c5575d83f.1694510856.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694510856.git.simone.ballarin@bugseng.com>
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add inclusion guard to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Changes in v2:
- drop changes in xen/arch/arm/include/asm/hypercall.h
- drop changes in xen/arch/arm/include/asm/iocap.h since they are
  not related with the directive
---
 xen/arch/arm/efi/efi-boot.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 1c3640bb65..aaa468f186 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -3,6 +3,10 @@
  * is intended to be included by common/efi/boot.c _only_, and
  * therefore can define arch specific global variables.
  */
+
+#ifndef __ARM_EFI_EFI_BOOT_H__
+#define __ARM_EFI_EFI_BOOT_H__
+
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
 #include <asm/setup.h>
@@ -1003,6 +1007,8 @@ static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size)
     __flush_dcache_area(vaddr, size);
 }
 
+#endif /* __ARM_EFI_EFI_BOOT_H__ */
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


