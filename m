Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6B378B32B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 16:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591522.923983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadFr-0004FC-Al; Mon, 28 Aug 2023 14:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591522.923983; Mon, 28 Aug 2023 14:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadFr-000439-0C; Mon, 28 Aug 2023 14:30:11 +0000
Received: by outflank-mailman (input) for mailman id 591522;
 Mon, 28 Aug 2023 13:20:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ5s=EN=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qacAT-00031h-Il
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 13:20:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa9d47fc-45a5-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 15:20:33 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 8F0C04EE0C8A;
 Mon, 28 Aug 2023 15:20:32 +0200 (CEST)
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
X-Inumbo-ID: aa9d47fc-45a5-11ee-8783-cb3800f73035
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH 10/13] xen/efi: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 28 Aug 2023 15:20:07 +0200
Message-Id: <7726a38c4bf15a94b9bbcbc465bd499f94067ddc.1693228255.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693228255.git.simone.ballarin@bugseng.com>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Also C files, if included somewhere, need to comply with the guideline.

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/common/efi/efi.h     | 5 +++++
 xen/common/efi/runtime.c | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
index c02fbb7b69..cef9381d30 100644
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -1,3 +1,6 @@
+#ifndef __COMMON_EFI_EFI_H__
+#define __COMMON_EFI_EFI_H__
+
 #include <asm/efibind.h>
 #include <efi/efidef.h>
 #include <efi/efierr.h>
@@ -51,3 +54,5 @@ void free_ebmalloc_unused_mem(void);
 
 const void *pe_find_section(const void *image, const UINTN image_size,
                             const CHAR16 *section_name, UINTN *size_out);
+
+#endif /* __COMMON_EFI_EFI_H__ */
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 5cb7504c96..fb6fd17ba3 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -6,6 +6,10 @@
 #include <xen/irq.h>
 #include <xen/time.h>
 
+#ifndef __COMMON_EFI_RUNTIME_C__
+#define __COMMON_EFI_RUNTIME_C__
+
+
 DEFINE_XEN_GUEST_HANDLE(CHAR16);
 
 struct efi_rs_state {
@@ -704,3 +708,5 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
     return rc;
 }
 #endif
+
+#endif /* __COMMON_EFI_RUNTIME_C__ */
-- 
2.34.1


