Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6350D91E0E2
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 15:36:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751594.1159604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHCx-0002A3-KJ; Mon, 01 Jul 2024 13:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751594.1159604; Mon, 01 Jul 2024 13:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHCx-00027S-FF; Mon, 01 Jul 2024 13:36:39 +0000
Received: by outflank-mailman (input) for mailman id 751594;
 Mon, 01 Jul 2024 13:36:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FOPt=OB=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sOHCv-0001bF-V3
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 13:36:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f01c384e-37ae-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 15:36:36 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id D773C4EE0748;
 Mon,  1 Jul 2024 15:36:32 +0200 (CEST)
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
X-Inumbo-ID: f01c384e-37ae-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: nicola.vetrini@bugseng.com,
	consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [PATCH 06/17] x86/EFI: address violations of MISRA C:2012 Directive 4.10
Date: Mon,  1 Jul 2024 15:36:01 +0200
Message-Id: <0267af93ae969b67a77c3a9aca9f4ad6525de1b9.1719829101.git.alessandro.zucchelli@bugseng.com>
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
- Modified inclusion guard.
Changes in v3:
- remove trailing underscores
- change inclusion guard name to adhere to the new standard
Changes in v2:
- remove changes in "xen/arch/x86/efi/efi-boot.h"

Note:
Changes in efi-boot.h have been removed since the file is
intenteded to be included by common/efi/boot.c only. This motivation
is not enough to raise a deviation record, so the violation is
still present.
---
 xen/arch/x86/efi/efi-boot.h | 7 +++++++
 xen/arch/x86/efi/runtime.h  | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index f282358435..c6be744f2b 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -3,6 +3,11 @@
  * is intended to be included by common/efi/boot.c _only_, and
  * therefore can define arch specific global variables.
  */
+
+#ifndef X86_EFI_EFI_BOOT_H
+#define X86_EFI_EFI_BOOT_H
+
+
 #include <xen/vga.h>
 #include <asm/e820.h>
 #include <asm/edd.h>
@@ -912,6 +917,8 @@ void asmlinkage __init efi_multiboot2(EFI_HANDLE ImageHandle,
     efi_exit_boot(ImageHandle, SystemTable);
 }
 
+#endif /* X86_EFI_EFI_BOOT_H */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/efi/runtime.h b/xen/arch/x86/efi/runtime.h
index 77866c5f21..88ab5651e9 100644
--- a/xen/arch/x86/efi/runtime.h
+++ b/xen/arch/x86/efi/runtime.h
@@ -1,3 +1,6 @@
+#ifndef X86_EFI_RUNTIME_H
+#define X86_EFI_RUNTIME_H
+
 #include <xen/domain_page.h>
 #include <xen/mm.h>
 #include <asm/atomic.h>
@@ -17,3 +20,5 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e)
     }
 }
 #endif
+
+#endif /* X86_EFI_RUNTIME_H */
-- 
2.34.1


