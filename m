Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E105B877C23
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691266.1077084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW5-0007m9-HP; Mon, 11 Mar 2024 09:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691266.1077084; Mon, 11 Mar 2024 09:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW5-0007hC-2m; Mon, 11 Mar 2024 09:00:17 +0000
Received: by outflank-mailman (input) for mailman id 691266;
 Mon, 11 Mar 2024 09:00:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjbW3-0006j9-QO
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:00:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c616516b-df85-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 10:00:14 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id AC1DE4EE0C9F;
 Mon, 11 Mar 2024 10:00:13 +0100 (CET)
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
X-Inumbo-ID: c616516b-df85-11ee-a1ee-f123f15fe8a2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Subject: [XEN PATCH v3 06/16] x86/EFI: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 11 Mar 2024 09:59:15 +0100
Message-Id: <d12db1f6cca220ed83f7d7502dfca4bdc4127786.1710145041.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710145041.git.simone.ballarin@bugseng.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add inclusion guard to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

---
Changes in v3:
- remove trailing underscores
- change inclusion guard name to adhere to the new standard
---
 xen/arch/x86/efi/efi-boot.h | 7 +++++++
 xen/arch/x86/efi/runtime.h  | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 8ea64e31cd..df6eaa9e9e 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -3,6 +3,11 @@
  * is intended to be included by common/efi/boot.c _only_, and
  * therefore can define arch specific global variables.
  */
+
+#ifndef XEN_ARCH_X86_EFI_EFI_BOOT_H
+#define XEN_ARCH_X86_EFI_EFI_BOOT_H
+
+
 #include <xen/vga.h>
 #include <asm/e820.h>
 #include <asm/edd.h>
@@ -905,6 +910,8 @@ void asmlinkage __init efi_multiboot2(EFI_HANDLE ImageHandle,
     efi_exit_boot(ImageHandle, SystemTable);
 }
 
+#endif /* XEN_ARCH_X86_EFI_EFI_BOOT_H */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/efi/runtime.h b/xen/arch/x86/efi/runtime.h
index 77866c5f21..13d4ba66b6 100644
--- a/xen/arch/x86/efi/runtime.h
+++ b/xen/arch/x86/efi/runtime.h
@@ -1,3 +1,6 @@
+#ifndef XEN_ARCH_X86_EFI_RUNTIME_H
+#define XEN_ARCH_X86_EFI_RUNTIME_H
+
 #include <xen/domain_page.h>
 #include <xen/mm.h>
 #include <asm/atomic.h>
@@ -17,3 +20,5 @@ void efi_update_l4_pgtable(unsigned int l4idx, l4_pgentry_t l4e)
     }
 }
 #endif
+
+#endif /* XEN_ARCH_X86_EFI_RUNTIME_H */
-- 
2.34.1


