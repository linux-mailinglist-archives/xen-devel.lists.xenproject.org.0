Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB5939C59
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 10:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762683.1172939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAgY-0000wS-6h; Tue, 23 Jul 2024 08:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762683.1172939; Tue, 23 Jul 2024 08:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAgX-0000v1-UC; Tue, 23 Jul 2024 08:15:49 +0000
Received: by outflank-mailman (input) for mailman id 762683;
 Tue, 23 Jul 2024 08:15:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0IL=OX=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sWAgX-0008AN-6Z
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 08:15:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c496bb2e-48cb-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 10:15:48 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-35-51-193.retail.telecomitalia.it [79.35.51.193])
 by support.bugseng.com (Postfix) with ESMTPSA id 210094EE0744;
 Tue, 23 Jul 2024 10:15:46 +0200 (CEST)
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
X-Inumbo-ID: c496bb2e-48cb-11ef-bbfe-fd08da9f4363
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v5 06/17] x86/EFI: address violations of MISRA C:2012 Directive 4.10
Date: Tue, 23 Jul 2024 10:14:58 +0200
Message-Id: <ce3b78363c2b18888e302d4d838b01e336ff1dc6.1721720583.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

---
Changes in v5:
- Remove double blank lines
- edit inclusion guards
Changes in v4:
- Modified inclusion guard.
Changes in v3:
- remove trailing underscores
- change inclusion guard name to adhere to the new standard
Changes in v2:
- remove changes in "xen/arch/x86/efi/efi-boot.h"
---
 xen/arch/x86/efi/efi-boot.h | 5 +++++
 xen/arch/x86/efi/runtime.h  | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index f282358435..4f7b7b67dc 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -3,6 +3,9 @@
  * is intended to be included by common/efi/boot.c _only_, and
  * therefore can define arch specific global variables.
  */
+#ifndef X86__EFI__EFI_BOOT_H
+#define X86__EFI__EFI_BOOT_H
+
 #include <xen/vga.h>
 #include <asm/e820.h>
 #include <asm/edd.h>
@@ -912,6 +915,8 @@ void asmlinkage __init efi_multiboot2(EFI_HANDLE ImageHandle,
     efi_exit_boot(ImageHandle, SystemTable);
 }
 
+#endif /* X86__EFI__EFI_BOOT_H */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/efi/runtime.h b/xen/arch/x86/efi/runtime.h
index 77866c5f21..c88c0a6bbd 100644
--- a/xen/arch/x86/efi/runtime.h
+++ b/xen/arch/x86/efi/runtime.h
@@ -1,3 +1,6 @@
+#ifndef X86__EFI__RUNTIME_H
+#define X86__EFI__RUNTIME_H
+
 #include <xen/domain_page.h>
 #include <xen/mm.h>
 #include <asm/atomic.h>
@@ -17,3 +20,5 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e)
     }
 }
 #endif
+
+#endif /* X86__EFI__RUNTIME_H */
-- 
2.34.1


