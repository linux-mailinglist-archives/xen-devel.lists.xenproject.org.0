Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190A878B370
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 16:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591534.924047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadUM-0001GD-Sx; Mon, 28 Aug 2023 14:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591534.924047; Mon, 28 Aug 2023 14:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadUM-00019E-ME; Mon, 28 Aug 2023 14:45:10 +0000
Received: by outflank-mailman (input) for mailman id 591534;
 Mon, 28 Aug 2023 13:36:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ5s=EN=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qacPw-0004gK-KM
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 13:36:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8528174-45a5-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 15:20:29 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 9EA0C4EE073E;
 Mon, 28 Aug 2023 15:20:28 +0200 (CEST)
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
X-Inumbo-ID: a8528174-45a5-11ee-9b0c-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 03/13] xen/arm: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 28 Aug 2023 15:20:00 +0200
Message-Id: <2d37ca48cf6556ebfcb4b17cddd2446fa549f689.1693228255.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693228255.git.simone.ballarin@bugseng.com>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add or move inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Inclusion guards must appear at the beginning of the headers
(comments are permitted anywhere).

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/arch/arm/efi/efi-boot.h          | 6 ++++++
 xen/arch/arm/include/asm/hypercall.h | 6 +++---
 xen/arch/arm/include/asm/iocap.h     | 6 +++---
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 1c3640bb65..aba522ead5 100644
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
 
+#endif /* __ARM_EFI_EFI_BOOT_H__*/
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/hypercall.h b/xen/arch/arm/include/asm/hypercall.h
index ccd26c5184..4f4d96f1f2 100644
--- a/xen/arch/arm/include/asm/hypercall.h
+++ b/xen/arch/arm/include/asm/hypercall.h
@@ -1,10 +1,10 @@
+#ifndef __ASM_ARM_HYPERCALL_H__
+#define __ASM_ARM_HYPERCALL_H__
+
 #ifndef __XEN_HYPERCALL_H__
 #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
 #endif
 
-#ifndef __ASM_ARM_HYPERCALL_H__
-#define __ASM_ARM_HYPERCALL_H__
-
 #include <public/domctl.h> /* for arch_do_domctl */
 
 long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
diff --git a/xen/arch/arm/include/asm/iocap.h b/xen/arch/arm/include/asm/iocap.h
index 276fefbc59..4db1b16839 100644
--- a/xen/arch/arm/include/asm/iocap.h
+++ b/xen/arch/arm/include/asm/iocap.h
@@ -1,10 +1,10 @@
-#ifndef __X86_IOCAP_H__
-#define __X86_IOCAP_H__
+#ifndef __ASM_ARM_IOCAP_H__
+#define __ASM_ARM_IOCAP_H__
 
 #define cache_flush_permitted(d)                        \
     (!rangeset_is_empty((d)->iomem_caps))
 
-#endif
+#endif /* __ASM_ARM_IOCAP_H__ */
 
 /*
  * Local variables:
-- 
2.34.1


