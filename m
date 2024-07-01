Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C7291E0E5
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 15:36:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751592.1159583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHCr-0001eE-41; Mon, 01 Jul 2024 13:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751592.1159583; Mon, 01 Jul 2024 13:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHCr-0001bS-13; Mon, 01 Jul 2024 13:36:33 +0000
Received: by outflank-mailman (input) for mailman id 751592;
 Mon, 01 Jul 2024 13:36:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FOPt=OB=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sOHCp-0001bF-SC
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 13:36:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec461882-37ae-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 15:36:30 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id ECA6B4EE0738;
 Mon,  1 Jul 2024 15:36:26 +0200 (CEST)
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
X-Inumbo-ID: ec461882-37ae-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: nicola.vetrini@bugseng.com,
	consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [PATCH 04/17] xen/arm: address violations of MISRA C:2012 Directive 4.10
Date: Mon,  1 Jul 2024 15:35:59 +0200
Message-Id: <5646033a5e15c44fa6eb441690f36254d068ddee.1719829101.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simone Ballarin <simone.ballarin@bugseng.com>

Add inclusion guard to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

---
Changes in v4:
- Drop ARCH_ string from the guard, according to the feedback received
Changes in v3:
- remove trailing underscores
- change inclusion guard name to adhere to the new standard
Changes in v2:
- drop changes in xen/arch/arm/include/asm/hypercall.h
- drop changes in xen/arch/arm/include/asm/iocap.h since they are
  not related with the directive
---
 xen/arch/arm/efi/efi-boot.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 199f526022..947166905f 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -3,6 +3,10 @@
  * is intended to be included by common/efi/boot.c _only_, and
  * therefore can define arch specific global variables.
  */
+
+#ifndef ARM_EFI_EFI_BOOT_H
+#define ARM_EFI_EFI_BOOT_H
+
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
 #include <asm/setup.h>
@@ -992,6 +996,8 @@ static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size)
     __flush_dcache_area(vaddr, size);
 }
 
+#endif /* ARM_EFI_EFI_BOOT_H */
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


