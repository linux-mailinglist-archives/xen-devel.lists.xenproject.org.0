Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DF7769051
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 10:36:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572821.896871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQONc-0001ox-IS; Mon, 31 Jul 2023 08:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572821.896871; Mon, 31 Jul 2023 08:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQONc-0001mf-Fl; Mon, 31 Jul 2023 08:35:52 +0000
Received: by outflank-mailman (input) for mailman id 572821;
 Mon, 31 Jul 2023 08:35:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lm7y=DR=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qQONa-0001mZ-Ek
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 08:35:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fe794b5-2f7d-11ee-b254-6b7b168915f2;
 Mon, 31 Jul 2023 10:35:48 +0200 (CEST)
Received: from Dell.bugseng.com.homenet.telecomitalia.it
 (host-79-23-62-117.retail.telecomitalia.it [79.23.62.117])
 by support.bugseng.com (Postfix) with ESMTPSA id BA5C64EE0737;
 Mon, 31 Jul 2023 10:35:47 +0200 (CEST)
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
X-Inumbo-ID: 3fe794b5-2f7d-11ee-b254-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] EFI: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Mon, 31 Jul 2023 10:35:19 +0200
Message-Id: <83d4091852797044209272dab750f13f7d30d35c.1690792406.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give a name to unnamed parameters to address violations of
MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
named parameters").
Keep consistency between parameter names and types used in function
declarations and the ones used in the corresponding function
definitions, thus addressing violations of MISRA C:2012 Rule 8.3
("All declarations of an object or function shall use the same names
and type qualifiers").

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/common/efi/efi.h  | 2 +-
 xen/include/xen/efi.h | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
index c9aa65d506..c02fbb7b69 100644
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -49,5 +49,5 @@ const CHAR16 *wmemchr(const CHAR16 *s, CHAR16 c, UINTN n);
 void *ebmalloc(size_t size);
 void free_ebmalloc_unused_mem(void);
 
-const void *pe_find_section(const void *image_base, const size_t image_size,
+const void *pe_find_section(const void *image, const UINTN image_size,
                             const CHAR16 *section_name, UINTN *size_out);
diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 94a7e547f9..942d2e9491 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -39,11 +39,11 @@ unsigned long efi_get_time(void);
 void efi_halt_system(void);
 void efi_reset_system(bool warm);
 #ifndef COMPAT
-int efi_get_info(uint32_t idx, union xenpf_efi_info *);
-int efi_runtime_call(struct xenpf_efi_runtime_call *);
+int efi_get_info(uint32_t idx, union xenpf_efi_info *info);
+int efi_runtime_call(struct xenpf_efi_runtime_call *op);
 #endif
-int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *);
-int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *);
+int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *info);
+int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *op);
 
 #endif /* !__ASSEMBLY__ */
 
-- 
2.34.1


